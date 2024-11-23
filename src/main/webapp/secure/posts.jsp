<%--
  Created by IntelliJ IDEA.
  User: ameda
  Date: 23/11/2024
  Time: 08:10
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Posts</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #4CAF50;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 24px;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }

        .post-card {
            background: white;
            margin: 20px 0;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .post-card h3 {
            color: #333;
            font-size: 20px;
            margin-bottom: 10px;
        }

        .post-card .post-text {
            color: #666;
            font-size: 16px;
            margin-bottom: 15px;
        }

        .post-card .post-meta {
            font-size: 14px;
            color: #999;
            margin-bottom: 10px;
        }

        .post-card .privacy {
            font-weight: bold;
            text-transform: uppercase;
            padding: 5px 10px;
            border-radius: 20px;
        }

        .public {
            background-color: #4CAF50;
            color: white;
        }

        .private {
            background-color: #FF6347;
            color: white;
        }

        .media {
            max-width: 100%;
            margin-top: 15px;
            border-radius: 5px;
        }

        footer {
            text-align: center;
            padding: 10px;
            background-color: #333;
            color: white;
        }
    </style>
</head>
<body>

<header>
    SmartFeed - View All Posts
</header>

<div class="container">
    <c:if test="${not empty posts}">
        <c:forEach var="post" items="${posts}">
            <div class="post-card">
                <h3>${post.postText}</h3>
                <p class="post-text">${post.postText}</p>

                <!-- Show media if available -->
                <c:if test="${not empty post.media}">
                    <img src="${post.media}" alt="Media" class="media">
                </c:if>

                <!-- Post metadata -->
                <div class="post-meta">
                    Submitted on: ${post.submitted} | User ID: ${post.userAccountId}
                </div>

                <!-- Privacy setting -->
                <span class="privacy ${post.privacySetting == 'public' ? 'public' : 'private'}">
                        ${post.privacySetting == 'public' ? 'Public' : 'Private'}
                </span>
            </div>
        </c:forEach>
    </c:if>

    <!-- If no posts exist -->
    <c:if test="${empty posts}">
        <p>No posts available.</p>
    </c:if>
</div>

<footer>
    &copy; 2024 SmartFeed - All Rights Reserved.
</footer>

</body>
</html>