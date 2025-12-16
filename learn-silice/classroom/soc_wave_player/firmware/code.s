
code.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00010137          	lui	sp,0x10
       4:	00000097          	auipc	ra,0x0
       8:	110080e7          	jalr	272(ra) # 114 <main>
       c:	00000317          	auipc	t1,0x0
      10:	00830067          	jr	8(t1) # 14 <exit>

00000014 <exit>:
      14:	00000000          	.word	0x00000000
      18:	00008067          	ret

0000001c <scan_files>:
      1c:	ed010113          	addi	sp,sp,-304 # fed0 <_files+0x7118>
      20:	00004537          	lui	a0,0x4
      24:	12812423          	sw	s0,296(sp)
      28:	00410593          	addi	a1,sp,4
      2c:	00004437          	lui	s0,0x4
      30:	dc850513          	addi	a0,a0,-568 # 3dc8 <LEDS+0x4>
      34:	12112623          	sw	ra,300(sp)
      38:	12912223          	sw	s1,292(sp)
      3c:	0a042023          	sw	zero,160(s0) # 40a0 <n_items>
      40:	00003097          	auipc	ra,0x3
      44:	a90080e7          	jalr	-1392(ra) # 2ad0 <fl_opendir>
      48:	02050a63          	beqz	a0,7c <scan_files+0x60>
      4c:	01010593          	addi	a1,sp,16
      50:	01f00493          	li	s1,31
      54:	00410513          	addi	a0,sp,4
      58:	00003097          	auipc	ra,0x3
      5c:	fdc080e7          	jalr	-36(ra) # 3034 <fl_readdir>
      60:	00051863          	bnez	a0,70 <scan_files+0x54>
      64:	0a042783          	lw	a5,160(s0)
      68:	01010593          	addi	a1,sp,16
      6c:	02f4d263          	bge	s1,a5,90 <scan_files+0x74>
      70:	00410513          	addi	a0,sp,4
      74:	00001097          	auipc	ra,0x1
      78:	644080e7          	jalr	1604(ra) # 16b8 <fl_closedir>
      7c:	12c12083          	lw	ra,300(sp)
      80:	12812403          	lw	s0,296(sp)
      84:	12412483          	lw	s1,292(sp)
      88:	13010113          	addi	sp,sp,304
      8c:	00008067          	ret
      90:	11414703          	lbu	a4,276(sp)
      94:	fc0710e3          	bnez	a4,54 <scan_files+0x38>
      98:	00479693          	slli	a3,a5,0x4
      9c:	00f68633          	add	a2,a3,a5
      a0:	00004737          	lui	a4,0x4
      a4:	00261613          	slli	a2,a2,0x2
      a8:	0d070713          	addi	a4,a4,208 # 40d0 <files>
      ac:	03f00313          	li	t1,63
      b0:	00a58833          	add	a6,a1,a0
      b4:	00084883          	lbu	a7,0(a6)
      b8:	00088463          	beqz	a7,c0 <scan_files+0xa4>
      bc:	02651663          	bne	a0,t1,e8 <scan_files+0xcc>
      c0:	00f686b3          	add	a3,a3,a5
      c4:	00269693          	slli	a3,a3,0x2
      c8:	00d70733          	add	a4,a4,a3
      cc:	11c12683          	lw	a3,284(sp)
      d0:	00a70533          	add	a0,a4,a0
      d4:	00178793          	addi	a5,a5,1
      d8:	00050023          	sb	zero,0(a0)
      dc:	04d72023          	sw	a3,64(a4)
      e0:	0af42023          	sw	a5,160(s0)
      e4:	f71ff06f          	j	54 <scan_files+0x38>
      e8:	00c50833          	add	a6,a0,a2
      ec:	01070833          	add	a6,a4,a6
      f0:	01180023          	sb	a7,0(a6)
      f4:	00150513          	addi	a0,a0,1
      f8:	fb9ff06f          	j	b0 <scan_files+0x94>

000000fc <play_click_noise>:
      fc:	000045b7          	lui	a1,0x4
     100:	00004537          	lui	a0,0x4
     104:	dcc58593          	addi	a1,a1,-564 # 3dcc <LEDS+0x8>
     108:	dd450513          	addi	a0,a0,-556 # 3dd4 <LEDS+0x10>
     10c:	00004317          	auipc	t1,0x4
     110:	89830067          	jr	-1896(t1) # 39a4 <fl_fopen>

00000114 <main>:
     114:	000047b7          	lui	a5,0x4
     118:	dc47a783          	lw	a5,-572(a5) # 3dc4 <LEDS>
     11c:	fb010113          	addi	sp,sp,-80
     120:	04112623          	sw	ra,76(sp)
     124:	04812423          	sw	s0,72(sp)
     128:	04912223          	sw	s1,68(sp)
     12c:	05212023          	sw	s2,64(sp)
     130:	03312e23          	sw	s3,60(sp)
     134:	03412c23          	sw	s4,56(sp)
     138:	03512a23          	sw	s5,52(sp)
     13c:	03612823          	sw	s6,48(sp)
     140:	03712623          	sw	s7,44(sp)
     144:	03812423          	sw	s8,40(sp)
     148:	03912223          	sw	s9,36(sp)
     14c:	03a12023          	sw	s10,32(sp)
     150:	01b12e23          	sw	s11,28(sp)
     154:	0007a023          	sw	zero,0(a5)
     158:	000017b7          	lui	a5,0x1
     15c:	00004737          	lui	a4,0x4
     160:	d8c78793          	addi	a5,a5,-628 # d8c <display_putchar>
     164:	0af72a23          	sw	a5,180(a4) # 40b4 <f_putchar>
     168:	00001097          	auipc	ra,0x1
     16c:	abc080e7          	jalr	-1348(ra) # c24 <oled_init>
     170:	00001097          	auipc	ra,0x1
     174:	ac0080e7          	jalr	-1344(ra) # c30 <oled_fullscreen>
     178:	00000513          	li	a0,0
     17c:	00001097          	auipc	ra,0x1
     180:	b4c080e7          	jalr	-1204(ra) # cc8 <oled_clear>
     184:	00000097          	auipc	ra,0x0
     188:	660080e7          	jalr	1632(ra) # 7e4 <sdcard_init>
     18c:	00001097          	auipc	ra,0x1
     190:	4c4080e7          	jalr	1220(ra) # 1650 <fl_init>
     194:	00000593          	li	a1,0
     198:	00000513          	li	a0,0
     19c:	00001097          	auipc	ra,0x1
     1a0:	bc8080e7          	jalr	-1080(ra) # d64 <display_set_cursor>
     1a4:	00000593          	li	a1,0
     1a8:	0ff00513          	li	a0,255
     1ac:	00001097          	auipc	ra,0x1
     1b0:	bcc080e7          	jalr	-1076(ra) # d78 <display_set_front_back_color>
     1b4:	00004537          	lui	a0,0x4
     1b8:	de050513          	addi	a0,a0,-544 # 3de0 <LEDS+0x1c>
     1bc:	00001097          	auipc	ra,0x1
     1c0:	ef4080e7          	jalr	-268(ra) # 10b0 <printf>
     1c4:	000014b7          	lui	s1,0x1
     1c8:	00001437          	lui	s0,0x1
     1cc:	00001097          	auipc	ra,0x1
     1d0:	cec080e7          	jalr	-788(ra) # eb8 <display_refresh>
     1d4:	98848493          	addi	s1,s1,-1656 # 988 <sdcard_writesector>
     1d8:	93440413          	addi	s0,s0,-1740 # 934 <sdcard_readsector>
     1dc:	00048593          	mv	a1,s1
     1e0:	00040513          	mv	a0,s0
     1e4:	00002097          	auipc	ra,0x2
     1e8:	2d4080e7          	jalr	724(ra) # 24b8 <fl_attach_media>
     1ec:	fe0518e3          	bnez	a0,1dc <main+0xc8>
     1f0:	00000097          	auipc	ra,0x0
     1f4:	e2c080e7          	jalr	-468(ra) # 1c <scan_files>
     1f8:	000047b7          	lui	a5,0x4
     1fc:	dfc78793          	addi	a5,a5,-516 # 3dfc <LEDS+0x38>
     200:	00f12423          	sw	a5,8(sp)
     204:	000047b7          	lui	a5,0x4
     208:	e2c78793          	addi	a5,a5,-468 # 3e2c <LEDS+0x68>
     20c:	00f12623          	sw	a5,12(sp)
     210:	000047b7          	lui	a5,0x4
     214:	db47ad03          	lw	s10,-588(a5) # 3db4 <BUTTONS>
     218:	00004bb7          	lui	s7,0x4
     21c:	00000413          	li	s0,0
     220:	00000493          	li	s1,0
     224:	00000b13          	li	s6,0
     228:	00000c93          	li	s9,0
     22c:	0d0b8b93          	addi	s7,s7,208 # 40d0 <files>
     230:	00000593          	li	a1,0
     234:	00000513          	li	a0,0
     238:	00001097          	auipc	ra,0x1
     23c:	b2c080e7          	jalr	-1236(ra) # d64 <display_set_cursor>
     240:	0ffb7593          	zext.b	a1,s6
     244:	07f58513          	addi	a0,a1,127
     248:	0ff57513          	zext.b	a0,a0
     24c:	00001097          	auipc	ra,0x1
     250:	b2c080e7          	jalr	-1236(ra) # d78 <display_set_front_back_color>
     254:	00812503          	lw	a0,8(sp)
     258:	00004a37          	lui	s4,0x4
     25c:	00001097          	auipc	ra,0x1
     260:	e54080e7          	jalr	-428(ra) # 10b0 <printf>
     264:	00000593          	li	a1,0
     268:	0ff00513          	li	a0,255
     26c:	00001097          	auipc	ra,0x1
     270:	b0c080e7          	jalr	-1268(ra) # d78 <display_set_front_back_color>
     274:	0a0a2983          	lw	s3,160(s4) # 40a0 <n_items>
     278:	0a099a63          	bnez	s3,32c <main+0x218>
     27c:	00004537          	lui	a0,0x4
     280:	e1850513          	addi	a0,a0,-488 # 3e18 <LEDS+0x54>
     284:	00001097          	auipc	ra,0x1
     288:	e2c080e7          	jalr	-468(ra) # 10b0 <printf>
     28c:	00001097          	auipc	ra,0x1
     290:	c2c080e7          	jalr	-980(ra) # eb8 <display_refresh>
     294:	000d2903          	lw	s2,0(s10)
     298:	fff4c493          	not	s1,s1
     29c:	0124f4b3          	and	s1,s1,s2
     2a0:	0104f793          	andi	a5,s1,16
     2a4:	00f037b3          	snez	a5,a5
     2a8:	00fc8cb3          	add	s9,s9,a5
     2ac:	0a0a2783          	lw	a5,160(s4)
     2b0:	0084f493          	andi	s1,s1,8
     2b4:	009034b3          	snez	s1,s1
     2b8:	409c8cb3          	sub	s9,s9,s1
     2bc:	04f05e63          	blez	a5,318 <main+0x204>
     2c0:	fff00713          	li	a4,-1
     2c4:	00ec9863          	bne	s9,a4,2d4 <main+0x1c0>
     2c8:	00e78cb3          	add	s9,a5,a4
     2cc:	00000097          	auipc	ra,0x0
     2d0:	e30080e7          	jalr	-464(ra) # fc <play_click_noise>
     2d4:	0a0a2783          	lw	a5,160(s4)
     2d8:	00fcc863          	blt	s9,a5,2e8 <main+0x1d4>
     2dc:	00000097          	auipc	ra,0x0
     2e0:	e20080e7          	jalr	-480(ra) # fc <play_click_noise>
     2e4:	00000c93          	li	s9,0
     2e8:	0c8cc463          	blt	s9,s0,3b0 <main+0x29c>
     2ec:	00640793          	addi	a5,s0,6
     2f0:	0197d463          	bge	a5,s9,2f8 <main+0x1e4>
     2f4:	ffac8413          	addi	s0,s9,-6
     2f8:	0a0a2783          	lw	a5,160(s4)
     2fc:	00700713          	li	a4,7
     300:	00e7d463          	bge	a5,a4,308 <main+0x1f4>
     304:	00070793          	mv	a5,a4
     308:	ff978793          	addi	a5,a5,-7
     30c:	0087da63          	bge	a5,s0,320 <main+0x20c>
     310:	00078413          	mv	s0,a5
     314:	00c0006f          	j	320 <main+0x20c>
     318:	00000413          	li	s0,0
     31c:	00000c93          	li	s9,0
     320:	007b0b13          	addi	s6,s6,7
     324:	00090493          	mv	s1,s2
     328:	f09ff06f          	j	230 <main+0x11c>
     32c:	408989b3          	sub	s3,s3,s0
     330:	00700793          	li	a5,7
     334:	0137d463          	bge	a5,s3,33c <main+0x228>
     338:	00078993          	mv	s3,a5
     33c:	00441913          	slli	s2,s0,0x4
     340:	00890933          	add	s2,s2,s0
     344:	00291913          	slli	s2,s2,0x2
     348:	000047b7          	lui	a5,0x4
     34c:	01790933          	add	s2,s2,s7
     350:	00000a93          	li	s5,0
     354:	e3478d93          	addi	s11,a5,-460 # 3e34 <LEDS+0x70>
     358:	f33adae3          	bge	s5,s3,28c <main+0x178>
     35c:	008a8c33          	add	s8,s5,s0
     360:	058c9263          	bne	s9,s8,3a4 <main+0x290>
     364:	0ff00593          	li	a1,255
     368:	00000513          	li	a0,0
     36c:	00001097          	auipc	ra,0x1
     370:	a0c080e7          	jalr	-1524(ra) # d78 <display_set_front_back_color>
     374:	00c12503          	lw	a0,12(sp)
     378:	00090613          	mv	a2,s2
     37c:	000c0593          	mv	a1,s8
     380:	00001097          	auipc	ra,0x1
     384:	d30080e7          	jalr	-720(ra) # 10b0 <printf>
     388:	04092583          	lw	a1,64(s2)
     38c:	000d8513          	mv	a0,s11
     390:	001a8a93          	addi	s5,s5,1
     394:	00001097          	auipc	ra,0x1
     398:	d1c080e7          	jalr	-740(ra) # 10b0 <printf>
     39c:	04490913          	addi	s2,s2,68
     3a0:	fb9ff06f          	j	358 <main+0x244>
     3a4:	00000593          	li	a1,0
     3a8:	0ff00513          	li	a0,255
     3ac:	fc1ff06f          	j	36c <main+0x258>
     3b0:	000c8413          	mv	s0,s9
     3b4:	f45ff06f          	j	2f8 <main+0x1e4>

000003b8 <pause>:
     3b8:	c0002773          	rdcycle	a4
     3bc:	c00027f3          	rdcycle	a5
     3c0:	40e787b3          	sub	a5,a5,a4
     3c4:	fea7ece3          	bltu	a5,a0,3bc <pause+0x4>
     3c8:	00008067          	ret

000003cc <sdcard_idle>:
     3cc:	00008067          	ret

000003d0 <sdcard_select>:
     3d0:	000047b7          	lui	a5,0x4
     3d4:	db87a783          	lw	a5,-584(a5) # 3db8 <SDCARD>
     3d8:	00200713          	li	a4,2
     3dc:	00e7a023          	sw	a4,0(a5)
     3e0:	00008067          	ret

000003e4 <sdcard_ponder>:
     3e4:	000046b7          	lui	a3,0x4
     3e8:	db86a683          	lw	a3,-584(a3) # 3db8 <SDCARD>
     3ec:	01000793          	li	a5,16
     3f0:	00000713          	li	a4,0
     3f4:	00676613          	ori	a2,a4,6
     3f8:	00c6a023          	sw	a2,0(a3)
     3fc:	00174713          	xori	a4,a4,1
     400:	00000013          	nop
     404:	fff78793          	addi	a5,a5,-1
     408:	fe0796e3          	bnez	a5,3f4 <sdcard_ponder+0x10>
     40c:	00008067          	ret

00000410 <sdcard_unselect>:
     410:	000047b7          	lui	a5,0x4
     414:	db87a783          	lw	a5,-584(a5) # 3db8 <SDCARD>
     418:	00600713          	li	a4,6
     41c:	00e7a023          	sw	a4,0(a5)
     420:	00008067          	ret

00000424 <sdcard_send>:
     424:	000047b7          	lui	a5,0x4
     428:	db87a783          	lw	a5,-584(a5) # 3db8 <SDCARD>
     42c:	00655713          	srli	a4,a0,0x6
     430:	00277713          	andi	a4,a4,2
     434:	00e7a023          	sw	a4,0(a5)
     438:	00176713          	ori	a4,a4,1
     43c:	00e7a023          	sw	a4,0(a5)
     440:	00555713          	srli	a4,a0,0x5
     444:	00277713          	andi	a4,a4,2
     448:	00e7a023          	sw	a4,0(a5)
     44c:	00176713          	ori	a4,a4,1
     450:	00e7a023          	sw	a4,0(a5)
     454:	00455713          	srli	a4,a0,0x4
     458:	00277713          	andi	a4,a4,2
     45c:	00e7a023          	sw	a4,0(a5)
     460:	00176713          	ori	a4,a4,1
     464:	00e7a023          	sw	a4,0(a5)
     468:	00355713          	srli	a4,a0,0x3
     46c:	00277713          	andi	a4,a4,2
     470:	00e7a023          	sw	a4,0(a5)
     474:	00176713          	ori	a4,a4,1
     478:	00e7a023          	sw	a4,0(a5)
     47c:	00255713          	srli	a4,a0,0x2
     480:	00277713          	andi	a4,a4,2
     484:	00e7a023          	sw	a4,0(a5)
     488:	00176713          	ori	a4,a4,1
     48c:	00e7a023          	sw	a4,0(a5)
     490:	00155713          	srli	a4,a0,0x1
     494:	00277713          	andi	a4,a4,2
     498:	00e7a023          	sw	a4,0(a5)
     49c:	00176713          	ori	a4,a4,1
     4a0:	00e7a023          	sw	a4,0(a5)
     4a4:	00257713          	andi	a4,a0,2
     4a8:	00e7a023          	sw	a4,0(a5)
     4ac:	00151513          	slli	a0,a0,0x1
     4b0:	00176713          	ori	a4,a4,1
     4b4:	00e7a023          	sw	a4,0(a5)
     4b8:	00257513          	andi	a0,a0,2
     4bc:	00a7a023          	sw	a0,0(a5)
     4c0:	00156513          	ori	a0,a0,1
     4c4:	00a7a023          	sw	a0,0(a5)
     4c8:	00200713          	li	a4,2
     4cc:	00e7a023          	sw	a4,0(a5)
     4d0:	000047b7          	lui	a5,0x4
     4d4:	0a47a783          	lw	a5,164(a5) # 40a4 <sdcard_while_loading_callback>
     4d8:	00078067          	jr	a5

000004dc <sdcard_read>:
     4dc:	fd010113          	addi	sp,sp,-48
     4e0:	fff50793          	addi	a5,a0,-1
     4e4:	03212023          	sw	s2,32(sp)
     4e8:	00100913          	li	s2,1
     4ec:	00f91933          	sll	s2,s2,a5
     4f0:	000047b7          	lui	a5,0x4
     4f4:	01312e23          	sw	s3,28(sp)
     4f8:	db87a983          	lw	s3,-584(a5) # 3db8 <SDCARD>
     4fc:	02812423          	sw	s0,40(sp)
     500:	02912223          	sw	s1,36(sp)
     504:	01412c23          	sw	s4,24(sp)
     508:	01512a23          	sw	s5,20(sp)
     50c:	01612823          	sw	s6,16(sp)
     510:	02112623          	sw	ra,44(sp)
     514:	0ff00413          	li	s0,255
     518:	00000493          	li	s1,0
     51c:	00300a13          	li	s4,3
     520:	00200a93          	li	s5,2
     524:	00004b37          	lui	s6,0x4
     528:	02058c63          	beqz	a1,560 <sdcard_read+0x84>
     52c:	012477b3          	and	a5,s0,s2
     530:	02079a63          	bnez	a5,564 <sdcard_read+0x88>
     534:	02c12083          	lw	ra,44(sp)
     538:	0ff47513          	zext.b	a0,s0
     53c:	02812403          	lw	s0,40(sp)
     540:	02412483          	lw	s1,36(sp)
     544:	02012903          	lw	s2,32(sp)
     548:	01c12983          	lw	s3,28(sp)
     54c:	01812a03          	lw	s4,24(sp)
     550:	01412a83          	lw	s5,20(sp)
     554:	01012b03          	lw	s6,16(sp)
     558:	03010113          	addi	sp,sp,48
     55c:	00008067          	ret
     560:	fca4dae3          	bge	s1,a0,534 <sdcard_read+0x58>
     564:	0149a023          	sw	s4,0(s3)
     568:	0159a023          	sw	s5,0(s3)
     56c:	0009a783          	lw	a5,0(s3)
     570:	00141413          	slli	s0,s0,0x1
     574:	00b12623          	sw	a1,12(sp)
     578:	00f46433          	or	s0,s0,a5
     57c:	0a4b2783          	lw	a5,164(s6) # 40a4 <sdcard_while_loading_callback>
     580:	00a12423          	sw	a0,8(sp)
     584:	00148493          	addi	s1,s1,1
     588:	000780e7          	jalr	a5
     58c:	00c12583          	lw	a1,12(sp)
     590:	00812503          	lw	a0,8(sp)
     594:	f95ff06f          	j	528 <sdcard_read+0x4c>

00000598 <sdcard_get>:
     598:	fe010113          	addi	sp,sp,-32
     59c:	00112e23          	sw	ra,28(sp)
     5a0:	00812c23          	sw	s0,24(sp)
     5a4:	00912a23          	sw	s1,20(sp)
     5a8:	00050413          	mv	s0,a0
     5ac:	00b12623          	sw	a1,12(sp)
     5b0:	00000097          	auipc	ra,0x0
     5b4:	e20080e7          	jalr	-480(ra) # 3d0 <sdcard_select>
     5b8:	00c12583          	lw	a1,12(sp)
     5bc:	00040513          	mv	a0,s0
     5c0:	00100493          	li	s1,1
     5c4:	00000097          	auipc	ra,0x0
     5c8:	f18080e7          	jalr	-232(ra) # 4dc <sdcard_read>
     5cc:	00345413          	srli	s0,s0,0x3
     5d0:	0284c463          	blt	s1,s0,5f8 <sdcard_get+0x60>
     5d4:	00a12623          	sw	a0,12(sp)
     5d8:	00000097          	auipc	ra,0x0
     5dc:	e38080e7          	jalr	-456(ra) # 410 <sdcard_unselect>
     5e0:	01c12083          	lw	ra,28(sp)
     5e4:	01812403          	lw	s0,24(sp)
     5e8:	00c12503          	lw	a0,12(sp)
     5ec:	01412483          	lw	s1,20(sp)
     5f0:	02010113          	addi	sp,sp,32
     5f4:	00008067          	ret
     5f8:	00000593          	li	a1,0
     5fc:	00800513          	li	a0,8
     600:	00000097          	auipc	ra,0x0
     604:	edc080e7          	jalr	-292(ra) # 4dc <sdcard_read>
     608:	00148493          	addi	s1,s1,1
     60c:	fc5ff06f          	j	5d0 <sdcard_get+0x38>

00000610 <sdcard_cmd>:
     610:	ff010113          	addi	sp,sp,-16
     614:	00812423          	sw	s0,8(sp)
     618:	00912223          	sw	s1,4(sp)
     61c:	01212023          	sw	s2,0(sp)
     620:	00112623          	sw	ra,12(sp)
     624:	00050913          	mv	s2,a0
     628:	00000413          	li	s0,0
     62c:	00000097          	auipc	ra,0x0
     630:	da4080e7          	jalr	-604(ra) # 3d0 <sdcard_select>
     634:	00600493          	li	s1,6
     638:	008907b3          	add	a5,s2,s0
     63c:	0007c503          	lbu	a0,0(a5)
     640:	00140413          	addi	s0,s0,1
     644:	00000097          	auipc	ra,0x0
     648:	de0080e7          	jalr	-544(ra) # 424 <sdcard_send>
     64c:	fe9416e3          	bne	s0,s1,638 <sdcard_cmd+0x28>
     650:	00812403          	lw	s0,8(sp)
     654:	00c12083          	lw	ra,12(sp)
     658:	00412483          	lw	s1,4(sp)
     65c:	00012903          	lw	s2,0(sp)
     660:	01010113          	addi	sp,sp,16
     664:	00000317          	auipc	t1,0x0
     668:	dac30067          	jr	-596(t1) # 410 <sdcard_unselect>

0000066c <sdcard_start_sector>:
     66c:	ff010113          	addi	sp,sp,-16
     670:	00112623          	sw	ra,12(sp)
     674:	00812423          	sw	s0,8(sp)
     678:	00050413          	mv	s0,a0
     67c:	00000097          	auipc	ra,0x0
     680:	d54080e7          	jalr	-684(ra) # 3d0 <sdcard_select>
     684:	05100513          	li	a0,81
     688:	00000097          	auipc	ra,0x0
     68c:	d9c080e7          	jalr	-612(ra) # 424 <sdcard_send>
     690:	01845513          	srli	a0,s0,0x18
     694:	00000097          	auipc	ra,0x0
     698:	d90080e7          	jalr	-624(ra) # 424 <sdcard_send>
     69c:	41045513          	srai	a0,s0,0x10
     6a0:	0ff57513          	zext.b	a0,a0
     6a4:	00000097          	auipc	ra,0x0
     6a8:	d80080e7          	jalr	-640(ra) # 424 <sdcard_send>
     6ac:	40845513          	srai	a0,s0,0x8
     6b0:	0ff57513          	zext.b	a0,a0
     6b4:	00000097          	auipc	ra,0x0
     6b8:	d70080e7          	jalr	-656(ra) # 424 <sdcard_send>
     6bc:	0ff47513          	zext.b	a0,s0
     6c0:	00000097          	auipc	ra,0x0
     6c4:	d64080e7          	jalr	-668(ra) # 424 <sdcard_send>
     6c8:	05500513          	li	a0,85
     6cc:	00000097          	auipc	ra,0x0
     6d0:	d58080e7          	jalr	-680(ra) # 424 <sdcard_send>
     6d4:	00000097          	auipc	ra,0x0
     6d8:	d3c080e7          	jalr	-708(ra) # 410 <sdcard_unselect>
     6dc:	00812403          	lw	s0,8(sp)
     6e0:	00c12083          	lw	ra,12(sp)
     6e4:	00100593          	li	a1,1
     6e8:	00800513          	li	a0,8
     6ec:	01010113          	addi	sp,sp,16
     6f0:	00000317          	auipc	t1,0x0
     6f4:	ea830067          	jr	-344(t1) # 598 <sdcard_get>

000006f8 <sdcard_read_sector>:
     6f8:	ff010113          	addi	sp,sp,-16
     6fc:	00812423          	sw	s0,8(sp)
     700:	00112623          	sw	ra,12(sp)
     704:	00912223          	sw	s1,4(sp)
     708:	01212023          	sw	s2,0(sp)
     70c:	00058413          	mv	s0,a1
     710:	00000097          	auipc	ra,0x0
     714:	f5c080e7          	jalr	-164(ra) # 66c <sdcard_start_sector>
     718:	04051863          	bnez	a0,768 <sdcard_read_sector+0x70>
     71c:	00100593          	li	a1,1
     720:	00058513          	mv	a0,a1
     724:	00000097          	auipc	ra,0x0
     728:	e74080e7          	jalr	-396(ra) # 598 <sdcard_get>
     72c:	00000493          	li	s1,0
     730:	20000913          	li	s2,512
     734:	00000593          	li	a1,0
     738:	00800513          	li	a0,8
     73c:	00000097          	auipc	ra,0x0
     740:	e5c080e7          	jalr	-420(ra) # 598 <sdcard_get>
     744:	009407b3          	add	a5,s0,s1
     748:	00a78023          	sb	a0,0(a5)
     74c:	00148493          	addi	s1,s1,1
     750:	ff2492e3          	bne	s1,s2,734 <sdcard_read_sector+0x3c>
     754:	00100593          	li	a1,1
     758:	01000513          	li	a0,16
     75c:	20040413          	addi	s0,s0,512
     760:	00000097          	auipc	ra,0x0
     764:	e38080e7          	jalr	-456(ra) # 598 <sdcard_get>
     768:	00c12083          	lw	ra,12(sp)
     76c:	00040513          	mv	a0,s0
     770:	00812403          	lw	s0,8(sp)
     774:	00412483          	lw	s1,4(sp)
     778:	00012903          	lw	s2,0(sp)
     77c:	01010113          	addi	sp,sp,16
     780:	00008067          	ret

00000784 <sdcard_preinit>:
     784:	ff010113          	addi	sp,sp,-16
     788:	000047b7          	lui	a5,0x4
     78c:	00812423          	sw	s0,8(sp)
     790:	db87a403          	lw	s0,-584(a5) # 3db8 <SDCARD>
     794:	00112623          	sw	ra,12(sp)
     798:	00600793          	li	a5,6
     79c:	01313537          	lui	a0,0x1313
     7a0:	00f42023          	sw	a5,0(s0)
     7a4:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
     7a8:	00000097          	auipc	ra,0x0
     7ac:	c10080e7          	jalr	-1008(ra) # 3b8 <pause>
     7b0:	0a000793          	li	a5,160
     7b4:	00000713          	li	a4,0
     7b8:	00676693          	ori	a3,a4,6
     7bc:	00d42023          	sw	a3,0(s0)
     7c0:	fff78793          	addi	a5,a5,-1
     7c4:	00174713          	xori	a4,a4,1
     7c8:	fe0798e3          	bnez	a5,7b8 <sdcard_preinit+0x34>
     7cc:	00600793          	li	a5,6
     7d0:	00c12083          	lw	ra,12(sp)
     7d4:	00f42023          	sw	a5,0(s0)
     7d8:	00812403          	lw	s0,8(sp)
     7dc:	01010113          	addi	sp,sp,16
     7e0:	00008067          	ret

