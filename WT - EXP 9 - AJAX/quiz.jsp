<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Online Examination Quiz</title>
    <script>
        let timerDuration = 30; // Set timer for 30 seconds
        let interval;

        function startTimer() {
            let countdownDisplay = document.getElementById("timer");
            let submitButton = document.getElementById("submitButton");
            submitButton.disabled = true; // Disable the submit button initially

            interval = setInterval(() => {
                if (timerDuration > 0) {
                    timerDuration--;
                    countdownDisplay.innerText = "Time Left: " + timerDuration + "s";
                } else {
                    clearInterval(interval);
                    submitButton.disabled = false; // Enable the submit button when time is up
                }
            }, 1000);
        }

        function submitQuiz() {
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "submitQuiz.jsp", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            // Get answers and send to server
            let answers = [];
            answers.push(document.querySelector('input[name="q1"]:checked').value);
            answers.push(document.querySelector('input[name="q2"]:checked').value);
            answers.push(document.querySelector('input[name="q3"]:checked').value);

            xhr.send("answers=" + JSON.stringify(answers));

            xhr.onload = function() {
                if (xhr.status === 200) {
                    alert("Quiz submitted! " + xhr.responseText);
                }
            };
        }

        window.onload = startTimer;
    </script>
</head>
<body>
    <h2>Online Examination Quiz</h2>

    <!-- Timer display -->
    <div id="timer" style="color: red; font-weight: bold;">Time Left: 30s</div>

    <!-- Quiz Questions -->
    <form id="quizForm">
        <p>1. What is the capital of France?</p>
        <label><input type="radio" name="q1" value="Paris"> Paris</label><br>
        <label><input type="radio" name="q1" value="London"> London</label><br>
        <label><input type="radio" name="q1" value="Rome"> Rome</label><br><br>

        <p>2. What is 2 + 2?</p>
        <label><input type="radio" name="q2" value="3"> 3</label><br>
        <label><input type="radio" name="q2" value="4"> 4</label><br>
        <label><input type="radio" name="q2" value="5"> 5</label><br><br>

        <p>3. Who wrote 'Hamlet'?</p>
        <label><input type="radio" name="q3" value="Shakespeare"> Shakespeare</label><br>
        <label><input type="radio" name="q3" value="Hemingway"> Hemingway</label><br>
        <label><input type="radio" name="q3" value="Austen"> Austen</label><br><br>

        <!-- Submit Button -->
        <button type="button" id="submitButton" onclick="submitQuiz()">Submit Quiz</button>
    </form>
</body>
</html>
