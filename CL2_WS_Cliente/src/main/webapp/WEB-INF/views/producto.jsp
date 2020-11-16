<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Producto</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"/>
<style type="text/css">
	.help-block {
	  		color: red;
	}
	
	.form-group.has-error .form-control-label {
	  color: red;
	}
	
	.form-group.has-error .form-control {
	  border: 1px solid red;
	  box-shadow: 0 0 0 0.2rem rgba(250, 16, 0, 0.18);
	}

</style>
</head>
<body>

	<div class="container">
	<c:if test="${MENSAJE !=null}">
	<div class="alert alert-warning alert-dismissible fade show" role="alert" id="success-alert">
	  <strong>Sistema:</strong> ${MENSAJE}
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	    <span aria-hidden="true">&times;</span>
	  </button>
	</div>
	</c:if>
	<c:remove var="MENSAJE"/>
	
	
	
	 	<h1 align="center">Listado de Productos</h1>
	 	
	 	<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalProducto">
		  Nuevo Producto
		</button>
		<div class="mt-5">
			<table id="table" class="table table-striped table-bordered" style="width:100%">
		        <thead>
		            <tr>
		                <th>C�digo</th>
		                <th>Nombre</th>
		                <th>Marca</th>
		                <th>Stock</th>
		                <th>Precio</th>
		            </tr>
		        </thead>
		        <tbody>
				 <c:forEach items="${requestScope.dataProductos}" var="row">
		            <tr>
		                <td>${row.codigoProducto}</td>
		                <td>${row.nombre}</td>
		                <td>${row.marca}</td>
		                <td>${row.stock}</td>
		                <td>${row.precio}</td>
		            </tr>
				 </c:forEach>
		        </tbody>
	    	</table>		
		</div>
	
		
		<!-- Modal -->
		<div class="modal fade" id="modalProducto" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="idTitulo">REGISTRAR PRODUCTO</h5>
		      </div>
		      <div class="modal-body">
		        <form id="frmProducto" action="save" method="post" data-toggle="validator" role="form">
				  <div class="form-group">
				    <label for="exampleInputEmail1">Nombre</label>
				    <input type="text" class="form-control" name="nombre" id="descripcion">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">Marca</label>
				    <input type="text" class="form-control" name="marca" id="cantidad">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">Stock</label>
				    <input type="text" class="form-control" name="stock" id="precio">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">Precio</label>
				    <input type="text" class="form-control" name="precio" id="datepicker">
				  </div>
				  <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" id="btnCerrar">Cerrar</button>
			        <button type="submit" class="btn btn-primary">Guardar</button>
			      </div>	
				</form>
		      </div>
		    </div>
		  </div>
		</div>
	 	
	</div>
	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.min.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	
	
	
<script type="text/javascript">    
    $(document).ready(function(){     
        $('#frmProducto').bootstrapValidator({      
        	 fields:{
        		 nombre:{
         			
         			validators: {
         				notEmpty :{
         					message : "El nombre es obligatorio"
         				},
         				stringLength: {
         					min: 1,
                             max: 50,
                             message: 'El nombre debe contener entre 1 a 30 caracteres'
                         }
         			}	
              	},
        		 marca:{
     			 	validators:{
     			 		notEmpty:{
     			 			message:'Campo marca es obligatorio'	
     			 		},
     			 		regexp:{
     			 			regexp:/^[a-zA-Z\s\�\�\�\�]{3,15}$/,
     			 			message:'Campo marca solo letras min 3 hasta max 15 letras'
     			 		}
     			 	}
     		 	},         		 
     		 	stock:{
     			 	validators:{
     			 		notEmpty:{
     			 			message:'Campo cantidad es obligatorio'	
     			 		},
     			 		digits:{
     			 			message:'Campo cantidad solo digitos'
     			 		},
     			 		regexp:{
    			 			regexp:/^\d+(\.\d{1,2})?$/,
    			 			message:'Campo solo numeros'
    			 		}
     			 	}
     		 	 },  
     		 	precio:{
     			 	validators:{
     			 		notEmpty:{
     			 			message:'Campo sueldo es obligatorio'	
     			 		},
     			 		digits:{
     			 			message:'Campo cantidad solo digitos'
     			 		},
     			 		regexp:{
    			 			regexp:/^\d+(\.\d{1,2})?$/,
    			 			message:'Campo solo numeros'
    			 		}
     			 	}
     		 	 }  
     		 	 
     		 	 
        	 }
        });   
			
    });    
</script>
	
	
	
	
</body>
</html>