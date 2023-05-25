<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
    <head>
        <link rel="stylesheet" href="font-awesome/css/font-awesome.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="shortcut icon" href="img/Logo_Ananas_Header.png">
        <style>
            .featured{
                position: relative;
                padding-top: 100px;              
            }
        </style>
    </head>
    <body>
        <header>
            <div id="menu-bar" class="fa fa-bars"></div>
            <a href="#" class="logo">Logo</a>
            <nav class="navbar">
                <a href="#home">Home</a>
                <a href="shop">Product</a>
                <a href="#fearured">Fearured</a>
                <a href="#blog">blog</a>
                <a href="#news">news</a>
            </nav>
            <div class="icons">
                <a href="#"><i class="fa fa-heart"></i></a>
                <a href="order"><i class="fa fa-shopping-cart"></i></a>
                <a href="#"><i class="fa fa-user"></i></a>
            </div>
        </header>
        <!--end header-->
        
        <section class="featured" id="fearured">
            <h1 class="heading">Your <span>Product</span></h1>
            <div class="row">
                <div class="image-container">
                    <div class="small-image">
                        <c:forEach items="${image}" var="i">
                            <img src="${i.image}" alt="" class="featured-image-1">
                        </c:forEach>                        
                    </div>
                    <div class="big-image">
                        <img src="${big_image}" alt="" class="big-image-1">
                    </div>
                </div>
                <div class="content">
                    <h3>${requestScope.p.name}</h3>
                    <div class="stars">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                    </div>
                    <p>
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                        Fugit officiis omnis quo laboriosam velit culpa ex illo, error enim nostrum?
                    </p>
                    <div class="price">VND ${requestScope.p.price}.000 <span> ${requestScope.p.price+100}.000</span></div>
                    
                    <form name="f" action="" method="get">
                        <button type="button" class="btn" onclick="add()">add to cart</button>
                        <input name="id" type="hidden" value="${requestScope.p.id}"/>
                        <div class="order-detail">
                            <div class="size">
                                <p>size:</p>
                                <select name="size" class="btn">                        
                                    <c:forEach begin="35" end="46" var="i" step="1">
                                        <option>${i}</option>
                                    </c:forEach>  
                                </select>    
                            </div>
                            <div class="num">
                                <p>so luong:</p>
                                <select name="num" class="btn">   
                                    <c:forEach begin="1" end="10" var="i" step="1">
                                        <option>${i}</option>
                                    </c:forEach>  
                                </select>    
                            </div>                     
                        </div>    
                    </form>
                </div>
            </div>            
        </section>
        <!--end featured-->
        
    </body>
</html>

<script src="js/script.js"></script>
<script>
    function add() {
        var id = document.f.id.value;
        var size = document.f.size.value;
        var num = document.f.num.value;
        document.f.action = "add?id="+id+"&size="+size+"&num="+num;
        document.f.submit();
    }
</script>