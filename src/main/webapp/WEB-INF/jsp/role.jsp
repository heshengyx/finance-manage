<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <title>角色列表</title>
    <link href="${ctx}/plugins/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/plugins/validator/bootstrapValidator.min.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/plugins/zTree/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
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
          
    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">角色列表</h3>
        <div class="box-tools pull-right">
          <form class="form-inline">
			  <div class="form-group form-group-sm">
			    <label class="control-label" for="inputUsername">角色名称</label>
			    <input type="text" class="form-control" id="inputUsername">
			  </div>
			  <div class="form-group form-group-sm">
			    <label class="control-label" for="inputDaterange">创建时间</label>
			    <input type="text" class="form-control" id="inputDaterange" style="width:150px;">
			  </div>
			  <button type="button" class="btn btn-sm btn-default" id="btn-search"><i class="fa fa-search"></i></button>
			  <shiro:hasPermission name="role:save">
			  <button type="button" class="btn btn-sm btn-primary" id="btn-add"><i class="fa fa-plus"></i></button>
			  </shiro:hasPermission>
		  </form>
        </div>
      </div><!-- /.box-header -->
      <div class="box-body">
        <table class="table table-bordered table-hover" id="table-list">
          <thead>
	        <tr>
	          <th width="10">#</th>
	          <th>角色名称</th>
	          <th>角色TAG</th>
	          <th>角色状态</th>
	          <th width="110">创建时间</th>
	          <th width="40"></th>
	        </tr>
	      </thead>
        </table>
      </div><!-- /.box-body -->

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
        <form id="formAdd" class="form-horizontal" action="${ctx}/manage/role/save">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">角色新增</h4>
          </div>
          <div class="modal-body">
            <div class="alert alert-danger alertMessage" role="alert"></div>
            <div class="form-group">
			  <label for="inputNameAdd" class="col-sm-3 control-label">角色名称</label>
			  <div class="col-sm-7">
			    <input type="text" class="form-control" name="name" id="inputNameAdd">
			  </div>
			</div>
			<div class="form-group">
			  <label for="inputTagAdd" class="col-sm-3 control-label">角色TAG</label>
			  <div class="col-sm-7">
			    <input type="text" class="form-control" name="tag" id="inputTagAdd">
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
        <form id="formEdit" class="form-horizontal" action="${ctx}/manage/role/update">
        <input type="hidden" name="id" id="inputDataIdEdit">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">角色编辑</h4>
          </div>
          <div class="modal-body">
            <div class="alert alert-danger alertMessage" role="alert"></div>
            <div class="form-group">
			  <label for="inputNameEdit" class="col-sm-3 control-label">角色名称</label>
			  <div class="col-sm-7">
			    <input type="text" class="form-control" name="name" id="inputNameEdit">
			  </div>
			</div>
			<div class="form-group">
			  <label for="inputTagEdit" class="col-sm-3 control-label">角色TAG</label>
			  <div class="col-sm-7">
			    <input type="text" class="form-control" name="tag" id="inputTagEdit">
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
    
    <div class="modal fade" id="modalPermission">
      <div class="modal-dialog">
        <form id="formPermission" class="form-horizontal" action="${ctx}/manage/permission/saveTree">
        <input type="hidden" name="roleId" id="inputRoleId">
        <div id="inputHidden"></div>
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">分配权限</h4>
          </div>
          <div class="modal-body">
            <div class="alert alert-danger alertMessage" role="alert"></div>
            <div class="form-group">
			  <label class="col-sm-3 control-label">角色名称</label>
			  <div class="col-sm-7">
			    <p class="form-control-static" id="labelName"></p>
			  </div>
			</div>
            <div class="form-group">
			  <label class="col-sm-3 control-label">权限列表</label>
			  <div class="col-sm-7">
			    <ul id="tree" class="ztree"></ul>
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
    <jscript>
    <script src="${ctx}/js/format.js" type="text/javascript"></script>
	<script src="${ctx}/plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
	<script src="${ctx}/plugins/datatables/dataTables.bootstrap.min.js" type="text/javascript"></script>
	<script src="${ctx}/plugins/daterangepicker/moment.min.js" type="text/javascript"></script>
	<script src="${ctx}/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
	<script src="${ctx}/plugins/validator/bootstrapValidator.min.js" type="text/javascript"></script>
	<script src="${ctx}/plugins/zTree/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>
	<script>
	var table;
	$(document).ready(function() {
		$('#inputDaterange').daterangepicker({
			"locale": {
				"format": "YYYY-MM-DD",
				"applyLabel": "确定",
				"cancelLabel": "取消"
			}
		});
		table = $('#table-list').DataTable({
    		"language": {
    			"processing": "处理中...",
                "lengthMenu": "每页 _MENU_ 条记录",
                "zeroRecords": "没有找到记录",
                "info": "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
                "infoEmpty": "无记录",
                "infoFiltered": "(从 _MAX_ 条记录过滤)",
                "search": "搜索",
                "paginate": {
               	 	"first":    "首页",
			        "previous": "上页 ",
			        "next":     "下页 ",
			        "last":     "末页 "
			     }
            },
            "dom": "<'toolbar'>rt<'bottom'<'row'<'col-xs-2'i><'col-xs-10'p>><'clear'>>",
            "autoWidth": false,
    		"filter": false, 
    		"processing": true,
            "serverSide": true,
            "ajax": {
				"url": "${ctx}/manage/role/query",
				"type": "POST"
			},
			"order": [[ 1, "desc" ]],
			"columnDefs": [
				{
				    "searchable": false,
				    "orderable": false,
				    "targets": 0
				},
				{
					"render": function(data, type, row) {
				    	return to_date_hms(data.createTime);
				    },
				    "targets": [4]
				},
				{
					"searchable": false,
				    "orderable": false,
					"render": function(data, type, row) {
						var content = "";
						content += "<a href=\"javascript:void(0);\" onclick=\"assignPermission('" + data.id + "', '" + data.name + "')\" title=\"分配权限\"><i class=\"glyphicon glyphicon-list-alt\"></i></a>&nbsp;&nbsp;";
		                content += "<a href=\"javascript:void(0);\" onclick=\"dataEdit('" + data.id + "')\" title=\"编辑\"><i class=\"glyphicon glyphicon-edit\"></i></a>&nbsp;&nbsp;";
		                content += "<a href=\"javascript:void(0);\" onclick=\"dataDelete('" + data.id + "')\" title=\"删除\"><i class=\"glyphicon glyphicon-trash\"></i></a>";
		            	return content;
				    },
				    "targets": [5]
				}
			],
			"columns": [
	            { "data": null },
	            { "data": "name" },
	            { "data": "tag" },
	            { "data": "status" },
	            { "data": null },
	            { "data": null }
	        ]
    	});
		table.on( 'order.dt search.dt', function () {
			table.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	            cell.innerHTML = i+1;
	        } );
	    } ).draw();
		$("#btn-search").click(function() {
	        var search = "?random=" + Math.random();
	        search += "&username=" + $("#inputUsername").val();
	        search += "&daterange=" + $("#inputDaterange").val();
	        table.ajax.url("${ctx}/manage/role/query" + search).load();
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
		                table.ajax.reload();
					}
			    }, 'json');
            }
        });
		$("#btn-add").click(function() {
			$('.alertMessage').hide();
			$('.alertMessage').text("");
			$('#inputNameAdd').val("");
			$('#inputTagAdd').val("");
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
		                table.ajax.reload();
					}
			    }, 'json');
            }
        });
		$('#formPermission').bootstrapValidator({
			submitHandler: function(validator, form, submitButton) {
				$('#inputHidden').html("");
				var inputHidden = "";
				var zTree = $.fn.zTree.getZTreeObj("tree");
				var nodes = zTree.getCheckedNodes(true);
				for(var i=0; i<nodes.length; i++) {
					inputHidden += "<input type=\"hidden\" name=\"permissionId\" value=\"" + nodes[i].id + "\" ><br>";
				}
				$('#inputHidden').html(inputHidden);
				$.post(form.attr('action'), form.serialize(), function(result) {
					if (result.code == '500') {
						$('.alertMessage').text(result.message);
						$('.alertMessage').show();
					} else {
		                $("#modalPermission").modal("hide");
					}
					validator.disableSubmitButtons(false);
			    }, 'json');
            }
        });
	});
	function assignPermission(id, name) {
		$('#labelName').text(name);
		$('#inputRoleId').val(id);
    	$('.alertMessage').hide();
		$('.alertMessage').text("");
		var url = "${ctx}/manage/permission/tree";
		var params = {
			roleId: id
		};
    	$.post(url, params, function(result) {
  			if ("500" == result.code) {
  				$("#modalMessage").text(result.message);
            	$("#modalDanger").modal("show");
  			} else {
  				var setting = {
					view: {
						showLine: true
					},
					check: {
						enable: true,
						chkStyle: "checkbox" 
					},
					data: {
						simpleData: {
							enable: true,
							idKey: "id",
							pIdKey: "parentId",
							rootPId: ""
						}
					}
				};
  				$.fn.zTree.init($("#tree"), setting, result.data);
  				$("#modalPermission").modal("show");
  			}
  	    }, 'json');
	}
	/**
     * 编辑数据
     */
    function dataEdit(id) {
		$('.alertMessage').hide();
		$('.alertMessage').text("");
		$('#inputHidden').html("");
		$('#formEdit').data('bootstrapValidator').resetForm();
		var url = "${ctx}/manage/role/getData";
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
    	var url = "${ctx}/manage/role/delete";
		var params = {
			id: id
		};
    	$.post(url, params, function(result) {
  			if ("500" == result.code) {
  				$("#modalMessage").text(result.message);
            	$("#modalDanger").modal("show");
  			} else {
  				table.ajax.reload();
  			}
  	    }, 'json');
    }
	</script>
	</jscript>
  </body>
</html>

