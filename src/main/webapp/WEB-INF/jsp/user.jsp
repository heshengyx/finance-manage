<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%>  
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <title>用户列表</title>
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
        <h3 class="box-title">用户列表</h3>
        <div class="box-tools pull-right">
          <form class="form-inline">
			  <div class="form-group form-group-sm">
			    <label class="control-label" for="inputUsername">用户名称</label>
			    <input type="text" class="form-control" id="inputUsername">
			  </div>
			  <div class="form-group form-group-sm">
			    <label class="control-label" for="inputDaterange">创建时间</label>
			    <input type="text" class="form-control" id="inputDaterange" style="width:150px;">
			  </div>
			  <button type="button" class="btn btn-sm btn-default" id="search-btn"><i class="fa fa-search"></i></button>
		  </form>
        </div>
      </div><!-- /.box-header -->
      <div class="box-body">
        <table class="table table-bordered table-hover" id="table-list">
          <thead>
	        <tr>
	          <th width="10">#</th>
	          <th>用户名称</th>
	          <th>账号</th>
	          <th>手机</th>
	          <th>状态</th>
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
    
    <div class="modal fade" id="modalEdit">
      <div class="modal-dialog">
        <form id="formEdit" class="form-horizontal" action="${ctx}/manage/user/update">
        <input type="hidden" name="id" id="inputDataIdEdit">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">用户编辑</h4>
          </div>
          <div class="modal-body">
            <div class="alert alert-danger alertMessage" role="alert"></div>
            <div class="form-group">
			  <label for="inputUsernameEdit" class="col-sm-3 control-label">用户名</label>
			  <div class="col-sm-7">
			    <input type="text" class="form-control" name="username" id="inputUsernameEdit">
			  </div>
			</div>
			<div class="form-group">
			  <label for="inputPhoneEdit" class="col-sm-3 control-label">手机号码</label>
			  <div class="col-sm-7">
			    <input type="text" class="form-control" name="phone" id="inputPhoneEdit">
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
    
    <div class="modal fade" id="modalRole">
      <div class="modal-dialog">
        <form id="formRole" class="form-horizontal" action="${ctx}/manage/role/saveTree">
        <input type="hidden" name="userId" id="inputUserId">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">分配角色</h4>
          </div>
          <div class="modal-body">
            <div class="alert alert-danger alertMessage" role="alert"></div>
            <ul id="tree" class="ztree"></ul>
            <div id="inputHidden"></div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
            <button type="submit" class="btn btn-primary">保存</button>
          </div>
        </div><!-- /.modal-content -->
        </form>
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
	$(document).ready(function() {
		//$('#alertMessage').hide();
		$('#inputDaterange').daterangepicker({
			"locale": {
				"format": "YYYY-MM-DD",
				"applyLabel": "确定",
				"cancelLabel": "取消"
			}
		});
		var table = $('#table-list').DataTable({
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
				"url": "${ctx}/manage/user/query",
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
				    "targets": [5]
				},
				{
					"searchable": false,
				    "orderable": false,
					"render": function(data, type, row) {
						var content = "";
						content += "<a href=\"javascript:void(0);\" onclick=\"assignRole('" + data.id + "')\" title=\"分配角色\"><i class=\"glyphicon glyphicon-list-alt\"></i></a>&nbsp;&nbsp;";
		                content += "<a href=\"javascript:void(0);\" onclick=\"dataEdit('" + data.id + "')\" title=\"编辑\"><i class=\"glyphicon glyphicon-edit\"></i></a>&nbsp;&nbsp;";
		                content += "<a href=\"javascript:void(0);\" onclick=\"dataDelete('" + data.id + "')\" title=\"删除\"><i class=\"glyphicon glyphicon-trash\"></i></a>";
		            	return content;
				    },
				    "targets": [6]
				}
			],
			"columns": [
	            { "data": null },
	            { "data": "username" },
	            { "data": "account" },
	            { "data": "phone" },
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
		$("#search-btn").click(function() {
	        var search = "?random=" + Math.random();
	        search += "&username=" + $("#inputUsername").val();
	        search += "&daterange=" + $("#inputDaterange").val();
	        table.ajax.url("${ctx}/manage/user/query" + search).load();
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
            },
			fields: {
				username: {
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        }
                    }
                },
                phone: {
                    validators: {
                        notEmpty: {
                            message: '手机号码不能为空'
                        }
                    }
                }
			}
        });
		//formRole
		$('#formRole').bootstrapValidator({
			submitHandler: function(validator, form, submitButton) {
				$('#inputHidden').html("");
				var inputHidden = "";
				var zTree = $.fn.zTree.getZTreeObj("tree");
				var nodes = zTree.getCheckedNodes(true);
				for(var i=0; i<nodes.length; i++) {
					inputHidden += "<input type=\"hidden\" name=\"roleId\" value=\"" + nodes[i].id + "\" ><br>";
				}
				$('#inputHidden').html(inputHidden);
				$.post(form.attr('action'), form.serialize(), function(result) {
					if (result.code == '500') {
						$('.alertMessage').text(result.message);
						$('.alertMessage').show();
					} else {
		                $("#modalRole").modal("hide");
					}
					validator.disableSubmitButtons(false);
			    }, 'json');
            }
        });
	});
	
	/**
     * 分配权限
     */
    function assignRole(id) {
    	$('#inputUserId').val(id);
    	$('.alertMessage').hide();
		$('.alertMessage').text("");
		var url = "${ctx}/manage/role/tree";
		var params = {
			userId: id
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
							enable: false,
							idKey: "id"
						}
					}
				};
  				$.fn.zTree.init($("#tree"), setting, result.data);
  				$("#modalRole").modal("show");
  			}
  	    }, 'json');
	}
	/**
     * 编辑数据
     */
    function dataEdit(id) {
		$('.alertMessage').hide();
		$('.alertMessage').text("");
		$('#formEdit').data('bootstrapValidator').resetForm();
		var url = "${ctx}/manage/user/getData";
		var params = {
			id: id
		};
    	$.post(url, params, function(result) {
  			if ("500" == result.code) {
  				$("#modalMessage").text(result.message);
            	$("#modalDanger").modal("show");
  			} else {
  				$("#inputDataIdEdit").val(result.data.id);
  				$("#inputUsernameEdit").val(result.data.username);
  				$("#inputPhoneEdit").val(result.data.phone);
  				$("#modalEdit").modal("show");
  			}
  	    }, 'json');
    }
	
    /**
     * 删除数据
     */
    function dataDelete(id) {
    	var url = "${ctx}/manage/user/delete";
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