000007e4 <sdcard_init>:
     7e4:	000007b7          	lui	a5,0x0
     7e8:	3cc78793          	addi	a5,a5,972 # 3cc <sdcard_idle>
     7ec:	00004737          	lui	a4,0x4
     7f0:	fe010113          	addi	sp,sp,-32
     7f4:	0af72223          	sw	a5,164(a4) # 40a4 <sdcard_while_loading_callback>
     7f8:	000047b7          	lui	a5,0x4
     7fc:	00812c23          	sw	s0,24(sp)
     800:	00912a23          	sw	s1,20(sp)
     804:	00112e23          	sw	ra,28(sp)
     808:	dac78493          	addi	s1,a5,-596 # 3dac <cmd0>
     80c:	0ff00413          	li	s0,255
     810:	00000097          	auipc	ra,0x0
     814:	f74080e7          	jalr	-140(ra) # 784 <sdcard_preinit>
     818:	00048513          	mv	a0,s1
     81c:	00000097          	auipc	ra,0x0
     820:	df4080e7          	jalr	-524(ra) # 610 <sdcard_cmd>
     824:	00100593          	li	a1,1
     828:	00800513          	li	a0,8
     82c:	00000097          	auipc	ra,0x0
     830:	d6c080e7          	jalr	-660(ra) # 598 <sdcard_get>
     834:	00a12623          	sw	a0,12(sp)
     838:	00000097          	auipc	ra,0x0
     83c:	bac080e7          	jalr	-1108(ra) # 3e4 <sdcard_ponder>
     840:	00c12503          	lw	a0,12(sp)
     844:	00851c63          	bne	a0,s0,85c <sdcard_init+0x78>
     848:	01313537          	lui	a0,0x1313
     84c:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
     850:	00000097          	auipc	ra,0x0
     854:	b68080e7          	jalr	-1176(ra) # 3b8 <pause>
     858:	fb9ff06f          	j	810 <sdcard_init+0x2c>
     85c:	00004537          	lui	a0,0x4
     860:	da450513          	addi	a0,a0,-604 # 3da4 <cmd8>
     864:	00000097          	auipc	ra,0x0
     868:	dac080e7          	jalr	-596(ra) # 610 <sdcard_cmd>
     86c:	00100593          	li	a1,1
     870:	02800513          	li	a0,40
     874:	00000097          	auipc	ra,0x0
     878:	d24080e7          	jalr	-732(ra) # 598 <sdcard_get>
     87c:	00000097          	auipc	ra,0x0
     880:	b68080e7          	jalr	-1176(ra) # 3e4 <sdcard_ponder>
     884:	000047b7          	lui	a5,0x4
     888:	d9c78413          	addi	s0,a5,-612 # 3d9c <cmd55>
     88c:	000047b7          	lui	a5,0x4
     890:	d9478493          	addi	s1,a5,-620 # 3d94 <acmd41>
     894:	00040513          	mv	a0,s0
     898:	00000097          	auipc	ra,0x0
     89c:	d78080e7          	jalr	-648(ra) # 610 <sdcard_cmd>
     8a0:	00100593          	li	a1,1
     8a4:	00800513          	li	a0,8
     8a8:	00000097          	auipc	ra,0x0
     8ac:	cf0080e7          	jalr	-784(ra) # 598 <sdcard_get>
     8b0:	00000097          	auipc	ra,0x0
     8b4:	b34080e7          	jalr	-1228(ra) # 3e4 <sdcard_ponder>
     8b8:	00048513          	mv	a0,s1
     8bc:	00000097          	auipc	ra,0x0
     8c0:	d54080e7          	jalr	-684(ra) # 610 <sdcard_cmd>
     8c4:	00100593          	li	a1,1
     8c8:	00800513          	li	a0,8
     8cc:	00000097          	auipc	ra,0x0
     8d0:	ccc080e7          	jalr	-820(ra) # 598 <sdcard_get>
     8d4:	00a12623          	sw	a0,12(sp)
     8d8:	00000097          	auipc	ra,0x0
     8dc:	b0c080e7          	jalr	-1268(ra) # 3e4 <sdcard_ponder>
     8e0:	00c12503          	lw	a0,12(sp)
     8e4:	00050c63          	beqz	a0,8fc <sdcard_init+0x118>
     8e8:	001e8537          	lui	a0,0x1e8
     8ec:	48050513          	addi	a0,a0,1152 # 1e8480 <__stacktop+0x1d8480>
     8f0:	00000097          	auipc	ra,0x0
     8f4:	ac8080e7          	jalr	-1336(ra) # 3b8 <pause>
     8f8:	f9dff06f          	j	894 <sdcard_init+0xb0>
     8fc:	00004537          	lui	a0,0x4
     900:	d8c50513          	addi	a0,a0,-628 # 3d8c <cmd16>
     904:	00000097          	auipc	ra,0x0
     908:	d0c080e7          	jalr	-756(ra) # 610 <sdcard_cmd>
     90c:	00100593          	li	a1,1
     910:	00800513          	li	a0,8
     914:	00000097          	auipc	ra,0x0
     918:	c84080e7          	jalr	-892(ra) # 598 <sdcard_get>
     91c:	01812403          	lw	s0,24(sp)
     920:	01c12083          	lw	ra,28(sp)
     924:	01412483          	lw	s1,20(sp)
     928:	02010113          	addi	sp,sp,32
     92c:	00000317          	auipc	t1,0x0
     930:	ab830067          	jr	-1352(t1) # 3e4 <sdcard_ponder>

00000934 <sdcard_readsector>:
     934:	04060663          	beqz	a2,980 <sdcard_readsector+0x4c>
     938:	ff010113          	addi	sp,sp,-16
     93c:	00812423          	sw	s0,8(sp)
     940:	00912223          	sw	s1,4(sp)
     944:	00112623          	sw	ra,12(sp)
     948:	00050413          	mv	s0,a0
     94c:	00a604b3          	add	s1,a2,a0
     950:	00040513          	mv	a0,s0
     954:	00000097          	auipc	ra,0x0
     958:	da4080e7          	jalr	-604(ra) # 6f8 <sdcard_read_sector>
     95c:	00140413          	addi	s0,s0,1
     960:	00050593          	mv	a1,a0
     964:	fe9416e3          	bne	s0,s1,950 <sdcard_readsector+0x1c>
     968:	00c12083          	lw	ra,12(sp)
     96c:	00812403          	lw	s0,8(sp)
     970:	00412483          	lw	s1,4(sp)
     974:	00100513          	li	a0,1
     978:	01010113          	addi	sp,sp,16
     97c:	00008067          	ret
     980:	00000513          	li	a0,0
     984:	00008067          	ret

00000988 <sdcard_writesector>:
     988:	00000513          	li	a0,0
     98c:	00008067          	ret

00000990 <__divsi3>:
     990:	06054063          	bltz	a0,9f0 <__umodsi3+0x10>
     994:	0605c663          	bltz	a1,a00 <__umodsi3+0x20>

00000998 <__udivsi3>:
     998:	00058613          	mv	a2,a1
     99c:	00050593          	mv	a1,a0
     9a0:	fff00513          	li	a0,-1
     9a4:	02060c63          	beqz	a2,9dc <__udivsi3+0x44>
     9a8:	00100693          	li	a3,1
     9ac:	00b67a63          	bgeu	a2,a1,9c0 <__udivsi3+0x28>
     9b0:	00c05863          	blez	a2,9c0 <__udivsi3+0x28>
     9b4:	00161613          	slli	a2,a2,0x1
     9b8:	00169693          	slli	a3,a3,0x1
     9bc:	feb66ae3          	bltu	a2,a1,9b0 <__udivsi3+0x18>
     9c0:	00000513          	li	a0,0
     9c4:	00c5e663          	bltu	a1,a2,9d0 <__udivsi3+0x38>
     9c8:	40c585b3          	sub	a1,a1,a2
     9cc:	00d56533          	or	a0,a0,a3
     9d0:	0016d693          	srli	a3,a3,0x1
     9d4:	00165613          	srli	a2,a2,0x1
     9d8:	fe0696e3          	bnez	a3,9c4 <__udivsi3+0x2c>
     9dc:	00008067          	ret

000009e0 <__umodsi3>:
     9e0:	00008293          	mv	t0,ra
     9e4:	fb5ff0ef          	jal	998 <__udivsi3>
     9e8:	00058513          	mv	a0,a1
     9ec:	00028067          	jr	t0
     9f0:	40a00533          	neg	a0,a0
     9f4:	0005d863          	bgez	a1,a04 <__umodsi3+0x24>
     9f8:	40b005b3          	neg	a1,a1
     9fc:	f95ff06f          	j	990 <__divsi3>
     a00:	40b005b3          	neg	a1,a1
     a04:	00008293          	mv	t0,ra
     a08:	f89ff0ef          	jal	990 <__divsi3>
     a0c:	40a00533          	neg	a0,a0
     a10:	00028067          	jr	t0

00000a14 <__modsi3>:
     a14:	00008293          	mv	t0,ra
     a18:	0005ca63          	bltz	a1,a2c <__modsi3+0x18>
     a1c:	00054c63          	bltz	a0,a34 <__modsi3+0x20>
     a20:	f79ff0ef          	jal	998 <__udivsi3>
     a24:	00058513          	mv	a0,a1
     a28:	00028067          	jr	t0
     a2c:	40b005b3          	neg	a1,a1
     a30:	fe0558e3          	bgez	a0,a20 <__modsi3+0xc>
     a34:	40a00533          	neg	a0,a0
     a38:	f61ff0ef          	jal	998 <__udivsi3>
     a3c:	40b00533          	neg	a0,a1
     a40:	00028067          	jr	t0

00000a44 <memset>:
     a44:	00c50633          	add	a2,a0,a2
     a48:	00050793          	mv	a5,a0
     a4c:	00c79463          	bne	a5,a2,a54 <memset+0x10>
     a50:	00008067          	ret
     a54:	00178793          	addi	a5,a5,1
     a58:	feb78fa3          	sb	a1,-1(a5)
     a5c:	ff1ff06f          	j	a4c <memset+0x8>

00000a60 <memcpy>:
     a60:	00000793          	li	a5,0
     a64:	00c79463          	bne	a5,a2,a6c <memcpy+0xc>
     a68:	00008067          	ret
     a6c:	00f58733          	add	a4,a1,a5
     a70:	00074683          	lbu	a3,0(a4)
     a74:	00f50733          	add	a4,a0,a5
     a78:	00178793          	addi	a5,a5,1
     a7c:	00d70023          	sb	a3,0(a4)
     a80:	fe5ff06f          	j	a64 <memcpy+0x4>

00000a84 <strlen>:
     a84:	00000793          	li	a5,0
     a88:	00f50733          	add	a4,a0,a5
     a8c:	00074703          	lbu	a4,0(a4)
     a90:	00071663          	bnez	a4,a9c <strlen+0x18>
     a94:	00078513          	mv	a0,a5
     a98:	00008067          	ret
     a9c:	00178793          	addi	a5,a5,1
     aa0:	fe9ff06f          	j	a88 <strlen+0x4>

00000aa4 <strncmp>:
     aa4:	00000793          	li	a5,0
     aa8:	00c79663          	bne	a5,a2,ab4 <strncmp+0x10>
     aac:	00000513          	li	a0,0
     ab0:	00008067          	ret
     ab4:	00f50733          	add	a4,a0,a5
     ab8:	00074683          	lbu	a3,0(a4)
     abc:	00f58733          	add	a4,a1,a5
     ac0:	00074703          	lbu	a4,0(a4)
     ac4:	00e6e863          	bltu	a3,a4,ad4 <strncmp+0x30>
     ac8:	00d76a63          	bltu	a4,a3,adc <strncmp+0x38>
     acc:	00178793          	addi	a5,a5,1
     ad0:	fd9ff06f          	j	aa8 <strncmp+0x4>
     ad4:	fff00513          	li	a0,-1
     ad8:	00008067          	ret
     adc:	00100513          	li	a0,1
     ae0:	00008067          	ret

00000ae4 <strncpy>:
     ae4:	00000793          	li	a5,0
     ae8:	00c79463          	bne	a5,a2,af0 <strncpy+0xc>
     aec:	00008067          	ret
     af0:	00f58733          	add	a4,a1,a5
     af4:	00074683          	lbu	a3,0(a4)
     af8:	00f50733          	add	a4,a0,a5
     afc:	00178793          	addi	a5,a5,1
     b00:	00d70023          	sb	a3,0(a4)
     b04:	fe5ff06f          	j	ae8 <strncpy+0x4>

00000b08 <oled_wait>:
     b08:	00000013          	nop
     b0c:	00000013          	nop
     b10:	00000013          	nop
     b14:	00000013          	nop
     b18:	00000013          	nop
     b1c:	00000013          	nop
     b20:	00000013          	nop
     b24:	00008067          	ret

00000b28 <oled_init_mode>:
     b28:	000047b7          	lui	a5,0x4
     b2c:	dbc7a703          	lw	a4,-580(a5) # 3dbc <OLED_RST>
     b30:	fe010113          	addi	sp,sp,-32
     b34:	00112e23          	sw	ra,28(sp)
     b38:	00812c23          	sw	s0,24(sp)
     b3c:	00072023          	sw	zero,0(a4)
     b40:	00040737          	lui	a4,0x40
     b44:	00000013          	nop
     b48:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
     b4c:	fe071ce3          	bnez	a4,b44 <oled_init_mode+0x1c>
     b50:	dbc7a703          	lw	a4,-580(a5)
     b54:	00100693          	li	a3,1
     b58:	00d72023          	sw	a3,0(a4)
     b5c:	00040737          	lui	a4,0x40
     b60:	00000013          	nop
     b64:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
     b68:	fe071ce3          	bnez	a4,b60 <oled_init_mode+0x38>
     b6c:	dbc7a783          	lw	a5,-580(a5)
     b70:	0007a023          	sw	zero,0(a5)
     b74:	000407b7          	lui	a5,0x40
     b78:	00000013          	nop
     b7c:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
     b80:	fe079ce3          	bnez	a5,b78 <oled_init_mode+0x50>
     b84:	00004737          	lui	a4,0x4
     b88:	dc072783          	lw	a5,-576(a4) # 3dc0 <OLED>
     b8c:	2af00693          	li	a3,687
     b90:	00d7a023          	sw	a3,0(a5)
     b94:	000407b7          	lui	a5,0x40
     b98:	00000013          	nop
     b9c:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
     ba0:	fe079ce3          	bnez	a5,b98 <oled_init_mode+0x70>
     ba4:	dc072403          	lw	s0,-576(a4)
     ba8:	2a000793          	li	a5,672
     bac:	00a12623          	sw	a0,12(sp)
     bb0:	00f42023          	sw	a5,0(s0)
     bb4:	00000097          	auipc	ra,0x0
     bb8:	f54080e7          	jalr	-172(ra) # b08 <oled_wait>
     bbc:	00c12503          	lw	a0,12(sp)
     bc0:	4a000793          	li	a5,1184
     bc4:	00050463          	beqz	a0,bcc <oled_init_mode+0xa4>
     bc8:	42000793          	li	a5,1056
     bcc:	00f42023          	sw	a5,0(s0)
     bd0:	00000097          	auipc	ra,0x0
     bd4:	f38080e7          	jalr	-200(ra) # b08 <oled_wait>
     bd8:	2fd00793          	li	a5,765
     bdc:	00f42023          	sw	a5,0(s0)
     be0:	00000097          	auipc	ra,0x0
     be4:	f28080e7          	jalr	-216(ra) # b08 <oled_wait>
     be8:	4b100793          	li	a5,1201
     bec:	00f42023          	sw	a5,0(s0)
     bf0:	00000097          	auipc	ra,0x0
     bf4:	f18080e7          	jalr	-232(ra) # b08 <oled_wait>
     bf8:	2a200793          	li	a5,674
     bfc:	00f42023          	sw	a5,0(s0)
     c00:	00000097          	auipc	ra,0x0
     c04:	f08080e7          	jalr	-248(ra) # b08 <oled_wait>
     c08:	40000793          	li	a5,1024
     c0c:	00f42023          	sw	a5,0(s0)
     c10:	01812403          	lw	s0,24(sp)
     c14:	01c12083          	lw	ra,28(sp)
     c18:	02010113          	addi	sp,sp,32
     c1c:	00000317          	auipc	t1,0x0
     c20:	eec30067          	jr	-276(t1) # b08 <oled_wait>

00000c24 <oled_init>:
     c24:	00000513          	li	a0,0
     c28:	00000317          	auipc	t1,0x0
     c2c:	f0030067          	jr	-256(t1) # b28 <oled_init_mode>

00000c30 <oled_fullscreen>:
     c30:	ff010113          	addi	sp,sp,-16
     c34:	000047b7          	lui	a5,0x4
     c38:	00812423          	sw	s0,8(sp)
     c3c:	dc07a403          	lw	s0,-576(a5) # 3dc0 <OLED>
     c40:	00112623          	sw	ra,12(sp)
     c44:	00912223          	sw	s1,4(sp)
     c48:	01212023          	sw	s2,0(sp)
     c4c:	21500793          	li	a5,533
     c50:	00f42023          	sw	a5,0(s0)
     c54:	40000913          	li	s2,1024
     c58:	00000097          	auipc	ra,0x0
     c5c:	eb0080e7          	jalr	-336(ra) # b08 <oled_wait>
     c60:	47f00493          	li	s1,1151
     c64:	01242023          	sw	s2,0(s0)
     c68:	00000097          	auipc	ra,0x0
     c6c:	ea0080e7          	jalr	-352(ra) # b08 <oled_wait>
     c70:	00942023          	sw	s1,0(s0)
     c74:	00000097          	auipc	ra,0x0
     c78:	e94080e7          	jalr	-364(ra) # b08 <oled_wait>
     c7c:	27500793          	li	a5,629
     c80:	00f42023          	sw	a5,0(s0)
     c84:	00000097          	auipc	ra,0x0
     c88:	e84080e7          	jalr	-380(ra) # b08 <oled_wait>
     c8c:	01242023          	sw	s2,0(s0)
     c90:	00000097          	auipc	ra,0x0
     c94:	e78080e7          	jalr	-392(ra) # b08 <oled_wait>
     c98:	00942023          	sw	s1,0(s0)
     c9c:	00000097          	auipc	ra,0x0
     ca0:	e6c080e7          	jalr	-404(ra) # b08 <oled_wait>
     ca4:	25c00793          	li	a5,604
     ca8:	00f42023          	sw	a5,0(s0)
     cac:	00812403          	lw	s0,8(sp)
     cb0:	00c12083          	lw	ra,12(sp)
     cb4:	00412483          	lw	s1,4(sp)
     cb8:	00012903          	lw	s2,0(sp)
     cbc:	01010113          	addi	sp,sp,16
     cc0:	00000317          	auipc	t1,0x0
     cc4:	e4830067          	jr	-440(t1) # b08 <oled_wait>

00000cc8 <oled_clear>:
     cc8:	fe010113          	addi	sp,sp,-32
     ccc:	000047b7          	lui	a5,0x4
     cd0:	01312623          	sw	s3,12(sp)
     cd4:	dc07a983          	lw	s3,-576(a5) # 3dc0 <OLED>
     cd8:	00812c23          	sw	s0,24(sp)
     cdc:	01212823          	sw	s2,16(sp)
     ce0:	00112e23          	sw	ra,28(sp)
     ce4:	00912a23          	sw	s1,20(sp)
     ce8:	08000913          	li	s2,128
     cec:	40056413          	ori	s0,a0,1024
     cf0:	08000493          	li	s1,128
     cf4:	0089a023          	sw	s0,0(s3)
     cf8:	00000097          	auipc	ra,0x0
     cfc:	e10080e7          	jalr	-496(ra) # b08 <oled_wait>
     d00:	0089a023          	sw	s0,0(s3)
     d04:	00000097          	auipc	ra,0x0
     d08:	e04080e7          	jalr	-508(ra) # b08 <oled_wait>
     d0c:	fff48493          	addi	s1,s1,-1
     d10:	0089a023          	sw	s0,0(s3)
     d14:	00000097          	auipc	ra,0x0
     d18:	df4080e7          	jalr	-524(ra) # b08 <oled_wait>
     d1c:	fc049ce3          	bnez	s1,cf4 <oled_clear+0x2c>
     d20:	fff90913          	addi	s2,s2,-1
     d24:	fc0916e3          	bnez	s2,cf0 <oled_clear+0x28>
     d28:	01c12083          	lw	ra,28(sp)
     d2c:	01812403          	lw	s0,24(sp)
     d30:	01412483          	lw	s1,20(sp)
     d34:	01012903          	lw	s2,16(sp)
     d38:	00c12983          	lw	s3,12(sp)
     d3c:	02010113          	addi	sp,sp,32
     d40:	00008067          	ret

00000d44 <oled_wait>:
     d44:	00000013          	nop
     d48:	00000013          	nop
     d4c:	00000013          	nop
     d50:	00000013          	nop
     d54:	00000013          	nop
     d58:	00000013          	nop
     d5c:	00000013          	nop
     d60:	00008067          	ret

00000d64 <display_set_cursor>:
     d64:	000047b7          	lui	a5,0x4
     d68:	0aa7a823          	sw	a0,176(a5) # 40b0 <cursor_x>
     d6c:	000047b7          	lui	a5,0x4
     d70:	0ab7a623          	sw	a1,172(a5) # 40ac <cursor_y>
     d74:	00008067          	ret

00000d78 <display_set_front_back_color>:
     d78:	000047b7          	lui	a5,0x4
     d7c:	0aa784a3          	sb	a0,169(a5) # 40a9 <front_color>
     d80:	000047b7          	lui	a5,0x4
     d84:	0ab78423          	sb	a1,168(a5) # 40a8 <back_color>
     d88:	00008067          	ret

00000d8c <display_putchar>:
     d8c:	00a00793          	li	a5,10
     d90:	00004737          	lui	a4,0x4
     d94:	02f51663          	bne	a0,a5,dc0 <display_putchar+0x34>
     d98:	0a072823          	sw	zero,176(a4) # 40b0 <cursor_x>
     d9c:	00004737          	lui	a4,0x4
     da0:	0ac72783          	lw	a5,172(a4) # 40ac <cursor_y>
     da4:	00878793          	addi	a5,a5,8
     da8:	0af72623          	sw	a5,172(a4)
     dac:	07f00713          	li	a4,127
     db0:	10f75263          	bge	a4,a5,eb4 <display_putchar+0x128>
     db4:	000047b7          	lui	a5,0x4
     db8:	0a07a623          	sw	zero,172(a5) # 40ac <cursor_y>
     dbc:	00008067          	ret
     dc0:	01f00793          	li	a5,31
     dc4:	0ca7d063          	bge	a5,a0,e84 <display_putchar+0xf8>
     dc8:	000047b7          	lui	a5,0x4
     dcc:	0ac7a783          	lw	a5,172(a5) # 40ac <cursor_y>
     dd0:	07800693          	li	a3,120
     dd4:	00800593          	li	a1,8
     dd8:	00f6d663          	bge	a3,a5,de4 <display_putchar+0x58>
     ddc:	08000593          	li	a1,128
     de0:	40f585b3          	sub	a1,a1,a5
     de4:	0b072683          	lw	a3,176(a4)
     de8:	07b00613          	li	a2,123
     dec:	00500813          	li	a6,5
     df0:	00d65663          	bge	a2,a3,dfc <display_putchar+0x70>
     df4:	08000813          	li	a6,128
     df8:	40d80833          	sub	a6,a6,a3
     dfc:	00004637          	lui	a2,0x4
     e00:	0a864283          	lbu	t0,168(a2) # 40a8 <back_color>
     e04:	00004637          	lui	a2,0x4
     e08:	0a964383          	lbu	t2,169(a2) # 40a9 <front_color>
     e0c:	00005637          	lui	a2,0x5
     e10:	95060613          	addi	a2,a2,-1712 # 4950 <framebuffer>
     e14:	00c787b3          	add	a5,a5,a2
     e18:	00769693          	slli	a3,a3,0x7
     e1c:	00d787b3          	add	a5,a5,a3
     e20:	00004637          	lui	a2,0x4
     e24:	00251693          	slli	a3,a0,0x2
     e28:	e8c60613          	addi	a2,a2,-372 # 3e8c <font>
     e2c:	00a686b3          	add	a3,a3,a0
     e30:	00c686b3          	add	a3,a3,a2
     e34:	00100f93          	li	t6,1
     e38:	00000613          	li	a2,0
     e3c:	04b65463          	bge	a2,a1,e84 <display_putchar+0xf8>
     e40:	00cf9f33          	sll	t5,t6,a2
     e44:	00f60333          	add	t1,a2,a5
     e48:	00068893          	mv	a7,a3
     e4c:	00000513          	li	a0,0
     e50:	0280006f          	j	e78 <display_putchar+0xec>
     e54:	f608ce03          	lbu	t3,-160(a7)
     e58:	00038e93          	mv	t4,t2
     e5c:	01ee7e33          	and	t3,t3,t5
     e60:	000e1463          	bnez	t3,e68 <display_putchar+0xdc>
     e64:	00028e93          	mv	t4,t0
     e68:	01d30023          	sb	t4,0(t1)
     e6c:	00150513          	addi	a0,a0,1
     e70:	08030313          	addi	t1,t1,128
     e74:	00188893          	addi	a7,a7,1
     e78:	fd054ee3          	blt	a0,a6,e54 <display_putchar+0xc8>
     e7c:	00160613          	addi	a2,a2,1
     e80:	fbdff06f          	j	e3c <display_putchar+0xb0>
     e84:	0b072783          	lw	a5,176(a4)
     e88:	07f00693          	li	a3,127
     e8c:	00578793          	addi	a5,a5,5
     e90:	00f6c663          	blt	a3,a5,e9c <display_putchar+0x110>
     e94:	0af72823          	sw	a5,176(a4)
     e98:	00008067          	ret
     e9c:	0a072823          	sw	zero,176(a4)
     ea0:	00004737          	lui	a4,0x4
     ea4:	0ac72783          	lw	a5,172(a4) # 40ac <cursor_y>
     ea8:	00878793          	addi	a5,a5,8
     eac:	0af72623          	sw	a5,172(a4)
     eb0:	f0f6c2e3          	blt	a3,a5,db4 <display_putchar+0x28>
     eb4:	00008067          	ret

00000eb8 <display_refresh>:
     eb8:	fe010113          	addi	sp,sp,-32
     ebc:	000047b7          	lui	a5,0x4
     ec0:	01212823          	sw	s2,16(sp)
     ec4:	dc07a903          	lw	s2,-576(a5) # 3dc0 <OLED>
     ec8:	01312623          	sw	s3,12(sp)
     ecc:	000059b7          	lui	s3,0x5
     ed0:	00912a23          	sw	s1,20(sp)
     ed4:	01412423          	sw	s4,8(sp)
     ed8:	00112e23          	sw	ra,28(sp)
     edc:	00812c23          	sw	s0,24(sp)
     ee0:	00000493          	li	s1,0
     ee4:	95098993          	addi	s3,s3,-1712 # 4950 <framebuffer>
     ee8:	00004a37          	lui	s4,0x4
     eec:	013487b3          	add	a5,s1,s3
     ef0:	0007c403          	lbu	s0,0(a5)
     ef4:	00148493          	addi	s1,s1,1
     ef8:	00245413          	srli	s0,s0,0x2
     efc:	40046413          	ori	s0,s0,1024
     f00:	00892023          	sw	s0,0(s2)
     f04:	00000097          	auipc	ra,0x0
     f08:	e40080e7          	jalr	-448(ra) # d44 <oled_wait>
     f0c:	00892023          	sw	s0,0(s2)
     f10:	00000097          	auipc	ra,0x0
     f14:	e34080e7          	jalr	-460(ra) # d44 <oled_wait>
     f18:	00892023          	sw	s0,0(s2)
     f1c:	00000097          	auipc	ra,0x0
     f20:	e28080e7          	jalr	-472(ra) # d44 <oled_wait>
     f24:	fd4494e3          	bne	s1,s4,eec <display_refresh+0x34>
     f28:	01c12083          	lw	ra,28(sp)
     f2c:	01812403          	lw	s0,24(sp)
     f30:	01412483          	lw	s1,20(sp)
     f34:	01012903          	lw	s2,16(sp)
     f38:	00c12983          	lw	s3,12(sp)
     f3c:	00812a03          	lw	s4,8(sp)
     f40:	02010113          	addi	sp,sp,32
     f44:	00008067          	ret

00000f48 <print_string>:
     f48:	ff010113          	addi	sp,sp,-16
     f4c:	00812423          	sw	s0,8(sp)
     f50:	00912223          	sw	s1,4(sp)
     f54:	00112623          	sw	ra,12(sp)
     f58:	00050413          	mv	s0,a0
     f5c:	000044b7          	lui	s1,0x4
     f60:	00044503          	lbu	a0,0(s0)
     f64:	00051c63          	bnez	a0,f7c <print_string+0x34>
     f68:	00c12083          	lw	ra,12(sp)
     f6c:	00812403          	lw	s0,8(sp)
     f70:	00412483          	lw	s1,4(sp)
     f74:	01010113          	addi	sp,sp,16
     f78:	00008067          	ret
     f7c:	0b44a783          	lw	a5,180(s1) # 40b4 <f_putchar>
     f80:	00140413          	addi	s0,s0,1
     f84:	000780e7          	jalr	a5
     f88:	fd9ff06f          	j	f60 <print_string+0x18>

00000f8c <print_dec>:
     f8c:	ef010113          	addi	sp,sp,-272
     f90:	10812423          	sw	s0,264(sp)
     f94:	10912223          	sw	s1,260(sp)
     f98:	10112623          	sw	ra,268(sp)
     f9c:	11212023          	sw	s2,256(sp)
     fa0:	00050413          	mv	s0,a0
     fa4:	000044b7          	lui	s1,0x4
     fa8:	08045063          	bgez	s0,1028 <print_dec+0x9c>
     fac:	0b44a783          	lw	a5,180(s1) # 40b4 <f_putchar>
     fb0:	02d00513          	li	a0,45
     fb4:	40800433          	neg	s0,s0
     fb8:	000780e7          	jalr	a5
     fbc:	fedff06f          	j	fa8 <print_dec+0x1c>
     fc0:	00040513          	mv	a0,s0
     fc4:	00a00593          	li	a1,10
     fc8:	00000097          	auipc	ra,0x0
     fcc:	9c8080e7          	jalr	-1592(ra) # 990 <__divsi3>
     fd0:	00251793          	slli	a5,a0,0x2
     fd4:	00f507b3          	add	a5,a0,a5
     fd8:	00179793          	slli	a5,a5,0x1
     fdc:	40f40433          	sub	s0,s0,a5
     fe0:	00148493          	addi	s1,s1,1
     fe4:	fe848fa3          	sb	s0,-1(s1)
     fe8:	00050413          	mv	s0,a0
     fec:	fc041ae3          	bnez	s0,fc0 <print_dec+0x34>
     ff0:	fd2488e3          	beq	s1,s2,fc0 <print_dec+0x34>
     ff4:	00004437          	lui	s0,0x4
     ff8:	fff4c503          	lbu	a0,-1(s1)
     ffc:	0b442783          	lw	a5,180(s0) # 40b4 <f_putchar>
    1000:	fff48493          	addi	s1,s1,-1
    1004:	03050513          	addi	a0,a0,48
    1008:	000780e7          	jalr	a5
    100c:	ff2496e3          	bne	s1,s2,ff8 <print_dec+0x6c>
    1010:	10c12083          	lw	ra,268(sp)
    1014:	10812403          	lw	s0,264(sp)
    1018:	10412483          	lw	s1,260(sp)
    101c:	10012903          	lw	s2,256(sp)
    1020:	11010113          	addi	sp,sp,272
    1024:	00008067          	ret
    1028:	00010493          	mv	s1,sp
    102c:	00010913          	mv	s2,sp
    1030:	fbdff06f          	j	fec <print_dec+0x60>

