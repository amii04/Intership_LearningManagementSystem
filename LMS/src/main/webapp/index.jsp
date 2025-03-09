<html lang="en">
 <head>
  <meta charset="utf-8"/>
  <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
  <title>
   Pragnya - Learning Management System
  </title>
  <script src="https://cdn.tailwindcss.com">
  </script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/>
  <style>
   body {
            font-family: 'Roboto', sans-serif;
        }
        .carousel {
            position: relative;
            overflow: hidden;
        }
        .carousel-inner {
            display: flex;
            transition: transform 0.5s ease-in-out;
        }
        .carousel-item {
            min-width: 100%;
            box-sizing: border-box;
        }
        .carousel-control-prev, .carousel-control-next {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background-color: rgba(0, 0, 0, 0.5);
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
        }
        .carousel-control-prev {
            left: 10px;
        }
        .carousel-control-next {
            right: 10px;
        }
        .mobile-menu {
            display: none;
        }
        .logo-img{
            transform: rotate(180deg);
        }
        @media (max-width: 768px) {
            .desktop-menu {
                display: none;
            }
            .mobile-menu {
                display: block;
            }

        }
  </style>
  <script>
    function loadNavbar() {
        fetch("navbar.html")
            .then(response => response.text())
            .then(data => {
                document.getElementById("navbar-container").innerHTML = data;
            })
            .catch(error => console.error("Error loading navbar:", error));
    }
    window.onload = loadNavbar;
