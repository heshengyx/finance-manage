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
          
    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">权限列表</h3>
        <div class="box-tools pull-right">
          <form class="form-inline">
			  <div class="form-group form-group-sm">
			    <label class="control-label" for="inputUsername">权限名称</label>
			    <input type="text" class="form-control" id="inputUsername">
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
	          <th width="110">创建时间</th>
	          <th width="20"></th>
	        </tr>
	      </thead>
        </table>
        
        <table class="table table-bordered table-hover" id="example-basic">
        <caption>Basic jQuery treetable Example</caption>
        <thead>
          <tr>
            <th>Tree column</th>
            <th>Additional data</th>
          </tr>
        </thead>
        <tbody>
          <tr data-tt-id="1">
            <td>Node 1: Click on the icon in front of me to expand this branch.</td>
            <td>I live in the second column.</td>
          </tr>
          <tr data-tt-id="1.1" data-tt-parent-id="1">
            <td>Node 1.1: Look, I am a table row <em>and</em> I am part of a tree!</td>
            <td>Interesting.</td>
          </tr>
          <tr data-tt-id="1.1.1" data-tt-parent-id="1.1">
            <td>Node 1.1.1: I am part of the tree too!</td>
            <td>That's it!</td>
          </tr>
          <tr data-tt-id="2">
            <td>Node 2: I am another root node, but without children</td>
            <td>Hurray!</td>
          </tr>
        </tbody>
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
		}/* ,
		callback: {
			beforeClick: function(treeId, treeNode) {
				var zTree = $.fn.zTree.getZTreeObj("tree");
				if (treeNode.isParent) {
					zTree.expandNode(treeNode);
					return false;
				} else {
					return true;
				}
			}
		} */
	};
	var zNodes =[
		{id:"653b8e14f224efa907ffa", parentId:"", name:"[core] 基本功能 演示", open:true},
		{id:"653b8e14f224efa907ffb", parentId:"653b8e14f224efa907ffa", name:"最简单的树 --  标准 JSON 数据", file:"core/standardData"}
	];
	/* var zNodes =[
   		{id:1, pId:0, name:"[core] 基本功能 演示", open:true},
   		{id:101, pId:1, name:"最简单的树 --  标准 JSON 数据", file:"core/standardData"},
   		{id:102, pId:1, name:"最简单的树 --  简单 JSON 数据", file:"core/simpleData"},
   		{id:103, pId:1, name:"不显示 连接线", file:"core/noline"},
   		{id:104, pId:1, name:"不显示 节点 图标", file:"core/noicon"},
   		{id:105, pId:1, name:"自定义图标 --  icon 属性", file:"core/custom_icon"},
   		{id:106, pId:1, name:"自定义图标 --  iconSkin 属性", file:"core/custom_iconSkin"},
   		{id:107, pId:1, name:"自定义字体", file:"core/custom_font"},
   		{id:115, pId:1, name:"超链接演示", file:"core/url"},
   		{id:108, pId:1, name:"异步加载 节点数据", file:"core/async"},
   		{id:109, pId:1, name:"用 zTree 方法 异步加载 节点数据", file:"core/async_fun"},
   		{id:110, pId:1, name:"用 zTree 方法 更新 节点数据", file:"core/update_fun"},
   		{id:111, pId:1, name:"单击 节点 控制", file:"core/click"},
   		{id:112, pId:1, name:"展开 / 折叠 父节点 控制", file:"core/expand"},
   		{id:113, pId:1, name:"根据 参数 查找 节点", file:"core/searchNodes"},
   		{id:114, pId:1, name:"其他 鼠标 事件监听", file:"core/otherMouse"},

   		{id:2, pId:0, name:"[excheck] 复/单选框功能 演示", open:false},
   		{id:201, pId:2, name:"Checkbox 勾选操作", file:"excheck/checkbox"},
   		{id:206, pId:2, name:"Checkbox nocheck 演示", file:"excheck/checkbox_nocheck"},
   		{id:207, pId:2, name:"Checkbox chkDisabled 演示", file:"excheck/checkbox_chkDisabled"},
   		{id:208, pId:2, name:"Checkbox halfCheck 演示", file:"excheck/checkbox_halfCheck"},
   		{id:202, pId:2, name:"Checkbox 勾选统计", file:"excheck/checkbox_count"},
   		{id:203, pId:2, name:"用 zTree 方法 勾选 Checkbox", file:"excheck/checkbox_fun"},
   		{id:204, pId:2, name:"Radio 勾选操作", file:"excheck/radio"},
   		{id:209, pId:2, name:"Radio nocheck 演示", file:"excheck/radio_nocheck"},
   		{id:210, pId:2, name:"Radio chkDisabled 演示", file:"excheck/radio_chkDisabled"},
   		{id:211, pId:2, name:"Radio halfCheck 演示", file:"excheck/radio_halfCheck"},
   		{id:205, pId:2, name:"用 zTree 方法 勾选 Radio", file:"excheck/radio_fun"},

   		{id:3, pId:0, name:"[exedit] 编辑功能 演示", open:false},
   		{id:301, pId:3, name:"拖拽 节点 基本控制", file:"exedit/drag"},
   		{id:302, pId:3, name:"拖拽 节点 高级控制", file:"exedit/drag_super"},
   		{id:303, pId:3, name:"用 zTree 方法 移动 / 复制 节点", file:"exedit/drag_fun"},
   		{id:304, pId:3, name:"基本 增 / 删 / 改 节点", file:"exedit/edit"},
   		{id:305, pId:3, name:"高级 增 / 删 / 改 节点", file:"exedit/edit_super"},
   		{id:306, pId:3, name:"用 zTree 方法 增 / 删 / 改 节点", file:"exedit/edit_fun"},
   		{id:307, pId:3, name:"异步加载 & 编辑功能 共存", file:"exedit/async_edit"},
   		{id:308, pId:3, name:"多棵树之间 的 数据交互", file:"exedit/multiTree"},

   		{id:4, pId:0, name:"大数据量 演示", open:false},
   		{id:401, pId:4, name:"一次性加载大数据量", file:"bigdata/common"},
   		{id:402, pId:4, name:"分批异步加载大数据量", file:"bigdata/diy_async"},
   		{id:403, pId:4, name:"分批异步加载大数据量", file:"bigdata/page"},

   		{id:5, pId:0, name:"组合功能 演示", open:false},
   		{id:501, pId:5, name:"冻结根节点", file:"super/oneroot"},
   		{id:502, pId:5, name:"单击展开/折叠节点", file:"super/oneclick"},
   		{id:503, pId:5, name:"保持展开单一路径", file:"super/singlepath"},
   		{id:504, pId:5, name:"添加 自定义控件", file:"super/diydom"},
   		{id:505, pId:5, name:"checkbox / radio 共存", file:"super/checkbox_radio"},
   		{id:506, pId:5, name:"左侧菜单", file:"super/left_menu"},
   		{id:513, pId:5, name:"OutLook 风格", file:"super/left_menuForOutLook"},
           {id:514, pId:5, name:"Metro 风格", file:"super/metro"},
   		{id:507, pId:5, name:"下拉菜单", file:"super/select_menu"},
   		{id:509, pId:5, name:"带 checkbox 的多选下拉菜单", file:"super/select_menu_checkbox"},
   		{id:510, pId:5, name:"带 radio 的单选下拉菜单", file:"super/select_menu_radio"},
   		{id:508, pId:5, name:"右键菜单 的 实现", file:"super/rightClickMenu"},
   		{id:511, pId:5, name:"与其他 DOM 拖拽互动", file:"super/dragWithOther"},
   		{id:512, pId:5, name:"异步加载模式下全部展开", file:"super/asyncForAll"},

   		{id:6, pId:0, name:"其他扩展功能 演示", open:false},
   		{id:601, pId:6, name:"隐藏普通节点", file:"exhide/common"},
   		{id:602, pId:6, name:"配合 checkbox 的隐藏", file:"exhide/checkbox"},
   		{id:603, pId:6, name:"配合 radio 的隐藏", file:"exhide/radio"}
   	]; */
	var table;
	$(document).ready(function() {
		<shiro:hasPermission name="permission:add">
		$("#btn-add").removeAttr("disabled");
		</shiro:hasPermission>
		var options = {
			column: 0,
			expandable: true,
			onNodeExpand: function() {
				alert(1);
			},
			onNodeCollapse: function() {
				alert(2);
			}
		};
		$("#example-basic").treetable(options);
		
		var t = $("#tree");
		t = $.fn.zTree.init(t, setting, zNodes);
		var zTree = $.fn.zTree.getZTreeObj("tree");
		zTree.selectNode(zTree.getNodeByParam("id", 101));
		
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
				"url": "${ctx}/manage/permission/list",
				"type": "POST"
			},
			"order": [[ 1, "desc" ]],
			"columnDefs": [
				{
					"render": function(data, type, row) {
				    	return to_date_hms(data.createTime);
				    },
				    "targets": [3]
				},
				{
					"searchable": false,
				    "orderable": false,
					"render": function(data, type, row) {
						var content = "";
		                content += "<a href=\"javascript:void(0);\" onclick=\"dataEdit('" + data.id + "')\" title=\"编辑\"><i class=\"glyphicon glyphicon-edit\"></i></a>&nbsp;&nbsp;";
		                content += "<a href=\"javascript:void(0);\" onclick=\"dataDelete('" + data.id + "')\" title=\"删除\"><i class=\"glyphicon glyphicon-trash\"></i></a>";
		                content += "<span class=\"parentId\" style=\"display:none\">" + data.id + ";" + data.parentId + "</span>";
		            	return content;
				    },
				    "targets": [4]
				}
			],
			"columns": [
	            { "data": "name" },
	            { "data": "tag" },
	            { "data": "url" },
	            { "data": null },
	            { "data": null }
	        ],
	        initComplete : function() {
	        	/* var api = this.api();
	        	alert(api);
	        	api.$('td').click( function () {
	                api.search( this.innerHTML ).draw();
	                alert($(this).text());
	            }); */
	            alert(1);
	            $('.parentId').each(function() {
	            	var parentId = $(this).text();
	            	var parentIds = parentId.split(";");
	            	$(this).parent().parent().attr("data-tt-id", parentIds[0]);
	            	if ("null" != parentIds[1]) {
	            		$(this).parent().parent().attr("data-tt-parent-id", parentIds[1]);
	            	}
	            });
	            var options = {
	    			column: 0,
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
    	});
		/* table.on( 'order.dt search.dt', function () {
			table.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	            cell.innerHTML = i+1;
	        } );
	    } ).draw(); */
		$("#btn-search").click(function() {
	        var search = "?random=" + Math.random();
	        search += "&username=" + $("#inputUsername").val();
	        search += "&daterange=" + $("#inputDaterange").val();
	        //table.ajax.url("${ctx}/manage/permission/list" + search).load();
	        //alert(2);
	        //table.ajax.reload();
	        //var args = table.ajax.params();
	        table.draw();
	        //console.log("额外传到后台的参数值extra_search为："+args.extra_search);
	        /* alert(args);
	        for (var i in args) {
	        	alert(i + "=" + args[i]);
	        } */
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
		                $('.parentId').css('display', 'none');
					}
			    }, 'json');
            }
        });
	});
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
  				table.ajax.reload();
  			}
  	    }, 'json');
    }
	</script>
	</jscript>
  </body>
</html>
