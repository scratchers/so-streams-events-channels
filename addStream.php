<form method="POST">
	<input type="hidden" name="addStreamsEvents"/>
	<input type="hidden" name="addStreamsChannels"/>

	<label for="stream">Stream</label>
	<input type="text" name="stream"/>

	<label for="event">Event or Channel ID</label>
	<input type="text" name="event"/>

	<input type="submit" value="Submit"/>
</form>

<?php

// returns an instance of PDO
// https://github.com/jpuck/qdbp
$db = require __DIR__.'/streams_Dtm905_A.pdo.php';

if(isset($_POST['addStreamsEvents'])){
	extract($_POST);
	$statement = $db->prepare("INSERT INTO streams (link) VALUES (?)");
	$statement->bindParam(1,$stream);
	$statement->execute();

	$id=$db->lastInsertId();

	$statement_join = $db->prepare("INSERT INTO all_streams (event_id,stream_id,channel_id) VALUES (?,?, NULL)");
	$statement_join->bindParam(1,$event);
	$statement_join->bindParam(2,$id);
	$statement_join->execute();
}

if(isset($_POST['addStreamsChannels'])){
	extract($_POST);
	$statement = $db->prepare("INSERT INTO streams (link) VALUES (?)");
	$statement->bindParam(1,$stream);
	$statement->execute();

	$id=$db->lastInsertId();

	$statement_join = $db->prepare("INSERT INTO all_streams (channel_id, stream_id, event_id) VALUES (?,?,NULL)");
	$statement_join->bindParam(1,$event);
	$statement_join->bindParam(2,$id);
	$statement_join->execute();
}