</script>
 </head>
 <body class="bg-gray-100">
  <header class="bg-white shadow">
    <div id="navbar-container"></div>
    <!---
   <div class="container mx-auto p-4 flex justify-between items-center">
    
    <div class="flex items-center space-x-4">
     <img class = "logo-img"alt="Pragnya logo with a stylized book and graduation cap" class="h-12 w-12" height="50" src="pragya.png" width="50"/>
     <h1 class="text-2xl font-bold">
      Pragnya
     </h1>
    </div>
    <nav class="space-x-4 flex items-center desktop-menu">
     <a class="text-gray-700 hover:text-blue-500" href="#welcome">
      Home
     </a>
     <a class="text-gray-700 hover:text-blue-500" href="#about">
      About Us
     </a>
     <a class="text-gray-700 hover:text-blue-500" href="#popular-courses">
      Popular Courses
     </a>
     <a class="text-gray-700 hover:text-blue-500" href="#feedback">
      Feedback
     </a>
     <div class="relative">
      <input class="border border-gray-300 rounded-lg px-4 py-2" placeholder="Explore..." type="text"/>
      <button class="absolute right-0 top-0 mt-2 mr-2 text-gray-500">
       <i class="fas fa-search">
       </i>
      </button>
     </div>
     <div class="relative">
      <button class="text-gray-700 hover:text-blue-500 flex items-center">
       <i class="fas fa-user mr-2">
       </i>
       <a href="login.html">
       Login
       </a>
      </button>
      <div class="absolute right-0 mt-2 w-48 bg-white border border-gray-200 rounded-lg shadow-lg hidden group-hover:block">
       <a class="block px-4 py-2 text-gray-700 hover:bg-gray-100" href="instructor/login.jsp">
        Instructor Login
       </a>
       <a class="block px-4 py-2 text-gray-700 hover:bg-gray-100" href="student/login.jsp">
        Student Login
       </a>
      </div>
     </div>
    </nav>------>
    <div class="mobile-menu">
     <button id="mobile-menu-button" class="text-gray-700 hover:text-blue-500">
      <i class="fas fa-bars"></i>
     </button>
    </div>
   </div>
   <div id="mobile-menu-dropdown" class="hidden bg-white shadow-lg">
    <nav class="space-y-2 p-4">
     <a class="block text-gray-700 hover:text-blue-500" href="#welcome">
      Home
     </a>
     <a class="block text-gray-700 hover:text-blue-500" href="#about">
      About Us
     </a>
     <a class="block text-gray-700 hover:text-blue-500" href="#popular-courses">
      Popular Courses
     </a>
     <a class="block text-gray-700 hover:text-blue-500" href="#feedback">
      Feedback
     </a>
     <div class="relative">
      <input class="border border-gray-300 rounded-lg px-4 py-2 w-full" placeholder="Explore..." type="text"/>
      <button class="absolute right-0 top-0 mt-2 mr-2 text-gray-500">
       <i class="fas fa-search">
       </i>
      </button>
     </div>
     <div class="relative">
      <button class="text-gray-700 hover:text-blue-500 flex items-center w-full">
       <i class="fas fa-user mr-2">
       </i>
       Login
      </button>
      <div class="absolute right-0 mt-2 w-48 bg-white border border-gray-200 rounded-lg shadow-lg hidden group-hover:block">
       <a class="block px-4 py-2 text-gray-700 hover:bg-gray-100" href="instructor/login.jsp">
        Instructor Login
       </a>
       <a class="block px-4 py-2 text-gray-700 hover:bg-gray-100" href="student/login.jsp">
        Student Login
       </a>
      </div>
     </div>
    </nav>
   </div>
  </header>
  <main class="container mx-auto p-4">
   <section id="welcome" class="text-center mb-12">
    <h2 class="text-4xl font-bold mb-4">
     Welcome to Pragnya
    </h2>
    <p class="text-gray-600 mb-8">
     Empowering Instructors and Students with a seamless learning experience.
    </p>
    <div class="carousel">
     <div class="carousel-inner">
      <div class="carousel-item">
       <img alt="Image 1 description" class="w-full h-64 object-cover" height="400" src="https://storage.googleapis.com/a1aa/image/zZQOv_DPW75Z_FwVoOH_fSAEd0hGDr5kjWs6Ryp9vFw.jpg" width="800"/>
      </div>
      <div class="carousel-item">
       <img alt="Image 2 description" class="w-full h-64 object-cover" height="400" src="https://storage.googleapis.com/a1aa/image/mkacrP6MrUuCVk0z_sGuBC-gRYY1Na7pf7WB3Ykhb4g.jpg" width="800"/>
      </div>
      <div class="carousel-item">
       <img alt="Image 3 description" class="w-full h-64 object-cover" height="400" src="https://storage.googleapis.com/a1aa/image/XTHbDaduRUSXggDg5O4TbLhFBII1tGe5Uq0co5RjdN4.jpg" width="800"/>
      </div>
     </div>
     <button class="carousel-control-prev" onclick="prevSlide()">
      ❮
     </button>
     <button class="carousel-control-next" onclick="nextSlide()">
      ❯
     </button>
    </div>
   </section>
   <section id="about" class="text-center mb-12">
    <h2 class="text-3xl font-bold mb-4">
     About Us
    </h2>
    <p class="text-gray-600 mb-8">
     Pragnya is dedicated to providing the best online learning experience for both instructors and students. Our platform offers a wide range of courses, interactive learning tools, and real-time feedback to ensure a seamless and effective learning journey.
    </p>
   </section>
   <section id="popular-courses" class="mt-12 text-center">
    <h2 class="text-3xl font-bold mb-4">
     Popular Courses
    </h2>
    <div class="carousel relative">
     <div class="carousel-inner">
      <div class="carousel-item">
       <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <div class="bg-white p-6 rounded-lg shadow-lg">
         <img alt="Course 1 illustration" class="w-full h-40 object-cover mb-4 rounded" height="200" src="https://storage.googleapis.com/a1aa/image/oCQ2dfUeSnBhsPBQC4yaOp6tYd0YhEYf3PCYTA_u6k4.jpg" width="300"/>
         <h3 class="text-xl font-bold mb-2">
          Course Title 1
         </h3>
         <p class="text-gray-600 mb-4">
          Brief description of the course content and objectives.
         </p>
         <a class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition duration-300" href="#">
          Enroll Now
         </a>
        </div>
        <div class="bg-white p-6 rounded-lg shadow-lg">
         <img alt="Course 2 illustration" class="w-full h-40 object-cover mb-4 rounded" height="200" src="https://storage.googleapis.com/a1aa/image/w0MERh0QgDb7jG27A_K1L7OFgWjsqTlmg1SThgbUvA8.jpg" width="300"/>
         <h3 class="text-xl font-bold mb-2">
          Course Title 2
         </h3>
         <p class="text-gray-600 mb-4">
          Brief description of the course content and objectives.
         </p>
         <a class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition duration-300" href="#">
          Enroll Now
         </a>
        </div>
        <div class="bg-white p-6 rounded-lg shadow-lg">
         <img alt="Course 3 illustration" class="w-full h-40 object-cover mb-4 rounded" height="200" src="https://storage.googleapis.com/a1aa/image/lJPTL8pR09dgJqtvBUX8H4oW5DdMVDUd9rgQaNz15Io.jpg" width="300"/>
         <h3 class="text-xl font-bold mb-2">
          Course Title 3
         </h3>
         <p class="text-gray-600 mb-4">
          Brief description of the course content and objectives.
         </p>
         <a class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition duration-300" href="#">
          Enroll Now
         </a>
        </div>
       </div>
      </div>
      <div class="carousel-item">
       <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <div class="bg-white p-6 rounded-lg shadow-lg">
         <img alt="Course 4 illustration" class="w-full h-40 object-cover mb-4 rounded" height="200" src="https://storage.googleapis.com/a1aa/image/4.jpg" width="300"/>
         <h3 class="text-xl font-bold mb-2">
          Course Title 4
         </h3>
         <p class="text-gray-600 mb-4">
          Brief description of the course content and objectives.
         </p>
         <a class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition duration-300" href="#">
          Enroll Now
         </a>
        </div>
        <div class="bg-white p-6 rounded-lg shadow-lg">
         <img alt="Course 5 illustration" class="w-full h-40 object-cover mb-4 rounded" height="200" src="https://storage.googleapis.com/a1aa/image/5.jpg" width="300"/>
         <h3 class="text-xl font-bold mb-2">
          Course Title 5
         </h3>
         <p class="text-gray-600 mb-4">
          Brief description of the course content and objectives.
         </p>
         <a class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition duration-300" href="#">
          Enroll Now
         </a>
        </div>
        <div class="bg-white p-6 rounded-lg shadow-lg">
         <img alt="Course 6 illustration" class="w-full h-40 object-cover mb-4 rounded" height="200" src="https://storage.googleapis.com/a1aa/image/6.jpg" width="300"/>
         <h3 class="text-xl font-bold mb-2">
          Course Title 6
         </h3>
         <p class="text-gray-600 mb-4">
          Brief description of the course content and objectives.
         </p>
         <a class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition duration-300" href="#">
          Enroll Now
         </a>
        </div>
       </div>
      </div>
     </div>
     <button class="carousel-control-next" onclick="nextCourseSlide()">
      ❯
     </button>
    </div>
   </section>
   <section id="feedback" class="mt-12 text-center">
    <h2 class="text-3xl font-bold mb-4">
     Course Feedback
    </h2>
    <div class="carousel relative">
     <div class="carousel-inner">
      <div class="carousel-item">
       <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <div class="bg-white p-6 rounded-lg shadow-lg">
         <h3 class="text-xl font-bold mb-2">
          Course Title 1
         </h3>
         <p class="text-gray-600 mb-4">
          "This course was very informative and well-structured. The instructor was knowledgeable and engaging."
         </p>
         <p class="text-gray-600 mb-4">
          "I learned a lot from this course. The materials were easy to follow and the assignments were challenging but manageable."
         </p>
        </div>
        <div class="bg-white p-6 rounded-lg shadow-lg">
         <h3 class="text-xl font-bold mb-2">
          Course Title 2
         </h3>
         <p class="text-gray-600 mb-4">
          "The course content was up-to-date and relevant. The instructor provided great examples and real-world applications."
         </p>
         <p class="text-gray-600 mb-4">
          "I appreciated the interactive elements of this course. The quizzes and discussions helped reinforce the material."
         </p>
        </div>
        <div class="bg-white p-6 rounded-lg shadow-lg">
         <h3 class="text-xl font-bold mb-2">
          Course Title 3
         </h3>
         <p class="text-gray-600 mb-4">
          "This course exceeded my expectations. The instructor was very supportive and provided valuable feedback."
         </p>
         <p class="text-gray-600 mb-4">
          "I highly recommend this course to anyone looking to expand their knowledge in this field. The resources provided were excellent."
         </p>
        </div>
       </div>
      </div>
      <div class="carousel-item">
       <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <div class="bg-white p-6 rounded-lg shadow-lg">
         <h3 class="text-xl font-bold mb-2">
          Course Title 4
         </h3>
         <p class="text-gray-600 mb-4">
          "The course was well-organized and the instructor was very knowledgeable."
         </p>
         <p class="text-gray-600 mb-4">
          "I found the course content to be very relevant and up-to-date."
         </p>
        </div>
        <div class="bg-white p-6 rounded-lg shadow-lg">
         <h3 class="text-xl font-bold mb-2">
          Course Title 5
         </h3>
         <p class="text-gray-600 mb-4">
          "The instructor provided great examples and real-world applications."
         </p>
         <p class="text-gray-600 mb-4">
          "I appreciated the interactive elements of this course."
         </p>
        </div>
        <div class="bg-white p-6 rounded-lg shadow-lg">
         <h3 class="text-xl font-bold mb-2">
          Course Title 6
         </h3>
         <p class="text-gray-600 mb-4">
          "This course exceeded my expectations."
         </p>
         <p class="text-gray-600 mb-4">
          "The instructor was very supportive and provided valuable feedback."
         </p>
        </div>
       </div>
      </div>
     </div>
     <button class="carousel-control-next" onclick="nextFeedbackSlide()">
      ❯
     </button>
    </div>
   </section>
   <section class="mt-12 text-center">
    <h2 class="text-3xl font-bold mb-4">
     Manage Your Learning
    </h2>
    <div class="flex justify-center space-x-4">
     <a class="bg-yellow-500 text-white px-6 py-3 rounded-lg shadow-lg hover:bg-yellow-600 transition duration-300" href="dashboard.jsp">
      <i class="fas fa-tachometer-alt mr-2">
      </i>
      Course Dashboard
     </a>
     <a class="bg-purple-500 text-white px-6 py-3 rounded-lg shadow-lg hover:bg-purple-600 transition duration-300" href="feedback.jsp">
      <i class="fas fa-star mr-2">
      </i>
      Feedback System
     </a>
    </div>
   </section>
  </main>
  <footer class="bg-gray-800 text-white py-8">
    <div class="container mx-auto grid grid-cols-1 md:grid-cols-3 gap-8">
        <div>
            <h3 class="text-xl font-bold mb-4">About Us</h3>
            <p class="text-gray-400">We are dedicated to providing the best online learning experience for both instructors and students.</p>
        </div>
        <div>
            <h3 class="text-xl font-bold mb-4">Quick Links</h3>
            <ul class="text-gray-400">
                <li class="mb-2"><a class="hover:text-white" href="#">Home</a></li>
                <li class="mb-2"><a class="hover:text-white" href="#">Courses</a></li>
                <li class="mb-2"><a class="hover:text-white" href="#">About</a></li>
                <li class="mb-2"><a class="hover:text-white" href="#">Contact</a></li>
            </ul>
        </div>
        <div>
            <h3 class="text-xl font-bold mb-4">Contact Us</h3>
            <p class="text-gray-400 mb-2"><i class="fas fa-envelope mr-2"></i> info@pragnya.com</p>
            <p class="text-gray-400 mb-2"><i class="fas fa-phone mr-2"></i> +1 234 567 890</p>
            <p class="text-gray-400"><i class="fas fa-map-marker-alt mr-2"></i> 123 Pragnya Street, Education City, USA</p>
        </div>
    </div>
    <div class="container mx-auto text-center mt-8">
        <p>© 2023 Pragnya. All rights reserved.</p>
    </div>
</footer>
