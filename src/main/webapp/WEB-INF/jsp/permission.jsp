<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%>  
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <title>权限列表</title>
    <link href="${ctx}/plugins/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/plugins/validator/bootstrapValidator.min.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/plugins/zTree/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/plugins/treetable/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/plugins/treetable/jquery.treetable.theme.default.css" rel="stylesheet" type="text/css" />
    <style>
      /* .example-modal .modal {
        position: relative;
        top: auto;
        bottom: auto;
        right: auto;
        left: auto;
        display: block;
        z-index: 1;
      }
      .example-modal .modal {
        background: transparent!important;
      } */
    </style>
  </head>
  <body>
  
  	<!-- <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">搜索</h3>
        <div class="box-tools pull-right">
          <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
        </div>
      </div>
      <div class="box-body">
        <div class="form-group">
          <label>Date range:</label>
          <div class="input-group">
            <div class="input-group-addon">
              <i class="fa fa-calendar"></i>
            </div>
            <input type="text" class="form-control pull-right" id="reservation" />
          </div>/.input group
        </div>/.form group
      </div>/.box-body
    </div>/.box -->
    <a href="javascript:void(0);" onclick="closper();">折叠</a>      
    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">权限列表</h3>
        <div class="box-tools pull-right">
          <form class="form-inline">
			  <div class="form-group form-group-sm">
			    <label class="control-label" for="inputName">权限名称</label>
			    <input type="text" class="form-control" id="inputName">
			  </div>
			  <div class="form-group form-group-sm">
			    <label class="control-label" for="inputDaterange">创建时间</label>
			    <input type="text" class="form-control" id="inputDaterange" style="width:150px;">
			  </div>
			  <button type="button" class="btn btn-sm btn-default" id="btn-search"><i class="fa fa-search"></i></button>
			  <button type="button" class="btn btn-sm btn-primary" id="btn-add" disabled><i class="fa fa-plus"></i></button>
		  </form>
        </div>
      </div><!-- /.box-header -->
      <div class="box-body">
        <table class="table table-bordered table-hover treetable" id="table-list">
          <thead>
	        <tr>
	          <th>权限名称</th>
	          <th>权限TAG</th>
	          <th>权限URL</th>
	          <th width="150">创建时间</th>
	          <th width="80">操作</th>
	        </tr>
	      </thead>
        </table>
      </div><!-- /.box-body -->
      
      <ul id="tree" class="ztree"></ul>
      <!-- <div class="box-footer clearfix">
        <ul class="pagination pagination-sm no-margin pull-right">
          <li><a href="#">&laquo;</a></li>
          <li><a href="#">1</a></li>
          <li><a href="#">2</a></li>
          <li><a href="#">3</a></li>
          <li><a href="#">&raquo;</a></li>
        </ul>
      </div> -->
    </div><!-- /.box -->
    
    <div class="modal fade" id="modalAdd">
      <div class="modal-dialog">
        <form id="formAdd" class="form-horizontal" action="${ctx}/manage/permission/save">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">权限新增</h4>
          </div>
          <div class="modal-body">
            <div class="alert alert-danger alertMessage" role="alert"></div>
            <div class="form-group">
			  <label for="inputNameAdd" class="col-sm-3 control-label">权限名称</label>
			  <div class="col-sm-7">
			    <input type="text" class="form-control" name="name" id="inputNameAdd">
			  </div>
			</div>
			<div class="form-group">
			  <label for="inputTagAdd" class="col-sm-3 control-label">权限TAG</label>
			  <div class="col-sm-7">
			    <input type="text" class="form-control" name="tag" id="inputTagAdd">
			  </div>
			</div>
			<div class="form-group">
			  <label for="inputUrlAdd" class="col-sm-3 control-label">权限URL</label>
			  <div class="col-sm-7">
			    <input type="text" class="form-control" name="url" id="inputUrlAdd">
			  </div>
			</div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
            <button type="submit" class="btn btn-primary">保存</button>
          </div>
        </div><!-- /.modal-content -->
        </form>
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    
    <div class="modal fade" id="modalEdit">
      <div class="modal-dialog">
        <form id="formEdit" class="form-horizontal" action="${ctx}/manage/permission/update">
        <input type="hidden" name="id" id="inputDataIdEdit">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">权限编辑</h4>
          </div>
          <div class="modal-body">
            <div class="alert alert-danger alertMessage" role="alert"></div>
            <div class="form-group">
			  <label for="inputNameEdit" class="col-sm-3 control-label">权限名称</label>
			  <div class="col-sm-7">
			    <input type="text" class="form-control" name="name" id="inputNameEdit">
			  </div>
			</div>
			<div class="form-group">
			  <label for="inputTagEdit" class="col-sm-3 control-label">权限TAG</label>
			  <div class="col-sm-7">
			    <input type="text" class="form-control" name="tag" id="inputTagEdit">
			  </div>
			</div>
			<div class="form-group">
			  <label for="inputUrlEdit" class="col-sm-3 control-label">权限URL</label>
			  <div class="col-sm-7">
			    <input type="text" class="form-control" name="url" id="inputUrlEdit">
			  </div>
			</div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
            <button type="submit" class="btn btn-primary">保存</button>
          </div>
        </div><!-- /.modal-content -->
        </form>
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    
    <div class="modal fade modal-danger" id="modalDanger">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">异常信息</h4>
          </div>
          <div class="modal-body">
            <p id="modalMessage"></p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">关闭</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    
    <table class="table table-bordered table-hover treetable"
		id="table-demo">
		<thead>
			<tr>
				<th>权限名称</th>
				<th>权限TAG</th>
				<th>权限URL</th>
				<th width="150">创建时间</th>
				<th width="80">操作</th>
			</tr>
		</thead>
		<tbody>
			<tr data-tt-id="9cbf0914f39ebc0bd80001">
				<td>角色管理</td>
				<td>role:manage</td>
				<td></td>
				<td>2015-08-17 12:29:55</td>
				<td class="text-center"><a href="javascript:void(0);"
					onclick="dataEdit('9cbf0914f39ebc0bd8000')" title="编辑"><i
						class="glyphicon glyphicon-edit"></i></a>&nbsp;&nbsp;<a
					href="javascript:void(0);"
					onclick="dataDelete('9cbf0914f39ebc0bd8000')" title="删除"><i
						class="glyphicon glyphicon-trash"></i></a><span class="parentId"
					style="display: none">9cbf0914f39ebc0bd8000;null</span></td>
			</tr>
			<tr data-tt-id="f4234b14f4924e33d80001"
				data-tt-parent-id="9cbf0914f39ebc0bd80001">
				<td>角色列表</td>
				<td>role:list</td>
				<td>/manage/role</td>
				<td>2015-08-20 11:26:38</td>
				<td class="text-center"><a href="javascript:void(0);"
					onclick="dataEdit('f4234b14f4924e33d8000')" title="编辑"><i
						class="glyphicon glyphicon-edit"></i></a>&nbsp;&nbsp;<a
					href="javascript:void(0);"
					onclick="dataDelete('f4234b14f4924e33d8000')" title="删除"><i
						class="glyphicon glyphicon-trash"></i></a><span class="parentId"
					style="display: none">f4234b14f4924e33d8000;9cbf0914f39ebc0bd8000</span></td>
			</tr>
		</tbody>
	</table>
    <jscript>
    <script src="${ctx}/js/format.js" type="text/javascript"></script>
	<script src="${ctx}/plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
	<script src="${ctx}/plugins/datatables/dataTables.bootstrap.min.js" type="text/javascript"></script>
	<script src="${ctx}/plugins/daterangepicker/moment.min.js" type="text/javascript"></script>
	<script src="${ctx}/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
	<script src="${ctx}/plugins/validator/bootstrapValidator.min.js" type="text/javascript"></script>
	<script src="${ctx}/plugins/zTree/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>
	<script src="${ctx}/plugins/treetable/jquery.treetable.js" type="text/javascript"></script>
	<script>
	var zTree;
	var setting = {
		view: {
			//dblClickExpand: false,
			showLine: true,
			//selectedMulti: false
		},
		data: {
			simpleData: {
				enable:true,
				idKey: "id",
				pIdKey: "parentId",
				rootPId: ""
			}
		}
	};
	var zNodes =[
		{id:"653b8e14f224efa907ffa", parentId:"", name:"[core] 基本功能 演示", open:true},
		{id:"653b8e14f224efa907ffb", parentId:"653b8e14f224efa907ffa", name:"最简单的树 --  标准 JSON 数据", file:"core/standardData"}
	];
	$(document).ready(function() {
		<shiro:hasPermission name="permission:add">
		$("#btn-add").removeAttr("disabled");
		</shiro:hasPermission>
		dataSearch({});
		var t = $("#tree");
		t = $.fn.zTree.init(t, setting, zNodes);
		var zTree = $.fn.zTree.getZTreeObj("tree");
		zTree.selectNode(zTree.getNodeByParam("id", 101));
		var options = {
				//column: 0,
				expandable: true,
				onNodeExpand: function() {
					//alert(1);
				},
				onNodeCollapse: function() {
					//alert(2);
				}
			};
    		$("#table-demo").treetable(options);
		$('#inputDaterange').daterangepicker({
			"locale": {
				"format": "YYYY-MM-DD",
				"applyLabel": "确定",
				"cancelLabel": "取消"
			}
		});
		$("#btn-search").click(function() {
			var params = {
				name: $("#inputName").val()
			};
			dataSearch({});
    	});
		$('#formEdit').bootstrapValidator({
			submitHandler: function(validator, form, submitButton) {
				$.post(form.attr('action'), form.serialize(), function(result) {
					if (result.code == '500') {
						$('.alertMessage').text(result.message);
						$('.alertMessage').show();
						validator.disableSubmitButtons(false);
					} else {
		                $("#modalEdit").modal("hide");
		                dataSearch({});
					}
			    }, 'json');
            }
        });
		$("#btn-add").click(function() {
			$('.alertMessage').hide();
			$('.alertMessage').text("");
			$('#formAdd').data('bootstrapValidator').resetForm();
			$("#modalAdd").modal("show");
		});
		$('#formAdd').bootstrapValidator({
			submitHandler: function(validator, form, submitButton) {
				$.post(form.attr('action'), form.serialize(), function(result) {
					if (result.code == '500') {
						$('.alertMessage').text(result.message);
						$('.alertMessage').show();
						validator.disableSubmitButtons(false);
					} else {
		                $("#modalAdd").modal("hide");
		                dataSearch({});
		                $('.parentId').css('display', 'none');
					}
			    }, 'json');
            }
        });
	});
	
	function closper() {
    		$("#table-list").treetable('collapseAll');
    		alert(1);
	}
	/**
     * 编辑数据
     */
    function dataEdit(id) {
		$('.alertMessage').hide();
		$('.alertMessage').text("");
		$('#formEdit').data('bootstrapValidator').resetForm();
		var url = "${ctx}/manage/permission/getData";
		var params = {
			id: id
		};
    	$.post(url, params, function(result) {
  			if ("500" == result.code) {
  				$("#modalMessage").text(result.message);
            	$("#modalDanger").modal("show");
  			} else {
  				$("#inputDataIdEdit").val(result.data.id);
  				$("#inputNameEdit").val(result.data.name);
  				$("#inputTagEdit").val(result.data.tag);
  				$("#inputUrlEdit").val(result.data.url);
  				$("#modalEdit").modal("show");
  			}
  	    }, 'json');
    }
	
    /**
     * 删除数据
     */
    function dataDelete(id) {
    	if (!confirm("确定要删除吗?")) {
    		return;
    	}
    	var url = "${ctx}/manage/permission/delete";
		var params = {
			id: id
		};
    	$.post(url, params, function(result) {
  			if ("500" == result.code) {
  				$("#modalMessage").text(result.message);
            	$("#modalDanger").modal("show");
  			} else {
  				dataSearch({});
  			}
  	    }, 'json');
    }
    //class="leaf" style="display: none;"
    function dataSearch(params) {
    	$('#table-list tbody').remove();
    	var url = "${ctx}/manage/permission/list?random=" + Math.random();
    	$.post(url, params, function(result) {
			if (result.data.length > 0) {
				var tbody = "<tbody>";
				var tr = "";
				for (var i = 0; i < result.data.length; i++) {
					tr += "<tr>"; //class="branch collapsed" 
					tr += "<td>" + result.data[i].name + "</td>";
					tr += "<td>" + result.data[i].tag + "</td>";
					tr += "<td>" + result.data[i].url + "</td>";
					tr += "<td>" + to_date_hms(result.data[i].createTime) + "</td>";
					tr += "<td class=\"text-center\">";
					tr += "<a href=\"javascript:void(0);\" onclick=\"dataEdit('" + result.data[i].id + "')\" title=\"编辑\"><i class=\"glyphicon glyphicon-edit\"></i></a>&nbsp;&nbsp;";
					tr += "<a href=\"javascript:void(0);\" onclick=\"dataDelete('" + result.data[i].id + "')\" title=\"删除\"><i class=\"glyphicon glyphicon-trash\"></i></a>";
					tr += "<span class=\"parentId\" style=\"display:none\">" + result.data[i].id + ";" + result.data[i].parentId + "</span>";
					tr += "</td>";
					tr += "</tr>";
				}
				tbody += tr + "</tbody>";
				$('#table-list').append(tbody);
				$('.parentId').each(function() {
	            	var parentId = $(this).text();
	            	var parentIds = parentId.split(";");
	            	$(this).parent().parent().attr("data-tt-id", parentIds[0]);
	            	if ("null" != parentIds[1]) {
	            		$(this).parent().parent().attr("data-tt-parent-id", parentIds[1]);
	            	}
	            });
				var options = {
					//column: 0,
					expandable: true,
					onNodeExpand: function() {
						//alert(1);
					},
					onNodeCollapse: function() {
						//alert(2);
					}
				};
	    		$("#table-list").treetable(options);
			}
		}, 'json');
    }
	</script>
	</jscript>
  </body>
</html>