00001034 <print_hex_digits>:
    1034:	fe010113          	addi	sp,sp,-32
    1038:	00812c23          	sw	s0,24(sp)
    103c:	00912a23          	sw	s1,20(sp)
    1040:	fff58413          	addi	s0,a1,-1
    1044:	000044b7          	lui	s1,0x4
    1048:	01212823          	sw	s2,16(sp)
    104c:	01312623          	sw	s3,12(sp)
    1050:	00112e23          	sw	ra,28(sp)
    1054:	00050993          	mv	s3,a0
    1058:	00241413          	slli	s0,s0,0x2
    105c:	e4448493          	addi	s1,s1,-444 # 3e44 <LEDS+0x80>
    1060:	00004937          	lui	s2,0x4
    1064:	02045063          	bgez	s0,1084 <print_hex_digits+0x50>
    1068:	01c12083          	lw	ra,28(sp)
    106c:	01812403          	lw	s0,24(sp)
    1070:	01412483          	lw	s1,20(sp)
    1074:	01012903          	lw	s2,16(sp)
    1078:	00c12983          	lw	s3,12(sp)
    107c:	02010113          	addi	sp,sp,32
    1080:	00008067          	ret
    1084:	0089d7b3          	srl	a5,s3,s0
    1088:	00f7f793          	andi	a5,a5,15
    108c:	00f487b3          	add	a5,s1,a5
    1090:	0b492703          	lw	a4,180(s2) # 40b4 <f_putchar>
    1094:	0007c503          	lbu	a0,0(a5)
    1098:	ffc40413          	addi	s0,s0,-4
    109c:	000700e7          	jalr	a4
    10a0:	fc5ff06f          	j	1064 <print_hex_digits+0x30>

000010a4 <print_hex>:
    10a4:	00800593          	li	a1,8
    10a8:	00000317          	auipc	t1,0x0
    10ac:	f8c30067          	jr	-116(t1) # 1034 <print_hex_digits>

000010b0 <printf>:
    10b0:	fa010113          	addi	sp,sp,-96
    10b4:	04f12a23          	sw	a5,84(sp)
    10b8:	04410793          	addi	a5,sp,68
    10bc:	02812c23          	sw	s0,56(sp)
    10c0:	02912a23          	sw	s1,52(sp)
    10c4:	03212823          	sw	s2,48(sp)
    10c8:	03312623          	sw	s3,44(sp)
    10cc:	03412423          	sw	s4,40(sp)
    10d0:	03512223          	sw	s5,36(sp)
    10d4:	03612023          	sw	s6,32(sp)
    10d8:	02112e23          	sw	ra,60(sp)
    10dc:	01712e23          	sw	s7,28(sp)
    10e0:	00050413          	mv	s0,a0
    10e4:	04b12223          	sw	a1,68(sp)
    10e8:	04c12423          	sw	a2,72(sp)
    10ec:	04d12623          	sw	a3,76(sp)
    10f0:	04e12823          	sw	a4,80(sp)
    10f4:	05012c23          	sw	a6,88(sp)
    10f8:	05112e23          	sw	a7,92(sp)
    10fc:	00f12623          	sw	a5,12(sp)
    1100:	02500913          	li	s2,37
    1104:	000044b7          	lui	s1,0x4
    1108:	07300993          	li	s3,115
    110c:	07800a13          	li	s4,120
    1110:	06400a93          	li	s5,100
    1114:	06300b13          	li	s6,99
    1118:	00044503          	lbu	a0,0(s0)
    111c:	02051863          	bnez	a0,114c <printf+0x9c>
    1120:	03c12083          	lw	ra,60(sp)
    1124:	03812403          	lw	s0,56(sp)
    1128:	03412483          	lw	s1,52(sp)
    112c:	03012903          	lw	s2,48(sp)
    1130:	02c12983          	lw	s3,44(sp)
    1134:	02812a03          	lw	s4,40(sp)
    1138:	02412a83          	lw	s5,36(sp)
    113c:	02012b03          	lw	s6,32(sp)
    1140:	01c12b83          	lw	s7,28(sp)
    1144:	06010113          	addi	sp,sp,96
    1148:	00008067          	ret
    114c:	09251a63          	bne	a0,s2,11e0 <printf+0x130>
    1150:	00144503          	lbu	a0,1(s0)
    1154:	00140b93          	addi	s7,s0,1
    1158:	03351463          	bne	a0,s3,1180 <printf+0xd0>
    115c:	00c12783          	lw	a5,12(sp)
    1160:	0007a503          	lw	a0,0(a5)
    1164:	00478713          	addi	a4,a5,4
    1168:	00e12623          	sw	a4,12(sp)
    116c:	00000097          	auipc	ra,0x0
    1170:	ddc080e7          	jalr	-548(ra) # f48 <print_string>
    1174:	000b8413          	mv	s0,s7
    1178:	00140413          	addi	s0,s0,1
    117c:	f9dff06f          	j	1118 <printf+0x68>
    1180:	03451063          	bne	a0,s4,11a0 <printf+0xf0>
    1184:	00c12783          	lw	a5,12(sp)
    1188:	0007a503          	lw	a0,0(a5)
    118c:	00478713          	addi	a4,a5,4
    1190:	00e12623          	sw	a4,12(sp)
    1194:	00000097          	auipc	ra,0x0
    1198:	f10080e7          	jalr	-240(ra) # 10a4 <print_hex>
    119c:	fd9ff06f          	j	1174 <printf+0xc4>
    11a0:	03551063          	bne	a0,s5,11c0 <printf+0x110>
    11a4:	00c12783          	lw	a5,12(sp)
    11a8:	0007a503          	lw	a0,0(a5)
    11ac:	00478713          	addi	a4,a5,4
    11b0:	00e12623          	sw	a4,12(sp)
    11b4:	00000097          	auipc	ra,0x0
    11b8:	dd8080e7          	jalr	-552(ra) # f8c <print_dec>
    11bc:	fb9ff06f          	j	1174 <printf+0xc4>
    11c0:	0b44a783          	lw	a5,180(s1) # 40b4 <f_putchar>
    11c4:	01651a63          	bne	a0,s6,11d8 <printf+0x128>
    11c8:	00c12703          	lw	a4,12(sp)
    11cc:	00072503          	lw	a0,0(a4)
    11d0:	00470693          	addi	a3,a4,4
    11d4:	00d12623          	sw	a3,12(sp)
    11d8:	000780e7          	jalr	a5
    11dc:	f99ff06f          	j	1174 <printf+0xc4>
    11e0:	0b44a783          	lw	a5,180(s1)
    11e4:	000780e7          	jalr	a5
    11e8:	f91ff06f          	j	1178 <printf+0xc8>

000011ec <__mulsi3>:
    11ec:	00050793          	mv	a5,a0
    11f0:	00000513          	li	a0,0
    11f4:	00079463          	bnez	a5,11fc <__mulsi3+0x10>
    11f8:	00008067          	ret
    11fc:	01f79693          	slli	a3,a5,0x1f
    1200:	41f6d713          	srai	a4,a3,0x1f
    1204:	00b77733          	and	a4,a4,a1
    1208:	00e50533          	add	a0,a0,a4
    120c:	0017d793          	srli	a5,a5,0x1
    1210:	00159593          	slli	a1,a1,0x1
    1214:	fe1ff06f          	j	11f4 <__mulsi3+0x8>

00001218 <fat_list_insert_last>:
    1218:	00452783          	lw	a5,4(a0)
    121c:	04079263          	bnez	a5,1260 <fat_list_insert_last+0x48>
    1220:	00052783          	lw	a5,0(a0)
    1224:	00079c63          	bnez	a5,123c <fat_list_insert_last+0x24>
    1228:	00b52023          	sw	a1,0(a0)
    122c:	00b52223          	sw	a1,4(a0)
    1230:	0005a023          	sw	zero,0(a1)
    1234:	0005a223          	sw	zero,4(a1)
    1238:	00008067          	ret
    123c:	0007a703          	lw	a4,0(a5)
    1240:	00f5a223          	sw	a5,4(a1)
    1244:	00e5a023          	sw	a4,0(a1)
    1248:	00071863          	bnez	a4,1258 <fat_list_insert_last+0x40>
    124c:	00b52023          	sw	a1,0(a0)
    1250:	00b7a023          	sw	a1,0(a5)
    1254:	00008067          	ret
    1258:	00b72223          	sw	a1,4(a4)
    125c:	ff5ff06f          	j	1250 <fat_list_insert_last+0x38>
    1260:	0047a703          	lw	a4,4(a5)
    1264:	00f5a023          	sw	a5,0(a1)
    1268:	00e5a223          	sw	a4,4(a1)
    126c:	00071863          	bnez	a4,127c <fat_list_insert_last+0x64>
    1270:	00b52223          	sw	a1,4(a0)
    1274:	00b7a223          	sw	a1,4(a5)
    1278:	00008067          	ret
    127c:	00b72023          	sw	a1,0(a4)
    1280:	ff5ff06f          	j	1274 <fat_list_insert_last+0x5c>

00001284 <FileString_StrCmpNoCase>:
    1284:	00050e93          	mv	t4,a0
    1288:	00000793          	li	a5,0
    128c:	01900e13          	li	t3,25
    1290:	00c79663          	bne	a5,a2,129c <FileString_StrCmpNoCase+0x18>
    1294:	00000513          	li	a0,0
    1298:	00008067          	ret
    129c:	00fe8733          	add	a4,t4,a5
    12a0:	00074803          	lbu	a6,0(a4)
    12a4:	00f58733          	add	a4,a1,a5
    12a8:	00074883          	lbu	a7,0(a4)
    12ac:	fbf80713          	addi	a4,a6,-65
    12b0:	0ff77713          	zext.b	a4,a4
    12b4:	00080693          	mv	a3,a6
    12b8:	00ee6663          	bltu	t3,a4,12c4 <FileString_StrCmpNoCase+0x40>
    12bc:	02080693          	addi	a3,a6,32
    12c0:	0ff6f693          	zext.b	a3,a3
    12c4:	fbf88313          	addi	t1,a7,-65
    12c8:	0ff37313          	zext.b	t1,t1
    12cc:	00088713          	mv	a4,a7
    12d0:	006e6663          	bltu	t3,t1,12dc <FileString_StrCmpNoCase+0x58>
    12d4:	02088713          	addi	a4,a7,32
    12d8:	0ff77713          	zext.b	a4,a4
    12dc:	40e68533          	sub	a0,a3,a4
    12e0:	00e69863          	bne	a3,a4,12f0 <FileString_StrCmpNoCase+0x6c>
    12e4:	00178793          	addi	a5,a5,1
    12e8:	00088463          	beqz	a7,12f0 <FileString_StrCmpNoCase+0x6c>
    12ec:	fa0812e3          	bnez	a6,1290 <FileString_StrCmpNoCase+0xc>
    12f0:	00008067          	ret

000012f4 <FileString_GetExtension>:
    12f4:	00050793          	mv	a5,a0
    12f8:	fff00713          	li	a4,-1
    12fc:	02e00613          	li	a2,46
    1300:	0007c683          	lbu	a3,0(a5)
    1304:	00069663          	bnez	a3,1310 <FileString_GetExtension+0x1c>
    1308:	00070513          	mv	a0,a4
    130c:	00008067          	ret
    1310:	00c69463          	bne	a3,a2,1318 <FileString_GetExtension+0x24>
    1314:	40a78733          	sub	a4,a5,a0
    1318:	00178793          	addi	a5,a5,1
    131c:	fe5ff06f          	j	1300 <FileString_GetExtension+0xc>

00001320 <fatfs_fat_writeback>:
    1320:	00059e63          	bnez	a1,133c <fatfs_fat_writeback+0x1c>
    1324:	00000513          	li	a0,0
    1328:	00008067          	ret
    132c:	00000513          	li	a0,0
    1330:	01c12083          	lw	ra,28(sp)
    1334:	02010113          	addi	sp,sp,32
    1338:	00008067          	ret
    133c:	2045a783          	lw	a5,516(a1)
    1340:	04078e63          	beqz	a5,139c <fatfs_fat_writeback+0x7c>
    1344:	03852683          	lw	a3,56(a0)
    1348:	00050793          	mv	a5,a0
    134c:	04068663          	beqz	a3,1398 <fatfs_fat_writeback+0x78>
    1350:	0147a703          	lw	a4,20(a5)
    1354:	2005a503          	lw	a0,512(a1)
    1358:	0207a803          	lw	a6,32(a5)
    135c:	00100613          	li	a2,1
    1360:	fe010113          	addi	sp,sp,-32
    1364:	40e607b3          	sub	a5,a2,a4
    1368:	00112e23          	sw	ra,28(sp)
    136c:	00a787b3          	add	a5,a5,a0
    1370:	00f87663          	bgeu	a6,a5,137c <fatfs_fat_writeback+0x5c>
    1374:	01070733          	add	a4,a4,a6
    1378:	40a70633          	sub	a2,a4,a0
    137c:	00b12623          	sw	a1,12(sp)
    1380:	000680e7          	jalr	a3
    1384:	fa0504e3          	beqz	a0,132c <fatfs_fat_writeback+0xc>
    1388:	00c12583          	lw	a1,12(sp)
    138c:	00100513          	li	a0,1
    1390:	2005a223          	sw	zero,516(a1)
    1394:	f9dff06f          	j	1330 <fatfs_fat_writeback+0x10>
    1398:	2005a223          	sw	zero,516(a1)
    139c:	00100513          	li	a0,1
    13a0:	00008067          	ret

000013a4 <fatfs_fat_read_sector>:
    13a4:	fe010113          	addi	sp,sp,-32
    13a8:	01212823          	sw	s2,16(sp)
    13ac:	25452903          	lw	s2,596(a0)
    13b0:	00812c23          	sw	s0,24(sp)
    13b4:	00112e23          	sw	ra,28(sp)
    13b8:	00912a23          	sw	s1,20(sp)
    13bc:	01312623          	sw	s3,12(sp)
    13c0:	00000413          	li	s0,0
    13c4:	04091463          	bnez	s2,140c <fatfs_fat_read_sector+0x68>
    13c8:	25452783          	lw	a5,596(a0)
    13cc:	00058493          	mv	s1,a1
    13d0:	00050993          	mv	s3,a0
    13d4:	20f42623          	sw	a5,524(s0)
    13d8:	20442783          	lw	a5,516(s0)
    13dc:	24852a23          	sw	s0,596(a0)
    13e0:	08079863          	bnez	a5,1470 <fatfs_fat_read_sector+0xcc>
    13e4:	0349a783          	lw	a5,52(s3)
    13e8:	20942023          	sw	s1,512(s0)
    13ec:	00100613          	li	a2,1
    13f0:	00040593          	mv	a1,s0
    13f4:	00048513          	mv	a0,s1
    13f8:	000780e7          	jalr	a5
    13fc:	08051463          	bnez	a0,1484 <fatfs_fat_read_sector+0xe0>
    1400:	fff00793          	li	a5,-1
    1404:	20f42023          	sw	a5,512(s0)
    1408:	0480006f          	j	1450 <fatfs_fat_read_sector+0xac>
    140c:	20092783          	lw	a5,512(s2)
    1410:	00f5e663          	bltu	a1,a5,141c <fatfs_fat_read_sector+0x78>
    1414:	00178713          	addi	a4,a5,1
    1418:	02e5e463          	bltu	a1,a4,1440 <fatfs_fat_read_sector+0x9c>
    141c:	20c92783          	lw	a5,524(s2)
    1420:	00079663          	bnez	a5,142c <fatfs_fat_read_sector+0x88>
    1424:	00040a63          	beqz	s0,1438 <fatfs_fat_read_sector+0x94>
    1428:	20042623          	sw	zero,524(s0)
    142c:	00090413          	mv	s0,s2
    1430:	20c92903          	lw	s2,524(s2)
    1434:	f91ff06f          	j	13c4 <fatfs_fat_read_sector+0x20>
    1438:	24052a23          	sw	zero,596(a0)
    143c:	ff1ff06f          	j	142c <fatfs_fat_read_sector+0x88>
    1440:	40f585b3          	sub	a1,a1,a5
    1444:	00959593          	slli	a1,a1,0x9
    1448:	00b905b3          	add	a1,s2,a1
    144c:	20b92423          	sw	a1,520(s2)
    1450:	01c12083          	lw	ra,28(sp)
    1454:	01812403          	lw	s0,24(sp)
    1458:	01412483          	lw	s1,20(sp)
    145c:	00c12983          	lw	s3,12(sp)
    1460:	00090513          	mv	a0,s2
    1464:	01012903          	lw	s2,16(sp)
    1468:	02010113          	addi	sp,sp,32
    146c:	00008067          	ret
    1470:	00040593          	mv	a1,s0
    1474:	00000097          	auipc	ra,0x0
    1478:	eac080e7          	jalr	-340(ra) # 1320 <fatfs_fat_writeback>
    147c:	f60514e3          	bnez	a0,13e4 <fatfs_fat_read_sector+0x40>
    1480:	fd1ff06f          	j	1450 <fatfs_fat_read_sector+0xac>
    1484:	20842423          	sw	s0,520(s0)
    1488:	00040913          	mv	s2,s0
    148c:	fc5ff06f          	j	1450 <fatfs_fat_read_sector+0xac>

00001490 <_allocate_file>:
    1490:	000047b7          	lui	a5,0x4
    1494:	0b878793          	addi	a5,a5,184 # 40b8 <_free_file_list>
    1498:	0007a583          	lw	a1,0(a5)
    149c:	06058263          	beqz	a1,1500 <_allocate_file+0x70>
    14a0:	0005a703          	lw	a4,0(a1)
    14a4:	fe010113          	addi	sp,sp,-32
    14a8:	00112e23          	sw	ra,28(sp)
    14ac:	0045a683          	lw	a3,4(a1)
    14b0:	04071063          	bnez	a4,14f0 <_allocate_file+0x60>
    14b4:	00d7a023          	sw	a3,0(a5)
    14b8:	0045a683          	lw	a3,4(a1)
    14bc:	02069e63          	bnez	a3,14f8 <_allocate_file+0x68>
    14c0:	00e7a223          	sw	a4,4(a5)
    14c4:	00004537          	lui	a0,0x4
    14c8:	0c050513          	addi	a0,a0,192 # 40c0 <_open_file_list>
    14cc:	00b12623          	sw	a1,12(sp)
    14d0:	00000097          	auipc	ra,0x0
    14d4:	d48080e7          	jalr	-696(ra) # 1218 <fat_list_insert_last>
    14d8:	00c12583          	lw	a1,12(sp)
    14dc:	01c12083          	lw	ra,28(sp)
    14e0:	bc458593          	addi	a1,a1,-1084
    14e4:	00058513          	mv	a0,a1
    14e8:	02010113          	addi	sp,sp,32
    14ec:	00008067          	ret
    14f0:	00d72223          	sw	a3,4(a4)
    14f4:	fc5ff06f          	j	14b8 <_allocate_file+0x28>
    14f8:	00e6a023          	sw	a4,0(a3)
    14fc:	fc9ff06f          	j	14c4 <_allocate_file+0x34>
    1500:	00058513          	mv	a0,a1
    1504:	00008067          	ret

00001508 <_free_file>:
    1508:	43c52783          	lw	a5,1084(a0)
    150c:	44052703          	lw	a4,1088(a0)
    1510:	43c50593          	addi	a1,a0,1084
    1514:	02079663          	bnez	a5,1540 <_free_file+0x38>
    1518:	000046b7          	lui	a3,0x4
    151c:	0ce6a023          	sw	a4,192(a3) # 40c0 <_open_file_list>
    1520:	44052703          	lw	a4,1088(a0)
    1524:	02071263          	bnez	a4,1548 <_free_file+0x40>
    1528:	00004737          	lui	a4,0x4
    152c:	0cf72223          	sw	a5,196(a4) # 40c4 <_open_file_list+0x4>
    1530:	00004537          	lui	a0,0x4
    1534:	0b850513          	addi	a0,a0,184 # 40b8 <_free_file_list>
    1538:	00000317          	auipc	t1,0x0
    153c:	ce030067          	jr	-800(t1) # 1218 <fat_list_insert_last>
    1540:	00e7a223          	sw	a4,4(a5)
    1544:	fddff06f          	j	1520 <_free_file+0x18>
    1548:	00f72023          	sw	a5,0(a4)
    154c:	fe5ff06f          	j	1530 <_free_file+0x28>

00001550 <fatfs_lba_of_cluster>:
    1550:	ff010113          	addi	sp,sp,-16
    1554:	00812423          	sw	s0,8(sp)
    1558:	00112623          	sw	ra,12(sp)
    155c:	00050413          	mv	s0,a0
    1560:	ffe58513          	addi	a0,a1,-2
    1564:	00044583          	lbu	a1,0(s0)
    1568:	00000097          	auipc	ra,0x0
    156c:	c84080e7          	jalr	-892(ra) # 11ec <__mulsi3>
    1570:	00442783          	lw	a5,4(s0)
    1574:	00f50533          	add	a0,a0,a5
    1578:	03042783          	lw	a5,48(s0)
    157c:	00079863          	bnez	a5,158c <fatfs_lba_of_cluster+0x3c>
    1580:	02845783          	lhu	a5,40(s0)
    1584:	4047d793          	srai	a5,a5,0x4
    1588:	00f50533          	add	a0,a0,a5
    158c:	00c12083          	lw	ra,12(sp)
    1590:	00812403          	lw	s0,8(sp)
    1594:	01010113          	addi	sp,sp,16
    1598:	00008067          	ret

0000159c <fatfs_write_sector>:
    159c:	03852703          	lw	a4,56(a0)
    15a0:	0a070463          	beqz	a4,1648 <fatfs_write_sector+0xac>
    15a4:	03052883          	lw	a7,48(a0)
    15a8:	00050793          	mv	a5,a0
    15ac:	0115e833          	or	a6,a1,a7
    15b0:	02081e63          	bnez	a6,15ec <fatfs_write_sector+0x50>
    15b4:	01052583          	lw	a1,16(a0)
    15b8:	08b67863          	bgeu	a2,a1,1648 <fatfs_write_sector+0xac>
    15bc:	01c52503          	lw	a0,28(a0)
    15c0:	00c7a583          	lw	a1,12(a5)
    15c4:	00b50533          	add	a0,a0,a1
    15c8:	00c50533          	add	a0,a0,a2
    15cc:	00068863          	beqz	a3,15dc <fatfs_write_sector+0x40>
    15d0:	00100613          	li	a2,1
    15d4:	00068593          	mv	a1,a3
    15d8:	00070067          	jr	a4
    15dc:	24a7a223          	sw	a0,580(a5)
    15e0:	00100613          	li	a2,1
    15e4:	04478593          	addi	a1,a5,68
    15e8:	ff1ff06f          	j	15d8 <fatfs_write_sector+0x3c>
    15ec:	fe010113          	addi	sp,sp,-32
    15f0:	00e12623          	sw	a4,12(sp)
    15f4:	00d12423          	sw	a3,8(sp)
    15f8:	00c12223          	sw	a2,4(sp)
    15fc:	00112e23          	sw	ra,28(sp)
    1600:	00a12023          	sw	a0,0(sp)
    1604:	00000097          	auipc	ra,0x0
    1608:	f4c080e7          	jalr	-180(ra) # 1550 <fatfs_lba_of_cluster>
    160c:	00412603          	lw	a2,4(sp)
    1610:	00812683          	lw	a3,8(sp)
    1614:	00012783          	lw	a5,0(sp)
    1618:	00c12703          	lw	a4,12(sp)
    161c:	00a60533          	add	a0,a2,a0
    1620:	00068c63          	beqz	a3,1638 <fatfs_write_sector+0x9c>
    1624:	00100613          	li	a2,1
    1628:	00068593          	mv	a1,a3
    162c:	01c12083          	lw	ra,28(sp)
    1630:	02010113          	addi	sp,sp,32
    1634:	fa5ff06f          	j	15d8 <fatfs_write_sector+0x3c>
    1638:	24a7a223          	sw	a0,580(a5)
    163c:	00100613          	li	a2,1
    1640:	04478593          	addi	a1,a5,68
    1644:	fe9ff06f          	j	162c <fatfs_write_sector+0x90>
    1648:	00000513          	li	a0,0
    164c:	00008067          	ret

00001650 <fl_init>:
    1650:	ff010113          	addi	sp,sp,-16
    1654:	00004537          	lui	a0,0x4
    1658:	000047b7          	lui	a5,0x4
    165c:	000095b7          	lui	a1,0x9
    1660:	00112623          	sw	ra,12(sp)
    1664:	0b850513          	addi	a0,a0,184 # 40b8 <_free_file_list>
    1668:	0c078793          	addi	a5,a5,192 # 40c0 <_open_file_list>
    166c:	1f458593          	addi	a1,a1,500 # 91f4 <_files+0x43c>
    1670:	00052223          	sw	zero,4(a0)
    1674:	00052023          	sw	zero,0(a0)
    1678:	0007a223          	sw	zero,4(a5)
    167c:	0007a023          	sw	zero,0(a5)
    1680:	00000097          	auipc	ra,0x0
    1684:	b98080e7          	jalr	-1128(ra) # 1218 <fat_list_insert_last>
    1688:	000047b7          	lui	a5,0x4
    168c:	000095b7          	lui	a1,0x9
    1690:	0b878513          	addi	a0,a5,184 # 40b8 <_free_file_list>
    1694:	63858593          	addi	a1,a1,1592 # 9638 <_files+0x880>
    1698:	00000097          	auipc	ra,0x0
    169c:	b80080e7          	jalr	-1152(ra) # 1218 <fat_list_insert_last>
    16a0:	00c12083          	lw	ra,12(sp)
    16a4:	000047b7          	lui	a5,0x4
    16a8:	00100713          	li	a4,1
    16ac:	0ce7a623          	sw	a4,204(a5) # 40cc <_filelib_init>
    16b0:	01010113          	addi	sp,sp,16
    16b4:	00008067          	ret

000016b8 <fl_closedir>:
    16b8:	00000513          	li	a0,0
    16bc:	00008067          	ret

000016c0 <fatfs_lfn_cache_entry>:
    16c0:	0005c783          	lbu	a5,0(a1)
    16c4:	01300693          	li	a3,19
    16c8:	01f7f793          	andi	a5,a5,31
    16cc:	fff78713          	addi	a4,a5,-1
    16d0:	0ff77613          	zext.b	a2,a4
    16d4:	0ac6ea63          	bltu	a3,a2,1788 <fatfs_lfn_cache_entry+0xc8>
    16d8:	10554683          	lbu	a3,261(a0)
    16dc:	00069463          	bnez	a3,16e4 <fatfs_lfn_cache_entry+0x24>
    16e0:	10f502a3          	sb	a5,261(a0)
    16e4:	00171793          	slli	a5,a4,0x1
    16e8:	00e787b3          	add	a5,a5,a4
    16ec:	0015c683          	lbu	a3,1(a1)
    16f0:	00279793          	slli	a5,a5,0x2
    16f4:	00e787b3          	add	a5,a5,a4
    16f8:	00f50533          	add	a0,a0,a5
    16fc:	00d50023          	sb	a3,0(a0)
    1700:	0035c783          	lbu	a5,3(a1)
    1704:	0ff00713          	li	a4,255
    1708:	02000693          	li	a3,32
    170c:	00f500a3          	sb	a5,1(a0)
    1710:	0055c783          	lbu	a5,5(a1)
    1714:	00f50123          	sb	a5,2(a0)
    1718:	0075c783          	lbu	a5,7(a1)
    171c:	00f501a3          	sb	a5,3(a0)
    1720:	0095c783          	lbu	a5,9(a1)
    1724:	00f50223          	sb	a5,4(a0)
    1728:	00e5c783          	lbu	a5,14(a1)
    172c:	00f502a3          	sb	a5,5(a0)
    1730:	0105c783          	lbu	a5,16(a1)
    1734:	00f50323          	sb	a5,6(a0)
    1738:	0125c783          	lbu	a5,18(a1)
    173c:	00f503a3          	sb	a5,7(a0)
    1740:	0145c783          	lbu	a5,20(a1)
    1744:	00f50423          	sb	a5,8(a0)
    1748:	0165c783          	lbu	a5,22(a1)
    174c:	00f504a3          	sb	a5,9(a0)
    1750:	0185c783          	lbu	a5,24(a1)
    1754:	00f50523          	sb	a5,10(a0)
    1758:	01c5c783          	lbu	a5,28(a1)
    175c:	00f505a3          	sb	a5,11(a0)
    1760:	01e5c783          	lbu	a5,30(a1)
    1764:	00f50623          	sb	a5,12(a0)
    1768:	00d00793          	li	a5,13
    176c:	00054603          	lbu	a2,0(a0)
    1770:	00e61463          	bne	a2,a4,1778 <fatfs_lfn_cache_entry+0xb8>
    1774:	00d50023          	sb	a3,0(a0)
    1778:	fff78793          	addi	a5,a5,-1
    177c:	0ff7f793          	zext.b	a5,a5
    1780:	00150513          	addi	a0,a0,1
    1784:	fe0794e3          	bnez	a5,176c <fatfs_lfn_cache_entry+0xac>
    1788:	00008067          	ret

0000178c <fatfs_lfn_cache_get>:
    178c:	10554703          	lbu	a4,261(a0)
    1790:	01400793          	li	a5,20
    1794:	00f71663          	bne	a4,a5,17a0 <fatfs_lfn_cache_get+0x14>
    1798:	10050223          	sb	zero,260(a0)
    179c:	00008067          	ret
    17a0:	02070063          	beqz	a4,17c0 <fatfs_lfn_cache_get+0x34>
    17a4:	00171793          	slli	a5,a4,0x1
    17a8:	00e787b3          	add	a5,a5,a4
    17ac:	00279793          	slli	a5,a5,0x2
    17b0:	00e787b3          	add	a5,a5,a4
    17b4:	00f507b3          	add	a5,a0,a5
    17b8:	00078023          	sb	zero,0(a5)
    17bc:	00008067          	ret
    17c0:	00050023          	sb	zero,0(a0)
    17c4:	00008067          	ret

000017c8 <fatfs_entry_lfn_text>:
    17c8:	00b54503          	lbu	a0,11(a0)
    17cc:	00f57513          	andi	a0,a0,15
    17d0:	ff150513          	addi	a0,a0,-15
    17d4:	00153513          	seqz	a0,a0
    17d8:	00008067          	ret

000017dc <fatfs_entry_lfn_invalid>:
    17dc:	00054783          	lbu	a5,0(a0)
    17e0:	f1b78713          	addi	a4,a5,-229
    17e4:	02070263          	beqz	a4,1808 <fatfs_entry_lfn_invalid+0x2c>
    17e8:	02078063          	beqz	a5,1808 <fatfs_entry_lfn_invalid+0x2c>
    17ec:	00b54783          	lbu	a5,11(a0)
    17f0:	00800713          	li	a4,8
    17f4:	00100513          	li	a0,1
    17f8:	00e78a63          	beq	a5,a4,180c <fatfs_entry_lfn_invalid+0x30>
    17fc:	0067f793          	andi	a5,a5,6
    1800:	00f03533          	snez	a0,a5
    1804:	00008067          	ret
    1808:	00100513          	li	a0,1
    180c:	00008067          	ret

