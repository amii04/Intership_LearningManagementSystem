<%@ page session="true" %>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("INSTRUCTOR")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@ page session="true" %>
	<%
	    if (session.getAttribute("role") == null) {
	        response.sendRedirect("login.jsp");
	        return;
	    }
	
	    // Invalidate session on refresh
	    session.invalidate();
	%>

<%@ include file="navbardashboard.jsp" %>

<html lang="en">
 <head>
  <meta charset="utf-8"/>
  <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
  <title>
   Instructor Dashboard
  </title>
  <script src="https://cdn.tailwindcss.com">
  </script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
</style>
<script>

window.history.forward(); // Forces forward navigation after login
window.onload = function () {
    history.pushState(null, null, document.URL);
    window.addEventListener('popstate', function () {
        history.pushState(null, null, document.URL);
    });
};

/*
    function loadComponents() {
        // Load Navbar
       fetch("navbardashboard.html")
            .then(response => response.text())
            .then(data => {
                document.getElementById("navbar-container").innerHTML = data;
            })
            .catch(error => console.error("Error loading navbar:", error));
  
        // Load Footer
        fetch("footer.html")
            .then(response => response.text())
            .then(data => {
                document.getElementById("footer-container").innerHTML = data;
            })
            .catch(error => console.error("Error loading footer:", error));
    }
  
    window.onload = loadComponents;
    */
  </script>

