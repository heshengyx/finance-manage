<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%>  
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <title>用户列表</title>
    <link href="${ctx}/css/jquery.dataTables.min.css" rel="stylesheet">
  </head>
  <body>
  
    <div class="box">
      <div class="box-header">
        <h3 class="box-title">用户列表</h3>
        <div class="box-tools">
          <div class="input-group" style="width: 150px;">
            <input type="text" name="table_search" class="form-control input-sm pull-right" placeholder="Search" />
            <div class="input-group-btn">
              <button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
            </div>
          </div>
        </div>
      </div><!-- /.box-header -->
      <div class="box-body">
        <table class="table table-hover" id="table-list">
          <thead>
	        <tr>
	          <th>#</th>
	          <th>用户名</th>
	          <th></th>
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
    <jscript>
	<script src="${ctx}/js/jquery.dataTables.min.js"></script>
	<script>
	$(document).ready(function() {
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
    		"filter": false, 
    		"processing": true,
            "serverSide": true,
            "ajax": {
				"url": "${ctx}/manage/user/list",
				"type": "POST"
			},
			"order": [[ 0, "desc" ]],
			"columns": [
	            { "data": null },
	            { "data": "username" },
	            { "data": null }
	        ]
    	});
	});
	</script>
	</jscript>
  </body>
</html>

