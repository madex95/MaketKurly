<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<h1 class="mt-4">${menuName.getMenu_name()}</h1>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item">${menuName.getMenu_parent()}</li>
    <li class="breadcrumb-item active">${menuName.getMenu_name()}</li>
</ol>