</head>
<div id="navbar-container"></div>
 <body class="bg-gray-100">
  <header class="bg-white shadow">

  </header>
  <main class="container mx-auto p-4">
   <div class="bg-white p-6 rounded-lg shadow-lg">
    <h2 class="text-2xl font-bold mb-4">
     Instructor Dashboard
    </h2>
    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
     <div class="bg-gray-50 p-4 rounded-lg shadow">
      <h3 class="text-xl font-semibold mb-2">
       Add New Course
      </h3>
      <form>
       <div class="mb-4">
        <label class="block text-gray-700">
         Course Image
        </label>
        <input accept="image/*" class="w-full border border-gray-300 rounded-lg px-4 py-2" type="file"/>
       </div>
       <div class="mb-4">
        <label class="block text-gray-700">
         Course Title
        </label>
        <input class="w-full border border-gray-300 rounded-lg px-4 py-2" placeholder="Enter course title" type="text"/>
       </div>
       <div class="mb-4">
        <label class="block text-gray-700">
         Course Description
        </label>
        <textarea class="w-full border border-gray-300 rounded-lg px-4 py-2" placeholder="Enter course description"></textarea>
       </div>
       <button class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600">
        Add Course
       </button>
      </form>
     </div>
     <div class="bg-gray-50 p-4 rounded-lg shadow">
      <h3 class="text-xl font-semibold mb-2">
       Upload Materials
      </h3>
      <form>
       <div class="mb-4">
        <label class="block text-gray-700">
         Select Course
        </label>
        <select class="w-full border border-gray-300 rounded-lg px-4 py-2">
         <option>
          Course 1
         </option>
         <option>
          Course 2
         </option>
         <option>
          Course 3
         </option>
        </select>
       </div>
       <div class="mb-4">
        <label class="block text-gray-700">
         Upload PDF
        </label>
        <input accept=".pdf" class="w-full border border-gray-300 rounded-lg px-4 py-2" type="file"/>
       </div>
       <div class="mb-4">
        <label class="block text-gray-700">
         Upload Video
        </label>
        <input accept="video/*" class="w-full border border-gray-300 rounded-lg px-4 py-2" type="file"/>
       </div>
       <button class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600">
        Upload
       </button>
      </form>
     </div>
    </div>
   </div>
   <div class="bg-white p-6 rounded-lg shadow-lg mt-6">
    <h2 class="text-2xl font-bold mb-4">
     My Courses
    </h2>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
     <div class="bg-gray-50 p-4 rounded-lg shadow">
      <img alt="Placeholder image for Course 1" class="w-full h-32 object-cover mb-4" height="200" src="https://storage.googleapis.com/a1aa/image/ud4d14RfW6qCJoTcah7eYjQDiFAa0-JKN9iTMV4H5uQ.jpg" width="300"/>
      <h3 class="text-xl font-semibold mb-2">
       Course 1
      </h3>
      <p class="text-gray-700 mb-4">
       Description of Course 1
      </p>
      <div class="flex items-center mb-4">
       <span class="text-yellow-500">
        <i class="fas fa-star">
        </i>
        <i class="fas fa-star">
        </i>
        <i class="fas fa-star">
        </i>
        <i class="fas fa-star">
        </i>
        <i class="fas fa-star-half-alt">
        </i>
       </span>
       <span class="ml-2 text-gray-600">
        4.5/5
       </span>
      </div>
      <button class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600">
       Delete
      </button>
     </div>
     <div class="bg-gray-50 p-4 rounded-lg shadow">
      <img alt="Placeholder image for Course 2" class="w-full h-32 object-cover mb-4" height="200" src="https://storage.googleapis.com/a1aa/image/z8uMT5IKX7RwvHo4nTazXdn-iBriHXwDTnIWryNuDHU.jpg" width="300"/>
      <h3 class="text-xl font-semibold mb-2">
       Course 2
      </h3>
      <p class="text-gray-700 mb-4">
       Description of Course 2
      </p>
      <div class="flex items-center mb-4">
       <span class="text-yellow-500">
        <i class="fas fa-star">
        </i>
        <i class="fas fa-star">
        </i>
        <i class="fas fa-star">
        </i>
        <i class="fas fa-star">
        </i>
        <i class="fas fa-star">
        </i>
       </span>
       <span class="ml-2 text-gray-600">
        5/5
       </span>
      </div>
      <button class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600">
       Delete
      </button>
     </div>
     <div class="bg-gray-50 p-4 rounded-lg shadow">
      <img alt="Placeholder image for Course 3" class="w-full h-32 object-cover mb-4" height="200" src="https://storage.googleapis.com/a1aa/image/_Jx1qhhlbK3gxbuq4tSINIcSzfSYWZLp0ci1TB2AxBY.jpg" width="300"/>
      <h3 class="text-xl font-semibold mb-2">
       Course 3
      </h3>
      <p class="text-gray-700 mb-4">
       Description of Course 3
      </p>
      <div class="flex items-center mb-4">
       <span class="text-yellow-500">
        <i class="fas fa-star">
        </i>
        <i class="fas fa-star">
        </i>
        <i class="fas fa-star">
        </i>
        <i class="fas fa-star">
        </i>
        <i class="fas fa-star-half-alt">
        </i>
       </span>
       <span class="ml-2 text-gray-600">
        4.5/5
       </span>
      </div>
      <button class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600">
       Delete
      </button>
     </div>
     <div class="bg-gray-50 p-4 rounded-lg shadow">
      <img alt="Placeholder image for Course 4" class="w-full h-32 object-cover mb-4" height="200" src="https://storage.googleapis.com/a1aa/image/puAkkvsGIxWM3r08wSwW6HF_ywZ2zTWXjtgMn-HR6t4.jpg" width="300"/>
      <h3 class="text-xl font-semibold mb-2">
       Course 4
      </h3>
      <p class="text-gray-700 mb-4">
       Description of Course 4
      </p>
      <div class="flex items-center mb-4">
       <span class="text-yellow-500">
        <i class="fas fa-star">
        </i>
        <i class="fas fa-star">
        </i>
        <i class="fas fa-star">
        </i>
        <i class="fas fa-star">
        </i>
        <i class="fas fa-star">
        </i>
       </span>
       <span class="ml-2 text-gray-600">
        5/5
       </span>
      </div>
      <button class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600">
       Delete
      </button>
     </div>
     <div class="bg-gray-50 p-4 rounded-lg shadow">
      <img alt="Placeholder image for Course 5" class="w-full h-32 object-cover mb-4" height="200" src="https://storage.googleapis.com/a1aa/image/imc1B7kYH0tcfKqnmV40KQ-v5uHuhryjxrlhFKeuNmw.jpg" width="300"/>
      <h3 class="text-xl font-semibold mb-2">
       Course 5
      </h3>
      <p class="text-gray-700 mb-4">
       Description of Course 5
      </p>
      <div class="flex items-center mb-4">
       <span class="text-yellow-500">
        <i class="fas fa-star">
        </i>
        <i class="fas fa-star">
        </i>
        <i class="fas fa-star">
        </i>
        <i class="fas fa-star">
        </i>
        <i class="fas fa-star-half-alt">
        </i>
       </span>
       <span class="ml-2 text-gray-600">
        4.5/5
       </span>
      </div>
      <button class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600">
       Delete
      </button>
     </div>
     <div class="bg-gray-50 p-4 rounded-lg shadow">
      <img alt="Placeholder image for Course 6" class="w-full h-32 object-cover mb-4" height="200" src="https://storage.googleapis.com/a1aa/image/LYv2BCH0-cJhoQpaUkXjyJgAFaTocuzj4NLZC-UMKoA.jpg" width="300"/>
      <h3 class="text-xl font-semibold mb-2">
       Course 6
      </h3>
      <p class="text-gray-700 mb-4">
       Description of Course 6
      </p>
      <div class="flex items-center mb-4">
       <span class="text-yellow-500">
        <i class="fas fa-star">
        </i>
        <i class="fas fa-star">
        </i>
        <i class="fas fa-star">
        </i>
        <i class="fas fa-star">
        </i>
        <i class="fas fa-star">
        </i>
       </span>
       <span class="ml-2 text-gray-600">
        5/5
       </span>
      </div>
      <button class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600">
       Delete
      </button>
     </div>
    </div>
   </div>
  </main>

<%@ include file="footer.jsp" %>
  <script>
   document.getElementById('mobile-menu-button').addEventListener('click', function() {
            var menu = document.getElementById('mobile-menu-dropdown');
            if (menu.classList.contains('hidden')) {
                menu.classList.remove('hidden');
            } else {
                menu.classList.add('hidden');
            }
        });
  </script>
 </body>

</html>
