<%-- 
    Document   : Update
    Created on : 2 Apr, 2020, 7:12:42 AM
    Author     : Harpreet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Show</title>
        <link rel='stylesheet' type='text/css' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css'>
        <link rel='stylesheet' type='text/css' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css'>
        <link rel='stylesheet' type='text/css' href='https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/css/bootstrapValidator.min.css'>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
        <script>
            $(document).ready(function() {
            $('#form').bootstrapValidator({
                // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    title {
                        validators: {
                                notEmpty: {
                                message: 'Please supply Title'
                            }
                        }
                    },
                     description {
                        validators: {
                            notEmpty: {
                                message: 'Please supply Description'
                            }
                        }
                    },
                    type: {
                        validators: {
                            notEmpty: {
                                message: 'Please supply Type'
                            }
                        }
                    },
                    category: {
                        validators: {
                            notEmpty: {
                                message: 'Please supply Category'
                            }
                        }
                    }
                }
                })
                .on('success.form.bv', function(e) {
                    $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
                        $('#contact_form').data('bootstrapValidator').resetForm();

                    // Prevent form submission
                    e.preventDefault();

                    // Get the form instance
                    var $form = $(e.target);

                    // Get the BootstrapValidator instance
                    var bv = $form.data('bootstrapValidator');

                    // Use Ajax to submit form data
                    $.post($form.attr('action'), $form.serialize(), function(result) {
                        console.log(result);
                    }, 'json');
                });
        });


    </script>
    </head>
    <body>
        <div class="container">

            <form class="well form-horizontal" action="MainServlet" method="post"  id="form" enctype="multipart/form-data">
        <fieldset>

        <!-- Form Name -->
        <legend>Update Shows</legend>
        <input  name="id" placeholder="Title" class="form-control" value="${show.id}" type="hidden" style="width: 287px;">
          
        <!-- Text input-->

        <div class="form-group">
          <label class="col-md-4 control-label">Title</label>  
          <div class="col-md-4 inputGroupContainer">
          <div class="input-group">
          <input  name="title" placeholder="Title" class="form-control" value="${show.title}" type="text" style="width: 287px;">
            </div>
          </div>
        </div>

        <div class="form-group">
          <label class="col-md-4 control-label" >Description</label> 
            <div class="col-md-4 inputGroupContainer">
            <div class="input-group">
                <textarea name="description" placeholder="Description" value="${show.description}" class="form-control" style="width: 287px;height: 87px;">${show.description}</textarea>
            </div>
          </div>
        </div>

        <div class="form-group">
          <label class="col-md-4 control-label">Type</label>  
            <div class="col-md-4 inputGroupContainer">
            <div class="input-group">
          <input name="type" placeholder="Type" class="form-control" value="${show.type}" type="text" style="width: 287px;">
            </div>
          </div>
        </div>
        
        <div class="form-group">
          <label class="col-md-4 control-label">Category</label>  
            <div class="col-md-4 inputGroupContainer">
            <div class="input-group">
          <input name="category" placeholder="Category" class="form-control" value="${show.category}" type="text" style="width: 287px;">
            </div>
          </div>
        </div>
        
        <div class="form-group">
          <label class="col-md-4 control-label">Director</label>  
            <div class="col-md-4 inputGroupContainer">
            <div class="input-group">
          <input name="director" placeholder="Director" class="form-control" value="${show.director}" type="text" style="width: 287px;">
            </div>
          </div>
        </div>
        
        <div class="form-group">
          <label class="col-md-4 control-label">Rating</label>  
            <div class="col-md-4 inputGroupContainer">
            <div class="input-group">
          <input name="rating" placeholder="rating" class="form-control" value="${show.rating}" type="text" style="width: 287px;">
            </div>
          </div>
        </div>
        
        <div class="form-group">
          <label class="col-md-4 control-label">Thumbnail</label>  
            <div class="col-md-4 inputGroupContainer">
            <div class="input-group">
                <input name="thumbnail" class="form-control" accept="image/*" type="file">
                </div>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-4 control-label">Use Existing image</label>  
            <div class="col-md-4 inputGroupContainer">
            <div class="input-group">
                <input name="oldImg" class="form-control" accept="image/*" type="checkbox" value="${img}">
                <img src="data:image/jpg;base64,${img}" width="350" height="350" alt="No image to show"/>
            
            </div>
          </div>
        </div>
        
        <!-- Button -->
        <div class="form-group">
          <label class="col-md-4 control-label"></label>
          <div class="col-md-4">
            <button type="submit" name="add" value="Add" class="btn btn-warning" >Update <span class="glyphicon glyphicon-send"></span></button>
          </div>
        </div>

        </fieldset>
        </form>
                <a href="MainServlet">Back</a>
        </div>
        </div>
    </body>
</html>
