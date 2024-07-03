<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@include file = "/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Rating</title>
</head>
<body>
<style>
			@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

fieldset, label { margin: 0; padding: 0; }
body{ margin: 20px; }
h1 { font-size: 1.5em; margin: 10px; }

/****** Style Star Rating Widget *****/

.rating { 
  border: none;
  float: left;
}

.rating > input { display: none; } 
.rating > label:before { 
  margin: 5px;
  font-size: 3.25em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}

.rating > .half:before { 
  content: "\f089";
  position: absolute;
}

.rating > label { 
  color: #ddd; 
 float: right; 
}

/***** CSS Magic to Highlight Stars on Hover *****/

.rating > input:checked ~ label, /* show gold star when clicked */
.rating:not(:checked) > label:hover, /* hover current star */
.rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

.rating > input:checked + label:hover, /* hover current star when changing rating */
.rating > input:checked ~ label:hover,
.rating > label:hover ~ input:checked ~ label, /* lighten current selection */
.rating > input:checked ~ label:hover ~ label { color: #FFED85;  } 
</style>




  
 <form action="" action="" id="RatingModel">
	<fieldset class="rating">
	    <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title=" 5 stars"></label>
	    <input type="radio" id="star4half" name="rating" value="4 and a half" /><label class="half" for="star4half" title="4.5 stars"></label>
	    <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="4 stars"></label>
	    <input type="radio" id="star3half" name="rating" value="3 and a half" /><label class="half" for="star3half" title="3.5 stars"></label>
	    <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="3 stars"></label>
	    <input type="radio" id="star2half" name="rating" value="2 and a half" /><label class="half" for="star2half" title="2.5 stars"></label>
	    <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="2 stars"></label>
	    <input type="radio" id="star1half" name="rating" value="1 and a half" /><label class="half" for="star1half" title="1.5 stars"></label>
	    <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title=" 1 star"></label>
	   <input type="radio" id="starhalf" name="rating" value="half" /><label class="half" for="starhalf" title=" 0.5 stars"></label>
	</fieldset>
  	<input type="submit" >
</form>
</body>
</html>