00001810 <fatfs_entry_lfn_exists>:
    1810:	00b5c783          	lbu	a5,11(a1)
    1814:	00f00713          	li	a4,15
    1818:	04e78063          	beq	a5,a4,1858 <fatfs_entry_lfn_exists+0x48>
    181c:	0005c683          	lbu	a3,0(a1)
    1820:	f1b68713          	addi	a4,a3,-229
    1824:	00e03733          	snez	a4,a4
    1828:	00d036b3          	snez	a3,a3
    182c:	00d77733          	and	a4,a4,a3
    1830:	02070463          	beqz	a4,1858 <fatfs_entry_lfn_exists+0x48>
    1834:	ff878713          	addi	a4,a5,-8
    1838:	02070063          	beqz	a4,1858 <fatfs_entry_lfn_exists+0x48>
    183c:	0067f713          	andi	a4,a5,6
    1840:	00000793          	li	a5,0
    1844:	00071663          	bnez	a4,1850 <fatfs_entry_lfn_exists+0x40>
    1848:	10554783          	lbu	a5,261(a0)
    184c:	00f037b3          	snez	a5,a5
    1850:	00078513          	mv	a0,a5
    1854:	00008067          	ret
    1858:	00000793          	li	a5,0
    185c:	ff5ff06f          	j	1850 <fatfs_entry_lfn_exists+0x40>

00001860 <fatfs_entry_sfn_only>:
    1860:	00b54783          	lbu	a5,11(a0)
    1864:	00f00713          	li	a4,15
    1868:	02e78863          	beq	a5,a4,1898 <fatfs_entry_sfn_only+0x38>
    186c:	00054683          	lbu	a3,0(a0)
    1870:	f1b68713          	addi	a4,a3,-229
    1874:	00e03733          	snez	a4,a4
    1878:	00d036b3          	snez	a3,a3
    187c:	00d77733          	and	a4,a4,a3
    1880:	00070c63          	beqz	a4,1898 <fatfs_entry_sfn_only+0x38>
    1884:	ff878713          	addi	a4,a5,-8
    1888:	00070863          	beqz	a4,1898 <fatfs_entry_sfn_only+0x38>
    188c:	0067f513          	andi	a0,a5,6
    1890:	00153513          	seqz	a0,a0
    1894:	00008067          	ret
    1898:	00000513          	li	a0,0
    189c:	00008067          	ret

000018a0 <fatfs_entry_is_dir>:
    18a0:	00b54503          	lbu	a0,11(a0)
    18a4:	00455513          	srli	a0,a0,0x4
    18a8:	00157513          	andi	a0,a0,1
    18ac:	00008067          	ret

000018b0 <fatfs_lfn_entries_required>:
    18b0:	ff010113          	addi	sp,sp,-16
    18b4:	00112623          	sw	ra,12(sp)
    18b8:	fffff097          	auipc	ra,0xfffff
    18bc:	1cc080e7          	jalr	460(ra) # a84 <strlen>
    18c0:	00050a63          	beqz	a0,18d4 <fatfs_lfn_entries_required+0x24>
    18c4:	00d00593          	li	a1,13
    18c8:	00c50513          	addi	a0,a0,12
    18cc:	fffff097          	auipc	ra,0xfffff
    18d0:	0c4080e7          	jalr	196(ra) # 990 <__divsi3>
    18d4:	00c12083          	lw	ra,12(sp)
    18d8:	01010113          	addi	sp,sp,16
    18dc:	00008067          	ret

000018e0 <fatfs_filename_to_lfn>:
    18e0:	f9010113          	addi	sp,sp,-112
    18e4:	06812423          	sw	s0,104(sp)
    18e8:	00058413          	mv	s0,a1
    18ec:	000045b7          	lui	a1,0x4
    18f0:	06c58593          	addi	a1,a1,108 # 406c <font+0x1e0>
    18f4:	06912223          	sw	s1,100(sp)
    18f8:	05312e23          	sw	s3,92(sp)
    18fc:	00060493          	mv	s1,a2
    1900:	00050993          	mv	s3,a0
    1904:	03400613          	li	a2,52
    1908:	01c10513          	addi	a0,sp,28
    190c:	00d12623          	sw	a3,12(sp)
    1910:	06112623          	sw	ra,108(sp)
    1914:	07212023          	sw	s2,96(sp)
    1918:	05412c23          	sw	s4,88(sp)
    191c:	fffff097          	auipc	ra,0xfffff
    1920:	144080e7          	jalr	324(ra) # a60 <memcpy>
    1924:	00098513          	mv	a0,s3
    1928:	fffff097          	auipc	ra,0xfffff
    192c:	15c080e7          	jalr	348(ra) # a84 <strlen>
    1930:	00050913          	mv	s2,a0
    1934:	00098513          	mv	a0,s3
    1938:	00000097          	auipc	ra,0x0
    193c:	f78080e7          	jalr	-136(ra) # 18b0 <fatfs_lfn_entries_required>
    1940:	00050a13          	mv	s4,a0
    1944:	02000613          	li	a2,32
    1948:	00000593          	li	a1,0
    194c:	00040513          	mv	a0,s0
    1950:	fffff097          	auipc	ra,0xfffff
    1954:	0f4080e7          	jalr	244(ra) # a44 <memset>
    1958:	fffa0713          	addi	a4,s4,-1 # 3fff <font+0x173>
    195c:	00c12683          	lw	a3,12(sp)
    1960:	00148793          	addi	a5,s1,1
    1964:	00971463          	bne	a4,s1,196c <fatfs_filename_to_lfn+0x8c>
    1968:	0407e793          	ori	a5,a5,64
    196c:	00149613          	slli	a2,s1,0x1
    1970:	00960633          	add	a2,a2,s1
    1974:	00f40023          	sb	a5,0(s0)
    1978:	00261613          	slli	a2,a2,0x2
    197c:	00f00793          	li	a5,15
    1980:	00f405a3          	sb	a5,11(s0)
    1984:	00d406a3          	sb	a3,13(s0)
    1988:	01c10793          	addi	a5,sp,28
    198c:	00960633          	add	a2,a2,s1
    1990:	fff00693          	li	a3,-1
    1994:	0007a703          	lw	a4,0(a5)
    1998:	00e40733          	add	a4,s0,a4
    199c:	05265063          	bge	a2,s2,19dc <fatfs_filename_to_lfn+0xfc>
    19a0:	00c985b3          	add	a1,s3,a2
    19a4:	0005c583          	lbu	a1,0(a1)
    19a8:	00b70023          	sb	a1,0(a4)
    19ac:	00478793          	addi	a5,a5,4
    19b0:	05010713          	addi	a4,sp,80
    19b4:	00160613          	addi	a2,a2,1
    19b8:	fce79ee3          	bne	a5,a4,1994 <fatfs_filename_to_lfn+0xb4>
    19bc:	06c12083          	lw	ra,108(sp)
    19c0:	06812403          	lw	s0,104(sp)
    19c4:	06412483          	lw	s1,100(sp)
    19c8:	06012903          	lw	s2,96(sp)
    19cc:	05c12983          	lw	s3,92(sp)
    19d0:	05812a03          	lw	s4,88(sp)
    19d4:	07010113          	addi	sp,sp,112
    19d8:	00008067          	ret
    19dc:	01261663          	bne	a2,s2,19e8 <fatfs_filename_to_lfn+0x108>
    19e0:	00070023          	sb	zero,0(a4)
    19e4:	fc9ff06f          	j	19ac <fatfs_filename_to_lfn+0xcc>
    19e8:	00d70023          	sb	a3,0(a4)
    19ec:	00d700a3          	sb	a3,1(a4)
    19f0:	fbdff06f          	j	19ac <fatfs_filename_to_lfn+0xcc>

000019f4 <fatfs_sfn_create_entry>:
    19f4:	00000793          	li	a5,0
    19f8:	00b00813          	li	a6,11
    19fc:	00f508b3          	add	a7,a0,a5
    1a00:	0008c303          	lbu	t1,0(a7)
    1a04:	00f688b3          	add	a7,a3,a5
    1a08:	00178793          	addi	a5,a5,1
    1a0c:	00688023          	sb	t1,0(a7)
    1a10:	ff0796e3          	bne	a5,a6,19fc <fatfs_sfn_create_entry+0x8>
    1a14:	00e03733          	snez	a4,a4
    1a18:	40e00733          	neg	a4,a4
    1a1c:	02000793          	li	a5,32
    1a20:	ff077713          	andi	a4,a4,-16
    1a24:	00f70733          	add	a4,a4,a5
    1a28:	00f68823          	sb	a5,16(a3)
    1a2c:	00f68923          	sb	a5,18(a3)
    1a30:	00f68c23          	sb	a5,24(a3)
    1a34:	01065793          	srli	a5,a2,0x10
    1a38:	00f68a23          	sb	a5,20(a3)
    1a3c:	01865793          	srli	a5,a2,0x18
    1a40:	00f68aa3          	sb	a5,21(a3)
    1a44:	0085d793          	srli	a5,a1,0x8
    1a48:	00c68d23          	sb	a2,26(a3)
    1a4c:	00b68e23          	sb	a1,28(a3)
    1a50:	00865613          	srli	a2,a2,0x8
    1a54:	00f68ea3          	sb	a5,29(a3)
    1a58:	0105d793          	srli	a5,a1,0x10
    1a5c:	0185d593          	srli	a1,a1,0x18
    1a60:	000686a3          	sb	zero,13(a3)
    1a64:	00068723          	sb	zero,14(a3)
    1a68:	000687a3          	sb	zero,15(a3)
    1a6c:	000688a3          	sb	zero,17(a3)
    1a70:	000689a3          	sb	zero,19(a3)
    1a74:	00068b23          	sb	zero,22(a3)
    1a78:	00068ba3          	sb	zero,23(a3)
    1a7c:	00068ca3          	sb	zero,25(a3)
    1a80:	00e685a3          	sb	a4,11(a3)
    1a84:	00068623          	sb	zero,12(a3)
    1a88:	00c68da3          	sb	a2,27(a3)
    1a8c:	00f68f23          	sb	a5,30(a3)
    1a90:	00b68fa3          	sb	a1,31(a3)
    1a94:	00008067          	ret

00001a98 <fatfs_lfn_create_sfn>:
    1a98:	fd010113          	addi	sp,sp,-48
    1a9c:	02912223          	sw	s1,36(sp)
    1aa0:	00050493          	mv	s1,a0
    1aa4:	00058513          	mv	a0,a1
    1aa8:	02812423          	sw	s0,40(sp)
    1aac:	01312e23          	sw	s3,28(sp)
    1ab0:	00058413          	mv	s0,a1
    1ab4:	02112623          	sw	ra,44(sp)
    1ab8:	03212023          	sw	s2,32(sp)
    1abc:	fffff097          	auipc	ra,0xfffff
    1ac0:	fc8080e7          	jalr	-56(ra) # a84 <strlen>
    1ac4:	00044783          	lbu	a5,0(s0)
    1ac8:	02e00993          	li	s3,46
    1acc:	15378063          	beq	a5,s3,1c0c <fatfs_lfn_create_sfn+0x174>
    1ad0:	00b00613          	li	a2,11
    1ad4:	02000593          	li	a1,32
    1ad8:	00050913          	mv	s2,a0
    1adc:	00048513          	mv	a0,s1
    1ae0:	fffff097          	auipc	ra,0xfffff
    1ae4:	f64080e7          	jalr	-156(ra) # a44 <memset>
    1ae8:	00300613          	li	a2,3
    1aec:	02000593          	li	a1,32
    1af0:	00c10513          	addi	a0,sp,12
    1af4:	fffff097          	auipc	ra,0xfffff
    1af8:	f50080e7          	jalr	-176(ra) # a44 <memset>
    1afc:	fff00793          	li	a5,-1
    1b00:	00000713          	li	a4,0
    1b04:	0d274263          	blt	a4,s2,1bc8 <fatfs_lfn_create_sfn+0x130>
    1b08:	fff00713          	li	a4,-1
    1b0c:	0ee78863          	beq	a5,a4,1bfc <fatfs_lfn_create_sfn+0x164>
    1b10:	00178713          	addi	a4,a5,1
    1b14:	00c10693          	addi	a3,sp,12
    1b18:	00478613          	addi	a2,a5,4
    1b1c:	0ce61263          	bne	a2,a4,1be0 <fatfs_lfn_create_sfn+0x148>
    1b20:	00000613          	li	a2,0
    1b24:	00000693          	li	a3,0
    1b28:	01900813          	li	a6,25
    1b2c:	00800893          	li	a7,8
    1b30:	02f6de63          	bge	a3,a5,1b6c <fatfs_lfn_create_sfn+0xd4>
    1b34:	00d40733          	add	a4,s0,a3
    1b38:	00074703          	lbu	a4,0(a4)
    1b3c:	fe070513          	addi	a0,a4,-32
    1b40:	0c050263          	beqz	a0,1c04 <fatfs_lfn_create_sfn+0x16c>
    1b44:	fd270593          	addi	a1,a4,-46
    1b48:	0a058e63          	beqz	a1,1c04 <fatfs_lfn_create_sfn+0x16c>
    1b4c:	f9f70593          	addi	a1,a4,-97
    1b50:	0ff5f593          	zext.b	a1,a1
    1b54:	00c48333          	add	t1,s1,a2
    1b58:	00160613          	addi	a2,a2,1
    1b5c:	00b86463          	bltu	a6,a1,1b64 <fatfs_lfn_create_sfn+0xcc>
    1b60:	0ff57713          	zext.b	a4,a0
    1b64:	00e30023          	sb	a4,0(t1)
    1b68:	09161e63          	bne	a2,a7,1c04 <fatfs_lfn_create_sfn+0x16c>
    1b6c:	00c10793          	addi	a5,sp,12
    1b70:	00800693          	li	a3,8
    1b74:	01900513          	li	a0,25
    1b78:	00b00593          	li	a1,11
    1b7c:	0007c703          	lbu	a4,0(a5)
    1b80:	f9f70613          	addi	a2,a4,-97
    1b84:	0ff67613          	zext.b	a2,a2
    1b88:	00c56663          	bltu	a0,a2,1b94 <fatfs_lfn_create_sfn+0xfc>
    1b8c:	fe070713          	addi	a4,a4,-32
    1b90:	0ff77713          	zext.b	a4,a4
    1b94:	00d48633          	add	a2,s1,a3
    1b98:	00e60023          	sb	a4,0(a2)
    1b9c:	00168693          	addi	a3,a3,1
    1ba0:	00178793          	addi	a5,a5,1
    1ba4:	fcb69ce3          	bne	a3,a1,1b7c <fatfs_lfn_create_sfn+0xe4>
    1ba8:	00100513          	li	a0,1
    1bac:	02c12083          	lw	ra,44(sp)
    1bb0:	02812403          	lw	s0,40(sp)
    1bb4:	02412483          	lw	s1,36(sp)
    1bb8:	02012903          	lw	s2,32(sp)
    1bbc:	01c12983          	lw	s3,28(sp)
    1bc0:	03010113          	addi	sp,sp,48
    1bc4:	00008067          	ret
    1bc8:	00e406b3          	add	a3,s0,a4
    1bcc:	0006c683          	lbu	a3,0(a3)
    1bd0:	01369463          	bne	a3,s3,1bd8 <fatfs_lfn_create_sfn+0x140>
    1bd4:	00070793          	mv	a5,a4
    1bd8:	00170713          	addi	a4,a4,1
    1bdc:	f29ff06f          	j	1b04 <fatfs_lfn_create_sfn+0x6c>
    1be0:	01275863          	bge	a4,s2,1bf0 <fatfs_lfn_create_sfn+0x158>
    1be4:	00e405b3          	add	a1,s0,a4
    1be8:	0005c583          	lbu	a1,0(a1)
    1bec:	00b68023          	sb	a1,0(a3)
    1bf0:	00170713          	addi	a4,a4,1
    1bf4:	00168693          	addi	a3,a3,1
    1bf8:	f25ff06f          	j	1b1c <fatfs_lfn_create_sfn+0x84>
    1bfc:	00090793          	mv	a5,s2
    1c00:	f21ff06f          	j	1b20 <fatfs_lfn_create_sfn+0x88>
    1c04:	00168693          	addi	a3,a3,1
    1c08:	f29ff06f          	j	1b30 <fatfs_lfn_create_sfn+0x98>
    1c0c:	00000513          	li	a0,0
    1c10:	f9dff06f          	j	1bac <fatfs_lfn_create_sfn+0x114>

00001c14 <fatfs_lfn_generate_tail>:
    1c14:	000187b7          	lui	a5,0x18
    1c18:	69f78793          	addi	a5,a5,1695 # 1869f <__stacktop+0x869f>
    1c1c:	16c7e463          	bltu	a5,a2,1d84 <fatfs_lfn_generate_tail+0x170>
    1c20:	fa010113          	addi	sp,sp,-96
    1c24:	04812c23          	sw	s0,88(sp)
    1c28:	04912a23          	sw	s1,84(sp)
    1c2c:	03712e23          	sw	s7,60(sp)
    1c30:	00060413          	mv	s0,a2
    1c34:	00058b93          	mv	s7,a1
    1c38:	00c00613          	li	a2,12
    1c3c:	00000593          	li	a1,0
    1c40:	00050493          	mv	s1,a0
    1c44:	00410513          	addi	a0,sp,4
    1c48:	04112e23          	sw	ra,92(sp)
    1c4c:	05312623          	sw	s3,76(sp)
    1c50:	05412423          	sw	s4,72(sp)
    1c54:	05612023          	sw	s6,64(sp)
    1c58:	05212823          	sw	s2,80(sp)
    1c5c:	05512223          	sw	s5,68(sp)
    1c60:	fffff097          	auipc	ra,0xfffff
    1c64:	de4080e7          	jalr	-540(ra) # a44 <memset>
    1c68:	000045b7          	lui	a1,0x4
    1c6c:	07e00793          	li	a5,126
    1c70:	01100613          	li	a2,17
    1c74:	e4458593          	addi	a1,a1,-444 # 3e44 <LEDS+0x80>
    1c78:	01c10513          	addi	a0,sp,28
    1c7c:	01010993          	addi	s3,sp,16
    1c80:	00f10223          	sb	a5,4(sp)
    1c84:	00098a13          	mv	s4,s3
    1c88:	fffff097          	auipc	ra,0xfffff
    1c8c:	dd8080e7          	jalr	-552(ra) # a60 <memcpy>
    1c90:	00900b13          	li	s6,9
    1c94:	00a00593          	li	a1,10
    1c98:	00040513          	mv	a0,s0
    1c9c:	fffff097          	auipc	ra,0xfffff
    1ca0:	d44080e7          	jalr	-700(ra) # 9e0 <__umodsi3>
    1ca4:	03050793          	addi	a5,a0,48
    1ca8:	00278533          	add	a0,a5,sp
    1cac:	fec54783          	lbu	a5,-20(a0)
    1cb0:	00098913          	mv	s2,s3
    1cb4:	00040513          	mv	a0,s0
    1cb8:	00a00593          	li	a1,10
    1cbc:	00f98023          	sb	a5,0(s3)
    1cc0:	00040a93          	mv	s5,s0
    1cc4:	fffff097          	auipc	ra,0xfffff
    1cc8:	cd4080e7          	jalr	-812(ra) # 998 <__udivsi3>
    1ccc:	00198993          	addi	s3,s3,1
    1cd0:	00050413          	mv	s0,a0
    1cd4:	fd5b60e3          	bltu	s6,s5,1c94 <fatfs_lfn_generate_tail+0x80>
    1cd8:	00098023          	sb	zero,0(s3)
    1cdc:	00410713          	addi	a4,sp,4
    1ce0:	00090793          	mv	a5,s2
    1ce4:	0947f663          	bgeu	a5,s4,1d70 <fatfs_lfn_generate_tail+0x15c>
    1ce8:	00f10713          	addi	a4,sp,15
    1cec:	00000793          	li	a5,0
    1cf0:	00e96663          	bltu	s2,a4,1cfc <fatfs_lfn_generate_tail+0xe8>
    1cf4:	41490933          	sub	s2,s2,s4
    1cf8:	00190793          	addi	a5,s2,1
    1cfc:	03078793          	addi	a5,a5,48
    1d00:	002787b3          	add	a5,a5,sp
    1d04:	000b8593          	mv	a1,s7
    1d08:	fc078aa3          	sb	zero,-43(a5)
    1d0c:	00b00613          	li	a2,11
    1d10:	00048513          	mv	a0,s1
    1d14:	fffff097          	auipc	ra,0xfffff
    1d18:	d4c080e7          	jalr	-692(ra) # a60 <memcpy>
    1d1c:	00410513          	addi	a0,sp,4
    1d20:	fffff097          	auipc	ra,0xfffff
    1d24:	d64080e7          	jalr	-668(ra) # a84 <strlen>
    1d28:	40a484b3          	sub	s1,s1,a0
    1d2c:	00050613          	mv	a2,a0
    1d30:	00410593          	addi	a1,sp,4
    1d34:	00848513          	addi	a0,s1,8
    1d38:	fffff097          	auipc	ra,0xfffff
    1d3c:	d28080e7          	jalr	-728(ra) # a60 <memcpy>
    1d40:	05c12083          	lw	ra,92(sp)
    1d44:	05812403          	lw	s0,88(sp)
    1d48:	05412483          	lw	s1,84(sp)
    1d4c:	05012903          	lw	s2,80(sp)
    1d50:	04c12983          	lw	s3,76(sp)
    1d54:	04812a03          	lw	s4,72(sp)
    1d58:	04412a83          	lw	s5,68(sp)
    1d5c:	04012b03          	lw	s6,64(sp)
    1d60:	03c12b83          	lw	s7,60(sp)
    1d64:	00100513          	li	a0,1
    1d68:	06010113          	addi	sp,sp,96
    1d6c:	00008067          	ret
    1d70:	0007c683          	lbu	a3,0(a5)
    1d74:	00170713          	addi	a4,a4,1
    1d78:	fff78793          	addi	a5,a5,-1
    1d7c:	00d70023          	sb	a3,0(a4)
    1d80:	f65ff06f          	j	1ce4 <fatfs_lfn_generate_tail+0xd0>
    1d84:	00000513          	li	a0,0
    1d88:	00008067          	ret

00001d8c <fatfs_total_path_levels>:
    1d8c:	fff00793          	li	a5,-1
    1d90:	06050263          	beqz	a0,1df4 <fatfs_total_path_levels+0x68>
    1d94:	00054703          	lbu	a4,0(a0)
    1d98:	02f00793          	li	a5,47
    1d9c:	00f71863          	bne	a4,a5,1dac <fatfs_total_path_levels+0x20>
    1da0:	00150513          	addi	a0,a0,1
    1da4:	00000793          	li	a5,0
    1da8:	0400006f          	j	1de8 <fatfs_total_path_levels+0x5c>
    1dac:	00154703          	lbu	a4,1(a0)
    1db0:	03a00793          	li	a5,58
    1db4:	00f70a63          	beq	a4,a5,1dc8 <fatfs_total_path_levels+0x3c>
    1db8:	00254683          	lbu	a3,2(a0)
    1dbc:	05c00713          	li	a4,92
    1dc0:	fff00793          	li	a5,-1
    1dc4:	02e69863          	bne	a3,a4,1df4 <fatfs_total_path_levels+0x68>
    1dc8:	00350513          	addi	a0,a0,3
    1dcc:	05c00713          	li	a4,92
    1dd0:	fd5ff06f          	j	1da4 <fatfs_total_path_levels+0x18>
    1dd4:	00150513          	addi	a0,a0,1
    1dd8:	00e68663          	beq	a3,a4,1de4 <fatfs_total_path_levels+0x58>
    1ddc:	00054683          	lbu	a3,0(a0)
    1de0:	fe069ae3          	bnez	a3,1dd4 <fatfs_total_path_levels+0x48>
    1de4:	00178793          	addi	a5,a5,1
    1de8:	00054683          	lbu	a3,0(a0)
    1dec:	fe0698e3          	bnez	a3,1ddc <fatfs_total_path_levels+0x50>
    1df0:	fff78793          	addi	a5,a5,-1
    1df4:	00078513          	mv	a0,a5
    1df8:	00008067          	ret

00001dfc <fatfs_get_substring>:
    1dfc:	0cd05e63          	blez	a3,1ed8 <fatfs_get_substring+0xdc>
    1e00:	0c050c63          	beqz	a0,1ed8 <fatfs_get_substring+0xdc>
    1e04:	fe010113          	addi	sp,sp,-32
    1e08:	00812c23          	sw	s0,24(sp)
    1e0c:	00112e23          	sw	ra,28(sp)
    1e10:	00912a23          	sw	s1,20(sp)
    1e14:	00054483          	lbu	s1,0(a0)
    1e18:	02f00793          	li	a5,47
    1e1c:	00150413          	addi	s0,a0,1
    1e20:	02f48463          	beq	s1,a5,1e48 <fatfs_get_substring+0x4c>
    1e24:	00154703          	lbu	a4,1(a0)
    1e28:	03a00793          	li	a5,58
    1e2c:	00f70a63          	beq	a4,a5,1e40 <fatfs_get_substring+0x44>
    1e30:	00254803          	lbu	a6,2(a0)
    1e34:	05c00713          	li	a4,92
    1e38:	fff00793          	li	a5,-1
    1e3c:	04e81c63          	bne	a6,a4,1e94 <fatfs_get_substring+0x98>
    1e40:	00350413          	addi	s0,a0,3
    1e44:	05c00493          	li	s1,92
    1e48:	00040513          	mv	a0,s0
    1e4c:	00d12623          	sw	a3,12(sp)
    1e50:	00c12423          	sw	a2,8(sp)
    1e54:	00b12223          	sw	a1,4(sp)
    1e58:	fffff097          	auipc	ra,0xfffff
    1e5c:	c2c080e7          	jalr	-980(ra) # a84 <strlen>
    1e60:	00c12683          	lw	a3,12(sp)
    1e64:	00412583          	lw	a1,4(sp)
    1e68:	00812603          	lw	a2,8(sp)
    1e6c:	00000713          	li	a4,0
    1e70:	00000813          	li	a6,0
    1e74:	00000793          	li	a5,0
    1e78:	fff68693          	addi	a3,a3,-1
    1e7c:	00e608b3          	add	a7,a2,a4
    1e80:	02a7c663          	blt	a5,a0,1eac <fatfs_get_substring+0xb0>
    1e84:	00088023          	sb	zero,0(a7)
    1e88:	00064783          	lbu	a5,0(a2)
    1e8c:	0017b793          	seqz	a5,a5
    1e90:	40f007b3          	neg	a5,a5
    1e94:	01c12083          	lw	ra,28(sp)
    1e98:	01812403          	lw	s0,24(sp)
    1e9c:	01412483          	lw	s1,20(sp)
    1ea0:	00078513          	mv	a0,a5
    1ea4:	02010113          	addi	sp,sp,32
    1ea8:	00008067          	ret
    1eac:	00f40333          	add	t1,s0,a5
    1eb0:	00034303          	lbu	t1,0(t1)
    1eb4:	00931863          	bne	t1,s1,1ec4 <fatfs_get_substring+0xc8>
    1eb8:	00180813          	addi	a6,a6,1
    1ebc:	00178793          	addi	a5,a5,1
    1ec0:	fbdff06f          	j	1e7c <fatfs_get_substring+0x80>
    1ec4:	feb81ce3          	bne	a6,a1,1ebc <fatfs_get_substring+0xc0>
    1ec8:	fed75ae3          	bge	a4,a3,1ebc <fatfs_get_substring+0xc0>
    1ecc:	00170713          	addi	a4,a4,1
    1ed0:	00688023          	sb	t1,0(a7)
    1ed4:	fe9ff06f          	j	1ebc <fatfs_get_substring+0xc0>
    1ed8:	fff00793          	li	a5,-1
    1edc:	00078513          	mv	a0,a5
    1ee0:	00008067          	ret

00001ee4 <fatfs_split_path>:
    1ee4:	fd010113          	addi	sp,sp,-48
    1ee8:	02912223          	sw	s1,36(sp)
    1eec:	03212023          	sw	s2,32(sp)
    1ef0:	01312e23          	sw	s3,28(sp)
    1ef4:	01412c23          	sw	s4,24(sp)
    1ef8:	02112623          	sw	ra,44(sp)
    1efc:	02812423          	sw	s0,40(sp)
    1f00:	01512a23          	sw	s5,20(sp)
    1f04:	00050993          	mv	s3,a0
    1f08:	00058493          	mv	s1,a1
    1f0c:	00060913          	mv	s2,a2
    1f10:	00068a13          	mv	s4,a3
    1f14:	00e12623          	sw	a4,12(sp)
    1f18:	00000097          	auipc	ra,0x0
    1f1c:	e74080e7          	jalr	-396(ra) # 1d8c <fatfs_total_path_levels>
    1f20:	fff00793          	li	a5,-1
    1f24:	02f51863          	bne	a0,a5,1f54 <fatfs_split_path+0x70>
    1f28:	fff00413          	li	s0,-1
    1f2c:	02c12083          	lw	ra,44(sp)
    1f30:	00040513          	mv	a0,s0
    1f34:	02812403          	lw	s0,40(sp)
    1f38:	02412483          	lw	s1,36(sp)
    1f3c:	02012903          	lw	s2,32(sp)
    1f40:	01c12983          	lw	s3,28(sp)
    1f44:	01812a03          	lw	s4,24(sp)
    1f48:	01412a83          	lw	s5,20(sp)
    1f4c:	03010113          	addi	sp,sp,48
    1f50:	00008067          	ret
    1f54:	00c12683          	lw	a3,12(sp)
    1f58:	00050593          	mv	a1,a0
    1f5c:	00a12623          	sw	a0,12(sp)
    1f60:	000a0613          	mv	a2,s4
    1f64:	00098513          	mv	a0,s3
    1f68:	00000097          	auipc	ra,0x0
    1f6c:	e94080e7          	jalr	-364(ra) # 1dfc <fatfs_get_substring>
    1f70:	00050413          	mv	s0,a0
    1f74:	fa051ae3          	bnez	a0,1f28 <fatfs_split_path+0x44>
    1f78:	00c12583          	lw	a1,12(sp)
    1f7c:	00059663          	bnez	a1,1f88 <fatfs_split_path+0xa4>
    1f80:	00048023          	sb	zero,0(s1)
    1f84:	fa9ff06f          	j	1f2c <fatfs_split_path+0x48>
    1f88:	00098513          	mv	a0,s3
    1f8c:	fffff097          	auipc	ra,0xfffff
    1f90:	af8080e7          	jalr	-1288(ra) # a84 <strlen>
    1f94:	00050a93          	mv	s5,a0
    1f98:	000a0513          	mv	a0,s4
    1f9c:	fffff097          	auipc	ra,0xfffff
    1fa0:	ae8080e7          	jalr	-1304(ra) # a84 <strlen>
    1fa4:	40aa8633          	sub	a2,s5,a0
    1fa8:	00c95463          	bge	s2,a2,1fb0 <fatfs_split_path+0xcc>
    1fac:	00090613          	mv	a2,s2
    1fb0:	00048513          	mv	a0,s1
    1fb4:	00098593          	mv	a1,s3
    1fb8:	00c12623          	sw	a2,12(sp)
    1fbc:	fffff097          	auipc	ra,0xfffff
    1fc0:	aa4080e7          	jalr	-1372(ra) # a60 <memcpy>
    1fc4:	00c12603          	lw	a2,12(sp)
    1fc8:	00c484b3          	add	s1,s1,a2
    1fcc:	fe048fa3          	sb	zero,-1(s1)
    1fd0:	f5dff06f          	j	1f2c <fatfs_split_path+0x48>

