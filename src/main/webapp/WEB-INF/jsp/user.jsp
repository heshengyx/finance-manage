<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%>  
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <title>用户列表</title>
    <link href="${ctx}/plugins/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
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
  
    <div class="box">
      <div class="box-header">
        <h3 class="box-title">用户列表</h3>
      </div><!-- /.box-header -->
      <div class="box-body">
        <table class="table table-bordered table-hover" id="table-list">
          <thead>
	        <tr>
	          <th width="10">#</th>
	          <th>用户名</th>
	          <th width="110">创建时间</th>
	          <th width="50"></th>
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
    
    <div class="modal fade" id="myModal">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">Modal Default</h4>
          </div>
          <div class="modal-body">
            <p>One fine body&hellip;</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">Save changes</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <jscript>
    <script src="${ctx}/js/format.js" type="text/javascript"></script>
	<script src="${ctx}/plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
	<script src="${ctx}/plugins/datatables/dataTables.bootstrap.min.js" type="text/javascript"></script>
	<script>
	$(document).ready(function() {
		var t = $('#table-list').DataTable({
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
				"url": "${ctx}/manage/user/list",
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
				    "targets": [2]
				},
				{
					"searchable": false,
				    "orderable": false,
					"render": function(data, type, row) {
						var content = "";
						content += "<a href=\"#\" data-toggle=\"modal\" data-target=\"#myModal\">编辑</a>";
						content += "<a href=\"#\">删除</a>";
				    	return content;
				    },
				    "targets": [3]
				}
			],
			"columns": [
	            { "data": null },
	            { "data": "username" },
	            { "data": null },
	            { "data": null }
	        ]
    	});
		t.on( 'order.dt search.dt', function () {
	        t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	            cell.innerHTML = i+1;
	        } );
	    } ).draw();
	});
	</script>
	</jscript>
  </body>
</html>

