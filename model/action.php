<?php
	session_start();
	require '../config/db_connection.php';

	if (isset($_POST['user_id'])) {
		$_SESSION['user_id'] = $_POST['user_id'];
	}
	$user_email_id = $_SESSION['user_id'];

	// Add products into the cart table
	if (isset($_POST['pid'])) {
	  $pid = $_POST['pid'];
	  $pname = $_POST['pname'];
	  $pprice = $_POST['pprice'];
	  $pimage = $_POST['pimage'];
	  $pcode = $_POST['pcode'];
	  $pqty = $_POST['pqty'];
	  $user_id = $_POST['user_id'];
	  $total_price = $pprice * $pqty;

	  

	  $stmt = $con->prepare('SELECT AIRCRAFT_CODE FROM cart WHERE AIRCRAFT_CODE=?');
	  $stmt->bind_param('s',$pcode);
	  $stmt->execute();
	  $res = $stmt->get_result();
	  $r = $res->fetch_assoc();
	  $code = $r['product_code'] ?? '';

	  if (!$code) {
	    $query = $con->prepare('INSERT INTO user_collections (user_email_id,AIRCRAFT_ID,AIRCRAFT_NAME,QUANTITY,TOTAL_PRICE) VALUES (?,?,?,?,?)');
	    $query->bind_param('sisii',$user_id,$pid,$pname,$pqty,$total_price);
	    $query->execute();

	    echo '<div class="alert alert-success alert-dismissible mt-2">
						  <button type="button" class="close" data-dismiss="alert">&times;</button>
						  <strong>Item added to your cart!</strong>
						</div>';
	  } else {
	    echo '<div class="alert alert-danger alert-dismissible mt-2">
						  <button type="button" class="close" data-dismiss="alert">&times;</button>
						  <strong>Item already added to your cart!</strong>
						</div>';
	  }
	}

	// Get no.of items available in the cart table
	if (isset($_GET['cartItem']) && isset($_GET['cartItem']) == 'cart_item') {
	  $stmt = $con->prepare("SELECT * FROM user_collections WHERE user_email_id = '$user_email_id'");
	  $stmt->execute();
	  $stmt->store_result();
	  $rows = $stmt->num_rows;

	  echo $rows;
	}

	// Remove single items from cart
	if (isset($_GET['remove'])) {
	  $id = $_GET['remove'];

	  $stmt = $con->prepare('DELETE FROM user_collections WHERE AIRCRAFT_ID=?');
	  $stmt->bind_param('i',$id);
	  $stmt->execute();

	  $_SESSION['showAlert'] = 'block';
	  $_SESSION['message'] = 'Item removed from the cart!';
	  header('location:cart.php');
	}

	// Remove all items at once from cart
	if (isset($_GET['clear'])) {
	  $stmt = $con->prepare("DELETE FROM user_collections WHERE user_email_id = '$user_email_id'");
	  $stmt->execute();
	  $_SESSION['showAlert'] = 'block';
	  $_SESSION['message'] = 'All Item removed from the cart!';
	  header('location:cart.php');
	}

	// Set total price of the product in the cart table
	if (isset($_POST['qty'])) {
	  $qty = $_POST['qty'];
	  $pid = $_POST['pid'];
	  $pprice = $_POST['pprice'];

	  $tprice = $qty * $pprice;

	  $stmt = $con->prepare('UPDATE user_collections SET QUANTITY=?, TOTAL_PRICE=? WHERE AIRCRAFT_ID=?');
	  $stmt->bind_param('isi',$qty,$tprice,$pid);
	  $stmt->execute();
	}

	
?>