00001fd4 <fatfs_compare_names>:
    1fd4:	fd010113          	addi	sp,sp,-48
    1fd8:	02112623          	sw	ra,44(sp)
    1fdc:	03212023          	sw	s2,32(sp)
    1fe0:	01312e23          	sw	s3,28(sp)
    1fe4:	01412c23          	sw	s4,24(sp)
    1fe8:	01512a23          	sw	s5,20(sp)
    1fec:	00058a13          	mv	s4,a1
    1ff0:	02812423          	sw	s0,40(sp)
    1ff4:	02912223          	sw	s1,36(sp)
    1ff8:	01612823          	sw	s6,16(sp)
    1ffc:	01712623          	sw	s7,12(sp)
    2000:	01812423          	sw	s8,8(sp)
    2004:	00050a93          	mv	s5,a0
    2008:	fffff097          	auipc	ra,0xfffff
    200c:	2ec080e7          	jalr	748(ra) # 12f4 <FileString_GetExtension>
    2010:	00050993          	mv	s3,a0
    2014:	000a0513          	mv	a0,s4
    2018:	fffff097          	auipc	ra,0xfffff
    201c:	2dc080e7          	jalr	732(ra) # 12f4 <FileString_GetExtension>
    2020:	fff00793          	li	a5,-1
    2024:	00050913          	mv	s2,a0
    2028:	02f99e63          	bne	s3,a5,2064 <fatfs_compare_names+0x90>
    202c:	0f350063          	beq	a0,s3,210c <fatfs_compare_names+0x138>
    2030:	00000513          	li	a0,0
    2034:	02c12083          	lw	ra,44(sp)
    2038:	02812403          	lw	s0,40(sp)
    203c:	02412483          	lw	s1,36(sp)
    2040:	02012903          	lw	s2,32(sp)
    2044:	01c12983          	lw	s3,28(sp)
    2048:	01812a03          	lw	s4,24(sp)
    204c:	01412a83          	lw	s5,20(sp)
    2050:	01012b03          	lw	s6,16(sp)
    2054:	00c12b83          	lw	s7,12(sp)
    2058:	00812c03          	lw	s8,8(sp)
    205c:	03010113          	addi	sp,sp,48
    2060:	00008067          	ret
    2064:	fcf506e3          	beq	a0,a5,2030 <fatfs_compare_names+0x5c>
    2068:	00198793          	addi	a5,s3,1
    206c:	00fa8b33          	add	s6,s5,a5
    2070:	00050413          	mv	s0,a0
    2074:	00150793          	addi	a5,a0,1
    2078:	000b0513          	mv	a0,s6
    207c:	00fa0bb3          	add	s7,s4,a5
    2080:	fffff097          	auipc	ra,0xfffff
    2084:	a04080e7          	jalr	-1532(ra) # a84 <strlen>
    2088:	00050c13          	mv	s8,a0
    208c:	000b8513          	mv	a0,s7
    2090:	00098493          	mv	s1,s3
    2094:	fffff097          	auipc	ra,0xfffff
    2098:	9f0080e7          	jalr	-1552(ra) # a84 <strlen>
    209c:	f8ac1ae3          	bne	s8,a0,2030 <fatfs_compare_names+0x5c>
    20a0:	000b0513          	mv	a0,s6
    20a4:	fffff097          	auipc	ra,0xfffff
    20a8:	9e0080e7          	jalr	-1568(ra) # a84 <strlen>
    20ac:	00050613          	mv	a2,a0
    20b0:	000b8593          	mv	a1,s7
    20b4:	000b0513          	mv	a0,s6
    20b8:	fffff097          	auipc	ra,0xfffff
    20bc:	1cc080e7          	jalr	460(ra) # 1284 <FileString_StrCmpNoCase>
    20c0:	f60518e3          	bnez	a0,2030 <fatfs_compare_names+0x5c>
    20c4:	fff48793          	addi	a5,s1,-1
    20c8:	00fa87b3          	add	a5,s5,a5
    20cc:	41378733          	sub	a4,a5,s3
    20d0:	02000693          	li	a3,32
    20d4:	06e79263          	bne	a5,a4,2138 <fatfs_compare_names+0x164>
    20d8:	fff40793          	addi	a5,s0,-1
    20dc:	00fa07b3          	add	a5,s4,a5
    20e0:	41278733          	sub	a4,a5,s2
    20e4:	02000693          	li	a3,32
    20e8:	06e79263          	bne	a5,a4,214c <fatfs_compare_names+0x178>
    20ec:	f53912e3          	bne	s2,s3,2030 <fatfs_compare_names+0x5c>
    20f0:	00090613          	mv	a2,s2
    20f4:	000a0593          	mv	a1,s4
    20f8:	000a8513          	mv	a0,s5
    20fc:	fffff097          	auipc	ra,0xfffff
    2100:	188080e7          	jalr	392(ra) # 1284 <FileString_StrCmpNoCase>
    2104:	00153513          	seqz	a0,a0
    2108:	f2dff06f          	j	2034 <fatfs_compare_names+0x60>
    210c:	000a8513          	mv	a0,s5
    2110:	fffff097          	auipc	ra,0xfffff
    2114:	974080e7          	jalr	-1676(ra) # a84 <strlen>
    2118:	00050493          	mv	s1,a0
    211c:	00050993          	mv	s3,a0
    2120:	000a0513          	mv	a0,s4
    2124:	fffff097          	auipc	ra,0xfffff
    2128:	960080e7          	jalr	-1696(ra) # a84 <strlen>
    212c:	00050413          	mv	s0,a0
    2130:	00050913          	mv	s2,a0
    2134:	f91ff06f          	j	20c4 <fatfs_compare_names+0xf0>
    2138:	0007c603          	lbu	a2,0(a5)
    213c:	f8d61ee3          	bne	a2,a3,20d8 <fatfs_compare_names+0x104>
    2140:	415789b3          	sub	s3,a5,s5
    2144:	fff78793          	addi	a5,a5,-1
    2148:	f8dff06f          	j	20d4 <fatfs_compare_names+0x100>
    214c:	0007c603          	lbu	a2,0(a5)
    2150:	f8d61ee3          	bne	a2,a3,20ec <fatfs_compare_names+0x118>
    2154:	41478933          	sub	s2,a5,s4
    2158:	fff78793          	addi	a5,a5,-1
    215c:	f8dff06f          	j	20e8 <fatfs_compare_names+0x114>

00002160 <_check_file_open>:
    2160:	fe010113          	addi	sp,sp,-32
    2164:	000047b7          	lui	a5,0x4
    2168:	00812c23          	sw	s0,24(sp)
    216c:	0c07a403          	lw	s0,192(a5) # 40c0 <_open_file_list>
    2170:	00912a23          	sw	s1,20(sp)
    2174:	00112e23          	sw	ra,28(sp)
    2178:	01212823          	sw	s2,16(sp)
    217c:	01312623          	sw	s3,12(sp)
    2180:	00050493          	mv	s1,a0
    2184:	00041663          	bnez	s0,2190 <_check_file_open+0x30>
    2188:	00000513          	li	a0,0
    218c:	03c0006f          	j	21c8 <_check_file_open+0x68>
    2190:	bc440793          	addi	a5,s0,-1084
    2194:	00f49663          	bne	s1,a5,21a0 <_check_file_open+0x40>
    2198:	00442403          	lw	s0,4(s0)
    219c:	fe9ff06f          	j	2184 <_check_file_open+0x24>
    21a0:	01448593          	addi	a1,s1,20
    21a4:	bd840513          	addi	a0,s0,-1064
    21a8:	00000097          	auipc	ra,0x0
    21ac:	e2c080e7          	jalr	-468(ra) # 1fd4 <fatfs_compare_names>
    21b0:	fe0504e3          	beqz	a0,2198 <_check_file_open+0x38>
    21b4:	11848593          	addi	a1,s1,280
    21b8:	cdc40513          	addi	a0,s0,-804
    21bc:	00000097          	auipc	ra,0x0
    21c0:	e18080e7          	jalr	-488(ra) # 1fd4 <fatfs_compare_names>
    21c4:	fc050ae3          	beqz	a0,2198 <_check_file_open+0x38>
    21c8:	01c12083          	lw	ra,28(sp)
    21cc:	01812403          	lw	s0,24(sp)
    21d0:	01412483          	lw	s1,20(sp)
    21d4:	01012903          	lw	s2,16(sp)
    21d8:	00c12983          	lw	s3,12(sp)
    21dc:	02010113          	addi	sp,sp,32
    21e0:	00008067          	ret

000021e4 <fatfs_get_sfn_display_name>:
    21e4:	00000713          	li	a4,0
    21e8:	02000613          	li	a2,32
    21ec:	01900813          	li	a6,25
    21f0:	0005c783          	lbu	a5,0(a1)
    21f4:	00078663          	beqz	a5,2200 <fatfs_get_sfn_display_name+0x1c>
    21f8:	ff470693          	addi	a3,a4,-12
    21fc:	00069863          	bnez	a3,220c <fatfs_get_sfn_display_name+0x28>
    2200:	00050023          	sb	zero,0(a0)
    2204:	00100513          	li	a0,1
    2208:	00008067          	ret
    220c:	00158593          	addi	a1,a1,1
    2210:	fec780e3          	beq	a5,a2,21f0 <fatfs_get_sfn_display_name+0xc>
    2214:	fbf78693          	addi	a3,a5,-65
    2218:	0ff6f693          	zext.b	a3,a3
    221c:	00d86663          	bltu	a6,a3,2228 <fatfs_get_sfn_display_name+0x44>
    2220:	02078793          	addi	a5,a5,32
    2224:	0ff7f793          	zext.b	a5,a5
    2228:	00f50023          	sb	a5,0(a0)
    222c:	00170713          	addi	a4,a4,1
    2230:	00150513          	addi	a0,a0,1
    2234:	fbdff06f          	j	21f0 <fatfs_get_sfn_display_name+0xc>

00002238 <fatfs_fat_init>:
    2238:	ff010113          	addi	sp,sp,-16
    223c:	00812423          	sw	s0,8(sp)
    2240:	00912223          	sw	s1,4(sp)
    2244:	00112623          	sw	ra,12(sp)
    2248:	fff00793          	li	a5,-1
    224c:	25850493          	addi	s1,a0,600
    2250:	00050413          	mv	s0,a0
    2254:	44f52c23          	sw	a5,1112(a0)
    2258:	24052a23          	sw	zero,596(a0)
    225c:	44052e23          	sw	zero,1116(a0)
    2260:	20000613          	li	a2,512
    2264:	00048513          	mv	a0,s1
    2268:	00000593          	li	a1,0
    226c:	ffffe097          	auipc	ra,0xffffe
    2270:	7d8080e7          	jalr	2008(ra) # a44 <memset>
    2274:	25442783          	lw	a5,596(s0)
    2278:	00c12083          	lw	ra,12(sp)
    227c:	24942a23          	sw	s1,596(s0)
    2280:	46042023          	sw	zero,1120(s0)
    2284:	46f42223          	sw	a5,1124(s0)
    2288:	00812403          	lw	s0,8(sp)
    228c:	00412483          	lw	s1,4(sp)
    2290:	01010113          	addi	sp,sp,16
    2294:	00008067          	ret

00002298 <fatfs_init>:
    2298:	fd010113          	addi	sp,sp,-48
    229c:	02812423          	sw	s0,40(sp)
    22a0:	02112623          	sw	ra,44(sp)
    22a4:	02912223          	sw	s1,36(sp)
    22a8:	03212023          	sw	s2,32(sp)
    22ac:	01312e23          	sw	s3,28(sp)
    22b0:	fff00793          	li	a5,-1
    22b4:	24f52223          	sw	a5,580(a0)
    22b8:	24052423          	sw	zero,584(a0)
    22bc:	02052223          	sw	zero,36(a0)
    22c0:	00050413          	mv	s0,a0
    22c4:	00000097          	auipc	ra,0x0
    22c8:	f74080e7          	jalr	-140(ra) # 2238 <fatfs_fat_init>
    22cc:	03442783          	lw	a5,52(s0)
    22d0:	02079463          	bnez	a5,22f8 <fatfs_init+0x60>
    22d4:	fff00713          	li	a4,-1
    22d8:	02c12083          	lw	ra,44(sp)
    22dc:	02812403          	lw	s0,40(sp)
    22e0:	02412483          	lw	s1,36(sp)
    22e4:	02012903          	lw	s2,32(sp)
    22e8:	01c12983          	lw	s3,28(sp)
    22ec:	00070513          	mv	a0,a4
    22f0:	03010113          	addi	sp,sp,48
    22f4:	00008067          	ret
    22f8:	04440593          	addi	a1,s0,68
    22fc:	00100613          	li	a2,1
    2300:	00000513          	li	a0,0
    2304:	00b12623          	sw	a1,12(sp)
    2308:	000780e7          	jalr	a5
    230c:	fc0504e3          	beqz	a0,22d4 <fatfs_init+0x3c>
    2310:	24244703          	lbu	a4,578(s0)
    2314:	05500793          	li	a5,85
    2318:	00c12583          	lw	a1,12(sp)
    231c:	00f70663          	beq	a4,a5,2328 <fatfs_init+0x90>
    2320:	ffd00713          	li	a4,-3
    2324:	fb5ff06f          	j	22d8 <fatfs_init+0x40>
    2328:	24344703          	lbu	a4,579(s0)
    232c:	0aa00793          	li	a5,170
    2330:	fef718e3          	bne	a4,a5,2320 <fatfs_init+0x88>
    2334:	20644783          	lbu	a5,518(s0)
    2338:	00600713          	li	a4,6
    233c:	02f76463          	bltu	a4,a5,2364 <fatfs_init+0xcc>
    2340:	00400713          	li	a4,4
    2344:	00f76663          	bltu	a4,a5,2350 <fatfs_init+0xb8>
    2348:	00000513          	li	a0,0
    234c:	02078663          	beqz	a5,2378 <fatfs_init+0xe0>
    2350:	20c45503          	lhu	a0,524(s0)
    2354:	20a45783          	lhu	a5,522(s0)
    2358:	01051513          	slli	a0,a0,0x10
    235c:	00f56533          	or	a0,a0,a5
    2360:	0180006f          	j	2378 <fatfs_init+0xe0>
    2364:	00c00713          	li	a4,12
    2368:	12f76663          	bltu	a4,a5,2494 <fatfs_init+0x1fc>
    236c:	00a00713          	li	a4,10
    2370:	00000513          	li	a0,0
    2374:	fcf76ee3          	bltu	a4,a5,2350 <fatfs_init+0xb8>
    2378:	03442783          	lw	a5,52(s0)
    237c:	00a42e23          	sw	a0,28(s0)
    2380:	00100613          	li	a2,1
    2384:	000780e7          	jalr	a5
    2388:	f40506e3          	beqz	a0,22d4 <fatfs_init+0x3c>
    238c:	05044783          	lbu	a5,80(s0)
    2390:	04f44703          	lbu	a4,79(s0)
    2394:	20000693          	li	a3,512
    2398:	00879793          	slli	a5,a5,0x8
    239c:	00e7e7b3          	or	a5,a5,a4
    23a0:	ffe00713          	li	a4,-2
    23a4:	f2d79ae3          	bne	a5,a3,22d8 <fatfs_init+0x40>
    23a8:	05644483          	lbu	s1,86(s0)
    23ac:	05544783          	lbu	a5,85(s0)
    23b0:	05144983          	lbu	s3,81(s0)
    23b4:	00849493          	slli	s1,s1,0x8
    23b8:	05a45583          	lhu	a1,90(s0)
    23bc:	00f4e4b3          	or	s1,s1,a5
    23c0:	01340023          	sb	s3,0(s0)
    23c4:	02941423          	sh	s1,40(s0)
    23c8:	05245903          	lhu	s2,82(s0)
    23cc:	05444503          	lbu	a0,84(s0)
    23d0:	00059463          	bnez	a1,23d8 <fatfs_init+0x140>
    23d4:	06842583          	lw	a1,104(s0)
    23d8:	07042783          	lw	a5,112(s0)
    23dc:	02b42023          	sw	a1,32(s0)
    23e0:	00549493          	slli	s1,s1,0x5
    23e4:	00f42423          	sw	a5,8(s0)
    23e8:	07445783          	lhu	a5,116(s0)
    23ec:	1ff48493          	addi	s1,s1,511
    23f0:	4094d493          	srai	s1,s1,0x9
    23f4:	00f41c23          	sh	a5,24(s0)
    23f8:	fffff097          	auipc	ra,0xfffff
    23fc:	df4080e7          	jalr	-524(ra) # 11ec <__mulsi3>
    2400:	00a907b3          	add	a5,s2,a0
    2404:	00f42623          	sw	a5,12(s0)
    2408:	01c42783          	lw	a5,28(s0)
    240c:	24245703          	lhu	a4,578(s0)
    2410:	00942823          	sw	s1,16(s0)
    2414:	00f907b3          	add	a5,s2,a5
    2418:	00f42a23          	sw	a5,20(s0)
    241c:	00f507b3          	add	a5,a0,a5
    2420:	00f42223          	sw	a5,4(s0)
    2424:	0000b7b7          	lui	a5,0xb
    2428:	a5578793          	addi	a5,a5,-1451 # aa55 <_files+0x1c9d>
    242c:	eef71ae3          	bne	a4,a5,2320 <fatfs_init+0x88>
    2430:	05844783          	lbu	a5,88(s0)
    2434:	05744703          	lbu	a4,87(s0)
    2438:	00879793          	slli	a5,a5,0x8
    243c:	00e7e7b3          	or	a5,a5,a4
    2440:	00079463          	bnez	a5,2448 <fatfs_init+0x1b0>
    2444:	06442783          	lw	a5,100(s0)
    2448:	ffb00713          	li	a4,-5
    244c:	e80986e3          	beqz	s3,22d8 <fatfs_init+0x40>
    2450:	00990933          	add	s2,s2,s1
    2454:	00a90533          	add	a0,s2,a0
    2458:	40a78533          	sub	a0,a5,a0
    245c:	00098593          	mv	a1,s3
    2460:	ffffe097          	auipc	ra,0xffffe
    2464:	538080e7          	jalr	1336(ra) # 998 <__udivsi3>
    2468:	000017b7          	lui	a5,0x1
    246c:	ff478793          	addi	a5,a5,-12 # ff4 <print_dec+0x68>
    2470:	ffb00713          	li	a4,-5
    2474:	e6a7f2e3          	bgeu	a5,a0,22d8 <fatfs_init+0x40>
    2478:	000107b7          	lui	a5,0x10
    247c:	ff478793          	addi	a5,a5,-12 # fff4 <_files+0x723c>
    2480:	02a7e663          	bltu	a5,a0,24ac <fatfs_init+0x214>
    2484:	00042423          	sw	zero,8(s0)
    2488:	02042823          	sw	zero,48(s0)
    248c:	00000713          	li	a4,0
    2490:	e49ff06f          	j	22d8 <fatfs_init+0x40>
    2494:	ff278793          	addi	a5,a5,-14
    2498:	0ff7f793          	zext.b	a5,a5
    249c:	00100713          	li	a4,1
    24a0:	00000513          	li	a0,0
    24a4:	eaf776e3          	bgeu	a4,a5,2350 <fatfs_init+0xb8>
    24a8:	ed1ff06f          	j	2378 <fatfs_init+0xe0>
    24ac:	00100793          	li	a5,1
    24b0:	02f42823          	sw	a5,48(s0)
    24b4:	fd9ff06f          	j	248c <fatfs_init+0x1f4>

000024b8 <fl_attach_media>:
    24b8:	000047b7          	lui	a5,0x4
    24bc:	0cc7a783          	lw	a5,204(a5) # 40cc <_filelib_init>
    24c0:	fe010113          	addi	sp,sp,-32
    24c4:	00812c23          	sw	s0,24(sp)
    24c8:	00112e23          	sw	ra,28(sp)
    24cc:	00050413          	mv	s0,a0
    24d0:	00079a63          	bnez	a5,24e4 <fl_attach_media+0x2c>
    24d4:	00b12623          	sw	a1,12(sp)
    24d8:	fffff097          	auipc	ra,0xfffff
    24dc:	178080e7          	jalr	376(ra) # 1650 <fl_init>
    24e0:	00c12583          	lw	a1,12(sp)
    24e4:	000097b7          	lui	a5,0x9
    24e8:	95078513          	addi	a0,a5,-1712 # 8950 <_fs>
    24ec:	02b52c23          	sw	a1,56(a0)
    24f0:	02852a23          	sw	s0,52(a0)
    24f4:	00000097          	auipc	ra,0x0
    24f8:	da4080e7          	jalr	-604(ra) # 2298 <fatfs_init>
    24fc:	00050593          	mv	a1,a0
    2500:	02050863          	beqz	a0,2530 <fl_attach_media+0x78>
    2504:	00a12623          	sw	a0,12(sp)
    2508:	00004537          	lui	a0,0x4
    250c:	e5850513          	addi	a0,a0,-424 # 3e58 <LEDS+0x94>
    2510:	fffff097          	auipc	ra,0xfffff
    2514:	ba0080e7          	jalr	-1120(ra) # 10b0 <printf>
    2518:	00c12583          	lw	a1,12(sp)
    251c:	01c12083          	lw	ra,28(sp)
    2520:	01812403          	lw	s0,24(sp)
    2524:	00058513          	mv	a0,a1
    2528:	02010113          	addi	sp,sp,32
    252c:	00008067          	ret
    2530:	000047b7          	lui	a5,0x4
    2534:	00100713          	li	a4,1
    2538:	0ce7a423          	sw	a4,200(a5) # 40c8 <_filelib_valid>
    253c:	fe1ff06f          	j	251c <fl_attach_media+0x64>

00002540 <fatfs_fat_purge>:
    2540:	25452583          	lw	a1,596(a0)
    2544:	fe010113          	addi	sp,sp,-32
    2548:	00812c23          	sw	s0,24(sp)
    254c:	00112e23          	sw	ra,28(sp)
    2550:	00050413          	mv	s0,a0
    2554:	00059663          	bnez	a1,2560 <fatfs_fat_purge+0x20>
    2558:	00100513          	li	a0,1
    255c:	02c0006f          	j	2588 <fatfs_fat_purge+0x48>
    2560:	2045a783          	lw	a5,516(a1)
    2564:	00079663          	bnez	a5,2570 <fatfs_fat_purge+0x30>
    2568:	20c5a583          	lw	a1,524(a1)
    256c:	fe9ff06f          	j	2554 <fatfs_fat_purge+0x14>
    2570:	00040513          	mv	a0,s0
    2574:	00b12623          	sw	a1,12(sp)
    2578:	fffff097          	auipc	ra,0xfffff
    257c:	da8080e7          	jalr	-600(ra) # 1320 <fatfs_fat_writeback>
    2580:	00c12583          	lw	a1,12(sp)
    2584:	fe0512e3          	bnez	a0,2568 <fatfs_fat_purge+0x28>
    2588:	01c12083          	lw	ra,28(sp)
    258c:	01812403          	lw	s0,24(sp)
    2590:	02010113          	addi	sp,sp,32
    2594:	00008067          	ret

00002598 <fatfs_find_next_cluster>:
    2598:	ff010113          	addi	sp,sp,-16
    259c:	00812423          	sw	s0,8(sp)
    25a0:	01212023          	sw	s2,0(sp)
    25a4:	00112623          	sw	ra,12(sp)
    25a8:	00912223          	sw	s1,4(sp)
    25ac:	00050913          	mv	s2,a0
    25b0:	00200413          	li	s0,2
    25b4:	00058463          	beqz	a1,25bc <fatfs_find_next_cluster+0x24>
    25b8:	00058413          	mv	s0,a1
    25bc:	03092783          	lw	a5,48(s2)
    25c0:	00745493          	srli	s1,s0,0x7
    25c4:	00079463          	bnez	a5,25cc <fatfs_find_next_cluster+0x34>
    25c8:	00845493          	srli	s1,s0,0x8
    25cc:	01492583          	lw	a1,20(s2)
    25d0:	00090513          	mv	a0,s2
    25d4:	00b485b3          	add	a1,s1,a1
    25d8:	fffff097          	auipc	ra,0xfffff
    25dc:	dcc080e7          	jalr	-564(ra) # 13a4 <fatfs_fat_read_sector>
    25e0:	00050793          	mv	a5,a0
    25e4:	fff00513          	li	a0,-1
    25e8:	04078863          	beqz	a5,2638 <fatfs_find_next_cluster+0xa0>
    25ec:	03092703          	lw	a4,48(s2)
    25f0:	2087a783          	lw	a5,520(a5)
    25f4:	04071e63          	bnez	a4,2650 <fatfs_find_next_cluster+0xb8>
    25f8:	00849493          	slli	s1,s1,0x8
    25fc:	40940433          	sub	s0,s0,s1
    2600:	00141413          	slli	s0,s0,0x1
    2604:	01041413          	slli	s0,s0,0x10
    2608:	01045413          	srli	s0,s0,0x10
    260c:	008787b3          	add	a5,a5,s0
    2610:	0017c503          	lbu	a0,1(a5)
    2614:	0007c783          	lbu	a5,0(a5)
    2618:	00851513          	slli	a0,a0,0x8
    261c:	00f50533          	add	a0,a0,a5
    2620:	ffff07b7          	lui	a5,0xffff0
    2624:	00878793          	addi	a5,a5,8 # ffff0008 <__stacktop+0xfffe0008>
    2628:	00f507b3          	add	a5,a0,a5
    262c:	00700713          	li	a4,7
    2630:	00f76463          	bltu	a4,a5,2638 <fatfs_find_next_cluster+0xa0>
    2634:	fff00513          	li	a0,-1
    2638:	00c12083          	lw	ra,12(sp)
    263c:	00812403          	lw	s0,8(sp)
    2640:	00412483          	lw	s1,4(sp)
    2644:	00012903          	lw	s2,0(sp)
    2648:	01010113          	addi	sp,sp,16
    264c:	00008067          	ret
    2650:	00749493          	slli	s1,s1,0x7
    2654:	40940433          	sub	s0,s0,s1
    2658:	00241413          	slli	s0,s0,0x2
    265c:	01041413          	slli	s0,s0,0x10
    2660:	01045413          	srli	s0,s0,0x10
    2664:	008787b3          	add	a5,a5,s0
    2668:	0037c503          	lbu	a0,3(a5)
    266c:	0027c703          	lbu	a4,2(a5)
    2670:	01851513          	slli	a0,a0,0x18
    2674:	01071713          	slli	a4,a4,0x10
    2678:	00e50533          	add	a0,a0,a4
    267c:	0007c703          	lbu	a4,0(a5)
    2680:	0017c783          	lbu	a5,1(a5)
    2684:	00e50533          	add	a0,a0,a4
    2688:	00879793          	slli	a5,a5,0x8
    268c:	00f50533          	add	a0,a0,a5
    2690:	00451513          	slli	a0,a0,0x4
    2694:	00455513          	srli	a0,a0,0x4
    2698:	f00007b7          	lui	a5,0xf0000
    269c:	f89ff06f          	j	2624 <fatfs_find_next_cluster+0x8c>

000026a0 <fatfs_sector_reader>:
    26a0:	03052783          	lw	a5,48(a0)
    26a4:	fe010113          	addi	sp,sp,-32
    26a8:	00812c23          	sw	s0,24(sp)
    26ac:	01212823          	sw	s2,16(sp)
    26b0:	01512223          	sw	s5,4(sp)
    26b4:	00112e23          	sw	ra,28(sp)
    26b8:	00912a23          	sw	s1,20(sp)
    26bc:	01312623          	sw	s3,12(sp)
    26c0:	01412423          	sw	s4,8(sp)
    26c4:	01612023          	sw	s6,0(sp)
    26c8:	00f5e7b3          	or	a5,a1,a5
    26cc:	00050413          	mv	s0,a0
    26d0:	00060913          	mv	s2,a2
    26d4:	00068a93          	mv	s5,a3
    26d8:	08079063          	bnez	a5,2758 <fatfs_sector_reader+0xb8>
    26dc:	01052783          	lw	a5,16(a0)
    26e0:	02f66863          	bltu	a2,a5,2710 <fatfs_sector_reader+0x70>
    26e4:	00000513          	li	a0,0
    26e8:	01c12083          	lw	ra,28(sp)
    26ec:	01812403          	lw	s0,24(sp)
    26f0:	01412483          	lw	s1,20(sp)
    26f4:	01012903          	lw	s2,16(sp)
    26f8:	00c12983          	lw	s3,12(sp)
    26fc:	00812a03          	lw	s4,8(sp)
    2700:	00412a83          	lw	s5,4(sp)
    2704:	00012b03          	lw	s6,0(sp)
    2708:	02010113          	addi	sp,sp,32
    270c:	00008067          	ret
    2710:	01c52503          	lw	a0,28(a0)
    2714:	00c42783          	lw	a5,12(s0)
    2718:	00f50533          	add	a0,a0,a5
    271c:	01250533          	add	a0,a0,s2
    2720:	0a0a8663          	beqz	s5,27cc <fatfs_sector_reader+0x12c>
    2724:	03442783          	lw	a5,52(s0)
    2728:	00100613          	li	a2,1
    272c:	000a8593          	mv	a1,s5
    2730:	01812403          	lw	s0,24(sp)
    2734:	01c12083          	lw	ra,28(sp)
    2738:	01412483          	lw	s1,20(sp)
    273c:	01012903          	lw	s2,16(sp)
    2740:	00c12983          	lw	s3,12(sp)
    2744:	00812a03          	lw	s4,8(sp)
    2748:	00412a83          	lw	s5,4(sp)
    274c:	00012b03          	lw	s6,0(sp)
    2750:	02010113          	addi	sp,sp,32
    2754:	00078067          	jr	a5 # f0000000 <__stacktop+0xefff0000>
    2758:	00054783          	lbu	a5,0(a0)
    275c:	00058493          	mv	s1,a1
    2760:	00060513          	mv	a0,a2
    2764:	00078593          	mv	a1,a5
    2768:	00078a13          	mv	s4,a5
    276c:	ffffe097          	auipc	ra,0xffffe
    2770:	22c080e7          	jalr	556(ra) # 998 <__udivsi3>
    2774:	00050b13          	mv	s6,a0
    2778:	00000993          	li	s3,0
    277c:	03699a63          	bne	s3,s6,27b0 <fatfs_sector_reader+0x110>
    2780:	fff00793          	li	a5,-1
    2784:	f6f480e3          	beq	s1,a5,26e4 <fatfs_sector_reader+0x44>
    2788:	000a0593          	mv	a1,s4
    278c:	00090513          	mv	a0,s2
    2790:	ffffe097          	auipc	ra,0xffffe
    2794:	250080e7          	jalr	592(ra) # 9e0 <__umodsi3>
    2798:	00050913          	mv	s2,a0
    279c:	00048593          	mv	a1,s1
    27a0:	00040513          	mv	a0,s0
    27a4:	fffff097          	auipc	ra,0xfffff
    27a8:	dac080e7          	jalr	-596(ra) # 1550 <fatfs_lba_of_cluster>
    27ac:	f71ff06f          	j	271c <fatfs_sector_reader+0x7c>
    27b0:	00048593          	mv	a1,s1
    27b4:	00040513          	mv	a0,s0
    27b8:	00000097          	auipc	ra,0x0
    27bc:	de0080e7          	jalr	-544(ra) # 2598 <fatfs_find_next_cluster>
    27c0:	00050493          	mv	s1,a0
    27c4:	00198993          	addi	s3,s3,1
    27c8:	fb5ff06f          	j	277c <fatfs_sector_reader+0xdc>
    27cc:	24442783          	lw	a5,580(s0)
    27d0:	00a78c63          	beq	a5,a0,27e8 <fatfs_sector_reader+0x148>
    27d4:	03442783          	lw	a5,52(s0)
    27d8:	24a42223          	sw	a0,580(s0)
    27dc:	00100613          	li	a2,1
    27e0:	04440593          	addi	a1,s0,68
    27e4:	f4dff06f          	j	2730 <fatfs_sector_reader+0x90>
    27e8:	00100513          	li	a0,1
    27ec:	efdff06f          	j	26e8 <fatfs_sector_reader+0x48>

