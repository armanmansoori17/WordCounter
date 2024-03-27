<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Word Counter</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image:url(https://images.unsplash.com/photo-1534082753658-1dcb40af5719?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D);
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        #container {
            text-align: center;
            width: 600px;
            height:400px;
            margin: auto;
            padding: 50px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }

        h1 {
        margin-top:0;
            color: #007958;
        }

        #inputField {
            width: 100%;
            height:208px;
            padding: 10px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        #outputField {
            width:80%;
            height: 60px;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        #countButton {
            padding: 10px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        #countButton:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
 <div id="container">
    <h1>Word Counter</h1>
    <form id="wordCounterForm" action="WordCounterServlet" method="post">
        <textarea name="sentence" id="inputField" placeholder="Enter text..." rows="4"></textarea><br>
        <textarea id="outputField" name="wordCountResult" readonly></textarea><br>
        <button type="button" onclick="countWords()" id="countButton">Count Words</button>
    </form>
</div>


    <script>
    function countWords() {
        var inputText = document.getElementById("inputField").value;

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "WordCounterServlet", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                document.getElementById("outputField").value = "Word Count: " + xhr.responseText;
            }
        };
        xhr.send("sentence=" + encodeURIComponent(inputText));
    }
</script>
</body>
</html>
