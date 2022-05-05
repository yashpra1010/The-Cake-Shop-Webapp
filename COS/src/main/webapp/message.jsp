<%
String msg = (String)session.getAttribute("message");
if(msg!=null){
	int i=0;
%>
<div class="alert alert-info alert-dismissible fade show" role="alert" style="margin-top:50px !important;">
  <strong><%= msg %></strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<%
	session.removeAttribute("message");
}
%>