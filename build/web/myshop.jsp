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
            .featured .row .image-container .big-image{
                width: 50%;
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
                <a href="login"><i class="fa fa-user"></i></a>
            </div>
        </header>
        
        <!-- all product -->
        <section class="featured" id="fearured">           
            <h1 class="heading">New <span>Product</span></h1>
<!--            <div>
                <input type="button" class="btn" onclick="display()" value="search"/>
            </div>-->
            <h3>Search</h3>
            <form action="search" method="get">
                <input id="search-box" type="text" name="name" placeholder="enter shoe's name" style="border: 0.1px solid #555;"/>
                <div id="search">                    
                    <ul>
                        <li class="fist-level">Price
                            <ul>
                                <li style="list-style: none;">
                                    <label>
                                        <input type="checkbox" name="price" value="<500"> <span>< 500k</span>
                                    </label>
                                </li>
                                <li style="list-style: none;">
                                    <label>
                                        <input type="checkbox" name="price" value="between 500 and 700"> <span>600k -> 700k</span>
                                    </label>
                                </li>
                                <li style="list-style: none;">
                                    <label>
                                        <input type="checkbox" name="price" value=">700"> <span>> 700k</span>
                                    </label>
                                </li>
                            </ul>
                        </li>
                        <li class="second-level">Category
                            <ul>
                                <li style="list-style: none;">
                                    <label>
                                        <input type="checkbox" name="category" value="vintas"> <span>vintas</span>
                                    </label>
                                </li>
                                <li style="list-style: none;">
                                    <label>
                                        <input type="checkbox" name="category" value="babas"> <span>babas</span>
                                    </label>
                                </li>
                                <li style="list-style: none;">
                                    <label>
                                        <input type="checkbox" name="category" value="track6"> <span>track 6</span>
                                    </label>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <input type="submit" class="btn" value="submit"/>
                </div>
            </form>
            
            <form action="" name="f" method="post">
                <c:forEach items="${requestScope.data}" var="p">
                    <c:set var="id" value="${p.id}"/>
                    <div class="row">
                        <div class="image-container">  
                            <div class="big-image">
                                <img src="${p.img}" alt="" class="big-image-1">
                            </div>
                        </div>
                        <div class="content">
                            <h3>${p.name}</h3>
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
                            <div class="price">VND ${p.price}.000<span> ${p.price+100}.000</span></div>                                                                               
                            <input class="btn" type="button" onclick="buy('${id}')" value="Buy item"/>                           
                        </div>
                    </div>    
                </c:forEach>           
            </form>
        </section>        
    </body>
</html>

<script src="js/script.js"></script>
<!--<script type="text/javascript">
    function buy(id){
        document.f.action="buy?id="+id;
        document.f.submit();
    }
    function display() {
        var x = document.getElementsById('search');
        if(x.style.display == 'none') { 
            x.style.display = 'block';
        } else {
            x.style.display = 'none';
        }
    }    
</script> -->