000027f0 <fatfs_get_file_entry>:
    27f0:	eb010113          	addi	sp,sp,-336
    27f4:	14812423          	sw	s0,328(sp)
    27f8:	14912223          	sw	s1,324(sp)
    27fc:	13312e23          	sw	s3,316(sp)
    2800:	13712623          	sw	s7,300(sp)
    2804:	13812423          	sw	s8,296(sp)
    2808:	13912223          	sw	s9,292(sp)
    280c:	14112623          	sw	ra,332(sp)
    2810:	15212023          	sw	s2,320(sp)
    2814:	13412c23          	sw	s4,312(sp)
    2818:	13512a23          	sw	s5,308(sp)
    281c:	13612823          	sw	s6,304(sp)
    2820:	00050993          	mv	s3,a0
    2824:	00058c93          	mv	s9,a1
    2828:	00060b93          	mv	s7,a2
    282c:	00068c13          	mv	s8,a3
    2830:	10010ea3          	sb	zero,285(sp)
    2834:	01810413          	addi	s0,sp,24
    2838:	11c10493          	addi	s1,sp,284
    283c:	00040513          	mv	a0,s0
    2840:	00d00613          	li	a2,13
    2844:	00000593          	li	a1,0
    2848:	00d40413          	addi	s0,s0,13
    284c:	ffffe097          	auipc	ra,0xffffe
    2850:	1f8080e7          	jalr	504(ra) # a44 <memset>
    2854:	fe9414e3          	bne	s0,s1,283c <fatfs_get_file_entry+0x4c>
    2858:	00000493          	li	s1,0
    285c:	24498a13          	addi	s4,s3,580
    2860:	00810913          	addi	s2,sp,8
    2864:	00800a93          	li	s5,8
    2868:	02e00b13          	li	s6,46
    286c:	00000693          	li	a3,0
    2870:	00048613          	mv	a2,s1
    2874:	000c8593          	mv	a1,s9
    2878:	00098513          	mv	a0,s3
    287c:	00000097          	auipc	ra,0x0
    2880:	e24080e7          	jalr	-476(ra) # 26a0 <fatfs_sector_reader>
    2884:	08050c63          	beqz	a0,291c <fatfs_get_file_entry+0x12c>
    2888:	00148493          	addi	s1,s1,1
    288c:	04498413          	addi	s0,s3,68
    2890:	00040513          	mv	a0,s0
    2894:	fffff097          	auipc	ra,0xfffff
    2898:	f34080e7          	jalr	-204(ra) # 17c8 <fatfs_entry_lfn_text>
    289c:	02050063          	beqz	a0,28bc <fatfs_get_file_entry+0xcc>
    28a0:	00040593          	mv	a1,s0
    28a4:	01810513          	addi	a0,sp,24
    28a8:	fffff097          	auipc	ra,0xfffff
    28ac:	e18080e7          	jalr	-488(ra) # 16c0 <fatfs_lfn_cache_entry>
    28b0:	02040413          	addi	s0,s0,32
    28b4:	fd441ee3          	bne	s0,s4,2890 <fatfs_get_file_entry+0xa0>
    28b8:	fb5ff06f          	j	286c <fatfs_get_file_entry+0x7c>
    28bc:	00040513          	mv	a0,s0
    28c0:	fffff097          	auipc	ra,0xfffff
    28c4:	f1c080e7          	jalr	-228(ra) # 17dc <fatfs_entry_lfn_invalid>
    28c8:	00050663          	beqz	a0,28d4 <fatfs_get_file_entry+0xe4>
    28cc:	10010ea3          	sb	zero,285(sp)
    28d0:	fe1ff06f          	j	28b0 <fatfs_get_file_entry+0xc0>
    28d4:	00040593          	mv	a1,s0
    28d8:	01810513          	addi	a0,sp,24
    28dc:	fffff097          	auipc	ra,0xfffff
    28e0:	f34080e7          	jalr	-204(ra) # 1810 <fatfs_entry_lfn_exists>
    28e4:	06050663          	beqz	a0,2950 <fatfs_get_file_entry+0x160>
    28e8:	01810513          	addi	a0,sp,24
    28ec:	fffff097          	auipc	ra,0xfffff
    28f0:	ea0080e7          	jalr	-352(ra) # 178c <fatfs_lfn_cache_get>
    28f4:	000b8593          	mv	a1,s7
    28f8:	fffff097          	auipc	ra,0xfffff
    28fc:	6dc080e7          	jalr	1756(ra) # 1fd4 <fatfs_compare_names>
    2900:	fc0506e3          	beqz	a0,28cc <fatfs_get_file_entry+0xdc>
    2904:	02000613          	li	a2,32
    2908:	00040593          	mv	a1,s0
    290c:	000c0513          	mv	a0,s8
    2910:	ffffe097          	auipc	ra,0xffffe
    2914:	150080e7          	jalr	336(ra) # a60 <memcpy>
    2918:	00100513          	li	a0,1
    291c:	14c12083          	lw	ra,332(sp)
    2920:	14812403          	lw	s0,328(sp)
    2924:	14412483          	lw	s1,324(sp)
    2928:	14012903          	lw	s2,320(sp)
    292c:	13c12983          	lw	s3,316(sp)
    2930:	13812a03          	lw	s4,312(sp)
    2934:	13412a83          	lw	s5,308(sp)
    2938:	13012b03          	lw	s6,304(sp)
    293c:	12c12b83          	lw	s7,300(sp)
    2940:	12812c03          	lw	s8,296(sp)
    2944:	12412c83          	lw	s9,292(sp)
    2948:	15010113          	addi	sp,sp,336
    294c:	00008067          	ret
    2950:	00040513          	mv	a0,s0
    2954:	fffff097          	auipc	ra,0xfffff
    2958:	f0c080e7          	jalr	-244(ra) # 1860 <fatfs_entry_sfn_only>
    295c:	f4050ae3          	beqz	a0,28b0 <fatfs_get_file_entry+0xc0>
    2960:	00d00613          	li	a2,13
    2964:	00000593          	li	a1,0
    2968:	00090513          	mv	a0,s2
    296c:	ffffe097          	auipc	ra,0xffffe
    2970:	0d8080e7          	jalr	216(ra) # a44 <memset>
    2974:	00000793          	li	a5,0
    2978:	00f406b3          	add	a3,s0,a5
    297c:	0006c683          	lbu	a3,0(a3)
    2980:	00f90733          	add	a4,s2,a5
    2984:	00178793          	addi	a5,a5,1
    2988:	00d70023          	sb	a3,0(a4)
    298c:	ff5796e3          	bne	a5,s5,2978 <fatfs_get_file_entry+0x188>
    2990:	00844703          	lbu	a4,8(s0)
    2994:	00944783          	lbu	a5,9(s0)
    2998:	00a44683          	lbu	a3,10(s0)
    299c:	00e108a3          	sb	a4,17(sp)
    29a0:	00f10923          	sb	a5,18(sp)
    29a4:	fe070713          	addi	a4,a4,-32
    29a8:	fe078793          	addi	a5,a5,-32
    29ac:	00f037b3          	snez	a5,a5
    29b0:	00e03733          	snez	a4,a4
    29b4:	00d109a3          	sb	a3,19(sp)
    29b8:	00e7e7b3          	or	a5,a5,a4
    29bc:	00079863          	bnez	a5,29cc <fatfs_get_file_entry+0x1dc>
    29c0:	fe068693          	addi	a3,a3,-32
    29c4:	02000793          	li	a5,32
    29c8:	00068a63          	beqz	a3,29dc <fatfs_get_file_entry+0x1ec>
    29cc:	00814703          	lbu	a4,8(sp)
    29d0:	02e00793          	li	a5,46
    29d4:	01671463          	bne	a4,s6,29dc <fatfs_get_file_entry+0x1ec>
    29d8:	02000793          	li	a5,32
    29dc:	00f10823          	sb	a5,16(sp)
    29e0:	000b8593          	mv	a1,s7
    29e4:	00090513          	mv	a0,s2
    29e8:	f11ff06f          	j	28f8 <fatfs_get_file_entry+0x108>

000029ec <_open_directory>:
    29ec:	eb010113          	addi	sp,sp,-336
    29f0:	15212023          	sw	s2,320(sp)
    29f4:	00009937          	lui	s2,0x9
    29f8:	95090913          	addi	s2,s2,-1712 # 8950 <_fs>
    29fc:	14812423          	sw	s0,328(sp)
    2a00:	00892403          	lw	s0,8(s2)
    2a04:	14912223          	sw	s1,324(sp)
    2a08:	13312e23          	sw	s3,316(sp)
    2a0c:	13412c23          	sw	s4,312(sp)
    2a10:	13512a23          	sw	s5,308(sp)
    2a14:	13612823          	sw	s6,304(sp)
    2a18:	14112623          	sw	ra,332(sp)
    2a1c:	00050a13          	mv	s4,a0
    2a20:	00058a93          	mv	s5,a1
    2a24:	fffff097          	auipc	ra,0xfffff
    2a28:	368080e7          	jalr	872(ra) # 1d8c <fatfs_total_path_levels>
    2a2c:	00050b13          	mv	s6,a0
    2a30:	00000493          	li	s1,0
    2a34:	fff00993          	li	s3,-1
    2a38:	009b5863          	bge	s6,s1,2a48 <_open_directory+0x5c>
    2a3c:	008aa023          	sw	s0,0(s5)
    2a40:	00100513          	li	a0,1
    2a44:	0240006f          	j	2a68 <_open_directory+0x7c>
    2a48:	10400693          	li	a3,260
    2a4c:	02c10613          	addi	a2,sp,44
    2a50:	00048593          	mv	a1,s1
    2a54:	000a0513          	mv	a0,s4
    2a58:	fffff097          	auipc	ra,0xfffff
    2a5c:	3a4080e7          	jalr	932(ra) # 1dfc <fatfs_get_substring>
    2a60:	03351863          	bne	a0,s3,2a90 <_open_directory+0xa4>
    2a64:	00000513          	li	a0,0
    2a68:	14c12083          	lw	ra,332(sp)
    2a6c:	14812403          	lw	s0,328(sp)
    2a70:	14412483          	lw	s1,324(sp)
    2a74:	14012903          	lw	s2,320(sp)
    2a78:	13c12983          	lw	s3,316(sp)
    2a7c:	13812a03          	lw	s4,312(sp)
    2a80:	13412a83          	lw	s5,308(sp)
    2a84:	13012b03          	lw	s6,304(sp)
    2a88:	15010113          	addi	sp,sp,336
    2a8c:	00008067          	ret
    2a90:	00c10693          	addi	a3,sp,12
    2a94:	02c10613          	addi	a2,sp,44
    2a98:	00040593          	mv	a1,s0
    2a9c:	00090513          	mv	a0,s2
    2aa0:	00000097          	auipc	ra,0x0
    2aa4:	d50080e7          	jalr	-688(ra) # 27f0 <fatfs_get_file_entry>
    2aa8:	fa050ee3          	beqz	a0,2a64 <_open_directory+0x78>
    2aac:	01714783          	lbu	a5,23(sp)
    2ab0:	0107f793          	andi	a5,a5,16
    2ab4:	fa0788e3          	beqz	a5,2a64 <_open_directory+0x78>
    2ab8:	02015403          	lhu	s0,32(sp)
    2abc:	02615783          	lhu	a5,38(sp)
    2ac0:	00148493          	addi	s1,s1,1
    2ac4:	01041413          	slli	s0,s0,0x10
    2ac8:	00f40433          	add	s0,s0,a5
    2acc:	f6dff06f          	j	2a38 <_open_directory+0x4c>

00002ad0 <fl_opendir>:
    2ad0:	fe010113          	addi	sp,sp,-32
    2ad4:	fff00793          	li	a5,-1
    2ad8:	00f12623          	sw	a5,12(sp)
    2adc:	000047b7          	lui	a5,0x4
    2ae0:	0cc7a783          	lw	a5,204(a5) # 40cc <_filelib_init>
    2ae4:	00812c23          	sw	s0,24(sp)
    2ae8:	01212823          	sw	s2,16(sp)
    2aec:	00112e23          	sw	ra,28(sp)
    2af0:	00912a23          	sw	s1,20(sp)
    2af4:	00050913          	mv	s2,a0
    2af8:	00058413          	mv	s0,a1
    2afc:	00079663          	bnez	a5,2b08 <fl_opendir+0x38>
    2b00:	fffff097          	auipc	ra,0xfffff
    2b04:	b50080e7          	jalr	-1200(ra) # 1650 <fl_init>
    2b08:	000094b7          	lui	s1,0x9
    2b0c:	95048493          	addi	s1,s1,-1712 # 8950 <_fs>
    2b10:	03c4a783          	lw	a5,60(s1)
    2b14:	00078463          	beqz	a5,2b1c <fl_opendir+0x4c>
    2b18:	000780e7          	jalr	a5
    2b1c:	00090513          	mv	a0,s2
    2b20:	fffff097          	auipc	ra,0xfffff
    2b24:	26c080e7          	jalr	620(ra) # 1d8c <fatfs_total_path_levels>
    2b28:	fff00793          	li	a5,-1
    2b2c:	02f51063          	bne	a0,a5,2b4c <fl_opendir+0x7c>
    2b30:	0084a783          	lw	a5,8(s1)
    2b34:	00f12623          	sw	a5,12(sp)
    2b38:	00c12783          	lw	a5,12(sp)
    2b3c:	00042023          	sw	zero,0(s0)
    2b40:	00040423          	sb	zero,8(s0)
    2b44:	00f42223          	sw	a5,4(s0)
    2b48:	0180006f          	j	2b60 <fl_opendir+0x90>
    2b4c:	00c10593          	addi	a1,sp,12
    2b50:	00090513          	mv	a0,s2
    2b54:	00000097          	auipc	ra,0x0
    2b58:	e98080e7          	jalr	-360(ra) # 29ec <_open_directory>
    2b5c:	fc051ee3          	bnez	a0,2b38 <fl_opendir+0x68>
    2b60:	0404a783          	lw	a5,64(s1)
    2b64:	00078463          	beqz	a5,2b6c <fl_opendir+0x9c>
    2b68:	000780e7          	jalr	a5
    2b6c:	00c12703          	lw	a4,12(sp)
    2b70:	fff00793          	li	a5,-1
    2b74:	00f71463          	bne	a4,a5,2b7c <fl_opendir+0xac>
    2b78:	00000413          	li	s0,0
    2b7c:	01c12083          	lw	ra,28(sp)
    2b80:	00040513          	mv	a0,s0
    2b84:	01812403          	lw	s0,24(sp)
    2b88:	01412483          	lw	s1,20(sp)
    2b8c:	01012903          	lw	s2,16(sp)
    2b90:	02010113          	addi	sp,sp,32
    2b94:	00008067          	ret

00002b98 <_open_file>:
    2b98:	fc010113          	addi	sp,sp,-64
    2b9c:	03312623          	sw	s3,44(sp)
    2ba0:	02112e23          	sw	ra,60(sp)
    2ba4:	02812c23          	sw	s0,56(sp)
    2ba8:	02912a23          	sw	s1,52(sp)
    2bac:	03212823          	sw	s2,48(sp)
    2bb0:	00050993          	mv	s3,a0
    2bb4:	fffff097          	auipc	ra,0xfffff
    2bb8:	8dc080e7          	jalr	-1828(ra) # 1490 <_allocate_file>
    2bbc:	06050463          	beqz	a0,2c24 <_open_file+0x8c>
    2bc0:	01450913          	addi	s2,a0,20
    2bc4:	00050413          	mv	s0,a0
    2bc8:	10400613          	li	a2,260
    2bcc:	00000593          	li	a1,0
    2bd0:	00090513          	mv	a0,s2
    2bd4:	ffffe097          	auipc	ra,0xffffe
    2bd8:	e70080e7          	jalr	-400(ra) # a44 <memset>
    2bdc:	11840493          	addi	s1,s0,280
    2be0:	10400613          	li	a2,260
    2be4:	00000593          	li	a1,0
    2be8:	00048513          	mv	a0,s1
    2bec:	ffffe097          	auipc	ra,0xffffe
    2bf0:	e58080e7          	jalr	-424(ra) # a44 <memset>
    2bf4:	10400713          	li	a4,260
    2bf8:	00048693          	mv	a3,s1
    2bfc:	00070613          	mv	a2,a4
    2c00:	00090593          	mv	a1,s2
    2c04:	00098513          	mv	a0,s3
    2c08:	fffff097          	auipc	ra,0xfffff
    2c0c:	2dc080e7          	jalr	732(ra) # 1ee4 <fatfs_split_path>
    2c10:	fff00793          	li	a5,-1
    2c14:	02f51a63          	bne	a0,a5,2c48 <_open_file+0xb0>
    2c18:	00040513          	mv	a0,s0
    2c1c:	fffff097          	auipc	ra,0xfffff
    2c20:	8ec080e7          	jalr	-1812(ra) # 1508 <_free_file>
    2c24:	00000413          	li	s0,0
    2c28:	03c12083          	lw	ra,60(sp)
    2c2c:	00040513          	mv	a0,s0
    2c30:	03812403          	lw	s0,56(sp)
    2c34:	03412483          	lw	s1,52(sp)
    2c38:	03012903          	lw	s2,48(sp)
    2c3c:	02c12983          	lw	s3,44(sp)
    2c40:	04010113          	addi	sp,sp,64
    2c44:	00008067          	ret
    2c48:	00040513          	mv	a0,s0
    2c4c:	fffff097          	auipc	ra,0xfffff
    2c50:	514080e7          	jalr	1300(ra) # 2160 <_check_file_open>
    2c54:	fc0512e3          	bnez	a0,2c18 <_open_file+0x80>
    2c58:	01444783          	lbu	a5,20(s0)
    2c5c:	08079c63          	bnez	a5,2cf4 <_open_file+0x15c>
    2c60:	000097b7          	lui	a5,0x9
    2c64:	9587a783          	lw	a5,-1704(a5) # 8958 <_fs+0x8>
    2c68:	00f42023          	sw	a5,0(s0)
    2c6c:	00042583          	lw	a1,0(s0)
    2c70:	00048613          	mv	a2,s1
    2c74:	000094b7          	lui	s1,0x9
    2c78:	00010693          	mv	a3,sp
    2c7c:	95048513          	addi	a0,s1,-1712 # 8950 <_fs>
    2c80:	00000097          	auipc	ra,0x0
    2c84:	b70080e7          	jalr	-1168(ra) # 27f0 <fatfs_get_file_entry>
    2c88:	f80508e3          	beqz	a0,2c18 <_open_file+0x80>
    2c8c:	00b14783          	lbu	a5,11(sp)
    2c90:	0207f793          	andi	a5,a5,32
    2c94:	f80782e3          	beqz	a5,2c18 <_open_file+0x80>
    2c98:	00b00613          	li	a2,11
    2c9c:	00010593          	mv	a1,sp
    2ca0:	21c40513          	addi	a0,s0,540
    2ca4:	ffffe097          	auipc	ra,0xffffe
    2ca8:	dbc080e7          	jalr	-580(ra) # a60 <memcpy>
    2cac:	01c12783          	lw	a5,28(sp)
    2cb0:	01a15703          	lhu	a4,26(sp)
    2cb4:	00042423          	sw	zero,8(s0)
    2cb8:	00f42623          	sw	a5,12(s0)
    2cbc:	01415783          	lhu	a5,20(sp)
    2cc0:	42042a23          	sw	zero,1076(s0)
    2cc4:	00042823          	sw	zero,16(s0)
    2cc8:	01079793          	slli	a5,a5,0x10
    2ccc:	00e787b3          	add	a5,a5,a4
    2cd0:	00f42223          	sw	a5,4(s0)
    2cd4:	fff00793          	li	a5,-1
    2cd8:	42f42823          	sw	a5,1072(s0)
    2cdc:	22f42423          	sw	a5,552(s0)
    2ce0:	22f42623          	sw	a5,556(s0)
    2ce4:	95048513          	addi	a0,s1,-1712
    2ce8:	00000097          	auipc	ra,0x0
    2cec:	858080e7          	jalr	-1960(ra) # 2540 <fatfs_fat_purge>
    2cf0:	f39ff06f          	j	2c28 <_open_file+0x90>
    2cf4:	00040593          	mv	a1,s0
    2cf8:	00090513          	mv	a0,s2
    2cfc:	00000097          	auipc	ra,0x0
    2d00:	cf0080e7          	jalr	-784(ra) # 29ec <_open_directory>
    2d04:	f60514e3          	bnez	a0,2c6c <_open_file+0xd4>
    2d08:	f11ff06f          	j	2c18 <_open_file+0x80>

00002d0c <fatfs_sfn_exists>:
    2d0c:	fe010113          	addi	sp,sp,-32
    2d10:	01212823          	sw	s2,16(sp)
    2d14:	01312623          	sw	s3,12(sp)
    2d18:	01412423          	sw	s4,8(sp)
    2d1c:	01512223          	sw	s5,4(sp)
    2d20:	01612023          	sw	s6,0(sp)
    2d24:	00112e23          	sw	ra,28(sp)
    2d28:	00812c23          	sw	s0,24(sp)
    2d2c:	00912a23          	sw	s1,20(sp)
    2d30:	00050993          	mv	s3,a0
    2d34:	00058a93          	mv	s5,a1
    2d38:	00060b13          	mv	s6,a2
    2d3c:	00000913          	li	s2,0
    2d40:	24450a13          	addi	s4,a0,580
    2d44:	00000693          	li	a3,0
    2d48:	00090613          	mv	a2,s2
    2d4c:	000a8593          	mv	a1,s5
    2d50:	00098513          	mv	a0,s3
    2d54:	00000097          	auipc	ra,0x0
    2d58:	94c080e7          	jalr	-1716(ra) # 26a0 <fatfs_sector_reader>
    2d5c:	00050413          	mv	s0,a0
    2d60:	06050263          	beqz	a0,2dc4 <fatfs_sfn_exists+0xb8>
    2d64:	00190913          	addi	s2,s2,1
    2d68:	04498493          	addi	s1,s3,68
    2d6c:	00048513          	mv	a0,s1
    2d70:	fffff097          	auipc	ra,0xfffff
    2d74:	a58080e7          	jalr	-1448(ra) # 17c8 <fatfs_entry_lfn_text>
    2d78:	00050863          	beqz	a0,2d88 <fatfs_sfn_exists+0x7c>
    2d7c:	02048493          	addi	s1,s1,32
    2d80:	ff4496e3          	bne	s1,s4,2d6c <fatfs_sfn_exists+0x60>
    2d84:	fc1ff06f          	j	2d44 <fatfs_sfn_exists+0x38>
    2d88:	00048513          	mv	a0,s1
    2d8c:	fffff097          	auipc	ra,0xfffff
    2d90:	a50080e7          	jalr	-1456(ra) # 17dc <fatfs_entry_lfn_invalid>
    2d94:	fe0514e3          	bnez	a0,2d7c <fatfs_sfn_exists+0x70>
    2d98:	00048513          	mv	a0,s1
    2d9c:	fffff097          	auipc	ra,0xfffff
    2da0:	ac4080e7          	jalr	-1340(ra) # 1860 <fatfs_entry_sfn_only>
    2da4:	00050413          	mv	s0,a0
    2da8:	fc050ae3          	beqz	a0,2d7c <fatfs_sfn_exists+0x70>
    2dac:	00b00613          	li	a2,11
    2db0:	000b0593          	mv	a1,s6
    2db4:	00048513          	mv	a0,s1
    2db8:	ffffe097          	auipc	ra,0xffffe
    2dbc:	cec080e7          	jalr	-788(ra) # aa4 <strncmp>
    2dc0:	fa051ee3          	bnez	a0,2d7c <fatfs_sfn_exists+0x70>
    2dc4:	01c12083          	lw	ra,28(sp)
    2dc8:	00040513          	mv	a0,s0
    2dcc:	01812403          	lw	s0,24(sp)
    2dd0:	01412483          	lw	s1,20(sp)
    2dd4:	01012903          	lw	s2,16(sp)
    2dd8:	00c12983          	lw	s3,12(sp)
    2ddc:	00812a03          	lw	s4,8(sp)
    2de0:	00412a83          	lw	s5,4(sp)
    2de4:	00012b03          	lw	s6,0(sp)
    2de8:	02010113          	addi	sp,sp,32
    2dec:	00008067          	ret

00002df0 <fatfs_list_directory_next>:
    2df0:	ec010113          	addi	sp,sp,-320
    2df4:	13212823          	sw	s2,304(sp)
    2df8:	13312623          	sw	s3,300(sp)
    2dfc:	13412423          	sw	s4,296(sp)
    2e00:	13512223          	sw	s5,292(sp)
    2e04:	13612023          	sw	s6,288(sp)
    2e08:	12112e23          	sw	ra,316(sp)
    2e0c:	12812c23          	sw	s0,312(sp)
    2e10:	12912a23          	sw	s1,308(sp)
    2e14:	00050a13          	mv	s4,a0
    2e18:	00058913          	mv	s2,a1
    2e1c:	00060993          	mv	s3,a2
    2e20:	10010ea3          	sb	zero,285(sp)
    2e24:	04450a93          	addi	s5,a0,68
    2e28:	00f00b13          	li	s6,15
    2e2c:	00092603          	lw	a2,0(s2)
    2e30:	00492583          	lw	a1,4(s2)
    2e34:	00000693          	li	a3,0
    2e38:	000a0513          	mv	a0,s4
    2e3c:	00000097          	auipc	ra,0x0
    2e40:	864080e7          	jalr	-1948(ra) # 26a0 <fatfs_sector_reader>
    2e44:	10050c63          	beqz	a0,2f5c <fatfs_list_directory_next+0x16c>
    2e48:	00894483          	lbu	s1,8(s2)
    2e4c:	00549413          	slli	s0,s1,0x5
    2e50:	008a8433          	add	s0,s5,s0
    2e54:	009b7c63          	bgeu	s6,s1,2e6c <fatfs_list_directory_next+0x7c>
    2e58:	00092783          	lw	a5,0(s2)
    2e5c:	00090423          	sb	zero,8(s2)
    2e60:	00178793          	addi	a5,a5,1
    2e64:	00f92023          	sw	a5,0(s2)
    2e68:	fc5ff06f          	j	2e2c <fatfs_list_directory_next+0x3c>
    2e6c:	00040513          	mv	a0,s0
    2e70:	fffff097          	auipc	ra,0xfffff
    2e74:	958080e7          	jalr	-1704(ra) # 17c8 <fatfs_entry_lfn_text>
    2e78:	02050263          	beqz	a0,2e9c <fatfs_list_directory_next+0xac>
    2e7c:	00040593          	mv	a1,s0
    2e80:	01810513          	addi	a0,sp,24
    2e84:	fffff097          	auipc	ra,0xfffff
    2e88:	83c080e7          	jalr	-1988(ra) # 16c0 <fatfs_lfn_cache_entry>
    2e8c:	00148493          	addi	s1,s1,1
    2e90:	0ff4f493          	zext.b	s1,s1
    2e94:	02040413          	addi	s0,s0,32
    2e98:	fbdff06f          	j	2e54 <fatfs_list_directory_next+0x64>
    2e9c:	00040513          	mv	a0,s0
    2ea0:	fffff097          	auipc	ra,0xfffff
    2ea4:	93c080e7          	jalr	-1732(ra) # 17dc <fatfs_entry_lfn_invalid>
    2ea8:	00050663          	beqz	a0,2eb4 <fatfs_list_directory_next+0xc4>
    2eac:	10010ea3          	sb	zero,285(sp)
    2eb0:	fddff06f          	j	2e8c <fatfs_list_directory_next+0x9c>
    2eb4:	00040593          	mv	a1,s0
    2eb8:	01810513          	addi	a0,sp,24
    2ebc:	fffff097          	auipc	ra,0xfffff
    2ec0:	954080e7          	jalr	-1708(ra) # 1810 <fatfs_entry_lfn_exists>
    2ec4:	0c050063          	beqz	a0,2f84 <fatfs_list_directory_next+0x194>
    2ec8:	01810513          	addi	a0,sp,24
    2ecc:	fffff097          	auipc	ra,0xfffff
    2ed0:	8c0080e7          	jalr	-1856(ra) # 178c <fatfs_lfn_cache_get>
    2ed4:	00050593          	mv	a1,a0
    2ed8:	10300613          	li	a2,259
    2edc:	00098513          	mv	a0,s3
    2ee0:	ffffe097          	auipc	ra,0xffffe
    2ee4:	c04080e7          	jalr	-1020(ra) # ae4 <strncpy>
    2ee8:	00040513          	mv	a0,s0
    2eec:	fffff097          	auipc	ra,0xfffff
    2ef0:	9b4080e7          	jalr	-1612(ra) # 18a0 <fatfs_entry_is_dir>
    2ef4:	10a98223          	sb	a0,260(s3)
    2ef8:	01d44783          	lbu	a5,29(s0)
    2efc:	01c44703          	lbu	a4,28(s0)
    2f00:	00148493          	addi	s1,s1,1
    2f04:	00879793          	slli	a5,a5,0x8
    2f08:	00e7e7b3          	or	a5,a5,a4
    2f0c:	01e44703          	lbu	a4,30(s0)
    2f10:	00100513          	li	a0,1
    2f14:	01071713          	slli	a4,a4,0x10
    2f18:	00f76733          	or	a4,a4,a5
    2f1c:	01f44783          	lbu	a5,31(s0)
    2f20:	01879793          	slli	a5,a5,0x18
    2f24:	00e7e7b3          	or	a5,a5,a4
    2f28:	10f9a623          	sw	a5,268(s3)
    2f2c:	01544783          	lbu	a5,21(s0)
    2f30:	01444703          	lbu	a4,20(s0)
    2f34:	01a44683          	lbu	a3,26(s0)
    2f38:	00879793          	slli	a5,a5,0x8
    2f3c:	00e7e7b3          	or	a5,a5,a4
    2f40:	01b44703          	lbu	a4,27(s0)
    2f44:	01079793          	slli	a5,a5,0x10
    2f48:	00871713          	slli	a4,a4,0x8
    2f4c:	00d76733          	or	a4,a4,a3
    2f50:	00e7e7b3          	or	a5,a5,a4
    2f54:	10f9a423          	sw	a5,264(s3)
    2f58:	00990423          	sb	s1,8(s2)
    2f5c:	13c12083          	lw	ra,316(sp)
    2f60:	13812403          	lw	s0,312(sp)
    2f64:	13412483          	lw	s1,308(sp)
    2f68:	13012903          	lw	s2,304(sp)
    2f6c:	12c12983          	lw	s3,300(sp)
    2f70:	12812a03          	lw	s4,296(sp)
    2f74:	12412a83          	lw	s5,292(sp)
    2f78:	12012b03          	lw	s6,288(sp)
    2f7c:	14010113          	addi	sp,sp,320
    2f80:	00008067          	ret
    2f84:	00040513          	mv	a0,s0
    2f88:	fffff097          	auipc	ra,0xfffff
    2f8c:	8d8080e7          	jalr	-1832(ra) # 1860 <fatfs_entry_sfn_only>
    2f90:	ee050ee3          	beqz	a0,2e8c <fatfs_list_directory_next+0x9c>
    2f94:	00810a13          	addi	s4,sp,8
    2f98:	00d00613          	li	a2,13
    2f9c:	00000593          	li	a1,0
    2fa0:	000a0513          	mv	a0,s4
    2fa4:	10010ea3          	sb	zero,285(sp)
    2fa8:	ffffe097          	auipc	ra,0xffffe
    2fac:	a9c080e7          	jalr	-1380(ra) # a44 <memset>
    2fb0:	00000793          	li	a5,0
    2fb4:	00800713          	li	a4,8
    2fb8:	00f40633          	add	a2,s0,a5
    2fbc:	00064603          	lbu	a2,0(a2)
    2fc0:	00fa06b3          	add	a3,s4,a5
    2fc4:	00178793          	addi	a5,a5,1
    2fc8:	00c68023          	sb	a2,0(a3)
    2fcc:	fee796e3          	bne	a5,a4,2fb8 <fatfs_list_directory_next+0x1c8>
    2fd0:	00844783          	lbu	a5,8(s0)
    2fd4:	00944703          	lbu	a4,9(s0)
    2fd8:	00a44683          	lbu	a3,10(s0)
    2fdc:	00f108a3          	sb	a5,17(sp)
    2fe0:	00e10923          	sb	a4,18(sp)
    2fe4:	fe078793          	addi	a5,a5,-32
    2fe8:	fe070713          	addi	a4,a4,-32
    2fec:	00f037b3          	snez	a5,a5
    2ff0:	00e03733          	snez	a4,a4
    2ff4:	00d109a3          	sb	a3,19(sp)
    2ff8:	00e7e7b3          	or	a5,a5,a4
    2ffc:	00079863          	bnez	a5,300c <fatfs_list_directory_next+0x21c>
    3000:	fe068693          	addi	a3,a3,-32
    3004:	02000793          	li	a5,32
    3008:	00068a63          	beqz	a3,301c <fatfs_list_directory_next+0x22c>
    300c:	00814703          	lbu	a4,8(sp)
    3010:	02e00793          	li	a5,46
    3014:	00f71463          	bne	a4,a5,301c <fatfs_list_directory_next+0x22c>
    3018:	02000793          	li	a5,32
    301c:	000a0593          	mv	a1,s4
    3020:	00098513          	mv	a0,s3
    3024:	00f10823          	sb	a5,16(sp)
    3028:	fffff097          	auipc	ra,0xfffff
    302c:	1bc080e7          	jalr	444(ra) # 21e4 <fatfs_get_sfn_display_name>
    3030:	eb9ff06f          	j	2ee8 <fatfs_list_directory_next+0xf8>

