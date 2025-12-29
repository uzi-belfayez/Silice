
code.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00010137          	lui	sp,0x10
       4:	00002097          	auipc	ra,0x2
       8:	208080e7          	jalr	520(ra) # 220c <main>
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
      e0:	fe010113          	addi	sp,sp,-32 # ffe0 <_files+0x7450>
      e4:	000067b7          	lui	a5,0x6
      e8:	00812c23          	sw	s0,24(sp)
      ec:	4b87a403          	lw	s0,1208(a5) # 64b8 <AUDIO>
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
     124:	00003097          	auipc	ra,0x3
     128:	84c080e7          	jalr	-1972(ra) # 2970 <memset>
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
     168:	4d458593          	addi	a1,a1,1236 # 64d4 <LEDS+0x4>
     16c:	4d850513          	addi	a0,a0,1240 # 64d8 <LEDS+0x8>
     170:	00112e23          	sw	ra,28(sp)
     174:	00812c23          	sw	s0,24(sp)
     178:	00912a23          	sw	s1,20(sp)
     17c:	01212823          	sw	s2,16(sp)
     180:	01312623          	sw	s3,12(sp)
     184:	01412423          	sw	s4,8(sp)
     188:	01512223          	sw	s5,4(sp)
     18c:	00006097          	auipc	ra,0x6
     190:	f18080e7          	jalr	-232(ra) # 60a4 <fl_fopen>
     194:	0a050263          	beqz	a0,238 <play_click_noise+0xdc>
     198:	000015b7          	lui	a1,0x1
     19c:	00000613          	li	a2,0
     1a0:	19458593          	addi	a1,a1,404 # 1194 <play_dj_mode+0x42c>
     1a4:	00050a13          	mv	s4,a0
     1a8:	00003097          	auipc	ra,0x3
     1ac:	38c080e7          	jalr	908(ra) # 3534 <fl_fseek>
     1b0:	000067b7          	lui	a5,0x6
     1b4:	4b87aa83          	lw	s5,1208(a5) # 64b8 <AUDIO>
     1b8:	20000993          	li	s3,512
     1bc:	1ff00913          	li	s2,511
     1c0:	000aa483          	lw	s1,0(s5)
     1c4:	000a0693          	mv	a3,s4
     1c8:	20000613          	li	a2,512
     1cc:	00100593          	li	a1,1
     1d0:	00048513          	mv	a0,s1
     1d4:	00006097          	auipc	ra,0x6
     1d8:	8cc080e7          	jalr	-1844(ra) # 5aa0 <fl_fread>
     1dc:	00050413          	mv	s0,a0
     1e0:	00a94c63          	blt	s2,a0,1f8 <play_click_noise+0x9c>
     1e4:	40a98633          	sub	a2,s3,a0
     1e8:	00000593          	li	a1,0
     1ec:	00a48533          	add	a0,s1,a0
     1f0:	00002097          	auipc	ra,0x2
     1f4:	780080e7          	jalr	1920(ra) # 2970 <memset>
     1f8:	000aa783          	lw	a5,0(s5)
     1fc:	fef48ee3          	beq	s1,a5,1f8 <play_click_noise+0x9c>
     200:	fc8940e3          	blt	s2,s0,1c0 <play_click_noise+0x64>
     204:	000a0513          	mv	a0,s4
     208:	00005097          	auipc	ra,0x5
     20c:	7bc080e7          	jalr	1980(ra) # 59c4 <fl_fclose>
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

0000025c <update_led_dance>:
     25c:	00050713          	mv	a4,a0
     260:	00000693          	li	a3,0
     264:	00470713          	addi	a4,a4,4
     268:	40a707b3          	sub	a5,a4,a0
     26c:	06b7c463          	blt	a5,a1,2d4 <update_led_dance+0x78>
     270:	32000793          	li	a5,800
     274:	04d7fe63          	bgeu	a5,a3,2d0 <update_led_dance+0x74>
     278:	00006637          	lui	a2,0x6
     27c:	48c62703          	lw	a4,1164(a2) # 648c <led_pos>
     280:	000077b7          	lui	a5,0x7
     284:	fff70693          	addi	a3,a4,-1
     288:	00068663          	beqz	a3,294 <update_led_dance+0x38>
     28c:	f8070693          	addi	a3,a4,-128
     290:	00069a63          	bnez	a3,2a4 <update_led_dance+0x48>
     294:	ad87a583          	lw	a1,-1320(a5) # 6ad8 <led_dir>
     298:	00100693          	li	a3,1
     29c:	40b686b3          	sub	a3,a3,a1
     2a0:	acd7ac23          	sw	a3,-1320(a5)
     2a4:	ad87a683          	lw	a3,-1320(a5)
     2a8:	40175793          	srai	a5,a4,0x1
     2ac:	00068463          	beqz	a3,2b4 <update_led_dance+0x58>
     2b0:	00171793          	slli	a5,a4,0x1
     2b4:	08000713          	li	a4,128
     2b8:	02f75e63          	bge	a4,a5,2f4 <update_led_dance+0x98>
     2bc:	00070793          	mv	a5,a4
     2c0:	00006737          	lui	a4,0x6
     2c4:	4d072703          	lw	a4,1232(a4) # 64d0 <LEDS>
     2c8:	48f62623          	sw	a5,1164(a2)
     2cc:	00f72023          	sw	a5,0(a4)
     2d0:	00008067          	ret
     2d4:	ffc74603          	lbu	a2,-4(a4)
     2d8:	00074783          	lbu	a5,0(a4)
     2dc:	40c787b3          	sub	a5,a5,a2
     2e0:	41f7d613          	srai	a2,a5,0x1f
     2e4:	00f647b3          	xor	a5,a2,a5
     2e8:	40c787b3          	sub	a5,a5,a2
     2ec:	00f686b3          	add	a3,a3,a5
     2f0:	f75ff06f          	j	264 <update_led_dance+0x8>
     2f4:	fcf046e3          	bgtz	a5,2c0 <update_led_dance+0x64>
     2f8:	00100793          	li	a5,1
     2fc:	fc5ff06f          	j	2c0 <update_led_dance+0x64>

00000300 <update_player_ui>:
     300:	fe010113          	addi	sp,sp,-32
     304:	00812c23          	sw	s0,24(sp)
     308:	00912a23          	sw	s1,20(sp)
     30c:	01212823          	sw	s2,16(sp)
     310:	01312623          	sw	s3,12(sp)
     314:	00058493          	mv	s1,a1
     318:	00060993          	mv	s3,a2
     31c:	00112e23          	sw	ra,28(sp)
     320:	00050913          	mv	s2,a0
     324:	00003097          	auipc	ra,0x3
     328:	8f0080e7          	jalr	-1808(ra) # 2c14 <display_framebuffer>
     32c:	000037b7          	lui	a5,0x3
     330:	00050413          	mv	s0,a0
     334:	48078793          	addi	a5,a5,1152 # 3480 <fatfs_write_sector+0x68>
     338:	08000613          	li	a2,128
     33c:	000045b7          	lui	a1,0x4
     340:	00000713          	li	a4,0
     344:	00f406b3          	add	a3,s0,a5
     348:	00e68533          	add	a0,a3,a4
     34c:	00050023          	sb	zero,0(a0)
     350:	00170713          	addi	a4,a4,1
     354:	fec71ae3          	bne	a4,a2,348 <update_player_ui+0x48>
     358:	08078793          	addi	a5,a5,128
     35c:	feb792e3          	bne	a5,a1,340 <update_player_ui+0x40>
     360:	06e00713          	li	a4,110
     364:	fff00893          	li	a7,-1
     368:	07700313          	li	t1,119
     36c:	07300813          	li	a6,115
     370:	f9270593          	addi	a1,a4,-110
     374:	00771613          	slli	a2,a4,0x7
     378:	ffb5f593          	andi	a1,a1,-5
     37c:	00c40633          	add	a2,s0,a2
     380:	00a00793          	li	a5,10
     384:	f8a78693          	addi	a3,a5,-118
     388:	ff678513          	addi	a0,a5,-10
     38c:	00153513          	seqz	a0,a0
     390:	0016b693          	seqz	a3,a3
     394:	00a6e6b3          	or	a3,a3,a0
     398:	00178513          	addi	a0,a5,1
     39c:	00069863          	bnez	a3,3ac <update_player_ui+0xac>
     3a0:	00058663          	beqz	a1,3ac <update_player_ui+0xac>
     3a4:	00050793          	mv	a5,a0
     3a8:	fddff06f          	j	384 <update_player_ui+0x84>
     3ac:	00f607b3          	add	a5,a2,a5
     3b0:	01178023          	sb	a7,0(a5)
     3b4:	00050793          	mv	a5,a0
     3b8:	fc6516e3          	bne	a0,t1,384 <update_player_ui+0x84>
     3bc:	00170713          	addi	a4,a4,1
     3c0:	fb0718e3          	bne	a4,a6,370 <update_player_ui+0x70>
     3c4:	00391513          	slli	a0,s2,0x3
     3c8:	41250533          	sub	a0,a0,s2
     3cc:	00251513          	slli	a0,a0,0x2
     3d0:	41250533          	sub	a0,a0,s2
     3d4:	000037b7          	lui	a5,0x3
     3d8:	00251513          	slli	a0,a0,0x2
     3dc:	a9378793          	addi	a5,a5,-1389 # 2a93 <oled_init_mode+0x1f>
     3e0:	06c00693          	li	a3,108
     3e4:	00a7ca63          	blt	a5,a0,3f8 <update_player_ui+0xf8>
     3e8:	06400593          	li	a1,100
     3ec:	00002097          	auipc	ra,0x2
     3f0:	4d0080e7          	jalr	1232(ra) # 28bc <__divsi3>
     3f4:	00050693          	mv	a3,a0
     3f8:	000037b7          	lui	a5,0x3
     3fc:	00004637          	lui	a2,0x4
     400:	78078793          	addi	a5,a5,1920 # 3780 <fatfs_entry_lfn_invalid+0x30>
     404:	07600593          	li	a1,118
     408:	07500513          	li	a0,117
     40c:	00a00813          	li	a6,10
     410:	fff00893          	li	a7,-1
     414:	90060613          	addi	a2,a2,-1792 # 3900 <fatfs_filename_to_lfn+0xac>
     418:	40d58733          	sub	a4,a1,a3
     41c:	00f40333          	add	t1,s0,a5
     420:	06e55c63          	bge	a0,a4,498 <update_player_ui+0x198>
     424:	08078793          	addi	a5,a5,128
     428:	fec798e3          	bne	a5,a2,418 <update_player_ui+0x118>
     42c:	07600593          	li	a1,118
     430:	00a00513          	li	a0,10
     434:	00002097          	auipc	ra,0x2
     438:	7ec080e7          	jalr	2028(ra) # 2c20 <display_set_cursor>
     43c:	00000593          	li	a1,0
     440:	0ff00513          	li	a0,255
     444:	00002097          	auipc	ra,0x2
     448:	7f0080e7          	jalr	2032(ra) # 2c34 <display_set_front_back_color>
     44c:	0004c783          	lbu	a5,0(s1)
     450:	08079e63          	bnez	a5,4ec <update_player_ui+0x1ec>
     454:	000074b7          	lui	s1,0x7
     458:	af04a783          	lw	a5,-1296(s1) # 6af0 <f_putchar>
     45c:	03e00513          	li	a0,62
     460:	00200413          	li	s0,2
     464:	000780e7          	jalr	a5
     468:	af04a783          	lw	a5,-1296(s1)
     46c:	02000513          	li	a0,32
     470:	00e00913          	li	s2,14
     474:	000780e7          	jalr	a5
     478:	008987b3          	add	a5,s3,s0
     47c:	ffe7c503          	lbu	a0,-2(a5)
     480:	04050263          	beqz	a0,4c4 <update_player_ui+0x1c4>
     484:	af04a783          	lw	a5,-1296(s1)
     488:	00140413          	addi	s0,s0,1
     48c:	000780e7          	jalr	a5
     490:	ff2414e3          	bne	s0,s2,478 <update_player_ui+0x178>
     494:	0300006f          	j	4c4 <update_player_ui+0x1c4>
     498:	01070663          	beq	a4,a6,4a4 <update_player_ui+0x1a4>
     49c:	00e30e33          	add	t3,t1,a4
     4a0:	011e0023          	sb	a7,0(t3)
     4a4:	00170713          	addi	a4,a4,1
     4a8:	f79ff06f          	j	420 <update_player_ui+0x120>
     4ac:	af092783          	lw	a5,-1296(s2)
     4b0:	00140413          	addi	s0,s0,1
     4b4:	000780e7          	jalr	a5
     4b8:	008487b3          	add	a5,s1,s0
     4bc:	0007c503          	lbu	a0,0(a5)
     4c0:	fe0516e3          	bnez	a0,4ac <update_player_ui+0x1ac>
     4c4:	00f00493          	li	s1,15
     4c8:	00007937          	lui	s2,0x7
     4cc:	0284d663          	bge	s1,s0,4f8 <update_player_ui+0x1f8>
     4d0:	01c12083          	lw	ra,28(sp)
     4d4:	01812403          	lw	s0,24(sp)
     4d8:	01412483          	lw	s1,20(sp)
     4dc:	01012903          	lw	s2,16(sp)
     4e0:	00c12983          	lw	s3,12(sp)
     4e4:	02010113          	addi	sp,sp,32
     4e8:	00008067          	ret
     4ec:	00000413          	li	s0,0
     4f0:	00007937          	lui	s2,0x7
     4f4:	fc5ff06f          	j	4b8 <update_player_ui+0x1b8>
     4f8:	af092783          	lw	a5,-1296(s2) # 6af0 <f_putchar>
     4fc:	02000513          	li	a0,32
     500:	00140413          	addi	s0,s0,1
     504:	000780e7          	jalr	a5
     508:	fc5ff06f          	j	4cc <update_player_ui+0x1cc>

0000050c <intro_sequence>:
     50c:	dc010113          	addi	sp,sp,-576
     510:	22112e23          	sw	ra,572(sp)
     514:	22812c23          	sw	s0,568(sp)
     518:	22912a23          	sw	s1,564(sp)
     51c:	23212823          	sw	s2,560(sp)
     520:	23312623          	sw	s3,556(sp)
     524:	23412423          	sw	s4,552(sp)
     528:	23512223          	sw	s5,548(sp)
     52c:	23612023          	sw	s6,544(sp)
     530:	21712e23          	sw	s7,540(sp)
     534:	21812c23          	sw	s8,536(sp)
     538:	21912a23          	sw	s9,532(sp)
     53c:	21a12823          	sw	s10,528(sp)
     540:	21b12623          	sw	s11,524(sp)
     544:	00002097          	auipc	ra,0x2
     548:	6d0080e7          	jalr	1744(ra) # 2c14 <display_framebuffer>
     54c:	00004637          	lui	a2,0x4
     550:	00000593          	li	a1,0
     554:	00002097          	auipc	ra,0x2
     558:	41c080e7          	jalr	1052(ra) # 2970 <memset>
     55c:	03c00593          	li	a1,60
     560:	02300513          	li	a0,35
     564:	00002097          	auipc	ra,0x2
     568:	6bc080e7          	jalr	1724(ra) # 2c20 <display_set_cursor>
     56c:	00000593          	li	a1,0
     570:	0ff00513          	li	a0,255
     574:	00002097          	auipc	ra,0x2
     578:	6c0080e7          	jalr	1728(ra) # 2c34 <display_set_front_back_color>
     57c:	00006537          	lui	a0,0x6
     580:	4e450513          	addi	a0,a0,1252 # 64e4 <LEDS+0x14>
     584:	00003097          	auipc	ra,0x3
     588:	978080e7          	jalr	-1672(ra) # 2efc <printf>
     58c:	00003097          	auipc	ra,0x3
     590:	804080e7          	jalr	-2044(ra) # 2d90 <display_refresh>
     594:	000064b7          	lui	s1,0x6
     598:	00006537          	lui	a0,0x6
     59c:	4d448593          	addi	a1,s1,1236 # 64d4 <LEDS+0x4>
     5a0:	4f050513          	addi	a0,a0,1264 # 64f0 <LEDS+0x20>
     5a4:	00006097          	auipc	ra,0x6
     5a8:	b00080e7          	jalr	-1280(ra) # 60a4 <fl_fopen>
     5ac:	00050413          	mv	s0,a0
     5b0:	02051063          	bnez	a0,5d0 <intro_sequence+0xc4>
     5b4:	00006537          	lui	a0,0x6
     5b8:	4d448593          	addi	a1,s1,1236
     5bc:	4fc50513          	addi	a0,a0,1276 # 64fc <LEDS+0x2c>
     5c0:	00006097          	auipc	ra,0x6
     5c4:	ae4080e7          	jalr	-1308(ra) # 60a4 <fl_fopen>
     5c8:	00050413          	mv	s0,a0
     5cc:	1e050a63          	beqz	a0,7c0 <intro_sequence+0x2b4>
     5d0:	02300513          	li	a0,35
     5d4:	04600593          	li	a1,70
     5d8:	00002097          	auipc	ra,0x2
     5dc:	648080e7          	jalr	1608(ra) # 2c20 <display_set_cursor>
     5e0:	00006537          	lui	a0,0x6
     5e4:	50850513          	addi	a0,a0,1288 # 6508 <LEDS+0x38>
     5e8:	00003097          	auipc	ra,0x3
     5ec:	914080e7          	jalr	-1772(ra) # 2efc <printf>
     5f0:	00002097          	auipc	ra,0x2
     5f4:	7a0080e7          	jalr	1952(ra) # 2d90 <display_refresh>
     5f8:	20000613          	li	a2,512
     5fc:	08000593          	li	a1,128
     600:	00010513          	mv	a0,sp
     604:	00002097          	auipc	ra,0x2
     608:	36c080e7          	jalr	876(ra) # 2970 <memset>
     60c:	000067b7          	lui	a5,0x6
     610:	4b87ac03          	lw	s8,1208(a5) # 64b8 <AUDIO>
     614:	000067b7          	lui	a5,0x6
     618:	52478d13          	addi	s10,a5,1316 # 6524 <LEDS+0x54>
     61c:	000067b7          	lui	a5,0x6
     620:	4c07ad83          	lw	s11,1216(a5) # 64c0 <BUTTONS>
     624:	00803cb3          	snez	s9,s0
     628:	00000a93          	li	s5,0
     62c:	00000b13          	li	s6,0
     630:	00100a13          	li	s4,1
     634:	00200993          	li	s3,2
     638:	03200913          	li	s2,50
     63c:	01400493          	li	s1,20
     640:	000c2b83          	lw	s7,0(s8)
     644:	1c0c8463          	beqz	s9,80c <intro_sequence+0x300>
     648:	00040693          	mv	a3,s0
     64c:	20000613          	li	a2,512
     650:	00100593          	li	a1,1
     654:	00010513          	mv	a0,sp
     658:	00005097          	auipc	ra,0x5
     65c:	448080e7          	jalr	1096(ra) # 5aa0 <fl_fread>
     660:	1ff00793          	li	a5,511
     664:	16a7cc63          	blt	a5,a0,7dc <intro_sequence+0x2d0>
     668:	00040513          	mv	a0,s0
     66c:	00005097          	auipc	ra,0x5
     670:	358080e7          	jalr	856(ra) # 59c4 <fl_fclose>
     674:	00000c93          	li	s9,0
     678:	00000413          	li	s0,0
     67c:	001b0b13          	addi	s6,s6,1
     680:	00300793          	li	a5,3
     684:	0afb1463          	bne	s6,a5,72c <intro_sequence+0x220>
     688:	00002097          	auipc	ra,0x2
     68c:	58c080e7          	jalr	1420(ra) # 2c14 <display_framebuffer>
     690:	00004637          	lui	a2,0x4
     694:	00000593          	li	a1,0
     698:	00050b13          	mv	s6,a0
     69c:	00002097          	auipc	ra,0x2
     6a0:	2d4080e7          	jalr	724(ra) # 2970 <memset>
     6a4:	000046b7          	lui	a3,0x4
     6a8:	00000793          	li	a5,0
     6ac:	fff00613          	li	a2,-1
     6b0:	f8068693          	addi	a3,a3,-128 # 3f80 <fatfs_compare_names+0x38>
     6b4:	08000593          	li	a1,128
     6b8:	00fb0733          	add	a4,s6,a5
     6bc:	00c70023          	sb	a2,0(a4)
     6c0:	00d70733          	add	a4,a4,a3
     6c4:	00c70023          	sb	a2,0(a4)
     6c8:	00178793          	addi	a5,a5,1
     6cc:	feb796e3          	bne	a5,a1,6b8 <intro_sequence+0x1ac>
     6d0:	00090593          	mv	a1,s2
     6d4:	00048513          	mv	a0,s1
     6d8:	00002097          	auipc	ra,0x2
     6dc:	548080e7          	jalr	1352(ra) # 2c20 <display_set_cursor>
     6e0:	00000593          	li	a1,0
     6e4:	0ff00513          	li	a0,255
     6e8:	00002097          	auipc	ra,0x2
     6ec:	54c080e7          	jalr	1356(ra) # 2c34 <display_set_front_back_color>
     6f0:	000d0513          	mv	a0,s10
     6f4:	00003097          	auipc	ra,0x3
     6f8:	808080e7          	jalr	-2040(ra) # 2efc <printf>
     6fc:	013484b3          	add	s1,s1,s3
     700:	00400793          	li	a5,4
     704:	01490933          	add	s2,s2,s4
     708:	1497c663          	blt	a5,s1,854 <intro_sequence+0x348>
     70c:	413009b3          	neg	s3,s3
     710:	00078493          	mv	s1,a5
     714:	1527ca63          	blt	a5,s2,868 <intro_sequence+0x35c>
     718:	41400a33          	neg	s4,s4
     71c:	00400913          	li	s2,4
     720:	00002097          	auipc	ra,0x2
     724:	670080e7          	jalr	1648(ra) # 2d90 <display_refresh>
     728:	00000b13          	li	s6,0
     72c:	001a8a93          	addi	s5,s5,1
     730:	03c00793          	li	a5,60
     734:	1557d463          	bge	a5,s5,87c <intro_sequence+0x370>
     738:	000da783          	lw	a5,0(s11)
     73c:	14078063          	beqz	a5,87c <intro_sequence+0x370>
     740:	00000097          	auipc	ra,0x0
     744:	a1c080e7          	jalr	-1508(ra) # 15c <play_click_noise>
     748:	00040863          	beqz	s0,758 <intro_sequence+0x24c>
     74c:	00040513          	mv	a0,s0
     750:	00005097          	auipc	ra,0x5
     754:	274080e7          	jalr	628(ra) # 59c4 <fl_fclose>
     758:	000067b7          	lui	a5,0x6
     75c:	4d07a783          	lw	a5,1232(a5) # 64d0 <LEDS>
     760:	0007a023          	sw	zero,0(a5)
     764:	00002097          	auipc	ra,0x2
     768:	4b0080e7          	jalr	1200(ra) # 2c14 <display_framebuffer>
     76c:	00004637          	lui	a2,0x4
     770:	00000593          	li	a1,0
     774:	00002097          	auipc	ra,0x2
     778:	1fc080e7          	jalr	508(ra) # 2970 <memset>
     77c:	00002097          	auipc	ra,0x2
     780:	614080e7          	jalr	1556(ra) # 2d90 <display_refresh>
     784:	23c12083          	lw	ra,572(sp)
     788:	23812403          	lw	s0,568(sp)
     78c:	23412483          	lw	s1,564(sp)
     790:	23012903          	lw	s2,560(sp)
     794:	22c12983          	lw	s3,556(sp)
     798:	22812a03          	lw	s4,552(sp)
     79c:	22412a83          	lw	s5,548(sp)
     7a0:	22012b03          	lw	s6,544(sp)
     7a4:	21c12b83          	lw	s7,540(sp)
     7a8:	21812c03          	lw	s8,536(sp)
     7ac:	21412c83          	lw	s9,532(sp)
     7b0:	21012d03          	lw	s10,528(sp)
     7b4:	20c12d83          	lw	s11,524(sp)
     7b8:	24010113          	addi	sp,sp,576
     7bc:	00008067          	ret
     7c0:	00a00513          	li	a0,10
     7c4:	04600593          	li	a1,70
     7c8:	00002097          	auipc	ra,0x2
     7cc:	458080e7          	jalr	1112(ra) # 2c20 <display_set_cursor>
     7d0:	00006537          	lui	a0,0x6
     7d4:	51450513          	addi	a0,a0,1300 # 6514 <LEDS+0x44>
     7d8:	e11ff06f          	j	5e8 <intro_sequence+0xdc>
     7dc:	20000593          	li	a1,512
     7e0:	00010513          	mv	a0,sp
     7e4:	00000097          	auipc	ra,0x0
     7e8:	a78080e7          	jalr	-1416(ra) # 25c <update_led_dance>
     7ec:	20000613          	li	a2,512
     7f0:	00010593          	mv	a1,sp
     7f4:	000b8513          	mv	a0,s7
     7f8:	00000097          	auipc	ra,0x0
     7fc:	8c4080e7          	jalr	-1852(ra) # bc <memcpy_custom>
     800:	000c2783          	lw	a5,0(s8)
     804:	fefb8ee3          	beq	s7,a5,800 <intro_sequence+0x2f4>
     808:	e75ff06f          	j	67c <intro_sequence+0x170>
     80c:	000057b7          	lui	a5,0x5
     810:	e2078793          	addi	a5,a5,-480 # 4e20 <fatfs_update_file_length+0xbc>
     814:	00000013          	nop
     818:	fff78793          	addi	a5,a5,-1
     81c:	fe079ce3          	bnez	a5,814 <intro_sequence+0x308>
     820:	20000613          	li	a2,512
     824:	08000593          	li	a1,128
     828:	00010513          	mv	a0,sp
     82c:	00002097          	auipc	ra,0x2
     830:	144080e7          	jalr	324(ra) # 2970 <memset>
     834:	20000613          	li	a2,512
     838:	00010593          	mv	a1,sp
     83c:	000b8513          	mv	a0,s7
     840:	00000097          	auipc	ra,0x0
     844:	87c080e7          	jalr	-1924(ra) # bc <memcpy_custom>
     848:	000c2783          	lw	a5,0(s8)
     84c:	fefb8ee3          	beq	s7,a5,848 <intro_sequence+0x33c>
     850:	e2dff06f          	j	67c <intro_sequence+0x170>
     854:	02700713          	li	a4,39
     858:	ea975ee3          	bge	a4,s1,714 <intro_sequence+0x208>
     85c:	413009b3          	neg	s3,s3
     860:	02800493          	li	s1,40
     864:	eb1ff06f          	j	714 <intro_sequence+0x208>
     868:	07500793          	li	a5,117
     86c:	eb27dae3          	bge	a5,s2,720 <intro_sequence+0x214>
     870:	41400a33          	neg	s4,s4
     874:	07600913          	li	s2,118
     878:	ea9ff06f          	j	720 <intro_sequence+0x214>
     87c:	dc0c92e3          	bnez	s9,640 <intro_sequence+0x134>
     880:	19000793          	li	a5,400
     884:	db57dee3          	bge	a5,s5,640 <intro_sequence+0x134>
     888:	ec1ff06f          	j	748 <intro_sequence+0x23c>

0000088c <play_music_with_controls>:
     88c:	ba010113          	addi	sp,sp,-1120
     890:	44112e23          	sw	ra,1116(sp)
     894:	44912a23          	sw	s1,1108(sp)
     898:	45212823          	sw	s2,1104(sp)
     89c:	45312623          	sw	s3,1100(sp)
     8a0:	44812c23          	sw	s0,1112(sp)
     8a4:	45412423          	sw	s4,1096(sp)
     8a8:	45512223          	sw	s5,1092(sp)
     8ac:	45612023          	sw	s6,1088(sp)
     8b0:	43712e23          	sw	s7,1084(sp)
     8b4:	43812c23          	sw	s8,1080(sp)
     8b8:	43912a23          	sw	s9,1076(sp)
     8bc:	43a12823          	sw	s10,1072(sp)
     8c0:	43b12623          	sw	s11,1068(sp)
     8c4:	00b12623          	sw	a1,12(sp)
     8c8:	00060913          	mv	s2,a2
     8cc:	00050993          	mv	s3,a0
     8d0:	00002097          	auipc	ra,0x2
     8d4:	344080e7          	jalr	836(ra) # 2c14 <display_framebuffer>
     8d8:	00004637          	lui	a2,0x4
     8dc:	00000593          	li	a1,0
     8e0:	00002097          	auipc	ra,0x2
     8e4:	090080e7          	jalr	144(ra) # 2970 <memset>
     8e8:	000065b7          	lui	a1,0x6
     8ec:	53458593          	addi	a1,a1,1332 # 6534 <LEDS+0x64>
     8f0:	02c10513          	addi	a0,sp,44
     8f4:	00002097          	auipc	ra,0x2
     8f8:	140080e7          	jalr	320(ra) # 2a34 <strcpy>
     8fc:	00c12583          	lw	a1,12(sp)
     900:	02c10513          	addi	a0,sp,44
     904:	000064b7          	lui	s1,0x6
     908:	fffff097          	auipc	ra,0xfffff
     90c:	784080e7          	jalr	1924(ra) # 8c <strcat_custom>
     910:	4d448593          	addi	a1,s1,1236 # 64d4 <LEDS+0x4>
     914:	02c10513          	addi	a0,sp,44
     918:	00005097          	auipc	ra,0x5
     91c:	78c080e7          	jalr	1932(ra) # 60a4 <fl_fopen>
     920:	28050a63          	beqz	a0,bb4 <play_music_with_controls+0x328>
     924:	00050413          	mv	s0,a0
     928:	00002097          	auipc	ra,0x2
     92c:	2ec080e7          	jalr	748(ra) # 2c14 <display_framebuffer>
     930:	00040693          	mv	a3,s0
     934:	00004637          	lui	a2,0x4
     938:	00100593          	li	a1,1
     93c:	00005097          	auipc	ra,0x5
     940:	164080e7          	jalr	356(ra) # 5aa0 <fl_fread>
     944:	00040513          	mv	a0,s0
     948:	00005097          	auipc	ra,0x5
     94c:	07c080e7          	jalr	124(ra) # 59c4 <fl_fclose>
     950:	4d448593          	addi	a1,s1,1236
     954:	00098513          	mv	a0,s3
     958:	00005097          	auipc	ra,0x5
     95c:	74c080e7          	jalr	1868(ra) # 60a4 <fl_fopen>
     960:	00a12823          	sw	a0,16(sp)
     964:	00000413          	li	s0,0
     968:	20050663          	beqz	a0,b74 <play_music_with_controls+0x2e8>
     96c:	00c12603          	lw	a2,12(sp)
     970:	00006c37          	lui	s8,0x6
     974:	6ccc0593          	addi	a1,s8,1740 # 66cc <LEDS+0x1fc>
     978:	00000513          	li	a0,0
     97c:	00000097          	auipc	ra,0x0
     980:	984080e7          	jalr	-1660(ra) # 300 <update_player_ui>
     984:	00006cb7          	lui	s9,0x6
     988:	00002097          	auipc	ra,0x2
     98c:	408080e7          	jalr	1032(ra) # 2d90 <display_refresh>
     990:	4c0ca783          	lw	a5,1216(s9) # 64c0 <BUTTONS>
     994:	00000a93          	li	s5,0
     998:	00000b13          	li	s6,0
     99c:	0007a483          	lw	s1,0(a5)
     9a0:	00f12a23          	sw	a5,20(sp)
     9a4:	000067b7          	lui	a5,0x6
     9a8:	4b87ad03          	lw	s10,1208(a5) # 64b8 <AUDIO>
     9ac:	000067b7          	lui	a5,0x6
     9b0:	4d07a783          	lw	a5,1232(a5) # 64d0 <LEDS>
     9b4:	00000993          	li	s3,0
     9b8:	22010b93          	addi	s7,sp,544
     9bc:	00f12e23          	sw	a5,28(sp)
     9c0:	000067b7          	lui	a5,0x6
     9c4:	54878793          	addi	a5,a5,1352 # 6548 <LEDS+0x78>
     9c8:	00f12c23          	sw	a5,24(sp)
     9cc:	000d2a03          	lw	s4,0(s10)
     9d0:	20098c63          	beqz	s3,be8 <play_music_with_controls+0x35c>
     9d4:	20000613          	li	a2,512
     9d8:	00000593          	li	a1,0
     9dc:	000a0513          	mv	a0,s4
     9e0:	00002097          	auipc	ra,0x2
     9e4:	f90080e7          	jalr	-112(ra) # 2970 <memset>
     9e8:	01c12783          	lw	a5,28(sp)
     9ec:	0007a023          	sw	zero,0(a5)
     9f0:	000d2783          	lw	a5,0(s10)
     9f4:	fefa0ee3          	beq	s4,a5,9f0 <play_music_with_controls+0x164>
     9f8:	001b0b13          	addi	s6,s6,1
     9fc:	01500793          	li	a5,21
     a00:	04fb1863          	bne	s6,a5,a50 <play_music_with_controls+0x1c4>
     a04:	00000513          	li	a0,0
     a08:	03205263          	blez	s2,a2c <play_music_with_controls+0x1a0>
     a0c:	00141513          	slli	a0,s0,0x1
     a10:	00850533          	add	a0,a0,s0
     a14:	00351513          	slli	a0,a0,0x3
     a18:	00850533          	add	a0,a0,s0
     a1c:	00090593          	mv	a1,s2
     a20:	00251513          	slli	a0,a0,0x2
     a24:	00002097          	auipc	ra,0x2
     a28:	e98080e7          	jalr	-360(ra) # 28bc <__divsi3>
     a2c:	00c12603          	lw	a2,12(sp)
     a30:	6ccc0593          	addi	a1,s8,1740
     a34:	00098463          	beqz	s3,a3c <play_music_with_controls+0x1b0>
     a38:	01812583          	lw	a1,24(sp)
     a3c:	00000097          	auipc	ra,0x0
     a40:	8c4080e7          	jalr	-1852(ra) # 300 <update_player_ui>
     a44:	00000b13          	li	s6,0
     a48:	00002097          	auipc	ra,0x2
     a4c:	348080e7          	jalr	840(ra) # 2d90 <display_refresh>
     a50:	01412783          	lw	a5,20(sp)
     a54:	0007aa03          	lw	s4,0(a5)
     a58:	020a7793          	andi	a5,s4,32
     a5c:	06078863          	beqz	a5,acc <play_music_with_controls+0x240>
     a60:	ffffe7b7          	lui	a5,0xffffe
     a64:	00f40433          	add	s0,s0,a5
     a68:	fff44793          	not	a5,s0
     a6c:	41f7d793          	srai	a5,a5,0x1f
     a70:	01012503          	lw	a0,16(sp)
     a74:	00f47433          	and	s0,s0,a5
     a78:	00000613          	li	a2,0
     a7c:	00040593          	mv	a1,s0
     a80:	00003097          	auipc	ra,0x3
     a84:	ab4080e7          	jalr	-1356(ra) # 3534 <fl_fseek>
     a88:	00000513          	li	a0,0
     a8c:	03205263          	blez	s2,ab0 <play_music_with_controls+0x224>
     a90:	00141513          	slli	a0,s0,0x1
     a94:	00850533          	add	a0,a0,s0
     a98:	00351513          	slli	a0,a0,0x3
     a9c:	00850533          	add	a0,a0,s0
     aa0:	00090593          	mv	a1,s2
     aa4:	00251513          	slli	a0,a0,0x2
     aa8:	00002097          	auipc	ra,0x2
     aac:	e14080e7          	jalr	-492(ra) # 28bc <__divsi3>
     ab0:	00c12603          	lw	a2,12(sp)
     ab4:	000065b7          	lui	a1,0x6
     ab8:	55458593          	addi	a1,a1,1364 # 6554 <LEDS+0x84>
     abc:	00000097          	auipc	ra,0x0
     ac0:	844080e7          	jalr	-1980(ra) # 300 <update_player_ui>
     ac4:	00002097          	auipc	ra,0x2
     ac8:	2cc080e7          	jalr	716(ra) # 2d90 <display_refresh>
     acc:	040a7793          	andi	a5,s4,64
     ad0:	06078463          	beqz	a5,b38 <play_music_with_controls+0x2ac>
     ad4:	000027b7          	lui	a5,0x2
     ad8:	00f40433          	add	s0,s0,a5
     adc:	27245e63          	bge	s0,s2,d58 <play_music_with_controls+0x4cc>
     ae0:	01012503          	lw	a0,16(sp)
     ae4:	00000613          	li	a2,0
     ae8:	00040593          	mv	a1,s0
     aec:	00003097          	auipc	ra,0x3
     af0:	a48080e7          	jalr	-1464(ra) # 3534 <fl_fseek>
     af4:	00000513          	li	a0,0
     af8:	03205263          	blez	s2,b1c <play_music_with_controls+0x290>
     afc:	00141513          	slli	a0,s0,0x1
     b00:	00850533          	add	a0,a0,s0
     b04:	00351513          	slli	a0,a0,0x3
     b08:	00850533          	add	a0,a0,s0
     b0c:	00090593          	mv	a1,s2
     b10:	00251513          	slli	a0,a0,0x2
     b14:	00002097          	auipc	ra,0x2
     b18:	da8080e7          	jalr	-600(ra) # 28bc <__divsi3>
     b1c:	00c12603          	lw	a2,12(sp)
     b20:	000065b7          	lui	a1,0x6
     b24:	56058593          	addi	a1,a1,1376 # 6560 <LEDS+0x90>
     b28:	fffff097          	auipc	ra,0xfffff
     b2c:	7d8080e7          	jalr	2008(ra) # 300 <update_player_ui>
     b30:	00002097          	auipc	ra,0x2
     b34:	260080e7          	jalr	608(ra) # 2d90 <display_refresh>
     b38:	fff4c493          	not	s1,s1
     b3c:	0144f4b3          	and	s1,s1,s4
     b40:	0024f793          	andi	a5,s1,2
     b44:	10078e63          	beqz	a5,c60 <play_music_with_controls+0x3d4>
     b48:	fffff097          	auipc	ra,0xfffff
     b4c:	614080e7          	jalr	1556(ra) # 15c <play_click_noise>
     b50:	00000413          	li	s0,0
     b54:	01012503          	lw	a0,16(sp)
     b58:	00005097          	auipc	ra,0x5
     b5c:	e6c080e7          	jalr	-404(ra) # 59c4 <fl_fclose>
     b60:	fffff097          	auipc	ra,0xfffff
     b64:	580080e7          	jalr	1408(ra) # e0 <clear_audio>
     b68:	000067b7          	lui	a5,0x6
     b6c:	4d07a783          	lw	a5,1232(a5) # 64d0 <LEDS>
     b70:	0007a023          	sw	zero,0(a5)
     b74:	45c12083          	lw	ra,1116(sp)
     b78:	00040513          	mv	a0,s0
     b7c:	45812403          	lw	s0,1112(sp)
     b80:	45412483          	lw	s1,1108(sp)
     b84:	45012903          	lw	s2,1104(sp)
     b88:	44c12983          	lw	s3,1100(sp)
     b8c:	44812a03          	lw	s4,1096(sp)
     b90:	44412a83          	lw	s5,1092(sp)
     b94:	44012b03          	lw	s6,1088(sp)
     b98:	43c12b83          	lw	s7,1084(sp)
     b9c:	43812c03          	lw	s8,1080(sp)
     ba0:	43412c83          	lw	s9,1076(sp)
     ba4:	43012d03          	lw	s10,1072(sp)
     ba8:	42c12d83          	lw	s11,1068(sp)
     bac:	46010113          	addi	sp,sp,1120
     bb0:	00008067          	ret
     bb4:	03200593          	li	a1,50
     bb8:	01e00513          	li	a0,30
     bbc:	00002097          	auipc	ra,0x2
     bc0:	064080e7          	jalr	100(ra) # 2c20 <display_set_cursor>
     bc4:	00000593          	li	a1,0
     bc8:	0ff00513          	li	a0,255
     bcc:	00002097          	auipc	ra,0x2
     bd0:	068080e7          	jalr	104(ra) # 2c34 <display_set_front_back_color>
     bd4:	00006537          	lui	a0,0x6
     bd8:	53c50513          	addi	a0,a0,1340 # 653c <LEDS+0x6c>
     bdc:	00002097          	auipc	ra,0x2
     be0:	320080e7          	jalr	800(ra) # 2efc <printf>
     be4:	d6dff06f          	j	950 <play_music_with_controls+0xc4>
     be8:	01012683          	lw	a3,16(sp)
     bec:	20000613          	li	a2,512
     bf0:	00100593          	li	a1,1
     bf4:	000b8513          	mv	a0,s7
     bf8:	00005097          	auipc	ra,0x5
     bfc:	ea8080e7          	jalr	-344(ra) # 5aa0 <fl_fread>
     c00:	1ff00793          	li	a5,511
     c04:	00050d93          	mv	s11,a0
     c08:	00a7ce63          	blt	a5,a0,c24 <play_music_with_controls+0x398>
     c0c:	00050793          	mv	a5,a0
     c10:	20000713          	li	a4,512
     c14:	00fb86b3          	add	a3,s7,a5
     c18:	00068023          	sb	zero,0(a3)
     c1c:	00178793          	addi	a5,a5,1
     c20:	fee79ae3          	bne	a5,a4,c14 <play_music_with_controls+0x388>
     c24:	20000593          	li	a1,512
     c28:	000b8513          	mv	a0,s7
     c2c:	fffff097          	auipc	ra,0xfffff
     c30:	630080e7          	jalr	1584(ra) # 25c <update_led_dance>
     c34:	20000613          	li	a2,512
     c38:	000b8593          	mv	a1,s7
     c3c:	000a0513          	mv	a0,s4
     c40:	fffff097          	auipc	ra,0xfffff
     c44:	47c080e7          	jalr	1148(ra) # bc <memcpy_custom>
     c48:	000d2783          	lw	a5,0(s10)
     c4c:	fefa0ee3          	beq	s4,a5,c48 <play_music_with_controls+0x3bc>
     c50:	1ff00793          	li	a5,511
     c54:	11b7d263          	bge	a5,s11,d58 <play_music_with_controls+0x4cc>
     c58:	01b40433          	add	s0,s0,s11
     c5c:	d9dff06f          	j	9f8 <play_music_with_controls+0x16c>
     c60:	0084f793          	andi	a5,s1,8
     c64:	0e079e63          	bnez	a5,d60 <play_music_with_controls+0x4d4>
     c68:	0104f493          	andi	s1,s1,16
     c6c:	0e049663          	bnez	s1,d58 <play_music_with_controls+0x4cc>
     c70:	004a7493          	andi	s1,s4,4
     c74:	08048063          	beqz	s1,cf4 <play_music_with_controls+0x468>
     c78:	001a8493          	addi	s1,s5,1
     c7c:	01e00793          	li	a5,30
     c80:	06f49063          	bne	s1,a5,ce0 <play_music_with_controls+0x454>
     c84:	fffff097          	auipc	ra,0xfffff
     c88:	4d8080e7          	jalr	1240(ra) # 15c <play_click_noise>
     c8c:	01012503          	lw	a0,16(sp)
     c90:	00000613          	li	a2,0
     c94:	00000593          	li	a1,0
     c98:	00003097          	auipc	ra,0x3
     c9c:	89c080e7          	jalr	-1892(ra) # 3534 <fl_fseek>
     ca0:	00c12603          	lw	a2,12(sp)
     ca4:	000065b7          	lui	a1,0x6
     ca8:	56858593          	addi	a1,a1,1384 # 6568 <LEDS+0x98>
     cac:	00000513          	li	a0,0
     cb0:	fffff097          	auipc	ra,0xfffff
     cb4:	650080e7          	jalr	1616(ra) # 300 <update_player_ui>
     cb8:	00002097          	auipc	ra,0x2
     cbc:	0d8080e7          	jalr	216(ra) # 2d90 <display_refresh>
     cc0:	fffff097          	auipc	ra,0xfffff
     cc4:	420080e7          	jalr	1056(ra) # e0 <clear_audio>
     cc8:	4c0ca783          	lw	a5,1216(s9)
     ccc:	0007a403          	lw	s0,0(a5)
     cd0:	00447413          	andi	s0,s0,4
     cd4:	00041c63          	bnez	s0,cec <play_music_with_controls+0x460>
     cd8:	00000493          	li	s1,0
     cdc:	00000993          	li	s3,0
     ce0:	00048a93          	mv	s5,s1
     ce4:	000a0493          	mv	s1,s4
     ce8:	ce5ff06f          	j	9cc <play_music_with_controls+0x140>
     cec:	00000013          	nop
     cf0:	fddff06f          	j	ccc <play_music_with_controls+0x440>
     cf4:	fffa8a93          	addi	s5,s5,-1
     cf8:	01c00793          	li	a5,28
     cfc:	ff57e2e3          	bltu	a5,s5,ce0 <play_music_with_controls+0x454>
     d00:	0019ca93          	xori	s5,s3,1
     d04:	00000513          	li	a0,0
     d08:	03205263          	blez	s2,d2c <play_music_with_controls+0x4a0>
     d0c:	00141513          	slli	a0,s0,0x1
     d10:	00850533          	add	a0,a0,s0
     d14:	00351513          	slli	a0,a0,0x3
     d18:	00850533          	add	a0,a0,s0
     d1c:	00090593          	mv	a1,s2
     d20:	00251513          	slli	a0,a0,0x2
     d24:	00002097          	auipc	ra,0x2
     d28:	b98080e7          	jalr	-1128(ra) # 28bc <__divsi3>
     d2c:	00100793          	li	a5,1
     d30:	00c12603          	lw	a2,12(sp)
     d34:	6ccc0593          	addi	a1,s8,1740
     d38:	00f98463          	beq	s3,a5,d40 <play_music_with_controls+0x4b4>
     d3c:	01812583          	lw	a1,24(sp)
     d40:	fffff097          	auipc	ra,0xfffff
     d44:	5c0080e7          	jalr	1472(ra) # 300 <update_player_ui>
     d48:	000a8993          	mv	s3,s5
     d4c:	00002097          	auipc	ra,0x2
     d50:	044080e7          	jalr	68(ra) # 2d90 <display_refresh>
     d54:	f8dff06f          	j	ce0 <play_music_with_controls+0x454>
     d58:	00100413          	li	s0,1
     d5c:	df9ff06f          	j	b54 <play_music_with_controls+0x2c8>
     d60:	fff00413          	li	s0,-1
     d64:	df1ff06f          	j	b54 <play_music_with_controls+0x2c8>

00000d68 <play_dj_mode>:
     d68:	81010113          	addi	sp,sp,-2032
     d6c:	7e112623          	sw	ra,2028(sp)
     d70:	7e912223          	sw	s1,2020(sp)
     d74:	7f212023          	sw	s2,2016(sp)
     d78:	7e812423          	sw	s0,2024(sp)
     d7c:	7d312e23          	sw	s3,2012(sp)
     d80:	7d412c23          	sw	s4,2008(sp)
     d84:	7d512a23          	sw	s5,2004(sp)
     d88:	7d612823          	sw	s6,2000(sp)
     d8c:	7d712623          	sw	s7,1996(sp)
     d90:	7d812423          	sw	s8,1992(sp)
     d94:	7d912223          	sw	s9,1988(sp)
     d98:	7da12023          	sw	s10,1984(sp)
     d9c:	7bb12e23          	sw	s11,1980(sp)
     da0:	f9010113          	addi	sp,sp,-112
     da4:	00b12623          	sw	a1,12(sp)
     da8:	00c12a23          	sw	a2,20(sp)
     dac:	00050913          	mv	s2,a0
     db0:	00002097          	auipc	ra,0x2
     db4:	e64080e7          	jalr	-412(ra) # 2c14 <display_framebuffer>
     db8:	00004637          	lui	a2,0x4
     dbc:	00000593          	li	a1,0
     dc0:	00002097          	auipc	ra,0x2
     dc4:	bb0080e7          	jalr	-1104(ra) # 2970 <memset>
     dc8:	000065b7          	lui	a1,0x6
     dcc:	53458593          	addi	a1,a1,1332 # 6534 <LEDS+0x64>
     dd0:	02c10513          	addi	a0,sp,44
     dd4:	00002097          	auipc	ra,0x2
     dd8:	c60080e7          	jalr	-928(ra) # 2a34 <strcpy>
     ddc:	00c12583          	lw	a1,12(sp)
     de0:	02c10513          	addi	a0,sp,44
     de4:	000064b7          	lui	s1,0x6
     de8:	fffff097          	auipc	ra,0xfffff
     dec:	2a4080e7          	jalr	676(ra) # 8c <strcat_custom>
     df0:	4d448593          	addi	a1,s1,1236 # 64d4 <LEDS+0x4>
     df4:	02c10513          	addi	a0,sp,44
     df8:	00005097          	auipc	ra,0x5
     dfc:	2ac080e7          	jalr	684(ra) # 60a4 <fl_fopen>
     e00:	14050863          	beqz	a0,f50 <play_dj_mode+0x1e8>
     e04:	00050413          	mv	s0,a0
     e08:	00002097          	auipc	ra,0x2
     e0c:	e0c080e7          	jalr	-500(ra) # 2c14 <display_framebuffer>
     e10:	00040693          	mv	a3,s0
     e14:	00004637          	lui	a2,0x4
     e18:	00100593          	li	a1,1
     e1c:	00005097          	auipc	ra,0x5
     e20:	c84080e7          	jalr	-892(ra) # 5aa0 <fl_fread>
     e24:	00040513          	mv	a0,s0
     e28:	00005097          	auipc	ra,0x5
     e2c:	b9c080e7          	jalr	-1124(ra) # 59c4 <fl_fclose>
     e30:	4d448593          	addi	a1,s1,1236
     e34:	00090513          	mv	a0,s2
     e38:	00005097          	auipc	ra,0x5
     e3c:	26c080e7          	jalr	620(ra) # 60a4 <fl_fopen>
     e40:	00a12823          	sw	a0,16(sp)
     e44:	20050e63          	beqz	a0,1060 <play_dj_mode+0x2f8>
     e48:	07600593          	li	a1,118
     e4c:	00a00513          	li	a0,10
     e50:	00002097          	auipc	ra,0x2
     e54:	dd0080e7          	jalr	-560(ra) # 2c20 <display_set_cursor>
     e58:	00000593          	li	a1,0
     e5c:	0ff00513          	li	a0,255
     e60:	00002097          	auipc	ra,0x2
     e64:	dd4080e7          	jalr	-556(ra) # 2c34 <display_set_front_back_color>
     e68:	00c12603          	lw	a2,12(sp)
     e6c:	000065b7          	lui	a1,0x6
     e70:	58c58593          	addi	a1,a1,1420 # 658c <LEDS+0xbc>
     e74:	00000513          	li	a0,0
     e78:	fffff097          	auipc	ra,0xfffff
     e7c:	488080e7          	jalr	1160(ra) # 300 <update_player_ui>
     e80:	00002097          	auipc	ra,0x2
     e84:	f10080e7          	jalr	-240(ra) # 2d90 <display_refresh>
     e88:	000067b7          	lui	a5,0x6
     e8c:	4c07a783          	lw	a5,1216(a5) # 64c0 <BUTTONS>
     e90:	00000493          	li	s1,0
     e94:	00000913          	li	s2,0
     e98:	0007a403          	lw	s0,0(a5)
     e9c:	00f12c23          	sw	a5,24(sp)
     ea0:	000067b7          	lui	a5,0x6
     ea4:	4b87ac83          	lw	s9,1208(a5) # 64b8 <AUDIO>
     ea8:	000067b7          	lui	a5,0x6
     eac:	5a478793          	addi	a5,a5,1444 # 65a4 <LEDS+0xd4>
     eb0:	00000d13          	li	s10,0
     eb4:	00006bb7          	lui	s7,0x6
     eb8:	00006c37          	lui	s8,0x6
     ebc:	00f12e23          	sw	a5,28(sp)
     ec0:	01812783          	lw	a5,24(sp)
     ec4:	000caa83          	lw	s5,0(s9)
     ec8:	0007a983          	lw	s3,0(a5)
     ecc:	0049fd93          	andi	s11,s3,4
     ed0:	0a0d8a63          	beqz	s11,f84 <play_dj_mode+0x21c>
     ed4:	20000593          	li	a1,512
     ed8:	22010513          	addi	a0,sp,544
     edc:	fffff097          	auipc	ra,0xfffff
     ee0:	380080e7          	jalr	896(ra) # 25c <update_led_dance>
     ee4:	20000613          	li	a2,512
     ee8:	22010593          	addi	a1,sp,544
     eec:	000a8513          	mv	a0,s5
     ef0:	fffff097          	auipc	ra,0xfffff
     ef4:	1cc080e7          	jalr	460(ra) # bc <memcpy_custom>
     ef8:	000ca783          	lw	a5,0(s9)
     efc:	fefa8ee3          	beq	s5,a5,ef8 <play_dj_mode+0x190>
     f00:	00190913          	addi	s2,s2,1
     f04:	00a00793          	li	a5,10
     f08:	fb27dce3          	bge	a5,s2,ec0 <play_dj_mode+0x158>
     f0c:	001d1513          	slli	a0,s10,0x1
     f10:	01a50533          	add	a0,a0,s10
     f14:	01412583          	lw	a1,20(sp)
     f18:	00351513          	slli	a0,a0,0x3
     f1c:	01a50533          	add	a0,a0,s10
     f20:	00251513          	slli	a0,a0,0x2
     f24:	00002097          	auipc	ra,0x2
     f28:	998080e7          	jalr	-1640(ra) # 28bc <__divsi3>
     f2c:	00c12603          	lw	a2,12(sp)
     f30:	000065b7          	lui	a1,0x6
     f34:	59858593          	addi	a1,a1,1432 # 6598 <LEDS+0xc8>
     f38:	fffff097          	auipc	ra,0xfffff
     f3c:	3c8080e7          	jalr	968(ra) # 300 <update_player_ui>
     f40:	00000913          	li	s2,0
     f44:	00002097          	auipc	ra,0x2
     f48:	e4c080e7          	jalr	-436(ra) # 2d90 <display_refresh>
     f4c:	f75ff06f          	j	ec0 <play_dj_mode+0x158>
     f50:	00000593          	li	a1,0
     f54:	0ff00513          	li	a0,255
     f58:	00002097          	auipc	ra,0x2
     f5c:	cdc080e7          	jalr	-804(ra) # 2c34 <display_set_front_back_color>
     f60:	03200593          	li	a1,50
     f64:	02300513          	li	a0,35
     f68:	00002097          	auipc	ra,0x2
     f6c:	cb8080e7          	jalr	-840(ra) # 2c20 <display_set_cursor>
     f70:	00006537          	lui	a0,0x6
     f74:	58450513          	addi	a0,a0,1412 # 6584 <LEDS+0xb4>
     f78:	00002097          	auipc	ra,0x2
     f7c:	f84080e7          	jalr	-124(ra) # 2efc <printf>
     f80:	eb1ff06f          	j	e30 <play_dj_mode+0xc8>
     f84:	00100793          	li	a5,1
     f88:	40000a13          	li	s4,1024
     f8c:	00f48a63          	beq	s1,a5,fa0 <play_dj_mode+0x238>
     f90:	fff00793          	li	a5,-1
     f94:	10000a13          	li	s4,256
     f98:	00f48463          	beq	s1,a5,fa0 <play_dj_mode+0x238>
     f9c:	20000a13          	li	s4,512
     fa0:	01012683          	lw	a3,16(sp)
     fa4:	000a0613          	mv	a2,s4
     fa8:	00100593          	li	a1,1
     fac:	42010513          	addi	a0,sp,1056
     fb0:	00005097          	auipc	ra,0x5
     fb4:	af0080e7          	jalr	-1296(ra) # 5aa0 <fl_fread>
     fb8:	00050b13          	mv	s6,a0
     fbc:	42010793          	addi	a5,sp,1056
     fc0:	03455063          	bge	a0,s4,fe0 <play_dj_mode+0x278>
     fc4:	01012503          	lw	a0,16(sp)
     fc8:	00000613          	li	a2,0
     fcc:	00000593          	li	a1,0
     fd0:	00002097          	auipc	ra,0x2
     fd4:	564080e7          	jalr	1380(ra) # 3534 <fl_fseek>
     fd8:	00000d13          	li	s10,0
     fdc:	ee5ff06f          	j	ec0 <play_dj_mode+0x158>
     fe0:	22010a13          	addi	s4,sp,544
     fe4:	0a049e63          	bnez	s1,10a0 <play_dj_mode+0x338>
     fe8:	20000613          	li	a2,512
     fec:	00078593          	mv	a1,a5
     ff0:	000a0513          	mv	a0,s4
     ff4:	fffff097          	auipc	ra,0xfffff
     ff8:	0c8080e7          	jalr	200(ra) # bc <memcpy_custom>
     ffc:	20000593          	li	a1,512
    1000:	000a0513          	mv	a0,s4
    1004:	fffff097          	auipc	ra,0xfffff
    1008:	258080e7          	jalr	600(ra) # 25c <update_led_dance>
    100c:	20000613          	li	a2,512
    1010:	000a0593          	mv	a1,s4
    1014:	000a8513          	mv	a0,s5
    1018:	fffff097          	auipc	ra,0xfffff
    101c:	0a4080e7          	jalr	164(ra) # bc <memcpy_custom>
    1020:	000ca783          	lw	a5,0(s9)
    1024:	fefa8ee3          	beq	s5,a5,1020 <play_dj_mode+0x2b8>
    1028:	fff44413          	not	s0,s0
    102c:	01347433          	and	s0,s0,s3
    1030:	00247793          	andi	a5,s0,2
    1034:	0a078e63          	beqz	a5,10f0 <play_dj_mode+0x388>
    1038:	fffff097          	auipc	ra,0xfffff
    103c:	124080e7          	jalr	292(ra) # 15c <play_click_noise>
    1040:	01012503          	lw	a0,16(sp)
    1044:	00005097          	auipc	ra,0x5
    1048:	980080e7          	jalr	-1664(ra) # 59c4 <fl_fclose>
    104c:	fffff097          	auipc	ra,0xfffff
    1050:	094080e7          	jalr	148(ra) # e0 <clear_audio>
    1054:	000067b7          	lui	a5,0x6
    1058:	4d07a783          	lw	a5,1232(a5) # 64d0 <LEDS>
    105c:	0007a023          	sw	zero,0(a5)
    1060:	07010113          	addi	sp,sp,112
    1064:	7ec12083          	lw	ra,2028(sp)
    1068:	7e812403          	lw	s0,2024(sp)
    106c:	7e412483          	lw	s1,2020(sp)
    1070:	7e012903          	lw	s2,2016(sp)
    1074:	7dc12983          	lw	s3,2012(sp)
    1078:	7d812a03          	lw	s4,2008(sp)
    107c:	7d412a83          	lw	s5,2004(sp)
    1080:	7d012b03          	lw	s6,2000(sp)
    1084:	7cc12b83          	lw	s7,1996(sp)
    1088:	7c812c03          	lw	s8,1992(sp)
    108c:	7c412c83          	lw	s9,1988(sp)
    1090:	7c012d03          	lw	s10,1984(sp)
    1094:	7bc12d83          	lw	s11,1980(sp)
    1098:	7f010113          	addi	sp,sp,2032
    109c:	00008067          	ret
    10a0:	00100693          	li	a3,1
    10a4:	000a0713          	mv	a4,s4
    10a8:	10000613          	li	a2,256
    10ac:	02d49263          	bne	s1,a3,10d0 <play_dj_mode+0x368>
    10b0:	20000713          	li	a4,512
    10b4:	0007c603          	lbu	a2,0(a5)
    10b8:	01ba06b3          	add	a3,s4,s11
    10bc:	001d8d93          	addi	s11,s11,1
    10c0:	00c68023          	sb	a2,0(a3)
    10c4:	00278793          	addi	a5,a5,2
    10c8:	feed96e3          	bne	s11,a4,10b4 <play_dj_mode+0x34c>
    10cc:	f31ff06f          	j	ffc <play_dj_mode+0x294>
    10d0:	01b786b3          	add	a3,a5,s11
    10d4:	0006c683          	lbu	a3,0(a3)
    10d8:	001d8d93          	addi	s11,s11,1
    10dc:	00270713          	addi	a4,a4,2
    10e0:	fed70f23          	sb	a3,-2(a4)
    10e4:	fed70fa3          	sb	a3,-1(a4)
    10e8:	fecd94e3          	bne	s11,a2,10d0 <play_dj_mode+0x368>
    10ec:	f11ff06f          	j	ffc <play_dj_mode+0x294>
    10f0:	00847793          	andi	a5,s0,8
    10f4:	016d0d33          	add	s10,s10,s6
    10f8:	00078463          	beqz	a5,1100 <play_dj_mode+0x398>
    10fc:	00100493          	li	s1,1
    1100:	01047793          	andi	a5,s0,16
    1104:	00078463          	beqz	a5,110c <play_dj_mode+0x3a4>
    1108:	fff00493          	li	s1,-1
    110c:	04047413          	andi	s0,s0,64
    1110:	00143413          	seqz	s0,s0
    1114:	40800433          	neg	s0,s0
    1118:	0209f793          	andi	a5,s3,32
    111c:	0084f4b3          	and	s1,s1,s0
    1120:	06078263          	beqz	a5,1184 <play_dj_mode+0x41c>
    1124:	ffffc7b7          	lui	a5,0xffffc
    1128:	00fd0d33          	add	s10,s10,a5
    112c:	fffd4793          	not	a5,s10
    1130:	41f7d793          	srai	a5,a5,0x1f
    1134:	01012503          	lw	a0,16(sp)
    1138:	00fd7d33          	and	s10,s10,a5
    113c:	00000613          	li	a2,0
    1140:	000d0593          	mv	a1,s10
    1144:	00002097          	auipc	ra,0x2
    1148:	3f0080e7          	jalr	1008(ra) # 3534 <fl_fseek>
    114c:	001d1513          	slli	a0,s10,0x1
    1150:	01a50533          	add	a0,a0,s10
    1154:	01412583          	lw	a1,20(sp)
    1158:	00351513          	slli	a0,a0,0x3
    115c:	01a50533          	add	a0,a0,s10
    1160:	00251513          	slli	a0,a0,0x2
    1164:	00001097          	auipc	ra,0x1
    1168:	758080e7          	jalr	1880(ra) # 28bc <__divsi3>
    116c:	00c12603          	lw	a2,12(sp)
    1170:	01c12583          	lw	a1,28(sp)
    1174:	fffff097          	auipc	ra,0xfffff
    1178:	18c080e7          	jalr	396(ra) # 300 <update_player_ui>
    117c:	00002097          	auipc	ra,0x2
    1180:	c14080e7          	jalr	-1004(ra) # 2d90 <display_refresh>
    1184:	00190913          	addi	s2,s2,1
    1188:	01400793          	li	a5,20
    118c:	00098413          	mv	s0,s3
    1190:	d327d8e3          	bge	a5,s2,ec0 <play_dj_mode+0x158>
    1194:	01412783          	lw	a5,20(sp)
    1198:	00000513          	li	a0,0
    119c:	02f05263          	blez	a5,11c0 <play_dj_mode+0x458>
    11a0:	001d1513          	slli	a0,s10,0x1
    11a4:	01a50533          	add	a0,a0,s10
    11a8:	00351513          	slli	a0,a0,0x3
    11ac:	01a50533          	add	a0,a0,s10
    11b0:	00078593          	mv	a1,a5
    11b4:	00251513          	slli	a0,a0,0x2
    11b8:	00001097          	auipc	ra,0x1
    11bc:	704080e7          	jalr	1796(ra) # 28bc <__divsi3>
    11c0:	00100793          	li	a5,1
    11c4:	570b8593          	addi	a1,s7,1392 # 6570 <LEDS+0xa0>
    11c8:	00f48c63          	beq	s1,a5,11e0 <play_dj_mode+0x478>
    11cc:	fff00793          	li	a5,-1
    11d0:	6ccc0593          	addi	a1,s8,1740 # 66cc <LEDS+0x1fc>
    11d4:	00f49663          	bne	s1,a5,11e0 <play_dj_mode+0x478>
    11d8:	000065b7          	lui	a1,0x6
    11dc:	57858593          	addi	a1,a1,1400 # 6578 <LEDS+0xa8>
    11e0:	00c12603          	lw	a2,12(sp)
    11e4:	00000913          	li	s2,0
    11e8:	00098413          	mv	s0,s3
    11ec:	fffff097          	auipc	ra,0xfffff
    11f0:	114080e7          	jalr	276(ra) # 300 <update_player_ui>
    11f4:	00002097          	auipc	ra,0x2
    11f8:	b9c080e7          	jalr	-1124(ra) # 2d90 <display_refresh>
    11fc:	cc5ff06f          	j	ec0 <play_dj_mode+0x158>

00001200 <view_image_file>:
    1200:	ff010113          	addi	sp,sp,-16
    1204:	00112623          	sw	ra,12(sp)
    1208:	00812423          	sw	s0,8(sp)
    120c:	00050413          	mv	s0,a0
    1210:	00002097          	auipc	ra,0x2
    1214:	a04080e7          	jalr	-1532(ra) # 2c14 <display_framebuffer>
    1218:	00000593          	li	a1,0
    121c:	00004637          	lui	a2,0x4
    1220:	00001097          	auipc	ra,0x1
    1224:	750080e7          	jalr	1872(ra) # 2970 <memset>
    1228:	00002097          	auipc	ra,0x2
    122c:	b68080e7          	jalr	-1176(ra) # 2d90 <display_refresh>
    1230:	000065b7          	lui	a1,0x6
    1234:	4d458593          	addi	a1,a1,1236 # 64d4 <LEDS+0x4>
    1238:	00040513          	mv	a0,s0
    123c:	00005097          	auipc	ra,0x5
    1240:	e68080e7          	jalr	-408(ra) # 60a4 <fl_fopen>
    1244:	0a050263          	beqz	a0,12e8 <view_image_file+0xe8>
    1248:	00050413          	mv	s0,a0
    124c:	00002097          	auipc	ra,0x2
    1250:	9c8080e7          	jalr	-1592(ra) # 2c14 <display_framebuffer>
    1254:	00040693          	mv	a3,s0
    1258:	00004637          	lui	a2,0x4
    125c:	00100593          	li	a1,1
    1260:	00005097          	auipc	ra,0x5
    1264:	840080e7          	jalr	-1984(ra) # 5aa0 <fl_fread>
    1268:	00040513          	mv	a0,s0
    126c:	00004097          	auipc	ra,0x4
    1270:	758080e7          	jalr	1880(ra) # 59c4 <fl_fclose>
    1274:	00002097          	auipc	ra,0x2
    1278:	b1c080e7          	jalr	-1252(ra) # 2d90 <display_refresh>
    127c:	000066b7          	lui	a3,0x6
    1280:	4c06a783          	lw	a5,1216(a3) # 64c0 <BUTTONS>
    1284:	0007a703          	lw	a4,0(a5) # ffffc000 <__stacktop+0xfffec000>
    1288:	000027b7          	lui	a5,0x2
    128c:	71078793          	addi	a5,a5,1808 # 2710 <sdcard_init>
    1290:	00000013          	nop
    1294:	fff78793          	addi	a5,a5,-1
    1298:	fe079ce3          	bnez	a5,1290 <view_image_file+0x90>
    129c:	4c06a683          	lw	a3,1216(a3)
    12a0:	fff74793          	not	a5,a4
    12a4:	0006a703          	lw	a4,0(a3)
    12a8:	00e7f7b3          	and	a5,a5,a4
    12ac:	0067f793          	andi	a5,a5,6
    12b0:	fe0788e3          	beqz	a5,12a0 <view_image_file+0xa0>
    12b4:	fffff097          	auipc	ra,0xfffff
    12b8:	ea8080e7          	jalr	-344(ra) # 15c <play_click_noise>
    12bc:	00002097          	auipc	ra,0x2
    12c0:	958080e7          	jalr	-1704(ra) # 2c14 <display_framebuffer>
    12c4:	00004637          	lui	a2,0x4
    12c8:	00000593          	li	a1,0
    12cc:	00001097          	auipc	ra,0x1
    12d0:	6a4080e7          	jalr	1700(ra) # 2970 <memset>
    12d4:	00812403          	lw	s0,8(sp)
    12d8:	00c12083          	lw	ra,12(sp)
    12dc:	01010113          	addi	sp,sp,16
    12e0:	00002317          	auipc	t1,0x2
    12e4:	ab030067          	jr	-1360(t1) # 2d90 <display_refresh>
    12e8:	00c12083          	lw	ra,12(sp)
    12ec:	00812403          	lw	s0,8(sp)
    12f0:	01010113          	addi	sp,sp,16
    12f4:	00008067          	ret

000012f8 <scan_files>:
    12f8:	fd010113          	addi	sp,sp,-48
    12fc:	02912223          	sw	s1,36(sp)
    1300:	000074b7          	lui	s1,0x7
    1304:	02812423          	sw	s0,40(sp)
    1308:	00050593          	mv	a1,a0
    130c:	00007437          	lui	s0,0x7
    1310:	8e448513          	addi	a0,s1,-1820 # 68e4 <current_path>
    1314:	02112623          	sw	ra,44(sp)
    1318:	03212023          	sw	s2,32(sp)
    131c:	01312e23          	sw	s3,28(sp)
    1320:	01412c23          	sw	s4,24(sp)
    1324:	01512a23          	sw	s5,20(sp)
    1328:	01612823          	sw	s6,16(sp)
    132c:	01712623          	sw	s7,12(sp)
    1330:	ac042e23          	sw	zero,-1316(s0) # 6adc <n_items>
    1334:	fffff097          	auipc	ra,0xfffff
    1338:	ce8080e7          	jalr	-792(ra) # 1c <strcmp>
    133c:	06050e63          	beqz	a0,13b8 <scan_files+0xc0>
    1340:	00007937          	lui	s2,0x7
    1344:	06400613          	li	a2,100
    1348:	00000593          	li	a1,0
    134c:	c2890513          	addi	a0,s2,-984 # 6c28 <files>
    1350:	00001097          	auipc	ra,0x1
    1354:	620080e7          	jalr	1568(ra) # 2970 <memset>
    1358:	adc42783          	lw	a5,-1316(s0)
    135c:	c2890913          	addi	s2,s2,-984
    1360:	000065b7          	lui	a1,0x6
    1364:	00379513          	slli	a0,a5,0x3
    1368:	40f50533          	sub	a0,a0,a5
    136c:	00251513          	slli	a0,a0,0x2
    1370:	40f50533          	sub	a0,a0,a5
    1374:	00251513          	slli	a0,a0,0x2
    1378:	00a90533          	add	a0,s2,a0
    137c:	4ec58593          	addi	a1,a1,1260 # 64ec <LEDS+0x1c>
    1380:	00001097          	auipc	ra,0x1
    1384:	6b4080e7          	jalr	1716(ra) # 2a34 <strcpy>
    1388:	adc42703          	lw	a4,-1316(s0)
    138c:	00371793          	slli	a5,a4,0x3
    1390:	40e787b3          	sub	a5,a5,a4
    1394:	00279793          	slli	a5,a5,0x2
    1398:	40e787b3          	sub	a5,a5,a4
    139c:	00279793          	slli	a5,a5,0x2
    13a0:	00f90933          	add	s2,s2,a5
    13a4:	00100793          	li	a5,1
    13a8:	00f70733          	add	a4,a4,a5
    13ac:	06092223          	sw	zero,100(s2)
    13b0:	06f92423          	sw	a5,104(s2)
    13b4:	ace42e23          	sw	a4,-1316(s0)
    13b8:	000079b7          	lui	s3,0x7
    13bc:	c1c98593          	addi	a1,s3,-996 # 6c1c <dirstat.1>
    13c0:	8e448513          	addi	a0,s1,-1820
    13c4:	00003097          	auipc	ra,0x3
    13c8:	680080e7          	jalr	1664(ra) # 4a44 <fl_opendir>
    13cc:	14050063          	beqz	a0,150c <scan_files+0x214>
    13d0:	00007937          	lui	s2,0x7
    13d4:	000067b7          	lui	a5,0x6
    13d8:	000074b7          	lui	s1,0x7
    13dc:	5ac78b93          	addi	s7,a5,1452 # 65ac <LEDS+0xdc>
    13e0:	c2848493          	addi	s1,s1,-984 # 6c28 <files>
    13e4:	b0c90a13          	addi	s4,s2,-1268 # 6b0c <dirent.0>
    13e8:	b0c90593          	addi	a1,s2,-1268
    13ec:	c1c98513          	addi	a0,s3,-996
    13f0:	00004097          	auipc	ra,0x4
    13f4:	d20080e7          	jalr	-736(ra) # 5110 <fl_readdir>
    13f8:	00050a93          	mv	s5,a0
    13fc:	00051863          	bnez	a0,140c <scan_files+0x114>
    1400:	adc42b03          	lw	s6,-1316(s0)
    1404:	03f00793          	li	a5,63
    1408:	0367dc63          	bge	a5,s6,1440 <scan_files+0x148>
    140c:	02812403          	lw	s0,40(sp)
    1410:	02c12083          	lw	ra,44(sp)
    1414:	02412483          	lw	s1,36(sp)
    1418:	02012903          	lw	s2,32(sp)
    141c:	01812a03          	lw	s4,24(sp)
    1420:	01412a83          	lw	s5,20(sp)
    1424:	01012b03          	lw	s6,16(sp)
    1428:	00c12b83          	lw	s7,12(sp)
    142c:	c1c98513          	addi	a0,s3,-996
    1430:	01c12983          	lw	s3,28(sp)
    1434:	03010113          	addi	sp,sp,48
    1438:	00002317          	auipc	t1,0x2
    143c:	1f430067          	jr	500(t1) # 362c <fl_closedir>
    1440:	000b8593          	mv	a1,s7
    1444:	b0c90513          	addi	a0,s2,-1268
    1448:	fffff097          	auipc	ra,0xfffff
    144c:	bd4080e7          	jalr	-1068(ra) # 1c <strcmp>
    1450:	f8050ce3          	beqz	a0,13e8 <scan_files+0xf0>
    1454:	000065b7          	lui	a1,0x6
    1458:	4ec58593          	addi	a1,a1,1260 # 64ec <LEDS+0x1c>
    145c:	b0c90513          	addi	a0,s2,-1268
    1460:	fffff097          	auipc	ra,0xfffff
    1464:	bbc080e7          	jalr	-1092(ra) # 1c <strcmp>
    1468:	f80500e3          	beqz	a0,13e8 <scan_files+0xf0>
    146c:	003b1513          	slli	a0,s6,0x3
    1470:	41650533          	sub	a0,a0,s6
    1474:	00251513          	slli	a0,a0,0x2
    1478:	41650533          	sub	a0,a0,s6
    147c:	00251513          	slli	a0,a0,0x2
    1480:	06400613          	li	a2,100
    1484:	00000593          	li	a1,0
    1488:	00a48533          	add	a0,s1,a0
    148c:	00001097          	auipc	ra,0x1
    1490:	4e4080e7          	jalr	1252(ra) # 2970 <memset>
    1494:	adc42703          	lw	a4,-1316(s0)
    1498:	06300513          	li	a0,99
    149c:	00371793          	slli	a5,a4,0x3
    14a0:	40e786b3          	sub	a3,a5,a4
    14a4:	00269693          	slli	a3,a3,0x2
    14a8:	40e686b3          	sub	a3,a3,a4
    14ac:	00269693          	slli	a3,a3,0x2
    14b0:	014a8633          	add	a2,s5,s4
    14b4:	00064583          	lbu	a1,0(a2) # 4000 <fatfs_compare_names+0xb8>
    14b8:	00058463          	beqz	a1,14c0 <scan_files+0x1c8>
    14bc:	02aa9e63          	bne	s5,a0,14f8 <scan_files+0x200>
    14c0:	40e787b3          	sub	a5,a5,a4
    14c4:	00279793          	slli	a5,a5,0x2
    14c8:	10ca2683          	lw	a3,268(s4)
    14cc:	40e787b3          	sub	a5,a5,a4
    14d0:	00279793          	slli	a5,a5,0x2
    14d4:	00f487b3          	add	a5,s1,a5
    14d8:	06d7a223          	sw	a3,100(a5)
    14dc:	104a4683          	lbu	a3,260(s4)
    14e0:	01578ab3          	add	s5,a5,s5
    14e4:	00170713          	addi	a4,a4,1
    14e8:	000a8023          	sb	zero,0(s5)
    14ec:	06d7a423          	sw	a3,104(a5)
    14f0:	ace42e23          	sw	a4,-1316(s0)
    14f4:	ef5ff06f          	j	13e8 <scan_files+0xf0>
    14f8:	00da8633          	add	a2,s5,a3
    14fc:	00c48633          	add	a2,s1,a2
    1500:	00b60023          	sb	a1,0(a2)
    1504:	001a8a93          	addi	s5,s5,1
    1508:	fa9ff06f          	j	14b0 <scan_files+0x1b8>
    150c:	02c12083          	lw	ra,44(sp)
    1510:	02812403          	lw	s0,40(sp)
    1514:	02412483          	lw	s1,36(sp)
    1518:	02012903          	lw	s2,32(sp)
    151c:	01c12983          	lw	s3,28(sp)
    1520:	01812a03          	lw	s4,24(sp)
    1524:	01412a83          	lw	s5,20(sp)
    1528:	01012b03          	lw	s6,16(sp)
    152c:	00c12b83          	lw	s7,12(sp)
    1530:	03010113          	addi	sp,sp,48
    1534:	00008067          	ret

00001538 <go_up_directory>:
    1538:	ff010113          	addi	sp,sp,-16
    153c:	00812423          	sw	s0,8(sp)
    1540:	00007437          	lui	s0,0x7
    1544:	00112623          	sw	ra,12(sp)
    1548:	00000793          	li	a5,0
    154c:	8e440513          	addi	a0,s0,-1820 # 68e4 <current_path>
    1550:	00a78733          	add	a4,a5,a0
    1554:	00074683          	lbu	a3,0(a4)
    1558:	02069a63          	bnez	a3,158c <go_up_directory+0x54>
    155c:	00100693          	li	a3,1
    1560:	02f6da63          	bge	a3,a5,1594 <go_up_directory+0x5c>
    1564:	02f00593          	li	a1,47
    1568:	fe070fa3          	sb	zero,-1(a4)
    156c:	fffff097          	auipc	ra,0xfffff
    1570:	ad4080e7          	jalr	-1324(ra) # 40 <strrchr>
    1574:	02050063          	beqz	a0,1594 <go_up_directory+0x5c>
    1578:	000500a3          	sb	zero,1(a0)
    157c:	00c12083          	lw	ra,12(sp)
    1580:	00812403          	lw	s0,8(sp)
    1584:	01010113          	addi	sp,sp,16
    1588:	00008067          	ret
    158c:	00178793          	addi	a5,a5,1
    1590:	fc1ff06f          	j	1550 <go_up_directory+0x18>
    1594:	8e440513          	addi	a0,s0,-1820
    1598:	00812403          	lw	s0,8(sp)
    159c:	00c12083          	lw	ra,12(sp)
    15a0:	000065b7          	lui	a1,0x6
    15a4:	5b058593          	addi	a1,a1,1456 # 65b0 <LEDS+0xe0>
    15a8:	01010113          	addi	sp,sp,16
    15ac:	00001317          	auipc	t1,0x1
    15b0:	48830067          	jr	1160(t1) # 2a34 <strcpy>

000015b4 <build_full_path>:
    15b4:	ff010113          	addi	sp,sp,-16
    15b8:	00912223          	sw	s1,4(sp)
    15bc:	00058493          	mv	s1,a1
    15c0:	000075b7          	lui	a1,0x7
    15c4:	8e458593          	addi	a1,a1,-1820 # 68e4 <current_path>
    15c8:	00812423          	sw	s0,8(sp)
    15cc:	00112623          	sw	ra,12(sp)
    15d0:	00050413          	mv	s0,a0
    15d4:	00001097          	auipc	ra,0x1
    15d8:	460080e7          	jalr	1120(ra) # 2a34 <strcpy>
    15dc:	00044783          	lbu	a5,0(s0)
    15e0:	02079263          	bnez	a5,1604 <build_full_path+0x50>
    15e4:	0004c783          	lbu	a5,0(s1)
    15e8:	02079263          	bnez	a5,160c <build_full_path+0x58>
    15ec:	00040023          	sb	zero,0(s0)
    15f0:	00c12083          	lw	ra,12(sp)
    15f4:	00812403          	lw	s0,8(sp)
    15f8:	00412483          	lw	s1,4(sp)
    15fc:	01010113          	addi	sp,sp,16
    1600:	00008067          	ret
    1604:	00140413          	addi	s0,s0,1
    1608:	fd5ff06f          	j	15dc <build_full_path+0x28>
    160c:	00140413          	addi	s0,s0,1
    1610:	00148493          	addi	s1,s1,1
    1614:	fef40fa3          	sb	a5,-1(s0)
    1618:	fcdff06f          	j	15e4 <build_full_path+0x30>

0000161c <file_explorer>:
    161c:	db010113          	addi	sp,sp,-592
    1620:	24112623          	sw	ra,588(sp)
    1624:	24812423          	sw	s0,584(sp)
    1628:	25212023          	sw	s2,576(sp)
    162c:	23312e23          	sw	s3,572(sp)
    1630:	23512a23          	sw	s5,564(sp)
    1634:	23612823          	sw	s6,560(sp)
    1638:	23912223          	sw	s9,548(sp)
    163c:	24912223          	sw	s1,580(sp)
    1640:	23412c23          	sw	s4,568(sp)
    1644:	23712623          	sw	s7,556(sp)
    1648:	23812423          	sw	s8,552(sp)
    164c:	23a12023          	sw	s10,544(sp)
    1650:	21b12e23          	sw	s11,540(sp)
    1654:	00001097          	auipc	ra,0x1
    1658:	5c0080e7          	jalr	1472(ra) # 2c14 <display_framebuffer>
    165c:	00004637          	lui	a2,0x4
    1660:	00000593          	li	a1,0
    1664:	00001097          	auipc	ra,0x1
    1668:	30c080e7          	jalr	780(ra) # 2970 <memset>
    166c:	00001097          	auipc	ra,0x1
    1670:	724080e7          	jalr	1828(ra) # 2d90 <display_refresh>
    1674:	00006b37          	lui	s6,0x6
    1678:	00007ab7          	lui	s5,0x7
    167c:	5b0b0593          	addi	a1,s6,1456 # 65b0 <LEDS+0xe0>
    1680:	8e4a8513          	addi	a0,s5,-1820 # 68e4 <current_path>
    1684:	00001097          	auipc	ra,0x1
    1688:	3b0080e7          	jalr	944(ra) # 2a34 <strcpy>
    168c:	5b0b0513          	addi	a0,s6,1456
    1690:	00000097          	auipc	ra,0x0
    1694:	c68080e7          	jalr	-920(ra) # 12f8 <scan_files>
    1698:	000067b7          	lui	a5,0x6
    169c:	5b478793          	addi	a5,a5,1460 # 65b4 <LEDS+0xe4>
    16a0:	00f12623          	sw	a5,12(sp)
    16a4:	000067b7          	lui	a5,0x6
    16a8:	4c07a783          	lw	a5,1216(a5) # 64c0 <BUTTONS>
    16ac:	00000c93          	li	s9,0
    16b0:	00000993          	li	s3,0
    16b4:	00000913          	li	s2,0
    16b8:	00000413          	li	s0,0
    16bc:	8e4a8a93          	addi	s5,s5,-1820
    16c0:	00f12023          	sw	a5,0(sp)
    16c4:	00000593          	li	a1,0
    16c8:	00000513          	li	a0,0
    16cc:	00001097          	auipc	ra,0x1
    16d0:	554080e7          	jalr	1364(ra) # 2c20 <display_set_cursor>
    16d4:	0ffcf593          	zext.b	a1,s9
    16d8:	07f58513          	addi	a0,a1,127
    16dc:	0ff57513          	zext.b	a0,a0
    16e0:	00001097          	auipc	ra,0x1
    16e4:	554080e7          	jalr	1364(ra) # 2c34 <display_set_front_back_color>
    16e8:	00c12503          	lw	a0,12(sp)
    16ec:	00000493          	li	s1,0
    16f0:	00007c37          	lui	s8,0x7
    16f4:	00002097          	auipc	ra,0x2
    16f8:	808080e7          	jalr	-2040(ra) # 2efc <printf>
    16fc:	00c00a13          	li	s4,12
    1700:	015487b3          	add	a5,s1,s5
    1704:	0007c503          	lbu	a0,0(a5)
    1708:	00050a63          	beqz	a0,171c <file_explorer+0x100>
    170c:	af0c2783          	lw	a5,-1296(s8) # 6af0 <f_putchar>
    1710:	00148493          	addi	s1,s1,1
    1714:	000780e7          	jalr	a5
    1718:	ff4494e3          	bne	s1,s4,1700 <file_explorer+0xe4>
    171c:	af0c2783          	lw	a5,-1296(s8)
    1720:	00a00513          	li	a0,10
    1724:	00007db7          	lui	s11,0x7
    1728:	000780e7          	jalr	a5
    172c:	00000593          	li	a1,0
    1730:	0ff00513          	li	a0,255
    1734:	00001097          	auipc	ra,0x1
    1738:	500080e7          	jalr	1280(ra) # 2c34 <display_set_front_back_color>
    173c:	adcdaa03          	lw	s4,-1316(s11) # 6adc <n_items>
    1740:	080a0463          	beqz	s4,17c8 <file_explorer+0x1ac>
    1744:	412a0a33          	sub	s4,s4,s2
    1748:	00f00793          	li	a5,15
    174c:	0147d463          	bge	a5,s4,1754 <file_explorer+0x138>
    1750:	00078a13          	mv	s4,a5
    1754:	00391493          	slli	s1,s2,0x3
    1758:	412484b3          	sub	s1,s1,s2
    175c:	00249493          	slli	s1,s1,0x2
    1760:	412484b3          	sub	s1,s1,s2
    1764:	000077b7          	lui	a5,0x7
    1768:	c2878793          	addi	a5,a5,-984 # 6c28 <files>
    176c:	00249493          	slli	s1,s1,0x2
    1770:	00f484b3          	add	s1,s1,a5
    1774:	000067b7          	lui	a5,0x6
    1778:	5d078793          	addi	a5,a5,1488 # 65d0 <LEDS+0x100>
    177c:	00f12223          	sw	a5,4(sp)
    1780:	000067b7          	lui	a5,0x6
    1784:	5c878793          	addi	a5,a5,1480 # 65c8 <LEDS+0xf8>
    1788:	00000b93          	li	s7,0
    178c:	00f12423          	sw	a5,8(sp)
    1790:	194bc863          	blt	s7,s4,1920 <file_explorer+0x304>
    1794:	00000593          	li	a1,0
    1798:	00000513          	li	a0,0
    179c:	000064b7          	lui	s1,0x6
    17a0:	00001097          	auipc	ra,0x1
    17a4:	494080e7          	jalr	1172(ra) # 2c34 <display_set_front_back_color>
    17a8:	00f00b93          	li	s7,15
    17ac:	5d848493          	addi	s1,s1,1496 # 65d8 <LEDS+0x108>
    17b0:	037a0463          	beq	s4,s7,17d8 <file_explorer+0x1bc>
    17b4:	00048513          	mv	a0,s1
    17b8:	00001097          	auipc	ra,0x1
    17bc:	744080e7          	jalr	1860(ra) # 2efc <printf>
    17c0:	001a0a13          	addi	s4,s4,1
    17c4:	fedff06f          	j	17b0 <file_explorer+0x194>
    17c8:	00006537          	lui	a0,0x6
    17cc:	5c050513          	addi	a0,a0,1472 # 65c0 <LEDS+0xf0>
    17d0:	00001097          	auipc	ra,0x1
    17d4:	72c080e7          	jalr	1836(ra) # 2efc <printf>
    17d8:	00001097          	auipc	ra,0x1
    17dc:	5b8080e7          	jalr	1464(ra) # 2d90 <display_refresh>
    17e0:	00012783          	lw	a5,0(sp)
    17e4:	fff9c993          	not	s3,s3
    17e8:	0007aa03          	lw	s4,0(a5)
    17ec:	0149f9b3          	and	s3,s3,s4
    17f0:	0109f793          	andi	a5,s3,16
    17f4:	00078863          	beqz	a5,1804 <file_explorer+0x1e8>
    17f8:	00140413          	addi	s0,s0,1
    17fc:	fffff097          	auipc	ra,0xfffff
    1800:	960080e7          	jalr	-1696(ra) # 15c <play_click_noise>
    1804:	0089f793          	andi	a5,s3,8
    1808:	00078863          	beqz	a5,1818 <file_explorer+0x1fc>
    180c:	fff40413          	addi	s0,s0,-1
    1810:	fffff097          	auipc	ra,0xfffff
    1814:	94c080e7          	jalr	-1716(ra) # 15c <play_click_noise>
    1818:	0029f793          	andi	a5,s3,2
    181c:	04078a63          	beqz	a5,1870 <file_explorer+0x254>
    1820:	fffff097          	auipc	ra,0xfffff
    1824:	93c080e7          	jalr	-1732(ra) # 15c <play_click_noise>
    1828:	5b0b0593          	addi	a1,s6,1456
    182c:	000a8513          	mv	a0,s5
    1830:	ffffe097          	auipc	ra,0xffffe
    1834:	7ec080e7          	jalr	2028(ra) # 1c <strcmp>
    1838:	20050e63          	beqz	a0,1a54 <file_explorer+0x438>
    183c:	00000097          	auipc	ra,0x0
    1840:	cfc080e7          	jalr	-772(ra) # 1538 <go_up_directory>
    1844:	5b0b0513          	addi	a0,s6,1456
    1848:	00000097          	auipc	ra,0x0
    184c:	ab0080e7          	jalr	-1360(ra) # 12f8 <scan_files>
    1850:	00001097          	auipc	ra,0x1
    1854:	3c4080e7          	jalr	964(ra) # 2c14 <display_framebuffer>
    1858:	00004637          	lui	a2,0x4
    185c:	00000593          	li	a1,0
    1860:	00001097          	auipc	ra,0x1
    1864:	110080e7          	jalr	272(ra) # 2970 <memset>
    1868:	00000913          	li	s2,0
    186c:	00000413          	li	s0,0
    1870:	0049f993          	andi	s3,s3,4
    1874:	007c8c93          	addi	s9,s9,7
    1878:	08098063          	beqz	s3,18f8 <file_explorer+0x2dc>
    187c:	00341493          	slli	s1,s0,0x3
    1880:	408484b3          	sub	s1,s1,s0
    1884:	fffff097          	auipc	ra,0xfffff
    1888:	8d8080e7          	jalr	-1832(ra) # 15c <play_click_noise>
    188c:	00249493          	slli	s1,s1,0x2
    1890:	408484b3          	sub	s1,s1,s0
    1894:	000077b7          	lui	a5,0x7
    1898:	c2878793          	addi	a5,a5,-984 # 6c28 <files>
    189c:	00249493          	slli	s1,s1,0x2
    18a0:	00f484b3          	add	s1,s1,a5
    18a4:	0684a783          	lw	a5,104(s1)
    18a8:	12078a63          	beqz	a5,19dc <file_explorer+0x3c0>
    18ac:	000065b7          	lui	a1,0x6
    18b0:	4ec58593          	addi	a1,a1,1260 # 64ec <LEDS+0x1c>
    18b4:	00048513          	mv	a0,s1
    18b8:	ffffe097          	auipc	ra,0xffffe
    18bc:	764080e7          	jalr	1892(ra) # 1c <strcmp>
    18c0:	10051263          	bnez	a0,19c4 <file_explorer+0x3a8>
    18c4:	00000097          	auipc	ra,0x0
    18c8:	c74080e7          	jalr	-908(ra) # 1538 <go_up_directory>
    18cc:	5b0b0513          	addi	a0,s6,1456
    18d0:	00000097          	auipc	ra,0x0
    18d4:	a28080e7          	jalr	-1496(ra) # 12f8 <scan_files>
    18d8:	00001097          	auipc	ra,0x1
    18dc:	33c080e7          	jalr	828(ra) # 2c14 <display_framebuffer>
    18e0:	00004637          	lui	a2,0x4
    18e4:	00000593          	li	a1,0
    18e8:	00001097          	auipc	ra,0x1
    18ec:	088080e7          	jalr	136(ra) # 2970 <memset>
    18f0:	00000913          	li	s2,0
    18f4:	00000413          	li	s0,0
    18f8:	adcda783          	lw	a5,-1316(s11)
    18fc:	00f05e63          	blez	a5,1918 <file_explorer+0x2fc>
    1900:	12045e63          	bgez	s0,1a3c <file_explorer+0x420>
    1904:	fff78413          	addi	s0,a5,-1
    1908:	15244263          	blt	s0,s2,1a4c <file_explorer+0x430>
    190c:	00e90793          	addi	a5,s2,14
    1910:	0087d463          	bge	a5,s0,1918 <file_explorer+0x2fc>
    1914:	ff240913          	addi	s2,s0,-14
    1918:	000a0993          	mv	s3,s4
    191c:	da9ff06f          	j	16c4 <file_explorer+0xa8>
    1920:	012b8d33          	add	s10,s7,s2
    1924:	07a41463          	bne	s0,s10,198c <file_explorer+0x370>
    1928:	0ff00593          	li	a1,255
    192c:	00000513          	li	a0,0
    1930:	00001097          	auipc	ra,0x1
    1934:	304080e7          	jalr	772(ra) # 2c34 <display_set_front_back_color>
    1938:	0684a783          	lw	a5,104(s1)
    193c:	000d0593          	mv	a1,s10
    1940:	04078c63          	beqz	a5,1998 <file_explorer+0x37c>
    1944:	00812503          	lw	a0,8(sp)
    1948:	00001097          	auipc	ra,0x1
    194c:	5b4080e7          	jalr	1460(ra) # 2efc <printf>
    1950:	00000d13          	li	s10,0
    1954:	01a487b3          	add	a5,s1,s10
    1958:	0007c503          	lbu	a0,0(a5)
    195c:	00050c63          	beqz	a0,1974 <file_explorer+0x358>
    1960:	af0c2783          	lw	a5,-1296(s8)
    1964:	001d0d13          	addi	s10,s10,1
    1968:	000780e7          	jalr	a5
    196c:	01200793          	li	a5,18
    1970:	fefd12e3          	bne	s10,a5,1954 <file_explorer+0x338>
    1974:	af0c2783          	lw	a5,-1296(s8)
    1978:	00a00513          	li	a0,10
    197c:	001b8b93          	addi	s7,s7,1
    1980:	000780e7          	jalr	a5
    1984:	06c48493          	addi	s1,s1,108
    1988:	e09ff06f          	j	1790 <file_explorer+0x174>
    198c:	00000593          	li	a1,0
    1990:	0ff00513          	li	a0,255
    1994:	f9dff06f          	j	1930 <file_explorer+0x314>
    1998:	00412503          	lw	a0,4(sp)
    199c:	fadff06f          	j	1948 <file_explorer+0x32c>
    19a0:	00178793          	addi	a5,a5,1
    19a4:	0007c703          	lbu	a4,0(a5)
    19a8:	fe071ce3          	bnez	a4,19a0 <file_explorer+0x384>
    19ac:	0004c703          	lbu	a4,0(s1)
    19b0:	00071e63          	bnez	a4,19cc <file_explorer+0x3b0>
    19b4:	02f00713          	li	a4,47
    19b8:	00e78023          	sb	a4,0(a5)
    19bc:	000780a3          	sb	zero,1(a5)
    19c0:	f0dff06f          	j	18cc <file_explorer+0x2b0>
    19c4:	000a8793          	mv	a5,s5
    19c8:	fddff06f          	j	19a4 <file_explorer+0x388>
    19cc:	00178793          	addi	a5,a5,1
    19d0:	00148493          	addi	s1,s1,1
    19d4:	fee78fa3          	sb	a4,-1(a5)
    19d8:	fd5ff06f          	j	19ac <file_explorer+0x390>
    19dc:	00048593          	mv	a1,s1
    19e0:	01c10513          	addi	a0,sp,28
    19e4:	00000097          	auipc	ra,0x0
    19e8:	bd0080e7          	jalr	-1072(ra) # 15b4 <build_full_path>
    19ec:	0644a603          	lw	a2,100(s1)
    19f0:	000047b7          	lui	a5,0x4
    19f4:	02f61a63          	bne	a2,a5,1a28 <file_explorer+0x40c>
    19f8:	01c10513          	addi	a0,sp,28
    19fc:	00000097          	auipc	ra,0x0
    1a00:	804080e7          	jalr	-2044(ra) # 1200 <view_image_file>
    1a04:	00001097          	auipc	ra,0x1
    1a08:	210080e7          	jalr	528(ra) # 2c14 <display_framebuffer>
    1a0c:	00004637          	lui	a2,0x4
    1a10:	00000593          	li	a1,0
    1a14:	00001097          	auipc	ra,0x1
    1a18:	f5c080e7          	jalr	-164(ra) # 2970 <memset>
    1a1c:	00012783          	lw	a5,0(sp)
    1a20:	0007a783          	lw	a5,0(a5) # 4000 <fatfs_compare_names+0xb8>
    1a24:	ed5ff06f          	j	18f8 <file_explorer+0x2dc>
    1a28:	00048593          	mv	a1,s1
    1a2c:	01c10513          	addi	a0,sp,28
    1a30:	fffff097          	auipc	ra,0xfffff
    1a34:	e5c080e7          	jalr	-420(ra) # 88c <play_music_with_controls>
    1a38:	fcdff06f          	j	1a04 <file_explorer+0x3e8>
    1a3c:	00f427b3          	slt	a5,s0,a5
    1a40:	40f007b3          	neg	a5,a5
    1a44:	00f47433          	and	s0,s0,a5
    1a48:	ec1ff06f          	j	1908 <file_explorer+0x2ec>
    1a4c:	00040913          	mv	s2,s0
    1a50:	ec9ff06f          	j	1918 <file_explorer+0x2fc>
    1a54:	24c12083          	lw	ra,588(sp)
    1a58:	24812403          	lw	s0,584(sp)
    1a5c:	24412483          	lw	s1,580(sp)
    1a60:	24012903          	lw	s2,576(sp)
    1a64:	23c12983          	lw	s3,572(sp)
    1a68:	23812a03          	lw	s4,568(sp)
    1a6c:	23412a83          	lw	s5,564(sp)
    1a70:	23012b03          	lw	s6,560(sp)
    1a74:	22c12b83          	lw	s7,556(sp)
    1a78:	22812c03          	lw	s8,552(sp)
    1a7c:	22412c83          	lw	s9,548(sp)
    1a80:	22012d03          	lw	s10,544(sp)
    1a84:	21c12d83          	lw	s11,540(sp)
    1a88:	25010113          	addi	sp,sp,592
    1a8c:	00008067          	ret

00001a90 <music_player_generic>:
    1a90:	da010113          	addi	sp,sp,-608
    1a94:	24112e23          	sw	ra,604(sp)
    1a98:	24812c23          	sw	s0,600(sp)
    1a9c:	25212823          	sw	s2,592(sp)
    1aa0:	25312623          	sw	s3,588(sp)
    1aa4:	25512223          	sw	s5,580(sp)
    1aa8:	23912a23          	sw	s9,564(sp)
    1aac:	24912a23          	sw	s1,596(sp)
    1ab0:	25412423          	sw	s4,584(sp)
    1ab4:	25612023          	sw	s6,576(sp)
    1ab8:	23712e23          	sw	s7,572(sp)
    1abc:	23812c23          	sw	s8,568(sp)
    1ac0:	23a12823          	sw	s10,560(sp)
    1ac4:	23b12623          	sw	s11,556(sp)
    1ac8:	00a12823          	sw	a0,16(sp)
    1acc:	00001097          	auipc	ra,0x1
    1ad0:	148080e7          	jalr	328(ra) # 2c14 <display_framebuffer>
    1ad4:	00004637          	lui	a2,0x4
    1ad8:	00000593          	li	a1,0
    1adc:	00001097          	auipc	ra,0x1
    1ae0:	e94080e7          	jalr	-364(ra) # 2970 <memset>
    1ae4:	00001097          	auipc	ra,0x1
    1ae8:	2ac080e7          	jalr	684(ra) # 2d90 <display_refresh>
    1aec:	00006ab7          	lui	s5,0x6
    1af0:	000079b7          	lui	s3,0x7
    1af4:	5f0a8593          	addi	a1,s5,1520 # 65f0 <LEDS+0x120>
    1af8:	8e498513          	addi	a0,s3,-1820 # 68e4 <current_path>
    1afc:	00001097          	auipc	ra,0x1
    1b00:	f38080e7          	jalr	-200(ra) # 2a34 <strcpy>
    1b04:	5f0a8513          	addi	a0,s5,1520
    1b08:	fffff097          	auipc	ra,0xfffff
    1b0c:	7f0080e7          	jalr	2032(ra) # 12f8 <scan_files>
    1b10:	000067b7          	lui	a5,0x6
    1b14:	60878793          	addi	a5,a5,1544 # 6608 <LEDS+0x138>
    1b18:	00f12e23          	sw	a5,28(sp)
    1b1c:	000067b7          	lui	a5,0x6
    1b20:	4c07a783          	lw	a5,1216(a5) # 64c0 <BUTTONS>
    1b24:	00000c93          	li	s9,0
    1b28:	00012423          	sw	zero,8(sp)
    1b2c:	00000913          	li	s2,0
    1b30:	00000413          	li	s0,0
    1b34:	00f12623          	sw	a5,12(sp)
    1b38:	00000593          	li	a1,0
    1b3c:	00000513          	li	a0,0
    1b40:	00001097          	auipc	ra,0x1
    1b44:	0e0080e7          	jalr	224(ra) # 2c20 <display_set_cursor>
    1b48:	0ffcf593          	zext.b	a1,s9
    1b4c:	07f58513          	addi	a0,a1,127
    1b50:	0ff57513          	zext.b	a0,a0
    1b54:	00001097          	auipc	ra,0x1
    1b58:	0e0080e7          	jalr	224(ra) # 2c34 <display_set_front_back_color>
    1b5c:	01012783          	lw	a5,16(sp)
    1b60:	0e078663          	beqz	a5,1c4c <music_player_generic+0x1bc>
    1b64:	00006537          	lui	a0,0x6
    1b68:	5fc50513          	addi	a0,a0,1532 # 65fc <LEDS+0x12c>
    1b6c:	00001097          	auipc	ra,0x1
    1b70:	390080e7          	jalr	912(ra) # 2efc <printf>
    1b74:	00000493          	li	s1,0
    1b78:	8e498d93          	addi	s11,s3,-1820
    1b7c:	00007c37          	lui	s8,0x7
    1b80:	00c00a13          	li	s4,12
    1b84:	01b487b3          	add	a5,s1,s11
    1b88:	0007c503          	lbu	a0,0(a5)
    1b8c:	00050a63          	beqz	a0,1ba0 <music_player_generic+0x110>
    1b90:	af0c2783          	lw	a5,-1296(s8) # 6af0 <f_putchar>
    1b94:	00148493          	addi	s1,s1,1
    1b98:	000780e7          	jalr	a5
    1b9c:	ff4494e3          	bne	s1,s4,1b84 <music_player_generic+0xf4>
    1ba0:	af0c2783          	lw	a5,-1296(s8)
    1ba4:	00a00513          	li	a0,10
    1ba8:	00007b37          	lui	s6,0x7
    1bac:	000780e7          	jalr	a5
    1bb0:	00000593          	li	a1,0
    1bb4:	0ff00513          	li	a0,255
    1bb8:	00001097          	auipc	ra,0x1
    1bbc:	07c080e7          	jalr	124(ra) # 2c34 <display_set_front_back_color>
    1bc0:	adcb2a03          	lw	s4,-1316(s6) # 6adc <n_items>
    1bc4:	080a0863          	beqz	s4,1c54 <music_player_generic+0x1c4>
    1bc8:	412a0a33          	sub	s4,s4,s2
    1bcc:	00f00793          	li	a5,15
    1bd0:	0147d463          	bge	a5,s4,1bd8 <music_player_generic+0x148>
    1bd4:	00078a13          	mv	s4,a5
    1bd8:	00391493          	slli	s1,s2,0x3
    1bdc:	412484b3          	sub	s1,s1,s2
    1be0:	00249493          	slli	s1,s1,0x2
    1be4:	412484b3          	sub	s1,s1,s2
    1be8:	000077b7          	lui	a5,0x7
    1bec:	c2878793          	addi	a5,a5,-984 # 6c28 <files>
    1bf0:	00249493          	slli	s1,s1,0x2
    1bf4:	00f484b3          	add	s1,s1,a5
    1bf8:	000067b7          	lui	a5,0x6
    1bfc:	5d078793          	addi	a5,a5,1488 # 65d0 <LEDS+0x100>
    1c00:	00f12a23          	sw	a5,20(sp)
    1c04:	000067b7          	lui	a5,0x6
    1c08:	5c878793          	addi	a5,a5,1480 # 65c8 <LEDS+0xf8>
    1c0c:	00000b93          	li	s7,0
    1c10:	00f12c23          	sw	a5,24(sp)
    1c14:	1f4bc463          	blt	s7,s4,1dfc <music_player_generic+0x36c>
    1c18:	00000593          	li	a1,0
    1c1c:	00000513          	li	a0,0
    1c20:	000064b7          	lui	s1,0x6
    1c24:	00001097          	auipc	ra,0x1
    1c28:	010080e7          	jalr	16(ra) # 2c34 <display_set_front_back_color>
    1c2c:	00f00b93          	li	s7,15
    1c30:	5d848493          	addi	s1,s1,1496 # 65d8 <LEDS+0x108>
    1c34:	037a0863          	beq	s4,s7,1c64 <music_player_generic+0x1d4>
    1c38:	00048513          	mv	a0,s1
    1c3c:	00001097          	auipc	ra,0x1
    1c40:	2c0080e7          	jalr	704(ra) # 2efc <printf>
    1c44:	001a0a13          	addi	s4,s4,1
    1c48:	fedff06f          	j	1c34 <music_player_generic+0x1a4>
    1c4c:	01c12503          	lw	a0,28(sp)
    1c50:	f1dff06f          	j	1b6c <music_player_generic+0xdc>
    1c54:	00006537          	lui	a0,0x6
    1c58:	5c050513          	addi	a0,a0,1472 # 65c0 <LEDS+0xf0>
    1c5c:	00001097          	auipc	ra,0x1
    1c60:	2a0080e7          	jalr	672(ra) # 2efc <printf>
    1c64:	00001097          	auipc	ra,0x1
    1c68:	12c080e7          	jalr	300(ra) # 2d90 <display_refresh>
    1c6c:	00c12783          	lw	a5,12(sp)
    1c70:	0007a483          	lw	s1,0(a5)
    1c74:	00812783          	lw	a5,8(sp)
    1c78:	fff7ca13          	not	s4,a5
    1c7c:	009a7a33          	and	s4,s4,s1
    1c80:	010a7793          	andi	a5,s4,16
    1c84:	00078863          	beqz	a5,1c94 <music_player_generic+0x204>
    1c88:	00140413          	addi	s0,s0,1
    1c8c:	ffffe097          	auipc	ra,0xffffe
    1c90:	4d0080e7          	jalr	1232(ra) # 15c <play_click_noise>
    1c94:	008a7793          	andi	a5,s4,8
    1c98:	00078863          	beqz	a5,1ca8 <music_player_generic+0x218>
    1c9c:	fff40413          	addi	s0,s0,-1
    1ca0:	ffffe097          	auipc	ra,0xffffe
    1ca4:	4bc080e7          	jalr	1212(ra) # 15c <play_click_noise>
    1ca8:	002a7793          	andi	a5,s4,2
    1cac:	06078c63          	beqz	a5,1d24 <music_player_generic+0x294>
    1cb0:	ffffe097          	auipc	ra,0xffffe
    1cb4:	4ac080e7          	jalr	1196(ra) # 15c <play_click_noise>
    1cb8:	5f0a8593          	addi	a1,s5,1520
    1cbc:	8e498513          	addi	a0,s3,-1820
    1cc0:	ffffe097          	auipc	ra,0xffffe
    1cc4:	35c080e7          	jalr	860(ra) # 1c <strcmp>
    1cc8:	2e050c63          	beqz	a0,1fc0 <music_player_generic+0x530>
    1ccc:	00000097          	auipc	ra,0x0
    1cd0:	86c080e7          	jalr	-1940(ra) # 1538 <go_up_directory>
    1cd4:	5f0a8593          	addi	a1,s5,1520
    1cd8:	8e498513          	addi	a0,s3,-1820
    1cdc:	ffffe097          	auipc	ra,0xffffe
    1ce0:	388080e7          	jalr	904(ra) # 64 <starts_with>
    1ce4:	00051a63          	bnez	a0,1cf8 <music_player_generic+0x268>
    1ce8:	5f0a8593          	addi	a1,s5,1520
    1cec:	8e498513          	addi	a0,s3,-1820
    1cf0:	00001097          	auipc	ra,0x1
    1cf4:	d44080e7          	jalr	-700(ra) # 2a34 <strcpy>
    1cf8:	8e498513          	addi	a0,s3,-1820
    1cfc:	fffff097          	auipc	ra,0xfffff
    1d00:	5fc080e7          	jalr	1532(ra) # 12f8 <scan_files>
    1d04:	00001097          	auipc	ra,0x1
    1d08:	f10080e7          	jalr	-240(ra) # 2c14 <display_framebuffer>
    1d0c:	00004637          	lui	a2,0x4
    1d10:	00000593          	li	a1,0
    1d14:	00001097          	auipc	ra,0x1
    1d18:	c5c080e7          	jalr	-932(ra) # 2970 <memset>
    1d1c:	00000913          	li	s2,0
    1d20:	00000413          	li	s0,0
    1d24:	004a7a13          	andi	s4,s4,4
    1d28:	007c8c93          	addi	s9,s9,7
    1d2c:	0a0a0463          	beqz	s4,1dd4 <music_player_generic+0x344>
    1d30:	ffffe097          	auipc	ra,0xffffe
    1d34:	42c080e7          	jalr	1068(ra) # 15c <play_click_noise>
    1d38:	00341793          	slli	a5,s0,0x3
    1d3c:	408787b3          	sub	a5,a5,s0
    1d40:	00279793          	slli	a5,a5,0x2
    1d44:	00007a37          	lui	s4,0x7
    1d48:	408787b3          	sub	a5,a5,s0
    1d4c:	c28a0a13          	addi	s4,s4,-984 # 6c28 <files>
    1d50:	00279793          	slli	a5,a5,0x2
    1d54:	00fa07b3          	add	a5,s4,a5
    1d58:	0687a703          	lw	a4,104(a5)
    1d5c:	14070e63          	beqz	a4,1eb8 <music_player_generic+0x428>
    1d60:	000065b7          	lui	a1,0x6
    1d64:	4ec58593          	addi	a1,a1,1260 # 64ec <LEDS+0x1c>
    1d68:	00078513          	mv	a0,a5
    1d6c:	00078413          	mv	s0,a5
    1d70:	ffffe097          	auipc	ra,0xffffe
    1d74:	2ac080e7          	jalr	684(ra) # 1c <strcmp>
    1d78:	12051463          	bnez	a0,1ea0 <music_player_generic+0x410>
    1d7c:	fffff097          	auipc	ra,0xfffff
    1d80:	7bc080e7          	jalr	1980(ra) # 1538 <go_up_directory>
    1d84:	5f0a8593          	addi	a1,s5,1520
    1d88:	8e498513          	addi	a0,s3,-1820
    1d8c:	ffffe097          	auipc	ra,0xffffe
    1d90:	2d8080e7          	jalr	728(ra) # 64 <starts_with>
    1d94:	00051a63          	bnez	a0,1da8 <music_player_generic+0x318>
    1d98:	5f0a8593          	addi	a1,s5,1520
    1d9c:	8e498513          	addi	a0,s3,-1820
    1da0:	00001097          	auipc	ra,0x1
    1da4:	c94080e7          	jalr	-876(ra) # 2a34 <strcpy>
    1da8:	8e498513          	addi	a0,s3,-1820
    1dac:	fffff097          	auipc	ra,0xfffff
    1db0:	54c080e7          	jalr	1356(ra) # 12f8 <scan_files>
    1db4:	00001097          	auipc	ra,0x1
    1db8:	e60080e7          	jalr	-416(ra) # 2c14 <display_framebuffer>
    1dbc:	00004637          	lui	a2,0x4
    1dc0:	00000593          	li	a1,0
    1dc4:	00001097          	auipc	ra,0x1
    1dc8:	bac080e7          	jalr	-1108(ra) # 2970 <memset>
    1dcc:	00000913          	li	s2,0
    1dd0:	00000413          	li	s0,0
    1dd4:	adcb2783          	lw	a5,-1316(s6)
    1dd8:	00f05e63          	blez	a5,1df4 <music_player_generic+0x364>
    1ddc:	1c045663          	bgez	s0,1fa8 <music_player_generic+0x518>
    1de0:	fff78413          	addi	s0,a5,-1
    1de4:	1d244a63          	blt	s0,s2,1fb8 <music_player_generic+0x528>
    1de8:	00e90793          	addi	a5,s2,14
    1dec:	0087d463          	bge	a5,s0,1df4 <music_player_generic+0x364>
    1df0:	ff240913          	addi	s2,s0,-14
    1df4:	00912423          	sw	s1,8(sp)
    1df8:	d41ff06f          	j	1b38 <music_player_generic+0xa8>
    1dfc:	012b8d33          	add	s10,s7,s2
    1e00:	07a41463          	bne	s0,s10,1e68 <music_player_generic+0x3d8>
    1e04:	0ff00593          	li	a1,255
    1e08:	00000513          	li	a0,0
    1e0c:	00001097          	auipc	ra,0x1
    1e10:	e28080e7          	jalr	-472(ra) # 2c34 <display_set_front_back_color>
    1e14:	0684a783          	lw	a5,104(s1)
    1e18:	000d0593          	mv	a1,s10
    1e1c:	04078c63          	beqz	a5,1e74 <music_player_generic+0x3e4>
    1e20:	01812503          	lw	a0,24(sp)
    1e24:	00001097          	auipc	ra,0x1
    1e28:	0d8080e7          	jalr	216(ra) # 2efc <printf>
    1e2c:	00000d13          	li	s10,0
    1e30:	01a487b3          	add	a5,s1,s10
    1e34:	0007c503          	lbu	a0,0(a5)
    1e38:	00050c63          	beqz	a0,1e50 <music_player_generic+0x3c0>
    1e3c:	af0c2783          	lw	a5,-1296(s8)
    1e40:	001d0d13          	addi	s10,s10,1
    1e44:	000780e7          	jalr	a5
    1e48:	01200793          	li	a5,18
    1e4c:	fefd12e3          	bne	s10,a5,1e30 <music_player_generic+0x3a0>
    1e50:	af0c2783          	lw	a5,-1296(s8)
    1e54:	00a00513          	li	a0,10
    1e58:	001b8b93          	addi	s7,s7,1
    1e5c:	000780e7          	jalr	a5
    1e60:	06c48493          	addi	s1,s1,108
    1e64:	db1ff06f          	j	1c14 <music_player_generic+0x184>
    1e68:	00000593          	li	a1,0
    1e6c:	0ff00513          	li	a0,255
    1e70:	f9dff06f          	j	1e0c <music_player_generic+0x37c>
    1e74:	01412503          	lw	a0,20(sp)
    1e78:	fadff06f          	j	1e24 <music_player_generic+0x394>
    1e7c:	00178793          	addi	a5,a5,1
    1e80:	0007c703          	lbu	a4,0(a5)
    1e84:	fe071ce3          	bnez	a4,1e7c <music_player_generic+0x3ec>
    1e88:	00044703          	lbu	a4,0(s0)
    1e8c:	00071e63          	bnez	a4,1ea8 <music_player_generic+0x418>
    1e90:	02f00713          	li	a4,47
    1e94:	00e78023          	sb	a4,0(a5)
    1e98:	000780a3          	sb	zero,1(a5)
    1e9c:	f0dff06f          	j	1da8 <music_player_generic+0x318>
    1ea0:	000d8793          	mv	a5,s11
    1ea4:	fddff06f          	j	1e80 <music_player_generic+0x3f0>
    1ea8:	00178793          	addi	a5,a5,1
    1eac:	00140413          	addi	s0,s0,1
    1eb0:	fee78fa3          	sb	a4,-1(a5)
    1eb4:	fd5ff06f          	j	1e88 <music_player_generic+0x3f8>
    1eb8:	00040b93          	mv	s7,s0
    1ebc:	003b9c13          	slli	s8,s7,0x3
    1ec0:	417c0c33          	sub	s8,s8,s7
    1ec4:	002c1c13          	slli	s8,s8,0x2
    1ec8:	417c0c33          	sub	s8,s8,s7
    1ecc:	002c1c13          	slli	s8,s8,0x2
    1ed0:	018a0c33          	add	s8,s4,s8
    1ed4:	068c2783          	lw	a5,104(s8)
    1ed8:	04078063          	beqz	a5,1f18 <music_player_generic+0x488>
    1edc:	adcb2783          	lw	a5,-1316(s6)
    1ee0:	001b8b93          	addi	s7,s7,1
    1ee4:	00fba7b3          	slt	a5,s7,a5
    1ee8:	40f007b3          	neg	a5,a5
    1eec:	00fbfbb3          	and	s7,s7,a5
    1ef0:	fd7416e3          	bne	s0,s7,1ebc <music_player_generic+0x42c>
    1ef4:	00001097          	auipc	ra,0x1
    1ef8:	d20080e7          	jalr	-736(ra) # 2c14 <display_framebuffer>
    1efc:	00004637          	lui	a2,0x4
    1f00:	00000593          	li	a1,0
    1f04:	00001097          	auipc	ra,0x1
    1f08:	a6c080e7          	jalr	-1428(ra) # 2970 <memset>
    1f0c:	00c12783          	lw	a5,12(sp)
    1f10:	0007a783          	lw	a5,0(a5)
    1f14:	ec1ff06f          	j	1dd4 <music_player_generic+0x344>
    1f18:	000c0593          	mv	a1,s8
    1f1c:	02c10513          	addi	a0,sp,44
    1f20:	fffff097          	auipc	ra,0xfffff
    1f24:	694080e7          	jalr	1684(ra) # 15b4 <build_full_path>
    1f28:	00001097          	auipc	ra,0x1
    1f2c:	cec080e7          	jalr	-788(ra) # 2c14 <display_framebuffer>
    1f30:	00004637          	lui	a2,0x4
    1f34:	00000593          	li	a1,0
    1f38:	00001097          	auipc	ra,0x1
    1f3c:	a38080e7          	jalr	-1480(ra) # 2970 <memset>
    1f40:	00001097          	auipc	ra,0x1
    1f44:	e50080e7          	jalr	-432(ra) # 2d90 <display_refresh>
    1f48:	01012783          	lw	a5,16(sp)
    1f4c:	064c2603          	lw	a2,100(s8)
    1f50:	000c0593          	mv	a1,s8
    1f54:	02c10513          	addi	a0,sp,44
    1f58:	00078863          	beqz	a5,1f68 <music_player_generic+0x4d8>
    1f5c:	fffff097          	auipc	ra,0xfffff
    1f60:	e0c080e7          	jalr	-500(ra) # d68 <play_dj_mode>
    1f64:	f91ff06f          	j	1ef4 <music_player_generic+0x464>
    1f68:	fffff097          	auipc	ra,0xfffff
    1f6c:	924080e7          	jalr	-1756(ra) # 88c <play_music_with_controls>
    1f70:	f80502e3          	beqz	a0,1ef4 <music_player_generic+0x464>
    1f74:	00100793          	li	a5,1
    1f78:	00f51e63          	bne	a0,a5,1f94 <music_player_generic+0x504>
    1f7c:	adcb2783          	lw	a5,-1316(s6)
    1f80:	00ab8bb3          	add	s7,s7,a0
    1f84:	00fba7b3          	slt	a5,s7,a5
    1f88:	40f007b3          	neg	a5,a5
    1f8c:	00fbfbb3          	and	s7,s7,a5
    1f90:	f2dff06f          	j	1ebc <music_player_generic+0x42c>
    1f94:	fffb8b93          	addi	s7,s7,-1
    1f98:	f20bd2e3          	bgez	s7,1ebc <music_player_generic+0x42c>
    1f9c:	adcb2b83          	lw	s7,-1316(s6)
    1fa0:	fffb8b93          	addi	s7,s7,-1
    1fa4:	f19ff06f          	j	1ebc <music_player_generic+0x42c>
    1fa8:	00f427b3          	slt	a5,s0,a5
    1fac:	40f007b3          	neg	a5,a5
    1fb0:	00f47433          	and	s0,s0,a5
    1fb4:	e31ff06f          	j	1de4 <music_player_generic+0x354>
    1fb8:	00040913          	mv	s2,s0
    1fbc:	e39ff06f          	j	1df4 <music_player_generic+0x364>
    1fc0:	25c12083          	lw	ra,604(sp)
    1fc4:	25812403          	lw	s0,600(sp)
    1fc8:	25412483          	lw	s1,596(sp)
    1fcc:	25012903          	lw	s2,592(sp)
    1fd0:	24c12983          	lw	s3,588(sp)
    1fd4:	24812a03          	lw	s4,584(sp)
    1fd8:	24412a83          	lw	s5,580(sp)
    1fdc:	24012b03          	lw	s6,576(sp)
    1fe0:	23c12b83          	lw	s7,572(sp)
    1fe4:	23812c03          	lw	s8,568(sp)
    1fe8:	23412c83          	lw	s9,564(sp)
    1fec:	23012d03          	lw	s10,560(sp)
    1ff0:	22c12d83          	lw	s11,556(sp)
    1ff4:	26010113          	addi	sp,sp,608
    1ff8:	00008067          	ret

00001ffc <main_menu>:
    1ffc:	000067b7          	lui	a5,0x6
    2000:	fc010113          	addi	sp,sp,-64
    2004:	61478793          	addi	a5,a5,1556 # 6614 <LEDS+0x144>
    2008:	00f12223          	sw	a5,4(sp)
    200c:	000067b7          	lui	a5,0x6
    2010:	62478793          	addi	a5,a5,1572 # 6624 <LEDS+0x154>
    2014:	00f12423          	sw	a5,8(sp)
    2018:	000067b7          	lui	a5,0x6
    201c:	63078793          	addi	a5,a5,1584 # 6630 <LEDS+0x160>
    2020:	00f12623          	sw	a5,12(sp)
    2024:	000067b7          	lui	a5,0x6
    2028:	01812c23          	sw	s8,24(sp)
    202c:	63878c13          	addi	s8,a5,1592 # 6638 <LEDS+0x168>
    2030:	000067b7          	lui	a5,0x6
    2034:	03612023          	sw	s6,32(sp)
    2038:	64c78b13          	addi	s6,a5,1612 # 664c <LEDS+0x17c>
    203c:	000067b7          	lui	a5,0x6
    2040:	01712e23          	sw	s7,28(sp)
    2044:	65c78b93          	addi	s7,a5,1628 # 665c <LEDS+0x18c>
    2048:	000067b7          	lui	a5,0x6
    204c:	01912a23          	sw	s9,20(sp)
    2050:	66078c93          	addi	s9,a5,1632 # 6660 <LEDS+0x190>
    2054:	000067b7          	lui	a5,0x6
    2058:	03512223          	sw	s5,36(sp)
    205c:	4c07aa83          	lw	s5,1216(a5) # 64c0 <BUTTONS>
    2060:	02812c23          	sw	s0,56(sp)
    2064:	02912a23          	sw	s1,52(sp)
    2068:	03312623          	sw	s3,44(sp)
    206c:	02112e23          	sw	ra,60(sp)
    2070:	03212823          	sw	s2,48(sp)
    2074:	03412423          	sw	s4,40(sp)
    2078:	00000493          	li	s1,0
    207c:	00000413          	li	s0,0
    2080:	00300993          	li	s3,3
    2084:	00000593          	li	a1,0
    2088:	00000513          	li	a0,0
    208c:	00001097          	auipc	ra,0x1
    2090:	b94080e7          	jalr	-1132(ra) # 2c20 <display_set_cursor>
    2094:	00000593          	li	a1,0
    2098:	0ff00513          	li	a0,255
    209c:	00001097          	auipc	ra,0x1
    20a0:	b98080e7          	jalr	-1128(ra) # 2c34 <display_set_front_back_color>
    20a4:	000c0513          	mv	a0,s8
    20a8:	00001097          	auipc	ra,0x1
    20ac:	e54080e7          	jalr	-428(ra) # 2efc <printf>
    20b0:	00410a13          	addi	s4,sp,4
    20b4:	00000913          	li	s2,0
    20b8:	13241263          	bne	s0,s2,21dc <main_menu+0x1e0>
    20bc:	0ff00593          	li	a1,255
    20c0:	00000513          	li	a0,0
    20c4:	00001097          	auipc	ra,0x1
    20c8:	b70080e7          	jalr	-1168(ra) # 2c34 <display_set_front_back_color>
    20cc:	000a2603          	lw	a2,0(s4)
    20d0:	00190913          	addi	s2,s2,1
    20d4:	00090593          	mv	a1,s2
    20d8:	000b0513          	mv	a0,s6
    20dc:	00001097          	auipc	ra,0x1
    20e0:	e20080e7          	jalr	-480(ra) # 2efc <printf>
    20e4:	000b8513          	mv	a0,s7
    20e8:	00001097          	auipc	ra,0x1
    20ec:	e14080e7          	jalr	-492(ra) # 2efc <printf>
    20f0:	004a0a13          	addi	s4,s4,4
    20f4:	fd3912e3          	bne	s2,s3,20b8 <main_menu+0xbc>
    20f8:	00000593          	li	a1,0
    20fc:	0ff00513          	li	a0,255
    2100:	00001097          	auipc	ra,0x1
    2104:	b34080e7          	jalr	-1228(ra) # 2c34 <display_set_front_back_color>
    2108:	06e00593          	li	a1,110
    210c:	00000513          	li	a0,0
    2110:	00001097          	auipc	ra,0x1
    2114:	b10080e7          	jalr	-1264(ra) # 2c20 <display_set_cursor>
    2118:	000c8513          	mv	a0,s9
    211c:	00001097          	auipc	ra,0x1
    2120:	de0080e7          	jalr	-544(ra) # 2efc <printf>
    2124:	00001097          	auipc	ra,0x1
    2128:	c6c080e7          	jalr	-916(ra) # 2d90 <display_refresh>
    212c:	000aa903          	lw	s2,0(s5)
    2130:	fff4c493          	not	s1,s1
    2134:	0124f4b3          	and	s1,s1,s2
    2138:	0104f793          	andi	a5,s1,16
    213c:	00078863          	beqz	a5,214c <main_menu+0x150>
    2140:	00140413          	addi	s0,s0,1
    2144:	ffffe097          	auipc	ra,0xffffe
    2148:	018080e7          	jalr	24(ra) # 15c <play_click_noise>
    214c:	0084f793          	andi	a5,s1,8
    2150:	00078863          	beqz	a5,2160 <main_menu+0x164>
    2154:	fff40413          	addi	s0,s0,-1
    2158:	ffffe097          	auipc	ra,0xffffe
    215c:	004080e7          	jalr	4(ra) # 15c <play_click_noise>
    2160:	0044f493          	andi	s1,s1,4
    2164:	04048c63          	beqz	s1,21bc <main_menu+0x1c0>
    2168:	ffffe097          	auipc	ra,0xffffe
    216c:	ff4080e7          	jalr	-12(ra) # 15c <play_click_noise>
    2170:	00001097          	auipc	ra,0x1
    2174:	aa4080e7          	jalr	-1372(ra) # 2c14 <display_framebuffer>
    2178:	00004637          	lui	a2,0x4
    217c:	00000593          	li	a1,0
    2180:	00000097          	auipc	ra,0x0
    2184:	7f0080e7          	jalr	2032(ra) # 2970 <memset>
    2188:	00001097          	auipc	ra,0x1
    218c:	c08080e7          	jalr	-1016(ra) # 2d90 <display_refresh>
    2190:	04041c63          	bnez	s0,21e8 <main_menu+0x1ec>
    2194:	fffff097          	auipc	ra,0xfffff
    2198:	488080e7          	jalr	1160(ra) # 161c <file_explorer>
    219c:	00001097          	auipc	ra,0x1
    21a0:	a78080e7          	jalr	-1416(ra) # 2c14 <display_framebuffer>
    21a4:	00004637          	lui	a2,0x4
    21a8:	00000593          	li	a1,0
    21ac:	00000097          	auipc	ra,0x0
    21b0:	7c4080e7          	jalr	1988(ra) # 2970 <memset>
    21b4:	000a8793          	mv	a5,s5
    21b8:	0007a783          	lw	a5,0(a5)
    21bc:	fff00793          	li	a5,-1
    21c0:	00f40863          	beq	s0,a5,21d0 <main_menu+0x1d4>
    21c4:	01341863          	bne	s0,s3,21d4 <main_menu+0x1d8>
    21c8:	00000413          	li	s0,0
    21cc:	0080006f          	j	21d4 <main_menu+0x1d8>
    21d0:	00200413          	li	s0,2
    21d4:	00090493          	mv	s1,s2
    21d8:	eadff06f          	j	2084 <main_menu+0x88>
    21dc:	00000593          	li	a1,0
    21e0:	0ff00513          	li	a0,255
    21e4:	ee1ff06f          	j	20c4 <main_menu+0xc8>
    21e8:	00100513          	li	a0,1
    21ec:	00a41a63          	bne	s0,a0,2200 <main_menu+0x204>
    21f0:	00000513          	li	a0,0
    21f4:	00000097          	auipc	ra,0x0
    21f8:	89c080e7          	jalr	-1892(ra) # 1a90 <music_player_generic>
    21fc:	fa1ff06f          	j	219c <main_menu+0x1a0>
    2200:	00200793          	li	a5,2
    2204:	f8f41ce3          	bne	s0,a5,219c <main_menu+0x1a0>
    2208:	fedff06f          	j	21f4 <main_menu+0x1f8>

0000220c <main>:
    220c:	000067b7          	lui	a5,0x6
    2210:	4d07a783          	lw	a5,1232(a5) # 64d0 <LEDS>
    2214:	ff010113          	addi	sp,sp,-16
    2218:	00112623          	sw	ra,12(sp)
    221c:	00812423          	sw	s0,8(sp)
    2220:	0007a023          	sw	zero,0(a5)
    2224:	000037b7          	lui	a5,0x3
    2228:	c4878793          	addi	a5,a5,-952 # 2c48 <display_putchar>
    222c:	00007737          	lui	a4,0x7
    2230:	aef72823          	sw	a5,-1296(a4) # 6af0 <f_putchar>
    2234:	00001097          	auipc	ra,0x1
    2238:	93c080e7          	jalr	-1732(ra) # 2b70 <oled_init>
    223c:	00001097          	auipc	ra,0x1
    2240:	940080e7          	jalr	-1728(ra) # 2b7c <oled_fullscreen>
    2244:	00001097          	auipc	ra,0x1
    2248:	9d0080e7          	jalr	-1584(ra) # 2c14 <display_framebuffer>
    224c:	00004637          	lui	a2,0x4
    2250:	00000593          	li	a1,0
    2254:	00000097          	auipc	ra,0x0
    2258:	71c080e7          	jalr	1820(ra) # 2970 <memset>
    225c:	00001097          	auipc	ra,0x1
    2260:	b34080e7          	jalr	-1228(ra) # 2d90 <display_refresh>
    2264:	00000097          	auipc	ra,0x0
    2268:	4ac080e7          	jalr	1196(ra) # 2710 <sdcard_init>
    226c:	00001097          	auipc	ra,0x1
    2270:	260080e7          	jalr	608(ra) # 34cc <fl_init>
    2274:	00000593          	li	a1,0
    2278:	00000513          	li	a0,0
    227c:	00001097          	auipc	ra,0x1
    2280:	9a4080e7          	jalr	-1628(ra) # 2c20 <display_set_cursor>
    2284:	00000593          	li	a1,0
    2288:	0ff00513          	li	a0,255
    228c:	00001097          	auipc	ra,0x1
    2290:	9a8080e7          	jalr	-1624(ra) # 2c34 <display_set_front_back_color>
    2294:	00006537          	lui	a0,0x6
    2298:	67450513          	addi	a0,a0,1652 # 6674 <LEDS+0x1a4>
    229c:	00001097          	auipc	ra,0x1
    22a0:	c60080e7          	jalr	-928(ra) # 2efc <printf>
    22a4:	00001097          	auipc	ra,0x1
    22a8:	aec080e7          	jalr	-1300(ra) # 2d90 <display_refresh>
    22ac:	000035b7          	lui	a1,0x3
    22b0:	000037b7          	lui	a5,0x3
    22b4:	8b458593          	addi	a1,a1,-1868 # 28b4 <sdcard_writesector>
    22b8:	86078413          	addi	s0,a5,-1952 # 2860 <sdcard_readsector>
    22bc:	00040513          	mv	a0,s0
    22c0:	00002097          	auipc	ra,0x2
    22c4:	16c080e7          	jalr	364(ra) # 442c <fl_attach_media>
    22c8:	000037b7          	lui	a5,0x3
    22cc:	8b478593          	addi	a1,a5,-1868 # 28b4 <sdcard_writesector>
    22d0:	fe0516e3          	bnez	a0,22bc <main+0xb0>
    22d4:	ffffe097          	auipc	ra,0xffffe
    22d8:	238080e7          	jalr	568(ra) # 50c <intro_sequence>
    22dc:	00000097          	auipc	ra,0x0
    22e0:	d20080e7          	jalr	-736(ra) # 1ffc <main_menu>

000022e4 <pause>:
    22e4:	c0002773          	rdcycle	a4
    22e8:	c00027f3          	rdcycle	a5
    22ec:	40e787b3          	sub	a5,a5,a4
    22f0:	fea7ece3          	bltu	a5,a0,22e8 <pause+0x4>
    22f4:	00008067          	ret

000022f8 <sdcard_idle>:
    22f8:	00008067          	ret

000022fc <sdcard_select>:
    22fc:	000067b7          	lui	a5,0x6
    2300:	4c47a783          	lw	a5,1220(a5) # 64c4 <SDCARD>
    2304:	00200713          	li	a4,2
    2308:	00e7a023          	sw	a4,0(a5)
    230c:	00008067          	ret

00002310 <sdcard_ponder>:
    2310:	000066b7          	lui	a3,0x6
    2314:	4c46a683          	lw	a3,1220(a3) # 64c4 <SDCARD>
    2318:	01000793          	li	a5,16
    231c:	00000713          	li	a4,0
    2320:	00676613          	ori	a2,a4,6
    2324:	00c6a023          	sw	a2,0(a3)
    2328:	00174713          	xori	a4,a4,1
    232c:	00000013          	nop
    2330:	fff78793          	addi	a5,a5,-1
    2334:	fe0796e3          	bnez	a5,2320 <sdcard_ponder+0x10>
    2338:	00008067          	ret

0000233c <sdcard_unselect>:
    233c:	000067b7          	lui	a5,0x6
    2340:	4c47a783          	lw	a5,1220(a5) # 64c4 <SDCARD>
    2344:	00600713          	li	a4,6
    2348:	00e7a023          	sw	a4,0(a5)
    234c:	00008067          	ret

00002350 <sdcard_send>:
    2350:	000067b7          	lui	a5,0x6
    2354:	4c47a783          	lw	a5,1220(a5) # 64c4 <SDCARD>
    2358:	00655713          	srli	a4,a0,0x6
    235c:	00277713          	andi	a4,a4,2
    2360:	00e7a023          	sw	a4,0(a5)
    2364:	00176713          	ori	a4,a4,1
    2368:	00e7a023          	sw	a4,0(a5)
    236c:	00555713          	srli	a4,a0,0x5
    2370:	00277713          	andi	a4,a4,2
    2374:	00e7a023          	sw	a4,0(a5)
    2378:	00176713          	ori	a4,a4,1
    237c:	00e7a023          	sw	a4,0(a5)
    2380:	00455713          	srli	a4,a0,0x4
    2384:	00277713          	andi	a4,a4,2
    2388:	00e7a023          	sw	a4,0(a5)
    238c:	00176713          	ori	a4,a4,1
    2390:	00e7a023          	sw	a4,0(a5)
    2394:	00355713          	srli	a4,a0,0x3
    2398:	00277713          	andi	a4,a4,2
    239c:	00e7a023          	sw	a4,0(a5)
    23a0:	00176713          	ori	a4,a4,1
    23a4:	00e7a023          	sw	a4,0(a5)
    23a8:	00255713          	srli	a4,a0,0x2
    23ac:	00277713          	andi	a4,a4,2
    23b0:	00e7a023          	sw	a4,0(a5)
    23b4:	00176713          	ori	a4,a4,1
    23b8:	00e7a023          	sw	a4,0(a5)
    23bc:	00155713          	srli	a4,a0,0x1
    23c0:	00277713          	andi	a4,a4,2
    23c4:	00e7a023          	sw	a4,0(a5)
    23c8:	00176713          	ori	a4,a4,1
    23cc:	00e7a023          	sw	a4,0(a5)
    23d0:	00257713          	andi	a4,a0,2
    23d4:	00e7a023          	sw	a4,0(a5)
    23d8:	00151513          	slli	a0,a0,0x1
    23dc:	00176713          	ori	a4,a4,1
    23e0:	00e7a023          	sw	a4,0(a5)
    23e4:	00257513          	andi	a0,a0,2
    23e8:	00a7a023          	sw	a0,0(a5)
    23ec:	00156513          	ori	a0,a0,1
    23f0:	00a7a023          	sw	a0,0(a5)
    23f4:	00200713          	li	a4,2
    23f8:	00e7a023          	sw	a4,0(a5)
    23fc:	000077b7          	lui	a5,0x7
    2400:	ae07a783          	lw	a5,-1312(a5) # 6ae0 <sdcard_while_loading_callback>
    2404:	00078067          	jr	a5

00002408 <sdcard_read>:
    2408:	fd010113          	addi	sp,sp,-48
    240c:	fff50793          	addi	a5,a0,-1
    2410:	03212023          	sw	s2,32(sp)
    2414:	00100913          	li	s2,1
    2418:	00f91933          	sll	s2,s2,a5
    241c:	000067b7          	lui	a5,0x6
    2420:	01312e23          	sw	s3,28(sp)
    2424:	4c47a983          	lw	s3,1220(a5) # 64c4 <SDCARD>
    2428:	02812423          	sw	s0,40(sp)
    242c:	02912223          	sw	s1,36(sp)
    2430:	01412c23          	sw	s4,24(sp)
    2434:	01512a23          	sw	s5,20(sp)
    2438:	01612823          	sw	s6,16(sp)
    243c:	02112623          	sw	ra,44(sp)
    2440:	0ff00413          	li	s0,255
    2444:	00000493          	li	s1,0
    2448:	00300a13          	li	s4,3
    244c:	00200a93          	li	s5,2
    2450:	00007b37          	lui	s6,0x7
    2454:	02058c63          	beqz	a1,248c <sdcard_read+0x84>
    2458:	012477b3          	and	a5,s0,s2
    245c:	02079a63          	bnez	a5,2490 <sdcard_read+0x88>
    2460:	02c12083          	lw	ra,44(sp)
    2464:	0ff47513          	zext.b	a0,s0
    2468:	02812403          	lw	s0,40(sp)
    246c:	02412483          	lw	s1,36(sp)
    2470:	02012903          	lw	s2,32(sp)
    2474:	01c12983          	lw	s3,28(sp)
    2478:	01812a03          	lw	s4,24(sp)
    247c:	01412a83          	lw	s5,20(sp)
    2480:	01012b03          	lw	s6,16(sp)
    2484:	03010113          	addi	sp,sp,48
    2488:	00008067          	ret
    248c:	fca4dae3          	bge	s1,a0,2460 <sdcard_read+0x58>
    2490:	0149a023          	sw	s4,0(s3)
    2494:	0159a023          	sw	s5,0(s3)
    2498:	0009a783          	lw	a5,0(s3)
    249c:	00141413          	slli	s0,s0,0x1
    24a0:	00b12623          	sw	a1,12(sp)
    24a4:	00f46433          	or	s0,s0,a5
    24a8:	ae0b2783          	lw	a5,-1312(s6) # 6ae0 <sdcard_while_loading_callback>
    24ac:	00a12423          	sw	a0,8(sp)
    24b0:	00148493          	addi	s1,s1,1
    24b4:	000780e7          	jalr	a5
    24b8:	00c12583          	lw	a1,12(sp)
    24bc:	00812503          	lw	a0,8(sp)
    24c0:	f95ff06f          	j	2454 <sdcard_read+0x4c>

000024c4 <sdcard_get>:
    24c4:	fe010113          	addi	sp,sp,-32
    24c8:	00112e23          	sw	ra,28(sp)
    24cc:	00812c23          	sw	s0,24(sp)
    24d0:	00912a23          	sw	s1,20(sp)
    24d4:	00050413          	mv	s0,a0
    24d8:	00b12623          	sw	a1,12(sp)
    24dc:	00000097          	auipc	ra,0x0
    24e0:	e20080e7          	jalr	-480(ra) # 22fc <sdcard_select>
    24e4:	00c12583          	lw	a1,12(sp)
    24e8:	00040513          	mv	a0,s0
    24ec:	00100493          	li	s1,1
    24f0:	00000097          	auipc	ra,0x0
    24f4:	f18080e7          	jalr	-232(ra) # 2408 <sdcard_read>
    24f8:	00345413          	srli	s0,s0,0x3
    24fc:	0284c463          	blt	s1,s0,2524 <sdcard_get+0x60>
    2500:	00a12623          	sw	a0,12(sp)
    2504:	00000097          	auipc	ra,0x0
    2508:	e38080e7          	jalr	-456(ra) # 233c <sdcard_unselect>
    250c:	01c12083          	lw	ra,28(sp)
    2510:	01812403          	lw	s0,24(sp)
    2514:	00c12503          	lw	a0,12(sp)
    2518:	01412483          	lw	s1,20(sp)
    251c:	02010113          	addi	sp,sp,32
    2520:	00008067          	ret
    2524:	00000593          	li	a1,0
    2528:	00800513          	li	a0,8
    252c:	00000097          	auipc	ra,0x0
    2530:	edc080e7          	jalr	-292(ra) # 2408 <sdcard_read>
    2534:	00148493          	addi	s1,s1,1
    2538:	fc5ff06f          	j	24fc <sdcard_get+0x38>

0000253c <sdcard_cmd>:
    253c:	ff010113          	addi	sp,sp,-16
    2540:	00812423          	sw	s0,8(sp)
    2544:	00912223          	sw	s1,4(sp)
    2548:	01212023          	sw	s2,0(sp)
    254c:	00112623          	sw	ra,12(sp)
    2550:	00050913          	mv	s2,a0
    2554:	00000413          	li	s0,0
    2558:	00000097          	auipc	ra,0x0
    255c:	da4080e7          	jalr	-604(ra) # 22fc <sdcard_select>
    2560:	00600493          	li	s1,6
    2564:	008907b3          	add	a5,s2,s0
    2568:	0007c503          	lbu	a0,0(a5)
    256c:	00140413          	addi	s0,s0,1
    2570:	00000097          	auipc	ra,0x0
    2574:	de0080e7          	jalr	-544(ra) # 2350 <sdcard_send>
    2578:	fe9416e3          	bne	s0,s1,2564 <sdcard_cmd+0x28>
    257c:	00812403          	lw	s0,8(sp)
    2580:	00c12083          	lw	ra,12(sp)
    2584:	00412483          	lw	s1,4(sp)
    2588:	00012903          	lw	s2,0(sp)
    258c:	01010113          	addi	sp,sp,16
    2590:	00000317          	auipc	t1,0x0
    2594:	dac30067          	jr	-596(t1) # 233c <sdcard_unselect>

00002598 <sdcard_start_sector>:
    2598:	ff010113          	addi	sp,sp,-16
    259c:	00112623          	sw	ra,12(sp)
    25a0:	00812423          	sw	s0,8(sp)
    25a4:	00050413          	mv	s0,a0
    25a8:	00000097          	auipc	ra,0x0
    25ac:	d54080e7          	jalr	-684(ra) # 22fc <sdcard_select>
    25b0:	05100513          	li	a0,81
    25b4:	00000097          	auipc	ra,0x0
    25b8:	d9c080e7          	jalr	-612(ra) # 2350 <sdcard_send>
    25bc:	01845513          	srli	a0,s0,0x18
    25c0:	00000097          	auipc	ra,0x0
    25c4:	d90080e7          	jalr	-624(ra) # 2350 <sdcard_send>
    25c8:	41045513          	srai	a0,s0,0x10
    25cc:	0ff57513          	zext.b	a0,a0
    25d0:	00000097          	auipc	ra,0x0
    25d4:	d80080e7          	jalr	-640(ra) # 2350 <sdcard_send>
    25d8:	40845513          	srai	a0,s0,0x8
    25dc:	0ff57513          	zext.b	a0,a0
    25e0:	00000097          	auipc	ra,0x0
    25e4:	d70080e7          	jalr	-656(ra) # 2350 <sdcard_send>
    25e8:	0ff47513          	zext.b	a0,s0
    25ec:	00000097          	auipc	ra,0x0
    25f0:	d64080e7          	jalr	-668(ra) # 2350 <sdcard_send>
    25f4:	05500513          	li	a0,85
    25f8:	00000097          	auipc	ra,0x0
    25fc:	d58080e7          	jalr	-680(ra) # 2350 <sdcard_send>
    2600:	00000097          	auipc	ra,0x0
    2604:	d3c080e7          	jalr	-708(ra) # 233c <sdcard_unselect>
    2608:	00812403          	lw	s0,8(sp)
    260c:	00c12083          	lw	ra,12(sp)
    2610:	00100593          	li	a1,1
    2614:	00800513          	li	a0,8
    2618:	01010113          	addi	sp,sp,16
    261c:	00000317          	auipc	t1,0x0
    2620:	ea830067          	jr	-344(t1) # 24c4 <sdcard_get>

00002624 <sdcard_read_sector>:
    2624:	ff010113          	addi	sp,sp,-16
    2628:	00812423          	sw	s0,8(sp)
    262c:	00112623          	sw	ra,12(sp)
    2630:	00912223          	sw	s1,4(sp)
    2634:	01212023          	sw	s2,0(sp)
    2638:	00058413          	mv	s0,a1
    263c:	00000097          	auipc	ra,0x0
    2640:	f5c080e7          	jalr	-164(ra) # 2598 <sdcard_start_sector>
    2644:	04051863          	bnez	a0,2694 <sdcard_read_sector+0x70>
    2648:	00100593          	li	a1,1
    264c:	00058513          	mv	a0,a1
    2650:	00000097          	auipc	ra,0x0
    2654:	e74080e7          	jalr	-396(ra) # 24c4 <sdcard_get>
    2658:	00000493          	li	s1,0
    265c:	20000913          	li	s2,512
    2660:	00000593          	li	a1,0
    2664:	00800513          	li	a0,8
    2668:	00000097          	auipc	ra,0x0
    266c:	e5c080e7          	jalr	-420(ra) # 24c4 <sdcard_get>
    2670:	009407b3          	add	a5,s0,s1
    2674:	00a78023          	sb	a0,0(a5)
    2678:	00148493          	addi	s1,s1,1
    267c:	ff2492e3          	bne	s1,s2,2660 <sdcard_read_sector+0x3c>
    2680:	00100593          	li	a1,1
    2684:	01000513          	li	a0,16
    2688:	20040413          	addi	s0,s0,512
    268c:	00000097          	auipc	ra,0x0
    2690:	e38080e7          	jalr	-456(ra) # 24c4 <sdcard_get>
    2694:	00c12083          	lw	ra,12(sp)
    2698:	00040513          	mv	a0,s0
    269c:	00812403          	lw	s0,8(sp)
    26a0:	00412483          	lw	s1,4(sp)
    26a4:	00012903          	lw	s2,0(sp)
    26a8:	01010113          	addi	sp,sp,16
    26ac:	00008067          	ret

000026b0 <sdcard_preinit>:
    26b0:	ff010113          	addi	sp,sp,-16
    26b4:	000067b7          	lui	a5,0x6
    26b8:	00812423          	sw	s0,8(sp)
    26bc:	4c47a403          	lw	s0,1220(a5) # 64c4 <SDCARD>
    26c0:	00112623          	sw	ra,12(sp)
    26c4:	00600793          	li	a5,6
    26c8:	01313537          	lui	a0,0x1313
    26cc:	00f42023          	sw	a5,0(s0)
    26d0:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
    26d4:	00000097          	auipc	ra,0x0
    26d8:	c10080e7          	jalr	-1008(ra) # 22e4 <pause>
    26dc:	0a000793          	li	a5,160
    26e0:	00000713          	li	a4,0
    26e4:	00676693          	ori	a3,a4,6
    26e8:	00d42023          	sw	a3,0(s0)
    26ec:	fff78793          	addi	a5,a5,-1
    26f0:	00174713          	xori	a4,a4,1
    26f4:	fe0798e3          	bnez	a5,26e4 <sdcard_preinit+0x34>
    26f8:	00600793          	li	a5,6
    26fc:	00c12083          	lw	ra,12(sp)
    2700:	00f42023          	sw	a5,0(s0)
    2704:	00812403          	lw	s0,8(sp)
    2708:	01010113          	addi	sp,sp,16
    270c:	00008067          	ret

00002710 <sdcard_init>:
    2710:	000027b7          	lui	a5,0x2
    2714:	2f878793          	addi	a5,a5,760 # 22f8 <sdcard_idle>
    2718:	00007737          	lui	a4,0x7
    271c:	fe010113          	addi	sp,sp,-32
    2720:	aef72023          	sw	a5,-1312(a4) # 6ae0 <sdcard_while_loading_callback>
    2724:	000067b7          	lui	a5,0x6
    2728:	00812c23          	sw	s0,24(sp)
    272c:	00912a23          	sw	s1,20(sp)
    2730:	00112e23          	sw	ra,28(sp)
    2734:	4b078493          	addi	s1,a5,1200 # 64b0 <cmd0>
    2738:	0ff00413          	li	s0,255
    273c:	00000097          	auipc	ra,0x0
    2740:	f74080e7          	jalr	-140(ra) # 26b0 <sdcard_preinit>
    2744:	00048513          	mv	a0,s1
    2748:	00000097          	auipc	ra,0x0
    274c:	df4080e7          	jalr	-524(ra) # 253c <sdcard_cmd>
    2750:	00100593          	li	a1,1
    2754:	00800513          	li	a0,8
    2758:	00000097          	auipc	ra,0x0
    275c:	d6c080e7          	jalr	-660(ra) # 24c4 <sdcard_get>
    2760:	00a12623          	sw	a0,12(sp)
    2764:	00000097          	auipc	ra,0x0
    2768:	bac080e7          	jalr	-1108(ra) # 2310 <sdcard_ponder>
    276c:	00c12503          	lw	a0,12(sp)
    2770:	00851c63          	bne	a0,s0,2788 <sdcard_init+0x78>
    2774:	01313537          	lui	a0,0x1313
    2778:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
    277c:	00000097          	auipc	ra,0x0
    2780:	b68080e7          	jalr	-1176(ra) # 22e4 <pause>
    2784:	fb9ff06f          	j	273c <sdcard_init+0x2c>
    2788:	00006537          	lui	a0,0x6
    278c:	4a850513          	addi	a0,a0,1192 # 64a8 <cmd8>
    2790:	00000097          	auipc	ra,0x0
    2794:	dac080e7          	jalr	-596(ra) # 253c <sdcard_cmd>
    2798:	00100593          	li	a1,1
    279c:	02800513          	li	a0,40
    27a0:	00000097          	auipc	ra,0x0
    27a4:	d24080e7          	jalr	-732(ra) # 24c4 <sdcard_get>
    27a8:	00000097          	auipc	ra,0x0
    27ac:	b68080e7          	jalr	-1176(ra) # 2310 <sdcard_ponder>
    27b0:	000067b7          	lui	a5,0x6
    27b4:	4a078413          	addi	s0,a5,1184 # 64a0 <cmd55>
    27b8:	000067b7          	lui	a5,0x6
    27bc:	49878493          	addi	s1,a5,1176 # 6498 <acmd41>
    27c0:	00040513          	mv	a0,s0
    27c4:	00000097          	auipc	ra,0x0
    27c8:	d78080e7          	jalr	-648(ra) # 253c <sdcard_cmd>
    27cc:	00100593          	li	a1,1
    27d0:	00800513          	li	a0,8
    27d4:	00000097          	auipc	ra,0x0
    27d8:	cf0080e7          	jalr	-784(ra) # 24c4 <sdcard_get>
    27dc:	00000097          	auipc	ra,0x0
    27e0:	b34080e7          	jalr	-1228(ra) # 2310 <sdcard_ponder>
    27e4:	00048513          	mv	a0,s1
    27e8:	00000097          	auipc	ra,0x0
    27ec:	d54080e7          	jalr	-684(ra) # 253c <sdcard_cmd>
    27f0:	00100593          	li	a1,1
    27f4:	00800513          	li	a0,8
    27f8:	00000097          	auipc	ra,0x0
    27fc:	ccc080e7          	jalr	-820(ra) # 24c4 <sdcard_get>
    2800:	00a12623          	sw	a0,12(sp)
    2804:	00000097          	auipc	ra,0x0
    2808:	b0c080e7          	jalr	-1268(ra) # 2310 <sdcard_ponder>
    280c:	00c12503          	lw	a0,12(sp)
    2810:	00050c63          	beqz	a0,2828 <sdcard_init+0x118>
    2814:	001e8537          	lui	a0,0x1e8
    2818:	48050513          	addi	a0,a0,1152 # 1e8480 <__stacktop+0x1d8480>
    281c:	00000097          	auipc	ra,0x0
    2820:	ac8080e7          	jalr	-1336(ra) # 22e4 <pause>
    2824:	f9dff06f          	j	27c0 <sdcard_init+0xb0>
    2828:	00006537          	lui	a0,0x6
    282c:	49050513          	addi	a0,a0,1168 # 6490 <cmd16>
    2830:	00000097          	auipc	ra,0x0
    2834:	d0c080e7          	jalr	-756(ra) # 253c <sdcard_cmd>
    2838:	00100593          	li	a1,1
    283c:	00800513          	li	a0,8
    2840:	00000097          	auipc	ra,0x0
    2844:	c84080e7          	jalr	-892(ra) # 24c4 <sdcard_get>
    2848:	01812403          	lw	s0,24(sp)
    284c:	01c12083          	lw	ra,28(sp)
    2850:	01412483          	lw	s1,20(sp)
    2854:	02010113          	addi	sp,sp,32
    2858:	00000317          	auipc	t1,0x0
    285c:	ab830067          	jr	-1352(t1) # 2310 <sdcard_ponder>

00002860 <sdcard_readsector>:
    2860:	04060663          	beqz	a2,28ac <sdcard_readsector+0x4c>
    2864:	ff010113          	addi	sp,sp,-16
    2868:	00812423          	sw	s0,8(sp)
    286c:	00912223          	sw	s1,4(sp)
    2870:	00112623          	sw	ra,12(sp)
    2874:	00050413          	mv	s0,a0
    2878:	00a604b3          	add	s1,a2,a0
    287c:	00040513          	mv	a0,s0
    2880:	00000097          	auipc	ra,0x0
    2884:	da4080e7          	jalr	-604(ra) # 2624 <sdcard_read_sector>
    2888:	00140413          	addi	s0,s0,1
    288c:	00050593          	mv	a1,a0
    2890:	fe9416e3          	bne	s0,s1,287c <sdcard_readsector+0x1c>
    2894:	00c12083          	lw	ra,12(sp)
    2898:	00812403          	lw	s0,8(sp)
    289c:	00412483          	lw	s1,4(sp)
    28a0:	00100513          	li	a0,1
    28a4:	01010113          	addi	sp,sp,16
    28a8:	00008067          	ret
    28ac:	00000513          	li	a0,0
    28b0:	00008067          	ret

000028b4 <sdcard_writesector>:
    28b4:	00000513          	li	a0,0
    28b8:	00008067          	ret

000028bc <__divsi3>:
    28bc:	06054063          	bltz	a0,291c <__umodsi3+0x10>
    28c0:	0605c663          	bltz	a1,292c <__umodsi3+0x20>

000028c4 <__udivsi3>:
    28c4:	00058613          	mv	a2,a1
    28c8:	00050593          	mv	a1,a0
    28cc:	fff00513          	li	a0,-1
    28d0:	02060c63          	beqz	a2,2908 <__udivsi3+0x44>
    28d4:	00100693          	li	a3,1
    28d8:	00b67a63          	bgeu	a2,a1,28ec <__udivsi3+0x28>
    28dc:	00c05863          	blez	a2,28ec <__udivsi3+0x28>
    28e0:	00161613          	slli	a2,a2,0x1
    28e4:	00169693          	slli	a3,a3,0x1
    28e8:	feb66ae3          	bltu	a2,a1,28dc <__udivsi3+0x18>
    28ec:	00000513          	li	a0,0
    28f0:	00c5e663          	bltu	a1,a2,28fc <__udivsi3+0x38>
    28f4:	40c585b3          	sub	a1,a1,a2
    28f8:	00d56533          	or	a0,a0,a3
    28fc:	0016d693          	srli	a3,a3,0x1
    2900:	00165613          	srli	a2,a2,0x1
    2904:	fe0696e3          	bnez	a3,28f0 <__udivsi3+0x2c>
    2908:	00008067          	ret

0000290c <__umodsi3>:
    290c:	00008293          	mv	t0,ra
    2910:	fb5ff0ef          	jal	28c4 <__udivsi3>
    2914:	00058513          	mv	a0,a1
    2918:	00028067          	jr	t0
    291c:	40a00533          	neg	a0,a0
    2920:	0005d863          	bgez	a1,2930 <__umodsi3+0x24>
    2924:	40b005b3          	neg	a1,a1
    2928:	f95ff06f          	j	28bc <__divsi3>
    292c:	40b005b3          	neg	a1,a1
    2930:	00008293          	mv	t0,ra
    2934:	f89ff0ef          	jal	28bc <__divsi3>
    2938:	40a00533          	neg	a0,a0
    293c:	00028067          	jr	t0

00002940 <__modsi3>:
    2940:	00008293          	mv	t0,ra
    2944:	0005ca63          	bltz	a1,2958 <__modsi3+0x18>
    2948:	00054c63          	bltz	a0,2960 <__modsi3+0x20>
    294c:	f79ff0ef          	jal	28c4 <__udivsi3>
    2950:	00058513          	mv	a0,a1
    2954:	00028067          	jr	t0
    2958:	40b005b3          	neg	a1,a1
    295c:	fe0558e3          	bgez	a0,294c <__modsi3+0xc>
    2960:	40a00533          	neg	a0,a0
    2964:	f61ff0ef          	jal	28c4 <__udivsi3>
    2968:	40b00533          	neg	a0,a1
    296c:	00028067          	jr	t0

00002970 <memset>:
    2970:	00c50633          	add	a2,a0,a2
    2974:	00050793          	mv	a5,a0
    2978:	00c79463          	bne	a5,a2,2980 <memset+0x10>
    297c:	00008067          	ret
    2980:	00178793          	addi	a5,a5,1
    2984:	feb78fa3          	sb	a1,-1(a5)
    2988:	ff1ff06f          	j	2978 <memset+0x8>

0000298c <memcpy>:
    298c:	00000793          	li	a5,0
    2990:	00c79463          	bne	a5,a2,2998 <memcpy+0xc>
    2994:	00008067          	ret
    2998:	00f58733          	add	a4,a1,a5
    299c:	00074683          	lbu	a3,0(a4)
    29a0:	00f50733          	add	a4,a0,a5
    29a4:	00178793          	addi	a5,a5,1
    29a8:	00d70023          	sb	a3,0(a4)
    29ac:	fe5ff06f          	j	2990 <memcpy+0x4>

000029b0 <strlen>:
    29b0:	00000793          	li	a5,0
    29b4:	00f50733          	add	a4,a0,a5
    29b8:	00074703          	lbu	a4,0(a4)
    29bc:	00071663          	bnez	a4,29c8 <strlen+0x18>
    29c0:	00078513          	mv	a0,a5
    29c4:	00008067          	ret
    29c8:	00178793          	addi	a5,a5,1
    29cc:	fe9ff06f          	j	29b4 <strlen+0x4>

000029d0 <strncmp>:
    29d0:	00000793          	li	a5,0
    29d4:	00c79663          	bne	a5,a2,29e0 <strncmp+0x10>
    29d8:	00000513          	li	a0,0
    29dc:	00008067          	ret
    29e0:	00f50733          	add	a4,a0,a5
    29e4:	00074683          	lbu	a3,0(a4)
    29e8:	00f58733          	add	a4,a1,a5
    29ec:	00074703          	lbu	a4,0(a4)
    29f0:	00e6e863          	bltu	a3,a4,2a00 <strncmp+0x30>
    29f4:	00d76a63          	bltu	a4,a3,2a08 <strncmp+0x38>
    29f8:	00178793          	addi	a5,a5,1
    29fc:	fd9ff06f          	j	29d4 <strncmp+0x4>
    2a00:	fff00513          	li	a0,-1
    2a04:	00008067          	ret
    2a08:	00100513          	li	a0,1
    2a0c:	00008067          	ret

00002a10 <strncpy>:
    2a10:	00000793          	li	a5,0
    2a14:	00c79463          	bne	a5,a2,2a1c <strncpy+0xc>
    2a18:	00008067          	ret
    2a1c:	00f58733          	add	a4,a1,a5
    2a20:	00074683          	lbu	a3,0(a4)
    2a24:	00f50733          	add	a4,a0,a5
    2a28:	00178793          	addi	a5,a5,1
    2a2c:	00d70023          	sb	a3,0(a4)
    2a30:	fe5ff06f          	j	2a14 <strncpy+0x4>

00002a34 <strcpy>:
    2a34:	0005c783          	lbu	a5,0(a1)
    2a38:	00079663          	bnez	a5,2a44 <strcpy+0x10>
    2a3c:	00050023          	sb	zero,0(a0)
    2a40:	00008067          	ret
    2a44:	00150513          	addi	a0,a0,1
    2a48:	00158593          	addi	a1,a1,1
    2a4c:	fef50fa3          	sb	a5,-1(a0)
    2a50:	fe5ff06f          	j	2a34 <strcpy>

00002a54 <oled_wait>:
    2a54:	00000013          	nop
    2a58:	00000013          	nop
    2a5c:	00000013          	nop
    2a60:	00000013          	nop
    2a64:	00000013          	nop
    2a68:	00000013          	nop
    2a6c:	00000013          	nop
    2a70:	00008067          	ret

00002a74 <oled_init_mode>:
    2a74:	000067b7          	lui	a5,0x6
    2a78:	4c87a703          	lw	a4,1224(a5) # 64c8 <OLED_RST>
    2a7c:	fe010113          	addi	sp,sp,-32
    2a80:	00112e23          	sw	ra,28(sp)
    2a84:	00812c23          	sw	s0,24(sp)
    2a88:	00072023          	sw	zero,0(a4)
    2a8c:	00040737          	lui	a4,0x40
    2a90:	00000013          	nop
    2a94:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
    2a98:	fe071ce3          	bnez	a4,2a90 <oled_init_mode+0x1c>
    2a9c:	4c87a703          	lw	a4,1224(a5)
    2aa0:	00100693          	li	a3,1
    2aa4:	00d72023          	sw	a3,0(a4)
    2aa8:	00040737          	lui	a4,0x40
    2aac:	00000013          	nop
    2ab0:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
    2ab4:	fe071ce3          	bnez	a4,2aac <oled_init_mode+0x38>
    2ab8:	4c87a783          	lw	a5,1224(a5)
    2abc:	0007a023          	sw	zero,0(a5)
    2ac0:	000407b7          	lui	a5,0x40
    2ac4:	00000013          	nop
    2ac8:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
    2acc:	fe079ce3          	bnez	a5,2ac4 <oled_init_mode+0x50>
    2ad0:	00006737          	lui	a4,0x6
    2ad4:	4cc72783          	lw	a5,1228(a4) # 64cc <OLED>
    2ad8:	2af00693          	li	a3,687
    2adc:	00d7a023          	sw	a3,0(a5)
    2ae0:	000407b7          	lui	a5,0x40
    2ae4:	00000013          	nop
    2ae8:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
    2aec:	fe079ce3          	bnez	a5,2ae4 <oled_init_mode+0x70>
    2af0:	4cc72403          	lw	s0,1228(a4)
    2af4:	2a000793          	li	a5,672
    2af8:	00a12623          	sw	a0,12(sp)
    2afc:	00f42023          	sw	a5,0(s0)
    2b00:	00000097          	auipc	ra,0x0
    2b04:	f54080e7          	jalr	-172(ra) # 2a54 <oled_wait>
    2b08:	00c12503          	lw	a0,12(sp)
    2b0c:	4a000793          	li	a5,1184
    2b10:	00050463          	beqz	a0,2b18 <oled_init_mode+0xa4>
    2b14:	42000793          	li	a5,1056
    2b18:	00f42023          	sw	a5,0(s0)
    2b1c:	00000097          	auipc	ra,0x0
    2b20:	f38080e7          	jalr	-200(ra) # 2a54 <oled_wait>
    2b24:	2fd00793          	li	a5,765
    2b28:	00f42023          	sw	a5,0(s0)
    2b2c:	00000097          	auipc	ra,0x0
    2b30:	f28080e7          	jalr	-216(ra) # 2a54 <oled_wait>
    2b34:	4b100793          	li	a5,1201
    2b38:	00f42023          	sw	a5,0(s0)
    2b3c:	00000097          	auipc	ra,0x0
    2b40:	f18080e7          	jalr	-232(ra) # 2a54 <oled_wait>
    2b44:	2a200793          	li	a5,674
    2b48:	00f42023          	sw	a5,0(s0)
    2b4c:	00000097          	auipc	ra,0x0
    2b50:	f08080e7          	jalr	-248(ra) # 2a54 <oled_wait>
    2b54:	40000793          	li	a5,1024
    2b58:	00f42023          	sw	a5,0(s0)
    2b5c:	01812403          	lw	s0,24(sp)
    2b60:	01c12083          	lw	ra,28(sp)
    2b64:	02010113          	addi	sp,sp,32
    2b68:	00000317          	auipc	t1,0x0
    2b6c:	eec30067          	jr	-276(t1) # 2a54 <oled_wait>

00002b70 <oled_init>:
    2b70:	00000513          	li	a0,0
    2b74:	00000317          	auipc	t1,0x0
    2b78:	f0030067          	jr	-256(t1) # 2a74 <oled_init_mode>

00002b7c <oled_fullscreen>:
    2b7c:	ff010113          	addi	sp,sp,-16
    2b80:	000067b7          	lui	a5,0x6
    2b84:	00812423          	sw	s0,8(sp)
    2b88:	4cc7a403          	lw	s0,1228(a5) # 64cc <OLED>
    2b8c:	00112623          	sw	ra,12(sp)
    2b90:	00912223          	sw	s1,4(sp)
    2b94:	01212023          	sw	s2,0(sp)
    2b98:	21500793          	li	a5,533
    2b9c:	00f42023          	sw	a5,0(s0)
    2ba0:	40000913          	li	s2,1024
    2ba4:	00000097          	auipc	ra,0x0
    2ba8:	eb0080e7          	jalr	-336(ra) # 2a54 <oled_wait>
    2bac:	47f00493          	li	s1,1151
    2bb0:	01242023          	sw	s2,0(s0)
    2bb4:	00000097          	auipc	ra,0x0
    2bb8:	ea0080e7          	jalr	-352(ra) # 2a54 <oled_wait>
    2bbc:	00942023          	sw	s1,0(s0)
    2bc0:	00000097          	auipc	ra,0x0
    2bc4:	e94080e7          	jalr	-364(ra) # 2a54 <oled_wait>
    2bc8:	27500793          	li	a5,629
    2bcc:	00f42023          	sw	a5,0(s0)
    2bd0:	00000097          	auipc	ra,0x0
    2bd4:	e84080e7          	jalr	-380(ra) # 2a54 <oled_wait>
    2bd8:	01242023          	sw	s2,0(s0)
    2bdc:	00000097          	auipc	ra,0x0
    2be0:	e78080e7          	jalr	-392(ra) # 2a54 <oled_wait>
    2be4:	00942023          	sw	s1,0(s0)
    2be8:	00000097          	auipc	ra,0x0
    2bec:	e6c080e7          	jalr	-404(ra) # 2a54 <oled_wait>
    2bf0:	25c00793          	li	a5,604
    2bf4:	00f42023          	sw	a5,0(s0)
    2bf8:	00812403          	lw	s0,8(sp)
    2bfc:	00c12083          	lw	ra,12(sp)
    2c00:	00412483          	lw	s1,4(sp)
    2c04:	00012903          	lw	s2,0(sp)
    2c08:	01010113          	addi	sp,sp,16
    2c0c:	00000317          	auipc	t1,0x0
    2c10:	e4830067          	jr	-440(t1) # 2a54 <oled_wait>

00002c14 <display_framebuffer>:
    2c14:	000067b7          	lui	a5,0x6
    2c18:	4bc7a503          	lw	a0,1212(a5) # 64bc <DISPLAY>
    2c1c:	00008067          	ret

00002c20 <display_set_cursor>:
    2c20:	000077b7          	lui	a5,0x7
    2c24:	aea7a623          	sw	a0,-1300(a5) # 6aec <cursor_x>
    2c28:	000077b7          	lui	a5,0x7
    2c2c:	aeb7a423          	sw	a1,-1304(a5) # 6ae8 <cursor_y>
    2c30:	00008067          	ret

00002c34 <display_set_front_back_color>:
    2c34:	000077b7          	lui	a5,0x7
    2c38:	aea782a3          	sb	a0,-1307(a5) # 6ae5 <front_color>
    2c3c:	000077b7          	lui	a5,0x7
    2c40:	aeb78223          	sb	a1,-1308(a5) # 6ae4 <back_color>
    2c44:	00008067          	ret

00002c48 <display_putchar>:
    2c48:	00a00793          	li	a5,10
    2c4c:	00007737          	lui	a4,0x7
    2c50:	02f51663          	bne	a0,a5,2c7c <display_putchar+0x34>
    2c54:	ae072623          	sw	zero,-1300(a4) # 6aec <cursor_x>
    2c58:	00007737          	lui	a4,0x7
    2c5c:	ae872783          	lw	a5,-1304(a4) # 6ae8 <cursor_y>
    2c60:	00878793          	addi	a5,a5,8
    2c64:	aef72423          	sw	a5,-1304(a4)
    2c68:	07f00713          	li	a4,127
    2c6c:	00f75663          	bge	a4,a5,2c78 <display_putchar+0x30>
    2c70:	000077b7          	lui	a5,0x7
    2c74:	ae07a423          	sw	zero,-1304(a5) # 6ae8 <cursor_y>
    2c78:	00008067          	ret
    2c7c:	ff010113          	addi	sp,sp,-16
    2c80:	00812623          	sw	s0,12(sp)
    2c84:	01f00793          	li	a5,31
    2c88:	0ca7d263          	bge	a5,a0,2d4c <display_putchar+0x104>
    2c8c:	00007e37          	lui	t3,0x7
    2c90:	ae8e2783          	lw	a5,-1304(t3) # 6ae8 <cursor_y>
    2c94:	07800693          	li	a3,120
    2c98:	00800593          	li	a1,8
    2c9c:	00f6d663          	bge	a3,a5,2ca8 <display_putchar+0x60>
    2ca0:	08000593          	li	a1,128
    2ca4:	40f585b3          	sub	a1,a1,a5
    2ca8:	aec72783          	lw	a5,-1300(a4)
    2cac:	07b00693          	li	a3,123
    2cb0:	00500813          	li	a6,5
    2cb4:	00f6d663          	bge	a3,a5,2cc0 <display_putchar+0x78>
    2cb8:	08000813          	li	a6,128
    2cbc:	40f80833          	sub	a6,a6,a5
    2cc0:	000067b7          	lui	a5,0x6
    2cc4:	4bc7a283          	lw	t0,1212(a5) # 64bc <DISPLAY>
    2cc8:	000066b7          	lui	a3,0x6
    2ccc:	00251793          	slli	a5,a0,0x2
    2cd0:	6d068693          	addi	a3,a3,1744 # 66d0 <font>
    2cd4:	00a787b3          	add	a5,a5,a0
    2cd8:	00d78533          	add	a0,a5,a3
    2cdc:	00100f93          	li	t6,1
    2ce0:	00000693          	li	a3,0
    2ce4:	000073b7          	lui	t2,0x7
    2ce8:	00007437          	lui	s0,0x7
    2cec:	06b6d063          	bge	a3,a1,2d4c <display_putchar+0x104>
    2cf0:	00df9f33          	sll	t5,t6,a3
    2cf4:	00050893          	mv	a7,a0
    2cf8:	00000613          	li	a2,0
    2cfc:	03c0006f          	j	2d38 <display_putchar+0xf0>
    2d00:	f608c783          	lbu	a5,-160(a7)
    2d04:	01e7f7b3          	and	a5,a5,t5
    2d08:	02078e63          	beqz	a5,2d44 <display_putchar+0xfc>
    2d0c:	ae544e83          	lbu	t4,-1307(s0) # 6ae5 <front_color>
    2d10:	aec72783          	lw	a5,-1300(a4)
    2d14:	ae8e2303          	lw	t1,-1304(t3)
    2d18:	00188893          	addi	a7,a7,1
    2d1c:	00f607b3          	add	a5,a2,a5
    2d20:	00779793          	slli	a5,a5,0x7
    2d24:	00668333          	add	t1,a3,t1
    2d28:	006787b3          	add	a5,a5,t1
    2d2c:	00f287b3          	add	a5,t0,a5
    2d30:	01d78023          	sb	t4,0(a5)
    2d34:	00160613          	addi	a2,a2,1 # 4001 <fatfs_compare_names+0xb9>
    2d38:	fd0644e3          	blt	a2,a6,2d00 <display_putchar+0xb8>
    2d3c:	00168693          	addi	a3,a3,1
    2d40:	fadff06f          	j	2cec <display_putchar+0xa4>
    2d44:	ae43ce83          	lbu	t4,-1308(t2) # 6ae4 <back_color>
    2d48:	fc9ff06f          	j	2d10 <display_putchar+0xc8>
    2d4c:	aec72783          	lw	a5,-1300(a4)
    2d50:	07f00693          	li	a3,127
    2d54:	00578793          	addi	a5,a5,5
    2d58:	00f6c663          	blt	a3,a5,2d64 <display_putchar+0x11c>
    2d5c:	aef72623          	sw	a5,-1300(a4)
    2d60:	0240006f          	j	2d84 <display_putchar+0x13c>
    2d64:	ae072623          	sw	zero,-1300(a4)
    2d68:	00007737          	lui	a4,0x7
    2d6c:	ae872783          	lw	a5,-1304(a4) # 6ae8 <cursor_y>
    2d70:	00878793          	addi	a5,a5,8
    2d74:	aef72423          	sw	a5,-1304(a4)
    2d78:	00f6d663          	bge	a3,a5,2d84 <display_putchar+0x13c>
    2d7c:	000077b7          	lui	a5,0x7
    2d80:	ae07a423          	sw	zero,-1304(a5) # 6ae8 <cursor_y>
    2d84:	00c12403          	lw	s0,12(sp)
    2d88:	01010113          	addi	sp,sp,16
    2d8c:	00008067          	ret

00002d90 <display_refresh>:
    2d90:	00008067          	ret

00002d94 <print_string>:
    2d94:	ff010113          	addi	sp,sp,-16
    2d98:	00812423          	sw	s0,8(sp)
    2d9c:	00912223          	sw	s1,4(sp)
    2da0:	00112623          	sw	ra,12(sp)
    2da4:	00050413          	mv	s0,a0
    2da8:	000074b7          	lui	s1,0x7
    2dac:	00044503          	lbu	a0,0(s0)
    2db0:	00051c63          	bnez	a0,2dc8 <print_string+0x34>
    2db4:	00c12083          	lw	ra,12(sp)
    2db8:	00812403          	lw	s0,8(sp)
    2dbc:	00412483          	lw	s1,4(sp)
    2dc0:	01010113          	addi	sp,sp,16
    2dc4:	00008067          	ret
    2dc8:	af04a783          	lw	a5,-1296(s1) # 6af0 <f_putchar>
    2dcc:	00140413          	addi	s0,s0,1
    2dd0:	000780e7          	jalr	a5
    2dd4:	fd9ff06f          	j	2dac <print_string+0x18>

00002dd8 <print_dec>:
    2dd8:	ef010113          	addi	sp,sp,-272
    2ddc:	10812423          	sw	s0,264(sp)
    2de0:	10912223          	sw	s1,260(sp)
    2de4:	10112623          	sw	ra,268(sp)
    2de8:	11212023          	sw	s2,256(sp)
    2dec:	00050413          	mv	s0,a0
    2df0:	000074b7          	lui	s1,0x7
    2df4:	08045063          	bgez	s0,2e74 <print_dec+0x9c>
    2df8:	af04a783          	lw	a5,-1296(s1) # 6af0 <f_putchar>
    2dfc:	02d00513          	li	a0,45
    2e00:	40800433          	neg	s0,s0
    2e04:	000780e7          	jalr	a5
    2e08:	fedff06f          	j	2df4 <print_dec+0x1c>
    2e0c:	00040513          	mv	a0,s0
    2e10:	00a00593          	li	a1,10
    2e14:	00000097          	auipc	ra,0x0
    2e18:	aa8080e7          	jalr	-1368(ra) # 28bc <__divsi3>
    2e1c:	00251793          	slli	a5,a0,0x2
    2e20:	00f507b3          	add	a5,a0,a5
    2e24:	00179793          	slli	a5,a5,0x1
    2e28:	40f40433          	sub	s0,s0,a5
    2e2c:	00148493          	addi	s1,s1,1
    2e30:	fe848fa3          	sb	s0,-1(s1)
    2e34:	00050413          	mv	s0,a0
    2e38:	fc041ae3          	bnez	s0,2e0c <print_dec+0x34>
    2e3c:	fd2488e3          	beq	s1,s2,2e0c <print_dec+0x34>
    2e40:	00007437          	lui	s0,0x7
    2e44:	fff4c503          	lbu	a0,-1(s1)
    2e48:	af042783          	lw	a5,-1296(s0) # 6af0 <f_putchar>
    2e4c:	fff48493          	addi	s1,s1,-1
    2e50:	03050513          	addi	a0,a0,48
    2e54:	000780e7          	jalr	a5
    2e58:	ff2496e3          	bne	s1,s2,2e44 <print_dec+0x6c>
    2e5c:	10c12083          	lw	ra,268(sp)
    2e60:	10812403          	lw	s0,264(sp)
    2e64:	10412483          	lw	s1,260(sp)
    2e68:	10012903          	lw	s2,256(sp)
    2e6c:	11010113          	addi	sp,sp,272
    2e70:	00008067          	ret
    2e74:	00010493          	mv	s1,sp
    2e78:	00010913          	mv	s2,sp
    2e7c:	fbdff06f          	j	2e38 <print_dec+0x60>

00002e80 <print_hex_digits>:
    2e80:	fe010113          	addi	sp,sp,-32
    2e84:	00812c23          	sw	s0,24(sp)
    2e88:	00912a23          	sw	s1,20(sp)
    2e8c:	fff58413          	addi	s0,a1,-1
    2e90:	000064b7          	lui	s1,0x6
    2e94:	01212823          	sw	s2,16(sp)
    2e98:	01312623          	sw	s3,12(sp)
    2e9c:	00112e23          	sw	ra,28(sp)
    2ea0:	00050993          	mv	s3,a0
    2ea4:	00241413          	slli	s0,s0,0x2
    2ea8:	68848493          	addi	s1,s1,1672 # 6688 <LEDS+0x1b8>
    2eac:	00007937          	lui	s2,0x7
    2eb0:	02045063          	bgez	s0,2ed0 <print_hex_digits+0x50>
    2eb4:	01c12083          	lw	ra,28(sp)
    2eb8:	01812403          	lw	s0,24(sp)
    2ebc:	01412483          	lw	s1,20(sp)
    2ec0:	01012903          	lw	s2,16(sp)
    2ec4:	00c12983          	lw	s3,12(sp)
    2ec8:	02010113          	addi	sp,sp,32
    2ecc:	00008067          	ret
    2ed0:	0089d7b3          	srl	a5,s3,s0
    2ed4:	00f7f793          	andi	a5,a5,15
    2ed8:	00f487b3          	add	a5,s1,a5
    2edc:	af092703          	lw	a4,-1296(s2) # 6af0 <f_putchar>
    2ee0:	0007c503          	lbu	a0,0(a5)
    2ee4:	ffc40413          	addi	s0,s0,-4
    2ee8:	000700e7          	jalr	a4
    2eec:	fc5ff06f          	j	2eb0 <print_hex_digits+0x30>

00002ef0 <print_hex>:
    2ef0:	00800593          	li	a1,8
    2ef4:	00000317          	auipc	t1,0x0
    2ef8:	f8c30067          	jr	-116(t1) # 2e80 <print_hex_digits>

00002efc <printf>:
    2efc:	fa010113          	addi	sp,sp,-96
    2f00:	04f12a23          	sw	a5,84(sp)
    2f04:	04410793          	addi	a5,sp,68
    2f08:	02812c23          	sw	s0,56(sp)
    2f0c:	02912a23          	sw	s1,52(sp)
    2f10:	03212823          	sw	s2,48(sp)
    2f14:	03312623          	sw	s3,44(sp)
    2f18:	03412423          	sw	s4,40(sp)
    2f1c:	03512223          	sw	s5,36(sp)
    2f20:	03612023          	sw	s6,32(sp)
    2f24:	02112e23          	sw	ra,60(sp)
    2f28:	01712e23          	sw	s7,28(sp)
    2f2c:	00050413          	mv	s0,a0
    2f30:	04b12223          	sw	a1,68(sp)
    2f34:	04c12423          	sw	a2,72(sp)
    2f38:	04d12623          	sw	a3,76(sp)
    2f3c:	04e12823          	sw	a4,80(sp)
    2f40:	05012c23          	sw	a6,88(sp)
    2f44:	05112e23          	sw	a7,92(sp)
    2f48:	00f12623          	sw	a5,12(sp)
    2f4c:	02500913          	li	s2,37
    2f50:	000074b7          	lui	s1,0x7
    2f54:	07300993          	li	s3,115
    2f58:	07800a13          	li	s4,120
    2f5c:	06400a93          	li	s5,100
    2f60:	06300b13          	li	s6,99
    2f64:	00044503          	lbu	a0,0(s0)
    2f68:	02051863          	bnez	a0,2f98 <printf+0x9c>
    2f6c:	03c12083          	lw	ra,60(sp)
    2f70:	03812403          	lw	s0,56(sp)
    2f74:	03412483          	lw	s1,52(sp)
    2f78:	03012903          	lw	s2,48(sp)
    2f7c:	02c12983          	lw	s3,44(sp)
    2f80:	02812a03          	lw	s4,40(sp)
    2f84:	02412a83          	lw	s5,36(sp)
    2f88:	02012b03          	lw	s6,32(sp)
    2f8c:	01c12b83          	lw	s7,28(sp)
    2f90:	06010113          	addi	sp,sp,96
    2f94:	00008067          	ret
    2f98:	09251a63          	bne	a0,s2,302c <printf+0x130>
    2f9c:	00144503          	lbu	a0,1(s0)
    2fa0:	00140b93          	addi	s7,s0,1
    2fa4:	03351463          	bne	a0,s3,2fcc <printf+0xd0>
    2fa8:	00c12783          	lw	a5,12(sp)
    2fac:	0007a503          	lw	a0,0(a5)
    2fb0:	00478713          	addi	a4,a5,4
    2fb4:	00e12623          	sw	a4,12(sp)
    2fb8:	00000097          	auipc	ra,0x0
    2fbc:	ddc080e7          	jalr	-548(ra) # 2d94 <print_string>
    2fc0:	000b8413          	mv	s0,s7
    2fc4:	00140413          	addi	s0,s0,1
    2fc8:	f9dff06f          	j	2f64 <printf+0x68>
    2fcc:	03451063          	bne	a0,s4,2fec <printf+0xf0>
    2fd0:	00c12783          	lw	a5,12(sp)
    2fd4:	0007a503          	lw	a0,0(a5)
    2fd8:	00478713          	addi	a4,a5,4
    2fdc:	00e12623          	sw	a4,12(sp)
    2fe0:	00000097          	auipc	ra,0x0
    2fe4:	f10080e7          	jalr	-240(ra) # 2ef0 <print_hex>
    2fe8:	fd9ff06f          	j	2fc0 <printf+0xc4>
    2fec:	03551063          	bne	a0,s5,300c <printf+0x110>
    2ff0:	00c12783          	lw	a5,12(sp)
    2ff4:	0007a503          	lw	a0,0(a5)
    2ff8:	00478713          	addi	a4,a5,4
    2ffc:	00e12623          	sw	a4,12(sp)
    3000:	00000097          	auipc	ra,0x0
    3004:	dd8080e7          	jalr	-552(ra) # 2dd8 <print_dec>
    3008:	fb9ff06f          	j	2fc0 <printf+0xc4>
    300c:	af04a783          	lw	a5,-1296(s1) # 6af0 <f_putchar>
    3010:	01651a63          	bne	a0,s6,3024 <printf+0x128>
    3014:	00c12703          	lw	a4,12(sp)
    3018:	00072503          	lw	a0,0(a4)
    301c:	00470693          	addi	a3,a4,4
    3020:	00d12623          	sw	a3,12(sp)
    3024:	000780e7          	jalr	a5
    3028:	f99ff06f          	j	2fc0 <printf+0xc4>
    302c:	af04a783          	lw	a5,-1296(s1)
    3030:	000780e7          	jalr	a5
    3034:	f91ff06f          	j	2fc4 <printf+0xc8>

00003038 <__mulsi3>:
    3038:	00050793          	mv	a5,a0
    303c:	00000513          	li	a0,0
    3040:	00079463          	bnez	a5,3048 <__mulsi3+0x10>
    3044:	00008067          	ret
    3048:	01f79693          	slli	a3,a5,0x1f
    304c:	41f6d713          	srai	a4,a3,0x1f
    3050:	00b77733          	and	a4,a4,a1
    3054:	00e50533          	add	a0,a0,a4
    3058:	0017d793          	srli	a5,a5,0x1
    305c:	00159593          	slli	a1,a1,0x1
    3060:	fe1ff06f          	j	3040 <__mulsi3+0x8>

00003064 <fat_list_insert_last>:
    3064:	00452783          	lw	a5,4(a0)
    3068:	04079263          	bnez	a5,30ac <fat_list_insert_last+0x48>
    306c:	00052783          	lw	a5,0(a0)
    3070:	00079c63          	bnez	a5,3088 <fat_list_insert_last+0x24>
    3074:	00b52023          	sw	a1,0(a0)
    3078:	00b52223          	sw	a1,4(a0)
    307c:	0005a023          	sw	zero,0(a1)
    3080:	0005a223          	sw	zero,4(a1)
    3084:	00008067          	ret
    3088:	0007a703          	lw	a4,0(a5)
    308c:	00f5a223          	sw	a5,4(a1)
    3090:	00e5a023          	sw	a4,0(a1)
    3094:	00071863          	bnez	a4,30a4 <fat_list_insert_last+0x40>
    3098:	00b52023          	sw	a1,0(a0)
    309c:	00b7a023          	sw	a1,0(a5)
    30a0:	00008067          	ret
    30a4:	00b72223          	sw	a1,4(a4)
    30a8:	ff5ff06f          	j	309c <fat_list_insert_last+0x38>
    30ac:	0047a703          	lw	a4,4(a5)
    30b0:	00f5a023          	sw	a5,0(a1)
    30b4:	00e5a223          	sw	a4,4(a1)
    30b8:	00071863          	bnez	a4,30c8 <fat_list_insert_last+0x64>
    30bc:	00b52223          	sw	a1,4(a0)
    30c0:	00b7a223          	sw	a1,4(a5)
    30c4:	00008067          	ret
    30c8:	00b72023          	sw	a1,0(a4)
    30cc:	ff5ff06f          	j	30c0 <fat_list_insert_last+0x5c>

000030d0 <FileString_StrCmpNoCase>:
    30d0:	00050e93          	mv	t4,a0
    30d4:	00000793          	li	a5,0
    30d8:	01900e13          	li	t3,25
    30dc:	00c79663          	bne	a5,a2,30e8 <FileString_StrCmpNoCase+0x18>
    30e0:	00000513          	li	a0,0
    30e4:	00008067          	ret
    30e8:	00fe8733          	add	a4,t4,a5
    30ec:	00074803          	lbu	a6,0(a4)
    30f0:	00f58733          	add	a4,a1,a5
    30f4:	00074883          	lbu	a7,0(a4)
    30f8:	fbf80713          	addi	a4,a6,-65
    30fc:	0ff77713          	zext.b	a4,a4
    3100:	00080693          	mv	a3,a6
    3104:	00ee6663          	bltu	t3,a4,3110 <FileString_StrCmpNoCase+0x40>
    3108:	02080693          	addi	a3,a6,32
    310c:	0ff6f693          	zext.b	a3,a3
    3110:	fbf88313          	addi	t1,a7,-65
    3114:	0ff37313          	zext.b	t1,t1
    3118:	00088713          	mv	a4,a7
    311c:	006e6663          	bltu	t3,t1,3128 <FileString_StrCmpNoCase+0x58>
    3120:	02088713          	addi	a4,a7,32
    3124:	0ff77713          	zext.b	a4,a4
    3128:	40e68533          	sub	a0,a3,a4
    312c:	00e69863          	bne	a3,a4,313c <FileString_StrCmpNoCase+0x6c>
    3130:	00178793          	addi	a5,a5,1
    3134:	00088463          	beqz	a7,313c <FileString_StrCmpNoCase+0x6c>
    3138:	fa0812e3          	bnez	a6,30dc <FileString_StrCmpNoCase+0xc>
    313c:	00008067          	ret

00003140 <FileString_GetExtension>:
    3140:	00050793          	mv	a5,a0
    3144:	fff00713          	li	a4,-1
    3148:	02e00613          	li	a2,46
    314c:	0007c683          	lbu	a3,0(a5)
    3150:	00069663          	bnez	a3,315c <FileString_GetExtension+0x1c>
    3154:	00070513          	mv	a0,a4
    3158:	00008067          	ret
    315c:	00c69463          	bne	a3,a2,3164 <FileString_GetExtension+0x24>
    3160:	40a78733          	sub	a4,a5,a0
    3164:	00178793          	addi	a5,a5,1
    3168:	fe5ff06f          	j	314c <FileString_GetExtension+0xc>

0000316c <fatfs_fat_writeback>:
    316c:	00059e63          	bnez	a1,3188 <fatfs_fat_writeback+0x1c>
    3170:	00000513          	li	a0,0
    3174:	00008067          	ret
    3178:	00000513          	li	a0,0
    317c:	01c12083          	lw	ra,28(sp)
    3180:	02010113          	addi	sp,sp,32
    3184:	00008067          	ret
    3188:	2045a783          	lw	a5,516(a1)
    318c:	04078e63          	beqz	a5,31e8 <fatfs_fat_writeback+0x7c>
    3190:	03852683          	lw	a3,56(a0)
    3194:	00050793          	mv	a5,a0
    3198:	04068663          	beqz	a3,31e4 <fatfs_fat_writeback+0x78>
    319c:	0147a703          	lw	a4,20(a5)
    31a0:	2005a503          	lw	a0,512(a1)
    31a4:	0207a803          	lw	a6,32(a5)
    31a8:	00100613          	li	a2,1
    31ac:	fe010113          	addi	sp,sp,-32
    31b0:	40e607b3          	sub	a5,a2,a4
    31b4:	00112e23          	sw	ra,28(sp)
    31b8:	00a787b3          	add	a5,a5,a0
    31bc:	00f87663          	bgeu	a6,a5,31c8 <fatfs_fat_writeback+0x5c>
    31c0:	01070733          	add	a4,a4,a6
    31c4:	40a70633          	sub	a2,a4,a0
    31c8:	00b12623          	sw	a1,12(sp)
    31cc:	000680e7          	jalr	a3
    31d0:	fa0504e3          	beqz	a0,3178 <fatfs_fat_writeback+0xc>
    31d4:	00c12583          	lw	a1,12(sp)
    31d8:	00100513          	li	a0,1
    31dc:	2005a223          	sw	zero,516(a1)
    31e0:	f9dff06f          	j	317c <fatfs_fat_writeback+0x10>
    31e4:	2005a223          	sw	zero,516(a1)
    31e8:	00100513          	li	a0,1
    31ec:	00008067          	ret

000031f0 <fatfs_fat_read_sector>:
    31f0:	fe010113          	addi	sp,sp,-32
    31f4:	01212823          	sw	s2,16(sp)
    31f8:	25452903          	lw	s2,596(a0)
    31fc:	00812c23          	sw	s0,24(sp)
    3200:	00112e23          	sw	ra,28(sp)
    3204:	00912a23          	sw	s1,20(sp)
    3208:	01312623          	sw	s3,12(sp)
    320c:	00000413          	li	s0,0
    3210:	04091463          	bnez	s2,3258 <fatfs_fat_read_sector+0x68>
    3214:	25452783          	lw	a5,596(a0)
    3218:	00058493          	mv	s1,a1
    321c:	00050993          	mv	s3,a0
    3220:	20f42623          	sw	a5,524(s0)
    3224:	20442783          	lw	a5,516(s0)
    3228:	24852a23          	sw	s0,596(a0)
    322c:	08079863          	bnez	a5,32bc <fatfs_fat_read_sector+0xcc>
    3230:	0349a783          	lw	a5,52(s3)
    3234:	20942023          	sw	s1,512(s0)
    3238:	00100613          	li	a2,1
    323c:	00040593          	mv	a1,s0
    3240:	00048513          	mv	a0,s1
    3244:	000780e7          	jalr	a5
    3248:	08051463          	bnez	a0,32d0 <fatfs_fat_read_sector+0xe0>
    324c:	fff00793          	li	a5,-1
    3250:	20f42023          	sw	a5,512(s0)
    3254:	0480006f          	j	329c <fatfs_fat_read_sector+0xac>
    3258:	20092783          	lw	a5,512(s2)
    325c:	00f5e663          	bltu	a1,a5,3268 <fatfs_fat_read_sector+0x78>
    3260:	00178713          	addi	a4,a5,1
    3264:	02e5e463          	bltu	a1,a4,328c <fatfs_fat_read_sector+0x9c>
    3268:	20c92783          	lw	a5,524(s2)
    326c:	00079663          	bnez	a5,3278 <fatfs_fat_read_sector+0x88>
    3270:	00040a63          	beqz	s0,3284 <fatfs_fat_read_sector+0x94>
    3274:	20042623          	sw	zero,524(s0)
    3278:	00090413          	mv	s0,s2
    327c:	20c92903          	lw	s2,524(s2)
    3280:	f91ff06f          	j	3210 <fatfs_fat_read_sector+0x20>
    3284:	24052a23          	sw	zero,596(a0)
    3288:	ff1ff06f          	j	3278 <fatfs_fat_read_sector+0x88>
    328c:	40f585b3          	sub	a1,a1,a5
    3290:	00959593          	slli	a1,a1,0x9
    3294:	00b905b3          	add	a1,s2,a1
    3298:	20b92423          	sw	a1,520(s2)
    329c:	01c12083          	lw	ra,28(sp)
    32a0:	01812403          	lw	s0,24(sp)
    32a4:	01412483          	lw	s1,20(sp)
    32a8:	00c12983          	lw	s3,12(sp)
    32ac:	00090513          	mv	a0,s2
    32b0:	01012903          	lw	s2,16(sp)
    32b4:	02010113          	addi	sp,sp,32
    32b8:	00008067          	ret
    32bc:	00040593          	mv	a1,s0
    32c0:	00000097          	auipc	ra,0x0
    32c4:	eac080e7          	jalr	-340(ra) # 316c <fatfs_fat_writeback>
    32c8:	f60514e3          	bnez	a0,3230 <fatfs_fat_read_sector+0x40>
    32cc:	fd1ff06f          	j	329c <fatfs_fat_read_sector+0xac>
    32d0:	20842423          	sw	s0,520(s0)
    32d4:	00040913          	mv	s2,s0
    32d8:	fc5ff06f          	j	329c <fatfs_fat_read_sector+0xac>

000032dc <_allocate_file>:
    32dc:	000077b7          	lui	a5,0x7
    32e0:	af478793          	addi	a5,a5,-1292 # 6af4 <_free_file_list>
    32e4:	0007a583          	lw	a1,0(a5)
    32e8:	06058263          	beqz	a1,334c <_allocate_file+0x70>
    32ec:	0005a703          	lw	a4,0(a1)
    32f0:	fe010113          	addi	sp,sp,-32
    32f4:	00112e23          	sw	ra,28(sp)
    32f8:	0045a683          	lw	a3,4(a1)
    32fc:	04071063          	bnez	a4,333c <_allocate_file+0x60>
    3300:	00d7a023          	sw	a3,0(a5)
    3304:	0045a683          	lw	a3,4(a1)
    3308:	02069e63          	bnez	a3,3344 <_allocate_file+0x68>
    330c:	00e7a223          	sw	a4,4(a5)
    3310:	00007537          	lui	a0,0x7
    3314:	afc50513          	addi	a0,a0,-1284 # 6afc <_open_file_list>
    3318:	00b12623          	sw	a1,12(sp)
    331c:	00000097          	auipc	ra,0x0
    3320:	d48080e7          	jalr	-696(ra) # 3064 <fat_list_insert_last>
    3324:	00c12583          	lw	a1,12(sp)
    3328:	01c12083          	lw	ra,28(sp)
    332c:	bc458593          	addi	a1,a1,-1084
    3330:	00058513          	mv	a0,a1
    3334:	02010113          	addi	sp,sp,32
    3338:	00008067          	ret
    333c:	00d72223          	sw	a3,4(a4)
    3340:	fc5ff06f          	j	3304 <_allocate_file+0x28>
    3344:	00e6a023          	sw	a4,0(a3)
    3348:	fc9ff06f          	j	3310 <_allocate_file+0x34>
    334c:	00058513          	mv	a0,a1
    3350:	00008067          	ret

00003354 <_free_file>:
    3354:	43c52783          	lw	a5,1084(a0)
    3358:	44052703          	lw	a4,1088(a0)
    335c:	43c50593          	addi	a1,a0,1084
    3360:	02079663          	bnez	a5,338c <_free_file+0x38>
    3364:	000076b7          	lui	a3,0x7
    3368:	aee6ae23          	sw	a4,-1284(a3) # 6afc <_open_file_list>
    336c:	44052703          	lw	a4,1088(a0)
    3370:	02071263          	bnez	a4,3394 <_free_file+0x40>
    3374:	00007737          	lui	a4,0x7
    3378:	b0f72023          	sw	a5,-1280(a4) # 6b00 <_open_file_list+0x4>
    337c:	00007537          	lui	a0,0x7
    3380:	af450513          	addi	a0,a0,-1292 # 6af4 <_free_file_list>
    3384:	00000317          	auipc	t1,0x0
    3388:	ce030067          	jr	-800(t1) # 3064 <fat_list_insert_last>
    338c:	00e7a223          	sw	a4,4(a5)
    3390:	fddff06f          	j	336c <_free_file+0x18>
    3394:	00f72023          	sw	a5,0(a4)
    3398:	fe5ff06f          	j	337c <_free_file+0x28>

0000339c <fatfs_lba_of_cluster>:
    339c:	ff010113          	addi	sp,sp,-16
    33a0:	00812423          	sw	s0,8(sp)
    33a4:	00112623          	sw	ra,12(sp)
    33a8:	00050413          	mv	s0,a0
    33ac:	ffe58513          	addi	a0,a1,-2
    33b0:	00044583          	lbu	a1,0(s0)
    33b4:	00000097          	auipc	ra,0x0
    33b8:	c84080e7          	jalr	-892(ra) # 3038 <__mulsi3>
    33bc:	00442783          	lw	a5,4(s0)
    33c0:	00f50533          	add	a0,a0,a5
    33c4:	03042783          	lw	a5,48(s0)
    33c8:	00079863          	bnez	a5,33d8 <fatfs_lba_of_cluster+0x3c>
    33cc:	02845783          	lhu	a5,40(s0)
    33d0:	4047d793          	srai	a5,a5,0x4
    33d4:	00f50533          	add	a0,a0,a5
    33d8:	00c12083          	lw	ra,12(sp)
    33dc:	00812403          	lw	s0,8(sp)
    33e0:	01010113          	addi	sp,sp,16
    33e4:	00008067          	ret

000033e8 <fatfs_sector_read>:
    33e8:	03452783          	lw	a5,52(a0)
    33ec:	00058713          	mv	a4,a1
    33f0:	00070513          	mv	a0,a4
    33f4:	00060593          	mv	a1,a2
    33f8:	00068613          	mv	a2,a3
    33fc:	00078067          	jr	a5

00003400 <fatfs_sector_write>:
    3400:	03852783          	lw	a5,56(a0)
    3404:	00058713          	mv	a4,a1
    3408:	00070513          	mv	a0,a4
    340c:	00060593          	mv	a1,a2
    3410:	00068613          	mv	a2,a3
    3414:	00078067          	jr	a5

00003418 <fatfs_write_sector>:
    3418:	03852703          	lw	a4,56(a0)
    341c:	0a070463          	beqz	a4,34c4 <fatfs_write_sector+0xac>
    3420:	03052883          	lw	a7,48(a0)
    3424:	00050793          	mv	a5,a0
    3428:	0115e833          	or	a6,a1,a7
    342c:	02081e63          	bnez	a6,3468 <fatfs_write_sector+0x50>
    3430:	01052583          	lw	a1,16(a0)
    3434:	08b67863          	bgeu	a2,a1,34c4 <fatfs_write_sector+0xac>
    3438:	01c52503          	lw	a0,28(a0)
    343c:	00c7a583          	lw	a1,12(a5)
    3440:	00b50533          	add	a0,a0,a1
    3444:	00c50533          	add	a0,a0,a2
    3448:	00068863          	beqz	a3,3458 <fatfs_write_sector+0x40>
    344c:	00100613          	li	a2,1
    3450:	00068593          	mv	a1,a3
    3454:	00070067          	jr	a4
    3458:	24a7a223          	sw	a0,580(a5)
    345c:	00100613          	li	a2,1
    3460:	04478593          	addi	a1,a5,68
    3464:	ff1ff06f          	j	3454 <fatfs_write_sector+0x3c>
    3468:	fe010113          	addi	sp,sp,-32
    346c:	00e12623          	sw	a4,12(sp)
    3470:	00d12423          	sw	a3,8(sp)
    3474:	00c12223          	sw	a2,4(sp)
    3478:	00112e23          	sw	ra,28(sp)
    347c:	00a12023          	sw	a0,0(sp)
    3480:	00000097          	auipc	ra,0x0
    3484:	f1c080e7          	jalr	-228(ra) # 339c <fatfs_lba_of_cluster>
    3488:	00412603          	lw	a2,4(sp)
    348c:	00812683          	lw	a3,8(sp)
    3490:	00012783          	lw	a5,0(sp)
    3494:	00c12703          	lw	a4,12(sp)
    3498:	00a60533          	add	a0,a2,a0
    349c:	00068c63          	beqz	a3,34b4 <fatfs_write_sector+0x9c>
    34a0:	00100613          	li	a2,1
    34a4:	00068593          	mv	a1,a3
    34a8:	01c12083          	lw	ra,28(sp)
    34ac:	02010113          	addi	sp,sp,32
    34b0:	fa5ff06f          	j	3454 <fatfs_write_sector+0x3c>
    34b4:	24a7a223          	sw	a0,580(a5)
    34b8:	00100613          	li	a2,1
    34bc:	04478593          	addi	a1,a5,68
    34c0:	fe9ff06f          	j	34a8 <fatfs_write_sector+0x90>
    34c4:	00000513          	li	a0,0
    34c8:	00008067          	ret

000034cc <fl_init>:
    34cc:	ff010113          	addi	sp,sp,-16
    34d0:	00007537          	lui	a0,0x7
    34d4:	000077b7          	lui	a5,0x7
    34d8:	000095b7          	lui	a1,0x9
    34dc:	00112623          	sw	ra,12(sp)
    34e0:	af450513          	addi	a0,a0,-1292 # 6af4 <_free_file_list>
    34e4:	afc78793          	addi	a5,a5,-1284 # 6afc <_open_file_list>
    34e8:	fcc58593          	addi	a1,a1,-52 # 8fcc <_files+0x43c>
    34ec:	00052223          	sw	zero,4(a0)
    34f0:	00052023          	sw	zero,0(a0)
    34f4:	0007a223          	sw	zero,4(a5)
    34f8:	0007a023          	sw	zero,0(a5)
    34fc:	00000097          	auipc	ra,0x0
    3500:	b68080e7          	jalr	-1176(ra) # 3064 <fat_list_insert_last>
    3504:	000077b7          	lui	a5,0x7
    3508:	000095b7          	lui	a1,0x9
    350c:	af478513          	addi	a0,a5,-1292 # 6af4 <_free_file_list>
    3510:	41058593          	addi	a1,a1,1040 # 9410 <_files+0x880>
    3514:	00000097          	auipc	ra,0x0
    3518:	b50080e7          	jalr	-1200(ra) # 3064 <fat_list_insert_last>
    351c:	00c12083          	lw	ra,12(sp)
    3520:	000077b7          	lui	a5,0x7
    3524:	00100713          	li	a4,1
    3528:	b0e7a423          	sw	a4,-1272(a5) # 6b08 <_filelib_init>
    352c:	01010113          	addi	sp,sp,16
    3530:	00008067          	ret

00003534 <fl_fseek>:
    3534:	000077b7          	lui	a5,0x7
    3538:	b087a783          	lw	a5,-1272(a5) # 6b08 <_filelib_init>
    353c:	fd010113          	addi	sp,sp,-48
    3540:	02812423          	sw	s0,40(sp)
    3544:	02912223          	sw	s1,36(sp)
    3548:	01312e23          	sw	s3,28(sp)
    354c:	02112623          	sw	ra,44(sp)
    3550:	03212023          	sw	s2,32(sp)
    3554:	00050413          	mv	s0,a0
    3558:	00058493          	mv	s1,a1
    355c:	00060993          	mv	s3,a2
    3560:	00079663          	bnez	a5,356c <fl_fseek+0x38>
    3564:	00000097          	auipc	ra,0x0
    3568:	f68080e7          	jalr	-152(ra) # 34cc <fl_init>
    356c:	fff00513          	li	a0,-1
    3570:	08040263          	beqz	s0,35f4 <fl_fseek+0xc0>
    3574:	00048663          	beqz	s1,3580 <fl_fseek+0x4c>
    3578:	ffe98793          	addi	a5,s3,-2
    357c:	06078c63          	beqz	a5,35f4 <fl_fseek+0xc0>
    3580:	00008937          	lui	s2,0x8
    3584:	72890913          	addi	s2,s2,1832 # 8728 <_fs>
    3588:	03c92783          	lw	a5,60(s2)
    358c:	00078463          	beqz	a5,3594 <fl_fseek+0x60>
    3590:	000780e7          	jalr	a5
    3594:	fff00513          	li	a0,-1
    3598:	42a42823          	sw	a0,1072(s0)
    359c:	42042a23          	sw	zero,1076(s0)
    35a0:	00099c63          	bnez	s3,35b8 <fl_fseek+0x84>
    35a4:	00c42783          	lw	a5,12(s0)
    35a8:	00942423          	sw	s1,8(s0)
    35ac:	0297f863          	bgeu	a5,s1,35dc <fl_fseek+0xa8>
    35b0:	00f42423          	sw	a5,8(s0)
    35b4:	0280006f          	j	35dc <fl_fseek+0xa8>
    35b8:	00100793          	li	a5,1
    35bc:	06f99063          	bne	s3,a5,361c <fl_fseek+0xe8>
    35c0:	00842783          	lw	a5,8(s0)
    35c4:	0004c663          	bltz	s1,35d0 <fl_fseek+0x9c>
    35c8:	00f484b3          	add	s1,s1,a5
    35cc:	fd9ff06f          	j	35a4 <fl_fseek+0x70>
    35d0:	40900733          	neg	a4,s1
    35d4:	02e7fe63          	bgeu	a5,a4,3610 <fl_fseek+0xdc>
    35d8:	00042423          	sw	zero,8(s0)
    35dc:	00000513          	li	a0,0
    35e0:	04092783          	lw	a5,64(s2)
    35e4:	00078863          	beqz	a5,35f4 <fl_fseek+0xc0>
    35e8:	00a12623          	sw	a0,12(sp)
    35ec:	000780e7          	jalr	a5
    35f0:	00c12503          	lw	a0,12(sp)
    35f4:	02c12083          	lw	ra,44(sp)
    35f8:	02812403          	lw	s0,40(sp)
    35fc:	02412483          	lw	s1,36(sp)
    3600:	02012903          	lw	s2,32(sp)
    3604:	01c12983          	lw	s3,28(sp)
    3608:	03010113          	addi	sp,sp,48
    360c:	00008067          	ret
    3610:	00f484b3          	add	s1,s1,a5
    3614:	00942423          	sw	s1,8(s0)
    3618:	fc5ff06f          	j	35dc <fl_fseek+0xa8>
    361c:	00200793          	li	a5,2
    3620:	fcf990e3          	bne	s3,a5,35e0 <fl_fseek+0xac>
    3624:	00c42783          	lw	a5,12(s0)
    3628:	f89ff06f          	j	35b0 <fl_fseek+0x7c>

0000362c <fl_closedir>:
    362c:	00000513          	li	a0,0
    3630:	00008067          	ret

00003634 <fatfs_lfn_cache_entry>:
    3634:	0005c783          	lbu	a5,0(a1)
    3638:	01300693          	li	a3,19
    363c:	01f7f793          	andi	a5,a5,31
    3640:	fff78713          	addi	a4,a5,-1
    3644:	0ff77613          	zext.b	a2,a4
    3648:	0ac6ea63          	bltu	a3,a2,36fc <fatfs_lfn_cache_entry+0xc8>
    364c:	10554683          	lbu	a3,261(a0)
    3650:	00069463          	bnez	a3,3658 <fatfs_lfn_cache_entry+0x24>
    3654:	10f502a3          	sb	a5,261(a0)
    3658:	00171793          	slli	a5,a4,0x1
    365c:	00e787b3          	add	a5,a5,a4
    3660:	0015c683          	lbu	a3,1(a1)
    3664:	00279793          	slli	a5,a5,0x2
    3668:	00e787b3          	add	a5,a5,a4
    366c:	00f50533          	add	a0,a0,a5
    3670:	00d50023          	sb	a3,0(a0)
    3674:	0035c783          	lbu	a5,3(a1)
    3678:	0ff00713          	li	a4,255
    367c:	02000693          	li	a3,32
    3680:	00f500a3          	sb	a5,1(a0)
    3684:	0055c783          	lbu	a5,5(a1)
    3688:	00f50123          	sb	a5,2(a0)
    368c:	0075c783          	lbu	a5,7(a1)
    3690:	00f501a3          	sb	a5,3(a0)
    3694:	0095c783          	lbu	a5,9(a1)
    3698:	00f50223          	sb	a5,4(a0)
    369c:	00e5c783          	lbu	a5,14(a1)
    36a0:	00f502a3          	sb	a5,5(a0)
    36a4:	0105c783          	lbu	a5,16(a1)
    36a8:	00f50323          	sb	a5,6(a0)
    36ac:	0125c783          	lbu	a5,18(a1)
    36b0:	00f503a3          	sb	a5,7(a0)
    36b4:	0145c783          	lbu	a5,20(a1)
    36b8:	00f50423          	sb	a5,8(a0)
    36bc:	0165c783          	lbu	a5,22(a1)
    36c0:	00f504a3          	sb	a5,9(a0)
    36c4:	0185c783          	lbu	a5,24(a1)
    36c8:	00f50523          	sb	a5,10(a0)
    36cc:	01c5c783          	lbu	a5,28(a1)
    36d0:	00f505a3          	sb	a5,11(a0)
    36d4:	01e5c783          	lbu	a5,30(a1)
    36d8:	00f50623          	sb	a5,12(a0)
    36dc:	00d00793          	li	a5,13
    36e0:	00054603          	lbu	a2,0(a0)
    36e4:	00e61463          	bne	a2,a4,36ec <fatfs_lfn_cache_entry+0xb8>
    36e8:	00d50023          	sb	a3,0(a0)
    36ec:	fff78793          	addi	a5,a5,-1
    36f0:	0ff7f793          	zext.b	a5,a5
    36f4:	00150513          	addi	a0,a0,1
    36f8:	fe0794e3          	bnez	a5,36e0 <fatfs_lfn_cache_entry+0xac>
    36fc:	00008067          	ret

00003700 <fatfs_lfn_cache_get>:
    3700:	10554703          	lbu	a4,261(a0)
    3704:	01400793          	li	a5,20
    3708:	00f71663          	bne	a4,a5,3714 <fatfs_lfn_cache_get+0x14>
    370c:	10050223          	sb	zero,260(a0)
    3710:	00008067          	ret
    3714:	02070063          	beqz	a4,3734 <fatfs_lfn_cache_get+0x34>
    3718:	00171793          	slli	a5,a4,0x1
    371c:	00e787b3          	add	a5,a5,a4
    3720:	00279793          	slli	a5,a5,0x2
    3724:	00e787b3          	add	a5,a5,a4
    3728:	00f507b3          	add	a5,a0,a5
    372c:	00078023          	sb	zero,0(a5)
    3730:	00008067          	ret
    3734:	00050023          	sb	zero,0(a0)
    3738:	00008067          	ret

0000373c <fatfs_entry_lfn_text>:
    373c:	00b54503          	lbu	a0,11(a0)
    3740:	00f57513          	andi	a0,a0,15
    3744:	ff150513          	addi	a0,a0,-15
    3748:	00153513          	seqz	a0,a0
    374c:	00008067          	ret

00003750 <fatfs_entry_lfn_invalid>:
    3750:	00054783          	lbu	a5,0(a0)
    3754:	f1b78713          	addi	a4,a5,-229
    3758:	02070263          	beqz	a4,377c <fatfs_entry_lfn_invalid+0x2c>
    375c:	02078063          	beqz	a5,377c <fatfs_entry_lfn_invalid+0x2c>
    3760:	00b54783          	lbu	a5,11(a0)
    3764:	00800713          	li	a4,8
    3768:	00100513          	li	a0,1
    376c:	00e78a63          	beq	a5,a4,3780 <fatfs_entry_lfn_invalid+0x30>
    3770:	0067f793          	andi	a5,a5,6
    3774:	00f03533          	snez	a0,a5
    3778:	00008067          	ret
    377c:	00100513          	li	a0,1
    3780:	00008067          	ret

00003784 <fatfs_entry_lfn_exists>:
    3784:	00b5c783          	lbu	a5,11(a1)
    3788:	00f00713          	li	a4,15
    378c:	04e78063          	beq	a5,a4,37cc <fatfs_entry_lfn_exists+0x48>
    3790:	0005c683          	lbu	a3,0(a1)
    3794:	f1b68713          	addi	a4,a3,-229
    3798:	00e03733          	snez	a4,a4
    379c:	00d036b3          	snez	a3,a3
    37a0:	00d77733          	and	a4,a4,a3
    37a4:	02070463          	beqz	a4,37cc <fatfs_entry_lfn_exists+0x48>
    37a8:	ff878713          	addi	a4,a5,-8
    37ac:	02070063          	beqz	a4,37cc <fatfs_entry_lfn_exists+0x48>
    37b0:	0067f713          	andi	a4,a5,6
    37b4:	00000793          	li	a5,0
    37b8:	00071663          	bnez	a4,37c4 <fatfs_entry_lfn_exists+0x40>
    37bc:	10554783          	lbu	a5,261(a0)
    37c0:	00f037b3          	snez	a5,a5
    37c4:	00078513          	mv	a0,a5
    37c8:	00008067          	ret
    37cc:	00000793          	li	a5,0
    37d0:	ff5ff06f          	j	37c4 <fatfs_entry_lfn_exists+0x40>

000037d4 <fatfs_entry_sfn_only>:
    37d4:	00b54783          	lbu	a5,11(a0)
    37d8:	00f00713          	li	a4,15
    37dc:	02e78863          	beq	a5,a4,380c <fatfs_entry_sfn_only+0x38>
    37e0:	00054683          	lbu	a3,0(a0)
    37e4:	f1b68713          	addi	a4,a3,-229
    37e8:	00e03733          	snez	a4,a4
    37ec:	00d036b3          	snez	a3,a3
    37f0:	00d77733          	and	a4,a4,a3
    37f4:	00070c63          	beqz	a4,380c <fatfs_entry_sfn_only+0x38>
    37f8:	ff878713          	addi	a4,a5,-8
    37fc:	00070863          	beqz	a4,380c <fatfs_entry_sfn_only+0x38>
    3800:	0067f513          	andi	a0,a5,6
    3804:	00153513          	seqz	a0,a0
    3808:	00008067          	ret
    380c:	00000513          	li	a0,0
    3810:	00008067          	ret

00003814 <fatfs_entry_is_dir>:
    3814:	00b54503          	lbu	a0,11(a0)
    3818:	00455513          	srli	a0,a0,0x4
    381c:	00157513          	andi	a0,a0,1
    3820:	00008067          	ret

00003824 <fatfs_lfn_entries_required>:
    3824:	ff010113          	addi	sp,sp,-16
    3828:	00112623          	sw	ra,12(sp)
    382c:	fffff097          	auipc	ra,0xfffff
    3830:	184080e7          	jalr	388(ra) # 29b0 <strlen>
    3834:	00050a63          	beqz	a0,3848 <fatfs_lfn_entries_required+0x24>
    3838:	00d00593          	li	a1,13
    383c:	00c50513          	addi	a0,a0,12
    3840:	fffff097          	auipc	ra,0xfffff
    3844:	07c080e7          	jalr	124(ra) # 28bc <__divsi3>
    3848:	00c12083          	lw	ra,12(sp)
    384c:	01010113          	addi	sp,sp,16
    3850:	00008067          	ret

00003854 <fatfs_filename_to_lfn>:
    3854:	f9010113          	addi	sp,sp,-112
    3858:	06812423          	sw	s0,104(sp)
    385c:	00058413          	mv	s0,a1
    3860:	000075b7          	lui	a1,0x7
    3864:	8b058593          	addi	a1,a1,-1872 # 68b0 <font+0x1e0>
    3868:	06912223          	sw	s1,100(sp)
    386c:	05312e23          	sw	s3,92(sp)
    3870:	00060493          	mv	s1,a2
    3874:	00050993          	mv	s3,a0
    3878:	03400613          	li	a2,52
    387c:	01c10513          	addi	a0,sp,28
    3880:	00d12623          	sw	a3,12(sp)
    3884:	06112623          	sw	ra,108(sp)
    3888:	07212023          	sw	s2,96(sp)
    388c:	05412c23          	sw	s4,88(sp)
    3890:	fffff097          	auipc	ra,0xfffff
    3894:	0fc080e7          	jalr	252(ra) # 298c <memcpy>
    3898:	00098513          	mv	a0,s3
    389c:	fffff097          	auipc	ra,0xfffff
    38a0:	114080e7          	jalr	276(ra) # 29b0 <strlen>
    38a4:	00050913          	mv	s2,a0
    38a8:	00098513          	mv	a0,s3
    38ac:	00000097          	auipc	ra,0x0
    38b0:	f78080e7          	jalr	-136(ra) # 3824 <fatfs_lfn_entries_required>
    38b4:	00050a13          	mv	s4,a0
    38b8:	02000613          	li	a2,32
    38bc:	00000593          	li	a1,0
    38c0:	00040513          	mv	a0,s0
    38c4:	fffff097          	auipc	ra,0xfffff
    38c8:	0ac080e7          	jalr	172(ra) # 2970 <memset>
    38cc:	fffa0713          	addi	a4,s4,-1
    38d0:	00c12683          	lw	a3,12(sp)
    38d4:	00148793          	addi	a5,s1,1
    38d8:	00971463          	bne	a4,s1,38e0 <fatfs_filename_to_lfn+0x8c>
    38dc:	0407e793          	ori	a5,a5,64
    38e0:	00149613          	slli	a2,s1,0x1
    38e4:	00960633          	add	a2,a2,s1
    38e8:	00f40023          	sb	a5,0(s0)
    38ec:	00261613          	slli	a2,a2,0x2
    38f0:	00f00793          	li	a5,15
    38f4:	00f405a3          	sb	a5,11(s0)
    38f8:	00d406a3          	sb	a3,13(s0)
    38fc:	01c10793          	addi	a5,sp,28
    3900:	00960633          	add	a2,a2,s1
    3904:	fff00693          	li	a3,-1
    3908:	0007a703          	lw	a4,0(a5)
    390c:	00e40733          	add	a4,s0,a4
    3910:	05265063          	bge	a2,s2,3950 <fatfs_filename_to_lfn+0xfc>
    3914:	00c985b3          	add	a1,s3,a2
    3918:	0005c583          	lbu	a1,0(a1)
    391c:	00b70023          	sb	a1,0(a4)
    3920:	00478793          	addi	a5,a5,4
    3924:	05010713          	addi	a4,sp,80
    3928:	00160613          	addi	a2,a2,1
    392c:	fce79ee3          	bne	a5,a4,3908 <fatfs_filename_to_lfn+0xb4>
    3930:	06c12083          	lw	ra,108(sp)
    3934:	06812403          	lw	s0,104(sp)
    3938:	06412483          	lw	s1,100(sp)
    393c:	06012903          	lw	s2,96(sp)
    3940:	05c12983          	lw	s3,92(sp)
    3944:	05812a03          	lw	s4,88(sp)
    3948:	07010113          	addi	sp,sp,112
    394c:	00008067          	ret
    3950:	01261663          	bne	a2,s2,395c <fatfs_filename_to_lfn+0x108>
    3954:	00070023          	sb	zero,0(a4)
    3958:	fc9ff06f          	j	3920 <fatfs_filename_to_lfn+0xcc>
    395c:	00d70023          	sb	a3,0(a4)
    3960:	00d700a3          	sb	a3,1(a4)
    3964:	fbdff06f          	j	3920 <fatfs_filename_to_lfn+0xcc>

00003968 <fatfs_sfn_create_entry>:
    3968:	00000793          	li	a5,0
    396c:	00b00813          	li	a6,11
    3970:	00f508b3          	add	a7,a0,a5
    3974:	0008c303          	lbu	t1,0(a7)
    3978:	00f688b3          	add	a7,a3,a5
    397c:	00178793          	addi	a5,a5,1
    3980:	00688023          	sb	t1,0(a7)
    3984:	ff0796e3          	bne	a5,a6,3970 <fatfs_sfn_create_entry+0x8>
    3988:	00e03733          	snez	a4,a4
    398c:	40e00733          	neg	a4,a4
    3990:	02000793          	li	a5,32
    3994:	ff077713          	andi	a4,a4,-16
    3998:	00f70733          	add	a4,a4,a5
    399c:	00f68823          	sb	a5,16(a3)
    39a0:	00f68923          	sb	a5,18(a3)
    39a4:	00f68c23          	sb	a5,24(a3)
    39a8:	01065793          	srli	a5,a2,0x10
    39ac:	00f68a23          	sb	a5,20(a3)
    39b0:	01865793          	srli	a5,a2,0x18
    39b4:	00f68aa3          	sb	a5,21(a3)
    39b8:	0085d793          	srli	a5,a1,0x8
    39bc:	00c68d23          	sb	a2,26(a3)
    39c0:	00b68e23          	sb	a1,28(a3)
    39c4:	00865613          	srli	a2,a2,0x8
    39c8:	00f68ea3          	sb	a5,29(a3)
    39cc:	0105d793          	srli	a5,a1,0x10
    39d0:	0185d593          	srli	a1,a1,0x18
    39d4:	000686a3          	sb	zero,13(a3)
    39d8:	00068723          	sb	zero,14(a3)
    39dc:	000687a3          	sb	zero,15(a3)
    39e0:	000688a3          	sb	zero,17(a3)
    39e4:	000689a3          	sb	zero,19(a3)
    39e8:	00068b23          	sb	zero,22(a3)
    39ec:	00068ba3          	sb	zero,23(a3)
    39f0:	00068ca3          	sb	zero,25(a3)
    39f4:	00e685a3          	sb	a4,11(a3)
    39f8:	00068623          	sb	zero,12(a3)
    39fc:	00c68da3          	sb	a2,27(a3)
    3a00:	00f68f23          	sb	a5,30(a3)
    3a04:	00b68fa3          	sb	a1,31(a3)
    3a08:	00008067          	ret

00003a0c <fatfs_lfn_create_sfn>:
    3a0c:	fd010113          	addi	sp,sp,-48
    3a10:	02912223          	sw	s1,36(sp)
    3a14:	00050493          	mv	s1,a0
    3a18:	00058513          	mv	a0,a1
    3a1c:	02812423          	sw	s0,40(sp)
    3a20:	01312e23          	sw	s3,28(sp)
    3a24:	00058413          	mv	s0,a1
    3a28:	02112623          	sw	ra,44(sp)
    3a2c:	03212023          	sw	s2,32(sp)
    3a30:	fffff097          	auipc	ra,0xfffff
    3a34:	f80080e7          	jalr	-128(ra) # 29b0 <strlen>
    3a38:	00044783          	lbu	a5,0(s0)
    3a3c:	02e00993          	li	s3,46
    3a40:	15378063          	beq	a5,s3,3b80 <fatfs_lfn_create_sfn+0x174>
    3a44:	00b00613          	li	a2,11
    3a48:	02000593          	li	a1,32
    3a4c:	00050913          	mv	s2,a0
    3a50:	00048513          	mv	a0,s1
    3a54:	fffff097          	auipc	ra,0xfffff
    3a58:	f1c080e7          	jalr	-228(ra) # 2970 <memset>
    3a5c:	00300613          	li	a2,3
    3a60:	02000593          	li	a1,32
    3a64:	00c10513          	addi	a0,sp,12
    3a68:	fffff097          	auipc	ra,0xfffff
    3a6c:	f08080e7          	jalr	-248(ra) # 2970 <memset>
    3a70:	fff00793          	li	a5,-1
    3a74:	00000713          	li	a4,0
    3a78:	0d274263          	blt	a4,s2,3b3c <fatfs_lfn_create_sfn+0x130>
    3a7c:	fff00713          	li	a4,-1
    3a80:	0ee78863          	beq	a5,a4,3b70 <fatfs_lfn_create_sfn+0x164>
    3a84:	00178713          	addi	a4,a5,1
    3a88:	00c10693          	addi	a3,sp,12
    3a8c:	00478613          	addi	a2,a5,4
    3a90:	0ce61263          	bne	a2,a4,3b54 <fatfs_lfn_create_sfn+0x148>
    3a94:	00000613          	li	a2,0
    3a98:	00000693          	li	a3,0
    3a9c:	01900813          	li	a6,25
    3aa0:	00800893          	li	a7,8
    3aa4:	02f6de63          	bge	a3,a5,3ae0 <fatfs_lfn_create_sfn+0xd4>
    3aa8:	00d40733          	add	a4,s0,a3
    3aac:	00074703          	lbu	a4,0(a4)
    3ab0:	fe070513          	addi	a0,a4,-32
    3ab4:	0c050263          	beqz	a0,3b78 <fatfs_lfn_create_sfn+0x16c>
    3ab8:	fd270593          	addi	a1,a4,-46
    3abc:	0a058e63          	beqz	a1,3b78 <fatfs_lfn_create_sfn+0x16c>
    3ac0:	f9f70593          	addi	a1,a4,-97
    3ac4:	0ff5f593          	zext.b	a1,a1
    3ac8:	00c48333          	add	t1,s1,a2
    3acc:	00160613          	addi	a2,a2,1
    3ad0:	00b86463          	bltu	a6,a1,3ad8 <fatfs_lfn_create_sfn+0xcc>
    3ad4:	0ff57713          	zext.b	a4,a0
    3ad8:	00e30023          	sb	a4,0(t1)
    3adc:	09161e63          	bne	a2,a7,3b78 <fatfs_lfn_create_sfn+0x16c>
    3ae0:	00c10793          	addi	a5,sp,12
    3ae4:	00800693          	li	a3,8
    3ae8:	01900513          	li	a0,25
    3aec:	00b00593          	li	a1,11
    3af0:	0007c703          	lbu	a4,0(a5)
    3af4:	f9f70613          	addi	a2,a4,-97
    3af8:	0ff67613          	zext.b	a2,a2
    3afc:	00c56663          	bltu	a0,a2,3b08 <fatfs_lfn_create_sfn+0xfc>
    3b00:	fe070713          	addi	a4,a4,-32
    3b04:	0ff77713          	zext.b	a4,a4
    3b08:	00d48633          	add	a2,s1,a3
    3b0c:	00e60023          	sb	a4,0(a2)
    3b10:	00168693          	addi	a3,a3,1
    3b14:	00178793          	addi	a5,a5,1
    3b18:	fcb69ce3          	bne	a3,a1,3af0 <fatfs_lfn_create_sfn+0xe4>
    3b1c:	00100513          	li	a0,1
    3b20:	02c12083          	lw	ra,44(sp)
    3b24:	02812403          	lw	s0,40(sp)
    3b28:	02412483          	lw	s1,36(sp)
    3b2c:	02012903          	lw	s2,32(sp)
    3b30:	01c12983          	lw	s3,28(sp)
    3b34:	03010113          	addi	sp,sp,48
    3b38:	00008067          	ret
    3b3c:	00e406b3          	add	a3,s0,a4
    3b40:	0006c683          	lbu	a3,0(a3)
    3b44:	01369463          	bne	a3,s3,3b4c <fatfs_lfn_create_sfn+0x140>
    3b48:	00070793          	mv	a5,a4
    3b4c:	00170713          	addi	a4,a4,1
    3b50:	f29ff06f          	j	3a78 <fatfs_lfn_create_sfn+0x6c>
    3b54:	01275863          	bge	a4,s2,3b64 <fatfs_lfn_create_sfn+0x158>
    3b58:	00e405b3          	add	a1,s0,a4
    3b5c:	0005c583          	lbu	a1,0(a1)
    3b60:	00b68023          	sb	a1,0(a3)
    3b64:	00170713          	addi	a4,a4,1
    3b68:	00168693          	addi	a3,a3,1
    3b6c:	f25ff06f          	j	3a90 <fatfs_lfn_create_sfn+0x84>
    3b70:	00090793          	mv	a5,s2
    3b74:	f21ff06f          	j	3a94 <fatfs_lfn_create_sfn+0x88>
    3b78:	00168693          	addi	a3,a3,1
    3b7c:	f29ff06f          	j	3aa4 <fatfs_lfn_create_sfn+0x98>
    3b80:	00000513          	li	a0,0
    3b84:	f9dff06f          	j	3b20 <fatfs_lfn_create_sfn+0x114>

00003b88 <fatfs_lfn_generate_tail>:
    3b88:	000187b7          	lui	a5,0x18
    3b8c:	69f78793          	addi	a5,a5,1695 # 1869f <__stacktop+0x869f>
    3b90:	16c7e463          	bltu	a5,a2,3cf8 <fatfs_lfn_generate_tail+0x170>
    3b94:	fa010113          	addi	sp,sp,-96
    3b98:	04812c23          	sw	s0,88(sp)
    3b9c:	04912a23          	sw	s1,84(sp)
    3ba0:	03712e23          	sw	s7,60(sp)
    3ba4:	00060413          	mv	s0,a2
    3ba8:	00058b93          	mv	s7,a1
    3bac:	00c00613          	li	a2,12
    3bb0:	00000593          	li	a1,0
    3bb4:	00050493          	mv	s1,a0
    3bb8:	00410513          	addi	a0,sp,4
    3bbc:	04112e23          	sw	ra,92(sp)
    3bc0:	05312623          	sw	s3,76(sp)
    3bc4:	05412423          	sw	s4,72(sp)
    3bc8:	05612023          	sw	s6,64(sp)
    3bcc:	05212823          	sw	s2,80(sp)
    3bd0:	05512223          	sw	s5,68(sp)
    3bd4:	fffff097          	auipc	ra,0xfffff
    3bd8:	d9c080e7          	jalr	-612(ra) # 2970 <memset>
    3bdc:	000065b7          	lui	a1,0x6
    3be0:	07e00793          	li	a5,126
    3be4:	01100613          	li	a2,17
    3be8:	68858593          	addi	a1,a1,1672 # 6688 <LEDS+0x1b8>
    3bec:	01c10513          	addi	a0,sp,28
    3bf0:	01010993          	addi	s3,sp,16
    3bf4:	00f10223          	sb	a5,4(sp)
    3bf8:	00098a13          	mv	s4,s3
    3bfc:	fffff097          	auipc	ra,0xfffff
    3c00:	d90080e7          	jalr	-624(ra) # 298c <memcpy>
    3c04:	00900b13          	li	s6,9
    3c08:	00a00593          	li	a1,10
    3c0c:	00040513          	mv	a0,s0
    3c10:	fffff097          	auipc	ra,0xfffff
    3c14:	cfc080e7          	jalr	-772(ra) # 290c <__umodsi3>
    3c18:	03050793          	addi	a5,a0,48
    3c1c:	00278533          	add	a0,a5,sp
    3c20:	fec54783          	lbu	a5,-20(a0)
    3c24:	00098913          	mv	s2,s3
    3c28:	00040513          	mv	a0,s0
    3c2c:	00a00593          	li	a1,10
    3c30:	00f98023          	sb	a5,0(s3)
    3c34:	00040a93          	mv	s5,s0
    3c38:	fffff097          	auipc	ra,0xfffff
    3c3c:	c8c080e7          	jalr	-884(ra) # 28c4 <__udivsi3>
    3c40:	00198993          	addi	s3,s3,1
    3c44:	00050413          	mv	s0,a0
    3c48:	fd5b60e3          	bltu	s6,s5,3c08 <fatfs_lfn_generate_tail+0x80>
    3c4c:	00098023          	sb	zero,0(s3)
    3c50:	00410713          	addi	a4,sp,4
    3c54:	00090793          	mv	a5,s2
    3c58:	0947f663          	bgeu	a5,s4,3ce4 <fatfs_lfn_generate_tail+0x15c>
    3c5c:	00f10713          	addi	a4,sp,15
    3c60:	00000793          	li	a5,0
    3c64:	00e96663          	bltu	s2,a4,3c70 <fatfs_lfn_generate_tail+0xe8>
    3c68:	41490933          	sub	s2,s2,s4
    3c6c:	00190793          	addi	a5,s2,1
    3c70:	03078793          	addi	a5,a5,48
    3c74:	002787b3          	add	a5,a5,sp
    3c78:	000b8593          	mv	a1,s7
    3c7c:	fc078aa3          	sb	zero,-43(a5)
    3c80:	00b00613          	li	a2,11
    3c84:	00048513          	mv	a0,s1
    3c88:	fffff097          	auipc	ra,0xfffff
    3c8c:	d04080e7          	jalr	-764(ra) # 298c <memcpy>
    3c90:	00410513          	addi	a0,sp,4
    3c94:	fffff097          	auipc	ra,0xfffff
    3c98:	d1c080e7          	jalr	-740(ra) # 29b0 <strlen>
    3c9c:	40a484b3          	sub	s1,s1,a0
    3ca0:	00050613          	mv	a2,a0
    3ca4:	00410593          	addi	a1,sp,4
    3ca8:	00848513          	addi	a0,s1,8
    3cac:	fffff097          	auipc	ra,0xfffff
    3cb0:	ce0080e7          	jalr	-800(ra) # 298c <memcpy>
    3cb4:	05c12083          	lw	ra,92(sp)
    3cb8:	05812403          	lw	s0,88(sp)
    3cbc:	05412483          	lw	s1,84(sp)
    3cc0:	05012903          	lw	s2,80(sp)
    3cc4:	04c12983          	lw	s3,76(sp)
    3cc8:	04812a03          	lw	s4,72(sp)
    3ccc:	04412a83          	lw	s5,68(sp)
    3cd0:	04012b03          	lw	s6,64(sp)
    3cd4:	03c12b83          	lw	s7,60(sp)
    3cd8:	00100513          	li	a0,1
    3cdc:	06010113          	addi	sp,sp,96
    3ce0:	00008067          	ret
    3ce4:	0007c683          	lbu	a3,0(a5)
    3ce8:	00170713          	addi	a4,a4,1
    3cec:	fff78793          	addi	a5,a5,-1
    3cf0:	00d70023          	sb	a3,0(a4)
    3cf4:	f65ff06f          	j	3c58 <fatfs_lfn_generate_tail+0xd0>
    3cf8:	00000513          	li	a0,0
    3cfc:	00008067          	ret

00003d00 <fatfs_total_path_levels>:
    3d00:	fff00793          	li	a5,-1
    3d04:	06050263          	beqz	a0,3d68 <fatfs_total_path_levels+0x68>
    3d08:	00054703          	lbu	a4,0(a0)
    3d0c:	02f00793          	li	a5,47
    3d10:	00f71863          	bne	a4,a5,3d20 <fatfs_total_path_levels+0x20>
    3d14:	00150513          	addi	a0,a0,1
    3d18:	00000793          	li	a5,0
    3d1c:	0400006f          	j	3d5c <fatfs_total_path_levels+0x5c>
    3d20:	00154703          	lbu	a4,1(a0)
    3d24:	03a00793          	li	a5,58
    3d28:	00f70a63          	beq	a4,a5,3d3c <fatfs_total_path_levels+0x3c>
    3d2c:	00254683          	lbu	a3,2(a0)
    3d30:	05c00713          	li	a4,92
    3d34:	fff00793          	li	a5,-1
    3d38:	02e69863          	bne	a3,a4,3d68 <fatfs_total_path_levels+0x68>
    3d3c:	00350513          	addi	a0,a0,3
    3d40:	05c00713          	li	a4,92
    3d44:	fd5ff06f          	j	3d18 <fatfs_total_path_levels+0x18>
    3d48:	00150513          	addi	a0,a0,1
    3d4c:	00e68663          	beq	a3,a4,3d58 <fatfs_total_path_levels+0x58>
    3d50:	00054683          	lbu	a3,0(a0)
    3d54:	fe069ae3          	bnez	a3,3d48 <fatfs_total_path_levels+0x48>
    3d58:	00178793          	addi	a5,a5,1
    3d5c:	00054683          	lbu	a3,0(a0)
    3d60:	fe0698e3          	bnez	a3,3d50 <fatfs_total_path_levels+0x50>
    3d64:	fff78793          	addi	a5,a5,-1
    3d68:	00078513          	mv	a0,a5
    3d6c:	00008067          	ret

00003d70 <fatfs_get_substring>:
    3d70:	0cd05e63          	blez	a3,3e4c <fatfs_get_substring+0xdc>
    3d74:	0c050c63          	beqz	a0,3e4c <fatfs_get_substring+0xdc>
    3d78:	fe010113          	addi	sp,sp,-32
    3d7c:	00812c23          	sw	s0,24(sp)
    3d80:	00112e23          	sw	ra,28(sp)
    3d84:	00912a23          	sw	s1,20(sp)
    3d88:	00054483          	lbu	s1,0(a0)
    3d8c:	02f00793          	li	a5,47
    3d90:	00150413          	addi	s0,a0,1
    3d94:	02f48463          	beq	s1,a5,3dbc <fatfs_get_substring+0x4c>
    3d98:	00154703          	lbu	a4,1(a0)
    3d9c:	03a00793          	li	a5,58
    3da0:	00f70a63          	beq	a4,a5,3db4 <fatfs_get_substring+0x44>
    3da4:	00254803          	lbu	a6,2(a0)
    3da8:	05c00713          	li	a4,92
    3dac:	fff00793          	li	a5,-1
    3db0:	04e81c63          	bne	a6,a4,3e08 <fatfs_get_substring+0x98>
    3db4:	00350413          	addi	s0,a0,3
    3db8:	05c00493          	li	s1,92
    3dbc:	00040513          	mv	a0,s0
    3dc0:	00d12623          	sw	a3,12(sp)
    3dc4:	00c12423          	sw	a2,8(sp)
    3dc8:	00b12223          	sw	a1,4(sp)
    3dcc:	fffff097          	auipc	ra,0xfffff
    3dd0:	be4080e7          	jalr	-1052(ra) # 29b0 <strlen>
    3dd4:	00c12683          	lw	a3,12(sp)
    3dd8:	00412583          	lw	a1,4(sp)
    3ddc:	00812603          	lw	a2,8(sp)
    3de0:	00000713          	li	a4,0
    3de4:	00000813          	li	a6,0
    3de8:	00000793          	li	a5,0
    3dec:	fff68693          	addi	a3,a3,-1
    3df0:	00e608b3          	add	a7,a2,a4
    3df4:	02a7c663          	blt	a5,a0,3e20 <fatfs_get_substring+0xb0>
    3df8:	00088023          	sb	zero,0(a7)
    3dfc:	00064783          	lbu	a5,0(a2)
    3e00:	0017b793          	seqz	a5,a5
    3e04:	40f007b3          	neg	a5,a5
    3e08:	01c12083          	lw	ra,28(sp)
    3e0c:	01812403          	lw	s0,24(sp)
    3e10:	01412483          	lw	s1,20(sp)
    3e14:	00078513          	mv	a0,a5
    3e18:	02010113          	addi	sp,sp,32
    3e1c:	00008067          	ret
    3e20:	00f40333          	add	t1,s0,a5
    3e24:	00034303          	lbu	t1,0(t1)
    3e28:	00931863          	bne	t1,s1,3e38 <fatfs_get_substring+0xc8>
    3e2c:	00180813          	addi	a6,a6,1
    3e30:	00178793          	addi	a5,a5,1
    3e34:	fbdff06f          	j	3df0 <fatfs_get_substring+0x80>
    3e38:	feb81ce3          	bne	a6,a1,3e30 <fatfs_get_substring+0xc0>
    3e3c:	fed75ae3          	bge	a4,a3,3e30 <fatfs_get_substring+0xc0>
    3e40:	00170713          	addi	a4,a4,1
    3e44:	00688023          	sb	t1,0(a7)
    3e48:	fe9ff06f          	j	3e30 <fatfs_get_substring+0xc0>
    3e4c:	fff00793          	li	a5,-1
    3e50:	00078513          	mv	a0,a5
    3e54:	00008067          	ret

00003e58 <fatfs_split_path>:
    3e58:	fd010113          	addi	sp,sp,-48
    3e5c:	02912223          	sw	s1,36(sp)
    3e60:	03212023          	sw	s2,32(sp)
    3e64:	01312e23          	sw	s3,28(sp)
    3e68:	01412c23          	sw	s4,24(sp)
    3e6c:	02112623          	sw	ra,44(sp)
    3e70:	02812423          	sw	s0,40(sp)
    3e74:	01512a23          	sw	s5,20(sp)
    3e78:	00050993          	mv	s3,a0
    3e7c:	00058493          	mv	s1,a1
    3e80:	00060913          	mv	s2,a2
    3e84:	00068a13          	mv	s4,a3
    3e88:	00e12623          	sw	a4,12(sp)
    3e8c:	00000097          	auipc	ra,0x0
    3e90:	e74080e7          	jalr	-396(ra) # 3d00 <fatfs_total_path_levels>
    3e94:	fff00793          	li	a5,-1
    3e98:	02f51863          	bne	a0,a5,3ec8 <fatfs_split_path+0x70>
    3e9c:	fff00413          	li	s0,-1
    3ea0:	02c12083          	lw	ra,44(sp)
    3ea4:	00040513          	mv	a0,s0
    3ea8:	02812403          	lw	s0,40(sp)
    3eac:	02412483          	lw	s1,36(sp)
    3eb0:	02012903          	lw	s2,32(sp)
    3eb4:	01c12983          	lw	s3,28(sp)
    3eb8:	01812a03          	lw	s4,24(sp)
    3ebc:	01412a83          	lw	s5,20(sp)
    3ec0:	03010113          	addi	sp,sp,48
    3ec4:	00008067          	ret
    3ec8:	00c12683          	lw	a3,12(sp)
    3ecc:	00050593          	mv	a1,a0
    3ed0:	00a12623          	sw	a0,12(sp)
    3ed4:	000a0613          	mv	a2,s4
    3ed8:	00098513          	mv	a0,s3
    3edc:	00000097          	auipc	ra,0x0
    3ee0:	e94080e7          	jalr	-364(ra) # 3d70 <fatfs_get_substring>
    3ee4:	00050413          	mv	s0,a0
    3ee8:	fa051ae3          	bnez	a0,3e9c <fatfs_split_path+0x44>
    3eec:	00c12583          	lw	a1,12(sp)
    3ef0:	00059663          	bnez	a1,3efc <fatfs_split_path+0xa4>
    3ef4:	00048023          	sb	zero,0(s1)
    3ef8:	fa9ff06f          	j	3ea0 <fatfs_split_path+0x48>
    3efc:	00098513          	mv	a0,s3
    3f00:	fffff097          	auipc	ra,0xfffff
    3f04:	ab0080e7          	jalr	-1360(ra) # 29b0 <strlen>
    3f08:	00050a93          	mv	s5,a0
    3f0c:	000a0513          	mv	a0,s4
    3f10:	fffff097          	auipc	ra,0xfffff
    3f14:	aa0080e7          	jalr	-1376(ra) # 29b0 <strlen>
    3f18:	40aa8633          	sub	a2,s5,a0
    3f1c:	00c95463          	bge	s2,a2,3f24 <fatfs_split_path+0xcc>
    3f20:	00090613          	mv	a2,s2
    3f24:	00048513          	mv	a0,s1
    3f28:	00098593          	mv	a1,s3
    3f2c:	00c12623          	sw	a2,12(sp)
    3f30:	fffff097          	auipc	ra,0xfffff
    3f34:	a5c080e7          	jalr	-1444(ra) # 298c <memcpy>
    3f38:	00c12603          	lw	a2,12(sp)
    3f3c:	00c484b3          	add	s1,s1,a2
    3f40:	fe048fa3          	sb	zero,-1(s1)
    3f44:	f5dff06f          	j	3ea0 <fatfs_split_path+0x48>

00003f48 <fatfs_compare_names>:
    3f48:	fd010113          	addi	sp,sp,-48
    3f4c:	02112623          	sw	ra,44(sp)
    3f50:	03212023          	sw	s2,32(sp)
    3f54:	01312e23          	sw	s3,28(sp)
    3f58:	01412c23          	sw	s4,24(sp)
    3f5c:	01512a23          	sw	s5,20(sp)
    3f60:	00058a13          	mv	s4,a1
    3f64:	02812423          	sw	s0,40(sp)
    3f68:	02912223          	sw	s1,36(sp)
    3f6c:	01612823          	sw	s6,16(sp)
    3f70:	01712623          	sw	s7,12(sp)
    3f74:	01812423          	sw	s8,8(sp)
    3f78:	00050a93          	mv	s5,a0
    3f7c:	fffff097          	auipc	ra,0xfffff
    3f80:	1c4080e7          	jalr	452(ra) # 3140 <FileString_GetExtension>
    3f84:	00050993          	mv	s3,a0
    3f88:	000a0513          	mv	a0,s4
    3f8c:	fffff097          	auipc	ra,0xfffff
    3f90:	1b4080e7          	jalr	436(ra) # 3140 <FileString_GetExtension>
    3f94:	fff00793          	li	a5,-1
    3f98:	00050913          	mv	s2,a0
    3f9c:	02f99e63          	bne	s3,a5,3fd8 <fatfs_compare_names+0x90>
    3fa0:	0f350063          	beq	a0,s3,4080 <fatfs_compare_names+0x138>
    3fa4:	00000513          	li	a0,0
    3fa8:	02c12083          	lw	ra,44(sp)
    3fac:	02812403          	lw	s0,40(sp)
    3fb0:	02412483          	lw	s1,36(sp)
    3fb4:	02012903          	lw	s2,32(sp)
    3fb8:	01c12983          	lw	s3,28(sp)
    3fbc:	01812a03          	lw	s4,24(sp)
    3fc0:	01412a83          	lw	s5,20(sp)
    3fc4:	01012b03          	lw	s6,16(sp)
    3fc8:	00c12b83          	lw	s7,12(sp)
    3fcc:	00812c03          	lw	s8,8(sp)
    3fd0:	03010113          	addi	sp,sp,48
    3fd4:	00008067          	ret
    3fd8:	fcf506e3          	beq	a0,a5,3fa4 <fatfs_compare_names+0x5c>
    3fdc:	00198793          	addi	a5,s3,1
    3fe0:	00fa8b33          	add	s6,s5,a5
    3fe4:	00050413          	mv	s0,a0
    3fe8:	00150793          	addi	a5,a0,1
    3fec:	000b0513          	mv	a0,s6
    3ff0:	00fa0bb3          	add	s7,s4,a5
    3ff4:	fffff097          	auipc	ra,0xfffff
    3ff8:	9bc080e7          	jalr	-1604(ra) # 29b0 <strlen>
    3ffc:	00050c13          	mv	s8,a0
    4000:	000b8513          	mv	a0,s7
    4004:	00098493          	mv	s1,s3
    4008:	fffff097          	auipc	ra,0xfffff
    400c:	9a8080e7          	jalr	-1624(ra) # 29b0 <strlen>
    4010:	f8ac1ae3          	bne	s8,a0,3fa4 <fatfs_compare_names+0x5c>
    4014:	000b0513          	mv	a0,s6
    4018:	fffff097          	auipc	ra,0xfffff
    401c:	998080e7          	jalr	-1640(ra) # 29b0 <strlen>
    4020:	00050613          	mv	a2,a0
    4024:	000b8593          	mv	a1,s7
    4028:	000b0513          	mv	a0,s6
    402c:	fffff097          	auipc	ra,0xfffff
    4030:	0a4080e7          	jalr	164(ra) # 30d0 <FileString_StrCmpNoCase>
    4034:	f60518e3          	bnez	a0,3fa4 <fatfs_compare_names+0x5c>
    4038:	fff48793          	addi	a5,s1,-1
    403c:	00fa87b3          	add	a5,s5,a5
    4040:	41378733          	sub	a4,a5,s3
    4044:	02000693          	li	a3,32
    4048:	06e79263          	bne	a5,a4,40ac <fatfs_compare_names+0x164>
    404c:	fff40793          	addi	a5,s0,-1
    4050:	00fa07b3          	add	a5,s4,a5
    4054:	41278733          	sub	a4,a5,s2
    4058:	02000693          	li	a3,32
    405c:	06e79263          	bne	a5,a4,40c0 <fatfs_compare_names+0x178>
    4060:	f53912e3          	bne	s2,s3,3fa4 <fatfs_compare_names+0x5c>
    4064:	00090613          	mv	a2,s2
    4068:	000a0593          	mv	a1,s4
    406c:	000a8513          	mv	a0,s5
    4070:	fffff097          	auipc	ra,0xfffff
    4074:	060080e7          	jalr	96(ra) # 30d0 <FileString_StrCmpNoCase>
    4078:	00153513          	seqz	a0,a0
    407c:	f2dff06f          	j	3fa8 <fatfs_compare_names+0x60>
    4080:	000a8513          	mv	a0,s5
    4084:	fffff097          	auipc	ra,0xfffff
    4088:	92c080e7          	jalr	-1748(ra) # 29b0 <strlen>
    408c:	00050493          	mv	s1,a0
    4090:	00050993          	mv	s3,a0
    4094:	000a0513          	mv	a0,s4
    4098:	fffff097          	auipc	ra,0xfffff
    409c:	918080e7          	jalr	-1768(ra) # 29b0 <strlen>
    40a0:	00050413          	mv	s0,a0
    40a4:	00050913          	mv	s2,a0
    40a8:	f91ff06f          	j	4038 <fatfs_compare_names+0xf0>
    40ac:	0007c603          	lbu	a2,0(a5)
    40b0:	f8d61ee3          	bne	a2,a3,404c <fatfs_compare_names+0x104>
    40b4:	415789b3          	sub	s3,a5,s5
    40b8:	fff78793          	addi	a5,a5,-1
    40bc:	f8dff06f          	j	4048 <fatfs_compare_names+0x100>
    40c0:	0007c603          	lbu	a2,0(a5)
    40c4:	f8d61ee3          	bne	a2,a3,4060 <fatfs_compare_names+0x118>
    40c8:	41478933          	sub	s2,a5,s4
    40cc:	fff78793          	addi	a5,a5,-1
    40d0:	f8dff06f          	j	405c <fatfs_compare_names+0x114>

000040d4 <_check_file_open>:
    40d4:	fe010113          	addi	sp,sp,-32
    40d8:	000077b7          	lui	a5,0x7
    40dc:	00812c23          	sw	s0,24(sp)
    40e0:	afc7a403          	lw	s0,-1284(a5) # 6afc <_open_file_list>
    40e4:	00912a23          	sw	s1,20(sp)
    40e8:	00112e23          	sw	ra,28(sp)
    40ec:	01212823          	sw	s2,16(sp)
    40f0:	01312623          	sw	s3,12(sp)
    40f4:	00050493          	mv	s1,a0
    40f8:	00041663          	bnez	s0,4104 <_check_file_open+0x30>
    40fc:	00000513          	li	a0,0
    4100:	03c0006f          	j	413c <_check_file_open+0x68>
    4104:	bc440793          	addi	a5,s0,-1084
    4108:	00f49663          	bne	s1,a5,4114 <_check_file_open+0x40>
    410c:	00442403          	lw	s0,4(s0)
    4110:	fe9ff06f          	j	40f8 <_check_file_open+0x24>
    4114:	01448593          	addi	a1,s1,20
    4118:	bd840513          	addi	a0,s0,-1064
    411c:	00000097          	auipc	ra,0x0
    4120:	e2c080e7          	jalr	-468(ra) # 3f48 <fatfs_compare_names>
    4124:	fe0504e3          	beqz	a0,410c <_check_file_open+0x38>
    4128:	11848593          	addi	a1,s1,280
    412c:	cdc40513          	addi	a0,s0,-804
    4130:	00000097          	auipc	ra,0x0
    4134:	e18080e7          	jalr	-488(ra) # 3f48 <fatfs_compare_names>
    4138:	fc050ae3          	beqz	a0,410c <_check_file_open+0x38>
    413c:	01c12083          	lw	ra,28(sp)
    4140:	01812403          	lw	s0,24(sp)
    4144:	01412483          	lw	s1,20(sp)
    4148:	01012903          	lw	s2,16(sp)
    414c:	00c12983          	lw	s3,12(sp)
    4150:	02010113          	addi	sp,sp,32
    4154:	00008067          	ret

00004158 <fatfs_get_sfn_display_name>:
    4158:	00000713          	li	a4,0
    415c:	02000613          	li	a2,32
    4160:	01900813          	li	a6,25
    4164:	0005c783          	lbu	a5,0(a1)
    4168:	00078663          	beqz	a5,4174 <fatfs_get_sfn_display_name+0x1c>
    416c:	ff470693          	addi	a3,a4,-12
    4170:	00069863          	bnez	a3,4180 <fatfs_get_sfn_display_name+0x28>
    4174:	00050023          	sb	zero,0(a0)
    4178:	00100513          	li	a0,1
    417c:	00008067          	ret
    4180:	00158593          	addi	a1,a1,1
    4184:	fec780e3          	beq	a5,a2,4164 <fatfs_get_sfn_display_name+0xc>
    4188:	fbf78693          	addi	a3,a5,-65
    418c:	0ff6f693          	zext.b	a3,a3
    4190:	00d86663          	bltu	a6,a3,419c <fatfs_get_sfn_display_name+0x44>
    4194:	02078793          	addi	a5,a5,32
    4198:	0ff7f793          	zext.b	a5,a5
    419c:	00f50023          	sb	a5,0(a0)
    41a0:	00170713          	addi	a4,a4,1
    41a4:	00150513          	addi	a0,a0,1
    41a8:	fbdff06f          	j	4164 <fatfs_get_sfn_display_name+0xc>

000041ac <fatfs_fat_init>:
    41ac:	ff010113          	addi	sp,sp,-16
    41b0:	00812423          	sw	s0,8(sp)
    41b4:	00912223          	sw	s1,4(sp)
    41b8:	00112623          	sw	ra,12(sp)
    41bc:	fff00793          	li	a5,-1
    41c0:	25850493          	addi	s1,a0,600
    41c4:	00050413          	mv	s0,a0
    41c8:	44f52c23          	sw	a5,1112(a0)
    41cc:	24052a23          	sw	zero,596(a0)
    41d0:	44052e23          	sw	zero,1116(a0)
    41d4:	20000613          	li	a2,512
    41d8:	00048513          	mv	a0,s1
    41dc:	00000593          	li	a1,0
    41e0:	ffffe097          	auipc	ra,0xffffe
    41e4:	790080e7          	jalr	1936(ra) # 2970 <memset>
    41e8:	25442783          	lw	a5,596(s0)
    41ec:	00c12083          	lw	ra,12(sp)
    41f0:	24942a23          	sw	s1,596(s0)
    41f4:	46042023          	sw	zero,1120(s0)
    41f8:	46f42223          	sw	a5,1124(s0)
    41fc:	00812403          	lw	s0,8(sp)
    4200:	00412483          	lw	s1,4(sp)
    4204:	01010113          	addi	sp,sp,16
    4208:	00008067          	ret

0000420c <fatfs_init>:
    420c:	fd010113          	addi	sp,sp,-48
    4210:	02812423          	sw	s0,40(sp)
    4214:	02112623          	sw	ra,44(sp)
    4218:	02912223          	sw	s1,36(sp)
    421c:	03212023          	sw	s2,32(sp)
    4220:	01312e23          	sw	s3,28(sp)
    4224:	fff00793          	li	a5,-1
    4228:	24f52223          	sw	a5,580(a0)
    422c:	24052423          	sw	zero,584(a0)
    4230:	02052223          	sw	zero,36(a0)
    4234:	00050413          	mv	s0,a0
    4238:	00000097          	auipc	ra,0x0
    423c:	f74080e7          	jalr	-140(ra) # 41ac <fatfs_fat_init>
    4240:	03442783          	lw	a5,52(s0)
    4244:	02079463          	bnez	a5,426c <fatfs_init+0x60>
    4248:	fff00713          	li	a4,-1
    424c:	02c12083          	lw	ra,44(sp)
    4250:	02812403          	lw	s0,40(sp)
    4254:	02412483          	lw	s1,36(sp)
    4258:	02012903          	lw	s2,32(sp)
    425c:	01c12983          	lw	s3,28(sp)
    4260:	00070513          	mv	a0,a4
    4264:	03010113          	addi	sp,sp,48
    4268:	00008067          	ret
    426c:	04440593          	addi	a1,s0,68
    4270:	00100613          	li	a2,1
    4274:	00000513          	li	a0,0
    4278:	00b12623          	sw	a1,12(sp)
    427c:	000780e7          	jalr	a5
    4280:	fc0504e3          	beqz	a0,4248 <fatfs_init+0x3c>
    4284:	24244703          	lbu	a4,578(s0)
    4288:	05500793          	li	a5,85
    428c:	00c12583          	lw	a1,12(sp)
    4290:	00f70663          	beq	a4,a5,429c <fatfs_init+0x90>
    4294:	ffd00713          	li	a4,-3
    4298:	fb5ff06f          	j	424c <fatfs_init+0x40>
    429c:	24344703          	lbu	a4,579(s0)
    42a0:	0aa00793          	li	a5,170
    42a4:	fef718e3          	bne	a4,a5,4294 <fatfs_init+0x88>
    42a8:	20644783          	lbu	a5,518(s0)
    42ac:	00600713          	li	a4,6
    42b0:	02f76463          	bltu	a4,a5,42d8 <fatfs_init+0xcc>
    42b4:	00400713          	li	a4,4
    42b8:	00f76663          	bltu	a4,a5,42c4 <fatfs_init+0xb8>
    42bc:	00000513          	li	a0,0
    42c0:	02078663          	beqz	a5,42ec <fatfs_init+0xe0>
    42c4:	20c45503          	lhu	a0,524(s0)
    42c8:	20a45783          	lhu	a5,522(s0)
    42cc:	01051513          	slli	a0,a0,0x10
    42d0:	00f56533          	or	a0,a0,a5
    42d4:	0180006f          	j	42ec <fatfs_init+0xe0>
    42d8:	00c00713          	li	a4,12
    42dc:	12f76663          	bltu	a4,a5,4408 <fatfs_init+0x1fc>
    42e0:	00a00713          	li	a4,10
    42e4:	00000513          	li	a0,0
    42e8:	fcf76ee3          	bltu	a4,a5,42c4 <fatfs_init+0xb8>
    42ec:	03442783          	lw	a5,52(s0)
    42f0:	00a42e23          	sw	a0,28(s0)
    42f4:	00100613          	li	a2,1
    42f8:	000780e7          	jalr	a5
    42fc:	f40506e3          	beqz	a0,4248 <fatfs_init+0x3c>
    4300:	05044783          	lbu	a5,80(s0)
    4304:	04f44703          	lbu	a4,79(s0)
    4308:	20000693          	li	a3,512
    430c:	00879793          	slli	a5,a5,0x8
    4310:	00e7e7b3          	or	a5,a5,a4
    4314:	ffe00713          	li	a4,-2
    4318:	f2d79ae3          	bne	a5,a3,424c <fatfs_init+0x40>
    431c:	05644483          	lbu	s1,86(s0)
    4320:	05544783          	lbu	a5,85(s0)
    4324:	05144983          	lbu	s3,81(s0)
    4328:	00849493          	slli	s1,s1,0x8
    432c:	05a45583          	lhu	a1,90(s0)
    4330:	00f4e4b3          	or	s1,s1,a5
    4334:	01340023          	sb	s3,0(s0)
    4338:	02941423          	sh	s1,40(s0)
    433c:	05245903          	lhu	s2,82(s0)
    4340:	05444503          	lbu	a0,84(s0)
    4344:	00059463          	bnez	a1,434c <fatfs_init+0x140>
    4348:	06842583          	lw	a1,104(s0)
    434c:	07042783          	lw	a5,112(s0)
    4350:	02b42023          	sw	a1,32(s0)
    4354:	00549493          	slli	s1,s1,0x5
    4358:	00f42423          	sw	a5,8(s0)
    435c:	07445783          	lhu	a5,116(s0)
    4360:	1ff48493          	addi	s1,s1,511
    4364:	4094d493          	srai	s1,s1,0x9
    4368:	00f41c23          	sh	a5,24(s0)
    436c:	fffff097          	auipc	ra,0xfffff
    4370:	ccc080e7          	jalr	-820(ra) # 3038 <__mulsi3>
    4374:	00a907b3          	add	a5,s2,a0
    4378:	00f42623          	sw	a5,12(s0)
    437c:	01c42783          	lw	a5,28(s0)
    4380:	24245703          	lhu	a4,578(s0)
    4384:	00942823          	sw	s1,16(s0)
    4388:	00f907b3          	add	a5,s2,a5
    438c:	00f42a23          	sw	a5,20(s0)
    4390:	00f507b3          	add	a5,a0,a5
    4394:	00f42223          	sw	a5,4(s0)
    4398:	0000b7b7          	lui	a5,0xb
    439c:	a5578793          	addi	a5,a5,-1451 # aa55 <_files+0x1ec5>
    43a0:	eef71ae3          	bne	a4,a5,4294 <fatfs_init+0x88>
    43a4:	05844783          	lbu	a5,88(s0)
    43a8:	05744703          	lbu	a4,87(s0)
    43ac:	00879793          	slli	a5,a5,0x8
    43b0:	00e7e7b3          	or	a5,a5,a4
    43b4:	00079463          	bnez	a5,43bc <fatfs_init+0x1b0>
    43b8:	06442783          	lw	a5,100(s0)
    43bc:	ffb00713          	li	a4,-5
    43c0:	e80986e3          	beqz	s3,424c <fatfs_init+0x40>
    43c4:	00990933          	add	s2,s2,s1
    43c8:	00a90533          	add	a0,s2,a0
    43cc:	40a78533          	sub	a0,a5,a0
    43d0:	00098593          	mv	a1,s3
    43d4:	ffffe097          	auipc	ra,0xffffe
    43d8:	4f0080e7          	jalr	1264(ra) # 28c4 <__udivsi3>
    43dc:	000017b7          	lui	a5,0x1
    43e0:	ff478793          	addi	a5,a5,-12 # ff4 <play_dj_mode+0x28c>
    43e4:	ffb00713          	li	a4,-5
    43e8:	e6a7f2e3          	bgeu	a5,a0,424c <fatfs_init+0x40>
    43ec:	000107b7          	lui	a5,0x10
    43f0:	ff478793          	addi	a5,a5,-12 # fff4 <_files+0x7464>
    43f4:	02a7e663          	bltu	a5,a0,4420 <fatfs_init+0x214>
    43f8:	00042423          	sw	zero,8(s0)
    43fc:	02042823          	sw	zero,48(s0)
    4400:	00000713          	li	a4,0
    4404:	e49ff06f          	j	424c <fatfs_init+0x40>
    4408:	ff278793          	addi	a5,a5,-14
    440c:	0ff7f793          	zext.b	a5,a5
    4410:	00100713          	li	a4,1
    4414:	00000513          	li	a0,0
    4418:	eaf776e3          	bgeu	a4,a5,42c4 <fatfs_init+0xb8>
    441c:	ed1ff06f          	j	42ec <fatfs_init+0xe0>
    4420:	00100793          	li	a5,1
    4424:	02f42823          	sw	a5,48(s0)
    4428:	fd9ff06f          	j	4400 <fatfs_init+0x1f4>

0000442c <fl_attach_media>:
    442c:	000077b7          	lui	a5,0x7
    4430:	b087a783          	lw	a5,-1272(a5) # 6b08 <_filelib_init>
    4434:	fe010113          	addi	sp,sp,-32
    4438:	00812c23          	sw	s0,24(sp)
    443c:	00112e23          	sw	ra,28(sp)
    4440:	00050413          	mv	s0,a0
    4444:	00079a63          	bnez	a5,4458 <fl_attach_media+0x2c>
    4448:	00b12623          	sw	a1,12(sp)
    444c:	fffff097          	auipc	ra,0xfffff
    4450:	080080e7          	jalr	128(ra) # 34cc <fl_init>
    4454:	00c12583          	lw	a1,12(sp)
    4458:	000087b7          	lui	a5,0x8
    445c:	72878513          	addi	a0,a5,1832 # 8728 <_fs>
    4460:	02b52c23          	sw	a1,56(a0)
    4464:	02852a23          	sw	s0,52(a0)
    4468:	00000097          	auipc	ra,0x0
    446c:	da4080e7          	jalr	-604(ra) # 420c <fatfs_init>
    4470:	00050593          	mv	a1,a0
    4474:	02050863          	beqz	a0,44a4 <fl_attach_media+0x78>
    4478:	00a12623          	sw	a0,12(sp)
    447c:	00006537          	lui	a0,0x6
    4480:	69c50513          	addi	a0,a0,1692 # 669c <LEDS+0x1cc>
    4484:	fffff097          	auipc	ra,0xfffff
    4488:	a78080e7          	jalr	-1416(ra) # 2efc <printf>
    448c:	00c12583          	lw	a1,12(sp)
    4490:	01c12083          	lw	ra,28(sp)
    4494:	01812403          	lw	s0,24(sp)
    4498:	00058513          	mv	a0,a1
    449c:	02010113          	addi	sp,sp,32
    44a0:	00008067          	ret
    44a4:	000077b7          	lui	a5,0x7
    44a8:	00100713          	li	a4,1
    44ac:	b0e7a223          	sw	a4,-1276(a5) # 6b04 <_filelib_valid>
    44b0:	fe1ff06f          	j	4490 <fl_attach_media+0x64>

000044b4 <fatfs_fat_purge>:
    44b4:	25452583          	lw	a1,596(a0)
    44b8:	fe010113          	addi	sp,sp,-32
    44bc:	00812c23          	sw	s0,24(sp)
    44c0:	00112e23          	sw	ra,28(sp)
    44c4:	00050413          	mv	s0,a0
    44c8:	00059663          	bnez	a1,44d4 <fatfs_fat_purge+0x20>
    44cc:	00100513          	li	a0,1
    44d0:	02c0006f          	j	44fc <fatfs_fat_purge+0x48>
    44d4:	2045a783          	lw	a5,516(a1)
    44d8:	00079663          	bnez	a5,44e4 <fatfs_fat_purge+0x30>
    44dc:	20c5a583          	lw	a1,524(a1)
    44e0:	fe9ff06f          	j	44c8 <fatfs_fat_purge+0x14>
    44e4:	00040513          	mv	a0,s0
    44e8:	00b12623          	sw	a1,12(sp)
    44ec:	fffff097          	auipc	ra,0xfffff
    44f0:	c80080e7          	jalr	-896(ra) # 316c <fatfs_fat_writeback>
    44f4:	00c12583          	lw	a1,12(sp)
    44f8:	fe0512e3          	bnez	a0,44dc <fatfs_fat_purge+0x28>
    44fc:	01c12083          	lw	ra,28(sp)
    4500:	01812403          	lw	s0,24(sp)
    4504:	02010113          	addi	sp,sp,32
    4508:	00008067          	ret

0000450c <fatfs_find_next_cluster>:
    450c:	ff010113          	addi	sp,sp,-16
    4510:	00812423          	sw	s0,8(sp)
    4514:	01212023          	sw	s2,0(sp)
    4518:	00112623          	sw	ra,12(sp)
    451c:	00912223          	sw	s1,4(sp)
    4520:	00050913          	mv	s2,a0
    4524:	00200413          	li	s0,2
    4528:	00058463          	beqz	a1,4530 <fatfs_find_next_cluster+0x24>
    452c:	00058413          	mv	s0,a1
    4530:	03092783          	lw	a5,48(s2)
    4534:	00745493          	srli	s1,s0,0x7
    4538:	00079463          	bnez	a5,4540 <fatfs_find_next_cluster+0x34>
    453c:	00845493          	srli	s1,s0,0x8
    4540:	01492583          	lw	a1,20(s2)
    4544:	00090513          	mv	a0,s2
    4548:	00b485b3          	add	a1,s1,a1
    454c:	fffff097          	auipc	ra,0xfffff
    4550:	ca4080e7          	jalr	-860(ra) # 31f0 <fatfs_fat_read_sector>
    4554:	00050793          	mv	a5,a0
    4558:	fff00513          	li	a0,-1
    455c:	04078863          	beqz	a5,45ac <fatfs_find_next_cluster+0xa0>
    4560:	03092703          	lw	a4,48(s2)
    4564:	2087a783          	lw	a5,520(a5)
    4568:	04071e63          	bnez	a4,45c4 <fatfs_find_next_cluster+0xb8>
    456c:	00849493          	slli	s1,s1,0x8
    4570:	40940433          	sub	s0,s0,s1
    4574:	00141413          	slli	s0,s0,0x1
    4578:	01041413          	slli	s0,s0,0x10
    457c:	01045413          	srli	s0,s0,0x10
    4580:	008787b3          	add	a5,a5,s0
    4584:	0017c503          	lbu	a0,1(a5)
    4588:	0007c783          	lbu	a5,0(a5)
    458c:	00851513          	slli	a0,a0,0x8
    4590:	00f50533          	add	a0,a0,a5
    4594:	ffff07b7          	lui	a5,0xffff0
    4598:	00878793          	addi	a5,a5,8 # ffff0008 <__stacktop+0xfffe0008>
    459c:	00f507b3          	add	a5,a0,a5
    45a0:	00700713          	li	a4,7
    45a4:	00f76463          	bltu	a4,a5,45ac <fatfs_find_next_cluster+0xa0>
    45a8:	fff00513          	li	a0,-1
    45ac:	00c12083          	lw	ra,12(sp)
    45b0:	00812403          	lw	s0,8(sp)
    45b4:	00412483          	lw	s1,4(sp)
    45b8:	00012903          	lw	s2,0(sp)
    45bc:	01010113          	addi	sp,sp,16
    45c0:	00008067          	ret
    45c4:	00749493          	slli	s1,s1,0x7
    45c8:	40940433          	sub	s0,s0,s1
    45cc:	00241413          	slli	s0,s0,0x2
    45d0:	01041413          	slli	s0,s0,0x10
    45d4:	01045413          	srli	s0,s0,0x10
    45d8:	008787b3          	add	a5,a5,s0
    45dc:	0037c503          	lbu	a0,3(a5)
    45e0:	0027c703          	lbu	a4,2(a5)
    45e4:	01851513          	slli	a0,a0,0x18
    45e8:	01071713          	slli	a4,a4,0x10
    45ec:	00e50533          	add	a0,a0,a4
    45f0:	0007c703          	lbu	a4,0(a5)
    45f4:	0017c783          	lbu	a5,1(a5)
    45f8:	00e50533          	add	a0,a0,a4
    45fc:	00879793          	slli	a5,a5,0x8
    4600:	00f50533          	add	a0,a0,a5
    4604:	00451513          	slli	a0,a0,0x4
    4608:	00455513          	srli	a0,a0,0x4
    460c:	f00007b7          	lui	a5,0xf0000
    4610:	f89ff06f          	j	4598 <fatfs_find_next_cluster+0x8c>

00004614 <fatfs_sector_reader>:
    4614:	03052783          	lw	a5,48(a0)
    4618:	fe010113          	addi	sp,sp,-32
    461c:	00812c23          	sw	s0,24(sp)
    4620:	01212823          	sw	s2,16(sp)
    4624:	01512223          	sw	s5,4(sp)
    4628:	00112e23          	sw	ra,28(sp)
    462c:	00912a23          	sw	s1,20(sp)
    4630:	01312623          	sw	s3,12(sp)
    4634:	01412423          	sw	s4,8(sp)
    4638:	01612023          	sw	s6,0(sp)
    463c:	00f5e7b3          	or	a5,a1,a5
    4640:	00050413          	mv	s0,a0
    4644:	00060913          	mv	s2,a2
    4648:	00068a93          	mv	s5,a3
    464c:	08079063          	bnez	a5,46cc <fatfs_sector_reader+0xb8>
    4650:	01052783          	lw	a5,16(a0)
    4654:	02f66863          	bltu	a2,a5,4684 <fatfs_sector_reader+0x70>
    4658:	00000513          	li	a0,0
    465c:	01c12083          	lw	ra,28(sp)
    4660:	01812403          	lw	s0,24(sp)
    4664:	01412483          	lw	s1,20(sp)
    4668:	01012903          	lw	s2,16(sp)
    466c:	00c12983          	lw	s3,12(sp)
    4670:	00812a03          	lw	s4,8(sp)
    4674:	00412a83          	lw	s5,4(sp)
    4678:	00012b03          	lw	s6,0(sp)
    467c:	02010113          	addi	sp,sp,32
    4680:	00008067          	ret
    4684:	01c52503          	lw	a0,28(a0)
    4688:	00c42783          	lw	a5,12(s0)
    468c:	00f50533          	add	a0,a0,a5
    4690:	01250533          	add	a0,a0,s2
    4694:	0a0a8663          	beqz	s5,4740 <fatfs_sector_reader+0x12c>
    4698:	03442783          	lw	a5,52(s0)
    469c:	00100613          	li	a2,1
    46a0:	000a8593          	mv	a1,s5
    46a4:	01812403          	lw	s0,24(sp)
    46a8:	01c12083          	lw	ra,28(sp)
    46ac:	01412483          	lw	s1,20(sp)
    46b0:	01012903          	lw	s2,16(sp)
    46b4:	00c12983          	lw	s3,12(sp)
    46b8:	00812a03          	lw	s4,8(sp)
    46bc:	00412a83          	lw	s5,4(sp)
    46c0:	00012b03          	lw	s6,0(sp)
    46c4:	02010113          	addi	sp,sp,32
    46c8:	00078067          	jr	a5 # f0000000 <__stacktop+0xefff0000>
    46cc:	00054783          	lbu	a5,0(a0)
    46d0:	00058493          	mv	s1,a1
    46d4:	00060513          	mv	a0,a2
    46d8:	00078593          	mv	a1,a5
    46dc:	00078a13          	mv	s4,a5
    46e0:	ffffe097          	auipc	ra,0xffffe
    46e4:	1e4080e7          	jalr	484(ra) # 28c4 <__udivsi3>
    46e8:	00050b13          	mv	s6,a0
    46ec:	00000993          	li	s3,0
    46f0:	03699a63          	bne	s3,s6,4724 <fatfs_sector_reader+0x110>
    46f4:	fff00793          	li	a5,-1
    46f8:	f6f480e3          	beq	s1,a5,4658 <fatfs_sector_reader+0x44>
    46fc:	000a0593          	mv	a1,s4
    4700:	00090513          	mv	a0,s2
    4704:	ffffe097          	auipc	ra,0xffffe
    4708:	208080e7          	jalr	520(ra) # 290c <__umodsi3>
    470c:	00050913          	mv	s2,a0
    4710:	00048593          	mv	a1,s1
    4714:	00040513          	mv	a0,s0
    4718:	fffff097          	auipc	ra,0xfffff
    471c:	c84080e7          	jalr	-892(ra) # 339c <fatfs_lba_of_cluster>
    4720:	f71ff06f          	j	4690 <fatfs_sector_reader+0x7c>
    4724:	00048593          	mv	a1,s1
    4728:	00040513          	mv	a0,s0
    472c:	00000097          	auipc	ra,0x0
    4730:	de0080e7          	jalr	-544(ra) # 450c <fatfs_find_next_cluster>
    4734:	00050493          	mv	s1,a0
    4738:	00198993          	addi	s3,s3,1
    473c:	fb5ff06f          	j	46f0 <fatfs_sector_reader+0xdc>
    4740:	24442783          	lw	a5,580(s0)
    4744:	00a78c63          	beq	a5,a0,475c <fatfs_sector_reader+0x148>
    4748:	03442783          	lw	a5,52(s0)
    474c:	24a42223          	sw	a0,580(s0)
    4750:	00100613          	li	a2,1
    4754:	04440593          	addi	a1,s0,68
    4758:	f4dff06f          	j	46a4 <fatfs_sector_reader+0x90>
    475c:	00100513          	li	a0,1
    4760:	efdff06f          	j	465c <fatfs_sector_reader+0x48>

00004764 <fatfs_get_file_entry>:
    4764:	eb010113          	addi	sp,sp,-336
    4768:	14812423          	sw	s0,328(sp)
    476c:	14912223          	sw	s1,324(sp)
    4770:	13312e23          	sw	s3,316(sp)
    4774:	13712623          	sw	s7,300(sp)
    4778:	13812423          	sw	s8,296(sp)
    477c:	13912223          	sw	s9,292(sp)
    4780:	14112623          	sw	ra,332(sp)
    4784:	15212023          	sw	s2,320(sp)
    4788:	13412c23          	sw	s4,312(sp)
    478c:	13512a23          	sw	s5,308(sp)
    4790:	13612823          	sw	s6,304(sp)
    4794:	00050993          	mv	s3,a0
    4798:	00058c93          	mv	s9,a1
    479c:	00060b93          	mv	s7,a2
    47a0:	00068c13          	mv	s8,a3
    47a4:	10010ea3          	sb	zero,285(sp)
    47a8:	01810413          	addi	s0,sp,24
    47ac:	11c10493          	addi	s1,sp,284
    47b0:	00040513          	mv	a0,s0
    47b4:	00d00613          	li	a2,13
    47b8:	00000593          	li	a1,0
    47bc:	00d40413          	addi	s0,s0,13
    47c0:	ffffe097          	auipc	ra,0xffffe
    47c4:	1b0080e7          	jalr	432(ra) # 2970 <memset>
    47c8:	fe9414e3          	bne	s0,s1,47b0 <fatfs_get_file_entry+0x4c>
    47cc:	00000493          	li	s1,0
    47d0:	24498a13          	addi	s4,s3,580
    47d4:	00810913          	addi	s2,sp,8
    47d8:	00800a93          	li	s5,8
    47dc:	02e00b13          	li	s6,46
    47e0:	00000693          	li	a3,0
    47e4:	00048613          	mv	a2,s1
    47e8:	000c8593          	mv	a1,s9
    47ec:	00098513          	mv	a0,s3
    47f0:	00000097          	auipc	ra,0x0
    47f4:	e24080e7          	jalr	-476(ra) # 4614 <fatfs_sector_reader>
    47f8:	08050c63          	beqz	a0,4890 <fatfs_get_file_entry+0x12c>
    47fc:	00148493          	addi	s1,s1,1
    4800:	04498413          	addi	s0,s3,68
    4804:	00040513          	mv	a0,s0
    4808:	fffff097          	auipc	ra,0xfffff
    480c:	f34080e7          	jalr	-204(ra) # 373c <fatfs_entry_lfn_text>
    4810:	02050063          	beqz	a0,4830 <fatfs_get_file_entry+0xcc>
    4814:	00040593          	mv	a1,s0
    4818:	01810513          	addi	a0,sp,24
    481c:	fffff097          	auipc	ra,0xfffff
    4820:	e18080e7          	jalr	-488(ra) # 3634 <fatfs_lfn_cache_entry>
    4824:	02040413          	addi	s0,s0,32
    4828:	fd441ee3          	bne	s0,s4,4804 <fatfs_get_file_entry+0xa0>
    482c:	fb5ff06f          	j	47e0 <fatfs_get_file_entry+0x7c>
    4830:	00040513          	mv	a0,s0
    4834:	fffff097          	auipc	ra,0xfffff
    4838:	f1c080e7          	jalr	-228(ra) # 3750 <fatfs_entry_lfn_invalid>
    483c:	00050663          	beqz	a0,4848 <fatfs_get_file_entry+0xe4>
    4840:	10010ea3          	sb	zero,285(sp)
    4844:	fe1ff06f          	j	4824 <fatfs_get_file_entry+0xc0>
    4848:	00040593          	mv	a1,s0
    484c:	01810513          	addi	a0,sp,24
    4850:	fffff097          	auipc	ra,0xfffff
    4854:	f34080e7          	jalr	-204(ra) # 3784 <fatfs_entry_lfn_exists>
    4858:	06050663          	beqz	a0,48c4 <fatfs_get_file_entry+0x160>
    485c:	01810513          	addi	a0,sp,24
    4860:	fffff097          	auipc	ra,0xfffff
    4864:	ea0080e7          	jalr	-352(ra) # 3700 <fatfs_lfn_cache_get>
    4868:	000b8593          	mv	a1,s7
    486c:	fffff097          	auipc	ra,0xfffff
    4870:	6dc080e7          	jalr	1756(ra) # 3f48 <fatfs_compare_names>
    4874:	fc0506e3          	beqz	a0,4840 <fatfs_get_file_entry+0xdc>
    4878:	02000613          	li	a2,32
    487c:	00040593          	mv	a1,s0
    4880:	000c0513          	mv	a0,s8
    4884:	ffffe097          	auipc	ra,0xffffe
    4888:	108080e7          	jalr	264(ra) # 298c <memcpy>
    488c:	00100513          	li	a0,1
    4890:	14c12083          	lw	ra,332(sp)
    4894:	14812403          	lw	s0,328(sp)
    4898:	14412483          	lw	s1,324(sp)
    489c:	14012903          	lw	s2,320(sp)
    48a0:	13c12983          	lw	s3,316(sp)
    48a4:	13812a03          	lw	s4,312(sp)
    48a8:	13412a83          	lw	s5,308(sp)
    48ac:	13012b03          	lw	s6,304(sp)
    48b0:	12c12b83          	lw	s7,300(sp)
    48b4:	12812c03          	lw	s8,296(sp)
    48b8:	12412c83          	lw	s9,292(sp)
    48bc:	15010113          	addi	sp,sp,336
    48c0:	00008067          	ret
    48c4:	00040513          	mv	a0,s0
    48c8:	fffff097          	auipc	ra,0xfffff
    48cc:	f0c080e7          	jalr	-244(ra) # 37d4 <fatfs_entry_sfn_only>
    48d0:	f4050ae3          	beqz	a0,4824 <fatfs_get_file_entry+0xc0>
    48d4:	00d00613          	li	a2,13
    48d8:	00000593          	li	a1,0
    48dc:	00090513          	mv	a0,s2
    48e0:	ffffe097          	auipc	ra,0xffffe
    48e4:	090080e7          	jalr	144(ra) # 2970 <memset>
    48e8:	00000793          	li	a5,0
    48ec:	00f406b3          	add	a3,s0,a5
    48f0:	0006c683          	lbu	a3,0(a3)
    48f4:	00f90733          	add	a4,s2,a5
    48f8:	00178793          	addi	a5,a5,1
    48fc:	00d70023          	sb	a3,0(a4)
    4900:	ff5796e3          	bne	a5,s5,48ec <fatfs_get_file_entry+0x188>
    4904:	00844703          	lbu	a4,8(s0)
    4908:	00944783          	lbu	a5,9(s0)
    490c:	00a44683          	lbu	a3,10(s0)
    4910:	00e108a3          	sb	a4,17(sp)
    4914:	00f10923          	sb	a5,18(sp)
    4918:	fe070713          	addi	a4,a4,-32
    491c:	fe078793          	addi	a5,a5,-32
    4920:	00f037b3          	snez	a5,a5
    4924:	00e03733          	snez	a4,a4
    4928:	00d109a3          	sb	a3,19(sp)
    492c:	00e7e7b3          	or	a5,a5,a4
    4930:	00079863          	bnez	a5,4940 <fatfs_get_file_entry+0x1dc>
    4934:	fe068693          	addi	a3,a3,-32
    4938:	02000793          	li	a5,32
    493c:	00068a63          	beqz	a3,4950 <fatfs_get_file_entry+0x1ec>
    4940:	00814703          	lbu	a4,8(sp)
    4944:	02e00793          	li	a5,46
    4948:	01671463          	bne	a4,s6,4950 <fatfs_get_file_entry+0x1ec>
    494c:	02000793          	li	a5,32
    4950:	00f10823          	sb	a5,16(sp)
    4954:	000b8593          	mv	a1,s7
    4958:	00090513          	mv	a0,s2
    495c:	f11ff06f          	j	486c <fatfs_get_file_entry+0x108>

00004960 <_open_directory>:
    4960:	eb010113          	addi	sp,sp,-336
    4964:	15212023          	sw	s2,320(sp)
    4968:	00008937          	lui	s2,0x8
    496c:	72890913          	addi	s2,s2,1832 # 8728 <_fs>
    4970:	14812423          	sw	s0,328(sp)
    4974:	00892403          	lw	s0,8(s2)
    4978:	14912223          	sw	s1,324(sp)
    497c:	13312e23          	sw	s3,316(sp)
    4980:	13412c23          	sw	s4,312(sp)
    4984:	13512a23          	sw	s5,308(sp)
    4988:	13612823          	sw	s6,304(sp)
    498c:	14112623          	sw	ra,332(sp)
    4990:	00050a13          	mv	s4,a0
    4994:	00058a93          	mv	s5,a1
    4998:	fffff097          	auipc	ra,0xfffff
    499c:	368080e7          	jalr	872(ra) # 3d00 <fatfs_total_path_levels>
    49a0:	00050b13          	mv	s6,a0
    49a4:	00000493          	li	s1,0
    49a8:	fff00993          	li	s3,-1
    49ac:	009b5863          	bge	s6,s1,49bc <_open_directory+0x5c>
    49b0:	008aa023          	sw	s0,0(s5)
    49b4:	00100513          	li	a0,1
    49b8:	0240006f          	j	49dc <_open_directory+0x7c>
    49bc:	10400693          	li	a3,260
    49c0:	02c10613          	addi	a2,sp,44
    49c4:	00048593          	mv	a1,s1
    49c8:	000a0513          	mv	a0,s4
    49cc:	fffff097          	auipc	ra,0xfffff
    49d0:	3a4080e7          	jalr	932(ra) # 3d70 <fatfs_get_substring>
    49d4:	03351863          	bne	a0,s3,4a04 <_open_directory+0xa4>
    49d8:	00000513          	li	a0,0
    49dc:	14c12083          	lw	ra,332(sp)
    49e0:	14812403          	lw	s0,328(sp)
    49e4:	14412483          	lw	s1,324(sp)
    49e8:	14012903          	lw	s2,320(sp)
    49ec:	13c12983          	lw	s3,316(sp)
    49f0:	13812a03          	lw	s4,312(sp)
    49f4:	13412a83          	lw	s5,308(sp)
    49f8:	13012b03          	lw	s6,304(sp)
    49fc:	15010113          	addi	sp,sp,336
    4a00:	00008067          	ret
    4a04:	00c10693          	addi	a3,sp,12
    4a08:	02c10613          	addi	a2,sp,44
    4a0c:	00040593          	mv	a1,s0
    4a10:	00090513          	mv	a0,s2
    4a14:	00000097          	auipc	ra,0x0
    4a18:	d50080e7          	jalr	-688(ra) # 4764 <fatfs_get_file_entry>
    4a1c:	fa050ee3          	beqz	a0,49d8 <_open_directory+0x78>
    4a20:	01714783          	lbu	a5,23(sp)
    4a24:	0107f793          	andi	a5,a5,16
    4a28:	fa0788e3          	beqz	a5,49d8 <_open_directory+0x78>
    4a2c:	02015403          	lhu	s0,32(sp)
    4a30:	02615783          	lhu	a5,38(sp)
    4a34:	00148493          	addi	s1,s1,1
    4a38:	01041413          	slli	s0,s0,0x10
    4a3c:	00f40433          	add	s0,s0,a5
    4a40:	f6dff06f          	j	49ac <_open_directory+0x4c>

00004a44 <fl_opendir>:
    4a44:	fe010113          	addi	sp,sp,-32
    4a48:	fff00793          	li	a5,-1
    4a4c:	00f12623          	sw	a5,12(sp)
    4a50:	000077b7          	lui	a5,0x7
    4a54:	b087a783          	lw	a5,-1272(a5) # 6b08 <_filelib_init>
    4a58:	00812c23          	sw	s0,24(sp)
    4a5c:	01212823          	sw	s2,16(sp)
    4a60:	00112e23          	sw	ra,28(sp)
    4a64:	00912a23          	sw	s1,20(sp)
    4a68:	00050913          	mv	s2,a0
    4a6c:	00058413          	mv	s0,a1
    4a70:	00079663          	bnez	a5,4a7c <fl_opendir+0x38>
    4a74:	fffff097          	auipc	ra,0xfffff
    4a78:	a58080e7          	jalr	-1448(ra) # 34cc <fl_init>
    4a7c:	000084b7          	lui	s1,0x8
    4a80:	72848493          	addi	s1,s1,1832 # 8728 <_fs>
    4a84:	03c4a783          	lw	a5,60(s1)
    4a88:	00078463          	beqz	a5,4a90 <fl_opendir+0x4c>
    4a8c:	000780e7          	jalr	a5
    4a90:	00090513          	mv	a0,s2
    4a94:	fffff097          	auipc	ra,0xfffff
    4a98:	26c080e7          	jalr	620(ra) # 3d00 <fatfs_total_path_levels>
    4a9c:	fff00793          	li	a5,-1
    4aa0:	02f51063          	bne	a0,a5,4ac0 <fl_opendir+0x7c>
    4aa4:	0084a783          	lw	a5,8(s1)
    4aa8:	00f12623          	sw	a5,12(sp)
    4aac:	00c12783          	lw	a5,12(sp)
    4ab0:	00042023          	sw	zero,0(s0)
    4ab4:	00040423          	sb	zero,8(s0)
    4ab8:	00f42223          	sw	a5,4(s0)
    4abc:	0180006f          	j	4ad4 <fl_opendir+0x90>
    4ac0:	00c10593          	addi	a1,sp,12
    4ac4:	00090513          	mv	a0,s2
    4ac8:	00000097          	auipc	ra,0x0
    4acc:	e98080e7          	jalr	-360(ra) # 4960 <_open_directory>
    4ad0:	fc051ee3          	bnez	a0,4aac <fl_opendir+0x68>
    4ad4:	0404a783          	lw	a5,64(s1)
    4ad8:	00078463          	beqz	a5,4ae0 <fl_opendir+0x9c>
    4adc:	000780e7          	jalr	a5
    4ae0:	00c12703          	lw	a4,12(sp)
    4ae4:	fff00793          	li	a5,-1
    4ae8:	00f71463          	bne	a4,a5,4af0 <fl_opendir+0xac>
    4aec:	00000413          	li	s0,0
    4af0:	01c12083          	lw	ra,28(sp)
    4af4:	00040513          	mv	a0,s0
    4af8:	01812403          	lw	s0,24(sp)
    4afc:	01412483          	lw	s1,20(sp)
    4b00:	01012903          	lw	s2,16(sp)
    4b04:	02010113          	addi	sp,sp,32
    4b08:	00008067          	ret

00004b0c <_open_file>:
    4b0c:	fc010113          	addi	sp,sp,-64
    4b10:	03312623          	sw	s3,44(sp)
    4b14:	02112e23          	sw	ra,60(sp)
    4b18:	02812c23          	sw	s0,56(sp)
    4b1c:	02912a23          	sw	s1,52(sp)
    4b20:	03212823          	sw	s2,48(sp)
    4b24:	00050993          	mv	s3,a0
    4b28:	ffffe097          	auipc	ra,0xffffe
    4b2c:	7b4080e7          	jalr	1972(ra) # 32dc <_allocate_file>
    4b30:	06050463          	beqz	a0,4b98 <_open_file+0x8c>
    4b34:	01450913          	addi	s2,a0,20
    4b38:	00050413          	mv	s0,a0
    4b3c:	10400613          	li	a2,260
    4b40:	00000593          	li	a1,0
    4b44:	00090513          	mv	a0,s2
    4b48:	ffffe097          	auipc	ra,0xffffe
    4b4c:	e28080e7          	jalr	-472(ra) # 2970 <memset>
    4b50:	11840493          	addi	s1,s0,280
    4b54:	10400613          	li	a2,260
    4b58:	00000593          	li	a1,0
    4b5c:	00048513          	mv	a0,s1
    4b60:	ffffe097          	auipc	ra,0xffffe
    4b64:	e10080e7          	jalr	-496(ra) # 2970 <memset>
    4b68:	10400713          	li	a4,260
    4b6c:	00048693          	mv	a3,s1
    4b70:	00070613          	mv	a2,a4
    4b74:	00090593          	mv	a1,s2
    4b78:	00098513          	mv	a0,s3
    4b7c:	fffff097          	auipc	ra,0xfffff
    4b80:	2dc080e7          	jalr	732(ra) # 3e58 <fatfs_split_path>
    4b84:	fff00793          	li	a5,-1
    4b88:	02f51a63          	bne	a0,a5,4bbc <_open_file+0xb0>
    4b8c:	00040513          	mv	a0,s0
    4b90:	ffffe097          	auipc	ra,0xffffe
    4b94:	7c4080e7          	jalr	1988(ra) # 3354 <_free_file>
    4b98:	00000413          	li	s0,0
    4b9c:	03c12083          	lw	ra,60(sp)
    4ba0:	00040513          	mv	a0,s0
    4ba4:	03812403          	lw	s0,56(sp)
    4ba8:	03412483          	lw	s1,52(sp)
    4bac:	03012903          	lw	s2,48(sp)
    4bb0:	02c12983          	lw	s3,44(sp)
    4bb4:	04010113          	addi	sp,sp,64
    4bb8:	00008067          	ret
    4bbc:	00040513          	mv	a0,s0
    4bc0:	fffff097          	auipc	ra,0xfffff
    4bc4:	514080e7          	jalr	1300(ra) # 40d4 <_check_file_open>
    4bc8:	fc0512e3          	bnez	a0,4b8c <_open_file+0x80>
    4bcc:	01444783          	lbu	a5,20(s0)
    4bd0:	08079c63          	bnez	a5,4c68 <_open_file+0x15c>
    4bd4:	000087b7          	lui	a5,0x8
    4bd8:	7307a783          	lw	a5,1840(a5) # 8730 <_fs+0x8>
    4bdc:	00f42023          	sw	a5,0(s0)
    4be0:	00042583          	lw	a1,0(s0)
    4be4:	00048613          	mv	a2,s1
    4be8:	000084b7          	lui	s1,0x8
    4bec:	00010693          	mv	a3,sp
    4bf0:	72848513          	addi	a0,s1,1832 # 8728 <_fs>
    4bf4:	00000097          	auipc	ra,0x0
    4bf8:	b70080e7          	jalr	-1168(ra) # 4764 <fatfs_get_file_entry>
    4bfc:	f80508e3          	beqz	a0,4b8c <_open_file+0x80>
    4c00:	00b14783          	lbu	a5,11(sp)
    4c04:	0207f793          	andi	a5,a5,32
    4c08:	f80782e3          	beqz	a5,4b8c <_open_file+0x80>
    4c0c:	00b00613          	li	a2,11
    4c10:	00010593          	mv	a1,sp
    4c14:	21c40513          	addi	a0,s0,540
    4c18:	ffffe097          	auipc	ra,0xffffe
    4c1c:	d74080e7          	jalr	-652(ra) # 298c <memcpy>
    4c20:	01c12783          	lw	a5,28(sp)
    4c24:	01a15703          	lhu	a4,26(sp)
    4c28:	00042423          	sw	zero,8(s0)
    4c2c:	00f42623          	sw	a5,12(s0)
    4c30:	01415783          	lhu	a5,20(sp)
    4c34:	42042a23          	sw	zero,1076(s0)
    4c38:	00042823          	sw	zero,16(s0)
    4c3c:	01079793          	slli	a5,a5,0x10
    4c40:	00e787b3          	add	a5,a5,a4
    4c44:	00f42223          	sw	a5,4(s0)
    4c48:	fff00793          	li	a5,-1
    4c4c:	42f42823          	sw	a5,1072(s0)
    4c50:	22f42423          	sw	a5,552(s0)
    4c54:	22f42623          	sw	a5,556(s0)
    4c58:	72848513          	addi	a0,s1,1832
    4c5c:	00000097          	auipc	ra,0x0
    4c60:	858080e7          	jalr	-1960(ra) # 44b4 <fatfs_fat_purge>
    4c64:	f39ff06f          	j	4b9c <_open_file+0x90>
    4c68:	00040593          	mv	a1,s0
    4c6c:	00090513          	mv	a0,s2
    4c70:	00000097          	auipc	ra,0x0
    4c74:	cf0080e7          	jalr	-784(ra) # 4960 <_open_directory>
    4c78:	f60514e3          	bnez	a0,4be0 <_open_file+0xd4>
    4c7c:	f11ff06f          	j	4b8c <_open_file+0x80>

00004c80 <fatfs_sfn_exists>:
    4c80:	fe010113          	addi	sp,sp,-32
    4c84:	01212823          	sw	s2,16(sp)
    4c88:	01312623          	sw	s3,12(sp)
    4c8c:	01412423          	sw	s4,8(sp)
    4c90:	01512223          	sw	s5,4(sp)
    4c94:	01612023          	sw	s6,0(sp)
    4c98:	00112e23          	sw	ra,28(sp)
    4c9c:	00812c23          	sw	s0,24(sp)
    4ca0:	00912a23          	sw	s1,20(sp)
    4ca4:	00050993          	mv	s3,a0
    4ca8:	00058a93          	mv	s5,a1
    4cac:	00060b13          	mv	s6,a2
    4cb0:	00000913          	li	s2,0
    4cb4:	24450a13          	addi	s4,a0,580
    4cb8:	00000693          	li	a3,0
    4cbc:	00090613          	mv	a2,s2
    4cc0:	000a8593          	mv	a1,s5
    4cc4:	00098513          	mv	a0,s3
    4cc8:	00000097          	auipc	ra,0x0
    4ccc:	94c080e7          	jalr	-1716(ra) # 4614 <fatfs_sector_reader>
    4cd0:	00050413          	mv	s0,a0
    4cd4:	06050263          	beqz	a0,4d38 <fatfs_sfn_exists+0xb8>
    4cd8:	00190913          	addi	s2,s2,1
    4cdc:	04498493          	addi	s1,s3,68
    4ce0:	00048513          	mv	a0,s1
    4ce4:	fffff097          	auipc	ra,0xfffff
    4ce8:	a58080e7          	jalr	-1448(ra) # 373c <fatfs_entry_lfn_text>
    4cec:	00050863          	beqz	a0,4cfc <fatfs_sfn_exists+0x7c>
    4cf0:	02048493          	addi	s1,s1,32
    4cf4:	ff4496e3          	bne	s1,s4,4ce0 <fatfs_sfn_exists+0x60>
    4cf8:	fc1ff06f          	j	4cb8 <fatfs_sfn_exists+0x38>
    4cfc:	00048513          	mv	a0,s1
    4d00:	fffff097          	auipc	ra,0xfffff
    4d04:	a50080e7          	jalr	-1456(ra) # 3750 <fatfs_entry_lfn_invalid>
    4d08:	fe0514e3          	bnez	a0,4cf0 <fatfs_sfn_exists+0x70>
    4d0c:	00048513          	mv	a0,s1
    4d10:	fffff097          	auipc	ra,0xfffff
    4d14:	ac4080e7          	jalr	-1340(ra) # 37d4 <fatfs_entry_sfn_only>
    4d18:	00050413          	mv	s0,a0
    4d1c:	fc050ae3          	beqz	a0,4cf0 <fatfs_sfn_exists+0x70>
    4d20:	00b00613          	li	a2,11
    4d24:	000b0593          	mv	a1,s6
    4d28:	00048513          	mv	a0,s1
    4d2c:	ffffe097          	auipc	ra,0xffffe
    4d30:	ca4080e7          	jalr	-860(ra) # 29d0 <strncmp>
    4d34:	fa051ee3          	bnez	a0,4cf0 <fatfs_sfn_exists+0x70>
    4d38:	01c12083          	lw	ra,28(sp)
    4d3c:	00040513          	mv	a0,s0
    4d40:	01812403          	lw	s0,24(sp)
    4d44:	01412483          	lw	s1,20(sp)
    4d48:	01012903          	lw	s2,16(sp)
    4d4c:	00c12983          	lw	s3,12(sp)
    4d50:	00812a03          	lw	s4,8(sp)
    4d54:	00412a83          	lw	s5,4(sp)
    4d58:	00012b03          	lw	s6,0(sp)
    4d5c:	02010113          	addi	sp,sp,32
    4d60:	00008067          	ret

00004d64 <fatfs_update_file_length>:
    4d64:	03852783          	lw	a5,56(a0)
    4d68:	14078e63          	beqz	a5,4ec4 <fatfs_update_file_length+0x160>
    4d6c:	fd010113          	addi	sp,sp,-48
    4d70:	02912223          	sw	s1,36(sp)
    4d74:	03212023          	sw	s2,32(sp)
    4d78:	01312e23          	sw	s3,28(sp)
    4d7c:	01412c23          	sw	s4,24(sp)
    4d80:	01612823          	sw	s6,16(sp)
    4d84:	01712623          	sw	s7,12(sp)
    4d88:	02112623          	sw	ra,44(sp)
    4d8c:	02812423          	sw	s0,40(sp)
    4d90:	01512a23          	sw	s5,20(sp)
    4d94:	00068913          	mv	s2,a3
    4d98:	00060b93          	mv	s7,a2
    4d9c:	00058b13          	mv	s6,a1
    4da0:	00050493          	mv	s1,a0
    4da4:	00000993          	li	s3,0
    4da8:	24450a13          	addi	s4,a0,580
    4dac:	00000693          	li	a3,0
    4db0:	00098613          	mv	a2,s3
    4db4:	000b0593          	mv	a1,s6
    4db8:	00048513          	mv	a0,s1
    4dbc:	00000097          	auipc	ra,0x0
    4dc0:	858080e7          	jalr	-1960(ra) # 4614 <fatfs_sector_reader>
    4dc4:	0c050863          	beqz	a0,4e94 <fatfs_update_file_length+0x130>
    4dc8:	04448413          	addi	s0,s1,68
    4dcc:	00198993          	addi	s3,s3,1
    4dd0:	00040a93          	mv	s5,s0
    4dd4:	00040513          	mv	a0,s0
    4dd8:	fffff097          	auipc	ra,0xfffff
    4ddc:	964080e7          	jalr	-1692(ra) # 373c <fatfs_entry_lfn_text>
    4de0:	0a051463          	bnez	a0,4e88 <fatfs_update_file_length+0x124>
    4de4:	00040513          	mv	a0,s0
    4de8:	fffff097          	auipc	ra,0xfffff
    4dec:	968080e7          	jalr	-1688(ra) # 3750 <fatfs_entry_lfn_invalid>
    4df0:	08051c63          	bnez	a0,4e88 <fatfs_update_file_length+0x124>
    4df4:	00040513          	mv	a0,s0
    4df8:	fffff097          	auipc	ra,0xfffff
    4dfc:	9dc080e7          	jalr	-1572(ra) # 37d4 <fatfs_entry_sfn_only>
    4e00:	08050463          	beqz	a0,4e88 <fatfs_update_file_length+0x124>
    4e04:	00b00613          	li	a2,11
    4e08:	000b8593          	mv	a1,s7
    4e0c:	00040513          	mv	a0,s0
    4e10:	ffffe097          	auipc	ra,0xffffe
    4e14:	bc0080e7          	jalr	-1088(ra) # 29d0 <strncmp>
    4e18:	06051863          	bnez	a0,4e88 <fatfs_update_file_length+0x124>
    4e1c:	00895793          	srli	a5,s2,0x8
    4e20:	01240e23          	sb	s2,28(s0)
    4e24:	00f40ea3          	sb	a5,29(s0)
    4e28:	01095793          	srli	a5,s2,0x10
    4e2c:	01895913          	srli	s2,s2,0x18
    4e30:	00f40f23          	sb	a5,30(s0)
    4e34:	01240fa3          	sb	s2,31(s0)
    4e38:	00040593          	mv	a1,s0
    4e3c:	02000613          	li	a2,32
    4e40:	00040513          	mv	a0,s0
    4e44:	ffffe097          	auipc	ra,0xffffe
    4e48:	b48080e7          	jalr	-1208(ra) # 298c <memcpy>
    4e4c:	02812403          	lw	s0,40(sp)
    4e50:	0384a783          	lw	a5,56(s1)
    4e54:	2444a503          	lw	a0,580(s1)
    4e58:	02c12083          	lw	ra,44(sp)
    4e5c:	02412483          	lw	s1,36(sp)
    4e60:	02012903          	lw	s2,32(sp)
    4e64:	01c12983          	lw	s3,28(sp)
    4e68:	01812a03          	lw	s4,24(sp)
    4e6c:	01012b03          	lw	s6,16(sp)
    4e70:	00c12b83          	lw	s7,12(sp)
    4e74:	000a8593          	mv	a1,s5
    4e78:	01412a83          	lw	s5,20(sp)
    4e7c:	00100613          	li	a2,1
    4e80:	03010113          	addi	sp,sp,48
    4e84:	00078067          	jr	a5
    4e88:	02040413          	addi	s0,s0,32
    4e8c:	f54414e3          	bne	s0,s4,4dd4 <fatfs_update_file_length+0x70>
    4e90:	f1dff06f          	j	4dac <fatfs_update_file_length+0x48>
    4e94:	02c12083          	lw	ra,44(sp)
    4e98:	02812403          	lw	s0,40(sp)
    4e9c:	02412483          	lw	s1,36(sp)
    4ea0:	02012903          	lw	s2,32(sp)
    4ea4:	01c12983          	lw	s3,28(sp)
    4ea8:	01812a03          	lw	s4,24(sp)
    4eac:	01412a83          	lw	s5,20(sp)
    4eb0:	01012b03          	lw	s6,16(sp)
    4eb4:	00c12b83          	lw	s7,12(sp)
    4eb8:	00000513          	li	a0,0
    4ebc:	03010113          	addi	sp,sp,48
    4ec0:	00008067          	ret
    4ec4:	00000513          	li	a0,0
    4ec8:	00008067          	ret

00004ecc <fatfs_list_directory_next>:
    4ecc:	ec010113          	addi	sp,sp,-320
    4ed0:	13212823          	sw	s2,304(sp)
    4ed4:	13312623          	sw	s3,300(sp)
    4ed8:	13412423          	sw	s4,296(sp)
    4edc:	13512223          	sw	s5,292(sp)
    4ee0:	13612023          	sw	s6,288(sp)
    4ee4:	12112e23          	sw	ra,316(sp)
    4ee8:	12812c23          	sw	s0,312(sp)
    4eec:	12912a23          	sw	s1,308(sp)
    4ef0:	00050a13          	mv	s4,a0
    4ef4:	00058913          	mv	s2,a1
    4ef8:	00060993          	mv	s3,a2
    4efc:	10010ea3          	sb	zero,285(sp)
    4f00:	04450a93          	addi	s5,a0,68
    4f04:	00f00b13          	li	s6,15
    4f08:	00092603          	lw	a2,0(s2)
    4f0c:	00492583          	lw	a1,4(s2)
    4f10:	00000693          	li	a3,0
    4f14:	000a0513          	mv	a0,s4
    4f18:	fffff097          	auipc	ra,0xfffff
    4f1c:	6fc080e7          	jalr	1788(ra) # 4614 <fatfs_sector_reader>
    4f20:	10050c63          	beqz	a0,5038 <fatfs_list_directory_next+0x16c>
    4f24:	00894483          	lbu	s1,8(s2)
    4f28:	00549413          	slli	s0,s1,0x5
    4f2c:	008a8433          	add	s0,s5,s0
    4f30:	009b7c63          	bgeu	s6,s1,4f48 <fatfs_list_directory_next+0x7c>
    4f34:	00092783          	lw	a5,0(s2)
    4f38:	00090423          	sb	zero,8(s2)
    4f3c:	00178793          	addi	a5,a5,1
    4f40:	00f92023          	sw	a5,0(s2)
    4f44:	fc5ff06f          	j	4f08 <fatfs_list_directory_next+0x3c>
    4f48:	00040513          	mv	a0,s0
    4f4c:	ffffe097          	auipc	ra,0xffffe
    4f50:	7f0080e7          	jalr	2032(ra) # 373c <fatfs_entry_lfn_text>
    4f54:	02050263          	beqz	a0,4f78 <fatfs_list_directory_next+0xac>
    4f58:	00040593          	mv	a1,s0
    4f5c:	01810513          	addi	a0,sp,24
    4f60:	ffffe097          	auipc	ra,0xffffe
    4f64:	6d4080e7          	jalr	1748(ra) # 3634 <fatfs_lfn_cache_entry>
    4f68:	00148493          	addi	s1,s1,1
    4f6c:	0ff4f493          	zext.b	s1,s1
    4f70:	02040413          	addi	s0,s0,32
    4f74:	fbdff06f          	j	4f30 <fatfs_list_directory_next+0x64>
    4f78:	00040513          	mv	a0,s0
    4f7c:	ffffe097          	auipc	ra,0xffffe
    4f80:	7d4080e7          	jalr	2004(ra) # 3750 <fatfs_entry_lfn_invalid>
    4f84:	00050663          	beqz	a0,4f90 <fatfs_list_directory_next+0xc4>
    4f88:	10010ea3          	sb	zero,285(sp)
    4f8c:	fddff06f          	j	4f68 <fatfs_list_directory_next+0x9c>
    4f90:	00040593          	mv	a1,s0
    4f94:	01810513          	addi	a0,sp,24
    4f98:	ffffe097          	auipc	ra,0xffffe
    4f9c:	7ec080e7          	jalr	2028(ra) # 3784 <fatfs_entry_lfn_exists>
    4fa0:	0c050063          	beqz	a0,5060 <fatfs_list_directory_next+0x194>
    4fa4:	01810513          	addi	a0,sp,24
    4fa8:	ffffe097          	auipc	ra,0xffffe
    4fac:	758080e7          	jalr	1880(ra) # 3700 <fatfs_lfn_cache_get>
    4fb0:	00050593          	mv	a1,a0
    4fb4:	10300613          	li	a2,259
    4fb8:	00098513          	mv	a0,s3
    4fbc:	ffffe097          	auipc	ra,0xffffe
    4fc0:	a54080e7          	jalr	-1452(ra) # 2a10 <strncpy>
    4fc4:	00040513          	mv	a0,s0
    4fc8:	fffff097          	auipc	ra,0xfffff
    4fcc:	84c080e7          	jalr	-1972(ra) # 3814 <fatfs_entry_is_dir>
    4fd0:	10a98223          	sb	a0,260(s3)
    4fd4:	01d44783          	lbu	a5,29(s0)
    4fd8:	01c44703          	lbu	a4,28(s0)
    4fdc:	00148493          	addi	s1,s1,1
    4fe0:	00879793          	slli	a5,a5,0x8
    4fe4:	00e7e7b3          	or	a5,a5,a4
    4fe8:	01e44703          	lbu	a4,30(s0)
    4fec:	00100513          	li	a0,1
    4ff0:	01071713          	slli	a4,a4,0x10
    4ff4:	00f76733          	or	a4,a4,a5
    4ff8:	01f44783          	lbu	a5,31(s0)
    4ffc:	01879793          	slli	a5,a5,0x18
    5000:	00e7e7b3          	or	a5,a5,a4
    5004:	10f9a623          	sw	a5,268(s3)
    5008:	01544783          	lbu	a5,21(s0)
    500c:	01444703          	lbu	a4,20(s0)
    5010:	01a44683          	lbu	a3,26(s0)
    5014:	00879793          	slli	a5,a5,0x8
    5018:	00e7e7b3          	or	a5,a5,a4
    501c:	01b44703          	lbu	a4,27(s0)
    5020:	01079793          	slli	a5,a5,0x10
    5024:	00871713          	slli	a4,a4,0x8
    5028:	00d76733          	or	a4,a4,a3
    502c:	00e7e7b3          	or	a5,a5,a4
    5030:	10f9a423          	sw	a5,264(s3)
    5034:	00990423          	sb	s1,8(s2)
    5038:	13c12083          	lw	ra,316(sp)
    503c:	13812403          	lw	s0,312(sp)
    5040:	13412483          	lw	s1,308(sp)
    5044:	13012903          	lw	s2,304(sp)
    5048:	12c12983          	lw	s3,300(sp)
    504c:	12812a03          	lw	s4,296(sp)
    5050:	12412a83          	lw	s5,292(sp)
    5054:	12012b03          	lw	s6,288(sp)
    5058:	14010113          	addi	sp,sp,320
    505c:	00008067          	ret
    5060:	00040513          	mv	a0,s0
    5064:	ffffe097          	auipc	ra,0xffffe
    5068:	770080e7          	jalr	1904(ra) # 37d4 <fatfs_entry_sfn_only>
    506c:	ee050ee3          	beqz	a0,4f68 <fatfs_list_directory_next+0x9c>
    5070:	00810a13          	addi	s4,sp,8
    5074:	00d00613          	li	a2,13
    5078:	00000593          	li	a1,0
    507c:	000a0513          	mv	a0,s4
    5080:	10010ea3          	sb	zero,285(sp)
    5084:	ffffe097          	auipc	ra,0xffffe
    5088:	8ec080e7          	jalr	-1812(ra) # 2970 <memset>
    508c:	00000793          	li	a5,0
    5090:	00800713          	li	a4,8
    5094:	00f40633          	add	a2,s0,a5
    5098:	00064603          	lbu	a2,0(a2)
    509c:	00fa06b3          	add	a3,s4,a5
    50a0:	00178793          	addi	a5,a5,1
    50a4:	00c68023          	sb	a2,0(a3)
    50a8:	fee796e3          	bne	a5,a4,5094 <fatfs_list_directory_next+0x1c8>
    50ac:	00844783          	lbu	a5,8(s0)
    50b0:	00944703          	lbu	a4,9(s0)
    50b4:	00a44683          	lbu	a3,10(s0)
    50b8:	00f108a3          	sb	a5,17(sp)
    50bc:	00e10923          	sb	a4,18(sp)
    50c0:	fe078793          	addi	a5,a5,-32
    50c4:	fe070713          	addi	a4,a4,-32
    50c8:	00f037b3          	snez	a5,a5
    50cc:	00e03733          	snez	a4,a4
    50d0:	00d109a3          	sb	a3,19(sp)
    50d4:	00e7e7b3          	or	a5,a5,a4
    50d8:	00079863          	bnez	a5,50e8 <fatfs_list_directory_next+0x21c>
    50dc:	fe068693          	addi	a3,a3,-32
    50e0:	02000793          	li	a5,32
    50e4:	00068a63          	beqz	a3,50f8 <fatfs_list_directory_next+0x22c>
    50e8:	00814703          	lbu	a4,8(sp)
    50ec:	02e00793          	li	a5,46
    50f0:	00f71463          	bne	a4,a5,50f8 <fatfs_list_directory_next+0x22c>
    50f4:	02000793          	li	a5,32
    50f8:	000a0593          	mv	a1,s4
    50fc:	00098513          	mv	a0,s3
    5100:	00f10823          	sb	a5,16(sp)
    5104:	fffff097          	auipc	ra,0xfffff
    5108:	054080e7          	jalr	84(ra) # 4158 <fatfs_get_sfn_display_name>
    510c:	eb9ff06f          	j	4fc4 <fatfs_list_directory_next+0xf8>

00005110 <fl_readdir>:
    5110:	000077b7          	lui	a5,0x7
    5114:	b087a783          	lw	a5,-1272(a5) # 6b08 <_filelib_init>
    5118:	fd010113          	addi	sp,sp,-48
    511c:	03212023          	sw	s2,32(sp)
    5120:	01312e23          	sw	s3,28(sp)
    5124:	02112623          	sw	ra,44(sp)
    5128:	02812423          	sw	s0,40(sp)
    512c:	02912223          	sw	s1,36(sp)
    5130:	00050913          	mv	s2,a0
    5134:	00058993          	mv	s3,a1
    5138:	00079663          	bnez	a5,5144 <fl_readdir+0x34>
    513c:	ffffe097          	auipc	ra,0xffffe
    5140:	390080e7          	jalr	912(ra) # 34cc <fl_init>
    5144:	000084b7          	lui	s1,0x8
    5148:	72848413          	addi	s0,s1,1832 # 8728 <_fs>
    514c:	03c42783          	lw	a5,60(s0)
    5150:	00078463          	beqz	a5,5158 <fl_readdir+0x48>
    5154:	000780e7          	jalr	a5
    5158:	00098613          	mv	a2,s3
    515c:	00090593          	mv	a1,s2
    5160:	72848513          	addi	a0,s1,1832
    5164:	00000097          	auipc	ra,0x0
    5168:	d68080e7          	jalr	-664(ra) # 4ecc <fatfs_list_directory_next>
    516c:	04042783          	lw	a5,64(s0)
    5170:	00078863          	beqz	a5,5180 <fl_readdir+0x70>
    5174:	00a12623          	sw	a0,12(sp)
    5178:	000780e7          	jalr	a5
    517c:	00c12503          	lw	a0,12(sp)
    5180:	02c12083          	lw	ra,44(sp)
    5184:	02812403          	lw	s0,40(sp)
    5188:	00154513          	xori	a0,a0,1
    518c:	02412483          	lw	s1,36(sp)
    5190:	02012903          	lw	s2,32(sp)
    5194:	01c12983          	lw	s3,28(sp)
    5198:	40a00533          	neg	a0,a0
    519c:	03010113          	addi	sp,sp,48
    51a0:	00008067          	ret

000051a4 <_read_sectors>:
    51a4:	fd010113          	addi	sp,sp,-48
    51a8:	01512a23          	sw	s5,20(sp)
    51ac:	00008ab7          	lui	s5,0x8
    51b0:	01312e23          	sw	s3,28(sp)
    51b4:	728ac983          	lbu	s3,1832(s5) # 8728 <_fs>
    51b8:	01612823          	sw	s6,16(sp)
    51bc:	00058b13          	mv	s6,a1
    51c0:	02912223          	sw	s1,36(sp)
    51c4:	00098593          	mv	a1,s3
    51c8:	00050493          	mv	s1,a0
    51cc:	000b0513          	mv	a0,s6
    51d0:	02112623          	sw	ra,44(sp)
    51d4:	02812423          	sw	s0,40(sp)
    51d8:	01412c23          	sw	s4,24(sp)
    51dc:	00068413          	mv	s0,a3
    51e0:	01712623          	sw	s7,12(sp)
    51e4:	01812423          	sw	s8,8(sp)
    51e8:	03212023          	sw	s2,32(sp)
    51ec:	00060c13          	mv	s8,a2
    51f0:	ffffd097          	auipc	ra,0xffffd
    51f4:	6d4080e7          	jalr	1748(ra) # 28c4 <__udivsi3>
    51f8:	00050a13          	mv	s4,a0
    51fc:	00098593          	mv	a1,s3
    5200:	000b0513          	mv	a0,s6
    5204:	ffffd097          	auipc	ra,0xffffd
    5208:	708080e7          	jalr	1800(ra) # 290c <__umodsi3>
    520c:	00a407b3          	add	a5,s0,a0
    5210:	00050b93          	mv	s7,a0
    5214:	00f9fe63          	bgeu	s3,a5,5230 <_read_sectors+0x8c>
    5218:	000a0593          	mv	a1,s4
    521c:	00098513          	mv	a0,s3
    5220:	ffffe097          	auipc	ra,0xffffe
    5224:	e18080e7          	jalr	-488(ra) # 3038 <__mulsi3>
    5228:	416987b3          	sub	a5,s3,s6
    522c:	00f50433          	add	s0,a0,a5
    5230:	2284a903          	lw	s2,552(s1)
    5234:	07491863          	bne	s2,s4,52a4 <_read_sectors+0x100>
    5238:	22c4a583          	lw	a1,556(s1)
    523c:	fff00793          	li	a5,-1
    5240:	02f58663          	beq	a1,a5,526c <_read_sectors+0xc8>
    5244:	728a8513          	addi	a0,s5,1832
    5248:	ffffe097          	auipc	ra,0xffffe
    524c:	154080e7          	jalr	340(ra) # 339c <fatfs_lba_of_cluster>
    5250:	017505b3          	add	a1,a0,s7
    5254:	00040693          	mv	a3,s0
    5258:	000c0613          	mv	a2,s8
    525c:	728a8513          	addi	a0,s5,1832
    5260:	ffffe097          	auipc	ra,0xffffe
    5264:	188080e7          	jalr	392(ra) # 33e8 <fatfs_sector_read>
    5268:	00051463          	bnez	a0,5270 <_read_sectors+0xcc>
    526c:	00000413          	li	s0,0
    5270:	02c12083          	lw	ra,44(sp)
    5274:	00040513          	mv	a0,s0
    5278:	02812403          	lw	s0,40(sp)
    527c:	02412483          	lw	s1,36(sp)
    5280:	02012903          	lw	s2,32(sp)
    5284:	01c12983          	lw	s3,28(sp)
    5288:	01812a03          	lw	s4,24(sp)
    528c:	01412a83          	lw	s5,20(sp)
    5290:	01012b03          	lw	s6,16(sp)
    5294:	00c12b83          	lw	s7,12(sp)
    5298:	00812c03          	lw	s8,8(sp)
    529c:	03010113          	addi	sp,sp,48
    52a0:	00008067          	ret
    52a4:	033b6463          	bltu	s6,s3,52cc <_read_sectors+0x128>
    52a8:	00190793          	addi	a5,s2,1
    52ac:	03479063          	bne	a5,s4,52cc <_read_sectors+0x128>
    52b0:	22c4a583          	lw	a1,556(s1)
    52b4:	03496263          	bltu	s2,s4,52d8 <_read_sectors+0x134>
    52b8:	fff00793          	li	a5,-1
    52bc:	faf588e3          	beq	a1,a5,526c <_read_sectors+0xc8>
    52c0:	22b4a623          	sw	a1,556(s1)
    52c4:	2344a423          	sw	s4,552(s1)
    52c8:	f7dff06f          	j	5244 <_read_sectors+0xa0>
    52cc:	0044a583          	lw	a1,4(s1)
    52d0:	00000913          	li	s2,0
    52d4:	fe1ff06f          	j	52b4 <_read_sectors+0x110>
    52d8:	728a8513          	addi	a0,s5,1832
    52dc:	fffff097          	auipc	ra,0xfffff
    52e0:	230080e7          	jalr	560(ra) # 450c <fatfs_find_next_cluster>
    52e4:	00050593          	mv	a1,a0
    52e8:	00190913          	addi	s2,s2,1
    52ec:	fc9ff06f          	j	52b4 <_read_sectors+0x110>

000052f0 <fatfs_set_fs_info_next_free_cluster>:
    52f0:	03052783          	lw	a5,48(a0)
    52f4:	0a078463          	beqz	a5,539c <fatfs_set_fs_info_next_free_cluster+0xac>
    52f8:	fe010113          	addi	sp,sp,-32
    52fc:	01c52783          	lw	a5,28(a0)
    5300:	00912a23          	sw	s1,20(sp)
    5304:	00058493          	mv	s1,a1
    5308:	01855583          	lhu	a1,24(a0)
    530c:	00812c23          	sw	s0,24(sp)
    5310:	00112e23          	sw	ra,28(sp)
    5314:	00f585b3          	add	a1,a1,a5
    5318:	00050413          	mv	s0,a0
    531c:	ffffe097          	auipc	ra,0xffffe
    5320:	ed4080e7          	jalr	-300(ra) # 31f0 <fatfs_fat_read_sector>
    5324:	00050593          	mv	a1,a0
    5328:	06050063          	beqz	a0,5388 <fatfs_set_fs_info_next_free_cluster+0x98>
    532c:	20852783          	lw	a5,520(a0)
    5330:	0084d713          	srli	a4,s1,0x8
    5334:	00100613          	li	a2,1
    5338:	1e978623          	sb	s1,492(a5)
    533c:	20852783          	lw	a5,520(a0)
    5340:	1ee786a3          	sb	a4,493(a5)
    5344:	20852783          	lw	a5,520(a0)
    5348:	0104d713          	srli	a4,s1,0x10
    534c:	1ee78723          	sb	a4,494(a5)
    5350:	20852783          	lw	a5,520(a0)
    5354:	0184d713          	srli	a4,s1,0x18
    5358:	1ee787a3          	sb	a4,495(a5)
    535c:	03842783          	lw	a5,56(s0)
    5360:	20c52223          	sw	a2,516(a0)
    5364:	02942223          	sw	s1,36(s0)
    5368:	00078a63          	beqz	a5,537c <fatfs_set_fs_info_next_free_cluster+0x8c>
    536c:	20052503          	lw	a0,512(a0)
    5370:	00b12623          	sw	a1,12(sp)
    5374:	000780e7          	jalr	a5
    5378:	00c12583          	lw	a1,12(sp)
    537c:	fff00793          	li	a5,-1
    5380:	20f5a023          	sw	a5,512(a1)
    5384:	2005a223          	sw	zero,516(a1)
    5388:	01c12083          	lw	ra,28(sp)
    538c:	01812403          	lw	s0,24(sp)
    5390:	01412483          	lw	s1,20(sp)
    5394:	02010113          	addi	sp,sp,32
    5398:	00008067          	ret
    539c:	00008067          	ret

000053a0 <fatfs_find_blank_cluster>:
    53a0:	fd010113          	addi	sp,sp,-48
    53a4:	01312e23          	sw	s3,28(sp)
    53a8:	100009b7          	lui	s3,0x10000
    53ac:	02912223          	sw	s1,36(sp)
    53b0:	03212023          	sw	s2,32(sp)
    53b4:	02112623          	sw	ra,44(sp)
    53b8:	02812423          	sw	s0,40(sp)
    53bc:	00050913          	mv	s2,a0
    53c0:	00058493          	mv	s1,a1
    53c4:	fff98993          	addi	s3,s3,-1 # fffffff <__stacktop+0xffeffff>
    53c8:	03092783          	lw	a5,48(s2)
    53cc:	0074d413          	srli	s0,s1,0x7
    53d0:	00079463          	bnez	a5,53d8 <fatfs_find_blank_cluster+0x38>
    53d4:	0084d413          	srli	s0,s1,0x8
    53d8:	02092783          	lw	a5,32(s2)
    53dc:	0cf47863          	bgeu	s0,a5,54ac <fatfs_find_blank_cluster+0x10c>
    53e0:	01492583          	lw	a1,20(s2)
    53e4:	00090513          	mv	a0,s2
    53e8:	00c12623          	sw	a2,12(sp)
    53ec:	00b405b3          	add	a1,s0,a1
    53f0:	ffffe097          	auipc	ra,0xffffe
    53f4:	e00080e7          	jalr	-512(ra) # 31f0 <fatfs_fat_read_sector>
    53f8:	0a050a63          	beqz	a0,54ac <fatfs_find_blank_cluster+0x10c>
    53fc:	03092783          	lw	a5,48(s2)
    5400:	20852703          	lw	a4,520(a0)
    5404:	00c12603          	lw	a2,12(sp)
    5408:	04079a63          	bnez	a5,545c <fatfs_find_blank_cluster+0xbc>
    540c:	00841413          	slli	s0,s0,0x8
    5410:	40848433          	sub	s0,s1,s0
    5414:	00141413          	slli	s0,s0,0x1
    5418:	01041413          	slli	s0,s0,0x10
    541c:	01045413          	srli	s0,s0,0x10
    5420:	00870733          	add	a4,a4,s0
    5424:	00174783          	lbu	a5,1(a4)
    5428:	00074703          	lbu	a4,0(a4)
    542c:	00879793          	slli	a5,a5,0x8
    5430:	00e787b3          	add	a5,a5,a4
    5434:	06079863          	bnez	a5,54a4 <fatfs_find_blank_cluster+0x104>
    5438:	00962023          	sw	s1,0(a2)
    543c:	00100513          	li	a0,1
    5440:	02c12083          	lw	ra,44(sp)
    5444:	02812403          	lw	s0,40(sp)
    5448:	02412483          	lw	s1,36(sp)
    544c:	02012903          	lw	s2,32(sp)
    5450:	01c12983          	lw	s3,28(sp)
    5454:	03010113          	addi	sp,sp,48
    5458:	00008067          	ret
    545c:	00741413          	slli	s0,s0,0x7
    5460:	40848433          	sub	s0,s1,s0
    5464:	00241413          	slli	s0,s0,0x2
    5468:	01041413          	slli	s0,s0,0x10
    546c:	01045413          	srli	s0,s0,0x10
    5470:	00870733          	add	a4,a4,s0
    5474:	00374783          	lbu	a5,3(a4)
    5478:	00274683          	lbu	a3,2(a4)
    547c:	01879793          	slli	a5,a5,0x18
    5480:	01069693          	slli	a3,a3,0x10
    5484:	00d787b3          	add	a5,a5,a3
    5488:	00074683          	lbu	a3,0(a4)
    548c:	00174703          	lbu	a4,1(a4)
    5490:	00d787b3          	add	a5,a5,a3
    5494:	00871713          	slli	a4,a4,0x8
    5498:	00e787b3          	add	a5,a5,a4
    549c:	0137f7b3          	and	a5,a5,s3
    54a0:	f95ff06f          	j	5434 <fatfs_find_blank_cluster+0x94>
    54a4:	00148493          	addi	s1,s1,1
    54a8:	f21ff06f          	j	53c8 <fatfs_find_blank_cluster+0x28>
    54ac:	00000513          	li	a0,0
    54b0:	f91ff06f          	j	5440 <fatfs_find_blank_cluster+0xa0>

000054b4 <fatfs_fat_set_cluster>:
    54b4:	03052783          	lw	a5,48(a0)
    54b8:	fe010113          	addi	sp,sp,-32
    54bc:	00812c23          	sw	s0,24(sp)
    54c0:	00912a23          	sw	s1,20(sp)
    54c4:	01212823          	sw	s2,16(sp)
    54c8:	00112e23          	sw	ra,28(sp)
    54cc:	00050913          	mv	s2,a0
    54d0:	00058413          	mv	s0,a1
    54d4:	0085d493          	srli	s1,a1,0x8
    54d8:	00078463          	beqz	a5,54e0 <fatfs_fat_set_cluster+0x2c>
    54dc:	0075d493          	srli	s1,a1,0x7
    54e0:	01492583          	lw	a1,20(s2)
    54e4:	00090513          	mv	a0,s2
    54e8:	00c12623          	sw	a2,12(sp)
    54ec:	00b485b3          	add	a1,s1,a1
    54f0:	ffffe097          	auipc	ra,0xffffe
    54f4:	d00080e7          	jalr	-768(ra) # 31f0 <fatfs_fat_read_sector>
    54f8:	00050793          	mv	a5,a0
    54fc:	00000513          	li	a0,0
    5500:	04078663          	beqz	a5,554c <fatfs_fat_set_cluster+0x98>
    5504:	03092683          	lw	a3,48(s2)
    5508:	2087a703          	lw	a4,520(a5)
    550c:	00c12603          	lw	a2,12(sp)
    5510:	04069a63          	bnez	a3,5564 <fatfs_fat_set_cluster+0xb0>
    5514:	00849493          	slli	s1,s1,0x8
    5518:	40940433          	sub	s0,s0,s1
    551c:	00141413          	slli	s0,s0,0x1
    5520:	01041413          	slli	s0,s0,0x10
    5524:	01045413          	srli	s0,s0,0x10
    5528:	00870733          	add	a4,a4,s0
    552c:	00c70023          	sb	a2,0(a4)
    5530:	2087a703          	lw	a4,520(a5)
    5534:	00865613          	srli	a2,a2,0x8
    5538:	00870733          	add	a4,a4,s0
    553c:	00c700a3          	sb	a2,1(a4)
    5540:	00100713          	li	a4,1
    5544:	20e7a223          	sw	a4,516(a5)
    5548:	00100513          	li	a0,1
    554c:	01c12083          	lw	ra,28(sp)
    5550:	01812403          	lw	s0,24(sp)
    5554:	01412483          	lw	s1,20(sp)
    5558:	01012903          	lw	s2,16(sp)
    555c:	02010113          	addi	sp,sp,32
    5560:	00008067          	ret
    5564:	00749493          	slli	s1,s1,0x7
    5568:	40940433          	sub	s0,s0,s1
    556c:	00241413          	slli	s0,s0,0x2
    5570:	01041413          	slli	s0,s0,0x10
    5574:	01045413          	srli	s0,s0,0x10
    5578:	00870733          	add	a4,a4,s0
    557c:	00c70023          	sb	a2,0(a4)
    5580:	2087a703          	lw	a4,520(a5)
    5584:	00865693          	srli	a3,a2,0x8
    5588:	00870733          	add	a4,a4,s0
    558c:	00d700a3          	sb	a3,1(a4)
    5590:	2087a703          	lw	a4,520(a5)
    5594:	01065693          	srli	a3,a2,0x10
    5598:	01865613          	srli	a2,a2,0x18
    559c:	00870733          	add	a4,a4,s0
    55a0:	00d70123          	sb	a3,2(a4)
    55a4:	2087a703          	lw	a4,520(a5)
    55a8:	00870733          	add	a4,a4,s0
    55ac:	00c701a3          	sb	a2,3(a4)
    55b0:	f91ff06f          	j	5540 <fatfs_fat_set_cluster+0x8c>

000055b4 <fatfs_free_cluster_chain>:
    55b4:	fe010113          	addi	sp,sp,-32
    55b8:	00812c23          	sw	s0,24(sp)
    55bc:	00912a23          	sw	s1,20(sp)
    55c0:	00112e23          	sw	ra,28(sp)
    55c4:	01212823          	sw	s2,16(sp)
    55c8:	00050493          	mv	s1,a0
    55cc:	ffd00413          	li	s0,-3
    55d0:	fff58793          	addi	a5,a1,-1
    55d4:	02f47063          	bgeu	s0,a5,55f4 <fatfs_free_cluster_chain+0x40>
    55d8:	01c12083          	lw	ra,28(sp)
    55dc:	01812403          	lw	s0,24(sp)
    55e0:	01412483          	lw	s1,20(sp)
    55e4:	01012903          	lw	s2,16(sp)
    55e8:	00100513          	li	a0,1
    55ec:	02010113          	addi	sp,sp,32
    55f0:	00008067          	ret
    55f4:	00048513          	mv	a0,s1
    55f8:	00b12623          	sw	a1,12(sp)
    55fc:	fffff097          	auipc	ra,0xfffff
    5600:	f10080e7          	jalr	-240(ra) # 450c <fatfs_find_next_cluster>
    5604:	00c12583          	lw	a1,12(sp)
    5608:	00050913          	mv	s2,a0
    560c:	00000613          	li	a2,0
    5610:	00048513          	mv	a0,s1
    5614:	00000097          	auipc	ra,0x0
    5618:	ea0080e7          	jalr	-352(ra) # 54b4 <fatfs_fat_set_cluster>
    561c:	00090593          	mv	a1,s2
    5620:	fb1ff06f          	j	55d0 <fatfs_free_cluster_chain+0x1c>

00005624 <fatfs_fat_add_cluster_to_chain>:
    5624:	fd010113          	addi	sp,sp,-48
    5628:	02912223          	sw	s1,36(sp)
    562c:	02112623          	sw	ra,44(sp)
    5630:	02812423          	sw	s0,40(sp)
    5634:	03212023          	sw	s2,32(sp)
    5638:	01312e23          	sw	s3,28(sp)
    563c:	fff00493          	li	s1,-1
    5640:	02959263          	bne	a1,s1,5664 <fatfs_fat_add_cluster_to_chain+0x40>
    5644:	00000513          	li	a0,0
    5648:	02c12083          	lw	ra,44(sp)
    564c:	02812403          	lw	s0,40(sp)
    5650:	02412483          	lw	s1,36(sp)
    5654:	02012903          	lw	s2,32(sp)
    5658:	01c12983          	lw	s3,28(sp)
    565c:	03010113          	addi	sp,sp,48
    5660:	00008067          	ret
    5664:	00050913          	mv	s2,a0
    5668:	00058413          	mv	s0,a1
    566c:	00060993          	mv	s3,a2
    5670:	00040593          	mv	a1,s0
    5674:	00090513          	mv	a0,s2
    5678:	00812623          	sw	s0,12(sp)
    567c:	fffff097          	auipc	ra,0xfffff
    5680:	e90080e7          	jalr	-368(ra) # 450c <fatfs_find_next_cluster>
    5684:	00050413          	mv	s0,a0
    5688:	fa050ee3          	beqz	a0,5644 <fatfs_fat_add_cluster_to_chain+0x20>
    568c:	00c12583          	lw	a1,12(sp)
    5690:	fe9510e3          	bne	a0,s1,5670 <fatfs_fat_add_cluster_to_chain+0x4c>
    5694:	00098613          	mv	a2,s3
    5698:	00090513          	mv	a0,s2
    569c:	00000097          	auipc	ra,0x0
    56a0:	e18080e7          	jalr	-488(ra) # 54b4 <fatfs_fat_set_cluster>
    56a4:	00040613          	mv	a2,s0
    56a8:	00098593          	mv	a1,s3
    56ac:	00090513          	mv	a0,s2
    56b0:	00000097          	auipc	ra,0x0
    56b4:	e04080e7          	jalr	-508(ra) # 54b4 <fatfs_fat_set_cluster>
    56b8:	00100513          	li	a0,1
    56bc:	f8dff06f          	j	5648 <fatfs_fat_add_cluster_to_chain+0x24>

000056c0 <fatfs_add_free_space>:
    56c0:	02452783          	lw	a5,36(a0)
    56c4:	fd010113          	addi	sp,sp,-48
    56c8:	02812423          	sw	s0,40(sp)
    56cc:	01312e23          	sw	s3,28(sp)
    56d0:	01412c23          	sw	s4,24(sp)
    56d4:	0005a983          	lw	s3,0(a1)
    56d8:	01512a23          	sw	s5,20(sp)
    56dc:	00058a13          	mv	s4,a1
    56e0:	02112623          	sw	ra,44(sp)
    56e4:	02912223          	sw	s1,36(sp)
    56e8:	03212023          	sw	s2,32(sp)
    56ec:	fff00593          	li	a1,-1
    56f0:	00050413          	mv	s0,a0
    56f4:	00060a93          	mv	s5,a2
    56f8:	00b78663          	beq	a5,a1,5704 <fatfs_add_free_space+0x44>
    56fc:	00000097          	auipc	ra,0x0
    5700:	bf4080e7          	jalr	-1036(ra) # 52f0 <fatfs_set_fs_info_next_free_cluster>
    5704:	00000493          	li	s1,0
    5708:	03549663          	bne	s1,s5,5734 <fatfs_add_free_space+0x74>
    570c:	00100513          	li	a0,1
    5710:	02c12083          	lw	ra,44(sp)
    5714:	02812403          	lw	s0,40(sp)
    5718:	02412483          	lw	s1,36(sp)
    571c:	02012903          	lw	s2,32(sp)
    5720:	01c12983          	lw	s3,28(sp)
    5724:	01812a03          	lw	s4,24(sp)
    5728:	01412a83          	lw	s5,20(sp)
    572c:	03010113          	addi	sp,sp,48
    5730:	00008067          	ret
    5734:	00842583          	lw	a1,8(s0)
    5738:	00c10613          	addi	a2,sp,12
    573c:	00040513          	mv	a0,s0
    5740:	00000097          	auipc	ra,0x0
    5744:	c60080e7          	jalr	-928(ra) # 53a0 <fatfs_find_blank_cluster>
    5748:	fc0504e3          	beqz	a0,5710 <fatfs_add_free_space+0x50>
    574c:	00c12903          	lw	s2,12(sp)
    5750:	00098593          	mv	a1,s3
    5754:	00040513          	mv	a0,s0
    5758:	00090613          	mv	a2,s2
    575c:	00000097          	auipc	ra,0x0
    5760:	d58080e7          	jalr	-680(ra) # 54b4 <fatfs_fat_set_cluster>
    5764:	fff00613          	li	a2,-1
    5768:	00090593          	mv	a1,s2
    576c:	00040513          	mv	a0,s0
    5770:	00000097          	auipc	ra,0x0
    5774:	d44080e7          	jalr	-700(ra) # 54b4 <fatfs_fat_set_cluster>
    5778:	00049463          	bnez	s1,5780 <fatfs_add_free_space+0xc0>
    577c:	012a2023          	sw	s2,0(s4)
    5780:	00148493          	addi	s1,s1,1
    5784:	00090993          	mv	s3,s2
    5788:	f81ff06f          	j	5708 <fatfs_add_free_space+0x48>

0000578c <_write_sectors>:
    578c:	fb010113          	addi	sp,sp,-80
    5790:	03512a23          	sw	s5,52(sp)
    5794:	00008ab7          	lui	s5,0x8
    5798:	04112623          	sw	ra,76(sp)
    579c:	04812423          	sw	s0,72(sp)
    57a0:	04912223          	sw	s1,68(sp)
    57a4:	03412c23          	sw	s4,56(sp)
    57a8:	03612823          	sw	s6,48(sp)
    57ac:	03712623          	sw	s7,44(sp)
    57b0:	03812423          	sw	s8,40(sp)
    57b4:	03912223          	sw	s9,36(sp)
    57b8:	03a12023          	sw	s10,32(sp)
    57bc:	05212023          	sw	s2,64(sp)
    57c0:	03312e23          	sw	s3,60(sp)
    57c4:	728a8b93          	addi	s7,s5,1832 # 8728 <_fs>
    57c8:	000bc983          	lbu	s3,0(s7)
    57cc:	00058b13          	mv	s6,a1
    57d0:	fff00793          	li	a5,-1
    57d4:	00098593          	mv	a1,s3
    57d8:	00050493          	mv	s1,a0
    57dc:	000b0513          	mv	a0,s6
    57e0:	00068c13          	mv	s8,a3
    57e4:	00f12e23          	sw	a5,28(sp)
    57e8:	00060d13          	mv	s10,a2
    57ec:	ffffd097          	auipc	ra,0xffffd
    57f0:	0d8080e7          	jalr	216(ra) # 28c4 <__udivsi3>
    57f4:	00050a13          	mv	s4,a0
    57f8:	00098593          	mv	a1,s3
    57fc:	000b0513          	mv	a0,s6
    5800:	ffffd097          	auipc	ra,0xffffd
    5804:	10c080e7          	jalr	268(ra) # 290c <__umodsi3>
    5808:	00ac07b3          	add	a5,s8,a0
    580c:	00050c93          	mv	s9,a0
    5810:	000c0413          	mv	s0,s8
    5814:	00f9fe63          	bgeu	s3,a5,5830 <_write_sectors+0xa4>
    5818:	000a0593          	mv	a1,s4
    581c:	00098513          	mv	a0,s3
    5820:	ffffe097          	auipc	ra,0xffffe
    5824:	818080e7          	jalr	-2024(ra) # 3038 <__mulsi3>
    5828:	416987b3          	sub	a5,s3,s6
    582c:	00f50433          	add	s0,a0,a5
    5830:	2284a903          	lw	s2,552(s1)
    5834:	03491a63          	bne	s2,s4,5868 <_write_sectors+0xdc>
    5838:	22c4a583          	lw	a1,556(s1)
    583c:	728a8513          	addi	a0,s5,1832
    5840:	ffffe097          	auipc	ra,0xffffe
    5844:	b5c080e7          	jalr	-1188(ra) # 339c <fatfs_lba_of_cluster>
    5848:	019505b3          	add	a1,a0,s9
    584c:	00040693          	mv	a3,s0
    5850:	000d0613          	mv	a2,s10
    5854:	728a8513          	addi	a0,s5,1832
    5858:	ffffe097          	auipc	ra,0xffffe
    585c:	ba8080e7          	jalr	-1112(ra) # 3400 <fatfs_sector_write>
    5860:	04050a63          	beqz	a0,58b4 <_write_sectors+0x128>
    5864:	0540006f          	j	58b8 <_write_sectors+0x12c>
    5868:	093b6663          	bltu	s6,s3,58f4 <_write_sectors+0x168>
    586c:	00190793          	addi	a5,s2,1
    5870:	09479263          	bne	a5,s4,58f4 <_write_sectors+0x168>
    5874:	22c4a583          	lw	a1,556(s1)
    5878:	fff00b13          	li	s6,-1
    587c:	09496263          	bltu	s2,s4,5900 <_write_sectors+0x174>
    5880:	fff00793          	li	a5,-1
    5884:	0af59463          	bne	a1,a5,592c <_write_sectors+0x1a0>
    5888:	000bc583          	lbu	a1,0(s7)
    588c:	fff58513          	addi	a0,a1,-1
    5890:	01850533          	add	a0,a0,s8
    5894:	ffffd097          	auipc	ra,0xffffd
    5898:	030080e7          	jalr	48(ra) # 28c4 <__udivsi3>
    589c:	00050613          	mv	a2,a0
    58a0:	01c10593          	addi	a1,sp,28
    58a4:	000b8513          	mv	a0,s7
    58a8:	00000097          	auipc	ra,0x0
    58ac:	e18080e7          	jalr	-488(ra) # 56c0 <fatfs_add_free_space>
    58b0:	06051c63          	bnez	a0,5928 <_write_sectors+0x19c>
    58b4:	00000413          	li	s0,0
    58b8:	04c12083          	lw	ra,76(sp)
    58bc:	00040513          	mv	a0,s0
    58c0:	04812403          	lw	s0,72(sp)
    58c4:	04412483          	lw	s1,68(sp)
    58c8:	04012903          	lw	s2,64(sp)
    58cc:	03c12983          	lw	s3,60(sp)
    58d0:	03812a03          	lw	s4,56(sp)
    58d4:	03412a83          	lw	s5,52(sp)
    58d8:	03012b03          	lw	s6,48(sp)
    58dc:	02c12b83          	lw	s7,44(sp)
    58e0:	02812c03          	lw	s8,40(sp)
    58e4:	02412c83          	lw	s9,36(sp)
    58e8:	02012d03          	lw	s10,32(sp)
    58ec:	05010113          	addi	sp,sp,80
    58f0:	00008067          	ret
    58f4:	0044a583          	lw	a1,4(s1)
    58f8:	00000913          	li	s2,0
    58fc:	f7dff06f          	j	5878 <_write_sectors+0xec>
    5900:	728a8513          	addi	a0,s5,1832
    5904:	00b12623          	sw	a1,12(sp)
    5908:	fffff097          	auipc	ra,0xfffff
    590c:	c04080e7          	jalr	-1020(ra) # 450c <fatfs_find_next_cluster>
    5910:	00c12583          	lw	a1,12(sp)
    5914:	00b12e23          	sw	a1,28(sp)
    5918:	f76508e3          	beq	a0,s6,5888 <_write_sectors+0xfc>
    591c:	00190913          	addi	s2,s2,1
    5920:	00050593          	mv	a1,a0
    5924:	f59ff06f          	j	587c <_write_sectors+0xf0>
    5928:	01c12583          	lw	a1,28(sp)
    592c:	22b4a623          	sw	a1,556(s1)
    5930:	2344a423          	sw	s4,552(s1)
    5934:	f09ff06f          	j	583c <_write_sectors+0xb0>

00005938 <fl_fflush>:
    5938:	000077b7          	lui	a5,0x7
    593c:	b087a783          	lw	a5,-1272(a5) # 6b08 <_filelib_init>
    5940:	ff010113          	addi	sp,sp,-16
    5944:	00812423          	sw	s0,8(sp)
    5948:	00112623          	sw	ra,12(sp)
    594c:	00912223          	sw	s1,4(sp)
    5950:	00050413          	mv	s0,a0
    5954:	00079663          	bnez	a5,5960 <fl_fflush+0x28>
    5958:	ffffe097          	auipc	ra,0xffffe
    595c:	b74080e7          	jalr	-1164(ra) # 34cc <fl_init>
    5960:	04040663          	beqz	s0,59ac <fl_fflush+0x74>
    5964:	000084b7          	lui	s1,0x8
    5968:	72848493          	addi	s1,s1,1832 # 8728 <_fs>
    596c:	03c4a783          	lw	a5,60(s1)
    5970:	00078463          	beqz	a5,5978 <fl_fflush+0x40>
    5974:	000780e7          	jalr	a5
    5978:	43442783          	lw	a5,1076(s0)
    597c:	02078263          	beqz	a5,59a0 <fl_fflush+0x68>
    5980:	43042583          	lw	a1,1072(s0)
    5984:	00100693          	li	a3,1
    5988:	23040613          	addi	a2,s0,560
    598c:	00040513          	mv	a0,s0
    5990:	00000097          	auipc	ra,0x0
    5994:	dfc080e7          	jalr	-516(ra) # 578c <_write_sectors>
    5998:	00050463          	beqz	a0,59a0 <fl_fflush+0x68>
    599c:	42042a23          	sw	zero,1076(s0)
    59a0:	0404a783          	lw	a5,64(s1)
    59a4:	00078463          	beqz	a5,59ac <fl_fflush+0x74>
    59a8:	000780e7          	jalr	a5
    59ac:	00c12083          	lw	ra,12(sp)
    59b0:	00812403          	lw	s0,8(sp)
    59b4:	00412483          	lw	s1,4(sp)
    59b8:	00000513          	li	a0,0
    59bc:	01010113          	addi	sp,sp,16
    59c0:	00008067          	ret

000059c4 <fl_fclose>:
    59c4:	000077b7          	lui	a5,0x7
    59c8:	b087a783          	lw	a5,-1272(a5) # 6b08 <_filelib_init>
    59cc:	ff010113          	addi	sp,sp,-16
    59d0:	00812423          	sw	s0,8(sp)
    59d4:	00112623          	sw	ra,12(sp)
    59d8:	00912223          	sw	s1,4(sp)
    59dc:	01212023          	sw	s2,0(sp)
    59e0:	00050413          	mv	s0,a0
    59e4:	00079663          	bnez	a5,59f0 <fl_fclose+0x2c>
    59e8:	ffffe097          	auipc	ra,0xffffe
    59ec:	ae4080e7          	jalr	-1308(ra) # 34cc <fl_init>
    59f0:	08040c63          	beqz	s0,5a88 <fl_fclose+0xc4>
    59f4:	000084b7          	lui	s1,0x8
    59f8:	72848913          	addi	s2,s1,1832 # 8728 <_fs>
    59fc:	03c92783          	lw	a5,60(s2)
    5a00:	00078463          	beqz	a5,5a08 <fl_fclose+0x44>
    5a04:	000780e7          	jalr	a5
    5a08:	00040513          	mv	a0,s0
    5a0c:	00000097          	auipc	ra,0x0
    5a10:	f2c080e7          	jalr	-212(ra) # 5938 <fl_fflush>
    5a14:	01042783          	lw	a5,16(s0)
    5a18:	00078e63          	beqz	a5,5a34 <fl_fclose+0x70>
    5a1c:	00c42683          	lw	a3,12(s0)
    5a20:	00042583          	lw	a1,0(s0)
    5a24:	21c40613          	addi	a2,s0,540
    5a28:	72848513          	addi	a0,s1,1832
    5a2c:	fffff097          	auipc	ra,0xfffff
    5a30:	338080e7          	jalr	824(ra) # 4d64 <fatfs_update_file_length>
    5a34:	fff00793          	li	a5,-1
    5a38:	42f42823          	sw	a5,1072(s0)
    5a3c:	00040513          	mv	a0,s0
    5a40:	00042423          	sw	zero,8(s0)
    5a44:	00042623          	sw	zero,12(s0)
    5a48:	00042223          	sw	zero,4(s0)
    5a4c:	42042a23          	sw	zero,1076(s0)
    5a50:	00042823          	sw	zero,16(s0)
    5a54:	ffffe097          	auipc	ra,0xffffe
    5a58:	900080e7          	jalr	-1792(ra) # 3354 <_free_file>
    5a5c:	72848513          	addi	a0,s1,1832
    5a60:	fffff097          	auipc	ra,0xfffff
    5a64:	a54080e7          	jalr	-1452(ra) # 44b4 <fatfs_fat_purge>
    5a68:	04092783          	lw	a5,64(s2)
    5a6c:	00078e63          	beqz	a5,5a88 <fl_fclose+0xc4>
    5a70:	00812403          	lw	s0,8(sp)
    5a74:	00c12083          	lw	ra,12(sp)
    5a78:	00412483          	lw	s1,4(sp)
    5a7c:	00012903          	lw	s2,0(sp)
    5a80:	01010113          	addi	sp,sp,16
    5a84:	00078067          	jr	a5
    5a88:	00c12083          	lw	ra,12(sp)
    5a8c:	00812403          	lw	s0,8(sp)
    5a90:	00412483          	lw	s1,4(sp)
    5a94:	00012903          	lw	s2,0(sp)
    5a98:	01010113          	addi	sp,sp,16
    5a9c:	00008067          	ret

00005aa0 <fl_fread>:
    5aa0:	000077b7          	lui	a5,0x7
    5aa4:	b087a783          	lw	a5,-1272(a5) # 6b08 <_filelib_init>
    5aa8:	fc010113          	addi	sp,sp,-64
    5aac:	02812c23          	sw	s0,56(sp)
    5ab0:	03512223          	sw	s5,36(sp)
    5ab4:	02112e23          	sw	ra,60(sp)
    5ab8:	02912a23          	sw	s1,52(sp)
    5abc:	03212823          	sw	s2,48(sp)
    5ac0:	03312623          	sw	s3,44(sp)
    5ac4:	03412423          	sw	s4,40(sp)
    5ac8:	03612023          	sw	s6,32(sp)
    5acc:	01712e23          	sw	s7,28(sp)
    5ad0:	01812c23          	sw	s8,24(sp)
    5ad4:	01912a23          	sw	s9,20(sp)
    5ad8:	00050a93          	mv	s5,a0
    5adc:	00068413          	mv	s0,a3
    5ae0:	00058513          	mv	a0,a1
    5ae4:	00079e63          	bnez	a5,5b00 <fl_fread+0x60>
    5ae8:	00c12623          	sw	a2,12(sp)
    5aec:	00b12423          	sw	a1,8(sp)
    5af0:	ffffe097          	auipc	ra,0xffffe
    5af4:	9dc080e7          	jalr	-1572(ra) # 34cc <fl_init>
    5af8:	00c12603          	lw	a2,12(sp)
    5afc:	00812503          	lw	a0,8(sp)
    5b00:	14040e63          	beqz	s0,5c5c <fl_fread+0x1bc>
    5b04:	140a8c63          	beqz	s5,5c5c <fl_fread+0x1bc>
    5b08:	43844783          	lbu	a5,1080(s0)
    5b0c:	fff00493          	li	s1,-1
    5b10:	0017f793          	andi	a5,a5,1
    5b14:	04078863          	beqz	a5,5b64 <fl_fread+0xc4>
    5b18:	00060593          	mv	a1,a2
    5b1c:	ffffd097          	auipc	ra,0xffffd
    5b20:	51c080e7          	jalr	1308(ra) # 3038 <__mulsi3>
    5b24:	00050493          	mv	s1,a0
    5b28:	02050e63          	beqz	a0,5b64 <fl_fread+0xc4>
    5b2c:	00842583          	lw	a1,8(s0)
    5b30:	00c42783          	lw	a5,12(s0)
    5b34:	12f5f463          	bgeu	a1,a5,5c5c <fl_fread+0x1bc>
    5b38:	00b50733          	add	a4,a0,a1
    5b3c:	00e7f463          	bgeu	a5,a4,5b44 <fl_fread+0xa4>
    5b40:	40b784b3          	sub	s1,a5,a1
    5b44:	0095da13          	srli	s4,a1,0x9
    5b48:	1ff5f913          	andi	s2,a1,511
    5b4c:	00000993          	li	s3,0
    5b50:	23040b13          	addi	s6,s0,560
    5b54:	20000b93          	li	s7,512
    5b58:	1ff00c13          	li	s8,511
    5b5c:	0499c063          	blt	s3,s1,5b9c <fl_fread+0xfc>
    5b60:	00098493          	mv	s1,s3
    5b64:	03c12083          	lw	ra,60(sp)
    5b68:	03812403          	lw	s0,56(sp)
    5b6c:	03012903          	lw	s2,48(sp)
    5b70:	02c12983          	lw	s3,44(sp)
    5b74:	02812a03          	lw	s4,40(sp)
    5b78:	02412a83          	lw	s5,36(sp)
    5b7c:	02012b03          	lw	s6,32(sp)
    5b80:	01c12b83          	lw	s7,28(sp)
    5b84:	01812c03          	lw	s8,24(sp)
    5b88:	01412c83          	lw	s9,20(sp)
    5b8c:	00048513          	mv	a0,s1
    5b90:	03412483          	lw	s1,52(sp)
    5b94:	04010113          	addi	sp,sp,64
    5b98:	00008067          	ret
    5b9c:	04091663          	bnez	s2,5be8 <fl_fread+0x148>
    5ba0:	413486b3          	sub	a3,s1,s3
    5ba4:	04dc5263          	bge	s8,a3,5be8 <fl_fread+0x148>
    5ba8:	4096d693          	srai	a3,a3,0x9
    5bac:	013a8633          	add	a2,s5,s3
    5bb0:	000a0593          	mv	a1,s4
    5bb4:	00040513          	mv	a0,s0
    5bb8:	fffff097          	auipc	ra,0xfffff
    5bbc:	5ec080e7          	jalr	1516(ra) # 51a4 <_read_sectors>
    5bc0:	fa0500e3          	beqz	a0,5b60 <fl_fread+0xc0>
    5bc4:	00951c93          	slli	s9,a0,0x9
    5bc8:	000c8613          	mv	a2,s9
    5bcc:	00aa0a33          	add	s4,s4,a0
    5bd0:	00842783          	lw	a5,8(s0)
    5bd4:	00c989b3          	add	s3,s3,a2
    5bd8:	00000913          	li	s2,0
    5bdc:	019787b3          	add	a5,a5,s9
    5be0:	00f42423          	sw	a5,8(s0)
    5be4:	f79ff06f          	j	5b5c <fl_fread+0xbc>
    5be8:	43042783          	lw	a5,1072(s0)
    5bec:	03478e63          	beq	a5,s4,5c28 <fl_fread+0x188>
    5bf0:	43442783          	lw	a5,1076(s0)
    5bf4:	00078863          	beqz	a5,5c04 <fl_fread+0x164>
    5bf8:	00040513          	mv	a0,s0
    5bfc:	00000097          	auipc	ra,0x0
    5c00:	d3c080e7          	jalr	-708(ra) # 5938 <fl_fflush>
    5c04:	00100693          	li	a3,1
    5c08:	000b0613          	mv	a2,s6
    5c0c:	000a0593          	mv	a1,s4
    5c10:	00040513          	mv	a0,s0
    5c14:	fffff097          	auipc	ra,0xfffff
    5c18:	590080e7          	jalr	1424(ra) # 51a4 <_read_sectors>
    5c1c:	f40502e3          	beqz	a0,5b60 <fl_fread+0xc0>
    5c20:	43442823          	sw	s4,1072(s0)
    5c24:	42042a23          	sw	zero,1076(s0)
    5c28:	412b87b3          	sub	a5,s7,s2
    5c2c:	41348633          	sub	a2,s1,s3
    5c30:	00c7d463          	bge	a5,a2,5c38 <fl_fread+0x198>
    5c34:	00078613          	mv	a2,a5
    5c38:	012b05b3          	add	a1,s6,s2
    5c3c:	013a8533          	add	a0,s5,s3
    5c40:	00060c93          	mv	s9,a2
    5c44:	00c12423          	sw	a2,8(sp)
    5c48:	ffffd097          	auipc	ra,0xffffd
    5c4c:	d44080e7          	jalr	-700(ra) # 298c <memcpy>
    5c50:	00812603          	lw	a2,8(sp)
    5c54:	001a0a13          	addi	s4,s4,1
    5c58:	f79ff06f          	j	5bd0 <fl_fread+0x130>
    5c5c:	fff00493          	li	s1,-1
    5c60:	f05ff06f          	j	5b64 <fl_fread+0xc4>

00005c64 <fatfs_allocate_free_space>:
    5c64:	fd010113          	addi	sp,sp,-48
    5c68:	02112623          	sw	ra,44(sp)
    5c6c:	02812423          	sw	s0,40(sp)
    5c70:	02912223          	sw	s1,36(sp)
    5c74:	03212023          	sw	s2,32(sp)
    5c78:	01312e23          	sw	s3,28(sp)
    5c7c:	01412c23          	sw	s4,24(sp)
    5c80:	01512a23          	sw	s5,20(sp)
    5c84:	02069863          	bnez	a3,5cb4 <fatfs_allocate_free_space+0x50>
    5c88:	00000413          	li	s0,0
    5c8c:	02c12083          	lw	ra,44(sp)
    5c90:	00040513          	mv	a0,s0
    5c94:	02812403          	lw	s0,40(sp)
    5c98:	02412483          	lw	s1,36(sp)
    5c9c:	02012903          	lw	s2,32(sp)
    5ca0:	01c12983          	lw	s3,28(sp)
    5ca4:	01812a03          	lw	s4,24(sp)
    5ca8:	01412a83          	lw	s5,20(sp)
    5cac:	03010113          	addi	sp,sp,48
    5cb0:	00008067          	ret
    5cb4:	02452783          	lw	a5,36(a0)
    5cb8:	00058a13          	mv	s4,a1
    5cbc:	fff00593          	li	a1,-1
    5cc0:	00050493          	mv	s1,a0
    5cc4:	00068913          	mv	s2,a3
    5cc8:	00060993          	mv	s3,a2
    5ccc:	00b78663          	beq	a5,a1,5cd8 <fatfs_allocate_free_space+0x74>
    5cd0:	fffff097          	auipc	ra,0xfffff
    5cd4:	620080e7          	jalr	1568(ra) # 52f0 <fatfs_set_fs_info_next_free_cluster>
    5cd8:	0004c783          	lbu	a5,0(s1)
    5cdc:	00090513          	mv	a0,s2
    5ce0:	00979a93          	slli	s5,a5,0x9
    5ce4:	000a8593          	mv	a1,s5
    5ce8:	ffffd097          	auipc	ra,0xffffd
    5cec:	bdc080e7          	jalr	-1060(ra) # 28c4 <__udivsi3>
    5cf0:	00050413          	mv	s0,a0
    5cf4:	00050593          	mv	a1,a0
    5cf8:	000a8513          	mv	a0,s5
    5cfc:	ffffd097          	auipc	ra,0xffffd
    5d00:	33c080e7          	jalr	828(ra) # 3038 <__mulsi3>
    5d04:	41250533          	sub	a0,a0,s2
    5d08:	00a03533          	snez	a0,a0
    5d0c:	00a40933          	add	s2,s0,a0
    5d10:	040a0463          	beqz	s4,5d58 <fatfs_allocate_free_space+0xf4>
    5d14:	0084a583          	lw	a1,8(s1)
    5d18:	00c10613          	addi	a2,sp,12
    5d1c:	00048513          	mv	a0,s1
    5d20:	fffff097          	auipc	ra,0xfffff
    5d24:	680080e7          	jalr	1664(ra) # 53a0 <fatfs_find_blank_cluster>
    5d28:	00050413          	mv	s0,a0
    5d2c:	f4050ee3          	beqz	a0,5c88 <fatfs_allocate_free_space+0x24>
    5d30:	00100793          	li	a5,1
    5d34:	02f91663          	bne	s2,a5,5d60 <fatfs_allocate_free_space+0xfc>
    5d38:	00c12903          	lw	s2,12(sp)
    5d3c:	fff00613          	li	a2,-1
    5d40:	00048513          	mv	a0,s1
    5d44:	00090593          	mv	a1,s2
    5d48:	fffff097          	auipc	ra,0xfffff
    5d4c:	76c080e7          	jalr	1900(ra) # 54b4 <fatfs_fat_set_cluster>
    5d50:	0129a023          	sw	s2,0(s3)
    5d54:	f39ff06f          	j	5c8c <fatfs_allocate_free_space+0x28>
    5d58:	0009a783          	lw	a5,0(s3)
    5d5c:	00f12623          	sw	a5,12(sp)
    5d60:	00090613          	mv	a2,s2
    5d64:	00c10593          	addi	a1,sp,12
    5d68:	00048513          	mv	a0,s1
    5d6c:	00000097          	auipc	ra,0x0
    5d70:	954080e7          	jalr	-1708(ra) # 56c0 <fatfs_add_free_space>
    5d74:	00050413          	mv	s0,a0
    5d78:	f15ff06f          	j	5c8c <fatfs_allocate_free_space+0x28>

00005d7c <fatfs_add_file_entry>:
    5d7c:	03852883          	lw	a7,56(a0)
    5d80:	30088e63          	beqz	a7,609c <fatfs_add_file_entry+0x320>
    5d84:	f8010113          	addi	sp,sp,-128
    5d88:	06812c23          	sw	s0,120(sp)
    5d8c:	00050413          	mv	s0,a0
    5d90:	00060513          	mv	a0,a2
    5d94:	06912a23          	sw	s1,116(sp)
    5d98:	07512223          	sw	s5,100(sp)
    5d9c:	00f12c23          	sw	a5,24(sp)
    5da0:	00e12a23          	sw	a4,20(sp)
    5da4:	06112e23          	sw	ra,124(sp)
    5da8:	07212823          	sw	s2,112(sp)
    5dac:	07312623          	sw	s3,108(sp)
    5db0:	07412423          	sw	s4,104(sp)
    5db4:	07612023          	sw	s6,96(sp)
    5db8:	05712e23          	sw	s7,92(sp)
    5dbc:	05812c23          	sw	s8,88(sp)
    5dc0:	05912a23          	sw	s9,84(sp)
    5dc4:	05a12823          	sw	s10,80(sp)
    5dc8:	05b12623          	sw	s11,76(sp)
    5dcc:	01012e23          	sw	a6,28(sp)
    5dd0:	00068a93          	mv	s5,a3
    5dd4:	00c12823          	sw	a2,16(sp)
    5dd8:	00b12423          	sw	a1,8(sp)
    5ddc:	ffffe097          	auipc	ra,0xffffe
    5de0:	a48080e7          	jalr	-1464(ra) # 3824 <fatfs_lfn_entries_required>
    5de4:	00150713          	addi	a4,a0,1
    5de8:	00100793          	li	a5,1
    5dec:	00050493          	mv	s1,a0
    5df0:	2ae7f263          	bgeu	a5,a4,6094 <fatfs_add_file_entry+0x318>
    5df4:	00000a13          	li	s4,0
    5df8:	00000993          	li	s3,0
    5dfc:	00000913          	li	s2,0
    5e00:	00000c93          	li	s9,0
    5e04:	00000b13          	li	s6,0
    5e08:	01000c13          	li	s8,16
    5e0c:	00812583          	lw	a1,8(sp)
    5e10:	00000693          	li	a3,0
    5e14:	000b0613          	mv	a2,s6
    5e18:	00040513          	mv	a0,s0
    5e1c:	000b0b93          	mv	s7,s6
    5e20:	ffffe097          	auipc	ra,0xffffe
    5e24:	7f4080e7          	jalr	2036(ra) # 4614 <fatfs_sector_reader>
    5e28:	18050463          	beqz	a0,5fb0 <fatfs_add_file_entry+0x234>
    5e2c:	001b0b13          	addi	s6,s6,1
    5e30:	04440793          	addi	a5,s0,68
    5e34:	000c8d13          	mv	s10,s9
    5e38:	00000d93          	li	s11,0
    5e3c:	00078513          	mv	a0,a5
    5e40:	00f12623          	sw	a5,12(sp)
    5e44:	ffffe097          	auipc	ra,0xffffe
    5e48:	8f8080e7          	jalr	-1800(ra) # 373c <fatfs_entry_lfn_text>
    5e4c:	00c12783          	lw	a5,12(sp)
    5e50:	00050c93          	mv	s9,a0
    5e54:	02050c63          	beqz	a0,5e8c <fatfs_add_file_entry+0x110>
    5e58:	020d0463          	beqz	s10,5e80 <fatfs_add_file_entry+0x104>
    5e5c:	00090c93          	mv	s9,s2
    5e60:	000c8913          	mv	s2,s9
    5e64:	001d0c93          	addi	s9,s10,1
    5e68:	001d8d93          	addi	s11,s11,1
    5e6c:	0ffdfd93          	zext.b	s11,s11
    5e70:	02078793          	addi	a5,a5,32
    5e74:	f98d8ce3          	beq	s11,s8,5e0c <fatfs_add_file_entry+0x90>
    5e78:	000c8d13          	mv	s10,s9
    5e7c:	fc1ff06f          	j	5e3c <fatfs_add_file_entry+0xc0>
    5e80:	000d8a13          	mv	s4,s11
    5e84:	000b8993          	mv	s3,s7
    5e88:	fd9ff06f          	j	5e60 <fatfs_add_file_entry+0xe4>
    5e8c:	0007c683          	lbu	a3,0(a5)
    5e90:	0e500713          	li	a4,229
    5e94:	10e69863          	bne	a3,a4,5fa4 <fatfs_add_file_entry+0x228>
    5e98:	000d1863          	bnez	s10,5ea8 <fatfs_add_file_entry+0x12c>
    5e9c:	000d8a13          	mv	s4,s11
    5ea0:	000b8993          	mv	s3,s7
    5ea4:	00100913          	li	s2,1
    5ea8:	fa9d4ee3          	blt	s10,s1,5e64 <fatfs_add_file_entry+0xe8>
    5eac:	00ba8693          	addi	a3,s5,11
    5eb0:	000a8713          	mv	a4,s5
    5eb4:	00000913          	li	s2,0
    5eb8:	00074603          	lbu	a2,0(a4)
    5ebc:	00195793          	srli	a5,s2,0x1
    5ec0:	00791913          	slli	s2,s2,0x7
    5ec4:	012787b3          	add	a5,a5,s2
    5ec8:	00170713          	addi	a4,a4,1
    5ecc:	00c787b3          	add	a5,a5,a2
    5ed0:	0ff7f913          	zext.b	s2,a5
    5ed4:	fed712e3          	bne	a4,a3,5eb8 <fatfs_add_file_entry+0x13c>
    5ed8:	00098b13          	mv	s6,s3
    5edc:	00000d13          	li	s10,0
    5ee0:	01000b93          	li	s7,16
    5ee4:	00812583          	lw	a1,8(sp)
    5ee8:	00000693          	li	a3,0
    5eec:	000b0613          	mv	a2,s6
    5ef0:	00040513          	mv	a0,s0
    5ef4:	ffffe097          	auipc	ra,0xffffe
    5ef8:	720080e7          	jalr	1824(ra) # 4614 <fatfs_sector_reader>
    5efc:	18050c63          	beqz	a0,6094 <fatfs_add_file_entry+0x318>
    5f00:	04440c93          	addi	s9,s0,68
    5f04:	413b0db3          	sub	s11,s6,s3
    5f08:	00000793          	li	a5,0
    5f0c:	00000c13          	li	s8,0
    5f10:	01912623          	sw	s9,12(sp)
    5f14:	000d1663          	bnez	s10,5f20 <fatfs_add_file_entry+0x1a4>
    5f18:	154c1863          	bne	s8,s4,6068 <fatfs_add_file_entry+0x2ec>
    5f1c:	140d9663          	bnez	s11,6068 <fatfs_add_file_entry+0x2ec>
    5f20:	12049263          	bnez	s1,6044 <fatfs_add_file_entry+0x2c8>
    5f24:	01c12703          	lw	a4,28(sp)
    5f28:	01412603          	lw	a2,20(sp)
    5f2c:	01812583          	lw	a1,24(sp)
    5f30:	02010693          	addi	a3,sp,32
    5f34:	000a8513          	mv	a0,s5
    5f38:	ffffe097          	auipc	ra,0xffffe
    5f3c:	a30080e7          	jalr	-1488(ra) # 3968 <fatfs_sfn_create_entry>
    5f40:	02000613          	li	a2,32
    5f44:	00c105b3          	add	a1,sp,a2
    5f48:	000c8513          	mv	a0,s9
    5f4c:	ffffd097          	auipc	ra,0xffffd
    5f50:	a40080e7          	jalr	-1472(ra) # 298c <memcpy>
    5f54:	03842783          	lw	a5,56(s0)
    5f58:	00c12583          	lw	a1,12(sp)
    5f5c:	24442503          	lw	a0,580(s0)
    5f60:	00100613          	li	a2,1
    5f64:	000780e7          	jalr	a5
    5f68:	07c12083          	lw	ra,124(sp)
    5f6c:	07812403          	lw	s0,120(sp)
    5f70:	07412483          	lw	s1,116(sp)
    5f74:	07012903          	lw	s2,112(sp)
    5f78:	06c12983          	lw	s3,108(sp)
    5f7c:	06812a03          	lw	s4,104(sp)
    5f80:	06412a83          	lw	s5,100(sp)
    5f84:	06012b03          	lw	s6,96(sp)
    5f88:	05c12b83          	lw	s7,92(sp)
    5f8c:	05812c03          	lw	s8,88(sp)
    5f90:	05412c83          	lw	s9,84(sp)
    5f94:	05012d03          	lw	s10,80(sp)
    5f98:	04c12d83          	lw	s11,76(sp)
    5f9c:	08010113          	addi	sp,sp,128
    5fa0:	00008067          	ret
    5fa4:	ee068ae3          	beqz	a3,5e98 <fatfs_add_file_entry+0x11c>
    5fa8:	00000913          	li	s2,0
    5fac:	ebdff06f          	j	5e68 <fatfs_add_file_entry+0xec>
    5fb0:	00842583          	lw	a1,8(s0)
    5fb4:	02010613          	addi	a2,sp,32
    5fb8:	00040513          	mv	a0,s0
    5fbc:	fffff097          	auipc	ra,0xfffff
    5fc0:	3e4080e7          	jalr	996(ra) # 53a0 <fatfs_find_blank_cluster>
    5fc4:	0c050863          	beqz	a0,6094 <fatfs_add_file_entry+0x318>
    5fc8:	02012b83          	lw	s7,32(sp)
    5fcc:	00812583          	lw	a1,8(sp)
    5fd0:	00040513          	mv	a0,s0
    5fd4:	000b8613          	mv	a2,s7
    5fd8:	fffff097          	auipc	ra,0xfffff
    5fdc:	64c080e7          	jalr	1612(ra) # 5624 <fatfs_fat_add_cluster_to_chain>
    5fe0:	0a050a63          	beqz	a0,6094 <fatfs_add_file_entry+0x318>
    5fe4:	20000613          	li	a2,512
    5fe8:	00000593          	li	a1,0
    5fec:	04440513          	addi	a0,s0,68
    5ff0:	ffffd097          	auipc	ra,0xffffd
    5ff4:	980080e7          	jalr	-1664(ra) # 2970 <memset>
    5ff8:	00000c13          	li	s8,0
    5ffc:	00044783          	lbu	a5,0(s0)
    6000:	00fc6a63          	bltu	s8,a5,6014 <fatfs_add_file_entry+0x298>
    6004:	ea0914e3          	bnez	s2,5eac <fatfs_add_file_entry+0x130>
    6008:	000b0993          	mv	s3,s6
    600c:	00000a13          	li	s4,0
    6010:	e9dff06f          	j	5eac <fatfs_add_file_entry+0x130>
    6014:	00000693          	li	a3,0
    6018:	000c0613          	mv	a2,s8
    601c:	000b8593          	mv	a1,s7
    6020:	00040513          	mv	a0,s0
    6024:	ffffd097          	auipc	ra,0xffffd
    6028:	3f4080e7          	jalr	1012(ra) # 3418 <fatfs_write_sector>
    602c:	06050463          	beqz	a0,6094 <fatfs_add_file_entry+0x318>
    6030:	001c0c13          	addi	s8,s8,1
    6034:	0ffc7c13          	zext.b	s8,s8
    6038:	fc5ff06f          	j	5ffc <fatfs_add_file_entry+0x280>
    603c:	001b0b13          	addi	s6,s6,1
    6040:	ea5ff06f          	j	5ee4 <fatfs_add_file_entry+0x168>
    6044:	01012503          	lw	a0,16(sp)
    6048:	fff48493          	addi	s1,s1,-1
    604c:	00090693          	mv	a3,s2
    6050:	00048613          	mv	a2,s1
    6054:	000c8593          	mv	a1,s9
    6058:	ffffd097          	auipc	ra,0xffffd
    605c:	7fc080e7          	jalr	2044(ra) # 3854 <fatfs_filename_to_lfn>
    6060:	00100d13          	li	s10,1
    6064:	000d0793          	mv	a5,s10
    6068:	001c0c13          	addi	s8,s8,1
    606c:	0ffc7c13          	zext.b	s8,s8
    6070:	020c8c93          	addi	s9,s9,32
    6074:	eb7c10e3          	bne	s8,s7,5f14 <fatfs_add_file_entry+0x198>
    6078:	fc0782e3          	beqz	a5,603c <fatfs_add_file_entry+0x2c0>
    607c:	03842783          	lw	a5,56(s0)
    6080:	00c12583          	lw	a1,12(sp)
    6084:	24442503          	lw	a0,580(s0)
    6088:	00100613          	li	a2,1
    608c:	000780e7          	jalr	a5
    6090:	fa0516e3          	bnez	a0,603c <fatfs_add_file_entry+0x2c0>
    6094:	00000513          	li	a0,0
    6098:	ed1ff06f          	j	5f68 <fatfs_add_file_entry+0x1ec>
    609c:	00000513          	li	a0,0
    60a0:	00008067          	ret

000060a4 <fl_fopen>:
    60a4:	000077b7          	lui	a5,0x7
    60a8:	b087a783          	lw	a5,-1272(a5) # 6b08 <_filelib_init>
    60ac:	fa010113          	addi	sp,sp,-96
    60b0:	05212823          	sw	s2,80(sp)
    60b4:	03a12823          	sw	s10,48(sp)
    60b8:	04112e23          	sw	ra,92(sp)
    60bc:	04812c23          	sw	s0,88(sp)
    60c0:	04912a23          	sw	s1,84(sp)
    60c4:	05312623          	sw	s3,76(sp)
    60c8:	05412423          	sw	s4,72(sp)
    60cc:	05512223          	sw	s5,68(sp)
    60d0:	05612023          	sw	s6,64(sp)
    60d4:	03712e23          	sw	s7,60(sp)
    60d8:	03812c23          	sw	s8,56(sp)
    60dc:	03912a23          	sw	s9,52(sp)
    60e0:	00050d13          	mv	s10,a0
    60e4:	00058913          	mv	s2,a1
    60e8:	00079663          	bnez	a5,60f4 <fl_fopen+0x50>
    60ec:	ffffd097          	auipc	ra,0xffffd
    60f0:	3e0080e7          	jalr	992(ra) # 34cc <fl_init>
    60f4:	000077b7          	lui	a5,0x7
    60f8:	b047a783          	lw	a5,-1276(a5) # 6b04 <_filelib_valid>
    60fc:	00193713          	seqz	a4,s2
    6100:	0017b793          	seqz	a5,a5
    6104:	00e7e7b3          	or	a5,a5,a4
    6108:	36079e63          	bnez	a5,6484 <fl_fopen+0x3e0>
    610c:	360d0c63          	beqz	s10,6484 <fl_fopen+0x3e0>
    6110:	00000493          	li	s1,0
    6114:	00000413          	li	s0,0
    6118:	05700993          	li	s3,87
    611c:	07200a13          	li	s4,114
    6120:	07700b13          	li	s6,119
    6124:	06100b93          	li	s7,97
    6128:	06200c13          	li	s8,98
    612c:	04100a93          	li	s5,65
    6130:	04200c93          	li	s9,66
    6134:	00090513          	mv	a0,s2
    6138:	ffffd097          	auipc	ra,0xffffd
    613c:	878080e7          	jalr	-1928(ra) # 29b0 <strlen>
    6140:	10a44a63          	blt	s0,a0,6254 <fl_fopen+0x1b0>
    6144:	000089b7          	lui	s3,0x8
    6148:	72898a13          	addi	s4,s3,1832 # 8728 <_fs>
    614c:	038a2783          	lw	a5,56(s4)
    6150:	00079463          	bnez	a5,6158 <fl_fopen+0xb4>
    6154:	fd94f493          	andi	s1,s1,-39
    6158:	03ca2783          	lw	a5,60(s4)
    615c:	00078463          	beqz	a5,6164 <fl_fopen+0xc0>
    6160:	000780e7          	jalr	a5
    6164:	0014f793          	andi	a5,s1,1
    6168:	18079263          	bnez	a5,62ec <fl_fopen+0x248>
    616c:	0204f793          	andi	a5,s1,32
    6170:	08078c63          	beqz	a5,6208 <fl_fopen+0x164>
    6174:	038a2783          	lw	a5,56(s4)
    6178:	06078a63          	beqz	a5,61ec <fl_fopen+0x148>
    617c:	ffffd097          	auipc	ra,0xffffd
    6180:	160080e7          	jalr	352(ra) # 32dc <_allocate_file>
    6184:	00050413          	mv	s0,a0
    6188:	06050263          	beqz	a0,61ec <fl_fopen+0x148>
    618c:	01450a93          	addi	s5,a0,20
    6190:	10400613          	li	a2,260
    6194:	00000593          	li	a1,0
    6198:	000a8513          	mv	a0,s5
    619c:	ffffc097          	auipc	ra,0xffffc
    61a0:	7d4080e7          	jalr	2004(ra) # 2970 <memset>
    61a4:	11840b13          	addi	s6,s0,280
    61a8:	10400613          	li	a2,260
    61ac:	00000593          	li	a1,0
    61b0:	000b0513          	mv	a0,s6
    61b4:	ffffc097          	auipc	ra,0xffffc
    61b8:	7bc080e7          	jalr	1980(ra) # 2970 <memset>
    61bc:	10400713          	li	a4,260
    61c0:	000b0693          	mv	a3,s6
    61c4:	00070613          	mv	a2,a4
    61c8:	000a8593          	mv	a1,s5
    61cc:	000d0513          	mv	a0,s10
    61d0:	ffffe097          	auipc	ra,0xffffe
    61d4:	c88080e7          	jalr	-888(ra) # 3e58 <fatfs_split_path>
    61d8:	fff00793          	li	a5,-1
    61dc:	12f51663          	bne	a0,a5,6308 <fl_fopen+0x264>
    61e0:	00040513          	mv	a0,s0
    61e4:	ffffd097          	auipc	ra,0xffffd
    61e8:	170080e7          	jalr	368(ra) # 3354 <_free_file>
    61ec:	00000413          	li	s0,0
    61f0:	0214f793          	andi	a5,s1,33
    61f4:	02000713          	li	a4,32
    61f8:	28e79263          	bne	a5,a4,647c <fl_fopen+0x3d8>
    61fc:	10041263          	bnez	s0,6300 <fl_fopen+0x25c>
    6200:	0064f793          	andi	a5,s1,6
    6204:	26079463          	bnez	a5,646c <fl_fopen+0x3c8>
    6208:	00000413          	li	s0,0
    620c:	040a2783          	lw	a5,64(s4)
    6210:	00078463          	beqz	a5,6218 <fl_fopen+0x174>
    6214:	000780e7          	jalr	a5
    6218:	05c12083          	lw	ra,92(sp)
    621c:	00040513          	mv	a0,s0
    6220:	05812403          	lw	s0,88(sp)
    6224:	05412483          	lw	s1,84(sp)
    6228:	05012903          	lw	s2,80(sp)
    622c:	04c12983          	lw	s3,76(sp)
    6230:	04812a03          	lw	s4,72(sp)
    6234:	04412a83          	lw	s5,68(sp)
    6238:	04012b03          	lw	s6,64(sp)
    623c:	03c12b83          	lw	s7,60(sp)
    6240:	03812c03          	lw	s8,56(sp)
    6244:	03412c83          	lw	s9,52(sp)
    6248:	03012d03          	lw	s10,48(sp)
    624c:	06010113          	addi	sp,sp,96
    6250:	00008067          	ret
    6254:	008907b3          	add	a5,s2,s0
    6258:	0007c783          	lbu	a5,0(a5)
    625c:	05378863          	beq	a5,s3,62ac <fl_fopen+0x208>
    6260:	02f9e863          	bltu	s3,a5,6290 <fl_fopen+0x1ec>
    6264:	05578863          	beq	a5,s5,62b4 <fl_fopen+0x210>
    6268:	00faea63          	bltu	s5,a5,627c <fl_fopen+0x1d8>
    626c:	02b00713          	li	a4,43
    6270:	04e78663          	beq	a5,a4,62bc <fl_fopen+0x218>
    6274:	00140413          	addi	s0,s0,1
    6278:	ebdff06f          	j	6134 <fl_fopen+0x90>
    627c:	03978263          	beq	a5,s9,62a0 <fl_fopen+0x1fc>
    6280:	05200713          	li	a4,82
    6284:	fee798e3          	bne	a5,a4,6274 <fl_fopen+0x1d0>
    6288:	0014e493          	ori	s1,s1,1
    628c:	fe9ff06f          	j	6274 <fl_fopen+0x1d0>
    6290:	ff478ce3          	beq	a5,s4,6288 <fl_fopen+0x1e4>
    6294:	00fa6a63          	bltu	s4,a5,62a8 <fl_fopen+0x204>
    6298:	01778e63          	beq	a5,s7,62b4 <fl_fopen+0x210>
    629c:	fd879ce3          	bne	a5,s8,6274 <fl_fopen+0x1d0>
    62a0:	0084e493          	ori	s1,s1,8
    62a4:	fd1ff06f          	j	6274 <fl_fopen+0x1d0>
    62a8:	fd6796e3          	bne	a5,s6,6274 <fl_fopen+0x1d0>
    62ac:	0324e493          	ori	s1,s1,50
    62b0:	fc5ff06f          	j	6274 <fl_fopen+0x1d0>
    62b4:	0264e493          	ori	s1,s1,38
    62b8:	fbdff06f          	j	6274 <fl_fopen+0x1d0>
    62bc:	0014f793          	andi	a5,s1,1
    62c0:	00078663          	beqz	a5,62cc <fl_fopen+0x228>
    62c4:	0024e493          	ori	s1,s1,2
    62c8:	fadff06f          	j	6274 <fl_fopen+0x1d0>
    62cc:	0024f793          	andi	a5,s1,2
    62d0:	00078663          	beqz	a5,62dc <fl_fopen+0x238>
    62d4:	0314e493          	ori	s1,s1,49
    62d8:	f9dff06f          	j	6274 <fl_fopen+0x1d0>
    62dc:	0044f793          	andi	a5,s1,4
    62e0:	f8078ae3          	beqz	a5,6274 <fl_fopen+0x1d0>
    62e4:	0274e493          	ori	s1,s1,39
    62e8:	f8dff06f          	j	6274 <fl_fopen+0x1d0>
    62ec:	000d0513          	mv	a0,s10
    62f0:	fffff097          	auipc	ra,0xfffff
    62f4:	81c080e7          	jalr	-2020(ra) # 4b0c <_open_file>
    62f8:	00050413          	mv	s0,a0
    62fc:	e60508e3          	beqz	a0,616c <fl_fopen+0xc8>
    6300:	42940c23          	sb	s1,1080(s0)
    6304:	f09ff06f          	j	620c <fl_fopen+0x168>
    6308:	00040513          	mv	a0,s0
    630c:	ffffe097          	auipc	ra,0xffffe
    6310:	dc8080e7          	jalr	-568(ra) # 40d4 <_check_file_open>
    6314:	00050913          	mv	s2,a0
    6318:	ec0514e3          	bnez	a0,61e0 <fl_fopen+0x13c>
    631c:	01444783          	lbu	a5,20(s0)
    6320:	0e079663          	bnez	a5,640c <fl_fopen+0x368>
    6324:	008a2783          	lw	a5,8(s4)
    6328:	00f42023          	sw	a5,0(s0)
    632c:	00042583          	lw	a1,0(s0)
    6330:	01010693          	addi	a3,sp,16
    6334:	000b0613          	mv	a2,s6
    6338:	72898513          	addi	a0,s3,1832
    633c:	ffffe097          	auipc	ra,0xffffe
    6340:	428080e7          	jalr	1064(ra) # 4764 <fatfs_get_file_entry>
    6344:	00100693          	li	a3,1
    6348:	e8d50ce3          	beq	a0,a3,61e0 <fl_fopen+0x13c>
    634c:	00042223          	sw	zero,4(s0)
    6350:	00440613          	addi	a2,s0,4
    6354:	00068593          	mv	a1,a3
    6358:	72898513          	addi	a0,s3,1832
    635c:	00000097          	auipc	ra,0x0
    6360:	908080e7          	jalr	-1784(ra) # 5c64 <fatfs_allocate_free_space>
    6364:	e6050ee3          	beqz	a0,61e0 <fl_fopen+0x13c>
    6368:	00002ab7          	lui	s5,0x2
    636c:	21c40b93          	addi	s7,s0,540
    6370:	72898c13          	addi	s8,s3,1832
    6374:	70fa8a93          	addi	s5,s5,1807 # 270f <sdcard_preinit+0x5f>
    6378:	000b0593          	mv	a1,s6
    637c:	00410513          	addi	a0,sp,4
    6380:	ffffd097          	auipc	ra,0xffffd
    6384:	68c080e7          	jalr	1676(ra) # 3a0c <fatfs_lfn_create_sfn>
    6388:	08090e63          	beqz	s2,6424 <fl_fopen+0x380>
    638c:	00090613          	mv	a2,s2
    6390:	00410593          	addi	a1,sp,4
    6394:	000b8513          	mv	a0,s7
    6398:	ffffd097          	auipc	ra,0xffffd
    639c:	7f0080e7          	jalr	2032(ra) # 3b88 <fatfs_lfn_generate_tail>
    63a0:	00042583          	lw	a1,0(s0)
    63a4:	000b8613          	mv	a2,s7
    63a8:	000c0513          	mv	a0,s8
    63ac:	fffff097          	auipc	ra,0xfffff
    63b0:	8d4080e7          	jalr	-1836(ra) # 4c80 <fatfs_sfn_exists>
    63b4:	00050663          	beqz	a0,63c0 <fl_fopen+0x31c>
    63b8:	00190913          	addi	s2,s2,1
    63bc:	fb591ee3          	bne	s2,s5,6378 <fl_fopen+0x2d4>
    63c0:	00442703          	lw	a4,4(s0)
    63c4:	000027b7          	lui	a5,0x2
    63c8:	70f78793          	addi	a5,a5,1807 # 270f <sdcard_preinit+0x5f>
    63cc:	00070593          	mv	a1,a4
    63d0:	02f90663          	beq	s2,a5,63fc <fl_fopen+0x358>
    63d4:	00042583          	lw	a1,0(s0)
    63d8:	00000813          	li	a6,0
    63dc:	00000793          	li	a5,0
    63e0:	000b8693          	mv	a3,s7
    63e4:	000b0613          	mv	a2,s6
    63e8:	72898513          	addi	a0,s3,1832
    63ec:	00000097          	auipc	ra,0x0
    63f0:	990080e7          	jalr	-1648(ra) # 5d7c <fatfs_add_file_entry>
    63f4:	04051463          	bnez	a0,643c <fl_fopen+0x398>
    63f8:	00442583          	lw	a1,4(s0)
    63fc:	72898513          	addi	a0,s3,1832
    6400:	fffff097          	auipc	ra,0xfffff
    6404:	1b4080e7          	jalr	436(ra) # 55b4 <fatfs_free_cluster_chain>
    6408:	dd9ff06f          	j	61e0 <fl_fopen+0x13c>
    640c:	00040593          	mv	a1,s0
    6410:	000a8513          	mv	a0,s5
    6414:	ffffe097          	auipc	ra,0xffffe
    6418:	54c080e7          	jalr	1356(ra) # 4960 <_open_directory>
    641c:	f00518e3          	bnez	a0,632c <fl_fopen+0x288>
    6420:	dc1ff06f          	j	61e0 <fl_fopen+0x13c>
    6424:	00b00613          	li	a2,11
    6428:	00410593          	addi	a1,sp,4
    642c:	000b8513          	mv	a0,s7
    6430:	ffffc097          	auipc	ra,0xffffc
    6434:	55c080e7          	jalr	1372(ra) # 298c <memcpy>
    6438:	f69ff06f          	j	63a0 <fl_fopen+0x2fc>
    643c:	fff00793          	li	a5,-1
    6440:	00042623          	sw	zero,12(s0)
    6444:	00042423          	sw	zero,8(s0)
    6448:	42f42823          	sw	a5,1072(s0)
    644c:	42042a23          	sw	zero,1076(s0)
    6450:	00042823          	sw	zero,16(s0)
    6454:	22f42423          	sw	a5,552(s0)
    6458:	22f42623          	sw	a5,556(s0)
    645c:	72898513          	addi	a0,s3,1832
    6460:	ffffe097          	auipc	ra,0xffffe
    6464:	054080e7          	jalr	84(ra) # 44b4 <fatfs_fat_purge>
    6468:	d89ff06f          	j	61f0 <fl_fopen+0x14c>
    646c:	000d0513          	mv	a0,s10
    6470:	ffffe097          	auipc	ra,0xffffe
    6474:	69c080e7          	jalr	1692(ra) # 4b0c <_open_file>
    6478:	00050413          	mv	s0,a0
    647c:	e80412e3          	bnez	s0,6300 <fl_fopen+0x25c>
    6480:	d89ff06f          	j	6208 <fl_fopen+0x164>
    6484:	00000413          	li	s0,0
    6488:	d91ff06f          	j	6218 <fl_fopen+0x174>

0000648c <led_pos>:
    648c:	00000001                                ....

00006490 <cmd16>:
    6490:	02000050 00001500                       P.......

00006498 <acmd41>:
    6498:	00004069 00000100                       i@......

000064a0 <cmd55>:
    64a0:	00000077 00000100                       w.......

000064a8 <cmd8>:
    64a8:	01000048 000087aa                       H.......

000064b0 <cmd0>:
    64b0:	00000040 00009500                       @.......

000064b8 <AUDIO>:
    64b8:	00018000                                ....

000064bc <DISPLAY>:
    64bc:	00014000                                .@..

000064c0 <BUTTONS>:
    64c0:	00010100                                ....

000064c4 <SDCARD>:
    64c4:	00010080                                ....

000064c8 <OLED_RST>:
    64c8:	00010010                                ....

000064cc <OLED>:
    64cc:	00010008                                ....

000064d0 <LEDS>:
    64d0:	00010004 00006272 696c632f 722e6b63     ....rb../click.r
    64e0:	00007761 44414f4c 2e474e49 00002e2e     aw..LOADING.....
    64f0:	4154532f 522e5452 00005741 4154532f     /START.RAW../STA
    6500:	722e5452 00007761 59414c50 21474e49     RT.raw..PLAYING!
    6510:	00000000 46204f4e 20454c49 4e554f46     ....NO FILE FOUN
    6520:	00000044 434c4557 20454d4f 52455355     D...WELCOME USER
    6530:	00000000 676d692f 00002f73 43206f4e     ..../imgs/..No C
    6540:	7265766f 00000000 50207c7c 45535541     over....|| PAUSE
    6550:	00000044 52203c3c 4e495745 00000044     D...<< REWIND...
    6560:	46203e3e 00545341 54534552 00545241     >> FAST.RESTART.
    6570:	54534146 00583220 574f4c53 352e3020     FAST 2X.SLOW 0.5
    6580:	00000058 4d204a44 0045444f 52204a44     X...DJ MODE.DJ R
    6590:	59444145 00000000 54555453 21524554     EADY....STUTTER!
    65a0:	00000021 53203c3c 004e4950 0000002e     !...<< SPIN.....
    65b0:	0000002f 4c494620 203a5345 00000000     /... FILES: ....
    65c0:	74706d45 000a2179 5d64255b 00000020     Empty!..[%d] ...
    65d0:	203e6425 00000000 20202020 20202020     %d> ....        
    65e0:	20202020 20202020 20202020 00000a20                  ...
    65f0:	626c612f 2f736d75 00000000 204a4420     /albums/.... DJ 
    6600:	3a4c4553 00000020 53554d20 203a4349     SEL: ... MUSIC: 
    6610:	00000020 656c6946 70784520 65726f6c      ...File Explore
    6620:	00000072 79616c50 6e6f5320 00007367     r...Play Songs..
    6630:	4d204a44 0065646f 203d3d3d 4e49414d     DJ Mode.=== MAIN
    6640:	4e454d20 3d3d2055 000a0a3d 2e642520      MENU ===... %d.
    6650:	20732520 20202020 000a2020 0000000a      %s       ......
    6660:	656c6553 26207463 65725020 42207373     Select & Press B
    6670:	00006e74 74696e49 20445320 64726163     tn..Init SD card
    6680:	0a2e2e2e 00000000 33323130 37363534     ........01234567
    6690:	42413938 46454443 00000000 5f544146     89ABCDEF....FAT_
    66a0:	203a5346 6f727245 6f632072 20646c75     FS: Error could 
    66b0:	20746f6e 64616f6c 54414620 74656420     not load FAT det
    66c0:	736c6961 64252820 0a0d2129 00000000     ails (%d)!......

000066d0 <font>:
    66d0:	00000000 00002f00 00030000 14000003     ...../..........
    66e0:	143e143e 3a2b6a2e 08122600 171c3224     >.>..j+:.&..$2..
    66f0:	03003415 00000000 0000211e 001e2100     .4.......!...!..
    6700:	08220000 0822081c 0000081c 00002040     .."...".....@ ..
    6710:	00080800 00200000 20000000 02040810     ...... .... ....
    6720:	3f21213f 003f0100 253d0000 25002725     ?!!?..?...=%%'.%
    6730:	003f2525 3f040407 25252700 253f003d     %%?....?.'%%=.?%
    6740:	01003d25 00030539 3f25253f 25252700     %=..9...?%%?.'%%
    6750:	0028003f 40000000 00000028 00110a04     ?.(....@(.......
    6760:	00141400 0a110000 01000004 0007052d     ............-...
    6770:	253d213f 09093f1f 253f003f 3f003c27     ?!=%.?..?.?%'<.?
    6780:	00212121 1e21213f 25253f00 053f0025     !!!.?!!..?%%%.?.
    6790:	3f000505 003d2521 3f04043f 213f2100     ...?!%=.?..?.!?!
    67a0:	20380000 3f013f21 003b0404 2020203f     ..8 !?.?..;.?   
    67b0:	3f013f00 023f3f01 3f003f04 003f2121     .?.?.??..?.?!!?.
    67c0:	0f09093f 31213f00 093f003f 27002f39     ?....?!1?.?.9/.'
    67d0:	003d2525 013f0101 20203f01 100f003f     %%=...?..?  ?...
    67e0:	3f001f30 3f203f20 3b04043b 38080f00     0..? ? ?;..;...8
    67f0:	2931000f 3f002325 00000021 04081020     ..1)%#.?!... ...
    6800:	003f2102 01020000 20000201 00000020     .!?........  ...
    6810:	00000201 24243800 243f003c 3c003c24     .....8$$<.?$$<.<
    6820:	00242424 3f24243c 2c2c3c00 3f04002c     $$$.<$$?.<,,,..?
    6830:	bc000005 00fca4a4 3c04043f 00003d00     ........?..<.=..
    6840:	fd800000 3f000000 00340808 0000003f     .......?..4.?...
    6850:	3c043c00 043c3c04 3c003c04 003c2424     .<.<.<<..<.<$$<.
    6860:	3c2424fc 24243c00 083c00fc 2c000004     .$$<.<$$..<....,
    6870:	003c2c2c 00243f04 20203c00 100c003c     ,,<..?$..<  <...
    6880:	3c001c30 3c203c20 34080834 a0a0bc00     0..< < <4..4....
    6890:	342400fc 0400242c 0000213f 0000003f     ..$4,$..?!..?...
    68a0:	043f2100 02010000 00000102 00000000     .!?.............
    68b0:	00000001 00000003 00000005 00000007     ................
    68c0:	00000009 0000000e 00000010 00000012     ................
    68d0:	00000014 00000016 00000018 0000001c     ................
    68e0:	0000001e                                ....

000068e4 <current_path>:
    68e4:	0000002f 00000000 00000000 00000000     /...............
	...

00006ad8 <led_dir>:
    6ad8:	00000000                                ....

00006adc <n_items>:
    6adc:	00000000                                ....

00006ae0 <sdcard_while_loading_callback>:
    6ae0:	00000000                                ....

00006ae4 <back_color>:
	...

00006ae5 <front_color>:
    6ae5:	                                         ...

00006ae8 <cursor_y>:
    6ae8:	00000000                                ....

00006aec <cursor_x>:
    6aec:	00000000                                ....

00006af0 <f_putchar>:
    6af0:	00000000                                ....

00006af4 <_free_file_list>:
	...

00006afc <_open_file_list>:
	...

00006b04 <_filelib_valid>:
    6b04:	00000000                                ....

00006b08 <_filelib_init>:
    6b08:	00000000                                ....
