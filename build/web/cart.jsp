<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" href="font-awesome/css/font-awesome.css">
        <link rel="stylesheet" href="css/style.css">
        <title>Ananas - Discover you</title>
        <link rel="shortcut icon" href="img/Logo_Ananas_Header.png">
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
    <!-- cart -->
    <section class="cart" id="cart">
        <c:forEach items="${requestScope.items}" var="i">
            <div class="item">
                <div class="image">
                    <img src="${i.product.img}" alt="">
                </div>
                <div class="detail">
                    <div class="infor">
                        <h3>${i.product.name}</h3>
                        <div class="unit-price">
                            <p id="unit-price">VND ${i.product.price}.000</p>
                        </div>
                        <div class="details">
                            <div class="size">
                                <p>Size: ${i.size}</p> 

                            </div>
                            <div class="quantity">
                                <p>Quantity: ${i.quantity}</p>
                            </div>
                        </div>
                    </div>
                    <div class="action">
                        <form action="" method="post">
                            <input type="button" class="btn" value="edit"/> 
                        </form>
                        
                        <form action="process" method="post">
                            <input type="hidden" name="data" value="${i.product.id}_${i.size}"/>
                            <input type="submit" class="btn" onclick="" value="remove"/>    
                        </form>                       
                    </div>
                            
                </div>
            </div> 
            <hr>
        </c:forEach>

        <div class="total">
            <h3>Total:</h3>
            <p>VND ${requestScope.total}.000</p>
            <form action="checkout" method="post">
                <input type="submit" value="place order" class="btn">    
            </form>
            
        </div>
    </section>
    <!--end featured-->
    <section class="blog" id="blog">
        <h1 class="heading">Team <span>Weblog</span></h1>
        <div class="box-container">
            <div class="box">
                <img src="img/team/1.png" alt="">
                <h3>Zahra Ahmadi</h3>
                <p>
                    Lorem ipsum, dolor sit amet consectetur adipisicing elit. 
                    Eos sequi temporibus impedit corporis vero ab exercitationem 
                    dolore voluptatibus, nisi non.
                </p>
                <div class="stars">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa fa-star"></i>
                </div>
            </div>
            <div class="box">
                <img src="img/team/2.png" alt="">
                <h3>Maryam Nazari</h3>
                <p>
                    Lorem ipsum, dolor sit amet consectetur adipisicing elit. 
                    Eos sequi temporibus impedit corporis vero ab exercitationem 
                    dolore voluptatibus, nisi non.
                </p>
                <div class="stars">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa fa-star-half-o"></i>
                </div>
            </div>
            <div class="box">
                <img src="img/team/3.png" alt="">
                <h3>Layla Akbari</h3>
                <p>
                    Lorem ipsum, dolor sit amet consectetur adipisicing elit. 
                    Eos sequi temporibus impedit corporis vero ab exercitationem 
                    dolore voluptatibus, nisi non.
                </p>
                <div class="stars">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o"></i>
                    <i class="fa fa fa-star-half-o"></i>
                </div>
            </div>
        </div>
    </section>
    <!--end blog-->
    <section class="news" id="news">
        <div class="content">
            <h3>monthly news letter</h3>
            <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                Fuga sed itaque ducimus maxime facere nihil expedita non sunt? Nostrum, voluptatem?
            </p>
            <form action="">
                <input type="email" placeholder="please enter your email" class="email">
                <input type="submit" value="save" class="btn">
            </form>
        </div>
    </section>
</body>
</html>
<script src="js/script.js"></script>