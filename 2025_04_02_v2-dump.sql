-- MySQL dump 10.13  Distrib 8.0.40, for macos15.2 (arm64)
--
-- Host: 127.0.0.1    Database: crochetStore
-- ------------------------------------------------------
-- Server version	9.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Small stuffed toys or creatures','amigurumi'),(2,'Color work pieces, mostly designs based on images','tapestry'),(3,'Seasonal makes (Christmas, autumn, etc.)','festive'),(4,'Scarves, bags and small motifs','accessories'),(5,'Wearable items','clothes'),(6,'To put on your walls or shelves','decor');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `user_data_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsv9amdvldjvik2wr6g8q9ov4l` (`user_data_id`),
  CONSTRAINT `FKsv9amdvldjvik2wr6g8q9ov4l` FOREIGN KEY (`user_data_id`) REFERENCES `user_data` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,'updated note1',1),(2,'note2 for pattern1',1),(3,'note for pattern2',2);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pattern_category`
--

DROP TABLE IF EXISTS `pattern_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pattern_category` (
  `pattern_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  KEY `FKbqfxyi7astus7jcmff11ogk7a` (`category_id`),
  KEY `FKcc52cj83fct9rcn5tp6f02m5w` (`pattern_id`),
  CONSTRAINT `FKbqfxyi7astus7jcmff11ogk7a` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `FKcc52cj83fct9rcn5tp6f02m5w` FOREIGN KEY (`pattern_id`) REFERENCES `patterns` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pattern_category`
--

LOCK TABLES `pattern_category` WRITE;
/*!40000 ALTER TABLE `pattern_category` DISABLE KEYS */;
INSERT INTO `pattern_category` VALUES (1,3),(1,6),(2,3),(2,6),(3,3),(3,4),(4,2),(4,6),(5,5),(6,5),(7,4),(8,1),(9,1),(9,3),(10,1);
/*!40000 ALTER TABLE `pattern_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patterns`
--

DROP TABLE IF EXISTS `patterns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patterns` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `difficulty` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `yarn_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKf34ujvcowkuhghata9bxloor3` (`yarn_id`),
  CONSTRAINT `FKf34ujvcowkuhghata9bxloor3` FOREIGN KEY (`yarn_id`) REFERENCES `yarns` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patterns`
--

