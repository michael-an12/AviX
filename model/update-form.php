<?php 

require_once "../config/db_connection.php";

if (isset($_POST['update'])){
    $AIRCRAFT_ID = $_POST['AIRCRAFT_ID'];
    $AIRCRAFT_CODE = $_POST['AIRCRAFT_CODE'];
    $AIRCRAFT_IMAGE = $_POST['AIRCRAFT_IMAGE'];
    $AIRCRAFT_NAME = $_POST['AIRCRAFT_NAME'];
    $PRICE = $_POST['PRICE'];
    $query = "UPDATE AIRCRAFT SET AIRCRAFT_CODE='$AIRCRAFT_CODE', AIRCRAFT_IMAGE= '$AIRCRAFT_IMAGE', AIRCRAFT_NAME='$AIRCRAFT_NAME', PRICE='$PRICE' WHERE AIRCRAFT_ID='$AIRCRAFT_ID' ";
    $result=mysqli_query($con, $query);
    
    if($result == true){
        //return to product page
        header("Location: ../model/update.php");
    }
    else{
        //echo error
        echo "Product could not be updated";
    }
    
}


?>


<!DOCTYPE html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>

<!--====form section start====-->
    <div class="user-detail">
        <h2>Update Aircraft Data</h2>
        <p id="msg"></p>
        <form id="updateForm" method="POST" action="update-form.php">
            <input type="hidden" name="AIRCRAFT_ID" id="Aircraft" value="<?php echo $_GET['id']; ?>">
            <label>Aircraft Code</label>
            <input type="text" placeholder="Enter Aircraft Code" name="AIRCRAFT_CODE" value="<?php echo $_GET['code']; ?>" required>
            <label>Image File Path</label>
            <input type="text" placeholder="Enter Image File Path" name="AIRCRAFT_IMAGE" value="<?php echo $_GET['image']; ?>" required>
            <label>Aircraft Name</label>
            <input type="text" placeholder="Enter Aircraft Name" name="AIRCRAFT_NAME" value="<?php echo $_GET['name']; ?>" required>
            <label>Price</label>
            <input type="text" placeholder="Enter Price" name="PRICE" value="<?php echo $_GET['price']; ?>" required>
            <button type="submit" name="update" form="updateForm" id="update">Update</button>
        </form>
        
    </div>

</body>
</html>


