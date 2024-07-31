
//javascript
document.addEventListener('DOMContentLoaded', function() {
    const heading = document.getElementById('animated-heading');
    const logo = document.getElementById('logo');
  

    heading.style.opacity = 1;
//heading time chages
    logo.addEventListener('mouseenter', function() {
      logo.style.transform = 'rotate(360deg)';
    });
  
    logo.addEventListener('mouseleave', function() {
      logo.style.transform = 'rotate(0deg)';
    });
  });

    const testimonialSlider = document.querySelector('.testimonial-slider');
    let currentIndex = 0;

    function showTestimonial(index) {
        testimonialSlider.style.transform = `translateX(${-index * 100}%)`;
    }

    function nextTestimonial() {
        currentIndex = (currentIndex + 1) % 3;
        showTestimonial(currentIndex);
    }

    function prevTestimonial() {
        currentIndex = (currentIndex - 1 + 3) % 3; 
        showTestimonial(currentIndex);
    }
//implent thd slide size
    setInterval(nextTestimonial, 100000); 

  
  function addToCart(productId) {
    
    alert('Product ' + productId + ' added to cart!');
  }

  function buyNow(productId) {
    
    window.location.href = 'product-info.html?productId=' + productId;
  }

  //contact box sscript add
  function submitForm() {
  
    document.getElementById('myForm').submit();
    animatePage();
}

function animatePage() {

    document.body.style.backgroundColor = '#45a049';
    setTimeout(() => {
        document.body.style.backgroundColor = '#f0f0f0';
    }, 100);
}

//to create a new work