00003034 <fl_readdir>:
    3034:	000047b7          	lui	a5,0x4
    3038:	0cc7a783          	lw	a5,204(a5) # 40cc <_filelib_init>
    303c:	fd010113          	addi	sp,sp,-48
    3040:	03212023          	sw	s2,32(sp)
    3044:	01312e23          	sw	s3,28(sp)
    3048:	02112623          	sw	ra,44(sp)
    304c:	02812423          	sw	s0,40(sp)
    3050:	02912223          	sw	s1,36(sp)
    3054:	00050913          	mv	s2,a0
    3058:	00058993          	mv	s3,a1
    305c:	00079663          	bnez	a5,3068 <fl_readdir+0x34>
    3060:	ffffe097          	auipc	ra,0xffffe
    3064:	5f0080e7          	jalr	1520(ra) # 1650 <fl_init>
    3068:	000094b7          	lui	s1,0x9
    306c:	95048413          	addi	s0,s1,-1712 # 8950 <_fs>
    3070:	03c42783          	lw	a5,60(s0)
    3074:	00078463          	beqz	a5,307c <fl_readdir+0x48>
    3078:	000780e7          	jalr	a5
    307c:	00098613          	mv	a2,s3
    3080:	00090593          	mv	a1,s2
    3084:	95048513          	addi	a0,s1,-1712
    3088:	00000097          	auipc	ra,0x0
    308c:	d68080e7          	jalr	-664(ra) # 2df0 <fatfs_list_directory_next>
    3090:	04042783          	lw	a5,64(s0)
    3094:	00078863          	beqz	a5,30a4 <fl_readdir+0x70>
    3098:	00a12623          	sw	a0,12(sp)
    309c:	000780e7          	jalr	a5
    30a0:	00c12503          	lw	a0,12(sp)
    30a4:	02c12083          	lw	ra,44(sp)
    30a8:	02812403          	lw	s0,40(sp)
    30ac:	00154513          	xori	a0,a0,1
    30b0:	02412483          	lw	s1,36(sp)
    30b4:	02012903          	lw	s2,32(sp)
    30b8:	01c12983          	lw	s3,28(sp)
    30bc:	40a00533          	neg	a0,a0
    30c0:	03010113          	addi	sp,sp,48
    30c4:	00008067          	ret

000030c8 <fatfs_set_fs_info_next_free_cluster>:
    30c8:	03052783          	lw	a5,48(a0)
    30cc:	0a078463          	beqz	a5,3174 <fatfs_set_fs_info_next_free_cluster+0xac>
    30d0:	fe010113          	addi	sp,sp,-32
    30d4:	01c52783          	lw	a5,28(a0)
    30d8:	00912a23          	sw	s1,20(sp)
    30dc:	00058493          	mv	s1,a1
    30e0:	01855583          	lhu	a1,24(a0)
    30e4:	00812c23          	sw	s0,24(sp)
    30e8:	00112e23          	sw	ra,28(sp)
    30ec:	00f585b3          	add	a1,a1,a5
    30f0:	00050413          	mv	s0,a0
    30f4:	ffffe097          	auipc	ra,0xffffe
    30f8:	2b0080e7          	jalr	688(ra) # 13a4 <fatfs_fat_read_sector>
    30fc:	00050593          	mv	a1,a0
    3100:	06050063          	beqz	a0,3160 <fatfs_set_fs_info_next_free_cluster+0x98>
    3104:	20852783          	lw	a5,520(a0)
    3108:	0084d713          	srli	a4,s1,0x8
    310c:	00100613          	li	a2,1
    3110:	1e978623          	sb	s1,492(a5)
    3114:	20852783          	lw	a5,520(a0)
    3118:	1ee786a3          	sb	a4,493(a5)
    311c:	20852783          	lw	a5,520(a0)
    3120:	0104d713          	srli	a4,s1,0x10
    3124:	1ee78723          	sb	a4,494(a5)
    3128:	20852783          	lw	a5,520(a0)
    312c:	0184d713          	srli	a4,s1,0x18
    3130:	1ee787a3          	sb	a4,495(a5)
    3134:	03842783          	lw	a5,56(s0)
    3138:	20c52223          	sw	a2,516(a0)
    313c:	02942223          	sw	s1,36(s0)
    3140:	00078a63          	beqz	a5,3154 <fatfs_set_fs_info_next_free_cluster+0x8c>
    3144:	20052503          	lw	a0,512(a0)
    3148:	00b12623          	sw	a1,12(sp)
    314c:	000780e7          	jalr	a5
    3150:	00c12583          	lw	a1,12(sp)
    3154:	fff00793          	li	a5,-1
    3158:	20f5a023          	sw	a5,512(a1)
    315c:	2005a223          	sw	zero,516(a1)
    3160:	01c12083          	lw	ra,28(sp)
    3164:	01812403          	lw	s0,24(sp)
    3168:	01412483          	lw	s1,20(sp)
    316c:	02010113          	addi	sp,sp,32
    3170:	00008067          	ret
    3174:	00008067          	ret

00003178 <fatfs_find_blank_cluster>:
    3178:	fd010113          	addi	sp,sp,-48
    317c:	01312e23          	sw	s3,28(sp)
    3180:	100009b7          	lui	s3,0x10000
    3184:	02912223          	sw	s1,36(sp)
    3188:	03212023          	sw	s2,32(sp)
    318c:	02112623          	sw	ra,44(sp)
    3190:	02812423          	sw	s0,40(sp)
    3194:	00050913          	mv	s2,a0
    3198:	00058493          	mv	s1,a1
    319c:	fff98993          	addi	s3,s3,-1 # fffffff <__stacktop+0xffeffff>
    31a0:	03092783          	lw	a5,48(s2)
    31a4:	0074d413          	srli	s0,s1,0x7
    31a8:	00079463          	bnez	a5,31b0 <fatfs_find_blank_cluster+0x38>
    31ac:	0084d413          	srli	s0,s1,0x8
    31b0:	02092783          	lw	a5,32(s2)
    31b4:	0cf47863          	bgeu	s0,a5,3284 <fatfs_find_blank_cluster+0x10c>
    31b8:	01492583          	lw	a1,20(s2)
    31bc:	00090513          	mv	a0,s2
    31c0:	00c12623          	sw	a2,12(sp)
    31c4:	00b405b3          	add	a1,s0,a1
    31c8:	ffffe097          	auipc	ra,0xffffe
    31cc:	1dc080e7          	jalr	476(ra) # 13a4 <fatfs_fat_read_sector>
    31d0:	0a050a63          	beqz	a0,3284 <fatfs_find_blank_cluster+0x10c>
    31d4:	03092783          	lw	a5,48(s2)
    31d8:	20852703          	lw	a4,520(a0)
    31dc:	00c12603          	lw	a2,12(sp)
    31e0:	04079a63          	bnez	a5,3234 <fatfs_find_blank_cluster+0xbc>
    31e4:	00841413          	slli	s0,s0,0x8
    31e8:	40848433          	sub	s0,s1,s0
    31ec:	00141413          	slli	s0,s0,0x1
    31f0:	01041413          	slli	s0,s0,0x10
    31f4:	01045413          	srli	s0,s0,0x10
    31f8:	00870733          	add	a4,a4,s0
    31fc:	00174783          	lbu	a5,1(a4)
    3200:	00074703          	lbu	a4,0(a4)
    3204:	00879793          	slli	a5,a5,0x8
    3208:	00e787b3          	add	a5,a5,a4
    320c:	06079863          	bnez	a5,327c <fatfs_find_blank_cluster+0x104>
    3210:	00962023          	sw	s1,0(a2)
    3214:	00100513          	li	a0,1
    3218:	02c12083          	lw	ra,44(sp)
    321c:	02812403          	lw	s0,40(sp)
    3220:	02412483          	lw	s1,36(sp)
    3224:	02012903          	lw	s2,32(sp)
    3228:	01c12983          	lw	s3,28(sp)
    322c:	03010113          	addi	sp,sp,48
    3230:	00008067          	ret
    3234:	00741413          	slli	s0,s0,0x7
    3238:	40848433          	sub	s0,s1,s0
    323c:	00241413          	slli	s0,s0,0x2
    3240:	01041413          	slli	s0,s0,0x10
    3244:	01045413          	srli	s0,s0,0x10
    3248:	00870733          	add	a4,a4,s0
    324c:	00374783          	lbu	a5,3(a4)
    3250:	00274683          	lbu	a3,2(a4)
    3254:	01879793          	slli	a5,a5,0x18
    3258:	01069693          	slli	a3,a3,0x10
    325c:	00d787b3          	add	a5,a5,a3
    3260:	00074683          	lbu	a3,0(a4)
    3264:	00174703          	lbu	a4,1(a4)
    3268:	00d787b3          	add	a5,a5,a3
    326c:	00871713          	slli	a4,a4,0x8
    3270:	00e787b3          	add	a5,a5,a4
    3274:	0137f7b3          	and	a5,a5,s3
    3278:	f95ff06f          	j	320c <fatfs_find_blank_cluster+0x94>
    327c:	00148493          	addi	s1,s1,1
    3280:	f21ff06f          	j	31a0 <fatfs_find_blank_cluster+0x28>
    3284:	00000513          	li	a0,0
    3288:	f91ff06f          	j	3218 <fatfs_find_blank_cluster+0xa0>

0000328c <fatfs_fat_set_cluster>:
    328c:	03052783          	lw	a5,48(a0)
    3290:	fe010113          	addi	sp,sp,-32
    3294:	00812c23          	sw	s0,24(sp)
    3298:	00912a23          	sw	s1,20(sp)
    329c:	01212823          	sw	s2,16(sp)
    32a0:	00112e23          	sw	ra,28(sp)
    32a4:	00050913          	mv	s2,a0
    32a8:	00058413          	mv	s0,a1
    32ac:	0085d493          	srli	s1,a1,0x8
    32b0:	00078463          	beqz	a5,32b8 <fatfs_fat_set_cluster+0x2c>
    32b4:	0075d493          	srli	s1,a1,0x7
    32b8:	01492583          	lw	a1,20(s2)
    32bc:	00090513          	mv	a0,s2
    32c0:	00c12623          	sw	a2,12(sp)
    32c4:	00b485b3          	add	a1,s1,a1
    32c8:	ffffe097          	auipc	ra,0xffffe
    32cc:	0dc080e7          	jalr	220(ra) # 13a4 <fatfs_fat_read_sector>
    32d0:	00050793          	mv	a5,a0
    32d4:	00000513          	li	a0,0
    32d8:	04078663          	beqz	a5,3324 <fatfs_fat_set_cluster+0x98>
    32dc:	03092683          	lw	a3,48(s2)
    32e0:	2087a703          	lw	a4,520(a5)
    32e4:	00c12603          	lw	a2,12(sp)
    32e8:	04069a63          	bnez	a3,333c <fatfs_fat_set_cluster+0xb0>
    32ec:	00849493          	slli	s1,s1,0x8
    32f0:	40940433          	sub	s0,s0,s1
    32f4:	00141413          	slli	s0,s0,0x1
    32f8:	01041413          	slli	s0,s0,0x10
    32fc:	01045413          	srli	s0,s0,0x10
    3300:	00870733          	add	a4,a4,s0
    3304:	00c70023          	sb	a2,0(a4)
    3308:	2087a703          	lw	a4,520(a5)
    330c:	00865613          	srli	a2,a2,0x8
    3310:	00870733          	add	a4,a4,s0
    3314:	00c700a3          	sb	a2,1(a4)
    3318:	00100713          	li	a4,1
    331c:	20e7a223          	sw	a4,516(a5)
    3320:	00100513          	li	a0,1
    3324:	01c12083          	lw	ra,28(sp)
    3328:	01812403          	lw	s0,24(sp)
    332c:	01412483          	lw	s1,20(sp)
    3330:	01012903          	lw	s2,16(sp)
    3334:	02010113          	addi	sp,sp,32
    3338:	00008067          	ret
    333c:	00749493          	slli	s1,s1,0x7
    3340:	40940433          	sub	s0,s0,s1
    3344:	00241413          	slli	s0,s0,0x2
    3348:	01041413          	slli	s0,s0,0x10
    334c:	01045413          	srli	s0,s0,0x10
    3350:	00870733          	add	a4,a4,s0
    3354:	00c70023          	sb	a2,0(a4)
    3358:	2087a703          	lw	a4,520(a5)
    335c:	00865693          	srli	a3,a2,0x8
    3360:	00870733          	add	a4,a4,s0
    3364:	00d700a3          	sb	a3,1(a4)
    3368:	2087a703          	lw	a4,520(a5)
    336c:	01065693          	srli	a3,a2,0x10
    3370:	01865613          	srli	a2,a2,0x18
    3374:	00870733          	add	a4,a4,s0
    3378:	00d70123          	sb	a3,2(a4)
    337c:	2087a703          	lw	a4,520(a5)
    3380:	00870733          	add	a4,a4,s0
    3384:	00c701a3          	sb	a2,3(a4)
    3388:	f91ff06f          	j	3318 <fatfs_fat_set_cluster+0x8c>

0000338c <fatfs_free_cluster_chain>:
    338c:	fe010113          	addi	sp,sp,-32
    3390:	00812c23          	sw	s0,24(sp)
    3394:	00912a23          	sw	s1,20(sp)
    3398:	00112e23          	sw	ra,28(sp)
    339c:	01212823          	sw	s2,16(sp)
    33a0:	00050493          	mv	s1,a0
    33a4:	ffd00413          	li	s0,-3
    33a8:	fff58793          	addi	a5,a1,-1
    33ac:	02f47063          	bgeu	s0,a5,33cc <fatfs_free_cluster_chain+0x40>
    33b0:	01c12083          	lw	ra,28(sp)
    33b4:	01812403          	lw	s0,24(sp)
    33b8:	01412483          	lw	s1,20(sp)
    33bc:	01012903          	lw	s2,16(sp)
    33c0:	00100513          	li	a0,1
    33c4:	02010113          	addi	sp,sp,32
    33c8:	00008067          	ret
    33cc:	00048513          	mv	a0,s1
    33d0:	00b12623          	sw	a1,12(sp)
    33d4:	fffff097          	auipc	ra,0xfffff
    33d8:	1c4080e7          	jalr	452(ra) # 2598 <fatfs_find_next_cluster>
    33dc:	00c12583          	lw	a1,12(sp)
    33e0:	00050913          	mv	s2,a0
    33e4:	00000613          	li	a2,0
    33e8:	00048513          	mv	a0,s1
    33ec:	00000097          	auipc	ra,0x0
    33f0:	ea0080e7          	jalr	-352(ra) # 328c <fatfs_fat_set_cluster>
    33f4:	00090593          	mv	a1,s2
    33f8:	fb1ff06f          	j	33a8 <fatfs_free_cluster_chain+0x1c>

000033fc <fatfs_fat_add_cluster_to_chain>:
    33fc:	fd010113          	addi	sp,sp,-48
    3400:	02912223          	sw	s1,36(sp)
    3404:	02112623          	sw	ra,44(sp)
    3408:	02812423          	sw	s0,40(sp)
    340c:	03212023          	sw	s2,32(sp)
    3410:	01312e23          	sw	s3,28(sp)
    3414:	fff00493          	li	s1,-1
    3418:	02959263          	bne	a1,s1,343c <fatfs_fat_add_cluster_to_chain+0x40>
    341c:	00000513          	li	a0,0
    3420:	02c12083          	lw	ra,44(sp)
    3424:	02812403          	lw	s0,40(sp)
    3428:	02412483          	lw	s1,36(sp)
    342c:	02012903          	lw	s2,32(sp)
    3430:	01c12983          	lw	s3,28(sp)
    3434:	03010113          	addi	sp,sp,48
    3438:	00008067          	ret
    343c:	00050913          	mv	s2,a0
    3440:	00058413          	mv	s0,a1
    3444:	00060993          	mv	s3,a2
    3448:	00040593          	mv	a1,s0
    344c:	00090513          	mv	a0,s2
    3450:	00812623          	sw	s0,12(sp)
    3454:	fffff097          	auipc	ra,0xfffff
    3458:	144080e7          	jalr	324(ra) # 2598 <fatfs_find_next_cluster>
    345c:	00050413          	mv	s0,a0
    3460:	fa050ee3          	beqz	a0,341c <fatfs_fat_add_cluster_to_chain+0x20>
    3464:	00c12583          	lw	a1,12(sp)
    3468:	fe9510e3          	bne	a0,s1,3448 <fatfs_fat_add_cluster_to_chain+0x4c>
    346c:	00098613          	mv	a2,s3
    3470:	00090513          	mv	a0,s2
    3474:	00000097          	auipc	ra,0x0
    3478:	e18080e7          	jalr	-488(ra) # 328c <fatfs_fat_set_cluster>
    347c:	00040613          	mv	a2,s0
    3480:	00098593          	mv	a1,s3
    3484:	00090513          	mv	a0,s2
    3488:	00000097          	auipc	ra,0x0
    348c:	e04080e7          	jalr	-508(ra) # 328c <fatfs_fat_set_cluster>
    3490:	00100513          	li	a0,1
    3494:	f8dff06f          	j	3420 <fatfs_fat_add_cluster_to_chain+0x24>

00003498 <fatfs_add_free_space>:
    3498:	02452783          	lw	a5,36(a0)
    349c:	fd010113          	addi	sp,sp,-48
    34a0:	02812423          	sw	s0,40(sp)
    34a4:	01312e23          	sw	s3,28(sp)
    34a8:	01412c23          	sw	s4,24(sp)
    34ac:	0005a983          	lw	s3,0(a1)
    34b0:	01512a23          	sw	s5,20(sp)
    34b4:	00058a13          	mv	s4,a1
    34b8:	02112623          	sw	ra,44(sp)
    34bc:	02912223          	sw	s1,36(sp)
    34c0:	03212023          	sw	s2,32(sp)
    34c4:	fff00593          	li	a1,-1
    34c8:	00050413          	mv	s0,a0
    34cc:	00060a93          	mv	s5,a2
    34d0:	00b78663          	beq	a5,a1,34dc <fatfs_add_free_space+0x44>
    34d4:	00000097          	auipc	ra,0x0
    34d8:	bf4080e7          	jalr	-1036(ra) # 30c8 <fatfs_set_fs_info_next_free_cluster>
    34dc:	00000493          	li	s1,0
    34e0:	03549663          	bne	s1,s5,350c <fatfs_add_free_space+0x74>
    34e4:	00100513          	li	a0,1
    34e8:	02c12083          	lw	ra,44(sp)
    34ec:	02812403          	lw	s0,40(sp)
    34f0:	02412483          	lw	s1,36(sp)
    34f4:	02012903          	lw	s2,32(sp)
    34f8:	01c12983          	lw	s3,28(sp)
    34fc:	01812a03          	lw	s4,24(sp)
    3500:	01412a83          	lw	s5,20(sp)
    3504:	03010113          	addi	sp,sp,48
    3508:	00008067          	ret
    350c:	00842583          	lw	a1,8(s0)
    3510:	00c10613          	addi	a2,sp,12
    3514:	00040513          	mv	a0,s0
    3518:	00000097          	auipc	ra,0x0
    351c:	c60080e7          	jalr	-928(ra) # 3178 <fatfs_find_blank_cluster>
    3520:	fc0504e3          	beqz	a0,34e8 <fatfs_add_free_space+0x50>
    3524:	00c12903          	lw	s2,12(sp)
    3528:	00098593          	mv	a1,s3
    352c:	00040513          	mv	a0,s0
    3530:	00090613          	mv	a2,s2
    3534:	00000097          	auipc	ra,0x0
    3538:	d58080e7          	jalr	-680(ra) # 328c <fatfs_fat_set_cluster>
    353c:	fff00613          	li	a2,-1
    3540:	00090593          	mv	a1,s2
    3544:	00040513          	mv	a0,s0
    3548:	00000097          	auipc	ra,0x0
    354c:	d44080e7          	jalr	-700(ra) # 328c <fatfs_fat_set_cluster>
    3550:	00049463          	bnez	s1,3558 <fatfs_add_free_space+0xc0>
    3554:	012a2023          	sw	s2,0(s4)
    3558:	00148493          	addi	s1,s1,1
    355c:	00090993          	mv	s3,s2
    3560:	f81ff06f          	j	34e0 <fatfs_add_free_space+0x48>

00003564 <fatfs_allocate_free_space>:
    3564:	fd010113          	addi	sp,sp,-48
    3568:	02112623          	sw	ra,44(sp)
    356c:	02812423          	sw	s0,40(sp)
    3570:	02912223          	sw	s1,36(sp)
    3574:	03212023          	sw	s2,32(sp)
    3578:	01312e23          	sw	s3,28(sp)
    357c:	01412c23          	sw	s4,24(sp)
    3580:	01512a23          	sw	s5,20(sp)
    3584:	02069863          	bnez	a3,35b4 <fatfs_allocate_free_space+0x50>
    3588:	00000413          	li	s0,0
    358c:	02c12083          	lw	ra,44(sp)
    3590:	00040513          	mv	a0,s0
    3594:	02812403          	lw	s0,40(sp)
    3598:	02412483          	lw	s1,36(sp)
    359c:	02012903          	lw	s2,32(sp)
    35a0:	01c12983          	lw	s3,28(sp)
    35a4:	01812a03          	lw	s4,24(sp)
    35a8:	01412a83          	lw	s5,20(sp)
    35ac:	03010113          	addi	sp,sp,48
    35b0:	00008067          	ret
    35b4:	02452783          	lw	a5,36(a0)
    35b8:	00058a13          	mv	s4,a1
    35bc:	fff00593          	li	a1,-1
    35c0:	00050493          	mv	s1,a0
    35c4:	00068913          	mv	s2,a3
    35c8:	00060993          	mv	s3,a2
    35cc:	00b78663          	beq	a5,a1,35d8 <fatfs_allocate_free_space+0x74>
    35d0:	00000097          	auipc	ra,0x0
    35d4:	af8080e7          	jalr	-1288(ra) # 30c8 <fatfs_set_fs_info_next_free_cluster>
    35d8:	0004c783          	lbu	a5,0(s1)
    35dc:	00090513          	mv	a0,s2
    35e0:	00979a93          	slli	s5,a5,0x9
    35e4:	000a8593          	mv	a1,s5
    35e8:	ffffd097          	auipc	ra,0xffffd
    35ec:	3b0080e7          	jalr	944(ra) # 998 <__udivsi3>
    35f0:	00050413          	mv	s0,a0
    35f4:	00050593          	mv	a1,a0
    35f8:	000a8513          	mv	a0,s5
    35fc:	ffffe097          	auipc	ra,0xffffe
    3600:	bf0080e7          	jalr	-1040(ra) # 11ec <__mulsi3>
    3604:	41250533          	sub	a0,a0,s2
    3608:	00a03533          	snez	a0,a0
    360c:	00a40933          	add	s2,s0,a0
    3610:	040a0463          	beqz	s4,3658 <fatfs_allocate_free_space+0xf4>
    3614:	0084a583          	lw	a1,8(s1)
    3618:	00c10613          	addi	a2,sp,12
    361c:	00048513          	mv	a0,s1
    3620:	00000097          	auipc	ra,0x0
    3624:	b58080e7          	jalr	-1192(ra) # 3178 <fatfs_find_blank_cluster>
    3628:	00050413          	mv	s0,a0
    362c:	f4050ee3          	beqz	a0,3588 <fatfs_allocate_free_space+0x24>
    3630:	00100793          	li	a5,1
    3634:	02f91663          	bne	s2,a5,3660 <fatfs_allocate_free_space+0xfc>
    3638:	00c12903          	lw	s2,12(sp)
    363c:	fff00613          	li	a2,-1
    3640:	00048513          	mv	a0,s1
    3644:	00090593          	mv	a1,s2
    3648:	00000097          	auipc	ra,0x0
    364c:	c44080e7          	jalr	-956(ra) # 328c <fatfs_fat_set_cluster>
    3650:	0129a023          	sw	s2,0(s3)
    3654:	f39ff06f          	j	358c <fatfs_allocate_free_space+0x28>
    3658:	0009a783          	lw	a5,0(s3)
    365c:	00f12623          	sw	a5,12(sp)
    3660:	00090613          	mv	a2,s2
    3664:	00c10593          	addi	a1,sp,12
    3668:	00048513          	mv	a0,s1
    366c:	00000097          	auipc	ra,0x0
    3670:	e2c080e7          	jalr	-468(ra) # 3498 <fatfs_add_free_space>
    3674:	00050413          	mv	s0,a0
    3678:	f15ff06f          	j	358c <fatfs_allocate_free_space+0x28>

