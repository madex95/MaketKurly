<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<div id="layoutSidenav_nav">
     <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
         <div class="sb-sidenav-menu">
             <div class="nav" id="nav">
             	<!-- 사이드 바 -->
             </div>
         </div>
        </nav>
 </div>
 
 <script>
		  var preContent;
		
		  function view_content(obj)
		  {
		    var div = obj.parentNode;
		    for (var i=1, m=div.childNodes.length;i<m;i++) {
		      if (div.childNodes[i].nodeType != 1) continue;	// text node.
		      else if (obj == div.childNodes[ i ]) continue;
		
		      obj = div.childNodes[ i ];
		      break;
		    }
		
		    if (preContent && obj!=preContent){
		      obj.style.display = "block";
		      preContent.style.display = "none";
		    }
		    else if (preContent && obj==preContent) preContent.style.display = ( preContent.style.display == "none" ? "block" : "none" );
		    else if (preContent == null ) obj.style.display = "block";
		
		    preContent = obj;
		  }
		</script>
 
 <script>
 	var nav = document.getElementById('nav');
 	var str='';
 	
 	<c:forEach items="${nav}" var = "menu">
 		str+='<div>'
 		str+='<div class="sb-sidenav-menu-heading" onclick="view_content(this)"  style="cursor:pointer;font-size:1rem">${menu.get(0).getMenu_name()}</div>';
		str+='<div style="display:none;">'
 		<c:forEach var="i" begin="1" end="${menu.size()-1}" step="1">
 			str+=' <a class="nav-link" href="${menu.get(i).getMenu_address()}" ><div class="sb-nav-link-icon">'
 			str+= '<i class="fas fa-tachometer-alt"></i></div>'
             str+='${menu.get(i).getMenu_name()}</a>'
 		</c:forEach>
        str+='</div>'
        str+='</div>'
 	</c:forEach>
     nav.innerHTML=str;
 </script>