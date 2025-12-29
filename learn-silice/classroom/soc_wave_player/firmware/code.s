
code.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00010137          	lui	sp,0x10
       4:	00002097          	auipc	ra,0x2
       8:	e88080e7          	jalr	-376(ra) # 1e8c <main>
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
      e0:	fe010113          	addi	sp,sp,-32 # ffe0 <_files+0x7824>
      e4:	000067b7          	lui	a5,0x6
      e8:	00812c23          	sw	s0,24(sp)
      ec:	1307a403          	lw	s0,304(a5) # 6130 <AUDIO>
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
     128:	4c4080e7          	jalr	1220(ra) # 25e8 <memset>
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
     168:	14c58593          	addi	a1,a1,332 # 614c <LEDS+0x4>
     16c:	15050513          	addi	a0,a0,336 # 6150 <LEDS+0x8>
     170:	00112e23          	sw	ra,28(sp)
     174:	00812c23          	sw	s0,24(sp)
     178:	00912a23          	sw	s1,20(sp)
     17c:	01212823          	sw	s2,16(sp)
     180:	01312623          	sw	s3,12(sp)
     184:	01412423          	sw	s4,8(sp)
     188:	01512223          	sw	s5,4(sp)
     18c:	00006097          	auipc	ra,0x6
     190:	b90080e7          	jalr	-1136(ra) # 5d1c <fl_fopen>
     194:	0a050263          	beqz	a0,238 <play_click_noise+0xdc>
     198:	000015b7          	lui	a1,0x1
     19c:	00000613          	li	a2,0
     1a0:	19458593          	addi	a1,a1,404 # 1194 <scan_files+0x21c>
     1a4:	00050a13          	mv	s4,a0
     1a8:	00003097          	auipc	ra,0x3
     1ac:	004080e7          	jalr	4(ra) # 31ac <fl_fseek>
     1b0:	000067b7          	lui	a5,0x6
     1b4:	1307aa83          	lw	s5,304(a5) # 6130 <AUDIO>
     1b8:	20000993          	li	s3,512
     1bc:	1ff00913          	li	s2,511
     1c0:	000aa483          	lw	s1,0(s5)
     1c4:	000a0693          	mv	a3,s4
     1c8:	20000613          	li	a2,512
     1cc:	00100593          	li	a1,1
     1d0:	00048513          	mv	a0,s1
     1d4:	00005097          	auipc	ra,0x5
     1d8:	544080e7          	jalr	1348(ra) # 5718 <fl_fread>
     1dc:	00050413          	mv	s0,a0
     1e0:	00a94c63          	blt	s2,a0,1f8 <play_click_noise+0x9c>
     1e4:	40a98633          	sub	a2,s3,a0
     1e8:	00000593          	li	a1,0
     1ec:	00a48533          	add	a0,s1,a0
     1f0:	00002097          	auipc	ra,0x2
     1f4:	3f8080e7          	jalr	1016(ra) # 25e8 <memset>
     1f8:	000aa783          	lw	a5,0(s5)
     1fc:	fef48ee3          	beq	s1,a5,1f8 <play_click_noise+0x9c>
     200:	fc8940e3          	blt	s2,s0,1c0 <play_click_noise+0x64>
     204:	000a0513          	mv	a0,s4
     208:	00005097          	auipc	ra,0x5
     20c:	434080e7          	jalr	1076(ra) # 563c <fl_fclose>
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
     270:	00058493          	mv	s1,a1
     274:	00060993          	mv	s3,a2
     278:	00112e23          	sw	ra,28(sp)
     27c:	00050913          	mv	s2,a0
     280:	00002097          	auipc	ra,0x2
     284:	60c080e7          	jalr	1548(ra) # 288c <display_framebuffer>
     288:	000037b7          	lui	a5,0x3
     28c:	00050413          	mv	s0,a0
     290:	48078793          	addi	a5,a5,1152 # 3480 <fatfs_entry_sfn_only+0x34>
     294:	08000613          	li	a2,128
     298:	000045b7          	lui	a1,0x4
     29c:	00000713          	li	a4,0
     2a0:	00f406b3          	add	a3,s0,a5
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
     2d8:	00c40633          	add	a2,s0,a2
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
     338:	a9378793          	addi	a5,a5,-1389 # 2a93 <print_dec+0x43>
     33c:	06c00693          	li	a3,108
     340:	00a7ca63          	blt	a5,a0,354 <update_player_ui+0xf8>
     344:	06400593          	li	a1,100
     348:	00002097          	auipc	ra,0x2
     34c:	1ec080e7          	jalr	492(ra) # 2534 <__divsi3>
     350:	00050693          	mv	a3,a0
     354:	000037b7          	lui	a5,0x3
     358:	00004637          	lui	a2,0x4
     35c:	78078793          	addi	a5,a5,1920 # 3780 <fatfs_lfn_create_sfn+0xfc>
     360:	07600593          	li	a1,118
     364:	07500513          	li	a0,117
     368:	00a00813          	li	a6,10
     36c:	fff00893          	li	a7,-1
     370:	90060613          	addi	a2,a2,-1792 # 3900 <fatfs_lfn_generate_tail+0x100>
     374:	40d58733          	sub	a4,a1,a3
     378:	00f40333          	add	t1,s0,a5
     37c:	06e55c63          	bge	a0,a4,3f4 <update_player_ui+0x198>
     380:	08078793          	addi	a5,a5,128
     384:	fec798e3          	bne	a5,a2,374 <update_player_ui+0x118>
     388:	07600593          	li	a1,118
     38c:	00a00513          	li	a0,10
     390:	00002097          	auipc	ra,0x2
     394:	508080e7          	jalr	1288(ra) # 2898 <display_set_cursor>
     398:	00000593          	li	a1,0
     39c:	0ff00513          	li	a0,255
     3a0:	00002097          	auipc	ra,0x2
     3a4:	50c080e7          	jalr	1292(ra) # 28ac <display_set_front_back_color>
     3a8:	0004c783          	lbu	a5,0(s1)
     3ac:	08079e63          	bnez	a5,448 <update_player_ui+0x1ec>
     3b0:	000064b7          	lui	s1,0x6
     3b4:	71c4a783          	lw	a5,1820(s1) # 671c <f_putchar>
     3b8:	03e00513          	li	a0,62
     3bc:	00200413          	li	s0,2
     3c0:	000780e7          	jalr	a5
     3c4:	71c4a783          	lw	a5,1820(s1)
     3c8:	02000513          	li	a0,32
     3cc:	00e00913          	li	s2,14
     3d0:	000780e7          	jalr	a5
     3d4:	008987b3          	add	a5,s3,s0
     3d8:	ffe7c503          	lbu	a0,-2(a5)
     3dc:	04050263          	beqz	a0,420 <update_player_ui+0x1c4>
     3e0:	71c4a783          	lw	a5,1820(s1)
     3e4:	00140413          	addi	s0,s0,1
     3e8:	000780e7          	jalr	a5
     3ec:	ff2414e3          	bne	s0,s2,3d4 <update_player_ui+0x178>
     3f0:	0300006f          	j	420 <update_player_ui+0x1c4>
     3f4:	01070663          	beq	a4,a6,400 <update_player_ui+0x1a4>
     3f8:	00e30e33          	add	t3,t1,a4
     3fc:	011e0023          	sb	a7,0(t3)
     400:	00170713          	addi	a4,a4,1
     404:	f79ff06f          	j	37c <update_player_ui+0x120>
     408:	71c92783          	lw	a5,1820(s2)
     40c:	00140413          	addi	s0,s0,1
     410:	000780e7          	jalr	a5
     414:	008487b3          	add	a5,s1,s0
     418:	0007c503          	lbu	a0,0(a5)
     41c:	fe0516e3          	bnez	a0,408 <update_player_ui+0x1ac>
     420:	00f00493          	li	s1,15
     424:	00006937          	lui	s2,0x6
     428:	0284d663          	bge	s1,s0,454 <update_player_ui+0x1f8>
     42c:	01c12083          	lw	ra,28(sp)
     430:	01812403          	lw	s0,24(sp)
     434:	01412483          	lw	s1,20(sp)
     438:	01012903          	lw	s2,16(sp)
     43c:	00c12983          	lw	s3,12(sp)
     440:	02010113          	addi	sp,sp,32
     444:	00008067          	ret
     448:	00000413          	li	s0,0
     44c:	00006937          	lui	s2,0x6
     450:	fc5ff06f          	j	414 <update_player_ui+0x1b8>
     454:	71c92783          	lw	a5,1820(s2) # 671c <f_putchar>
     458:	02000513          	li	a0,32
     45c:	00140413          	addi	s0,s0,1
     460:	000780e7          	jalr	a5
     464:	fc5ff06f          	j	428 <update_player_ui+0x1cc>

00000468 <update_led_dance>:
     468:	00050713          	mv	a4,a0
     46c:	00000693          	li	a3,0
     470:	00470713          	addi	a4,a4,4
     474:	40a707b3          	sub	a5,a4,a0
     478:	06b7c463          	blt	a5,a1,4e0 <update_led_dance+0x78>
     47c:	32000793          	li	a5,800
     480:	04d7fe63          	bgeu	a5,a3,4dc <update_led_dance+0x74>
     484:	00006637          	lui	a2,0x6
     488:	10462703          	lw	a4,260(a2) # 6104 <led_pos>
     48c:	000067b7          	lui	a5,0x6
     490:	fff70693          	addi	a3,a4,-1
     494:	00068663          	beqz	a3,4a0 <update_led_dance+0x38>
     498:	f8070693          	addi	a3,a4,-128
     49c:	00069a63          	bnez	a3,4b0 <update_led_dance+0x48>
     4a0:	7047a583          	lw	a1,1796(a5) # 6704 <led_dir>
     4a4:	00100693          	li	a3,1
     4a8:	40b686b3          	sub	a3,a3,a1
     4ac:	70d7a223          	sw	a3,1796(a5)
     4b0:	7047a683          	lw	a3,1796(a5)
     4b4:	40175793          	srai	a5,a4,0x1
     4b8:	00068463          	beqz	a3,4c0 <update_led_dance+0x58>
     4bc:	00171793          	slli	a5,a4,0x1
     4c0:	08000713          	li	a4,128
     4c4:	02f75e63          	bge	a4,a5,500 <update_led_dance+0x98>
     4c8:	00070793          	mv	a5,a4
     4cc:	00006737          	lui	a4,0x6
     4d0:	14872703          	lw	a4,328(a4) # 6148 <LEDS>
     4d4:	10f62223          	sw	a5,260(a2)
     4d8:	00f72023          	sw	a5,0(a4)
     4dc:	00008067          	ret
     4e0:	ffc74603          	lbu	a2,-4(a4)
     4e4:	00074783          	lbu	a5,0(a4)
     4e8:	40c787b3          	sub	a5,a5,a2
     4ec:	41f7d613          	srai	a2,a5,0x1f
     4f0:	00f647b3          	xor	a5,a2,a5
     4f4:	40c787b3          	sub	a5,a5,a2
     4f8:	00f686b3          	add	a3,a3,a5
     4fc:	f75ff06f          	j	470 <update_led_dance+0x8>
     500:	fcf046e3          	bgtz	a5,4cc <update_led_dance+0x64>
     504:	00100793          	li	a5,1
     508:	fc5ff06f          	j	4cc <update_led_dance+0x64>

0000050c <play_music_with_controls>:
     50c:	ba010113          	addi	sp,sp,-1120
     510:	44112e23          	sw	ra,1116(sp)
     514:	44912a23          	sw	s1,1108(sp)
     518:	45212823          	sw	s2,1104(sp)
     51c:	45312623          	sw	s3,1100(sp)
     520:	44812c23          	sw	s0,1112(sp)
     524:	45412423          	sw	s4,1096(sp)
     528:	45512223          	sw	s5,1092(sp)
     52c:	45612023          	sw	s6,1088(sp)
     530:	43712e23          	sw	s7,1084(sp)
     534:	43812c23          	sw	s8,1080(sp)
     538:	43912a23          	sw	s9,1076(sp)
     53c:	43a12823          	sw	s10,1072(sp)
     540:	43b12623          	sw	s11,1068(sp)
     544:	00b12623          	sw	a1,12(sp)
     548:	00060913          	mv	s2,a2
     54c:	00050993          	mv	s3,a0
     550:	00002097          	auipc	ra,0x2
     554:	33c080e7          	jalr	828(ra) # 288c <display_framebuffer>
     558:	00004637          	lui	a2,0x4
     55c:	00000593          	li	a1,0
     560:	00002097          	auipc	ra,0x2
     564:	088080e7          	jalr	136(ra) # 25e8 <memset>
     568:	000065b7          	lui	a1,0x6
     56c:	15c58593          	addi	a1,a1,348 # 615c <LEDS+0x14>
     570:	02c10513          	addi	a0,sp,44
     574:	00002097          	auipc	ra,0x2
     578:	138080e7          	jalr	312(ra) # 26ac <strcpy>
     57c:	00c12583          	lw	a1,12(sp)
     580:	02c10513          	addi	a0,sp,44
     584:	000064b7          	lui	s1,0x6
     588:	00000097          	auipc	ra,0x0
     58c:	b04080e7          	jalr	-1276(ra) # 8c <strcat_custom>
     590:	14c48593          	addi	a1,s1,332 # 614c <LEDS+0x4>
     594:	02c10513          	addi	a0,sp,44
     598:	00005097          	auipc	ra,0x5
     59c:	784080e7          	jalr	1924(ra) # 5d1c <fl_fopen>
     5a0:	28050a63          	beqz	a0,834 <play_music_with_controls+0x328>
     5a4:	00050413          	mv	s0,a0
     5a8:	00002097          	auipc	ra,0x2
     5ac:	2e4080e7          	jalr	740(ra) # 288c <display_framebuffer>
     5b0:	00040693          	mv	a3,s0
     5b4:	00004637          	lui	a2,0x4
     5b8:	00100593          	li	a1,1
     5bc:	00005097          	auipc	ra,0x5
     5c0:	15c080e7          	jalr	348(ra) # 5718 <fl_fread>
     5c4:	00040513          	mv	a0,s0
     5c8:	00005097          	auipc	ra,0x5
     5cc:	074080e7          	jalr	116(ra) # 563c <fl_fclose>
     5d0:	14c48593          	addi	a1,s1,332
     5d4:	00098513          	mv	a0,s3
     5d8:	00005097          	auipc	ra,0x5
     5dc:	744080e7          	jalr	1860(ra) # 5d1c <fl_fopen>
     5e0:	00a12823          	sw	a0,16(sp)
     5e4:	00000413          	li	s0,0
     5e8:	20050663          	beqz	a0,7f4 <play_music_with_controls+0x2e8>
     5ec:	00c12603          	lw	a2,12(sp)
     5f0:	00006c37          	lui	s8,0x6
     5f4:	2f8c0593          	addi	a1,s8,760 # 62f8 <LEDS+0x1b0>
     5f8:	00000513          	li	a0,0
     5fc:	00000097          	auipc	ra,0x0
     600:	c60080e7          	jalr	-928(ra) # 25c <update_player_ui>
     604:	00006cb7          	lui	s9,0x6
     608:	00002097          	auipc	ra,0x2
     60c:	400080e7          	jalr	1024(ra) # 2a08 <display_refresh>
     610:	138ca783          	lw	a5,312(s9) # 6138 <BUTTONS>
     614:	00000a93          	li	s5,0
     618:	00000b13          	li	s6,0
     61c:	0007a483          	lw	s1,0(a5)
     620:	00f12a23          	sw	a5,20(sp)
     624:	000067b7          	lui	a5,0x6
     628:	1307ad03          	lw	s10,304(a5) # 6130 <AUDIO>
     62c:	000067b7          	lui	a5,0x6
     630:	1487a783          	lw	a5,328(a5) # 6148 <LEDS>
     634:	00000993          	li	s3,0
     638:	22010b93          	addi	s7,sp,544
     63c:	00f12e23          	sw	a5,28(sp)
     640:	000067b7          	lui	a5,0x6
     644:	17078793          	addi	a5,a5,368 # 6170 <LEDS+0x28>
     648:	00f12c23          	sw	a5,24(sp)
     64c:	000d2a03          	lw	s4,0(s10)
     650:	20098c63          	beqz	s3,868 <play_music_with_controls+0x35c>
     654:	20000613          	li	a2,512
     658:	00000593          	li	a1,0
     65c:	000a0513          	mv	a0,s4
     660:	00002097          	auipc	ra,0x2
     664:	f88080e7          	jalr	-120(ra) # 25e8 <memset>
     668:	01c12783          	lw	a5,28(sp)
     66c:	0007a023          	sw	zero,0(a5)
     670:	000d2783          	lw	a5,0(s10)
     674:	fefa0ee3          	beq	s4,a5,670 <play_music_with_controls+0x164>
     678:	001b0b13          	addi	s6,s6,1
     67c:	01500793          	li	a5,21
     680:	04fb1863          	bne	s6,a5,6d0 <play_music_with_controls+0x1c4>
     684:	00000513          	li	a0,0
     688:	03205263          	blez	s2,6ac <play_music_with_controls+0x1a0>
     68c:	00141513          	slli	a0,s0,0x1
     690:	00850533          	add	a0,a0,s0
     694:	00351513          	slli	a0,a0,0x3
     698:	00850533          	add	a0,a0,s0
     69c:	00090593          	mv	a1,s2
     6a0:	00251513          	slli	a0,a0,0x2
     6a4:	00002097          	auipc	ra,0x2
     6a8:	e90080e7          	jalr	-368(ra) # 2534 <__divsi3>
     6ac:	00c12603          	lw	a2,12(sp)
     6b0:	2f8c0593          	addi	a1,s8,760
     6b4:	00098463          	beqz	s3,6bc <play_music_with_controls+0x1b0>
     6b8:	01812583          	lw	a1,24(sp)
     6bc:	00000097          	auipc	ra,0x0
     6c0:	ba0080e7          	jalr	-1120(ra) # 25c <update_player_ui>
     6c4:	00000b13          	li	s6,0
     6c8:	00002097          	auipc	ra,0x2
     6cc:	340080e7          	jalr	832(ra) # 2a08 <display_refresh>
     6d0:	01412783          	lw	a5,20(sp)
     6d4:	0007aa03          	lw	s4,0(a5)
     6d8:	020a7793          	andi	a5,s4,32
     6dc:	06078863          	beqz	a5,74c <play_music_with_controls+0x240>
     6e0:	ffffe7b7          	lui	a5,0xffffe
     6e4:	00f40433          	add	s0,s0,a5
     6e8:	fff44793          	not	a5,s0
     6ec:	41f7d793          	srai	a5,a5,0x1f
     6f0:	01012503          	lw	a0,16(sp)
     6f4:	00f47433          	and	s0,s0,a5
     6f8:	00000613          	li	a2,0
     6fc:	00040593          	mv	a1,s0
     700:	00003097          	auipc	ra,0x3
     704:	aac080e7          	jalr	-1364(ra) # 31ac <fl_fseek>
     708:	00000513          	li	a0,0
     70c:	03205263          	blez	s2,730 <play_music_with_controls+0x224>
     710:	00141513          	slli	a0,s0,0x1
     714:	00850533          	add	a0,a0,s0
     718:	00351513          	slli	a0,a0,0x3
     71c:	00850533          	add	a0,a0,s0
     720:	00090593          	mv	a1,s2
     724:	00251513          	slli	a0,a0,0x2
     728:	00002097          	auipc	ra,0x2
     72c:	e0c080e7          	jalr	-500(ra) # 2534 <__divsi3>
     730:	00c12603          	lw	a2,12(sp)
     734:	000065b7          	lui	a1,0x6
     738:	17c58593          	addi	a1,a1,380 # 617c <LEDS+0x34>
     73c:	00000097          	auipc	ra,0x0
     740:	b20080e7          	jalr	-1248(ra) # 25c <update_player_ui>
     744:	00002097          	auipc	ra,0x2
     748:	2c4080e7          	jalr	708(ra) # 2a08 <display_refresh>
     74c:	040a7793          	andi	a5,s4,64
     750:	06078463          	beqz	a5,7b8 <play_music_with_controls+0x2ac>
     754:	000027b7          	lui	a5,0x2
     758:	00f40433          	add	s0,s0,a5
     75c:	27245e63          	bge	s0,s2,9d8 <play_music_with_controls+0x4cc>
     760:	01012503          	lw	a0,16(sp)
     764:	00000613          	li	a2,0
     768:	00040593          	mv	a1,s0
     76c:	00003097          	auipc	ra,0x3
     770:	a40080e7          	jalr	-1472(ra) # 31ac <fl_fseek>
     774:	00000513          	li	a0,0
     778:	03205263          	blez	s2,79c <play_music_with_controls+0x290>
     77c:	00141513          	slli	a0,s0,0x1
     780:	00850533          	add	a0,a0,s0
     784:	00351513          	slli	a0,a0,0x3
     788:	00850533          	add	a0,a0,s0
     78c:	00090593          	mv	a1,s2
     790:	00251513          	slli	a0,a0,0x2
     794:	00002097          	auipc	ra,0x2
     798:	da0080e7          	jalr	-608(ra) # 2534 <__divsi3>
     79c:	00c12603          	lw	a2,12(sp)
     7a0:	000065b7          	lui	a1,0x6
     7a4:	18858593          	addi	a1,a1,392 # 6188 <LEDS+0x40>
     7a8:	00000097          	auipc	ra,0x0
     7ac:	ab4080e7          	jalr	-1356(ra) # 25c <update_player_ui>
     7b0:	00002097          	auipc	ra,0x2
     7b4:	258080e7          	jalr	600(ra) # 2a08 <display_refresh>
     7b8:	fff4c493          	not	s1,s1
     7bc:	0144f4b3          	and	s1,s1,s4
     7c0:	0024f793          	andi	a5,s1,2
     7c4:	10078e63          	beqz	a5,8e0 <play_music_with_controls+0x3d4>
     7c8:	00000097          	auipc	ra,0x0
     7cc:	994080e7          	jalr	-1644(ra) # 15c <play_click_noise>
     7d0:	00000413          	li	s0,0
     7d4:	01012503          	lw	a0,16(sp)
     7d8:	00005097          	auipc	ra,0x5
     7dc:	e64080e7          	jalr	-412(ra) # 563c <fl_fclose>
     7e0:	00000097          	auipc	ra,0x0
     7e4:	900080e7          	jalr	-1792(ra) # e0 <clear_audio>
     7e8:	000067b7          	lui	a5,0x6
     7ec:	1487a783          	lw	a5,328(a5) # 6148 <LEDS>
     7f0:	0007a023          	sw	zero,0(a5)
     7f4:	45c12083          	lw	ra,1116(sp)
     7f8:	00040513          	mv	a0,s0
     7fc:	45812403          	lw	s0,1112(sp)
     800:	45412483          	lw	s1,1108(sp)
     804:	45012903          	lw	s2,1104(sp)
     808:	44c12983          	lw	s3,1100(sp)
     80c:	44812a03          	lw	s4,1096(sp)
     810:	44412a83          	lw	s5,1092(sp)
     814:	44012b03          	lw	s6,1088(sp)
     818:	43c12b83          	lw	s7,1084(sp)
     81c:	43812c03          	lw	s8,1080(sp)
     820:	43412c83          	lw	s9,1076(sp)
     824:	43012d03          	lw	s10,1072(sp)
     828:	42c12d83          	lw	s11,1068(sp)
     82c:	46010113          	addi	sp,sp,1120
     830:	00008067          	ret
     834:	03200593          	li	a1,50
     838:	01e00513          	li	a0,30
     83c:	00002097          	auipc	ra,0x2
     840:	05c080e7          	jalr	92(ra) # 2898 <display_set_cursor>
     844:	00000593          	li	a1,0
     848:	0ff00513          	li	a0,255
     84c:	00002097          	auipc	ra,0x2
     850:	060080e7          	jalr	96(ra) # 28ac <display_set_front_back_color>
     854:	00006537          	lui	a0,0x6
     858:	16450513          	addi	a0,a0,356 # 6164 <LEDS+0x1c>
     85c:	00002097          	auipc	ra,0x2
     860:	318080e7          	jalr	792(ra) # 2b74 <printf>
     864:	d6dff06f          	j	5d0 <play_music_with_controls+0xc4>
     868:	01012683          	lw	a3,16(sp)
     86c:	20000613          	li	a2,512
     870:	00100593          	li	a1,1
     874:	000b8513          	mv	a0,s7
     878:	00005097          	auipc	ra,0x5
     87c:	ea0080e7          	jalr	-352(ra) # 5718 <fl_fread>
     880:	1ff00793          	li	a5,511
     884:	00050d93          	mv	s11,a0
     888:	00a7ce63          	blt	a5,a0,8a4 <play_music_with_controls+0x398>
     88c:	00050793          	mv	a5,a0
     890:	20000713          	li	a4,512
     894:	00fb86b3          	add	a3,s7,a5
     898:	00068023          	sb	zero,0(a3)
     89c:	00178793          	addi	a5,a5,1
     8a0:	fee79ae3          	bne	a5,a4,894 <play_music_with_controls+0x388>
     8a4:	20000593          	li	a1,512
     8a8:	000b8513          	mv	a0,s7
     8ac:	00000097          	auipc	ra,0x0
     8b0:	bbc080e7          	jalr	-1092(ra) # 468 <update_led_dance>
     8b4:	20000613          	li	a2,512
     8b8:	000b8593          	mv	a1,s7
     8bc:	000a0513          	mv	a0,s4
     8c0:	fffff097          	auipc	ra,0xfffff
     8c4:	7fc080e7          	jalr	2044(ra) # bc <memcpy_custom>
     8c8:	000d2783          	lw	a5,0(s10)
     8cc:	fefa0ee3          	beq	s4,a5,8c8 <play_music_with_controls+0x3bc>
     8d0:	1ff00793          	li	a5,511
     8d4:	11b7d263          	bge	a5,s11,9d8 <play_music_with_controls+0x4cc>
     8d8:	01b40433          	add	s0,s0,s11
     8dc:	d9dff06f          	j	678 <play_music_with_controls+0x16c>
     8e0:	0084f793          	andi	a5,s1,8
     8e4:	0e079e63          	bnez	a5,9e0 <play_music_with_controls+0x4d4>
     8e8:	0104f493          	andi	s1,s1,16
     8ec:	0e049663          	bnez	s1,9d8 <play_music_with_controls+0x4cc>
     8f0:	004a7493          	andi	s1,s4,4
     8f4:	08048063          	beqz	s1,974 <play_music_with_controls+0x468>
     8f8:	001a8493          	addi	s1,s5,1
     8fc:	01e00793          	li	a5,30
     900:	06f49063          	bne	s1,a5,960 <play_music_with_controls+0x454>
     904:	00000097          	auipc	ra,0x0
     908:	858080e7          	jalr	-1960(ra) # 15c <play_click_noise>
     90c:	01012503          	lw	a0,16(sp)
     910:	00000613          	li	a2,0
     914:	00000593          	li	a1,0
     918:	00003097          	auipc	ra,0x3
     91c:	894080e7          	jalr	-1900(ra) # 31ac <fl_fseek>
     920:	00c12603          	lw	a2,12(sp)
     924:	000065b7          	lui	a1,0x6
     928:	19058593          	addi	a1,a1,400 # 6190 <LEDS+0x48>
     92c:	00000513          	li	a0,0
     930:	00000097          	auipc	ra,0x0
     934:	92c080e7          	jalr	-1748(ra) # 25c <update_player_ui>
     938:	00002097          	auipc	ra,0x2
     93c:	0d0080e7          	jalr	208(ra) # 2a08 <display_refresh>
     940:	fffff097          	auipc	ra,0xfffff
     944:	7a0080e7          	jalr	1952(ra) # e0 <clear_audio>
     948:	138ca783          	lw	a5,312(s9)
     94c:	0007a403          	lw	s0,0(a5)
     950:	00447413          	andi	s0,s0,4
     954:	00041c63          	bnez	s0,96c <play_music_with_controls+0x460>
     958:	00000493          	li	s1,0
     95c:	00000993          	li	s3,0
     960:	00048a93          	mv	s5,s1
     964:	000a0493          	mv	s1,s4
     968:	ce5ff06f          	j	64c <play_music_with_controls+0x140>
     96c:	00000013          	nop
     970:	fddff06f          	j	94c <play_music_with_controls+0x440>
     974:	fffa8a93          	addi	s5,s5,-1
     978:	01c00793          	li	a5,28
     97c:	ff57e2e3          	bltu	a5,s5,960 <play_music_with_controls+0x454>
     980:	0019ca93          	xori	s5,s3,1
     984:	00000513          	li	a0,0
     988:	03205263          	blez	s2,9ac <play_music_with_controls+0x4a0>
     98c:	00141513          	slli	a0,s0,0x1
     990:	00850533          	add	a0,a0,s0
     994:	00351513          	slli	a0,a0,0x3
     998:	00850533          	add	a0,a0,s0
     99c:	00090593          	mv	a1,s2
     9a0:	00251513          	slli	a0,a0,0x2
     9a4:	00002097          	auipc	ra,0x2
     9a8:	b90080e7          	jalr	-1136(ra) # 2534 <__divsi3>
     9ac:	00100793          	li	a5,1
     9b0:	00c12603          	lw	a2,12(sp)
     9b4:	2f8c0593          	addi	a1,s8,760
     9b8:	00f98463          	beq	s3,a5,9c0 <play_music_with_controls+0x4b4>
     9bc:	01812583          	lw	a1,24(sp)
     9c0:	00000097          	auipc	ra,0x0
     9c4:	89c080e7          	jalr	-1892(ra) # 25c <update_player_ui>
     9c8:	000a8993          	mv	s3,s5
     9cc:	00002097          	auipc	ra,0x2
     9d0:	03c080e7          	jalr	60(ra) # 2a08 <display_refresh>
     9d4:	f8dff06f          	j	960 <play_music_with_controls+0x454>
     9d8:	00100413          	li	s0,1
     9dc:	df9ff06f          	j	7d4 <play_music_with_controls+0x2c8>
     9e0:	fff00413          	li	s0,-1
     9e4:	df1ff06f          	j	7d4 <play_music_with_controls+0x2c8>

000009e8 <play_dj_mode>:
     9e8:	81010113          	addi	sp,sp,-2032
     9ec:	7e112623          	sw	ra,2028(sp)
     9f0:	7e912223          	sw	s1,2020(sp)
     9f4:	7f212023          	sw	s2,2016(sp)
     9f8:	7e812423          	sw	s0,2024(sp)
     9fc:	7d312e23          	sw	s3,2012(sp)
     a00:	7d412c23          	sw	s4,2008(sp)
     a04:	7d512a23          	sw	s5,2004(sp)
     a08:	7d612823          	sw	s6,2000(sp)
     a0c:	7d712623          	sw	s7,1996(sp)
     a10:	7d812423          	sw	s8,1992(sp)
     a14:	7d912223          	sw	s9,1988(sp)
     a18:	7da12023          	sw	s10,1984(sp)
     a1c:	7bb12e23          	sw	s11,1980(sp)
     a20:	f9010113          	addi	sp,sp,-112
     a24:	00b12623          	sw	a1,12(sp)
     a28:	00c12a23          	sw	a2,20(sp)
     a2c:	00050913          	mv	s2,a0
     a30:	00002097          	auipc	ra,0x2
     a34:	e5c080e7          	jalr	-420(ra) # 288c <display_framebuffer>
     a38:	00004637          	lui	a2,0x4
     a3c:	00000593          	li	a1,0
     a40:	00002097          	auipc	ra,0x2
     a44:	ba8080e7          	jalr	-1112(ra) # 25e8 <memset>
     a48:	000065b7          	lui	a1,0x6
     a4c:	15c58593          	addi	a1,a1,348 # 615c <LEDS+0x14>
     a50:	02c10513          	addi	a0,sp,44
     a54:	00002097          	auipc	ra,0x2
     a58:	c58080e7          	jalr	-936(ra) # 26ac <strcpy>
     a5c:	00c12583          	lw	a1,12(sp)
     a60:	02c10513          	addi	a0,sp,44
     a64:	000064b7          	lui	s1,0x6
     a68:	fffff097          	auipc	ra,0xfffff
     a6c:	624080e7          	jalr	1572(ra) # 8c <strcat_custom>
     a70:	14c48593          	addi	a1,s1,332 # 614c <LEDS+0x4>
     a74:	02c10513          	addi	a0,sp,44
     a78:	00005097          	auipc	ra,0x5
     a7c:	2a4080e7          	jalr	676(ra) # 5d1c <fl_fopen>
     a80:	14050863          	beqz	a0,bd0 <play_dj_mode+0x1e8>
     a84:	00050413          	mv	s0,a0
     a88:	00002097          	auipc	ra,0x2
     a8c:	e04080e7          	jalr	-508(ra) # 288c <display_framebuffer>
     a90:	00040693          	mv	a3,s0
     a94:	00004637          	lui	a2,0x4
     a98:	00100593          	li	a1,1
     a9c:	00005097          	auipc	ra,0x5
     aa0:	c7c080e7          	jalr	-900(ra) # 5718 <fl_fread>
     aa4:	00040513          	mv	a0,s0
     aa8:	00005097          	auipc	ra,0x5
     aac:	b94080e7          	jalr	-1132(ra) # 563c <fl_fclose>
     ab0:	14c48593          	addi	a1,s1,332
     ab4:	00090513          	mv	a0,s2
     ab8:	00005097          	auipc	ra,0x5
     abc:	264080e7          	jalr	612(ra) # 5d1c <fl_fopen>
     ac0:	00a12823          	sw	a0,16(sp)
     ac4:	20050e63          	beqz	a0,ce0 <play_dj_mode+0x2f8>
     ac8:	07600593          	li	a1,118
     acc:	00a00513          	li	a0,10
     ad0:	00002097          	auipc	ra,0x2
     ad4:	dc8080e7          	jalr	-568(ra) # 2898 <display_set_cursor>
     ad8:	00000593          	li	a1,0
     adc:	0ff00513          	li	a0,255
     ae0:	00002097          	auipc	ra,0x2
     ae4:	dcc080e7          	jalr	-564(ra) # 28ac <display_set_front_back_color>
     ae8:	00c12603          	lw	a2,12(sp)
     aec:	000065b7          	lui	a1,0x6
     af0:	1b458593          	addi	a1,a1,436 # 61b4 <LEDS+0x6c>
     af4:	00000513          	li	a0,0
     af8:	fffff097          	auipc	ra,0xfffff
     afc:	764080e7          	jalr	1892(ra) # 25c <update_player_ui>
     b00:	00002097          	auipc	ra,0x2
     b04:	f08080e7          	jalr	-248(ra) # 2a08 <display_refresh>
     b08:	000067b7          	lui	a5,0x6
     b0c:	1387a783          	lw	a5,312(a5) # 6138 <BUTTONS>
     b10:	00000493          	li	s1,0
     b14:	00000913          	li	s2,0
     b18:	0007a403          	lw	s0,0(a5)
     b1c:	00f12c23          	sw	a5,24(sp)
     b20:	000067b7          	lui	a5,0x6
     b24:	1307ac83          	lw	s9,304(a5) # 6130 <AUDIO>
     b28:	000067b7          	lui	a5,0x6
     b2c:	1cc78793          	addi	a5,a5,460 # 61cc <LEDS+0x84>
     b30:	00000d13          	li	s10,0
     b34:	00006bb7          	lui	s7,0x6
     b38:	00006c37          	lui	s8,0x6
     b3c:	00f12e23          	sw	a5,28(sp)
     b40:	01812783          	lw	a5,24(sp)
     b44:	000caa83          	lw	s5,0(s9)
     b48:	0007a983          	lw	s3,0(a5)
     b4c:	0049fd93          	andi	s11,s3,4
     b50:	0a0d8a63          	beqz	s11,c04 <play_dj_mode+0x21c>
     b54:	20000593          	li	a1,512
     b58:	22010513          	addi	a0,sp,544
     b5c:	00000097          	auipc	ra,0x0
     b60:	90c080e7          	jalr	-1780(ra) # 468 <update_led_dance>
     b64:	20000613          	li	a2,512
     b68:	22010593          	addi	a1,sp,544
     b6c:	000a8513          	mv	a0,s5
     b70:	fffff097          	auipc	ra,0xfffff
     b74:	54c080e7          	jalr	1356(ra) # bc <memcpy_custom>
     b78:	000ca783          	lw	a5,0(s9)
     b7c:	fefa8ee3          	beq	s5,a5,b78 <play_dj_mode+0x190>
     b80:	00190913          	addi	s2,s2,1
     b84:	00a00793          	li	a5,10
     b88:	fb27dce3          	bge	a5,s2,b40 <play_dj_mode+0x158>
     b8c:	001d1513          	slli	a0,s10,0x1
     b90:	01a50533          	add	a0,a0,s10
     b94:	01412583          	lw	a1,20(sp)
     b98:	00351513          	slli	a0,a0,0x3
     b9c:	01a50533          	add	a0,a0,s10
     ba0:	00251513          	slli	a0,a0,0x2
     ba4:	00002097          	auipc	ra,0x2
     ba8:	990080e7          	jalr	-1648(ra) # 2534 <__divsi3>
     bac:	00c12603          	lw	a2,12(sp)
     bb0:	000065b7          	lui	a1,0x6
     bb4:	1c058593          	addi	a1,a1,448 # 61c0 <LEDS+0x78>
     bb8:	fffff097          	auipc	ra,0xfffff
     bbc:	6a4080e7          	jalr	1700(ra) # 25c <update_player_ui>
     bc0:	00000913          	li	s2,0
     bc4:	00002097          	auipc	ra,0x2
     bc8:	e44080e7          	jalr	-444(ra) # 2a08 <display_refresh>
     bcc:	f75ff06f          	j	b40 <play_dj_mode+0x158>
     bd0:	00000593          	li	a1,0
     bd4:	0ff00513          	li	a0,255
     bd8:	00002097          	auipc	ra,0x2
     bdc:	cd4080e7          	jalr	-812(ra) # 28ac <display_set_front_back_color>
     be0:	03200593          	li	a1,50
     be4:	02300513          	li	a0,35
     be8:	00002097          	auipc	ra,0x2
     bec:	cb0080e7          	jalr	-848(ra) # 2898 <display_set_cursor>
     bf0:	00006537          	lui	a0,0x6
     bf4:	1ac50513          	addi	a0,a0,428 # 61ac <LEDS+0x64>
     bf8:	00002097          	auipc	ra,0x2
     bfc:	f7c080e7          	jalr	-132(ra) # 2b74 <printf>
     c00:	eb1ff06f          	j	ab0 <play_dj_mode+0xc8>
     c04:	00100793          	li	a5,1
     c08:	40000a13          	li	s4,1024
     c0c:	00f48a63          	beq	s1,a5,c20 <play_dj_mode+0x238>
     c10:	fff00793          	li	a5,-1
     c14:	10000a13          	li	s4,256
     c18:	00f48463          	beq	s1,a5,c20 <play_dj_mode+0x238>
     c1c:	20000a13          	li	s4,512
     c20:	01012683          	lw	a3,16(sp)
     c24:	000a0613          	mv	a2,s4
     c28:	00100593          	li	a1,1
     c2c:	42010513          	addi	a0,sp,1056
     c30:	00005097          	auipc	ra,0x5
     c34:	ae8080e7          	jalr	-1304(ra) # 5718 <fl_fread>
     c38:	00050b13          	mv	s6,a0
     c3c:	42010793          	addi	a5,sp,1056
     c40:	03455063          	bge	a0,s4,c60 <play_dj_mode+0x278>
     c44:	01012503          	lw	a0,16(sp)
     c48:	00000613          	li	a2,0
     c4c:	00000593          	li	a1,0
     c50:	00002097          	auipc	ra,0x2
     c54:	55c080e7          	jalr	1372(ra) # 31ac <fl_fseek>
     c58:	00000d13          	li	s10,0
     c5c:	ee5ff06f          	j	b40 <play_dj_mode+0x158>
     c60:	22010a13          	addi	s4,sp,544
     c64:	0a049e63          	bnez	s1,d20 <play_dj_mode+0x338>
     c68:	20000613          	li	a2,512
     c6c:	00078593          	mv	a1,a5
     c70:	000a0513          	mv	a0,s4
     c74:	fffff097          	auipc	ra,0xfffff
     c78:	448080e7          	jalr	1096(ra) # bc <memcpy_custom>
     c7c:	20000593          	li	a1,512
     c80:	000a0513          	mv	a0,s4
     c84:	fffff097          	auipc	ra,0xfffff
     c88:	7e4080e7          	jalr	2020(ra) # 468 <update_led_dance>
     c8c:	20000613          	li	a2,512
     c90:	000a0593          	mv	a1,s4
     c94:	000a8513          	mv	a0,s5
     c98:	fffff097          	auipc	ra,0xfffff
     c9c:	424080e7          	jalr	1060(ra) # bc <memcpy_custom>
     ca0:	000ca783          	lw	a5,0(s9)
     ca4:	fefa8ee3          	beq	s5,a5,ca0 <play_dj_mode+0x2b8>
     ca8:	fff44413          	not	s0,s0
     cac:	01347433          	and	s0,s0,s3
     cb0:	00247793          	andi	a5,s0,2
     cb4:	0a078e63          	beqz	a5,d70 <play_dj_mode+0x388>
     cb8:	fffff097          	auipc	ra,0xfffff
     cbc:	4a4080e7          	jalr	1188(ra) # 15c <play_click_noise>
     cc0:	01012503          	lw	a0,16(sp)
     cc4:	00005097          	auipc	ra,0x5
     cc8:	978080e7          	jalr	-1672(ra) # 563c <fl_fclose>
     ccc:	fffff097          	auipc	ra,0xfffff
     cd0:	414080e7          	jalr	1044(ra) # e0 <clear_audio>
     cd4:	000067b7          	lui	a5,0x6
     cd8:	1487a783          	lw	a5,328(a5) # 6148 <LEDS>
     cdc:	0007a023          	sw	zero,0(a5)
     ce0:	07010113          	addi	sp,sp,112
     ce4:	7ec12083          	lw	ra,2028(sp)
     ce8:	7e812403          	lw	s0,2024(sp)
     cec:	7e412483          	lw	s1,2020(sp)
     cf0:	7e012903          	lw	s2,2016(sp)
     cf4:	7dc12983          	lw	s3,2012(sp)
     cf8:	7d812a03          	lw	s4,2008(sp)
     cfc:	7d412a83          	lw	s5,2004(sp)
     d00:	7d012b03          	lw	s6,2000(sp)
     d04:	7cc12b83          	lw	s7,1996(sp)
     d08:	7c812c03          	lw	s8,1992(sp)
     d0c:	7c412c83          	lw	s9,1988(sp)
     d10:	7c012d03          	lw	s10,1984(sp)
     d14:	7bc12d83          	lw	s11,1980(sp)
     d18:	7f010113          	addi	sp,sp,2032
     d1c:	00008067          	ret
     d20:	00100693          	li	a3,1
     d24:	000a0713          	mv	a4,s4
     d28:	10000613          	li	a2,256
     d2c:	02d49263          	bne	s1,a3,d50 <play_dj_mode+0x368>
     d30:	20000713          	li	a4,512
     d34:	0007c603          	lbu	a2,0(a5)
     d38:	01ba06b3          	add	a3,s4,s11
     d3c:	001d8d93          	addi	s11,s11,1
     d40:	00c68023          	sb	a2,0(a3)
     d44:	00278793          	addi	a5,a5,2
     d48:	feed96e3          	bne	s11,a4,d34 <play_dj_mode+0x34c>
     d4c:	f31ff06f          	j	c7c <play_dj_mode+0x294>
     d50:	01b786b3          	add	a3,a5,s11
     d54:	0006c683          	lbu	a3,0(a3)
     d58:	001d8d93          	addi	s11,s11,1
     d5c:	00270713          	addi	a4,a4,2
     d60:	fed70f23          	sb	a3,-2(a4)
     d64:	fed70fa3          	sb	a3,-1(a4)
     d68:	fecd94e3          	bne	s11,a2,d50 <play_dj_mode+0x368>
     d6c:	f11ff06f          	j	c7c <play_dj_mode+0x294>
     d70:	00847793          	andi	a5,s0,8
     d74:	016d0d33          	add	s10,s10,s6
     d78:	00078463          	beqz	a5,d80 <play_dj_mode+0x398>
     d7c:	00100493          	li	s1,1
     d80:	01047793          	andi	a5,s0,16
     d84:	00078463          	beqz	a5,d8c <play_dj_mode+0x3a4>
     d88:	fff00493          	li	s1,-1
     d8c:	04047413          	andi	s0,s0,64
     d90:	00143413          	seqz	s0,s0
     d94:	40800433          	neg	s0,s0
     d98:	0209f793          	andi	a5,s3,32
     d9c:	0084f4b3          	and	s1,s1,s0
     da0:	06078263          	beqz	a5,e04 <play_dj_mode+0x41c>
     da4:	ffffc7b7          	lui	a5,0xffffc
     da8:	00fd0d33          	add	s10,s10,a5
     dac:	fffd4793          	not	a5,s10
     db0:	41f7d793          	srai	a5,a5,0x1f
     db4:	01012503          	lw	a0,16(sp)
     db8:	00fd7d33          	and	s10,s10,a5
     dbc:	00000613          	li	a2,0
     dc0:	000d0593          	mv	a1,s10
     dc4:	00002097          	auipc	ra,0x2
     dc8:	3e8080e7          	jalr	1000(ra) # 31ac <fl_fseek>
     dcc:	001d1513          	slli	a0,s10,0x1
     dd0:	01a50533          	add	a0,a0,s10
     dd4:	01412583          	lw	a1,20(sp)
     dd8:	00351513          	slli	a0,a0,0x3
     ddc:	01a50533          	add	a0,a0,s10
     de0:	00251513          	slli	a0,a0,0x2
     de4:	00001097          	auipc	ra,0x1
     de8:	750080e7          	jalr	1872(ra) # 2534 <__divsi3>
     dec:	00c12603          	lw	a2,12(sp)
     df0:	01c12583          	lw	a1,28(sp)
     df4:	fffff097          	auipc	ra,0xfffff
     df8:	468080e7          	jalr	1128(ra) # 25c <update_player_ui>
     dfc:	00002097          	auipc	ra,0x2
     e00:	c0c080e7          	jalr	-1012(ra) # 2a08 <display_refresh>
     e04:	00190913          	addi	s2,s2,1
     e08:	01400793          	li	a5,20
     e0c:	00098413          	mv	s0,s3
     e10:	d327d8e3          	bge	a5,s2,b40 <play_dj_mode+0x158>
     e14:	01412783          	lw	a5,20(sp)
     e18:	00000513          	li	a0,0
     e1c:	02f05263          	blez	a5,e40 <play_dj_mode+0x458>
     e20:	001d1513          	slli	a0,s10,0x1
     e24:	01a50533          	add	a0,a0,s10
     e28:	00351513          	slli	a0,a0,0x3
     e2c:	01a50533          	add	a0,a0,s10
     e30:	00078593          	mv	a1,a5
     e34:	00251513          	slli	a0,a0,0x2
     e38:	00001097          	auipc	ra,0x1
     e3c:	6fc080e7          	jalr	1788(ra) # 2534 <__divsi3>
     e40:	00100793          	li	a5,1
     e44:	198b8593          	addi	a1,s7,408 # 6198 <LEDS+0x50>
     e48:	00f48c63          	beq	s1,a5,e60 <play_dj_mode+0x478>
     e4c:	fff00793          	li	a5,-1
     e50:	2f8c0593          	addi	a1,s8,760 # 62f8 <LEDS+0x1b0>
     e54:	00f49663          	bne	s1,a5,e60 <play_dj_mode+0x478>
     e58:	000065b7          	lui	a1,0x6
     e5c:	1a058593          	addi	a1,a1,416 # 61a0 <LEDS+0x58>
     e60:	00c12603          	lw	a2,12(sp)
     e64:	00000913          	li	s2,0
     e68:	00098413          	mv	s0,s3
     e6c:	fffff097          	auipc	ra,0xfffff
     e70:	3f0080e7          	jalr	1008(ra) # 25c <update_player_ui>
     e74:	00002097          	auipc	ra,0x2
     e78:	b94080e7          	jalr	-1132(ra) # 2a08 <display_refresh>
     e7c:	cc5ff06f          	j	b40 <play_dj_mode+0x158>

00000e80 <view_image_file>:
     e80:	ff010113          	addi	sp,sp,-16
     e84:	00112623          	sw	ra,12(sp)
     e88:	00812423          	sw	s0,8(sp)
     e8c:	00050413          	mv	s0,a0
     e90:	00002097          	auipc	ra,0x2
     e94:	9fc080e7          	jalr	-1540(ra) # 288c <display_framebuffer>
     e98:	00000593          	li	a1,0
     e9c:	00004637          	lui	a2,0x4
     ea0:	00001097          	auipc	ra,0x1
     ea4:	748080e7          	jalr	1864(ra) # 25e8 <memset>
     ea8:	00002097          	auipc	ra,0x2
     eac:	b60080e7          	jalr	-1184(ra) # 2a08 <display_refresh>
     eb0:	000065b7          	lui	a1,0x6
     eb4:	14c58593          	addi	a1,a1,332 # 614c <LEDS+0x4>
     eb8:	00040513          	mv	a0,s0
     ebc:	00005097          	auipc	ra,0x5
     ec0:	e60080e7          	jalr	-416(ra) # 5d1c <fl_fopen>
     ec4:	0a050263          	beqz	a0,f68 <view_image_file+0xe8>
     ec8:	00050413          	mv	s0,a0
     ecc:	00002097          	auipc	ra,0x2
     ed0:	9c0080e7          	jalr	-1600(ra) # 288c <display_framebuffer>
     ed4:	00040693          	mv	a3,s0
     ed8:	00004637          	lui	a2,0x4
     edc:	00100593          	li	a1,1
     ee0:	00005097          	auipc	ra,0x5
     ee4:	838080e7          	jalr	-1992(ra) # 5718 <fl_fread>
     ee8:	00040513          	mv	a0,s0
     eec:	00004097          	auipc	ra,0x4
     ef0:	750080e7          	jalr	1872(ra) # 563c <fl_fclose>
     ef4:	00002097          	auipc	ra,0x2
     ef8:	b14080e7          	jalr	-1260(ra) # 2a08 <display_refresh>
     efc:	000066b7          	lui	a3,0x6
     f00:	1386a783          	lw	a5,312(a3) # 6138 <BUTTONS>
     f04:	0007a703          	lw	a4,0(a5) # ffffc000 <__stacktop+0xfffec000>
     f08:	000027b7          	lui	a5,0x2
     f0c:	71078793          	addi	a5,a5,1808 # 2710 <oled_init_mode+0x24>
     f10:	00000013          	nop
     f14:	fff78793          	addi	a5,a5,-1
     f18:	fe079ce3          	bnez	a5,f10 <view_image_file+0x90>
     f1c:	1386a683          	lw	a3,312(a3)
     f20:	fff74793          	not	a5,a4
     f24:	0006a703          	lw	a4,0(a3)
     f28:	00e7f7b3          	and	a5,a5,a4
     f2c:	0067f793          	andi	a5,a5,6
     f30:	fe0788e3          	beqz	a5,f20 <view_image_file+0xa0>
     f34:	fffff097          	auipc	ra,0xfffff
     f38:	228080e7          	jalr	552(ra) # 15c <play_click_noise>
     f3c:	00002097          	auipc	ra,0x2
     f40:	950080e7          	jalr	-1712(ra) # 288c <display_framebuffer>
     f44:	00004637          	lui	a2,0x4
     f48:	00000593          	li	a1,0
     f4c:	00001097          	auipc	ra,0x1
     f50:	69c080e7          	jalr	1692(ra) # 25e8 <memset>
     f54:	00812403          	lw	s0,8(sp)
     f58:	00c12083          	lw	ra,12(sp)
     f5c:	01010113          	addi	sp,sp,16
     f60:	00002317          	auipc	t1,0x2
     f64:	aa830067          	jr	-1368(t1) # 2a08 <display_refresh>
     f68:	00c12083          	lw	ra,12(sp)
     f6c:	00812403          	lw	s0,8(sp)
     f70:	01010113          	addi	sp,sp,16
     f74:	00008067          	ret

00000f78 <scan_files>:
     f78:	fd010113          	addi	sp,sp,-48
     f7c:	02912223          	sw	s1,36(sp)
     f80:	000064b7          	lui	s1,0x6
     f84:	02812423          	sw	s0,40(sp)
     f88:	00050593          	mv	a1,a0
     f8c:	00006437          	lui	s0,0x6
     f90:	51048513          	addi	a0,s1,1296 # 6510 <current_path>
     f94:	02112623          	sw	ra,44(sp)
     f98:	03212023          	sw	s2,32(sp)
     f9c:	01312e23          	sw	s3,28(sp)
     fa0:	01412c23          	sw	s4,24(sp)
     fa4:	01512a23          	sw	s5,20(sp)
     fa8:	01612823          	sw	s6,16(sp)
     fac:	01712623          	sw	s7,12(sp)
     fb0:	70042423          	sw	zero,1800(s0) # 6708 <n_items>
     fb4:	fffff097          	auipc	ra,0xfffff
     fb8:	068080e7          	jalr	104(ra) # 1c <strcmp>
     fbc:	06050e63          	beqz	a0,1038 <scan_files+0xc0>
     fc0:	00007937          	lui	s2,0x7
     fc4:	06400613          	li	a2,100
     fc8:	00000593          	li	a1,0
     fcc:	85490513          	addi	a0,s2,-1964 # 6854 <files>
     fd0:	00001097          	auipc	ra,0x1
     fd4:	618080e7          	jalr	1560(ra) # 25e8 <memset>
     fd8:	70842783          	lw	a5,1800(s0)
     fdc:	85490913          	addi	s2,s2,-1964
     fe0:	000065b7          	lui	a1,0x6
     fe4:	00379513          	slli	a0,a5,0x3
     fe8:	40f50533          	sub	a0,a0,a5
     fec:	00251513          	slli	a0,a0,0x2
     ff0:	40f50533          	sub	a0,a0,a5
     ff4:	00251513          	slli	a0,a0,0x2
     ff8:	00a90533          	add	a0,s2,a0
     ffc:	1d458593          	addi	a1,a1,468 # 61d4 <LEDS+0x8c>
    1000:	00001097          	auipc	ra,0x1
    1004:	6ac080e7          	jalr	1708(ra) # 26ac <strcpy>
    1008:	70842703          	lw	a4,1800(s0)
    100c:	00371793          	slli	a5,a4,0x3
    1010:	40e787b3          	sub	a5,a5,a4
    1014:	00279793          	slli	a5,a5,0x2
    1018:	40e787b3          	sub	a5,a5,a4
    101c:	00279793          	slli	a5,a5,0x2
    1020:	00f90933          	add	s2,s2,a5
    1024:	00100793          	li	a5,1
    1028:	00f70733          	add	a4,a4,a5
    102c:	06092223          	sw	zero,100(s2)
    1030:	06f92423          	sw	a5,104(s2)
    1034:	70e42423          	sw	a4,1800(s0)
    1038:	000079b7          	lui	s3,0x7
    103c:	84898593          	addi	a1,s3,-1976 # 6848 <dirstat.1>
    1040:	51048513          	addi	a0,s1,1296
    1044:	00003097          	auipc	ra,0x3
    1048:	678080e7          	jalr	1656(ra) # 46bc <fl_opendir>
    104c:	14050063          	beqz	a0,118c <scan_files+0x214>
    1050:	00006937          	lui	s2,0x6
    1054:	000067b7          	lui	a5,0x6
    1058:	000074b7          	lui	s1,0x7
    105c:	1d878b93          	addi	s7,a5,472 # 61d8 <LEDS+0x90>
    1060:	85448493          	addi	s1,s1,-1964 # 6854 <files>
    1064:	73890a13          	addi	s4,s2,1848 # 6738 <dirent.0>
    1068:	73890593          	addi	a1,s2,1848
    106c:	84898513          	addi	a0,s3,-1976
    1070:	00004097          	auipc	ra,0x4
    1074:	d18080e7          	jalr	-744(ra) # 4d88 <fl_readdir>
    1078:	00050a93          	mv	s5,a0
    107c:	00051863          	bnez	a0,108c <scan_files+0x114>
    1080:	70842b03          	lw	s6,1800(s0)
    1084:	03f00793          	li	a5,63
    1088:	0367dc63          	bge	a5,s6,10c0 <scan_files+0x148>
    108c:	02812403          	lw	s0,40(sp)
    1090:	02c12083          	lw	ra,44(sp)
    1094:	02412483          	lw	s1,36(sp)
    1098:	02012903          	lw	s2,32(sp)
    109c:	01812a03          	lw	s4,24(sp)
    10a0:	01412a83          	lw	s5,20(sp)
    10a4:	01012b03          	lw	s6,16(sp)
    10a8:	00c12b83          	lw	s7,12(sp)
    10ac:	84898513          	addi	a0,s3,-1976
    10b0:	01c12983          	lw	s3,28(sp)
    10b4:	03010113          	addi	sp,sp,48
    10b8:	00002317          	auipc	t1,0x2
    10bc:	1ec30067          	jr	492(t1) # 32a4 <fl_closedir>
    10c0:	000b8593          	mv	a1,s7
    10c4:	73890513          	addi	a0,s2,1848
    10c8:	fffff097          	auipc	ra,0xfffff
    10cc:	f54080e7          	jalr	-172(ra) # 1c <strcmp>
    10d0:	f8050ce3          	beqz	a0,1068 <scan_files+0xf0>
    10d4:	000065b7          	lui	a1,0x6
    10d8:	1d458593          	addi	a1,a1,468 # 61d4 <LEDS+0x8c>
    10dc:	73890513          	addi	a0,s2,1848
    10e0:	fffff097          	auipc	ra,0xfffff
    10e4:	f3c080e7          	jalr	-196(ra) # 1c <strcmp>
    10e8:	f80500e3          	beqz	a0,1068 <scan_files+0xf0>
    10ec:	003b1513          	slli	a0,s6,0x3
    10f0:	41650533          	sub	a0,a0,s6
    10f4:	00251513          	slli	a0,a0,0x2
    10f8:	41650533          	sub	a0,a0,s6
    10fc:	00251513          	slli	a0,a0,0x2
    1100:	06400613          	li	a2,100
    1104:	00000593          	li	a1,0
    1108:	00a48533          	add	a0,s1,a0
    110c:	00001097          	auipc	ra,0x1
    1110:	4dc080e7          	jalr	1244(ra) # 25e8 <memset>
    1114:	70842703          	lw	a4,1800(s0)
    1118:	06300513          	li	a0,99
    111c:	00371793          	slli	a5,a4,0x3
    1120:	40e786b3          	sub	a3,a5,a4
    1124:	00269693          	slli	a3,a3,0x2
    1128:	40e686b3          	sub	a3,a3,a4
    112c:	00269693          	slli	a3,a3,0x2
    1130:	014a8633          	add	a2,s5,s4
    1134:	00064583          	lbu	a1,0(a2) # 4000 <fatfs_init+0x17c>
    1138:	00058463          	beqz	a1,1140 <scan_files+0x1c8>
    113c:	02aa9e63          	bne	s5,a0,1178 <scan_files+0x200>
    1140:	40e787b3          	sub	a5,a5,a4
    1144:	00279793          	slli	a5,a5,0x2
    1148:	10ca2683          	lw	a3,268(s4)
    114c:	40e787b3          	sub	a5,a5,a4
    1150:	00279793          	slli	a5,a5,0x2
    1154:	00f487b3          	add	a5,s1,a5
    1158:	06d7a223          	sw	a3,100(a5)
    115c:	104a4683          	lbu	a3,260(s4)
    1160:	01578ab3          	add	s5,a5,s5
    1164:	00170713          	addi	a4,a4,1
    1168:	000a8023          	sb	zero,0(s5)
    116c:	06d7a423          	sw	a3,104(a5)
    1170:	70e42423          	sw	a4,1800(s0)
    1174:	ef5ff06f          	j	1068 <scan_files+0xf0>
    1178:	00da8633          	add	a2,s5,a3
    117c:	00c48633          	add	a2,s1,a2
    1180:	00b60023          	sb	a1,0(a2)
    1184:	001a8a93          	addi	s5,s5,1
    1188:	fa9ff06f          	j	1130 <scan_files+0x1b8>
    118c:	02c12083          	lw	ra,44(sp)
    1190:	02812403          	lw	s0,40(sp)
    1194:	02412483          	lw	s1,36(sp)
    1198:	02012903          	lw	s2,32(sp)
    119c:	01c12983          	lw	s3,28(sp)
    11a0:	01812a03          	lw	s4,24(sp)
    11a4:	01412a83          	lw	s5,20(sp)
    11a8:	01012b03          	lw	s6,16(sp)
    11ac:	00c12b83          	lw	s7,12(sp)
    11b0:	03010113          	addi	sp,sp,48
    11b4:	00008067          	ret

000011b8 <go_up_directory>:
    11b8:	ff010113          	addi	sp,sp,-16
    11bc:	00812423          	sw	s0,8(sp)
    11c0:	00006437          	lui	s0,0x6
    11c4:	00112623          	sw	ra,12(sp)
    11c8:	00000793          	li	a5,0
    11cc:	51040513          	addi	a0,s0,1296 # 6510 <current_path>
    11d0:	00a78733          	add	a4,a5,a0
    11d4:	00074683          	lbu	a3,0(a4)
    11d8:	02069a63          	bnez	a3,120c <go_up_directory+0x54>
    11dc:	00100693          	li	a3,1
    11e0:	02f6da63          	bge	a3,a5,1214 <go_up_directory+0x5c>
    11e4:	02f00593          	li	a1,47
    11e8:	fe070fa3          	sb	zero,-1(a4)
    11ec:	fffff097          	auipc	ra,0xfffff
    11f0:	e54080e7          	jalr	-428(ra) # 40 <strrchr>
    11f4:	02050063          	beqz	a0,1214 <go_up_directory+0x5c>
    11f8:	000500a3          	sb	zero,1(a0)
    11fc:	00c12083          	lw	ra,12(sp)
    1200:	00812403          	lw	s0,8(sp)
    1204:	01010113          	addi	sp,sp,16
    1208:	00008067          	ret
    120c:	00178793          	addi	a5,a5,1
    1210:	fc1ff06f          	j	11d0 <go_up_directory+0x18>
    1214:	51040513          	addi	a0,s0,1296
    1218:	00812403          	lw	s0,8(sp)
    121c:	00c12083          	lw	ra,12(sp)
    1220:	000065b7          	lui	a1,0x6
    1224:	1dc58593          	addi	a1,a1,476 # 61dc <LEDS+0x94>
    1228:	01010113          	addi	sp,sp,16
    122c:	00001317          	auipc	t1,0x1
    1230:	48030067          	jr	1152(t1) # 26ac <strcpy>

00001234 <build_full_path>:
    1234:	ff010113          	addi	sp,sp,-16
    1238:	00912223          	sw	s1,4(sp)
    123c:	00058493          	mv	s1,a1
    1240:	000065b7          	lui	a1,0x6
    1244:	51058593          	addi	a1,a1,1296 # 6510 <current_path>
    1248:	00812423          	sw	s0,8(sp)
    124c:	00112623          	sw	ra,12(sp)
    1250:	00050413          	mv	s0,a0
    1254:	00001097          	auipc	ra,0x1
    1258:	458080e7          	jalr	1112(ra) # 26ac <strcpy>
    125c:	00044783          	lbu	a5,0(s0)
    1260:	02079263          	bnez	a5,1284 <build_full_path+0x50>
    1264:	0004c783          	lbu	a5,0(s1)
    1268:	02079263          	bnez	a5,128c <build_full_path+0x58>
    126c:	00040023          	sb	zero,0(s0)
    1270:	00c12083          	lw	ra,12(sp)
    1274:	00812403          	lw	s0,8(sp)
    1278:	00412483          	lw	s1,4(sp)
    127c:	01010113          	addi	sp,sp,16
    1280:	00008067          	ret
    1284:	00140413          	addi	s0,s0,1
    1288:	fd5ff06f          	j	125c <build_full_path+0x28>
    128c:	00140413          	addi	s0,s0,1
    1290:	00148493          	addi	s1,s1,1
    1294:	fef40fa3          	sb	a5,-1(s0)
    1298:	fcdff06f          	j	1264 <build_full_path+0x30>

0000129c <file_explorer>:
    129c:	db010113          	addi	sp,sp,-592
    12a0:	24112623          	sw	ra,588(sp)
    12a4:	24812423          	sw	s0,584(sp)
    12a8:	25212023          	sw	s2,576(sp)
    12ac:	23312e23          	sw	s3,572(sp)
    12b0:	23512a23          	sw	s5,564(sp)
    12b4:	23612823          	sw	s6,560(sp)
    12b8:	23912223          	sw	s9,548(sp)
    12bc:	24912223          	sw	s1,580(sp)
    12c0:	23412c23          	sw	s4,568(sp)
    12c4:	23712623          	sw	s7,556(sp)
    12c8:	23812423          	sw	s8,552(sp)
    12cc:	23a12023          	sw	s10,544(sp)
    12d0:	21b12e23          	sw	s11,540(sp)
    12d4:	00001097          	auipc	ra,0x1
    12d8:	5b8080e7          	jalr	1464(ra) # 288c <display_framebuffer>
    12dc:	00004637          	lui	a2,0x4
    12e0:	00000593          	li	a1,0
    12e4:	00001097          	auipc	ra,0x1
    12e8:	304080e7          	jalr	772(ra) # 25e8 <memset>
    12ec:	00001097          	auipc	ra,0x1
    12f0:	71c080e7          	jalr	1820(ra) # 2a08 <display_refresh>
    12f4:	00006b37          	lui	s6,0x6
    12f8:	00006ab7          	lui	s5,0x6
    12fc:	1dcb0593          	addi	a1,s6,476 # 61dc <LEDS+0x94>
    1300:	510a8513          	addi	a0,s5,1296 # 6510 <current_path>
    1304:	00001097          	auipc	ra,0x1
    1308:	3a8080e7          	jalr	936(ra) # 26ac <strcpy>
    130c:	1dcb0513          	addi	a0,s6,476
    1310:	00000097          	auipc	ra,0x0
    1314:	c68080e7          	jalr	-920(ra) # f78 <scan_files>
    1318:	000067b7          	lui	a5,0x6
    131c:	1e078793          	addi	a5,a5,480 # 61e0 <LEDS+0x98>
    1320:	00f12623          	sw	a5,12(sp)
    1324:	000067b7          	lui	a5,0x6
    1328:	1387a783          	lw	a5,312(a5) # 6138 <BUTTONS>
    132c:	00000c93          	li	s9,0
    1330:	00000993          	li	s3,0
    1334:	00000913          	li	s2,0
    1338:	00000413          	li	s0,0
    133c:	510a8a93          	addi	s5,s5,1296
    1340:	00f12023          	sw	a5,0(sp)
    1344:	00000593          	li	a1,0
    1348:	00000513          	li	a0,0
    134c:	00001097          	auipc	ra,0x1
    1350:	54c080e7          	jalr	1356(ra) # 2898 <display_set_cursor>
    1354:	0ffcf593          	zext.b	a1,s9
    1358:	07f58513          	addi	a0,a1,127
    135c:	0ff57513          	zext.b	a0,a0
    1360:	00001097          	auipc	ra,0x1
    1364:	54c080e7          	jalr	1356(ra) # 28ac <display_set_front_back_color>
    1368:	00c12503          	lw	a0,12(sp)
    136c:	00000493          	li	s1,0
    1370:	00006c37          	lui	s8,0x6
    1374:	00002097          	auipc	ra,0x2
    1378:	800080e7          	jalr	-2048(ra) # 2b74 <printf>
    137c:	00c00a13          	li	s4,12
    1380:	015487b3          	add	a5,s1,s5
    1384:	0007c503          	lbu	a0,0(a5)
    1388:	00050a63          	beqz	a0,139c <file_explorer+0x100>
    138c:	71cc2783          	lw	a5,1820(s8) # 671c <f_putchar>
    1390:	00148493          	addi	s1,s1,1
    1394:	000780e7          	jalr	a5
    1398:	ff4494e3          	bne	s1,s4,1380 <file_explorer+0xe4>
    139c:	71cc2783          	lw	a5,1820(s8)
    13a0:	00a00513          	li	a0,10
    13a4:	00006db7          	lui	s11,0x6
    13a8:	000780e7          	jalr	a5
    13ac:	00000593          	li	a1,0
    13b0:	0ff00513          	li	a0,255
    13b4:	00001097          	auipc	ra,0x1
    13b8:	4f8080e7          	jalr	1272(ra) # 28ac <display_set_front_back_color>
    13bc:	708daa03          	lw	s4,1800(s11) # 6708 <n_items>
    13c0:	080a0463          	beqz	s4,1448 <file_explorer+0x1ac>
    13c4:	412a0a33          	sub	s4,s4,s2
    13c8:	00c00793          	li	a5,12
    13cc:	0147d463          	bge	a5,s4,13d4 <file_explorer+0x138>
    13d0:	00078a13          	mv	s4,a5
    13d4:	00391493          	slli	s1,s2,0x3
    13d8:	412484b3          	sub	s1,s1,s2
    13dc:	00249493          	slli	s1,s1,0x2
    13e0:	412484b3          	sub	s1,s1,s2
    13e4:	000077b7          	lui	a5,0x7
    13e8:	85478793          	addi	a5,a5,-1964 # 6854 <files>
    13ec:	00249493          	slli	s1,s1,0x2
    13f0:	00f484b3          	add	s1,s1,a5
    13f4:	000067b7          	lui	a5,0x6
    13f8:	1fc78793          	addi	a5,a5,508 # 61fc <LEDS+0xb4>
    13fc:	00f12223          	sw	a5,4(sp)
    1400:	000067b7          	lui	a5,0x6
    1404:	1f478793          	addi	a5,a5,500 # 61f4 <LEDS+0xac>
    1408:	00000b93          	li	s7,0
    140c:	00f12423          	sw	a5,8(sp)
    1410:	194bc863          	blt	s7,s4,15a0 <file_explorer+0x304>
    1414:	00000593          	li	a1,0
    1418:	00000513          	li	a0,0
    141c:	000064b7          	lui	s1,0x6
    1420:	00001097          	auipc	ra,0x1
    1424:	48c080e7          	jalr	1164(ra) # 28ac <display_set_front_back_color>
    1428:	00c00b93          	li	s7,12
    142c:	20448493          	addi	s1,s1,516 # 6204 <LEDS+0xbc>
    1430:	037a0463          	beq	s4,s7,1458 <file_explorer+0x1bc>
    1434:	00048513          	mv	a0,s1
    1438:	00001097          	auipc	ra,0x1
    143c:	73c080e7          	jalr	1852(ra) # 2b74 <printf>
    1440:	001a0a13          	addi	s4,s4,1
    1444:	fedff06f          	j	1430 <file_explorer+0x194>
    1448:	00006537          	lui	a0,0x6
    144c:	1ec50513          	addi	a0,a0,492 # 61ec <LEDS+0xa4>
    1450:	00001097          	auipc	ra,0x1
    1454:	724080e7          	jalr	1828(ra) # 2b74 <printf>
    1458:	00001097          	auipc	ra,0x1
    145c:	5b0080e7          	jalr	1456(ra) # 2a08 <display_refresh>
    1460:	00012783          	lw	a5,0(sp)
    1464:	fff9c993          	not	s3,s3
    1468:	0007aa03          	lw	s4,0(a5)
    146c:	0149f9b3          	and	s3,s3,s4
    1470:	0109f793          	andi	a5,s3,16
    1474:	00078863          	beqz	a5,1484 <file_explorer+0x1e8>
    1478:	00140413          	addi	s0,s0,1
    147c:	fffff097          	auipc	ra,0xfffff
    1480:	ce0080e7          	jalr	-800(ra) # 15c <play_click_noise>
    1484:	0089f793          	andi	a5,s3,8
    1488:	00078863          	beqz	a5,1498 <file_explorer+0x1fc>
    148c:	fff40413          	addi	s0,s0,-1
    1490:	fffff097          	auipc	ra,0xfffff
    1494:	ccc080e7          	jalr	-820(ra) # 15c <play_click_noise>
    1498:	0029f793          	andi	a5,s3,2
    149c:	04078a63          	beqz	a5,14f0 <file_explorer+0x254>
    14a0:	fffff097          	auipc	ra,0xfffff
    14a4:	cbc080e7          	jalr	-836(ra) # 15c <play_click_noise>
    14a8:	1dcb0593          	addi	a1,s6,476
    14ac:	000a8513          	mv	a0,s5
    14b0:	fffff097          	auipc	ra,0xfffff
    14b4:	b6c080e7          	jalr	-1172(ra) # 1c <strcmp>
    14b8:	20050e63          	beqz	a0,16d4 <file_explorer+0x438>
    14bc:	00000097          	auipc	ra,0x0
    14c0:	cfc080e7          	jalr	-772(ra) # 11b8 <go_up_directory>
    14c4:	1dcb0513          	addi	a0,s6,476
    14c8:	00000097          	auipc	ra,0x0
    14cc:	ab0080e7          	jalr	-1360(ra) # f78 <scan_files>
    14d0:	00001097          	auipc	ra,0x1
    14d4:	3bc080e7          	jalr	956(ra) # 288c <display_framebuffer>
    14d8:	00004637          	lui	a2,0x4
    14dc:	00000593          	li	a1,0
    14e0:	00001097          	auipc	ra,0x1
    14e4:	108080e7          	jalr	264(ra) # 25e8 <memset>
    14e8:	00000913          	li	s2,0
    14ec:	00000413          	li	s0,0
    14f0:	0049f993          	andi	s3,s3,4
    14f4:	007c8c93          	addi	s9,s9,7
    14f8:	08098063          	beqz	s3,1578 <file_explorer+0x2dc>
    14fc:	00341493          	slli	s1,s0,0x3
    1500:	408484b3          	sub	s1,s1,s0
    1504:	fffff097          	auipc	ra,0xfffff
    1508:	c58080e7          	jalr	-936(ra) # 15c <play_click_noise>
    150c:	00249493          	slli	s1,s1,0x2
    1510:	408484b3          	sub	s1,s1,s0
    1514:	000077b7          	lui	a5,0x7
    1518:	85478793          	addi	a5,a5,-1964 # 6854 <files>
    151c:	00249493          	slli	s1,s1,0x2
    1520:	00f484b3          	add	s1,s1,a5
    1524:	0684a783          	lw	a5,104(s1)
    1528:	12078a63          	beqz	a5,165c <file_explorer+0x3c0>
    152c:	000065b7          	lui	a1,0x6
    1530:	1d458593          	addi	a1,a1,468 # 61d4 <LEDS+0x8c>
    1534:	00048513          	mv	a0,s1
    1538:	fffff097          	auipc	ra,0xfffff
    153c:	ae4080e7          	jalr	-1308(ra) # 1c <strcmp>
    1540:	10051263          	bnez	a0,1644 <file_explorer+0x3a8>
    1544:	00000097          	auipc	ra,0x0
    1548:	c74080e7          	jalr	-908(ra) # 11b8 <go_up_directory>
    154c:	1dcb0513          	addi	a0,s6,476
    1550:	00000097          	auipc	ra,0x0
    1554:	a28080e7          	jalr	-1496(ra) # f78 <scan_files>
    1558:	00001097          	auipc	ra,0x1
    155c:	334080e7          	jalr	820(ra) # 288c <display_framebuffer>
    1560:	00004637          	lui	a2,0x4
    1564:	00000593          	li	a1,0
    1568:	00001097          	auipc	ra,0x1
    156c:	080080e7          	jalr	128(ra) # 25e8 <memset>
    1570:	00000913          	li	s2,0
    1574:	00000413          	li	s0,0
    1578:	708da783          	lw	a5,1800(s11)
    157c:	00f05e63          	blez	a5,1598 <file_explorer+0x2fc>
    1580:	12045e63          	bgez	s0,16bc <file_explorer+0x420>
    1584:	fff78413          	addi	s0,a5,-1
    1588:	15244263          	blt	s0,s2,16cc <file_explorer+0x430>
    158c:	00b90793          	addi	a5,s2,11
    1590:	0087d463          	bge	a5,s0,1598 <file_explorer+0x2fc>
    1594:	ff540913          	addi	s2,s0,-11
    1598:	000a0993          	mv	s3,s4
    159c:	da9ff06f          	j	1344 <file_explorer+0xa8>
    15a0:	012b8d33          	add	s10,s7,s2
    15a4:	07a41463          	bne	s0,s10,160c <file_explorer+0x370>
    15a8:	0ff00593          	li	a1,255
    15ac:	00000513          	li	a0,0
    15b0:	00001097          	auipc	ra,0x1
    15b4:	2fc080e7          	jalr	764(ra) # 28ac <display_set_front_back_color>
    15b8:	0684a783          	lw	a5,104(s1)
    15bc:	000d0593          	mv	a1,s10
    15c0:	04078c63          	beqz	a5,1618 <file_explorer+0x37c>
    15c4:	00812503          	lw	a0,8(sp)
    15c8:	00001097          	auipc	ra,0x1
    15cc:	5ac080e7          	jalr	1452(ra) # 2b74 <printf>
    15d0:	00000d13          	li	s10,0
    15d4:	01a487b3          	add	a5,s1,s10
    15d8:	0007c503          	lbu	a0,0(a5)
    15dc:	00050c63          	beqz	a0,15f4 <file_explorer+0x358>
    15e0:	71cc2783          	lw	a5,1820(s8)
    15e4:	001d0d13          	addi	s10,s10,1
    15e8:	000780e7          	jalr	a5
    15ec:	01200793          	li	a5,18
    15f0:	fefd12e3          	bne	s10,a5,15d4 <file_explorer+0x338>
    15f4:	71cc2783          	lw	a5,1820(s8)
    15f8:	00a00513          	li	a0,10
    15fc:	001b8b93          	addi	s7,s7,1
    1600:	000780e7          	jalr	a5
    1604:	06c48493          	addi	s1,s1,108
    1608:	e09ff06f          	j	1410 <file_explorer+0x174>
    160c:	00000593          	li	a1,0
    1610:	0ff00513          	li	a0,255
    1614:	f9dff06f          	j	15b0 <file_explorer+0x314>
    1618:	00412503          	lw	a0,4(sp)
    161c:	fadff06f          	j	15c8 <file_explorer+0x32c>
    1620:	00178793          	addi	a5,a5,1
    1624:	0007c703          	lbu	a4,0(a5)
    1628:	fe071ce3          	bnez	a4,1620 <file_explorer+0x384>
    162c:	0004c703          	lbu	a4,0(s1)
    1630:	00071e63          	bnez	a4,164c <file_explorer+0x3b0>
    1634:	02f00713          	li	a4,47
    1638:	00e78023          	sb	a4,0(a5)
    163c:	000780a3          	sb	zero,1(a5)
    1640:	f0dff06f          	j	154c <file_explorer+0x2b0>
    1644:	000a8793          	mv	a5,s5
    1648:	fddff06f          	j	1624 <file_explorer+0x388>
    164c:	00178793          	addi	a5,a5,1
    1650:	00148493          	addi	s1,s1,1
    1654:	fee78fa3          	sb	a4,-1(a5)
    1658:	fd5ff06f          	j	162c <file_explorer+0x390>
    165c:	00048593          	mv	a1,s1
    1660:	01c10513          	addi	a0,sp,28
    1664:	00000097          	auipc	ra,0x0
    1668:	bd0080e7          	jalr	-1072(ra) # 1234 <build_full_path>
    166c:	0644a603          	lw	a2,100(s1)
    1670:	000047b7          	lui	a5,0x4
    1674:	02f61a63          	bne	a2,a5,16a8 <file_explorer+0x40c>
    1678:	01c10513          	addi	a0,sp,28
    167c:	00000097          	auipc	ra,0x0
    1680:	804080e7          	jalr	-2044(ra) # e80 <view_image_file>
    1684:	00001097          	auipc	ra,0x1
    1688:	208080e7          	jalr	520(ra) # 288c <display_framebuffer>
    168c:	00004637          	lui	a2,0x4
    1690:	00000593          	li	a1,0
    1694:	00001097          	auipc	ra,0x1
    1698:	f54080e7          	jalr	-172(ra) # 25e8 <memset>
    169c:	00012783          	lw	a5,0(sp)
    16a0:	0007a783          	lw	a5,0(a5) # 4000 <fatfs_init+0x17c>
    16a4:	ed5ff06f          	j	1578 <file_explorer+0x2dc>
    16a8:	00048593          	mv	a1,s1
    16ac:	01c10513          	addi	a0,sp,28
    16b0:	fffff097          	auipc	ra,0xfffff
    16b4:	e5c080e7          	jalr	-420(ra) # 50c <play_music_with_controls>
    16b8:	fcdff06f          	j	1684 <file_explorer+0x3e8>
    16bc:	00f427b3          	slt	a5,s0,a5
    16c0:	40f007b3          	neg	a5,a5
    16c4:	00f47433          	and	s0,s0,a5
    16c8:	ec1ff06f          	j	1588 <file_explorer+0x2ec>
    16cc:	00040913          	mv	s2,s0
    16d0:	ec9ff06f          	j	1598 <file_explorer+0x2fc>
    16d4:	24c12083          	lw	ra,588(sp)
    16d8:	24812403          	lw	s0,584(sp)
    16dc:	24412483          	lw	s1,580(sp)
    16e0:	24012903          	lw	s2,576(sp)
    16e4:	23c12983          	lw	s3,572(sp)
    16e8:	23812a03          	lw	s4,568(sp)
    16ec:	23412a83          	lw	s5,564(sp)
    16f0:	23012b03          	lw	s6,560(sp)
    16f4:	22c12b83          	lw	s7,556(sp)
    16f8:	22812c03          	lw	s8,552(sp)
    16fc:	22412c83          	lw	s9,548(sp)
    1700:	22012d03          	lw	s10,544(sp)
    1704:	21c12d83          	lw	s11,540(sp)
    1708:	25010113          	addi	sp,sp,592
    170c:	00008067          	ret

00001710 <music_player_generic>:
    1710:	da010113          	addi	sp,sp,-608
    1714:	24112e23          	sw	ra,604(sp)
    1718:	24812c23          	sw	s0,600(sp)
    171c:	25212823          	sw	s2,592(sp)
    1720:	25312623          	sw	s3,588(sp)
    1724:	25512223          	sw	s5,580(sp)
    1728:	23912a23          	sw	s9,564(sp)
    172c:	24912a23          	sw	s1,596(sp)
    1730:	25412423          	sw	s4,584(sp)
    1734:	25612023          	sw	s6,576(sp)
    1738:	23712e23          	sw	s7,572(sp)
    173c:	23812c23          	sw	s8,568(sp)
    1740:	23a12823          	sw	s10,560(sp)
    1744:	23b12623          	sw	s11,556(sp)
    1748:	00a12823          	sw	a0,16(sp)
    174c:	00001097          	auipc	ra,0x1
    1750:	140080e7          	jalr	320(ra) # 288c <display_framebuffer>
    1754:	00004637          	lui	a2,0x4
    1758:	00000593          	li	a1,0
    175c:	00001097          	auipc	ra,0x1
    1760:	e8c080e7          	jalr	-372(ra) # 25e8 <memset>
    1764:	00001097          	auipc	ra,0x1
    1768:	2a4080e7          	jalr	676(ra) # 2a08 <display_refresh>
    176c:	00006ab7          	lui	s5,0x6
    1770:	000069b7          	lui	s3,0x6
    1774:	21ca8593          	addi	a1,s5,540 # 621c <LEDS+0xd4>
    1778:	51098513          	addi	a0,s3,1296 # 6510 <current_path>
    177c:	00001097          	auipc	ra,0x1
    1780:	f30080e7          	jalr	-208(ra) # 26ac <strcpy>
    1784:	21ca8513          	addi	a0,s5,540
    1788:	fffff097          	auipc	ra,0xfffff
    178c:	7f0080e7          	jalr	2032(ra) # f78 <scan_files>
    1790:	000067b7          	lui	a5,0x6
    1794:	23478793          	addi	a5,a5,564 # 6234 <LEDS+0xec>
    1798:	00f12e23          	sw	a5,28(sp)
    179c:	000067b7          	lui	a5,0x6
    17a0:	1387a783          	lw	a5,312(a5) # 6138 <BUTTONS>
    17a4:	00000c93          	li	s9,0
    17a8:	00012423          	sw	zero,8(sp)
    17ac:	00000913          	li	s2,0
    17b0:	00000413          	li	s0,0
    17b4:	00f12623          	sw	a5,12(sp)
    17b8:	00000593          	li	a1,0
    17bc:	00000513          	li	a0,0
    17c0:	00001097          	auipc	ra,0x1
    17c4:	0d8080e7          	jalr	216(ra) # 2898 <display_set_cursor>
    17c8:	0ffcf593          	zext.b	a1,s9
    17cc:	07f58513          	addi	a0,a1,127
    17d0:	0ff57513          	zext.b	a0,a0
    17d4:	00001097          	auipc	ra,0x1
    17d8:	0d8080e7          	jalr	216(ra) # 28ac <display_set_front_back_color>
    17dc:	01012783          	lw	a5,16(sp)
    17e0:	0e078663          	beqz	a5,18cc <music_player_generic+0x1bc>
    17e4:	00006537          	lui	a0,0x6
    17e8:	22850513          	addi	a0,a0,552 # 6228 <LEDS+0xe0>
    17ec:	00001097          	auipc	ra,0x1
    17f0:	388080e7          	jalr	904(ra) # 2b74 <printf>
    17f4:	00000493          	li	s1,0
    17f8:	51098d93          	addi	s11,s3,1296
    17fc:	00006c37          	lui	s8,0x6
    1800:	00c00a13          	li	s4,12
    1804:	01b487b3          	add	a5,s1,s11
    1808:	0007c503          	lbu	a0,0(a5)
    180c:	00050a63          	beqz	a0,1820 <music_player_generic+0x110>
    1810:	71cc2783          	lw	a5,1820(s8) # 671c <f_putchar>
    1814:	00148493          	addi	s1,s1,1
    1818:	000780e7          	jalr	a5
    181c:	ff4494e3          	bne	s1,s4,1804 <music_player_generic+0xf4>
    1820:	71cc2783          	lw	a5,1820(s8)
    1824:	00a00513          	li	a0,10
    1828:	00006b37          	lui	s6,0x6
    182c:	000780e7          	jalr	a5
    1830:	00000593          	li	a1,0
    1834:	0ff00513          	li	a0,255
    1838:	00001097          	auipc	ra,0x1
    183c:	074080e7          	jalr	116(ra) # 28ac <display_set_front_back_color>
    1840:	708b2a03          	lw	s4,1800(s6) # 6708 <n_items>
    1844:	080a0863          	beqz	s4,18d4 <music_player_generic+0x1c4>
    1848:	412a0a33          	sub	s4,s4,s2
    184c:	00c00793          	li	a5,12
    1850:	0147d463          	bge	a5,s4,1858 <music_player_generic+0x148>
    1854:	00078a13          	mv	s4,a5
    1858:	00391493          	slli	s1,s2,0x3
    185c:	412484b3          	sub	s1,s1,s2
    1860:	00249493          	slli	s1,s1,0x2
    1864:	412484b3          	sub	s1,s1,s2
    1868:	000077b7          	lui	a5,0x7
    186c:	85478793          	addi	a5,a5,-1964 # 6854 <files>
    1870:	00249493          	slli	s1,s1,0x2
    1874:	00f484b3          	add	s1,s1,a5
    1878:	000067b7          	lui	a5,0x6
    187c:	1fc78793          	addi	a5,a5,508 # 61fc <LEDS+0xb4>
    1880:	00f12a23          	sw	a5,20(sp)
    1884:	000067b7          	lui	a5,0x6
    1888:	1f478793          	addi	a5,a5,500 # 61f4 <LEDS+0xac>
    188c:	00000b93          	li	s7,0
    1890:	00f12c23          	sw	a5,24(sp)
    1894:	1f4bc463          	blt	s7,s4,1a7c <music_player_generic+0x36c>
    1898:	00000593          	li	a1,0
    189c:	00000513          	li	a0,0
    18a0:	000064b7          	lui	s1,0x6
    18a4:	00001097          	auipc	ra,0x1
    18a8:	008080e7          	jalr	8(ra) # 28ac <display_set_front_back_color>
    18ac:	00c00b93          	li	s7,12
    18b0:	20448493          	addi	s1,s1,516 # 6204 <LEDS+0xbc>
    18b4:	037a0863          	beq	s4,s7,18e4 <music_player_generic+0x1d4>
    18b8:	00048513          	mv	a0,s1
    18bc:	00001097          	auipc	ra,0x1
    18c0:	2b8080e7          	jalr	696(ra) # 2b74 <printf>
    18c4:	001a0a13          	addi	s4,s4,1
    18c8:	fedff06f          	j	18b4 <music_player_generic+0x1a4>
    18cc:	01c12503          	lw	a0,28(sp)
    18d0:	f1dff06f          	j	17ec <music_player_generic+0xdc>
    18d4:	00006537          	lui	a0,0x6
    18d8:	1ec50513          	addi	a0,a0,492 # 61ec <LEDS+0xa4>
    18dc:	00001097          	auipc	ra,0x1
    18e0:	298080e7          	jalr	664(ra) # 2b74 <printf>
    18e4:	00001097          	auipc	ra,0x1
    18e8:	124080e7          	jalr	292(ra) # 2a08 <display_refresh>
    18ec:	00c12783          	lw	a5,12(sp)
    18f0:	0007a483          	lw	s1,0(a5)
    18f4:	00812783          	lw	a5,8(sp)
    18f8:	fff7ca13          	not	s4,a5
    18fc:	009a7a33          	and	s4,s4,s1
    1900:	010a7793          	andi	a5,s4,16
    1904:	00078863          	beqz	a5,1914 <music_player_generic+0x204>
    1908:	00140413          	addi	s0,s0,1
    190c:	fffff097          	auipc	ra,0xfffff
    1910:	850080e7          	jalr	-1968(ra) # 15c <play_click_noise>
    1914:	008a7793          	andi	a5,s4,8
    1918:	00078863          	beqz	a5,1928 <music_player_generic+0x218>
    191c:	fff40413          	addi	s0,s0,-1
    1920:	fffff097          	auipc	ra,0xfffff
    1924:	83c080e7          	jalr	-1988(ra) # 15c <play_click_noise>
    1928:	002a7793          	andi	a5,s4,2
    192c:	06078c63          	beqz	a5,19a4 <music_player_generic+0x294>
    1930:	fffff097          	auipc	ra,0xfffff
    1934:	82c080e7          	jalr	-2004(ra) # 15c <play_click_noise>
    1938:	21ca8593          	addi	a1,s5,540
    193c:	51098513          	addi	a0,s3,1296
    1940:	ffffe097          	auipc	ra,0xffffe
    1944:	6dc080e7          	jalr	1756(ra) # 1c <strcmp>
    1948:	2e050c63          	beqz	a0,1c40 <music_player_generic+0x530>
    194c:	00000097          	auipc	ra,0x0
    1950:	86c080e7          	jalr	-1940(ra) # 11b8 <go_up_directory>
    1954:	21ca8593          	addi	a1,s5,540
    1958:	51098513          	addi	a0,s3,1296
    195c:	ffffe097          	auipc	ra,0xffffe
    1960:	708080e7          	jalr	1800(ra) # 64 <starts_with>
    1964:	00051a63          	bnez	a0,1978 <music_player_generic+0x268>
    1968:	21ca8593          	addi	a1,s5,540
    196c:	51098513          	addi	a0,s3,1296
    1970:	00001097          	auipc	ra,0x1
    1974:	d3c080e7          	jalr	-708(ra) # 26ac <strcpy>
    1978:	51098513          	addi	a0,s3,1296
    197c:	fffff097          	auipc	ra,0xfffff
    1980:	5fc080e7          	jalr	1532(ra) # f78 <scan_files>
    1984:	00001097          	auipc	ra,0x1
    1988:	f08080e7          	jalr	-248(ra) # 288c <display_framebuffer>
    198c:	00004637          	lui	a2,0x4
    1990:	00000593          	li	a1,0
    1994:	00001097          	auipc	ra,0x1
    1998:	c54080e7          	jalr	-940(ra) # 25e8 <memset>
    199c:	00000913          	li	s2,0
    19a0:	00000413          	li	s0,0
    19a4:	004a7a13          	andi	s4,s4,4
    19a8:	007c8c93          	addi	s9,s9,7
    19ac:	0a0a0463          	beqz	s4,1a54 <music_player_generic+0x344>
    19b0:	ffffe097          	auipc	ra,0xffffe
    19b4:	7ac080e7          	jalr	1964(ra) # 15c <play_click_noise>
    19b8:	00341793          	slli	a5,s0,0x3
    19bc:	408787b3          	sub	a5,a5,s0
    19c0:	00279793          	slli	a5,a5,0x2
    19c4:	00007a37          	lui	s4,0x7
    19c8:	408787b3          	sub	a5,a5,s0
    19cc:	854a0a13          	addi	s4,s4,-1964 # 6854 <files>
    19d0:	00279793          	slli	a5,a5,0x2
    19d4:	00fa07b3          	add	a5,s4,a5
    19d8:	0687a703          	lw	a4,104(a5)
    19dc:	14070e63          	beqz	a4,1b38 <music_player_generic+0x428>
    19e0:	000065b7          	lui	a1,0x6
    19e4:	1d458593          	addi	a1,a1,468 # 61d4 <LEDS+0x8c>
    19e8:	00078513          	mv	a0,a5
    19ec:	00078413          	mv	s0,a5
    19f0:	ffffe097          	auipc	ra,0xffffe
    19f4:	62c080e7          	jalr	1580(ra) # 1c <strcmp>
    19f8:	12051463          	bnez	a0,1b20 <music_player_generic+0x410>
    19fc:	fffff097          	auipc	ra,0xfffff
    1a00:	7bc080e7          	jalr	1980(ra) # 11b8 <go_up_directory>
    1a04:	21ca8593          	addi	a1,s5,540
    1a08:	51098513          	addi	a0,s3,1296
    1a0c:	ffffe097          	auipc	ra,0xffffe
    1a10:	658080e7          	jalr	1624(ra) # 64 <starts_with>
    1a14:	00051a63          	bnez	a0,1a28 <music_player_generic+0x318>
    1a18:	21ca8593          	addi	a1,s5,540
    1a1c:	51098513          	addi	a0,s3,1296
    1a20:	00001097          	auipc	ra,0x1
    1a24:	c8c080e7          	jalr	-884(ra) # 26ac <strcpy>
    1a28:	51098513          	addi	a0,s3,1296
    1a2c:	fffff097          	auipc	ra,0xfffff
    1a30:	54c080e7          	jalr	1356(ra) # f78 <scan_files>
    1a34:	00001097          	auipc	ra,0x1
    1a38:	e58080e7          	jalr	-424(ra) # 288c <display_framebuffer>
    1a3c:	00004637          	lui	a2,0x4
    1a40:	00000593          	li	a1,0
    1a44:	00001097          	auipc	ra,0x1
    1a48:	ba4080e7          	jalr	-1116(ra) # 25e8 <memset>
    1a4c:	00000913          	li	s2,0
    1a50:	00000413          	li	s0,0
    1a54:	708b2783          	lw	a5,1800(s6)
    1a58:	00f05e63          	blez	a5,1a74 <music_player_generic+0x364>
    1a5c:	1c045663          	bgez	s0,1c28 <music_player_generic+0x518>
    1a60:	fff78413          	addi	s0,a5,-1
    1a64:	1d244a63          	blt	s0,s2,1c38 <music_player_generic+0x528>
    1a68:	00b90793          	addi	a5,s2,11
    1a6c:	0087d463          	bge	a5,s0,1a74 <music_player_generic+0x364>
    1a70:	ff540913          	addi	s2,s0,-11
    1a74:	00912423          	sw	s1,8(sp)
    1a78:	d41ff06f          	j	17b8 <music_player_generic+0xa8>
    1a7c:	012b8d33          	add	s10,s7,s2
    1a80:	07a41463          	bne	s0,s10,1ae8 <music_player_generic+0x3d8>
    1a84:	0ff00593          	li	a1,255
    1a88:	00000513          	li	a0,0
    1a8c:	00001097          	auipc	ra,0x1
    1a90:	e20080e7          	jalr	-480(ra) # 28ac <display_set_front_back_color>
    1a94:	0684a783          	lw	a5,104(s1)
    1a98:	000d0593          	mv	a1,s10
    1a9c:	04078c63          	beqz	a5,1af4 <music_player_generic+0x3e4>
    1aa0:	01812503          	lw	a0,24(sp)
    1aa4:	00001097          	auipc	ra,0x1
    1aa8:	0d0080e7          	jalr	208(ra) # 2b74 <printf>
    1aac:	00000d13          	li	s10,0
    1ab0:	01a487b3          	add	a5,s1,s10
    1ab4:	0007c503          	lbu	a0,0(a5)
    1ab8:	00050c63          	beqz	a0,1ad0 <music_player_generic+0x3c0>
    1abc:	71cc2783          	lw	a5,1820(s8)
    1ac0:	001d0d13          	addi	s10,s10,1
    1ac4:	000780e7          	jalr	a5
    1ac8:	01200793          	li	a5,18
    1acc:	fefd12e3          	bne	s10,a5,1ab0 <music_player_generic+0x3a0>
    1ad0:	71cc2783          	lw	a5,1820(s8)
    1ad4:	00a00513          	li	a0,10
    1ad8:	001b8b93          	addi	s7,s7,1
    1adc:	000780e7          	jalr	a5
    1ae0:	06c48493          	addi	s1,s1,108
    1ae4:	db1ff06f          	j	1894 <music_player_generic+0x184>
    1ae8:	00000593          	li	a1,0
    1aec:	0ff00513          	li	a0,255
    1af0:	f9dff06f          	j	1a8c <music_player_generic+0x37c>
    1af4:	01412503          	lw	a0,20(sp)
    1af8:	fadff06f          	j	1aa4 <music_player_generic+0x394>
    1afc:	00178793          	addi	a5,a5,1
    1b00:	0007c703          	lbu	a4,0(a5)
    1b04:	fe071ce3          	bnez	a4,1afc <music_player_generic+0x3ec>
    1b08:	00044703          	lbu	a4,0(s0)
    1b0c:	00071e63          	bnez	a4,1b28 <music_player_generic+0x418>
    1b10:	02f00713          	li	a4,47
    1b14:	00e78023          	sb	a4,0(a5)
    1b18:	000780a3          	sb	zero,1(a5)
    1b1c:	f0dff06f          	j	1a28 <music_player_generic+0x318>
    1b20:	000d8793          	mv	a5,s11
    1b24:	fddff06f          	j	1b00 <music_player_generic+0x3f0>
    1b28:	00178793          	addi	a5,a5,1
    1b2c:	00140413          	addi	s0,s0,1
    1b30:	fee78fa3          	sb	a4,-1(a5)
    1b34:	fd5ff06f          	j	1b08 <music_player_generic+0x3f8>
    1b38:	00040b93          	mv	s7,s0
    1b3c:	003b9c13          	slli	s8,s7,0x3
    1b40:	417c0c33          	sub	s8,s8,s7
    1b44:	002c1c13          	slli	s8,s8,0x2
    1b48:	417c0c33          	sub	s8,s8,s7
    1b4c:	002c1c13          	slli	s8,s8,0x2
    1b50:	018a0c33          	add	s8,s4,s8
    1b54:	068c2783          	lw	a5,104(s8)
    1b58:	04078063          	beqz	a5,1b98 <music_player_generic+0x488>
    1b5c:	708b2783          	lw	a5,1800(s6)
    1b60:	001b8b93          	addi	s7,s7,1
    1b64:	00fba7b3          	slt	a5,s7,a5
    1b68:	40f007b3          	neg	a5,a5
    1b6c:	00fbfbb3          	and	s7,s7,a5
    1b70:	fd7416e3          	bne	s0,s7,1b3c <music_player_generic+0x42c>
    1b74:	00001097          	auipc	ra,0x1
    1b78:	d18080e7          	jalr	-744(ra) # 288c <display_framebuffer>
    1b7c:	00004637          	lui	a2,0x4
    1b80:	00000593          	li	a1,0
    1b84:	00001097          	auipc	ra,0x1
    1b88:	a64080e7          	jalr	-1436(ra) # 25e8 <memset>
    1b8c:	00c12783          	lw	a5,12(sp)
    1b90:	0007a783          	lw	a5,0(a5)
    1b94:	ec1ff06f          	j	1a54 <music_player_generic+0x344>
    1b98:	000c0593          	mv	a1,s8
    1b9c:	02c10513          	addi	a0,sp,44
    1ba0:	fffff097          	auipc	ra,0xfffff
    1ba4:	694080e7          	jalr	1684(ra) # 1234 <build_full_path>
    1ba8:	00001097          	auipc	ra,0x1
    1bac:	ce4080e7          	jalr	-796(ra) # 288c <display_framebuffer>
    1bb0:	00004637          	lui	a2,0x4
    1bb4:	00000593          	li	a1,0
    1bb8:	00001097          	auipc	ra,0x1
    1bbc:	a30080e7          	jalr	-1488(ra) # 25e8 <memset>
    1bc0:	00001097          	auipc	ra,0x1
    1bc4:	e48080e7          	jalr	-440(ra) # 2a08 <display_refresh>
    1bc8:	01012783          	lw	a5,16(sp)
    1bcc:	064c2603          	lw	a2,100(s8)
    1bd0:	000c0593          	mv	a1,s8
    1bd4:	02c10513          	addi	a0,sp,44
    1bd8:	00078863          	beqz	a5,1be8 <music_player_generic+0x4d8>
    1bdc:	fffff097          	auipc	ra,0xfffff
    1be0:	e0c080e7          	jalr	-500(ra) # 9e8 <play_dj_mode>
    1be4:	f91ff06f          	j	1b74 <music_player_generic+0x464>
    1be8:	fffff097          	auipc	ra,0xfffff
    1bec:	924080e7          	jalr	-1756(ra) # 50c <play_music_with_controls>
    1bf0:	f80502e3          	beqz	a0,1b74 <music_player_generic+0x464>
    1bf4:	00100793          	li	a5,1
    1bf8:	00f51e63          	bne	a0,a5,1c14 <music_player_generic+0x504>
    1bfc:	708b2783          	lw	a5,1800(s6)
    1c00:	00ab8bb3          	add	s7,s7,a0
    1c04:	00fba7b3          	slt	a5,s7,a5
    1c08:	40f007b3          	neg	a5,a5
    1c0c:	00fbfbb3          	and	s7,s7,a5
    1c10:	f2dff06f          	j	1b3c <music_player_generic+0x42c>
    1c14:	fffb8b93          	addi	s7,s7,-1
    1c18:	f20bd2e3          	bgez	s7,1b3c <music_player_generic+0x42c>
    1c1c:	708b2b83          	lw	s7,1800(s6)
    1c20:	fffb8b93          	addi	s7,s7,-1
    1c24:	f19ff06f          	j	1b3c <music_player_generic+0x42c>
    1c28:	00f427b3          	slt	a5,s0,a5
    1c2c:	40f007b3          	neg	a5,a5
    1c30:	00f47433          	and	s0,s0,a5
    1c34:	e31ff06f          	j	1a64 <music_player_generic+0x354>
    1c38:	00040913          	mv	s2,s0
    1c3c:	e39ff06f          	j	1a74 <music_player_generic+0x364>
    1c40:	25c12083          	lw	ra,604(sp)
    1c44:	25812403          	lw	s0,600(sp)
    1c48:	25412483          	lw	s1,596(sp)
    1c4c:	25012903          	lw	s2,592(sp)
    1c50:	24c12983          	lw	s3,588(sp)
    1c54:	24812a03          	lw	s4,584(sp)
    1c58:	24412a83          	lw	s5,580(sp)
    1c5c:	24012b03          	lw	s6,576(sp)
    1c60:	23c12b83          	lw	s7,572(sp)
    1c64:	23812c03          	lw	s8,568(sp)
    1c68:	23412c83          	lw	s9,564(sp)
    1c6c:	23012d03          	lw	s10,560(sp)
    1c70:	22c12d83          	lw	s11,556(sp)
    1c74:	26010113          	addi	sp,sp,608
    1c78:	00008067          	ret

00001c7c <main_menu>:
    1c7c:	000067b7          	lui	a5,0x6
    1c80:	fc010113          	addi	sp,sp,-64
    1c84:	24078793          	addi	a5,a5,576 # 6240 <LEDS+0xf8>
    1c88:	00f12223          	sw	a5,4(sp)
    1c8c:	000067b7          	lui	a5,0x6
    1c90:	25078793          	addi	a5,a5,592 # 6250 <LEDS+0x108>
    1c94:	00f12423          	sw	a5,8(sp)
    1c98:	000067b7          	lui	a5,0x6
    1c9c:	25c78793          	addi	a5,a5,604 # 625c <LEDS+0x114>
    1ca0:	00f12623          	sw	a5,12(sp)
    1ca4:	000067b7          	lui	a5,0x6
    1ca8:	01812c23          	sw	s8,24(sp)
    1cac:	26478c13          	addi	s8,a5,612 # 6264 <LEDS+0x11c>
    1cb0:	000067b7          	lui	a5,0x6
    1cb4:	03612023          	sw	s6,32(sp)
    1cb8:	27878b13          	addi	s6,a5,632 # 6278 <LEDS+0x130>
    1cbc:	000067b7          	lui	a5,0x6
    1cc0:	01712e23          	sw	s7,28(sp)
    1cc4:	28878b93          	addi	s7,a5,648 # 6288 <LEDS+0x140>
    1cc8:	000067b7          	lui	a5,0x6
    1ccc:	01912a23          	sw	s9,20(sp)
    1cd0:	28c78c93          	addi	s9,a5,652 # 628c <LEDS+0x144>
    1cd4:	000067b7          	lui	a5,0x6
    1cd8:	03512223          	sw	s5,36(sp)
    1cdc:	1387aa83          	lw	s5,312(a5) # 6138 <BUTTONS>
    1ce0:	02812c23          	sw	s0,56(sp)
    1ce4:	02912a23          	sw	s1,52(sp)
    1ce8:	03312623          	sw	s3,44(sp)
    1cec:	02112e23          	sw	ra,60(sp)
    1cf0:	03212823          	sw	s2,48(sp)
    1cf4:	03412423          	sw	s4,40(sp)
    1cf8:	00000493          	li	s1,0
    1cfc:	00000413          	li	s0,0
    1d00:	00300993          	li	s3,3
    1d04:	00000593          	li	a1,0
    1d08:	00000513          	li	a0,0
    1d0c:	00001097          	auipc	ra,0x1
    1d10:	b8c080e7          	jalr	-1140(ra) # 2898 <display_set_cursor>
    1d14:	00000593          	li	a1,0
    1d18:	0ff00513          	li	a0,255
    1d1c:	00001097          	auipc	ra,0x1
    1d20:	b90080e7          	jalr	-1136(ra) # 28ac <display_set_front_back_color>
    1d24:	000c0513          	mv	a0,s8
    1d28:	00001097          	auipc	ra,0x1
    1d2c:	e4c080e7          	jalr	-436(ra) # 2b74 <printf>
    1d30:	00410a13          	addi	s4,sp,4
    1d34:	00000913          	li	s2,0
    1d38:	13241263          	bne	s0,s2,1e5c <main_menu+0x1e0>
    1d3c:	0ff00593          	li	a1,255
    1d40:	00000513          	li	a0,0
    1d44:	00001097          	auipc	ra,0x1
    1d48:	b68080e7          	jalr	-1176(ra) # 28ac <display_set_front_back_color>
    1d4c:	000a2603          	lw	a2,0(s4)
    1d50:	00190913          	addi	s2,s2,1
    1d54:	00090593          	mv	a1,s2
    1d58:	000b0513          	mv	a0,s6
    1d5c:	00001097          	auipc	ra,0x1
    1d60:	e18080e7          	jalr	-488(ra) # 2b74 <printf>
    1d64:	000b8513          	mv	a0,s7
    1d68:	00001097          	auipc	ra,0x1
    1d6c:	e0c080e7          	jalr	-500(ra) # 2b74 <printf>
    1d70:	004a0a13          	addi	s4,s4,4
    1d74:	fd3912e3          	bne	s2,s3,1d38 <main_menu+0xbc>
    1d78:	00000593          	li	a1,0
    1d7c:	0ff00513          	li	a0,255
    1d80:	00001097          	auipc	ra,0x1
    1d84:	b2c080e7          	jalr	-1236(ra) # 28ac <display_set_front_back_color>
    1d88:	06e00593          	li	a1,110
    1d8c:	00000513          	li	a0,0
    1d90:	00001097          	auipc	ra,0x1
    1d94:	b08080e7          	jalr	-1272(ra) # 2898 <display_set_cursor>
    1d98:	000c8513          	mv	a0,s9
    1d9c:	00001097          	auipc	ra,0x1
    1da0:	dd8080e7          	jalr	-552(ra) # 2b74 <printf>
    1da4:	00001097          	auipc	ra,0x1
    1da8:	c64080e7          	jalr	-924(ra) # 2a08 <display_refresh>
    1dac:	000aa903          	lw	s2,0(s5)
    1db0:	fff4c493          	not	s1,s1
    1db4:	0124f4b3          	and	s1,s1,s2
    1db8:	0104f793          	andi	a5,s1,16
    1dbc:	00078863          	beqz	a5,1dcc <main_menu+0x150>
    1dc0:	00140413          	addi	s0,s0,1
    1dc4:	ffffe097          	auipc	ra,0xffffe
    1dc8:	398080e7          	jalr	920(ra) # 15c <play_click_noise>
    1dcc:	0084f793          	andi	a5,s1,8
    1dd0:	00078863          	beqz	a5,1de0 <main_menu+0x164>
    1dd4:	fff40413          	addi	s0,s0,-1
    1dd8:	ffffe097          	auipc	ra,0xffffe
    1ddc:	384080e7          	jalr	900(ra) # 15c <play_click_noise>
    1de0:	0044f493          	andi	s1,s1,4
    1de4:	04048c63          	beqz	s1,1e3c <main_menu+0x1c0>
    1de8:	ffffe097          	auipc	ra,0xffffe
    1dec:	374080e7          	jalr	884(ra) # 15c <play_click_noise>
    1df0:	00001097          	auipc	ra,0x1
    1df4:	a9c080e7          	jalr	-1380(ra) # 288c <display_framebuffer>
    1df8:	00004637          	lui	a2,0x4
    1dfc:	00000593          	li	a1,0
    1e00:	00000097          	auipc	ra,0x0
    1e04:	7e8080e7          	jalr	2024(ra) # 25e8 <memset>
    1e08:	00001097          	auipc	ra,0x1
    1e0c:	c00080e7          	jalr	-1024(ra) # 2a08 <display_refresh>
    1e10:	04041c63          	bnez	s0,1e68 <main_menu+0x1ec>
    1e14:	fffff097          	auipc	ra,0xfffff
    1e18:	488080e7          	jalr	1160(ra) # 129c <file_explorer>
    1e1c:	00001097          	auipc	ra,0x1
    1e20:	a70080e7          	jalr	-1424(ra) # 288c <display_framebuffer>
    1e24:	00004637          	lui	a2,0x4
    1e28:	00000593          	li	a1,0
    1e2c:	00000097          	auipc	ra,0x0
    1e30:	7bc080e7          	jalr	1980(ra) # 25e8 <memset>
    1e34:	000a8793          	mv	a5,s5
    1e38:	0007a783          	lw	a5,0(a5)
    1e3c:	fff00793          	li	a5,-1
    1e40:	00f40863          	beq	s0,a5,1e50 <main_menu+0x1d4>
    1e44:	01341863          	bne	s0,s3,1e54 <main_menu+0x1d8>
    1e48:	00000413          	li	s0,0
    1e4c:	0080006f          	j	1e54 <main_menu+0x1d8>
    1e50:	00200413          	li	s0,2
    1e54:	00090493          	mv	s1,s2
    1e58:	eadff06f          	j	1d04 <main_menu+0x88>
    1e5c:	00000593          	li	a1,0
    1e60:	0ff00513          	li	a0,255
    1e64:	ee1ff06f          	j	1d44 <main_menu+0xc8>
    1e68:	00100513          	li	a0,1
    1e6c:	00a41a63          	bne	s0,a0,1e80 <main_menu+0x204>
    1e70:	00000513          	li	a0,0
    1e74:	00000097          	auipc	ra,0x0
    1e78:	89c080e7          	jalr	-1892(ra) # 1710 <music_player_generic>
    1e7c:	fa1ff06f          	j	1e1c <main_menu+0x1a0>
    1e80:	00200793          	li	a5,2
    1e84:	f8f41ce3          	bne	s0,a5,1e1c <main_menu+0x1a0>
    1e88:	fedff06f          	j	1e74 <main_menu+0x1f8>

00001e8c <main>:
    1e8c:	000067b7          	lui	a5,0x6
    1e90:	1487a783          	lw	a5,328(a5) # 6148 <LEDS>
    1e94:	ff010113          	addi	sp,sp,-16
    1e98:	00112623          	sw	ra,12(sp)
    1e9c:	00812423          	sw	s0,8(sp)
    1ea0:	0007a023          	sw	zero,0(a5)
    1ea4:	000037b7          	lui	a5,0x3
    1ea8:	8c078793          	addi	a5,a5,-1856 # 28c0 <display_putchar>
    1eac:	00006737          	lui	a4,0x6
    1eb0:	70f72e23          	sw	a5,1820(a4) # 671c <f_putchar>
    1eb4:	00001097          	auipc	ra,0x1
    1eb8:	934080e7          	jalr	-1740(ra) # 27e8 <oled_init>
    1ebc:	00001097          	auipc	ra,0x1
    1ec0:	938080e7          	jalr	-1736(ra) # 27f4 <oled_fullscreen>
    1ec4:	00001097          	auipc	ra,0x1
    1ec8:	9c8080e7          	jalr	-1592(ra) # 288c <display_framebuffer>
    1ecc:	00004637          	lui	a2,0x4
    1ed0:	00000593          	li	a1,0
    1ed4:	00000097          	auipc	ra,0x0
    1ed8:	714080e7          	jalr	1812(ra) # 25e8 <memset>
    1edc:	00001097          	auipc	ra,0x1
    1ee0:	b2c080e7          	jalr	-1236(ra) # 2a08 <display_refresh>
    1ee4:	00000097          	auipc	ra,0x0
    1ee8:	4a4080e7          	jalr	1188(ra) # 2388 <sdcard_init>
    1eec:	00001097          	auipc	ra,0x1
    1ef0:	258080e7          	jalr	600(ra) # 3144 <fl_init>
    1ef4:	00000593          	li	a1,0
    1ef8:	00000513          	li	a0,0
    1efc:	00001097          	auipc	ra,0x1
    1f00:	99c080e7          	jalr	-1636(ra) # 2898 <display_set_cursor>
    1f04:	00000593          	li	a1,0
    1f08:	0ff00513          	li	a0,255
    1f0c:	00001097          	auipc	ra,0x1
    1f10:	9a0080e7          	jalr	-1632(ra) # 28ac <display_set_front_back_color>
    1f14:	00006537          	lui	a0,0x6
    1f18:	2a050513          	addi	a0,a0,672 # 62a0 <LEDS+0x158>
    1f1c:	00001097          	auipc	ra,0x1
    1f20:	c58080e7          	jalr	-936(ra) # 2b74 <printf>
    1f24:	00001097          	auipc	ra,0x1
    1f28:	ae4080e7          	jalr	-1308(ra) # 2a08 <display_refresh>
    1f2c:	000025b7          	lui	a1,0x2
    1f30:	000027b7          	lui	a5,0x2
    1f34:	52c58593          	addi	a1,a1,1324 # 252c <sdcard_writesector>
    1f38:	4d878413          	addi	s0,a5,1240 # 24d8 <sdcard_readsector>
    1f3c:	00040513          	mv	a0,s0
    1f40:	00002097          	auipc	ra,0x2
    1f44:	164080e7          	jalr	356(ra) # 40a4 <fl_attach_media>
    1f48:	000027b7          	lui	a5,0x2
    1f4c:	52c78593          	addi	a1,a5,1324 # 252c <sdcard_writesector>
    1f50:	fe0516e3          	bnez	a0,1f3c <main+0xb0>
    1f54:	00000097          	auipc	ra,0x0
    1f58:	d28080e7          	jalr	-728(ra) # 1c7c <main_menu>

00001f5c <pause>:
    1f5c:	c0002773          	rdcycle	a4
    1f60:	c00027f3          	rdcycle	a5
    1f64:	40e787b3          	sub	a5,a5,a4
    1f68:	fea7ece3          	bltu	a5,a0,1f60 <pause+0x4>
    1f6c:	00008067          	ret

00001f70 <sdcard_idle>:
    1f70:	00008067          	ret

00001f74 <sdcard_select>:
    1f74:	000067b7          	lui	a5,0x6
    1f78:	13c7a783          	lw	a5,316(a5) # 613c <SDCARD>
    1f7c:	00200713          	li	a4,2
    1f80:	00e7a023          	sw	a4,0(a5)
    1f84:	00008067          	ret

00001f88 <sdcard_ponder>:
    1f88:	000066b7          	lui	a3,0x6
    1f8c:	13c6a683          	lw	a3,316(a3) # 613c <SDCARD>
    1f90:	01000793          	li	a5,16
    1f94:	00000713          	li	a4,0
    1f98:	00676613          	ori	a2,a4,6
    1f9c:	00c6a023          	sw	a2,0(a3)
    1fa0:	00174713          	xori	a4,a4,1
    1fa4:	00000013          	nop
    1fa8:	fff78793          	addi	a5,a5,-1
    1fac:	fe0796e3          	bnez	a5,1f98 <sdcard_ponder+0x10>
    1fb0:	00008067          	ret

00001fb4 <sdcard_unselect>:
    1fb4:	000067b7          	lui	a5,0x6
    1fb8:	13c7a783          	lw	a5,316(a5) # 613c <SDCARD>
    1fbc:	00600713          	li	a4,6
    1fc0:	00e7a023          	sw	a4,0(a5)
    1fc4:	00008067          	ret

00001fc8 <sdcard_send>:
    1fc8:	000067b7          	lui	a5,0x6
    1fcc:	13c7a783          	lw	a5,316(a5) # 613c <SDCARD>
    1fd0:	00655713          	srli	a4,a0,0x6
    1fd4:	00277713          	andi	a4,a4,2
    1fd8:	00e7a023          	sw	a4,0(a5)
    1fdc:	00176713          	ori	a4,a4,1
    1fe0:	00e7a023          	sw	a4,0(a5)
    1fe4:	00555713          	srli	a4,a0,0x5
    1fe8:	00277713          	andi	a4,a4,2
    1fec:	00e7a023          	sw	a4,0(a5)
    1ff0:	00176713          	ori	a4,a4,1
    1ff4:	00e7a023          	sw	a4,0(a5)
    1ff8:	00455713          	srli	a4,a0,0x4
    1ffc:	00277713          	andi	a4,a4,2
    2000:	00e7a023          	sw	a4,0(a5)
    2004:	00176713          	ori	a4,a4,1
    2008:	00e7a023          	sw	a4,0(a5)
    200c:	00355713          	srli	a4,a0,0x3
    2010:	00277713          	andi	a4,a4,2
    2014:	00e7a023          	sw	a4,0(a5)
    2018:	00176713          	ori	a4,a4,1
    201c:	00e7a023          	sw	a4,0(a5)
    2020:	00255713          	srli	a4,a0,0x2
    2024:	00277713          	andi	a4,a4,2
    2028:	00e7a023          	sw	a4,0(a5)
    202c:	00176713          	ori	a4,a4,1
    2030:	00e7a023          	sw	a4,0(a5)
    2034:	00155713          	srli	a4,a0,0x1
    2038:	00277713          	andi	a4,a4,2
    203c:	00e7a023          	sw	a4,0(a5)
    2040:	00176713          	ori	a4,a4,1
    2044:	00e7a023          	sw	a4,0(a5)
    2048:	00257713          	andi	a4,a0,2
    204c:	00e7a023          	sw	a4,0(a5)
    2050:	00151513          	slli	a0,a0,0x1
    2054:	00176713          	ori	a4,a4,1
    2058:	00e7a023          	sw	a4,0(a5)
    205c:	00257513          	andi	a0,a0,2
    2060:	00a7a023          	sw	a0,0(a5)
    2064:	00156513          	ori	a0,a0,1
    2068:	00a7a023          	sw	a0,0(a5)
    206c:	00200713          	li	a4,2
    2070:	00e7a023          	sw	a4,0(a5)
    2074:	000067b7          	lui	a5,0x6
    2078:	70c7a783          	lw	a5,1804(a5) # 670c <sdcard_while_loading_callback>
    207c:	00078067          	jr	a5

00002080 <sdcard_read>:
    2080:	fd010113          	addi	sp,sp,-48
    2084:	fff50793          	addi	a5,a0,-1
    2088:	03212023          	sw	s2,32(sp)
    208c:	00100913          	li	s2,1
    2090:	00f91933          	sll	s2,s2,a5
    2094:	000067b7          	lui	a5,0x6
    2098:	01312e23          	sw	s3,28(sp)
    209c:	13c7a983          	lw	s3,316(a5) # 613c <SDCARD>
    20a0:	02812423          	sw	s0,40(sp)
    20a4:	02912223          	sw	s1,36(sp)
    20a8:	01412c23          	sw	s4,24(sp)
    20ac:	01512a23          	sw	s5,20(sp)
    20b0:	01612823          	sw	s6,16(sp)
    20b4:	02112623          	sw	ra,44(sp)
    20b8:	0ff00413          	li	s0,255
    20bc:	00000493          	li	s1,0
    20c0:	00300a13          	li	s4,3
    20c4:	00200a93          	li	s5,2
    20c8:	00006b37          	lui	s6,0x6
    20cc:	02058c63          	beqz	a1,2104 <sdcard_read+0x84>
    20d0:	012477b3          	and	a5,s0,s2
    20d4:	02079a63          	bnez	a5,2108 <sdcard_read+0x88>
    20d8:	02c12083          	lw	ra,44(sp)
    20dc:	0ff47513          	zext.b	a0,s0
    20e0:	02812403          	lw	s0,40(sp)
    20e4:	02412483          	lw	s1,36(sp)
    20e8:	02012903          	lw	s2,32(sp)
    20ec:	01c12983          	lw	s3,28(sp)
    20f0:	01812a03          	lw	s4,24(sp)
    20f4:	01412a83          	lw	s5,20(sp)
    20f8:	01012b03          	lw	s6,16(sp)
    20fc:	03010113          	addi	sp,sp,48
    2100:	00008067          	ret
    2104:	fca4dae3          	bge	s1,a0,20d8 <sdcard_read+0x58>
    2108:	0149a023          	sw	s4,0(s3)
    210c:	0159a023          	sw	s5,0(s3)
    2110:	0009a783          	lw	a5,0(s3)
    2114:	00141413          	slli	s0,s0,0x1
    2118:	00b12623          	sw	a1,12(sp)
    211c:	00f46433          	or	s0,s0,a5
    2120:	70cb2783          	lw	a5,1804(s6) # 670c <sdcard_while_loading_callback>
    2124:	00a12423          	sw	a0,8(sp)
    2128:	00148493          	addi	s1,s1,1
    212c:	000780e7          	jalr	a5
    2130:	00c12583          	lw	a1,12(sp)
    2134:	00812503          	lw	a0,8(sp)
    2138:	f95ff06f          	j	20cc <sdcard_read+0x4c>

0000213c <sdcard_get>:
    213c:	fe010113          	addi	sp,sp,-32
    2140:	00112e23          	sw	ra,28(sp)
    2144:	00812c23          	sw	s0,24(sp)
    2148:	00912a23          	sw	s1,20(sp)
    214c:	00050413          	mv	s0,a0
    2150:	00b12623          	sw	a1,12(sp)
    2154:	00000097          	auipc	ra,0x0
    2158:	e20080e7          	jalr	-480(ra) # 1f74 <sdcard_select>
    215c:	00c12583          	lw	a1,12(sp)
    2160:	00040513          	mv	a0,s0
    2164:	00100493          	li	s1,1
    2168:	00000097          	auipc	ra,0x0
    216c:	f18080e7          	jalr	-232(ra) # 2080 <sdcard_read>
    2170:	00345413          	srli	s0,s0,0x3
    2174:	0284c463          	blt	s1,s0,219c <sdcard_get+0x60>
    2178:	00a12623          	sw	a0,12(sp)
    217c:	00000097          	auipc	ra,0x0
    2180:	e38080e7          	jalr	-456(ra) # 1fb4 <sdcard_unselect>
    2184:	01c12083          	lw	ra,28(sp)
    2188:	01812403          	lw	s0,24(sp)
    218c:	00c12503          	lw	a0,12(sp)
    2190:	01412483          	lw	s1,20(sp)
    2194:	02010113          	addi	sp,sp,32
    2198:	00008067          	ret
    219c:	00000593          	li	a1,0
    21a0:	00800513          	li	a0,8
    21a4:	00000097          	auipc	ra,0x0
    21a8:	edc080e7          	jalr	-292(ra) # 2080 <sdcard_read>
    21ac:	00148493          	addi	s1,s1,1
    21b0:	fc5ff06f          	j	2174 <sdcard_get+0x38>

000021b4 <sdcard_cmd>:
    21b4:	ff010113          	addi	sp,sp,-16
    21b8:	00812423          	sw	s0,8(sp)
    21bc:	00912223          	sw	s1,4(sp)
    21c0:	01212023          	sw	s2,0(sp)
    21c4:	00112623          	sw	ra,12(sp)
    21c8:	00050913          	mv	s2,a0
    21cc:	00000413          	li	s0,0
    21d0:	00000097          	auipc	ra,0x0
    21d4:	da4080e7          	jalr	-604(ra) # 1f74 <sdcard_select>
    21d8:	00600493          	li	s1,6
    21dc:	008907b3          	add	a5,s2,s0
    21e0:	0007c503          	lbu	a0,0(a5)
    21e4:	00140413          	addi	s0,s0,1
    21e8:	00000097          	auipc	ra,0x0
    21ec:	de0080e7          	jalr	-544(ra) # 1fc8 <sdcard_send>
    21f0:	fe9416e3          	bne	s0,s1,21dc <sdcard_cmd+0x28>
    21f4:	00812403          	lw	s0,8(sp)
    21f8:	00c12083          	lw	ra,12(sp)
    21fc:	00412483          	lw	s1,4(sp)
    2200:	00012903          	lw	s2,0(sp)
    2204:	01010113          	addi	sp,sp,16
    2208:	00000317          	auipc	t1,0x0
    220c:	dac30067          	jr	-596(t1) # 1fb4 <sdcard_unselect>

00002210 <sdcard_start_sector>:
    2210:	ff010113          	addi	sp,sp,-16
    2214:	00112623          	sw	ra,12(sp)
    2218:	00812423          	sw	s0,8(sp)
    221c:	00050413          	mv	s0,a0
    2220:	00000097          	auipc	ra,0x0
    2224:	d54080e7          	jalr	-684(ra) # 1f74 <sdcard_select>
    2228:	05100513          	li	a0,81
    222c:	00000097          	auipc	ra,0x0
    2230:	d9c080e7          	jalr	-612(ra) # 1fc8 <sdcard_send>
    2234:	01845513          	srli	a0,s0,0x18
    2238:	00000097          	auipc	ra,0x0
    223c:	d90080e7          	jalr	-624(ra) # 1fc8 <sdcard_send>
    2240:	41045513          	srai	a0,s0,0x10
    2244:	0ff57513          	zext.b	a0,a0
    2248:	00000097          	auipc	ra,0x0
    224c:	d80080e7          	jalr	-640(ra) # 1fc8 <sdcard_send>
    2250:	40845513          	srai	a0,s0,0x8
    2254:	0ff57513          	zext.b	a0,a0
    2258:	00000097          	auipc	ra,0x0
    225c:	d70080e7          	jalr	-656(ra) # 1fc8 <sdcard_send>
    2260:	0ff47513          	zext.b	a0,s0
    2264:	00000097          	auipc	ra,0x0
    2268:	d64080e7          	jalr	-668(ra) # 1fc8 <sdcard_send>
    226c:	05500513          	li	a0,85
    2270:	00000097          	auipc	ra,0x0
    2274:	d58080e7          	jalr	-680(ra) # 1fc8 <sdcard_send>
    2278:	00000097          	auipc	ra,0x0
    227c:	d3c080e7          	jalr	-708(ra) # 1fb4 <sdcard_unselect>
    2280:	00812403          	lw	s0,8(sp)
    2284:	00c12083          	lw	ra,12(sp)
    2288:	00100593          	li	a1,1
    228c:	00800513          	li	a0,8
    2290:	01010113          	addi	sp,sp,16
    2294:	00000317          	auipc	t1,0x0
    2298:	ea830067          	jr	-344(t1) # 213c <sdcard_get>

0000229c <sdcard_read_sector>:
    229c:	ff010113          	addi	sp,sp,-16
    22a0:	00812423          	sw	s0,8(sp)
    22a4:	00112623          	sw	ra,12(sp)
    22a8:	00912223          	sw	s1,4(sp)
    22ac:	01212023          	sw	s2,0(sp)
    22b0:	00058413          	mv	s0,a1
    22b4:	00000097          	auipc	ra,0x0
    22b8:	f5c080e7          	jalr	-164(ra) # 2210 <sdcard_start_sector>
    22bc:	04051863          	bnez	a0,230c <sdcard_read_sector+0x70>
    22c0:	00100593          	li	a1,1
    22c4:	00058513          	mv	a0,a1
    22c8:	00000097          	auipc	ra,0x0
    22cc:	e74080e7          	jalr	-396(ra) # 213c <sdcard_get>
    22d0:	00000493          	li	s1,0
    22d4:	20000913          	li	s2,512
    22d8:	00000593          	li	a1,0
    22dc:	00800513          	li	a0,8
    22e0:	00000097          	auipc	ra,0x0
    22e4:	e5c080e7          	jalr	-420(ra) # 213c <sdcard_get>
    22e8:	009407b3          	add	a5,s0,s1
    22ec:	00a78023          	sb	a0,0(a5)
    22f0:	00148493          	addi	s1,s1,1
    22f4:	ff2492e3          	bne	s1,s2,22d8 <sdcard_read_sector+0x3c>
    22f8:	00100593          	li	a1,1
    22fc:	01000513          	li	a0,16
    2300:	20040413          	addi	s0,s0,512
    2304:	00000097          	auipc	ra,0x0
    2308:	e38080e7          	jalr	-456(ra) # 213c <sdcard_get>
    230c:	00c12083          	lw	ra,12(sp)
    2310:	00040513          	mv	a0,s0
    2314:	00812403          	lw	s0,8(sp)
    2318:	00412483          	lw	s1,4(sp)
    231c:	00012903          	lw	s2,0(sp)
    2320:	01010113          	addi	sp,sp,16
    2324:	00008067          	ret

00002328 <sdcard_preinit>:
    2328:	ff010113          	addi	sp,sp,-16
    232c:	000067b7          	lui	a5,0x6
    2330:	00812423          	sw	s0,8(sp)
    2334:	13c7a403          	lw	s0,316(a5) # 613c <SDCARD>
    2338:	00112623          	sw	ra,12(sp)
    233c:	00600793          	li	a5,6
    2340:	01313537          	lui	a0,0x1313
    2344:	00f42023          	sw	a5,0(s0)
    2348:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
    234c:	00000097          	auipc	ra,0x0
    2350:	c10080e7          	jalr	-1008(ra) # 1f5c <pause>
    2354:	0a000793          	li	a5,160
    2358:	00000713          	li	a4,0
    235c:	00676693          	ori	a3,a4,6
    2360:	00d42023          	sw	a3,0(s0)
    2364:	fff78793          	addi	a5,a5,-1
    2368:	00174713          	xori	a4,a4,1
    236c:	fe0798e3          	bnez	a5,235c <sdcard_preinit+0x34>
    2370:	00600793          	li	a5,6
    2374:	00c12083          	lw	ra,12(sp)
    2378:	00f42023          	sw	a5,0(s0)
    237c:	00812403          	lw	s0,8(sp)
    2380:	01010113          	addi	sp,sp,16
    2384:	00008067          	ret

00002388 <sdcard_init>:
    2388:	000027b7          	lui	a5,0x2
    238c:	f7078793          	addi	a5,a5,-144 # 1f70 <sdcard_idle>
    2390:	00006737          	lui	a4,0x6
    2394:	fe010113          	addi	sp,sp,-32
    2398:	70f72623          	sw	a5,1804(a4) # 670c <sdcard_while_loading_callback>
    239c:	000067b7          	lui	a5,0x6
    23a0:	00812c23          	sw	s0,24(sp)
    23a4:	00912a23          	sw	s1,20(sp)
    23a8:	00112e23          	sw	ra,28(sp)
    23ac:	12878493          	addi	s1,a5,296 # 6128 <cmd0>
    23b0:	0ff00413          	li	s0,255
    23b4:	00000097          	auipc	ra,0x0
    23b8:	f74080e7          	jalr	-140(ra) # 2328 <sdcard_preinit>
    23bc:	00048513          	mv	a0,s1
    23c0:	00000097          	auipc	ra,0x0
    23c4:	df4080e7          	jalr	-524(ra) # 21b4 <sdcard_cmd>
    23c8:	00100593          	li	a1,1
    23cc:	00800513          	li	a0,8
    23d0:	00000097          	auipc	ra,0x0
    23d4:	d6c080e7          	jalr	-660(ra) # 213c <sdcard_get>
    23d8:	00a12623          	sw	a0,12(sp)
    23dc:	00000097          	auipc	ra,0x0
    23e0:	bac080e7          	jalr	-1108(ra) # 1f88 <sdcard_ponder>
    23e4:	00c12503          	lw	a0,12(sp)
    23e8:	00851c63          	bne	a0,s0,2400 <sdcard_init+0x78>
    23ec:	01313537          	lui	a0,0x1313
    23f0:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
    23f4:	00000097          	auipc	ra,0x0
    23f8:	b68080e7          	jalr	-1176(ra) # 1f5c <pause>
    23fc:	fb9ff06f          	j	23b4 <sdcard_init+0x2c>
    2400:	00006537          	lui	a0,0x6
    2404:	12050513          	addi	a0,a0,288 # 6120 <cmd8>
    2408:	00000097          	auipc	ra,0x0
    240c:	dac080e7          	jalr	-596(ra) # 21b4 <sdcard_cmd>
    2410:	00100593          	li	a1,1
    2414:	02800513          	li	a0,40
    2418:	00000097          	auipc	ra,0x0
    241c:	d24080e7          	jalr	-732(ra) # 213c <sdcard_get>
    2420:	00000097          	auipc	ra,0x0
    2424:	b68080e7          	jalr	-1176(ra) # 1f88 <sdcard_ponder>
    2428:	000067b7          	lui	a5,0x6
    242c:	11878413          	addi	s0,a5,280 # 6118 <cmd55>
    2430:	000067b7          	lui	a5,0x6
    2434:	11078493          	addi	s1,a5,272 # 6110 <acmd41>
    2438:	00040513          	mv	a0,s0
    243c:	00000097          	auipc	ra,0x0
    2440:	d78080e7          	jalr	-648(ra) # 21b4 <sdcard_cmd>
    2444:	00100593          	li	a1,1
    2448:	00800513          	li	a0,8
    244c:	00000097          	auipc	ra,0x0
    2450:	cf0080e7          	jalr	-784(ra) # 213c <sdcard_get>
    2454:	00000097          	auipc	ra,0x0
    2458:	b34080e7          	jalr	-1228(ra) # 1f88 <sdcard_ponder>
    245c:	00048513          	mv	a0,s1
    2460:	00000097          	auipc	ra,0x0
    2464:	d54080e7          	jalr	-684(ra) # 21b4 <sdcard_cmd>
    2468:	00100593          	li	a1,1
    246c:	00800513          	li	a0,8
    2470:	00000097          	auipc	ra,0x0
    2474:	ccc080e7          	jalr	-820(ra) # 213c <sdcard_get>
    2478:	00a12623          	sw	a0,12(sp)
    247c:	00000097          	auipc	ra,0x0
    2480:	b0c080e7          	jalr	-1268(ra) # 1f88 <sdcard_ponder>
    2484:	00c12503          	lw	a0,12(sp)
    2488:	00050c63          	beqz	a0,24a0 <sdcard_init+0x118>
    248c:	001e8537          	lui	a0,0x1e8
    2490:	48050513          	addi	a0,a0,1152 # 1e8480 <__stacktop+0x1d8480>
    2494:	00000097          	auipc	ra,0x0
    2498:	ac8080e7          	jalr	-1336(ra) # 1f5c <pause>
    249c:	f9dff06f          	j	2438 <sdcard_init+0xb0>
    24a0:	00006537          	lui	a0,0x6
    24a4:	10850513          	addi	a0,a0,264 # 6108 <cmd16>
    24a8:	00000097          	auipc	ra,0x0
    24ac:	d0c080e7          	jalr	-756(ra) # 21b4 <sdcard_cmd>
    24b0:	00100593          	li	a1,1
    24b4:	00800513          	li	a0,8
    24b8:	00000097          	auipc	ra,0x0
    24bc:	c84080e7          	jalr	-892(ra) # 213c <sdcard_get>
    24c0:	01812403          	lw	s0,24(sp)
    24c4:	01c12083          	lw	ra,28(sp)
    24c8:	01412483          	lw	s1,20(sp)
    24cc:	02010113          	addi	sp,sp,32
    24d0:	00000317          	auipc	t1,0x0
    24d4:	ab830067          	jr	-1352(t1) # 1f88 <sdcard_ponder>

000024d8 <sdcard_readsector>:
    24d8:	04060663          	beqz	a2,2524 <sdcard_readsector+0x4c>
    24dc:	ff010113          	addi	sp,sp,-16
    24e0:	00812423          	sw	s0,8(sp)
    24e4:	00912223          	sw	s1,4(sp)
    24e8:	00112623          	sw	ra,12(sp)
    24ec:	00050413          	mv	s0,a0
    24f0:	00a604b3          	add	s1,a2,a0
    24f4:	00040513          	mv	a0,s0
    24f8:	00000097          	auipc	ra,0x0
    24fc:	da4080e7          	jalr	-604(ra) # 229c <sdcard_read_sector>
    2500:	00140413          	addi	s0,s0,1
    2504:	00050593          	mv	a1,a0
    2508:	fe9416e3          	bne	s0,s1,24f4 <sdcard_readsector+0x1c>
    250c:	00c12083          	lw	ra,12(sp)
    2510:	00812403          	lw	s0,8(sp)
    2514:	00412483          	lw	s1,4(sp)
    2518:	00100513          	li	a0,1
    251c:	01010113          	addi	sp,sp,16
    2520:	00008067          	ret
    2524:	00000513          	li	a0,0
    2528:	00008067          	ret

0000252c <sdcard_writesector>:
    252c:	00000513          	li	a0,0
    2530:	00008067          	ret

00002534 <__divsi3>:
    2534:	06054063          	bltz	a0,2594 <__umodsi3+0x10>
    2538:	0605c663          	bltz	a1,25a4 <__umodsi3+0x20>

0000253c <__udivsi3>:
    253c:	00058613          	mv	a2,a1
    2540:	00050593          	mv	a1,a0
    2544:	fff00513          	li	a0,-1
    2548:	02060c63          	beqz	a2,2580 <__udivsi3+0x44>
    254c:	00100693          	li	a3,1
    2550:	00b67a63          	bgeu	a2,a1,2564 <__udivsi3+0x28>
    2554:	00c05863          	blez	a2,2564 <__udivsi3+0x28>
    2558:	00161613          	slli	a2,a2,0x1
    255c:	00169693          	slli	a3,a3,0x1
    2560:	feb66ae3          	bltu	a2,a1,2554 <__udivsi3+0x18>
    2564:	00000513          	li	a0,0
    2568:	00c5e663          	bltu	a1,a2,2574 <__udivsi3+0x38>
    256c:	40c585b3          	sub	a1,a1,a2
    2570:	00d56533          	or	a0,a0,a3
    2574:	0016d693          	srli	a3,a3,0x1
    2578:	00165613          	srli	a2,a2,0x1
    257c:	fe0696e3          	bnez	a3,2568 <__udivsi3+0x2c>
    2580:	00008067          	ret

00002584 <__umodsi3>:
    2584:	00008293          	mv	t0,ra
    2588:	fb5ff0ef          	jal	253c <__udivsi3>
    258c:	00058513          	mv	a0,a1
    2590:	00028067          	jr	t0
    2594:	40a00533          	neg	a0,a0
    2598:	0005d863          	bgez	a1,25a8 <__umodsi3+0x24>
    259c:	40b005b3          	neg	a1,a1
    25a0:	f95ff06f          	j	2534 <__divsi3>
    25a4:	40b005b3          	neg	a1,a1
    25a8:	00008293          	mv	t0,ra
    25ac:	f89ff0ef          	jal	2534 <__divsi3>
    25b0:	40a00533          	neg	a0,a0
    25b4:	00028067          	jr	t0

000025b8 <__modsi3>:
    25b8:	00008293          	mv	t0,ra
    25bc:	0005ca63          	bltz	a1,25d0 <__modsi3+0x18>
    25c0:	00054c63          	bltz	a0,25d8 <__modsi3+0x20>
    25c4:	f79ff0ef          	jal	253c <__udivsi3>
    25c8:	00058513          	mv	a0,a1
    25cc:	00028067          	jr	t0
    25d0:	40b005b3          	neg	a1,a1
    25d4:	fe0558e3          	bgez	a0,25c4 <__modsi3+0xc>
    25d8:	40a00533          	neg	a0,a0
    25dc:	f61ff0ef          	jal	253c <__udivsi3>
    25e0:	40b00533          	neg	a0,a1
    25e4:	00028067          	jr	t0

000025e8 <memset>:
    25e8:	00c50633          	add	a2,a0,a2
    25ec:	00050793          	mv	a5,a0
    25f0:	00c79463          	bne	a5,a2,25f8 <memset+0x10>
    25f4:	00008067          	ret
    25f8:	00178793          	addi	a5,a5,1
    25fc:	feb78fa3          	sb	a1,-1(a5)
    2600:	ff1ff06f          	j	25f0 <memset+0x8>

00002604 <memcpy>:
    2604:	00000793          	li	a5,0
    2608:	00c79463          	bne	a5,a2,2610 <memcpy+0xc>
    260c:	00008067          	ret
    2610:	00f58733          	add	a4,a1,a5
    2614:	00074683          	lbu	a3,0(a4)
    2618:	00f50733          	add	a4,a0,a5
    261c:	00178793          	addi	a5,a5,1
    2620:	00d70023          	sb	a3,0(a4)
    2624:	fe5ff06f          	j	2608 <memcpy+0x4>

00002628 <strlen>:
    2628:	00000793          	li	a5,0
    262c:	00f50733          	add	a4,a0,a5
    2630:	00074703          	lbu	a4,0(a4)
    2634:	00071663          	bnez	a4,2640 <strlen+0x18>
    2638:	00078513          	mv	a0,a5
    263c:	00008067          	ret
    2640:	00178793          	addi	a5,a5,1
    2644:	fe9ff06f          	j	262c <strlen+0x4>

00002648 <strncmp>:
    2648:	00000793          	li	a5,0
    264c:	00c79663          	bne	a5,a2,2658 <strncmp+0x10>
    2650:	00000513          	li	a0,0
    2654:	00008067          	ret
    2658:	00f50733          	add	a4,a0,a5
    265c:	00074683          	lbu	a3,0(a4)
    2660:	00f58733          	add	a4,a1,a5
    2664:	00074703          	lbu	a4,0(a4)
    2668:	00e6e863          	bltu	a3,a4,2678 <strncmp+0x30>
    266c:	00d76a63          	bltu	a4,a3,2680 <strncmp+0x38>
    2670:	00178793          	addi	a5,a5,1
    2674:	fd9ff06f          	j	264c <strncmp+0x4>
    2678:	fff00513          	li	a0,-1
    267c:	00008067          	ret
    2680:	00100513          	li	a0,1
    2684:	00008067          	ret

00002688 <strncpy>:
    2688:	00000793          	li	a5,0
    268c:	00c79463          	bne	a5,a2,2694 <strncpy+0xc>
    2690:	00008067          	ret
    2694:	00f58733          	add	a4,a1,a5
    2698:	00074683          	lbu	a3,0(a4)
    269c:	00f50733          	add	a4,a0,a5
    26a0:	00178793          	addi	a5,a5,1
    26a4:	00d70023          	sb	a3,0(a4)
    26a8:	fe5ff06f          	j	268c <strncpy+0x4>

000026ac <strcpy>:
    26ac:	0005c783          	lbu	a5,0(a1)
    26b0:	00079663          	bnez	a5,26bc <strcpy+0x10>
    26b4:	00050023          	sb	zero,0(a0)
    26b8:	00008067          	ret
    26bc:	00150513          	addi	a0,a0,1
    26c0:	00158593          	addi	a1,a1,1
    26c4:	fef50fa3          	sb	a5,-1(a0)
    26c8:	fe5ff06f          	j	26ac <strcpy>

000026cc <oled_wait>:
    26cc:	00000013          	nop
    26d0:	00000013          	nop
    26d4:	00000013          	nop
    26d8:	00000013          	nop
    26dc:	00000013          	nop
    26e0:	00000013          	nop
    26e4:	00000013          	nop
    26e8:	00008067          	ret

000026ec <oled_init_mode>:
    26ec:	000067b7          	lui	a5,0x6
    26f0:	1407a703          	lw	a4,320(a5) # 6140 <OLED_RST>
    26f4:	fe010113          	addi	sp,sp,-32
    26f8:	00112e23          	sw	ra,28(sp)
    26fc:	00812c23          	sw	s0,24(sp)
    2700:	00072023          	sw	zero,0(a4)
    2704:	00040737          	lui	a4,0x40
    2708:	00000013          	nop
    270c:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
    2710:	fe071ce3          	bnez	a4,2708 <oled_init_mode+0x1c>
    2714:	1407a703          	lw	a4,320(a5)
    2718:	00100693          	li	a3,1
    271c:	00d72023          	sw	a3,0(a4)
    2720:	00040737          	lui	a4,0x40
    2724:	00000013          	nop
    2728:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
    272c:	fe071ce3          	bnez	a4,2724 <oled_init_mode+0x38>
    2730:	1407a783          	lw	a5,320(a5)
    2734:	0007a023          	sw	zero,0(a5)
    2738:	000407b7          	lui	a5,0x40
    273c:	00000013          	nop
    2740:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
    2744:	fe079ce3          	bnez	a5,273c <oled_init_mode+0x50>
    2748:	00006737          	lui	a4,0x6
    274c:	14472783          	lw	a5,324(a4) # 6144 <OLED>
    2750:	2af00693          	li	a3,687
    2754:	00d7a023          	sw	a3,0(a5)
    2758:	000407b7          	lui	a5,0x40
    275c:	00000013          	nop
    2760:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
    2764:	fe079ce3          	bnez	a5,275c <oled_init_mode+0x70>
    2768:	14472403          	lw	s0,324(a4)
    276c:	2a000793          	li	a5,672
    2770:	00a12623          	sw	a0,12(sp)
    2774:	00f42023          	sw	a5,0(s0)
    2778:	00000097          	auipc	ra,0x0
    277c:	f54080e7          	jalr	-172(ra) # 26cc <oled_wait>
    2780:	00c12503          	lw	a0,12(sp)
    2784:	4a000793          	li	a5,1184
    2788:	00050463          	beqz	a0,2790 <oled_init_mode+0xa4>
    278c:	42000793          	li	a5,1056
    2790:	00f42023          	sw	a5,0(s0)
    2794:	00000097          	auipc	ra,0x0
    2798:	f38080e7          	jalr	-200(ra) # 26cc <oled_wait>
    279c:	2fd00793          	li	a5,765
    27a0:	00f42023          	sw	a5,0(s0)
    27a4:	00000097          	auipc	ra,0x0
    27a8:	f28080e7          	jalr	-216(ra) # 26cc <oled_wait>
    27ac:	4b100793          	li	a5,1201
    27b0:	00f42023          	sw	a5,0(s0)
    27b4:	00000097          	auipc	ra,0x0
    27b8:	f18080e7          	jalr	-232(ra) # 26cc <oled_wait>
    27bc:	2a200793          	li	a5,674
    27c0:	00f42023          	sw	a5,0(s0)
    27c4:	00000097          	auipc	ra,0x0
    27c8:	f08080e7          	jalr	-248(ra) # 26cc <oled_wait>
    27cc:	40000793          	li	a5,1024
    27d0:	00f42023          	sw	a5,0(s0)
    27d4:	01812403          	lw	s0,24(sp)
    27d8:	01c12083          	lw	ra,28(sp)
    27dc:	02010113          	addi	sp,sp,32
    27e0:	00000317          	auipc	t1,0x0
    27e4:	eec30067          	jr	-276(t1) # 26cc <oled_wait>

000027e8 <oled_init>:
    27e8:	00000513          	li	a0,0
    27ec:	00000317          	auipc	t1,0x0
    27f0:	f0030067          	jr	-256(t1) # 26ec <oled_init_mode>

000027f4 <oled_fullscreen>:
    27f4:	ff010113          	addi	sp,sp,-16
    27f8:	000067b7          	lui	a5,0x6
    27fc:	00812423          	sw	s0,8(sp)
    2800:	1447a403          	lw	s0,324(a5) # 6144 <OLED>
    2804:	00112623          	sw	ra,12(sp)
    2808:	00912223          	sw	s1,4(sp)
    280c:	01212023          	sw	s2,0(sp)
    2810:	21500793          	li	a5,533
    2814:	00f42023          	sw	a5,0(s0)
    2818:	40000913          	li	s2,1024
    281c:	00000097          	auipc	ra,0x0
    2820:	eb0080e7          	jalr	-336(ra) # 26cc <oled_wait>
    2824:	47f00493          	li	s1,1151
    2828:	01242023          	sw	s2,0(s0)
    282c:	00000097          	auipc	ra,0x0
    2830:	ea0080e7          	jalr	-352(ra) # 26cc <oled_wait>
    2834:	00942023          	sw	s1,0(s0)
    2838:	00000097          	auipc	ra,0x0
    283c:	e94080e7          	jalr	-364(ra) # 26cc <oled_wait>
    2840:	27500793          	li	a5,629
    2844:	00f42023          	sw	a5,0(s0)
    2848:	00000097          	auipc	ra,0x0
    284c:	e84080e7          	jalr	-380(ra) # 26cc <oled_wait>
    2850:	01242023          	sw	s2,0(s0)
    2854:	00000097          	auipc	ra,0x0
    2858:	e78080e7          	jalr	-392(ra) # 26cc <oled_wait>
    285c:	00942023          	sw	s1,0(s0)
    2860:	00000097          	auipc	ra,0x0
    2864:	e6c080e7          	jalr	-404(ra) # 26cc <oled_wait>
    2868:	25c00793          	li	a5,604
    286c:	00f42023          	sw	a5,0(s0)
    2870:	00812403          	lw	s0,8(sp)
    2874:	00c12083          	lw	ra,12(sp)
    2878:	00412483          	lw	s1,4(sp)
    287c:	00012903          	lw	s2,0(sp)
    2880:	01010113          	addi	sp,sp,16
    2884:	00000317          	auipc	t1,0x0
    2888:	e4830067          	jr	-440(t1) # 26cc <oled_wait>

0000288c <display_framebuffer>:
    288c:	000067b7          	lui	a5,0x6
    2890:	1347a503          	lw	a0,308(a5) # 6134 <DISPLAY>
    2894:	00008067          	ret

00002898 <display_set_cursor>:
    2898:	000067b7          	lui	a5,0x6
    289c:	70a7ac23          	sw	a0,1816(a5) # 6718 <cursor_x>
    28a0:	000067b7          	lui	a5,0x6
    28a4:	70b7aa23          	sw	a1,1812(a5) # 6714 <cursor_y>
    28a8:	00008067          	ret

000028ac <display_set_front_back_color>:
    28ac:	000067b7          	lui	a5,0x6
    28b0:	70a788a3          	sb	a0,1809(a5) # 6711 <front_color>
    28b4:	000067b7          	lui	a5,0x6
    28b8:	70b78823          	sb	a1,1808(a5) # 6710 <back_color>
    28bc:	00008067          	ret

000028c0 <display_putchar>:
    28c0:	00a00793          	li	a5,10
    28c4:	00006737          	lui	a4,0x6
    28c8:	02f51663          	bne	a0,a5,28f4 <display_putchar+0x34>
    28cc:	70072c23          	sw	zero,1816(a4) # 6718 <cursor_x>
    28d0:	00006737          	lui	a4,0x6
    28d4:	71472783          	lw	a5,1812(a4) # 6714 <cursor_y>
    28d8:	00878793          	addi	a5,a5,8
    28dc:	70f72a23          	sw	a5,1812(a4)
    28e0:	07f00713          	li	a4,127
    28e4:	00f75663          	bge	a4,a5,28f0 <display_putchar+0x30>
    28e8:	000067b7          	lui	a5,0x6
    28ec:	7007aa23          	sw	zero,1812(a5) # 6714 <cursor_y>
    28f0:	00008067          	ret
    28f4:	ff010113          	addi	sp,sp,-16
    28f8:	00812623          	sw	s0,12(sp)
    28fc:	01f00793          	li	a5,31
    2900:	0ca7d263          	bge	a5,a0,29c4 <display_putchar+0x104>
    2904:	00006e37          	lui	t3,0x6
    2908:	714e2783          	lw	a5,1812(t3) # 6714 <cursor_y>
    290c:	07800693          	li	a3,120
    2910:	00800593          	li	a1,8
    2914:	00f6d663          	bge	a3,a5,2920 <display_putchar+0x60>
    2918:	08000593          	li	a1,128
    291c:	40f585b3          	sub	a1,a1,a5
    2920:	71872783          	lw	a5,1816(a4)
    2924:	07b00693          	li	a3,123
    2928:	00500813          	li	a6,5
    292c:	00f6d663          	bge	a3,a5,2938 <display_putchar+0x78>
    2930:	08000813          	li	a6,128
    2934:	40f80833          	sub	a6,a6,a5
    2938:	000067b7          	lui	a5,0x6
    293c:	1347a283          	lw	t0,308(a5) # 6134 <DISPLAY>
    2940:	000066b7          	lui	a3,0x6
    2944:	00251793          	slli	a5,a0,0x2
    2948:	2fc68693          	addi	a3,a3,764 # 62fc <font>
    294c:	00a787b3          	add	a5,a5,a0
    2950:	00d78533          	add	a0,a5,a3
    2954:	00100f93          	li	t6,1
    2958:	00000693          	li	a3,0
    295c:	000063b7          	lui	t2,0x6
    2960:	00006437          	lui	s0,0x6
    2964:	06b6d063          	bge	a3,a1,29c4 <display_putchar+0x104>
    2968:	00df9f33          	sll	t5,t6,a3
    296c:	00050893          	mv	a7,a0
    2970:	00000613          	li	a2,0
    2974:	03c0006f          	j	29b0 <display_putchar+0xf0>
    2978:	f608c783          	lbu	a5,-160(a7)
    297c:	01e7f7b3          	and	a5,a5,t5
    2980:	02078e63          	beqz	a5,29bc <display_putchar+0xfc>
    2984:	71144e83          	lbu	t4,1809(s0) # 6711 <front_color>
    2988:	71872783          	lw	a5,1816(a4)
    298c:	714e2303          	lw	t1,1812(t3)
    2990:	00188893          	addi	a7,a7,1
    2994:	00f607b3          	add	a5,a2,a5
    2998:	00779793          	slli	a5,a5,0x7
    299c:	00668333          	add	t1,a3,t1
    29a0:	006787b3          	add	a5,a5,t1
    29a4:	00f287b3          	add	a5,t0,a5
    29a8:	01d78023          	sb	t4,0(a5)
    29ac:	00160613          	addi	a2,a2,1 # 4001 <fatfs_init+0x17d>
    29b0:	fd0644e3          	blt	a2,a6,2978 <display_putchar+0xb8>
    29b4:	00168693          	addi	a3,a3,1
    29b8:	fadff06f          	j	2964 <display_putchar+0xa4>
    29bc:	7103ce83          	lbu	t4,1808(t2) # 6710 <back_color>
    29c0:	fc9ff06f          	j	2988 <display_putchar+0xc8>
    29c4:	71872783          	lw	a5,1816(a4)
    29c8:	07f00693          	li	a3,127
    29cc:	00578793          	addi	a5,a5,5
    29d0:	00f6c663          	blt	a3,a5,29dc <display_putchar+0x11c>
    29d4:	70f72c23          	sw	a5,1816(a4)
    29d8:	0240006f          	j	29fc <display_putchar+0x13c>
    29dc:	70072c23          	sw	zero,1816(a4)
    29e0:	00006737          	lui	a4,0x6
    29e4:	71472783          	lw	a5,1812(a4) # 6714 <cursor_y>
    29e8:	00878793          	addi	a5,a5,8
    29ec:	70f72a23          	sw	a5,1812(a4)
    29f0:	00f6d663          	bge	a3,a5,29fc <display_putchar+0x13c>
    29f4:	000067b7          	lui	a5,0x6
    29f8:	7007aa23          	sw	zero,1812(a5) # 6714 <cursor_y>
    29fc:	00c12403          	lw	s0,12(sp)
    2a00:	01010113          	addi	sp,sp,16
    2a04:	00008067          	ret

00002a08 <display_refresh>:
    2a08:	00008067          	ret

00002a0c <print_string>:
    2a0c:	ff010113          	addi	sp,sp,-16
    2a10:	00812423          	sw	s0,8(sp)
    2a14:	00912223          	sw	s1,4(sp)
    2a18:	00112623          	sw	ra,12(sp)
    2a1c:	00050413          	mv	s0,a0
    2a20:	000064b7          	lui	s1,0x6
    2a24:	00044503          	lbu	a0,0(s0)
    2a28:	00051c63          	bnez	a0,2a40 <print_string+0x34>
    2a2c:	00c12083          	lw	ra,12(sp)
    2a30:	00812403          	lw	s0,8(sp)
    2a34:	00412483          	lw	s1,4(sp)
    2a38:	01010113          	addi	sp,sp,16
    2a3c:	00008067          	ret
    2a40:	71c4a783          	lw	a5,1820(s1) # 671c <f_putchar>
    2a44:	00140413          	addi	s0,s0,1
    2a48:	000780e7          	jalr	a5
    2a4c:	fd9ff06f          	j	2a24 <print_string+0x18>

00002a50 <print_dec>:
    2a50:	ef010113          	addi	sp,sp,-272
    2a54:	10812423          	sw	s0,264(sp)
    2a58:	10912223          	sw	s1,260(sp)
    2a5c:	10112623          	sw	ra,268(sp)
    2a60:	11212023          	sw	s2,256(sp)
    2a64:	00050413          	mv	s0,a0
    2a68:	000064b7          	lui	s1,0x6
    2a6c:	08045063          	bgez	s0,2aec <print_dec+0x9c>
    2a70:	71c4a783          	lw	a5,1820(s1) # 671c <f_putchar>
    2a74:	02d00513          	li	a0,45
    2a78:	40800433          	neg	s0,s0
    2a7c:	000780e7          	jalr	a5
    2a80:	fedff06f          	j	2a6c <print_dec+0x1c>
    2a84:	00040513          	mv	a0,s0
    2a88:	00a00593          	li	a1,10
    2a8c:	00000097          	auipc	ra,0x0
    2a90:	aa8080e7          	jalr	-1368(ra) # 2534 <__divsi3>
    2a94:	00251793          	slli	a5,a0,0x2
    2a98:	00f507b3          	add	a5,a0,a5
    2a9c:	00179793          	slli	a5,a5,0x1
    2aa0:	40f40433          	sub	s0,s0,a5
    2aa4:	00148493          	addi	s1,s1,1
    2aa8:	fe848fa3          	sb	s0,-1(s1)
    2aac:	00050413          	mv	s0,a0
    2ab0:	fc041ae3          	bnez	s0,2a84 <print_dec+0x34>
    2ab4:	fd2488e3          	beq	s1,s2,2a84 <print_dec+0x34>
    2ab8:	00006437          	lui	s0,0x6
    2abc:	fff4c503          	lbu	a0,-1(s1)
    2ac0:	71c42783          	lw	a5,1820(s0) # 671c <f_putchar>
    2ac4:	fff48493          	addi	s1,s1,-1
    2ac8:	03050513          	addi	a0,a0,48
    2acc:	000780e7          	jalr	a5
    2ad0:	ff2496e3          	bne	s1,s2,2abc <print_dec+0x6c>
    2ad4:	10c12083          	lw	ra,268(sp)
    2ad8:	10812403          	lw	s0,264(sp)
    2adc:	10412483          	lw	s1,260(sp)
    2ae0:	10012903          	lw	s2,256(sp)
    2ae4:	11010113          	addi	sp,sp,272
    2ae8:	00008067          	ret
    2aec:	00010493          	mv	s1,sp
    2af0:	00010913          	mv	s2,sp
    2af4:	fbdff06f          	j	2ab0 <print_dec+0x60>

00002af8 <print_hex_digits>:
    2af8:	fe010113          	addi	sp,sp,-32
    2afc:	00812c23          	sw	s0,24(sp)
    2b00:	00912a23          	sw	s1,20(sp)
    2b04:	fff58413          	addi	s0,a1,-1
    2b08:	000064b7          	lui	s1,0x6
    2b0c:	01212823          	sw	s2,16(sp)
    2b10:	01312623          	sw	s3,12(sp)
    2b14:	00112e23          	sw	ra,28(sp)
    2b18:	00050993          	mv	s3,a0
    2b1c:	00241413          	slli	s0,s0,0x2
    2b20:	2b448493          	addi	s1,s1,692 # 62b4 <LEDS+0x16c>
    2b24:	00006937          	lui	s2,0x6
    2b28:	02045063          	bgez	s0,2b48 <print_hex_digits+0x50>
    2b2c:	01c12083          	lw	ra,28(sp)
    2b30:	01812403          	lw	s0,24(sp)
    2b34:	01412483          	lw	s1,20(sp)
    2b38:	01012903          	lw	s2,16(sp)
    2b3c:	00c12983          	lw	s3,12(sp)
    2b40:	02010113          	addi	sp,sp,32
    2b44:	00008067          	ret
    2b48:	0089d7b3          	srl	a5,s3,s0
    2b4c:	00f7f793          	andi	a5,a5,15
    2b50:	00f487b3          	add	a5,s1,a5
    2b54:	71c92703          	lw	a4,1820(s2) # 671c <f_putchar>
    2b58:	0007c503          	lbu	a0,0(a5)
    2b5c:	ffc40413          	addi	s0,s0,-4
    2b60:	000700e7          	jalr	a4
    2b64:	fc5ff06f          	j	2b28 <print_hex_digits+0x30>

00002b68 <print_hex>:
    2b68:	00800593          	li	a1,8
    2b6c:	00000317          	auipc	t1,0x0
    2b70:	f8c30067          	jr	-116(t1) # 2af8 <print_hex_digits>

00002b74 <printf>:
    2b74:	fa010113          	addi	sp,sp,-96
    2b78:	04f12a23          	sw	a5,84(sp)
    2b7c:	04410793          	addi	a5,sp,68
    2b80:	02812c23          	sw	s0,56(sp)
    2b84:	02912a23          	sw	s1,52(sp)
    2b88:	03212823          	sw	s2,48(sp)
    2b8c:	03312623          	sw	s3,44(sp)
    2b90:	03412423          	sw	s4,40(sp)
    2b94:	03512223          	sw	s5,36(sp)
    2b98:	03612023          	sw	s6,32(sp)
    2b9c:	02112e23          	sw	ra,60(sp)
    2ba0:	01712e23          	sw	s7,28(sp)
    2ba4:	00050413          	mv	s0,a0
    2ba8:	04b12223          	sw	a1,68(sp)
    2bac:	04c12423          	sw	a2,72(sp)
    2bb0:	04d12623          	sw	a3,76(sp)
    2bb4:	04e12823          	sw	a4,80(sp)
    2bb8:	05012c23          	sw	a6,88(sp)
    2bbc:	05112e23          	sw	a7,92(sp)
    2bc0:	00f12623          	sw	a5,12(sp)
    2bc4:	02500913          	li	s2,37
    2bc8:	000064b7          	lui	s1,0x6
    2bcc:	07300993          	li	s3,115
    2bd0:	07800a13          	li	s4,120
    2bd4:	06400a93          	li	s5,100
    2bd8:	06300b13          	li	s6,99
    2bdc:	00044503          	lbu	a0,0(s0)
    2be0:	02051863          	bnez	a0,2c10 <printf+0x9c>
    2be4:	03c12083          	lw	ra,60(sp)
    2be8:	03812403          	lw	s0,56(sp)
    2bec:	03412483          	lw	s1,52(sp)
    2bf0:	03012903          	lw	s2,48(sp)
    2bf4:	02c12983          	lw	s3,44(sp)
    2bf8:	02812a03          	lw	s4,40(sp)
    2bfc:	02412a83          	lw	s5,36(sp)
    2c00:	02012b03          	lw	s6,32(sp)
    2c04:	01c12b83          	lw	s7,28(sp)
    2c08:	06010113          	addi	sp,sp,96
    2c0c:	00008067          	ret
    2c10:	09251a63          	bne	a0,s2,2ca4 <printf+0x130>
    2c14:	00144503          	lbu	a0,1(s0)
    2c18:	00140b93          	addi	s7,s0,1
    2c1c:	03351463          	bne	a0,s3,2c44 <printf+0xd0>
    2c20:	00c12783          	lw	a5,12(sp)
    2c24:	0007a503          	lw	a0,0(a5)
    2c28:	00478713          	addi	a4,a5,4
    2c2c:	00e12623          	sw	a4,12(sp)
    2c30:	00000097          	auipc	ra,0x0
    2c34:	ddc080e7          	jalr	-548(ra) # 2a0c <print_string>
    2c38:	000b8413          	mv	s0,s7
    2c3c:	00140413          	addi	s0,s0,1
    2c40:	f9dff06f          	j	2bdc <printf+0x68>
    2c44:	03451063          	bne	a0,s4,2c64 <printf+0xf0>
    2c48:	00c12783          	lw	a5,12(sp)
    2c4c:	0007a503          	lw	a0,0(a5)
    2c50:	00478713          	addi	a4,a5,4
    2c54:	00e12623          	sw	a4,12(sp)
    2c58:	00000097          	auipc	ra,0x0
    2c5c:	f10080e7          	jalr	-240(ra) # 2b68 <print_hex>
    2c60:	fd9ff06f          	j	2c38 <printf+0xc4>
    2c64:	03551063          	bne	a0,s5,2c84 <printf+0x110>
    2c68:	00c12783          	lw	a5,12(sp)
    2c6c:	0007a503          	lw	a0,0(a5)
    2c70:	00478713          	addi	a4,a5,4
    2c74:	00e12623          	sw	a4,12(sp)
    2c78:	00000097          	auipc	ra,0x0
    2c7c:	dd8080e7          	jalr	-552(ra) # 2a50 <print_dec>
    2c80:	fb9ff06f          	j	2c38 <printf+0xc4>
    2c84:	71c4a783          	lw	a5,1820(s1) # 671c <f_putchar>
    2c88:	01651a63          	bne	a0,s6,2c9c <printf+0x128>
    2c8c:	00c12703          	lw	a4,12(sp)
    2c90:	00072503          	lw	a0,0(a4)
    2c94:	00470693          	addi	a3,a4,4
    2c98:	00d12623          	sw	a3,12(sp)
    2c9c:	000780e7          	jalr	a5
    2ca0:	f99ff06f          	j	2c38 <printf+0xc4>
    2ca4:	71c4a783          	lw	a5,1820(s1)
    2ca8:	000780e7          	jalr	a5
    2cac:	f91ff06f          	j	2c3c <printf+0xc8>

00002cb0 <__mulsi3>:
    2cb0:	00050793          	mv	a5,a0
    2cb4:	00000513          	li	a0,0
    2cb8:	00079463          	bnez	a5,2cc0 <__mulsi3+0x10>
    2cbc:	00008067          	ret
    2cc0:	01f79693          	slli	a3,a5,0x1f
    2cc4:	41f6d713          	srai	a4,a3,0x1f
    2cc8:	00b77733          	and	a4,a4,a1
    2ccc:	00e50533          	add	a0,a0,a4
    2cd0:	0017d793          	srli	a5,a5,0x1
    2cd4:	00159593          	slli	a1,a1,0x1
    2cd8:	fe1ff06f          	j	2cb8 <__mulsi3+0x8>

00002cdc <fat_list_insert_last>:
    2cdc:	00452783          	lw	a5,4(a0)
    2ce0:	04079263          	bnez	a5,2d24 <fat_list_insert_last+0x48>
    2ce4:	00052783          	lw	a5,0(a0)
    2ce8:	00079c63          	bnez	a5,2d00 <fat_list_insert_last+0x24>
    2cec:	00b52023          	sw	a1,0(a0)
    2cf0:	00b52223          	sw	a1,4(a0)
    2cf4:	0005a023          	sw	zero,0(a1)
    2cf8:	0005a223          	sw	zero,4(a1)
    2cfc:	00008067          	ret
    2d00:	0007a703          	lw	a4,0(a5)
    2d04:	00f5a223          	sw	a5,4(a1)
    2d08:	00e5a023          	sw	a4,0(a1)
    2d0c:	00071863          	bnez	a4,2d1c <fat_list_insert_last+0x40>
    2d10:	00b52023          	sw	a1,0(a0)
    2d14:	00b7a023          	sw	a1,0(a5)
    2d18:	00008067          	ret
    2d1c:	00b72223          	sw	a1,4(a4)
    2d20:	ff5ff06f          	j	2d14 <fat_list_insert_last+0x38>
    2d24:	0047a703          	lw	a4,4(a5)
    2d28:	00f5a023          	sw	a5,0(a1)
    2d2c:	00e5a223          	sw	a4,4(a1)
    2d30:	00071863          	bnez	a4,2d40 <fat_list_insert_last+0x64>
    2d34:	00b52223          	sw	a1,4(a0)
    2d38:	00b7a223          	sw	a1,4(a5)
    2d3c:	00008067          	ret
    2d40:	00b72023          	sw	a1,0(a4)
    2d44:	ff5ff06f          	j	2d38 <fat_list_insert_last+0x5c>

00002d48 <FileString_StrCmpNoCase>:
    2d48:	00050e93          	mv	t4,a0
    2d4c:	00000793          	li	a5,0
    2d50:	01900e13          	li	t3,25
    2d54:	00c79663          	bne	a5,a2,2d60 <FileString_StrCmpNoCase+0x18>
    2d58:	00000513          	li	a0,0
    2d5c:	00008067          	ret
    2d60:	00fe8733          	add	a4,t4,a5
    2d64:	00074803          	lbu	a6,0(a4)
    2d68:	00f58733          	add	a4,a1,a5
    2d6c:	00074883          	lbu	a7,0(a4)
    2d70:	fbf80713          	addi	a4,a6,-65
    2d74:	0ff77713          	zext.b	a4,a4
    2d78:	00080693          	mv	a3,a6
    2d7c:	00ee6663          	bltu	t3,a4,2d88 <FileString_StrCmpNoCase+0x40>
    2d80:	02080693          	addi	a3,a6,32
    2d84:	0ff6f693          	zext.b	a3,a3
    2d88:	fbf88313          	addi	t1,a7,-65
    2d8c:	0ff37313          	zext.b	t1,t1
    2d90:	00088713          	mv	a4,a7
    2d94:	006e6663          	bltu	t3,t1,2da0 <FileString_StrCmpNoCase+0x58>
    2d98:	02088713          	addi	a4,a7,32
    2d9c:	0ff77713          	zext.b	a4,a4
    2da0:	40e68533          	sub	a0,a3,a4
    2da4:	00e69863          	bne	a3,a4,2db4 <FileString_StrCmpNoCase+0x6c>
    2da8:	00178793          	addi	a5,a5,1
    2dac:	00088463          	beqz	a7,2db4 <FileString_StrCmpNoCase+0x6c>
    2db0:	fa0812e3          	bnez	a6,2d54 <FileString_StrCmpNoCase+0xc>
    2db4:	00008067          	ret

00002db8 <FileString_GetExtension>:
    2db8:	00050793          	mv	a5,a0
    2dbc:	fff00713          	li	a4,-1
    2dc0:	02e00613          	li	a2,46
    2dc4:	0007c683          	lbu	a3,0(a5)
    2dc8:	00069663          	bnez	a3,2dd4 <FileString_GetExtension+0x1c>
    2dcc:	00070513          	mv	a0,a4
    2dd0:	00008067          	ret
    2dd4:	00c69463          	bne	a3,a2,2ddc <FileString_GetExtension+0x24>
    2dd8:	40a78733          	sub	a4,a5,a0
    2ddc:	00178793          	addi	a5,a5,1
    2de0:	fe5ff06f          	j	2dc4 <FileString_GetExtension+0xc>

00002de4 <fatfs_fat_writeback>:
    2de4:	00059e63          	bnez	a1,2e00 <fatfs_fat_writeback+0x1c>
    2de8:	00000513          	li	a0,0
    2dec:	00008067          	ret
    2df0:	00000513          	li	a0,0
    2df4:	01c12083          	lw	ra,28(sp)
    2df8:	02010113          	addi	sp,sp,32
    2dfc:	00008067          	ret
    2e00:	2045a783          	lw	a5,516(a1)
    2e04:	04078e63          	beqz	a5,2e60 <fatfs_fat_writeback+0x7c>
    2e08:	03852683          	lw	a3,56(a0)
    2e0c:	00050793          	mv	a5,a0
    2e10:	04068663          	beqz	a3,2e5c <fatfs_fat_writeback+0x78>
    2e14:	0147a703          	lw	a4,20(a5)
    2e18:	2005a503          	lw	a0,512(a1)
    2e1c:	0207a803          	lw	a6,32(a5)
    2e20:	00100613          	li	a2,1
    2e24:	fe010113          	addi	sp,sp,-32
    2e28:	40e607b3          	sub	a5,a2,a4
    2e2c:	00112e23          	sw	ra,28(sp)
    2e30:	00a787b3          	add	a5,a5,a0
    2e34:	00f87663          	bgeu	a6,a5,2e40 <fatfs_fat_writeback+0x5c>
    2e38:	01070733          	add	a4,a4,a6
    2e3c:	40a70633          	sub	a2,a4,a0
    2e40:	00b12623          	sw	a1,12(sp)
    2e44:	000680e7          	jalr	a3
    2e48:	fa0504e3          	beqz	a0,2df0 <fatfs_fat_writeback+0xc>
    2e4c:	00c12583          	lw	a1,12(sp)
    2e50:	00100513          	li	a0,1
    2e54:	2005a223          	sw	zero,516(a1)
    2e58:	f9dff06f          	j	2df4 <fatfs_fat_writeback+0x10>
    2e5c:	2005a223          	sw	zero,516(a1)
    2e60:	00100513          	li	a0,1
    2e64:	00008067          	ret

00002e68 <fatfs_fat_read_sector>:
    2e68:	fe010113          	addi	sp,sp,-32
    2e6c:	01212823          	sw	s2,16(sp)
    2e70:	25452903          	lw	s2,596(a0)
    2e74:	00812c23          	sw	s0,24(sp)
    2e78:	00112e23          	sw	ra,28(sp)
    2e7c:	00912a23          	sw	s1,20(sp)
    2e80:	01312623          	sw	s3,12(sp)
    2e84:	00000413          	li	s0,0
    2e88:	04091463          	bnez	s2,2ed0 <fatfs_fat_read_sector+0x68>
    2e8c:	25452783          	lw	a5,596(a0)
    2e90:	00058493          	mv	s1,a1
    2e94:	00050993          	mv	s3,a0
    2e98:	20f42623          	sw	a5,524(s0)
    2e9c:	20442783          	lw	a5,516(s0)
    2ea0:	24852a23          	sw	s0,596(a0)
    2ea4:	08079863          	bnez	a5,2f34 <fatfs_fat_read_sector+0xcc>
    2ea8:	0349a783          	lw	a5,52(s3)
    2eac:	20942023          	sw	s1,512(s0)
    2eb0:	00100613          	li	a2,1
    2eb4:	00040593          	mv	a1,s0
    2eb8:	00048513          	mv	a0,s1
    2ebc:	000780e7          	jalr	a5
    2ec0:	08051463          	bnez	a0,2f48 <fatfs_fat_read_sector+0xe0>
    2ec4:	fff00793          	li	a5,-1
    2ec8:	20f42023          	sw	a5,512(s0)
    2ecc:	0480006f          	j	2f14 <fatfs_fat_read_sector+0xac>
    2ed0:	20092783          	lw	a5,512(s2)
    2ed4:	00f5e663          	bltu	a1,a5,2ee0 <fatfs_fat_read_sector+0x78>
    2ed8:	00178713          	addi	a4,a5,1
    2edc:	02e5e463          	bltu	a1,a4,2f04 <fatfs_fat_read_sector+0x9c>
    2ee0:	20c92783          	lw	a5,524(s2)
    2ee4:	00079663          	bnez	a5,2ef0 <fatfs_fat_read_sector+0x88>
    2ee8:	00040a63          	beqz	s0,2efc <fatfs_fat_read_sector+0x94>
    2eec:	20042623          	sw	zero,524(s0)
    2ef0:	00090413          	mv	s0,s2
    2ef4:	20c92903          	lw	s2,524(s2)
    2ef8:	f91ff06f          	j	2e88 <fatfs_fat_read_sector+0x20>
    2efc:	24052a23          	sw	zero,596(a0)
    2f00:	ff1ff06f          	j	2ef0 <fatfs_fat_read_sector+0x88>
    2f04:	40f585b3          	sub	a1,a1,a5
    2f08:	00959593          	slli	a1,a1,0x9
    2f0c:	00b905b3          	add	a1,s2,a1
    2f10:	20b92423          	sw	a1,520(s2)
    2f14:	01c12083          	lw	ra,28(sp)
    2f18:	01812403          	lw	s0,24(sp)
    2f1c:	01412483          	lw	s1,20(sp)
    2f20:	00c12983          	lw	s3,12(sp)
    2f24:	00090513          	mv	a0,s2
    2f28:	01012903          	lw	s2,16(sp)
    2f2c:	02010113          	addi	sp,sp,32
    2f30:	00008067          	ret
    2f34:	00040593          	mv	a1,s0
    2f38:	00000097          	auipc	ra,0x0
    2f3c:	eac080e7          	jalr	-340(ra) # 2de4 <fatfs_fat_writeback>
    2f40:	f60514e3          	bnez	a0,2ea8 <fatfs_fat_read_sector+0x40>
    2f44:	fd1ff06f          	j	2f14 <fatfs_fat_read_sector+0xac>
    2f48:	20842423          	sw	s0,520(s0)
    2f4c:	00040913          	mv	s2,s0
    2f50:	fc5ff06f          	j	2f14 <fatfs_fat_read_sector+0xac>

00002f54 <_allocate_file>:
    2f54:	000067b7          	lui	a5,0x6
    2f58:	72078793          	addi	a5,a5,1824 # 6720 <_free_file_list>
    2f5c:	0007a583          	lw	a1,0(a5)
    2f60:	06058263          	beqz	a1,2fc4 <_allocate_file+0x70>
    2f64:	0005a703          	lw	a4,0(a1)
    2f68:	fe010113          	addi	sp,sp,-32
    2f6c:	00112e23          	sw	ra,28(sp)
    2f70:	0045a683          	lw	a3,4(a1)
    2f74:	04071063          	bnez	a4,2fb4 <_allocate_file+0x60>
    2f78:	00d7a023          	sw	a3,0(a5)
    2f7c:	0045a683          	lw	a3,4(a1)
    2f80:	02069e63          	bnez	a3,2fbc <_allocate_file+0x68>
    2f84:	00e7a223          	sw	a4,4(a5)
    2f88:	00006537          	lui	a0,0x6
    2f8c:	72850513          	addi	a0,a0,1832 # 6728 <_open_file_list>
    2f90:	00b12623          	sw	a1,12(sp)
    2f94:	00000097          	auipc	ra,0x0
    2f98:	d48080e7          	jalr	-696(ra) # 2cdc <fat_list_insert_last>
    2f9c:	00c12583          	lw	a1,12(sp)
    2fa0:	01c12083          	lw	ra,28(sp)
    2fa4:	bc458593          	addi	a1,a1,-1084
    2fa8:	00058513          	mv	a0,a1
    2fac:	02010113          	addi	sp,sp,32
    2fb0:	00008067          	ret
    2fb4:	00d72223          	sw	a3,4(a4)
    2fb8:	fc5ff06f          	j	2f7c <_allocate_file+0x28>
    2fbc:	00e6a023          	sw	a4,0(a3)
    2fc0:	fc9ff06f          	j	2f88 <_allocate_file+0x34>
    2fc4:	00058513          	mv	a0,a1
    2fc8:	00008067          	ret

00002fcc <_free_file>:
    2fcc:	43c52783          	lw	a5,1084(a0)
    2fd0:	44052703          	lw	a4,1088(a0)
    2fd4:	43c50593          	addi	a1,a0,1084
    2fd8:	02079663          	bnez	a5,3004 <_free_file+0x38>
    2fdc:	000066b7          	lui	a3,0x6
    2fe0:	72e6a423          	sw	a4,1832(a3) # 6728 <_open_file_list>
    2fe4:	44052703          	lw	a4,1088(a0)
    2fe8:	02071263          	bnez	a4,300c <_free_file+0x40>
    2fec:	00006737          	lui	a4,0x6
    2ff0:	72f72623          	sw	a5,1836(a4) # 672c <_open_file_list+0x4>
    2ff4:	00006537          	lui	a0,0x6
    2ff8:	72050513          	addi	a0,a0,1824 # 6720 <_free_file_list>
    2ffc:	00000317          	auipc	t1,0x0
    3000:	ce030067          	jr	-800(t1) # 2cdc <fat_list_insert_last>
    3004:	00e7a223          	sw	a4,4(a5)
    3008:	fddff06f          	j	2fe4 <_free_file+0x18>
    300c:	00f72023          	sw	a5,0(a4)
    3010:	fe5ff06f          	j	2ff4 <_free_file+0x28>

00003014 <fatfs_lba_of_cluster>:
    3014:	ff010113          	addi	sp,sp,-16
    3018:	00812423          	sw	s0,8(sp)
    301c:	00112623          	sw	ra,12(sp)
    3020:	00050413          	mv	s0,a0
    3024:	ffe58513          	addi	a0,a1,-2
    3028:	00044583          	lbu	a1,0(s0)
    302c:	00000097          	auipc	ra,0x0
    3030:	c84080e7          	jalr	-892(ra) # 2cb0 <__mulsi3>
    3034:	00442783          	lw	a5,4(s0)
    3038:	00f50533          	add	a0,a0,a5
    303c:	03042783          	lw	a5,48(s0)
    3040:	00079863          	bnez	a5,3050 <fatfs_lba_of_cluster+0x3c>
    3044:	02845783          	lhu	a5,40(s0)
    3048:	4047d793          	srai	a5,a5,0x4
    304c:	00f50533          	add	a0,a0,a5
    3050:	00c12083          	lw	ra,12(sp)
    3054:	00812403          	lw	s0,8(sp)
    3058:	01010113          	addi	sp,sp,16
    305c:	00008067          	ret

00003060 <fatfs_sector_read>:
    3060:	03452783          	lw	a5,52(a0)
    3064:	00058713          	mv	a4,a1
    3068:	00070513          	mv	a0,a4
    306c:	00060593          	mv	a1,a2
    3070:	00068613          	mv	a2,a3
    3074:	00078067          	jr	a5

00003078 <fatfs_sector_write>:
    3078:	03852783          	lw	a5,56(a0)
    307c:	00058713          	mv	a4,a1
    3080:	00070513          	mv	a0,a4
    3084:	00060593          	mv	a1,a2
    3088:	00068613          	mv	a2,a3
    308c:	00078067          	jr	a5

00003090 <fatfs_write_sector>:
    3090:	03852703          	lw	a4,56(a0)
    3094:	0a070463          	beqz	a4,313c <fatfs_write_sector+0xac>
    3098:	03052883          	lw	a7,48(a0)
    309c:	00050793          	mv	a5,a0
    30a0:	0115e833          	or	a6,a1,a7
    30a4:	02081e63          	bnez	a6,30e0 <fatfs_write_sector+0x50>
    30a8:	01052583          	lw	a1,16(a0)
    30ac:	08b67863          	bgeu	a2,a1,313c <fatfs_write_sector+0xac>
    30b0:	01c52503          	lw	a0,28(a0)
    30b4:	00c7a583          	lw	a1,12(a5)
    30b8:	00b50533          	add	a0,a0,a1
    30bc:	00c50533          	add	a0,a0,a2
    30c0:	00068863          	beqz	a3,30d0 <fatfs_write_sector+0x40>
    30c4:	00100613          	li	a2,1
    30c8:	00068593          	mv	a1,a3
    30cc:	00070067          	jr	a4
    30d0:	24a7a223          	sw	a0,580(a5)
    30d4:	00100613          	li	a2,1
    30d8:	04478593          	addi	a1,a5,68
    30dc:	ff1ff06f          	j	30cc <fatfs_write_sector+0x3c>
    30e0:	fe010113          	addi	sp,sp,-32
    30e4:	00e12623          	sw	a4,12(sp)
    30e8:	00d12423          	sw	a3,8(sp)
    30ec:	00c12223          	sw	a2,4(sp)
    30f0:	00112e23          	sw	ra,28(sp)
    30f4:	00a12023          	sw	a0,0(sp)
    30f8:	00000097          	auipc	ra,0x0
    30fc:	f1c080e7          	jalr	-228(ra) # 3014 <fatfs_lba_of_cluster>
    3100:	00412603          	lw	a2,4(sp)
    3104:	00812683          	lw	a3,8(sp)
    3108:	00012783          	lw	a5,0(sp)
    310c:	00c12703          	lw	a4,12(sp)
    3110:	00a60533          	add	a0,a2,a0
    3114:	00068c63          	beqz	a3,312c <fatfs_write_sector+0x9c>
    3118:	00100613          	li	a2,1
    311c:	00068593          	mv	a1,a3
    3120:	01c12083          	lw	ra,28(sp)
    3124:	02010113          	addi	sp,sp,32
    3128:	fa5ff06f          	j	30cc <fatfs_write_sector+0x3c>
    312c:	24a7a223          	sw	a0,580(a5)
    3130:	00100613          	li	a2,1
    3134:	04478593          	addi	a1,a5,68
    3138:	fe9ff06f          	j	3120 <fatfs_write_sector+0x90>
    313c:	00000513          	li	a0,0
    3140:	00008067          	ret

00003144 <fl_init>:
    3144:	ff010113          	addi	sp,sp,-16
    3148:	00006537          	lui	a0,0x6
    314c:	000067b7          	lui	a5,0x6
    3150:	000095b7          	lui	a1,0x9
    3154:	00112623          	sw	ra,12(sp)
    3158:	72050513          	addi	a0,a0,1824 # 6720 <_free_file_list>
    315c:	72878793          	addi	a5,a5,1832 # 6728 <_open_file_list>
    3160:	bf858593          	addi	a1,a1,-1032 # 8bf8 <_files+0x43c>
    3164:	00052223          	sw	zero,4(a0)
    3168:	00052023          	sw	zero,0(a0)
    316c:	0007a223          	sw	zero,4(a5)
    3170:	0007a023          	sw	zero,0(a5)
    3174:	00000097          	auipc	ra,0x0
    3178:	b68080e7          	jalr	-1176(ra) # 2cdc <fat_list_insert_last>
    317c:	000067b7          	lui	a5,0x6
    3180:	000095b7          	lui	a1,0x9
    3184:	72078513          	addi	a0,a5,1824 # 6720 <_free_file_list>
    3188:	03c58593          	addi	a1,a1,60 # 903c <_files+0x880>
    318c:	00000097          	auipc	ra,0x0
    3190:	b50080e7          	jalr	-1200(ra) # 2cdc <fat_list_insert_last>
    3194:	00c12083          	lw	ra,12(sp)
    3198:	000067b7          	lui	a5,0x6
    319c:	00100713          	li	a4,1
    31a0:	72e7aa23          	sw	a4,1844(a5) # 6734 <_filelib_init>
    31a4:	01010113          	addi	sp,sp,16
    31a8:	00008067          	ret

000031ac <fl_fseek>:
    31ac:	000067b7          	lui	a5,0x6
    31b0:	7347a783          	lw	a5,1844(a5) # 6734 <_filelib_init>
    31b4:	fd010113          	addi	sp,sp,-48
    31b8:	02812423          	sw	s0,40(sp)
    31bc:	02912223          	sw	s1,36(sp)
    31c0:	01312e23          	sw	s3,28(sp)
    31c4:	02112623          	sw	ra,44(sp)
    31c8:	03212023          	sw	s2,32(sp)
    31cc:	00050413          	mv	s0,a0
    31d0:	00058493          	mv	s1,a1
    31d4:	00060993          	mv	s3,a2
    31d8:	00079663          	bnez	a5,31e4 <fl_fseek+0x38>
    31dc:	00000097          	auipc	ra,0x0
    31e0:	f68080e7          	jalr	-152(ra) # 3144 <fl_init>
    31e4:	fff00513          	li	a0,-1
    31e8:	08040263          	beqz	s0,326c <fl_fseek+0xc0>
    31ec:	00048663          	beqz	s1,31f8 <fl_fseek+0x4c>
    31f0:	ffe98793          	addi	a5,s3,-2
    31f4:	06078c63          	beqz	a5,326c <fl_fseek+0xc0>
    31f8:	00008937          	lui	s2,0x8
    31fc:	35490913          	addi	s2,s2,852 # 8354 <_fs>
    3200:	03c92783          	lw	a5,60(s2)
    3204:	00078463          	beqz	a5,320c <fl_fseek+0x60>
    3208:	000780e7          	jalr	a5
    320c:	fff00513          	li	a0,-1
    3210:	42a42823          	sw	a0,1072(s0)
    3214:	42042a23          	sw	zero,1076(s0)
    3218:	00099c63          	bnez	s3,3230 <fl_fseek+0x84>
    321c:	00c42783          	lw	a5,12(s0)
    3220:	00942423          	sw	s1,8(s0)
    3224:	0297f863          	bgeu	a5,s1,3254 <fl_fseek+0xa8>
    3228:	00f42423          	sw	a5,8(s0)
    322c:	0280006f          	j	3254 <fl_fseek+0xa8>
    3230:	00100793          	li	a5,1
    3234:	06f99063          	bne	s3,a5,3294 <fl_fseek+0xe8>
    3238:	00842783          	lw	a5,8(s0)
    323c:	0004c663          	bltz	s1,3248 <fl_fseek+0x9c>
    3240:	00f484b3          	add	s1,s1,a5
    3244:	fd9ff06f          	j	321c <fl_fseek+0x70>
    3248:	40900733          	neg	a4,s1
    324c:	02e7fe63          	bgeu	a5,a4,3288 <fl_fseek+0xdc>
    3250:	00042423          	sw	zero,8(s0)
    3254:	00000513          	li	a0,0
    3258:	04092783          	lw	a5,64(s2)
    325c:	00078863          	beqz	a5,326c <fl_fseek+0xc0>
    3260:	00a12623          	sw	a0,12(sp)
    3264:	000780e7          	jalr	a5
    3268:	00c12503          	lw	a0,12(sp)
    326c:	02c12083          	lw	ra,44(sp)
    3270:	02812403          	lw	s0,40(sp)
    3274:	02412483          	lw	s1,36(sp)
    3278:	02012903          	lw	s2,32(sp)
    327c:	01c12983          	lw	s3,28(sp)
    3280:	03010113          	addi	sp,sp,48
    3284:	00008067          	ret
    3288:	00f484b3          	add	s1,s1,a5
    328c:	00942423          	sw	s1,8(s0)
    3290:	fc5ff06f          	j	3254 <fl_fseek+0xa8>
    3294:	00200793          	li	a5,2
    3298:	fcf990e3          	bne	s3,a5,3258 <fl_fseek+0xac>
    329c:	00c42783          	lw	a5,12(s0)
    32a0:	f89ff06f          	j	3228 <fl_fseek+0x7c>

000032a4 <fl_closedir>:
    32a4:	00000513          	li	a0,0
    32a8:	00008067          	ret

000032ac <fatfs_lfn_cache_entry>:
    32ac:	0005c783          	lbu	a5,0(a1)
    32b0:	01300693          	li	a3,19
    32b4:	01f7f793          	andi	a5,a5,31
    32b8:	fff78713          	addi	a4,a5,-1
    32bc:	0ff77613          	zext.b	a2,a4
    32c0:	0ac6ea63          	bltu	a3,a2,3374 <fatfs_lfn_cache_entry+0xc8>
    32c4:	10554683          	lbu	a3,261(a0)
    32c8:	00069463          	bnez	a3,32d0 <fatfs_lfn_cache_entry+0x24>
    32cc:	10f502a3          	sb	a5,261(a0)
    32d0:	00171793          	slli	a5,a4,0x1
    32d4:	00e787b3          	add	a5,a5,a4
    32d8:	0015c683          	lbu	a3,1(a1)
    32dc:	00279793          	slli	a5,a5,0x2
    32e0:	00e787b3          	add	a5,a5,a4
    32e4:	00f50533          	add	a0,a0,a5
    32e8:	00d50023          	sb	a3,0(a0)
    32ec:	0035c783          	lbu	a5,3(a1)
    32f0:	0ff00713          	li	a4,255
    32f4:	02000693          	li	a3,32
    32f8:	00f500a3          	sb	a5,1(a0)
    32fc:	0055c783          	lbu	a5,5(a1)
    3300:	00f50123          	sb	a5,2(a0)
    3304:	0075c783          	lbu	a5,7(a1)
    3308:	00f501a3          	sb	a5,3(a0)
    330c:	0095c783          	lbu	a5,9(a1)
    3310:	00f50223          	sb	a5,4(a0)
    3314:	00e5c783          	lbu	a5,14(a1)
    3318:	00f502a3          	sb	a5,5(a0)
    331c:	0105c783          	lbu	a5,16(a1)
    3320:	00f50323          	sb	a5,6(a0)
    3324:	0125c783          	lbu	a5,18(a1)
    3328:	00f503a3          	sb	a5,7(a0)
    332c:	0145c783          	lbu	a5,20(a1)
    3330:	00f50423          	sb	a5,8(a0)
    3334:	0165c783          	lbu	a5,22(a1)
    3338:	00f504a3          	sb	a5,9(a0)
    333c:	0185c783          	lbu	a5,24(a1)
    3340:	00f50523          	sb	a5,10(a0)
    3344:	01c5c783          	lbu	a5,28(a1)
    3348:	00f505a3          	sb	a5,11(a0)
    334c:	01e5c783          	lbu	a5,30(a1)
    3350:	00f50623          	sb	a5,12(a0)
    3354:	00d00793          	li	a5,13
    3358:	00054603          	lbu	a2,0(a0)
    335c:	00e61463          	bne	a2,a4,3364 <fatfs_lfn_cache_entry+0xb8>
    3360:	00d50023          	sb	a3,0(a0)
    3364:	fff78793          	addi	a5,a5,-1
    3368:	0ff7f793          	zext.b	a5,a5
    336c:	00150513          	addi	a0,a0,1
    3370:	fe0794e3          	bnez	a5,3358 <fatfs_lfn_cache_entry+0xac>
    3374:	00008067          	ret

00003378 <fatfs_lfn_cache_get>:
    3378:	10554703          	lbu	a4,261(a0)
    337c:	01400793          	li	a5,20
    3380:	00f71663          	bne	a4,a5,338c <fatfs_lfn_cache_get+0x14>
    3384:	10050223          	sb	zero,260(a0)
    3388:	00008067          	ret
    338c:	02070063          	beqz	a4,33ac <fatfs_lfn_cache_get+0x34>
    3390:	00171793          	slli	a5,a4,0x1
    3394:	00e787b3          	add	a5,a5,a4
    3398:	00279793          	slli	a5,a5,0x2
    339c:	00e787b3          	add	a5,a5,a4
    33a0:	00f507b3          	add	a5,a0,a5
    33a4:	00078023          	sb	zero,0(a5)
    33a8:	00008067          	ret
    33ac:	00050023          	sb	zero,0(a0)
    33b0:	00008067          	ret

000033b4 <fatfs_entry_lfn_text>:
    33b4:	00b54503          	lbu	a0,11(a0)
    33b8:	00f57513          	andi	a0,a0,15
    33bc:	ff150513          	addi	a0,a0,-15
    33c0:	00153513          	seqz	a0,a0
    33c4:	00008067          	ret

000033c8 <fatfs_entry_lfn_invalid>:
    33c8:	00054783          	lbu	a5,0(a0)
    33cc:	f1b78713          	addi	a4,a5,-229
    33d0:	02070263          	beqz	a4,33f4 <fatfs_entry_lfn_invalid+0x2c>
    33d4:	02078063          	beqz	a5,33f4 <fatfs_entry_lfn_invalid+0x2c>
    33d8:	00b54783          	lbu	a5,11(a0)
    33dc:	00800713          	li	a4,8
    33e0:	00100513          	li	a0,1
    33e4:	00e78a63          	beq	a5,a4,33f8 <fatfs_entry_lfn_invalid+0x30>
    33e8:	0067f793          	andi	a5,a5,6
    33ec:	00f03533          	snez	a0,a5
    33f0:	00008067          	ret
    33f4:	00100513          	li	a0,1
    33f8:	00008067          	ret

000033fc <fatfs_entry_lfn_exists>:
    33fc:	00b5c783          	lbu	a5,11(a1)
    3400:	00f00713          	li	a4,15
    3404:	04e78063          	beq	a5,a4,3444 <fatfs_entry_lfn_exists+0x48>
    3408:	0005c683          	lbu	a3,0(a1)
    340c:	f1b68713          	addi	a4,a3,-229
    3410:	00e03733          	snez	a4,a4
    3414:	00d036b3          	snez	a3,a3
    3418:	00d77733          	and	a4,a4,a3
    341c:	02070463          	beqz	a4,3444 <fatfs_entry_lfn_exists+0x48>
    3420:	ff878713          	addi	a4,a5,-8
    3424:	02070063          	beqz	a4,3444 <fatfs_entry_lfn_exists+0x48>
    3428:	0067f713          	andi	a4,a5,6
    342c:	00000793          	li	a5,0
    3430:	00071663          	bnez	a4,343c <fatfs_entry_lfn_exists+0x40>
    3434:	10554783          	lbu	a5,261(a0)
    3438:	00f037b3          	snez	a5,a5
    343c:	00078513          	mv	a0,a5
    3440:	00008067          	ret
    3444:	00000793          	li	a5,0
    3448:	ff5ff06f          	j	343c <fatfs_entry_lfn_exists+0x40>

0000344c <fatfs_entry_sfn_only>:
    344c:	00b54783          	lbu	a5,11(a0)
    3450:	00f00713          	li	a4,15
    3454:	02e78863          	beq	a5,a4,3484 <fatfs_entry_sfn_only+0x38>
    3458:	00054683          	lbu	a3,0(a0)
    345c:	f1b68713          	addi	a4,a3,-229
    3460:	00e03733          	snez	a4,a4
    3464:	00d036b3          	snez	a3,a3
    3468:	00d77733          	and	a4,a4,a3
    346c:	00070c63          	beqz	a4,3484 <fatfs_entry_sfn_only+0x38>
    3470:	ff878713          	addi	a4,a5,-8
    3474:	00070863          	beqz	a4,3484 <fatfs_entry_sfn_only+0x38>
    3478:	0067f513          	andi	a0,a5,6
    347c:	00153513          	seqz	a0,a0
    3480:	00008067          	ret
    3484:	00000513          	li	a0,0
    3488:	00008067          	ret

0000348c <fatfs_entry_is_dir>:
    348c:	00b54503          	lbu	a0,11(a0)
    3490:	00455513          	srli	a0,a0,0x4
    3494:	00157513          	andi	a0,a0,1
    3498:	00008067          	ret

0000349c <fatfs_lfn_entries_required>:
    349c:	ff010113          	addi	sp,sp,-16
    34a0:	00112623          	sw	ra,12(sp)
    34a4:	fffff097          	auipc	ra,0xfffff
    34a8:	184080e7          	jalr	388(ra) # 2628 <strlen>
    34ac:	00050a63          	beqz	a0,34c0 <fatfs_lfn_entries_required+0x24>
    34b0:	00d00593          	li	a1,13
    34b4:	00c50513          	addi	a0,a0,12
    34b8:	fffff097          	auipc	ra,0xfffff
    34bc:	07c080e7          	jalr	124(ra) # 2534 <__divsi3>
    34c0:	00c12083          	lw	ra,12(sp)
    34c4:	01010113          	addi	sp,sp,16
    34c8:	00008067          	ret

000034cc <fatfs_filename_to_lfn>:
    34cc:	f9010113          	addi	sp,sp,-112
    34d0:	06812423          	sw	s0,104(sp)
    34d4:	00058413          	mv	s0,a1
    34d8:	000065b7          	lui	a1,0x6
    34dc:	4dc58593          	addi	a1,a1,1244 # 64dc <font+0x1e0>
    34e0:	06912223          	sw	s1,100(sp)
    34e4:	05312e23          	sw	s3,92(sp)
    34e8:	00060493          	mv	s1,a2
    34ec:	00050993          	mv	s3,a0
    34f0:	03400613          	li	a2,52
    34f4:	01c10513          	addi	a0,sp,28
    34f8:	00d12623          	sw	a3,12(sp)
    34fc:	06112623          	sw	ra,108(sp)
    3500:	07212023          	sw	s2,96(sp)
    3504:	05412c23          	sw	s4,88(sp)
    3508:	fffff097          	auipc	ra,0xfffff
    350c:	0fc080e7          	jalr	252(ra) # 2604 <memcpy>
    3510:	00098513          	mv	a0,s3
    3514:	fffff097          	auipc	ra,0xfffff
    3518:	114080e7          	jalr	276(ra) # 2628 <strlen>
    351c:	00050913          	mv	s2,a0
    3520:	00098513          	mv	a0,s3
    3524:	00000097          	auipc	ra,0x0
    3528:	f78080e7          	jalr	-136(ra) # 349c <fatfs_lfn_entries_required>
    352c:	00050a13          	mv	s4,a0
    3530:	02000613          	li	a2,32
    3534:	00000593          	li	a1,0
    3538:	00040513          	mv	a0,s0
    353c:	fffff097          	auipc	ra,0xfffff
    3540:	0ac080e7          	jalr	172(ra) # 25e8 <memset>
    3544:	fffa0713          	addi	a4,s4,-1
    3548:	00c12683          	lw	a3,12(sp)
    354c:	00148793          	addi	a5,s1,1
    3550:	00971463          	bne	a4,s1,3558 <fatfs_filename_to_lfn+0x8c>
    3554:	0407e793          	ori	a5,a5,64
    3558:	00149613          	slli	a2,s1,0x1
    355c:	00960633          	add	a2,a2,s1
    3560:	00f40023          	sb	a5,0(s0)
    3564:	00261613          	slli	a2,a2,0x2
    3568:	00f00793          	li	a5,15
    356c:	00f405a3          	sb	a5,11(s0)
    3570:	00d406a3          	sb	a3,13(s0)
    3574:	01c10793          	addi	a5,sp,28
    3578:	00960633          	add	a2,a2,s1
    357c:	fff00693          	li	a3,-1
    3580:	0007a703          	lw	a4,0(a5)
    3584:	00e40733          	add	a4,s0,a4
    3588:	05265063          	bge	a2,s2,35c8 <fatfs_filename_to_lfn+0xfc>
    358c:	00c985b3          	add	a1,s3,a2
    3590:	0005c583          	lbu	a1,0(a1)
    3594:	00b70023          	sb	a1,0(a4)
    3598:	00478793          	addi	a5,a5,4
    359c:	05010713          	addi	a4,sp,80
    35a0:	00160613          	addi	a2,a2,1
    35a4:	fce79ee3          	bne	a5,a4,3580 <fatfs_filename_to_lfn+0xb4>
    35a8:	06c12083          	lw	ra,108(sp)
    35ac:	06812403          	lw	s0,104(sp)
    35b0:	06412483          	lw	s1,100(sp)
    35b4:	06012903          	lw	s2,96(sp)
    35b8:	05c12983          	lw	s3,92(sp)
    35bc:	05812a03          	lw	s4,88(sp)
    35c0:	07010113          	addi	sp,sp,112
    35c4:	00008067          	ret
    35c8:	01261663          	bne	a2,s2,35d4 <fatfs_filename_to_lfn+0x108>
    35cc:	00070023          	sb	zero,0(a4)
    35d0:	fc9ff06f          	j	3598 <fatfs_filename_to_lfn+0xcc>
    35d4:	00d70023          	sb	a3,0(a4)
    35d8:	00d700a3          	sb	a3,1(a4)
    35dc:	fbdff06f          	j	3598 <fatfs_filename_to_lfn+0xcc>

000035e0 <fatfs_sfn_create_entry>:
    35e0:	00000793          	li	a5,0
    35e4:	00b00813          	li	a6,11
    35e8:	00f508b3          	add	a7,a0,a5
    35ec:	0008c303          	lbu	t1,0(a7)
    35f0:	00f688b3          	add	a7,a3,a5
    35f4:	00178793          	addi	a5,a5,1
    35f8:	00688023          	sb	t1,0(a7)
    35fc:	ff0796e3          	bne	a5,a6,35e8 <fatfs_sfn_create_entry+0x8>
    3600:	00e03733          	snez	a4,a4
    3604:	40e00733          	neg	a4,a4
    3608:	02000793          	li	a5,32
    360c:	ff077713          	andi	a4,a4,-16
    3610:	00f70733          	add	a4,a4,a5
    3614:	00f68823          	sb	a5,16(a3)
    3618:	00f68923          	sb	a5,18(a3)
    361c:	00f68c23          	sb	a5,24(a3)
    3620:	01065793          	srli	a5,a2,0x10
    3624:	00f68a23          	sb	a5,20(a3)
    3628:	01865793          	srli	a5,a2,0x18
    362c:	00f68aa3          	sb	a5,21(a3)
    3630:	0085d793          	srli	a5,a1,0x8
    3634:	00c68d23          	sb	a2,26(a3)
    3638:	00b68e23          	sb	a1,28(a3)
    363c:	00865613          	srli	a2,a2,0x8
    3640:	00f68ea3          	sb	a5,29(a3)
    3644:	0105d793          	srli	a5,a1,0x10
    3648:	0185d593          	srli	a1,a1,0x18
    364c:	000686a3          	sb	zero,13(a3)
    3650:	00068723          	sb	zero,14(a3)
    3654:	000687a3          	sb	zero,15(a3)
    3658:	000688a3          	sb	zero,17(a3)
    365c:	000689a3          	sb	zero,19(a3)
    3660:	00068b23          	sb	zero,22(a3)
    3664:	00068ba3          	sb	zero,23(a3)
    3668:	00068ca3          	sb	zero,25(a3)
    366c:	00e685a3          	sb	a4,11(a3)
    3670:	00068623          	sb	zero,12(a3)
    3674:	00c68da3          	sb	a2,27(a3)
    3678:	00f68f23          	sb	a5,30(a3)
    367c:	00b68fa3          	sb	a1,31(a3)
    3680:	00008067          	ret

00003684 <fatfs_lfn_create_sfn>:
    3684:	fd010113          	addi	sp,sp,-48
    3688:	02912223          	sw	s1,36(sp)
    368c:	00050493          	mv	s1,a0
    3690:	00058513          	mv	a0,a1
    3694:	02812423          	sw	s0,40(sp)
    3698:	01312e23          	sw	s3,28(sp)
    369c:	00058413          	mv	s0,a1
    36a0:	02112623          	sw	ra,44(sp)
    36a4:	03212023          	sw	s2,32(sp)
    36a8:	fffff097          	auipc	ra,0xfffff
    36ac:	f80080e7          	jalr	-128(ra) # 2628 <strlen>
    36b0:	00044783          	lbu	a5,0(s0)
    36b4:	02e00993          	li	s3,46
    36b8:	15378063          	beq	a5,s3,37f8 <fatfs_lfn_create_sfn+0x174>
    36bc:	00b00613          	li	a2,11
    36c0:	02000593          	li	a1,32
    36c4:	00050913          	mv	s2,a0
    36c8:	00048513          	mv	a0,s1
    36cc:	fffff097          	auipc	ra,0xfffff
    36d0:	f1c080e7          	jalr	-228(ra) # 25e8 <memset>
    36d4:	00300613          	li	a2,3
    36d8:	02000593          	li	a1,32
    36dc:	00c10513          	addi	a0,sp,12
    36e0:	fffff097          	auipc	ra,0xfffff
    36e4:	f08080e7          	jalr	-248(ra) # 25e8 <memset>
    36e8:	fff00793          	li	a5,-1
    36ec:	00000713          	li	a4,0
    36f0:	0d274263          	blt	a4,s2,37b4 <fatfs_lfn_create_sfn+0x130>
    36f4:	fff00713          	li	a4,-1
    36f8:	0ee78863          	beq	a5,a4,37e8 <fatfs_lfn_create_sfn+0x164>
    36fc:	00178713          	addi	a4,a5,1
    3700:	00c10693          	addi	a3,sp,12
    3704:	00478613          	addi	a2,a5,4
    3708:	0ce61263          	bne	a2,a4,37cc <fatfs_lfn_create_sfn+0x148>
    370c:	00000613          	li	a2,0
    3710:	00000693          	li	a3,0
    3714:	01900813          	li	a6,25
    3718:	00800893          	li	a7,8
    371c:	02f6de63          	bge	a3,a5,3758 <fatfs_lfn_create_sfn+0xd4>
    3720:	00d40733          	add	a4,s0,a3
    3724:	00074703          	lbu	a4,0(a4)
    3728:	fe070513          	addi	a0,a4,-32
    372c:	0c050263          	beqz	a0,37f0 <fatfs_lfn_create_sfn+0x16c>
    3730:	fd270593          	addi	a1,a4,-46
    3734:	0a058e63          	beqz	a1,37f0 <fatfs_lfn_create_sfn+0x16c>
    3738:	f9f70593          	addi	a1,a4,-97
    373c:	0ff5f593          	zext.b	a1,a1
    3740:	00c48333          	add	t1,s1,a2
    3744:	00160613          	addi	a2,a2,1
    3748:	00b86463          	bltu	a6,a1,3750 <fatfs_lfn_create_sfn+0xcc>
    374c:	0ff57713          	zext.b	a4,a0
    3750:	00e30023          	sb	a4,0(t1)
    3754:	09161e63          	bne	a2,a7,37f0 <fatfs_lfn_create_sfn+0x16c>
    3758:	00c10793          	addi	a5,sp,12
    375c:	00800693          	li	a3,8
    3760:	01900513          	li	a0,25
    3764:	00b00593          	li	a1,11
    3768:	0007c703          	lbu	a4,0(a5)
    376c:	f9f70613          	addi	a2,a4,-97
    3770:	0ff67613          	zext.b	a2,a2
    3774:	00c56663          	bltu	a0,a2,3780 <fatfs_lfn_create_sfn+0xfc>
    3778:	fe070713          	addi	a4,a4,-32
    377c:	0ff77713          	zext.b	a4,a4
    3780:	00d48633          	add	a2,s1,a3
    3784:	00e60023          	sb	a4,0(a2)
    3788:	00168693          	addi	a3,a3,1
    378c:	00178793          	addi	a5,a5,1
    3790:	fcb69ce3          	bne	a3,a1,3768 <fatfs_lfn_create_sfn+0xe4>
    3794:	00100513          	li	a0,1
    3798:	02c12083          	lw	ra,44(sp)
    379c:	02812403          	lw	s0,40(sp)
    37a0:	02412483          	lw	s1,36(sp)
    37a4:	02012903          	lw	s2,32(sp)
    37a8:	01c12983          	lw	s3,28(sp)
    37ac:	03010113          	addi	sp,sp,48
    37b0:	00008067          	ret
    37b4:	00e406b3          	add	a3,s0,a4
    37b8:	0006c683          	lbu	a3,0(a3)
    37bc:	01369463          	bne	a3,s3,37c4 <fatfs_lfn_create_sfn+0x140>
    37c0:	00070793          	mv	a5,a4
    37c4:	00170713          	addi	a4,a4,1
    37c8:	f29ff06f          	j	36f0 <fatfs_lfn_create_sfn+0x6c>
    37cc:	01275863          	bge	a4,s2,37dc <fatfs_lfn_create_sfn+0x158>
    37d0:	00e405b3          	add	a1,s0,a4
    37d4:	0005c583          	lbu	a1,0(a1)
    37d8:	00b68023          	sb	a1,0(a3)
    37dc:	00170713          	addi	a4,a4,1
    37e0:	00168693          	addi	a3,a3,1
    37e4:	f25ff06f          	j	3708 <fatfs_lfn_create_sfn+0x84>
    37e8:	00090793          	mv	a5,s2
    37ec:	f21ff06f          	j	370c <fatfs_lfn_create_sfn+0x88>
    37f0:	00168693          	addi	a3,a3,1
    37f4:	f29ff06f          	j	371c <fatfs_lfn_create_sfn+0x98>
    37f8:	00000513          	li	a0,0
    37fc:	f9dff06f          	j	3798 <fatfs_lfn_create_sfn+0x114>

00003800 <fatfs_lfn_generate_tail>:
    3800:	000187b7          	lui	a5,0x18
    3804:	69f78793          	addi	a5,a5,1695 # 1869f <__stacktop+0x869f>
    3808:	16c7e463          	bltu	a5,a2,3970 <fatfs_lfn_generate_tail+0x170>
    380c:	fa010113          	addi	sp,sp,-96
    3810:	04812c23          	sw	s0,88(sp)
    3814:	04912a23          	sw	s1,84(sp)
    3818:	03712e23          	sw	s7,60(sp)
    381c:	00060413          	mv	s0,a2
    3820:	00058b93          	mv	s7,a1
    3824:	00c00613          	li	a2,12
    3828:	00000593          	li	a1,0
    382c:	00050493          	mv	s1,a0
    3830:	00410513          	addi	a0,sp,4
    3834:	04112e23          	sw	ra,92(sp)
    3838:	05312623          	sw	s3,76(sp)
    383c:	05412423          	sw	s4,72(sp)
    3840:	05612023          	sw	s6,64(sp)
    3844:	05212823          	sw	s2,80(sp)
    3848:	05512223          	sw	s5,68(sp)
    384c:	fffff097          	auipc	ra,0xfffff
    3850:	d9c080e7          	jalr	-612(ra) # 25e8 <memset>
    3854:	000065b7          	lui	a1,0x6
    3858:	07e00793          	li	a5,126
    385c:	01100613          	li	a2,17
    3860:	2b458593          	addi	a1,a1,692 # 62b4 <LEDS+0x16c>
    3864:	01c10513          	addi	a0,sp,28
    3868:	01010993          	addi	s3,sp,16
    386c:	00f10223          	sb	a5,4(sp)
    3870:	00098a13          	mv	s4,s3
    3874:	fffff097          	auipc	ra,0xfffff
    3878:	d90080e7          	jalr	-624(ra) # 2604 <memcpy>
    387c:	00900b13          	li	s6,9
    3880:	00a00593          	li	a1,10
    3884:	00040513          	mv	a0,s0
    3888:	fffff097          	auipc	ra,0xfffff
    388c:	cfc080e7          	jalr	-772(ra) # 2584 <__umodsi3>
    3890:	03050793          	addi	a5,a0,48
    3894:	00278533          	add	a0,a5,sp
    3898:	fec54783          	lbu	a5,-20(a0)
    389c:	00098913          	mv	s2,s3
    38a0:	00040513          	mv	a0,s0
    38a4:	00a00593          	li	a1,10
    38a8:	00f98023          	sb	a5,0(s3)
    38ac:	00040a93          	mv	s5,s0
    38b0:	fffff097          	auipc	ra,0xfffff
    38b4:	c8c080e7          	jalr	-884(ra) # 253c <__udivsi3>
    38b8:	00198993          	addi	s3,s3,1
    38bc:	00050413          	mv	s0,a0
    38c0:	fd5b60e3          	bltu	s6,s5,3880 <fatfs_lfn_generate_tail+0x80>
    38c4:	00098023          	sb	zero,0(s3)
    38c8:	00410713          	addi	a4,sp,4
    38cc:	00090793          	mv	a5,s2
    38d0:	0947f663          	bgeu	a5,s4,395c <fatfs_lfn_generate_tail+0x15c>
    38d4:	00f10713          	addi	a4,sp,15
    38d8:	00000793          	li	a5,0
    38dc:	00e96663          	bltu	s2,a4,38e8 <fatfs_lfn_generate_tail+0xe8>
    38e0:	41490933          	sub	s2,s2,s4
    38e4:	00190793          	addi	a5,s2,1
    38e8:	03078793          	addi	a5,a5,48
    38ec:	002787b3          	add	a5,a5,sp
    38f0:	000b8593          	mv	a1,s7
    38f4:	fc078aa3          	sb	zero,-43(a5)
    38f8:	00b00613          	li	a2,11
    38fc:	00048513          	mv	a0,s1
    3900:	fffff097          	auipc	ra,0xfffff
    3904:	d04080e7          	jalr	-764(ra) # 2604 <memcpy>
    3908:	00410513          	addi	a0,sp,4
    390c:	fffff097          	auipc	ra,0xfffff
    3910:	d1c080e7          	jalr	-740(ra) # 2628 <strlen>
    3914:	40a484b3          	sub	s1,s1,a0
    3918:	00050613          	mv	a2,a0
    391c:	00410593          	addi	a1,sp,4
    3920:	00848513          	addi	a0,s1,8
    3924:	fffff097          	auipc	ra,0xfffff
    3928:	ce0080e7          	jalr	-800(ra) # 2604 <memcpy>
    392c:	05c12083          	lw	ra,92(sp)
    3930:	05812403          	lw	s0,88(sp)
    3934:	05412483          	lw	s1,84(sp)
    3938:	05012903          	lw	s2,80(sp)
    393c:	04c12983          	lw	s3,76(sp)
    3940:	04812a03          	lw	s4,72(sp)
    3944:	04412a83          	lw	s5,68(sp)
    3948:	04012b03          	lw	s6,64(sp)
    394c:	03c12b83          	lw	s7,60(sp)
    3950:	00100513          	li	a0,1
    3954:	06010113          	addi	sp,sp,96
    3958:	00008067          	ret
    395c:	0007c683          	lbu	a3,0(a5)
    3960:	00170713          	addi	a4,a4,1
    3964:	fff78793          	addi	a5,a5,-1
    3968:	00d70023          	sb	a3,0(a4)
    396c:	f65ff06f          	j	38d0 <fatfs_lfn_generate_tail+0xd0>
    3970:	00000513          	li	a0,0
    3974:	00008067          	ret

00003978 <fatfs_total_path_levels>:
    3978:	fff00793          	li	a5,-1
    397c:	06050263          	beqz	a0,39e0 <fatfs_total_path_levels+0x68>
    3980:	00054703          	lbu	a4,0(a0)
    3984:	02f00793          	li	a5,47
    3988:	00f71863          	bne	a4,a5,3998 <fatfs_total_path_levels+0x20>
    398c:	00150513          	addi	a0,a0,1
    3990:	00000793          	li	a5,0
    3994:	0400006f          	j	39d4 <fatfs_total_path_levels+0x5c>
    3998:	00154703          	lbu	a4,1(a0)
    399c:	03a00793          	li	a5,58
    39a0:	00f70a63          	beq	a4,a5,39b4 <fatfs_total_path_levels+0x3c>
    39a4:	00254683          	lbu	a3,2(a0)
    39a8:	05c00713          	li	a4,92
    39ac:	fff00793          	li	a5,-1
    39b0:	02e69863          	bne	a3,a4,39e0 <fatfs_total_path_levels+0x68>
    39b4:	00350513          	addi	a0,a0,3
    39b8:	05c00713          	li	a4,92
    39bc:	fd5ff06f          	j	3990 <fatfs_total_path_levels+0x18>
    39c0:	00150513          	addi	a0,a0,1
    39c4:	00e68663          	beq	a3,a4,39d0 <fatfs_total_path_levels+0x58>
    39c8:	00054683          	lbu	a3,0(a0)
    39cc:	fe069ae3          	bnez	a3,39c0 <fatfs_total_path_levels+0x48>
    39d0:	00178793          	addi	a5,a5,1
    39d4:	00054683          	lbu	a3,0(a0)
    39d8:	fe0698e3          	bnez	a3,39c8 <fatfs_total_path_levels+0x50>
    39dc:	fff78793          	addi	a5,a5,-1
    39e0:	00078513          	mv	a0,a5
    39e4:	00008067          	ret

000039e8 <fatfs_get_substring>:
    39e8:	0cd05e63          	blez	a3,3ac4 <fatfs_get_substring+0xdc>
    39ec:	0c050c63          	beqz	a0,3ac4 <fatfs_get_substring+0xdc>
    39f0:	fe010113          	addi	sp,sp,-32
    39f4:	00812c23          	sw	s0,24(sp)
    39f8:	00112e23          	sw	ra,28(sp)
    39fc:	00912a23          	sw	s1,20(sp)
    3a00:	00054483          	lbu	s1,0(a0)
    3a04:	02f00793          	li	a5,47
    3a08:	00150413          	addi	s0,a0,1
    3a0c:	02f48463          	beq	s1,a5,3a34 <fatfs_get_substring+0x4c>
    3a10:	00154703          	lbu	a4,1(a0)
    3a14:	03a00793          	li	a5,58
    3a18:	00f70a63          	beq	a4,a5,3a2c <fatfs_get_substring+0x44>
    3a1c:	00254803          	lbu	a6,2(a0)
    3a20:	05c00713          	li	a4,92
    3a24:	fff00793          	li	a5,-1
    3a28:	04e81c63          	bne	a6,a4,3a80 <fatfs_get_substring+0x98>
    3a2c:	00350413          	addi	s0,a0,3
    3a30:	05c00493          	li	s1,92
    3a34:	00040513          	mv	a0,s0
    3a38:	00d12623          	sw	a3,12(sp)
    3a3c:	00c12423          	sw	a2,8(sp)
    3a40:	00b12223          	sw	a1,4(sp)
    3a44:	fffff097          	auipc	ra,0xfffff
    3a48:	be4080e7          	jalr	-1052(ra) # 2628 <strlen>
    3a4c:	00c12683          	lw	a3,12(sp)
    3a50:	00412583          	lw	a1,4(sp)
    3a54:	00812603          	lw	a2,8(sp)
    3a58:	00000713          	li	a4,0
    3a5c:	00000813          	li	a6,0
    3a60:	00000793          	li	a5,0
    3a64:	fff68693          	addi	a3,a3,-1
    3a68:	00e608b3          	add	a7,a2,a4
    3a6c:	02a7c663          	blt	a5,a0,3a98 <fatfs_get_substring+0xb0>
    3a70:	00088023          	sb	zero,0(a7)
    3a74:	00064783          	lbu	a5,0(a2)
    3a78:	0017b793          	seqz	a5,a5
    3a7c:	40f007b3          	neg	a5,a5
    3a80:	01c12083          	lw	ra,28(sp)
    3a84:	01812403          	lw	s0,24(sp)
    3a88:	01412483          	lw	s1,20(sp)
    3a8c:	00078513          	mv	a0,a5
    3a90:	02010113          	addi	sp,sp,32
    3a94:	00008067          	ret
    3a98:	00f40333          	add	t1,s0,a5
    3a9c:	00034303          	lbu	t1,0(t1)
    3aa0:	00931863          	bne	t1,s1,3ab0 <fatfs_get_substring+0xc8>
    3aa4:	00180813          	addi	a6,a6,1
    3aa8:	00178793          	addi	a5,a5,1
    3aac:	fbdff06f          	j	3a68 <fatfs_get_substring+0x80>
    3ab0:	feb81ce3          	bne	a6,a1,3aa8 <fatfs_get_substring+0xc0>
    3ab4:	fed75ae3          	bge	a4,a3,3aa8 <fatfs_get_substring+0xc0>
    3ab8:	00170713          	addi	a4,a4,1
    3abc:	00688023          	sb	t1,0(a7)
    3ac0:	fe9ff06f          	j	3aa8 <fatfs_get_substring+0xc0>
    3ac4:	fff00793          	li	a5,-1
    3ac8:	00078513          	mv	a0,a5
    3acc:	00008067          	ret

00003ad0 <fatfs_split_path>:
    3ad0:	fd010113          	addi	sp,sp,-48
    3ad4:	02912223          	sw	s1,36(sp)
    3ad8:	03212023          	sw	s2,32(sp)
    3adc:	01312e23          	sw	s3,28(sp)
    3ae0:	01412c23          	sw	s4,24(sp)
    3ae4:	02112623          	sw	ra,44(sp)
    3ae8:	02812423          	sw	s0,40(sp)
    3aec:	01512a23          	sw	s5,20(sp)
    3af0:	00050993          	mv	s3,a0
    3af4:	00058493          	mv	s1,a1
    3af8:	00060913          	mv	s2,a2
    3afc:	00068a13          	mv	s4,a3
    3b00:	00e12623          	sw	a4,12(sp)
    3b04:	00000097          	auipc	ra,0x0
    3b08:	e74080e7          	jalr	-396(ra) # 3978 <fatfs_total_path_levels>
    3b0c:	fff00793          	li	a5,-1
    3b10:	02f51863          	bne	a0,a5,3b40 <fatfs_split_path+0x70>
    3b14:	fff00413          	li	s0,-1
    3b18:	02c12083          	lw	ra,44(sp)
    3b1c:	00040513          	mv	a0,s0
    3b20:	02812403          	lw	s0,40(sp)
    3b24:	02412483          	lw	s1,36(sp)
    3b28:	02012903          	lw	s2,32(sp)
    3b2c:	01c12983          	lw	s3,28(sp)
    3b30:	01812a03          	lw	s4,24(sp)
    3b34:	01412a83          	lw	s5,20(sp)
    3b38:	03010113          	addi	sp,sp,48
    3b3c:	00008067          	ret
    3b40:	00c12683          	lw	a3,12(sp)
    3b44:	00050593          	mv	a1,a0
    3b48:	00a12623          	sw	a0,12(sp)
    3b4c:	000a0613          	mv	a2,s4
    3b50:	00098513          	mv	a0,s3
    3b54:	00000097          	auipc	ra,0x0
    3b58:	e94080e7          	jalr	-364(ra) # 39e8 <fatfs_get_substring>
    3b5c:	00050413          	mv	s0,a0
    3b60:	fa051ae3          	bnez	a0,3b14 <fatfs_split_path+0x44>
    3b64:	00c12583          	lw	a1,12(sp)
    3b68:	00059663          	bnez	a1,3b74 <fatfs_split_path+0xa4>
    3b6c:	00048023          	sb	zero,0(s1)
    3b70:	fa9ff06f          	j	3b18 <fatfs_split_path+0x48>
    3b74:	00098513          	mv	a0,s3
    3b78:	fffff097          	auipc	ra,0xfffff
    3b7c:	ab0080e7          	jalr	-1360(ra) # 2628 <strlen>
    3b80:	00050a93          	mv	s5,a0
    3b84:	000a0513          	mv	a0,s4
    3b88:	fffff097          	auipc	ra,0xfffff
    3b8c:	aa0080e7          	jalr	-1376(ra) # 2628 <strlen>
    3b90:	40aa8633          	sub	a2,s5,a0
    3b94:	00c95463          	bge	s2,a2,3b9c <fatfs_split_path+0xcc>
    3b98:	00090613          	mv	a2,s2
    3b9c:	00048513          	mv	a0,s1
    3ba0:	00098593          	mv	a1,s3
    3ba4:	00c12623          	sw	a2,12(sp)
    3ba8:	fffff097          	auipc	ra,0xfffff
    3bac:	a5c080e7          	jalr	-1444(ra) # 2604 <memcpy>
    3bb0:	00c12603          	lw	a2,12(sp)
    3bb4:	00c484b3          	add	s1,s1,a2
    3bb8:	fe048fa3          	sb	zero,-1(s1)
    3bbc:	f5dff06f          	j	3b18 <fatfs_split_path+0x48>

00003bc0 <fatfs_compare_names>:
    3bc0:	fd010113          	addi	sp,sp,-48
    3bc4:	02112623          	sw	ra,44(sp)
    3bc8:	03212023          	sw	s2,32(sp)
    3bcc:	01312e23          	sw	s3,28(sp)
    3bd0:	01412c23          	sw	s4,24(sp)
    3bd4:	01512a23          	sw	s5,20(sp)
    3bd8:	00058a13          	mv	s4,a1
    3bdc:	02812423          	sw	s0,40(sp)
    3be0:	02912223          	sw	s1,36(sp)
    3be4:	01612823          	sw	s6,16(sp)
    3be8:	01712623          	sw	s7,12(sp)
    3bec:	01812423          	sw	s8,8(sp)
    3bf0:	00050a93          	mv	s5,a0
    3bf4:	fffff097          	auipc	ra,0xfffff
    3bf8:	1c4080e7          	jalr	452(ra) # 2db8 <FileString_GetExtension>
    3bfc:	00050993          	mv	s3,a0
    3c00:	000a0513          	mv	a0,s4
    3c04:	fffff097          	auipc	ra,0xfffff
    3c08:	1b4080e7          	jalr	436(ra) # 2db8 <FileString_GetExtension>
    3c0c:	fff00793          	li	a5,-1
    3c10:	00050913          	mv	s2,a0
    3c14:	02f99e63          	bne	s3,a5,3c50 <fatfs_compare_names+0x90>
    3c18:	0f350063          	beq	a0,s3,3cf8 <fatfs_compare_names+0x138>
    3c1c:	00000513          	li	a0,0
    3c20:	02c12083          	lw	ra,44(sp)
    3c24:	02812403          	lw	s0,40(sp)
    3c28:	02412483          	lw	s1,36(sp)
    3c2c:	02012903          	lw	s2,32(sp)
    3c30:	01c12983          	lw	s3,28(sp)
    3c34:	01812a03          	lw	s4,24(sp)
    3c38:	01412a83          	lw	s5,20(sp)
    3c3c:	01012b03          	lw	s6,16(sp)
    3c40:	00c12b83          	lw	s7,12(sp)
    3c44:	00812c03          	lw	s8,8(sp)
    3c48:	03010113          	addi	sp,sp,48
    3c4c:	00008067          	ret
    3c50:	fcf506e3          	beq	a0,a5,3c1c <fatfs_compare_names+0x5c>
    3c54:	00198793          	addi	a5,s3,1
    3c58:	00fa8b33          	add	s6,s5,a5
    3c5c:	00050413          	mv	s0,a0
    3c60:	00150793          	addi	a5,a0,1
    3c64:	000b0513          	mv	a0,s6
    3c68:	00fa0bb3          	add	s7,s4,a5
    3c6c:	fffff097          	auipc	ra,0xfffff
    3c70:	9bc080e7          	jalr	-1604(ra) # 2628 <strlen>
    3c74:	00050c13          	mv	s8,a0
    3c78:	000b8513          	mv	a0,s7
    3c7c:	00098493          	mv	s1,s3
    3c80:	fffff097          	auipc	ra,0xfffff
    3c84:	9a8080e7          	jalr	-1624(ra) # 2628 <strlen>
    3c88:	f8ac1ae3          	bne	s8,a0,3c1c <fatfs_compare_names+0x5c>
    3c8c:	000b0513          	mv	a0,s6
    3c90:	fffff097          	auipc	ra,0xfffff
    3c94:	998080e7          	jalr	-1640(ra) # 2628 <strlen>
    3c98:	00050613          	mv	a2,a0
    3c9c:	000b8593          	mv	a1,s7
    3ca0:	000b0513          	mv	a0,s6
    3ca4:	fffff097          	auipc	ra,0xfffff
    3ca8:	0a4080e7          	jalr	164(ra) # 2d48 <FileString_StrCmpNoCase>
    3cac:	f60518e3          	bnez	a0,3c1c <fatfs_compare_names+0x5c>
    3cb0:	fff48793          	addi	a5,s1,-1
    3cb4:	00fa87b3          	add	a5,s5,a5
    3cb8:	41378733          	sub	a4,a5,s3
    3cbc:	02000693          	li	a3,32
    3cc0:	06e79263          	bne	a5,a4,3d24 <fatfs_compare_names+0x164>
    3cc4:	fff40793          	addi	a5,s0,-1
    3cc8:	00fa07b3          	add	a5,s4,a5
    3ccc:	41278733          	sub	a4,a5,s2
    3cd0:	02000693          	li	a3,32
    3cd4:	06e79263          	bne	a5,a4,3d38 <fatfs_compare_names+0x178>
    3cd8:	f53912e3          	bne	s2,s3,3c1c <fatfs_compare_names+0x5c>
    3cdc:	00090613          	mv	a2,s2
    3ce0:	000a0593          	mv	a1,s4
    3ce4:	000a8513          	mv	a0,s5
    3ce8:	fffff097          	auipc	ra,0xfffff
    3cec:	060080e7          	jalr	96(ra) # 2d48 <FileString_StrCmpNoCase>
    3cf0:	00153513          	seqz	a0,a0
    3cf4:	f2dff06f          	j	3c20 <fatfs_compare_names+0x60>
    3cf8:	000a8513          	mv	a0,s5
    3cfc:	fffff097          	auipc	ra,0xfffff
    3d00:	92c080e7          	jalr	-1748(ra) # 2628 <strlen>
    3d04:	00050493          	mv	s1,a0
    3d08:	00050993          	mv	s3,a0
    3d0c:	000a0513          	mv	a0,s4
    3d10:	fffff097          	auipc	ra,0xfffff
    3d14:	918080e7          	jalr	-1768(ra) # 2628 <strlen>
    3d18:	00050413          	mv	s0,a0
    3d1c:	00050913          	mv	s2,a0
    3d20:	f91ff06f          	j	3cb0 <fatfs_compare_names+0xf0>
    3d24:	0007c603          	lbu	a2,0(a5)
    3d28:	f8d61ee3          	bne	a2,a3,3cc4 <fatfs_compare_names+0x104>
    3d2c:	415789b3          	sub	s3,a5,s5
    3d30:	fff78793          	addi	a5,a5,-1
    3d34:	f8dff06f          	j	3cc0 <fatfs_compare_names+0x100>
    3d38:	0007c603          	lbu	a2,0(a5)
    3d3c:	f8d61ee3          	bne	a2,a3,3cd8 <fatfs_compare_names+0x118>
    3d40:	41478933          	sub	s2,a5,s4
    3d44:	fff78793          	addi	a5,a5,-1
    3d48:	f8dff06f          	j	3cd4 <fatfs_compare_names+0x114>

00003d4c <_check_file_open>:
    3d4c:	fe010113          	addi	sp,sp,-32
    3d50:	000067b7          	lui	a5,0x6
    3d54:	00812c23          	sw	s0,24(sp)
    3d58:	7287a403          	lw	s0,1832(a5) # 6728 <_open_file_list>
    3d5c:	00912a23          	sw	s1,20(sp)
    3d60:	00112e23          	sw	ra,28(sp)
    3d64:	01212823          	sw	s2,16(sp)
    3d68:	01312623          	sw	s3,12(sp)
    3d6c:	00050493          	mv	s1,a0
    3d70:	00041663          	bnez	s0,3d7c <_check_file_open+0x30>
    3d74:	00000513          	li	a0,0
    3d78:	03c0006f          	j	3db4 <_check_file_open+0x68>
    3d7c:	bc440793          	addi	a5,s0,-1084
    3d80:	00f49663          	bne	s1,a5,3d8c <_check_file_open+0x40>
    3d84:	00442403          	lw	s0,4(s0)
    3d88:	fe9ff06f          	j	3d70 <_check_file_open+0x24>
    3d8c:	01448593          	addi	a1,s1,20
    3d90:	bd840513          	addi	a0,s0,-1064
    3d94:	00000097          	auipc	ra,0x0
    3d98:	e2c080e7          	jalr	-468(ra) # 3bc0 <fatfs_compare_names>
    3d9c:	fe0504e3          	beqz	a0,3d84 <_check_file_open+0x38>
    3da0:	11848593          	addi	a1,s1,280
    3da4:	cdc40513          	addi	a0,s0,-804
    3da8:	00000097          	auipc	ra,0x0
    3dac:	e18080e7          	jalr	-488(ra) # 3bc0 <fatfs_compare_names>
    3db0:	fc050ae3          	beqz	a0,3d84 <_check_file_open+0x38>
    3db4:	01c12083          	lw	ra,28(sp)
    3db8:	01812403          	lw	s0,24(sp)
    3dbc:	01412483          	lw	s1,20(sp)
    3dc0:	01012903          	lw	s2,16(sp)
    3dc4:	00c12983          	lw	s3,12(sp)
    3dc8:	02010113          	addi	sp,sp,32
    3dcc:	00008067          	ret

00003dd0 <fatfs_get_sfn_display_name>:
    3dd0:	00000713          	li	a4,0
    3dd4:	02000613          	li	a2,32
    3dd8:	01900813          	li	a6,25
    3ddc:	0005c783          	lbu	a5,0(a1)
    3de0:	00078663          	beqz	a5,3dec <fatfs_get_sfn_display_name+0x1c>
    3de4:	ff470693          	addi	a3,a4,-12
    3de8:	00069863          	bnez	a3,3df8 <fatfs_get_sfn_display_name+0x28>
    3dec:	00050023          	sb	zero,0(a0)
    3df0:	00100513          	li	a0,1
    3df4:	00008067          	ret
    3df8:	00158593          	addi	a1,a1,1
    3dfc:	fec780e3          	beq	a5,a2,3ddc <fatfs_get_sfn_display_name+0xc>
    3e00:	fbf78693          	addi	a3,a5,-65
    3e04:	0ff6f693          	zext.b	a3,a3
    3e08:	00d86663          	bltu	a6,a3,3e14 <fatfs_get_sfn_display_name+0x44>
    3e0c:	02078793          	addi	a5,a5,32
    3e10:	0ff7f793          	zext.b	a5,a5
    3e14:	00f50023          	sb	a5,0(a0)
    3e18:	00170713          	addi	a4,a4,1
    3e1c:	00150513          	addi	a0,a0,1
    3e20:	fbdff06f          	j	3ddc <fatfs_get_sfn_display_name+0xc>

00003e24 <fatfs_fat_init>:
    3e24:	ff010113          	addi	sp,sp,-16
    3e28:	00812423          	sw	s0,8(sp)
    3e2c:	00912223          	sw	s1,4(sp)
    3e30:	00112623          	sw	ra,12(sp)
    3e34:	fff00793          	li	a5,-1
    3e38:	25850493          	addi	s1,a0,600
    3e3c:	00050413          	mv	s0,a0
    3e40:	44f52c23          	sw	a5,1112(a0)
    3e44:	24052a23          	sw	zero,596(a0)
    3e48:	44052e23          	sw	zero,1116(a0)
    3e4c:	20000613          	li	a2,512
    3e50:	00048513          	mv	a0,s1
    3e54:	00000593          	li	a1,0
    3e58:	ffffe097          	auipc	ra,0xffffe
    3e5c:	790080e7          	jalr	1936(ra) # 25e8 <memset>
    3e60:	25442783          	lw	a5,596(s0)
    3e64:	00c12083          	lw	ra,12(sp)
    3e68:	24942a23          	sw	s1,596(s0)
    3e6c:	46042023          	sw	zero,1120(s0)
    3e70:	46f42223          	sw	a5,1124(s0)
    3e74:	00812403          	lw	s0,8(sp)
    3e78:	00412483          	lw	s1,4(sp)
    3e7c:	01010113          	addi	sp,sp,16
    3e80:	00008067          	ret

00003e84 <fatfs_init>:
    3e84:	fd010113          	addi	sp,sp,-48
    3e88:	02812423          	sw	s0,40(sp)
    3e8c:	02112623          	sw	ra,44(sp)
    3e90:	02912223          	sw	s1,36(sp)
    3e94:	03212023          	sw	s2,32(sp)
    3e98:	01312e23          	sw	s3,28(sp)
    3e9c:	fff00793          	li	a5,-1
    3ea0:	24f52223          	sw	a5,580(a0)
    3ea4:	24052423          	sw	zero,584(a0)
    3ea8:	02052223          	sw	zero,36(a0)
    3eac:	00050413          	mv	s0,a0
    3eb0:	00000097          	auipc	ra,0x0
    3eb4:	f74080e7          	jalr	-140(ra) # 3e24 <fatfs_fat_init>
    3eb8:	03442783          	lw	a5,52(s0)
    3ebc:	02079463          	bnez	a5,3ee4 <fatfs_init+0x60>
    3ec0:	fff00713          	li	a4,-1
    3ec4:	02c12083          	lw	ra,44(sp)
    3ec8:	02812403          	lw	s0,40(sp)
    3ecc:	02412483          	lw	s1,36(sp)
    3ed0:	02012903          	lw	s2,32(sp)
    3ed4:	01c12983          	lw	s3,28(sp)
    3ed8:	00070513          	mv	a0,a4
    3edc:	03010113          	addi	sp,sp,48
    3ee0:	00008067          	ret
    3ee4:	04440593          	addi	a1,s0,68
    3ee8:	00100613          	li	a2,1
    3eec:	00000513          	li	a0,0
    3ef0:	00b12623          	sw	a1,12(sp)
    3ef4:	000780e7          	jalr	a5
    3ef8:	fc0504e3          	beqz	a0,3ec0 <fatfs_init+0x3c>
    3efc:	24244703          	lbu	a4,578(s0)
    3f00:	05500793          	li	a5,85
    3f04:	00c12583          	lw	a1,12(sp)
    3f08:	00f70663          	beq	a4,a5,3f14 <fatfs_init+0x90>
    3f0c:	ffd00713          	li	a4,-3
    3f10:	fb5ff06f          	j	3ec4 <fatfs_init+0x40>
    3f14:	24344703          	lbu	a4,579(s0)
    3f18:	0aa00793          	li	a5,170
    3f1c:	fef718e3          	bne	a4,a5,3f0c <fatfs_init+0x88>
    3f20:	20644783          	lbu	a5,518(s0)
    3f24:	00600713          	li	a4,6
    3f28:	02f76463          	bltu	a4,a5,3f50 <fatfs_init+0xcc>
    3f2c:	00400713          	li	a4,4
    3f30:	00f76663          	bltu	a4,a5,3f3c <fatfs_init+0xb8>
    3f34:	00000513          	li	a0,0
    3f38:	02078663          	beqz	a5,3f64 <fatfs_init+0xe0>
    3f3c:	20c45503          	lhu	a0,524(s0)
    3f40:	20a45783          	lhu	a5,522(s0)
    3f44:	01051513          	slli	a0,a0,0x10
    3f48:	00f56533          	or	a0,a0,a5
    3f4c:	0180006f          	j	3f64 <fatfs_init+0xe0>
    3f50:	00c00713          	li	a4,12
    3f54:	12f76663          	bltu	a4,a5,4080 <fatfs_init+0x1fc>
    3f58:	00a00713          	li	a4,10
    3f5c:	00000513          	li	a0,0
    3f60:	fcf76ee3          	bltu	a4,a5,3f3c <fatfs_init+0xb8>
    3f64:	03442783          	lw	a5,52(s0)
    3f68:	00a42e23          	sw	a0,28(s0)
    3f6c:	00100613          	li	a2,1
    3f70:	000780e7          	jalr	a5
    3f74:	f40506e3          	beqz	a0,3ec0 <fatfs_init+0x3c>
    3f78:	05044783          	lbu	a5,80(s0)
    3f7c:	04f44703          	lbu	a4,79(s0)
    3f80:	20000693          	li	a3,512
    3f84:	00879793          	slli	a5,a5,0x8
    3f88:	00e7e7b3          	or	a5,a5,a4
    3f8c:	ffe00713          	li	a4,-2
    3f90:	f2d79ae3          	bne	a5,a3,3ec4 <fatfs_init+0x40>
    3f94:	05644483          	lbu	s1,86(s0)
    3f98:	05544783          	lbu	a5,85(s0)
    3f9c:	05144983          	lbu	s3,81(s0)
    3fa0:	00849493          	slli	s1,s1,0x8
    3fa4:	05a45583          	lhu	a1,90(s0)
    3fa8:	00f4e4b3          	or	s1,s1,a5
    3fac:	01340023          	sb	s3,0(s0)
    3fb0:	02941423          	sh	s1,40(s0)
    3fb4:	05245903          	lhu	s2,82(s0)
    3fb8:	05444503          	lbu	a0,84(s0)
    3fbc:	00059463          	bnez	a1,3fc4 <fatfs_init+0x140>
    3fc0:	06842583          	lw	a1,104(s0)
    3fc4:	07042783          	lw	a5,112(s0)
    3fc8:	02b42023          	sw	a1,32(s0)
    3fcc:	00549493          	slli	s1,s1,0x5
    3fd0:	00f42423          	sw	a5,8(s0)
    3fd4:	07445783          	lhu	a5,116(s0)
    3fd8:	1ff48493          	addi	s1,s1,511
    3fdc:	4094d493          	srai	s1,s1,0x9
    3fe0:	00f41c23          	sh	a5,24(s0)
    3fe4:	fffff097          	auipc	ra,0xfffff
    3fe8:	ccc080e7          	jalr	-820(ra) # 2cb0 <__mulsi3>
    3fec:	00a907b3          	add	a5,s2,a0
    3ff0:	00f42623          	sw	a5,12(s0)
    3ff4:	01c42783          	lw	a5,28(s0)
    3ff8:	24245703          	lhu	a4,578(s0)
    3ffc:	00942823          	sw	s1,16(s0)
    4000:	00f907b3          	add	a5,s2,a5
    4004:	00f42a23          	sw	a5,20(s0)
    4008:	00f507b3          	add	a5,a0,a5
    400c:	00f42223          	sw	a5,4(s0)
    4010:	0000b7b7          	lui	a5,0xb
    4014:	a5578793          	addi	a5,a5,-1451 # aa55 <_files+0x2299>
    4018:	eef71ae3          	bne	a4,a5,3f0c <fatfs_init+0x88>
    401c:	05844783          	lbu	a5,88(s0)
    4020:	05744703          	lbu	a4,87(s0)
    4024:	00879793          	slli	a5,a5,0x8
    4028:	00e7e7b3          	or	a5,a5,a4
    402c:	00079463          	bnez	a5,4034 <fatfs_init+0x1b0>
    4030:	06442783          	lw	a5,100(s0)
    4034:	ffb00713          	li	a4,-5
    4038:	e80986e3          	beqz	s3,3ec4 <fatfs_init+0x40>
    403c:	00990933          	add	s2,s2,s1
    4040:	00a90533          	add	a0,s2,a0
    4044:	40a78533          	sub	a0,a5,a0
    4048:	00098593          	mv	a1,s3
    404c:	ffffe097          	auipc	ra,0xffffe
    4050:	4f0080e7          	jalr	1264(ra) # 253c <__udivsi3>
    4054:	000017b7          	lui	a5,0x1
    4058:	ff478793          	addi	a5,a5,-12 # ff4 <scan_files+0x7c>
    405c:	ffb00713          	li	a4,-5
    4060:	e6a7f2e3          	bgeu	a5,a0,3ec4 <fatfs_init+0x40>
    4064:	000107b7          	lui	a5,0x10
    4068:	ff478793          	addi	a5,a5,-12 # fff4 <_files+0x7838>
    406c:	02a7e663          	bltu	a5,a0,4098 <fatfs_init+0x214>
    4070:	00042423          	sw	zero,8(s0)
    4074:	02042823          	sw	zero,48(s0)
    4078:	00000713          	li	a4,0
    407c:	e49ff06f          	j	3ec4 <fatfs_init+0x40>
    4080:	ff278793          	addi	a5,a5,-14
    4084:	0ff7f793          	zext.b	a5,a5
    4088:	00100713          	li	a4,1
    408c:	00000513          	li	a0,0
    4090:	eaf776e3          	bgeu	a4,a5,3f3c <fatfs_init+0xb8>
    4094:	ed1ff06f          	j	3f64 <fatfs_init+0xe0>
    4098:	00100793          	li	a5,1
    409c:	02f42823          	sw	a5,48(s0)
    40a0:	fd9ff06f          	j	4078 <fatfs_init+0x1f4>

000040a4 <fl_attach_media>:
    40a4:	000067b7          	lui	a5,0x6
    40a8:	7347a783          	lw	a5,1844(a5) # 6734 <_filelib_init>
    40ac:	fe010113          	addi	sp,sp,-32
    40b0:	00812c23          	sw	s0,24(sp)
    40b4:	00112e23          	sw	ra,28(sp)
    40b8:	00050413          	mv	s0,a0
    40bc:	00079a63          	bnez	a5,40d0 <fl_attach_media+0x2c>
    40c0:	00b12623          	sw	a1,12(sp)
    40c4:	fffff097          	auipc	ra,0xfffff
    40c8:	080080e7          	jalr	128(ra) # 3144 <fl_init>
    40cc:	00c12583          	lw	a1,12(sp)
    40d0:	000087b7          	lui	a5,0x8
    40d4:	35478513          	addi	a0,a5,852 # 8354 <_fs>
    40d8:	02b52c23          	sw	a1,56(a0)
    40dc:	02852a23          	sw	s0,52(a0)
    40e0:	00000097          	auipc	ra,0x0
    40e4:	da4080e7          	jalr	-604(ra) # 3e84 <fatfs_init>
    40e8:	00050593          	mv	a1,a0
    40ec:	02050863          	beqz	a0,411c <fl_attach_media+0x78>
    40f0:	00a12623          	sw	a0,12(sp)
    40f4:	00006537          	lui	a0,0x6
    40f8:	2c850513          	addi	a0,a0,712 # 62c8 <LEDS+0x180>
    40fc:	fffff097          	auipc	ra,0xfffff
    4100:	a78080e7          	jalr	-1416(ra) # 2b74 <printf>
    4104:	00c12583          	lw	a1,12(sp)
    4108:	01c12083          	lw	ra,28(sp)
    410c:	01812403          	lw	s0,24(sp)
    4110:	00058513          	mv	a0,a1
    4114:	02010113          	addi	sp,sp,32
    4118:	00008067          	ret
    411c:	000067b7          	lui	a5,0x6
    4120:	00100713          	li	a4,1
    4124:	72e7a823          	sw	a4,1840(a5) # 6730 <_filelib_valid>
    4128:	fe1ff06f          	j	4108 <fl_attach_media+0x64>

0000412c <fatfs_fat_purge>:
    412c:	25452583          	lw	a1,596(a0)
    4130:	fe010113          	addi	sp,sp,-32
    4134:	00812c23          	sw	s0,24(sp)
    4138:	00112e23          	sw	ra,28(sp)
    413c:	00050413          	mv	s0,a0
    4140:	00059663          	bnez	a1,414c <fatfs_fat_purge+0x20>
    4144:	00100513          	li	a0,1
    4148:	02c0006f          	j	4174 <fatfs_fat_purge+0x48>
    414c:	2045a783          	lw	a5,516(a1)
    4150:	00079663          	bnez	a5,415c <fatfs_fat_purge+0x30>
    4154:	20c5a583          	lw	a1,524(a1)
    4158:	fe9ff06f          	j	4140 <fatfs_fat_purge+0x14>
    415c:	00040513          	mv	a0,s0
    4160:	00b12623          	sw	a1,12(sp)
    4164:	fffff097          	auipc	ra,0xfffff
    4168:	c80080e7          	jalr	-896(ra) # 2de4 <fatfs_fat_writeback>
    416c:	00c12583          	lw	a1,12(sp)
    4170:	fe0512e3          	bnez	a0,4154 <fatfs_fat_purge+0x28>
    4174:	01c12083          	lw	ra,28(sp)
    4178:	01812403          	lw	s0,24(sp)
    417c:	02010113          	addi	sp,sp,32
    4180:	00008067          	ret

00004184 <fatfs_find_next_cluster>:
    4184:	ff010113          	addi	sp,sp,-16
    4188:	00812423          	sw	s0,8(sp)
    418c:	01212023          	sw	s2,0(sp)
    4190:	00112623          	sw	ra,12(sp)
    4194:	00912223          	sw	s1,4(sp)
    4198:	00050913          	mv	s2,a0
    419c:	00200413          	li	s0,2
    41a0:	00058463          	beqz	a1,41a8 <fatfs_find_next_cluster+0x24>
    41a4:	00058413          	mv	s0,a1
    41a8:	03092783          	lw	a5,48(s2)
    41ac:	00745493          	srli	s1,s0,0x7
    41b0:	00079463          	bnez	a5,41b8 <fatfs_find_next_cluster+0x34>
    41b4:	00845493          	srli	s1,s0,0x8
    41b8:	01492583          	lw	a1,20(s2)
    41bc:	00090513          	mv	a0,s2
    41c0:	00b485b3          	add	a1,s1,a1
    41c4:	fffff097          	auipc	ra,0xfffff
    41c8:	ca4080e7          	jalr	-860(ra) # 2e68 <fatfs_fat_read_sector>
    41cc:	00050793          	mv	a5,a0
    41d0:	fff00513          	li	a0,-1
    41d4:	04078863          	beqz	a5,4224 <fatfs_find_next_cluster+0xa0>
    41d8:	03092703          	lw	a4,48(s2)
    41dc:	2087a783          	lw	a5,520(a5)
    41e0:	04071e63          	bnez	a4,423c <fatfs_find_next_cluster+0xb8>
    41e4:	00849493          	slli	s1,s1,0x8
    41e8:	40940433          	sub	s0,s0,s1
    41ec:	00141413          	slli	s0,s0,0x1
    41f0:	01041413          	slli	s0,s0,0x10
    41f4:	01045413          	srli	s0,s0,0x10
    41f8:	008787b3          	add	a5,a5,s0
    41fc:	0017c503          	lbu	a0,1(a5)
    4200:	0007c783          	lbu	a5,0(a5)
    4204:	00851513          	slli	a0,a0,0x8
    4208:	00f50533          	add	a0,a0,a5
    420c:	ffff07b7          	lui	a5,0xffff0
    4210:	00878793          	addi	a5,a5,8 # ffff0008 <__stacktop+0xfffe0008>
    4214:	00f507b3          	add	a5,a0,a5
    4218:	00700713          	li	a4,7
    421c:	00f76463          	bltu	a4,a5,4224 <fatfs_find_next_cluster+0xa0>
    4220:	fff00513          	li	a0,-1
    4224:	00c12083          	lw	ra,12(sp)
    4228:	00812403          	lw	s0,8(sp)
    422c:	00412483          	lw	s1,4(sp)
    4230:	00012903          	lw	s2,0(sp)
    4234:	01010113          	addi	sp,sp,16
    4238:	00008067          	ret
    423c:	00749493          	slli	s1,s1,0x7
    4240:	40940433          	sub	s0,s0,s1
    4244:	00241413          	slli	s0,s0,0x2
    4248:	01041413          	slli	s0,s0,0x10
    424c:	01045413          	srli	s0,s0,0x10
    4250:	008787b3          	add	a5,a5,s0
    4254:	0037c503          	lbu	a0,3(a5)
    4258:	0027c703          	lbu	a4,2(a5)
    425c:	01851513          	slli	a0,a0,0x18
    4260:	01071713          	slli	a4,a4,0x10
    4264:	00e50533          	add	a0,a0,a4
    4268:	0007c703          	lbu	a4,0(a5)
    426c:	0017c783          	lbu	a5,1(a5)
    4270:	00e50533          	add	a0,a0,a4
    4274:	00879793          	slli	a5,a5,0x8
    4278:	00f50533          	add	a0,a0,a5
    427c:	00451513          	slli	a0,a0,0x4
    4280:	00455513          	srli	a0,a0,0x4
    4284:	f00007b7          	lui	a5,0xf0000
    4288:	f89ff06f          	j	4210 <fatfs_find_next_cluster+0x8c>

0000428c <fatfs_sector_reader>:
    428c:	03052783          	lw	a5,48(a0)
    4290:	fe010113          	addi	sp,sp,-32
    4294:	00812c23          	sw	s0,24(sp)
    4298:	01212823          	sw	s2,16(sp)
    429c:	01512223          	sw	s5,4(sp)
    42a0:	00112e23          	sw	ra,28(sp)
    42a4:	00912a23          	sw	s1,20(sp)
    42a8:	01312623          	sw	s3,12(sp)
    42ac:	01412423          	sw	s4,8(sp)
    42b0:	01612023          	sw	s6,0(sp)
    42b4:	00f5e7b3          	or	a5,a1,a5
    42b8:	00050413          	mv	s0,a0
    42bc:	00060913          	mv	s2,a2
    42c0:	00068a93          	mv	s5,a3
    42c4:	08079063          	bnez	a5,4344 <fatfs_sector_reader+0xb8>
    42c8:	01052783          	lw	a5,16(a0)
    42cc:	02f66863          	bltu	a2,a5,42fc <fatfs_sector_reader+0x70>
    42d0:	00000513          	li	a0,0
    42d4:	01c12083          	lw	ra,28(sp)
    42d8:	01812403          	lw	s0,24(sp)
    42dc:	01412483          	lw	s1,20(sp)
    42e0:	01012903          	lw	s2,16(sp)
    42e4:	00c12983          	lw	s3,12(sp)
    42e8:	00812a03          	lw	s4,8(sp)
    42ec:	00412a83          	lw	s5,4(sp)
    42f0:	00012b03          	lw	s6,0(sp)
    42f4:	02010113          	addi	sp,sp,32
    42f8:	00008067          	ret
    42fc:	01c52503          	lw	a0,28(a0)
    4300:	00c42783          	lw	a5,12(s0)
    4304:	00f50533          	add	a0,a0,a5
    4308:	01250533          	add	a0,a0,s2
    430c:	0a0a8663          	beqz	s5,43b8 <fatfs_sector_reader+0x12c>
    4310:	03442783          	lw	a5,52(s0)
    4314:	00100613          	li	a2,1
    4318:	000a8593          	mv	a1,s5
    431c:	01812403          	lw	s0,24(sp)
    4320:	01c12083          	lw	ra,28(sp)
    4324:	01412483          	lw	s1,20(sp)
    4328:	01012903          	lw	s2,16(sp)
    432c:	00c12983          	lw	s3,12(sp)
    4330:	00812a03          	lw	s4,8(sp)
    4334:	00412a83          	lw	s5,4(sp)
    4338:	00012b03          	lw	s6,0(sp)
    433c:	02010113          	addi	sp,sp,32
    4340:	00078067          	jr	a5 # f0000000 <__stacktop+0xefff0000>
    4344:	00054783          	lbu	a5,0(a0)
    4348:	00058493          	mv	s1,a1
    434c:	00060513          	mv	a0,a2
    4350:	00078593          	mv	a1,a5
    4354:	00078a13          	mv	s4,a5
    4358:	ffffe097          	auipc	ra,0xffffe
    435c:	1e4080e7          	jalr	484(ra) # 253c <__udivsi3>
    4360:	00050b13          	mv	s6,a0
    4364:	00000993          	li	s3,0
    4368:	03699a63          	bne	s3,s6,439c <fatfs_sector_reader+0x110>
    436c:	fff00793          	li	a5,-1
    4370:	f6f480e3          	beq	s1,a5,42d0 <fatfs_sector_reader+0x44>
    4374:	000a0593          	mv	a1,s4
    4378:	00090513          	mv	a0,s2
    437c:	ffffe097          	auipc	ra,0xffffe
    4380:	208080e7          	jalr	520(ra) # 2584 <__umodsi3>
    4384:	00050913          	mv	s2,a0
    4388:	00048593          	mv	a1,s1
    438c:	00040513          	mv	a0,s0
    4390:	fffff097          	auipc	ra,0xfffff
    4394:	c84080e7          	jalr	-892(ra) # 3014 <fatfs_lba_of_cluster>
    4398:	f71ff06f          	j	4308 <fatfs_sector_reader+0x7c>
    439c:	00048593          	mv	a1,s1
    43a0:	00040513          	mv	a0,s0
    43a4:	00000097          	auipc	ra,0x0
    43a8:	de0080e7          	jalr	-544(ra) # 4184 <fatfs_find_next_cluster>
    43ac:	00050493          	mv	s1,a0
    43b0:	00198993          	addi	s3,s3,1
    43b4:	fb5ff06f          	j	4368 <fatfs_sector_reader+0xdc>
    43b8:	24442783          	lw	a5,580(s0)
    43bc:	00a78c63          	beq	a5,a0,43d4 <fatfs_sector_reader+0x148>
    43c0:	03442783          	lw	a5,52(s0)
    43c4:	24a42223          	sw	a0,580(s0)
    43c8:	00100613          	li	a2,1
    43cc:	04440593          	addi	a1,s0,68
    43d0:	f4dff06f          	j	431c <fatfs_sector_reader+0x90>
    43d4:	00100513          	li	a0,1
    43d8:	efdff06f          	j	42d4 <fatfs_sector_reader+0x48>

000043dc <fatfs_get_file_entry>:
    43dc:	eb010113          	addi	sp,sp,-336
    43e0:	14812423          	sw	s0,328(sp)
    43e4:	14912223          	sw	s1,324(sp)
    43e8:	13312e23          	sw	s3,316(sp)
    43ec:	13712623          	sw	s7,300(sp)
    43f0:	13812423          	sw	s8,296(sp)
    43f4:	13912223          	sw	s9,292(sp)
    43f8:	14112623          	sw	ra,332(sp)
    43fc:	15212023          	sw	s2,320(sp)
    4400:	13412c23          	sw	s4,312(sp)
    4404:	13512a23          	sw	s5,308(sp)
    4408:	13612823          	sw	s6,304(sp)
    440c:	00050993          	mv	s3,a0
    4410:	00058c93          	mv	s9,a1
    4414:	00060b93          	mv	s7,a2
    4418:	00068c13          	mv	s8,a3
    441c:	10010ea3          	sb	zero,285(sp)
    4420:	01810413          	addi	s0,sp,24
    4424:	11c10493          	addi	s1,sp,284
    4428:	00040513          	mv	a0,s0
    442c:	00d00613          	li	a2,13
    4430:	00000593          	li	a1,0
    4434:	00d40413          	addi	s0,s0,13
    4438:	ffffe097          	auipc	ra,0xffffe
    443c:	1b0080e7          	jalr	432(ra) # 25e8 <memset>
    4440:	fe9414e3          	bne	s0,s1,4428 <fatfs_get_file_entry+0x4c>
    4444:	00000493          	li	s1,0
    4448:	24498a13          	addi	s4,s3,580
    444c:	00810913          	addi	s2,sp,8
    4450:	00800a93          	li	s5,8
    4454:	02e00b13          	li	s6,46
    4458:	00000693          	li	a3,0
    445c:	00048613          	mv	a2,s1
    4460:	000c8593          	mv	a1,s9
    4464:	00098513          	mv	a0,s3
    4468:	00000097          	auipc	ra,0x0
    446c:	e24080e7          	jalr	-476(ra) # 428c <fatfs_sector_reader>
    4470:	08050c63          	beqz	a0,4508 <fatfs_get_file_entry+0x12c>
    4474:	00148493          	addi	s1,s1,1
    4478:	04498413          	addi	s0,s3,68
    447c:	00040513          	mv	a0,s0
    4480:	fffff097          	auipc	ra,0xfffff
    4484:	f34080e7          	jalr	-204(ra) # 33b4 <fatfs_entry_lfn_text>
    4488:	02050063          	beqz	a0,44a8 <fatfs_get_file_entry+0xcc>
    448c:	00040593          	mv	a1,s0
    4490:	01810513          	addi	a0,sp,24
    4494:	fffff097          	auipc	ra,0xfffff
    4498:	e18080e7          	jalr	-488(ra) # 32ac <fatfs_lfn_cache_entry>
    449c:	02040413          	addi	s0,s0,32
    44a0:	fd441ee3          	bne	s0,s4,447c <fatfs_get_file_entry+0xa0>
    44a4:	fb5ff06f          	j	4458 <fatfs_get_file_entry+0x7c>
    44a8:	00040513          	mv	a0,s0
    44ac:	fffff097          	auipc	ra,0xfffff
    44b0:	f1c080e7          	jalr	-228(ra) # 33c8 <fatfs_entry_lfn_invalid>
    44b4:	00050663          	beqz	a0,44c0 <fatfs_get_file_entry+0xe4>
    44b8:	10010ea3          	sb	zero,285(sp)
    44bc:	fe1ff06f          	j	449c <fatfs_get_file_entry+0xc0>
    44c0:	00040593          	mv	a1,s0
    44c4:	01810513          	addi	a0,sp,24
    44c8:	fffff097          	auipc	ra,0xfffff
    44cc:	f34080e7          	jalr	-204(ra) # 33fc <fatfs_entry_lfn_exists>
    44d0:	06050663          	beqz	a0,453c <fatfs_get_file_entry+0x160>
    44d4:	01810513          	addi	a0,sp,24
    44d8:	fffff097          	auipc	ra,0xfffff
    44dc:	ea0080e7          	jalr	-352(ra) # 3378 <fatfs_lfn_cache_get>
    44e0:	000b8593          	mv	a1,s7
    44e4:	fffff097          	auipc	ra,0xfffff
    44e8:	6dc080e7          	jalr	1756(ra) # 3bc0 <fatfs_compare_names>
    44ec:	fc0506e3          	beqz	a0,44b8 <fatfs_get_file_entry+0xdc>
    44f0:	02000613          	li	a2,32
    44f4:	00040593          	mv	a1,s0
    44f8:	000c0513          	mv	a0,s8
    44fc:	ffffe097          	auipc	ra,0xffffe
    4500:	108080e7          	jalr	264(ra) # 2604 <memcpy>
    4504:	00100513          	li	a0,1
    4508:	14c12083          	lw	ra,332(sp)
    450c:	14812403          	lw	s0,328(sp)
    4510:	14412483          	lw	s1,324(sp)
    4514:	14012903          	lw	s2,320(sp)
    4518:	13c12983          	lw	s3,316(sp)
    451c:	13812a03          	lw	s4,312(sp)
    4520:	13412a83          	lw	s5,308(sp)
    4524:	13012b03          	lw	s6,304(sp)
    4528:	12c12b83          	lw	s7,300(sp)
    452c:	12812c03          	lw	s8,296(sp)
    4530:	12412c83          	lw	s9,292(sp)
    4534:	15010113          	addi	sp,sp,336
    4538:	00008067          	ret
    453c:	00040513          	mv	a0,s0
    4540:	fffff097          	auipc	ra,0xfffff
    4544:	f0c080e7          	jalr	-244(ra) # 344c <fatfs_entry_sfn_only>
    4548:	f4050ae3          	beqz	a0,449c <fatfs_get_file_entry+0xc0>
    454c:	00d00613          	li	a2,13
    4550:	00000593          	li	a1,0
    4554:	00090513          	mv	a0,s2
    4558:	ffffe097          	auipc	ra,0xffffe
    455c:	090080e7          	jalr	144(ra) # 25e8 <memset>
    4560:	00000793          	li	a5,0
    4564:	00f406b3          	add	a3,s0,a5
    4568:	0006c683          	lbu	a3,0(a3)
    456c:	00f90733          	add	a4,s2,a5
    4570:	00178793          	addi	a5,a5,1
    4574:	00d70023          	sb	a3,0(a4)
    4578:	ff5796e3          	bne	a5,s5,4564 <fatfs_get_file_entry+0x188>
    457c:	00844703          	lbu	a4,8(s0)
    4580:	00944783          	lbu	a5,9(s0)
    4584:	00a44683          	lbu	a3,10(s0)
    4588:	00e108a3          	sb	a4,17(sp)
    458c:	00f10923          	sb	a5,18(sp)
    4590:	fe070713          	addi	a4,a4,-32
    4594:	fe078793          	addi	a5,a5,-32
    4598:	00f037b3          	snez	a5,a5
    459c:	00e03733          	snez	a4,a4
    45a0:	00d109a3          	sb	a3,19(sp)
    45a4:	00e7e7b3          	or	a5,a5,a4
    45a8:	00079863          	bnez	a5,45b8 <fatfs_get_file_entry+0x1dc>
    45ac:	fe068693          	addi	a3,a3,-32
    45b0:	02000793          	li	a5,32
    45b4:	00068a63          	beqz	a3,45c8 <fatfs_get_file_entry+0x1ec>
    45b8:	00814703          	lbu	a4,8(sp)
    45bc:	02e00793          	li	a5,46
    45c0:	01671463          	bne	a4,s6,45c8 <fatfs_get_file_entry+0x1ec>
    45c4:	02000793          	li	a5,32
    45c8:	00f10823          	sb	a5,16(sp)
    45cc:	000b8593          	mv	a1,s7
    45d0:	00090513          	mv	a0,s2
    45d4:	f11ff06f          	j	44e4 <fatfs_get_file_entry+0x108>

000045d8 <_open_directory>:
    45d8:	eb010113          	addi	sp,sp,-336
    45dc:	15212023          	sw	s2,320(sp)
    45e0:	00008937          	lui	s2,0x8
    45e4:	35490913          	addi	s2,s2,852 # 8354 <_fs>
    45e8:	14812423          	sw	s0,328(sp)
    45ec:	00892403          	lw	s0,8(s2)
    45f0:	14912223          	sw	s1,324(sp)
    45f4:	13312e23          	sw	s3,316(sp)
    45f8:	13412c23          	sw	s4,312(sp)
    45fc:	13512a23          	sw	s5,308(sp)
    4600:	13612823          	sw	s6,304(sp)
    4604:	14112623          	sw	ra,332(sp)
    4608:	00050a13          	mv	s4,a0
    460c:	00058a93          	mv	s5,a1
    4610:	fffff097          	auipc	ra,0xfffff
    4614:	368080e7          	jalr	872(ra) # 3978 <fatfs_total_path_levels>
    4618:	00050b13          	mv	s6,a0
    461c:	00000493          	li	s1,0
    4620:	fff00993          	li	s3,-1
    4624:	009b5863          	bge	s6,s1,4634 <_open_directory+0x5c>
    4628:	008aa023          	sw	s0,0(s5)
    462c:	00100513          	li	a0,1
    4630:	0240006f          	j	4654 <_open_directory+0x7c>
    4634:	10400693          	li	a3,260
    4638:	02c10613          	addi	a2,sp,44
    463c:	00048593          	mv	a1,s1
    4640:	000a0513          	mv	a0,s4
    4644:	fffff097          	auipc	ra,0xfffff
    4648:	3a4080e7          	jalr	932(ra) # 39e8 <fatfs_get_substring>
    464c:	03351863          	bne	a0,s3,467c <_open_directory+0xa4>
    4650:	00000513          	li	a0,0
    4654:	14c12083          	lw	ra,332(sp)
    4658:	14812403          	lw	s0,328(sp)
    465c:	14412483          	lw	s1,324(sp)
    4660:	14012903          	lw	s2,320(sp)
    4664:	13c12983          	lw	s3,316(sp)
    4668:	13812a03          	lw	s4,312(sp)
    466c:	13412a83          	lw	s5,308(sp)
    4670:	13012b03          	lw	s6,304(sp)
    4674:	15010113          	addi	sp,sp,336
    4678:	00008067          	ret
    467c:	00c10693          	addi	a3,sp,12
    4680:	02c10613          	addi	a2,sp,44
    4684:	00040593          	mv	a1,s0
    4688:	00090513          	mv	a0,s2
    468c:	00000097          	auipc	ra,0x0
    4690:	d50080e7          	jalr	-688(ra) # 43dc <fatfs_get_file_entry>
    4694:	fa050ee3          	beqz	a0,4650 <_open_directory+0x78>
    4698:	01714783          	lbu	a5,23(sp)
    469c:	0107f793          	andi	a5,a5,16
    46a0:	fa0788e3          	beqz	a5,4650 <_open_directory+0x78>
    46a4:	02015403          	lhu	s0,32(sp)
    46a8:	02615783          	lhu	a5,38(sp)
    46ac:	00148493          	addi	s1,s1,1
    46b0:	01041413          	slli	s0,s0,0x10
    46b4:	00f40433          	add	s0,s0,a5
    46b8:	f6dff06f          	j	4624 <_open_directory+0x4c>

000046bc <fl_opendir>:
    46bc:	fe010113          	addi	sp,sp,-32
    46c0:	fff00793          	li	a5,-1
    46c4:	00f12623          	sw	a5,12(sp)
    46c8:	000067b7          	lui	a5,0x6
    46cc:	7347a783          	lw	a5,1844(a5) # 6734 <_filelib_init>
    46d0:	00812c23          	sw	s0,24(sp)
    46d4:	01212823          	sw	s2,16(sp)
    46d8:	00112e23          	sw	ra,28(sp)
    46dc:	00912a23          	sw	s1,20(sp)
    46e0:	00050913          	mv	s2,a0
    46e4:	00058413          	mv	s0,a1
    46e8:	00079663          	bnez	a5,46f4 <fl_opendir+0x38>
    46ec:	fffff097          	auipc	ra,0xfffff
    46f0:	a58080e7          	jalr	-1448(ra) # 3144 <fl_init>
    46f4:	000084b7          	lui	s1,0x8
    46f8:	35448493          	addi	s1,s1,852 # 8354 <_fs>
    46fc:	03c4a783          	lw	a5,60(s1)
    4700:	00078463          	beqz	a5,4708 <fl_opendir+0x4c>
    4704:	000780e7          	jalr	a5
    4708:	00090513          	mv	a0,s2
    470c:	fffff097          	auipc	ra,0xfffff
    4710:	26c080e7          	jalr	620(ra) # 3978 <fatfs_total_path_levels>
    4714:	fff00793          	li	a5,-1
    4718:	02f51063          	bne	a0,a5,4738 <fl_opendir+0x7c>
    471c:	0084a783          	lw	a5,8(s1)
    4720:	00f12623          	sw	a5,12(sp)
    4724:	00c12783          	lw	a5,12(sp)
    4728:	00042023          	sw	zero,0(s0)
    472c:	00040423          	sb	zero,8(s0)
    4730:	00f42223          	sw	a5,4(s0)
    4734:	0180006f          	j	474c <fl_opendir+0x90>
    4738:	00c10593          	addi	a1,sp,12
    473c:	00090513          	mv	a0,s2
    4740:	00000097          	auipc	ra,0x0
    4744:	e98080e7          	jalr	-360(ra) # 45d8 <_open_directory>
    4748:	fc051ee3          	bnez	a0,4724 <fl_opendir+0x68>
    474c:	0404a783          	lw	a5,64(s1)
    4750:	00078463          	beqz	a5,4758 <fl_opendir+0x9c>
    4754:	000780e7          	jalr	a5
    4758:	00c12703          	lw	a4,12(sp)
    475c:	fff00793          	li	a5,-1
    4760:	00f71463          	bne	a4,a5,4768 <fl_opendir+0xac>
    4764:	00000413          	li	s0,0
    4768:	01c12083          	lw	ra,28(sp)
    476c:	00040513          	mv	a0,s0
    4770:	01812403          	lw	s0,24(sp)
    4774:	01412483          	lw	s1,20(sp)
    4778:	01012903          	lw	s2,16(sp)
    477c:	02010113          	addi	sp,sp,32
    4780:	00008067          	ret

00004784 <_open_file>:
    4784:	fc010113          	addi	sp,sp,-64
    4788:	03312623          	sw	s3,44(sp)
    478c:	02112e23          	sw	ra,60(sp)
    4790:	02812c23          	sw	s0,56(sp)
    4794:	02912a23          	sw	s1,52(sp)
    4798:	03212823          	sw	s2,48(sp)
    479c:	00050993          	mv	s3,a0
    47a0:	ffffe097          	auipc	ra,0xffffe
    47a4:	7b4080e7          	jalr	1972(ra) # 2f54 <_allocate_file>
    47a8:	06050463          	beqz	a0,4810 <_open_file+0x8c>
    47ac:	01450913          	addi	s2,a0,20
    47b0:	00050413          	mv	s0,a0
    47b4:	10400613          	li	a2,260
    47b8:	00000593          	li	a1,0
    47bc:	00090513          	mv	a0,s2
    47c0:	ffffe097          	auipc	ra,0xffffe
    47c4:	e28080e7          	jalr	-472(ra) # 25e8 <memset>
    47c8:	11840493          	addi	s1,s0,280
    47cc:	10400613          	li	a2,260
    47d0:	00000593          	li	a1,0
    47d4:	00048513          	mv	a0,s1
    47d8:	ffffe097          	auipc	ra,0xffffe
    47dc:	e10080e7          	jalr	-496(ra) # 25e8 <memset>
    47e0:	10400713          	li	a4,260
    47e4:	00048693          	mv	a3,s1
    47e8:	00070613          	mv	a2,a4
    47ec:	00090593          	mv	a1,s2
    47f0:	00098513          	mv	a0,s3
    47f4:	fffff097          	auipc	ra,0xfffff
    47f8:	2dc080e7          	jalr	732(ra) # 3ad0 <fatfs_split_path>
    47fc:	fff00793          	li	a5,-1
    4800:	02f51a63          	bne	a0,a5,4834 <_open_file+0xb0>
    4804:	00040513          	mv	a0,s0
    4808:	ffffe097          	auipc	ra,0xffffe
    480c:	7c4080e7          	jalr	1988(ra) # 2fcc <_free_file>
    4810:	00000413          	li	s0,0
    4814:	03c12083          	lw	ra,60(sp)
    4818:	00040513          	mv	a0,s0
    481c:	03812403          	lw	s0,56(sp)
    4820:	03412483          	lw	s1,52(sp)
    4824:	03012903          	lw	s2,48(sp)
    4828:	02c12983          	lw	s3,44(sp)
    482c:	04010113          	addi	sp,sp,64
    4830:	00008067          	ret
    4834:	00040513          	mv	a0,s0
    4838:	fffff097          	auipc	ra,0xfffff
    483c:	514080e7          	jalr	1300(ra) # 3d4c <_check_file_open>
    4840:	fc0512e3          	bnez	a0,4804 <_open_file+0x80>
    4844:	01444783          	lbu	a5,20(s0)
    4848:	08079c63          	bnez	a5,48e0 <_open_file+0x15c>
    484c:	000087b7          	lui	a5,0x8
    4850:	35c7a783          	lw	a5,860(a5) # 835c <_fs+0x8>
    4854:	00f42023          	sw	a5,0(s0)
    4858:	00042583          	lw	a1,0(s0)
    485c:	00048613          	mv	a2,s1
    4860:	000084b7          	lui	s1,0x8
    4864:	00010693          	mv	a3,sp
    4868:	35448513          	addi	a0,s1,852 # 8354 <_fs>
    486c:	00000097          	auipc	ra,0x0
    4870:	b70080e7          	jalr	-1168(ra) # 43dc <fatfs_get_file_entry>
    4874:	f80508e3          	beqz	a0,4804 <_open_file+0x80>
    4878:	00b14783          	lbu	a5,11(sp)
    487c:	0207f793          	andi	a5,a5,32
    4880:	f80782e3          	beqz	a5,4804 <_open_file+0x80>
    4884:	00b00613          	li	a2,11
    4888:	00010593          	mv	a1,sp
    488c:	21c40513          	addi	a0,s0,540
    4890:	ffffe097          	auipc	ra,0xffffe
    4894:	d74080e7          	jalr	-652(ra) # 2604 <memcpy>
    4898:	01c12783          	lw	a5,28(sp)
    489c:	01a15703          	lhu	a4,26(sp)
    48a0:	00042423          	sw	zero,8(s0)
    48a4:	00f42623          	sw	a5,12(s0)
    48a8:	01415783          	lhu	a5,20(sp)
    48ac:	42042a23          	sw	zero,1076(s0)
    48b0:	00042823          	sw	zero,16(s0)
    48b4:	01079793          	slli	a5,a5,0x10
    48b8:	00e787b3          	add	a5,a5,a4
    48bc:	00f42223          	sw	a5,4(s0)
    48c0:	fff00793          	li	a5,-1
    48c4:	42f42823          	sw	a5,1072(s0)
    48c8:	22f42423          	sw	a5,552(s0)
    48cc:	22f42623          	sw	a5,556(s0)
    48d0:	35448513          	addi	a0,s1,852
    48d4:	00000097          	auipc	ra,0x0
    48d8:	858080e7          	jalr	-1960(ra) # 412c <fatfs_fat_purge>
    48dc:	f39ff06f          	j	4814 <_open_file+0x90>
    48e0:	00040593          	mv	a1,s0
    48e4:	00090513          	mv	a0,s2
    48e8:	00000097          	auipc	ra,0x0
    48ec:	cf0080e7          	jalr	-784(ra) # 45d8 <_open_directory>
    48f0:	f60514e3          	bnez	a0,4858 <_open_file+0xd4>
    48f4:	f11ff06f          	j	4804 <_open_file+0x80>

000048f8 <fatfs_sfn_exists>:
    48f8:	fe010113          	addi	sp,sp,-32
    48fc:	01212823          	sw	s2,16(sp)
    4900:	01312623          	sw	s3,12(sp)
    4904:	01412423          	sw	s4,8(sp)
    4908:	01512223          	sw	s5,4(sp)
    490c:	01612023          	sw	s6,0(sp)
    4910:	00112e23          	sw	ra,28(sp)
    4914:	00812c23          	sw	s0,24(sp)
    4918:	00912a23          	sw	s1,20(sp)
    491c:	00050993          	mv	s3,a0
    4920:	00058a93          	mv	s5,a1
    4924:	00060b13          	mv	s6,a2
    4928:	00000913          	li	s2,0
    492c:	24450a13          	addi	s4,a0,580
    4930:	00000693          	li	a3,0
    4934:	00090613          	mv	a2,s2
    4938:	000a8593          	mv	a1,s5
    493c:	00098513          	mv	a0,s3
    4940:	00000097          	auipc	ra,0x0
    4944:	94c080e7          	jalr	-1716(ra) # 428c <fatfs_sector_reader>
    4948:	00050413          	mv	s0,a0
    494c:	06050263          	beqz	a0,49b0 <fatfs_sfn_exists+0xb8>
    4950:	00190913          	addi	s2,s2,1
    4954:	04498493          	addi	s1,s3,68
    4958:	00048513          	mv	a0,s1
    495c:	fffff097          	auipc	ra,0xfffff
    4960:	a58080e7          	jalr	-1448(ra) # 33b4 <fatfs_entry_lfn_text>
    4964:	00050863          	beqz	a0,4974 <fatfs_sfn_exists+0x7c>
    4968:	02048493          	addi	s1,s1,32
    496c:	ff4496e3          	bne	s1,s4,4958 <fatfs_sfn_exists+0x60>
    4970:	fc1ff06f          	j	4930 <fatfs_sfn_exists+0x38>
    4974:	00048513          	mv	a0,s1
    4978:	fffff097          	auipc	ra,0xfffff
    497c:	a50080e7          	jalr	-1456(ra) # 33c8 <fatfs_entry_lfn_invalid>
    4980:	fe0514e3          	bnez	a0,4968 <fatfs_sfn_exists+0x70>
    4984:	00048513          	mv	a0,s1
    4988:	fffff097          	auipc	ra,0xfffff
    498c:	ac4080e7          	jalr	-1340(ra) # 344c <fatfs_entry_sfn_only>
    4990:	00050413          	mv	s0,a0
    4994:	fc050ae3          	beqz	a0,4968 <fatfs_sfn_exists+0x70>
    4998:	00b00613          	li	a2,11
    499c:	000b0593          	mv	a1,s6
    49a0:	00048513          	mv	a0,s1
    49a4:	ffffe097          	auipc	ra,0xffffe
    49a8:	ca4080e7          	jalr	-860(ra) # 2648 <strncmp>
    49ac:	fa051ee3          	bnez	a0,4968 <fatfs_sfn_exists+0x70>
    49b0:	01c12083          	lw	ra,28(sp)
    49b4:	00040513          	mv	a0,s0
    49b8:	01812403          	lw	s0,24(sp)
    49bc:	01412483          	lw	s1,20(sp)
    49c0:	01012903          	lw	s2,16(sp)
    49c4:	00c12983          	lw	s3,12(sp)
    49c8:	00812a03          	lw	s4,8(sp)
    49cc:	00412a83          	lw	s5,4(sp)
    49d0:	00012b03          	lw	s6,0(sp)
    49d4:	02010113          	addi	sp,sp,32
    49d8:	00008067          	ret

000049dc <fatfs_update_file_length>:
    49dc:	03852783          	lw	a5,56(a0)
    49e0:	14078e63          	beqz	a5,4b3c <fatfs_update_file_length+0x160>
    49e4:	fd010113          	addi	sp,sp,-48
    49e8:	02912223          	sw	s1,36(sp)
    49ec:	03212023          	sw	s2,32(sp)
    49f0:	01312e23          	sw	s3,28(sp)
    49f4:	01412c23          	sw	s4,24(sp)
    49f8:	01612823          	sw	s6,16(sp)
    49fc:	01712623          	sw	s7,12(sp)
    4a00:	02112623          	sw	ra,44(sp)
    4a04:	02812423          	sw	s0,40(sp)
    4a08:	01512a23          	sw	s5,20(sp)
    4a0c:	00068913          	mv	s2,a3
    4a10:	00060b93          	mv	s7,a2
    4a14:	00058b13          	mv	s6,a1
    4a18:	00050493          	mv	s1,a0
    4a1c:	00000993          	li	s3,0
    4a20:	24450a13          	addi	s4,a0,580
    4a24:	00000693          	li	a3,0
    4a28:	00098613          	mv	a2,s3
    4a2c:	000b0593          	mv	a1,s6
    4a30:	00048513          	mv	a0,s1
    4a34:	00000097          	auipc	ra,0x0
    4a38:	858080e7          	jalr	-1960(ra) # 428c <fatfs_sector_reader>
    4a3c:	0c050863          	beqz	a0,4b0c <fatfs_update_file_length+0x130>
    4a40:	04448413          	addi	s0,s1,68
    4a44:	00198993          	addi	s3,s3,1
    4a48:	00040a93          	mv	s5,s0
    4a4c:	00040513          	mv	a0,s0
    4a50:	fffff097          	auipc	ra,0xfffff
    4a54:	964080e7          	jalr	-1692(ra) # 33b4 <fatfs_entry_lfn_text>
    4a58:	0a051463          	bnez	a0,4b00 <fatfs_update_file_length+0x124>
    4a5c:	00040513          	mv	a0,s0
    4a60:	fffff097          	auipc	ra,0xfffff
    4a64:	968080e7          	jalr	-1688(ra) # 33c8 <fatfs_entry_lfn_invalid>
    4a68:	08051c63          	bnez	a0,4b00 <fatfs_update_file_length+0x124>
    4a6c:	00040513          	mv	a0,s0
    4a70:	fffff097          	auipc	ra,0xfffff
    4a74:	9dc080e7          	jalr	-1572(ra) # 344c <fatfs_entry_sfn_only>
    4a78:	08050463          	beqz	a0,4b00 <fatfs_update_file_length+0x124>
    4a7c:	00b00613          	li	a2,11
    4a80:	000b8593          	mv	a1,s7
    4a84:	00040513          	mv	a0,s0
    4a88:	ffffe097          	auipc	ra,0xffffe
    4a8c:	bc0080e7          	jalr	-1088(ra) # 2648 <strncmp>
    4a90:	06051863          	bnez	a0,4b00 <fatfs_update_file_length+0x124>
    4a94:	00895793          	srli	a5,s2,0x8
    4a98:	01240e23          	sb	s2,28(s0)
    4a9c:	00f40ea3          	sb	a5,29(s0)
    4aa0:	01095793          	srli	a5,s2,0x10
    4aa4:	01895913          	srli	s2,s2,0x18
    4aa8:	00f40f23          	sb	a5,30(s0)
    4aac:	01240fa3          	sb	s2,31(s0)
    4ab0:	00040593          	mv	a1,s0
    4ab4:	02000613          	li	a2,32
    4ab8:	00040513          	mv	a0,s0
    4abc:	ffffe097          	auipc	ra,0xffffe
    4ac0:	b48080e7          	jalr	-1208(ra) # 2604 <memcpy>
    4ac4:	02812403          	lw	s0,40(sp)
    4ac8:	0384a783          	lw	a5,56(s1)
    4acc:	2444a503          	lw	a0,580(s1)
    4ad0:	02c12083          	lw	ra,44(sp)
    4ad4:	02412483          	lw	s1,36(sp)
    4ad8:	02012903          	lw	s2,32(sp)
    4adc:	01c12983          	lw	s3,28(sp)
    4ae0:	01812a03          	lw	s4,24(sp)
    4ae4:	01012b03          	lw	s6,16(sp)
    4ae8:	00c12b83          	lw	s7,12(sp)
    4aec:	000a8593          	mv	a1,s5
    4af0:	01412a83          	lw	s5,20(sp)
    4af4:	00100613          	li	a2,1
    4af8:	03010113          	addi	sp,sp,48
    4afc:	00078067          	jr	a5
    4b00:	02040413          	addi	s0,s0,32
    4b04:	f54414e3          	bne	s0,s4,4a4c <fatfs_update_file_length+0x70>
    4b08:	f1dff06f          	j	4a24 <fatfs_update_file_length+0x48>
    4b0c:	02c12083          	lw	ra,44(sp)
    4b10:	02812403          	lw	s0,40(sp)
    4b14:	02412483          	lw	s1,36(sp)
    4b18:	02012903          	lw	s2,32(sp)
    4b1c:	01c12983          	lw	s3,28(sp)
    4b20:	01812a03          	lw	s4,24(sp)
    4b24:	01412a83          	lw	s5,20(sp)
    4b28:	01012b03          	lw	s6,16(sp)
    4b2c:	00c12b83          	lw	s7,12(sp)
    4b30:	00000513          	li	a0,0
    4b34:	03010113          	addi	sp,sp,48
    4b38:	00008067          	ret
    4b3c:	00000513          	li	a0,0
    4b40:	00008067          	ret

00004b44 <fatfs_list_directory_next>:
    4b44:	ec010113          	addi	sp,sp,-320
    4b48:	13212823          	sw	s2,304(sp)
    4b4c:	13312623          	sw	s3,300(sp)
    4b50:	13412423          	sw	s4,296(sp)
    4b54:	13512223          	sw	s5,292(sp)
    4b58:	13612023          	sw	s6,288(sp)
    4b5c:	12112e23          	sw	ra,316(sp)
    4b60:	12812c23          	sw	s0,312(sp)
    4b64:	12912a23          	sw	s1,308(sp)
    4b68:	00050a13          	mv	s4,a0
    4b6c:	00058913          	mv	s2,a1
    4b70:	00060993          	mv	s3,a2
    4b74:	10010ea3          	sb	zero,285(sp)
    4b78:	04450a93          	addi	s5,a0,68
    4b7c:	00f00b13          	li	s6,15
    4b80:	00092603          	lw	a2,0(s2)
    4b84:	00492583          	lw	a1,4(s2)
    4b88:	00000693          	li	a3,0
    4b8c:	000a0513          	mv	a0,s4
    4b90:	fffff097          	auipc	ra,0xfffff
    4b94:	6fc080e7          	jalr	1788(ra) # 428c <fatfs_sector_reader>
    4b98:	10050c63          	beqz	a0,4cb0 <fatfs_list_directory_next+0x16c>
    4b9c:	00894483          	lbu	s1,8(s2)
    4ba0:	00549413          	slli	s0,s1,0x5
    4ba4:	008a8433          	add	s0,s5,s0
    4ba8:	009b7c63          	bgeu	s6,s1,4bc0 <fatfs_list_directory_next+0x7c>
    4bac:	00092783          	lw	a5,0(s2)
    4bb0:	00090423          	sb	zero,8(s2)
    4bb4:	00178793          	addi	a5,a5,1
    4bb8:	00f92023          	sw	a5,0(s2)
    4bbc:	fc5ff06f          	j	4b80 <fatfs_list_directory_next+0x3c>
    4bc0:	00040513          	mv	a0,s0
    4bc4:	ffffe097          	auipc	ra,0xffffe
    4bc8:	7f0080e7          	jalr	2032(ra) # 33b4 <fatfs_entry_lfn_text>
    4bcc:	02050263          	beqz	a0,4bf0 <fatfs_list_directory_next+0xac>
    4bd0:	00040593          	mv	a1,s0
    4bd4:	01810513          	addi	a0,sp,24
    4bd8:	ffffe097          	auipc	ra,0xffffe
    4bdc:	6d4080e7          	jalr	1748(ra) # 32ac <fatfs_lfn_cache_entry>
    4be0:	00148493          	addi	s1,s1,1
    4be4:	0ff4f493          	zext.b	s1,s1
    4be8:	02040413          	addi	s0,s0,32
    4bec:	fbdff06f          	j	4ba8 <fatfs_list_directory_next+0x64>
    4bf0:	00040513          	mv	a0,s0
    4bf4:	ffffe097          	auipc	ra,0xffffe
    4bf8:	7d4080e7          	jalr	2004(ra) # 33c8 <fatfs_entry_lfn_invalid>
    4bfc:	00050663          	beqz	a0,4c08 <fatfs_list_directory_next+0xc4>
    4c00:	10010ea3          	sb	zero,285(sp)
    4c04:	fddff06f          	j	4be0 <fatfs_list_directory_next+0x9c>
    4c08:	00040593          	mv	a1,s0
    4c0c:	01810513          	addi	a0,sp,24
    4c10:	ffffe097          	auipc	ra,0xffffe
    4c14:	7ec080e7          	jalr	2028(ra) # 33fc <fatfs_entry_lfn_exists>
    4c18:	0c050063          	beqz	a0,4cd8 <fatfs_list_directory_next+0x194>
    4c1c:	01810513          	addi	a0,sp,24
    4c20:	ffffe097          	auipc	ra,0xffffe
    4c24:	758080e7          	jalr	1880(ra) # 3378 <fatfs_lfn_cache_get>
    4c28:	00050593          	mv	a1,a0
    4c2c:	10300613          	li	a2,259
    4c30:	00098513          	mv	a0,s3
    4c34:	ffffe097          	auipc	ra,0xffffe
    4c38:	a54080e7          	jalr	-1452(ra) # 2688 <strncpy>
    4c3c:	00040513          	mv	a0,s0
    4c40:	fffff097          	auipc	ra,0xfffff
    4c44:	84c080e7          	jalr	-1972(ra) # 348c <fatfs_entry_is_dir>
    4c48:	10a98223          	sb	a0,260(s3)
    4c4c:	01d44783          	lbu	a5,29(s0)
    4c50:	01c44703          	lbu	a4,28(s0)
    4c54:	00148493          	addi	s1,s1,1
    4c58:	00879793          	slli	a5,a5,0x8
    4c5c:	00e7e7b3          	or	a5,a5,a4
    4c60:	01e44703          	lbu	a4,30(s0)
    4c64:	00100513          	li	a0,1
    4c68:	01071713          	slli	a4,a4,0x10
    4c6c:	00f76733          	or	a4,a4,a5
    4c70:	01f44783          	lbu	a5,31(s0)
    4c74:	01879793          	slli	a5,a5,0x18
    4c78:	00e7e7b3          	or	a5,a5,a4
    4c7c:	10f9a623          	sw	a5,268(s3)
    4c80:	01544783          	lbu	a5,21(s0)
    4c84:	01444703          	lbu	a4,20(s0)
    4c88:	01a44683          	lbu	a3,26(s0)
    4c8c:	00879793          	slli	a5,a5,0x8
    4c90:	00e7e7b3          	or	a5,a5,a4
    4c94:	01b44703          	lbu	a4,27(s0)
    4c98:	01079793          	slli	a5,a5,0x10
    4c9c:	00871713          	slli	a4,a4,0x8
    4ca0:	00d76733          	or	a4,a4,a3
    4ca4:	00e7e7b3          	or	a5,a5,a4
    4ca8:	10f9a423          	sw	a5,264(s3)
    4cac:	00990423          	sb	s1,8(s2)
    4cb0:	13c12083          	lw	ra,316(sp)
    4cb4:	13812403          	lw	s0,312(sp)
    4cb8:	13412483          	lw	s1,308(sp)
    4cbc:	13012903          	lw	s2,304(sp)
    4cc0:	12c12983          	lw	s3,300(sp)
    4cc4:	12812a03          	lw	s4,296(sp)
    4cc8:	12412a83          	lw	s5,292(sp)
    4ccc:	12012b03          	lw	s6,288(sp)
    4cd0:	14010113          	addi	sp,sp,320
    4cd4:	00008067          	ret
    4cd8:	00040513          	mv	a0,s0
    4cdc:	ffffe097          	auipc	ra,0xffffe
    4ce0:	770080e7          	jalr	1904(ra) # 344c <fatfs_entry_sfn_only>
    4ce4:	ee050ee3          	beqz	a0,4be0 <fatfs_list_directory_next+0x9c>
    4ce8:	00810a13          	addi	s4,sp,8
    4cec:	00d00613          	li	a2,13
    4cf0:	00000593          	li	a1,0
    4cf4:	000a0513          	mv	a0,s4
    4cf8:	10010ea3          	sb	zero,285(sp)
    4cfc:	ffffe097          	auipc	ra,0xffffe
    4d00:	8ec080e7          	jalr	-1812(ra) # 25e8 <memset>
    4d04:	00000793          	li	a5,0
    4d08:	00800713          	li	a4,8
    4d0c:	00f40633          	add	a2,s0,a5
    4d10:	00064603          	lbu	a2,0(a2)
    4d14:	00fa06b3          	add	a3,s4,a5
    4d18:	00178793          	addi	a5,a5,1
    4d1c:	00c68023          	sb	a2,0(a3)
    4d20:	fee796e3          	bne	a5,a4,4d0c <fatfs_list_directory_next+0x1c8>
    4d24:	00844783          	lbu	a5,8(s0)
    4d28:	00944703          	lbu	a4,9(s0)
    4d2c:	00a44683          	lbu	a3,10(s0)
    4d30:	00f108a3          	sb	a5,17(sp)
    4d34:	00e10923          	sb	a4,18(sp)
    4d38:	fe078793          	addi	a5,a5,-32
    4d3c:	fe070713          	addi	a4,a4,-32
    4d40:	00f037b3          	snez	a5,a5
    4d44:	00e03733          	snez	a4,a4
    4d48:	00d109a3          	sb	a3,19(sp)
    4d4c:	00e7e7b3          	or	a5,a5,a4
    4d50:	00079863          	bnez	a5,4d60 <fatfs_list_directory_next+0x21c>
    4d54:	fe068693          	addi	a3,a3,-32
    4d58:	02000793          	li	a5,32
    4d5c:	00068a63          	beqz	a3,4d70 <fatfs_list_directory_next+0x22c>
    4d60:	00814703          	lbu	a4,8(sp)
    4d64:	02e00793          	li	a5,46
    4d68:	00f71463          	bne	a4,a5,4d70 <fatfs_list_directory_next+0x22c>
    4d6c:	02000793          	li	a5,32
    4d70:	000a0593          	mv	a1,s4
    4d74:	00098513          	mv	a0,s3
    4d78:	00f10823          	sb	a5,16(sp)
    4d7c:	fffff097          	auipc	ra,0xfffff
    4d80:	054080e7          	jalr	84(ra) # 3dd0 <fatfs_get_sfn_display_name>
    4d84:	eb9ff06f          	j	4c3c <fatfs_list_directory_next+0xf8>

00004d88 <fl_readdir>:
    4d88:	000067b7          	lui	a5,0x6
    4d8c:	7347a783          	lw	a5,1844(a5) # 6734 <_filelib_init>
    4d90:	fd010113          	addi	sp,sp,-48
    4d94:	03212023          	sw	s2,32(sp)
    4d98:	01312e23          	sw	s3,28(sp)
    4d9c:	02112623          	sw	ra,44(sp)
    4da0:	02812423          	sw	s0,40(sp)
    4da4:	02912223          	sw	s1,36(sp)
    4da8:	00050913          	mv	s2,a0
    4dac:	00058993          	mv	s3,a1
    4db0:	00079663          	bnez	a5,4dbc <fl_readdir+0x34>
    4db4:	ffffe097          	auipc	ra,0xffffe
    4db8:	390080e7          	jalr	912(ra) # 3144 <fl_init>
    4dbc:	000084b7          	lui	s1,0x8
    4dc0:	35448413          	addi	s0,s1,852 # 8354 <_fs>
    4dc4:	03c42783          	lw	a5,60(s0)
    4dc8:	00078463          	beqz	a5,4dd0 <fl_readdir+0x48>
    4dcc:	000780e7          	jalr	a5
    4dd0:	00098613          	mv	a2,s3
    4dd4:	00090593          	mv	a1,s2
    4dd8:	35448513          	addi	a0,s1,852
    4ddc:	00000097          	auipc	ra,0x0
    4de0:	d68080e7          	jalr	-664(ra) # 4b44 <fatfs_list_directory_next>
    4de4:	04042783          	lw	a5,64(s0)
    4de8:	00078863          	beqz	a5,4df8 <fl_readdir+0x70>
    4dec:	00a12623          	sw	a0,12(sp)
    4df0:	000780e7          	jalr	a5
    4df4:	00c12503          	lw	a0,12(sp)
    4df8:	02c12083          	lw	ra,44(sp)
    4dfc:	02812403          	lw	s0,40(sp)
    4e00:	00154513          	xori	a0,a0,1
    4e04:	02412483          	lw	s1,36(sp)
    4e08:	02012903          	lw	s2,32(sp)
    4e0c:	01c12983          	lw	s3,28(sp)
    4e10:	40a00533          	neg	a0,a0
    4e14:	03010113          	addi	sp,sp,48
    4e18:	00008067          	ret

00004e1c <_read_sectors>:
    4e1c:	fd010113          	addi	sp,sp,-48
    4e20:	01512a23          	sw	s5,20(sp)
    4e24:	00008ab7          	lui	s5,0x8
    4e28:	01312e23          	sw	s3,28(sp)
    4e2c:	354ac983          	lbu	s3,852(s5) # 8354 <_fs>
    4e30:	01612823          	sw	s6,16(sp)
    4e34:	00058b13          	mv	s6,a1
    4e38:	02912223          	sw	s1,36(sp)
    4e3c:	00098593          	mv	a1,s3
    4e40:	00050493          	mv	s1,a0
    4e44:	000b0513          	mv	a0,s6
    4e48:	02112623          	sw	ra,44(sp)
    4e4c:	02812423          	sw	s0,40(sp)
    4e50:	01412c23          	sw	s4,24(sp)
    4e54:	00068413          	mv	s0,a3
    4e58:	01712623          	sw	s7,12(sp)
    4e5c:	01812423          	sw	s8,8(sp)
    4e60:	03212023          	sw	s2,32(sp)
    4e64:	00060c13          	mv	s8,a2
    4e68:	ffffd097          	auipc	ra,0xffffd
    4e6c:	6d4080e7          	jalr	1748(ra) # 253c <__udivsi3>
    4e70:	00050a13          	mv	s4,a0
    4e74:	00098593          	mv	a1,s3
    4e78:	000b0513          	mv	a0,s6
    4e7c:	ffffd097          	auipc	ra,0xffffd
    4e80:	708080e7          	jalr	1800(ra) # 2584 <__umodsi3>
    4e84:	00a407b3          	add	a5,s0,a0
    4e88:	00050b93          	mv	s7,a0
    4e8c:	00f9fe63          	bgeu	s3,a5,4ea8 <_read_sectors+0x8c>
    4e90:	000a0593          	mv	a1,s4
    4e94:	00098513          	mv	a0,s3
    4e98:	ffffe097          	auipc	ra,0xffffe
    4e9c:	e18080e7          	jalr	-488(ra) # 2cb0 <__mulsi3>
    4ea0:	416987b3          	sub	a5,s3,s6
    4ea4:	00f50433          	add	s0,a0,a5
    4ea8:	2284a903          	lw	s2,552(s1)
    4eac:	07491863          	bne	s2,s4,4f1c <_read_sectors+0x100>
    4eb0:	22c4a583          	lw	a1,556(s1)
    4eb4:	fff00793          	li	a5,-1
    4eb8:	02f58663          	beq	a1,a5,4ee4 <_read_sectors+0xc8>
    4ebc:	354a8513          	addi	a0,s5,852
    4ec0:	ffffe097          	auipc	ra,0xffffe
    4ec4:	154080e7          	jalr	340(ra) # 3014 <fatfs_lba_of_cluster>
    4ec8:	017505b3          	add	a1,a0,s7
    4ecc:	00040693          	mv	a3,s0
    4ed0:	000c0613          	mv	a2,s8
    4ed4:	354a8513          	addi	a0,s5,852
    4ed8:	ffffe097          	auipc	ra,0xffffe
    4edc:	188080e7          	jalr	392(ra) # 3060 <fatfs_sector_read>
    4ee0:	00051463          	bnez	a0,4ee8 <_read_sectors+0xcc>
    4ee4:	00000413          	li	s0,0
    4ee8:	02c12083          	lw	ra,44(sp)
    4eec:	00040513          	mv	a0,s0
    4ef0:	02812403          	lw	s0,40(sp)
    4ef4:	02412483          	lw	s1,36(sp)
    4ef8:	02012903          	lw	s2,32(sp)
    4efc:	01c12983          	lw	s3,28(sp)
    4f00:	01812a03          	lw	s4,24(sp)
    4f04:	01412a83          	lw	s5,20(sp)
    4f08:	01012b03          	lw	s6,16(sp)
    4f0c:	00c12b83          	lw	s7,12(sp)
    4f10:	00812c03          	lw	s8,8(sp)
    4f14:	03010113          	addi	sp,sp,48
    4f18:	00008067          	ret
    4f1c:	033b6463          	bltu	s6,s3,4f44 <_read_sectors+0x128>
    4f20:	00190793          	addi	a5,s2,1
    4f24:	03479063          	bne	a5,s4,4f44 <_read_sectors+0x128>
    4f28:	22c4a583          	lw	a1,556(s1)
    4f2c:	03496263          	bltu	s2,s4,4f50 <_read_sectors+0x134>
    4f30:	fff00793          	li	a5,-1
    4f34:	faf588e3          	beq	a1,a5,4ee4 <_read_sectors+0xc8>
    4f38:	22b4a623          	sw	a1,556(s1)
    4f3c:	2344a423          	sw	s4,552(s1)
    4f40:	f7dff06f          	j	4ebc <_read_sectors+0xa0>
    4f44:	0044a583          	lw	a1,4(s1)
    4f48:	00000913          	li	s2,0
    4f4c:	fe1ff06f          	j	4f2c <_read_sectors+0x110>
    4f50:	354a8513          	addi	a0,s5,852
    4f54:	fffff097          	auipc	ra,0xfffff
    4f58:	230080e7          	jalr	560(ra) # 4184 <fatfs_find_next_cluster>
    4f5c:	00050593          	mv	a1,a0
    4f60:	00190913          	addi	s2,s2,1
    4f64:	fc9ff06f          	j	4f2c <_read_sectors+0x110>

00004f68 <fatfs_set_fs_info_next_free_cluster>:
    4f68:	03052783          	lw	a5,48(a0)
    4f6c:	0a078463          	beqz	a5,5014 <fatfs_set_fs_info_next_free_cluster+0xac>
    4f70:	fe010113          	addi	sp,sp,-32
    4f74:	01c52783          	lw	a5,28(a0)
    4f78:	00912a23          	sw	s1,20(sp)
    4f7c:	00058493          	mv	s1,a1
    4f80:	01855583          	lhu	a1,24(a0)
    4f84:	00812c23          	sw	s0,24(sp)
    4f88:	00112e23          	sw	ra,28(sp)
    4f8c:	00f585b3          	add	a1,a1,a5
    4f90:	00050413          	mv	s0,a0
    4f94:	ffffe097          	auipc	ra,0xffffe
    4f98:	ed4080e7          	jalr	-300(ra) # 2e68 <fatfs_fat_read_sector>
    4f9c:	00050593          	mv	a1,a0
    4fa0:	06050063          	beqz	a0,5000 <fatfs_set_fs_info_next_free_cluster+0x98>
    4fa4:	20852783          	lw	a5,520(a0)
    4fa8:	0084d713          	srli	a4,s1,0x8
    4fac:	00100613          	li	a2,1
    4fb0:	1e978623          	sb	s1,492(a5)
    4fb4:	20852783          	lw	a5,520(a0)
    4fb8:	1ee786a3          	sb	a4,493(a5)
    4fbc:	20852783          	lw	a5,520(a0)
    4fc0:	0104d713          	srli	a4,s1,0x10
    4fc4:	1ee78723          	sb	a4,494(a5)
    4fc8:	20852783          	lw	a5,520(a0)
    4fcc:	0184d713          	srli	a4,s1,0x18
    4fd0:	1ee787a3          	sb	a4,495(a5)
    4fd4:	03842783          	lw	a5,56(s0)
    4fd8:	20c52223          	sw	a2,516(a0)
    4fdc:	02942223          	sw	s1,36(s0)
    4fe0:	00078a63          	beqz	a5,4ff4 <fatfs_set_fs_info_next_free_cluster+0x8c>
    4fe4:	20052503          	lw	a0,512(a0)
    4fe8:	00b12623          	sw	a1,12(sp)
    4fec:	000780e7          	jalr	a5
    4ff0:	00c12583          	lw	a1,12(sp)
    4ff4:	fff00793          	li	a5,-1
    4ff8:	20f5a023          	sw	a5,512(a1)
    4ffc:	2005a223          	sw	zero,516(a1)
    5000:	01c12083          	lw	ra,28(sp)
    5004:	01812403          	lw	s0,24(sp)
    5008:	01412483          	lw	s1,20(sp)
    500c:	02010113          	addi	sp,sp,32
    5010:	00008067          	ret
    5014:	00008067          	ret

00005018 <fatfs_find_blank_cluster>:
    5018:	fd010113          	addi	sp,sp,-48
    501c:	01312e23          	sw	s3,28(sp)
    5020:	100009b7          	lui	s3,0x10000
    5024:	02912223          	sw	s1,36(sp)
    5028:	03212023          	sw	s2,32(sp)
    502c:	02112623          	sw	ra,44(sp)
    5030:	02812423          	sw	s0,40(sp)
    5034:	00050913          	mv	s2,a0
    5038:	00058493          	mv	s1,a1
    503c:	fff98993          	addi	s3,s3,-1 # fffffff <__stacktop+0xffeffff>
    5040:	03092783          	lw	a5,48(s2)
    5044:	0074d413          	srli	s0,s1,0x7
    5048:	00079463          	bnez	a5,5050 <fatfs_find_blank_cluster+0x38>
    504c:	0084d413          	srli	s0,s1,0x8
    5050:	02092783          	lw	a5,32(s2)
    5054:	0cf47863          	bgeu	s0,a5,5124 <fatfs_find_blank_cluster+0x10c>
    5058:	01492583          	lw	a1,20(s2)
    505c:	00090513          	mv	a0,s2
    5060:	00c12623          	sw	a2,12(sp)
    5064:	00b405b3          	add	a1,s0,a1
    5068:	ffffe097          	auipc	ra,0xffffe
    506c:	e00080e7          	jalr	-512(ra) # 2e68 <fatfs_fat_read_sector>
    5070:	0a050a63          	beqz	a0,5124 <fatfs_find_blank_cluster+0x10c>
    5074:	03092783          	lw	a5,48(s2)
    5078:	20852703          	lw	a4,520(a0)
    507c:	00c12603          	lw	a2,12(sp)
    5080:	04079a63          	bnez	a5,50d4 <fatfs_find_blank_cluster+0xbc>
    5084:	00841413          	slli	s0,s0,0x8
    5088:	40848433          	sub	s0,s1,s0
    508c:	00141413          	slli	s0,s0,0x1
    5090:	01041413          	slli	s0,s0,0x10
    5094:	01045413          	srli	s0,s0,0x10
    5098:	00870733          	add	a4,a4,s0
    509c:	00174783          	lbu	a5,1(a4)
    50a0:	00074703          	lbu	a4,0(a4)
    50a4:	00879793          	slli	a5,a5,0x8
    50a8:	00e787b3          	add	a5,a5,a4
    50ac:	06079863          	bnez	a5,511c <fatfs_find_blank_cluster+0x104>
    50b0:	00962023          	sw	s1,0(a2)
    50b4:	00100513          	li	a0,1
    50b8:	02c12083          	lw	ra,44(sp)
    50bc:	02812403          	lw	s0,40(sp)
    50c0:	02412483          	lw	s1,36(sp)
    50c4:	02012903          	lw	s2,32(sp)
    50c8:	01c12983          	lw	s3,28(sp)
    50cc:	03010113          	addi	sp,sp,48
    50d0:	00008067          	ret
    50d4:	00741413          	slli	s0,s0,0x7
    50d8:	40848433          	sub	s0,s1,s0
    50dc:	00241413          	slli	s0,s0,0x2
    50e0:	01041413          	slli	s0,s0,0x10
    50e4:	01045413          	srli	s0,s0,0x10
    50e8:	00870733          	add	a4,a4,s0
    50ec:	00374783          	lbu	a5,3(a4)
    50f0:	00274683          	lbu	a3,2(a4)
    50f4:	01879793          	slli	a5,a5,0x18
    50f8:	01069693          	slli	a3,a3,0x10
    50fc:	00d787b3          	add	a5,a5,a3
    5100:	00074683          	lbu	a3,0(a4)
    5104:	00174703          	lbu	a4,1(a4)
    5108:	00d787b3          	add	a5,a5,a3
    510c:	00871713          	slli	a4,a4,0x8
    5110:	00e787b3          	add	a5,a5,a4
    5114:	0137f7b3          	and	a5,a5,s3
    5118:	f95ff06f          	j	50ac <fatfs_find_blank_cluster+0x94>
    511c:	00148493          	addi	s1,s1,1
    5120:	f21ff06f          	j	5040 <fatfs_find_blank_cluster+0x28>
    5124:	00000513          	li	a0,0
    5128:	f91ff06f          	j	50b8 <fatfs_find_blank_cluster+0xa0>

0000512c <fatfs_fat_set_cluster>:
    512c:	03052783          	lw	a5,48(a0)
    5130:	fe010113          	addi	sp,sp,-32
    5134:	00812c23          	sw	s0,24(sp)
    5138:	00912a23          	sw	s1,20(sp)
    513c:	01212823          	sw	s2,16(sp)
    5140:	00112e23          	sw	ra,28(sp)
    5144:	00050913          	mv	s2,a0
    5148:	00058413          	mv	s0,a1
    514c:	0085d493          	srli	s1,a1,0x8
    5150:	00078463          	beqz	a5,5158 <fatfs_fat_set_cluster+0x2c>
    5154:	0075d493          	srli	s1,a1,0x7
    5158:	01492583          	lw	a1,20(s2)
    515c:	00090513          	mv	a0,s2
    5160:	00c12623          	sw	a2,12(sp)
    5164:	00b485b3          	add	a1,s1,a1
    5168:	ffffe097          	auipc	ra,0xffffe
    516c:	d00080e7          	jalr	-768(ra) # 2e68 <fatfs_fat_read_sector>
    5170:	00050793          	mv	a5,a0
    5174:	00000513          	li	a0,0
    5178:	04078663          	beqz	a5,51c4 <fatfs_fat_set_cluster+0x98>
    517c:	03092683          	lw	a3,48(s2)
    5180:	2087a703          	lw	a4,520(a5)
    5184:	00c12603          	lw	a2,12(sp)
    5188:	04069a63          	bnez	a3,51dc <fatfs_fat_set_cluster+0xb0>
    518c:	00849493          	slli	s1,s1,0x8
    5190:	40940433          	sub	s0,s0,s1
    5194:	00141413          	slli	s0,s0,0x1
    5198:	01041413          	slli	s0,s0,0x10
    519c:	01045413          	srli	s0,s0,0x10
    51a0:	00870733          	add	a4,a4,s0
    51a4:	00c70023          	sb	a2,0(a4)
    51a8:	2087a703          	lw	a4,520(a5)
    51ac:	00865613          	srli	a2,a2,0x8
    51b0:	00870733          	add	a4,a4,s0
    51b4:	00c700a3          	sb	a2,1(a4)
    51b8:	00100713          	li	a4,1
    51bc:	20e7a223          	sw	a4,516(a5)
    51c0:	00100513          	li	a0,1
    51c4:	01c12083          	lw	ra,28(sp)
    51c8:	01812403          	lw	s0,24(sp)
    51cc:	01412483          	lw	s1,20(sp)
    51d0:	01012903          	lw	s2,16(sp)
    51d4:	02010113          	addi	sp,sp,32
    51d8:	00008067          	ret
    51dc:	00749493          	slli	s1,s1,0x7
    51e0:	40940433          	sub	s0,s0,s1
    51e4:	00241413          	slli	s0,s0,0x2
    51e8:	01041413          	slli	s0,s0,0x10
    51ec:	01045413          	srli	s0,s0,0x10
    51f0:	00870733          	add	a4,a4,s0
    51f4:	00c70023          	sb	a2,0(a4)
    51f8:	2087a703          	lw	a4,520(a5)
    51fc:	00865693          	srli	a3,a2,0x8
    5200:	00870733          	add	a4,a4,s0
    5204:	00d700a3          	sb	a3,1(a4)
    5208:	2087a703          	lw	a4,520(a5)
    520c:	01065693          	srli	a3,a2,0x10
    5210:	01865613          	srli	a2,a2,0x18
    5214:	00870733          	add	a4,a4,s0
    5218:	00d70123          	sb	a3,2(a4)
    521c:	2087a703          	lw	a4,520(a5)
    5220:	00870733          	add	a4,a4,s0
    5224:	00c701a3          	sb	a2,3(a4)
    5228:	f91ff06f          	j	51b8 <fatfs_fat_set_cluster+0x8c>

0000522c <fatfs_free_cluster_chain>:
    522c:	fe010113          	addi	sp,sp,-32
    5230:	00812c23          	sw	s0,24(sp)
    5234:	00912a23          	sw	s1,20(sp)
    5238:	00112e23          	sw	ra,28(sp)
    523c:	01212823          	sw	s2,16(sp)
    5240:	00050493          	mv	s1,a0
    5244:	ffd00413          	li	s0,-3
    5248:	fff58793          	addi	a5,a1,-1
    524c:	02f47063          	bgeu	s0,a5,526c <fatfs_free_cluster_chain+0x40>
    5250:	01c12083          	lw	ra,28(sp)
    5254:	01812403          	lw	s0,24(sp)
    5258:	01412483          	lw	s1,20(sp)
    525c:	01012903          	lw	s2,16(sp)
    5260:	00100513          	li	a0,1
    5264:	02010113          	addi	sp,sp,32
    5268:	00008067          	ret
    526c:	00048513          	mv	a0,s1
    5270:	00b12623          	sw	a1,12(sp)
    5274:	fffff097          	auipc	ra,0xfffff
    5278:	f10080e7          	jalr	-240(ra) # 4184 <fatfs_find_next_cluster>
    527c:	00c12583          	lw	a1,12(sp)
    5280:	00050913          	mv	s2,a0
    5284:	00000613          	li	a2,0
    5288:	00048513          	mv	a0,s1
    528c:	00000097          	auipc	ra,0x0
    5290:	ea0080e7          	jalr	-352(ra) # 512c <fatfs_fat_set_cluster>
    5294:	00090593          	mv	a1,s2
    5298:	fb1ff06f          	j	5248 <fatfs_free_cluster_chain+0x1c>

0000529c <fatfs_fat_add_cluster_to_chain>:
    529c:	fd010113          	addi	sp,sp,-48
    52a0:	02912223          	sw	s1,36(sp)
    52a4:	02112623          	sw	ra,44(sp)
    52a8:	02812423          	sw	s0,40(sp)
    52ac:	03212023          	sw	s2,32(sp)
    52b0:	01312e23          	sw	s3,28(sp)
    52b4:	fff00493          	li	s1,-1
    52b8:	02959263          	bne	a1,s1,52dc <fatfs_fat_add_cluster_to_chain+0x40>
    52bc:	00000513          	li	a0,0
    52c0:	02c12083          	lw	ra,44(sp)
    52c4:	02812403          	lw	s0,40(sp)
    52c8:	02412483          	lw	s1,36(sp)
    52cc:	02012903          	lw	s2,32(sp)
    52d0:	01c12983          	lw	s3,28(sp)
    52d4:	03010113          	addi	sp,sp,48
    52d8:	00008067          	ret
    52dc:	00050913          	mv	s2,a0
    52e0:	00058413          	mv	s0,a1
    52e4:	00060993          	mv	s3,a2
    52e8:	00040593          	mv	a1,s0
    52ec:	00090513          	mv	a0,s2
    52f0:	00812623          	sw	s0,12(sp)
    52f4:	fffff097          	auipc	ra,0xfffff
    52f8:	e90080e7          	jalr	-368(ra) # 4184 <fatfs_find_next_cluster>
    52fc:	00050413          	mv	s0,a0
    5300:	fa050ee3          	beqz	a0,52bc <fatfs_fat_add_cluster_to_chain+0x20>
    5304:	00c12583          	lw	a1,12(sp)
    5308:	fe9510e3          	bne	a0,s1,52e8 <fatfs_fat_add_cluster_to_chain+0x4c>
    530c:	00098613          	mv	a2,s3
    5310:	00090513          	mv	a0,s2
    5314:	00000097          	auipc	ra,0x0
    5318:	e18080e7          	jalr	-488(ra) # 512c <fatfs_fat_set_cluster>
    531c:	00040613          	mv	a2,s0
    5320:	00098593          	mv	a1,s3
    5324:	00090513          	mv	a0,s2
    5328:	00000097          	auipc	ra,0x0
    532c:	e04080e7          	jalr	-508(ra) # 512c <fatfs_fat_set_cluster>
    5330:	00100513          	li	a0,1
    5334:	f8dff06f          	j	52c0 <fatfs_fat_add_cluster_to_chain+0x24>

00005338 <fatfs_add_free_space>:
    5338:	02452783          	lw	a5,36(a0)
    533c:	fd010113          	addi	sp,sp,-48
    5340:	02812423          	sw	s0,40(sp)
    5344:	01312e23          	sw	s3,28(sp)
    5348:	01412c23          	sw	s4,24(sp)
    534c:	0005a983          	lw	s3,0(a1)
    5350:	01512a23          	sw	s5,20(sp)
    5354:	00058a13          	mv	s4,a1
    5358:	02112623          	sw	ra,44(sp)
    535c:	02912223          	sw	s1,36(sp)
    5360:	03212023          	sw	s2,32(sp)
    5364:	fff00593          	li	a1,-1
    5368:	00050413          	mv	s0,a0
    536c:	00060a93          	mv	s5,a2
    5370:	00b78663          	beq	a5,a1,537c <fatfs_add_free_space+0x44>
    5374:	00000097          	auipc	ra,0x0
    5378:	bf4080e7          	jalr	-1036(ra) # 4f68 <fatfs_set_fs_info_next_free_cluster>
    537c:	00000493          	li	s1,0
    5380:	03549663          	bne	s1,s5,53ac <fatfs_add_free_space+0x74>
    5384:	00100513          	li	a0,1
    5388:	02c12083          	lw	ra,44(sp)
    538c:	02812403          	lw	s0,40(sp)
    5390:	02412483          	lw	s1,36(sp)
    5394:	02012903          	lw	s2,32(sp)
    5398:	01c12983          	lw	s3,28(sp)
    539c:	01812a03          	lw	s4,24(sp)
    53a0:	01412a83          	lw	s5,20(sp)
    53a4:	03010113          	addi	sp,sp,48
    53a8:	00008067          	ret
    53ac:	00842583          	lw	a1,8(s0)
    53b0:	00c10613          	addi	a2,sp,12
    53b4:	00040513          	mv	a0,s0
    53b8:	00000097          	auipc	ra,0x0
    53bc:	c60080e7          	jalr	-928(ra) # 5018 <fatfs_find_blank_cluster>
    53c0:	fc0504e3          	beqz	a0,5388 <fatfs_add_free_space+0x50>
    53c4:	00c12903          	lw	s2,12(sp)
    53c8:	00098593          	mv	a1,s3
    53cc:	00040513          	mv	a0,s0
    53d0:	00090613          	mv	a2,s2
    53d4:	00000097          	auipc	ra,0x0
    53d8:	d58080e7          	jalr	-680(ra) # 512c <fatfs_fat_set_cluster>
    53dc:	fff00613          	li	a2,-1
    53e0:	00090593          	mv	a1,s2
    53e4:	00040513          	mv	a0,s0
    53e8:	00000097          	auipc	ra,0x0
    53ec:	d44080e7          	jalr	-700(ra) # 512c <fatfs_fat_set_cluster>
    53f0:	00049463          	bnez	s1,53f8 <fatfs_add_free_space+0xc0>
    53f4:	012a2023          	sw	s2,0(s4)
    53f8:	00148493          	addi	s1,s1,1
    53fc:	00090993          	mv	s3,s2
    5400:	f81ff06f          	j	5380 <fatfs_add_free_space+0x48>

00005404 <_write_sectors>:
    5404:	fb010113          	addi	sp,sp,-80
    5408:	03512a23          	sw	s5,52(sp)
    540c:	00008ab7          	lui	s5,0x8
    5410:	04112623          	sw	ra,76(sp)
    5414:	04812423          	sw	s0,72(sp)
    5418:	04912223          	sw	s1,68(sp)
    541c:	03412c23          	sw	s4,56(sp)
    5420:	03612823          	sw	s6,48(sp)
    5424:	03712623          	sw	s7,44(sp)
    5428:	03812423          	sw	s8,40(sp)
    542c:	03912223          	sw	s9,36(sp)
    5430:	03a12023          	sw	s10,32(sp)
    5434:	05212023          	sw	s2,64(sp)
    5438:	03312e23          	sw	s3,60(sp)
    543c:	354a8b93          	addi	s7,s5,852 # 8354 <_fs>
    5440:	000bc983          	lbu	s3,0(s7)
    5444:	00058b13          	mv	s6,a1
    5448:	fff00793          	li	a5,-1
    544c:	00098593          	mv	a1,s3
    5450:	00050493          	mv	s1,a0
    5454:	000b0513          	mv	a0,s6
    5458:	00068c13          	mv	s8,a3
    545c:	00f12e23          	sw	a5,28(sp)
    5460:	00060d13          	mv	s10,a2
    5464:	ffffd097          	auipc	ra,0xffffd
    5468:	0d8080e7          	jalr	216(ra) # 253c <__udivsi3>
    546c:	00050a13          	mv	s4,a0
    5470:	00098593          	mv	a1,s3
    5474:	000b0513          	mv	a0,s6
    5478:	ffffd097          	auipc	ra,0xffffd
    547c:	10c080e7          	jalr	268(ra) # 2584 <__umodsi3>
    5480:	00ac07b3          	add	a5,s8,a0
    5484:	00050c93          	mv	s9,a0
    5488:	000c0413          	mv	s0,s8
    548c:	00f9fe63          	bgeu	s3,a5,54a8 <_write_sectors+0xa4>
    5490:	000a0593          	mv	a1,s4
    5494:	00098513          	mv	a0,s3
    5498:	ffffe097          	auipc	ra,0xffffe
    549c:	818080e7          	jalr	-2024(ra) # 2cb0 <__mulsi3>
    54a0:	416987b3          	sub	a5,s3,s6
    54a4:	00f50433          	add	s0,a0,a5
    54a8:	2284a903          	lw	s2,552(s1)
    54ac:	03491a63          	bne	s2,s4,54e0 <_write_sectors+0xdc>
    54b0:	22c4a583          	lw	a1,556(s1)
    54b4:	354a8513          	addi	a0,s5,852
    54b8:	ffffe097          	auipc	ra,0xffffe
    54bc:	b5c080e7          	jalr	-1188(ra) # 3014 <fatfs_lba_of_cluster>
    54c0:	019505b3          	add	a1,a0,s9
    54c4:	00040693          	mv	a3,s0
    54c8:	000d0613          	mv	a2,s10
    54cc:	354a8513          	addi	a0,s5,852
    54d0:	ffffe097          	auipc	ra,0xffffe
    54d4:	ba8080e7          	jalr	-1112(ra) # 3078 <fatfs_sector_write>
    54d8:	04050a63          	beqz	a0,552c <_write_sectors+0x128>
    54dc:	0540006f          	j	5530 <_write_sectors+0x12c>
    54e0:	093b6663          	bltu	s6,s3,556c <_write_sectors+0x168>
    54e4:	00190793          	addi	a5,s2,1
    54e8:	09479263          	bne	a5,s4,556c <_write_sectors+0x168>
    54ec:	22c4a583          	lw	a1,556(s1)
    54f0:	fff00b13          	li	s6,-1
    54f4:	09496263          	bltu	s2,s4,5578 <_write_sectors+0x174>
    54f8:	fff00793          	li	a5,-1
    54fc:	0af59463          	bne	a1,a5,55a4 <_write_sectors+0x1a0>
    5500:	000bc583          	lbu	a1,0(s7)
    5504:	fff58513          	addi	a0,a1,-1
    5508:	01850533          	add	a0,a0,s8
    550c:	ffffd097          	auipc	ra,0xffffd
    5510:	030080e7          	jalr	48(ra) # 253c <__udivsi3>
    5514:	00050613          	mv	a2,a0
    5518:	01c10593          	addi	a1,sp,28
    551c:	000b8513          	mv	a0,s7
    5520:	00000097          	auipc	ra,0x0
    5524:	e18080e7          	jalr	-488(ra) # 5338 <fatfs_add_free_space>
    5528:	06051c63          	bnez	a0,55a0 <_write_sectors+0x19c>
    552c:	00000413          	li	s0,0
    5530:	04c12083          	lw	ra,76(sp)
    5534:	00040513          	mv	a0,s0
    5538:	04812403          	lw	s0,72(sp)
    553c:	04412483          	lw	s1,68(sp)
    5540:	04012903          	lw	s2,64(sp)
    5544:	03c12983          	lw	s3,60(sp)
    5548:	03812a03          	lw	s4,56(sp)
    554c:	03412a83          	lw	s5,52(sp)
    5550:	03012b03          	lw	s6,48(sp)
    5554:	02c12b83          	lw	s7,44(sp)
    5558:	02812c03          	lw	s8,40(sp)
    555c:	02412c83          	lw	s9,36(sp)
    5560:	02012d03          	lw	s10,32(sp)
    5564:	05010113          	addi	sp,sp,80
    5568:	00008067          	ret
    556c:	0044a583          	lw	a1,4(s1)
    5570:	00000913          	li	s2,0
    5574:	f7dff06f          	j	54f0 <_write_sectors+0xec>
    5578:	354a8513          	addi	a0,s5,852
    557c:	00b12623          	sw	a1,12(sp)
    5580:	fffff097          	auipc	ra,0xfffff
    5584:	c04080e7          	jalr	-1020(ra) # 4184 <fatfs_find_next_cluster>
    5588:	00c12583          	lw	a1,12(sp)
    558c:	00b12e23          	sw	a1,28(sp)
    5590:	f76508e3          	beq	a0,s6,5500 <_write_sectors+0xfc>
    5594:	00190913          	addi	s2,s2,1
    5598:	00050593          	mv	a1,a0
    559c:	f59ff06f          	j	54f4 <_write_sectors+0xf0>
    55a0:	01c12583          	lw	a1,28(sp)
    55a4:	22b4a623          	sw	a1,556(s1)
    55a8:	2344a423          	sw	s4,552(s1)
    55ac:	f09ff06f          	j	54b4 <_write_sectors+0xb0>

000055b0 <fl_fflush>:
    55b0:	000067b7          	lui	a5,0x6
    55b4:	7347a783          	lw	a5,1844(a5) # 6734 <_filelib_init>
    55b8:	ff010113          	addi	sp,sp,-16
    55bc:	00812423          	sw	s0,8(sp)
    55c0:	00112623          	sw	ra,12(sp)
    55c4:	00912223          	sw	s1,4(sp)
    55c8:	00050413          	mv	s0,a0
    55cc:	00079663          	bnez	a5,55d8 <fl_fflush+0x28>
    55d0:	ffffe097          	auipc	ra,0xffffe
    55d4:	b74080e7          	jalr	-1164(ra) # 3144 <fl_init>
    55d8:	04040663          	beqz	s0,5624 <fl_fflush+0x74>
    55dc:	000084b7          	lui	s1,0x8
    55e0:	35448493          	addi	s1,s1,852 # 8354 <_fs>
    55e4:	03c4a783          	lw	a5,60(s1)
    55e8:	00078463          	beqz	a5,55f0 <fl_fflush+0x40>
    55ec:	000780e7          	jalr	a5
    55f0:	43442783          	lw	a5,1076(s0)
    55f4:	02078263          	beqz	a5,5618 <fl_fflush+0x68>
    55f8:	43042583          	lw	a1,1072(s0)
    55fc:	00100693          	li	a3,1
    5600:	23040613          	addi	a2,s0,560
    5604:	00040513          	mv	a0,s0
    5608:	00000097          	auipc	ra,0x0
    560c:	dfc080e7          	jalr	-516(ra) # 5404 <_write_sectors>
    5610:	00050463          	beqz	a0,5618 <fl_fflush+0x68>
    5614:	42042a23          	sw	zero,1076(s0)
    5618:	0404a783          	lw	a5,64(s1)
    561c:	00078463          	beqz	a5,5624 <fl_fflush+0x74>
    5620:	000780e7          	jalr	a5
    5624:	00c12083          	lw	ra,12(sp)
    5628:	00812403          	lw	s0,8(sp)
    562c:	00412483          	lw	s1,4(sp)
    5630:	00000513          	li	a0,0
    5634:	01010113          	addi	sp,sp,16
    5638:	00008067          	ret

0000563c <fl_fclose>:
    563c:	000067b7          	lui	a5,0x6
    5640:	7347a783          	lw	a5,1844(a5) # 6734 <_filelib_init>
    5644:	ff010113          	addi	sp,sp,-16
    5648:	00812423          	sw	s0,8(sp)
    564c:	00112623          	sw	ra,12(sp)
    5650:	00912223          	sw	s1,4(sp)
    5654:	01212023          	sw	s2,0(sp)
    5658:	00050413          	mv	s0,a0
    565c:	00079663          	bnez	a5,5668 <fl_fclose+0x2c>
    5660:	ffffe097          	auipc	ra,0xffffe
    5664:	ae4080e7          	jalr	-1308(ra) # 3144 <fl_init>
    5668:	08040c63          	beqz	s0,5700 <fl_fclose+0xc4>
    566c:	000084b7          	lui	s1,0x8
    5670:	35448913          	addi	s2,s1,852 # 8354 <_fs>
    5674:	03c92783          	lw	a5,60(s2)
    5678:	00078463          	beqz	a5,5680 <fl_fclose+0x44>
    567c:	000780e7          	jalr	a5
    5680:	00040513          	mv	a0,s0
    5684:	00000097          	auipc	ra,0x0
    5688:	f2c080e7          	jalr	-212(ra) # 55b0 <fl_fflush>
    568c:	01042783          	lw	a5,16(s0)
    5690:	00078e63          	beqz	a5,56ac <fl_fclose+0x70>
    5694:	00c42683          	lw	a3,12(s0)
    5698:	00042583          	lw	a1,0(s0)
    569c:	21c40613          	addi	a2,s0,540
    56a0:	35448513          	addi	a0,s1,852
    56a4:	fffff097          	auipc	ra,0xfffff
    56a8:	338080e7          	jalr	824(ra) # 49dc <fatfs_update_file_length>
    56ac:	fff00793          	li	a5,-1
    56b0:	42f42823          	sw	a5,1072(s0)
    56b4:	00040513          	mv	a0,s0
    56b8:	00042423          	sw	zero,8(s0)
    56bc:	00042623          	sw	zero,12(s0)
    56c0:	00042223          	sw	zero,4(s0)
    56c4:	42042a23          	sw	zero,1076(s0)
    56c8:	00042823          	sw	zero,16(s0)
    56cc:	ffffe097          	auipc	ra,0xffffe
    56d0:	900080e7          	jalr	-1792(ra) # 2fcc <_free_file>
    56d4:	35448513          	addi	a0,s1,852
    56d8:	fffff097          	auipc	ra,0xfffff
    56dc:	a54080e7          	jalr	-1452(ra) # 412c <fatfs_fat_purge>
    56e0:	04092783          	lw	a5,64(s2)
    56e4:	00078e63          	beqz	a5,5700 <fl_fclose+0xc4>
    56e8:	00812403          	lw	s0,8(sp)
    56ec:	00c12083          	lw	ra,12(sp)
    56f0:	00412483          	lw	s1,4(sp)
    56f4:	00012903          	lw	s2,0(sp)
    56f8:	01010113          	addi	sp,sp,16
    56fc:	00078067          	jr	a5
    5700:	00c12083          	lw	ra,12(sp)
    5704:	00812403          	lw	s0,8(sp)
    5708:	00412483          	lw	s1,4(sp)
    570c:	00012903          	lw	s2,0(sp)
    5710:	01010113          	addi	sp,sp,16
    5714:	00008067          	ret

00005718 <fl_fread>:
    5718:	000067b7          	lui	a5,0x6
    571c:	7347a783          	lw	a5,1844(a5) # 6734 <_filelib_init>
    5720:	fc010113          	addi	sp,sp,-64
    5724:	02812c23          	sw	s0,56(sp)
    5728:	03512223          	sw	s5,36(sp)
    572c:	02112e23          	sw	ra,60(sp)
    5730:	02912a23          	sw	s1,52(sp)
    5734:	03212823          	sw	s2,48(sp)
    5738:	03312623          	sw	s3,44(sp)
    573c:	03412423          	sw	s4,40(sp)
    5740:	03612023          	sw	s6,32(sp)
    5744:	01712e23          	sw	s7,28(sp)
    5748:	01812c23          	sw	s8,24(sp)
    574c:	01912a23          	sw	s9,20(sp)
    5750:	00050a93          	mv	s5,a0
    5754:	00068413          	mv	s0,a3
    5758:	00058513          	mv	a0,a1
    575c:	00079e63          	bnez	a5,5778 <fl_fread+0x60>
    5760:	00c12623          	sw	a2,12(sp)
    5764:	00b12423          	sw	a1,8(sp)
    5768:	ffffe097          	auipc	ra,0xffffe
    576c:	9dc080e7          	jalr	-1572(ra) # 3144 <fl_init>
    5770:	00c12603          	lw	a2,12(sp)
    5774:	00812503          	lw	a0,8(sp)
    5778:	14040e63          	beqz	s0,58d4 <fl_fread+0x1bc>
    577c:	140a8c63          	beqz	s5,58d4 <fl_fread+0x1bc>
    5780:	43844783          	lbu	a5,1080(s0)
    5784:	fff00493          	li	s1,-1
    5788:	0017f793          	andi	a5,a5,1
    578c:	04078863          	beqz	a5,57dc <fl_fread+0xc4>
    5790:	00060593          	mv	a1,a2
    5794:	ffffd097          	auipc	ra,0xffffd
    5798:	51c080e7          	jalr	1308(ra) # 2cb0 <__mulsi3>
    579c:	00050493          	mv	s1,a0
    57a0:	02050e63          	beqz	a0,57dc <fl_fread+0xc4>
    57a4:	00842583          	lw	a1,8(s0)
    57a8:	00c42783          	lw	a5,12(s0)
    57ac:	12f5f463          	bgeu	a1,a5,58d4 <fl_fread+0x1bc>
    57b0:	00b50733          	add	a4,a0,a1
    57b4:	00e7f463          	bgeu	a5,a4,57bc <fl_fread+0xa4>
    57b8:	40b784b3          	sub	s1,a5,a1
    57bc:	0095da13          	srli	s4,a1,0x9
    57c0:	1ff5f913          	andi	s2,a1,511
    57c4:	00000993          	li	s3,0
    57c8:	23040b13          	addi	s6,s0,560
    57cc:	20000b93          	li	s7,512
    57d0:	1ff00c13          	li	s8,511
    57d4:	0499c063          	blt	s3,s1,5814 <fl_fread+0xfc>
    57d8:	00098493          	mv	s1,s3
    57dc:	03c12083          	lw	ra,60(sp)
    57e0:	03812403          	lw	s0,56(sp)
    57e4:	03012903          	lw	s2,48(sp)
    57e8:	02c12983          	lw	s3,44(sp)
    57ec:	02812a03          	lw	s4,40(sp)
    57f0:	02412a83          	lw	s5,36(sp)
    57f4:	02012b03          	lw	s6,32(sp)
    57f8:	01c12b83          	lw	s7,28(sp)
    57fc:	01812c03          	lw	s8,24(sp)
    5800:	01412c83          	lw	s9,20(sp)
    5804:	00048513          	mv	a0,s1
    5808:	03412483          	lw	s1,52(sp)
    580c:	04010113          	addi	sp,sp,64
    5810:	00008067          	ret
    5814:	04091663          	bnez	s2,5860 <fl_fread+0x148>
    5818:	413486b3          	sub	a3,s1,s3
    581c:	04dc5263          	bge	s8,a3,5860 <fl_fread+0x148>
    5820:	4096d693          	srai	a3,a3,0x9
    5824:	013a8633          	add	a2,s5,s3
    5828:	000a0593          	mv	a1,s4
    582c:	00040513          	mv	a0,s0
    5830:	fffff097          	auipc	ra,0xfffff
    5834:	5ec080e7          	jalr	1516(ra) # 4e1c <_read_sectors>
    5838:	fa0500e3          	beqz	a0,57d8 <fl_fread+0xc0>
    583c:	00951c93          	slli	s9,a0,0x9
    5840:	000c8613          	mv	a2,s9
    5844:	00aa0a33          	add	s4,s4,a0
    5848:	00842783          	lw	a5,8(s0)
    584c:	00c989b3          	add	s3,s3,a2
    5850:	00000913          	li	s2,0
    5854:	019787b3          	add	a5,a5,s9
    5858:	00f42423          	sw	a5,8(s0)
    585c:	f79ff06f          	j	57d4 <fl_fread+0xbc>
    5860:	43042783          	lw	a5,1072(s0)
    5864:	03478e63          	beq	a5,s4,58a0 <fl_fread+0x188>
    5868:	43442783          	lw	a5,1076(s0)
    586c:	00078863          	beqz	a5,587c <fl_fread+0x164>
    5870:	00040513          	mv	a0,s0
    5874:	00000097          	auipc	ra,0x0
    5878:	d3c080e7          	jalr	-708(ra) # 55b0 <fl_fflush>
    587c:	00100693          	li	a3,1
    5880:	000b0613          	mv	a2,s6
    5884:	000a0593          	mv	a1,s4
    5888:	00040513          	mv	a0,s0
    588c:	fffff097          	auipc	ra,0xfffff
    5890:	590080e7          	jalr	1424(ra) # 4e1c <_read_sectors>
    5894:	f40502e3          	beqz	a0,57d8 <fl_fread+0xc0>
    5898:	43442823          	sw	s4,1072(s0)
    589c:	42042a23          	sw	zero,1076(s0)
    58a0:	412b87b3          	sub	a5,s7,s2
    58a4:	41348633          	sub	a2,s1,s3
    58a8:	00c7d463          	bge	a5,a2,58b0 <fl_fread+0x198>
    58ac:	00078613          	mv	a2,a5
    58b0:	012b05b3          	add	a1,s6,s2
    58b4:	013a8533          	add	a0,s5,s3
    58b8:	00060c93          	mv	s9,a2
    58bc:	00c12423          	sw	a2,8(sp)
    58c0:	ffffd097          	auipc	ra,0xffffd
    58c4:	d44080e7          	jalr	-700(ra) # 2604 <memcpy>
    58c8:	00812603          	lw	a2,8(sp)
    58cc:	001a0a13          	addi	s4,s4,1
    58d0:	f79ff06f          	j	5848 <fl_fread+0x130>
    58d4:	fff00493          	li	s1,-1
    58d8:	f05ff06f          	j	57dc <fl_fread+0xc4>

000058dc <fatfs_allocate_free_space>:
    58dc:	fd010113          	addi	sp,sp,-48
    58e0:	02112623          	sw	ra,44(sp)
    58e4:	02812423          	sw	s0,40(sp)
    58e8:	02912223          	sw	s1,36(sp)
    58ec:	03212023          	sw	s2,32(sp)
    58f0:	01312e23          	sw	s3,28(sp)
    58f4:	01412c23          	sw	s4,24(sp)
    58f8:	01512a23          	sw	s5,20(sp)
    58fc:	02069863          	bnez	a3,592c <fatfs_allocate_free_space+0x50>
    5900:	00000413          	li	s0,0
    5904:	02c12083          	lw	ra,44(sp)
    5908:	00040513          	mv	a0,s0
    590c:	02812403          	lw	s0,40(sp)
    5910:	02412483          	lw	s1,36(sp)
    5914:	02012903          	lw	s2,32(sp)
    5918:	01c12983          	lw	s3,28(sp)
    591c:	01812a03          	lw	s4,24(sp)
    5920:	01412a83          	lw	s5,20(sp)
    5924:	03010113          	addi	sp,sp,48
    5928:	00008067          	ret
    592c:	02452783          	lw	a5,36(a0)
    5930:	00058a13          	mv	s4,a1
    5934:	fff00593          	li	a1,-1
    5938:	00050493          	mv	s1,a0
    593c:	00068913          	mv	s2,a3
    5940:	00060993          	mv	s3,a2
    5944:	00b78663          	beq	a5,a1,5950 <fatfs_allocate_free_space+0x74>
    5948:	fffff097          	auipc	ra,0xfffff
    594c:	620080e7          	jalr	1568(ra) # 4f68 <fatfs_set_fs_info_next_free_cluster>
    5950:	0004c783          	lbu	a5,0(s1)
    5954:	00090513          	mv	a0,s2
    5958:	00979a93          	slli	s5,a5,0x9
    595c:	000a8593          	mv	a1,s5
    5960:	ffffd097          	auipc	ra,0xffffd
    5964:	bdc080e7          	jalr	-1060(ra) # 253c <__udivsi3>
    5968:	00050413          	mv	s0,a0
    596c:	00050593          	mv	a1,a0
    5970:	000a8513          	mv	a0,s5
    5974:	ffffd097          	auipc	ra,0xffffd
    5978:	33c080e7          	jalr	828(ra) # 2cb0 <__mulsi3>
    597c:	41250533          	sub	a0,a0,s2
    5980:	00a03533          	snez	a0,a0
    5984:	00a40933          	add	s2,s0,a0
    5988:	040a0463          	beqz	s4,59d0 <fatfs_allocate_free_space+0xf4>
    598c:	0084a583          	lw	a1,8(s1)
    5990:	00c10613          	addi	a2,sp,12
    5994:	00048513          	mv	a0,s1
    5998:	fffff097          	auipc	ra,0xfffff
    599c:	680080e7          	jalr	1664(ra) # 5018 <fatfs_find_blank_cluster>
    59a0:	00050413          	mv	s0,a0
    59a4:	f4050ee3          	beqz	a0,5900 <fatfs_allocate_free_space+0x24>
    59a8:	00100793          	li	a5,1
    59ac:	02f91663          	bne	s2,a5,59d8 <fatfs_allocate_free_space+0xfc>
    59b0:	00c12903          	lw	s2,12(sp)
    59b4:	fff00613          	li	a2,-1
    59b8:	00048513          	mv	a0,s1
    59bc:	00090593          	mv	a1,s2
    59c0:	fffff097          	auipc	ra,0xfffff
    59c4:	76c080e7          	jalr	1900(ra) # 512c <fatfs_fat_set_cluster>
    59c8:	0129a023          	sw	s2,0(s3)
    59cc:	f39ff06f          	j	5904 <fatfs_allocate_free_space+0x28>
    59d0:	0009a783          	lw	a5,0(s3)
    59d4:	00f12623          	sw	a5,12(sp)
    59d8:	00090613          	mv	a2,s2
    59dc:	00c10593          	addi	a1,sp,12
    59e0:	00048513          	mv	a0,s1
    59e4:	00000097          	auipc	ra,0x0
    59e8:	954080e7          	jalr	-1708(ra) # 5338 <fatfs_add_free_space>
    59ec:	00050413          	mv	s0,a0
    59f0:	f15ff06f          	j	5904 <fatfs_allocate_free_space+0x28>

000059f4 <fatfs_add_file_entry>:
    59f4:	03852883          	lw	a7,56(a0)
    59f8:	30088e63          	beqz	a7,5d14 <fatfs_add_file_entry+0x320>
    59fc:	f8010113          	addi	sp,sp,-128
    5a00:	06812c23          	sw	s0,120(sp)
    5a04:	00050413          	mv	s0,a0
    5a08:	00060513          	mv	a0,a2
    5a0c:	06912a23          	sw	s1,116(sp)
    5a10:	07512223          	sw	s5,100(sp)
    5a14:	00f12c23          	sw	a5,24(sp)
    5a18:	00e12a23          	sw	a4,20(sp)
    5a1c:	06112e23          	sw	ra,124(sp)
    5a20:	07212823          	sw	s2,112(sp)
    5a24:	07312623          	sw	s3,108(sp)
    5a28:	07412423          	sw	s4,104(sp)
    5a2c:	07612023          	sw	s6,96(sp)
    5a30:	05712e23          	sw	s7,92(sp)
    5a34:	05812c23          	sw	s8,88(sp)
    5a38:	05912a23          	sw	s9,84(sp)
    5a3c:	05a12823          	sw	s10,80(sp)
    5a40:	05b12623          	sw	s11,76(sp)
    5a44:	01012e23          	sw	a6,28(sp)
    5a48:	00068a93          	mv	s5,a3
    5a4c:	00c12823          	sw	a2,16(sp)
    5a50:	00b12423          	sw	a1,8(sp)
    5a54:	ffffe097          	auipc	ra,0xffffe
    5a58:	a48080e7          	jalr	-1464(ra) # 349c <fatfs_lfn_entries_required>
    5a5c:	00150713          	addi	a4,a0,1
    5a60:	00100793          	li	a5,1
    5a64:	00050493          	mv	s1,a0
    5a68:	2ae7f263          	bgeu	a5,a4,5d0c <fatfs_add_file_entry+0x318>
    5a6c:	00000a13          	li	s4,0
    5a70:	00000993          	li	s3,0
    5a74:	00000913          	li	s2,0
    5a78:	00000c93          	li	s9,0
    5a7c:	00000b13          	li	s6,0
    5a80:	01000c13          	li	s8,16
    5a84:	00812583          	lw	a1,8(sp)
    5a88:	00000693          	li	a3,0
    5a8c:	000b0613          	mv	a2,s6
    5a90:	00040513          	mv	a0,s0
    5a94:	000b0b93          	mv	s7,s6
    5a98:	ffffe097          	auipc	ra,0xffffe
    5a9c:	7f4080e7          	jalr	2036(ra) # 428c <fatfs_sector_reader>
    5aa0:	18050463          	beqz	a0,5c28 <fatfs_add_file_entry+0x234>
    5aa4:	001b0b13          	addi	s6,s6,1
    5aa8:	04440793          	addi	a5,s0,68
    5aac:	000c8d13          	mv	s10,s9
    5ab0:	00000d93          	li	s11,0
    5ab4:	00078513          	mv	a0,a5
    5ab8:	00f12623          	sw	a5,12(sp)
    5abc:	ffffe097          	auipc	ra,0xffffe
    5ac0:	8f8080e7          	jalr	-1800(ra) # 33b4 <fatfs_entry_lfn_text>
    5ac4:	00c12783          	lw	a5,12(sp)
    5ac8:	00050c93          	mv	s9,a0
    5acc:	02050c63          	beqz	a0,5b04 <fatfs_add_file_entry+0x110>
    5ad0:	020d0463          	beqz	s10,5af8 <fatfs_add_file_entry+0x104>
    5ad4:	00090c93          	mv	s9,s2
    5ad8:	000c8913          	mv	s2,s9
    5adc:	001d0c93          	addi	s9,s10,1
    5ae0:	001d8d93          	addi	s11,s11,1
    5ae4:	0ffdfd93          	zext.b	s11,s11
    5ae8:	02078793          	addi	a5,a5,32
    5aec:	f98d8ce3          	beq	s11,s8,5a84 <fatfs_add_file_entry+0x90>
    5af0:	000c8d13          	mv	s10,s9
    5af4:	fc1ff06f          	j	5ab4 <fatfs_add_file_entry+0xc0>
    5af8:	000d8a13          	mv	s4,s11
    5afc:	000b8993          	mv	s3,s7
    5b00:	fd9ff06f          	j	5ad8 <fatfs_add_file_entry+0xe4>
    5b04:	0007c683          	lbu	a3,0(a5)
    5b08:	0e500713          	li	a4,229
    5b0c:	10e69863          	bne	a3,a4,5c1c <fatfs_add_file_entry+0x228>
    5b10:	000d1863          	bnez	s10,5b20 <fatfs_add_file_entry+0x12c>
    5b14:	000d8a13          	mv	s4,s11
    5b18:	000b8993          	mv	s3,s7
    5b1c:	00100913          	li	s2,1
    5b20:	fa9d4ee3          	blt	s10,s1,5adc <fatfs_add_file_entry+0xe8>
    5b24:	00ba8693          	addi	a3,s5,11
    5b28:	000a8713          	mv	a4,s5
    5b2c:	00000913          	li	s2,0
    5b30:	00074603          	lbu	a2,0(a4)
    5b34:	00195793          	srli	a5,s2,0x1
    5b38:	00791913          	slli	s2,s2,0x7
    5b3c:	012787b3          	add	a5,a5,s2
    5b40:	00170713          	addi	a4,a4,1
    5b44:	00c787b3          	add	a5,a5,a2
    5b48:	0ff7f913          	zext.b	s2,a5
    5b4c:	fed712e3          	bne	a4,a3,5b30 <fatfs_add_file_entry+0x13c>
    5b50:	00098b13          	mv	s6,s3
    5b54:	00000d13          	li	s10,0
    5b58:	01000b93          	li	s7,16
    5b5c:	00812583          	lw	a1,8(sp)
    5b60:	00000693          	li	a3,0
    5b64:	000b0613          	mv	a2,s6
    5b68:	00040513          	mv	a0,s0
    5b6c:	ffffe097          	auipc	ra,0xffffe
    5b70:	720080e7          	jalr	1824(ra) # 428c <fatfs_sector_reader>
    5b74:	18050c63          	beqz	a0,5d0c <fatfs_add_file_entry+0x318>
    5b78:	04440c93          	addi	s9,s0,68
    5b7c:	413b0db3          	sub	s11,s6,s3
    5b80:	00000793          	li	a5,0
    5b84:	00000c13          	li	s8,0
    5b88:	01912623          	sw	s9,12(sp)
    5b8c:	000d1663          	bnez	s10,5b98 <fatfs_add_file_entry+0x1a4>
    5b90:	154c1863          	bne	s8,s4,5ce0 <fatfs_add_file_entry+0x2ec>
    5b94:	140d9663          	bnez	s11,5ce0 <fatfs_add_file_entry+0x2ec>
    5b98:	12049263          	bnez	s1,5cbc <fatfs_add_file_entry+0x2c8>
    5b9c:	01c12703          	lw	a4,28(sp)
    5ba0:	01412603          	lw	a2,20(sp)
    5ba4:	01812583          	lw	a1,24(sp)
    5ba8:	02010693          	addi	a3,sp,32
    5bac:	000a8513          	mv	a0,s5
    5bb0:	ffffe097          	auipc	ra,0xffffe
    5bb4:	a30080e7          	jalr	-1488(ra) # 35e0 <fatfs_sfn_create_entry>
    5bb8:	02000613          	li	a2,32
    5bbc:	00c105b3          	add	a1,sp,a2
    5bc0:	000c8513          	mv	a0,s9
    5bc4:	ffffd097          	auipc	ra,0xffffd
    5bc8:	a40080e7          	jalr	-1472(ra) # 2604 <memcpy>
    5bcc:	03842783          	lw	a5,56(s0)
    5bd0:	00c12583          	lw	a1,12(sp)
    5bd4:	24442503          	lw	a0,580(s0)
    5bd8:	00100613          	li	a2,1
    5bdc:	000780e7          	jalr	a5
    5be0:	07c12083          	lw	ra,124(sp)
    5be4:	07812403          	lw	s0,120(sp)
    5be8:	07412483          	lw	s1,116(sp)
    5bec:	07012903          	lw	s2,112(sp)
    5bf0:	06c12983          	lw	s3,108(sp)
    5bf4:	06812a03          	lw	s4,104(sp)
    5bf8:	06412a83          	lw	s5,100(sp)
    5bfc:	06012b03          	lw	s6,96(sp)
    5c00:	05c12b83          	lw	s7,92(sp)
    5c04:	05812c03          	lw	s8,88(sp)
    5c08:	05412c83          	lw	s9,84(sp)
    5c0c:	05012d03          	lw	s10,80(sp)
    5c10:	04c12d83          	lw	s11,76(sp)
    5c14:	08010113          	addi	sp,sp,128
    5c18:	00008067          	ret
    5c1c:	ee068ae3          	beqz	a3,5b10 <fatfs_add_file_entry+0x11c>
    5c20:	00000913          	li	s2,0
    5c24:	ebdff06f          	j	5ae0 <fatfs_add_file_entry+0xec>
    5c28:	00842583          	lw	a1,8(s0)
    5c2c:	02010613          	addi	a2,sp,32
    5c30:	00040513          	mv	a0,s0
    5c34:	fffff097          	auipc	ra,0xfffff
    5c38:	3e4080e7          	jalr	996(ra) # 5018 <fatfs_find_blank_cluster>
    5c3c:	0c050863          	beqz	a0,5d0c <fatfs_add_file_entry+0x318>
    5c40:	02012b83          	lw	s7,32(sp)
    5c44:	00812583          	lw	a1,8(sp)
    5c48:	00040513          	mv	a0,s0
    5c4c:	000b8613          	mv	a2,s7
    5c50:	fffff097          	auipc	ra,0xfffff
    5c54:	64c080e7          	jalr	1612(ra) # 529c <fatfs_fat_add_cluster_to_chain>
    5c58:	0a050a63          	beqz	a0,5d0c <fatfs_add_file_entry+0x318>
    5c5c:	20000613          	li	a2,512
    5c60:	00000593          	li	a1,0
    5c64:	04440513          	addi	a0,s0,68
    5c68:	ffffd097          	auipc	ra,0xffffd
    5c6c:	980080e7          	jalr	-1664(ra) # 25e8 <memset>
    5c70:	00000c13          	li	s8,0
    5c74:	00044783          	lbu	a5,0(s0)
    5c78:	00fc6a63          	bltu	s8,a5,5c8c <fatfs_add_file_entry+0x298>
    5c7c:	ea0914e3          	bnez	s2,5b24 <fatfs_add_file_entry+0x130>
    5c80:	000b0993          	mv	s3,s6
    5c84:	00000a13          	li	s4,0
    5c88:	e9dff06f          	j	5b24 <fatfs_add_file_entry+0x130>
    5c8c:	00000693          	li	a3,0
    5c90:	000c0613          	mv	a2,s8
    5c94:	000b8593          	mv	a1,s7
    5c98:	00040513          	mv	a0,s0
    5c9c:	ffffd097          	auipc	ra,0xffffd
    5ca0:	3f4080e7          	jalr	1012(ra) # 3090 <fatfs_write_sector>
    5ca4:	06050463          	beqz	a0,5d0c <fatfs_add_file_entry+0x318>
    5ca8:	001c0c13          	addi	s8,s8,1
    5cac:	0ffc7c13          	zext.b	s8,s8
    5cb0:	fc5ff06f          	j	5c74 <fatfs_add_file_entry+0x280>
    5cb4:	001b0b13          	addi	s6,s6,1
    5cb8:	ea5ff06f          	j	5b5c <fatfs_add_file_entry+0x168>
    5cbc:	01012503          	lw	a0,16(sp)
    5cc0:	fff48493          	addi	s1,s1,-1
    5cc4:	00090693          	mv	a3,s2
    5cc8:	00048613          	mv	a2,s1
    5ccc:	000c8593          	mv	a1,s9
    5cd0:	ffffd097          	auipc	ra,0xffffd
    5cd4:	7fc080e7          	jalr	2044(ra) # 34cc <fatfs_filename_to_lfn>
    5cd8:	00100d13          	li	s10,1
    5cdc:	000d0793          	mv	a5,s10
    5ce0:	001c0c13          	addi	s8,s8,1
    5ce4:	0ffc7c13          	zext.b	s8,s8
    5ce8:	020c8c93          	addi	s9,s9,32
    5cec:	eb7c10e3          	bne	s8,s7,5b8c <fatfs_add_file_entry+0x198>
    5cf0:	fc0782e3          	beqz	a5,5cb4 <fatfs_add_file_entry+0x2c0>
    5cf4:	03842783          	lw	a5,56(s0)
    5cf8:	00c12583          	lw	a1,12(sp)
    5cfc:	24442503          	lw	a0,580(s0)
    5d00:	00100613          	li	a2,1
    5d04:	000780e7          	jalr	a5
    5d08:	fa0516e3          	bnez	a0,5cb4 <fatfs_add_file_entry+0x2c0>
    5d0c:	00000513          	li	a0,0
    5d10:	ed1ff06f          	j	5be0 <fatfs_add_file_entry+0x1ec>
    5d14:	00000513          	li	a0,0
    5d18:	00008067          	ret

00005d1c <fl_fopen>:
    5d1c:	000067b7          	lui	a5,0x6
    5d20:	7347a783          	lw	a5,1844(a5) # 6734 <_filelib_init>
    5d24:	fa010113          	addi	sp,sp,-96
    5d28:	05212823          	sw	s2,80(sp)
    5d2c:	03a12823          	sw	s10,48(sp)
    5d30:	04112e23          	sw	ra,92(sp)
    5d34:	04812c23          	sw	s0,88(sp)
    5d38:	04912a23          	sw	s1,84(sp)
    5d3c:	05312623          	sw	s3,76(sp)
    5d40:	05412423          	sw	s4,72(sp)
    5d44:	05512223          	sw	s5,68(sp)
    5d48:	05612023          	sw	s6,64(sp)
    5d4c:	03712e23          	sw	s7,60(sp)
    5d50:	03812c23          	sw	s8,56(sp)
    5d54:	03912a23          	sw	s9,52(sp)
    5d58:	00050d13          	mv	s10,a0
    5d5c:	00058913          	mv	s2,a1
    5d60:	00079663          	bnez	a5,5d6c <fl_fopen+0x50>
    5d64:	ffffd097          	auipc	ra,0xffffd
    5d68:	3e0080e7          	jalr	992(ra) # 3144 <fl_init>
    5d6c:	000067b7          	lui	a5,0x6
    5d70:	7307a783          	lw	a5,1840(a5) # 6730 <_filelib_valid>
    5d74:	00193713          	seqz	a4,s2
    5d78:	0017b793          	seqz	a5,a5
    5d7c:	00e7e7b3          	or	a5,a5,a4
    5d80:	36079e63          	bnez	a5,60fc <fl_fopen+0x3e0>
    5d84:	360d0c63          	beqz	s10,60fc <fl_fopen+0x3e0>
    5d88:	00000493          	li	s1,0
    5d8c:	00000413          	li	s0,0
    5d90:	05700993          	li	s3,87
    5d94:	07200a13          	li	s4,114
    5d98:	07700b13          	li	s6,119
    5d9c:	06100b93          	li	s7,97
    5da0:	06200c13          	li	s8,98
    5da4:	04100a93          	li	s5,65
    5da8:	04200c93          	li	s9,66
    5dac:	00090513          	mv	a0,s2
    5db0:	ffffd097          	auipc	ra,0xffffd
    5db4:	878080e7          	jalr	-1928(ra) # 2628 <strlen>
    5db8:	10a44a63          	blt	s0,a0,5ecc <fl_fopen+0x1b0>
    5dbc:	000089b7          	lui	s3,0x8
    5dc0:	35498a13          	addi	s4,s3,852 # 8354 <_fs>
    5dc4:	038a2783          	lw	a5,56(s4)
    5dc8:	00079463          	bnez	a5,5dd0 <fl_fopen+0xb4>
    5dcc:	fd94f493          	andi	s1,s1,-39
    5dd0:	03ca2783          	lw	a5,60(s4)
    5dd4:	00078463          	beqz	a5,5ddc <fl_fopen+0xc0>
    5dd8:	000780e7          	jalr	a5
    5ddc:	0014f793          	andi	a5,s1,1
    5de0:	18079263          	bnez	a5,5f64 <fl_fopen+0x248>
    5de4:	0204f793          	andi	a5,s1,32
    5de8:	08078c63          	beqz	a5,5e80 <fl_fopen+0x164>
    5dec:	038a2783          	lw	a5,56(s4)
    5df0:	06078a63          	beqz	a5,5e64 <fl_fopen+0x148>
    5df4:	ffffd097          	auipc	ra,0xffffd
    5df8:	160080e7          	jalr	352(ra) # 2f54 <_allocate_file>
    5dfc:	00050413          	mv	s0,a0
    5e00:	06050263          	beqz	a0,5e64 <fl_fopen+0x148>
    5e04:	01450a93          	addi	s5,a0,20
    5e08:	10400613          	li	a2,260
    5e0c:	00000593          	li	a1,0
    5e10:	000a8513          	mv	a0,s5
    5e14:	ffffc097          	auipc	ra,0xffffc
    5e18:	7d4080e7          	jalr	2004(ra) # 25e8 <memset>
    5e1c:	11840b13          	addi	s6,s0,280
    5e20:	10400613          	li	a2,260
    5e24:	00000593          	li	a1,0
    5e28:	000b0513          	mv	a0,s6
    5e2c:	ffffc097          	auipc	ra,0xffffc
    5e30:	7bc080e7          	jalr	1980(ra) # 25e8 <memset>
    5e34:	10400713          	li	a4,260
    5e38:	000b0693          	mv	a3,s6
    5e3c:	00070613          	mv	a2,a4
    5e40:	000a8593          	mv	a1,s5
    5e44:	000d0513          	mv	a0,s10
    5e48:	ffffe097          	auipc	ra,0xffffe
    5e4c:	c88080e7          	jalr	-888(ra) # 3ad0 <fatfs_split_path>
    5e50:	fff00793          	li	a5,-1
    5e54:	12f51663          	bne	a0,a5,5f80 <fl_fopen+0x264>
    5e58:	00040513          	mv	a0,s0
    5e5c:	ffffd097          	auipc	ra,0xffffd
    5e60:	170080e7          	jalr	368(ra) # 2fcc <_free_file>
    5e64:	00000413          	li	s0,0
    5e68:	0214f793          	andi	a5,s1,33
    5e6c:	02000713          	li	a4,32
    5e70:	28e79263          	bne	a5,a4,60f4 <fl_fopen+0x3d8>
    5e74:	10041263          	bnez	s0,5f78 <fl_fopen+0x25c>
    5e78:	0064f793          	andi	a5,s1,6
    5e7c:	26079463          	bnez	a5,60e4 <fl_fopen+0x3c8>
    5e80:	00000413          	li	s0,0
    5e84:	040a2783          	lw	a5,64(s4)
    5e88:	00078463          	beqz	a5,5e90 <fl_fopen+0x174>
    5e8c:	000780e7          	jalr	a5
    5e90:	05c12083          	lw	ra,92(sp)
    5e94:	00040513          	mv	a0,s0
    5e98:	05812403          	lw	s0,88(sp)
    5e9c:	05412483          	lw	s1,84(sp)
    5ea0:	05012903          	lw	s2,80(sp)
    5ea4:	04c12983          	lw	s3,76(sp)
    5ea8:	04812a03          	lw	s4,72(sp)
    5eac:	04412a83          	lw	s5,68(sp)
    5eb0:	04012b03          	lw	s6,64(sp)
    5eb4:	03c12b83          	lw	s7,60(sp)
    5eb8:	03812c03          	lw	s8,56(sp)
    5ebc:	03412c83          	lw	s9,52(sp)
    5ec0:	03012d03          	lw	s10,48(sp)
    5ec4:	06010113          	addi	sp,sp,96
    5ec8:	00008067          	ret
    5ecc:	008907b3          	add	a5,s2,s0
    5ed0:	0007c783          	lbu	a5,0(a5)
    5ed4:	05378863          	beq	a5,s3,5f24 <fl_fopen+0x208>
    5ed8:	02f9e863          	bltu	s3,a5,5f08 <fl_fopen+0x1ec>
    5edc:	05578863          	beq	a5,s5,5f2c <fl_fopen+0x210>
    5ee0:	00faea63          	bltu	s5,a5,5ef4 <fl_fopen+0x1d8>
    5ee4:	02b00713          	li	a4,43
    5ee8:	04e78663          	beq	a5,a4,5f34 <fl_fopen+0x218>
    5eec:	00140413          	addi	s0,s0,1
    5ef0:	ebdff06f          	j	5dac <fl_fopen+0x90>
    5ef4:	03978263          	beq	a5,s9,5f18 <fl_fopen+0x1fc>
    5ef8:	05200713          	li	a4,82
    5efc:	fee798e3          	bne	a5,a4,5eec <fl_fopen+0x1d0>
    5f00:	0014e493          	ori	s1,s1,1
    5f04:	fe9ff06f          	j	5eec <fl_fopen+0x1d0>
    5f08:	ff478ce3          	beq	a5,s4,5f00 <fl_fopen+0x1e4>
    5f0c:	00fa6a63          	bltu	s4,a5,5f20 <fl_fopen+0x204>
    5f10:	01778e63          	beq	a5,s7,5f2c <fl_fopen+0x210>
    5f14:	fd879ce3          	bne	a5,s8,5eec <fl_fopen+0x1d0>
    5f18:	0084e493          	ori	s1,s1,8
    5f1c:	fd1ff06f          	j	5eec <fl_fopen+0x1d0>
    5f20:	fd6796e3          	bne	a5,s6,5eec <fl_fopen+0x1d0>
    5f24:	0324e493          	ori	s1,s1,50
    5f28:	fc5ff06f          	j	5eec <fl_fopen+0x1d0>
    5f2c:	0264e493          	ori	s1,s1,38
    5f30:	fbdff06f          	j	5eec <fl_fopen+0x1d0>
    5f34:	0014f793          	andi	a5,s1,1
    5f38:	00078663          	beqz	a5,5f44 <fl_fopen+0x228>
    5f3c:	0024e493          	ori	s1,s1,2
    5f40:	fadff06f          	j	5eec <fl_fopen+0x1d0>
    5f44:	0024f793          	andi	a5,s1,2
    5f48:	00078663          	beqz	a5,5f54 <fl_fopen+0x238>
    5f4c:	0314e493          	ori	s1,s1,49
    5f50:	f9dff06f          	j	5eec <fl_fopen+0x1d0>
    5f54:	0044f793          	andi	a5,s1,4
    5f58:	f8078ae3          	beqz	a5,5eec <fl_fopen+0x1d0>
    5f5c:	0274e493          	ori	s1,s1,39
    5f60:	f8dff06f          	j	5eec <fl_fopen+0x1d0>
    5f64:	000d0513          	mv	a0,s10
    5f68:	fffff097          	auipc	ra,0xfffff
    5f6c:	81c080e7          	jalr	-2020(ra) # 4784 <_open_file>
    5f70:	00050413          	mv	s0,a0
    5f74:	e60508e3          	beqz	a0,5de4 <fl_fopen+0xc8>
    5f78:	42940c23          	sb	s1,1080(s0)
    5f7c:	f09ff06f          	j	5e84 <fl_fopen+0x168>
    5f80:	00040513          	mv	a0,s0
    5f84:	ffffe097          	auipc	ra,0xffffe
    5f88:	dc8080e7          	jalr	-568(ra) # 3d4c <_check_file_open>
    5f8c:	00050913          	mv	s2,a0
    5f90:	ec0514e3          	bnez	a0,5e58 <fl_fopen+0x13c>
    5f94:	01444783          	lbu	a5,20(s0)
    5f98:	0e079663          	bnez	a5,6084 <fl_fopen+0x368>
    5f9c:	008a2783          	lw	a5,8(s4)
    5fa0:	00f42023          	sw	a5,0(s0)
    5fa4:	00042583          	lw	a1,0(s0)
    5fa8:	01010693          	addi	a3,sp,16
    5fac:	000b0613          	mv	a2,s6
    5fb0:	35498513          	addi	a0,s3,852
    5fb4:	ffffe097          	auipc	ra,0xffffe
    5fb8:	428080e7          	jalr	1064(ra) # 43dc <fatfs_get_file_entry>
    5fbc:	00100693          	li	a3,1
    5fc0:	e8d50ce3          	beq	a0,a3,5e58 <fl_fopen+0x13c>
    5fc4:	00042223          	sw	zero,4(s0)
    5fc8:	00440613          	addi	a2,s0,4
    5fcc:	00068593          	mv	a1,a3
    5fd0:	35498513          	addi	a0,s3,852
    5fd4:	00000097          	auipc	ra,0x0
    5fd8:	908080e7          	jalr	-1784(ra) # 58dc <fatfs_allocate_free_space>
    5fdc:	e6050ee3          	beqz	a0,5e58 <fl_fopen+0x13c>
    5fe0:	00002ab7          	lui	s5,0x2
    5fe4:	21c40b93          	addi	s7,s0,540
    5fe8:	35498c13          	addi	s8,s3,852
    5fec:	70fa8a93          	addi	s5,s5,1807 # 270f <oled_init_mode+0x23>
    5ff0:	000b0593          	mv	a1,s6
    5ff4:	00410513          	addi	a0,sp,4
    5ff8:	ffffd097          	auipc	ra,0xffffd
    5ffc:	68c080e7          	jalr	1676(ra) # 3684 <fatfs_lfn_create_sfn>
    6000:	08090e63          	beqz	s2,609c <fl_fopen+0x380>
    6004:	00090613          	mv	a2,s2
    6008:	00410593          	addi	a1,sp,4
    600c:	000b8513          	mv	a0,s7
    6010:	ffffd097          	auipc	ra,0xffffd
    6014:	7f0080e7          	jalr	2032(ra) # 3800 <fatfs_lfn_generate_tail>
    6018:	00042583          	lw	a1,0(s0)
    601c:	000b8613          	mv	a2,s7
    6020:	000c0513          	mv	a0,s8
    6024:	fffff097          	auipc	ra,0xfffff
    6028:	8d4080e7          	jalr	-1836(ra) # 48f8 <fatfs_sfn_exists>
    602c:	00050663          	beqz	a0,6038 <fl_fopen+0x31c>
    6030:	00190913          	addi	s2,s2,1
    6034:	fb591ee3          	bne	s2,s5,5ff0 <fl_fopen+0x2d4>
    6038:	00442703          	lw	a4,4(s0)
    603c:	000027b7          	lui	a5,0x2
    6040:	70f78793          	addi	a5,a5,1807 # 270f <oled_init_mode+0x23>
    6044:	00070593          	mv	a1,a4
    6048:	02f90663          	beq	s2,a5,6074 <fl_fopen+0x358>
    604c:	00042583          	lw	a1,0(s0)
    6050:	00000813          	li	a6,0
    6054:	00000793          	li	a5,0
    6058:	000b8693          	mv	a3,s7
    605c:	000b0613          	mv	a2,s6
    6060:	35498513          	addi	a0,s3,852
    6064:	00000097          	auipc	ra,0x0
    6068:	990080e7          	jalr	-1648(ra) # 59f4 <fatfs_add_file_entry>
    606c:	04051463          	bnez	a0,60b4 <fl_fopen+0x398>
    6070:	00442583          	lw	a1,4(s0)
    6074:	35498513          	addi	a0,s3,852
    6078:	fffff097          	auipc	ra,0xfffff
    607c:	1b4080e7          	jalr	436(ra) # 522c <fatfs_free_cluster_chain>
    6080:	dd9ff06f          	j	5e58 <fl_fopen+0x13c>
    6084:	00040593          	mv	a1,s0
    6088:	000a8513          	mv	a0,s5
    608c:	ffffe097          	auipc	ra,0xffffe
    6090:	54c080e7          	jalr	1356(ra) # 45d8 <_open_directory>
    6094:	f00518e3          	bnez	a0,5fa4 <fl_fopen+0x288>
    6098:	dc1ff06f          	j	5e58 <fl_fopen+0x13c>
    609c:	00b00613          	li	a2,11
    60a0:	00410593          	addi	a1,sp,4
    60a4:	000b8513          	mv	a0,s7
    60a8:	ffffc097          	auipc	ra,0xffffc
    60ac:	55c080e7          	jalr	1372(ra) # 2604 <memcpy>
    60b0:	f69ff06f          	j	6018 <fl_fopen+0x2fc>
    60b4:	fff00793          	li	a5,-1
    60b8:	00042623          	sw	zero,12(s0)
    60bc:	00042423          	sw	zero,8(s0)
    60c0:	42f42823          	sw	a5,1072(s0)
    60c4:	42042a23          	sw	zero,1076(s0)
    60c8:	00042823          	sw	zero,16(s0)
    60cc:	22f42423          	sw	a5,552(s0)
    60d0:	22f42623          	sw	a5,556(s0)
    60d4:	35498513          	addi	a0,s3,852
    60d8:	ffffe097          	auipc	ra,0xffffe
    60dc:	054080e7          	jalr	84(ra) # 412c <fatfs_fat_purge>
    60e0:	d89ff06f          	j	5e68 <fl_fopen+0x14c>
    60e4:	000d0513          	mv	a0,s10
    60e8:	ffffe097          	auipc	ra,0xffffe
    60ec:	69c080e7          	jalr	1692(ra) # 4784 <_open_file>
    60f0:	00050413          	mv	s0,a0
    60f4:	e80412e3          	bnez	s0,5f78 <fl_fopen+0x25c>
    60f8:	d89ff06f          	j	5e80 <fl_fopen+0x164>
    60fc:	00000413          	li	s0,0
    6100:	d91ff06f          	j	5e90 <fl_fopen+0x174>

00006104 <led_pos>:
    6104:	00000001                                ....

00006108 <cmd16>:
    6108:	02000050 00001500                       P.......

00006110 <acmd41>:
    6110:	00004069 00000100                       i@......

00006118 <cmd55>:
    6118:	00000077 00000100                       w.......

00006120 <cmd8>:
    6120:	01000048 000087aa                       H.......

00006128 <cmd0>:
    6128:	00000040 00009500                       @.......

00006130 <AUDIO>:
    6130:	00018000                                ....

00006134 <DISPLAY>:
    6134:	00014000                                .@..

00006138 <BUTTONS>:
    6138:	00010100                                ....

0000613c <SDCARD>:
    613c:	00010080                                ....

00006140 <OLED_RST>:
    6140:	00010010                                ....

00006144 <OLED>:
    6144:	00010008                                ....

00006148 <LEDS>:
    6148:	00010004 00006272 696c632f 722e6b63     ....rb../click.r
    6158:	00007761 676d692f 00002f73 43206f4e     aw../imgs/..No C
    6168:	7265766f 00000000 50207c7c 45535541     over....|| PAUSE
    6178:	00000044 52203c3c 4e495745 00000044     D...<< REWIND...
    6188:	46203e3e 00545341 54534552 00545241     >> FAST.RESTART.
    6198:	54534146 00583220 574f4c53 352e3020     FAST 2X.SLOW 0.5
    61a8:	00000058 4d204a44 0045444f 52204a44     X...DJ MODE.DJ R
    61b8:	59444145 00000000 54555453 21524554     EADY....STUTTER!
    61c8:	00000021 53203c3c 004e4950 00002e2e     !...<< SPIN.....
    61d8:	0000002e 0000002f 4c494620 203a5345     ..../... FILES: 
    61e8:	00000000 74706d45 000a2179 5d64255b     ....Empty!..[%d]
    61f8:	00000020 203e6425 00000000 20202020      ...%d> ....    
    6208:	20202020 20202020 20202020 20202020                     
    6218:	00000a20 626c612f 2f736d75 00000000      .../albums/....
    6228:	204a4420 3a4c4553 00000020 53554d20      DJ SEL: ... MUS
    6238:	203a4349 00000020 656c6946 70784520     IC:  ...File Exp
    6248:	65726f6c 00000072 79616c50 6e6f5320     lorer...Play Son
    6258:	00007367 4d204a44 0065646f 203d3d3d     gs..DJ Mode.=== 
    6268:	4e49414d 4e454d20 3d3d2055 000a0a3d     MAIN MENU ===...
    6278:	2e642520 20732520 20202020 000a2020      %d. %s       ..
    6288:	0000000a 656c6553 26207463 65725020     ....Select & Pre
    6298:	42207373 00006e74 74696e49 20445320     ss Btn..Init SD 
    62a8:	64726163 0a2e2e2e 00000000 33323130     card........0123
    62b8:	37363534 42413938 46454443 00000000     456789ABCDEF....
    62c8:	5f544146 203a5346 6f727245 6f632072     FAT_FS: Error co
    62d8:	20646c75 20746f6e 64616f6c 54414620     uld not load FAT
    62e8:	74656420 736c6961 64252820 0a0d2129      details (%d)!..
    62f8:	00000000                                ....

000062fc <font>:
    62fc:	00000000 00002f00 00030000 14000003     ...../..........
    630c:	143e143e 3a2b6a2e 08122600 171c3224     >.>..j+:.&..$2..
    631c:	03003415 00000000 0000211e 001e2100     .4.......!...!..
    632c:	08220000 0822081c 0000081c 00002040     .."...".....@ ..
    633c:	00080800 00200000 20000000 02040810     ...... .... ....
    634c:	3f21213f 003f0100 253d0000 25002725     ?!!?..?...=%%'.%
    635c:	003f2525 3f040407 25252700 253f003d     %%?....?.'%%=.?%
    636c:	01003d25 00030539 3f25253f 25252700     %=..9...?%%?.'%%
    637c:	0028003f 40000000 00000028 00110a04     ?.(....@(.......
    638c:	00141400 0a110000 01000004 0007052d     ............-...
    639c:	253d213f 09093f1f 253f003f 3f003c27     ?!=%.?..?.?%'<.?
    63ac:	00212121 1e21213f 25253f00 053f0025     !!!.?!!..?%%%.?.
    63bc:	3f000505 003d2521 3f04043f 213f2100     ...?!%=.?..?.!?!
    63cc:	20380000 3f013f21 003b0404 2020203f     ..8 !?.?..;.?   
    63dc:	3f013f00 023f3f01 3f003f04 003f2121     .?.?.??..?.?!!?.
    63ec:	0f09093f 31213f00 093f003f 27002f39     ?....?!1?.?.9/.'
    63fc:	003d2525 013f0101 20203f01 100f003f     %%=...?..?  ?...
    640c:	3f001f30 3f203f20 3b04043b 38080f00     0..? ? ?;..;...8
    641c:	2931000f 3f002325 00000021 04081020     ..1)%#.?!... ...
    642c:	003f2102 01020000 20000201 00000020     .!?........  ...
    643c:	00000201 24243800 243f003c 3c003c24     .....8$$<.?$$<.<
    644c:	00242424 3f24243c 2c2c3c00 3f04002c     $$$.<$$?.<,,,..?
    645c:	bc000005 00fca4a4 3c04043f 00003d00     ........?..<.=..
    646c:	fd800000 3f000000 00340808 0000003f     .......?..4.?...
    647c:	3c043c00 043c3c04 3c003c04 003c2424     .<.<.<<..<.<$$<.
    648c:	3c2424fc 24243c00 083c00fc 2c000004     .$$<.<$$..<....,
    649c:	003c2c2c 00243f04 20203c00 100c003c     ,,<..?$..<  <...
    64ac:	3c001c30 3c203c20 34080834 a0a0bc00     0..< < <4..4....
    64bc:	342400fc 0400242c 0000213f 0000003f     ..$4,$..?!..?...
    64cc:	043f2100 02010000 00000102 00000000     .!?.............
    64dc:	00000001 00000003 00000005 00000007     ................
    64ec:	00000009 0000000e 00000010 00000012     ................
    64fc:	00000014 00000016 00000018 0000001c     ................
    650c:	0000001e                                ....

00006510 <current_path>:
    6510:	0000002f 00000000 00000000 00000000     /...............
	...

00006704 <led_dir>:
    6704:	00000000                                ....

00006708 <n_items>:
    6708:	00000000                                ....

0000670c <sdcard_while_loading_callback>:
    670c:	00000000                                ....

00006710 <back_color>:
	...

00006711 <front_color>:
    6711:	                                         ...

00006714 <cursor_y>:
    6714:	00000000                                ....

00006718 <cursor_x>:
    6718:	00000000                                ....

0000671c <f_putchar>:
    671c:	00000000                                ....

00006720 <_free_file_list>:
	...

00006728 <_open_file_list>:
	...

00006730 <_filelib_valid>:
    6730:	00000000                                ....

00006734 <_filelib_init>:
    6734:	00000000                                ....
