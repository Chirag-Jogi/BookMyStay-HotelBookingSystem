<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Success</title>
<style>
    body {
        font-family: 'Helvetica Neue', Arial, sans-serif;
        background-color: #fff;
        color: #333;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    h1 {
        color: #2c3e50;
        margin-bottom: 20px;
        font-weight: bold;
    }
    h2 {
        color: #2c3e50;
        margin-bottom: 20px;
    }
    #buffering-message {
        font-size: 18px;
        color: #e74c3c;
        margin-top: 20px;
    }
   .loader {
        border: 16px solid #f3f3f3;
        border-radius: 50%;
        border-top: 16px solid #3498db;
        width: 120px;
        height: 120px;
        animation: spin 2s linear infinite;
        margin: 20px 0;
    }
    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }
    .container {
        height: 400px;
        width: 400px;
        background-color: #fff;
        padding: 30px;
        border-radius: 8px;
        text-align: center;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    .tick {
        font-size: 60px;
        color: green;
        margin-bottom: 20px;
    }
    .footer {
        margin-top: 50px;
        font-size: 14px;
        font-weight: bold;
    }
</style>
<script>
    function showPaymentSuccess() {
        document.getElementById('buffering-message').innerHTML = 'Your payment was successful!';
        document.getElementById('buffering-message').style.color = 'green';
        document.getElementById('loader').style.display = 'none';
        document.getElementById('tick').innerHTML = '&#10004;'; // Right tick
        document.getElementById('payment-success').innerHTML = 'Payment Successful';
        document.getElementById('payment-success').style.fontWeight = 'bold';
        document.getElementById('payment-processing').remove();
        document.getElementById('thank-you-message').innerHTML = 'Thank you for choosing "BookMyStay" for your upcoming stay.';
        document.getElementById('footer-message').innerHTML = 'Your room details will be sent to you in 24 hours via email.';
        
        // Redirect to homepage.jsp after 5 seconds
        setTimeout(function() {
            window.location.href = 'homepage.jsp';
        }, 3000);
    }
    
    function disableBackButton() {
        window.history.pushState(null, null, window.location.href);
        window.onpopstate = function () {
            window.history.pushState(null, null, window.location.href);
        };
    }
    
    function initBuffering() {
        setTimeout(showPaymentSuccess, 5000);
        disableBackButton();
    }
    
    window.onload = initBuffering;
</script>
</head>
<body>
    <div class="container">
        <h1 id="payment-processing">Payment Processing</h1>
        <div id="loader" class="loader"></div>
        <div id="buffering-message">
            Don't go back, otherwise the payment will fail.
        </div>
        <div class="tick" id="tick"></div>
        <h1 id="payment-success"></h1>
        <h2 id="thank-you-message"></h2>
    </div>
    <div class="footer" id="footer-message"></div>
</body>
</html>
