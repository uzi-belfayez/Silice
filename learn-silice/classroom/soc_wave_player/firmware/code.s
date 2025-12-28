
code.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00010137          	lui	sp,0x10
       4:	00002097          	auipc	ra,0x2
       8:	884080e7          	jalr	-1916(ra) # 1888 <main>
       c:	00000317          	auipc	t1,0x0
      10:	00830067          	jr	8(t1) # 14 <exit>

00000014 <exit>:
      14:	00000000          	.word	0x00000000
      18:	00008067          	ret

0000001c <strcmp>:
      1c:	00054783          	lbu	a5,0(a0)
      20:	0005c703          	lbu	a4,0(a1)
      24:	00078463          	beqz	a5,2c <strcmp+0x10>
      28:	00e78663          	beq	a5,a4,34 <strcmp+0x18>
      2c:	40e78533          	sub	a0,a5,a4
      30:	00008067          	ret
      34:	00150513          	addi	a0,a0,1
      38:	00158593          	addi	a1,a1,1
      3c:	fe1ff06f          	j	1c <strcmp>

00000040 <strrchr>:
      40:	00050793          	mv	a5,a0
      44:	0ff5f593          	zext.b	a1,a1
      48:	00000513          	li	a0,0
      4c:	0007c703          	lbu	a4,0(a5)
      50:	00b71463          	bne	a4,a1,58 <strrchr+0x18>
      54:	00078513          	mv	a0,a5
      58:	00178793          	addi	a5,a5,1
      5c:	fe0718e3          	bnez	a4,4c <strrchr+0xc>
      60:	00008067          	ret

00000064 <starts_with>:
      64:	0005c783          	lbu	a5,0(a1)
      68:	00079663          	bnez	a5,74 <starts_with+0x10>
      6c:	00100513          	li	a0,1
      70:	00008067          	ret
      74:	00054703          	lbu	a4,0(a0)
      78:	00150513          	addi	a0,a0,1
      7c:	00158593          	addi	a1,a1,1
      80:	fef702e3          	beq	a4,a5,64 <starts_with>
      84:	00000513          	li	a0,0
      88:	00008067          	ret

0000008c <strcat_custom>:
      8c:	00054783          	lbu	a5,0(a0)
      90:	00079a63          	bnez	a5,a4 <strcat_custom+0x18>
      94:	0005c783          	lbu	a5,0(a1)
      98:	00079a63          	bnez	a5,ac <strcat_custom+0x20>
      9c:	00050023          	sb	zero,0(a0)
      a0:	00008067          	ret
      a4:	00150513          	addi	a0,a0,1
      a8:	fe5ff06f          	j	8c <strcat_custom>
      ac:	00150513          	addi	a0,a0,1
      b0:	00158593          	addi	a1,a1,1
      b4:	fef50fa3          	sb	a5,-1(a0)
      b8:	fddff06f          	j	94 <strcat_custom+0x8>

000000bc <memcpy_custom>:
      bc:	00000793          	li	a5,0
      c0:	00c79463          	bne	a5,a2,c8 <memcpy_custom+0xc>
      c4:	00008067          	ret
      c8:	00f58733          	add	a4,a1,a5
      cc:	00074683          	lbu	a3,0(a4)
      d0:	00f50733          	add	a4,a0,a5
      d4:	00178793          	addi	a5,a5,1
      d8:	00d70023          	sb	a3,0(a4)
      dc:	fe5ff06f          	j	c0 <memcpy_custom+0x4>

000000e0 <clear_audio>:
      e0:	fe010113          	addi	sp,sp,-32 # ffe0 <_files+0x7de0>
      e4:	000067b7          	lui	a5,0x6
      e8:	00812c23          	sw	s0,24(sp)
      ec:	ba87a403          	lw	s0,-1112(a5) # 5ba8 <AUDIO>
      f0:	00112e23          	sw	ra,28(sp)
      f4:	00912a23          	sw	s1,20(sp)
      f8:	00042703          	lw	a4,0(s0)
      fc:	01212823          	sw	s2,16(sp)
     100:	01312623          	sw	s3,12(sp)
     104:	00042783          	lw	a5,0(s0)
     108:	fef70ee3          	beq	a4,a5,104 <clear_audio+0x24>
     10c:	00200493          	li	s1,2
     110:	00100993          	li	s3,1
     114:	00042903          	lw	s2,0(s0)
     118:	20000613          	li	a2,512
     11c:	00000593          	li	a1,0
     120:	00090513          	mv	a0,s2
     124:	00002097          	auipc	ra,0x2
     128:	ec0080e7          	jalr	-320(ra) # 1fe4 <memset>
     12c:	00042783          	lw	a5,0(s0)
     130:	fef90ee3          	beq	s2,a5,12c <clear_audio+0x4c>
     134:	03349063          	bne	s1,s3,154 <clear_audio+0x74>
     138:	01c12083          	lw	ra,28(sp)
     13c:	01812403          	lw	s0,24(sp)
     140:	01412483          	lw	s1,20(sp)
     144:	01012903          	lw	s2,16(sp)
     148:	00c12983          	lw	s3,12(sp)
     14c:	02010113          	addi	sp,sp,32
     150:	00008067          	ret
     154:	00100493          	li	s1,1
     158:	fbdff06f          	j	114 <clear_audio+0x34>

0000015c <play_click_noise>:
     15c:	000065b7          	lui	a1,0x6
     160:	00006537          	lui	a0,0x6
     164:	fe010113          	addi	sp,sp,-32
     168:	bc458593          	addi	a1,a1,-1084 # 5bc4 <LEDS+0x4>
     16c:	bcc50513          	addi	a0,a0,-1076 # 5bcc <LEDS+0xc>
     170:	00112e23          	sw	ra,28(sp)
     174:	00812c23          	sw	s0,24(sp)
     178:	00912a23          	sw	s1,20(sp)
     17c:	01212823          	sw	s2,16(sp)
     180:	01312623          	sw	s3,12(sp)
     184:	01412423          	sw	s4,8(sp)
     188:	01512223          	sw	s5,4(sp)
     18c:	00005097          	auipc	ra,0x5
     190:	608080e7          	jalr	1544(ra) # 5794 <fl_fopen>
     194:	0a050263          	beqz	a0,238 <play_click_noise+0xdc>
     198:	000015b7          	lui	a1,0x1
     19c:	00000613          	li	a2,0
     1a0:	19458593          	addi	a1,a1,404 # 1194 <music_player+0xb4>
     1a4:	00050a13          	mv	s4,a0
     1a8:	00003097          	auipc	ra,0x3
     1ac:	a7c080e7          	jalr	-1412(ra) # 2c24 <fl_fseek>
     1b0:	000067b7          	lui	a5,0x6
     1b4:	ba87aa83          	lw	s5,-1112(a5) # 5ba8 <AUDIO>
     1b8:	20000993          	li	s3,512
     1bc:	1ff00913          	li	s2,511
     1c0:	000aa483          	lw	s1,0(s5)
     1c4:	000a0693          	mv	a3,s4
     1c8:	20000613          	li	a2,512
     1cc:	00100593          	li	a1,1
     1d0:	00048513          	mv	a0,s1
     1d4:	00005097          	auipc	ra,0x5
     1d8:	fbc080e7          	jalr	-68(ra) # 5190 <fl_fread>
     1dc:	00050413          	mv	s0,a0
     1e0:	00a94c63          	blt	s2,a0,1f8 <play_click_noise+0x9c>
     1e4:	40a98633          	sub	a2,s3,a0
     1e8:	00000593          	li	a1,0
     1ec:	00a48533          	add	a0,s1,a0
     1f0:	00002097          	auipc	ra,0x2
     1f4:	df4080e7          	jalr	-524(ra) # 1fe4 <memset>
     1f8:	000aa783          	lw	a5,0(s5)
     1fc:	fef48ee3          	beq	s1,a5,1f8 <play_click_noise+0x9c>
     200:	fc8940e3          	blt	s2,s0,1c0 <play_click_noise+0x64>
     204:	000a0513          	mv	a0,s4
     208:	00005097          	auipc	ra,0x5
     20c:	eac080e7          	jalr	-340(ra) # 50b4 <fl_fclose>
     210:	01812403          	lw	s0,24(sp)
     214:	01c12083          	lw	ra,28(sp)
     218:	01412483          	lw	s1,20(sp)
     21c:	01012903          	lw	s2,16(sp)
     220:	00c12983          	lw	s3,12(sp)
     224:	00812a03          	lw	s4,8(sp)
     228:	00412a83          	lw	s5,4(sp)
     22c:	02010113          	addi	sp,sp,32
     230:	00000317          	auipc	t1,0x0
     234:	eb030067          	jr	-336(t1) # e0 <clear_audio>
     238:	01c12083          	lw	ra,28(sp)
     23c:	01812403          	lw	s0,24(sp)
     240:	01412483          	lw	s1,20(sp)
     244:	01012903          	lw	s2,16(sp)
     248:	00c12983          	lw	s3,12(sp)
     24c:	00812a03          	lw	s4,8(sp)
     250:	00412a83          	lw	s5,4(sp)
     254:	02010113          	addi	sp,sp,32
     258:	00008067          	ret

0000025c <update_player_ui>:
     25c:	fe010113          	addi	sp,sp,-32
     260:	00812c23          	sw	s0,24(sp)
     264:	00912a23          	sw	s1,20(sp)
     268:	01212823          	sw	s2,16(sp)
     26c:	01312623          	sw	s3,12(sp)
     270:	00058413          	mv	s0,a1
     274:	00060993          	mv	s3,a2
     278:	00112e23          	sw	ra,28(sp)
     27c:	00050913          	mv	s2,a0
     280:	00002097          	auipc	ra,0x2
     284:	084080e7          	jalr	132(ra) # 2304 <display_framebuffer>
     288:	000037b7          	lui	a5,0x3
     28c:	00050493          	mv	s1,a0
     290:	48078793          	addi	a5,a5,1152 # 3480 <fatfs_get_substring+0x20>
     294:	08000613          	li	a2,128
     298:	000045b7          	lui	a1,0x4
     29c:	00000713          	li	a4,0
     2a0:	00f486b3          	add	a3,s1,a5
     2a4:	00e68533          	add	a0,a3,a4
     2a8:	00050023          	sb	zero,0(a0)
     2ac:	00170713          	addi	a4,a4,1
     2b0:	fec71ae3          	bne	a4,a2,2a4 <update_player_ui+0x48>
     2b4:	08078793          	addi	a5,a5,128
     2b8:	feb792e3          	bne	a5,a1,29c <update_player_ui+0x40>
     2bc:	06e00713          	li	a4,110
     2c0:	fff00893          	li	a7,-1
     2c4:	07700313          	li	t1,119
     2c8:	07300813          	li	a6,115
     2cc:	f9270593          	addi	a1,a4,-110
     2d0:	00771613          	slli	a2,a4,0x7
     2d4:	ffb5f593          	andi	a1,a1,-5
     2d8:	00c48633          	add	a2,s1,a2
     2dc:	00a00793          	li	a5,10
     2e0:	f8a78693          	addi	a3,a5,-118
     2e4:	ff678513          	addi	a0,a5,-10
     2e8:	00153513          	seqz	a0,a0
     2ec:	0016b693          	seqz	a3,a3
     2f0:	00a6e6b3          	or	a3,a3,a0
     2f4:	00178513          	addi	a0,a5,1
     2f8:	00069863          	bnez	a3,308 <update_player_ui+0xac>
     2fc:	00058663          	beqz	a1,308 <update_player_ui+0xac>
     300:	00050793          	mv	a5,a0
     304:	fddff06f          	j	2e0 <update_player_ui+0x84>
     308:	00f607b3          	add	a5,a2,a5
     30c:	01178023          	sb	a7,0(a5)
     310:	00050793          	mv	a5,a0
     314:	fc6516e3          	bne	a0,t1,2e0 <update_player_ui+0x84>
     318:	00170713          	addi	a4,a4,1
     31c:	fb0718e3          	bne	a4,a6,2cc <update_player_ui+0x70>
     320:	00391513          	slli	a0,s2,0x3
     324:	41250533          	sub	a0,a0,s2
     328:	00251513          	slli	a0,a0,0x2
     32c:	41250533          	sub	a0,a0,s2
     330:	000037b7          	lui	a5,0x3
     334:	00251513          	slli	a0,a0,0x2
     338:	a9378793          	addi	a5,a5,-1389 # 2a93 <fatfs_lba_of_cluster+0x7>
     33c:	06c00693          	li	a3,108
     340:	00a7ca63          	blt	a5,a0,354 <update_player_ui+0xf8>
     344:	06400593          	li	a1,100
     348:	00002097          	auipc	ra,0x2
     34c:	be8080e7          	jalr	-1048(ra) # 1f30 <__divsi3>
     350:	00050693          	mv	a3,a0
     354:	000037b7          	lui	a5,0x3
     358:	00004637          	lui	a2,0x4
     35c:	78078793          	addi	a5,a5,1920 # 3780 <fatfs_compare_names+0x148>
     360:	07600593          	li	a1,118
     364:	07500513          	li	a0,117
     368:	00a00813          	li	a6,10
     36c:	fff00893          	li	a7,-1
     370:	90060613          	addi	a2,a2,-1792 # 3900 <fatfs_init+0x4>
     374:	40d58733          	sub	a4,a1,a3
     378:	00f48333          	add	t1,s1,a5
     37c:	04e55c63          	bge	a0,a4,3d4 <update_player_ui+0x178>
     380:	08078793          	addi	a5,a5,128
     384:	fec798e3          	bne	a5,a2,374 <update_player_ui+0x118>
     388:	07600593          	li	a1,118
     38c:	00a00513          	li	a0,10
     390:	00002097          	auipc	ra,0x2
     394:	f80080e7          	jalr	-128(ra) # 2310 <display_set_cursor>
     398:	00000593          	li	a1,0
     39c:	0ff00513          	li	a0,255
     3a0:	00002097          	auipc	ra,0x2
     3a4:	f84080e7          	jalr	-124(ra) # 2324 <display_set_front_back_color>
     3a8:	04040063          	beqz	s0,3e8 <update_player_ui+0x18c>
     3ac:	01812403          	lw	s0,24(sp)
     3b0:	01c12083          	lw	ra,28(sp)
     3b4:	01412483          	lw	s1,20(sp)
     3b8:	01012903          	lw	s2,16(sp)
     3bc:	00c12983          	lw	s3,12(sp)
     3c0:	00006537          	lui	a0,0x6
     3c4:	bd850513          	addi	a0,a0,-1064 # 5bd8 <LEDS+0x18>
     3c8:	02010113          	addi	sp,sp,32
     3cc:	00002317          	auipc	t1,0x2
     3d0:	22030067          	jr	544(t1) # 25ec <printf>
     3d4:	01070663          	beq	a4,a6,3e0 <update_player_ui+0x184>
     3d8:	00e30e33          	add	t3,t1,a4
     3dc:	011e0023          	sb	a7,0(t3)
     3e0:	00170713          	addi	a4,a4,1
     3e4:	f99ff06f          	j	37c <update_player_ui+0x120>
     3e8:	00006537          	lui	a0,0x6
     3ec:	be850513          	addi	a0,a0,-1048 # 5be8 <LEDS+0x28>
     3f0:	00002097          	auipc	ra,0x2
     3f4:	1fc080e7          	jalr	508(ra) # 25ec <printf>
     3f8:	000064b7          	lui	s1,0x6
     3fc:	00b00913          	li	s2,11
     400:	008987b3          	add	a5,s3,s0
     404:	0007c503          	lbu	a0,0(a5)
     408:	00050a63          	beqz	a0,41c <update_player_ui+0x1c0>
     40c:	1604a783          	lw	a5,352(s1) # 6160 <f_putchar>
     410:	00140413          	addi	s0,s0,1
     414:	000780e7          	jalr	a5
     418:	ff2414e3          	bne	s0,s2,400 <update_player_ui+0x1a4>
     41c:	00d00913          	li	s2,13
     420:	1604a783          	lw	a5,352(s1)
     424:	02000513          	li	a0,32
     428:	00140413          	addi	s0,s0,1
     42c:	000780e7          	jalr	a5
     430:	ff2418e3          	bne	s0,s2,420 <update_player_ui+0x1c4>
     434:	01c12083          	lw	ra,28(sp)
     438:	01812403          	lw	s0,24(sp)
     43c:	01412483          	lw	s1,20(sp)
     440:	01012903          	lw	s2,16(sp)
     444:	00c12983          	lw	s3,12(sp)
     448:	02010113          	addi	sp,sp,32
     44c:	00008067          	ret

00000450 <update_led_dance>:
     450:	00000713          	li	a4,0
     454:	00000693          	li	a3,0
     458:	06b74463          	blt	a4,a1,4c0 <update_led_dance+0x70>
     45c:	32000793          	li	a5,800
     460:	04d7fe63          	bgeu	a5,a3,4bc <update_led_dance+0x6c>
     464:	00006637          	lui	a2,0x6
     468:	b7c62703          	lw	a4,-1156(a2) # 5b7c <led_pos>
     46c:	000067b7          	lui	a5,0x6
     470:	fff70693          	addi	a3,a4,-1
     474:	00068663          	beqz	a3,480 <update_led_dance+0x30>
     478:	f8070693          	addi	a3,a4,-128
     47c:	00069a63          	bnez	a3,490 <update_led_dance+0x40>
     480:	1487a583          	lw	a1,328(a5) # 6148 <led_dir>
     484:	00100693          	li	a3,1
     488:	40b686b3          	sub	a3,a3,a1
     48c:	14d7a423          	sw	a3,328(a5)
     490:	1487a683          	lw	a3,328(a5)
     494:	40175793          	srai	a5,a4,0x1
     498:	00068463          	beqz	a3,4a0 <update_led_dance+0x50>
     49c:	00171793          	slli	a5,a4,0x1
     4a0:	08000713          	li	a4,128
     4a4:	04f75463          	bge	a4,a5,4ec <update_led_dance+0x9c>
     4a8:	00070793          	mv	a5,a4
     4ac:	00006737          	lui	a4,0x6
     4b0:	bc072703          	lw	a4,-1088(a4) # 5bc0 <LEDS>
     4b4:	b6f62e23          	sw	a5,-1156(a2)
     4b8:	00f72023          	sw	a5,0(a4)
     4bc:	00008067          	ret
     4c0:	02070063          	beqz	a4,4e0 <update_led_dance+0x90>
     4c4:	ffc54603          	lbu	a2,-4(a0)
     4c8:	00054783          	lbu	a5,0(a0)
     4cc:	40c787b3          	sub	a5,a5,a2
     4d0:	41f7d613          	srai	a2,a5,0x1f
     4d4:	00f647b3          	xor	a5,a2,a5
     4d8:	40c787b3          	sub	a5,a5,a2
     4dc:	00f686b3          	add	a3,a3,a5
     4e0:	00470713          	addi	a4,a4,4
     4e4:	00450513          	addi	a0,a0,4
     4e8:	f71ff06f          	j	458 <update_led_dance+0x8>
     4ec:	fcf040e3          	bgtz	a5,4ac <update_led_dance+0x5c>
     4f0:	00100793          	li	a5,1
     4f4:	fb9ff06f          	j	4ac <update_led_dance+0x5c>

000004f8 <play_music_with_controls>:
     4f8:	bb010113          	addi	sp,sp,-1104
     4fc:	00b12023          	sw	a1,0(sp)
     500:	000065b7          	lui	a1,0x6
     504:	44912223          	sw	s1,1092(sp)
     508:	bec58593          	addi	a1,a1,-1044 # 5bec <LEDS+0x2c>
     50c:	00050493          	mv	s1,a0
     510:	01c10513          	addi	a0,sp,28
     514:	44112623          	sw	ra,1100(sp)
     518:	45212023          	sw	s2,1088(sp)
     51c:	43412c23          	sw	s4,1080(sp)
     520:	44812423          	sw	s0,1096(sp)
     524:	43312e23          	sw	s3,1084(sp)
     528:	43512a23          	sw	s5,1076(sp)
     52c:	43612823          	sw	s6,1072(sp)
     530:	43712623          	sw	s7,1068(sp)
     534:	43812423          	sw	s8,1064(sp)
     538:	43912223          	sw	s9,1060(sp)
     53c:	43a12023          	sw	s10,1056(sp)
     540:	41b12e23          	sw	s11,1052(sp)
     544:	00060a13          	mv	s4,a2
     548:	00002097          	auipc	ra,0x2
     54c:	b60080e7          	jalr	-1184(ra) # 20a8 <strcpy>
     550:	00012583          	lw	a1,0(sp)
     554:	01c10513          	addi	a0,sp,28
     558:	00006937          	lui	s2,0x6
     55c:	00000097          	auipc	ra,0x0
     560:	b30080e7          	jalr	-1232(ra) # 8c <strcat_custom>
     564:	bc490593          	addi	a1,s2,-1084 # 5bc4 <LEDS+0x4>
     568:	01c10513          	addi	a0,sp,28
     56c:	00005097          	auipc	ra,0x5
     570:	228080e7          	jalr	552(ra) # 5794 <fl_fopen>
     574:	0c050a63          	beqz	a0,648 <play_music_with_controls+0x150>
     578:	00050413          	mv	s0,a0
     57c:	00002097          	auipc	ra,0x2
     580:	d88080e7          	jalr	-632(ra) # 2304 <display_framebuffer>
     584:	00040693          	mv	a3,s0
     588:	00004637          	lui	a2,0x4
     58c:	00100593          	li	a1,1
     590:	00005097          	auipc	ra,0x5
     594:	c00080e7          	jalr	-1024(ra) # 5190 <fl_fread>
     598:	00040513          	mv	a0,s0
     59c:	00005097          	auipc	ra,0x5
     5a0:	b18080e7          	jalr	-1256(ra) # 50b4 <fl_fclose>
     5a4:	bc490593          	addi	a1,s2,-1084
     5a8:	00048513          	mv	a0,s1
     5ac:	00005097          	auipc	ra,0x5
     5b0:	1e8080e7          	jalr	488(ra) # 5794 <fl_fopen>
     5b4:	00a12223          	sw	a0,4(sp)
     5b8:	0c051663          	bnez	a0,684 <play_music_with_controls+0x18c>
     5bc:	00002097          	auipc	ra,0x2
     5c0:	ccc080e7          	jalr	-820(ra) # 2288 <oled_clear>
     5c4:	00000593          	li	a1,0
     5c8:	00000513          	li	a0,0
     5cc:	00002097          	auipc	ra,0x2
     5d0:	d44080e7          	jalr	-700(ra) # 2310 <display_set_cursor>
     5d4:	00006537          	lui	a0,0x6
     5d8:	00048593          	mv	a1,s1
     5dc:	c0050513          	addi	a0,a0,-1024 # 5c00 <LEDS+0x40>
     5e0:	00002097          	auipc	ra,0x2
     5e4:	00c080e7          	jalr	12(ra) # 25ec <printf>
     5e8:	00002097          	auipc	ra,0x2
     5ec:	e98080e7          	jalr	-360(ra) # 2480 <display_refresh>
     5f0:	000317b7          	lui	a5,0x31
     5f4:	d4078793          	addi	a5,a5,-704 # 30d40 <__stacktop+0x20d40>
     5f8:	00000013          	nop
     5fc:	fff78793          	addi	a5,a5,-1
     600:	fe079ce3          	bnez	a5,5f8 <play_music_with_controls+0x100>
     604:	00000413          	li	s0,0
     608:	44c12083          	lw	ra,1100(sp)
     60c:	00040513          	mv	a0,s0
     610:	44812403          	lw	s0,1096(sp)
     614:	44412483          	lw	s1,1092(sp)
     618:	44012903          	lw	s2,1088(sp)
     61c:	43c12983          	lw	s3,1084(sp)
     620:	43812a03          	lw	s4,1080(sp)
     624:	43412a83          	lw	s5,1076(sp)
     628:	43012b03          	lw	s6,1072(sp)
     62c:	42c12b83          	lw	s7,1068(sp)
     630:	42812c03          	lw	s8,1064(sp)
     634:	42412c83          	lw	s9,1060(sp)
     638:	42012d03          	lw	s10,1056(sp)
     63c:	41c12d83          	lw	s11,1052(sp)
     640:	45010113          	addi	sp,sp,1104
     644:	00008067          	ret
     648:	00002097          	auipc	ra,0x2
     64c:	c40080e7          	jalr	-960(ra) # 2288 <oled_clear>
     650:	03200593          	li	a1,50
     654:	01e00513          	li	a0,30
     658:	00002097          	auipc	ra,0x2
     65c:	cb8080e7          	jalr	-840(ra) # 2310 <display_set_cursor>
     660:	00000593          	li	a1,0
     664:	0ff00513          	li	a0,255
     668:	00002097          	auipc	ra,0x2
     66c:	cbc080e7          	jalr	-836(ra) # 2324 <display_set_front_back_color>
     670:	00006537          	lui	a0,0x6
     674:	bf450513          	addi	a0,a0,-1036 # 5bf4 <LEDS+0x34>
     678:	00002097          	auipc	ra,0x2
     67c:	f74080e7          	jalr	-140(ra) # 25ec <printf>
     680:	f25ff06f          	j	5a4 <play_music_with_controls+0xac>
     684:	00012603          	lw	a2,0(sp)
     688:	00000593          	li	a1,0
     68c:	00000513          	li	a0,0
     690:	00000097          	auipc	ra,0x0
     694:	bcc080e7          	jalr	-1076(ra) # 25c <update_player_ui>
     698:	00002097          	auipc	ra,0x2
     69c:	de8080e7          	jalr	-536(ra) # 2480 <display_refresh>
     6a0:	000067b7          	lui	a5,0x6
     6a4:	bb07a783          	lw	a5,-1104(a5) # 5bb0 <BUTTONS>
     6a8:	00000993          	li	s3,0
     6ac:	00000913          	li	s2,0
     6b0:	0007a403          	lw	s0,0(a5)
     6b4:	00f12423          	sw	a5,8(sp)
     6b8:	000067b7          	lui	a5,0x6
     6bc:	ba87ad83          	lw	s11,-1112(a5) # 5ba8 <AUDIO>
     6c0:	00000493          	li	s1,0
     6c4:	21010d13          	addi	s10,sp,528
     6c8:	20000b93          	li	s7,512
     6cc:	1ff00b13          	li	s6,511
     6d0:	01a00c13          	li	s8,26
     6d4:	06400c93          	li	s9,100
     6d8:	000daa83          	lw	s5,0(s11)
     6dc:	0c090263          	beqz	s2,7a0 <play_music_with_controls+0x2a8>
     6e0:	20000613          	li	a2,512
     6e4:	00000593          	li	a1,0
     6e8:	000a8513          	mv	a0,s5
     6ec:	00002097          	auipc	ra,0x2
     6f0:	8f8080e7          	jalr	-1800(ra) # 1fe4 <memset>
     6f4:	000da783          	lw	a5,0(s11)
     6f8:	fefa8ee3          	beq	s5,a5,6f4 <play_music_with_controls+0x1fc>
     6fc:	00198993          	addi	s3,s3,1
     700:	05899863          	bne	s3,s8,750 <play_music_with_controls+0x258>
     704:	00000513          	li	a0,0
     708:	03405663          	blez	s4,734 <play_music_with_controls+0x23c>
     70c:	00149513          	slli	a0,s1,0x1
     710:	00950533          	add	a0,a0,s1
     714:	00351513          	slli	a0,a0,0x3
     718:	00950533          	add	a0,a0,s1
     71c:	000a0593          	mv	a1,s4
     720:	00251513          	slli	a0,a0,0x2
     724:	00002097          	auipc	ra,0x2
     728:	80c080e7          	jalr	-2036(ra) # 1f30 <__divsi3>
     72c:	00acd463          	bge	s9,a0,734 <play_music_with_controls+0x23c>
     730:	06400513          	li	a0,100
     734:	00012603          	lw	a2,0(sp)
     738:	00090593          	mv	a1,s2
     73c:	00000993          	li	s3,0
     740:	00000097          	auipc	ra,0x0
     744:	b1c080e7          	jalr	-1252(ra) # 25c <update_player_ui>
     748:	00002097          	auipc	ra,0x2
     74c:	d38080e7          	jalr	-712(ra) # 2480 <display_refresh>
     750:	00812783          	lw	a5,8(sp)
     754:	fff44413          	not	s0,s0
     758:	0007aa83          	lw	s5,0(a5)
     75c:	01547433          	and	s0,s0,s5
     760:	00247513          	andi	a0,s0,2
     764:	0a050863          	beqz	a0,814 <play_music_with_controls+0x31c>
     768:	00000097          	auipc	ra,0x0
     76c:	9f4080e7          	jalr	-1548(ra) # 15c <play_click_noise>
     770:	00000413          	li	s0,0
     774:	00412503          	lw	a0,4(sp)
     778:	00005097          	auipc	ra,0x5
     77c:	93c080e7          	jalr	-1732(ra) # 50b4 <fl_fclose>
     780:	00000097          	auipc	ra,0x0
     784:	960080e7          	jalr	-1696(ra) # e0 <clear_audio>
     788:	000067b7          	lui	a5,0x6
     78c:	bc07a783          	lw	a5,-1088(a5) # 5bc0 <LEDS>
     790:	0007a023          	sw	zero,0(a5)
     794:	e75ff06f          	j	608 <play_music_with_controls+0x110>
     798:	000a8413          	mv	s0,s5
     79c:	f3dff06f          	j	6d8 <play_music_with_controls+0x1e0>
     7a0:	00412683          	lw	a3,4(sp)
     7a4:	20000613          	li	a2,512
     7a8:	00100593          	li	a1,1
     7ac:	000d0513          	mv	a0,s10
     7b0:	00005097          	auipc	ra,0x5
     7b4:	9e0080e7          	jalr	-1568(ra) # 5190 <fl_fread>
     7b8:	00050793          	mv	a5,a0
     7bc:	00ab4c63          	blt	s6,a0,7d4 <play_music_with_controls+0x2dc>
     7c0:	00050713          	mv	a4,a0
     7c4:	00ed06b3          	add	a3,s10,a4
     7c8:	00068023          	sb	zero,0(a3)
     7cc:	00170713          	addi	a4,a4,1
     7d0:	ff771ae3          	bne	a4,s7,7c4 <play_music_with_controls+0x2cc>
     7d4:	20000593          	li	a1,512
     7d8:	000d0513          	mv	a0,s10
     7dc:	00f12623          	sw	a5,12(sp)
     7e0:	00000097          	auipc	ra,0x0
     7e4:	c70080e7          	jalr	-912(ra) # 450 <update_led_dance>
     7e8:	20000613          	li	a2,512
     7ec:	000d0593          	mv	a1,s10
     7f0:	000a8513          	mv	a0,s5
     7f4:	00000097          	auipc	ra,0x0
     7f8:	8c8080e7          	jalr	-1848(ra) # bc <memcpy_custom>
     7fc:	00c12783          	lw	a5,12(sp)
     800:	000da703          	lw	a4,0(s11)
     804:	feea8ee3          	beq	s5,a4,800 <play_music_with_controls+0x308>
     808:	06fb5263          	bge	s6,a5,86c <play_music_with_controls+0x374>
     80c:	00f484b3          	add	s1,s1,a5
     810:	eedff06f          	j	6fc <play_music_with_controls+0x204>
     814:	00447793          	andi	a5,s0,4
     818:	04078263          	beqz	a5,85c <play_music_with_controls+0x364>
     81c:	00194913          	xori	s2,s2,1
     820:	03405263          	blez	s4,844 <play_music_with_controls+0x34c>
     824:	00149513          	slli	a0,s1,0x1
     828:	00950533          	add	a0,a0,s1
     82c:	00351513          	slli	a0,a0,0x3
     830:	00950533          	add	a0,a0,s1
     834:	000a0593          	mv	a1,s4
     838:	00251513          	slli	a0,a0,0x2
     83c:	00001097          	auipc	ra,0x1
     840:	6f4080e7          	jalr	1780(ra) # 1f30 <__divsi3>
     844:	00012603          	lw	a2,0(sp)
     848:	00090593          	mv	a1,s2
     84c:	00000097          	auipc	ra,0x0
     850:	a10080e7          	jalr	-1520(ra) # 25c <update_player_ui>
     854:	00002097          	auipc	ra,0x2
     858:	c2c080e7          	jalr	-980(ra) # 2480 <display_refresh>
     85c:	00847793          	andi	a5,s0,8
     860:	00079a63          	bnez	a5,874 <play_music_with_controls+0x37c>
     864:	01047413          	andi	s0,s0,16
     868:	f20408e3          	beqz	s0,798 <play_music_with_controls+0x2a0>
     86c:	00100413          	li	s0,1
     870:	f05ff06f          	j	774 <play_music_with_controls+0x27c>
     874:	fff00413          	li	s0,-1
     878:	efdff06f          	j	774 <play_music_with_controls+0x27c>

0000087c <view_image_file>:
     87c:	000065b7          	lui	a1,0x6
     880:	ff010113          	addi	sp,sp,-16
     884:	bc458593          	addi	a1,a1,-1084 # 5bc4 <LEDS+0x4>
     888:	00112623          	sw	ra,12(sp)
     88c:	00812423          	sw	s0,8(sp)
     890:	00005097          	auipc	ra,0x5
     894:	f04080e7          	jalr	-252(ra) # 5794 <fl_fopen>
     898:	0a050263          	beqz	a0,93c <view_image_file+0xc0>
     89c:	00050413          	mv	s0,a0
     8a0:	00002097          	auipc	ra,0x2
     8a4:	a64080e7          	jalr	-1436(ra) # 2304 <display_framebuffer>
     8a8:	00040693          	mv	a3,s0
     8ac:	00004637          	lui	a2,0x4
     8b0:	00100593          	li	a1,1
     8b4:	00005097          	auipc	ra,0x5
     8b8:	8dc080e7          	jalr	-1828(ra) # 5190 <fl_fread>
     8bc:	00040513          	mv	a0,s0
     8c0:	00004097          	auipc	ra,0x4
     8c4:	7f4080e7          	jalr	2036(ra) # 50b4 <fl_fclose>
     8c8:	00002097          	auipc	ra,0x2
     8cc:	bb8080e7          	jalr	-1096(ra) # 2480 <display_refresh>
     8d0:	000066b7          	lui	a3,0x6
     8d4:	bb06a783          	lw	a5,-1104(a3) # 5bb0 <BUTTONS>
     8d8:	0007a703          	lw	a4,0(a5)
     8dc:	000027b7          	lui	a5,0x2
     8e0:	71078793          	addi	a5,a5,1808 # 2710 <printf+0x124>
     8e4:	00000013          	nop
     8e8:	fff78793          	addi	a5,a5,-1
     8ec:	fe079ce3          	bnez	a5,8e4 <view_image_file+0x68>
     8f0:	bb06a683          	lw	a3,-1104(a3)
     8f4:	fff74793          	not	a5,a4
     8f8:	0006a703          	lw	a4,0(a3)
     8fc:	00e7f7b3          	and	a5,a5,a4
     900:	0067f793          	andi	a5,a5,6
     904:	fe0788e3          	beqz	a5,8f4 <view_image_file+0x78>
     908:	00000097          	auipc	ra,0x0
     90c:	854080e7          	jalr	-1964(ra) # 15c <play_click_noise>
     910:	00002097          	auipc	ra,0x2
     914:	9f4080e7          	jalr	-1548(ra) # 2304 <display_framebuffer>
     918:	00004637          	lui	a2,0x4
     91c:	00000593          	li	a1,0
     920:	00001097          	auipc	ra,0x1
     924:	6c4080e7          	jalr	1732(ra) # 1fe4 <memset>
     928:	00812403          	lw	s0,8(sp)
     92c:	00c12083          	lw	ra,12(sp)
     930:	01010113          	addi	sp,sp,16
     934:	00002317          	auipc	t1,0x2
     938:	b4c30067          	jr	-1204(t1) # 2480 <display_refresh>
     93c:	00c12083          	lw	ra,12(sp)
     940:	00812403          	lw	s0,8(sp)
     944:	01010113          	addi	sp,sp,16
     948:	00008067          	ret

0000094c <scan_files>:
     94c:	fd010113          	addi	sp,sp,-48
     950:	02912223          	sw	s1,36(sp)
     954:	000064b7          	lui	s1,0x6
     958:	02812423          	sw	s0,40(sp)
     95c:	00050593          	mv	a1,a0
     960:	00006437          	lui	s0,0x6
     964:	f5448513          	addi	a0,s1,-172 # 5f54 <current_path>
     968:	02112623          	sw	ra,44(sp)
     96c:	03212023          	sw	s2,32(sp)
     970:	01312e23          	sw	s3,28(sp)
     974:	01412c23          	sw	s4,24(sp)
     978:	01512a23          	sw	s5,20(sp)
     97c:	01612823          	sw	s6,16(sp)
     980:	01712623          	sw	s7,12(sp)
     984:	14042623          	sw	zero,332(s0) # 614c <n_items>
     988:	fffff097          	auipc	ra,0xfffff
     98c:	694080e7          	jalr	1684(ra) # 1c <strcmp>
     990:	06050e63          	beqz	a0,a0c <scan_files+0xc0>
     994:	00006937          	lui	s2,0x6
     998:	06400613          	li	a2,100
     99c:	00000593          	li	a1,0
     9a0:	29890513          	addi	a0,s2,664 # 6298 <files>
     9a4:	00001097          	auipc	ra,0x1
     9a8:	640080e7          	jalr	1600(ra) # 1fe4 <memset>
     9ac:	14c42783          	lw	a5,332(s0)
     9b0:	29890913          	addi	s2,s2,664
     9b4:	000065b7          	lui	a1,0x6
     9b8:	00379513          	slli	a0,a5,0x3
     9bc:	40f50533          	sub	a0,a0,a5
     9c0:	00251513          	slli	a0,a0,0x2
     9c4:	40f50533          	sub	a0,a0,a5
     9c8:	00251513          	slli	a0,a0,0x2
     9cc:	00a90533          	add	a0,s2,a0
     9d0:	c0c58593          	addi	a1,a1,-1012 # 5c0c <LEDS+0x4c>
     9d4:	00001097          	auipc	ra,0x1
     9d8:	6d4080e7          	jalr	1748(ra) # 20a8 <strcpy>
     9dc:	14c42703          	lw	a4,332(s0)
     9e0:	00371793          	slli	a5,a4,0x3
     9e4:	40e787b3          	sub	a5,a5,a4
     9e8:	00279793          	slli	a5,a5,0x2
     9ec:	40e787b3          	sub	a5,a5,a4
     9f0:	00279793          	slli	a5,a5,0x2
     9f4:	00f90933          	add	s2,s2,a5
     9f8:	00100793          	li	a5,1
     9fc:	00f70733          	add	a4,a4,a5
     a00:	06092223          	sw	zero,100(s2)
     a04:	06f92423          	sw	a5,104(s2)
     a08:	14e42623          	sw	a4,332(s0)
     a0c:	000069b7          	lui	s3,0x6
     a10:	28c98593          	addi	a1,s3,652 # 628c <dirstat.1>
     a14:	f5448513          	addi	a0,s1,-172
     a18:	00003097          	auipc	ra,0x3
     a1c:	71c080e7          	jalr	1820(ra) # 4134 <fl_opendir>
     a20:	14050063          	beqz	a0,b60 <scan_files+0x214>
     a24:	00006937          	lui	s2,0x6
     a28:	000067b7          	lui	a5,0x6
     a2c:	000064b7          	lui	s1,0x6
     a30:	c1078b93          	addi	s7,a5,-1008 # 5c10 <LEDS+0x50>
     a34:	29848493          	addi	s1,s1,664 # 6298 <files>
     a38:	17c90a13          	addi	s4,s2,380 # 617c <dirent.0>
     a3c:	17c90593          	addi	a1,s2,380
     a40:	28c98513          	addi	a0,s3,652
     a44:	00004097          	auipc	ra,0x4
     a48:	dbc080e7          	jalr	-580(ra) # 4800 <fl_readdir>
     a4c:	00050a93          	mv	s5,a0
     a50:	00051863          	bnez	a0,a60 <scan_files+0x114>
     a54:	14c42b03          	lw	s6,332(s0)
     a58:	03f00793          	li	a5,63
     a5c:	0367dc63          	bge	a5,s6,a94 <scan_files+0x148>
     a60:	02812403          	lw	s0,40(sp)
     a64:	02c12083          	lw	ra,44(sp)
     a68:	02412483          	lw	s1,36(sp)
     a6c:	02012903          	lw	s2,32(sp)
     a70:	01812a03          	lw	s4,24(sp)
     a74:	01412a83          	lw	s5,20(sp)
     a78:	01012b03          	lw	s6,16(sp)
     a7c:	00c12b83          	lw	s7,12(sp)
     a80:	28c98513          	addi	a0,s3,652
     a84:	01c12983          	lw	s3,28(sp)
     a88:	03010113          	addi	sp,sp,48
     a8c:	00002317          	auipc	t1,0x2
     a90:	29030067          	jr	656(t1) # 2d1c <fl_closedir>
     a94:	000b8593          	mv	a1,s7
     a98:	17c90513          	addi	a0,s2,380
     a9c:	fffff097          	auipc	ra,0xfffff
     aa0:	580080e7          	jalr	1408(ra) # 1c <strcmp>
     aa4:	f8050ce3          	beqz	a0,a3c <scan_files+0xf0>
     aa8:	000065b7          	lui	a1,0x6
     aac:	c0c58593          	addi	a1,a1,-1012 # 5c0c <LEDS+0x4c>
     ab0:	17c90513          	addi	a0,s2,380
     ab4:	fffff097          	auipc	ra,0xfffff
     ab8:	568080e7          	jalr	1384(ra) # 1c <strcmp>
     abc:	f80500e3          	beqz	a0,a3c <scan_files+0xf0>
     ac0:	003b1513          	slli	a0,s6,0x3
     ac4:	41650533          	sub	a0,a0,s6
     ac8:	00251513          	slli	a0,a0,0x2
     acc:	41650533          	sub	a0,a0,s6
     ad0:	00251513          	slli	a0,a0,0x2
     ad4:	06400613          	li	a2,100
     ad8:	00000593          	li	a1,0
     adc:	00a48533          	add	a0,s1,a0
     ae0:	00001097          	auipc	ra,0x1
     ae4:	504080e7          	jalr	1284(ra) # 1fe4 <memset>
     ae8:	14c42703          	lw	a4,332(s0)
     aec:	06300513          	li	a0,99
     af0:	00371793          	slli	a5,a4,0x3
     af4:	40e786b3          	sub	a3,a5,a4
     af8:	00269693          	slli	a3,a3,0x2
     afc:	40e686b3          	sub	a3,a3,a4
     b00:	00269693          	slli	a3,a3,0x2
     b04:	014a8633          	add	a2,s5,s4
     b08:	00064583          	lbu	a1,0(a2) # 4000 <fatfs_get_file_entry+0x1ac>
     b0c:	00058463          	beqz	a1,b14 <scan_files+0x1c8>
     b10:	02aa9e63          	bne	s5,a0,b4c <scan_files+0x200>
     b14:	40e787b3          	sub	a5,a5,a4
     b18:	00279793          	slli	a5,a5,0x2
     b1c:	10ca2683          	lw	a3,268(s4)
     b20:	40e787b3          	sub	a5,a5,a4
     b24:	00279793          	slli	a5,a5,0x2
     b28:	00f487b3          	add	a5,s1,a5
     b2c:	06d7a223          	sw	a3,100(a5)
     b30:	104a4683          	lbu	a3,260(s4)
     b34:	01578ab3          	add	s5,a5,s5
     b38:	00170713          	addi	a4,a4,1
     b3c:	000a8023          	sb	zero,0(s5)
     b40:	06d7a423          	sw	a3,104(a5)
     b44:	14e42623          	sw	a4,332(s0)
     b48:	ef5ff06f          	j	a3c <scan_files+0xf0>
     b4c:	00da8633          	add	a2,s5,a3
     b50:	00c48633          	add	a2,s1,a2
     b54:	00b60023          	sb	a1,0(a2)
     b58:	001a8a93          	addi	s5,s5,1
     b5c:	fa9ff06f          	j	b04 <scan_files+0x1b8>
     b60:	02c12083          	lw	ra,44(sp)
     b64:	02812403          	lw	s0,40(sp)
     b68:	02412483          	lw	s1,36(sp)
     b6c:	02012903          	lw	s2,32(sp)
     b70:	01c12983          	lw	s3,28(sp)
     b74:	01812a03          	lw	s4,24(sp)
     b78:	01412a83          	lw	s5,20(sp)
     b7c:	01012b03          	lw	s6,16(sp)
     b80:	00c12b83          	lw	s7,12(sp)
     b84:	03010113          	addi	sp,sp,48
     b88:	00008067          	ret

00000b8c <go_up_directory>:
     b8c:	ff010113          	addi	sp,sp,-16
     b90:	00812423          	sw	s0,8(sp)
     b94:	00006437          	lui	s0,0x6
     b98:	00112623          	sw	ra,12(sp)
     b9c:	00000793          	li	a5,0
     ba0:	f5440513          	addi	a0,s0,-172 # 5f54 <current_path>
     ba4:	00a78733          	add	a4,a5,a0
     ba8:	00074683          	lbu	a3,0(a4)
     bac:	02069a63          	bnez	a3,be0 <go_up_directory+0x54>
     bb0:	00100693          	li	a3,1
     bb4:	02f6da63          	bge	a3,a5,be8 <go_up_directory+0x5c>
     bb8:	02f00593          	li	a1,47
     bbc:	fe070fa3          	sb	zero,-1(a4)
     bc0:	fffff097          	auipc	ra,0xfffff
     bc4:	480080e7          	jalr	1152(ra) # 40 <strrchr>
     bc8:	02050063          	beqz	a0,be8 <go_up_directory+0x5c>
     bcc:	000500a3          	sb	zero,1(a0)
     bd0:	00c12083          	lw	ra,12(sp)
     bd4:	00812403          	lw	s0,8(sp)
     bd8:	01010113          	addi	sp,sp,16
     bdc:	00008067          	ret
     be0:	00178793          	addi	a5,a5,1
     be4:	fc1ff06f          	j	ba4 <go_up_directory+0x18>
     be8:	f5440513          	addi	a0,s0,-172
     bec:	00812403          	lw	s0,8(sp)
     bf0:	00c12083          	lw	ra,12(sp)
     bf4:	000065b7          	lui	a1,0x6
     bf8:	c1458593          	addi	a1,a1,-1004 # 5c14 <LEDS+0x54>
     bfc:	01010113          	addi	sp,sp,16
     c00:	00001317          	auipc	t1,0x1
     c04:	4a830067          	jr	1192(t1) # 20a8 <strcpy>

00000c08 <build_full_path>:
     c08:	ff010113          	addi	sp,sp,-16
     c0c:	00912223          	sw	s1,4(sp)
     c10:	00058493          	mv	s1,a1
     c14:	000065b7          	lui	a1,0x6
     c18:	f5458593          	addi	a1,a1,-172 # 5f54 <current_path>
     c1c:	00812423          	sw	s0,8(sp)
     c20:	00112623          	sw	ra,12(sp)
     c24:	00050413          	mv	s0,a0
     c28:	00001097          	auipc	ra,0x1
     c2c:	480080e7          	jalr	1152(ra) # 20a8 <strcpy>
     c30:	00044783          	lbu	a5,0(s0)
     c34:	02079263          	bnez	a5,c58 <build_full_path+0x50>
     c38:	0004c783          	lbu	a5,0(s1)
     c3c:	02079263          	bnez	a5,c60 <build_full_path+0x58>
     c40:	00040023          	sb	zero,0(s0)
     c44:	00c12083          	lw	ra,12(sp)
     c48:	00812403          	lw	s0,8(sp)
     c4c:	00412483          	lw	s1,4(sp)
     c50:	01010113          	addi	sp,sp,16
     c54:	00008067          	ret
     c58:	00140413          	addi	s0,s0,1
     c5c:	fd5ff06f          	j	c30 <build_full_path+0x28>
     c60:	00140413          	addi	s0,s0,1
     c64:	00148493          	addi	s1,s1,1
     c68:	fef40fa3          	sb	a5,-1(s0)
     c6c:	fcdff06f          	j	c38 <build_full_path+0x30>

00000c70 <file_explorer>:
     c70:	da010113          	addi	sp,sp,-608
     c74:	24912a23          	sw	s1,596(sp)
     c78:	25512223          	sw	s5,580(sp)
     c7c:	000064b7          	lui	s1,0x6
     c80:	00006ab7          	lui	s5,0x6
     c84:	c14a8593          	addi	a1,s5,-1004 # 5c14 <LEDS+0x54>
     c88:	f5448513          	addi	a0,s1,-172 # 5f54 <current_path>
     c8c:	24112e23          	sw	ra,604(sp)
     c90:	24812c23          	sw	s0,600(sp)
     c94:	25212823          	sw	s2,592(sp)
     c98:	25312623          	sw	s3,588(sp)
     c9c:	23812c23          	sw	s8,568(sp)
     ca0:	23a12823          	sw	s10,560(sp)
     ca4:	25412423          	sw	s4,584(sp)
     ca8:	25612023          	sw	s6,576(sp)
     cac:	23712e23          	sw	s7,572(sp)
     cb0:	23912a23          	sw	s9,564(sp)
     cb4:	23b12623          	sw	s11,556(sp)
     cb8:	00001097          	auipc	ra,0x1
     cbc:	3f0080e7          	jalr	1008(ra) # 20a8 <strcpy>
     cc0:	c14a8513          	addi	a0,s5,-1004
     cc4:	00000097          	auipc	ra,0x0
     cc8:	c88080e7          	jalr	-888(ra) # 94c <scan_files>
     ccc:	000067b7          	lui	a5,0x6
     cd0:	c1878793          	addi	a5,a5,-1000 # 5c18 <LEDS+0x58>
     cd4:	00f12e23          	sw	a5,28(sp)
     cd8:	f5448793          	addi	a5,s1,-172
     cdc:	00f12623          	sw	a5,12(sp)
     ce0:	000067b7          	lui	a5,0x6
     ce4:	bb07a783          	lw	a5,-1104(a5) # 5bb0 <BUTTONS>
     ce8:	00000c13          	li	s8,0
     cec:	00000993          	li	s3,0
     cf0:	00000913          	li	s2,0
     cf4:	00000413          	li	s0,0
     cf8:	01200d13          	li	s10,18
     cfc:	00f12823          	sw	a5,16(sp)
     d00:	00000593          	li	a1,0
     d04:	00000513          	li	a0,0
     d08:	00001097          	auipc	ra,0x1
     d0c:	608080e7          	jalr	1544(ra) # 2310 <display_set_cursor>
     d10:	0ffc7593          	zext.b	a1,s8
     d14:	07f58513          	addi	a0,a1,127
     d18:	0ff57513          	zext.b	a0,a0
     d1c:	00001097          	auipc	ra,0x1
     d20:	608080e7          	jalr	1544(ra) # 2324 <display_set_front_back_color>
     d24:	01c12503          	lw	a0,28(sp)
     d28:	00000493          	li	s1,0
     d2c:	00006bb7          	lui	s7,0x6
     d30:	00002097          	auipc	ra,0x2
     d34:	8bc080e7          	jalr	-1860(ra) # 25ec <printf>
     d38:	00c00a13          	li	s4,12
     d3c:	00c12783          	lw	a5,12(sp)
     d40:	00f487b3          	add	a5,s1,a5
     d44:	0007c503          	lbu	a0,0(a5)
     d48:	00050a63          	beqz	a0,d5c <file_explorer+0xec>
     d4c:	160ba783          	lw	a5,352(s7) # 6160 <f_putchar>
     d50:	00148493          	addi	s1,s1,1
     d54:	000780e7          	jalr	a5
     d58:	ff4492e3          	bne	s1,s4,d3c <file_explorer+0xcc>
     d5c:	160ba783          	lw	a5,352(s7)
     d60:	00a00513          	li	a0,10
     d64:	00006db7          	lui	s11,0x6
     d68:	000780e7          	jalr	a5
     d6c:	00000593          	li	a1,0
     d70:	0ff00513          	li	a0,255
     d74:	00001097          	auipc	ra,0x1
     d78:	5b0080e7          	jalr	1456(ra) # 2324 <display_set_front_back_color>
     d7c:	14cdaa03          	lw	s4,332(s11) # 614c <n_items>
     d80:	080a0463          	beqz	s4,e08 <file_explorer+0x198>
     d84:	412a0a33          	sub	s4,s4,s2
     d88:	00c00793          	li	a5,12
     d8c:	0147d463          	bge	a5,s4,d94 <file_explorer+0x124>
     d90:	00078a13          	mv	s4,a5
     d94:	00391493          	slli	s1,s2,0x3
     d98:	412484b3          	sub	s1,s1,s2
     d9c:	00249493          	slli	s1,s1,0x2
     da0:	412484b3          	sub	s1,s1,s2
     da4:	000067b7          	lui	a5,0x6
     da8:	29878793          	addi	a5,a5,664 # 6298 <files>
     dac:	00249493          	slli	s1,s1,0x2
     db0:	00f484b3          	add	s1,s1,a5
     db4:	000067b7          	lui	a5,0x6
     db8:	c3478793          	addi	a5,a5,-972 # 5c34 <LEDS+0x74>
     dbc:	00f12a23          	sw	a5,20(sp)
     dc0:	000067b7          	lui	a5,0x6
     dc4:	c2c78793          	addi	a5,a5,-980 # 5c2c <LEDS+0x6c>
     dc8:	00000b13          	li	s6,0
     dcc:	00f12c23          	sw	a5,24(sp)
     dd0:	194b4863          	blt	s6,s4,f60 <file_explorer+0x2f0>
     dd4:	00000593          	li	a1,0
     dd8:	00000513          	li	a0,0
     ddc:	000064b7          	lui	s1,0x6
     de0:	00001097          	auipc	ra,0x1
     de4:	544080e7          	jalr	1348(ra) # 2324 <display_set_front_back_color>
     de8:	00c00b13          	li	s6,12
     dec:	c3c48493          	addi	s1,s1,-964 # 5c3c <LEDS+0x7c>
     df0:	036a0463          	beq	s4,s6,e18 <file_explorer+0x1a8>
     df4:	00048513          	mv	a0,s1
     df8:	00001097          	auipc	ra,0x1
     dfc:	7f4080e7          	jalr	2036(ra) # 25ec <printf>
     e00:	001a0a13          	addi	s4,s4,1
     e04:	fedff06f          	j	df0 <file_explorer+0x180>
     e08:	00006537          	lui	a0,0x6
     e0c:	c2450513          	addi	a0,a0,-988 # 5c24 <LEDS+0x64>
     e10:	00001097          	auipc	ra,0x1
     e14:	7dc080e7          	jalr	2012(ra) # 25ec <printf>
     e18:	00001097          	auipc	ra,0x1
     e1c:	668080e7          	jalr	1640(ra) # 2480 <display_refresh>
     e20:	01012783          	lw	a5,16(sp)
     e24:	fff9c993          	not	s3,s3
     e28:	0007aa03          	lw	s4,0(a5)
     e2c:	0149f9b3          	and	s3,s3,s4
     e30:	0109f793          	andi	a5,s3,16
     e34:	00078863          	beqz	a5,e44 <file_explorer+0x1d4>
     e38:	00140413          	addi	s0,s0,1
     e3c:	fffff097          	auipc	ra,0xfffff
     e40:	320080e7          	jalr	800(ra) # 15c <play_click_noise>
     e44:	0089f793          	andi	a5,s3,8
     e48:	00078863          	beqz	a5,e58 <file_explorer+0x1e8>
     e4c:	fff40413          	addi	s0,s0,-1
     e50:	fffff097          	auipc	ra,0xfffff
     e54:	30c080e7          	jalr	780(ra) # 15c <play_click_noise>
     e58:	0029f793          	andi	a5,s3,2
     e5c:	04078a63          	beqz	a5,eb0 <file_explorer+0x240>
     e60:	fffff097          	auipc	ra,0xfffff
     e64:	2fc080e7          	jalr	764(ra) # 15c <play_click_noise>
     e68:	00c12503          	lw	a0,12(sp)
     e6c:	c14a8593          	addi	a1,s5,-1004
     e70:	fffff097          	auipc	ra,0xfffff
     e74:	1ac080e7          	jalr	428(ra) # 1c <strcmp>
     e78:	22050663          	beqz	a0,10a4 <file_explorer+0x434>
     e7c:	00000097          	auipc	ra,0x0
     e80:	d10080e7          	jalr	-752(ra) # b8c <go_up_directory>
     e84:	c14a8513          	addi	a0,s5,-1004
     e88:	00000097          	auipc	ra,0x0
     e8c:	ac4080e7          	jalr	-1340(ra) # 94c <scan_files>
     e90:	00001097          	auipc	ra,0x1
     e94:	474080e7          	jalr	1140(ra) # 2304 <display_framebuffer>
     e98:	00004637          	lui	a2,0x4
     e9c:	00000593          	li	a1,0
     ea0:	00001097          	auipc	ra,0x1
     ea4:	144080e7          	jalr	324(ra) # 1fe4 <memset>
     ea8:	00000913          	li	s2,0
     eac:	00000413          	li	s0,0
     eb0:	0049f993          	andi	s3,s3,4
     eb4:	007c0c13          	addi	s8,s8,7
     eb8:	08098063          	beqz	s3,f38 <file_explorer+0x2c8>
     ebc:	00341493          	slli	s1,s0,0x3
     ec0:	408484b3          	sub	s1,s1,s0
     ec4:	fffff097          	auipc	ra,0xfffff
     ec8:	298080e7          	jalr	664(ra) # 15c <play_click_noise>
     ecc:	00249493          	slli	s1,s1,0x2
     ed0:	408484b3          	sub	s1,s1,s0
     ed4:	000067b7          	lui	a5,0x6
     ed8:	29878793          	addi	a5,a5,664 # 6298 <files>
     edc:	00249493          	slli	s1,s1,0x2
     ee0:	00f484b3          	add	s1,s1,a5
     ee4:	0684a783          	lw	a5,104(s1)
     ee8:	14078263          	beqz	a5,102c <file_explorer+0x3bc>
     eec:	000065b7          	lui	a1,0x6
     ef0:	c0c58593          	addi	a1,a1,-1012 # 5c0c <LEDS+0x4c>
     ef4:	00048513          	mv	a0,s1
     ef8:	fffff097          	auipc	ra,0xfffff
     efc:	124080e7          	jalr	292(ra) # 1c <strcmp>
     f00:	10051a63          	bnez	a0,1014 <file_explorer+0x3a4>
     f04:	00000097          	auipc	ra,0x0
     f08:	c88080e7          	jalr	-888(ra) # b8c <go_up_directory>
     f0c:	c14a8513          	addi	a0,s5,-1004
     f10:	00000097          	auipc	ra,0x0
     f14:	a3c080e7          	jalr	-1476(ra) # 94c <scan_files>
     f18:	00001097          	auipc	ra,0x1
     f1c:	3ec080e7          	jalr	1004(ra) # 2304 <display_framebuffer>
     f20:	00004637          	lui	a2,0x4
     f24:	00000593          	li	a1,0
     f28:	00001097          	auipc	ra,0x1
     f2c:	0bc080e7          	jalr	188(ra) # 1fe4 <memset>
     f30:	00000913          	li	s2,0
     f34:	00000413          	li	s0,0
     f38:	14cda783          	lw	a5,332(s11)
     f3c:	00f05e63          	blez	a5,f58 <file_explorer+0x2e8>
     f40:	14045663          	bgez	s0,108c <file_explorer+0x41c>
     f44:	fff78413          	addi	s0,a5,-1
     f48:	15244a63          	blt	s0,s2,109c <file_explorer+0x42c>
     f4c:	00b90793          	addi	a5,s2,11
     f50:	0087d463          	bge	a5,s0,f58 <file_explorer+0x2e8>
     f54:	ff540913          	addi	s2,s0,-11
     f58:	000a0993          	mv	s3,s4
     f5c:	da5ff06f          	j	d00 <file_explorer+0x90>
     f60:	012b0cb3          	add	s9,s6,s2
     f64:	07941463          	bne	s0,s9,fcc <file_explorer+0x35c>
     f68:	0ff00593          	li	a1,255
     f6c:	00000513          	li	a0,0
     f70:	00001097          	auipc	ra,0x1
     f74:	3b4080e7          	jalr	948(ra) # 2324 <display_set_front_back_color>
     f78:	0684a783          	lw	a5,104(s1)
     f7c:	000c8593          	mv	a1,s9
     f80:	04078c63          	beqz	a5,fd8 <file_explorer+0x368>
     f84:	01812503          	lw	a0,24(sp)
     f88:	00001097          	auipc	ra,0x1
     f8c:	664080e7          	jalr	1636(ra) # 25ec <printf>
     f90:	00000c93          	li	s9,0
     f94:	019487b3          	add	a5,s1,s9
     f98:	0007c503          	lbu	a0,0(a5)
     f9c:	00050a63          	beqz	a0,fb0 <file_explorer+0x340>
     fa0:	160ba783          	lw	a5,352(s7)
     fa4:	001c8c93          	addi	s9,s9,1
     fa8:	000780e7          	jalr	a5
     fac:	ffac94e3          	bne	s9,s10,f94 <file_explorer+0x324>
     fb0:	160ba783          	lw	a5,352(s7)
     fb4:	03ac9663          	bne	s9,s10,fe0 <file_explorer+0x370>
     fb8:	00a00513          	li	a0,10
     fbc:	000780e7          	jalr	a5
     fc0:	001b0b13          	addi	s6,s6,1
     fc4:	06c48493          	addi	s1,s1,108
     fc8:	e09ff06f          	j	dd0 <file_explorer+0x160>
     fcc:	00000593          	li	a1,0
     fd0:	0ff00513          	li	a0,255
     fd4:	f9dff06f          	j	f70 <file_explorer+0x300>
     fd8:	01412503          	lw	a0,20(sp)
     fdc:	fadff06f          	j	f88 <file_explorer+0x318>
     fe0:	02000513          	li	a0,32
     fe4:	000780e7          	jalr	a5
     fe8:	001c8c93          	addi	s9,s9,1
     fec:	fc5ff06f          	j	fb0 <file_explorer+0x340>
     ff0:	00178793          	addi	a5,a5,1
     ff4:	0007c703          	lbu	a4,0(a5)
     ff8:	fe071ce3          	bnez	a4,ff0 <file_explorer+0x380>
     ffc:	0004c703          	lbu	a4,0(s1)
    1000:	00071e63          	bnez	a4,101c <file_explorer+0x3ac>
    1004:	02f00713          	li	a4,47
    1008:	00e78023          	sb	a4,0(a5)
    100c:	000780a3          	sb	zero,1(a5)
    1010:	efdff06f          	j	f0c <file_explorer+0x29c>
    1014:	00c12783          	lw	a5,12(sp)
    1018:	fddff06f          	j	ff4 <file_explorer+0x384>
    101c:	00178793          	addi	a5,a5,1
    1020:	00148493          	addi	s1,s1,1
    1024:	fee78fa3          	sb	a4,-1(a5)
    1028:	fd5ff06f          	j	ffc <file_explorer+0x38c>
    102c:	00048593          	mv	a1,s1
    1030:	02c10513          	addi	a0,sp,44
    1034:	00000097          	auipc	ra,0x0
    1038:	bd4080e7          	jalr	-1068(ra) # c08 <build_full_path>
    103c:	0644a603          	lw	a2,100(s1)
    1040:	000047b7          	lui	a5,0x4
    1044:	02f61a63          	bne	a2,a5,1078 <file_explorer+0x408>
    1048:	02c10513          	addi	a0,sp,44
    104c:	00000097          	auipc	ra,0x0
    1050:	830080e7          	jalr	-2000(ra) # 87c <view_image_file>
    1054:	00001097          	auipc	ra,0x1
    1058:	2b0080e7          	jalr	688(ra) # 2304 <display_framebuffer>
    105c:	00004637          	lui	a2,0x4
    1060:	00000593          	li	a1,0
    1064:	00001097          	auipc	ra,0x1
    1068:	f80080e7          	jalr	-128(ra) # 1fe4 <memset>
    106c:	01012783          	lw	a5,16(sp)
    1070:	0007a783          	lw	a5,0(a5) # 4000 <fatfs_get_file_entry+0x1ac>
    1074:	ec5ff06f          	j	f38 <file_explorer+0x2c8>
    1078:	00048593          	mv	a1,s1
    107c:	02c10513          	addi	a0,sp,44
    1080:	fffff097          	auipc	ra,0xfffff
    1084:	478080e7          	jalr	1144(ra) # 4f8 <play_music_with_controls>
    1088:	fcdff06f          	j	1054 <file_explorer+0x3e4>
    108c:	00f427b3          	slt	a5,s0,a5
    1090:	40f007b3          	neg	a5,a5
    1094:	00f47433          	and	s0,s0,a5
    1098:	eb1ff06f          	j	f48 <file_explorer+0x2d8>
    109c:	00040913          	mv	s2,s0
    10a0:	eb9ff06f          	j	f58 <file_explorer+0x2e8>
    10a4:	25c12083          	lw	ra,604(sp)
    10a8:	25812403          	lw	s0,600(sp)
    10ac:	25412483          	lw	s1,596(sp)
    10b0:	25012903          	lw	s2,592(sp)
    10b4:	24c12983          	lw	s3,588(sp)
    10b8:	24812a03          	lw	s4,584(sp)
    10bc:	24412a83          	lw	s5,580(sp)
    10c0:	24012b03          	lw	s6,576(sp)
    10c4:	23c12b83          	lw	s7,572(sp)
    10c8:	23812c03          	lw	s8,568(sp)
    10cc:	23412c83          	lw	s9,564(sp)
    10d0:	23012d03          	lw	s10,560(sp)
    10d4:	22c12d83          	lw	s11,556(sp)
    10d8:	26010113          	addi	sp,sp,608
    10dc:	00008067          	ret

000010e0 <music_player>:
    10e0:	da010113          	addi	sp,sp,-608
    10e4:	24912a23          	sw	s1,596(sp)
    10e8:	25512223          	sw	s5,580(sp)
    10ec:	000064b7          	lui	s1,0x6
    10f0:	00006ab7          	lui	s5,0x6
    10f4:	c54a8593          	addi	a1,s5,-940 # 5c54 <LEDS+0x94>
    10f8:	f5448513          	addi	a0,s1,-172 # 5f54 <current_path>
    10fc:	24112e23          	sw	ra,604(sp)
    1100:	24812c23          	sw	s0,600(sp)
    1104:	25212823          	sw	s2,592(sp)
    1108:	25312623          	sw	s3,588(sp)
    110c:	23912a23          	sw	s9,564(sp)
    1110:	23b12623          	sw	s11,556(sp)
    1114:	25412423          	sw	s4,584(sp)
    1118:	25612023          	sw	s6,576(sp)
    111c:	23712e23          	sw	s7,572(sp)
    1120:	23812c23          	sw	s8,568(sp)
    1124:	23a12823          	sw	s10,560(sp)
    1128:	00001097          	auipc	ra,0x1
    112c:	f80080e7          	jalr	-128(ra) # 20a8 <strcpy>
    1130:	c54a8513          	addi	a0,s5,-940
    1134:	00000097          	auipc	ra,0x0
    1138:	818080e7          	jalr	-2024(ra) # 94c <scan_files>
    113c:	000067b7          	lui	a5,0x6
    1140:	c6078793          	addi	a5,a5,-928 # 5c60 <LEDS+0xa0>
    1144:	00f12e23          	sw	a5,28(sp)
    1148:	f5448793          	addi	a5,s1,-172
    114c:	00f12623          	sw	a5,12(sp)
    1150:	000067b7          	lui	a5,0x6
    1154:	bb07a783          	lw	a5,-1104(a5) # 5bb0 <BUTTONS>
    1158:	00000c93          	li	s9,0
    115c:	00000993          	li	s3,0
    1160:	00000913          	li	s2,0
    1164:	00000413          	li	s0,0
    1168:	01200d93          	li	s11,18
    116c:	00f12823          	sw	a5,16(sp)
    1170:	00000593          	li	a1,0
    1174:	00000513          	li	a0,0
    1178:	00001097          	auipc	ra,0x1
    117c:	198080e7          	jalr	408(ra) # 2310 <display_set_cursor>
    1180:	0ffcf593          	zext.b	a1,s9
    1184:	07f58513          	addi	a0,a1,127
    1188:	0ff57513          	zext.b	a0,a0
    118c:	00001097          	auipc	ra,0x1
    1190:	198080e7          	jalr	408(ra) # 2324 <display_set_front_back_color>
    1194:	01c12503          	lw	a0,28(sp)
    1198:	00000493          	li	s1,0
    119c:	00006c37          	lui	s8,0x6
    11a0:	00001097          	auipc	ra,0x1
    11a4:	44c080e7          	jalr	1100(ra) # 25ec <printf>
    11a8:	00c00a13          	li	s4,12
    11ac:	00c12783          	lw	a5,12(sp)
    11b0:	00f487b3          	add	a5,s1,a5
    11b4:	0007c503          	lbu	a0,0(a5)
    11b8:	00050a63          	beqz	a0,11cc <music_player+0xec>
    11bc:	160c2783          	lw	a5,352(s8) # 6160 <f_putchar>
    11c0:	00148493          	addi	s1,s1,1
    11c4:	000780e7          	jalr	a5
    11c8:	ff4492e3          	bne	s1,s4,11ac <music_player+0xcc>
    11cc:	160c2783          	lw	a5,352(s8)
    11d0:	00a00513          	li	a0,10
    11d4:	00006b37          	lui	s6,0x6
    11d8:	000780e7          	jalr	a5
    11dc:	00000593          	li	a1,0
    11e0:	0ff00513          	li	a0,255
    11e4:	00001097          	auipc	ra,0x1
    11e8:	140080e7          	jalr	320(ra) # 2324 <display_set_front_back_color>
    11ec:	14cb2a03          	lw	s4,332(s6) # 614c <n_items>
    11f0:	080a0463          	beqz	s4,1278 <music_player+0x198>
    11f4:	412a0a33          	sub	s4,s4,s2
    11f8:	00c00793          	li	a5,12
    11fc:	0147d463          	bge	a5,s4,1204 <music_player+0x124>
    1200:	00078a13          	mv	s4,a5
    1204:	00391493          	slli	s1,s2,0x3
    1208:	412484b3          	sub	s1,s1,s2
    120c:	00249493          	slli	s1,s1,0x2
    1210:	412484b3          	sub	s1,s1,s2
    1214:	000067b7          	lui	a5,0x6
    1218:	29878793          	addi	a5,a5,664 # 6298 <files>
    121c:	00249493          	slli	s1,s1,0x2
    1220:	00f484b3          	add	s1,s1,a5
    1224:	000067b7          	lui	a5,0x6
    1228:	c3478793          	addi	a5,a5,-972 # 5c34 <LEDS+0x74>
    122c:	00f12a23          	sw	a5,20(sp)
    1230:	000067b7          	lui	a5,0x6
    1234:	c2c78793          	addi	a5,a5,-980 # 5c2c <LEDS+0x6c>
    1238:	00000b93          	li	s7,0
    123c:	00f12c23          	sw	a5,24(sp)
    1240:	1d4bce63          	blt	s7,s4,141c <music_player+0x33c>
    1244:	00000593          	li	a1,0
    1248:	00000513          	li	a0,0
    124c:	000064b7          	lui	s1,0x6
    1250:	00001097          	auipc	ra,0x1
    1254:	0d4080e7          	jalr	212(ra) # 2324 <display_set_front_back_color>
    1258:	00c00b93          	li	s7,12
    125c:	c3c48493          	addi	s1,s1,-964 # 5c3c <LEDS+0x7c>
    1260:	037a0463          	beq	s4,s7,1288 <music_player+0x1a8>
    1264:	00048513          	mv	a0,s1
    1268:	00001097          	auipc	ra,0x1
    126c:	384080e7          	jalr	900(ra) # 25ec <printf>
    1270:	001a0a13          	addi	s4,s4,1
    1274:	fedff06f          	j	1260 <music_player+0x180>
    1278:	00006537          	lui	a0,0x6
    127c:	c2450513          	addi	a0,a0,-988 # 5c24 <LEDS+0x64>
    1280:	00001097          	auipc	ra,0x1
    1284:	36c080e7          	jalr	876(ra) # 25ec <printf>
    1288:	00001097          	auipc	ra,0x1
    128c:	1f8080e7          	jalr	504(ra) # 2480 <display_refresh>
    1290:	01012783          	lw	a5,16(sp)
    1294:	fff9c993          	not	s3,s3
    1298:	0007a483          	lw	s1,0(a5)
    129c:	0099f9b3          	and	s3,s3,s1
    12a0:	0109f793          	andi	a5,s3,16
    12a4:	00078863          	beqz	a5,12b4 <music_player+0x1d4>
    12a8:	00140413          	addi	s0,s0,1
    12ac:	fffff097          	auipc	ra,0xfffff
    12b0:	eb0080e7          	jalr	-336(ra) # 15c <play_click_noise>
    12b4:	0089f793          	andi	a5,s3,8
    12b8:	00078863          	beqz	a5,12c8 <music_player+0x1e8>
    12bc:	fff40413          	addi	s0,s0,-1
    12c0:	fffff097          	auipc	ra,0xfffff
    12c4:	e9c080e7          	jalr	-356(ra) # 15c <play_click_noise>
    12c8:	0029f793          	andi	a5,s3,2
    12cc:	06078c63          	beqz	a5,1344 <music_player+0x264>
    12d0:	fffff097          	auipc	ra,0xfffff
    12d4:	e8c080e7          	jalr	-372(ra) # 15c <play_click_noise>
    12d8:	00c12503          	lw	a0,12(sp)
    12dc:	c54a8593          	addi	a1,s5,-940
    12e0:	fffff097          	auipc	ra,0xfffff
    12e4:	d3c080e7          	jalr	-708(ra) # 1c <strcmp>
    12e8:	2c050a63          	beqz	a0,15bc <music_player+0x4dc>
    12ec:	00000097          	auipc	ra,0x0
    12f0:	8a0080e7          	jalr	-1888(ra) # b8c <go_up_directory>
    12f4:	00c12503          	lw	a0,12(sp)
    12f8:	c54a8593          	addi	a1,s5,-940
    12fc:	fffff097          	auipc	ra,0xfffff
    1300:	d68080e7          	jalr	-664(ra) # 64 <starts_with>
    1304:	00051a63          	bnez	a0,1318 <music_player+0x238>
    1308:	00c12503          	lw	a0,12(sp)
    130c:	c54a8593          	addi	a1,s5,-940
    1310:	00001097          	auipc	ra,0x1
    1314:	d98080e7          	jalr	-616(ra) # 20a8 <strcpy>
    1318:	00c12503          	lw	a0,12(sp)
    131c:	00000913          	li	s2,0
    1320:	00000413          	li	s0,0
    1324:	fffff097          	auipc	ra,0xfffff
    1328:	628080e7          	jalr	1576(ra) # 94c <scan_files>
    132c:	00001097          	auipc	ra,0x1
    1330:	fd8080e7          	jalr	-40(ra) # 2304 <display_framebuffer>
    1334:	00004637          	lui	a2,0x4
    1338:	00000593          	li	a1,0
    133c:	00001097          	auipc	ra,0x1
    1340:	ca8080e7          	jalr	-856(ra) # 1fe4 <memset>
    1344:	0049f993          	andi	s3,s3,4
    1348:	007c8c93          	addi	s9,s9,7
    134c:	0a098463          	beqz	s3,13f4 <music_player+0x314>
    1350:	fffff097          	auipc	ra,0xfffff
    1354:	e0c080e7          	jalr	-500(ra) # 15c <play_click_noise>
    1358:	00341793          	slli	a5,s0,0x3
    135c:	408787b3          	sub	a5,a5,s0
    1360:	00279793          	slli	a5,a5,0x2
    1364:	00006a37          	lui	s4,0x6
    1368:	408787b3          	sub	a5,a5,s0
    136c:	298a0a13          	addi	s4,s4,664 # 6298 <files>
    1370:	00279793          	slli	a5,a5,0x2
    1374:	00fa07b3          	add	a5,s4,a5
    1378:	0687a703          	lw	a4,104(a5)
    137c:	16070663          	beqz	a4,14e8 <music_player+0x408>
    1380:	000065b7          	lui	a1,0x6
    1384:	c0c58593          	addi	a1,a1,-1012 # 5c0c <LEDS+0x4c>
    1388:	00078513          	mv	a0,a5
    138c:	00078413          	mv	s0,a5
    1390:	fffff097          	auipc	ra,0xfffff
    1394:	c8c080e7          	jalr	-884(ra) # 1c <strcmp>
    1398:	12051c63          	bnez	a0,14d0 <music_player+0x3f0>
    139c:	fffff097          	auipc	ra,0xfffff
    13a0:	7f0080e7          	jalr	2032(ra) # b8c <go_up_directory>
    13a4:	00c12503          	lw	a0,12(sp)
    13a8:	c54a8593          	addi	a1,s5,-940
    13ac:	fffff097          	auipc	ra,0xfffff
    13b0:	cb8080e7          	jalr	-840(ra) # 64 <starts_with>
    13b4:	00051a63          	bnez	a0,13c8 <music_player+0x2e8>
    13b8:	00c12503          	lw	a0,12(sp)
    13bc:	c54a8593          	addi	a1,s5,-940
    13c0:	00001097          	auipc	ra,0x1
    13c4:	ce8080e7          	jalr	-792(ra) # 20a8 <strcpy>
    13c8:	00c12503          	lw	a0,12(sp)
    13cc:	00000913          	li	s2,0
    13d0:	00000413          	li	s0,0
    13d4:	fffff097          	auipc	ra,0xfffff
    13d8:	578080e7          	jalr	1400(ra) # 94c <scan_files>
    13dc:	00001097          	auipc	ra,0x1
    13e0:	f28080e7          	jalr	-216(ra) # 2304 <display_framebuffer>
    13e4:	00004637          	lui	a2,0x4
    13e8:	00000593          	li	a1,0
    13ec:	00001097          	auipc	ra,0x1
    13f0:	bf8080e7          	jalr	-1032(ra) # 1fe4 <memset>
    13f4:	14cb2783          	lw	a5,332(s6)
    13f8:	00f05e63          	blez	a5,1414 <music_player+0x334>
    13fc:	1a045463          	bgez	s0,15a4 <music_player+0x4c4>
    1400:	fff78413          	addi	s0,a5,-1
    1404:	1b244863          	blt	s0,s2,15b4 <music_player+0x4d4>
    1408:	00b90793          	addi	a5,s2,11
    140c:	0087d463          	bge	a5,s0,1414 <music_player+0x334>
    1410:	ff540913          	addi	s2,s0,-11
    1414:	00048993          	mv	s3,s1
    1418:	d59ff06f          	j	1170 <music_player+0x90>
    141c:	012b8d33          	add	s10,s7,s2
    1420:	07a41463          	bne	s0,s10,1488 <music_player+0x3a8>
    1424:	0ff00593          	li	a1,255
    1428:	00000513          	li	a0,0
    142c:	00001097          	auipc	ra,0x1
    1430:	ef8080e7          	jalr	-264(ra) # 2324 <display_set_front_back_color>
    1434:	0684a783          	lw	a5,104(s1)
    1438:	000d0593          	mv	a1,s10
    143c:	04078c63          	beqz	a5,1494 <music_player+0x3b4>
    1440:	01812503          	lw	a0,24(sp)
    1444:	00001097          	auipc	ra,0x1
    1448:	1a8080e7          	jalr	424(ra) # 25ec <printf>
    144c:	00000d13          	li	s10,0
    1450:	01a487b3          	add	a5,s1,s10
    1454:	0007c503          	lbu	a0,0(a5)
    1458:	00050a63          	beqz	a0,146c <music_player+0x38c>
    145c:	160c2783          	lw	a5,352(s8)
    1460:	001d0d13          	addi	s10,s10,1
    1464:	000780e7          	jalr	a5
    1468:	ffbd14e3          	bne	s10,s11,1450 <music_player+0x370>
    146c:	160c2783          	lw	a5,352(s8)
    1470:	03bd1663          	bne	s10,s11,149c <music_player+0x3bc>
    1474:	00a00513          	li	a0,10
    1478:	000780e7          	jalr	a5
    147c:	001b8b93          	addi	s7,s7,1
    1480:	06c48493          	addi	s1,s1,108
    1484:	dbdff06f          	j	1240 <music_player+0x160>
    1488:	00000593          	li	a1,0
    148c:	0ff00513          	li	a0,255
    1490:	f9dff06f          	j	142c <music_player+0x34c>
    1494:	01412503          	lw	a0,20(sp)
    1498:	fadff06f          	j	1444 <music_player+0x364>
    149c:	02000513          	li	a0,32
    14a0:	000780e7          	jalr	a5
    14a4:	001d0d13          	addi	s10,s10,1
    14a8:	fc5ff06f          	j	146c <music_player+0x38c>
    14ac:	00178793          	addi	a5,a5,1
    14b0:	0007c703          	lbu	a4,0(a5)
    14b4:	fe071ce3          	bnez	a4,14ac <music_player+0x3cc>
    14b8:	00044703          	lbu	a4,0(s0)
    14bc:	00071e63          	bnez	a4,14d8 <music_player+0x3f8>
    14c0:	02f00713          	li	a4,47
    14c4:	00e78023          	sb	a4,0(a5)
    14c8:	000780a3          	sb	zero,1(a5)
    14cc:	efdff06f          	j	13c8 <music_player+0x2e8>
    14d0:	00c12783          	lw	a5,12(sp)
    14d4:	fddff06f          	j	14b0 <music_player+0x3d0>
    14d8:	00178793          	addi	a5,a5,1
    14dc:	00140413          	addi	s0,s0,1
    14e0:	fee78fa3          	sb	a4,-1(a5)
    14e4:	fd5ff06f          	j	14b8 <music_player+0x3d8>
    14e8:	00040993          	mv	s3,s0
    14ec:	00399593          	slli	a1,s3,0x3
    14f0:	413585b3          	sub	a1,a1,s3
    14f4:	00259593          	slli	a1,a1,0x2
    14f8:	413585b3          	sub	a1,a1,s3
    14fc:	00259593          	slli	a1,a1,0x2
    1500:	00ba05b3          	add	a1,s4,a1
    1504:	0685ab83          	lw	s7,104(a1)
    1508:	040b8063          	beqz	s7,1548 <music_player+0x468>
    150c:	14cb2783          	lw	a5,332(s6)
    1510:	00198993          	addi	s3,s3,1
    1514:	00f9a7b3          	slt	a5,s3,a5
    1518:	40f007b3          	neg	a5,a5
    151c:	00f9f9b3          	and	s3,s3,a5
    1520:	fd3416e3          	bne	s0,s3,14ec <music_player+0x40c>
    1524:	00001097          	auipc	ra,0x1
    1528:	de0080e7          	jalr	-544(ra) # 2304 <display_framebuffer>
    152c:	00004637          	lui	a2,0x4
    1530:	00000593          	li	a1,0
    1534:	00001097          	auipc	ra,0x1
    1538:	ab0080e7          	jalr	-1360(ra) # 1fe4 <memset>
    153c:	01012783          	lw	a5,16(sp)
    1540:	0007a783          	lw	a5,0(a5)
    1544:	eb1ff06f          	j	13f4 <music_player+0x314>
    1548:	02c10513          	addi	a0,sp,44
    154c:	00b12a23          	sw	a1,20(sp)
    1550:	fffff097          	auipc	ra,0xfffff
    1554:	6b8080e7          	jalr	1720(ra) # c08 <build_full_path>
    1558:	01412583          	lw	a1,20(sp)
    155c:	02c10513          	addi	a0,sp,44
    1560:	0645a603          	lw	a2,100(a1)
    1564:	fffff097          	auipc	ra,0xfffff
    1568:	f94080e7          	jalr	-108(ra) # 4f8 <play_music_with_controls>
    156c:	fa050ce3          	beqz	a0,1524 <music_player+0x444>
    1570:	00100793          	li	a5,1
    1574:	00f51e63          	bne	a0,a5,1590 <music_player+0x4b0>
    1578:	14cb2783          	lw	a5,332(s6)
    157c:	00a989b3          	add	s3,s3,a0
    1580:	00f9d463          	bge	s3,a5,1588 <music_player+0x4a8>
    1584:	00098b93          	mv	s7,s3
    1588:	000b8993          	mv	s3,s7
    158c:	f61ff06f          	j	14ec <music_player+0x40c>
    1590:	fff98b93          	addi	s7,s3,-1
    1594:	fe0bdae3          	bgez	s7,1588 <music_player+0x4a8>
    1598:	14cb2b83          	lw	s7,332(s6)
    159c:	fffb8b93          	addi	s7,s7,-1
    15a0:	fe9ff06f          	j	1588 <music_player+0x4a8>
    15a4:	00f427b3          	slt	a5,s0,a5
    15a8:	40f007b3          	neg	a5,a5
    15ac:	00f47433          	and	s0,s0,a5
    15b0:	e55ff06f          	j	1404 <music_player+0x324>
    15b4:	00040913          	mv	s2,s0
    15b8:	e5dff06f          	j	1414 <music_player+0x334>
    15bc:	25c12083          	lw	ra,604(sp)
    15c0:	25812403          	lw	s0,600(sp)
    15c4:	25412483          	lw	s1,596(sp)
    15c8:	25012903          	lw	s2,592(sp)
    15cc:	24c12983          	lw	s3,588(sp)
    15d0:	24812a03          	lw	s4,584(sp)
    15d4:	24412a83          	lw	s5,580(sp)
    15d8:	24012b03          	lw	s6,576(sp)
    15dc:	23c12b83          	lw	s7,572(sp)
    15e0:	23812c03          	lw	s8,568(sp)
    15e4:	23412c83          	lw	s9,564(sp)
    15e8:	23012d03          	lw	s10,560(sp)
    15ec:	22c12d83          	lw	s11,556(sp)
    15f0:	26010113          	addi	sp,sp,608
    15f4:	00008067          	ret

000015f8 <not_implemented>:
    15f8:	ff010113          	addi	sp,sp,-16
    15fc:	00812423          	sw	s0,8(sp)
    1600:	00050413          	mv	s0,a0
    1604:	00000513          	li	a0,0
    1608:	00112623          	sw	ra,12(sp)
    160c:	00001097          	auipc	ra,0x1
    1610:	c7c080e7          	jalr	-900(ra) # 2288 <oled_clear>
    1614:	02800593          	li	a1,40
    1618:	00000513          	li	a0,0
    161c:	00001097          	auipc	ra,0x1
    1620:	cf4080e7          	jalr	-780(ra) # 2310 <display_set_cursor>
    1624:	00006537          	lui	a0,0x6
    1628:	00040593          	mv	a1,s0
    162c:	c6c50513          	addi	a0,a0,-916 # 5c6c <LEDS+0xac>
    1630:	00001097          	auipc	ra,0x1
    1634:	fbc080e7          	jalr	-68(ra) # 25ec <printf>
    1638:	03c00593          	li	a1,60
    163c:	00000513          	li	a0,0
    1640:	00001097          	auipc	ra,0x1
    1644:	cd0080e7          	jalr	-816(ra) # 2310 <display_set_cursor>
    1648:	00006537          	lui	a0,0x6
    164c:	c7450513          	addi	a0,a0,-908 # 5c74 <LEDS+0xb4>
    1650:	00001097          	auipc	ra,0x1
    1654:	f9c080e7          	jalr	-100(ra) # 25ec <printf>
    1658:	00001097          	auipc	ra,0x1
    165c:	e28080e7          	jalr	-472(ra) # 2480 <display_refresh>
    1660:	000067b7          	lui	a5,0x6
    1664:	bb07a783          	lw	a5,-1104(a5) # 5bb0 <BUTTONS>
    1668:	0007a703          	lw	a4,0(a5)
    166c:	fe070ee3          	beqz	a4,1668 <not_implemented+0x70>
    1670:	0007a703          	lw	a4,0(a5)
    1674:	fe071ee3          	bnez	a4,1670 <not_implemented+0x78>
    1678:	00812403          	lw	s0,8(sp)
    167c:	00c12083          	lw	ra,12(sp)
    1680:	01010113          	addi	sp,sp,16
    1684:	fffff317          	auipc	t1,0xfffff
    1688:	ad830067          	jr	-1320(t1) # 15c <play_click_noise>

0000168c <main_menu>:
    168c:	000067b7          	lui	a5,0x6
    1690:	fc010113          	addi	sp,sp,-64
    1694:	c8478793          	addi	a5,a5,-892 # 5c84 <LEDS+0xc4>
    1698:	00f12223          	sw	a5,4(sp)
    169c:	000067b7          	lui	a5,0x6
    16a0:	c9478793          	addi	a5,a5,-876 # 5c94 <LEDS+0xd4>
    16a4:	03312623          	sw	s3,44(sp)
    16a8:	000069b7          	lui	s3,0x6
    16ac:	00f12423          	sw	a5,8(sp)
    16b0:	ca098793          	addi	a5,s3,-864 # 5ca0 <LEDS+0xe0>
    16b4:	00f12623          	sw	a5,12(sp)
    16b8:	000067b7          	lui	a5,0x6
    16bc:	01912a23          	sw	s9,20(sp)
    16c0:	ca878c93          	addi	s9,a5,-856 # 5ca8 <LEDS+0xe8>
    16c4:	000067b7          	lui	a5,0x6
    16c8:	01712e23          	sw	s7,28(sp)
    16cc:	cbc78b93          	addi	s7,a5,-836 # 5cbc <LEDS+0xfc>
    16d0:	000067b7          	lui	a5,0x6
    16d4:	01812c23          	sw	s8,24(sp)
    16d8:	ccc78c13          	addi	s8,a5,-820 # 5ccc <LEDS+0x10c>
    16dc:	000067b7          	lui	a5,0x6
    16e0:	01a12823          	sw	s10,16(sp)
    16e4:	cd078d13          	addi	s10,a5,-816 # 5cd0 <LEDS+0x110>
    16e8:	000067b7          	lui	a5,0x6
    16ec:	03612023          	sw	s6,32(sp)
    16f0:	bb07ab03          	lw	s6,-1104(a5) # 5bb0 <BUTTONS>
    16f4:	02812c23          	sw	s0,56(sp)
    16f8:	02912a23          	sw	s1,52(sp)
    16fc:	03412423          	sw	s4,40(sp)
    1700:	02112e23          	sw	ra,60(sp)
    1704:	03212823          	sw	s2,48(sp)
    1708:	03512223          	sw	s5,36(sp)
    170c:	00000493          	li	s1,0
    1710:	00000413          	li	s0,0
    1714:	00300a13          	li	s4,3
    1718:	00000593          	li	a1,0
    171c:	00000513          	li	a0,0
    1720:	00001097          	auipc	ra,0x1
    1724:	bf0080e7          	jalr	-1040(ra) # 2310 <display_set_cursor>
    1728:	00000593          	li	a1,0
    172c:	0ff00513          	li	a0,255
    1730:	00001097          	auipc	ra,0x1
    1734:	bf4080e7          	jalr	-1036(ra) # 2324 <display_set_front_back_color>
    1738:	000c8513          	mv	a0,s9
    173c:	00001097          	auipc	ra,0x1
    1740:	eb0080e7          	jalr	-336(ra) # 25ec <printf>
    1744:	00410a93          	addi	s5,sp,4
    1748:	00000913          	li	s2,0
    174c:	11241263          	bne	s0,s2,1850 <main_menu+0x1c4>
    1750:	0ff00593          	li	a1,255
    1754:	00000513          	li	a0,0
    1758:	00001097          	auipc	ra,0x1
    175c:	bcc080e7          	jalr	-1076(ra) # 2324 <display_set_front_back_color>
    1760:	000aa603          	lw	a2,0(s5)
    1764:	00190913          	addi	s2,s2,1
    1768:	00090593          	mv	a1,s2
    176c:	000b8513          	mv	a0,s7
    1770:	00001097          	auipc	ra,0x1
    1774:	e7c080e7          	jalr	-388(ra) # 25ec <printf>
    1778:	000c0513          	mv	a0,s8
    177c:	00001097          	auipc	ra,0x1
    1780:	e70080e7          	jalr	-400(ra) # 25ec <printf>
    1784:	004a8a93          	addi	s5,s5,4
    1788:	fd4912e3          	bne	s2,s4,174c <main_menu+0xc0>
    178c:	00000593          	li	a1,0
    1790:	0ff00513          	li	a0,255
    1794:	00001097          	auipc	ra,0x1
    1798:	b90080e7          	jalr	-1136(ra) # 2324 <display_set_front_back_color>
    179c:	06e00593          	li	a1,110
    17a0:	00000513          	li	a0,0
    17a4:	00001097          	auipc	ra,0x1
    17a8:	b6c080e7          	jalr	-1172(ra) # 2310 <display_set_cursor>
    17ac:	000d0513          	mv	a0,s10
    17b0:	00001097          	auipc	ra,0x1
    17b4:	e3c080e7          	jalr	-452(ra) # 25ec <printf>
    17b8:	00001097          	auipc	ra,0x1
    17bc:	cc8080e7          	jalr	-824(ra) # 2480 <display_refresh>
    17c0:	000b2903          	lw	s2,0(s6)
    17c4:	fff4c493          	not	s1,s1
    17c8:	0124f4b3          	and	s1,s1,s2
    17cc:	0104f793          	andi	a5,s1,16
    17d0:	00078863          	beqz	a5,17e0 <main_menu+0x154>
    17d4:	00140413          	addi	s0,s0,1
    17d8:	fffff097          	auipc	ra,0xfffff
    17dc:	984080e7          	jalr	-1660(ra) # 15c <play_click_noise>
    17e0:	0084f793          	andi	a5,s1,8
    17e4:	00078863          	beqz	a5,17f4 <main_menu+0x168>
    17e8:	fff40413          	addi	s0,s0,-1
    17ec:	fffff097          	auipc	ra,0xfffff
    17f0:	970080e7          	jalr	-1680(ra) # 15c <play_click_noise>
    17f4:	0044f493          	andi	s1,s1,4
    17f8:	02048c63          	beqz	s1,1830 <main_menu+0x1a4>
    17fc:	fffff097          	auipc	ra,0xfffff
    1800:	960080e7          	jalr	-1696(ra) # 15c <play_click_noise>
    1804:	04041c63          	bnez	s0,185c <main_menu+0x1d0>
    1808:	fffff097          	auipc	ra,0xfffff
    180c:	468080e7          	jalr	1128(ra) # c70 <file_explorer>
    1810:	00001097          	auipc	ra,0x1
    1814:	af4080e7          	jalr	-1292(ra) # 2304 <display_framebuffer>
    1818:	00004637          	lui	a2,0x4
    181c:	00000593          	li	a1,0
    1820:	00000097          	auipc	ra,0x0
    1824:	7c4080e7          	jalr	1988(ra) # 1fe4 <memset>
    1828:	000b0793          	mv	a5,s6
    182c:	0007a783          	lw	a5,0(a5)
    1830:	fff00793          	li	a5,-1
    1834:	00f40863          	beq	s0,a5,1844 <main_menu+0x1b8>
    1838:	01441863          	bne	s0,s4,1848 <main_menu+0x1bc>
    183c:	00000413          	li	s0,0
    1840:	0080006f          	j	1848 <main_menu+0x1bc>
    1844:	00200413          	li	s0,2
    1848:	00090493          	mv	s1,s2
    184c:	ecdff06f          	j	1718 <main_menu+0x8c>
    1850:	00000593          	li	a1,0
    1854:	0ff00513          	li	a0,255
    1858:	f01ff06f          	j	1758 <main_menu+0xcc>
    185c:	00100793          	li	a5,1
    1860:	00f41863          	bne	s0,a5,1870 <main_menu+0x1e4>
    1864:	00000097          	auipc	ra,0x0
    1868:	87c080e7          	jalr	-1924(ra) # 10e0 <music_player>
    186c:	fa5ff06f          	j	1810 <main_menu+0x184>
    1870:	00200793          	li	a5,2
    1874:	f8f41ee3          	bne	s0,a5,1810 <main_menu+0x184>
    1878:	ca098513          	addi	a0,s3,-864
    187c:	00000097          	auipc	ra,0x0
    1880:	d7c080e7          	jalr	-644(ra) # 15f8 <not_implemented>
    1884:	f8dff06f          	j	1810 <main_menu+0x184>

00001888 <main>:
    1888:	000067b7          	lui	a5,0x6
    188c:	bc07a783          	lw	a5,-1088(a5) # 5bc0 <LEDS>
    1890:	ff010113          	addi	sp,sp,-16
    1894:	00112623          	sw	ra,12(sp)
    1898:	00812423          	sw	s0,8(sp)
    189c:	0007a023          	sw	zero,0(a5)
    18a0:	000027b7          	lui	a5,0x2
    18a4:	33878793          	addi	a5,a5,824 # 2338 <display_putchar>
    18a8:	00006737          	lui	a4,0x6
    18ac:	16f72023          	sw	a5,352(a4) # 6160 <f_putchar>
    18b0:	00001097          	auipc	ra,0x1
    18b4:	934080e7          	jalr	-1740(ra) # 21e4 <oled_init>
    18b8:	00001097          	auipc	ra,0x1
    18bc:	938080e7          	jalr	-1736(ra) # 21f0 <oled_fullscreen>
    18c0:	00001097          	auipc	ra,0x1
    18c4:	a44080e7          	jalr	-1468(ra) # 2304 <display_framebuffer>
    18c8:	00004637          	lui	a2,0x4
    18cc:	00000593          	li	a1,0
    18d0:	00000097          	auipc	ra,0x0
    18d4:	714080e7          	jalr	1812(ra) # 1fe4 <memset>
    18d8:	00001097          	auipc	ra,0x1
    18dc:	ba8080e7          	jalr	-1112(ra) # 2480 <display_refresh>
    18e0:	00000097          	auipc	ra,0x0
    18e4:	4a4080e7          	jalr	1188(ra) # 1d84 <sdcard_init>
    18e8:	00001097          	auipc	ra,0x1
    18ec:	2d4080e7          	jalr	724(ra) # 2bbc <fl_init>
    18f0:	00000593          	li	a1,0
    18f4:	00000513          	li	a0,0
    18f8:	00001097          	auipc	ra,0x1
    18fc:	a18080e7          	jalr	-1512(ra) # 2310 <display_set_cursor>
    1900:	00000593          	li	a1,0
    1904:	0ff00513          	li	a0,255
    1908:	00001097          	auipc	ra,0x1
    190c:	a1c080e7          	jalr	-1508(ra) # 2324 <display_set_front_back_color>
    1910:	00006537          	lui	a0,0x6
    1914:	ce450513          	addi	a0,a0,-796 # 5ce4 <LEDS+0x124>
    1918:	00001097          	auipc	ra,0x1
    191c:	cd4080e7          	jalr	-812(ra) # 25ec <printf>
    1920:	00001097          	auipc	ra,0x1
    1924:	b60080e7          	jalr	-1184(ra) # 2480 <display_refresh>
    1928:	000025b7          	lui	a1,0x2
    192c:	000027b7          	lui	a5,0x2
    1930:	f2858593          	addi	a1,a1,-216 # 1f28 <sdcard_writesector>
    1934:	ed478413          	addi	s0,a5,-300 # 1ed4 <sdcard_readsector>
    1938:	00040513          	mv	a0,s0
    193c:	00002097          	auipc	ra,0x2
    1940:	1e0080e7          	jalr	480(ra) # 3b1c <fl_attach_media>
    1944:	000027b7          	lui	a5,0x2
    1948:	f2878593          	addi	a1,a5,-216 # 1f28 <sdcard_writesector>
    194c:	fe0516e3          	bnez	a0,1938 <main+0xb0>
    1950:	00000097          	auipc	ra,0x0
    1954:	d3c080e7          	jalr	-708(ra) # 168c <main_menu>

00001958 <pause>:
    1958:	c0002773          	rdcycle	a4
    195c:	c00027f3          	rdcycle	a5
    1960:	40e787b3          	sub	a5,a5,a4
    1964:	fea7ece3          	bltu	a5,a0,195c <pause+0x4>
    1968:	00008067          	ret

0000196c <sdcard_idle>:
    196c:	00008067          	ret

00001970 <sdcard_select>:
    1970:	000067b7          	lui	a5,0x6
    1974:	bb47a783          	lw	a5,-1100(a5) # 5bb4 <SDCARD>
    1978:	00200713          	li	a4,2
    197c:	00e7a023          	sw	a4,0(a5)
    1980:	00008067          	ret

00001984 <sdcard_ponder>:
    1984:	000066b7          	lui	a3,0x6
    1988:	bb46a683          	lw	a3,-1100(a3) # 5bb4 <SDCARD>
    198c:	01000793          	li	a5,16
    1990:	00000713          	li	a4,0
    1994:	00676613          	ori	a2,a4,6
    1998:	00c6a023          	sw	a2,0(a3)
    199c:	00174713          	xori	a4,a4,1
    19a0:	00000013          	nop
    19a4:	fff78793          	addi	a5,a5,-1
    19a8:	fe0796e3          	bnez	a5,1994 <sdcard_ponder+0x10>
    19ac:	00008067          	ret

000019b0 <sdcard_unselect>:
    19b0:	000067b7          	lui	a5,0x6
    19b4:	bb47a783          	lw	a5,-1100(a5) # 5bb4 <SDCARD>
    19b8:	00600713          	li	a4,6
    19bc:	00e7a023          	sw	a4,0(a5)
    19c0:	00008067          	ret

000019c4 <sdcard_send>:
    19c4:	000067b7          	lui	a5,0x6
    19c8:	bb47a783          	lw	a5,-1100(a5) # 5bb4 <SDCARD>
    19cc:	00655713          	srli	a4,a0,0x6
    19d0:	00277713          	andi	a4,a4,2
    19d4:	00e7a023          	sw	a4,0(a5)
    19d8:	00176713          	ori	a4,a4,1
    19dc:	00e7a023          	sw	a4,0(a5)
    19e0:	00555713          	srli	a4,a0,0x5
    19e4:	00277713          	andi	a4,a4,2
    19e8:	00e7a023          	sw	a4,0(a5)
    19ec:	00176713          	ori	a4,a4,1
    19f0:	00e7a023          	sw	a4,0(a5)
    19f4:	00455713          	srli	a4,a0,0x4
    19f8:	00277713          	andi	a4,a4,2
    19fc:	00e7a023          	sw	a4,0(a5)
    1a00:	00176713          	ori	a4,a4,1
    1a04:	00e7a023          	sw	a4,0(a5)
    1a08:	00355713          	srli	a4,a0,0x3
    1a0c:	00277713          	andi	a4,a4,2
    1a10:	00e7a023          	sw	a4,0(a5)
    1a14:	00176713          	ori	a4,a4,1
    1a18:	00e7a023          	sw	a4,0(a5)
    1a1c:	00255713          	srli	a4,a0,0x2
    1a20:	00277713          	andi	a4,a4,2
    1a24:	00e7a023          	sw	a4,0(a5)
    1a28:	00176713          	ori	a4,a4,1
    1a2c:	00e7a023          	sw	a4,0(a5)
    1a30:	00155713          	srli	a4,a0,0x1
    1a34:	00277713          	andi	a4,a4,2
    1a38:	00e7a023          	sw	a4,0(a5)
    1a3c:	00176713          	ori	a4,a4,1
    1a40:	00e7a023          	sw	a4,0(a5)
    1a44:	00257713          	andi	a4,a0,2
    1a48:	00e7a023          	sw	a4,0(a5)
    1a4c:	00151513          	slli	a0,a0,0x1
    1a50:	00176713          	ori	a4,a4,1
    1a54:	00e7a023          	sw	a4,0(a5)
    1a58:	00257513          	andi	a0,a0,2
    1a5c:	00a7a023          	sw	a0,0(a5)
    1a60:	00156513          	ori	a0,a0,1
    1a64:	00a7a023          	sw	a0,0(a5)
    1a68:	00200713          	li	a4,2
    1a6c:	00e7a023          	sw	a4,0(a5)
    1a70:	000067b7          	lui	a5,0x6
    1a74:	1507a783          	lw	a5,336(a5) # 6150 <sdcard_while_loading_callback>
    1a78:	00078067          	jr	a5

00001a7c <sdcard_read>:
    1a7c:	fd010113          	addi	sp,sp,-48
    1a80:	fff50793          	addi	a5,a0,-1
    1a84:	03212023          	sw	s2,32(sp)
    1a88:	00100913          	li	s2,1
    1a8c:	00f91933          	sll	s2,s2,a5
    1a90:	000067b7          	lui	a5,0x6
    1a94:	01312e23          	sw	s3,28(sp)
    1a98:	bb47a983          	lw	s3,-1100(a5) # 5bb4 <SDCARD>
    1a9c:	02812423          	sw	s0,40(sp)
    1aa0:	02912223          	sw	s1,36(sp)
    1aa4:	01412c23          	sw	s4,24(sp)
    1aa8:	01512a23          	sw	s5,20(sp)
    1aac:	01612823          	sw	s6,16(sp)
    1ab0:	02112623          	sw	ra,44(sp)
    1ab4:	0ff00413          	li	s0,255
    1ab8:	00000493          	li	s1,0
    1abc:	00300a13          	li	s4,3
    1ac0:	00200a93          	li	s5,2
    1ac4:	00006b37          	lui	s6,0x6
    1ac8:	02058c63          	beqz	a1,1b00 <sdcard_read+0x84>
    1acc:	012477b3          	and	a5,s0,s2
    1ad0:	02079a63          	bnez	a5,1b04 <sdcard_read+0x88>
    1ad4:	02c12083          	lw	ra,44(sp)
    1ad8:	0ff47513          	zext.b	a0,s0
    1adc:	02812403          	lw	s0,40(sp)
    1ae0:	02412483          	lw	s1,36(sp)
    1ae4:	02012903          	lw	s2,32(sp)
    1ae8:	01c12983          	lw	s3,28(sp)
    1aec:	01812a03          	lw	s4,24(sp)
    1af0:	01412a83          	lw	s5,20(sp)
    1af4:	01012b03          	lw	s6,16(sp)
    1af8:	03010113          	addi	sp,sp,48
    1afc:	00008067          	ret
    1b00:	fca4dae3          	bge	s1,a0,1ad4 <sdcard_read+0x58>
    1b04:	0149a023          	sw	s4,0(s3)
    1b08:	0159a023          	sw	s5,0(s3)
    1b0c:	0009a783          	lw	a5,0(s3)
    1b10:	00141413          	slli	s0,s0,0x1
    1b14:	00b12623          	sw	a1,12(sp)
    1b18:	00f46433          	or	s0,s0,a5
    1b1c:	150b2783          	lw	a5,336(s6) # 6150 <sdcard_while_loading_callback>
    1b20:	00a12423          	sw	a0,8(sp)
    1b24:	00148493          	addi	s1,s1,1
    1b28:	000780e7          	jalr	a5
    1b2c:	00c12583          	lw	a1,12(sp)
    1b30:	00812503          	lw	a0,8(sp)
    1b34:	f95ff06f          	j	1ac8 <sdcard_read+0x4c>

00001b38 <sdcard_get>:
    1b38:	fe010113          	addi	sp,sp,-32
    1b3c:	00112e23          	sw	ra,28(sp)
    1b40:	00812c23          	sw	s0,24(sp)
    1b44:	00912a23          	sw	s1,20(sp)
    1b48:	00050413          	mv	s0,a0
    1b4c:	00b12623          	sw	a1,12(sp)
    1b50:	00000097          	auipc	ra,0x0
    1b54:	e20080e7          	jalr	-480(ra) # 1970 <sdcard_select>
    1b58:	00c12583          	lw	a1,12(sp)
    1b5c:	00040513          	mv	a0,s0
    1b60:	00100493          	li	s1,1
    1b64:	00000097          	auipc	ra,0x0
    1b68:	f18080e7          	jalr	-232(ra) # 1a7c <sdcard_read>
    1b6c:	00345413          	srli	s0,s0,0x3
    1b70:	0284c463          	blt	s1,s0,1b98 <sdcard_get+0x60>
    1b74:	00a12623          	sw	a0,12(sp)
    1b78:	00000097          	auipc	ra,0x0
    1b7c:	e38080e7          	jalr	-456(ra) # 19b0 <sdcard_unselect>
    1b80:	01c12083          	lw	ra,28(sp)
    1b84:	01812403          	lw	s0,24(sp)
    1b88:	00c12503          	lw	a0,12(sp)
    1b8c:	01412483          	lw	s1,20(sp)
    1b90:	02010113          	addi	sp,sp,32
    1b94:	00008067          	ret
    1b98:	00000593          	li	a1,0
    1b9c:	00800513          	li	a0,8
    1ba0:	00000097          	auipc	ra,0x0
    1ba4:	edc080e7          	jalr	-292(ra) # 1a7c <sdcard_read>
    1ba8:	00148493          	addi	s1,s1,1
    1bac:	fc5ff06f          	j	1b70 <sdcard_get+0x38>

00001bb0 <sdcard_cmd>:
    1bb0:	ff010113          	addi	sp,sp,-16
    1bb4:	00812423          	sw	s0,8(sp)
    1bb8:	00912223          	sw	s1,4(sp)
    1bbc:	01212023          	sw	s2,0(sp)
    1bc0:	00112623          	sw	ra,12(sp)
    1bc4:	00050913          	mv	s2,a0
    1bc8:	00000413          	li	s0,0
    1bcc:	00000097          	auipc	ra,0x0
    1bd0:	da4080e7          	jalr	-604(ra) # 1970 <sdcard_select>
    1bd4:	00600493          	li	s1,6
    1bd8:	008907b3          	add	a5,s2,s0
    1bdc:	0007c503          	lbu	a0,0(a5)
    1be0:	00140413          	addi	s0,s0,1
    1be4:	00000097          	auipc	ra,0x0
    1be8:	de0080e7          	jalr	-544(ra) # 19c4 <sdcard_send>
    1bec:	fe9416e3          	bne	s0,s1,1bd8 <sdcard_cmd+0x28>
    1bf0:	00812403          	lw	s0,8(sp)
    1bf4:	00c12083          	lw	ra,12(sp)
    1bf8:	00412483          	lw	s1,4(sp)
    1bfc:	00012903          	lw	s2,0(sp)
    1c00:	01010113          	addi	sp,sp,16
    1c04:	00000317          	auipc	t1,0x0
    1c08:	dac30067          	jr	-596(t1) # 19b0 <sdcard_unselect>

00001c0c <sdcard_start_sector>:
    1c0c:	ff010113          	addi	sp,sp,-16
    1c10:	00112623          	sw	ra,12(sp)
    1c14:	00812423          	sw	s0,8(sp)
    1c18:	00050413          	mv	s0,a0
    1c1c:	00000097          	auipc	ra,0x0
    1c20:	d54080e7          	jalr	-684(ra) # 1970 <sdcard_select>
    1c24:	05100513          	li	a0,81
    1c28:	00000097          	auipc	ra,0x0
    1c2c:	d9c080e7          	jalr	-612(ra) # 19c4 <sdcard_send>
    1c30:	01845513          	srli	a0,s0,0x18
    1c34:	00000097          	auipc	ra,0x0
    1c38:	d90080e7          	jalr	-624(ra) # 19c4 <sdcard_send>
    1c3c:	41045513          	srai	a0,s0,0x10
    1c40:	0ff57513          	zext.b	a0,a0
    1c44:	00000097          	auipc	ra,0x0
    1c48:	d80080e7          	jalr	-640(ra) # 19c4 <sdcard_send>
    1c4c:	40845513          	srai	a0,s0,0x8
    1c50:	0ff57513          	zext.b	a0,a0
    1c54:	00000097          	auipc	ra,0x0
    1c58:	d70080e7          	jalr	-656(ra) # 19c4 <sdcard_send>
    1c5c:	0ff47513          	zext.b	a0,s0
    1c60:	00000097          	auipc	ra,0x0
    1c64:	d64080e7          	jalr	-668(ra) # 19c4 <sdcard_send>
    1c68:	05500513          	li	a0,85
    1c6c:	00000097          	auipc	ra,0x0
    1c70:	d58080e7          	jalr	-680(ra) # 19c4 <sdcard_send>
    1c74:	00000097          	auipc	ra,0x0
    1c78:	d3c080e7          	jalr	-708(ra) # 19b0 <sdcard_unselect>
    1c7c:	00812403          	lw	s0,8(sp)
    1c80:	00c12083          	lw	ra,12(sp)
    1c84:	00100593          	li	a1,1
    1c88:	00800513          	li	a0,8
    1c8c:	01010113          	addi	sp,sp,16
    1c90:	00000317          	auipc	t1,0x0
    1c94:	ea830067          	jr	-344(t1) # 1b38 <sdcard_get>

00001c98 <sdcard_read_sector>:
    1c98:	ff010113          	addi	sp,sp,-16
    1c9c:	00812423          	sw	s0,8(sp)
    1ca0:	00112623          	sw	ra,12(sp)
    1ca4:	00912223          	sw	s1,4(sp)
    1ca8:	01212023          	sw	s2,0(sp)
    1cac:	00058413          	mv	s0,a1
    1cb0:	00000097          	auipc	ra,0x0
    1cb4:	f5c080e7          	jalr	-164(ra) # 1c0c <sdcard_start_sector>
    1cb8:	04051863          	bnez	a0,1d08 <sdcard_read_sector+0x70>
    1cbc:	00100593          	li	a1,1
    1cc0:	00058513          	mv	a0,a1
    1cc4:	00000097          	auipc	ra,0x0
    1cc8:	e74080e7          	jalr	-396(ra) # 1b38 <sdcard_get>
    1ccc:	00000493          	li	s1,0
    1cd0:	20000913          	li	s2,512
    1cd4:	00000593          	li	a1,0
    1cd8:	00800513          	li	a0,8
    1cdc:	00000097          	auipc	ra,0x0
    1ce0:	e5c080e7          	jalr	-420(ra) # 1b38 <sdcard_get>
    1ce4:	009407b3          	add	a5,s0,s1
    1ce8:	00a78023          	sb	a0,0(a5)
    1cec:	00148493          	addi	s1,s1,1
    1cf0:	ff2492e3          	bne	s1,s2,1cd4 <sdcard_read_sector+0x3c>
    1cf4:	00100593          	li	a1,1
    1cf8:	01000513          	li	a0,16
    1cfc:	20040413          	addi	s0,s0,512
    1d00:	00000097          	auipc	ra,0x0
    1d04:	e38080e7          	jalr	-456(ra) # 1b38 <sdcard_get>
    1d08:	00c12083          	lw	ra,12(sp)
    1d0c:	00040513          	mv	a0,s0
    1d10:	00812403          	lw	s0,8(sp)
    1d14:	00412483          	lw	s1,4(sp)
    1d18:	00012903          	lw	s2,0(sp)
    1d1c:	01010113          	addi	sp,sp,16
    1d20:	00008067          	ret

00001d24 <sdcard_preinit>:
    1d24:	ff010113          	addi	sp,sp,-16
    1d28:	000067b7          	lui	a5,0x6
    1d2c:	00812423          	sw	s0,8(sp)
    1d30:	bb47a403          	lw	s0,-1100(a5) # 5bb4 <SDCARD>
    1d34:	00112623          	sw	ra,12(sp)
    1d38:	00600793          	li	a5,6
    1d3c:	01313537          	lui	a0,0x1313
    1d40:	00f42023          	sw	a5,0(s0)
    1d44:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
    1d48:	00000097          	auipc	ra,0x0
    1d4c:	c10080e7          	jalr	-1008(ra) # 1958 <pause>
    1d50:	0a000793          	li	a5,160
    1d54:	00000713          	li	a4,0
    1d58:	00676693          	ori	a3,a4,6
    1d5c:	00d42023          	sw	a3,0(s0)
    1d60:	fff78793          	addi	a5,a5,-1
    1d64:	00174713          	xori	a4,a4,1
    1d68:	fe0798e3          	bnez	a5,1d58 <sdcard_preinit+0x34>
    1d6c:	00600793          	li	a5,6
    1d70:	00c12083          	lw	ra,12(sp)
    1d74:	00f42023          	sw	a5,0(s0)
    1d78:	00812403          	lw	s0,8(sp)
    1d7c:	01010113          	addi	sp,sp,16
    1d80:	00008067          	ret

00001d84 <sdcard_init>:
    1d84:	000027b7          	lui	a5,0x2
    1d88:	96c78793          	addi	a5,a5,-1684 # 196c <sdcard_idle>
    1d8c:	00006737          	lui	a4,0x6
    1d90:	fe010113          	addi	sp,sp,-32
    1d94:	14f72823          	sw	a5,336(a4) # 6150 <sdcard_while_loading_callback>
    1d98:	000067b7          	lui	a5,0x6
    1d9c:	00812c23          	sw	s0,24(sp)
    1da0:	00912a23          	sw	s1,20(sp)
    1da4:	00112e23          	sw	ra,28(sp)
    1da8:	ba078493          	addi	s1,a5,-1120 # 5ba0 <cmd0>
    1dac:	0ff00413          	li	s0,255
    1db0:	00000097          	auipc	ra,0x0
    1db4:	f74080e7          	jalr	-140(ra) # 1d24 <sdcard_preinit>
    1db8:	00048513          	mv	a0,s1
    1dbc:	00000097          	auipc	ra,0x0
    1dc0:	df4080e7          	jalr	-524(ra) # 1bb0 <sdcard_cmd>
    1dc4:	00100593          	li	a1,1
    1dc8:	00800513          	li	a0,8
    1dcc:	00000097          	auipc	ra,0x0
    1dd0:	d6c080e7          	jalr	-660(ra) # 1b38 <sdcard_get>
    1dd4:	00a12623          	sw	a0,12(sp)
    1dd8:	00000097          	auipc	ra,0x0
    1ddc:	bac080e7          	jalr	-1108(ra) # 1984 <sdcard_ponder>
    1de0:	00c12503          	lw	a0,12(sp)
    1de4:	00851c63          	bne	a0,s0,1dfc <sdcard_init+0x78>
    1de8:	01313537          	lui	a0,0x1313
    1dec:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
    1df0:	00000097          	auipc	ra,0x0
    1df4:	b68080e7          	jalr	-1176(ra) # 1958 <pause>
    1df8:	fb9ff06f          	j	1db0 <sdcard_init+0x2c>
    1dfc:	00006537          	lui	a0,0x6
    1e00:	b9850513          	addi	a0,a0,-1128 # 5b98 <cmd8>
    1e04:	00000097          	auipc	ra,0x0
    1e08:	dac080e7          	jalr	-596(ra) # 1bb0 <sdcard_cmd>
    1e0c:	00100593          	li	a1,1
    1e10:	02800513          	li	a0,40
    1e14:	00000097          	auipc	ra,0x0
    1e18:	d24080e7          	jalr	-732(ra) # 1b38 <sdcard_get>
    1e1c:	00000097          	auipc	ra,0x0
    1e20:	b68080e7          	jalr	-1176(ra) # 1984 <sdcard_ponder>
    1e24:	000067b7          	lui	a5,0x6
    1e28:	b9078413          	addi	s0,a5,-1136 # 5b90 <cmd55>
    1e2c:	000067b7          	lui	a5,0x6
    1e30:	b8878493          	addi	s1,a5,-1144 # 5b88 <acmd41>
    1e34:	00040513          	mv	a0,s0
    1e38:	00000097          	auipc	ra,0x0
    1e3c:	d78080e7          	jalr	-648(ra) # 1bb0 <sdcard_cmd>
    1e40:	00100593          	li	a1,1
    1e44:	00800513          	li	a0,8
    1e48:	00000097          	auipc	ra,0x0
    1e4c:	cf0080e7          	jalr	-784(ra) # 1b38 <sdcard_get>
    1e50:	00000097          	auipc	ra,0x0
    1e54:	b34080e7          	jalr	-1228(ra) # 1984 <sdcard_ponder>
    1e58:	00048513          	mv	a0,s1
    1e5c:	00000097          	auipc	ra,0x0
    1e60:	d54080e7          	jalr	-684(ra) # 1bb0 <sdcard_cmd>
    1e64:	00100593          	li	a1,1
    1e68:	00800513          	li	a0,8
    1e6c:	00000097          	auipc	ra,0x0
    1e70:	ccc080e7          	jalr	-820(ra) # 1b38 <sdcard_get>
    1e74:	00a12623          	sw	a0,12(sp)
    1e78:	00000097          	auipc	ra,0x0
    1e7c:	b0c080e7          	jalr	-1268(ra) # 1984 <sdcard_ponder>
    1e80:	00c12503          	lw	a0,12(sp)
    1e84:	00050c63          	beqz	a0,1e9c <sdcard_init+0x118>
    1e88:	001e8537          	lui	a0,0x1e8
    1e8c:	48050513          	addi	a0,a0,1152 # 1e8480 <__stacktop+0x1d8480>
    1e90:	00000097          	auipc	ra,0x0
    1e94:	ac8080e7          	jalr	-1336(ra) # 1958 <pause>
    1e98:	f9dff06f          	j	1e34 <sdcard_init+0xb0>
    1e9c:	00006537          	lui	a0,0x6
    1ea0:	b8050513          	addi	a0,a0,-1152 # 5b80 <cmd16>
    1ea4:	00000097          	auipc	ra,0x0
    1ea8:	d0c080e7          	jalr	-756(ra) # 1bb0 <sdcard_cmd>
    1eac:	00100593          	li	a1,1
    1eb0:	00800513          	li	a0,8
    1eb4:	00000097          	auipc	ra,0x0
    1eb8:	c84080e7          	jalr	-892(ra) # 1b38 <sdcard_get>
    1ebc:	01812403          	lw	s0,24(sp)
    1ec0:	01c12083          	lw	ra,28(sp)
    1ec4:	01412483          	lw	s1,20(sp)
    1ec8:	02010113          	addi	sp,sp,32
    1ecc:	00000317          	auipc	t1,0x0
    1ed0:	ab830067          	jr	-1352(t1) # 1984 <sdcard_ponder>

00001ed4 <sdcard_readsector>:
    1ed4:	04060663          	beqz	a2,1f20 <sdcard_readsector+0x4c>
    1ed8:	ff010113          	addi	sp,sp,-16
    1edc:	00812423          	sw	s0,8(sp)
    1ee0:	00912223          	sw	s1,4(sp)
    1ee4:	00112623          	sw	ra,12(sp)
    1ee8:	00050413          	mv	s0,a0
    1eec:	00a604b3          	add	s1,a2,a0
    1ef0:	00040513          	mv	a0,s0
    1ef4:	00000097          	auipc	ra,0x0
    1ef8:	da4080e7          	jalr	-604(ra) # 1c98 <sdcard_read_sector>
    1efc:	00140413          	addi	s0,s0,1
    1f00:	00050593          	mv	a1,a0
    1f04:	fe9416e3          	bne	s0,s1,1ef0 <sdcard_readsector+0x1c>
    1f08:	00c12083          	lw	ra,12(sp)
    1f0c:	00812403          	lw	s0,8(sp)
    1f10:	00412483          	lw	s1,4(sp)
    1f14:	00100513          	li	a0,1
    1f18:	01010113          	addi	sp,sp,16
    1f1c:	00008067          	ret
    1f20:	00000513          	li	a0,0
    1f24:	00008067          	ret

00001f28 <sdcard_writesector>:
    1f28:	00000513          	li	a0,0
    1f2c:	00008067          	ret

00001f30 <__divsi3>:
    1f30:	06054063          	bltz	a0,1f90 <__umodsi3+0x10>
    1f34:	0605c663          	bltz	a1,1fa0 <__umodsi3+0x20>

00001f38 <__udivsi3>:
    1f38:	00058613          	mv	a2,a1
    1f3c:	00050593          	mv	a1,a0
    1f40:	fff00513          	li	a0,-1
    1f44:	02060c63          	beqz	a2,1f7c <__udivsi3+0x44>
    1f48:	00100693          	li	a3,1
    1f4c:	00b67a63          	bgeu	a2,a1,1f60 <__udivsi3+0x28>
    1f50:	00c05863          	blez	a2,1f60 <__udivsi3+0x28>
    1f54:	00161613          	slli	a2,a2,0x1
    1f58:	00169693          	slli	a3,a3,0x1
    1f5c:	feb66ae3          	bltu	a2,a1,1f50 <__udivsi3+0x18>
    1f60:	00000513          	li	a0,0
    1f64:	00c5e663          	bltu	a1,a2,1f70 <__udivsi3+0x38>
    1f68:	40c585b3          	sub	a1,a1,a2
    1f6c:	00d56533          	or	a0,a0,a3
    1f70:	0016d693          	srli	a3,a3,0x1
    1f74:	00165613          	srli	a2,a2,0x1
    1f78:	fe0696e3          	bnez	a3,1f64 <__udivsi3+0x2c>
    1f7c:	00008067          	ret

00001f80 <__umodsi3>:
    1f80:	00008293          	mv	t0,ra
    1f84:	fb5ff0ef          	jal	1f38 <__udivsi3>
    1f88:	00058513          	mv	a0,a1
    1f8c:	00028067          	jr	t0
    1f90:	40a00533          	neg	a0,a0
    1f94:	0005d863          	bgez	a1,1fa4 <__umodsi3+0x24>
    1f98:	40b005b3          	neg	a1,a1
    1f9c:	f95ff06f          	j	1f30 <__divsi3>
    1fa0:	40b005b3          	neg	a1,a1
    1fa4:	00008293          	mv	t0,ra
    1fa8:	f89ff0ef          	jal	1f30 <__divsi3>
    1fac:	40a00533          	neg	a0,a0
    1fb0:	00028067          	jr	t0

00001fb4 <__modsi3>:
    1fb4:	00008293          	mv	t0,ra
    1fb8:	0005ca63          	bltz	a1,1fcc <__modsi3+0x18>
    1fbc:	00054c63          	bltz	a0,1fd4 <__modsi3+0x20>
    1fc0:	f79ff0ef          	jal	1f38 <__udivsi3>
    1fc4:	00058513          	mv	a0,a1
    1fc8:	00028067          	jr	t0
    1fcc:	40b005b3          	neg	a1,a1
    1fd0:	fe0558e3          	bgez	a0,1fc0 <__modsi3+0xc>
    1fd4:	40a00533          	neg	a0,a0
    1fd8:	f61ff0ef          	jal	1f38 <__udivsi3>
    1fdc:	40b00533          	neg	a0,a1
    1fe0:	00028067          	jr	t0

00001fe4 <memset>:
    1fe4:	00c50633          	add	a2,a0,a2
    1fe8:	00050793          	mv	a5,a0
    1fec:	00c79463          	bne	a5,a2,1ff4 <memset+0x10>
    1ff0:	00008067          	ret
    1ff4:	00178793          	addi	a5,a5,1
    1ff8:	feb78fa3          	sb	a1,-1(a5)
    1ffc:	ff1ff06f          	j	1fec <memset+0x8>

00002000 <memcpy>:
    2000:	00000793          	li	a5,0
    2004:	00c79463          	bne	a5,a2,200c <memcpy+0xc>
    2008:	00008067          	ret
    200c:	00f58733          	add	a4,a1,a5
    2010:	00074683          	lbu	a3,0(a4)
    2014:	00f50733          	add	a4,a0,a5
    2018:	00178793          	addi	a5,a5,1
    201c:	00d70023          	sb	a3,0(a4)
    2020:	fe5ff06f          	j	2004 <memcpy+0x4>

00002024 <strlen>:
    2024:	00000793          	li	a5,0
    2028:	00f50733          	add	a4,a0,a5
    202c:	00074703          	lbu	a4,0(a4)
    2030:	00071663          	bnez	a4,203c <strlen+0x18>
    2034:	00078513          	mv	a0,a5
    2038:	00008067          	ret
    203c:	00178793          	addi	a5,a5,1
    2040:	fe9ff06f          	j	2028 <strlen+0x4>

00002044 <strncmp>:
    2044:	00000793          	li	a5,0
    2048:	00c79663          	bne	a5,a2,2054 <strncmp+0x10>
    204c:	00000513          	li	a0,0
    2050:	00008067          	ret
    2054:	00f50733          	add	a4,a0,a5
    2058:	00074683          	lbu	a3,0(a4)
    205c:	00f58733          	add	a4,a1,a5
    2060:	00074703          	lbu	a4,0(a4)
    2064:	00e6e863          	bltu	a3,a4,2074 <strncmp+0x30>
    2068:	00d76a63          	bltu	a4,a3,207c <strncmp+0x38>
    206c:	00178793          	addi	a5,a5,1
    2070:	fd9ff06f          	j	2048 <strncmp+0x4>
    2074:	fff00513          	li	a0,-1
    2078:	00008067          	ret
    207c:	00100513          	li	a0,1
    2080:	00008067          	ret

00002084 <strncpy>:
    2084:	00000793          	li	a5,0
    2088:	00c79463          	bne	a5,a2,2090 <strncpy+0xc>
    208c:	00008067          	ret
    2090:	00f58733          	add	a4,a1,a5
    2094:	00074683          	lbu	a3,0(a4)
    2098:	00f50733          	add	a4,a0,a5
    209c:	00178793          	addi	a5,a5,1
    20a0:	00d70023          	sb	a3,0(a4)
    20a4:	fe5ff06f          	j	2088 <strncpy+0x4>

000020a8 <strcpy>:
    20a8:	0005c783          	lbu	a5,0(a1)
    20ac:	00079663          	bnez	a5,20b8 <strcpy+0x10>
    20b0:	00050023          	sb	zero,0(a0)
    20b4:	00008067          	ret
    20b8:	00150513          	addi	a0,a0,1
    20bc:	00158593          	addi	a1,a1,1
    20c0:	fef50fa3          	sb	a5,-1(a0)
    20c4:	fe5ff06f          	j	20a8 <strcpy>

000020c8 <oled_wait>:
    20c8:	00000013          	nop
    20cc:	00000013          	nop
    20d0:	00000013          	nop
    20d4:	00000013          	nop
    20d8:	00000013          	nop
    20dc:	00000013          	nop
    20e0:	00000013          	nop
    20e4:	00008067          	ret

000020e8 <oled_init_mode>:
    20e8:	000067b7          	lui	a5,0x6
    20ec:	bb87a703          	lw	a4,-1096(a5) # 5bb8 <OLED_RST>
    20f0:	fe010113          	addi	sp,sp,-32
    20f4:	00112e23          	sw	ra,28(sp)
    20f8:	00812c23          	sw	s0,24(sp)
    20fc:	00072023          	sw	zero,0(a4)
    2100:	00040737          	lui	a4,0x40
    2104:	00000013          	nop
    2108:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
    210c:	fe071ce3          	bnez	a4,2104 <oled_init_mode+0x1c>
    2110:	bb87a703          	lw	a4,-1096(a5)
    2114:	00100693          	li	a3,1
    2118:	00d72023          	sw	a3,0(a4)
    211c:	00040737          	lui	a4,0x40
    2120:	00000013          	nop
    2124:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
    2128:	fe071ce3          	bnez	a4,2120 <oled_init_mode+0x38>
    212c:	bb87a783          	lw	a5,-1096(a5)
    2130:	0007a023          	sw	zero,0(a5)
    2134:	000407b7          	lui	a5,0x40
    2138:	00000013          	nop
    213c:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
    2140:	fe079ce3          	bnez	a5,2138 <oled_init_mode+0x50>
    2144:	00006737          	lui	a4,0x6
    2148:	bbc72783          	lw	a5,-1092(a4) # 5bbc <OLED>
    214c:	2af00693          	li	a3,687
    2150:	00d7a023          	sw	a3,0(a5)
    2154:	000407b7          	lui	a5,0x40
    2158:	00000013          	nop
    215c:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
    2160:	fe079ce3          	bnez	a5,2158 <oled_init_mode+0x70>
    2164:	bbc72403          	lw	s0,-1092(a4)
    2168:	2a000793          	li	a5,672
    216c:	00a12623          	sw	a0,12(sp)
    2170:	00f42023          	sw	a5,0(s0)
    2174:	00000097          	auipc	ra,0x0
    2178:	f54080e7          	jalr	-172(ra) # 20c8 <oled_wait>
    217c:	00c12503          	lw	a0,12(sp)
    2180:	4a000793          	li	a5,1184
    2184:	00050463          	beqz	a0,218c <oled_init_mode+0xa4>
    2188:	42000793          	li	a5,1056
    218c:	00f42023          	sw	a5,0(s0)
    2190:	00000097          	auipc	ra,0x0
    2194:	f38080e7          	jalr	-200(ra) # 20c8 <oled_wait>
    2198:	2fd00793          	li	a5,765
    219c:	00f42023          	sw	a5,0(s0)
    21a0:	00000097          	auipc	ra,0x0
    21a4:	f28080e7          	jalr	-216(ra) # 20c8 <oled_wait>
    21a8:	4b100793          	li	a5,1201
    21ac:	00f42023          	sw	a5,0(s0)
    21b0:	00000097          	auipc	ra,0x0
    21b4:	f18080e7          	jalr	-232(ra) # 20c8 <oled_wait>
    21b8:	2a200793          	li	a5,674
    21bc:	00f42023          	sw	a5,0(s0)
    21c0:	00000097          	auipc	ra,0x0
    21c4:	f08080e7          	jalr	-248(ra) # 20c8 <oled_wait>
    21c8:	40000793          	li	a5,1024
    21cc:	00f42023          	sw	a5,0(s0)
    21d0:	01812403          	lw	s0,24(sp)
    21d4:	01c12083          	lw	ra,28(sp)
    21d8:	02010113          	addi	sp,sp,32
    21dc:	00000317          	auipc	t1,0x0
    21e0:	eec30067          	jr	-276(t1) # 20c8 <oled_wait>

000021e4 <oled_init>:
    21e4:	00000513          	li	a0,0
    21e8:	00000317          	auipc	t1,0x0
    21ec:	f0030067          	jr	-256(t1) # 20e8 <oled_init_mode>

000021f0 <oled_fullscreen>:
    21f0:	ff010113          	addi	sp,sp,-16
    21f4:	000067b7          	lui	a5,0x6
    21f8:	00812423          	sw	s0,8(sp)
    21fc:	bbc7a403          	lw	s0,-1092(a5) # 5bbc <OLED>
    2200:	00112623          	sw	ra,12(sp)
    2204:	00912223          	sw	s1,4(sp)
    2208:	01212023          	sw	s2,0(sp)
    220c:	21500793          	li	a5,533
    2210:	00f42023          	sw	a5,0(s0)
    2214:	40000913          	li	s2,1024
    2218:	00000097          	auipc	ra,0x0
    221c:	eb0080e7          	jalr	-336(ra) # 20c8 <oled_wait>
    2220:	47f00493          	li	s1,1151
    2224:	01242023          	sw	s2,0(s0)
    2228:	00000097          	auipc	ra,0x0
    222c:	ea0080e7          	jalr	-352(ra) # 20c8 <oled_wait>
    2230:	00942023          	sw	s1,0(s0)
    2234:	00000097          	auipc	ra,0x0
    2238:	e94080e7          	jalr	-364(ra) # 20c8 <oled_wait>
    223c:	27500793          	li	a5,629
    2240:	00f42023          	sw	a5,0(s0)
    2244:	00000097          	auipc	ra,0x0
    2248:	e84080e7          	jalr	-380(ra) # 20c8 <oled_wait>
    224c:	01242023          	sw	s2,0(s0)
    2250:	00000097          	auipc	ra,0x0
    2254:	e78080e7          	jalr	-392(ra) # 20c8 <oled_wait>
    2258:	00942023          	sw	s1,0(s0)
    225c:	00000097          	auipc	ra,0x0
    2260:	e6c080e7          	jalr	-404(ra) # 20c8 <oled_wait>
    2264:	25c00793          	li	a5,604
    2268:	00f42023          	sw	a5,0(s0)
    226c:	00812403          	lw	s0,8(sp)
    2270:	00c12083          	lw	ra,12(sp)
    2274:	00412483          	lw	s1,4(sp)
    2278:	00012903          	lw	s2,0(sp)
    227c:	01010113          	addi	sp,sp,16
    2280:	00000317          	auipc	t1,0x0
    2284:	e4830067          	jr	-440(t1) # 20c8 <oled_wait>

00002288 <oled_clear>:
    2288:	fe010113          	addi	sp,sp,-32
    228c:	000067b7          	lui	a5,0x6
    2290:	01312623          	sw	s3,12(sp)
    2294:	bbc7a983          	lw	s3,-1092(a5) # 5bbc <OLED>
    2298:	00812c23          	sw	s0,24(sp)
    229c:	01212823          	sw	s2,16(sp)
    22a0:	00112e23          	sw	ra,28(sp)
    22a4:	00912a23          	sw	s1,20(sp)
    22a8:	08000913          	li	s2,128
    22ac:	40056413          	ori	s0,a0,1024
    22b0:	08000493          	li	s1,128
    22b4:	0089a023          	sw	s0,0(s3)
    22b8:	00000097          	auipc	ra,0x0
    22bc:	e10080e7          	jalr	-496(ra) # 20c8 <oled_wait>
    22c0:	0089a023          	sw	s0,0(s3)
    22c4:	00000097          	auipc	ra,0x0
    22c8:	e04080e7          	jalr	-508(ra) # 20c8 <oled_wait>
    22cc:	fff48493          	addi	s1,s1,-1
    22d0:	0089a023          	sw	s0,0(s3)
    22d4:	00000097          	auipc	ra,0x0
    22d8:	df4080e7          	jalr	-524(ra) # 20c8 <oled_wait>
    22dc:	fc049ce3          	bnez	s1,22b4 <oled_clear+0x2c>
    22e0:	fff90913          	addi	s2,s2,-1
    22e4:	fc0916e3          	bnez	s2,22b0 <oled_clear+0x28>
    22e8:	01c12083          	lw	ra,28(sp)
    22ec:	01812403          	lw	s0,24(sp)
    22f0:	01412483          	lw	s1,20(sp)
    22f4:	01012903          	lw	s2,16(sp)
    22f8:	00c12983          	lw	s3,12(sp)
    22fc:	02010113          	addi	sp,sp,32
    2300:	00008067          	ret

00002304 <display_framebuffer>:
    2304:	000067b7          	lui	a5,0x6
    2308:	bac7a503          	lw	a0,-1108(a5) # 5bac <DISPLAY>
    230c:	00008067          	ret

00002310 <display_set_cursor>:
    2310:	000067b7          	lui	a5,0x6
    2314:	14a7ae23          	sw	a0,348(a5) # 615c <cursor_x>
    2318:	000067b7          	lui	a5,0x6
    231c:	14b7ac23          	sw	a1,344(a5) # 6158 <cursor_y>
    2320:	00008067          	ret

00002324 <display_set_front_back_color>:
    2324:	000067b7          	lui	a5,0x6
    2328:	14a78aa3          	sb	a0,341(a5) # 6155 <front_color>
    232c:	000067b7          	lui	a5,0x6
    2330:	14b78a23          	sb	a1,340(a5) # 6154 <back_color>
    2334:	00008067          	ret

00002338 <display_putchar>:
    2338:	00a00793          	li	a5,10
    233c:	00006737          	lui	a4,0x6
    2340:	02f51663          	bne	a0,a5,236c <display_putchar+0x34>
    2344:	14072e23          	sw	zero,348(a4) # 615c <cursor_x>
    2348:	00006737          	lui	a4,0x6
    234c:	15872783          	lw	a5,344(a4) # 6158 <cursor_y>
    2350:	00878793          	addi	a5,a5,8
    2354:	14f72c23          	sw	a5,344(a4)
    2358:	07f00713          	li	a4,127
    235c:	00f75663          	bge	a4,a5,2368 <display_putchar+0x30>
    2360:	000067b7          	lui	a5,0x6
    2364:	1407ac23          	sw	zero,344(a5) # 6158 <cursor_y>
    2368:	00008067          	ret
    236c:	ff010113          	addi	sp,sp,-16
    2370:	00812623          	sw	s0,12(sp)
    2374:	01f00793          	li	a5,31
    2378:	0ca7d263          	bge	a5,a0,243c <display_putchar+0x104>
    237c:	00006e37          	lui	t3,0x6
    2380:	158e2783          	lw	a5,344(t3) # 6158 <cursor_y>
    2384:	07800693          	li	a3,120
    2388:	00800593          	li	a1,8
    238c:	00f6d663          	bge	a3,a5,2398 <display_putchar+0x60>
    2390:	08000593          	li	a1,128
    2394:	40f585b3          	sub	a1,a1,a5
    2398:	15c72783          	lw	a5,348(a4)
    239c:	07b00693          	li	a3,123
    23a0:	00500813          	li	a6,5
    23a4:	00f6d663          	bge	a3,a5,23b0 <display_putchar+0x78>
    23a8:	08000813          	li	a6,128
    23ac:	40f80833          	sub	a6,a6,a5
    23b0:	000067b7          	lui	a5,0x6
    23b4:	bac7a283          	lw	t0,-1108(a5) # 5bac <DISPLAY>
    23b8:	000066b7          	lui	a3,0x6
    23bc:	00251793          	slli	a5,a0,0x2
    23c0:	d4068693          	addi	a3,a3,-704 # 5d40 <font>
    23c4:	00a787b3          	add	a5,a5,a0
    23c8:	00d78533          	add	a0,a5,a3
    23cc:	00100f93          	li	t6,1
    23d0:	00000693          	li	a3,0
    23d4:	000063b7          	lui	t2,0x6
    23d8:	00006437          	lui	s0,0x6
    23dc:	06b6d063          	bge	a3,a1,243c <display_putchar+0x104>
    23e0:	00df9f33          	sll	t5,t6,a3
    23e4:	00050893          	mv	a7,a0
    23e8:	00000613          	li	a2,0
    23ec:	03c0006f          	j	2428 <display_putchar+0xf0>
    23f0:	f608c783          	lbu	a5,-160(a7)
    23f4:	01e7f7b3          	and	a5,a5,t5
    23f8:	02078e63          	beqz	a5,2434 <display_putchar+0xfc>
    23fc:	15544e83          	lbu	t4,341(s0) # 6155 <front_color>
    2400:	15c72783          	lw	a5,348(a4)
    2404:	158e2303          	lw	t1,344(t3)
    2408:	00188893          	addi	a7,a7,1
    240c:	00f607b3          	add	a5,a2,a5
    2410:	00779793          	slli	a5,a5,0x7
    2414:	00668333          	add	t1,a3,t1
    2418:	006787b3          	add	a5,a5,t1
    241c:	00f287b3          	add	a5,t0,a5
    2420:	01d78023          	sb	t4,0(a5)
    2424:	00160613          	addi	a2,a2,1 # 4001 <fatfs_get_file_entry+0x1ad>
    2428:	fd0644e3          	blt	a2,a6,23f0 <display_putchar+0xb8>
    242c:	00168693          	addi	a3,a3,1
    2430:	fadff06f          	j	23dc <display_putchar+0xa4>
    2434:	1543ce83          	lbu	t4,340(t2) # 6154 <back_color>
    2438:	fc9ff06f          	j	2400 <display_putchar+0xc8>
    243c:	15c72783          	lw	a5,348(a4)
    2440:	07f00693          	li	a3,127
    2444:	00578793          	addi	a5,a5,5
    2448:	00f6c663          	blt	a3,a5,2454 <display_putchar+0x11c>
    244c:	14f72e23          	sw	a5,348(a4)
    2450:	0240006f          	j	2474 <display_putchar+0x13c>
    2454:	14072e23          	sw	zero,348(a4)
    2458:	00006737          	lui	a4,0x6
    245c:	15872783          	lw	a5,344(a4) # 6158 <cursor_y>
    2460:	00878793          	addi	a5,a5,8
    2464:	14f72c23          	sw	a5,344(a4)
    2468:	00f6d663          	bge	a3,a5,2474 <display_putchar+0x13c>
    246c:	000067b7          	lui	a5,0x6
    2470:	1407ac23          	sw	zero,344(a5) # 6158 <cursor_y>
    2474:	00c12403          	lw	s0,12(sp)
    2478:	01010113          	addi	sp,sp,16
    247c:	00008067          	ret

00002480 <display_refresh>:
    2480:	00008067          	ret

00002484 <print_string>:
    2484:	ff010113          	addi	sp,sp,-16
    2488:	00812423          	sw	s0,8(sp)
    248c:	00912223          	sw	s1,4(sp)
    2490:	00112623          	sw	ra,12(sp)
    2494:	00050413          	mv	s0,a0
    2498:	000064b7          	lui	s1,0x6
    249c:	00044503          	lbu	a0,0(s0)
    24a0:	00051c63          	bnez	a0,24b8 <print_string+0x34>
    24a4:	00c12083          	lw	ra,12(sp)
    24a8:	00812403          	lw	s0,8(sp)
    24ac:	00412483          	lw	s1,4(sp)
    24b0:	01010113          	addi	sp,sp,16
    24b4:	00008067          	ret
    24b8:	1604a783          	lw	a5,352(s1) # 6160 <f_putchar>
    24bc:	00140413          	addi	s0,s0,1
    24c0:	000780e7          	jalr	a5
    24c4:	fd9ff06f          	j	249c <print_string+0x18>

000024c8 <print_dec>:
    24c8:	ef010113          	addi	sp,sp,-272
    24cc:	10812423          	sw	s0,264(sp)
    24d0:	10912223          	sw	s1,260(sp)
    24d4:	10112623          	sw	ra,268(sp)
    24d8:	11212023          	sw	s2,256(sp)
    24dc:	00050413          	mv	s0,a0
    24e0:	000064b7          	lui	s1,0x6
    24e4:	08045063          	bgez	s0,2564 <print_dec+0x9c>
    24e8:	1604a783          	lw	a5,352(s1) # 6160 <f_putchar>
    24ec:	02d00513          	li	a0,45
    24f0:	40800433          	neg	s0,s0
    24f4:	000780e7          	jalr	a5
    24f8:	fedff06f          	j	24e4 <print_dec+0x1c>
    24fc:	00040513          	mv	a0,s0
    2500:	00a00593          	li	a1,10
    2504:	00000097          	auipc	ra,0x0
    2508:	a2c080e7          	jalr	-1492(ra) # 1f30 <__divsi3>
    250c:	00251793          	slli	a5,a0,0x2
    2510:	00f507b3          	add	a5,a0,a5
    2514:	00179793          	slli	a5,a5,0x1
    2518:	40f40433          	sub	s0,s0,a5
    251c:	00148493          	addi	s1,s1,1
    2520:	fe848fa3          	sb	s0,-1(s1)
    2524:	00050413          	mv	s0,a0
    2528:	fc041ae3          	bnez	s0,24fc <print_dec+0x34>
    252c:	fd2488e3          	beq	s1,s2,24fc <print_dec+0x34>
    2530:	00006437          	lui	s0,0x6
    2534:	fff4c503          	lbu	a0,-1(s1)
    2538:	16042783          	lw	a5,352(s0) # 6160 <f_putchar>
    253c:	fff48493          	addi	s1,s1,-1
    2540:	03050513          	addi	a0,a0,48
    2544:	000780e7          	jalr	a5
    2548:	ff2496e3          	bne	s1,s2,2534 <print_dec+0x6c>
    254c:	10c12083          	lw	ra,268(sp)
    2550:	10812403          	lw	s0,264(sp)
    2554:	10412483          	lw	s1,260(sp)
    2558:	10012903          	lw	s2,256(sp)
    255c:	11010113          	addi	sp,sp,272
    2560:	00008067          	ret
    2564:	00010493          	mv	s1,sp
    2568:	00010913          	mv	s2,sp
    256c:	fbdff06f          	j	2528 <print_dec+0x60>

00002570 <print_hex_digits>:
    2570:	fe010113          	addi	sp,sp,-32
    2574:	00812c23          	sw	s0,24(sp)
    2578:	00912a23          	sw	s1,20(sp)
    257c:	fff58413          	addi	s0,a1,-1
    2580:	000064b7          	lui	s1,0x6
    2584:	01212823          	sw	s2,16(sp)
    2588:	01312623          	sw	s3,12(sp)
    258c:	00112e23          	sw	ra,28(sp)
    2590:	00050993          	mv	s3,a0
    2594:	00241413          	slli	s0,s0,0x2
    2598:	cf848493          	addi	s1,s1,-776 # 5cf8 <LEDS+0x138>
    259c:	00006937          	lui	s2,0x6
    25a0:	02045063          	bgez	s0,25c0 <print_hex_digits+0x50>
    25a4:	01c12083          	lw	ra,28(sp)
    25a8:	01812403          	lw	s0,24(sp)
    25ac:	01412483          	lw	s1,20(sp)
    25b0:	01012903          	lw	s2,16(sp)
    25b4:	00c12983          	lw	s3,12(sp)
    25b8:	02010113          	addi	sp,sp,32
    25bc:	00008067          	ret
    25c0:	0089d7b3          	srl	a5,s3,s0
    25c4:	00f7f793          	andi	a5,a5,15
    25c8:	00f487b3          	add	a5,s1,a5
    25cc:	16092703          	lw	a4,352(s2) # 6160 <f_putchar>
    25d0:	0007c503          	lbu	a0,0(a5)
    25d4:	ffc40413          	addi	s0,s0,-4
    25d8:	000700e7          	jalr	a4
    25dc:	fc5ff06f          	j	25a0 <print_hex_digits+0x30>

000025e0 <print_hex>:
    25e0:	00800593          	li	a1,8
    25e4:	00000317          	auipc	t1,0x0
    25e8:	f8c30067          	jr	-116(t1) # 2570 <print_hex_digits>

000025ec <printf>:
    25ec:	fa010113          	addi	sp,sp,-96
    25f0:	04f12a23          	sw	a5,84(sp)
    25f4:	04410793          	addi	a5,sp,68
    25f8:	02812c23          	sw	s0,56(sp)
    25fc:	02912a23          	sw	s1,52(sp)
    2600:	03212823          	sw	s2,48(sp)
    2604:	03312623          	sw	s3,44(sp)
    2608:	03412423          	sw	s4,40(sp)
    260c:	03512223          	sw	s5,36(sp)
    2610:	03612023          	sw	s6,32(sp)
    2614:	02112e23          	sw	ra,60(sp)
    2618:	01712e23          	sw	s7,28(sp)
    261c:	00050413          	mv	s0,a0
    2620:	04b12223          	sw	a1,68(sp)
    2624:	04c12423          	sw	a2,72(sp)
    2628:	04d12623          	sw	a3,76(sp)
    262c:	04e12823          	sw	a4,80(sp)
    2630:	05012c23          	sw	a6,88(sp)
    2634:	05112e23          	sw	a7,92(sp)
    2638:	00f12623          	sw	a5,12(sp)
    263c:	02500913          	li	s2,37
    2640:	000064b7          	lui	s1,0x6
    2644:	07300993          	li	s3,115
    2648:	07800a13          	li	s4,120
    264c:	06400a93          	li	s5,100
    2650:	06300b13          	li	s6,99
    2654:	00044503          	lbu	a0,0(s0)
    2658:	02051863          	bnez	a0,2688 <printf+0x9c>
    265c:	03c12083          	lw	ra,60(sp)
    2660:	03812403          	lw	s0,56(sp)
    2664:	03412483          	lw	s1,52(sp)
    2668:	03012903          	lw	s2,48(sp)
    266c:	02c12983          	lw	s3,44(sp)
    2670:	02812a03          	lw	s4,40(sp)
    2674:	02412a83          	lw	s5,36(sp)
    2678:	02012b03          	lw	s6,32(sp)
    267c:	01c12b83          	lw	s7,28(sp)
    2680:	06010113          	addi	sp,sp,96
    2684:	00008067          	ret
    2688:	09251a63          	bne	a0,s2,271c <printf+0x130>
    268c:	00144503          	lbu	a0,1(s0)
    2690:	00140b93          	addi	s7,s0,1
    2694:	03351463          	bne	a0,s3,26bc <printf+0xd0>
    2698:	00c12783          	lw	a5,12(sp)
    269c:	0007a503          	lw	a0,0(a5)
    26a0:	00478713          	addi	a4,a5,4
    26a4:	00e12623          	sw	a4,12(sp)
    26a8:	00000097          	auipc	ra,0x0
    26ac:	ddc080e7          	jalr	-548(ra) # 2484 <print_string>
    26b0:	000b8413          	mv	s0,s7
    26b4:	00140413          	addi	s0,s0,1
    26b8:	f9dff06f          	j	2654 <printf+0x68>
    26bc:	03451063          	bne	a0,s4,26dc <printf+0xf0>
    26c0:	00c12783          	lw	a5,12(sp)
    26c4:	0007a503          	lw	a0,0(a5)
    26c8:	00478713          	addi	a4,a5,4
    26cc:	00e12623          	sw	a4,12(sp)
    26d0:	00000097          	auipc	ra,0x0
    26d4:	f10080e7          	jalr	-240(ra) # 25e0 <print_hex>
    26d8:	fd9ff06f          	j	26b0 <printf+0xc4>
    26dc:	03551063          	bne	a0,s5,26fc <printf+0x110>
    26e0:	00c12783          	lw	a5,12(sp)
    26e4:	0007a503          	lw	a0,0(a5)
    26e8:	00478713          	addi	a4,a5,4
    26ec:	00e12623          	sw	a4,12(sp)
    26f0:	00000097          	auipc	ra,0x0
    26f4:	dd8080e7          	jalr	-552(ra) # 24c8 <print_dec>
    26f8:	fb9ff06f          	j	26b0 <printf+0xc4>
    26fc:	1604a783          	lw	a5,352(s1) # 6160 <f_putchar>
    2700:	01651a63          	bne	a0,s6,2714 <printf+0x128>
    2704:	00c12703          	lw	a4,12(sp)
    2708:	00072503          	lw	a0,0(a4)
    270c:	00470693          	addi	a3,a4,4
    2710:	00d12623          	sw	a3,12(sp)
    2714:	000780e7          	jalr	a5
    2718:	f99ff06f          	j	26b0 <printf+0xc4>
    271c:	1604a783          	lw	a5,352(s1)
    2720:	000780e7          	jalr	a5
    2724:	f91ff06f          	j	26b4 <printf+0xc8>

00002728 <__mulsi3>:
    2728:	00050793          	mv	a5,a0
    272c:	00000513          	li	a0,0
    2730:	00079463          	bnez	a5,2738 <__mulsi3+0x10>
    2734:	00008067          	ret
    2738:	01f79693          	slli	a3,a5,0x1f
    273c:	41f6d713          	srai	a4,a3,0x1f
    2740:	00b77733          	and	a4,a4,a1
    2744:	00e50533          	add	a0,a0,a4
    2748:	0017d793          	srli	a5,a5,0x1
    274c:	00159593          	slli	a1,a1,0x1
    2750:	fe1ff06f          	j	2730 <__mulsi3+0x8>

00002754 <fat_list_insert_last>:
    2754:	00452783          	lw	a5,4(a0)
    2758:	04079263          	bnez	a5,279c <fat_list_insert_last+0x48>
    275c:	00052783          	lw	a5,0(a0)
    2760:	00079c63          	bnez	a5,2778 <fat_list_insert_last+0x24>
    2764:	00b52023          	sw	a1,0(a0)
    2768:	00b52223          	sw	a1,4(a0)
    276c:	0005a023          	sw	zero,0(a1)
    2770:	0005a223          	sw	zero,4(a1)
    2774:	00008067          	ret
    2778:	0007a703          	lw	a4,0(a5)
    277c:	00f5a223          	sw	a5,4(a1)
    2780:	00e5a023          	sw	a4,0(a1)
    2784:	00071863          	bnez	a4,2794 <fat_list_insert_last+0x40>
    2788:	00b52023          	sw	a1,0(a0)
    278c:	00b7a023          	sw	a1,0(a5)
    2790:	00008067          	ret
    2794:	00b72223          	sw	a1,4(a4)
    2798:	ff5ff06f          	j	278c <fat_list_insert_last+0x38>
    279c:	0047a703          	lw	a4,4(a5)
    27a0:	00f5a023          	sw	a5,0(a1)
    27a4:	00e5a223          	sw	a4,4(a1)
    27a8:	00071863          	bnez	a4,27b8 <fat_list_insert_last+0x64>
    27ac:	00b52223          	sw	a1,4(a0)
    27b0:	00b7a223          	sw	a1,4(a5)
    27b4:	00008067          	ret
    27b8:	00b72023          	sw	a1,0(a4)
    27bc:	ff5ff06f          	j	27b0 <fat_list_insert_last+0x5c>

000027c0 <FileString_StrCmpNoCase>:
    27c0:	00050e93          	mv	t4,a0
    27c4:	00000793          	li	a5,0
    27c8:	01900e13          	li	t3,25
    27cc:	00c79663          	bne	a5,a2,27d8 <FileString_StrCmpNoCase+0x18>
    27d0:	00000513          	li	a0,0
    27d4:	00008067          	ret
    27d8:	00fe8733          	add	a4,t4,a5
    27dc:	00074803          	lbu	a6,0(a4)
    27e0:	00f58733          	add	a4,a1,a5
    27e4:	00074883          	lbu	a7,0(a4)
    27e8:	fbf80713          	addi	a4,a6,-65
    27ec:	0ff77713          	zext.b	a4,a4
    27f0:	00080693          	mv	a3,a6
    27f4:	00ee6663          	bltu	t3,a4,2800 <FileString_StrCmpNoCase+0x40>
    27f8:	02080693          	addi	a3,a6,32
    27fc:	0ff6f693          	zext.b	a3,a3
    2800:	fbf88313          	addi	t1,a7,-65
    2804:	0ff37313          	zext.b	t1,t1
    2808:	00088713          	mv	a4,a7
    280c:	006e6663          	bltu	t3,t1,2818 <FileString_StrCmpNoCase+0x58>
    2810:	02088713          	addi	a4,a7,32
    2814:	0ff77713          	zext.b	a4,a4
    2818:	40e68533          	sub	a0,a3,a4
    281c:	00e69863          	bne	a3,a4,282c <FileString_StrCmpNoCase+0x6c>
    2820:	00178793          	addi	a5,a5,1
    2824:	00088463          	beqz	a7,282c <FileString_StrCmpNoCase+0x6c>
    2828:	fa0812e3          	bnez	a6,27cc <FileString_StrCmpNoCase+0xc>
    282c:	00008067          	ret

00002830 <FileString_GetExtension>:
    2830:	00050793          	mv	a5,a0
    2834:	fff00713          	li	a4,-1
    2838:	02e00613          	li	a2,46
    283c:	0007c683          	lbu	a3,0(a5)
    2840:	00069663          	bnez	a3,284c <FileString_GetExtension+0x1c>
    2844:	00070513          	mv	a0,a4
    2848:	00008067          	ret
    284c:	00c69463          	bne	a3,a2,2854 <FileString_GetExtension+0x24>
    2850:	40a78733          	sub	a4,a5,a0
    2854:	00178793          	addi	a5,a5,1
    2858:	fe5ff06f          	j	283c <FileString_GetExtension+0xc>

0000285c <fatfs_fat_writeback>:
    285c:	00059e63          	bnez	a1,2878 <fatfs_fat_writeback+0x1c>
    2860:	00000513          	li	a0,0
    2864:	00008067          	ret
    2868:	00000513          	li	a0,0
    286c:	01c12083          	lw	ra,28(sp)
    2870:	02010113          	addi	sp,sp,32
    2874:	00008067          	ret
    2878:	2045a783          	lw	a5,516(a1)
    287c:	04078e63          	beqz	a5,28d8 <fatfs_fat_writeback+0x7c>
    2880:	03852683          	lw	a3,56(a0)
    2884:	00050793          	mv	a5,a0
    2888:	04068663          	beqz	a3,28d4 <fatfs_fat_writeback+0x78>
    288c:	0147a703          	lw	a4,20(a5)
    2890:	2005a503          	lw	a0,512(a1)
    2894:	0207a803          	lw	a6,32(a5)
    2898:	00100613          	li	a2,1
    289c:	fe010113          	addi	sp,sp,-32
    28a0:	40e607b3          	sub	a5,a2,a4
    28a4:	00112e23          	sw	ra,28(sp)
    28a8:	00a787b3          	add	a5,a5,a0
    28ac:	00f87663          	bgeu	a6,a5,28b8 <fatfs_fat_writeback+0x5c>
    28b0:	01070733          	add	a4,a4,a6
    28b4:	40a70633          	sub	a2,a4,a0
    28b8:	00b12623          	sw	a1,12(sp)
    28bc:	000680e7          	jalr	a3
    28c0:	fa0504e3          	beqz	a0,2868 <fatfs_fat_writeback+0xc>
    28c4:	00c12583          	lw	a1,12(sp)
    28c8:	00100513          	li	a0,1
    28cc:	2005a223          	sw	zero,516(a1)
    28d0:	f9dff06f          	j	286c <fatfs_fat_writeback+0x10>
    28d4:	2005a223          	sw	zero,516(a1)
    28d8:	00100513          	li	a0,1
    28dc:	00008067          	ret

000028e0 <fatfs_fat_read_sector>:
    28e0:	fe010113          	addi	sp,sp,-32
    28e4:	01212823          	sw	s2,16(sp)
    28e8:	25452903          	lw	s2,596(a0)
    28ec:	00812c23          	sw	s0,24(sp)
    28f0:	00112e23          	sw	ra,28(sp)
    28f4:	00912a23          	sw	s1,20(sp)
    28f8:	01312623          	sw	s3,12(sp)
    28fc:	00000413          	li	s0,0
    2900:	04091463          	bnez	s2,2948 <fatfs_fat_read_sector+0x68>
    2904:	25452783          	lw	a5,596(a0)
    2908:	00058493          	mv	s1,a1
    290c:	00050993          	mv	s3,a0
    2910:	20f42623          	sw	a5,524(s0)
    2914:	20442783          	lw	a5,516(s0)
    2918:	24852a23          	sw	s0,596(a0)
    291c:	08079863          	bnez	a5,29ac <fatfs_fat_read_sector+0xcc>
    2920:	0349a783          	lw	a5,52(s3)
    2924:	20942023          	sw	s1,512(s0)
    2928:	00100613          	li	a2,1
    292c:	00040593          	mv	a1,s0
    2930:	00048513          	mv	a0,s1
    2934:	000780e7          	jalr	a5
    2938:	08051463          	bnez	a0,29c0 <fatfs_fat_read_sector+0xe0>
    293c:	fff00793          	li	a5,-1
    2940:	20f42023          	sw	a5,512(s0)
    2944:	0480006f          	j	298c <fatfs_fat_read_sector+0xac>
    2948:	20092783          	lw	a5,512(s2)
    294c:	00f5e663          	bltu	a1,a5,2958 <fatfs_fat_read_sector+0x78>
    2950:	00178713          	addi	a4,a5,1
    2954:	02e5e463          	bltu	a1,a4,297c <fatfs_fat_read_sector+0x9c>
    2958:	20c92783          	lw	a5,524(s2)
    295c:	00079663          	bnez	a5,2968 <fatfs_fat_read_sector+0x88>
    2960:	00040a63          	beqz	s0,2974 <fatfs_fat_read_sector+0x94>
    2964:	20042623          	sw	zero,524(s0)
    2968:	00090413          	mv	s0,s2
    296c:	20c92903          	lw	s2,524(s2)
    2970:	f91ff06f          	j	2900 <fatfs_fat_read_sector+0x20>
    2974:	24052a23          	sw	zero,596(a0)
    2978:	ff1ff06f          	j	2968 <fatfs_fat_read_sector+0x88>
    297c:	40f585b3          	sub	a1,a1,a5
    2980:	00959593          	slli	a1,a1,0x9
    2984:	00b905b3          	add	a1,s2,a1
    2988:	20b92423          	sw	a1,520(s2)
    298c:	01c12083          	lw	ra,28(sp)
    2990:	01812403          	lw	s0,24(sp)
    2994:	01412483          	lw	s1,20(sp)
    2998:	00c12983          	lw	s3,12(sp)
    299c:	00090513          	mv	a0,s2
    29a0:	01012903          	lw	s2,16(sp)
    29a4:	02010113          	addi	sp,sp,32
    29a8:	00008067          	ret
    29ac:	00040593          	mv	a1,s0
    29b0:	00000097          	auipc	ra,0x0
    29b4:	eac080e7          	jalr	-340(ra) # 285c <fatfs_fat_writeback>
    29b8:	f60514e3          	bnez	a0,2920 <fatfs_fat_read_sector+0x40>
    29bc:	fd1ff06f          	j	298c <fatfs_fat_read_sector+0xac>
    29c0:	20842423          	sw	s0,520(s0)
    29c4:	00040913          	mv	s2,s0
    29c8:	fc5ff06f          	j	298c <fatfs_fat_read_sector+0xac>

000029cc <_allocate_file>:
    29cc:	000067b7          	lui	a5,0x6
    29d0:	16478793          	addi	a5,a5,356 # 6164 <_free_file_list>
    29d4:	0007a583          	lw	a1,0(a5)
    29d8:	06058263          	beqz	a1,2a3c <_allocate_file+0x70>
    29dc:	0005a703          	lw	a4,0(a1)
    29e0:	fe010113          	addi	sp,sp,-32
    29e4:	00112e23          	sw	ra,28(sp)
    29e8:	0045a683          	lw	a3,4(a1)
    29ec:	04071063          	bnez	a4,2a2c <_allocate_file+0x60>
    29f0:	00d7a023          	sw	a3,0(a5)
    29f4:	0045a683          	lw	a3,4(a1)
    29f8:	02069e63          	bnez	a3,2a34 <_allocate_file+0x68>
    29fc:	00e7a223          	sw	a4,4(a5)
    2a00:	00006537          	lui	a0,0x6
    2a04:	16c50513          	addi	a0,a0,364 # 616c <_open_file_list>
    2a08:	00b12623          	sw	a1,12(sp)
    2a0c:	00000097          	auipc	ra,0x0
    2a10:	d48080e7          	jalr	-696(ra) # 2754 <fat_list_insert_last>
    2a14:	00c12583          	lw	a1,12(sp)
    2a18:	01c12083          	lw	ra,28(sp)
    2a1c:	bc458593          	addi	a1,a1,-1084
    2a20:	00058513          	mv	a0,a1
    2a24:	02010113          	addi	sp,sp,32
    2a28:	00008067          	ret
    2a2c:	00d72223          	sw	a3,4(a4)
    2a30:	fc5ff06f          	j	29f4 <_allocate_file+0x28>
    2a34:	00e6a023          	sw	a4,0(a3)
    2a38:	fc9ff06f          	j	2a00 <_allocate_file+0x34>
    2a3c:	00058513          	mv	a0,a1
    2a40:	00008067          	ret

00002a44 <_free_file>:
    2a44:	43c52783          	lw	a5,1084(a0)
    2a48:	44052703          	lw	a4,1088(a0)
    2a4c:	43c50593          	addi	a1,a0,1084
    2a50:	02079663          	bnez	a5,2a7c <_free_file+0x38>
    2a54:	000066b7          	lui	a3,0x6
    2a58:	16e6a623          	sw	a4,364(a3) # 616c <_open_file_list>
    2a5c:	44052703          	lw	a4,1088(a0)
    2a60:	02071263          	bnez	a4,2a84 <_free_file+0x40>
    2a64:	00006737          	lui	a4,0x6
    2a68:	16f72823          	sw	a5,368(a4) # 6170 <_open_file_list+0x4>
    2a6c:	00006537          	lui	a0,0x6
    2a70:	16450513          	addi	a0,a0,356 # 6164 <_free_file_list>
    2a74:	00000317          	auipc	t1,0x0
    2a78:	ce030067          	jr	-800(t1) # 2754 <fat_list_insert_last>
    2a7c:	00e7a223          	sw	a4,4(a5)
    2a80:	fddff06f          	j	2a5c <_free_file+0x18>
    2a84:	00f72023          	sw	a5,0(a4)
    2a88:	fe5ff06f          	j	2a6c <_free_file+0x28>

00002a8c <fatfs_lba_of_cluster>:
    2a8c:	ff010113          	addi	sp,sp,-16
    2a90:	00812423          	sw	s0,8(sp)
    2a94:	00112623          	sw	ra,12(sp)
    2a98:	00050413          	mv	s0,a0
    2a9c:	ffe58513          	addi	a0,a1,-2
    2aa0:	00044583          	lbu	a1,0(s0)
    2aa4:	00000097          	auipc	ra,0x0
    2aa8:	c84080e7          	jalr	-892(ra) # 2728 <__mulsi3>
    2aac:	00442783          	lw	a5,4(s0)
    2ab0:	00f50533          	add	a0,a0,a5
    2ab4:	03042783          	lw	a5,48(s0)
    2ab8:	00079863          	bnez	a5,2ac8 <fatfs_lba_of_cluster+0x3c>
    2abc:	02845783          	lhu	a5,40(s0)
    2ac0:	4047d793          	srai	a5,a5,0x4
    2ac4:	00f50533          	add	a0,a0,a5
    2ac8:	00c12083          	lw	ra,12(sp)
    2acc:	00812403          	lw	s0,8(sp)
    2ad0:	01010113          	addi	sp,sp,16
    2ad4:	00008067          	ret

00002ad8 <fatfs_sector_read>:
    2ad8:	03452783          	lw	a5,52(a0)
    2adc:	00058713          	mv	a4,a1
    2ae0:	00070513          	mv	a0,a4
    2ae4:	00060593          	mv	a1,a2
    2ae8:	00068613          	mv	a2,a3
    2aec:	00078067          	jr	a5

00002af0 <fatfs_sector_write>:
    2af0:	03852783          	lw	a5,56(a0)
    2af4:	00058713          	mv	a4,a1
    2af8:	00070513          	mv	a0,a4
    2afc:	00060593          	mv	a1,a2
    2b00:	00068613          	mv	a2,a3
    2b04:	00078067          	jr	a5

00002b08 <fatfs_write_sector>:
    2b08:	03852703          	lw	a4,56(a0)
    2b0c:	0a070463          	beqz	a4,2bb4 <fatfs_write_sector+0xac>
    2b10:	03052883          	lw	a7,48(a0)
    2b14:	00050793          	mv	a5,a0
    2b18:	0115e833          	or	a6,a1,a7
    2b1c:	02081e63          	bnez	a6,2b58 <fatfs_write_sector+0x50>
    2b20:	01052583          	lw	a1,16(a0)
    2b24:	08b67863          	bgeu	a2,a1,2bb4 <fatfs_write_sector+0xac>
    2b28:	01c52503          	lw	a0,28(a0)
    2b2c:	00c7a583          	lw	a1,12(a5)
    2b30:	00b50533          	add	a0,a0,a1
    2b34:	00c50533          	add	a0,a0,a2
    2b38:	00068863          	beqz	a3,2b48 <fatfs_write_sector+0x40>
    2b3c:	00100613          	li	a2,1
    2b40:	00068593          	mv	a1,a3
    2b44:	00070067          	jr	a4
    2b48:	24a7a223          	sw	a0,580(a5)
    2b4c:	00100613          	li	a2,1
    2b50:	04478593          	addi	a1,a5,68
    2b54:	ff1ff06f          	j	2b44 <fatfs_write_sector+0x3c>
    2b58:	fe010113          	addi	sp,sp,-32
    2b5c:	00e12623          	sw	a4,12(sp)
    2b60:	00d12423          	sw	a3,8(sp)
    2b64:	00c12223          	sw	a2,4(sp)
    2b68:	00112e23          	sw	ra,28(sp)
    2b6c:	00a12023          	sw	a0,0(sp)
    2b70:	00000097          	auipc	ra,0x0
    2b74:	f1c080e7          	jalr	-228(ra) # 2a8c <fatfs_lba_of_cluster>
    2b78:	00412603          	lw	a2,4(sp)
    2b7c:	00812683          	lw	a3,8(sp)
    2b80:	00012783          	lw	a5,0(sp)
    2b84:	00c12703          	lw	a4,12(sp)
    2b88:	00a60533          	add	a0,a2,a0
    2b8c:	00068c63          	beqz	a3,2ba4 <fatfs_write_sector+0x9c>
    2b90:	00100613          	li	a2,1
    2b94:	00068593          	mv	a1,a3
    2b98:	01c12083          	lw	ra,28(sp)
    2b9c:	02010113          	addi	sp,sp,32
    2ba0:	fa5ff06f          	j	2b44 <fatfs_write_sector+0x3c>
    2ba4:	24a7a223          	sw	a0,580(a5)
    2ba8:	00100613          	li	a2,1
    2bac:	04478593          	addi	a1,a5,68
    2bb0:	fe9ff06f          	j	2b98 <fatfs_write_sector+0x90>
    2bb4:	00000513          	li	a0,0
    2bb8:	00008067          	ret

00002bbc <fl_init>:
    2bbc:	ff010113          	addi	sp,sp,-16
    2bc0:	00006537          	lui	a0,0x6
    2bc4:	000067b7          	lui	a5,0x6
    2bc8:	000085b7          	lui	a1,0x8
    2bcc:	00112623          	sw	ra,12(sp)
    2bd0:	16450513          	addi	a0,a0,356 # 6164 <_free_file_list>
    2bd4:	16c78793          	addi	a5,a5,364 # 616c <_open_file_list>
    2bd8:	63c58593          	addi	a1,a1,1596 # 863c <_files+0x43c>
    2bdc:	00052223          	sw	zero,4(a0)
    2be0:	00052023          	sw	zero,0(a0)
    2be4:	0007a223          	sw	zero,4(a5)
    2be8:	0007a023          	sw	zero,0(a5)
    2bec:	00000097          	auipc	ra,0x0
    2bf0:	b68080e7          	jalr	-1176(ra) # 2754 <fat_list_insert_last>
    2bf4:	000067b7          	lui	a5,0x6
    2bf8:	000095b7          	lui	a1,0x9
    2bfc:	16478513          	addi	a0,a5,356 # 6164 <_free_file_list>
    2c00:	a8058593          	addi	a1,a1,-1408 # 8a80 <_files+0x880>
    2c04:	00000097          	auipc	ra,0x0
    2c08:	b50080e7          	jalr	-1200(ra) # 2754 <fat_list_insert_last>
    2c0c:	00c12083          	lw	ra,12(sp)
    2c10:	000067b7          	lui	a5,0x6
    2c14:	00100713          	li	a4,1
    2c18:	16e7ac23          	sw	a4,376(a5) # 6178 <_filelib_init>
    2c1c:	01010113          	addi	sp,sp,16
    2c20:	00008067          	ret

00002c24 <fl_fseek>:
    2c24:	000067b7          	lui	a5,0x6
    2c28:	1787a783          	lw	a5,376(a5) # 6178 <_filelib_init>
    2c2c:	fd010113          	addi	sp,sp,-48
    2c30:	02812423          	sw	s0,40(sp)
    2c34:	02912223          	sw	s1,36(sp)
    2c38:	01312e23          	sw	s3,28(sp)
    2c3c:	02112623          	sw	ra,44(sp)
    2c40:	03212023          	sw	s2,32(sp)
    2c44:	00050413          	mv	s0,a0
    2c48:	00058493          	mv	s1,a1
    2c4c:	00060993          	mv	s3,a2
    2c50:	00079663          	bnez	a5,2c5c <fl_fseek+0x38>
    2c54:	00000097          	auipc	ra,0x0
    2c58:	f68080e7          	jalr	-152(ra) # 2bbc <fl_init>
    2c5c:	fff00513          	li	a0,-1
    2c60:	08040263          	beqz	s0,2ce4 <fl_fseek+0xc0>
    2c64:	00048663          	beqz	s1,2c70 <fl_fseek+0x4c>
    2c68:	ffe98793          	addi	a5,s3,-2
    2c6c:	06078c63          	beqz	a5,2ce4 <fl_fseek+0xc0>
    2c70:	00008937          	lui	s2,0x8
    2c74:	d9890913          	addi	s2,s2,-616 # 7d98 <_fs>
    2c78:	03c92783          	lw	a5,60(s2)
    2c7c:	00078463          	beqz	a5,2c84 <fl_fseek+0x60>
    2c80:	000780e7          	jalr	a5
    2c84:	fff00513          	li	a0,-1
    2c88:	42a42823          	sw	a0,1072(s0)
    2c8c:	42042a23          	sw	zero,1076(s0)
    2c90:	00099c63          	bnez	s3,2ca8 <fl_fseek+0x84>
    2c94:	00c42783          	lw	a5,12(s0)
    2c98:	00942423          	sw	s1,8(s0)
    2c9c:	0297f863          	bgeu	a5,s1,2ccc <fl_fseek+0xa8>
    2ca0:	00f42423          	sw	a5,8(s0)
    2ca4:	0280006f          	j	2ccc <fl_fseek+0xa8>
    2ca8:	00100793          	li	a5,1
    2cac:	06f99063          	bne	s3,a5,2d0c <fl_fseek+0xe8>
    2cb0:	00842783          	lw	a5,8(s0)
    2cb4:	0004c663          	bltz	s1,2cc0 <fl_fseek+0x9c>
    2cb8:	00f484b3          	add	s1,s1,a5
    2cbc:	fd9ff06f          	j	2c94 <fl_fseek+0x70>
    2cc0:	40900733          	neg	a4,s1
    2cc4:	02e7fe63          	bgeu	a5,a4,2d00 <fl_fseek+0xdc>
    2cc8:	00042423          	sw	zero,8(s0)
    2ccc:	00000513          	li	a0,0
    2cd0:	04092783          	lw	a5,64(s2)
    2cd4:	00078863          	beqz	a5,2ce4 <fl_fseek+0xc0>
    2cd8:	00a12623          	sw	a0,12(sp)
    2cdc:	000780e7          	jalr	a5
    2ce0:	00c12503          	lw	a0,12(sp)
    2ce4:	02c12083          	lw	ra,44(sp)
    2ce8:	02812403          	lw	s0,40(sp)
    2cec:	02412483          	lw	s1,36(sp)
    2cf0:	02012903          	lw	s2,32(sp)
    2cf4:	01c12983          	lw	s3,28(sp)
    2cf8:	03010113          	addi	sp,sp,48
    2cfc:	00008067          	ret
    2d00:	00f484b3          	add	s1,s1,a5
    2d04:	00942423          	sw	s1,8(s0)
    2d08:	fc5ff06f          	j	2ccc <fl_fseek+0xa8>
    2d0c:	00200793          	li	a5,2
    2d10:	fcf990e3          	bne	s3,a5,2cd0 <fl_fseek+0xac>
    2d14:	00c42783          	lw	a5,12(s0)
    2d18:	f89ff06f          	j	2ca0 <fl_fseek+0x7c>

00002d1c <fl_closedir>:
    2d1c:	00000513          	li	a0,0
    2d20:	00008067          	ret

00002d24 <fatfs_lfn_cache_entry>:
    2d24:	0005c783          	lbu	a5,0(a1)
    2d28:	01300693          	li	a3,19
    2d2c:	01f7f793          	andi	a5,a5,31
    2d30:	fff78713          	addi	a4,a5,-1
    2d34:	0ff77613          	zext.b	a2,a4
    2d38:	0ac6ea63          	bltu	a3,a2,2dec <fatfs_lfn_cache_entry+0xc8>
    2d3c:	10554683          	lbu	a3,261(a0)
    2d40:	00069463          	bnez	a3,2d48 <fatfs_lfn_cache_entry+0x24>
    2d44:	10f502a3          	sb	a5,261(a0)
    2d48:	00171793          	slli	a5,a4,0x1
    2d4c:	00e787b3          	add	a5,a5,a4
    2d50:	0015c683          	lbu	a3,1(a1)
    2d54:	00279793          	slli	a5,a5,0x2
    2d58:	00e787b3          	add	a5,a5,a4
    2d5c:	00f50533          	add	a0,a0,a5
    2d60:	00d50023          	sb	a3,0(a0)
    2d64:	0035c783          	lbu	a5,3(a1)
    2d68:	0ff00713          	li	a4,255
    2d6c:	02000693          	li	a3,32
    2d70:	00f500a3          	sb	a5,1(a0)
    2d74:	0055c783          	lbu	a5,5(a1)
    2d78:	00f50123          	sb	a5,2(a0)
    2d7c:	0075c783          	lbu	a5,7(a1)
    2d80:	00f501a3          	sb	a5,3(a0)
    2d84:	0095c783          	lbu	a5,9(a1)
    2d88:	00f50223          	sb	a5,4(a0)
    2d8c:	00e5c783          	lbu	a5,14(a1)
    2d90:	00f502a3          	sb	a5,5(a0)
    2d94:	0105c783          	lbu	a5,16(a1)
    2d98:	00f50323          	sb	a5,6(a0)
    2d9c:	0125c783          	lbu	a5,18(a1)
    2da0:	00f503a3          	sb	a5,7(a0)
    2da4:	0145c783          	lbu	a5,20(a1)
    2da8:	00f50423          	sb	a5,8(a0)
    2dac:	0165c783          	lbu	a5,22(a1)
    2db0:	00f504a3          	sb	a5,9(a0)
    2db4:	0185c783          	lbu	a5,24(a1)
    2db8:	00f50523          	sb	a5,10(a0)
    2dbc:	01c5c783          	lbu	a5,28(a1)
    2dc0:	00f505a3          	sb	a5,11(a0)
    2dc4:	01e5c783          	lbu	a5,30(a1)
    2dc8:	00f50623          	sb	a5,12(a0)
    2dcc:	00d00793          	li	a5,13
    2dd0:	00054603          	lbu	a2,0(a0)
    2dd4:	00e61463          	bne	a2,a4,2ddc <fatfs_lfn_cache_entry+0xb8>
    2dd8:	00d50023          	sb	a3,0(a0)
    2ddc:	fff78793          	addi	a5,a5,-1
    2de0:	0ff7f793          	zext.b	a5,a5
    2de4:	00150513          	addi	a0,a0,1
    2de8:	fe0794e3          	bnez	a5,2dd0 <fatfs_lfn_cache_entry+0xac>
    2dec:	00008067          	ret

00002df0 <fatfs_lfn_cache_get>:
    2df0:	10554703          	lbu	a4,261(a0)
    2df4:	01400793          	li	a5,20
    2df8:	00f71663          	bne	a4,a5,2e04 <fatfs_lfn_cache_get+0x14>
    2dfc:	10050223          	sb	zero,260(a0)
    2e00:	00008067          	ret
    2e04:	02070063          	beqz	a4,2e24 <fatfs_lfn_cache_get+0x34>
    2e08:	00171793          	slli	a5,a4,0x1
    2e0c:	00e787b3          	add	a5,a5,a4
    2e10:	00279793          	slli	a5,a5,0x2
    2e14:	00e787b3          	add	a5,a5,a4
    2e18:	00f507b3          	add	a5,a0,a5
    2e1c:	00078023          	sb	zero,0(a5)
    2e20:	00008067          	ret
    2e24:	00050023          	sb	zero,0(a0)
    2e28:	00008067          	ret

00002e2c <fatfs_entry_lfn_text>:
    2e2c:	00b54503          	lbu	a0,11(a0)
    2e30:	00f57513          	andi	a0,a0,15
    2e34:	ff150513          	addi	a0,a0,-15
    2e38:	00153513          	seqz	a0,a0
    2e3c:	00008067          	ret

00002e40 <fatfs_entry_lfn_invalid>:
    2e40:	00054783          	lbu	a5,0(a0)
    2e44:	f1b78713          	addi	a4,a5,-229
    2e48:	02070263          	beqz	a4,2e6c <fatfs_entry_lfn_invalid+0x2c>
    2e4c:	02078063          	beqz	a5,2e6c <fatfs_entry_lfn_invalid+0x2c>
    2e50:	00b54783          	lbu	a5,11(a0)
    2e54:	00800713          	li	a4,8
    2e58:	00100513          	li	a0,1
    2e5c:	00e78a63          	beq	a5,a4,2e70 <fatfs_entry_lfn_invalid+0x30>
    2e60:	0067f793          	andi	a5,a5,6
    2e64:	00f03533          	snez	a0,a5
    2e68:	00008067          	ret
    2e6c:	00100513          	li	a0,1
    2e70:	00008067          	ret

00002e74 <fatfs_entry_lfn_exists>:
    2e74:	00b5c783          	lbu	a5,11(a1)
    2e78:	00f00713          	li	a4,15
    2e7c:	04e78063          	beq	a5,a4,2ebc <fatfs_entry_lfn_exists+0x48>
    2e80:	0005c683          	lbu	a3,0(a1)
    2e84:	f1b68713          	addi	a4,a3,-229
    2e88:	00e03733          	snez	a4,a4
    2e8c:	00d036b3          	snez	a3,a3
    2e90:	00d77733          	and	a4,a4,a3
    2e94:	02070463          	beqz	a4,2ebc <fatfs_entry_lfn_exists+0x48>
    2e98:	ff878713          	addi	a4,a5,-8
    2e9c:	02070063          	beqz	a4,2ebc <fatfs_entry_lfn_exists+0x48>
    2ea0:	0067f713          	andi	a4,a5,6
    2ea4:	00000793          	li	a5,0
    2ea8:	00071663          	bnez	a4,2eb4 <fatfs_entry_lfn_exists+0x40>
    2eac:	10554783          	lbu	a5,261(a0)
    2eb0:	00f037b3          	snez	a5,a5
    2eb4:	00078513          	mv	a0,a5
    2eb8:	00008067          	ret
    2ebc:	00000793          	li	a5,0
    2ec0:	ff5ff06f          	j	2eb4 <fatfs_entry_lfn_exists+0x40>

00002ec4 <fatfs_entry_sfn_only>:
    2ec4:	00b54783          	lbu	a5,11(a0)
    2ec8:	00f00713          	li	a4,15
    2ecc:	02e78863          	beq	a5,a4,2efc <fatfs_entry_sfn_only+0x38>
    2ed0:	00054683          	lbu	a3,0(a0)
    2ed4:	f1b68713          	addi	a4,a3,-229
    2ed8:	00e03733          	snez	a4,a4
    2edc:	00d036b3          	snez	a3,a3
    2ee0:	00d77733          	and	a4,a4,a3
    2ee4:	00070c63          	beqz	a4,2efc <fatfs_entry_sfn_only+0x38>
    2ee8:	ff878713          	addi	a4,a5,-8
    2eec:	00070863          	beqz	a4,2efc <fatfs_entry_sfn_only+0x38>
    2ef0:	0067f513          	andi	a0,a5,6
    2ef4:	00153513          	seqz	a0,a0
    2ef8:	00008067          	ret
    2efc:	00000513          	li	a0,0
    2f00:	00008067          	ret

00002f04 <fatfs_entry_is_dir>:
    2f04:	00b54503          	lbu	a0,11(a0)
    2f08:	00455513          	srli	a0,a0,0x4
    2f0c:	00157513          	andi	a0,a0,1
    2f10:	00008067          	ret

00002f14 <fatfs_lfn_entries_required>:
    2f14:	ff010113          	addi	sp,sp,-16
    2f18:	00112623          	sw	ra,12(sp)
    2f1c:	fffff097          	auipc	ra,0xfffff
    2f20:	108080e7          	jalr	264(ra) # 2024 <strlen>
    2f24:	00050a63          	beqz	a0,2f38 <fatfs_lfn_entries_required+0x24>
    2f28:	00d00593          	li	a1,13
    2f2c:	00c50513          	addi	a0,a0,12
    2f30:	fffff097          	auipc	ra,0xfffff
    2f34:	000080e7          	jalr	ra # 1f30 <__divsi3>
    2f38:	00c12083          	lw	ra,12(sp)
    2f3c:	01010113          	addi	sp,sp,16
    2f40:	00008067          	ret

00002f44 <fatfs_filename_to_lfn>:
    2f44:	f9010113          	addi	sp,sp,-112
    2f48:	06812423          	sw	s0,104(sp)
    2f4c:	00058413          	mv	s0,a1
    2f50:	000065b7          	lui	a1,0x6
    2f54:	f2058593          	addi	a1,a1,-224 # 5f20 <font+0x1e0>
    2f58:	06912223          	sw	s1,100(sp)
    2f5c:	05312e23          	sw	s3,92(sp)
    2f60:	00060493          	mv	s1,a2
    2f64:	00050993          	mv	s3,a0
    2f68:	03400613          	li	a2,52
    2f6c:	01c10513          	addi	a0,sp,28
    2f70:	00d12623          	sw	a3,12(sp)
    2f74:	06112623          	sw	ra,108(sp)
    2f78:	07212023          	sw	s2,96(sp)
    2f7c:	05412c23          	sw	s4,88(sp)
    2f80:	fffff097          	auipc	ra,0xfffff
    2f84:	080080e7          	jalr	128(ra) # 2000 <memcpy>
    2f88:	00098513          	mv	a0,s3
    2f8c:	fffff097          	auipc	ra,0xfffff
    2f90:	098080e7          	jalr	152(ra) # 2024 <strlen>
    2f94:	00050913          	mv	s2,a0
    2f98:	00098513          	mv	a0,s3
    2f9c:	00000097          	auipc	ra,0x0
    2fa0:	f78080e7          	jalr	-136(ra) # 2f14 <fatfs_lfn_entries_required>
    2fa4:	00050a13          	mv	s4,a0
    2fa8:	02000613          	li	a2,32
    2fac:	00000593          	li	a1,0
    2fb0:	00040513          	mv	a0,s0
    2fb4:	fffff097          	auipc	ra,0xfffff
    2fb8:	030080e7          	jalr	48(ra) # 1fe4 <memset>
    2fbc:	fffa0713          	addi	a4,s4,-1
    2fc0:	00c12683          	lw	a3,12(sp)
    2fc4:	00148793          	addi	a5,s1,1
    2fc8:	00971463          	bne	a4,s1,2fd0 <fatfs_filename_to_lfn+0x8c>
    2fcc:	0407e793          	ori	a5,a5,64
    2fd0:	00149613          	slli	a2,s1,0x1
    2fd4:	00960633          	add	a2,a2,s1
    2fd8:	00f40023          	sb	a5,0(s0)
    2fdc:	00261613          	slli	a2,a2,0x2
    2fe0:	00f00793          	li	a5,15
    2fe4:	00f405a3          	sb	a5,11(s0)
    2fe8:	00d406a3          	sb	a3,13(s0)
    2fec:	01c10793          	addi	a5,sp,28
    2ff0:	00960633          	add	a2,a2,s1
    2ff4:	fff00693          	li	a3,-1
    2ff8:	0007a703          	lw	a4,0(a5)
    2ffc:	00e40733          	add	a4,s0,a4
    3000:	05265063          	bge	a2,s2,3040 <fatfs_filename_to_lfn+0xfc>
    3004:	00c985b3          	add	a1,s3,a2
    3008:	0005c583          	lbu	a1,0(a1)
    300c:	00b70023          	sb	a1,0(a4)
    3010:	00478793          	addi	a5,a5,4
    3014:	05010713          	addi	a4,sp,80
    3018:	00160613          	addi	a2,a2,1
    301c:	fce79ee3          	bne	a5,a4,2ff8 <fatfs_filename_to_lfn+0xb4>
    3020:	06c12083          	lw	ra,108(sp)
    3024:	06812403          	lw	s0,104(sp)
    3028:	06412483          	lw	s1,100(sp)
    302c:	06012903          	lw	s2,96(sp)
    3030:	05c12983          	lw	s3,92(sp)
    3034:	05812a03          	lw	s4,88(sp)
    3038:	07010113          	addi	sp,sp,112
    303c:	00008067          	ret
    3040:	01261663          	bne	a2,s2,304c <fatfs_filename_to_lfn+0x108>
    3044:	00070023          	sb	zero,0(a4)
    3048:	fc9ff06f          	j	3010 <fatfs_filename_to_lfn+0xcc>
    304c:	00d70023          	sb	a3,0(a4)
    3050:	00d700a3          	sb	a3,1(a4)
    3054:	fbdff06f          	j	3010 <fatfs_filename_to_lfn+0xcc>

00003058 <fatfs_sfn_create_entry>:
    3058:	00000793          	li	a5,0
    305c:	00b00813          	li	a6,11
    3060:	00f508b3          	add	a7,a0,a5
    3064:	0008c303          	lbu	t1,0(a7)
    3068:	00f688b3          	add	a7,a3,a5
    306c:	00178793          	addi	a5,a5,1
    3070:	00688023          	sb	t1,0(a7)
    3074:	ff0796e3          	bne	a5,a6,3060 <fatfs_sfn_create_entry+0x8>
    3078:	00e03733          	snez	a4,a4
    307c:	40e00733          	neg	a4,a4
    3080:	02000793          	li	a5,32
    3084:	ff077713          	andi	a4,a4,-16
    3088:	00f70733          	add	a4,a4,a5
    308c:	00f68823          	sb	a5,16(a3)
    3090:	00f68923          	sb	a5,18(a3)
    3094:	00f68c23          	sb	a5,24(a3)
    3098:	01065793          	srli	a5,a2,0x10
    309c:	00f68a23          	sb	a5,20(a3)
    30a0:	01865793          	srli	a5,a2,0x18
    30a4:	00f68aa3          	sb	a5,21(a3)
    30a8:	0085d793          	srli	a5,a1,0x8
    30ac:	00c68d23          	sb	a2,26(a3)
    30b0:	00b68e23          	sb	a1,28(a3)
    30b4:	00865613          	srli	a2,a2,0x8
    30b8:	00f68ea3          	sb	a5,29(a3)
    30bc:	0105d793          	srli	a5,a1,0x10
    30c0:	0185d593          	srli	a1,a1,0x18
    30c4:	000686a3          	sb	zero,13(a3)
    30c8:	00068723          	sb	zero,14(a3)
    30cc:	000687a3          	sb	zero,15(a3)
    30d0:	000688a3          	sb	zero,17(a3)
    30d4:	000689a3          	sb	zero,19(a3)
    30d8:	00068b23          	sb	zero,22(a3)
    30dc:	00068ba3          	sb	zero,23(a3)
    30e0:	00068ca3          	sb	zero,25(a3)
    30e4:	00e685a3          	sb	a4,11(a3)
    30e8:	00068623          	sb	zero,12(a3)
    30ec:	00c68da3          	sb	a2,27(a3)
    30f0:	00f68f23          	sb	a5,30(a3)
    30f4:	00b68fa3          	sb	a1,31(a3)
    30f8:	00008067          	ret

000030fc <fatfs_lfn_create_sfn>:
    30fc:	fd010113          	addi	sp,sp,-48
    3100:	02912223          	sw	s1,36(sp)
    3104:	00050493          	mv	s1,a0
    3108:	00058513          	mv	a0,a1
    310c:	02812423          	sw	s0,40(sp)
    3110:	01312e23          	sw	s3,28(sp)
    3114:	00058413          	mv	s0,a1
    3118:	02112623          	sw	ra,44(sp)
    311c:	03212023          	sw	s2,32(sp)
    3120:	fffff097          	auipc	ra,0xfffff
    3124:	f04080e7          	jalr	-252(ra) # 2024 <strlen>
    3128:	00044783          	lbu	a5,0(s0)
    312c:	02e00993          	li	s3,46
    3130:	15378063          	beq	a5,s3,3270 <fatfs_lfn_create_sfn+0x174>
    3134:	00b00613          	li	a2,11
    3138:	02000593          	li	a1,32
    313c:	00050913          	mv	s2,a0
    3140:	00048513          	mv	a0,s1
    3144:	fffff097          	auipc	ra,0xfffff
    3148:	ea0080e7          	jalr	-352(ra) # 1fe4 <memset>
    314c:	00300613          	li	a2,3
    3150:	02000593          	li	a1,32
    3154:	00c10513          	addi	a0,sp,12
    3158:	fffff097          	auipc	ra,0xfffff
    315c:	e8c080e7          	jalr	-372(ra) # 1fe4 <memset>
    3160:	fff00793          	li	a5,-1
    3164:	00000713          	li	a4,0
    3168:	0d274263          	blt	a4,s2,322c <fatfs_lfn_create_sfn+0x130>
    316c:	fff00713          	li	a4,-1
    3170:	0ee78863          	beq	a5,a4,3260 <fatfs_lfn_create_sfn+0x164>
    3174:	00178713          	addi	a4,a5,1
    3178:	00c10693          	addi	a3,sp,12
    317c:	00478613          	addi	a2,a5,4
    3180:	0ce61263          	bne	a2,a4,3244 <fatfs_lfn_create_sfn+0x148>
    3184:	00000613          	li	a2,0
    3188:	00000693          	li	a3,0
    318c:	01900813          	li	a6,25
    3190:	00800893          	li	a7,8
    3194:	02f6de63          	bge	a3,a5,31d0 <fatfs_lfn_create_sfn+0xd4>
    3198:	00d40733          	add	a4,s0,a3
    319c:	00074703          	lbu	a4,0(a4)
    31a0:	fe070513          	addi	a0,a4,-32
    31a4:	0c050263          	beqz	a0,3268 <fatfs_lfn_create_sfn+0x16c>
    31a8:	fd270593          	addi	a1,a4,-46
    31ac:	0a058e63          	beqz	a1,3268 <fatfs_lfn_create_sfn+0x16c>
    31b0:	f9f70593          	addi	a1,a4,-97
    31b4:	0ff5f593          	zext.b	a1,a1
    31b8:	00c48333          	add	t1,s1,a2
    31bc:	00160613          	addi	a2,a2,1
    31c0:	00b86463          	bltu	a6,a1,31c8 <fatfs_lfn_create_sfn+0xcc>
    31c4:	0ff57713          	zext.b	a4,a0
    31c8:	00e30023          	sb	a4,0(t1)
    31cc:	09161e63          	bne	a2,a7,3268 <fatfs_lfn_create_sfn+0x16c>
    31d0:	00c10793          	addi	a5,sp,12
    31d4:	00800693          	li	a3,8
    31d8:	01900513          	li	a0,25
    31dc:	00b00593          	li	a1,11
    31e0:	0007c703          	lbu	a4,0(a5)
    31e4:	f9f70613          	addi	a2,a4,-97
    31e8:	0ff67613          	zext.b	a2,a2
    31ec:	00c56663          	bltu	a0,a2,31f8 <fatfs_lfn_create_sfn+0xfc>
    31f0:	fe070713          	addi	a4,a4,-32
    31f4:	0ff77713          	zext.b	a4,a4
    31f8:	00d48633          	add	a2,s1,a3
    31fc:	00e60023          	sb	a4,0(a2)
    3200:	00168693          	addi	a3,a3,1
    3204:	00178793          	addi	a5,a5,1
    3208:	fcb69ce3          	bne	a3,a1,31e0 <fatfs_lfn_create_sfn+0xe4>
    320c:	00100513          	li	a0,1
    3210:	02c12083          	lw	ra,44(sp)
    3214:	02812403          	lw	s0,40(sp)
    3218:	02412483          	lw	s1,36(sp)
    321c:	02012903          	lw	s2,32(sp)
    3220:	01c12983          	lw	s3,28(sp)
    3224:	03010113          	addi	sp,sp,48
    3228:	00008067          	ret
    322c:	00e406b3          	add	a3,s0,a4
    3230:	0006c683          	lbu	a3,0(a3)
    3234:	01369463          	bne	a3,s3,323c <fatfs_lfn_create_sfn+0x140>
    3238:	00070793          	mv	a5,a4
    323c:	00170713          	addi	a4,a4,1
    3240:	f29ff06f          	j	3168 <fatfs_lfn_create_sfn+0x6c>
    3244:	01275863          	bge	a4,s2,3254 <fatfs_lfn_create_sfn+0x158>
    3248:	00e405b3          	add	a1,s0,a4
    324c:	0005c583          	lbu	a1,0(a1)
    3250:	00b68023          	sb	a1,0(a3)
    3254:	00170713          	addi	a4,a4,1
    3258:	00168693          	addi	a3,a3,1
    325c:	f25ff06f          	j	3180 <fatfs_lfn_create_sfn+0x84>
    3260:	00090793          	mv	a5,s2
    3264:	f21ff06f          	j	3184 <fatfs_lfn_create_sfn+0x88>
    3268:	00168693          	addi	a3,a3,1
    326c:	f29ff06f          	j	3194 <fatfs_lfn_create_sfn+0x98>
    3270:	00000513          	li	a0,0
    3274:	f9dff06f          	j	3210 <fatfs_lfn_create_sfn+0x114>

00003278 <fatfs_lfn_generate_tail>:
    3278:	000187b7          	lui	a5,0x18
    327c:	69f78793          	addi	a5,a5,1695 # 1869f <__stacktop+0x869f>
    3280:	16c7e463          	bltu	a5,a2,33e8 <fatfs_lfn_generate_tail+0x170>
    3284:	fa010113          	addi	sp,sp,-96
    3288:	04812c23          	sw	s0,88(sp)
    328c:	04912a23          	sw	s1,84(sp)
    3290:	03712e23          	sw	s7,60(sp)
    3294:	00060413          	mv	s0,a2
    3298:	00058b93          	mv	s7,a1
    329c:	00c00613          	li	a2,12
    32a0:	00000593          	li	a1,0
    32a4:	00050493          	mv	s1,a0
    32a8:	00410513          	addi	a0,sp,4
    32ac:	04112e23          	sw	ra,92(sp)
    32b0:	05312623          	sw	s3,76(sp)
    32b4:	05412423          	sw	s4,72(sp)
    32b8:	05612023          	sw	s6,64(sp)
    32bc:	05212823          	sw	s2,80(sp)
    32c0:	05512223          	sw	s5,68(sp)
    32c4:	fffff097          	auipc	ra,0xfffff
    32c8:	d20080e7          	jalr	-736(ra) # 1fe4 <memset>
    32cc:	000065b7          	lui	a1,0x6
    32d0:	07e00793          	li	a5,126
    32d4:	01100613          	li	a2,17
    32d8:	cf858593          	addi	a1,a1,-776 # 5cf8 <LEDS+0x138>
    32dc:	01c10513          	addi	a0,sp,28
    32e0:	01010993          	addi	s3,sp,16
    32e4:	00f10223          	sb	a5,4(sp)
    32e8:	00098a13          	mv	s4,s3
    32ec:	fffff097          	auipc	ra,0xfffff
    32f0:	d14080e7          	jalr	-748(ra) # 2000 <memcpy>
    32f4:	00900b13          	li	s6,9
    32f8:	00a00593          	li	a1,10
    32fc:	00040513          	mv	a0,s0
    3300:	fffff097          	auipc	ra,0xfffff
    3304:	c80080e7          	jalr	-896(ra) # 1f80 <__umodsi3>
    3308:	03050793          	addi	a5,a0,48
    330c:	00278533          	add	a0,a5,sp
    3310:	fec54783          	lbu	a5,-20(a0)
    3314:	00098913          	mv	s2,s3
    3318:	00040513          	mv	a0,s0
    331c:	00a00593          	li	a1,10
    3320:	00f98023          	sb	a5,0(s3)
    3324:	00040a93          	mv	s5,s0
    3328:	fffff097          	auipc	ra,0xfffff
    332c:	c10080e7          	jalr	-1008(ra) # 1f38 <__udivsi3>
    3330:	00198993          	addi	s3,s3,1
    3334:	00050413          	mv	s0,a0
    3338:	fd5b60e3          	bltu	s6,s5,32f8 <fatfs_lfn_generate_tail+0x80>
    333c:	00098023          	sb	zero,0(s3)
    3340:	00410713          	addi	a4,sp,4
    3344:	00090793          	mv	a5,s2
    3348:	0947f663          	bgeu	a5,s4,33d4 <fatfs_lfn_generate_tail+0x15c>
    334c:	00f10713          	addi	a4,sp,15
    3350:	00000793          	li	a5,0
    3354:	00e96663          	bltu	s2,a4,3360 <fatfs_lfn_generate_tail+0xe8>
    3358:	41490933          	sub	s2,s2,s4
    335c:	00190793          	addi	a5,s2,1
    3360:	03078793          	addi	a5,a5,48
    3364:	002787b3          	add	a5,a5,sp
    3368:	000b8593          	mv	a1,s7
    336c:	fc078aa3          	sb	zero,-43(a5)
    3370:	00b00613          	li	a2,11
    3374:	00048513          	mv	a0,s1
    3378:	fffff097          	auipc	ra,0xfffff
    337c:	c88080e7          	jalr	-888(ra) # 2000 <memcpy>
    3380:	00410513          	addi	a0,sp,4
    3384:	fffff097          	auipc	ra,0xfffff
    3388:	ca0080e7          	jalr	-864(ra) # 2024 <strlen>
    338c:	40a484b3          	sub	s1,s1,a0
    3390:	00050613          	mv	a2,a0
    3394:	00410593          	addi	a1,sp,4
    3398:	00848513          	addi	a0,s1,8
    339c:	fffff097          	auipc	ra,0xfffff
    33a0:	c64080e7          	jalr	-924(ra) # 2000 <memcpy>
    33a4:	05c12083          	lw	ra,92(sp)
    33a8:	05812403          	lw	s0,88(sp)
    33ac:	05412483          	lw	s1,84(sp)
    33b0:	05012903          	lw	s2,80(sp)
    33b4:	04c12983          	lw	s3,76(sp)
    33b8:	04812a03          	lw	s4,72(sp)
    33bc:	04412a83          	lw	s5,68(sp)
    33c0:	04012b03          	lw	s6,64(sp)
    33c4:	03c12b83          	lw	s7,60(sp)
    33c8:	00100513          	li	a0,1
    33cc:	06010113          	addi	sp,sp,96
    33d0:	00008067          	ret
    33d4:	0007c683          	lbu	a3,0(a5)
    33d8:	00170713          	addi	a4,a4,1
    33dc:	fff78793          	addi	a5,a5,-1
    33e0:	00d70023          	sb	a3,0(a4)
    33e4:	f65ff06f          	j	3348 <fatfs_lfn_generate_tail+0xd0>
    33e8:	00000513          	li	a0,0
    33ec:	00008067          	ret

000033f0 <fatfs_total_path_levels>:
    33f0:	fff00793          	li	a5,-1
    33f4:	06050263          	beqz	a0,3458 <fatfs_total_path_levels+0x68>
    33f8:	00054703          	lbu	a4,0(a0)
    33fc:	02f00793          	li	a5,47
    3400:	00f71863          	bne	a4,a5,3410 <fatfs_total_path_levels+0x20>
    3404:	00150513          	addi	a0,a0,1
    3408:	00000793          	li	a5,0
    340c:	0400006f          	j	344c <fatfs_total_path_levels+0x5c>
    3410:	00154703          	lbu	a4,1(a0)
    3414:	03a00793          	li	a5,58
    3418:	00f70a63          	beq	a4,a5,342c <fatfs_total_path_levels+0x3c>
    341c:	00254683          	lbu	a3,2(a0)
    3420:	05c00713          	li	a4,92
    3424:	fff00793          	li	a5,-1
    3428:	02e69863          	bne	a3,a4,3458 <fatfs_total_path_levels+0x68>
    342c:	00350513          	addi	a0,a0,3
    3430:	05c00713          	li	a4,92
    3434:	fd5ff06f          	j	3408 <fatfs_total_path_levels+0x18>
    3438:	00150513          	addi	a0,a0,1
    343c:	00e68663          	beq	a3,a4,3448 <fatfs_total_path_levels+0x58>
    3440:	00054683          	lbu	a3,0(a0)
    3444:	fe069ae3          	bnez	a3,3438 <fatfs_total_path_levels+0x48>
    3448:	00178793          	addi	a5,a5,1
    344c:	00054683          	lbu	a3,0(a0)
    3450:	fe0698e3          	bnez	a3,3440 <fatfs_total_path_levels+0x50>
    3454:	fff78793          	addi	a5,a5,-1
    3458:	00078513          	mv	a0,a5
    345c:	00008067          	ret

00003460 <fatfs_get_substring>:
    3460:	0cd05e63          	blez	a3,353c <fatfs_get_substring+0xdc>
    3464:	0c050c63          	beqz	a0,353c <fatfs_get_substring+0xdc>
    3468:	fe010113          	addi	sp,sp,-32
    346c:	00812c23          	sw	s0,24(sp)
    3470:	00112e23          	sw	ra,28(sp)
    3474:	00912a23          	sw	s1,20(sp)
    3478:	00054483          	lbu	s1,0(a0)
    347c:	02f00793          	li	a5,47
    3480:	00150413          	addi	s0,a0,1
    3484:	02f48463          	beq	s1,a5,34ac <fatfs_get_substring+0x4c>
    3488:	00154703          	lbu	a4,1(a0)
    348c:	03a00793          	li	a5,58
    3490:	00f70a63          	beq	a4,a5,34a4 <fatfs_get_substring+0x44>
    3494:	00254803          	lbu	a6,2(a0)
    3498:	05c00713          	li	a4,92
    349c:	fff00793          	li	a5,-1
    34a0:	04e81c63          	bne	a6,a4,34f8 <fatfs_get_substring+0x98>
    34a4:	00350413          	addi	s0,a0,3
    34a8:	05c00493          	li	s1,92
    34ac:	00040513          	mv	a0,s0
    34b0:	00d12623          	sw	a3,12(sp)
    34b4:	00c12423          	sw	a2,8(sp)
    34b8:	00b12223          	sw	a1,4(sp)
    34bc:	fffff097          	auipc	ra,0xfffff
    34c0:	b68080e7          	jalr	-1176(ra) # 2024 <strlen>
    34c4:	00c12683          	lw	a3,12(sp)
    34c8:	00412583          	lw	a1,4(sp)
    34cc:	00812603          	lw	a2,8(sp)
    34d0:	00000713          	li	a4,0
    34d4:	00000813          	li	a6,0
    34d8:	00000793          	li	a5,0
    34dc:	fff68693          	addi	a3,a3,-1
    34e0:	00e608b3          	add	a7,a2,a4
    34e4:	02a7c663          	blt	a5,a0,3510 <fatfs_get_substring+0xb0>
    34e8:	00088023          	sb	zero,0(a7)
    34ec:	00064783          	lbu	a5,0(a2)
    34f0:	0017b793          	seqz	a5,a5
    34f4:	40f007b3          	neg	a5,a5
    34f8:	01c12083          	lw	ra,28(sp)
    34fc:	01812403          	lw	s0,24(sp)
    3500:	01412483          	lw	s1,20(sp)
    3504:	00078513          	mv	a0,a5
    3508:	02010113          	addi	sp,sp,32
    350c:	00008067          	ret
    3510:	00f40333          	add	t1,s0,a5
    3514:	00034303          	lbu	t1,0(t1)
    3518:	00931863          	bne	t1,s1,3528 <fatfs_get_substring+0xc8>
    351c:	00180813          	addi	a6,a6,1
    3520:	00178793          	addi	a5,a5,1
    3524:	fbdff06f          	j	34e0 <fatfs_get_substring+0x80>
    3528:	feb81ce3          	bne	a6,a1,3520 <fatfs_get_substring+0xc0>
    352c:	fed75ae3          	bge	a4,a3,3520 <fatfs_get_substring+0xc0>
    3530:	00170713          	addi	a4,a4,1
    3534:	00688023          	sb	t1,0(a7)
    3538:	fe9ff06f          	j	3520 <fatfs_get_substring+0xc0>
    353c:	fff00793          	li	a5,-1
    3540:	00078513          	mv	a0,a5
    3544:	00008067          	ret

00003548 <fatfs_split_path>:
    3548:	fd010113          	addi	sp,sp,-48
    354c:	02912223          	sw	s1,36(sp)
    3550:	03212023          	sw	s2,32(sp)
    3554:	01312e23          	sw	s3,28(sp)
    3558:	01412c23          	sw	s4,24(sp)
    355c:	02112623          	sw	ra,44(sp)
    3560:	02812423          	sw	s0,40(sp)
    3564:	01512a23          	sw	s5,20(sp)
    3568:	00050993          	mv	s3,a0
    356c:	00058493          	mv	s1,a1
    3570:	00060913          	mv	s2,a2
    3574:	00068a13          	mv	s4,a3
    3578:	00e12623          	sw	a4,12(sp)
    357c:	00000097          	auipc	ra,0x0
    3580:	e74080e7          	jalr	-396(ra) # 33f0 <fatfs_total_path_levels>
    3584:	fff00793          	li	a5,-1
    3588:	02f51863          	bne	a0,a5,35b8 <fatfs_split_path+0x70>
    358c:	fff00413          	li	s0,-1
    3590:	02c12083          	lw	ra,44(sp)
    3594:	00040513          	mv	a0,s0
    3598:	02812403          	lw	s0,40(sp)
    359c:	02412483          	lw	s1,36(sp)
    35a0:	02012903          	lw	s2,32(sp)
    35a4:	01c12983          	lw	s3,28(sp)
    35a8:	01812a03          	lw	s4,24(sp)
    35ac:	01412a83          	lw	s5,20(sp)
    35b0:	03010113          	addi	sp,sp,48
    35b4:	00008067          	ret
    35b8:	00c12683          	lw	a3,12(sp)
    35bc:	00050593          	mv	a1,a0
    35c0:	00a12623          	sw	a0,12(sp)
    35c4:	000a0613          	mv	a2,s4
    35c8:	00098513          	mv	a0,s3
    35cc:	00000097          	auipc	ra,0x0
    35d0:	e94080e7          	jalr	-364(ra) # 3460 <fatfs_get_substring>
    35d4:	00050413          	mv	s0,a0
    35d8:	fa051ae3          	bnez	a0,358c <fatfs_split_path+0x44>
    35dc:	00c12583          	lw	a1,12(sp)
    35e0:	00059663          	bnez	a1,35ec <fatfs_split_path+0xa4>
    35e4:	00048023          	sb	zero,0(s1)
    35e8:	fa9ff06f          	j	3590 <fatfs_split_path+0x48>
    35ec:	00098513          	mv	a0,s3
    35f0:	fffff097          	auipc	ra,0xfffff
    35f4:	a34080e7          	jalr	-1484(ra) # 2024 <strlen>
    35f8:	00050a93          	mv	s5,a0
    35fc:	000a0513          	mv	a0,s4
    3600:	fffff097          	auipc	ra,0xfffff
    3604:	a24080e7          	jalr	-1500(ra) # 2024 <strlen>
    3608:	40aa8633          	sub	a2,s5,a0
    360c:	00c95463          	bge	s2,a2,3614 <fatfs_split_path+0xcc>
    3610:	00090613          	mv	a2,s2
    3614:	00048513          	mv	a0,s1
    3618:	00098593          	mv	a1,s3
    361c:	00c12623          	sw	a2,12(sp)
    3620:	fffff097          	auipc	ra,0xfffff
    3624:	9e0080e7          	jalr	-1568(ra) # 2000 <memcpy>
    3628:	00c12603          	lw	a2,12(sp)
    362c:	00c484b3          	add	s1,s1,a2
    3630:	fe048fa3          	sb	zero,-1(s1)
    3634:	f5dff06f          	j	3590 <fatfs_split_path+0x48>

00003638 <fatfs_compare_names>:
    3638:	fd010113          	addi	sp,sp,-48
    363c:	02112623          	sw	ra,44(sp)
    3640:	03212023          	sw	s2,32(sp)
    3644:	01312e23          	sw	s3,28(sp)
    3648:	01412c23          	sw	s4,24(sp)
    364c:	01512a23          	sw	s5,20(sp)
    3650:	00058a13          	mv	s4,a1
    3654:	02812423          	sw	s0,40(sp)
    3658:	02912223          	sw	s1,36(sp)
    365c:	01612823          	sw	s6,16(sp)
    3660:	01712623          	sw	s7,12(sp)
    3664:	01812423          	sw	s8,8(sp)
    3668:	00050a93          	mv	s5,a0
    366c:	fffff097          	auipc	ra,0xfffff
    3670:	1c4080e7          	jalr	452(ra) # 2830 <FileString_GetExtension>
    3674:	00050993          	mv	s3,a0
    3678:	000a0513          	mv	a0,s4
    367c:	fffff097          	auipc	ra,0xfffff
    3680:	1b4080e7          	jalr	436(ra) # 2830 <FileString_GetExtension>
    3684:	fff00793          	li	a5,-1
    3688:	00050913          	mv	s2,a0
    368c:	02f99e63          	bne	s3,a5,36c8 <fatfs_compare_names+0x90>
    3690:	0f350063          	beq	a0,s3,3770 <fatfs_compare_names+0x138>
    3694:	00000513          	li	a0,0
    3698:	02c12083          	lw	ra,44(sp)
    369c:	02812403          	lw	s0,40(sp)
    36a0:	02412483          	lw	s1,36(sp)
    36a4:	02012903          	lw	s2,32(sp)
    36a8:	01c12983          	lw	s3,28(sp)
    36ac:	01812a03          	lw	s4,24(sp)
    36b0:	01412a83          	lw	s5,20(sp)
    36b4:	01012b03          	lw	s6,16(sp)
    36b8:	00c12b83          	lw	s7,12(sp)
    36bc:	00812c03          	lw	s8,8(sp)
    36c0:	03010113          	addi	sp,sp,48
    36c4:	00008067          	ret
    36c8:	fcf506e3          	beq	a0,a5,3694 <fatfs_compare_names+0x5c>
    36cc:	00198793          	addi	a5,s3,1
    36d0:	00fa8b33          	add	s6,s5,a5
    36d4:	00050413          	mv	s0,a0
    36d8:	00150793          	addi	a5,a0,1
    36dc:	000b0513          	mv	a0,s6
    36e0:	00fa0bb3          	add	s7,s4,a5
    36e4:	fffff097          	auipc	ra,0xfffff
    36e8:	940080e7          	jalr	-1728(ra) # 2024 <strlen>
    36ec:	00050c13          	mv	s8,a0
    36f0:	000b8513          	mv	a0,s7
    36f4:	00098493          	mv	s1,s3
    36f8:	fffff097          	auipc	ra,0xfffff
    36fc:	92c080e7          	jalr	-1748(ra) # 2024 <strlen>
    3700:	f8ac1ae3          	bne	s8,a0,3694 <fatfs_compare_names+0x5c>
    3704:	000b0513          	mv	a0,s6
    3708:	fffff097          	auipc	ra,0xfffff
    370c:	91c080e7          	jalr	-1764(ra) # 2024 <strlen>
    3710:	00050613          	mv	a2,a0
    3714:	000b8593          	mv	a1,s7
    3718:	000b0513          	mv	a0,s6
    371c:	fffff097          	auipc	ra,0xfffff
    3720:	0a4080e7          	jalr	164(ra) # 27c0 <FileString_StrCmpNoCase>
    3724:	f60518e3          	bnez	a0,3694 <fatfs_compare_names+0x5c>
    3728:	fff48793          	addi	a5,s1,-1
    372c:	00fa87b3          	add	a5,s5,a5
    3730:	41378733          	sub	a4,a5,s3
    3734:	02000693          	li	a3,32
    3738:	06e79263          	bne	a5,a4,379c <fatfs_compare_names+0x164>
    373c:	fff40793          	addi	a5,s0,-1
    3740:	00fa07b3          	add	a5,s4,a5
    3744:	41278733          	sub	a4,a5,s2
    3748:	02000693          	li	a3,32
    374c:	06e79263          	bne	a5,a4,37b0 <fatfs_compare_names+0x178>
    3750:	f53912e3          	bne	s2,s3,3694 <fatfs_compare_names+0x5c>
    3754:	00090613          	mv	a2,s2
    3758:	000a0593          	mv	a1,s4
    375c:	000a8513          	mv	a0,s5
    3760:	fffff097          	auipc	ra,0xfffff
    3764:	060080e7          	jalr	96(ra) # 27c0 <FileString_StrCmpNoCase>
    3768:	00153513          	seqz	a0,a0
    376c:	f2dff06f          	j	3698 <fatfs_compare_names+0x60>
    3770:	000a8513          	mv	a0,s5
    3774:	fffff097          	auipc	ra,0xfffff
    3778:	8b0080e7          	jalr	-1872(ra) # 2024 <strlen>
    377c:	00050493          	mv	s1,a0
    3780:	00050993          	mv	s3,a0
    3784:	000a0513          	mv	a0,s4
    3788:	fffff097          	auipc	ra,0xfffff
    378c:	89c080e7          	jalr	-1892(ra) # 2024 <strlen>
    3790:	00050413          	mv	s0,a0
    3794:	00050913          	mv	s2,a0
    3798:	f91ff06f          	j	3728 <fatfs_compare_names+0xf0>
    379c:	0007c603          	lbu	a2,0(a5)
    37a0:	f8d61ee3          	bne	a2,a3,373c <fatfs_compare_names+0x104>
    37a4:	415789b3          	sub	s3,a5,s5
    37a8:	fff78793          	addi	a5,a5,-1
    37ac:	f8dff06f          	j	3738 <fatfs_compare_names+0x100>
    37b0:	0007c603          	lbu	a2,0(a5)
    37b4:	f8d61ee3          	bne	a2,a3,3750 <fatfs_compare_names+0x118>
    37b8:	41478933          	sub	s2,a5,s4
    37bc:	fff78793          	addi	a5,a5,-1
    37c0:	f8dff06f          	j	374c <fatfs_compare_names+0x114>

000037c4 <_check_file_open>:
    37c4:	fe010113          	addi	sp,sp,-32
    37c8:	000067b7          	lui	a5,0x6
    37cc:	00812c23          	sw	s0,24(sp)
    37d0:	16c7a403          	lw	s0,364(a5) # 616c <_open_file_list>
    37d4:	00912a23          	sw	s1,20(sp)
    37d8:	00112e23          	sw	ra,28(sp)
    37dc:	01212823          	sw	s2,16(sp)
    37e0:	01312623          	sw	s3,12(sp)
    37e4:	00050493          	mv	s1,a0
    37e8:	00041663          	bnez	s0,37f4 <_check_file_open+0x30>
    37ec:	00000513          	li	a0,0
    37f0:	03c0006f          	j	382c <_check_file_open+0x68>
    37f4:	bc440793          	addi	a5,s0,-1084
    37f8:	00f49663          	bne	s1,a5,3804 <_check_file_open+0x40>
    37fc:	00442403          	lw	s0,4(s0)
    3800:	fe9ff06f          	j	37e8 <_check_file_open+0x24>
    3804:	01448593          	addi	a1,s1,20
    3808:	bd840513          	addi	a0,s0,-1064
    380c:	00000097          	auipc	ra,0x0
    3810:	e2c080e7          	jalr	-468(ra) # 3638 <fatfs_compare_names>
    3814:	fe0504e3          	beqz	a0,37fc <_check_file_open+0x38>
    3818:	11848593          	addi	a1,s1,280
    381c:	cdc40513          	addi	a0,s0,-804
    3820:	00000097          	auipc	ra,0x0
    3824:	e18080e7          	jalr	-488(ra) # 3638 <fatfs_compare_names>
    3828:	fc050ae3          	beqz	a0,37fc <_check_file_open+0x38>
    382c:	01c12083          	lw	ra,28(sp)
    3830:	01812403          	lw	s0,24(sp)
    3834:	01412483          	lw	s1,20(sp)
    3838:	01012903          	lw	s2,16(sp)
    383c:	00c12983          	lw	s3,12(sp)
    3840:	02010113          	addi	sp,sp,32
    3844:	00008067          	ret

00003848 <fatfs_get_sfn_display_name>:
    3848:	00000713          	li	a4,0
    384c:	02000613          	li	a2,32
    3850:	01900813          	li	a6,25
    3854:	0005c783          	lbu	a5,0(a1)
    3858:	00078663          	beqz	a5,3864 <fatfs_get_sfn_display_name+0x1c>
    385c:	ff470693          	addi	a3,a4,-12
    3860:	00069863          	bnez	a3,3870 <fatfs_get_sfn_display_name+0x28>
    3864:	00050023          	sb	zero,0(a0)
    3868:	00100513          	li	a0,1
    386c:	00008067          	ret
    3870:	00158593          	addi	a1,a1,1
    3874:	fec780e3          	beq	a5,a2,3854 <fatfs_get_sfn_display_name+0xc>
    3878:	fbf78693          	addi	a3,a5,-65
    387c:	0ff6f693          	zext.b	a3,a3
    3880:	00d86663          	bltu	a6,a3,388c <fatfs_get_sfn_display_name+0x44>
    3884:	02078793          	addi	a5,a5,32
    3888:	0ff7f793          	zext.b	a5,a5
    388c:	00f50023          	sb	a5,0(a0)
    3890:	00170713          	addi	a4,a4,1
    3894:	00150513          	addi	a0,a0,1
    3898:	fbdff06f          	j	3854 <fatfs_get_sfn_display_name+0xc>

0000389c <fatfs_fat_init>:
    389c:	ff010113          	addi	sp,sp,-16
    38a0:	00812423          	sw	s0,8(sp)
    38a4:	00912223          	sw	s1,4(sp)
    38a8:	00112623          	sw	ra,12(sp)
    38ac:	fff00793          	li	a5,-1
    38b0:	25850493          	addi	s1,a0,600
    38b4:	00050413          	mv	s0,a0
    38b8:	44f52c23          	sw	a5,1112(a0)
    38bc:	24052a23          	sw	zero,596(a0)
    38c0:	44052e23          	sw	zero,1116(a0)
    38c4:	20000613          	li	a2,512
    38c8:	00048513          	mv	a0,s1
    38cc:	00000593          	li	a1,0
    38d0:	ffffe097          	auipc	ra,0xffffe
    38d4:	714080e7          	jalr	1812(ra) # 1fe4 <memset>
    38d8:	25442783          	lw	a5,596(s0)
    38dc:	00c12083          	lw	ra,12(sp)
    38e0:	24942a23          	sw	s1,596(s0)
    38e4:	46042023          	sw	zero,1120(s0)
    38e8:	46f42223          	sw	a5,1124(s0)
    38ec:	00812403          	lw	s0,8(sp)
    38f0:	00412483          	lw	s1,4(sp)
    38f4:	01010113          	addi	sp,sp,16
    38f8:	00008067          	ret

000038fc <fatfs_init>:
    38fc:	fd010113          	addi	sp,sp,-48
    3900:	02812423          	sw	s0,40(sp)
    3904:	02112623          	sw	ra,44(sp)
    3908:	02912223          	sw	s1,36(sp)
    390c:	03212023          	sw	s2,32(sp)
    3910:	01312e23          	sw	s3,28(sp)
    3914:	fff00793          	li	a5,-1
    3918:	24f52223          	sw	a5,580(a0)
    391c:	24052423          	sw	zero,584(a0)
    3920:	02052223          	sw	zero,36(a0)
    3924:	00050413          	mv	s0,a0
    3928:	00000097          	auipc	ra,0x0
    392c:	f74080e7          	jalr	-140(ra) # 389c <fatfs_fat_init>
    3930:	03442783          	lw	a5,52(s0)
    3934:	02079463          	bnez	a5,395c <fatfs_init+0x60>
    3938:	fff00713          	li	a4,-1
    393c:	02c12083          	lw	ra,44(sp)
    3940:	02812403          	lw	s0,40(sp)
    3944:	02412483          	lw	s1,36(sp)
    3948:	02012903          	lw	s2,32(sp)
    394c:	01c12983          	lw	s3,28(sp)
    3950:	00070513          	mv	a0,a4
    3954:	03010113          	addi	sp,sp,48
    3958:	00008067          	ret
    395c:	04440593          	addi	a1,s0,68
    3960:	00100613          	li	a2,1
    3964:	00000513          	li	a0,0
    3968:	00b12623          	sw	a1,12(sp)
    396c:	000780e7          	jalr	a5
    3970:	fc0504e3          	beqz	a0,3938 <fatfs_init+0x3c>
    3974:	24244703          	lbu	a4,578(s0)
    3978:	05500793          	li	a5,85
    397c:	00c12583          	lw	a1,12(sp)
    3980:	00f70663          	beq	a4,a5,398c <fatfs_init+0x90>
    3984:	ffd00713          	li	a4,-3
    3988:	fb5ff06f          	j	393c <fatfs_init+0x40>
    398c:	24344703          	lbu	a4,579(s0)
    3990:	0aa00793          	li	a5,170
    3994:	fef718e3          	bne	a4,a5,3984 <fatfs_init+0x88>
    3998:	20644783          	lbu	a5,518(s0)
    399c:	00600713          	li	a4,6
    39a0:	02f76463          	bltu	a4,a5,39c8 <fatfs_init+0xcc>
    39a4:	00400713          	li	a4,4
    39a8:	00f76663          	bltu	a4,a5,39b4 <fatfs_init+0xb8>
    39ac:	00000513          	li	a0,0
    39b0:	02078663          	beqz	a5,39dc <fatfs_init+0xe0>
    39b4:	20c45503          	lhu	a0,524(s0)
    39b8:	20a45783          	lhu	a5,522(s0)
    39bc:	01051513          	slli	a0,a0,0x10
    39c0:	00f56533          	or	a0,a0,a5
    39c4:	0180006f          	j	39dc <fatfs_init+0xe0>
    39c8:	00c00713          	li	a4,12
    39cc:	12f76663          	bltu	a4,a5,3af8 <fatfs_init+0x1fc>
    39d0:	00a00713          	li	a4,10
    39d4:	00000513          	li	a0,0
    39d8:	fcf76ee3          	bltu	a4,a5,39b4 <fatfs_init+0xb8>
    39dc:	03442783          	lw	a5,52(s0)
    39e0:	00a42e23          	sw	a0,28(s0)
    39e4:	00100613          	li	a2,1
    39e8:	000780e7          	jalr	a5
    39ec:	f40506e3          	beqz	a0,3938 <fatfs_init+0x3c>
    39f0:	05044783          	lbu	a5,80(s0)
    39f4:	04f44703          	lbu	a4,79(s0)
    39f8:	20000693          	li	a3,512
    39fc:	00879793          	slli	a5,a5,0x8
    3a00:	00e7e7b3          	or	a5,a5,a4
    3a04:	ffe00713          	li	a4,-2
    3a08:	f2d79ae3          	bne	a5,a3,393c <fatfs_init+0x40>
    3a0c:	05644483          	lbu	s1,86(s0)
    3a10:	05544783          	lbu	a5,85(s0)
    3a14:	05144983          	lbu	s3,81(s0)
    3a18:	00849493          	slli	s1,s1,0x8
    3a1c:	05a45583          	lhu	a1,90(s0)
    3a20:	00f4e4b3          	or	s1,s1,a5
    3a24:	01340023          	sb	s3,0(s0)
    3a28:	02941423          	sh	s1,40(s0)
    3a2c:	05245903          	lhu	s2,82(s0)
    3a30:	05444503          	lbu	a0,84(s0)
    3a34:	00059463          	bnez	a1,3a3c <fatfs_init+0x140>
    3a38:	06842583          	lw	a1,104(s0)
    3a3c:	07042783          	lw	a5,112(s0)
    3a40:	02b42023          	sw	a1,32(s0)
    3a44:	00549493          	slli	s1,s1,0x5
    3a48:	00f42423          	sw	a5,8(s0)
    3a4c:	07445783          	lhu	a5,116(s0)
    3a50:	1ff48493          	addi	s1,s1,511
    3a54:	4094d493          	srai	s1,s1,0x9
    3a58:	00f41c23          	sh	a5,24(s0)
    3a5c:	fffff097          	auipc	ra,0xfffff
    3a60:	ccc080e7          	jalr	-820(ra) # 2728 <__mulsi3>
    3a64:	00a907b3          	add	a5,s2,a0
    3a68:	00f42623          	sw	a5,12(s0)
    3a6c:	01c42783          	lw	a5,28(s0)
    3a70:	24245703          	lhu	a4,578(s0)
    3a74:	00942823          	sw	s1,16(s0)
    3a78:	00f907b3          	add	a5,s2,a5
    3a7c:	00f42a23          	sw	a5,20(s0)
    3a80:	00f507b3          	add	a5,a0,a5
    3a84:	00f42223          	sw	a5,4(s0)
    3a88:	0000b7b7          	lui	a5,0xb
    3a8c:	a5578793          	addi	a5,a5,-1451 # aa55 <_files+0x2855>
    3a90:	eef71ae3          	bne	a4,a5,3984 <fatfs_init+0x88>
    3a94:	05844783          	lbu	a5,88(s0)
    3a98:	05744703          	lbu	a4,87(s0)
    3a9c:	00879793          	slli	a5,a5,0x8
    3aa0:	00e7e7b3          	or	a5,a5,a4
    3aa4:	00079463          	bnez	a5,3aac <fatfs_init+0x1b0>
    3aa8:	06442783          	lw	a5,100(s0)
    3aac:	ffb00713          	li	a4,-5
    3ab0:	e80986e3          	beqz	s3,393c <fatfs_init+0x40>
    3ab4:	00990933          	add	s2,s2,s1
    3ab8:	00a90533          	add	a0,s2,a0
    3abc:	40a78533          	sub	a0,a5,a0
    3ac0:	00098593          	mv	a1,s3
    3ac4:	ffffe097          	auipc	ra,0xffffe
    3ac8:	474080e7          	jalr	1140(ra) # 1f38 <__udivsi3>
    3acc:	000017b7          	lui	a5,0x1
    3ad0:	ff478793          	addi	a5,a5,-12 # ff4 <file_explorer+0x384>
    3ad4:	ffb00713          	li	a4,-5
    3ad8:	e6a7f2e3          	bgeu	a5,a0,393c <fatfs_init+0x40>
    3adc:	000107b7          	lui	a5,0x10
    3ae0:	ff478793          	addi	a5,a5,-12 # fff4 <_files+0x7df4>
    3ae4:	02a7e663          	bltu	a5,a0,3b10 <fatfs_init+0x214>
    3ae8:	00042423          	sw	zero,8(s0)
    3aec:	02042823          	sw	zero,48(s0)
    3af0:	00000713          	li	a4,0
    3af4:	e49ff06f          	j	393c <fatfs_init+0x40>
    3af8:	ff278793          	addi	a5,a5,-14
    3afc:	0ff7f793          	zext.b	a5,a5
    3b00:	00100713          	li	a4,1
    3b04:	00000513          	li	a0,0
    3b08:	eaf776e3          	bgeu	a4,a5,39b4 <fatfs_init+0xb8>
    3b0c:	ed1ff06f          	j	39dc <fatfs_init+0xe0>
    3b10:	00100793          	li	a5,1
    3b14:	02f42823          	sw	a5,48(s0)
    3b18:	fd9ff06f          	j	3af0 <fatfs_init+0x1f4>

00003b1c <fl_attach_media>:
    3b1c:	000067b7          	lui	a5,0x6
    3b20:	1787a783          	lw	a5,376(a5) # 6178 <_filelib_init>
    3b24:	fe010113          	addi	sp,sp,-32
    3b28:	00812c23          	sw	s0,24(sp)
    3b2c:	00112e23          	sw	ra,28(sp)
    3b30:	00050413          	mv	s0,a0
    3b34:	00079a63          	bnez	a5,3b48 <fl_attach_media+0x2c>
    3b38:	00b12623          	sw	a1,12(sp)
    3b3c:	fffff097          	auipc	ra,0xfffff
    3b40:	080080e7          	jalr	128(ra) # 2bbc <fl_init>
    3b44:	00c12583          	lw	a1,12(sp)
    3b48:	000087b7          	lui	a5,0x8
    3b4c:	d9878513          	addi	a0,a5,-616 # 7d98 <_fs>
    3b50:	02b52c23          	sw	a1,56(a0)
    3b54:	02852a23          	sw	s0,52(a0)
    3b58:	00000097          	auipc	ra,0x0
    3b5c:	da4080e7          	jalr	-604(ra) # 38fc <fatfs_init>
    3b60:	00050593          	mv	a1,a0
    3b64:	02050863          	beqz	a0,3b94 <fl_attach_media+0x78>
    3b68:	00a12623          	sw	a0,12(sp)
    3b6c:	00006537          	lui	a0,0x6
    3b70:	d0c50513          	addi	a0,a0,-756 # 5d0c <LEDS+0x14c>
    3b74:	fffff097          	auipc	ra,0xfffff
    3b78:	a78080e7          	jalr	-1416(ra) # 25ec <printf>
    3b7c:	00c12583          	lw	a1,12(sp)
    3b80:	01c12083          	lw	ra,28(sp)
    3b84:	01812403          	lw	s0,24(sp)
    3b88:	00058513          	mv	a0,a1
    3b8c:	02010113          	addi	sp,sp,32
    3b90:	00008067          	ret
    3b94:	000067b7          	lui	a5,0x6
    3b98:	00100713          	li	a4,1
    3b9c:	16e7aa23          	sw	a4,372(a5) # 6174 <_filelib_valid>
    3ba0:	fe1ff06f          	j	3b80 <fl_attach_media+0x64>

00003ba4 <fatfs_fat_purge>:
    3ba4:	25452583          	lw	a1,596(a0)
    3ba8:	fe010113          	addi	sp,sp,-32
    3bac:	00812c23          	sw	s0,24(sp)
    3bb0:	00112e23          	sw	ra,28(sp)
    3bb4:	00050413          	mv	s0,a0
    3bb8:	00059663          	bnez	a1,3bc4 <fatfs_fat_purge+0x20>
    3bbc:	00100513          	li	a0,1
    3bc0:	02c0006f          	j	3bec <fatfs_fat_purge+0x48>
    3bc4:	2045a783          	lw	a5,516(a1)
    3bc8:	00079663          	bnez	a5,3bd4 <fatfs_fat_purge+0x30>
    3bcc:	20c5a583          	lw	a1,524(a1)
    3bd0:	fe9ff06f          	j	3bb8 <fatfs_fat_purge+0x14>
    3bd4:	00040513          	mv	a0,s0
    3bd8:	00b12623          	sw	a1,12(sp)
    3bdc:	fffff097          	auipc	ra,0xfffff
    3be0:	c80080e7          	jalr	-896(ra) # 285c <fatfs_fat_writeback>
    3be4:	00c12583          	lw	a1,12(sp)
    3be8:	fe0512e3          	bnez	a0,3bcc <fatfs_fat_purge+0x28>
    3bec:	01c12083          	lw	ra,28(sp)
    3bf0:	01812403          	lw	s0,24(sp)
    3bf4:	02010113          	addi	sp,sp,32
    3bf8:	00008067          	ret

00003bfc <fatfs_find_next_cluster>:
    3bfc:	ff010113          	addi	sp,sp,-16
    3c00:	00812423          	sw	s0,8(sp)
    3c04:	01212023          	sw	s2,0(sp)
    3c08:	00112623          	sw	ra,12(sp)
    3c0c:	00912223          	sw	s1,4(sp)
    3c10:	00050913          	mv	s2,a0
    3c14:	00200413          	li	s0,2
    3c18:	00058463          	beqz	a1,3c20 <fatfs_find_next_cluster+0x24>
    3c1c:	00058413          	mv	s0,a1
    3c20:	03092783          	lw	a5,48(s2)
    3c24:	00745493          	srli	s1,s0,0x7
    3c28:	00079463          	bnez	a5,3c30 <fatfs_find_next_cluster+0x34>
    3c2c:	00845493          	srli	s1,s0,0x8
    3c30:	01492583          	lw	a1,20(s2)
    3c34:	00090513          	mv	a0,s2
    3c38:	00b485b3          	add	a1,s1,a1
    3c3c:	fffff097          	auipc	ra,0xfffff
    3c40:	ca4080e7          	jalr	-860(ra) # 28e0 <fatfs_fat_read_sector>
    3c44:	00050793          	mv	a5,a0
    3c48:	fff00513          	li	a0,-1
    3c4c:	04078863          	beqz	a5,3c9c <fatfs_find_next_cluster+0xa0>
    3c50:	03092703          	lw	a4,48(s2)
    3c54:	2087a783          	lw	a5,520(a5)
    3c58:	04071e63          	bnez	a4,3cb4 <fatfs_find_next_cluster+0xb8>
    3c5c:	00849493          	slli	s1,s1,0x8
    3c60:	40940433          	sub	s0,s0,s1
    3c64:	00141413          	slli	s0,s0,0x1
    3c68:	01041413          	slli	s0,s0,0x10
    3c6c:	01045413          	srli	s0,s0,0x10
    3c70:	008787b3          	add	a5,a5,s0
    3c74:	0017c503          	lbu	a0,1(a5)
    3c78:	0007c783          	lbu	a5,0(a5)
    3c7c:	00851513          	slli	a0,a0,0x8
    3c80:	00f50533          	add	a0,a0,a5
    3c84:	ffff07b7          	lui	a5,0xffff0
    3c88:	00878793          	addi	a5,a5,8 # ffff0008 <__stacktop+0xfffe0008>
    3c8c:	00f507b3          	add	a5,a0,a5
    3c90:	00700713          	li	a4,7
    3c94:	00f76463          	bltu	a4,a5,3c9c <fatfs_find_next_cluster+0xa0>
    3c98:	fff00513          	li	a0,-1
    3c9c:	00c12083          	lw	ra,12(sp)
    3ca0:	00812403          	lw	s0,8(sp)
    3ca4:	00412483          	lw	s1,4(sp)
    3ca8:	00012903          	lw	s2,0(sp)
    3cac:	01010113          	addi	sp,sp,16
    3cb0:	00008067          	ret
    3cb4:	00749493          	slli	s1,s1,0x7
    3cb8:	40940433          	sub	s0,s0,s1
    3cbc:	00241413          	slli	s0,s0,0x2
    3cc0:	01041413          	slli	s0,s0,0x10
    3cc4:	01045413          	srli	s0,s0,0x10
    3cc8:	008787b3          	add	a5,a5,s0
    3ccc:	0037c503          	lbu	a0,3(a5)
    3cd0:	0027c703          	lbu	a4,2(a5)
    3cd4:	01851513          	slli	a0,a0,0x18
    3cd8:	01071713          	slli	a4,a4,0x10
    3cdc:	00e50533          	add	a0,a0,a4
    3ce0:	0007c703          	lbu	a4,0(a5)
    3ce4:	0017c783          	lbu	a5,1(a5)
    3ce8:	00e50533          	add	a0,a0,a4
    3cec:	00879793          	slli	a5,a5,0x8
    3cf0:	00f50533          	add	a0,a0,a5
    3cf4:	00451513          	slli	a0,a0,0x4
    3cf8:	00455513          	srli	a0,a0,0x4
    3cfc:	f00007b7          	lui	a5,0xf0000
    3d00:	f89ff06f          	j	3c88 <fatfs_find_next_cluster+0x8c>

00003d04 <fatfs_sector_reader>:
    3d04:	03052783          	lw	a5,48(a0)
    3d08:	fe010113          	addi	sp,sp,-32
    3d0c:	00812c23          	sw	s0,24(sp)
    3d10:	01212823          	sw	s2,16(sp)
    3d14:	01512223          	sw	s5,4(sp)
    3d18:	00112e23          	sw	ra,28(sp)
    3d1c:	00912a23          	sw	s1,20(sp)
    3d20:	01312623          	sw	s3,12(sp)
    3d24:	01412423          	sw	s4,8(sp)
    3d28:	01612023          	sw	s6,0(sp)
    3d2c:	00f5e7b3          	or	a5,a1,a5
    3d30:	00050413          	mv	s0,a0
    3d34:	00060913          	mv	s2,a2
    3d38:	00068a93          	mv	s5,a3
    3d3c:	08079063          	bnez	a5,3dbc <fatfs_sector_reader+0xb8>
    3d40:	01052783          	lw	a5,16(a0)
    3d44:	02f66863          	bltu	a2,a5,3d74 <fatfs_sector_reader+0x70>
    3d48:	00000513          	li	a0,0
    3d4c:	01c12083          	lw	ra,28(sp)
    3d50:	01812403          	lw	s0,24(sp)
    3d54:	01412483          	lw	s1,20(sp)
    3d58:	01012903          	lw	s2,16(sp)
    3d5c:	00c12983          	lw	s3,12(sp)
    3d60:	00812a03          	lw	s4,8(sp)
    3d64:	00412a83          	lw	s5,4(sp)
    3d68:	00012b03          	lw	s6,0(sp)
    3d6c:	02010113          	addi	sp,sp,32
    3d70:	00008067          	ret
    3d74:	01c52503          	lw	a0,28(a0)
    3d78:	00c42783          	lw	a5,12(s0)
    3d7c:	00f50533          	add	a0,a0,a5
    3d80:	01250533          	add	a0,a0,s2
    3d84:	0a0a8663          	beqz	s5,3e30 <fatfs_sector_reader+0x12c>
    3d88:	03442783          	lw	a5,52(s0)
    3d8c:	00100613          	li	a2,1
    3d90:	000a8593          	mv	a1,s5
    3d94:	01812403          	lw	s0,24(sp)
    3d98:	01c12083          	lw	ra,28(sp)
    3d9c:	01412483          	lw	s1,20(sp)
    3da0:	01012903          	lw	s2,16(sp)
    3da4:	00c12983          	lw	s3,12(sp)
    3da8:	00812a03          	lw	s4,8(sp)
    3dac:	00412a83          	lw	s5,4(sp)
    3db0:	00012b03          	lw	s6,0(sp)
    3db4:	02010113          	addi	sp,sp,32
    3db8:	00078067          	jr	a5 # f0000000 <__stacktop+0xefff0000>
    3dbc:	00054783          	lbu	a5,0(a0)
    3dc0:	00058493          	mv	s1,a1
    3dc4:	00060513          	mv	a0,a2
    3dc8:	00078593          	mv	a1,a5
    3dcc:	00078a13          	mv	s4,a5
    3dd0:	ffffe097          	auipc	ra,0xffffe
    3dd4:	168080e7          	jalr	360(ra) # 1f38 <__udivsi3>
    3dd8:	00050b13          	mv	s6,a0
    3ddc:	00000993          	li	s3,0
    3de0:	03699a63          	bne	s3,s6,3e14 <fatfs_sector_reader+0x110>
    3de4:	fff00793          	li	a5,-1
    3de8:	f6f480e3          	beq	s1,a5,3d48 <fatfs_sector_reader+0x44>
    3dec:	000a0593          	mv	a1,s4
    3df0:	00090513          	mv	a0,s2
    3df4:	ffffe097          	auipc	ra,0xffffe
    3df8:	18c080e7          	jalr	396(ra) # 1f80 <__umodsi3>
    3dfc:	00050913          	mv	s2,a0
    3e00:	00048593          	mv	a1,s1
    3e04:	00040513          	mv	a0,s0
    3e08:	fffff097          	auipc	ra,0xfffff
    3e0c:	c84080e7          	jalr	-892(ra) # 2a8c <fatfs_lba_of_cluster>
    3e10:	f71ff06f          	j	3d80 <fatfs_sector_reader+0x7c>
    3e14:	00048593          	mv	a1,s1
    3e18:	00040513          	mv	a0,s0
    3e1c:	00000097          	auipc	ra,0x0
    3e20:	de0080e7          	jalr	-544(ra) # 3bfc <fatfs_find_next_cluster>
    3e24:	00050493          	mv	s1,a0
    3e28:	00198993          	addi	s3,s3,1
    3e2c:	fb5ff06f          	j	3de0 <fatfs_sector_reader+0xdc>
    3e30:	24442783          	lw	a5,580(s0)
    3e34:	00a78c63          	beq	a5,a0,3e4c <fatfs_sector_reader+0x148>
    3e38:	03442783          	lw	a5,52(s0)
    3e3c:	24a42223          	sw	a0,580(s0)
    3e40:	00100613          	li	a2,1
    3e44:	04440593          	addi	a1,s0,68
    3e48:	f4dff06f          	j	3d94 <fatfs_sector_reader+0x90>
    3e4c:	00100513          	li	a0,1
    3e50:	efdff06f          	j	3d4c <fatfs_sector_reader+0x48>

00003e54 <fatfs_get_file_entry>:
    3e54:	eb010113          	addi	sp,sp,-336
    3e58:	14812423          	sw	s0,328(sp)
    3e5c:	14912223          	sw	s1,324(sp)
    3e60:	13312e23          	sw	s3,316(sp)
    3e64:	13712623          	sw	s7,300(sp)
    3e68:	13812423          	sw	s8,296(sp)
    3e6c:	13912223          	sw	s9,292(sp)
    3e70:	14112623          	sw	ra,332(sp)
    3e74:	15212023          	sw	s2,320(sp)
    3e78:	13412c23          	sw	s4,312(sp)
    3e7c:	13512a23          	sw	s5,308(sp)
    3e80:	13612823          	sw	s6,304(sp)
    3e84:	00050993          	mv	s3,a0
    3e88:	00058c93          	mv	s9,a1
    3e8c:	00060b93          	mv	s7,a2
    3e90:	00068c13          	mv	s8,a3
    3e94:	10010ea3          	sb	zero,285(sp)
    3e98:	01810413          	addi	s0,sp,24
    3e9c:	11c10493          	addi	s1,sp,284
    3ea0:	00040513          	mv	a0,s0
    3ea4:	00d00613          	li	a2,13
    3ea8:	00000593          	li	a1,0
    3eac:	00d40413          	addi	s0,s0,13
    3eb0:	ffffe097          	auipc	ra,0xffffe
    3eb4:	134080e7          	jalr	308(ra) # 1fe4 <memset>
    3eb8:	fe9414e3          	bne	s0,s1,3ea0 <fatfs_get_file_entry+0x4c>
    3ebc:	00000493          	li	s1,0
    3ec0:	24498a13          	addi	s4,s3,580
    3ec4:	00810913          	addi	s2,sp,8
    3ec8:	00800a93          	li	s5,8
    3ecc:	02e00b13          	li	s6,46
    3ed0:	00000693          	li	a3,0
    3ed4:	00048613          	mv	a2,s1
    3ed8:	000c8593          	mv	a1,s9
    3edc:	00098513          	mv	a0,s3
    3ee0:	00000097          	auipc	ra,0x0
    3ee4:	e24080e7          	jalr	-476(ra) # 3d04 <fatfs_sector_reader>
    3ee8:	08050c63          	beqz	a0,3f80 <fatfs_get_file_entry+0x12c>
    3eec:	00148493          	addi	s1,s1,1
    3ef0:	04498413          	addi	s0,s3,68
    3ef4:	00040513          	mv	a0,s0
    3ef8:	fffff097          	auipc	ra,0xfffff
    3efc:	f34080e7          	jalr	-204(ra) # 2e2c <fatfs_entry_lfn_text>
    3f00:	02050063          	beqz	a0,3f20 <fatfs_get_file_entry+0xcc>
    3f04:	00040593          	mv	a1,s0
    3f08:	01810513          	addi	a0,sp,24
    3f0c:	fffff097          	auipc	ra,0xfffff
    3f10:	e18080e7          	jalr	-488(ra) # 2d24 <fatfs_lfn_cache_entry>
    3f14:	02040413          	addi	s0,s0,32
    3f18:	fd441ee3          	bne	s0,s4,3ef4 <fatfs_get_file_entry+0xa0>
    3f1c:	fb5ff06f          	j	3ed0 <fatfs_get_file_entry+0x7c>
    3f20:	00040513          	mv	a0,s0
    3f24:	fffff097          	auipc	ra,0xfffff
    3f28:	f1c080e7          	jalr	-228(ra) # 2e40 <fatfs_entry_lfn_invalid>
    3f2c:	00050663          	beqz	a0,3f38 <fatfs_get_file_entry+0xe4>
    3f30:	10010ea3          	sb	zero,285(sp)
    3f34:	fe1ff06f          	j	3f14 <fatfs_get_file_entry+0xc0>
    3f38:	00040593          	mv	a1,s0
    3f3c:	01810513          	addi	a0,sp,24
    3f40:	fffff097          	auipc	ra,0xfffff
    3f44:	f34080e7          	jalr	-204(ra) # 2e74 <fatfs_entry_lfn_exists>
    3f48:	06050663          	beqz	a0,3fb4 <fatfs_get_file_entry+0x160>
    3f4c:	01810513          	addi	a0,sp,24
    3f50:	fffff097          	auipc	ra,0xfffff
    3f54:	ea0080e7          	jalr	-352(ra) # 2df0 <fatfs_lfn_cache_get>
    3f58:	000b8593          	mv	a1,s7
    3f5c:	fffff097          	auipc	ra,0xfffff
    3f60:	6dc080e7          	jalr	1756(ra) # 3638 <fatfs_compare_names>
    3f64:	fc0506e3          	beqz	a0,3f30 <fatfs_get_file_entry+0xdc>
    3f68:	02000613          	li	a2,32
    3f6c:	00040593          	mv	a1,s0
    3f70:	000c0513          	mv	a0,s8
    3f74:	ffffe097          	auipc	ra,0xffffe
    3f78:	08c080e7          	jalr	140(ra) # 2000 <memcpy>
    3f7c:	00100513          	li	a0,1
    3f80:	14c12083          	lw	ra,332(sp)
    3f84:	14812403          	lw	s0,328(sp)
    3f88:	14412483          	lw	s1,324(sp)
    3f8c:	14012903          	lw	s2,320(sp)
    3f90:	13c12983          	lw	s3,316(sp)
    3f94:	13812a03          	lw	s4,312(sp)
    3f98:	13412a83          	lw	s5,308(sp)
    3f9c:	13012b03          	lw	s6,304(sp)
    3fa0:	12c12b83          	lw	s7,300(sp)
    3fa4:	12812c03          	lw	s8,296(sp)
    3fa8:	12412c83          	lw	s9,292(sp)
    3fac:	15010113          	addi	sp,sp,336
    3fb0:	00008067          	ret
    3fb4:	00040513          	mv	a0,s0
    3fb8:	fffff097          	auipc	ra,0xfffff
    3fbc:	f0c080e7          	jalr	-244(ra) # 2ec4 <fatfs_entry_sfn_only>
    3fc0:	f4050ae3          	beqz	a0,3f14 <fatfs_get_file_entry+0xc0>
    3fc4:	00d00613          	li	a2,13
    3fc8:	00000593          	li	a1,0
    3fcc:	00090513          	mv	a0,s2
    3fd0:	ffffe097          	auipc	ra,0xffffe
    3fd4:	014080e7          	jalr	20(ra) # 1fe4 <memset>
    3fd8:	00000793          	li	a5,0
    3fdc:	00f406b3          	add	a3,s0,a5
    3fe0:	0006c683          	lbu	a3,0(a3)
    3fe4:	00f90733          	add	a4,s2,a5
    3fe8:	00178793          	addi	a5,a5,1
    3fec:	00d70023          	sb	a3,0(a4)
    3ff0:	ff5796e3          	bne	a5,s5,3fdc <fatfs_get_file_entry+0x188>
    3ff4:	00844703          	lbu	a4,8(s0)
    3ff8:	00944783          	lbu	a5,9(s0)
    3ffc:	00a44683          	lbu	a3,10(s0)
    4000:	00e108a3          	sb	a4,17(sp)
    4004:	00f10923          	sb	a5,18(sp)
    4008:	fe070713          	addi	a4,a4,-32
    400c:	fe078793          	addi	a5,a5,-32
    4010:	00f037b3          	snez	a5,a5
    4014:	00e03733          	snez	a4,a4
    4018:	00d109a3          	sb	a3,19(sp)
    401c:	00e7e7b3          	or	a5,a5,a4
    4020:	00079863          	bnez	a5,4030 <fatfs_get_file_entry+0x1dc>
    4024:	fe068693          	addi	a3,a3,-32
    4028:	02000793          	li	a5,32
    402c:	00068a63          	beqz	a3,4040 <fatfs_get_file_entry+0x1ec>
    4030:	00814703          	lbu	a4,8(sp)
    4034:	02e00793          	li	a5,46
    4038:	01671463          	bne	a4,s6,4040 <fatfs_get_file_entry+0x1ec>
    403c:	02000793          	li	a5,32
    4040:	00f10823          	sb	a5,16(sp)
    4044:	000b8593          	mv	a1,s7
    4048:	00090513          	mv	a0,s2
    404c:	f11ff06f          	j	3f5c <fatfs_get_file_entry+0x108>

00004050 <_open_directory>:
    4050:	eb010113          	addi	sp,sp,-336
    4054:	15212023          	sw	s2,320(sp)
    4058:	00008937          	lui	s2,0x8
    405c:	d9890913          	addi	s2,s2,-616 # 7d98 <_fs>
    4060:	14812423          	sw	s0,328(sp)
    4064:	00892403          	lw	s0,8(s2)
    4068:	14912223          	sw	s1,324(sp)
    406c:	13312e23          	sw	s3,316(sp)
    4070:	13412c23          	sw	s4,312(sp)
    4074:	13512a23          	sw	s5,308(sp)
    4078:	13612823          	sw	s6,304(sp)
    407c:	14112623          	sw	ra,332(sp)
    4080:	00050a13          	mv	s4,a0
    4084:	00058a93          	mv	s5,a1
    4088:	fffff097          	auipc	ra,0xfffff
    408c:	368080e7          	jalr	872(ra) # 33f0 <fatfs_total_path_levels>
    4090:	00050b13          	mv	s6,a0
    4094:	00000493          	li	s1,0
    4098:	fff00993          	li	s3,-1
    409c:	009b5863          	bge	s6,s1,40ac <_open_directory+0x5c>
    40a0:	008aa023          	sw	s0,0(s5)
    40a4:	00100513          	li	a0,1
    40a8:	0240006f          	j	40cc <_open_directory+0x7c>
    40ac:	10400693          	li	a3,260
    40b0:	02c10613          	addi	a2,sp,44
    40b4:	00048593          	mv	a1,s1
    40b8:	000a0513          	mv	a0,s4
    40bc:	fffff097          	auipc	ra,0xfffff
    40c0:	3a4080e7          	jalr	932(ra) # 3460 <fatfs_get_substring>
    40c4:	03351863          	bne	a0,s3,40f4 <_open_directory+0xa4>
    40c8:	00000513          	li	a0,0
    40cc:	14c12083          	lw	ra,332(sp)
    40d0:	14812403          	lw	s0,328(sp)
    40d4:	14412483          	lw	s1,324(sp)
    40d8:	14012903          	lw	s2,320(sp)
    40dc:	13c12983          	lw	s3,316(sp)
    40e0:	13812a03          	lw	s4,312(sp)
    40e4:	13412a83          	lw	s5,308(sp)
    40e8:	13012b03          	lw	s6,304(sp)
    40ec:	15010113          	addi	sp,sp,336
    40f0:	00008067          	ret
    40f4:	00c10693          	addi	a3,sp,12
    40f8:	02c10613          	addi	a2,sp,44
    40fc:	00040593          	mv	a1,s0
    4100:	00090513          	mv	a0,s2
    4104:	00000097          	auipc	ra,0x0
    4108:	d50080e7          	jalr	-688(ra) # 3e54 <fatfs_get_file_entry>
    410c:	fa050ee3          	beqz	a0,40c8 <_open_directory+0x78>
    4110:	01714783          	lbu	a5,23(sp)
    4114:	0107f793          	andi	a5,a5,16
    4118:	fa0788e3          	beqz	a5,40c8 <_open_directory+0x78>
    411c:	02015403          	lhu	s0,32(sp)
    4120:	02615783          	lhu	a5,38(sp)
    4124:	00148493          	addi	s1,s1,1
    4128:	01041413          	slli	s0,s0,0x10
    412c:	00f40433          	add	s0,s0,a5
    4130:	f6dff06f          	j	409c <_open_directory+0x4c>

00004134 <fl_opendir>:
    4134:	fe010113          	addi	sp,sp,-32
    4138:	fff00793          	li	a5,-1
    413c:	00f12623          	sw	a5,12(sp)
    4140:	000067b7          	lui	a5,0x6
    4144:	1787a783          	lw	a5,376(a5) # 6178 <_filelib_init>
    4148:	00812c23          	sw	s0,24(sp)
    414c:	01212823          	sw	s2,16(sp)
    4150:	00112e23          	sw	ra,28(sp)
    4154:	00912a23          	sw	s1,20(sp)
    4158:	00050913          	mv	s2,a0
    415c:	00058413          	mv	s0,a1
    4160:	00079663          	bnez	a5,416c <fl_opendir+0x38>
    4164:	fffff097          	auipc	ra,0xfffff
    4168:	a58080e7          	jalr	-1448(ra) # 2bbc <fl_init>
    416c:	000084b7          	lui	s1,0x8
    4170:	d9848493          	addi	s1,s1,-616 # 7d98 <_fs>
    4174:	03c4a783          	lw	a5,60(s1)
    4178:	00078463          	beqz	a5,4180 <fl_opendir+0x4c>
    417c:	000780e7          	jalr	a5
    4180:	00090513          	mv	a0,s2
    4184:	fffff097          	auipc	ra,0xfffff
    4188:	26c080e7          	jalr	620(ra) # 33f0 <fatfs_total_path_levels>
    418c:	fff00793          	li	a5,-1
    4190:	02f51063          	bne	a0,a5,41b0 <fl_opendir+0x7c>
    4194:	0084a783          	lw	a5,8(s1)
    4198:	00f12623          	sw	a5,12(sp)
    419c:	00c12783          	lw	a5,12(sp)
    41a0:	00042023          	sw	zero,0(s0)
    41a4:	00040423          	sb	zero,8(s0)
    41a8:	00f42223          	sw	a5,4(s0)
    41ac:	0180006f          	j	41c4 <fl_opendir+0x90>
    41b0:	00c10593          	addi	a1,sp,12
    41b4:	00090513          	mv	a0,s2
    41b8:	00000097          	auipc	ra,0x0
    41bc:	e98080e7          	jalr	-360(ra) # 4050 <_open_directory>
    41c0:	fc051ee3          	bnez	a0,419c <fl_opendir+0x68>
    41c4:	0404a783          	lw	a5,64(s1)
    41c8:	00078463          	beqz	a5,41d0 <fl_opendir+0x9c>
    41cc:	000780e7          	jalr	a5
    41d0:	00c12703          	lw	a4,12(sp)
    41d4:	fff00793          	li	a5,-1
    41d8:	00f71463          	bne	a4,a5,41e0 <fl_opendir+0xac>
    41dc:	00000413          	li	s0,0
    41e0:	01c12083          	lw	ra,28(sp)
    41e4:	00040513          	mv	a0,s0
    41e8:	01812403          	lw	s0,24(sp)
    41ec:	01412483          	lw	s1,20(sp)
    41f0:	01012903          	lw	s2,16(sp)
    41f4:	02010113          	addi	sp,sp,32
    41f8:	00008067          	ret

000041fc <_open_file>:
    41fc:	fc010113          	addi	sp,sp,-64
    4200:	03312623          	sw	s3,44(sp)
    4204:	02112e23          	sw	ra,60(sp)
    4208:	02812c23          	sw	s0,56(sp)
    420c:	02912a23          	sw	s1,52(sp)
    4210:	03212823          	sw	s2,48(sp)
    4214:	00050993          	mv	s3,a0
    4218:	ffffe097          	auipc	ra,0xffffe
    421c:	7b4080e7          	jalr	1972(ra) # 29cc <_allocate_file>
    4220:	06050463          	beqz	a0,4288 <_open_file+0x8c>
    4224:	01450913          	addi	s2,a0,20
    4228:	00050413          	mv	s0,a0
    422c:	10400613          	li	a2,260
    4230:	00000593          	li	a1,0
    4234:	00090513          	mv	a0,s2
    4238:	ffffe097          	auipc	ra,0xffffe
    423c:	dac080e7          	jalr	-596(ra) # 1fe4 <memset>
    4240:	11840493          	addi	s1,s0,280
    4244:	10400613          	li	a2,260
    4248:	00000593          	li	a1,0
    424c:	00048513          	mv	a0,s1
    4250:	ffffe097          	auipc	ra,0xffffe
    4254:	d94080e7          	jalr	-620(ra) # 1fe4 <memset>
    4258:	10400713          	li	a4,260
    425c:	00048693          	mv	a3,s1
    4260:	00070613          	mv	a2,a4
    4264:	00090593          	mv	a1,s2
    4268:	00098513          	mv	a0,s3
    426c:	fffff097          	auipc	ra,0xfffff
    4270:	2dc080e7          	jalr	732(ra) # 3548 <fatfs_split_path>
    4274:	fff00793          	li	a5,-1
    4278:	02f51a63          	bne	a0,a5,42ac <_open_file+0xb0>
    427c:	00040513          	mv	a0,s0
    4280:	ffffe097          	auipc	ra,0xffffe
    4284:	7c4080e7          	jalr	1988(ra) # 2a44 <_free_file>
    4288:	00000413          	li	s0,0
    428c:	03c12083          	lw	ra,60(sp)
    4290:	00040513          	mv	a0,s0
    4294:	03812403          	lw	s0,56(sp)
    4298:	03412483          	lw	s1,52(sp)
    429c:	03012903          	lw	s2,48(sp)
    42a0:	02c12983          	lw	s3,44(sp)
    42a4:	04010113          	addi	sp,sp,64
    42a8:	00008067          	ret
    42ac:	00040513          	mv	a0,s0
    42b0:	fffff097          	auipc	ra,0xfffff
    42b4:	514080e7          	jalr	1300(ra) # 37c4 <_check_file_open>
    42b8:	fc0512e3          	bnez	a0,427c <_open_file+0x80>
    42bc:	01444783          	lbu	a5,20(s0)
    42c0:	08079c63          	bnez	a5,4358 <_open_file+0x15c>
    42c4:	000087b7          	lui	a5,0x8
    42c8:	da07a783          	lw	a5,-608(a5) # 7da0 <_fs+0x8>
    42cc:	00f42023          	sw	a5,0(s0)
    42d0:	00042583          	lw	a1,0(s0)
    42d4:	00048613          	mv	a2,s1
    42d8:	000084b7          	lui	s1,0x8
    42dc:	00010693          	mv	a3,sp
    42e0:	d9848513          	addi	a0,s1,-616 # 7d98 <_fs>
    42e4:	00000097          	auipc	ra,0x0
    42e8:	b70080e7          	jalr	-1168(ra) # 3e54 <fatfs_get_file_entry>
    42ec:	f80508e3          	beqz	a0,427c <_open_file+0x80>
    42f0:	00b14783          	lbu	a5,11(sp)
    42f4:	0207f793          	andi	a5,a5,32
    42f8:	f80782e3          	beqz	a5,427c <_open_file+0x80>
    42fc:	00b00613          	li	a2,11
    4300:	00010593          	mv	a1,sp
    4304:	21c40513          	addi	a0,s0,540
    4308:	ffffe097          	auipc	ra,0xffffe
    430c:	cf8080e7          	jalr	-776(ra) # 2000 <memcpy>
    4310:	01c12783          	lw	a5,28(sp)
    4314:	01a15703          	lhu	a4,26(sp)
    4318:	00042423          	sw	zero,8(s0)
    431c:	00f42623          	sw	a5,12(s0)
    4320:	01415783          	lhu	a5,20(sp)
    4324:	42042a23          	sw	zero,1076(s0)
    4328:	00042823          	sw	zero,16(s0)
    432c:	01079793          	slli	a5,a5,0x10
    4330:	00e787b3          	add	a5,a5,a4
    4334:	00f42223          	sw	a5,4(s0)
    4338:	fff00793          	li	a5,-1
    433c:	42f42823          	sw	a5,1072(s0)
    4340:	22f42423          	sw	a5,552(s0)
    4344:	22f42623          	sw	a5,556(s0)
    4348:	d9848513          	addi	a0,s1,-616
    434c:	00000097          	auipc	ra,0x0
    4350:	858080e7          	jalr	-1960(ra) # 3ba4 <fatfs_fat_purge>
    4354:	f39ff06f          	j	428c <_open_file+0x90>
    4358:	00040593          	mv	a1,s0
    435c:	00090513          	mv	a0,s2
    4360:	00000097          	auipc	ra,0x0
    4364:	cf0080e7          	jalr	-784(ra) # 4050 <_open_directory>
    4368:	f60514e3          	bnez	a0,42d0 <_open_file+0xd4>
    436c:	f11ff06f          	j	427c <_open_file+0x80>

00004370 <fatfs_sfn_exists>:
    4370:	fe010113          	addi	sp,sp,-32
    4374:	01212823          	sw	s2,16(sp)
    4378:	01312623          	sw	s3,12(sp)
    437c:	01412423          	sw	s4,8(sp)
    4380:	01512223          	sw	s5,4(sp)
    4384:	01612023          	sw	s6,0(sp)
    4388:	00112e23          	sw	ra,28(sp)
    438c:	00812c23          	sw	s0,24(sp)
    4390:	00912a23          	sw	s1,20(sp)
    4394:	00050993          	mv	s3,a0
    4398:	00058a93          	mv	s5,a1
    439c:	00060b13          	mv	s6,a2
    43a0:	00000913          	li	s2,0
    43a4:	24450a13          	addi	s4,a0,580
    43a8:	00000693          	li	a3,0
    43ac:	00090613          	mv	a2,s2
    43b0:	000a8593          	mv	a1,s5
    43b4:	00098513          	mv	a0,s3
    43b8:	00000097          	auipc	ra,0x0
    43bc:	94c080e7          	jalr	-1716(ra) # 3d04 <fatfs_sector_reader>
    43c0:	00050413          	mv	s0,a0
    43c4:	06050263          	beqz	a0,4428 <fatfs_sfn_exists+0xb8>
    43c8:	00190913          	addi	s2,s2,1
    43cc:	04498493          	addi	s1,s3,68
    43d0:	00048513          	mv	a0,s1
    43d4:	fffff097          	auipc	ra,0xfffff
    43d8:	a58080e7          	jalr	-1448(ra) # 2e2c <fatfs_entry_lfn_text>
    43dc:	00050863          	beqz	a0,43ec <fatfs_sfn_exists+0x7c>
    43e0:	02048493          	addi	s1,s1,32
    43e4:	ff4496e3          	bne	s1,s4,43d0 <fatfs_sfn_exists+0x60>
    43e8:	fc1ff06f          	j	43a8 <fatfs_sfn_exists+0x38>
    43ec:	00048513          	mv	a0,s1
    43f0:	fffff097          	auipc	ra,0xfffff
    43f4:	a50080e7          	jalr	-1456(ra) # 2e40 <fatfs_entry_lfn_invalid>
    43f8:	fe0514e3          	bnez	a0,43e0 <fatfs_sfn_exists+0x70>
    43fc:	00048513          	mv	a0,s1
    4400:	fffff097          	auipc	ra,0xfffff
    4404:	ac4080e7          	jalr	-1340(ra) # 2ec4 <fatfs_entry_sfn_only>
    4408:	00050413          	mv	s0,a0
    440c:	fc050ae3          	beqz	a0,43e0 <fatfs_sfn_exists+0x70>
    4410:	00b00613          	li	a2,11
    4414:	000b0593          	mv	a1,s6
    4418:	00048513          	mv	a0,s1
    441c:	ffffe097          	auipc	ra,0xffffe
    4420:	c28080e7          	jalr	-984(ra) # 2044 <strncmp>
    4424:	fa051ee3          	bnez	a0,43e0 <fatfs_sfn_exists+0x70>
    4428:	01c12083          	lw	ra,28(sp)
    442c:	00040513          	mv	a0,s0
    4430:	01812403          	lw	s0,24(sp)
    4434:	01412483          	lw	s1,20(sp)
    4438:	01012903          	lw	s2,16(sp)
    443c:	00c12983          	lw	s3,12(sp)
    4440:	00812a03          	lw	s4,8(sp)
    4444:	00412a83          	lw	s5,4(sp)
    4448:	00012b03          	lw	s6,0(sp)
    444c:	02010113          	addi	sp,sp,32
    4450:	00008067          	ret

00004454 <fatfs_update_file_length>:
    4454:	03852783          	lw	a5,56(a0)
    4458:	14078e63          	beqz	a5,45b4 <fatfs_update_file_length+0x160>
    445c:	fd010113          	addi	sp,sp,-48
    4460:	02912223          	sw	s1,36(sp)
    4464:	03212023          	sw	s2,32(sp)
    4468:	01312e23          	sw	s3,28(sp)
    446c:	01412c23          	sw	s4,24(sp)
    4470:	01612823          	sw	s6,16(sp)
    4474:	01712623          	sw	s7,12(sp)
    4478:	02112623          	sw	ra,44(sp)
    447c:	02812423          	sw	s0,40(sp)
    4480:	01512a23          	sw	s5,20(sp)
    4484:	00068913          	mv	s2,a3
    4488:	00060b93          	mv	s7,a2
    448c:	00058b13          	mv	s6,a1
    4490:	00050493          	mv	s1,a0
    4494:	00000993          	li	s3,0
    4498:	24450a13          	addi	s4,a0,580
    449c:	00000693          	li	a3,0
    44a0:	00098613          	mv	a2,s3
    44a4:	000b0593          	mv	a1,s6
    44a8:	00048513          	mv	a0,s1
    44ac:	00000097          	auipc	ra,0x0
    44b0:	858080e7          	jalr	-1960(ra) # 3d04 <fatfs_sector_reader>
    44b4:	0c050863          	beqz	a0,4584 <fatfs_update_file_length+0x130>
    44b8:	04448413          	addi	s0,s1,68
    44bc:	00198993          	addi	s3,s3,1
    44c0:	00040a93          	mv	s5,s0
    44c4:	00040513          	mv	a0,s0
    44c8:	fffff097          	auipc	ra,0xfffff
    44cc:	964080e7          	jalr	-1692(ra) # 2e2c <fatfs_entry_lfn_text>
    44d0:	0a051463          	bnez	a0,4578 <fatfs_update_file_length+0x124>
    44d4:	00040513          	mv	a0,s0
    44d8:	fffff097          	auipc	ra,0xfffff
    44dc:	968080e7          	jalr	-1688(ra) # 2e40 <fatfs_entry_lfn_invalid>
    44e0:	08051c63          	bnez	a0,4578 <fatfs_update_file_length+0x124>
    44e4:	00040513          	mv	a0,s0
    44e8:	fffff097          	auipc	ra,0xfffff
    44ec:	9dc080e7          	jalr	-1572(ra) # 2ec4 <fatfs_entry_sfn_only>
    44f0:	08050463          	beqz	a0,4578 <fatfs_update_file_length+0x124>
    44f4:	00b00613          	li	a2,11
    44f8:	000b8593          	mv	a1,s7
    44fc:	00040513          	mv	a0,s0
    4500:	ffffe097          	auipc	ra,0xffffe
    4504:	b44080e7          	jalr	-1212(ra) # 2044 <strncmp>
    4508:	06051863          	bnez	a0,4578 <fatfs_update_file_length+0x124>
    450c:	00895793          	srli	a5,s2,0x8
    4510:	01240e23          	sb	s2,28(s0)
    4514:	00f40ea3          	sb	a5,29(s0)
    4518:	01095793          	srli	a5,s2,0x10
    451c:	01895913          	srli	s2,s2,0x18
    4520:	00f40f23          	sb	a5,30(s0)
    4524:	01240fa3          	sb	s2,31(s0)
    4528:	00040593          	mv	a1,s0
    452c:	02000613          	li	a2,32
    4530:	00040513          	mv	a0,s0
    4534:	ffffe097          	auipc	ra,0xffffe
    4538:	acc080e7          	jalr	-1332(ra) # 2000 <memcpy>
    453c:	02812403          	lw	s0,40(sp)
    4540:	0384a783          	lw	a5,56(s1)
    4544:	2444a503          	lw	a0,580(s1)
    4548:	02c12083          	lw	ra,44(sp)
    454c:	02412483          	lw	s1,36(sp)
    4550:	02012903          	lw	s2,32(sp)
    4554:	01c12983          	lw	s3,28(sp)
    4558:	01812a03          	lw	s4,24(sp)
    455c:	01012b03          	lw	s6,16(sp)
    4560:	00c12b83          	lw	s7,12(sp)
    4564:	000a8593          	mv	a1,s5
    4568:	01412a83          	lw	s5,20(sp)
    456c:	00100613          	li	a2,1
    4570:	03010113          	addi	sp,sp,48
    4574:	00078067          	jr	a5
    4578:	02040413          	addi	s0,s0,32
    457c:	f54414e3          	bne	s0,s4,44c4 <fatfs_update_file_length+0x70>
    4580:	f1dff06f          	j	449c <fatfs_update_file_length+0x48>
    4584:	02c12083          	lw	ra,44(sp)
    4588:	02812403          	lw	s0,40(sp)
    458c:	02412483          	lw	s1,36(sp)
    4590:	02012903          	lw	s2,32(sp)
    4594:	01c12983          	lw	s3,28(sp)
    4598:	01812a03          	lw	s4,24(sp)
    459c:	01412a83          	lw	s5,20(sp)
    45a0:	01012b03          	lw	s6,16(sp)
    45a4:	00c12b83          	lw	s7,12(sp)
    45a8:	00000513          	li	a0,0
    45ac:	03010113          	addi	sp,sp,48
    45b0:	00008067          	ret
    45b4:	00000513          	li	a0,0
    45b8:	00008067          	ret

000045bc <fatfs_list_directory_next>:
    45bc:	ec010113          	addi	sp,sp,-320
    45c0:	13212823          	sw	s2,304(sp)
    45c4:	13312623          	sw	s3,300(sp)
    45c8:	13412423          	sw	s4,296(sp)
    45cc:	13512223          	sw	s5,292(sp)
    45d0:	13612023          	sw	s6,288(sp)
    45d4:	12112e23          	sw	ra,316(sp)
    45d8:	12812c23          	sw	s0,312(sp)
    45dc:	12912a23          	sw	s1,308(sp)
    45e0:	00050a13          	mv	s4,a0
    45e4:	00058913          	mv	s2,a1
    45e8:	00060993          	mv	s3,a2
    45ec:	10010ea3          	sb	zero,285(sp)
    45f0:	04450a93          	addi	s5,a0,68
    45f4:	00f00b13          	li	s6,15
    45f8:	00092603          	lw	a2,0(s2)
    45fc:	00492583          	lw	a1,4(s2)
    4600:	00000693          	li	a3,0
    4604:	000a0513          	mv	a0,s4
    4608:	fffff097          	auipc	ra,0xfffff
    460c:	6fc080e7          	jalr	1788(ra) # 3d04 <fatfs_sector_reader>
    4610:	10050c63          	beqz	a0,4728 <fatfs_list_directory_next+0x16c>
    4614:	00894483          	lbu	s1,8(s2)
    4618:	00549413          	slli	s0,s1,0x5
    461c:	008a8433          	add	s0,s5,s0
    4620:	009b7c63          	bgeu	s6,s1,4638 <fatfs_list_directory_next+0x7c>
    4624:	00092783          	lw	a5,0(s2)
    4628:	00090423          	sb	zero,8(s2)
    462c:	00178793          	addi	a5,a5,1
    4630:	00f92023          	sw	a5,0(s2)
    4634:	fc5ff06f          	j	45f8 <fatfs_list_directory_next+0x3c>
    4638:	00040513          	mv	a0,s0
    463c:	ffffe097          	auipc	ra,0xffffe
    4640:	7f0080e7          	jalr	2032(ra) # 2e2c <fatfs_entry_lfn_text>
    4644:	02050263          	beqz	a0,4668 <fatfs_list_directory_next+0xac>
    4648:	00040593          	mv	a1,s0
    464c:	01810513          	addi	a0,sp,24
    4650:	ffffe097          	auipc	ra,0xffffe
    4654:	6d4080e7          	jalr	1748(ra) # 2d24 <fatfs_lfn_cache_entry>
    4658:	00148493          	addi	s1,s1,1
    465c:	0ff4f493          	zext.b	s1,s1
    4660:	02040413          	addi	s0,s0,32
    4664:	fbdff06f          	j	4620 <fatfs_list_directory_next+0x64>
    4668:	00040513          	mv	a0,s0
    466c:	ffffe097          	auipc	ra,0xffffe
    4670:	7d4080e7          	jalr	2004(ra) # 2e40 <fatfs_entry_lfn_invalid>
    4674:	00050663          	beqz	a0,4680 <fatfs_list_directory_next+0xc4>
    4678:	10010ea3          	sb	zero,285(sp)
    467c:	fddff06f          	j	4658 <fatfs_list_directory_next+0x9c>
    4680:	00040593          	mv	a1,s0
    4684:	01810513          	addi	a0,sp,24
    4688:	ffffe097          	auipc	ra,0xffffe
    468c:	7ec080e7          	jalr	2028(ra) # 2e74 <fatfs_entry_lfn_exists>
    4690:	0c050063          	beqz	a0,4750 <fatfs_list_directory_next+0x194>
    4694:	01810513          	addi	a0,sp,24
    4698:	ffffe097          	auipc	ra,0xffffe
    469c:	758080e7          	jalr	1880(ra) # 2df0 <fatfs_lfn_cache_get>
    46a0:	00050593          	mv	a1,a0
    46a4:	10300613          	li	a2,259
    46a8:	00098513          	mv	a0,s3
    46ac:	ffffe097          	auipc	ra,0xffffe
    46b0:	9d8080e7          	jalr	-1576(ra) # 2084 <strncpy>
    46b4:	00040513          	mv	a0,s0
    46b8:	fffff097          	auipc	ra,0xfffff
    46bc:	84c080e7          	jalr	-1972(ra) # 2f04 <fatfs_entry_is_dir>
    46c0:	10a98223          	sb	a0,260(s3)
    46c4:	01d44783          	lbu	a5,29(s0)
    46c8:	01c44703          	lbu	a4,28(s0)
    46cc:	00148493          	addi	s1,s1,1
    46d0:	00879793          	slli	a5,a5,0x8
    46d4:	00e7e7b3          	or	a5,a5,a4
    46d8:	01e44703          	lbu	a4,30(s0)
    46dc:	00100513          	li	a0,1
    46e0:	01071713          	slli	a4,a4,0x10
    46e4:	00f76733          	or	a4,a4,a5
    46e8:	01f44783          	lbu	a5,31(s0)
    46ec:	01879793          	slli	a5,a5,0x18
    46f0:	00e7e7b3          	or	a5,a5,a4
    46f4:	10f9a623          	sw	a5,268(s3)
    46f8:	01544783          	lbu	a5,21(s0)
    46fc:	01444703          	lbu	a4,20(s0)
    4700:	01a44683          	lbu	a3,26(s0)
    4704:	00879793          	slli	a5,a5,0x8
    4708:	00e7e7b3          	or	a5,a5,a4
    470c:	01b44703          	lbu	a4,27(s0)
    4710:	01079793          	slli	a5,a5,0x10
    4714:	00871713          	slli	a4,a4,0x8
    4718:	00d76733          	or	a4,a4,a3
    471c:	00e7e7b3          	or	a5,a5,a4
    4720:	10f9a423          	sw	a5,264(s3)
    4724:	00990423          	sb	s1,8(s2)
    4728:	13c12083          	lw	ra,316(sp)
    472c:	13812403          	lw	s0,312(sp)
    4730:	13412483          	lw	s1,308(sp)
    4734:	13012903          	lw	s2,304(sp)
    4738:	12c12983          	lw	s3,300(sp)
    473c:	12812a03          	lw	s4,296(sp)
    4740:	12412a83          	lw	s5,292(sp)
    4744:	12012b03          	lw	s6,288(sp)
    4748:	14010113          	addi	sp,sp,320
    474c:	00008067          	ret
    4750:	00040513          	mv	a0,s0
    4754:	ffffe097          	auipc	ra,0xffffe
    4758:	770080e7          	jalr	1904(ra) # 2ec4 <fatfs_entry_sfn_only>
    475c:	ee050ee3          	beqz	a0,4658 <fatfs_list_directory_next+0x9c>
    4760:	00810a13          	addi	s4,sp,8
    4764:	00d00613          	li	a2,13
    4768:	00000593          	li	a1,0
    476c:	000a0513          	mv	a0,s4
    4770:	10010ea3          	sb	zero,285(sp)
    4774:	ffffe097          	auipc	ra,0xffffe
    4778:	870080e7          	jalr	-1936(ra) # 1fe4 <memset>
    477c:	00000793          	li	a5,0
    4780:	00800713          	li	a4,8
    4784:	00f40633          	add	a2,s0,a5
    4788:	00064603          	lbu	a2,0(a2)
    478c:	00fa06b3          	add	a3,s4,a5
    4790:	00178793          	addi	a5,a5,1
    4794:	00c68023          	sb	a2,0(a3)
    4798:	fee796e3          	bne	a5,a4,4784 <fatfs_list_directory_next+0x1c8>
    479c:	00844783          	lbu	a5,8(s0)
    47a0:	00944703          	lbu	a4,9(s0)
    47a4:	00a44683          	lbu	a3,10(s0)
    47a8:	00f108a3          	sb	a5,17(sp)
    47ac:	00e10923          	sb	a4,18(sp)
    47b0:	fe078793          	addi	a5,a5,-32
    47b4:	fe070713          	addi	a4,a4,-32
    47b8:	00f037b3          	snez	a5,a5
    47bc:	00e03733          	snez	a4,a4
    47c0:	00d109a3          	sb	a3,19(sp)
    47c4:	00e7e7b3          	or	a5,a5,a4
    47c8:	00079863          	bnez	a5,47d8 <fatfs_list_directory_next+0x21c>
    47cc:	fe068693          	addi	a3,a3,-32
    47d0:	02000793          	li	a5,32
    47d4:	00068a63          	beqz	a3,47e8 <fatfs_list_directory_next+0x22c>
    47d8:	00814703          	lbu	a4,8(sp)
    47dc:	02e00793          	li	a5,46
    47e0:	00f71463          	bne	a4,a5,47e8 <fatfs_list_directory_next+0x22c>
    47e4:	02000793          	li	a5,32
    47e8:	000a0593          	mv	a1,s4
    47ec:	00098513          	mv	a0,s3
    47f0:	00f10823          	sb	a5,16(sp)
    47f4:	fffff097          	auipc	ra,0xfffff
    47f8:	054080e7          	jalr	84(ra) # 3848 <fatfs_get_sfn_display_name>
    47fc:	eb9ff06f          	j	46b4 <fatfs_list_directory_next+0xf8>

00004800 <fl_readdir>:
    4800:	000067b7          	lui	a5,0x6
    4804:	1787a783          	lw	a5,376(a5) # 6178 <_filelib_init>
    4808:	fd010113          	addi	sp,sp,-48
    480c:	03212023          	sw	s2,32(sp)
    4810:	01312e23          	sw	s3,28(sp)
    4814:	02112623          	sw	ra,44(sp)
    4818:	02812423          	sw	s0,40(sp)
    481c:	02912223          	sw	s1,36(sp)
    4820:	00050913          	mv	s2,a0
    4824:	00058993          	mv	s3,a1
    4828:	00079663          	bnez	a5,4834 <fl_readdir+0x34>
    482c:	ffffe097          	auipc	ra,0xffffe
    4830:	390080e7          	jalr	912(ra) # 2bbc <fl_init>
    4834:	000084b7          	lui	s1,0x8
    4838:	d9848413          	addi	s0,s1,-616 # 7d98 <_fs>
    483c:	03c42783          	lw	a5,60(s0)
    4840:	00078463          	beqz	a5,4848 <fl_readdir+0x48>
    4844:	000780e7          	jalr	a5
    4848:	00098613          	mv	a2,s3
    484c:	00090593          	mv	a1,s2
    4850:	d9848513          	addi	a0,s1,-616
    4854:	00000097          	auipc	ra,0x0
    4858:	d68080e7          	jalr	-664(ra) # 45bc <fatfs_list_directory_next>
    485c:	04042783          	lw	a5,64(s0)
    4860:	00078863          	beqz	a5,4870 <fl_readdir+0x70>
    4864:	00a12623          	sw	a0,12(sp)
    4868:	000780e7          	jalr	a5
    486c:	00c12503          	lw	a0,12(sp)
    4870:	02c12083          	lw	ra,44(sp)
    4874:	02812403          	lw	s0,40(sp)
    4878:	00154513          	xori	a0,a0,1
    487c:	02412483          	lw	s1,36(sp)
    4880:	02012903          	lw	s2,32(sp)
    4884:	01c12983          	lw	s3,28(sp)
    4888:	40a00533          	neg	a0,a0
    488c:	03010113          	addi	sp,sp,48
    4890:	00008067          	ret

00004894 <_read_sectors>:
    4894:	fd010113          	addi	sp,sp,-48
    4898:	01512a23          	sw	s5,20(sp)
    489c:	00008ab7          	lui	s5,0x8
    48a0:	01312e23          	sw	s3,28(sp)
    48a4:	d98ac983          	lbu	s3,-616(s5) # 7d98 <_fs>
    48a8:	01612823          	sw	s6,16(sp)
    48ac:	00058b13          	mv	s6,a1
    48b0:	02912223          	sw	s1,36(sp)
    48b4:	00098593          	mv	a1,s3
    48b8:	00050493          	mv	s1,a0
    48bc:	000b0513          	mv	a0,s6
    48c0:	02112623          	sw	ra,44(sp)
    48c4:	02812423          	sw	s0,40(sp)
    48c8:	01412c23          	sw	s4,24(sp)
    48cc:	00068413          	mv	s0,a3
    48d0:	01712623          	sw	s7,12(sp)
    48d4:	01812423          	sw	s8,8(sp)
    48d8:	03212023          	sw	s2,32(sp)
    48dc:	00060c13          	mv	s8,a2
    48e0:	ffffd097          	auipc	ra,0xffffd
    48e4:	658080e7          	jalr	1624(ra) # 1f38 <__udivsi3>
    48e8:	00050a13          	mv	s4,a0
    48ec:	00098593          	mv	a1,s3
    48f0:	000b0513          	mv	a0,s6
    48f4:	ffffd097          	auipc	ra,0xffffd
    48f8:	68c080e7          	jalr	1676(ra) # 1f80 <__umodsi3>
    48fc:	00a407b3          	add	a5,s0,a0
    4900:	00050b93          	mv	s7,a0
    4904:	00f9fe63          	bgeu	s3,a5,4920 <_read_sectors+0x8c>
    4908:	000a0593          	mv	a1,s4
    490c:	00098513          	mv	a0,s3
    4910:	ffffe097          	auipc	ra,0xffffe
    4914:	e18080e7          	jalr	-488(ra) # 2728 <__mulsi3>
    4918:	416987b3          	sub	a5,s3,s6
    491c:	00f50433          	add	s0,a0,a5
    4920:	2284a903          	lw	s2,552(s1)
    4924:	07491863          	bne	s2,s4,4994 <_read_sectors+0x100>
    4928:	22c4a583          	lw	a1,556(s1)
    492c:	fff00793          	li	a5,-1
    4930:	02f58663          	beq	a1,a5,495c <_read_sectors+0xc8>
    4934:	d98a8513          	addi	a0,s5,-616
    4938:	ffffe097          	auipc	ra,0xffffe
    493c:	154080e7          	jalr	340(ra) # 2a8c <fatfs_lba_of_cluster>
    4940:	017505b3          	add	a1,a0,s7
    4944:	00040693          	mv	a3,s0
    4948:	000c0613          	mv	a2,s8
    494c:	d98a8513          	addi	a0,s5,-616
    4950:	ffffe097          	auipc	ra,0xffffe
    4954:	188080e7          	jalr	392(ra) # 2ad8 <fatfs_sector_read>
    4958:	00051463          	bnez	a0,4960 <_read_sectors+0xcc>
    495c:	00000413          	li	s0,0
    4960:	02c12083          	lw	ra,44(sp)
    4964:	00040513          	mv	a0,s0
    4968:	02812403          	lw	s0,40(sp)
    496c:	02412483          	lw	s1,36(sp)
    4970:	02012903          	lw	s2,32(sp)
    4974:	01c12983          	lw	s3,28(sp)
    4978:	01812a03          	lw	s4,24(sp)
    497c:	01412a83          	lw	s5,20(sp)
    4980:	01012b03          	lw	s6,16(sp)
    4984:	00c12b83          	lw	s7,12(sp)
    4988:	00812c03          	lw	s8,8(sp)
    498c:	03010113          	addi	sp,sp,48
    4990:	00008067          	ret
    4994:	033b6463          	bltu	s6,s3,49bc <_read_sectors+0x128>
    4998:	00190793          	addi	a5,s2,1
    499c:	03479063          	bne	a5,s4,49bc <_read_sectors+0x128>
    49a0:	22c4a583          	lw	a1,556(s1)
    49a4:	03496263          	bltu	s2,s4,49c8 <_read_sectors+0x134>
    49a8:	fff00793          	li	a5,-1
    49ac:	faf588e3          	beq	a1,a5,495c <_read_sectors+0xc8>
    49b0:	22b4a623          	sw	a1,556(s1)
    49b4:	2344a423          	sw	s4,552(s1)
    49b8:	f7dff06f          	j	4934 <_read_sectors+0xa0>
    49bc:	0044a583          	lw	a1,4(s1)
    49c0:	00000913          	li	s2,0
    49c4:	fe1ff06f          	j	49a4 <_read_sectors+0x110>
    49c8:	d98a8513          	addi	a0,s5,-616
    49cc:	fffff097          	auipc	ra,0xfffff
    49d0:	230080e7          	jalr	560(ra) # 3bfc <fatfs_find_next_cluster>
    49d4:	00050593          	mv	a1,a0
    49d8:	00190913          	addi	s2,s2,1
    49dc:	fc9ff06f          	j	49a4 <_read_sectors+0x110>

000049e0 <fatfs_set_fs_info_next_free_cluster>:
    49e0:	03052783          	lw	a5,48(a0)
    49e4:	0a078463          	beqz	a5,4a8c <fatfs_set_fs_info_next_free_cluster+0xac>
    49e8:	fe010113          	addi	sp,sp,-32
    49ec:	01c52783          	lw	a5,28(a0)
    49f0:	00912a23          	sw	s1,20(sp)
    49f4:	00058493          	mv	s1,a1
    49f8:	01855583          	lhu	a1,24(a0)
    49fc:	00812c23          	sw	s0,24(sp)
    4a00:	00112e23          	sw	ra,28(sp)
    4a04:	00f585b3          	add	a1,a1,a5
    4a08:	00050413          	mv	s0,a0
    4a0c:	ffffe097          	auipc	ra,0xffffe
    4a10:	ed4080e7          	jalr	-300(ra) # 28e0 <fatfs_fat_read_sector>
    4a14:	00050593          	mv	a1,a0
    4a18:	06050063          	beqz	a0,4a78 <fatfs_set_fs_info_next_free_cluster+0x98>
    4a1c:	20852783          	lw	a5,520(a0)
    4a20:	0084d713          	srli	a4,s1,0x8
    4a24:	00100613          	li	a2,1
    4a28:	1e978623          	sb	s1,492(a5)
    4a2c:	20852783          	lw	a5,520(a0)
    4a30:	1ee786a3          	sb	a4,493(a5)
    4a34:	20852783          	lw	a5,520(a0)
    4a38:	0104d713          	srli	a4,s1,0x10
    4a3c:	1ee78723          	sb	a4,494(a5)
    4a40:	20852783          	lw	a5,520(a0)
    4a44:	0184d713          	srli	a4,s1,0x18
    4a48:	1ee787a3          	sb	a4,495(a5)
    4a4c:	03842783          	lw	a5,56(s0)
    4a50:	20c52223          	sw	a2,516(a0)
    4a54:	02942223          	sw	s1,36(s0)
    4a58:	00078a63          	beqz	a5,4a6c <fatfs_set_fs_info_next_free_cluster+0x8c>
    4a5c:	20052503          	lw	a0,512(a0)
    4a60:	00b12623          	sw	a1,12(sp)
    4a64:	000780e7          	jalr	a5
    4a68:	00c12583          	lw	a1,12(sp)
    4a6c:	fff00793          	li	a5,-1
    4a70:	20f5a023          	sw	a5,512(a1)
    4a74:	2005a223          	sw	zero,516(a1)
    4a78:	01c12083          	lw	ra,28(sp)
    4a7c:	01812403          	lw	s0,24(sp)
    4a80:	01412483          	lw	s1,20(sp)
    4a84:	02010113          	addi	sp,sp,32
    4a88:	00008067          	ret
    4a8c:	00008067          	ret

00004a90 <fatfs_find_blank_cluster>:
    4a90:	fd010113          	addi	sp,sp,-48
    4a94:	01312e23          	sw	s3,28(sp)
    4a98:	100009b7          	lui	s3,0x10000
    4a9c:	02912223          	sw	s1,36(sp)
    4aa0:	03212023          	sw	s2,32(sp)
    4aa4:	02112623          	sw	ra,44(sp)
    4aa8:	02812423          	sw	s0,40(sp)
    4aac:	00050913          	mv	s2,a0
    4ab0:	00058493          	mv	s1,a1
    4ab4:	fff98993          	addi	s3,s3,-1 # fffffff <__stacktop+0xffeffff>
    4ab8:	03092783          	lw	a5,48(s2)
    4abc:	0074d413          	srli	s0,s1,0x7
    4ac0:	00079463          	bnez	a5,4ac8 <fatfs_find_blank_cluster+0x38>
    4ac4:	0084d413          	srli	s0,s1,0x8
    4ac8:	02092783          	lw	a5,32(s2)
    4acc:	0cf47863          	bgeu	s0,a5,4b9c <fatfs_find_blank_cluster+0x10c>
    4ad0:	01492583          	lw	a1,20(s2)
    4ad4:	00090513          	mv	a0,s2
    4ad8:	00c12623          	sw	a2,12(sp)
    4adc:	00b405b3          	add	a1,s0,a1
    4ae0:	ffffe097          	auipc	ra,0xffffe
    4ae4:	e00080e7          	jalr	-512(ra) # 28e0 <fatfs_fat_read_sector>
    4ae8:	0a050a63          	beqz	a0,4b9c <fatfs_find_blank_cluster+0x10c>
    4aec:	03092783          	lw	a5,48(s2)
    4af0:	20852703          	lw	a4,520(a0)
    4af4:	00c12603          	lw	a2,12(sp)
    4af8:	04079a63          	bnez	a5,4b4c <fatfs_find_blank_cluster+0xbc>
    4afc:	00841413          	slli	s0,s0,0x8
    4b00:	40848433          	sub	s0,s1,s0
    4b04:	00141413          	slli	s0,s0,0x1
    4b08:	01041413          	slli	s0,s0,0x10
    4b0c:	01045413          	srli	s0,s0,0x10
    4b10:	00870733          	add	a4,a4,s0
    4b14:	00174783          	lbu	a5,1(a4)
    4b18:	00074703          	lbu	a4,0(a4)
    4b1c:	00879793          	slli	a5,a5,0x8
    4b20:	00e787b3          	add	a5,a5,a4
    4b24:	06079863          	bnez	a5,4b94 <fatfs_find_blank_cluster+0x104>
    4b28:	00962023          	sw	s1,0(a2)
    4b2c:	00100513          	li	a0,1
    4b30:	02c12083          	lw	ra,44(sp)
    4b34:	02812403          	lw	s0,40(sp)
    4b38:	02412483          	lw	s1,36(sp)
    4b3c:	02012903          	lw	s2,32(sp)
    4b40:	01c12983          	lw	s3,28(sp)
    4b44:	03010113          	addi	sp,sp,48
    4b48:	00008067          	ret
    4b4c:	00741413          	slli	s0,s0,0x7
    4b50:	40848433          	sub	s0,s1,s0
    4b54:	00241413          	slli	s0,s0,0x2
    4b58:	01041413          	slli	s0,s0,0x10
    4b5c:	01045413          	srli	s0,s0,0x10
    4b60:	00870733          	add	a4,a4,s0
    4b64:	00374783          	lbu	a5,3(a4)
    4b68:	00274683          	lbu	a3,2(a4)
    4b6c:	01879793          	slli	a5,a5,0x18
    4b70:	01069693          	slli	a3,a3,0x10
    4b74:	00d787b3          	add	a5,a5,a3
    4b78:	00074683          	lbu	a3,0(a4)
    4b7c:	00174703          	lbu	a4,1(a4)
    4b80:	00d787b3          	add	a5,a5,a3
    4b84:	00871713          	slli	a4,a4,0x8
    4b88:	00e787b3          	add	a5,a5,a4
    4b8c:	0137f7b3          	and	a5,a5,s3
    4b90:	f95ff06f          	j	4b24 <fatfs_find_blank_cluster+0x94>
    4b94:	00148493          	addi	s1,s1,1
    4b98:	f21ff06f          	j	4ab8 <fatfs_find_blank_cluster+0x28>
    4b9c:	00000513          	li	a0,0
    4ba0:	f91ff06f          	j	4b30 <fatfs_find_blank_cluster+0xa0>

00004ba4 <fatfs_fat_set_cluster>:
    4ba4:	03052783          	lw	a5,48(a0)
    4ba8:	fe010113          	addi	sp,sp,-32
    4bac:	00812c23          	sw	s0,24(sp)
    4bb0:	00912a23          	sw	s1,20(sp)
    4bb4:	01212823          	sw	s2,16(sp)
    4bb8:	00112e23          	sw	ra,28(sp)
    4bbc:	00050913          	mv	s2,a0
    4bc0:	00058413          	mv	s0,a1
    4bc4:	0085d493          	srli	s1,a1,0x8
    4bc8:	00078463          	beqz	a5,4bd0 <fatfs_fat_set_cluster+0x2c>
    4bcc:	0075d493          	srli	s1,a1,0x7
    4bd0:	01492583          	lw	a1,20(s2)
    4bd4:	00090513          	mv	a0,s2
    4bd8:	00c12623          	sw	a2,12(sp)
    4bdc:	00b485b3          	add	a1,s1,a1
    4be0:	ffffe097          	auipc	ra,0xffffe
    4be4:	d00080e7          	jalr	-768(ra) # 28e0 <fatfs_fat_read_sector>
    4be8:	00050793          	mv	a5,a0
    4bec:	00000513          	li	a0,0
    4bf0:	04078663          	beqz	a5,4c3c <fatfs_fat_set_cluster+0x98>
    4bf4:	03092683          	lw	a3,48(s2)
    4bf8:	2087a703          	lw	a4,520(a5)
    4bfc:	00c12603          	lw	a2,12(sp)
    4c00:	04069a63          	bnez	a3,4c54 <fatfs_fat_set_cluster+0xb0>
    4c04:	00849493          	slli	s1,s1,0x8
    4c08:	40940433          	sub	s0,s0,s1
    4c0c:	00141413          	slli	s0,s0,0x1
    4c10:	01041413          	slli	s0,s0,0x10
    4c14:	01045413          	srli	s0,s0,0x10
    4c18:	00870733          	add	a4,a4,s0
    4c1c:	00c70023          	sb	a2,0(a4)
    4c20:	2087a703          	lw	a4,520(a5)
    4c24:	00865613          	srli	a2,a2,0x8
    4c28:	00870733          	add	a4,a4,s0
    4c2c:	00c700a3          	sb	a2,1(a4)
    4c30:	00100713          	li	a4,1
    4c34:	20e7a223          	sw	a4,516(a5)
    4c38:	00100513          	li	a0,1
    4c3c:	01c12083          	lw	ra,28(sp)
    4c40:	01812403          	lw	s0,24(sp)
    4c44:	01412483          	lw	s1,20(sp)
    4c48:	01012903          	lw	s2,16(sp)
    4c4c:	02010113          	addi	sp,sp,32
    4c50:	00008067          	ret
    4c54:	00749493          	slli	s1,s1,0x7
    4c58:	40940433          	sub	s0,s0,s1
    4c5c:	00241413          	slli	s0,s0,0x2
    4c60:	01041413          	slli	s0,s0,0x10
    4c64:	01045413          	srli	s0,s0,0x10
    4c68:	00870733          	add	a4,a4,s0
    4c6c:	00c70023          	sb	a2,0(a4)
    4c70:	2087a703          	lw	a4,520(a5)
    4c74:	00865693          	srli	a3,a2,0x8
    4c78:	00870733          	add	a4,a4,s0
    4c7c:	00d700a3          	sb	a3,1(a4)
    4c80:	2087a703          	lw	a4,520(a5)
    4c84:	01065693          	srli	a3,a2,0x10
    4c88:	01865613          	srli	a2,a2,0x18
    4c8c:	00870733          	add	a4,a4,s0
    4c90:	00d70123          	sb	a3,2(a4)
    4c94:	2087a703          	lw	a4,520(a5)
    4c98:	00870733          	add	a4,a4,s0
    4c9c:	00c701a3          	sb	a2,3(a4)
    4ca0:	f91ff06f          	j	4c30 <fatfs_fat_set_cluster+0x8c>

00004ca4 <fatfs_free_cluster_chain>:
    4ca4:	fe010113          	addi	sp,sp,-32
    4ca8:	00812c23          	sw	s0,24(sp)
    4cac:	00912a23          	sw	s1,20(sp)
    4cb0:	00112e23          	sw	ra,28(sp)
    4cb4:	01212823          	sw	s2,16(sp)
    4cb8:	00050493          	mv	s1,a0
    4cbc:	ffd00413          	li	s0,-3
    4cc0:	fff58793          	addi	a5,a1,-1
    4cc4:	02f47063          	bgeu	s0,a5,4ce4 <fatfs_free_cluster_chain+0x40>
    4cc8:	01c12083          	lw	ra,28(sp)
    4ccc:	01812403          	lw	s0,24(sp)
    4cd0:	01412483          	lw	s1,20(sp)
    4cd4:	01012903          	lw	s2,16(sp)
    4cd8:	00100513          	li	a0,1
    4cdc:	02010113          	addi	sp,sp,32
    4ce0:	00008067          	ret
    4ce4:	00048513          	mv	a0,s1
    4ce8:	00b12623          	sw	a1,12(sp)
    4cec:	fffff097          	auipc	ra,0xfffff
    4cf0:	f10080e7          	jalr	-240(ra) # 3bfc <fatfs_find_next_cluster>
    4cf4:	00c12583          	lw	a1,12(sp)
    4cf8:	00050913          	mv	s2,a0
    4cfc:	00000613          	li	a2,0
    4d00:	00048513          	mv	a0,s1
    4d04:	00000097          	auipc	ra,0x0
    4d08:	ea0080e7          	jalr	-352(ra) # 4ba4 <fatfs_fat_set_cluster>
    4d0c:	00090593          	mv	a1,s2
    4d10:	fb1ff06f          	j	4cc0 <fatfs_free_cluster_chain+0x1c>

00004d14 <fatfs_fat_add_cluster_to_chain>:
    4d14:	fd010113          	addi	sp,sp,-48
    4d18:	02912223          	sw	s1,36(sp)
    4d1c:	02112623          	sw	ra,44(sp)
    4d20:	02812423          	sw	s0,40(sp)
    4d24:	03212023          	sw	s2,32(sp)
    4d28:	01312e23          	sw	s3,28(sp)
    4d2c:	fff00493          	li	s1,-1
    4d30:	02959263          	bne	a1,s1,4d54 <fatfs_fat_add_cluster_to_chain+0x40>
    4d34:	00000513          	li	a0,0
    4d38:	02c12083          	lw	ra,44(sp)
    4d3c:	02812403          	lw	s0,40(sp)
    4d40:	02412483          	lw	s1,36(sp)
    4d44:	02012903          	lw	s2,32(sp)
    4d48:	01c12983          	lw	s3,28(sp)
    4d4c:	03010113          	addi	sp,sp,48
    4d50:	00008067          	ret
    4d54:	00050913          	mv	s2,a0
    4d58:	00058413          	mv	s0,a1
    4d5c:	00060993          	mv	s3,a2
    4d60:	00040593          	mv	a1,s0
    4d64:	00090513          	mv	a0,s2
    4d68:	00812623          	sw	s0,12(sp)
    4d6c:	fffff097          	auipc	ra,0xfffff
    4d70:	e90080e7          	jalr	-368(ra) # 3bfc <fatfs_find_next_cluster>
    4d74:	00050413          	mv	s0,a0
    4d78:	fa050ee3          	beqz	a0,4d34 <fatfs_fat_add_cluster_to_chain+0x20>
    4d7c:	00c12583          	lw	a1,12(sp)
    4d80:	fe9510e3          	bne	a0,s1,4d60 <fatfs_fat_add_cluster_to_chain+0x4c>
    4d84:	00098613          	mv	a2,s3
    4d88:	00090513          	mv	a0,s2
    4d8c:	00000097          	auipc	ra,0x0
    4d90:	e18080e7          	jalr	-488(ra) # 4ba4 <fatfs_fat_set_cluster>
    4d94:	00040613          	mv	a2,s0
    4d98:	00098593          	mv	a1,s3
    4d9c:	00090513          	mv	a0,s2
    4da0:	00000097          	auipc	ra,0x0
    4da4:	e04080e7          	jalr	-508(ra) # 4ba4 <fatfs_fat_set_cluster>
    4da8:	00100513          	li	a0,1
    4dac:	f8dff06f          	j	4d38 <fatfs_fat_add_cluster_to_chain+0x24>

00004db0 <fatfs_add_free_space>:
    4db0:	02452783          	lw	a5,36(a0)
    4db4:	fd010113          	addi	sp,sp,-48
    4db8:	02812423          	sw	s0,40(sp)
    4dbc:	01312e23          	sw	s3,28(sp)
    4dc0:	01412c23          	sw	s4,24(sp)
    4dc4:	0005a983          	lw	s3,0(a1)
    4dc8:	01512a23          	sw	s5,20(sp)
    4dcc:	00058a13          	mv	s4,a1
    4dd0:	02112623          	sw	ra,44(sp)
    4dd4:	02912223          	sw	s1,36(sp)
    4dd8:	03212023          	sw	s2,32(sp)
    4ddc:	fff00593          	li	a1,-1
    4de0:	00050413          	mv	s0,a0
    4de4:	00060a93          	mv	s5,a2
    4de8:	00b78663          	beq	a5,a1,4df4 <fatfs_add_free_space+0x44>
    4dec:	00000097          	auipc	ra,0x0
    4df0:	bf4080e7          	jalr	-1036(ra) # 49e0 <fatfs_set_fs_info_next_free_cluster>
    4df4:	00000493          	li	s1,0
    4df8:	03549663          	bne	s1,s5,4e24 <fatfs_add_free_space+0x74>
    4dfc:	00100513          	li	a0,1
    4e00:	02c12083          	lw	ra,44(sp)
    4e04:	02812403          	lw	s0,40(sp)
    4e08:	02412483          	lw	s1,36(sp)
    4e0c:	02012903          	lw	s2,32(sp)
    4e10:	01c12983          	lw	s3,28(sp)
    4e14:	01812a03          	lw	s4,24(sp)
    4e18:	01412a83          	lw	s5,20(sp)
    4e1c:	03010113          	addi	sp,sp,48
    4e20:	00008067          	ret
    4e24:	00842583          	lw	a1,8(s0)
    4e28:	00c10613          	addi	a2,sp,12
    4e2c:	00040513          	mv	a0,s0
    4e30:	00000097          	auipc	ra,0x0
    4e34:	c60080e7          	jalr	-928(ra) # 4a90 <fatfs_find_blank_cluster>
    4e38:	fc0504e3          	beqz	a0,4e00 <fatfs_add_free_space+0x50>
    4e3c:	00c12903          	lw	s2,12(sp)
    4e40:	00098593          	mv	a1,s3
    4e44:	00040513          	mv	a0,s0
    4e48:	00090613          	mv	a2,s2
    4e4c:	00000097          	auipc	ra,0x0
    4e50:	d58080e7          	jalr	-680(ra) # 4ba4 <fatfs_fat_set_cluster>
    4e54:	fff00613          	li	a2,-1
    4e58:	00090593          	mv	a1,s2
    4e5c:	00040513          	mv	a0,s0
    4e60:	00000097          	auipc	ra,0x0
    4e64:	d44080e7          	jalr	-700(ra) # 4ba4 <fatfs_fat_set_cluster>
    4e68:	00049463          	bnez	s1,4e70 <fatfs_add_free_space+0xc0>
    4e6c:	012a2023          	sw	s2,0(s4)
    4e70:	00148493          	addi	s1,s1,1
    4e74:	00090993          	mv	s3,s2
    4e78:	f81ff06f          	j	4df8 <fatfs_add_free_space+0x48>

00004e7c <_write_sectors>:
    4e7c:	fb010113          	addi	sp,sp,-80
    4e80:	03512a23          	sw	s5,52(sp)
    4e84:	00008ab7          	lui	s5,0x8
    4e88:	04112623          	sw	ra,76(sp)
    4e8c:	04812423          	sw	s0,72(sp)
    4e90:	04912223          	sw	s1,68(sp)
    4e94:	03412c23          	sw	s4,56(sp)
    4e98:	03612823          	sw	s6,48(sp)
    4e9c:	03712623          	sw	s7,44(sp)
    4ea0:	03812423          	sw	s8,40(sp)
    4ea4:	03912223          	sw	s9,36(sp)
    4ea8:	03a12023          	sw	s10,32(sp)
    4eac:	05212023          	sw	s2,64(sp)
    4eb0:	03312e23          	sw	s3,60(sp)
    4eb4:	d98a8b93          	addi	s7,s5,-616 # 7d98 <_fs>
    4eb8:	000bc983          	lbu	s3,0(s7)
    4ebc:	00058b13          	mv	s6,a1
    4ec0:	fff00793          	li	a5,-1
    4ec4:	00098593          	mv	a1,s3
    4ec8:	00050493          	mv	s1,a0
    4ecc:	000b0513          	mv	a0,s6
    4ed0:	00068c13          	mv	s8,a3
    4ed4:	00f12e23          	sw	a5,28(sp)
    4ed8:	00060d13          	mv	s10,a2
    4edc:	ffffd097          	auipc	ra,0xffffd
    4ee0:	05c080e7          	jalr	92(ra) # 1f38 <__udivsi3>
    4ee4:	00050a13          	mv	s4,a0
    4ee8:	00098593          	mv	a1,s3
    4eec:	000b0513          	mv	a0,s6
    4ef0:	ffffd097          	auipc	ra,0xffffd
    4ef4:	090080e7          	jalr	144(ra) # 1f80 <__umodsi3>
    4ef8:	00ac07b3          	add	a5,s8,a0
    4efc:	00050c93          	mv	s9,a0
    4f00:	000c0413          	mv	s0,s8
    4f04:	00f9fe63          	bgeu	s3,a5,4f20 <_write_sectors+0xa4>
    4f08:	000a0593          	mv	a1,s4
    4f0c:	00098513          	mv	a0,s3
    4f10:	ffffe097          	auipc	ra,0xffffe
    4f14:	818080e7          	jalr	-2024(ra) # 2728 <__mulsi3>
    4f18:	416987b3          	sub	a5,s3,s6
    4f1c:	00f50433          	add	s0,a0,a5
    4f20:	2284a903          	lw	s2,552(s1)
    4f24:	03491a63          	bne	s2,s4,4f58 <_write_sectors+0xdc>
    4f28:	22c4a583          	lw	a1,556(s1)
    4f2c:	d98a8513          	addi	a0,s5,-616
    4f30:	ffffe097          	auipc	ra,0xffffe
    4f34:	b5c080e7          	jalr	-1188(ra) # 2a8c <fatfs_lba_of_cluster>
    4f38:	019505b3          	add	a1,a0,s9
    4f3c:	00040693          	mv	a3,s0
    4f40:	000d0613          	mv	a2,s10
    4f44:	d98a8513          	addi	a0,s5,-616
    4f48:	ffffe097          	auipc	ra,0xffffe
    4f4c:	ba8080e7          	jalr	-1112(ra) # 2af0 <fatfs_sector_write>
    4f50:	04050a63          	beqz	a0,4fa4 <_write_sectors+0x128>
    4f54:	0540006f          	j	4fa8 <_write_sectors+0x12c>
    4f58:	093b6663          	bltu	s6,s3,4fe4 <_write_sectors+0x168>
    4f5c:	00190793          	addi	a5,s2,1
    4f60:	09479263          	bne	a5,s4,4fe4 <_write_sectors+0x168>
    4f64:	22c4a583          	lw	a1,556(s1)
    4f68:	fff00b13          	li	s6,-1
    4f6c:	09496263          	bltu	s2,s4,4ff0 <_write_sectors+0x174>
    4f70:	fff00793          	li	a5,-1
    4f74:	0af59463          	bne	a1,a5,501c <_write_sectors+0x1a0>
    4f78:	000bc583          	lbu	a1,0(s7)
    4f7c:	fff58513          	addi	a0,a1,-1
    4f80:	01850533          	add	a0,a0,s8
    4f84:	ffffd097          	auipc	ra,0xffffd
    4f88:	fb4080e7          	jalr	-76(ra) # 1f38 <__udivsi3>
    4f8c:	00050613          	mv	a2,a0
    4f90:	01c10593          	addi	a1,sp,28
    4f94:	000b8513          	mv	a0,s7
    4f98:	00000097          	auipc	ra,0x0
    4f9c:	e18080e7          	jalr	-488(ra) # 4db0 <fatfs_add_free_space>
    4fa0:	06051c63          	bnez	a0,5018 <_write_sectors+0x19c>
    4fa4:	00000413          	li	s0,0
    4fa8:	04c12083          	lw	ra,76(sp)
    4fac:	00040513          	mv	a0,s0
    4fb0:	04812403          	lw	s0,72(sp)
    4fb4:	04412483          	lw	s1,68(sp)
    4fb8:	04012903          	lw	s2,64(sp)
    4fbc:	03c12983          	lw	s3,60(sp)
    4fc0:	03812a03          	lw	s4,56(sp)
    4fc4:	03412a83          	lw	s5,52(sp)
    4fc8:	03012b03          	lw	s6,48(sp)
    4fcc:	02c12b83          	lw	s7,44(sp)
    4fd0:	02812c03          	lw	s8,40(sp)
    4fd4:	02412c83          	lw	s9,36(sp)
    4fd8:	02012d03          	lw	s10,32(sp)
    4fdc:	05010113          	addi	sp,sp,80
    4fe0:	00008067          	ret
    4fe4:	0044a583          	lw	a1,4(s1)
    4fe8:	00000913          	li	s2,0
    4fec:	f7dff06f          	j	4f68 <_write_sectors+0xec>
    4ff0:	d98a8513          	addi	a0,s5,-616
    4ff4:	00b12623          	sw	a1,12(sp)
    4ff8:	fffff097          	auipc	ra,0xfffff
    4ffc:	c04080e7          	jalr	-1020(ra) # 3bfc <fatfs_find_next_cluster>
    5000:	00c12583          	lw	a1,12(sp)
    5004:	00b12e23          	sw	a1,28(sp)
    5008:	f76508e3          	beq	a0,s6,4f78 <_write_sectors+0xfc>
    500c:	00190913          	addi	s2,s2,1
    5010:	00050593          	mv	a1,a0
    5014:	f59ff06f          	j	4f6c <_write_sectors+0xf0>
    5018:	01c12583          	lw	a1,28(sp)
    501c:	22b4a623          	sw	a1,556(s1)
    5020:	2344a423          	sw	s4,552(s1)
    5024:	f09ff06f          	j	4f2c <_write_sectors+0xb0>

00005028 <fl_fflush>:
    5028:	000067b7          	lui	a5,0x6
    502c:	1787a783          	lw	a5,376(a5) # 6178 <_filelib_init>
    5030:	ff010113          	addi	sp,sp,-16
    5034:	00812423          	sw	s0,8(sp)
    5038:	00112623          	sw	ra,12(sp)
    503c:	00912223          	sw	s1,4(sp)
    5040:	00050413          	mv	s0,a0
    5044:	00079663          	bnez	a5,5050 <fl_fflush+0x28>
    5048:	ffffe097          	auipc	ra,0xffffe
    504c:	b74080e7          	jalr	-1164(ra) # 2bbc <fl_init>
    5050:	04040663          	beqz	s0,509c <fl_fflush+0x74>
    5054:	000084b7          	lui	s1,0x8
    5058:	d9848493          	addi	s1,s1,-616 # 7d98 <_fs>
    505c:	03c4a783          	lw	a5,60(s1)
    5060:	00078463          	beqz	a5,5068 <fl_fflush+0x40>
    5064:	000780e7          	jalr	a5
    5068:	43442783          	lw	a5,1076(s0)
    506c:	02078263          	beqz	a5,5090 <fl_fflush+0x68>
    5070:	43042583          	lw	a1,1072(s0)
    5074:	00100693          	li	a3,1
    5078:	23040613          	addi	a2,s0,560
    507c:	00040513          	mv	a0,s0
    5080:	00000097          	auipc	ra,0x0
    5084:	dfc080e7          	jalr	-516(ra) # 4e7c <_write_sectors>
    5088:	00050463          	beqz	a0,5090 <fl_fflush+0x68>
    508c:	42042a23          	sw	zero,1076(s0)
    5090:	0404a783          	lw	a5,64(s1)
    5094:	00078463          	beqz	a5,509c <fl_fflush+0x74>
    5098:	000780e7          	jalr	a5
    509c:	00c12083          	lw	ra,12(sp)
    50a0:	00812403          	lw	s0,8(sp)
    50a4:	00412483          	lw	s1,4(sp)
    50a8:	00000513          	li	a0,0
    50ac:	01010113          	addi	sp,sp,16
    50b0:	00008067          	ret

000050b4 <fl_fclose>:
    50b4:	000067b7          	lui	a5,0x6
    50b8:	1787a783          	lw	a5,376(a5) # 6178 <_filelib_init>
    50bc:	ff010113          	addi	sp,sp,-16
    50c0:	00812423          	sw	s0,8(sp)
    50c4:	00112623          	sw	ra,12(sp)
    50c8:	00912223          	sw	s1,4(sp)
    50cc:	01212023          	sw	s2,0(sp)
    50d0:	00050413          	mv	s0,a0
    50d4:	00079663          	bnez	a5,50e0 <fl_fclose+0x2c>
    50d8:	ffffe097          	auipc	ra,0xffffe
    50dc:	ae4080e7          	jalr	-1308(ra) # 2bbc <fl_init>
    50e0:	08040c63          	beqz	s0,5178 <fl_fclose+0xc4>
    50e4:	000084b7          	lui	s1,0x8
    50e8:	d9848913          	addi	s2,s1,-616 # 7d98 <_fs>
    50ec:	03c92783          	lw	a5,60(s2)
    50f0:	00078463          	beqz	a5,50f8 <fl_fclose+0x44>
    50f4:	000780e7          	jalr	a5
    50f8:	00040513          	mv	a0,s0
    50fc:	00000097          	auipc	ra,0x0
    5100:	f2c080e7          	jalr	-212(ra) # 5028 <fl_fflush>
    5104:	01042783          	lw	a5,16(s0)
    5108:	00078e63          	beqz	a5,5124 <fl_fclose+0x70>
    510c:	00c42683          	lw	a3,12(s0)
    5110:	00042583          	lw	a1,0(s0)
    5114:	21c40613          	addi	a2,s0,540
    5118:	d9848513          	addi	a0,s1,-616
    511c:	fffff097          	auipc	ra,0xfffff
    5120:	338080e7          	jalr	824(ra) # 4454 <fatfs_update_file_length>
    5124:	fff00793          	li	a5,-1
    5128:	42f42823          	sw	a5,1072(s0)
    512c:	00040513          	mv	a0,s0
    5130:	00042423          	sw	zero,8(s0)
    5134:	00042623          	sw	zero,12(s0)
    5138:	00042223          	sw	zero,4(s0)
    513c:	42042a23          	sw	zero,1076(s0)
    5140:	00042823          	sw	zero,16(s0)
    5144:	ffffe097          	auipc	ra,0xffffe
    5148:	900080e7          	jalr	-1792(ra) # 2a44 <_free_file>
    514c:	d9848513          	addi	a0,s1,-616
    5150:	fffff097          	auipc	ra,0xfffff
    5154:	a54080e7          	jalr	-1452(ra) # 3ba4 <fatfs_fat_purge>
    5158:	04092783          	lw	a5,64(s2)
    515c:	00078e63          	beqz	a5,5178 <fl_fclose+0xc4>
    5160:	00812403          	lw	s0,8(sp)
    5164:	00c12083          	lw	ra,12(sp)
    5168:	00412483          	lw	s1,4(sp)
    516c:	00012903          	lw	s2,0(sp)
    5170:	01010113          	addi	sp,sp,16
    5174:	00078067          	jr	a5
    5178:	00c12083          	lw	ra,12(sp)
    517c:	00812403          	lw	s0,8(sp)
    5180:	00412483          	lw	s1,4(sp)
    5184:	00012903          	lw	s2,0(sp)
    5188:	01010113          	addi	sp,sp,16
    518c:	00008067          	ret

00005190 <fl_fread>:
    5190:	000067b7          	lui	a5,0x6
    5194:	1787a783          	lw	a5,376(a5) # 6178 <_filelib_init>
    5198:	fc010113          	addi	sp,sp,-64
    519c:	02812c23          	sw	s0,56(sp)
    51a0:	03512223          	sw	s5,36(sp)
    51a4:	02112e23          	sw	ra,60(sp)
    51a8:	02912a23          	sw	s1,52(sp)
    51ac:	03212823          	sw	s2,48(sp)
    51b0:	03312623          	sw	s3,44(sp)
    51b4:	03412423          	sw	s4,40(sp)
    51b8:	03612023          	sw	s6,32(sp)
    51bc:	01712e23          	sw	s7,28(sp)
    51c0:	01812c23          	sw	s8,24(sp)
    51c4:	01912a23          	sw	s9,20(sp)
    51c8:	00050a93          	mv	s5,a0
    51cc:	00068413          	mv	s0,a3
    51d0:	00058513          	mv	a0,a1
    51d4:	00079e63          	bnez	a5,51f0 <fl_fread+0x60>
    51d8:	00c12623          	sw	a2,12(sp)
    51dc:	00b12423          	sw	a1,8(sp)
    51e0:	ffffe097          	auipc	ra,0xffffe
    51e4:	9dc080e7          	jalr	-1572(ra) # 2bbc <fl_init>
    51e8:	00c12603          	lw	a2,12(sp)
    51ec:	00812503          	lw	a0,8(sp)
    51f0:	14040e63          	beqz	s0,534c <fl_fread+0x1bc>
    51f4:	140a8c63          	beqz	s5,534c <fl_fread+0x1bc>
    51f8:	43844783          	lbu	a5,1080(s0)
    51fc:	fff00493          	li	s1,-1
    5200:	0017f793          	andi	a5,a5,1
    5204:	04078863          	beqz	a5,5254 <fl_fread+0xc4>
    5208:	00060593          	mv	a1,a2
    520c:	ffffd097          	auipc	ra,0xffffd
    5210:	51c080e7          	jalr	1308(ra) # 2728 <__mulsi3>
    5214:	00050493          	mv	s1,a0
    5218:	02050e63          	beqz	a0,5254 <fl_fread+0xc4>
    521c:	00842583          	lw	a1,8(s0)
    5220:	00c42783          	lw	a5,12(s0)
    5224:	12f5f463          	bgeu	a1,a5,534c <fl_fread+0x1bc>
    5228:	00b50733          	add	a4,a0,a1
    522c:	00e7f463          	bgeu	a5,a4,5234 <fl_fread+0xa4>
    5230:	40b784b3          	sub	s1,a5,a1
    5234:	0095da13          	srli	s4,a1,0x9
    5238:	1ff5f913          	andi	s2,a1,511
    523c:	00000993          	li	s3,0
    5240:	23040b13          	addi	s6,s0,560
    5244:	20000b93          	li	s7,512
    5248:	1ff00c13          	li	s8,511
    524c:	0499c063          	blt	s3,s1,528c <fl_fread+0xfc>
    5250:	00098493          	mv	s1,s3
    5254:	03c12083          	lw	ra,60(sp)
    5258:	03812403          	lw	s0,56(sp)
    525c:	03012903          	lw	s2,48(sp)
    5260:	02c12983          	lw	s3,44(sp)
    5264:	02812a03          	lw	s4,40(sp)
    5268:	02412a83          	lw	s5,36(sp)
    526c:	02012b03          	lw	s6,32(sp)
    5270:	01c12b83          	lw	s7,28(sp)
    5274:	01812c03          	lw	s8,24(sp)
    5278:	01412c83          	lw	s9,20(sp)
    527c:	00048513          	mv	a0,s1
    5280:	03412483          	lw	s1,52(sp)
    5284:	04010113          	addi	sp,sp,64
    5288:	00008067          	ret
    528c:	04091663          	bnez	s2,52d8 <fl_fread+0x148>
    5290:	413486b3          	sub	a3,s1,s3
    5294:	04dc5263          	bge	s8,a3,52d8 <fl_fread+0x148>
    5298:	4096d693          	srai	a3,a3,0x9
    529c:	013a8633          	add	a2,s5,s3
    52a0:	000a0593          	mv	a1,s4
    52a4:	00040513          	mv	a0,s0
    52a8:	fffff097          	auipc	ra,0xfffff
    52ac:	5ec080e7          	jalr	1516(ra) # 4894 <_read_sectors>
    52b0:	fa0500e3          	beqz	a0,5250 <fl_fread+0xc0>
    52b4:	00951c93          	slli	s9,a0,0x9
    52b8:	000c8613          	mv	a2,s9
    52bc:	00aa0a33          	add	s4,s4,a0
    52c0:	00842783          	lw	a5,8(s0)
    52c4:	00c989b3          	add	s3,s3,a2
    52c8:	00000913          	li	s2,0
    52cc:	019787b3          	add	a5,a5,s9
    52d0:	00f42423          	sw	a5,8(s0)
    52d4:	f79ff06f          	j	524c <fl_fread+0xbc>
    52d8:	43042783          	lw	a5,1072(s0)
    52dc:	03478e63          	beq	a5,s4,5318 <fl_fread+0x188>
    52e0:	43442783          	lw	a5,1076(s0)
    52e4:	00078863          	beqz	a5,52f4 <fl_fread+0x164>
    52e8:	00040513          	mv	a0,s0
    52ec:	00000097          	auipc	ra,0x0
    52f0:	d3c080e7          	jalr	-708(ra) # 5028 <fl_fflush>
    52f4:	00100693          	li	a3,1
    52f8:	000b0613          	mv	a2,s6
    52fc:	000a0593          	mv	a1,s4
    5300:	00040513          	mv	a0,s0
    5304:	fffff097          	auipc	ra,0xfffff
    5308:	590080e7          	jalr	1424(ra) # 4894 <_read_sectors>
    530c:	f40502e3          	beqz	a0,5250 <fl_fread+0xc0>
    5310:	43442823          	sw	s4,1072(s0)
    5314:	42042a23          	sw	zero,1076(s0)
    5318:	412b87b3          	sub	a5,s7,s2
    531c:	41348633          	sub	a2,s1,s3
    5320:	00c7d463          	bge	a5,a2,5328 <fl_fread+0x198>
    5324:	00078613          	mv	a2,a5
    5328:	012b05b3          	add	a1,s6,s2
    532c:	013a8533          	add	a0,s5,s3
    5330:	00060c93          	mv	s9,a2
    5334:	00c12423          	sw	a2,8(sp)
    5338:	ffffd097          	auipc	ra,0xffffd
    533c:	cc8080e7          	jalr	-824(ra) # 2000 <memcpy>
    5340:	00812603          	lw	a2,8(sp)
    5344:	001a0a13          	addi	s4,s4,1
    5348:	f79ff06f          	j	52c0 <fl_fread+0x130>
    534c:	fff00493          	li	s1,-1
    5350:	f05ff06f          	j	5254 <fl_fread+0xc4>

00005354 <fatfs_allocate_free_space>:
    5354:	fd010113          	addi	sp,sp,-48
    5358:	02112623          	sw	ra,44(sp)
    535c:	02812423          	sw	s0,40(sp)
    5360:	02912223          	sw	s1,36(sp)
    5364:	03212023          	sw	s2,32(sp)
    5368:	01312e23          	sw	s3,28(sp)
    536c:	01412c23          	sw	s4,24(sp)
    5370:	01512a23          	sw	s5,20(sp)
    5374:	02069863          	bnez	a3,53a4 <fatfs_allocate_free_space+0x50>
    5378:	00000413          	li	s0,0
    537c:	02c12083          	lw	ra,44(sp)
    5380:	00040513          	mv	a0,s0
    5384:	02812403          	lw	s0,40(sp)
    5388:	02412483          	lw	s1,36(sp)
    538c:	02012903          	lw	s2,32(sp)
    5390:	01c12983          	lw	s3,28(sp)
    5394:	01812a03          	lw	s4,24(sp)
    5398:	01412a83          	lw	s5,20(sp)
    539c:	03010113          	addi	sp,sp,48
    53a0:	00008067          	ret
    53a4:	02452783          	lw	a5,36(a0)
    53a8:	00058a13          	mv	s4,a1
    53ac:	fff00593          	li	a1,-1
    53b0:	00050493          	mv	s1,a0
    53b4:	00068913          	mv	s2,a3
    53b8:	00060993          	mv	s3,a2
    53bc:	00b78663          	beq	a5,a1,53c8 <fatfs_allocate_free_space+0x74>
    53c0:	fffff097          	auipc	ra,0xfffff
    53c4:	620080e7          	jalr	1568(ra) # 49e0 <fatfs_set_fs_info_next_free_cluster>
    53c8:	0004c783          	lbu	a5,0(s1)
    53cc:	00090513          	mv	a0,s2
    53d0:	00979a93          	slli	s5,a5,0x9
    53d4:	000a8593          	mv	a1,s5
    53d8:	ffffd097          	auipc	ra,0xffffd
    53dc:	b60080e7          	jalr	-1184(ra) # 1f38 <__udivsi3>
    53e0:	00050413          	mv	s0,a0
    53e4:	00050593          	mv	a1,a0
    53e8:	000a8513          	mv	a0,s5
    53ec:	ffffd097          	auipc	ra,0xffffd
    53f0:	33c080e7          	jalr	828(ra) # 2728 <__mulsi3>
    53f4:	41250533          	sub	a0,a0,s2
    53f8:	00a03533          	snez	a0,a0
    53fc:	00a40933          	add	s2,s0,a0
    5400:	040a0463          	beqz	s4,5448 <fatfs_allocate_free_space+0xf4>
    5404:	0084a583          	lw	a1,8(s1)
    5408:	00c10613          	addi	a2,sp,12
    540c:	00048513          	mv	a0,s1
    5410:	fffff097          	auipc	ra,0xfffff
    5414:	680080e7          	jalr	1664(ra) # 4a90 <fatfs_find_blank_cluster>
    5418:	00050413          	mv	s0,a0
    541c:	f4050ee3          	beqz	a0,5378 <fatfs_allocate_free_space+0x24>
    5420:	00100793          	li	a5,1
    5424:	02f91663          	bne	s2,a5,5450 <fatfs_allocate_free_space+0xfc>
    5428:	00c12903          	lw	s2,12(sp)
    542c:	fff00613          	li	a2,-1
    5430:	00048513          	mv	a0,s1
    5434:	00090593          	mv	a1,s2
    5438:	fffff097          	auipc	ra,0xfffff
    543c:	76c080e7          	jalr	1900(ra) # 4ba4 <fatfs_fat_set_cluster>
    5440:	0129a023          	sw	s2,0(s3)
    5444:	f39ff06f          	j	537c <fatfs_allocate_free_space+0x28>
    5448:	0009a783          	lw	a5,0(s3)
    544c:	00f12623          	sw	a5,12(sp)
    5450:	00090613          	mv	a2,s2
    5454:	00c10593          	addi	a1,sp,12
    5458:	00048513          	mv	a0,s1
    545c:	00000097          	auipc	ra,0x0
    5460:	954080e7          	jalr	-1708(ra) # 4db0 <fatfs_add_free_space>
    5464:	00050413          	mv	s0,a0
    5468:	f15ff06f          	j	537c <fatfs_allocate_free_space+0x28>

0000546c <fatfs_add_file_entry>:
    546c:	03852883          	lw	a7,56(a0)
    5470:	30088e63          	beqz	a7,578c <fatfs_add_file_entry+0x320>
    5474:	f8010113          	addi	sp,sp,-128
    5478:	06812c23          	sw	s0,120(sp)
    547c:	00050413          	mv	s0,a0
    5480:	00060513          	mv	a0,a2
    5484:	06912a23          	sw	s1,116(sp)
    5488:	07512223          	sw	s5,100(sp)
    548c:	00f12c23          	sw	a5,24(sp)
    5490:	00e12a23          	sw	a4,20(sp)
    5494:	06112e23          	sw	ra,124(sp)
    5498:	07212823          	sw	s2,112(sp)
    549c:	07312623          	sw	s3,108(sp)
    54a0:	07412423          	sw	s4,104(sp)
    54a4:	07612023          	sw	s6,96(sp)
    54a8:	05712e23          	sw	s7,92(sp)
    54ac:	05812c23          	sw	s8,88(sp)
    54b0:	05912a23          	sw	s9,84(sp)
    54b4:	05a12823          	sw	s10,80(sp)
    54b8:	05b12623          	sw	s11,76(sp)
    54bc:	01012e23          	sw	a6,28(sp)
    54c0:	00068a93          	mv	s5,a3
    54c4:	00c12823          	sw	a2,16(sp)
    54c8:	00b12423          	sw	a1,8(sp)
    54cc:	ffffe097          	auipc	ra,0xffffe
    54d0:	a48080e7          	jalr	-1464(ra) # 2f14 <fatfs_lfn_entries_required>
    54d4:	00150713          	addi	a4,a0,1
    54d8:	00100793          	li	a5,1
    54dc:	00050493          	mv	s1,a0
    54e0:	2ae7f263          	bgeu	a5,a4,5784 <fatfs_add_file_entry+0x318>
    54e4:	00000a13          	li	s4,0
    54e8:	00000993          	li	s3,0
    54ec:	00000913          	li	s2,0
    54f0:	00000c93          	li	s9,0
    54f4:	00000b13          	li	s6,0
    54f8:	01000c13          	li	s8,16
    54fc:	00812583          	lw	a1,8(sp)
    5500:	00000693          	li	a3,0
    5504:	000b0613          	mv	a2,s6
    5508:	00040513          	mv	a0,s0
    550c:	000b0b93          	mv	s7,s6
    5510:	ffffe097          	auipc	ra,0xffffe
    5514:	7f4080e7          	jalr	2036(ra) # 3d04 <fatfs_sector_reader>
    5518:	18050463          	beqz	a0,56a0 <fatfs_add_file_entry+0x234>
    551c:	001b0b13          	addi	s6,s6,1
    5520:	04440793          	addi	a5,s0,68
    5524:	000c8d13          	mv	s10,s9
    5528:	00000d93          	li	s11,0
    552c:	00078513          	mv	a0,a5
    5530:	00f12623          	sw	a5,12(sp)
    5534:	ffffe097          	auipc	ra,0xffffe
    5538:	8f8080e7          	jalr	-1800(ra) # 2e2c <fatfs_entry_lfn_text>
    553c:	00c12783          	lw	a5,12(sp)
    5540:	00050c93          	mv	s9,a0
    5544:	02050c63          	beqz	a0,557c <fatfs_add_file_entry+0x110>
    5548:	020d0463          	beqz	s10,5570 <fatfs_add_file_entry+0x104>
    554c:	00090c93          	mv	s9,s2
    5550:	000c8913          	mv	s2,s9
    5554:	001d0c93          	addi	s9,s10,1
    5558:	001d8d93          	addi	s11,s11,1
    555c:	0ffdfd93          	zext.b	s11,s11
    5560:	02078793          	addi	a5,a5,32
    5564:	f98d8ce3          	beq	s11,s8,54fc <fatfs_add_file_entry+0x90>
    5568:	000c8d13          	mv	s10,s9
    556c:	fc1ff06f          	j	552c <fatfs_add_file_entry+0xc0>
    5570:	000d8a13          	mv	s4,s11
    5574:	000b8993          	mv	s3,s7
    5578:	fd9ff06f          	j	5550 <fatfs_add_file_entry+0xe4>
    557c:	0007c683          	lbu	a3,0(a5)
    5580:	0e500713          	li	a4,229
    5584:	10e69863          	bne	a3,a4,5694 <fatfs_add_file_entry+0x228>
    5588:	000d1863          	bnez	s10,5598 <fatfs_add_file_entry+0x12c>
    558c:	000d8a13          	mv	s4,s11
    5590:	000b8993          	mv	s3,s7
    5594:	00100913          	li	s2,1
    5598:	fa9d4ee3          	blt	s10,s1,5554 <fatfs_add_file_entry+0xe8>
    559c:	00ba8693          	addi	a3,s5,11
    55a0:	000a8713          	mv	a4,s5
    55a4:	00000913          	li	s2,0
    55a8:	00074603          	lbu	a2,0(a4)
    55ac:	00195793          	srli	a5,s2,0x1
    55b0:	00791913          	slli	s2,s2,0x7
    55b4:	012787b3          	add	a5,a5,s2
    55b8:	00170713          	addi	a4,a4,1
    55bc:	00c787b3          	add	a5,a5,a2
    55c0:	0ff7f913          	zext.b	s2,a5
    55c4:	fed712e3          	bne	a4,a3,55a8 <fatfs_add_file_entry+0x13c>
    55c8:	00098b13          	mv	s6,s3
    55cc:	00000d13          	li	s10,0
    55d0:	01000b93          	li	s7,16
    55d4:	00812583          	lw	a1,8(sp)
    55d8:	00000693          	li	a3,0
    55dc:	000b0613          	mv	a2,s6
    55e0:	00040513          	mv	a0,s0
    55e4:	ffffe097          	auipc	ra,0xffffe
    55e8:	720080e7          	jalr	1824(ra) # 3d04 <fatfs_sector_reader>
    55ec:	18050c63          	beqz	a0,5784 <fatfs_add_file_entry+0x318>
    55f0:	04440c93          	addi	s9,s0,68
    55f4:	413b0db3          	sub	s11,s6,s3
    55f8:	00000793          	li	a5,0
    55fc:	00000c13          	li	s8,0
    5600:	01912623          	sw	s9,12(sp)
    5604:	000d1663          	bnez	s10,5610 <fatfs_add_file_entry+0x1a4>
    5608:	154c1863          	bne	s8,s4,5758 <fatfs_add_file_entry+0x2ec>
    560c:	140d9663          	bnez	s11,5758 <fatfs_add_file_entry+0x2ec>
    5610:	12049263          	bnez	s1,5734 <fatfs_add_file_entry+0x2c8>
    5614:	01c12703          	lw	a4,28(sp)
    5618:	01412603          	lw	a2,20(sp)
    561c:	01812583          	lw	a1,24(sp)
    5620:	02010693          	addi	a3,sp,32
    5624:	000a8513          	mv	a0,s5
    5628:	ffffe097          	auipc	ra,0xffffe
    562c:	a30080e7          	jalr	-1488(ra) # 3058 <fatfs_sfn_create_entry>
    5630:	02000613          	li	a2,32
    5634:	00c105b3          	add	a1,sp,a2
    5638:	000c8513          	mv	a0,s9
    563c:	ffffd097          	auipc	ra,0xffffd
    5640:	9c4080e7          	jalr	-1596(ra) # 2000 <memcpy>
    5644:	03842783          	lw	a5,56(s0)
    5648:	00c12583          	lw	a1,12(sp)
    564c:	24442503          	lw	a0,580(s0)
    5650:	00100613          	li	a2,1
    5654:	000780e7          	jalr	a5
    5658:	07c12083          	lw	ra,124(sp)
    565c:	07812403          	lw	s0,120(sp)
    5660:	07412483          	lw	s1,116(sp)
    5664:	07012903          	lw	s2,112(sp)
    5668:	06c12983          	lw	s3,108(sp)
    566c:	06812a03          	lw	s4,104(sp)
    5670:	06412a83          	lw	s5,100(sp)
    5674:	06012b03          	lw	s6,96(sp)
    5678:	05c12b83          	lw	s7,92(sp)
    567c:	05812c03          	lw	s8,88(sp)
    5680:	05412c83          	lw	s9,84(sp)
    5684:	05012d03          	lw	s10,80(sp)
    5688:	04c12d83          	lw	s11,76(sp)
    568c:	08010113          	addi	sp,sp,128
    5690:	00008067          	ret
    5694:	ee068ae3          	beqz	a3,5588 <fatfs_add_file_entry+0x11c>
    5698:	00000913          	li	s2,0
    569c:	ebdff06f          	j	5558 <fatfs_add_file_entry+0xec>
    56a0:	00842583          	lw	a1,8(s0)
    56a4:	02010613          	addi	a2,sp,32
    56a8:	00040513          	mv	a0,s0
    56ac:	fffff097          	auipc	ra,0xfffff
    56b0:	3e4080e7          	jalr	996(ra) # 4a90 <fatfs_find_blank_cluster>
    56b4:	0c050863          	beqz	a0,5784 <fatfs_add_file_entry+0x318>
    56b8:	02012b83          	lw	s7,32(sp)
    56bc:	00812583          	lw	a1,8(sp)
    56c0:	00040513          	mv	a0,s0
    56c4:	000b8613          	mv	a2,s7
    56c8:	fffff097          	auipc	ra,0xfffff
    56cc:	64c080e7          	jalr	1612(ra) # 4d14 <fatfs_fat_add_cluster_to_chain>
    56d0:	0a050a63          	beqz	a0,5784 <fatfs_add_file_entry+0x318>
    56d4:	20000613          	li	a2,512
    56d8:	00000593          	li	a1,0
    56dc:	04440513          	addi	a0,s0,68
    56e0:	ffffd097          	auipc	ra,0xffffd
    56e4:	904080e7          	jalr	-1788(ra) # 1fe4 <memset>
    56e8:	00000c13          	li	s8,0
    56ec:	00044783          	lbu	a5,0(s0)
    56f0:	00fc6a63          	bltu	s8,a5,5704 <fatfs_add_file_entry+0x298>
    56f4:	ea0914e3          	bnez	s2,559c <fatfs_add_file_entry+0x130>
    56f8:	000b0993          	mv	s3,s6
    56fc:	00000a13          	li	s4,0
    5700:	e9dff06f          	j	559c <fatfs_add_file_entry+0x130>
    5704:	00000693          	li	a3,0
    5708:	000c0613          	mv	a2,s8
    570c:	000b8593          	mv	a1,s7
    5710:	00040513          	mv	a0,s0
    5714:	ffffd097          	auipc	ra,0xffffd
    5718:	3f4080e7          	jalr	1012(ra) # 2b08 <fatfs_write_sector>
    571c:	06050463          	beqz	a0,5784 <fatfs_add_file_entry+0x318>
    5720:	001c0c13          	addi	s8,s8,1
    5724:	0ffc7c13          	zext.b	s8,s8
    5728:	fc5ff06f          	j	56ec <fatfs_add_file_entry+0x280>
    572c:	001b0b13          	addi	s6,s6,1
    5730:	ea5ff06f          	j	55d4 <fatfs_add_file_entry+0x168>
    5734:	01012503          	lw	a0,16(sp)
    5738:	fff48493          	addi	s1,s1,-1
    573c:	00090693          	mv	a3,s2
    5740:	00048613          	mv	a2,s1
    5744:	000c8593          	mv	a1,s9
    5748:	ffffd097          	auipc	ra,0xffffd
    574c:	7fc080e7          	jalr	2044(ra) # 2f44 <fatfs_filename_to_lfn>
    5750:	00100d13          	li	s10,1
    5754:	000d0793          	mv	a5,s10
    5758:	001c0c13          	addi	s8,s8,1
    575c:	0ffc7c13          	zext.b	s8,s8
    5760:	020c8c93          	addi	s9,s9,32
    5764:	eb7c10e3          	bne	s8,s7,5604 <fatfs_add_file_entry+0x198>
    5768:	fc0782e3          	beqz	a5,572c <fatfs_add_file_entry+0x2c0>
    576c:	03842783          	lw	a5,56(s0)
    5770:	00c12583          	lw	a1,12(sp)
    5774:	24442503          	lw	a0,580(s0)
    5778:	00100613          	li	a2,1
    577c:	000780e7          	jalr	a5
    5780:	fa0516e3          	bnez	a0,572c <fatfs_add_file_entry+0x2c0>
    5784:	00000513          	li	a0,0
    5788:	ed1ff06f          	j	5658 <fatfs_add_file_entry+0x1ec>
    578c:	00000513          	li	a0,0
    5790:	00008067          	ret

00005794 <fl_fopen>:
    5794:	000067b7          	lui	a5,0x6
    5798:	1787a783          	lw	a5,376(a5) # 6178 <_filelib_init>
    579c:	fa010113          	addi	sp,sp,-96
    57a0:	05212823          	sw	s2,80(sp)
    57a4:	03a12823          	sw	s10,48(sp)
    57a8:	04112e23          	sw	ra,92(sp)
    57ac:	04812c23          	sw	s0,88(sp)
    57b0:	04912a23          	sw	s1,84(sp)
    57b4:	05312623          	sw	s3,76(sp)
    57b8:	05412423          	sw	s4,72(sp)
    57bc:	05512223          	sw	s5,68(sp)
    57c0:	05612023          	sw	s6,64(sp)
    57c4:	03712e23          	sw	s7,60(sp)
    57c8:	03812c23          	sw	s8,56(sp)
    57cc:	03912a23          	sw	s9,52(sp)
    57d0:	00050d13          	mv	s10,a0
    57d4:	00058913          	mv	s2,a1
    57d8:	00079663          	bnez	a5,57e4 <fl_fopen+0x50>
    57dc:	ffffd097          	auipc	ra,0xffffd
    57e0:	3e0080e7          	jalr	992(ra) # 2bbc <fl_init>
    57e4:	000067b7          	lui	a5,0x6
    57e8:	1747a783          	lw	a5,372(a5) # 6174 <_filelib_valid>
    57ec:	00193713          	seqz	a4,s2
    57f0:	0017b793          	seqz	a5,a5
    57f4:	00e7e7b3          	or	a5,a5,a4
    57f8:	36079e63          	bnez	a5,5b74 <fl_fopen+0x3e0>
    57fc:	360d0c63          	beqz	s10,5b74 <fl_fopen+0x3e0>
    5800:	00000493          	li	s1,0
    5804:	00000413          	li	s0,0
    5808:	05700993          	li	s3,87
    580c:	07200a13          	li	s4,114
    5810:	07700b13          	li	s6,119
    5814:	06100b93          	li	s7,97
    5818:	06200c13          	li	s8,98
    581c:	04100a93          	li	s5,65
    5820:	04200c93          	li	s9,66
    5824:	00090513          	mv	a0,s2
    5828:	ffffc097          	auipc	ra,0xffffc
    582c:	7fc080e7          	jalr	2044(ra) # 2024 <strlen>
    5830:	10a44a63          	blt	s0,a0,5944 <fl_fopen+0x1b0>
    5834:	000089b7          	lui	s3,0x8
    5838:	d9898a13          	addi	s4,s3,-616 # 7d98 <_fs>
    583c:	038a2783          	lw	a5,56(s4)
    5840:	00079463          	bnez	a5,5848 <fl_fopen+0xb4>
    5844:	fd94f493          	andi	s1,s1,-39
    5848:	03ca2783          	lw	a5,60(s4)
    584c:	00078463          	beqz	a5,5854 <fl_fopen+0xc0>
    5850:	000780e7          	jalr	a5
    5854:	0014f793          	andi	a5,s1,1
    5858:	18079263          	bnez	a5,59dc <fl_fopen+0x248>
    585c:	0204f793          	andi	a5,s1,32
    5860:	08078c63          	beqz	a5,58f8 <fl_fopen+0x164>
    5864:	038a2783          	lw	a5,56(s4)
    5868:	06078a63          	beqz	a5,58dc <fl_fopen+0x148>
    586c:	ffffd097          	auipc	ra,0xffffd
    5870:	160080e7          	jalr	352(ra) # 29cc <_allocate_file>
    5874:	00050413          	mv	s0,a0
    5878:	06050263          	beqz	a0,58dc <fl_fopen+0x148>
    587c:	01450a93          	addi	s5,a0,20
    5880:	10400613          	li	a2,260
    5884:	00000593          	li	a1,0
    5888:	000a8513          	mv	a0,s5
    588c:	ffffc097          	auipc	ra,0xffffc
    5890:	758080e7          	jalr	1880(ra) # 1fe4 <memset>
    5894:	11840b13          	addi	s6,s0,280
    5898:	10400613          	li	a2,260
    589c:	00000593          	li	a1,0
    58a0:	000b0513          	mv	a0,s6
    58a4:	ffffc097          	auipc	ra,0xffffc
    58a8:	740080e7          	jalr	1856(ra) # 1fe4 <memset>
    58ac:	10400713          	li	a4,260
    58b0:	000b0693          	mv	a3,s6
    58b4:	00070613          	mv	a2,a4
    58b8:	000a8593          	mv	a1,s5
    58bc:	000d0513          	mv	a0,s10
    58c0:	ffffe097          	auipc	ra,0xffffe
    58c4:	c88080e7          	jalr	-888(ra) # 3548 <fatfs_split_path>
    58c8:	fff00793          	li	a5,-1
    58cc:	12f51663          	bne	a0,a5,59f8 <fl_fopen+0x264>
    58d0:	00040513          	mv	a0,s0
    58d4:	ffffd097          	auipc	ra,0xffffd
    58d8:	170080e7          	jalr	368(ra) # 2a44 <_free_file>
    58dc:	00000413          	li	s0,0
    58e0:	0214f793          	andi	a5,s1,33
    58e4:	02000713          	li	a4,32
    58e8:	28e79263          	bne	a5,a4,5b6c <fl_fopen+0x3d8>
    58ec:	10041263          	bnez	s0,59f0 <fl_fopen+0x25c>
    58f0:	0064f793          	andi	a5,s1,6
    58f4:	26079463          	bnez	a5,5b5c <fl_fopen+0x3c8>
    58f8:	00000413          	li	s0,0
    58fc:	040a2783          	lw	a5,64(s4)
    5900:	00078463          	beqz	a5,5908 <fl_fopen+0x174>
    5904:	000780e7          	jalr	a5
    5908:	05c12083          	lw	ra,92(sp)
    590c:	00040513          	mv	a0,s0
    5910:	05812403          	lw	s0,88(sp)
    5914:	05412483          	lw	s1,84(sp)
    5918:	05012903          	lw	s2,80(sp)
    591c:	04c12983          	lw	s3,76(sp)
    5920:	04812a03          	lw	s4,72(sp)
    5924:	04412a83          	lw	s5,68(sp)
    5928:	04012b03          	lw	s6,64(sp)
    592c:	03c12b83          	lw	s7,60(sp)
    5930:	03812c03          	lw	s8,56(sp)
    5934:	03412c83          	lw	s9,52(sp)
    5938:	03012d03          	lw	s10,48(sp)
    593c:	06010113          	addi	sp,sp,96
    5940:	00008067          	ret
    5944:	008907b3          	add	a5,s2,s0
    5948:	0007c783          	lbu	a5,0(a5)
    594c:	05378863          	beq	a5,s3,599c <fl_fopen+0x208>
    5950:	02f9e863          	bltu	s3,a5,5980 <fl_fopen+0x1ec>
    5954:	05578863          	beq	a5,s5,59a4 <fl_fopen+0x210>
    5958:	00faea63          	bltu	s5,a5,596c <fl_fopen+0x1d8>
    595c:	02b00713          	li	a4,43
    5960:	04e78663          	beq	a5,a4,59ac <fl_fopen+0x218>
    5964:	00140413          	addi	s0,s0,1
    5968:	ebdff06f          	j	5824 <fl_fopen+0x90>
    596c:	03978263          	beq	a5,s9,5990 <fl_fopen+0x1fc>
    5970:	05200713          	li	a4,82
    5974:	fee798e3          	bne	a5,a4,5964 <fl_fopen+0x1d0>
    5978:	0014e493          	ori	s1,s1,1
    597c:	fe9ff06f          	j	5964 <fl_fopen+0x1d0>
    5980:	ff478ce3          	beq	a5,s4,5978 <fl_fopen+0x1e4>
    5984:	00fa6a63          	bltu	s4,a5,5998 <fl_fopen+0x204>
    5988:	01778e63          	beq	a5,s7,59a4 <fl_fopen+0x210>
    598c:	fd879ce3          	bne	a5,s8,5964 <fl_fopen+0x1d0>
    5990:	0084e493          	ori	s1,s1,8
    5994:	fd1ff06f          	j	5964 <fl_fopen+0x1d0>
    5998:	fd6796e3          	bne	a5,s6,5964 <fl_fopen+0x1d0>
    599c:	0324e493          	ori	s1,s1,50
    59a0:	fc5ff06f          	j	5964 <fl_fopen+0x1d0>
    59a4:	0264e493          	ori	s1,s1,38
    59a8:	fbdff06f          	j	5964 <fl_fopen+0x1d0>
    59ac:	0014f793          	andi	a5,s1,1
    59b0:	00078663          	beqz	a5,59bc <fl_fopen+0x228>
    59b4:	0024e493          	ori	s1,s1,2
    59b8:	fadff06f          	j	5964 <fl_fopen+0x1d0>
    59bc:	0024f793          	andi	a5,s1,2
    59c0:	00078663          	beqz	a5,59cc <fl_fopen+0x238>
    59c4:	0314e493          	ori	s1,s1,49
    59c8:	f9dff06f          	j	5964 <fl_fopen+0x1d0>
    59cc:	0044f793          	andi	a5,s1,4
    59d0:	f8078ae3          	beqz	a5,5964 <fl_fopen+0x1d0>
    59d4:	0274e493          	ori	s1,s1,39
    59d8:	f8dff06f          	j	5964 <fl_fopen+0x1d0>
    59dc:	000d0513          	mv	a0,s10
    59e0:	fffff097          	auipc	ra,0xfffff
    59e4:	81c080e7          	jalr	-2020(ra) # 41fc <_open_file>
    59e8:	00050413          	mv	s0,a0
    59ec:	e60508e3          	beqz	a0,585c <fl_fopen+0xc8>
    59f0:	42940c23          	sb	s1,1080(s0)
    59f4:	f09ff06f          	j	58fc <fl_fopen+0x168>
    59f8:	00040513          	mv	a0,s0
    59fc:	ffffe097          	auipc	ra,0xffffe
    5a00:	dc8080e7          	jalr	-568(ra) # 37c4 <_check_file_open>
    5a04:	00050913          	mv	s2,a0
    5a08:	ec0514e3          	bnez	a0,58d0 <fl_fopen+0x13c>
    5a0c:	01444783          	lbu	a5,20(s0)
    5a10:	0e079663          	bnez	a5,5afc <fl_fopen+0x368>
    5a14:	008a2783          	lw	a5,8(s4)
    5a18:	00f42023          	sw	a5,0(s0)
    5a1c:	00042583          	lw	a1,0(s0)
    5a20:	01010693          	addi	a3,sp,16
    5a24:	000b0613          	mv	a2,s6
    5a28:	d9898513          	addi	a0,s3,-616
    5a2c:	ffffe097          	auipc	ra,0xffffe
    5a30:	428080e7          	jalr	1064(ra) # 3e54 <fatfs_get_file_entry>
    5a34:	00100693          	li	a3,1
    5a38:	e8d50ce3          	beq	a0,a3,58d0 <fl_fopen+0x13c>
    5a3c:	00042223          	sw	zero,4(s0)
    5a40:	00440613          	addi	a2,s0,4
    5a44:	00068593          	mv	a1,a3
    5a48:	d9898513          	addi	a0,s3,-616
    5a4c:	00000097          	auipc	ra,0x0
    5a50:	908080e7          	jalr	-1784(ra) # 5354 <fatfs_allocate_free_space>
    5a54:	e6050ee3          	beqz	a0,58d0 <fl_fopen+0x13c>
    5a58:	00002ab7          	lui	s5,0x2
    5a5c:	21c40b93          	addi	s7,s0,540
    5a60:	d9898c13          	addi	s8,s3,-616
    5a64:	70fa8a93          	addi	s5,s5,1807 # 270f <printf+0x123>
    5a68:	000b0593          	mv	a1,s6
    5a6c:	00410513          	addi	a0,sp,4
    5a70:	ffffd097          	auipc	ra,0xffffd
    5a74:	68c080e7          	jalr	1676(ra) # 30fc <fatfs_lfn_create_sfn>
    5a78:	08090e63          	beqz	s2,5b14 <fl_fopen+0x380>
    5a7c:	00090613          	mv	a2,s2
    5a80:	00410593          	addi	a1,sp,4
    5a84:	000b8513          	mv	a0,s7
    5a88:	ffffd097          	auipc	ra,0xffffd
    5a8c:	7f0080e7          	jalr	2032(ra) # 3278 <fatfs_lfn_generate_tail>
    5a90:	00042583          	lw	a1,0(s0)
    5a94:	000b8613          	mv	a2,s7
    5a98:	000c0513          	mv	a0,s8
    5a9c:	fffff097          	auipc	ra,0xfffff
    5aa0:	8d4080e7          	jalr	-1836(ra) # 4370 <fatfs_sfn_exists>
    5aa4:	00050663          	beqz	a0,5ab0 <fl_fopen+0x31c>
    5aa8:	00190913          	addi	s2,s2,1
    5aac:	fb591ee3          	bne	s2,s5,5a68 <fl_fopen+0x2d4>
    5ab0:	00442703          	lw	a4,4(s0)
    5ab4:	000027b7          	lui	a5,0x2
    5ab8:	70f78793          	addi	a5,a5,1807 # 270f <printf+0x123>
    5abc:	00070593          	mv	a1,a4
    5ac0:	02f90663          	beq	s2,a5,5aec <fl_fopen+0x358>
    5ac4:	00042583          	lw	a1,0(s0)
    5ac8:	00000813          	li	a6,0
    5acc:	00000793          	li	a5,0
    5ad0:	000b8693          	mv	a3,s7
    5ad4:	000b0613          	mv	a2,s6
    5ad8:	d9898513          	addi	a0,s3,-616
    5adc:	00000097          	auipc	ra,0x0
    5ae0:	990080e7          	jalr	-1648(ra) # 546c <fatfs_add_file_entry>
    5ae4:	04051463          	bnez	a0,5b2c <fl_fopen+0x398>
    5ae8:	00442583          	lw	a1,4(s0)
    5aec:	d9898513          	addi	a0,s3,-616
    5af0:	fffff097          	auipc	ra,0xfffff
    5af4:	1b4080e7          	jalr	436(ra) # 4ca4 <fatfs_free_cluster_chain>
    5af8:	dd9ff06f          	j	58d0 <fl_fopen+0x13c>
    5afc:	00040593          	mv	a1,s0
    5b00:	000a8513          	mv	a0,s5
    5b04:	ffffe097          	auipc	ra,0xffffe
    5b08:	54c080e7          	jalr	1356(ra) # 4050 <_open_directory>
    5b0c:	f00518e3          	bnez	a0,5a1c <fl_fopen+0x288>
    5b10:	dc1ff06f          	j	58d0 <fl_fopen+0x13c>
    5b14:	00b00613          	li	a2,11
    5b18:	00410593          	addi	a1,sp,4
    5b1c:	000b8513          	mv	a0,s7
    5b20:	ffffc097          	auipc	ra,0xffffc
    5b24:	4e0080e7          	jalr	1248(ra) # 2000 <memcpy>
    5b28:	f69ff06f          	j	5a90 <fl_fopen+0x2fc>
    5b2c:	fff00793          	li	a5,-1
    5b30:	00042623          	sw	zero,12(s0)
    5b34:	00042423          	sw	zero,8(s0)
    5b38:	42f42823          	sw	a5,1072(s0)
    5b3c:	42042a23          	sw	zero,1076(s0)
    5b40:	00042823          	sw	zero,16(s0)
    5b44:	22f42423          	sw	a5,552(s0)
    5b48:	22f42623          	sw	a5,556(s0)
    5b4c:	d9898513          	addi	a0,s3,-616
    5b50:	ffffe097          	auipc	ra,0xffffe
    5b54:	054080e7          	jalr	84(ra) # 3ba4 <fatfs_fat_purge>
    5b58:	d89ff06f          	j	58e0 <fl_fopen+0x14c>
    5b5c:	000d0513          	mv	a0,s10
    5b60:	ffffe097          	auipc	ra,0xffffe
    5b64:	69c080e7          	jalr	1692(ra) # 41fc <_open_file>
    5b68:	00050413          	mv	s0,a0
    5b6c:	e80412e3          	bnez	s0,59f0 <fl_fopen+0x25c>
    5b70:	d89ff06f          	j	58f8 <fl_fopen+0x164>
    5b74:	00000413          	li	s0,0
    5b78:	d91ff06f          	j	5908 <fl_fopen+0x174>

00005b7c <led_pos>:
    5b7c:	00000001                                ....

00005b80 <cmd16>:
    5b80:	02000050 00001500                       P.......

00005b88 <acmd41>:
    5b88:	00004069 00000100                       i@......

00005b90 <cmd55>:
    5b90:	00000077 00000100                       w.......

00005b98 <cmd8>:
    5b98:	01000048 000087aa                       H.......

00005ba0 <cmd0>:
    5ba0:	00000040 00009500                       @.......

00005ba8 <AUDIO>:
    5ba8:	00018000                                ....

00005bac <DISPLAY>:
    5bac:	00014000                                .@..

00005bb0 <BUTTONS>:
    5bb0:	00010100                                ....

00005bb4 <SDCARD>:
    5bb4:	00010080                                ....

00005bb8 <OLED_RST>:
    5bb8:	00010010                                ....

00005bbc <OLED>:
    5bbc:	00010008                                ....

00005bc0 <LEDS>:
    5bc0:	00010004 00006272 00000000 696c632f     ....rb....../cli
    5bd0:	722e6b63 00007761 50207c7c 45535541     ck.raw..|| PAUSE
    5be0:	20202044 00202020 0000203e 676d692f     D      .> ../img
    5bf0:	00002f73 43206f4e 7265766f 00000000     s/..No Cover....
    5c00:	3a727245 0a732520 00000000 00002e2e     Err: %s.........
    5c10:	0000002e 0000002f 4c494620 203a5345     ..../... FILES: 
    5c20:	00000000 74706d45 000a2179 5d64255b     ....Empty!..[%d]
    5c30:	00000020 203e6425 00000000 20202020      ...%d> ....    
    5c40:	20202020 20202020 20202020 20202020                     
    5c50:	00000a20 626c612f 2f736d75 00000000      .../albums/....
    5c60:	53554d20 203a4349 00000000 25202020      MUSIC: ....   %
    5c70:	00000a73 6f432020 676e696d 6f6f5320     s...  Coming Soo
    5c80:	000a216e 656c6946 70784520 65726f6c     n!..File Explore
    5c90:	00000072 79616c50 6e6f5320 00007367     r...Play Songs..
    5ca0:	4d204a44 0065646f 203d3d3d 4e49414d     DJ Mode.=== MAIN
    5cb0:	4e454d20 3d3d2055 000a0a3d 2e642520      MENU ===... %d.
    5cc0:	20732520 20202020 000a2020 0000000a      %s       ......
    5cd0:	656c6553 26207463 65725020 42207373     Select & Press B
    5ce0:	00006e74 74696e49 20445320 64726163     tn..Init SD card
    5cf0:	0a2e2e2e 00000000 33323130 37363534     ........01234567
    5d00:	42413938 46454443 00000000 5f544146     89ABCDEF....FAT_
    5d10:	203a5346 6f727245 6f632072 20646c75     FS: Error could 
    5d20:	20746f6e 64616f6c 54414620 74656420     not load FAT det
    5d30:	736c6961 64252820 0a0d2129 00000000     ails (%d)!......

00005d40 <font>:
    5d40:	00000000 00002f00 00030000 14000003     ...../..........
    5d50:	143e143e 3a2b6a2e 08122600 171c3224     >.>..j+:.&..$2..
    5d60:	03003415 00000000 0000211e 001e2100     .4.......!...!..
    5d70:	08220000 0822081c 0000081c 00002040     .."...".....@ ..
    5d80:	00080800 00200000 20000000 02040810     ...... .... ....
    5d90:	3f21213f 003f0100 253d0000 25002725     ?!!?..?...=%%'.%
    5da0:	003f2525 3f040407 25252700 253f003d     %%?....?.'%%=.?%
    5db0:	01003d25 00030539 3f25253f 25252700     %=..9...?%%?.'%%
    5dc0:	0028003f 40000000 00000028 00110a04     ?.(....@(.......
    5dd0:	00141400 0a110000 01000004 0007052d     ............-...
    5de0:	253d213f 09093f1f 253f003f 3f003c27     ?!=%.?..?.?%'<.?
    5df0:	00212121 1e21213f 25253f00 053f0025     !!!.?!!..?%%%.?.
    5e00:	3f000505 003d2521 3f04043f 213f2100     ...?!%=.?..?.!?!
    5e10:	20380000 3f013f21 003b0404 2020203f     ..8 !?.?..;.?   
    5e20:	3f013f00 023f3f01 3f003f04 003f2121     .?.?.??..?.?!!?.
    5e30:	0f09093f 31213f00 093f003f 27002f39     ?....?!1?.?.9/.'
    5e40:	003d2525 013f0101 20203f01 100f003f     %%=...?..?  ?...
    5e50:	3f001f30 3f203f20 3b04043b 38080f00     0..? ? ?;..;...8
    5e60:	2931000f 3f002325 00000021 04081020     ..1)%#.?!... ...
    5e70:	003f2102 01020000 20000201 00000020     .!?........  ...
    5e80:	00000201 24243800 243f003c 3c003c24     .....8$$<.?$$<.<
    5e90:	00242424 3f24243c 2c2c3c00 3f04002c     $$$.<$$?.<,,,..?
    5ea0:	bc000005 00fca4a4 3c04043f 00003d00     ........?..<.=..
    5eb0:	fd800000 3f000000 00340808 0000003f     .......?..4.?...
    5ec0:	3c043c00 043c3c04 3c003c04 003c2424     .<.<.<<..<.<$$<.
    5ed0:	3c2424fc 24243c00 083c00fc 2c000004     .$$<.<$$..<....,
    5ee0:	003c2c2c 00243f04 20203c00 100c003c     ,,<..?$..<  <...
    5ef0:	3c001c30 3c203c20 34080834 a0a0bc00     0..< < <4..4....
    5f00:	342400fc 0400242c 0000213f 0000003f     ..$4,$..?!..?...
    5f10:	043f2100 02010000 00000102 00000000     .!?.............
    5f20:	00000001 00000003 00000005 00000007     ................
    5f30:	00000009 0000000e 00000010 00000012     ................
    5f40:	00000014 00000016 00000018 0000001c     ................
    5f50:	0000001e                                ....

00005f54 <current_path>:
    5f54:	0000002f 00000000 00000000 00000000     /...............
	...

00006148 <led_dir>:
    6148:	00000000                                ....

0000614c <n_items>:
    614c:	00000000                                ....

00006150 <sdcard_while_loading_callback>:
    6150:	00000000                                ....

00006154 <back_color>:
	...

00006155 <front_color>:
    6155:	                                         ...

00006158 <cursor_y>:
    6158:	00000000                                ....

0000615c <cursor_x>:
    615c:	00000000                                ....

00006160 <f_putchar>:
    6160:	00000000                                ....

00006164 <_free_file_list>:
	...

0000616c <_open_file_list>:
	...

00006174 <_filelib_valid>:
    6174:	00000000                                ....

00006178 <_filelib_init>:
    6178:	00000000                                ....