0000367c <fatfs_add_file_entry>:
    367c:	03852883          	lw	a7,56(a0)
    3680:	30088e63          	beqz	a7,399c <fatfs_add_file_entry+0x320>
    3684:	f8010113          	addi	sp,sp,-128
    3688:	06812c23          	sw	s0,120(sp)
    368c:	00050413          	mv	s0,a0
    3690:	00060513          	mv	a0,a2
    3694:	06912a23          	sw	s1,116(sp)
    3698:	07512223          	sw	s5,100(sp)
    369c:	00f12c23          	sw	a5,24(sp)
    36a0:	00e12a23          	sw	a4,20(sp)
    36a4:	06112e23          	sw	ra,124(sp)
    36a8:	07212823          	sw	s2,112(sp)
    36ac:	07312623          	sw	s3,108(sp)
    36b0:	07412423          	sw	s4,104(sp)
    36b4:	07612023          	sw	s6,96(sp)
    36b8:	05712e23          	sw	s7,92(sp)
    36bc:	05812c23          	sw	s8,88(sp)
    36c0:	05912a23          	sw	s9,84(sp)
    36c4:	05a12823          	sw	s10,80(sp)
    36c8:	05b12623          	sw	s11,76(sp)
    36cc:	01012e23          	sw	a6,28(sp)
    36d0:	00068a93          	mv	s5,a3
    36d4:	00c12823          	sw	a2,16(sp)
    36d8:	00b12423          	sw	a1,8(sp)
    36dc:	ffffe097          	auipc	ra,0xffffe
    36e0:	1d4080e7          	jalr	468(ra) # 18b0 <fatfs_lfn_entries_required>
    36e4:	00150713          	addi	a4,a0,1
    36e8:	00100793          	li	a5,1
    36ec:	00050493          	mv	s1,a0
    36f0:	2ae7f263          	bgeu	a5,a4,3994 <fatfs_add_file_entry+0x318>
    36f4:	00000a13          	li	s4,0
    36f8:	00000993          	li	s3,0
    36fc:	00000913          	li	s2,0
    3700:	00000c93          	li	s9,0
    3704:	00000b13          	li	s6,0
    3708:	01000c13          	li	s8,16
    370c:	00812583          	lw	a1,8(sp)
    3710:	00000693          	li	a3,0
    3714:	000b0613          	mv	a2,s6
    3718:	00040513          	mv	a0,s0
    371c:	000b0b93          	mv	s7,s6
    3720:	fffff097          	auipc	ra,0xfffff
    3724:	f80080e7          	jalr	-128(ra) # 26a0 <fatfs_sector_reader>
    3728:	18050463          	beqz	a0,38b0 <fatfs_add_file_entry+0x234>
    372c:	001b0b13          	addi	s6,s6,1
    3730:	04440793          	addi	a5,s0,68
    3734:	000c8d13          	mv	s10,s9
    3738:	00000d93          	li	s11,0
    373c:	00078513          	mv	a0,a5
    3740:	00f12623          	sw	a5,12(sp)
    3744:	ffffe097          	auipc	ra,0xffffe
    3748:	084080e7          	jalr	132(ra) # 17c8 <fatfs_entry_lfn_text>
    374c:	00c12783          	lw	a5,12(sp)
    3750:	00050c93          	mv	s9,a0
    3754:	02050c63          	beqz	a0,378c <fatfs_add_file_entry+0x110>
    3758:	020d0463          	beqz	s10,3780 <fatfs_add_file_entry+0x104>
    375c:	00090c93          	mv	s9,s2
    3760:	000c8913          	mv	s2,s9
    3764:	001d0c93          	addi	s9,s10,1
    3768:	001d8d93          	addi	s11,s11,1
    376c:	0ffdfd93          	zext.b	s11,s11
    3770:	02078793          	addi	a5,a5,32
    3774:	f98d8ce3          	beq	s11,s8,370c <fatfs_add_file_entry+0x90>
    3778:	000c8d13          	mv	s10,s9
    377c:	fc1ff06f          	j	373c <fatfs_add_file_entry+0xc0>
    3780:	000d8a13          	mv	s4,s11
    3784:	000b8993          	mv	s3,s7
    3788:	fd9ff06f          	j	3760 <fatfs_add_file_entry+0xe4>
    378c:	0007c683          	lbu	a3,0(a5)
    3790:	0e500713          	li	a4,229
    3794:	10e69863          	bne	a3,a4,38a4 <fatfs_add_file_entry+0x228>
    3798:	000d1863          	bnez	s10,37a8 <fatfs_add_file_entry+0x12c>
    379c:	000d8a13          	mv	s4,s11
    37a0:	000b8993          	mv	s3,s7
    37a4:	00100913          	li	s2,1
    37a8:	fa9d4ee3          	blt	s10,s1,3764 <fatfs_add_file_entry+0xe8>
    37ac:	00ba8693          	addi	a3,s5,11
    37b0:	000a8713          	mv	a4,s5
    37b4:	00000913          	li	s2,0
    37b8:	00074603          	lbu	a2,0(a4)
    37bc:	00195793          	srli	a5,s2,0x1
    37c0:	00791913          	slli	s2,s2,0x7
    37c4:	012787b3          	add	a5,a5,s2
    37c8:	00170713          	addi	a4,a4,1
    37cc:	00c787b3          	add	a5,a5,a2
    37d0:	0ff7f913          	zext.b	s2,a5
    37d4:	fed712e3          	bne	a4,a3,37b8 <fatfs_add_file_entry+0x13c>
    37d8:	00098b13          	mv	s6,s3
    37dc:	00000d13          	li	s10,0
    37e0:	01000b93          	li	s7,16
    37e4:	00812583          	lw	a1,8(sp)
    37e8:	00000693          	li	a3,0
    37ec:	000b0613          	mv	a2,s6
    37f0:	00040513          	mv	a0,s0
    37f4:	fffff097          	auipc	ra,0xfffff
    37f8:	eac080e7          	jalr	-340(ra) # 26a0 <fatfs_sector_reader>
    37fc:	18050c63          	beqz	a0,3994 <fatfs_add_file_entry+0x318>
    3800:	04440c93          	addi	s9,s0,68
    3804:	413b0db3          	sub	s11,s6,s3
    3808:	00000793          	li	a5,0
    380c:	00000c13          	li	s8,0
    3810:	01912623          	sw	s9,12(sp)
    3814:	000d1663          	bnez	s10,3820 <fatfs_add_file_entry+0x1a4>
    3818:	154c1863          	bne	s8,s4,3968 <fatfs_add_file_entry+0x2ec>
    381c:	140d9663          	bnez	s11,3968 <fatfs_add_file_entry+0x2ec>
    3820:	12049263          	bnez	s1,3944 <fatfs_add_file_entry+0x2c8>
    3824:	01c12703          	lw	a4,28(sp)
    3828:	01412603          	lw	a2,20(sp)
    382c:	01812583          	lw	a1,24(sp)
    3830:	02010693          	addi	a3,sp,32
    3834:	000a8513          	mv	a0,s5
    3838:	ffffe097          	auipc	ra,0xffffe
    383c:	1bc080e7          	jalr	444(ra) # 19f4 <fatfs_sfn_create_entry>
    3840:	02000613          	li	a2,32
    3844:	00c105b3          	add	a1,sp,a2
    3848:	000c8513          	mv	a0,s9
    384c:	ffffd097          	auipc	ra,0xffffd
    3850:	214080e7          	jalr	532(ra) # a60 <memcpy>
    3854:	03842783          	lw	a5,56(s0)
    3858:	00c12583          	lw	a1,12(sp)
    385c:	24442503          	lw	a0,580(s0)
    3860:	00100613          	li	a2,1
    3864:	000780e7          	jalr	a5
    3868:	07c12083          	lw	ra,124(sp)
    386c:	07812403          	lw	s0,120(sp)
    3870:	07412483          	lw	s1,116(sp)
    3874:	07012903          	lw	s2,112(sp)
    3878:	06c12983          	lw	s3,108(sp)
    387c:	06812a03          	lw	s4,104(sp)
    3880:	06412a83          	lw	s5,100(sp)
    3884:	06012b03          	lw	s6,96(sp)
    3888:	05c12b83          	lw	s7,92(sp)
    388c:	05812c03          	lw	s8,88(sp)
    3890:	05412c83          	lw	s9,84(sp)
    3894:	05012d03          	lw	s10,80(sp)
    3898:	04c12d83          	lw	s11,76(sp)
    389c:	08010113          	addi	sp,sp,128
    38a0:	00008067          	ret
    38a4:	ee068ae3          	beqz	a3,3798 <fatfs_add_file_entry+0x11c>
    38a8:	00000913          	li	s2,0
    38ac:	ebdff06f          	j	3768 <fatfs_add_file_entry+0xec>
    38b0:	00842583          	lw	a1,8(s0)
    38b4:	02010613          	addi	a2,sp,32
    38b8:	00040513          	mv	a0,s0
    38bc:	00000097          	auipc	ra,0x0
    38c0:	8bc080e7          	jalr	-1860(ra) # 3178 <fatfs_find_blank_cluster>
    38c4:	0c050863          	beqz	a0,3994 <fatfs_add_file_entry+0x318>
    38c8:	02012b83          	lw	s7,32(sp)
    38cc:	00812583          	lw	a1,8(sp)
    38d0:	00040513          	mv	a0,s0
    38d4:	000b8613          	mv	a2,s7
    38d8:	00000097          	auipc	ra,0x0
    38dc:	b24080e7          	jalr	-1244(ra) # 33fc <fatfs_fat_add_cluster_to_chain>
    38e0:	0a050a63          	beqz	a0,3994 <fatfs_add_file_entry+0x318>
    38e4:	20000613          	li	a2,512
    38e8:	00000593          	li	a1,0
    38ec:	04440513          	addi	a0,s0,68
    38f0:	ffffd097          	auipc	ra,0xffffd
    38f4:	154080e7          	jalr	340(ra) # a44 <memset>
    38f8:	00000c13          	li	s8,0
    38fc:	00044783          	lbu	a5,0(s0)
    3900:	00fc6a63          	bltu	s8,a5,3914 <fatfs_add_file_entry+0x298>
    3904:	ea0914e3          	bnez	s2,37ac <fatfs_add_file_entry+0x130>
    3908:	000b0993          	mv	s3,s6
    390c:	00000a13          	li	s4,0
    3910:	e9dff06f          	j	37ac <fatfs_add_file_entry+0x130>
    3914:	00000693          	li	a3,0
    3918:	000c0613          	mv	a2,s8
    391c:	000b8593          	mv	a1,s7
    3920:	00040513          	mv	a0,s0
    3924:	ffffe097          	auipc	ra,0xffffe
    3928:	c78080e7          	jalr	-904(ra) # 159c <fatfs_write_sector>
    392c:	06050463          	beqz	a0,3994 <fatfs_add_file_entry+0x318>
    3930:	001c0c13          	addi	s8,s8,1
    3934:	0ffc7c13          	zext.b	s8,s8
    3938:	fc5ff06f          	j	38fc <fatfs_add_file_entry+0x280>
    393c:	001b0b13          	addi	s6,s6,1
    3940:	ea5ff06f          	j	37e4 <fatfs_add_file_entry+0x168>
    3944:	01012503          	lw	a0,16(sp)
    3948:	fff48493          	addi	s1,s1,-1
    394c:	00090693          	mv	a3,s2
    3950:	00048613          	mv	a2,s1
    3954:	000c8593          	mv	a1,s9
    3958:	ffffe097          	auipc	ra,0xffffe
    395c:	f88080e7          	jalr	-120(ra) # 18e0 <fatfs_filename_to_lfn>
    3960:	00100d13          	li	s10,1
    3964:	000d0793          	mv	a5,s10
    3968:	001c0c13          	addi	s8,s8,1
    396c:	0ffc7c13          	zext.b	s8,s8
    3970:	020c8c93          	addi	s9,s9,32
    3974:	eb7c10e3          	bne	s8,s7,3814 <fatfs_add_file_entry+0x198>
    3978:	fc0782e3          	beqz	a5,393c <fatfs_add_file_entry+0x2c0>
    397c:	03842783          	lw	a5,56(s0)
    3980:	00c12583          	lw	a1,12(sp)
    3984:	24442503          	lw	a0,580(s0)
    3988:	00100613          	li	a2,1
    398c:	000780e7          	jalr	a5
    3990:	fa0516e3          	bnez	a0,393c <fatfs_add_file_entry+0x2c0>
    3994:	00000513          	li	a0,0
    3998:	ed1ff06f          	j	3868 <fatfs_add_file_entry+0x1ec>
    399c:	00000513          	li	a0,0
    39a0:	00008067          	ret

000039a4 <fl_fopen>:
    39a4:	000047b7          	lui	a5,0x4
    39a8:	0cc7a783          	lw	a5,204(a5) # 40cc <_filelib_init>
    39ac:	fa010113          	addi	sp,sp,-96
    39b0:	05212823          	sw	s2,80(sp)
    39b4:	03a12823          	sw	s10,48(sp)
    39b8:	04112e23          	sw	ra,92(sp)
    39bc:	04812c23          	sw	s0,88(sp)
    39c0:	04912a23          	sw	s1,84(sp)
    39c4:	05312623          	sw	s3,76(sp)
    39c8:	05412423          	sw	s4,72(sp)
    39cc:	05512223          	sw	s5,68(sp)
    39d0:	05612023          	sw	s6,64(sp)
    39d4:	03712e23          	sw	s7,60(sp)
    39d8:	03812c23          	sw	s8,56(sp)
    39dc:	03912a23          	sw	s9,52(sp)
    39e0:	00050d13          	mv	s10,a0
    39e4:	00058913          	mv	s2,a1
    39e8:	00079663          	bnez	a5,39f4 <fl_fopen+0x50>
    39ec:	ffffe097          	auipc	ra,0xffffe
    39f0:	c64080e7          	jalr	-924(ra) # 1650 <fl_init>
    39f4:	000047b7          	lui	a5,0x4
    39f8:	0c87a783          	lw	a5,200(a5) # 40c8 <_filelib_valid>
    39fc:	00193713          	seqz	a4,s2
    3a00:	0017b793          	seqz	a5,a5
    3a04:	00e7e7b3          	or	a5,a5,a4
    3a08:	36079e63          	bnez	a5,3d84 <fl_fopen+0x3e0>
    3a0c:	360d0c63          	beqz	s10,3d84 <fl_fopen+0x3e0>
    3a10:	00000493          	li	s1,0
    3a14:	00000413          	li	s0,0
    3a18:	05700993          	li	s3,87
    3a1c:	07200a13          	li	s4,114
    3a20:	07700b13          	li	s6,119
    3a24:	06100b93          	li	s7,97
    3a28:	06200c13          	li	s8,98
    3a2c:	04100a93          	li	s5,65
    3a30:	04200c93          	li	s9,66
    3a34:	00090513          	mv	a0,s2
    3a38:	ffffd097          	auipc	ra,0xffffd
    3a3c:	04c080e7          	jalr	76(ra) # a84 <strlen>
    3a40:	10a44a63          	blt	s0,a0,3b54 <fl_fopen+0x1b0>
    3a44:	000099b7          	lui	s3,0x9
    3a48:	95098a13          	addi	s4,s3,-1712 # 8950 <_fs>
    3a4c:	038a2783          	lw	a5,56(s4)
    3a50:	00079463          	bnez	a5,3a58 <fl_fopen+0xb4>
    3a54:	fd94f493          	andi	s1,s1,-39
    3a58:	03ca2783          	lw	a5,60(s4)
    3a5c:	00078463          	beqz	a5,3a64 <fl_fopen+0xc0>
    3a60:	000780e7          	jalr	a5
    3a64:	0014f793          	andi	a5,s1,1
    3a68:	18079263          	bnez	a5,3bec <fl_fopen+0x248>
    3a6c:	0204f793          	andi	a5,s1,32
    3a70:	08078c63          	beqz	a5,3b08 <fl_fopen+0x164>
    3a74:	038a2783          	lw	a5,56(s4)
    3a78:	06078a63          	beqz	a5,3aec <fl_fopen+0x148>
    3a7c:	ffffe097          	auipc	ra,0xffffe
    3a80:	a14080e7          	jalr	-1516(ra) # 1490 <_allocate_file>
    3a84:	00050413          	mv	s0,a0
    3a88:	06050263          	beqz	a0,3aec <fl_fopen+0x148>
    3a8c:	01450a93          	addi	s5,a0,20
    3a90:	10400613          	li	a2,260
    3a94:	00000593          	li	a1,0
    3a98:	000a8513          	mv	a0,s5
    3a9c:	ffffd097          	auipc	ra,0xffffd
    3aa0:	fa8080e7          	jalr	-88(ra) # a44 <memset>
    3aa4:	11840b13          	addi	s6,s0,280
    3aa8:	10400613          	li	a2,260
    3aac:	00000593          	li	a1,0
    3ab0:	000b0513          	mv	a0,s6
    3ab4:	ffffd097          	auipc	ra,0xffffd
    3ab8:	f90080e7          	jalr	-112(ra) # a44 <memset>
    3abc:	10400713          	li	a4,260
    3ac0:	000b0693          	mv	a3,s6
    3ac4:	00070613          	mv	a2,a4
    3ac8:	000a8593          	mv	a1,s5
    3acc:	000d0513          	mv	a0,s10
    3ad0:	ffffe097          	auipc	ra,0xffffe
    3ad4:	414080e7          	jalr	1044(ra) # 1ee4 <fatfs_split_path>
    3ad8:	fff00793          	li	a5,-1
    3adc:	12f51663          	bne	a0,a5,3c08 <fl_fopen+0x264>
    3ae0:	00040513          	mv	a0,s0
    3ae4:	ffffe097          	auipc	ra,0xffffe
    3ae8:	a24080e7          	jalr	-1500(ra) # 1508 <_free_file>
    3aec:	00000413          	li	s0,0
    3af0:	0214f793          	andi	a5,s1,33
    3af4:	02000713          	li	a4,32
    3af8:	28e79263          	bne	a5,a4,3d7c <fl_fopen+0x3d8>
    3afc:	10041263          	bnez	s0,3c00 <fl_fopen+0x25c>
    3b00:	0064f793          	andi	a5,s1,6
    3b04:	26079463          	bnez	a5,3d6c <fl_fopen+0x3c8>
    3b08:	00000413          	li	s0,0
    3b0c:	040a2783          	lw	a5,64(s4)
    3b10:	00078463          	beqz	a5,3b18 <fl_fopen+0x174>
    3b14:	000780e7          	jalr	a5
    3b18:	05c12083          	lw	ra,92(sp)
    3b1c:	00040513          	mv	a0,s0
    3b20:	05812403          	lw	s0,88(sp)
    3b24:	05412483          	lw	s1,84(sp)
    3b28:	05012903          	lw	s2,80(sp)
    3b2c:	04c12983          	lw	s3,76(sp)
    3b30:	04812a03          	lw	s4,72(sp)
    3b34:	04412a83          	lw	s5,68(sp)
    3b38:	04012b03          	lw	s6,64(sp)
    3b3c:	03c12b83          	lw	s7,60(sp)
    3b40:	03812c03          	lw	s8,56(sp)
    3b44:	03412c83          	lw	s9,52(sp)
    3b48:	03012d03          	lw	s10,48(sp)
    3b4c:	06010113          	addi	sp,sp,96
    3b50:	00008067          	ret
    3b54:	008907b3          	add	a5,s2,s0
    3b58:	0007c783          	lbu	a5,0(a5)
    3b5c:	05378863          	beq	a5,s3,3bac <fl_fopen+0x208>
    3b60:	02f9e863          	bltu	s3,a5,3b90 <fl_fopen+0x1ec>
    3b64:	05578863          	beq	a5,s5,3bb4 <fl_fopen+0x210>
    3b68:	00faea63          	bltu	s5,a5,3b7c <fl_fopen+0x1d8>
    3b6c:	02b00713          	li	a4,43
    3b70:	04e78663          	beq	a5,a4,3bbc <fl_fopen+0x218>
    3b74:	00140413          	addi	s0,s0,1
    3b78:	ebdff06f          	j	3a34 <fl_fopen+0x90>
    3b7c:	03978263          	beq	a5,s9,3ba0 <fl_fopen+0x1fc>
    3b80:	05200713          	li	a4,82
    3b84:	fee798e3          	bne	a5,a4,3b74 <fl_fopen+0x1d0>
    3b88:	0014e493          	ori	s1,s1,1
    3b8c:	fe9ff06f          	j	3b74 <fl_fopen+0x1d0>
    3b90:	ff478ce3          	beq	a5,s4,3b88 <fl_fopen+0x1e4>
    3b94:	00fa6a63          	bltu	s4,a5,3ba8 <fl_fopen+0x204>
    3b98:	01778e63          	beq	a5,s7,3bb4 <fl_fopen+0x210>
    3b9c:	fd879ce3          	bne	a5,s8,3b74 <fl_fopen+0x1d0>
    3ba0:	0084e493          	ori	s1,s1,8
    3ba4:	fd1ff06f          	j	3b74 <fl_fopen+0x1d0>
    3ba8:	fd6796e3          	bne	a5,s6,3b74 <fl_fopen+0x1d0>
    3bac:	0324e493          	ori	s1,s1,50
    3bb0:	fc5ff06f          	j	3b74 <fl_fopen+0x1d0>
    3bb4:	0264e493          	ori	s1,s1,38
    3bb8:	fbdff06f          	j	3b74 <fl_fopen+0x1d0>
    3bbc:	0014f793          	andi	a5,s1,1
    3bc0:	00078663          	beqz	a5,3bcc <fl_fopen+0x228>
    3bc4:	0024e493          	ori	s1,s1,2
    3bc8:	fadff06f          	j	3b74 <fl_fopen+0x1d0>
    3bcc:	0024f793          	andi	a5,s1,2
    3bd0:	00078663          	beqz	a5,3bdc <fl_fopen+0x238>
    3bd4:	0314e493          	ori	s1,s1,49
    3bd8:	f9dff06f          	j	3b74 <fl_fopen+0x1d0>
    3bdc:	0044f793          	andi	a5,s1,4
    3be0:	f8078ae3          	beqz	a5,3b74 <fl_fopen+0x1d0>
    3be4:	0274e493          	ori	s1,s1,39
    3be8:	f8dff06f          	j	3b74 <fl_fopen+0x1d0>
    3bec:	000d0513          	mv	a0,s10
    3bf0:	fffff097          	auipc	ra,0xfffff
    3bf4:	fa8080e7          	jalr	-88(ra) # 2b98 <_open_file>
    3bf8:	00050413          	mv	s0,a0
    3bfc:	e60508e3          	beqz	a0,3a6c <fl_fopen+0xc8>
    3c00:	42940c23          	sb	s1,1080(s0)
    3c04:	f09ff06f          	j	3b0c <fl_fopen+0x168>
    3c08:	00040513          	mv	a0,s0
    3c0c:	ffffe097          	auipc	ra,0xffffe
    3c10:	554080e7          	jalr	1364(ra) # 2160 <_check_file_open>
    3c14:	00050913          	mv	s2,a0
    3c18:	ec0514e3          	bnez	a0,3ae0 <fl_fopen+0x13c>
    3c1c:	01444783          	lbu	a5,20(s0)
    3c20:	0e079663          	bnez	a5,3d0c <fl_fopen+0x368>
    3c24:	008a2783          	lw	a5,8(s4)
    3c28:	00f42023          	sw	a5,0(s0)
    3c2c:	00042583          	lw	a1,0(s0)
    3c30:	01010693          	addi	a3,sp,16
    3c34:	000b0613          	mv	a2,s6
    3c38:	95098513          	addi	a0,s3,-1712
    3c3c:	fffff097          	auipc	ra,0xfffff
    3c40:	bb4080e7          	jalr	-1100(ra) # 27f0 <fatfs_get_file_entry>
    3c44:	00100693          	li	a3,1
    3c48:	e8d50ce3          	beq	a0,a3,3ae0 <fl_fopen+0x13c>
    3c4c:	00042223          	sw	zero,4(s0)
    3c50:	00440613          	addi	a2,s0,4
    3c54:	00068593          	mv	a1,a3
    3c58:	95098513          	addi	a0,s3,-1712
    3c5c:	00000097          	auipc	ra,0x0
    3c60:	908080e7          	jalr	-1784(ra) # 3564 <fatfs_allocate_free_space>
    3c64:	e6050ee3          	beqz	a0,3ae0 <fl_fopen+0x13c>
    3c68:	00002ab7          	lui	s5,0x2
    3c6c:	21c40b93          	addi	s7,s0,540
    3c70:	95098c13          	addi	s8,s3,-1712
    3c74:	70fa8a93          	addi	s5,s5,1807 # 270f <fatfs_sector_reader+0x6f>
    3c78:	000b0593          	mv	a1,s6
    3c7c:	00410513          	addi	a0,sp,4
    3c80:	ffffe097          	auipc	ra,0xffffe
    3c84:	e18080e7          	jalr	-488(ra) # 1a98 <fatfs_lfn_create_sfn>
    3c88:	08090e63          	beqz	s2,3d24 <fl_fopen+0x380>
    3c8c:	00090613          	mv	a2,s2
    3c90:	00410593          	addi	a1,sp,4
    3c94:	000b8513          	mv	a0,s7
    3c98:	ffffe097          	auipc	ra,0xffffe
    3c9c:	f7c080e7          	jalr	-132(ra) # 1c14 <fatfs_lfn_generate_tail>
    3ca0:	00042583          	lw	a1,0(s0)
    3ca4:	000b8613          	mv	a2,s7
    3ca8:	000c0513          	mv	a0,s8
    3cac:	fffff097          	auipc	ra,0xfffff
    3cb0:	060080e7          	jalr	96(ra) # 2d0c <fatfs_sfn_exists>
    3cb4:	00050663          	beqz	a0,3cc0 <fl_fopen+0x31c>
    3cb8:	00190913          	addi	s2,s2,1
    3cbc:	fb591ee3          	bne	s2,s5,3c78 <fl_fopen+0x2d4>
    3cc0:	00442703          	lw	a4,4(s0)
    3cc4:	000027b7          	lui	a5,0x2
    3cc8:	70f78793          	addi	a5,a5,1807 # 270f <fatfs_sector_reader+0x6f>
    3ccc:	00070593          	mv	a1,a4
    3cd0:	02f90663          	beq	s2,a5,3cfc <fl_fopen+0x358>
    3cd4:	00042583          	lw	a1,0(s0)
    3cd8:	00000813          	li	a6,0
    3cdc:	00000793          	li	a5,0
    3ce0:	000b8693          	mv	a3,s7
    3ce4:	000b0613          	mv	a2,s6
    3ce8:	95098513          	addi	a0,s3,-1712
    3cec:	00000097          	auipc	ra,0x0
    3cf0:	990080e7          	jalr	-1648(ra) # 367c <fatfs_add_file_entry>
    3cf4:	04051463          	bnez	a0,3d3c <fl_fopen+0x398>
    3cf8:	00442583          	lw	a1,4(s0)
    3cfc:	95098513          	addi	a0,s3,-1712
    3d00:	fffff097          	auipc	ra,0xfffff
    3d04:	68c080e7          	jalr	1676(ra) # 338c <fatfs_free_cluster_chain>
    3d08:	dd9ff06f          	j	3ae0 <fl_fopen+0x13c>
    3d0c:	00040593          	mv	a1,s0
    3d10:	000a8513          	mv	a0,s5
    3d14:	fffff097          	auipc	ra,0xfffff
    3d18:	cd8080e7          	jalr	-808(ra) # 29ec <_open_directory>
    3d1c:	f00518e3          	bnez	a0,3c2c <fl_fopen+0x288>
    3d20:	dc1ff06f          	j	3ae0 <fl_fopen+0x13c>
    3d24:	00b00613          	li	a2,11
    3d28:	00410593          	addi	a1,sp,4
    3d2c:	000b8513          	mv	a0,s7
    3d30:	ffffd097          	auipc	ra,0xffffd
    3d34:	d30080e7          	jalr	-720(ra) # a60 <memcpy>
    3d38:	f69ff06f          	j	3ca0 <fl_fopen+0x2fc>
    3d3c:	fff00793          	li	a5,-1
    3d40:	00042623          	sw	zero,12(s0)
    3d44:	00042423          	sw	zero,8(s0)
    3d48:	42f42823          	sw	a5,1072(s0)
    3d4c:	42042a23          	sw	zero,1076(s0)
    3d50:	00042823          	sw	zero,16(s0)
    3d54:	22f42423          	sw	a5,552(s0)
    3d58:	22f42623          	sw	a5,556(s0)
    3d5c:	95098513          	addi	a0,s3,-1712
    3d60:	ffffe097          	auipc	ra,0xffffe
    3d64:	7e0080e7          	jalr	2016(ra) # 2540 <fatfs_fat_purge>
    3d68:	d89ff06f          	j	3af0 <fl_fopen+0x14c>
    3d6c:	000d0513          	mv	a0,s10
    3d70:	fffff097          	auipc	ra,0xfffff
    3d74:	e28080e7          	jalr	-472(ra) # 2b98 <_open_file>
    3d78:	00050413          	mv	s0,a0
    3d7c:	e80412e3          	bnez	s0,3c00 <fl_fopen+0x25c>
    3d80:	d89ff06f          	j	3b08 <fl_fopen+0x164>
    3d84:	00000413          	li	s0,0
    3d88:	d91ff06f          	j	3b18 <fl_fopen+0x174>

00003d8c <cmd16>:
    3d8c:	02000050 00001500                       P.......

00003d94 <acmd41>:
    3d94:	00004069 00000100                       i@......

00003d9c <cmd55>:
    3d9c:	00000077 00000100                       w.......

00003da4 <cmd8>:
    3da4:	01000048 000087aa                       H.......

00003dac <cmd0>:
    3dac:	00000040 00009500                       @.......

00003db4 <BUTTONS>:
    3db4:	00010100                                ....

00003db8 <SDCARD>:
    3db8:	00010080                                ....

00003dbc <OLED_RST>:
    3dbc:	00010010                                ....

00003dc0 <OLED>:
    3dc0:	00010008                                ....

00003dc4 <LEDS>:
    3dc4:	00010004 0000002f 00006272 00000000     ..../...rb......
    3dd4:	696c632f 722e6b63 00007761 74696e49     /click.raw..Init
    3de4:	696c6169 676e697a 20445320 64726163     ializing SD card
    3df4:	0a2e2e2e 00000000 20202020 3d3d3d3d     ........    ====
    3e04:	6966203d 2073656c 3d3d3d3d 2020203d     = files =====   
    3e14:	000a0a20 66206f4e 73656c69 756f6620      ...No files fou
    3e24:	0a21646e 00000000 203e6425 000a7325     nd!.....%d> %s..
    3e34:	5b202020 62206425 73657479 00000a5d        [%d bytes]...
    3e44:	33323130 37363534 42413938 46454443     0123456789ABCDEF
    3e54:	00000000 5f544146 203a5346 6f727245     ....FAT_FS: Erro
    3e64:	6f632072 20646c75 20746f6e 64616f6c     r could not load
    3e74:	54414620 74656420 736c6961 64252820      FAT details (%d
    3e84:	0a0d2129 00000000                       )!......

00003e8c <font>:
    3e8c:	00000000 00002f00 00030000 14000003     ...../..........
    3e9c:	143e143e 3a2b6a2e 08122600 171c3224     >.>..j+:.&..$2..
    3eac:	03003415 00000000 0000211e 001e2100     .4.......!...!..
    3ebc:	08220000 0822081c 0000081c 00002040     .."...".....@ ..
    3ecc:	00080800 00200000 20000000 02040810     ...... .... ....
    3edc:	3f21213f 003f0100 253d0000 25002725     ?!!?..?...=%%'.%
    3eec:	003f2525 3f040407 25252700 253f003d     %%?....?.'%%=.?%
    3efc:	01003d25 00030539 3f25253f 25252700     %=..9...?%%?.'%%
    3f0c:	0028003f 40000000 00000028 00110a04     ?.(....@(.......
    3f1c:	00141400 0a110000 01000004 0007052d     ............-...
    3f2c:	253d213f 09093f1f 253f003f 3f003c27     ?!=%.?..?.?%'<.?
    3f3c:	00212121 1e21213f 25253f00 053f0025     !!!.?!!..?%%%.?.
    3f4c:	3f000505 003d2521 3f04043f 213f2100     ...?!%=.?..?.!?!
    3f5c:	20380000 3f013f21 003b0404 2020203f     ..8 !?.?..;.?   
    3f6c:	3f013f00 023f3f01 3f003f04 003f2121     .?.?.??..?.?!!?.
    3f7c:	0f09093f 31213f00 093f003f 27002f39     ?....?!1?.?.9/.'
    3f8c:	003d2525 013f0101 20203f01 100f003f     %%=...?..?  ?...
    3f9c:	3f001f30 3f203f20 3b04043b 38080f00     0..? ? ?;..;...8
    3fac:	2931000f 3f002325 00000021 04081020     ..1)%#.?!... ...
    3fbc:	003f2102 01020000 20000201 00000020     .!?........  ...
    3fcc:	00000201 24243800 243f003c 3c003c24     .....8$$<.?$$<.<
    3fdc:	00242424 3f24243c 2c2c3c00 3f04002c     $$$.<$$?.<,,,..?
    3fec:	bc000005 00fca4a4 3c04043f 00003d00     ........?..<.=..
    3ffc:	fd800000 3f000000 00340808 0000003f     .......?..4.?...
    400c:	3c043c00 043c3c04 3c003c04 003c2424     .<.<.<<..<.<$$<.
    401c:	3c2424fc 24243c00 083c00fc 2c000004     .$$<.<$$..<....,
    402c:	003c2c2c 00243f04 20203c00 100c003c     ,,<..?$..<  <...
    403c:	3c001c30 3c203c20 34080834 a0a0bc00     0..< < <4..4....
    404c:	342400fc 0400242c 0000213f 0000003f     ..$4,$..?!..?...
    405c:	043f2100 02010000 00000102 00000000     .!?.............
    406c:	00000001 00000003 00000005 00000007     ................
    407c:	00000009 0000000e 00000010 00000012     ................
    408c:	00000014 00000016 00000018 0000001c     ................
    409c:	0000001e                                ....

000040a0 <n_items>:
    40a0:	00000000                                ....

000040a4 <sdcard_while_loading_callback>:
    40a4:	00000000                                ....

000040a8 <back_color>:
	...

000040a9 <front_color>:
    40a9:	                                         ...

000040ac <cursor_y>:
    40ac:	00000000                                ....

000040b0 <cursor_x>:
    40b0:	00000000                                ....

000040b4 <f_putchar>:
    40b4:	00000000                                ....

000040b8 <_free_file_list>:
	...

000040c0 <_open_file_list>:
	...

000040c8 <_filelib_valid>:
    40c8:	00000000                                ....

000040cc <_filelib_init>:
    40cc:	00000000                                ....