LOCK TABLES `patterns` WRITE;
/*!40000 ALTER TABLE `patterns` DISABLE KEYS */;
INSERT INTO `patterns` VALUES (1,'Chain (ch) 11.\n1st row: (Right side [RS]). Using pointer finger and thumb: (Pull working yarn up through back loop of first ch and loop on your finger – Slip stitch through back loop (Sl stbl) made) in 2nd ch from last loop. 1 sl stbl in each ch to end of chain. Turn. 10 slip stitches (sl sts).\n2nd row: Ch 1. 1 sl stbl in each stitch (st) across. Turn.\nRepeat (rep) 2nd row until work from beginning (beg) measures approx. 26\" [66 cm]. Do not fasten off.\nJoining row: Fold work in half, Wrong side (WS) together (tog), so first and last rows meet. Working through both thicknesses, in back loops of last row and remaining (rem) loops of foundation ch: Ch 1. 1 sl st in each st across. Fasten off.\nWeave yarn through sts at end of rows on one edge of Pumpkin, pull tight to close bottom and secure on WS.\nStuff Pumpkin.\nWeave yarn through sts at end of rows on rem (top) edge of Pumpkin.\nInsert 4\" [10 cm] long stick in opening, leaving 3\" [7.5 cm] outside for stem. Pull yarn tight to close opening around stick and tie off. \nPull yarn tails inside Pumpkin.','beginner','Finger Crochet Pumpkin',8),(2,'With A, ch 6; join with a slip st to form a ring.\nRound 1: Ch 1, 12 sc in ring; join with a slip st in first sc – 12 sc.\nRound 2: Ch 1, sc in first st, [ch 3, sc in next sc] 11 times; hdc in first sc to join and form last loop – 12 ch-3 spaces.\nRound 3: Ch 1, sc over hdc, *(2 dc, ch 3, 2 dc) in next space**, sc in next space; repeat from * around, ending last repeat at **; join with a slip st in first sc.\nRound 4: Ch 4, slip st in same st as joining, *ch 2, (sc, ch 3, sc, ch 5, sc, ch 3, sc) in next ch-3 space, ch 2**, (slip st, ch 4, slip st) in next sc; repeat from * around, ending last repeat at **; join with a slip st in slip st of last round. Fasten off.\nWeave in ends. \nAdd hanging loop of your choice.','beginner','Snowflake Ornament',5),(3,'Make a slip knot and place it on the hook.\nChain (ch) 3. Slip stitch in first chain to form a ring.\n1st rnd: Ch 3 (counts as double crochet [dc]). Work 2 dc in ring.\n2nd rnd: 3 half double crochet (hdc) in ring.\nFasten off and cut yarn. To permanently fasten off the yarn, cut the yarn leaving a long tail. Pull end of yarn through loop on the hook and pull gently to tighten.\nTie the beginning and end tails together (tog) on back of Heart.\nWeave in all yarn tails.','beginner','Crochet Sweet Hearts',4),(4,'With MC, ch 59.\n1st row: 1 sc in 2nd ch from hook. 1 sc in each ch to end of chain. Turn. 58 sc.\n2nd row: Ch 1. 1 sc in each sc across. Turn.\nZig-Zag Mosaic Pat 1st row: (RS). With MC, ch 1. 1 sc in each sc across. Turn. 58 sc.\n2nd row: Ch 1. 1 sc in each sc across. Join A. Turn.\n3rd row: With A, ch 1. 1 sc in each of first 3 sc. *(Ch 2. Skip next sc. 1 sc in next sc) twice. 1 sc in each of next 2 sc. Rep from * to last sc. 1 sc in last sc. Turn.\n4th row: Ch 1. 1 sc in first sc. *1 sc in each of next 3 sc. Ch 2. Skip next 2 ch. 1 sc in next sc. Ch 2. Skip next 2 ch. Rep from * to last 3 sc. 1 sc in each of last 3 sc. Join MC. Turn.\n5th row: With MC, ch 1. 1 sc in each of first 2 sc. *Ch 2. Skip next sc. Working in front of A, Mosaic Dc. Skip next 2 ch. 1 sc in next sc. Working in front of A, Mosaic Dc. Skip next 2 ch. Ch 2. Skip next sc. 1 sc in next sc. Rep from * to last 2 sc. 1 sc in each of last 2 sc. Turn.\n6th row: Ch 1. 1 sc in each of first 2 sc. *1 sc in next sc. Ch 2. Skip next 2 ch. 1 sc in each of next 3 sts. Ch 2. Skip next 2 ch. Rep from * to last 2 sc. 1 sc in each of last 2 sc. Join A. Turn.\n7th row: With A, ch 1. 1 sc in first sc. Ch 2. Skip next sc. *Working in front of MC, Mosaic Dc. Skip next 2 ch. 1 sc in each of next 3 sc. Working in front of MC, Mosaic Dc. Skip next 2 ch. Ch 2. Skip next sc. Rep from * to last 2 sc. 1 sc in each of last 2 sc. Turn.\n8th row: Ch 1. 1 sc in each of first 2 sc. *Ch 2. Skip next 2 ch. 1 sc in each of next 5 sts. Rep from * to last ch 2. Ch 2. Skip next 2 ch. 1 sc in last sc. Join MC. Turn.\n9th row: With MC, ch 1. 1 sc in first sc. Working in front of A, Mosaic Dc. Skip next 2 ch. *1 sc in each of next 2 sc. Ch 2. Skip next sc. 1 sc in each of next 2 sc. Working in front of A, Mosaic Dc. Skip next 2 ch. Rep from * to last 2 sc. 1 sc in each of last 2 sc. Turn.\n10th row: Ch 1. 1 sc in each of first 5 sc. Ch 2. Skip next 2 ch. *1 sc in each of next 5 sc. Ch 2. Skip next 2 ch. Rep from * to last 4 sts. 1 sc in each of last 4 sts. Join A. Turn.\n11th row: With A, ch 1. 1 sc in each of first 3 sc. *Ch 2. Skip next sc. Working in front of MC, Mosaic Dc. Skip next 2 ch. Ch 2. Skip next sc. 1 sc in each of next 3 sc. Rep from * to last sc. 1 sc in last sc. Turn.\n12th row: Ch 1. 1 sc in first sc. *1 sc in each of next 3 sc. Ch 2. Skip next 2 ch. 1 sc in next st. Ch 2. Skip next 2 ch. Rep from * to last 3 sc. 1 sc in each of last 3 sc. Join MC. Turn.\nRep 5th to 12th rows 4 times more, ending on a 12th row.\nNext row: With MC, ch 1. 1 sc in each of first 3 sc. *Working in front of A, Mosaic Dc. Skip next 2 ch. 1 sc in next sc. Working in front of A, Mosaic Dc. Skip next 2 ch. 1 sc in each of next 3 sc. Rep from * to last sc. 1 sc in last sc. Turn. Break A.\nNext 3 rows: With MC, ch 1. 1 sc in each st across. Turn.\nFasten off.','intermediate','Mosaic Crochet Placemat',5),(5,'First Motif: Ch 5; join with slip st in first ch to form a ring.\nRound 1 (Right Side): Ch 1, 8 sc in ring; join with slip st in first sc—8 sc.\nRound 2: Ch 3, dc in same sc as joining, ch 1, [2 dc in next sc, ch 1] 7 times; join with slip st in top of beginning ch—16 dc, and 8 ch-1 spaces.\nRound 3: Slip st in next dc, ch 1, [2 sc in next ch-1 space, (3 dc, ch 3, 3 dc) in next ch-1 space] 4 times; join with slip st in first sc—24 dc, 8 sc, and 4 ch-3 spaces.\nRound 4: Ch 4 (counts as tr), tr in same sc as joining, ch 7, 2 tr in next sc, ch 3, sc in next ch-3 space, *ch 3, 2 tr in next sc, ch 7, 2 tr in next sc, ch 3, sc in next ch-3 space; repeat from * around, ch 3; join with slip st in top of beginning ch—16 tr, 4 sc, 8 ch-3 spaces, and 4 ch-7 spaces. Fasten off.\nSecond and all remaining Motifs: Work same as first motif to Round 4. Refer to assembly diagram for placement of motif. Identify the neighboring motifs to which this motif should be joined. Take care to join motifs across side and sleeve edges.\nRound 4 (joining round): Ch 4, tr in same sc as joining, hold current motif and neighboring motif with Wrong Sides  together and sts matching, ch 3, sc in corresponding ch-7 space of neighboring motif, ch 3 (corner-join made), 2 tr in next sc, *ch 1, sc in next ch-3 space of neighboring motif, ch 1, sc in next ch-3 space (side-join completed), ch 1, sc in next ch-3 space of neighboring motif, ch 1, 2 tr in next sc, ch 3, sc in next ch-7 space of neighboring motif, ch 3 (corner-join made), 2 tr in next sc;\nRepeat from * until all remaining neighboring motifs (if any) are joined, ch 3, sc in next ch-3 space, **ch 3, 2 tr in next sc, ch 7, 2 tr in next sc, ch 3, sc in next ch-3 space;\nRepeat from ** around, ch 3; join with slip st in top of beginning ch.\nFasten off and weave in ends. Repeat until all motifs have been made and joined.\nEdging: With Right Side facing, draw up a loop of thread in any corner-join on lower edge.\nRound 1: Ch 1, *sc in joining sc, 3 sc in next ch-3 space, sc in next 2 tr, 3 sc in next ch-3 space, sc in next sc, 3 sc in next ch-3 space, sc in next 2 tr, 3 sc in next ch-3 space; repeat from * around lower edge; join with slip st in first sc.\nRound 2: Ch 1, sc in first sc, skip next 2 sc, (2 dc, ch 2, 2 dc) in next sc, *skip next 2 sc, sc in next sc, skip next 2 sc, (2 dc, ch 2, 2 dc) in next sc; repeat from * around to last 2 sc, skip last 2 sc; join with slip st in first sc. Fasten off.\nRepeat edging around neck edge, and both sleeve edges.\nWeave in ends.','experienced','Lacy Cropped Top',1),(6,'FRONT & BACK (make 2 pieces alike): With A, beg using magic loop method demonstrated here.\n1st row: (RS). Ch 2. (3 dc. Ch 2. 3 dc) all in ring. Turn.\n2nd row: Ch 2. 3 dc in first dc. Ch 1. (3 dc. Ch 2. 3 dc) in ch-2 sp. Ch 1. 3 dc in last dc. Turn.\n3rd row: Ch 2. 3 dc in first dc. Ch 1. 3 dc in next ch-1 sp. Ch 1. (3 dc. Ch 2. 3 dc) in ch-2 sp. Ch 1. 3 dc in next ch-1 sp. Ch 1. 3 dc in last dc. Turn.\n4th row: Ch 2. 3 dc in first dc. Ch 1. *3 dc in next ch-1 sp. Ch 1. Rep from * to center ch-2 sp. (3 dc. Ch 2. 3 dc) in ch-2 sp. Ch 1. **3 dc in next ch-1 sp. Ch 1. Rep from ** to end of row. 3 dc in last dc. Turn.\nFirst 4 rows of Stripe Pat are now complete.\nKeeping cont of Stripe Pat, rep 4th row until work across bottom edge measures approx 19 (21-23-25-28- 31)\" [48.5 (53.5-58.5-63.5-71-79) cm] wide, ending on a WS row.\nStraight Side Shaping: Next row: (RS). Ch 3 (counts as dc). Skip next 3 dc. *3 dc in next ch-1 sp. Ch 1. Skip next 3 dc. Rep from * to ch-2 sp. (3 dc. Ch 2. 3 dc) in ch-2 sp. **Ch 1. Skip next 3 dc. 3 dc in next ch-1 sp. Rep from ** to last 3 dc and ch-2. 1 dc in last dc. Turn.\nNext row: Ch 3 (counts as dc). Skip next 3 dc. *3 dc in next ch-1 sp. Ch 1. Skip next 3 dc. Rep from * to ch-2 sp. (3 dc. Ch 2. 3 dc) in ch-2 sp. **Ch 1. Skip next 3 dc. 3 dc in next ch-1 sp. \nRep from ** to last dc. 1 dc in last dc (top of ch-3). Turn.\nRep last row until work measures approx 21 (21-22-22-23-23)\" [53.5 (53.5-56-56-58.5-58.5) cm] long from magic loop in foundation row to ch-2 point of last row, ending on a WS row. Do not fasten off.\nRight Side Shaping: Next row: (RS). Ch 3. Skip next 3 dc. *3 dc in next ch-1 sp. Ch 1. Skip next 3 dc.\nRep from * to ch-2 sp. 1 dc in ch-2 sp.\nTurn. Leave rem sts unworked.\nNext row: (WS). Ch 3. Skip next 3 dc. 3 dc in next ch-1 sp. *Ch 1. Skip next 3 dc. 3 dc in next ch-1 sp.\nRep from * to last dc. 1 dc in last dc. Turn.\nRep last row until one ch-1 sp rem.\nNext row: Ch 3. Skip next 3 dc. 1 dc in ch-1 sp. 1 dc in last dc. Fasten off.\nLeft Side Shaping: Keeping cont of Stripe Pat to match Right Side Shaping, join appropriate yarn with sl st to ch-2 sp.\nNext row: (RS). Ch 3. Skip next 3 dc. *3 dc in next ch-1 sp. Ch 1. Skip next 3 dc. Rep from * to last dc. 1 dc in last dc. Turn.\nRep last row until one ch-1 sp rem.\nNext row: Ch 3. Skip next 3 dc. 1 dc in ch-1 sp. 1 dc in last dc. Fasten off.\nFINISHING: With RS facing tog, sew side seams of Skirt.\nWaistband: With RS facing, join A with sl st at side seam.\nSet-up rnd: Work 1 rnd of sc evenly around top edge of Skirt. Join with sl st to first sc.\nForm Waistband Casing as follows:\n1st rnd: Ch 2. Working in front loops only, 1 dc in each sc around. Join with sl st to first dc.\n2nd rnd: Ch 2. 1 dc in each st around. Join with sl st to first dc.\n3rd rnd: Ch 2. Working in front loops only, 1 dc in each st around. Join with sl st to first dc.\n4th rnd: As 2nd rnd. Fasten off. \nFold Waistband between 3rd and 4th rnds, ensuring sts are aligned.\nWith WS facing, join A with sl st to any unworked loop from sts of set-up rnd.\nCh 1. Working up through unworked loops of set-up rnd, and through both loops of sts from 4th rnd, sl st rows tog around top of Skirt until approx 2\" [5 cm] of waistband remains open. \nPull up a long loop and leave yarn attached until elastic is inserted.\nCut elastic to fit waist measurement plus 1\" [2.5 cm]. Insert elastic into waistband. \nOverlap ends of elastic and sew securely. Sl st rem sts closed to secure elastic. Join with sl st to first sl st. \nFasten off.\nFringe: Cut strands of of A and B 12\" [30.5 cm] long. \nHolding 4 strands of same shade tog, and matching shade to dc being worked into, work fringe into top of each dc around bottom edge of Skirt. \nTrim fringe evenly.','intermediate','Chevron Crochet Granny Skirt',3),(7,'HAT: Ch 56 (64, 68) sts; join with a sl st to first ch, being sure ch is not twisted.\nRnd 1: Ch 1, sc in each ch around; join with a sl st in first sc – 56 (64, 68) sts.\nRnd 2: Ch 3, skip first sc, dc in next sc and in each sc around; join in top of ch-3.\nRnd 3: Ch 1, sc in same st as joining and in each dc around; join.\nRep Rnds 2 and 3 until 5½ (6, 6½)” from beg.\nShape Top: Ch 1, [dec, sc in next 9 (11, 12) sts, dec, sc in next sc, place marker] 4 times; do not join at end of rnd.\nNext Rnd: [Dec, sc to 3 sts before next marker, dec, sc in next st] 4 times. Rep last rnd 3 (4, 4) more times – 16 (16, 20) sts.\nWork 1 rnd even in sc. Fasten off.\nWeave yarn end through rem sts; draw up tightly and secure.\nMake a 2” pom pom and attach at top of hat.\nSCARF: Ch 19.\nRow 1 (Wrong Side): Dc in 4th ch from hook and in each ch across; turn – 17 sts.\nRows 2 and 3: Ch 2, skip first st; yo, insert hook from front to back to front around the post of the next st, yo and draw lp through, [yo and draw through 2 lps] twice – fpdc made; work 2 more fpdc; yo, insert hook from back to front to back around the post of the next st, yo and draw lp through, [yo and draw through 2 lps] twice – bpdc made; work 2 more bpdc, 3 fpdc, 3 bpdc, 3 fpdc, hdc in top of beg ch; turn.\nRows 4 and 5: Ch 2, skip first st, 3 bpdc, [3 fpdc, 3 bpdc] twice, hdc in top of beg ch; turn.\nRep Rows 2-5 until 50” from beg. Fasten off.\nRIGHT MITTEN: **With smaller hook, ch 9 (11, 11).\nRow 1 (Right Side): Sc in 2nd ch from hook and in each ch across; turn – 8 (10, 10) sc.\nRow 2: Ch 1, sc in back lp of each sc across; turn. Rep last row until 20 (22, 24) rows in all have been worked. Now turn to work across long edge. With larger hook, work 21 (23, 25) sc evenly spaced across long edge; turn. Working in rows of sc (in both lps), work 1 (3, 3) rows even. **\nShape Thumb Gusset: Ch 1, sc in first 12 (13, 14) sc, place marker, [inc] twice, place marker, sc in each sc across; turn – 23 (25, 27) sc.\nNext Row: Ch 1, sc in each sc to marker, inc, sc in each sc to 1 st before next marker, inc, sc in each sc to end.\nRep last row 2 (2, 3) more times – 29 (31, 35) sc.\nDivide for Thumb: Ch 1, sc in first 11 (12, 13) sc, ch 1, skip next 9 (9, 11) sc, sc in last 9 (10, 11) sc; turn.\nNext Row: Ch 1, sc in each sc and ch across; turn – 21 (23, 25) sc. Work even until 4½ (5, 5½)” above ribbing, dec 0 (2, 0) sts evenly on last row – 21 (21, 25) sc.\nShape Tip: Ch 1, [dec, sc in next 6 (6, 8) sc, dec] twice, sc in last sc; turn – 17 (17, 21) sc.\nNext Row: Ch 1, [dec, sc in next 4 (4, 6) sc, dec] twice, sc in last sc; turn – 13 (13, 17) sc.\nNext Row: Ch 1, [dec, sc in next 2 (2, 4) sc, dec] twice, sc in last sc; turn. – 9 (9, 13) sc. Fasten off. Sew top and side seam.\nThumb: With right side facing, attach yarn in ch at thumb division; ch 1, sc in same ch and in each sc around; turn – 10 (10, 12) sc.Work even for 1½ (1¾, 2)”. Next Row: Ch 1, [dec] 5 (5, 6) times. Fasten off. Sew thumb seam.\nLEFT MITTEN: Work same as right mitten from ** to **.\nShape Thumb Gusset: Ch 1, sc in first 8 (9, 10) sc, place marker, [inc] twice, place marker, sc in each sc across; turn – 23 (25, 27) sc.\nNext Row: Ch 1, sc in each sc to marker, inc, sc in each sc to 1 st before next marker, inc, sc in each sc to end; turn. Rep last row 2 (2, 3) more times – 29 (31, 35) sc.\nDivide for Thumb: Ch 1, sc in first 9 (10, 11) sc, ch 1, skip next 9 (9, 11) sc, sc in last 11 (12, 13) sc; turn.\nNext Row: Ch 1, sc in each sc and ch across; turn – 21 (23, 25) sc.\nComplete same as for right mitten.','intermediate','Winter Wear Accessories',6),(8,'Pidgeon Body: With MC, ch 2.\n1st rnd: 6 sc in 2nd ch from hook. Join. 6 sc.\n2nd rnd: Ch 1. 2 sc in each sc around. Join. 12 sc.\n3rd rnd: Ch 1. *1 sc in next sc. 2 sc in next sc. Rep from * around. Join. 18 sc.\n4th rnd: Ch 1. *1 sc in each of next 2 sc. 2 sc in next sc. Rep from * around. Join. 24 sc.\n5th rnd: Ch 1. *1 sc in each of next 3 sc. 2 sc in next sc. Rep from * around. Join. 30 sc.\n6th rnd: Ch 1. *1 sc in each of next 4 sc. 2 sc in next sc. Rep from * around. Join. 36 sc.\n7th rnd: Ch 1. *1 sc in each of next 5 sc. 2 sc in next sc. Rep from * around. Join. 42 sc.\n8th rnd: Ch 1. *1 sc in each of next 6 sc. 2 sc in next sc. Rep from * around. Join. 48 sc.\n9th and 10th rnds: Ch 1. 1 sc in each sc around. Join.\n11th rnd: Ch 1. *1 sc in each of next 7 sc. 2 sc in next sc. Rep from * around. Join. 54 sc.\n12th rnd: Ch 1. 1 sc in each of first 7 sc. PM in last st for Leg placement. 1 sc in each of next 11 sc. PM in last st for Leg placement. 1 sc in each of last 36 sc. Join.\n13th rnd: Ch 1. 1 sc in each sc around. Join.\n14th rnd: Ch 1. *1 sc in each of next 8 sc. 2 sc in next sc. Rep from * around. Join. 60 sc.\n15th to 17th rnds: Ch 1. 1 sc in each sc around. Join.\n18th rnd: Ch 1. 1 sc in each of first 30 sc. Sc2tog. *1 sc in each of next 11 sc. Sc2tog. * PM for Tail placement. Sc2tog. Rep from * to * once. Join. 56 sc.\n19th rnd: Ch 1. 1 sc in each of first 30 sc. Sc2tog. 1 sc in each of next 7 sc. (Sc2tog) 4 times. 1 sc in each of next 7 sc. Sc2tog. Join. 50 sc.\n20th rnd: Ch 1. 1 sc in each sc around. Join\n21st rnd: Ch 1. 1 sc in each of first 39 sc. Sc3tog. 1 sc in each of last 8 sc. Join. 48 sc.\n22nd rnd: Ch 1. 1 sc in each sc around. Join.\n23rd rnd: Ch 1. 1 sc in each of first 27 sc. (Sc2tog. 1 sc in each of next 5 sc) 3 times. Join. 45 sc.\n24th to 26th rnds: Ch 1. 1 sc in each sc around. Join.\n27th rnd: Ch 1. *1 sc in each of next 7 sc. Sc2tog. Rep from * around. Join. 40 sc.\n28th rnd: Ch 1. 1 sc in each of first 6 sc. PM in last st for Wing placement. 1 sc in each of next 20 sc. PM in last st for Wing placement. 1 sc in each of last 14 sc. Join.\n29th rnd: Ch 1. *1 sc in each of next 7 sc. (1 sc in next sc. Sc2tog) 4 times. 1 sc in next sc. Rep from * once more. Join. 32 sc.\nStuff Body firmly. Cont stuffing as rem rnds are worked.\n30th and 31st rnds: Ch 1. 1 sc in each sc around. Join.\n32nd rnd: Ch 1. 1 sc in each of first 27 sc. Sc2tog. 1 sc in next sc. Sc2tog. Join. 30 sc.\n33rd and 34th rnds: Ch 1. 1 sc in each sc around. Join. Break MC. Change to A.\n35th to 37th rnds: With A, ch 1. 1 sc in each sc around. Join.\n38th rnd: With A, ch 1. 1 sc in each of first 7 sc. Change to B, 1 sc in each of next 15 sc. Change to A, 1 sc in each of last 8 sc. Join.\n39th rnd: With A, ch 1. 1 sc in each of first 6 sc. Change to B, 1 sc in each of next 17 sc. Change to A, 1 sc in each of last 7 sc. Join.\n40th rnd: With A, ch 1. 1 sc in each of first 5 sc. Change to B, 1 sc in each of next 3 sc. Sc2tog. 1 sc in each of next 8 sc. Sc2tog. 1 sc in each of next 4 sc. Change to A, 1 sc in each of next 4 sc. Sc2tog. Join.\nBreak A. Change to B. 27 sc.\n41st rnd: With B, ch 1. 1 sc in each sc around. Join.\n42nd rnd: With B, ch 1. 1 sc in each of first 8 sc. Rejoin MC, 1 sc in each of next 11 sc. Change to B, 1 sc in each of last 8 sc. Join.\n43rd rnd: With B, ch 1. 1 sc in each of first 6 sc. Change to MC, 1 sc in each of next 15 sc. Change to B. 1 sc in each of last 6 sc. Join.\n44th rnd: With B, ch 1. 1 sc in each of first 2 sc. Change to MC, 1 sc in each of next 5 sc. (Sc2tog. 1 sc in each of next 7 sc) twice. \nChange to B, Sc2tog. Join. Break B. Cont with MC. 24 sc.\n45th rnd: With MC, ch 1. 1 sc in each sc around. Join.\n46th rnd: Ch 1. *1 sc in each of next 2 sc. Sc2tog. Rep from * around. Join. 18 sc.\n47th rnd: Ch 1. *1 sc in next sc. Sc2tog. Rep from * around. Join. 12 sc.\n48th rnd: Ch 1. (Sc2tog) 6 times. Join. 6 sc.\nFasten off, leaving long yarn end. \nUsing long yarn end, weave through top of final sts and pull tightly to close.','intermediate','Crochet Gideon the Pidgeon',6),(9,'Bottom Half of Body: With A, beg using magic loop method\n1st rnd: Ch 1. 10 hdc in ring. 10 sts.\n2nd rnd: 2 hdc in each hdc around. 20 hdc.\n3rd rnd: *1 hdc in next hdc. 2 hdc in next hdc. Rep from * around. 30 hdc.\n4th rnd: *2 hdc in next hdc. 1 hdc in each of next 2 hdc. Rep from * around. 40 hdc.\n5th rnd: *1 hdc in each of next 3 hdc. 2 hdc in next hdc. Rep from * around. 50 hdc.\n6th rnd: *1 hdc in next hdc. 2 hdc in next hdc. 1 hdc in each of next 3 hdc. Rep from * around. 60 hdc.\n7th rnd: 1 hdc in each of next 5 hdc. 2 hdc in next hdc. *1 hdc in each of next 9 hdc. 2 hdc in next hdc.\nRep from * until 4 hdc rem. 1 hdc in each of last 4 hdc. 66 hdc.\n8th rnd: *2 hdc in next hdc. 1 hdc in each of next 10 hdc. Rep from * around. 72 hdc.\n9th rnd: 1 hdc in next 8 hdc. 2 hdc in next hdc. *1 hdc in each of next 17 hdc. 2 hdc in next hdc.\nRep from * until 9 hdc rem. 1 hdc in each of last 9 hdc. 76 hdc.\n10th and 11th rnds: 1 hdc in each hdc around.\n12th rnd: 1 hdc in each of next 17 hdc. 2 dc in next hdc. 3 tr in next hdc. 2 dc in next hdc. 1 hdc in each of next 35 hdc. 2 dc in next hdc. 3 tr in next hdc. 2 dc in next hdc. 1 hdc in each of last 18 hdc. 84 sts.\n13th rnd: 1 sc in next hdc. Sl st in next hdc. Break yarn. Weave in ends and set piece aside.\nTop Half of Body: 1st to 11th rnds: Rep from 1st to 11th rnds as for Bottom Half of Body.\n12th and 13th rnds: 1 hdc in each hdc around.\n14th rnd: 1 hdc in each of next 17 hdc. 2 dc in next hdc. 3 tr in next hdc. 2 dc in next hdc. 1 hdc in each of next 35 hdc. 2 dc in next hdc. 3 tr in next hdc. 2 dc in next hdc. 1 hdc in each of last 18 hdc. 84 sts.\n15th rnd: 1 sc in next hdc. Sl st in next hdc. Break yarn leaving a long tail for sewing. Weave in first end at magic loop. Set piece aside.\nTail: With A, beg using magic loop method.\n1st row: Ch 1. 1 sc in ring. 1 hdc in ring. 3 dc in ring. Turn. 5 sts.\n2nd row: Ch 1. 2 sc in each of first 3 sts. 1 sc in each of last 2 sts. Break yarn leaving a long tail for sewing. 8 sts.\nSet piece aside.\nComb: With B, ch 6.\n1st row: 1 sc in 2nd ch from hook. (3 dc in next ch. 1 sc in next ch) twice. Turn. 9 sts.\n2nd row: Ch 1. 1 sc in each st to end of row. Break yarn leaving a long tail for sewing.\nSet piece aside.\nBeak: With C, beg using magic loop method.\n1st rnd: Ch 1. 1 sc in ring. 6 hdc in ring. 7 sts.\n2nd rnd: 2 hdc in each st around. Join with sl st to first hdc. 14 hdc. Break yarn leaving a long tail for sewing.\nSet piece aside.\nFeet (make 2): With C, ch 10.\n1st row: 1 sc in 2nd ch from hook. 1 sc in each of next 6 ch. (Turn. Loosely sl st in each of first 3 sts. Ch 5. Skip first ch. 1 sc in each of next 4 ch. 1 sc in each of next 3 sl sts. 1 sl st in next ch) twice.\nBreak yarn leaving a long tail for sewing. Set pieces aside.\nAssembly: Sew Comb to center top of Top Half of Body. Be sure to position it perpendicularly to \"Wings\" on sides as shown in photo.\nAdd Safety Eyes to Top Half of Body, on opposite side of long tail.\nSew Feet to Bottom Half of Body, leaving toes loose. Be sure to position facing away from 13th rnd.\nFlip one over so they are mirrored.\nSew Tail to Bottom Half of Body, at end of 2nd row of tail. Be sure to position behind Feet, centered between Wings. Sew around 11th/12th rnd of Body.\nSew Beak to front, between Eyes, overlapping seam. \nPush Beak out a bit while sewing to create a \"beaky shape.\"\nInsert pillow ball or fill with fiberfill.\nFinish using long tail on Top Half of Body to whip stitch Top and Bottom tog.','beginner','Chicken Crochet Squish',7),(10,'First Leg: Beg at bottom of leg with A, make an adjustable ring as given for Rocketship.\n1st rnd: 6 sc in ring. Do not join. Work in continuous rnds (spiral). 6 sc. PM in last sc worked to for end of rnd. Move marker up as each rnd is completed.\n2nd rnd: 2 sc in each of next 6 sts. 12 sc.\n3rd rnd: (1 sc in next sc. 2 sc in next sc) 6 times. 18 sc.\n4th to 8th rnds: 1 sc in each sc around. Fasten off.\nStuff Leg, beg by placing some optional weighted stuffing in toe of a knee high and place inside leg.\nSecond Leg: Work as given for First Leg. Do not fasten off. Cont to stuff Leg and body as work progresses.\nJoin Legs: Remove end of rnd markers for both legs.\n9th rnd: Hold First Leg and Second Leg tog and working through both thicknesses, 1 sc in next sc to join legs. 1 sc in each of next 17 sc of Second Leg then 1 sc in each of 17 sc of First leg. 34 sc. PM in last sc worked and move marker up as each rnd is completed.\nBody: 10th rnd: (2 sc in next st. 1 sc in each of next 16 sts] twice. 36 sc.\n11th rnd: (1 sc in each of next 5 sc. 2 sc in next sc) 6 times. 42 sc.\n12th to 16th rnds: 1 sc in each sc around.\n17th rnd: (1 sc in each of next 5 sc. Sc2tog) 6 times. 36 sts.\n18th rnd: 1 sc in each st around.\n19th rnd: (1 sc in each of next 4 sc. Sc2tog) 6 times. 30 sts.\n20th rnd: 1 sc in each st around.\n21st rnd: (1 sc in each of next 3 sc. Sc2tog) 6 times. 24 sts.\n22nd to 24th rnds: 1 sc in each st around.\n25th rnd: (1 sc in each of next 2 sc. Sc2tog) 6 times. 18 sts.\nNeck: 26th and 27th rnds: 1 sc in each st around.\nFinish stuffing piece. Fasten off, leaving a long end for sewing. Leave neck open.\nHead: Beg at lower end of head with A, make an adjustable ring.\n1st rnd: 6 sc in ring. Do not join. Work in continuous rnds (spiral). 6 sc. PM in last sc worked to for end of rnd. Move marker up as each rnd is completed.\n2nd rnd: Work 2 sc in each of next 6 sc. 12 sc.\n3rd rnd: (1 sc in next st. 2 sc in next st) 6 times. 18 sc.\n4th rnd: (1 sc in each of next 2 sc. 2 sc in next sc) 6 times. 24 sc.\n5th rnd: (1 sc in each of next 3 sc. 2 sc in next sc) 6 times. 30 sc.\n6th rnd: (1 sc in each of next 4 sc. 2 sc in next sc) 6 times. 36 sc.\n7th rnd: (1 sc in each of next 5 sc. 2 sc in next sc) 6 times. 42 sc.\n8th rnd: (1 sc in each of next 6 sc. 2 sc in next sc) 6 times. 48 sc.\n9th to 11th rnds: 1 sc in each sc around.\n12th rnd: (1 sc in each of next 6 sc. Sc2tog) 6 times. 42 sts.\n13th to 15th rnds: 1 sc in each st around.\n16th rnd: (1 sc in each of next 5 sc. Sc2tog) 6 times. 36 sts. Attach post and washer noses (for eyes) between 8th and 9th rnds, approx 6 - 7 sts apart.\nStuff as work progresses.\n17th rnd: (1 sc in each of next 4 sc. Sc2tog) 6 times. 30 sts.\n18th rnd: (1 sc in each of next 3 sc. Sc2tog) 6 times. 24 sts.\n19th rnd: (1 sc in each of next 2 sc. Sc2tog) 6 times. 18 sts.\n20th rnd: (1 sc in next sc. Sc2tog) 6 times. 12 sts.\n21st rnd: (1 sc in next st. Sc2tog) 4 times. 8 sts.\n22nd to 25th rnds: 1 sc in each st around. Fasten off, leaving a long end for sewing. Cut length of plastic drinking straw approx 1\" [2.5 cm]. Insert drinking straw in top potion of Head. Thread yarn through sts of last rnd. Pull tightly to close hole around straw.\nFasten securely.\nPompom: Wind C around 4 fingers 6 times. Tie tightly in the middle and leave a long end for attaching to Head. Cut loops at both ends and trim to smooth shape. Sew securely to top of Head.\nARMS (make 2): Beg at top of arm with A, ch 8. Join with sl st in first ch to form a ring.\n1st rnd: 1 sc in each ch around. Do not join. Work in continuous rnds (spiral). 8 sc. PM in last sc worked for end of rnd. Move marker up as each rnd is completed.\n2nd to 9th rnds: 1 sc in each sc around. Join B at end of 9th rnd.\nHand: 10th rnd: 1 sc in each sc around.\n11th rnd: 2 sc in each sc around. 16 sc.\n12th rnd: 1 sc in each sc around.\n13th rnd: (1 sc in each of next 2 sc. Sc2tog) 4 times. 12 sts.\nStuff arm lightly.\nNext row: (Closing row). Hold top edges tog and working through both thicknesses, 6 sl st across top edge to close. 6 sl sts. Do not fasten off.\nFINISHING: Referring to photograph as a guide to placement, sew the pieces tog.\n1. Sew Arms to sides of Body at 25th rnd approx 6 or 7 sts apart.\n2. Sew Head to top of neck.\n3. Wrap Belt around torso approx 15 rnds down from neck. Sew short edges tog then tack belt around entire body.\n4. Glue glitter foam star in middle of belt for buckle (or use button, bead, rhinestone, etc.)\n','experienced','Rocket and Alien Microcrochet',2);
/*!40000 ALTER TABLE `patterns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_data`
--

DROP TABLE IF EXISTS `user_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_data` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `completed` bit(1) NOT NULL,
  `progress` text,
  `pattern_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKq0k9yc929vxwr8vgiku8yo3tc` (`pattern_id`),
  KEY `FKboeinboxcrb4ilnj0sfyxsbol` (`user_id`),
  CONSTRAINT `FKboeinboxcrb4ilnj0sfyxsbol` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKq0k9yc929vxwr8vgiku8yo3tc` FOREIGN KEY (`pattern_id`) REFERENCES `patterns` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_data`
--

LOCK TABLES `user_data` WRITE;
/*!40000 ALTER TABLE `user_data` DISABLE KEYS */;
INSERT INTO `user_data` VALUES (1,_binary '\0','[true,true,true,true,false,false,false,false,false,false]',1,1),(2,_binary '\0','[false,false,false,false,false,false,false]',2,1),(3,_binary '\0','[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]',5,1);
/*!40000 ALTER TABLE `user_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'pass','first_user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yarns`
--

DROP TABLE IF EXISTS `yarns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yarns` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `hook_size` double NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `weight` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yarns`
--

LOCK TABLES `yarns` WRITE;
/*!40000 ALTER TABLE `yarns` DISABLE KEYS */;
INSERT INTO `yarns` VALUES (1,2.25,'lace','fingering',0),(2,3,'super fine','sock',1),(3,3.5,'fine','sport',2),(4,4,'light','DK',3),(5,5,'medium','worsted',4),(6,6.5,'bulky','chunky',5),(7,9,'super bulky','super chunky',6),(8,15,'jumbo','ultra',7);
/*!40000 ALTER TABLE `yarns` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-02 16:02:10
