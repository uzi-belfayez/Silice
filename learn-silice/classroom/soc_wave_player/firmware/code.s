
code.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00010137          	lui	sp,0x10
       4:	00002097          	auipc	ra,0x2
       8:	9f0080e7          	jalr	-1552(ra) # 19f4 <main>
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
      e0:	fe010113          	addi	sp,sp,-32 # ffe0 <_files+0x7c74>
      e4:	000067b7          	lui	a5,0x6
      e8:	00812c23          	sw	s0,24(sp)
      ec:	d147a403          	lw	s0,-748(a5) # 5d14 <AUDIO>
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
     128:	02c080e7          	jalr	44(ra) # 2150 <memset>
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
     168:	d3058593          	addi	a1,a1,-720 # 5d30 <LEDS+0x4>
     16c:	d3850513          	addi	a0,a0,-712 # 5d38 <LEDS+0xc>
     170:	00112e23          	sw	ra,28(sp)
     174:	00812c23          	sw	s0,24(sp)
     178:	00912a23          	sw	s1,20(sp)
     17c:	01212823          	sw	s2,16(sp)
     180:	01312623          	sw	s3,12(sp)
     184:	01412423          	sw	s4,8(sp)
     188:	01512223          	sw	s5,4(sp)
     18c:	00005097          	auipc	ra,0x5
     190:	774080e7          	jalr	1908(ra) # 5900 <fl_fopen>
     194:	0a050263          	beqz	a0,238 <play_click_noise+0xdc>
     198:	000015b7          	lui	a1,0x1
     19c:	00000613          	li	a2,0
     1a0:	19458593          	addi	a1,a1,404 # 1194 <file_explorer+0x3b8>
     1a4:	00050a13          	mv	s4,a0
     1a8:	00003097          	auipc	ra,0x3
     1ac:	be8080e7          	jalr	-1048(ra) # 2d90 <fl_fseek>
     1b0:	000067b7          	lui	a5,0x6
     1b4:	d147aa83          	lw	s5,-748(a5) # 5d14 <AUDIO>
     1b8:	20000993          	li	s3,512
     1bc:	1ff00913          	li	s2,511
     1c0:	000aa483          	lw	s1,0(s5)
     1c4:	000a0693          	mv	a3,s4
     1c8:	20000613          	li	a2,512
     1cc:	00100593          	li	a1,1
     1d0:	00048513          	mv	a0,s1
     1d4:	00005097          	auipc	ra,0x5
     1d8:	128080e7          	jalr	296(ra) # 52fc <fl_fread>
     1dc:	00050413          	mv	s0,a0
     1e0:	00a94c63          	blt	s2,a0,1f8 <play_click_noise+0x9c>
     1e4:	40a98633          	sub	a2,s3,a0
     1e8:	00000593          	li	a1,0
     1ec:	00a48533          	add	a0,s1,a0
     1f0:	00002097          	auipc	ra,0x2
     1f4:	f60080e7          	jalr	-160(ra) # 2150 <memset>
     1f8:	000aa783          	lw	a5,0(s5)
     1fc:	fef48ee3          	beq	s1,a5,1f8 <play_click_noise+0x9c>
     200:	fc8940e3          	blt	s2,s0,1c0 <play_click_noise+0x64>
     204:	000a0513          	mv	a0,s4
     208:	00005097          	auipc	ra,0x5
     20c:	018080e7          	jalr	24(ra) # 5220 <fl_fclose>
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
     284:	1f0080e7          	jalr	496(ra) # 2470 <display_framebuffer>
     288:	000037b7          	lui	a5,0x3
     28c:	00050493          	mv	s1,a0
     290:	48078793          	addi	a5,a5,1152 # 3480 <fatfs_lfn_generate_tail+0x9c>
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
     338:	a9378793          	addi	a5,a5,-1389 # 2a93 <fatfs_fat_read_sector+0x47>
     33c:	06c00693          	li	a3,108
     340:	00a7ca63          	blt	a5,a0,354 <update_player_ui+0xf8>
     344:	06400593          	li	a1,100
     348:	00002097          	auipc	ra,0x2
     34c:	d54080e7          	jalr	-684(ra) # 209c <__divsi3>
     350:	00050693          	mv	a3,a0
     354:	000037b7          	lui	a5,0x3
     358:	00004637          	lui	a2,0x4
     35c:	78078793          	addi	a5,a5,1920 # 3780 <fatfs_split_path+0xcc>
     360:	07600593          	li	a1,118
     364:	07500513          	li	a0,117
     368:	00a00813          	li	a6,10
     36c:	fff00893          	li	a7,-1
     370:	90060613          	addi	a2,a2,-1792 # 3900 <fatfs_compare_names+0x15c>
     374:	40d58733          	sub	a4,a1,a3
     378:	00f48333          	add	t1,s1,a5
     37c:	04e55c63          	bge	a0,a4,3d4 <update_player_ui+0x178>
     380:	08078793          	addi	a5,a5,128
     384:	fec798e3          	bne	a5,a2,374 <update_player_ui+0x118>
     388:	07600593          	li	a1,118
     38c:	00a00513          	li	a0,10
     390:	00002097          	auipc	ra,0x2
     394:	0ec080e7          	jalr	236(ra) # 247c <display_set_cursor>
     398:	00000593          	li	a1,0
     39c:	0ff00513          	li	a0,255
     3a0:	00002097          	auipc	ra,0x2
     3a4:	0f0080e7          	jalr	240(ra) # 2490 <display_set_front_back_color>
     3a8:	04040063          	beqz	s0,3e8 <update_player_ui+0x18c>
     3ac:	01812403          	lw	s0,24(sp)
     3b0:	01c12083          	lw	ra,28(sp)
     3b4:	01412483          	lw	s1,20(sp)
     3b8:	01012903          	lw	s2,16(sp)
     3bc:	00c12983          	lw	s3,12(sp)
     3c0:	00006537          	lui	a0,0x6
     3c4:	d4450513          	addi	a0,a0,-700 # 5d44 <LEDS+0x18>
     3c8:	02010113          	addi	sp,sp,32
     3cc:	00002317          	auipc	t1,0x2
     3d0:	38c30067          	jr	908(t1) # 2758 <printf>
     3d4:	01070663          	beq	a4,a6,3e0 <update_player_ui+0x184>
     3d8:	00e30e33          	add	t3,t1,a4
     3dc:	011e0023          	sb	a7,0(t3)
     3e0:	00170713          	addi	a4,a4,1
     3e4:	f99ff06f          	j	37c <update_player_ui+0x120>
     3e8:	00006537          	lui	a0,0x6
     3ec:	d5450513          	addi	a0,a0,-684 # 5d54 <LEDS+0x28>
     3f0:	00002097          	auipc	ra,0x2
     3f4:	368080e7          	jalr	872(ra) # 2758 <printf>
     3f8:	000064b7          	lui	s1,0x6
     3fc:	00b00913          	li	s2,11
     400:	008987b3          	add	a5,s3,s0
     404:	0007c503          	lbu	a0,0(a5)
     408:	00050a63          	beqz	a0,41c <update_player_ui+0x1c0>
     40c:	2cc4a783          	lw	a5,716(s1) # 62cc <f_putchar>
     410:	00140413          	addi	s0,s0,1
     414:	000780e7          	jalr	a5
     418:	ff2414e3          	bne	s0,s2,400 <update_player_ui+0x1a4>
     41c:	00d00913          	li	s2,13
     420:	2cc4a783          	lw	a5,716(s1)
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
     450:	00050713          	mv	a4,a0
     454:	00000693          	li	a3,0
     458:	00470713          	addi	a4,a4,4
     45c:	40a707b3          	sub	a5,a4,a0
     460:	06b7c463          	blt	a5,a1,4c8 <update_led_dance+0x78>
     464:	32000793          	li	a5,800
     468:	04d7fe63          	bgeu	a5,a3,4c4 <update_led_dance+0x74>
     46c:	00006637          	lui	a2,0x6
     470:	ce862703          	lw	a4,-792(a2) # 5ce8 <led_pos>
     474:	000067b7          	lui	a5,0x6
     478:	fff70693          	addi	a3,a4,-1
     47c:	00068663          	beqz	a3,488 <update_led_dance+0x38>
     480:	f8070693          	addi	a3,a4,-128
     484:	00069a63          	bnez	a3,498 <update_led_dance+0x48>
     488:	2b47a583          	lw	a1,692(a5) # 62b4 <led_dir>
     48c:	00100693          	li	a3,1
     490:	40b686b3          	sub	a3,a3,a1
     494:	2ad7aa23          	sw	a3,692(a5)
     498:	2b47a683          	lw	a3,692(a5)
     49c:	40175793          	srai	a5,a4,0x1
     4a0:	00068463          	beqz	a3,4a8 <update_led_dance+0x58>
     4a4:	00171793          	slli	a5,a4,0x1
     4a8:	08000713          	li	a4,128
     4ac:	02f75e63          	bge	a4,a5,4e8 <update_led_dance+0x98>
     4b0:	00070793          	mv	a5,a4
     4b4:	00006737          	lui	a4,0x6
     4b8:	d2c72703          	lw	a4,-724(a4) # 5d2c <LEDS>
     4bc:	cef62423          	sw	a5,-792(a2)
     4c0:	00f72023          	sw	a5,0(a4)
     4c4:	00008067          	ret
     4c8:	ffc74603          	lbu	a2,-4(a4)
     4cc:	00074783          	lbu	a5,0(a4)
     4d0:	40c787b3          	sub	a5,a5,a2
     4d4:	41f7d613          	srai	a2,a5,0x1f
     4d8:	00f647b3          	xor	a5,a2,a5
     4dc:	40c787b3          	sub	a5,a5,a2
     4e0:	00f686b3          	add	a3,a3,a5
     4e4:	f75ff06f          	j	458 <update_led_dance+0x8>
     4e8:	fcf046e3          	bgtz	a5,4b4 <update_led_dance+0x64>
     4ec:	00100793          	li	a5,1
     4f0:	fc5ff06f          	j	4b4 <update_led_dance+0x64>

000004f4 <play_music_with_controls>:
     4f4:	bb010113          	addi	sp,sp,-1104
     4f8:	00b12023          	sw	a1,0(sp)
     4fc:	000065b7          	lui	a1,0x6
     500:	44912223          	sw	s1,1092(sp)
     504:	d5858593          	addi	a1,a1,-680 # 5d58 <LEDS+0x2c>
     508:	00050493          	mv	s1,a0
     50c:	01c10513          	addi	a0,sp,28
     510:	44112623          	sw	ra,1100(sp)
     514:	45212023          	sw	s2,1088(sp)
     518:	43312e23          	sw	s3,1084(sp)
     51c:	44812423          	sw	s0,1096(sp)
     520:	43412c23          	sw	s4,1080(sp)
     524:	43512a23          	sw	s5,1076(sp)
     528:	43612823          	sw	s6,1072(sp)
     52c:	43712623          	sw	s7,1068(sp)
     530:	43812423          	sw	s8,1064(sp)
     534:	43912223          	sw	s9,1060(sp)
     538:	43a12023          	sw	s10,1056(sp)
     53c:	41b12e23          	sw	s11,1052(sp)
     540:	00060913          	mv	s2,a2
     544:	00002097          	auipc	ra,0x2
     548:	cd0080e7          	jalr	-816(ra) # 2214 <strcpy>
     54c:	00012583          	lw	a1,0(sp)
     550:	01c10513          	addi	a0,sp,28
     554:	000069b7          	lui	s3,0x6
     558:	00000097          	auipc	ra,0x0
     55c:	b34080e7          	jalr	-1228(ra) # 8c <strcat_custom>
     560:	d3098593          	addi	a1,s3,-720 # 5d30 <LEDS+0x4>
     564:	01c10513          	addi	a0,sp,28
     568:	00005097          	auipc	ra,0x5
     56c:	398080e7          	jalr	920(ra) # 5900 <fl_fopen>
     570:	0c050a63          	beqz	a0,644 <play_music_with_controls+0x150>
     574:	00050413          	mv	s0,a0
     578:	00002097          	auipc	ra,0x2
     57c:	ef8080e7          	jalr	-264(ra) # 2470 <display_framebuffer>
     580:	00040693          	mv	a3,s0
     584:	00004637          	lui	a2,0x4
     588:	00100593          	li	a1,1
     58c:	00005097          	auipc	ra,0x5
     590:	d70080e7          	jalr	-656(ra) # 52fc <fl_fread>
     594:	00040513          	mv	a0,s0
     598:	00005097          	auipc	ra,0x5
     59c:	c88080e7          	jalr	-888(ra) # 5220 <fl_fclose>
     5a0:	d3098593          	addi	a1,s3,-720
     5a4:	00048513          	mv	a0,s1
     5a8:	00005097          	auipc	ra,0x5
     5ac:	358080e7          	jalr	856(ra) # 5900 <fl_fopen>
     5b0:	00a12223          	sw	a0,4(sp)
     5b4:	0c051663          	bnez	a0,680 <play_music_with_controls+0x18c>
     5b8:	00002097          	auipc	ra,0x2
     5bc:	e3c080e7          	jalr	-452(ra) # 23f4 <oled_clear>
     5c0:	00000593          	li	a1,0
     5c4:	00000513          	li	a0,0
     5c8:	00002097          	auipc	ra,0x2
     5cc:	eb4080e7          	jalr	-332(ra) # 247c <display_set_cursor>
     5d0:	00006537          	lui	a0,0x6
     5d4:	00048593          	mv	a1,s1
     5d8:	d6c50513          	addi	a0,a0,-660 # 5d6c <LEDS+0x40>
     5dc:	00002097          	auipc	ra,0x2
     5e0:	17c080e7          	jalr	380(ra) # 2758 <printf>
     5e4:	00002097          	auipc	ra,0x2
     5e8:	008080e7          	jalr	8(ra) # 25ec <display_refresh>
     5ec:	000317b7          	lui	a5,0x31
     5f0:	d4078793          	addi	a5,a5,-704 # 30d40 <__stacktop+0x20d40>
     5f4:	00000013          	nop
     5f8:	fff78793          	addi	a5,a5,-1
     5fc:	fe079ce3          	bnez	a5,5f4 <play_music_with_controls+0x100>
     600:	00000413          	li	s0,0
     604:	44c12083          	lw	ra,1100(sp)
     608:	00040513          	mv	a0,s0
     60c:	44812403          	lw	s0,1096(sp)
     610:	44412483          	lw	s1,1092(sp)
     614:	44012903          	lw	s2,1088(sp)
     618:	43c12983          	lw	s3,1084(sp)
     61c:	43812a03          	lw	s4,1080(sp)
     620:	43412a83          	lw	s5,1076(sp)
     624:	43012b03          	lw	s6,1072(sp)
     628:	42c12b83          	lw	s7,1068(sp)
     62c:	42812c03          	lw	s8,1064(sp)
     630:	42412c83          	lw	s9,1060(sp)
     634:	42012d03          	lw	s10,1056(sp)
     638:	41c12d83          	lw	s11,1052(sp)
     63c:	45010113          	addi	sp,sp,1104
     640:	00008067          	ret
     644:	00002097          	auipc	ra,0x2
     648:	db0080e7          	jalr	-592(ra) # 23f4 <oled_clear>
     64c:	03200593          	li	a1,50
     650:	01e00513          	li	a0,30
     654:	00002097          	auipc	ra,0x2
     658:	e28080e7          	jalr	-472(ra) # 247c <display_set_cursor>
     65c:	00000593          	li	a1,0
     660:	0ff00513          	li	a0,255
     664:	00002097          	auipc	ra,0x2
     668:	e2c080e7          	jalr	-468(ra) # 2490 <display_set_front_back_color>
     66c:	00006537          	lui	a0,0x6
     670:	d6050513          	addi	a0,a0,-672 # 5d60 <LEDS+0x34>
     674:	00002097          	auipc	ra,0x2
     678:	0e4080e7          	jalr	228(ra) # 2758 <printf>
     67c:	f25ff06f          	j	5a0 <play_music_with_controls+0xac>
     680:	00012603          	lw	a2,0(sp)
     684:	00000593          	li	a1,0
     688:	00000513          	li	a0,0
     68c:	00000097          	auipc	ra,0x0
     690:	bd0080e7          	jalr	-1072(ra) # 25c <update_player_ui>
     694:	00006c37          	lui	s8,0x6
     698:	00002097          	auipc	ra,0x2
     69c:	f54080e7          	jalr	-172(ra) # 25ec <display_refresh>
     6a0:	d1cc2783          	lw	a5,-740(s8) # 5d1c <BUTTONS>
     6a4:	00000a93          	li	s5,0
     6a8:	00000b13          	li	s6,0
     6ac:	0007a483          	lw	s1,0(a5)
     6b0:	00f12423          	sw	a5,8(sp)
     6b4:	000067b7          	lui	a5,0x6
     6b8:	d147ad03          	lw	s10,-748(a5) # 5d14 <AUDIO>
     6bc:	000067b7          	lui	a5,0x6
     6c0:	d2c7a783          	lw	a5,-724(a5) # 5d2c <LEDS>
     6c4:	00000993          	li	s3,0
     6c8:	00000413          	li	s0,0
     6cc:	21010b93          	addi	s7,sp,528
     6d0:	20000c93          	li	s9,512
     6d4:	00f12623          	sw	a5,12(sp)
     6d8:	000d2a03          	lw	s4,0(s10)
     6dc:	1a098263          	beqz	s3,880 <play_music_with_controls+0x38c>
     6e0:	20000613          	li	a2,512
     6e4:	00000593          	li	a1,0
     6e8:	000a0513          	mv	a0,s4
     6ec:	00002097          	auipc	ra,0x2
     6f0:	a64080e7          	jalr	-1436(ra) # 2150 <memset>
     6f4:	00c12783          	lw	a5,12(sp)
     6f8:	0007a023          	sw	zero,0(a5)
     6fc:	000d2783          	lw	a5,0(s10)
     700:	fefa0ee3          	beq	s4,a5,6fc <play_music_with_controls+0x208>
     704:	001b0b13          	addi	s6,s6,1
     708:	01500793          	li	a5,21
     70c:	04fb1a63          	bne	s6,a5,760 <play_music_with_controls+0x26c>
     710:	00000513          	li	a0,0
     714:	03205863          	blez	s2,744 <play_music_with_controls+0x250>
     718:	00141513          	slli	a0,s0,0x1
     71c:	00850533          	add	a0,a0,s0
     720:	00351513          	slli	a0,a0,0x3
     724:	00850533          	add	a0,a0,s0
     728:	00090593          	mv	a1,s2
     72c:	00251513          	slli	a0,a0,0x2
     730:	00002097          	auipc	ra,0x2
     734:	96c080e7          	jalr	-1684(ra) # 209c <__divsi3>
     738:	06400793          	li	a5,100
     73c:	00a7d463          	bge	a5,a0,744 <play_music_with_controls+0x250>
     740:	00078513          	mv	a0,a5
     744:	00012603          	lw	a2,0(sp)
     748:	00098593          	mv	a1,s3
     74c:	00000b13          	li	s6,0
     750:	00000097          	auipc	ra,0x0
     754:	b0c080e7          	jalr	-1268(ra) # 25c <update_player_ui>
     758:	00002097          	auipc	ra,0x2
     75c:	e94080e7          	jalr	-364(ra) # 25ec <display_refresh>
     760:	00812783          	lw	a5,8(sp)
     764:	0007aa03          	lw	s4,0(a5)
     768:	020a7793          	andi	a5,s4,32
     76c:	06078663          	beqz	a5,7d8 <play_music_with_controls+0x2e4>
     770:	ffffe7b7          	lui	a5,0xffffe
     774:	00f40433          	add	s0,s0,a5
     778:	fff44793          	not	a5,s0
     77c:	41f7d793          	srai	a5,a5,0x1f
     780:	00412503          	lw	a0,4(sp)
     784:	00f47433          	and	s0,s0,a5
     788:	00000613          	li	a2,0
     78c:	00040593          	mv	a1,s0
     790:	00002097          	auipc	ra,0x2
     794:	600080e7          	jalr	1536(ra) # 2d90 <fl_fseek>
     798:	00000513          	li	a0,0
     79c:	03205263          	blez	s2,7c0 <play_music_with_controls+0x2cc>
     7a0:	00141513          	slli	a0,s0,0x1
     7a4:	00850533          	add	a0,a0,s0
     7a8:	00351513          	slli	a0,a0,0x3
     7ac:	00850533          	add	a0,a0,s0
     7b0:	00090593          	mv	a1,s2
     7b4:	00251513          	slli	a0,a0,0x2
     7b8:	00002097          	auipc	ra,0x2
     7bc:	8e4080e7          	jalr	-1820(ra) # 209c <__divsi3>
     7c0:	00012603          	lw	a2,0(sp)
     7c4:	00098593          	mv	a1,s3
     7c8:	00000097          	auipc	ra,0x0
     7cc:	a94080e7          	jalr	-1388(ra) # 25c <update_player_ui>
     7d0:	00002097          	auipc	ra,0x2
     7d4:	e1c080e7          	jalr	-484(ra) # 25ec <display_refresh>
     7d8:	040a7793          	andi	a5,s4,64
     7dc:	06078263          	beqz	a5,840 <play_music_with_controls+0x34c>
     7e0:	000027b7          	lui	a5,0x2
     7e4:	00f40433          	add	s0,s0,a5
     7e8:	1f245863          	bge	s0,s2,9d8 <play_music_with_controls+0x4e4>
     7ec:	00412503          	lw	a0,4(sp)
     7f0:	00000613          	li	a2,0
     7f4:	00040593          	mv	a1,s0
     7f8:	00002097          	auipc	ra,0x2
     7fc:	598080e7          	jalr	1432(ra) # 2d90 <fl_fseek>
     800:	00000513          	li	a0,0
     804:	03205263          	blez	s2,828 <play_music_with_controls+0x334>
     808:	00141513          	slli	a0,s0,0x1
     80c:	00850533          	add	a0,a0,s0
     810:	00351513          	slli	a0,a0,0x3
     814:	00850533          	add	a0,a0,s0
     818:	00090593          	mv	a1,s2
     81c:	00251513          	slli	a0,a0,0x2
     820:	00002097          	auipc	ra,0x2
     824:	87c080e7          	jalr	-1924(ra) # 209c <__divsi3>
     828:	00012603          	lw	a2,0(sp)
     82c:	00098593          	mv	a1,s3
     830:	00000097          	auipc	ra,0x0
     834:	a2c080e7          	jalr	-1492(ra) # 25c <update_player_ui>
     838:	00002097          	auipc	ra,0x2
     83c:	db4080e7          	jalr	-588(ra) # 25ec <display_refresh>
     840:	fff4c493          	not	s1,s1
     844:	0144f4b3          	and	s1,s1,s4
     848:	0024f793          	andi	a5,s1,2
     84c:	0a078463          	beqz	a5,8f4 <play_music_with_controls+0x400>
     850:	00000097          	auipc	ra,0x0
     854:	90c080e7          	jalr	-1780(ra) # 15c <play_click_noise>
     858:	00000413          	li	s0,0
     85c:	00412503          	lw	a0,4(sp)
     860:	00005097          	auipc	ra,0x5
     864:	9c0080e7          	jalr	-1600(ra) # 5220 <fl_fclose>
     868:	00000097          	auipc	ra,0x0
     86c:	878080e7          	jalr	-1928(ra) # e0 <clear_audio>
     870:	000067b7          	lui	a5,0x6
     874:	d2c7a783          	lw	a5,-724(a5) # 5d2c <LEDS>
     878:	0007a023          	sw	zero,0(a5)
     87c:	d89ff06f          	j	604 <play_music_with_controls+0x110>
     880:	00412683          	lw	a3,4(sp)
     884:	20000613          	li	a2,512
     888:	00100593          	li	a1,1
     88c:	000b8513          	mv	a0,s7
     890:	00005097          	auipc	ra,0x5
     894:	a6c080e7          	jalr	-1428(ra) # 52fc <fl_fread>
     898:	1ff00793          	li	a5,511
     89c:	00050d93          	mv	s11,a0
     8a0:	00a7cc63          	blt	a5,a0,8b8 <play_music_with_controls+0x3c4>
     8a4:	00050793          	mv	a5,a0
     8a8:	00fb8733          	add	a4,s7,a5
     8ac:	00070023          	sb	zero,0(a4)
     8b0:	00178793          	addi	a5,a5,1
     8b4:	ff979ae3          	bne	a5,s9,8a8 <play_music_with_controls+0x3b4>
     8b8:	20000593          	li	a1,512
     8bc:	000b8513          	mv	a0,s7
     8c0:	00000097          	auipc	ra,0x0
     8c4:	b90080e7          	jalr	-1136(ra) # 450 <update_led_dance>
     8c8:	20000613          	li	a2,512
     8cc:	000b8593          	mv	a1,s7
     8d0:	000a0513          	mv	a0,s4
     8d4:	fffff097          	auipc	ra,0xfffff
     8d8:	7e8080e7          	jalr	2024(ra) # bc <memcpy_custom>
     8dc:	000d2783          	lw	a5,0(s10)
     8e0:	fefa0ee3          	beq	s4,a5,8dc <play_music_with_controls+0x3e8>
     8e4:	1ff00793          	li	a5,511
     8e8:	0fb7d863          	bge	a5,s11,9d8 <play_music_with_controls+0x4e4>
     8ec:	01b40433          	add	s0,s0,s11
     8f0:	e15ff06f          	j	704 <play_music_with_controls+0x210>
     8f4:	0084f793          	andi	a5,s1,8
     8f8:	0e079463          	bnez	a5,9e0 <play_music_with_controls+0x4ec>
     8fc:	0104f493          	andi	s1,s1,16
     900:	0c049c63          	bnez	s1,9d8 <play_music_with_controls+0x4e4>
     904:	004a7493          	andi	s1,s4,4
     908:	06048e63          	beqz	s1,984 <play_music_with_controls+0x490>
     90c:	001a8493          	addi	s1,s5,1
     910:	01e00793          	li	a5,30
     914:	04f49e63          	bne	s1,a5,970 <play_music_with_controls+0x47c>
     918:	00000097          	auipc	ra,0x0
     91c:	844080e7          	jalr	-1980(ra) # 15c <play_click_noise>
     920:	00412503          	lw	a0,4(sp)
     924:	00000613          	li	a2,0
     928:	00000593          	li	a1,0
     92c:	00002097          	auipc	ra,0x2
     930:	464080e7          	jalr	1124(ra) # 2d90 <fl_fseek>
     934:	00012603          	lw	a2,0(sp)
     938:	00000593          	li	a1,0
     93c:	00000513          	li	a0,0
     940:	00000097          	auipc	ra,0x0
     944:	91c080e7          	jalr	-1764(ra) # 25c <update_player_ui>
     948:	00002097          	auipc	ra,0x2
     94c:	ca4080e7          	jalr	-860(ra) # 25ec <display_refresh>
     950:	fffff097          	auipc	ra,0xfffff
     954:	790080e7          	jalr	1936(ra) # e0 <clear_audio>
     958:	d1cc2783          	lw	a5,-740(s8)
     95c:	0007a403          	lw	s0,0(a5)
     960:	00447413          	andi	s0,s0,4
     964:	00041c63          	bnez	s0,97c <play_music_with_controls+0x488>
     968:	00000493          	li	s1,0
     96c:	00000993          	li	s3,0
     970:	00048a93          	mv	s5,s1
     974:	000a0493          	mv	s1,s4
     978:	d61ff06f          	j	6d8 <play_music_with_controls+0x1e4>
     97c:	00000013          	nop
     980:	fddff06f          	j	95c <play_music_with_controls+0x468>
     984:	fffa8a93          	addi	s5,s5,-1
     988:	01c00793          	li	a5,28
     98c:	ff57e2e3          	bltu	a5,s5,970 <play_music_with_controls+0x47c>
     990:	0019c993          	xori	s3,s3,1
     994:	00000513          	li	a0,0
     998:	03205263          	blez	s2,9bc <play_music_with_controls+0x4c8>
     99c:	00141513          	slli	a0,s0,0x1
     9a0:	00850533          	add	a0,a0,s0
     9a4:	00351513          	slli	a0,a0,0x3
     9a8:	00850533          	add	a0,a0,s0
     9ac:	00090593          	mv	a1,s2
     9b0:	00251513          	slli	a0,a0,0x2
     9b4:	00001097          	auipc	ra,0x1
     9b8:	6e8080e7          	jalr	1768(ra) # 209c <__divsi3>
     9bc:	00012603          	lw	a2,0(sp)
     9c0:	00098593          	mv	a1,s3
     9c4:	00000097          	auipc	ra,0x0
     9c8:	898080e7          	jalr	-1896(ra) # 25c <update_player_ui>
     9cc:	00002097          	auipc	ra,0x2
     9d0:	c20080e7          	jalr	-992(ra) # 25ec <display_refresh>
     9d4:	f9dff06f          	j	970 <play_music_with_controls+0x47c>
     9d8:	00100413          	li	s0,1
     9dc:	e81ff06f          	j	85c <play_music_with_controls+0x368>
     9e0:	fff00413          	li	s0,-1
     9e4:	e79ff06f          	j	85c <play_music_with_controls+0x368>

000009e8 <view_image_file>:
     9e8:	000065b7          	lui	a1,0x6
     9ec:	ff010113          	addi	sp,sp,-16
     9f0:	d3058593          	addi	a1,a1,-720 # 5d30 <LEDS+0x4>
     9f4:	00112623          	sw	ra,12(sp)
     9f8:	00812423          	sw	s0,8(sp)
     9fc:	00005097          	auipc	ra,0x5
     a00:	f04080e7          	jalr	-252(ra) # 5900 <fl_fopen>
     a04:	0a050263          	beqz	a0,aa8 <view_image_file+0xc0>
     a08:	00050413          	mv	s0,a0
     a0c:	00002097          	auipc	ra,0x2
     a10:	a64080e7          	jalr	-1436(ra) # 2470 <display_framebuffer>
     a14:	00040693          	mv	a3,s0
     a18:	00004637          	lui	a2,0x4
     a1c:	00100593          	li	a1,1
     a20:	00005097          	auipc	ra,0x5
     a24:	8dc080e7          	jalr	-1828(ra) # 52fc <fl_fread>
     a28:	00040513          	mv	a0,s0
     a2c:	00004097          	auipc	ra,0x4
     a30:	7f4080e7          	jalr	2036(ra) # 5220 <fl_fclose>
     a34:	00002097          	auipc	ra,0x2
     a38:	bb8080e7          	jalr	-1096(ra) # 25ec <display_refresh>
     a3c:	000066b7          	lui	a3,0x6
     a40:	d1c6a783          	lw	a5,-740(a3) # 5d1c <BUTTONS>
     a44:	0007a703          	lw	a4,0(a5)
     a48:	000027b7          	lui	a5,0x2
     a4c:	71078793          	addi	a5,a5,1808 # 2710 <print_hex_digits+0x34>
     a50:	00000013          	nop
     a54:	fff78793          	addi	a5,a5,-1
     a58:	fe079ce3          	bnez	a5,a50 <view_image_file+0x68>
     a5c:	d1c6a683          	lw	a3,-740(a3)
     a60:	fff74793          	not	a5,a4
     a64:	0006a703          	lw	a4,0(a3)
     a68:	00e7f7b3          	and	a5,a5,a4
     a6c:	0067f793          	andi	a5,a5,6
     a70:	fe0788e3          	beqz	a5,a60 <view_image_file+0x78>
     a74:	fffff097          	auipc	ra,0xfffff
     a78:	6e8080e7          	jalr	1768(ra) # 15c <play_click_noise>
     a7c:	00002097          	auipc	ra,0x2
     a80:	9f4080e7          	jalr	-1548(ra) # 2470 <display_framebuffer>
     a84:	00004637          	lui	a2,0x4
     a88:	00000593          	li	a1,0
     a8c:	00001097          	auipc	ra,0x1
     a90:	6c4080e7          	jalr	1732(ra) # 2150 <memset>
     a94:	00812403          	lw	s0,8(sp)
     a98:	00c12083          	lw	ra,12(sp)
     a9c:	01010113          	addi	sp,sp,16
     aa0:	00002317          	auipc	t1,0x2
     aa4:	b4c30067          	jr	-1204(t1) # 25ec <display_refresh>
     aa8:	00c12083          	lw	ra,12(sp)
     aac:	00812403          	lw	s0,8(sp)
     ab0:	01010113          	addi	sp,sp,16
     ab4:	00008067          	ret

00000ab8 <scan_files>:
     ab8:	fd010113          	addi	sp,sp,-48
     abc:	02912223          	sw	s1,36(sp)
     ac0:	000064b7          	lui	s1,0x6
     ac4:	02812423          	sw	s0,40(sp)
     ac8:	00050593          	mv	a1,a0
     acc:	00006437          	lui	s0,0x6
     ad0:	0c048513          	addi	a0,s1,192 # 60c0 <current_path>
     ad4:	02112623          	sw	ra,44(sp)
     ad8:	03212023          	sw	s2,32(sp)
     adc:	01312e23          	sw	s3,28(sp)
     ae0:	01412c23          	sw	s4,24(sp)
     ae4:	01512a23          	sw	s5,20(sp)
     ae8:	01612823          	sw	s6,16(sp)
     aec:	01712623          	sw	s7,12(sp)
     af0:	2a042c23          	sw	zero,696(s0) # 62b8 <n_items>
     af4:	fffff097          	auipc	ra,0xfffff
     af8:	528080e7          	jalr	1320(ra) # 1c <strcmp>
     afc:	06050e63          	beqz	a0,b78 <scan_files+0xc0>
     b00:	00006937          	lui	s2,0x6
     b04:	06400613          	li	a2,100
     b08:	00000593          	li	a1,0
     b0c:	40490513          	addi	a0,s2,1028 # 6404 <files>
     b10:	00001097          	auipc	ra,0x1
     b14:	640080e7          	jalr	1600(ra) # 2150 <memset>
     b18:	2b842783          	lw	a5,696(s0)
     b1c:	40490913          	addi	s2,s2,1028
     b20:	000065b7          	lui	a1,0x6
     b24:	00379513          	slli	a0,a5,0x3
     b28:	40f50533          	sub	a0,a0,a5
     b2c:	00251513          	slli	a0,a0,0x2
     b30:	40f50533          	sub	a0,a0,a5
     b34:	00251513          	slli	a0,a0,0x2
     b38:	00a90533          	add	a0,s2,a0
     b3c:	d7858593          	addi	a1,a1,-648 # 5d78 <LEDS+0x4c>
     b40:	00001097          	auipc	ra,0x1
     b44:	6d4080e7          	jalr	1748(ra) # 2214 <strcpy>
     b48:	2b842703          	lw	a4,696(s0)
     b4c:	00371793          	slli	a5,a4,0x3
     b50:	40e787b3          	sub	a5,a5,a4
     b54:	00279793          	slli	a5,a5,0x2
     b58:	40e787b3          	sub	a5,a5,a4
     b5c:	00279793          	slli	a5,a5,0x2
     b60:	00f90933          	add	s2,s2,a5
     b64:	00100793          	li	a5,1
     b68:	00f70733          	add	a4,a4,a5
     b6c:	06092223          	sw	zero,100(s2)
     b70:	06f92423          	sw	a5,104(s2)
     b74:	2ae42c23          	sw	a4,696(s0)
     b78:	000069b7          	lui	s3,0x6
     b7c:	3f898593          	addi	a1,s3,1016 # 63f8 <dirstat.1>
     b80:	0c048513          	addi	a0,s1,192
     b84:	00003097          	auipc	ra,0x3
     b88:	71c080e7          	jalr	1820(ra) # 42a0 <fl_opendir>
     b8c:	14050063          	beqz	a0,ccc <scan_files+0x214>
     b90:	00006937          	lui	s2,0x6
     b94:	000067b7          	lui	a5,0x6
     b98:	000064b7          	lui	s1,0x6
     b9c:	d7c78b93          	addi	s7,a5,-644 # 5d7c <LEDS+0x50>
     ba0:	40448493          	addi	s1,s1,1028 # 6404 <files>
     ba4:	2e890a13          	addi	s4,s2,744 # 62e8 <dirent.0>
     ba8:	2e890593          	addi	a1,s2,744
     bac:	3f898513          	addi	a0,s3,1016
     bb0:	00004097          	auipc	ra,0x4
     bb4:	dbc080e7          	jalr	-580(ra) # 496c <fl_readdir>
     bb8:	00050a93          	mv	s5,a0
     bbc:	00051863          	bnez	a0,bcc <scan_files+0x114>
     bc0:	2b842b03          	lw	s6,696(s0)
     bc4:	03f00793          	li	a5,63
     bc8:	0367dc63          	bge	a5,s6,c00 <scan_files+0x148>
     bcc:	02812403          	lw	s0,40(sp)
     bd0:	02c12083          	lw	ra,44(sp)
     bd4:	02412483          	lw	s1,36(sp)
     bd8:	02012903          	lw	s2,32(sp)
     bdc:	01812a03          	lw	s4,24(sp)
     be0:	01412a83          	lw	s5,20(sp)
     be4:	01012b03          	lw	s6,16(sp)
     be8:	00c12b83          	lw	s7,12(sp)
     bec:	3f898513          	addi	a0,s3,1016
     bf0:	01c12983          	lw	s3,28(sp)
     bf4:	03010113          	addi	sp,sp,48
     bf8:	00002317          	auipc	t1,0x2
     bfc:	29030067          	jr	656(t1) # 2e88 <fl_closedir>
     c00:	000b8593          	mv	a1,s7
     c04:	2e890513          	addi	a0,s2,744
     c08:	fffff097          	auipc	ra,0xfffff
     c0c:	414080e7          	jalr	1044(ra) # 1c <strcmp>
     c10:	f8050ce3          	beqz	a0,ba8 <scan_files+0xf0>
     c14:	000065b7          	lui	a1,0x6
     c18:	d7858593          	addi	a1,a1,-648 # 5d78 <LEDS+0x4c>
     c1c:	2e890513          	addi	a0,s2,744
     c20:	fffff097          	auipc	ra,0xfffff
     c24:	3fc080e7          	jalr	1020(ra) # 1c <strcmp>
     c28:	f80500e3          	beqz	a0,ba8 <scan_files+0xf0>
     c2c:	003b1513          	slli	a0,s6,0x3
     c30:	41650533          	sub	a0,a0,s6
     c34:	00251513          	slli	a0,a0,0x2
     c38:	41650533          	sub	a0,a0,s6
     c3c:	00251513          	slli	a0,a0,0x2
     c40:	06400613          	li	a2,100
     c44:	00000593          	li	a1,0
     c48:	00a48533          	add	a0,s1,a0
     c4c:	00001097          	auipc	ra,0x1
     c50:	504080e7          	jalr	1284(ra) # 2150 <memset>
     c54:	2b842703          	lw	a4,696(s0)
     c58:	06300513          	li	a0,99
     c5c:	00371793          	slli	a5,a4,0x3
     c60:	40e786b3          	sub	a3,a5,a4
     c64:	00269693          	slli	a3,a3,0x2
     c68:	40e686b3          	sub	a3,a3,a4
     c6c:	00269693          	slli	a3,a3,0x2
     c70:	014a8633          	add	a2,s5,s4
     c74:	00064583          	lbu	a1,0(a2) # 4000 <fatfs_get_file_entry+0x40>
     c78:	00058463          	beqz	a1,c80 <scan_files+0x1c8>
     c7c:	02aa9e63          	bne	s5,a0,cb8 <scan_files+0x200>
     c80:	40e787b3          	sub	a5,a5,a4
     c84:	00279793          	slli	a5,a5,0x2
     c88:	10ca2683          	lw	a3,268(s4)
     c8c:	40e787b3          	sub	a5,a5,a4
     c90:	00279793          	slli	a5,a5,0x2
     c94:	00f487b3          	add	a5,s1,a5
     c98:	06d7a223          	sw	a3,100(a5)
     c9c:	104a4683          	lbu	a3,260(s4)
     ca0:	01578ab3          	add	s5,a5,s5
     ca4:	00170713          	addi	a4,a4,1
     ca8:	000a8023          	sb	zero,0(s5)
     cac:	06d7a423          	sw	a3,104(a5)
     cb0:	2ae42c23          	sw	a4,696(s0)
     cb4:	ef5ff06f          	j	ba8 <scan_files+0xf0>
     cb8:	00da8633          	add	a2,s5,a3
     cbc:	00c48633          	add	a2,s1,a2
     cc0:	00b60023          	sb	a1,0(a2)
     cc4:	001a8a93          	addi	s5,s5,1
     cc8:	fa9ff06f          	j	c70 <scan_files+0x1b8>
     ccc:	02c12083          	lw	ra,44(sp)
     cd0:	02812403          	lw	s0,40(sp)
     cd4:	02412483          	lw	s1,36(sp)
     cd8:	02012903          	lw	s2,32(sp)
     cdc:	01c12983          	lw	s3,28(sp)
     ce0:	01812a03          	lw	s4,24(sp)
     ce4:	01412a83          	lw	s5,20(sp)
     ce8:	01012b03          	lw	s6,16(sp)
     cec:	00c12b83          	lw	s7,12(sp)
     cf0:	03010113          	addi	sp,sp,48
     cf4:	00008067          	ret

00000cf8 <go_up_directory>:
     cf8:	ff010113          	addi	sp,sp,-16
     cfc:	00812423          	sw	s0,8(sp)
     d00:	00006437          	lui	s0,0x6
     d04:	00112623          	sw	ra,12(sp)
     d08:	00000793          	li	a5,0
     d0c:	0c040513          	addi	a0,s0,192 # 60c0 <current_path>
     d10:	00a78733          	add	a4,a5,a0
     d14:	00074683          	lbu	a3,0(a4)
     d18:	02069a63          	bnez	a3,d4c <go_up_directory+0x54>
     d1c:	00100693          	li	a3,1
     d20:	02f6da63          	bge	a3,a5,d54 <go_up_directory+0x5c>
     d24:	02f00593          	li	a1,47
     d28:	fe070fa3          	sb	zero,-1(a4)
     d2c:	fffff097          	auipc	ra,0xfffff
     d30:	314080e7          	jalr	788(ra) # 40 <strrchr>
     d34:	02050063          	beqz	a0,d54 <go_up_directory+0x5c>
     d38:	000500a3          	sb	zero,1(a0)
     d3c:	00c12083          	lw	ra,12(sp)
     d40:	00812403          	lw	s0,8(sp)
     d44:	01010113          	addi	sp,sp,16
     d48:	00008067          	ret
     d4c:	00178793          	addi	a5,a5,1
     d50:	fc1ff06f          	j	d10 <go_up_directory+0x18>
     d54:	0c040513          	addi	a0,s0,192
     d58:	00812403          	lw	s0,8(sp)
     d5c:	00c12083          	lw	ra,12(sp)
     d60:	000065b7          	lui	a1,0x6
     d64:	d8058593          	addi	a1,a1,-640 # 5d80 <LEDS+0x54>
     d68:	01010113          	addi	sp,sp,16
     d6c:	00001317          	auipc	t1,0x1
     d70:	4a830067          	jr	1192(t1) # 2214 <strcpy>

00000d74 <build_full_path>:
     d74:	ff010113          	addi	sp,sp,-16
     d78:	00912223          	sw	s1,4(sp)
     d7c:	00058493          	mv	s1,a1
     d80:	000065b7          	lui	a1,0x6
     d84:	0c058593          	addi	a1,a1,192 # 60c0 <current_path>
     d88:	00812423          	sw	s0,8(sp)
     d8c:	00112623          	sw	ra,12(sp)
     d90:	00050413          	mv	s0,a0
     d94:	00001097          	auipc	ra,0x1
     d98:	480080e7          	jalr	1152(ra) # 2214 <strcpy>
     d9c:	00044783          	lbu	a5,0(s0)
     da0:	02079263          	bnez	a5,dc4 <build_full_path+0x50>
     da4:	0004c783          	lbu	a5,0(s1)
     da8:	02079263          	bnez	a5,dcc <build_full_path+0x58>
     dac:	00040023          	sb	zero,0(s0)
     db0:	00c12083          	lw	ra,12(sp)
     db4:	00812403          	lw	s0,8(sp)
     db8:	00412483          	lw	s1,4(sp)
     dbc:	01010113          	addi	sp,sp,16
     dc0:	00008067          	ret
     dc4:	00140413          	addi	s0,s0,1
     dc8:	fd5ff06f          	j	d9c <build_full_path+0x28>
     dcc:	00140413          	addi	s0,s0,1
     dd0:	00148493          	addi	s1,s1,1
     dd4:	fef40fa3          	sb	a5,-1(s0)
     dd8:	fcdff06f          	j	da4 <build_full_path+0x30>

00000ddc <file_explorer>:
     ddc:	da010113          	addi	sp,sp,-608
     de0:	24912a23          	sw	s1,596(sp)
     de4:	25512223          	sw	s5,580(sp)
     de8:	000064b7          	lui	s1,0x6
     dec:	00006ab7          	lui	s5,0x6
     df0:	d80a8593          	addi	a1,s5,-640 # 5d80 <LEDS+0x54>
     df4:	0c048513          	addi	a0,s1,192 # 60c0 <current_path>
     df8:	24112e23          	sw	ra,604(sp)
     dfc:	24812c23          	sw	s0,600(sp)
     e00:	25212823          	sw	s2,592(sp)
     e04:	25312623          	sw	s3,588(sp)
     e08:	23812c23          	sw	s8,568(sp)
     e0c:	23a12823          	sw	s10,560(sp)
     e10:	25412423          	sw	s4,584(sp)
     e14:	25612023          	sw	s6,576(sp)
     e18:	23712e23          	sw	s7,572(sp)
     e1c:	23912a23          	sw	s9,564(sp)
     e20:	23b12623          	sw	s11,556(sp)
     e24:	00001097          	auipc	ra,0x1
     e28:	3f0080e7          	jalr	1008(ra) # 2214 <strcpy>
     e2c:	d80a8513          	addi	a0,s5,-640
     e30:	00000097          	auipc	ra,0x0
     e34:	c88080e7          	jalr	-888(ra) # ab8 <scan_files>
     e38:	000067b7          	lui	a5,0x6
     e3c:	d8478793          	addi	a5,a5,-636 # 5d84 <LEDS+0x58>
     e40:	00f12e23          	sw	a5,28(sp)
     e44:	0c048793          	addi	a5,s1,192
     e48:	00f12623          	sw	a5,12(sp)
     e4c:	000067b7          	lui	a5,0x6
     e50:	d1c7a783          	lw	a5,-740(a5) # 5d1c <BUTTONS>
     e54:	00000c13          	li	s8,0
     e58:	00000993          	li	s3,0
     e5c:	00000913          	li	s2,0
     e60:	00000413          	li	s0,0
     e64:	01200d13          	li	s10,18
     e68:	00f12823          	sw	a5,16(sp)
     e6c:	00000593          	li	a1,0
     e70:	00000513          	li	a0,0
     e74:	00001097          	auipc	ra,0x1
     e78:	608080e7          	jalr	1544(ra) # 247c <display_set_cursor>
     e7c:	0ffc7593          	zext.b	a1,s8
     e80:	07f58513          	addi	a0,a1,127
     e84:	0ff57513          	zext.b	a0,a0
     e88:	00001097          	auipc	ra,0x1
     e8c:	608080e7          	jalr	1544(ra) # 2490 <display_set_front_back_color>
     e90:	01c12503          	lw	a0,28(sp)
     e94:	00000493          	li	s1,0
     e98:	00006bb7          	lui	s7,0x6
     e9c:	00002097          	auipc	ra,0x2
     ea0:	8bc080e7          	jalr	-1860(ra) # 2758 <printf>
     ea4:	00c00a13          	li	s4,12
     ea8:	00c12783          	lw	a5,12(sp)
     eac:	00f487b3          	add	a5,s1,a5
     eb0:	0007c503          	lbu	a0,0(a5)
     eb4:	00050a63          	beqz	a0,ec8 <file_explorer+0xec>
     eb8:	2ccba783          	lw	a5,716(s7) # 62cc <f_putchar>
     ebc:	00148493          	addi	s1,s1,1
     ec0:	000780e7          	jalr	a5
     ec4:	ff4492e3          	bne	s1,s4,ea8 <file_explorer+0xcc>
     ec8:	2ccba783          	lw	a5,716(s7)
     ecc:	00a00513          	li	a0,10
     ed0:	00006db7          	lui	s11,0x6
     ed4:	000780e7          	jalr	a5
     ed8:	00000593          	li	a1,0
     edc:	0ff00513          	li	a0,255
     ee0:	00001097          	auipc	ra,0x1
     ee4:	5b0080e7          	jalr	1456(ra) # 2490 <display_set_front_back_color>
     ee8:	2b8daa03          	lw	s4,696(s11) # 62b8 <n_items>
     eec:	080a0463          	beqz	s4,f74 <file_explorer+0x198>
     ef0:	412a0a33          	sub	s4,s4,s2
     ef4:	00c00793          	li	a5,12
     ef8:	0147d463          	bge	a5,s4,f00 <file_explorer+0x124>
     efc:	00078a13          	mv	s4,a5
     f00:	00391493          	slli	s1,s2,0x3
     f04:	412484b3          	sub	s1,s1,s2
     f08:	00249493          	slli	s1,s1,0x2
     f0c:	412484b3          	sub	s1,s1,s2
     f10:	000067b7          	lui	a5,0x6
     f14:	40478793          	addi	a5,a5,1028 # 6404 <files>
     f18:	00249493          	slli	s1,s1,0x2
     f1c:	00f484b3          	add	s1,s1,a5
     f20:	000067b7          	lui	a5,0x6
     f24:	da078793          	addi	a5,a5,-608 # 5da0 <LEDS+0x74>
     f28:	00f12a23          	sw	a5,20(sp)
     f2c:	000067b7          	lui	a5,0x6
     f30:	d9878793          	addi	a5,a5,-616 # 5d98 <LEDS+0x6c>
     f34:	00000b13          	li	s6,0
     f38:	00f12c23          	sw	a5,24(sp)
     f3c:	194b4863          	blt	s6,s4,10cc <file_explorer+0x2f0>
     f40:	00000593          	li	a1,0
     f44:	00000513          	li	a0,0
     f48:	000064b7          	lui	s1,0x6
     f4c:	00001097          	auipc	ra,0x1
     f50:	544080e7          	jalr	1348(ra) # 2490 <display_set_front_back_color>
     f54:	00c00b13          	li	s6,12
     f58:	da848493          	addi	s1,s1,-600 # 5da8 <LEDS+0x7c>
     f5c:	036a0463          	beq	s4,s6,f84 <file_explorer+0x1a8>
     f60:	00048513          	mv	a0,s1
     f64:	00001097          	auipc	ra,0x1
     f68:	7f4080e7          	jalr	2036(ra) # 2758 <printf>
     f6c:	001a0a13          	addi	s4,s4,1
     f70:	fedff06f          	j	f5c <file_explorer+0x180>
     f74:	00006537          	lui	a0,0x6
     f78:	d9050513          	addi	a0,a0,-624 # 5d90 <LEDS+0x64>
     f7c:	00001097          	auipc	ra,0x1
     f80:	7dc080e7          	jalr	2012(ra) # 2758 <printf>
     f84:	00001097          	auipc	ra,0x1
     f88:	668080e7          	jalr	1640(ra) # 25ec <display_refresh>
     f8c:	01012783          	lw	a5,16(sp)
     f90:	fff9c993          	not	s3,s3
     f94:	0007aa03          	lw	s4,0(a5)
     f98:	0149f9b3          	and	s3,s3,s4
     f9c:	0109f793          	andi	a5,s3,16
     fa0:	00078863          	beqz	a5,fb0 <file_explorer+0x1d4>
     fa4:	00140413          	addi	s0,s0,1
     fa8:	fffff097          	auipc	ra,0xfffff
     fac:	1b4080e7          	jalr	436(ra) # 15c <play_click_noise>
     fb0:	0089f793          	andi	a5,s3,8
     fb4:	00078863          	beqz	a5,fc4 <file_explorer+0x1e8>
     fb8:	fff40413          	addi	s0,s0,-1
     fbc:	fffff097          	auipc	ra,0xfffff
     fc0:	1a0080e7          	jalr	416(ra) # 15c <play_click_noise>
     fc4:	0029f793          	andi	a5,s3,2
     fc8:	04078a63          	beqz	a5,101c <file_explorer+0x240>
     fcc:	fffff097          	auipc	ra,0xfffff
     fd0:	190080e7          	jalr	400(ra) # 15c <play_click_noise>
     fd4:	00c12503          	lw	a0,12(sp)
     fd8:	d80a8593          	addi	a1,s5,-640
     fdc:	fffff097          	auipc	ra,0xfffff
     fe0:	040080e7          	jalr	64(ra) # 1c <strcmp>
     fe4:	22050663          	beqz	a0,1210 <file_explorer+0x434>
     fe8:	00000097          	auipc	ra,0x0
     fec:	d10080e7          	jalr	-752(ra) # cf8 <go_up_directory>
     ff0:	d80a8513          	addi	a0,s5,-640
     ff4:	00000097          	auipc	ra,0x0
     ff8:	ac4080e7          	jalr	-1340(ra) # ab8 <scan_files>
     ffc:	00001097          	auipc	ra,0x1
    1000:	474080e7          	jalr	1140(ra) # 2470 <display_framebuffer>
    1004:	00004637          	lui	a2,0x4
    1008:	00000593          	li	a1,0
    100c:	00001097          	auipc	ra,0x1
    1010:	144080e7          	jalr	324(ra) # 2150 <memset>
    1014:	00000913          	li	s2,0
    1018:	00000413          	li	s0,0
    101c:	0049f993          	andi	s3,s3,4
    1020:	007c0c13          	addi	s8,s8,7
    1024:	08098063          	beqz	s3,10a4 <file_explorer+0x2c8>
    1028:	00341493          	slli	s1,s0,0x3
    102c:	408484b3          	sub	s1,s1,s0
    1030:	fffff097          	auipc	ra,0xfffff
    1034:	12c080e7          	jalr	300(ra) # 15c <play_click_noise>
    1038:	00249493          	slli	s1,s1,0x2
    103c:	408484b3          	sub	s1,s1,s0
    1040:	000067b7          	lui	a5,0x6
    1044:	40478793          	addi	a5,a5,1028 # 6404 <files>
    1048:	00249493          	slli	s1,s1,0x2
    104c:	00f484b3          	add	s1,s1,a5
    1050:	0684a783          	lw	a5,104(s1)
    1054:	14078263          	beqz	a5,1198 <file_explorer+0x3bc>
    1058:	000065b7          	lui	a1,0x6
    105c:	d7858593          	addi	a1,a1,-648 # 5d78 <LEDS+0x4c>
    1060:	00048513          	mv	a0,s1
    1064:	fffff097          	auipc	ra,0xfffff
    1068:	fb8080e7          	jalr	-72(ra) # 1c <strcmp>
    106c:	10051a63          	bnez	a0,1180 <file_explorer+0x3a4>
    1070:	00000097          	auipc	ra,0x0
    1074:	c88080e7          	jalr	-888(ra) # cf8 <go_up_directory>
    1078:	d80a8513          	addi	a0,s5,-640
    107c:	00000097          	auipc	ra,0x0
    1080:	a3c080e7          	jalr	-1476(ra) # ab8 <scan_files>
    1084:	00001097          	auipc	ra,0x1
    1088:	3ec080e7          	jalr	1004(ra) # 2470 <display_framebuffer>
    108c:	00004637          	lui	a2,0x4
    1090:	00000593          	li	a1,0
    1094:	00001097          	auipc	ra,0x1
    1098:	0bc080e7          	jalr	188(ra) # 2150 <memset>
    109c:	00000913          	li	s2,0
    10a0:	00000413          	li	s0,0
    10a4:	2b8da783          	lw	a5,696(s11)
    10a8:	00f05e63          	blez	a5,10c4 <file_explorer+0x2e8>
    10ac:	14045663          	bgez	s0,11f8 <file_explorer+0x41c>
    10b0:	fff78413          	addi	s0,a5,-1
    10b4:	15244a63          	blt	s0,s2,1208 <file_explorer+0x42c>
    10b8:	00b90793          	addi	a5,s2,11
    10bc:	0087d463          	bge	a5,s0,10c4 <file_explorer+0x2e8>
    10c0:	ff540913          	addi	s2,s0,-11
    10c4:	000a0993          	mv	s3,s4
    10c8:	da5ff06f          	j	e6c <file_explorer+0x90>
    10cc:	012b0cb3          	add	s9,s6,s2
    10d0:	07941463          	bne	s0,s9,1138 <file_explorer+0x35c>
    10d4:	0ff00593          	li	a1,255
    10d8:	00000513          	li	a0,0
    10dc:	00001097          	auipc	ra,0x1
    10e0:	3b4080e7          	jalr	948(ra) # 2490 <display_set_front_back_color>
    10e4:	0684a783          	lw	a5,104(s1)
    10e8:	000c8593          	mv	a1,s9
    10ec:	04078c63          	beqz	a5,1144 <file_explorer+0x368>
    10f0:	01812503          	lw	a0,24(sp)
    10f4:	00001097          	auipc	ra,0x1
    10f8:	664080e7          	jalr	1636(ra) # 2758 <printf>
    10fc:	00000c93          	li	s9,0
    1100:	019487b3          	add	a5,s1,s9
    1104:	0007c503          	lbu	a0,0(a5)
    1108:	00050a63          	beqz	a0,111c <file_explorer+0x340>
    110c:	2ccba783          	lw	a5,716(s7)
    1110:	001c8c93          	addi	s9,s9,1
    1114:	000780e7          	jalr	a5
    1118:	ffac94e3          	bne	s9,s10,1100 <file_explorer+0x324>
    111c:	2ccba783          	lw	a5,716(s7)
    1120:	03ac9663          	bne	s9,s10,114c <file_explorer+0x370>
    1124:	00a00513          	li	a0,10
    1128:	000780e7          	jalr	a5
    112c:	001b0b13          	addi	s6,s6,1
    1130:	06c48493          	addi	s1,s1,108
    1134:	e09ff06f          	j	f3c <file_explorer+0x160>
    1138:	00000593          	li	a1,0
    113c:	0ff00513          	li	a0,255
    1140:	f9dff06f          	j	10dc <file_explorer+0x300>
    1144:	01412503          	lw	a0,20(sp)
    1148:	fadff06f          	j	10f4 <file_explorer+0x318>
    114c:	02000513          	li	a0,32
    1150:	000780e7          	jalr	a5
    1154:	001c8c93          	addi	s9,s9,1
    1158:	fc5ff06f          	j	111c <file_explorer+0x340>
    115c:	00178793          	addi	a5,a5,1
    1160:	0007c703          	lbu	a4,0(a5)
    1164:	fe071ce3          	bnez	a4,115c <file_explorer+0x380>
    1168:	0004c703          	lbu	a4,0(s1)
    116c:	00071e63          	bnez	a4,1188 <file_explorer+0x3ac>
    1170:	02f00713          	li	a4,47
    1174:	00e78023          	sb	a4,0(a5)
    1178:	000780a3          	sb	zero,1(a5)
    117c:	efdff06f          	j	1078 <file_explorer+0x29c>
    1180:	00c12783          	lw	a5,12(sp)
    1184:	fddff06f          	j	1160 <file_explorer+0x384>
    1188:	00178793          	addi	a5,a5,1
    118c:	00148493          	addi	s1,s1,1
    1190:	fee78fa3          	sb	a4,-1(a5)
    1194:	fd5ff06f          	j	1168 <file_explorer+0x38c>
    1198:	00048593          	mv	a1,s1
    119c:	02c10513          	addi	a0,sp,44
    11a0:	00000097          	auipc	ra,0x0
    11a4:	bd4080e7          	jalr	-1068(ra) # d74 <build_full_path>
    11a8:	0644a603          	lw	a2,100(s1)
    11ac:	000047b7          	lui	a5,0x4
    11b0:	02f61a63          	bne	a2,a5,11e4 <file_explorer+0x408>
    11b4:	02c10513          	addi	a0,sp,44
    11b8:	00000097          	auipc	ra,0x0
    11bc:	830080e7          	jalr	-2000(ra) # 9e8 <view_image_file>
    11c0:	00001097          	auipc	ra,0x1
    11c4:	2b0080e7          	jalr	688(ra) # 2470 <display_framebuffer>
    11c8:	00004637          	lui	a2,0x4
    11cc:	00000593          	li	a1,0
    11d0:	00001097          	auipc	ra,0x1
    11d4:	f80080e7          	jalr	-128(ra) # 2150 <memset>
    11d8:	01012783          	lw	a5,16(sp)
    11dc:	0007a783          	lw	a5,0(a5) # 4000 <fatfs_get_file_entry+0x40>
    11e0:	ec5ff06f          	j	10a4 <file_explorer+0x2c8>
    11e4:	00048593          	mv	a1,s1
    11e8:	02c10513          	addi	a0,sp,44
    11ec:	fffff097          	auipc	ra,0xfffff
    11f0:	308080e7          	jalr	776(ra) # 4f4 <play_music_with_controls>
    11f4:	fcdff06f          	j	11c0 <file_explorer+0x3e4>
    11f8:	00f427b3          	slt	a5,s0,a5
    11fc:	40f007b3          	neg	a5,a5
    1200:	00f47433          	and	s0,s0,a5
    1204:	eb1ff06f          	j	10b4 <file_explorer+0x2d8>
    1208:	00040913          	mv	s2,s0
    120c:	eb9ff06f          	j	10c4 <file_explorer+0x2e8>
    1210:	25c12083          	lw	ra,604(sp)
    1214:	25812403          	lw	s0,600(sp)
    1218:	25412483          	lw	s1,596(sp)
    121c:	25012903          	lw	s2,592(sp)
    1220:	24c12983          	lw	s3,588(sp)
    1224:	24812a03          	lw	s4,584(sp)
    1228:	24412a83          	lw	s5,580(sp)
    122c:	24012b03          	lw	s6,576(sp)
    1230:	23c12b83          	lw	s7,572(sp)
    1234:	23812c03          	lw	s8,568(sp)
    1238:	23412c83          	lw	s9,564(sp)
    123c:	23012d03          	lw	s10,560(sp)
    1240:	22c12d83          	lw	s11,556(sp)
    1244:	26010113          	addi	sp,sp,608
    1248:	00008067          	ret

0000124c <music_player>:
    124c:	da010113          	addi	sp,sp,-608
    1250:	24912a23          	sw	s1,596(sp)
    1254:	25512223          	sw	s5,580(sp)
    1258:	000064b7          	lui	s1,0x6
    125c:	00006ab7          	lui	s5,0x6
    1260:	dc0a8593          	addi	a1,s5,-576 # 5dc0 <LEDS+0x94>
    1264:	0c048513          	addi	a0,s1,192 # 60c0 <current_path>
    1268:	24112e23          	sw	ra,604(sp)
    126c:	24812c23          	sw	s0,600(sp)
    1270:	25212823          	sw	s2,592(sp)
    1274:	25312623          	sw	s3,588(sp)
    1278:	23912a23          	sw	s9,564(sp)
    127c:	23b12623          	sw	s11,556(sp)
    1280:	25412423          	sw	s4,584(sp)
    1284:	25612023          	sw	s6,576(sp)
    1288:	23712e23          	sw	s7,572(sp)
    128c:	23812c23          	sw	s8,568(sp)
    1290:	23a12823          	sw	s10,560(sp)
    1294:	00001097          	auipc	ra,0x1
    1298:	f80080e7          	jalr	-128(ra) # 2214 <strcpy>
    129c:	dc0a8513          	addi	a0,s5,-576
    12a0:	00000097          	auipc	ra,0x0
    12a4:	818080e7          	jalr	-2024(ra) # ab8 <scan_files>
    12a8:	000067b7          	lui	a5,0x6
    12ac:	dcc78793          	addi	a5,a5,-564 # 5dcc <LEDS+0xa0>
    12b0:	00f12e23          	sw	a5,28(sp)
    12b4:	0c048793          	addi	a5,s1,192
    12b8:	00f12623          	sw	a5,12(sp)
    12bc:	000067b7          	lui	a5,0x6
    12c0:	d1c7a783          	lw	a5,-740(a5) # 5d1c <BUTTONS>
    12c4:	00000c93          	li	s9,0
    12c8:	00000993          	li	s3,0
    12cc:	00000913          	li	s2,0
    12d0:	00000413          	li	s0,0
    12d4:	01200d93          	li	s11,18
    12d8:	00f12823          	sw	a5,16(sp)
    12dc:	00000593          	li	a1,0
    12e0:	00000513          	li	a0,0
    12e4:	00001097          	auipc	ra,0x1
    12e8:	198080e7          	jalr	408(ra) # 247c <display_set_cursor>
    12ec:	0ffcf593          	zext.b	a1,s9
    12f0:	07f58513          	addi	a0,a1,127
    12f4:	0ff57513          	zext.b	a0,a0
    12f8:	00001097          	auipc	ra,0x1
    12fc:	198080e7          	jalr	408(ra) # 2490 <display_set_front_back_color>
    1300:	01c12503          	lw	a0,28(sp)
    1304:	00000493          	li	s1,0
    1308:	00006c37          	lui	s8,0x6
    130c:	00001097          	auipc	ra,0x1
    1310:	44c080e7          	jalr	1100(ra) # 2758 <printf>
    1314:	00c00a13          	li	s4,12
    1318:	00c12783          	lw	a5,12(sp)
    131c:	00f487b3          	add	a5,s1,a5
    1320:	0007c503          	lbu	a0,0(a5)
    1324:	00050a63          	beqz	a0,1338 <music_player+0xec>
    1328:	2ccc2783          	lw	a5,716(s8) # 62cc <f_putchar>
    132c:	00148493          	addi	s1,s1,1
    1330:	000780e7          	jalr	a5
    1334:	ff4492e3          	bne	s1,s4,1318 <music_player+0xcc>
    1338:	2ccc2783          	lw	a5,716(s8)
    133c:	00a00513          	li	a0,10
    1340:	00006b37          	lui	s6,0x6
    1344:	000780e7          	jalr	a5
    1348:	00000593          	li	a1,0
    134c:	0ff00513          	li	a0,255
    1350:	00001097          	auipc	ra,0x1
    1354:	140080e7          	jalr	320(ra) # 2490 <display_set_front_back_color>
    1358:	2b8b2a03          	lw	s4,696(s6) # 62b8 <n_items>
    135c:	080a0463          	beqz	s4,13e4 <music_player+0x198>
    1360:	412a0a33          	sub	s4,s4,s2
    1364:	00c00793          	li	a5,12
    1368:	0147d463          	bge	a5,s4,1370 <music_player+0x124>
    136c:	00078a13          	mv	s4,a5
    1370:	00391493          	slli	s1,s2,0x3
    1374:	412484b3          	sub	s1,s1,s2
    1378:	00249493          	slli	s1,s1,0x2
    137c:	412484b3          	sub	s1,s1,s2
    1380:	000067b7          	lui	a5,0x6
    1384:	40478793          	addi	a5,a5,1028 # 6404 <files>
    1388:	00249493          	slli	s1,s1,0x2
    138c:	00f484b3          	add	s1,s1,a5
    1390:	000067b7          	lui	a5,0x6
    1394:	da078793          	addi	a5,a5,-608 # 5da0 <LEDS+0x74>
    1398:	00f12a23          	sw	a5,20(sp)
    139c:	000067b7          	lui	a5,0x6
    13a0:	d9878793          	addi	a5,a5,-616 # 5d98 <LEDS+0x6c>
    13a4:	00000b93          	li	s7,0
    13a8:	00f12c23          	sw	a5,24(sp)
    13ac:	1d4bce63          	blt	s7,s4,1588 <music_player+0x33c>
    13b0:	00000593          	li	a1,0
    13b4:	00000513          	li	a0,0
    13b8:	000064b7          	lui	s1,0x6
    13bc:	00001097          	auipc	ra,0x1
    13c0:	0d4080e7          	jalr	212(ra) # 2490 <display_set_front_back_color>
    13c4:	00c00b93          	li	s7,12
    13c8:	da848493          	addi	s1,s1,-600 # 5da8 <LEDS+0x7c>
    13cc:	037a0463          	beq	s4,s7,13f4 <music_player+0x1a8>
    13d0:	00048513          	mv	a0,s1
    13d4:	00001097          	auipc	ra,0x1
    13d8:	384080e7          	jalr	900(ra) # 2758 <printf>
    13dc:	001a0a13          	addi	s4,s4,1
    13e0:	fedff06f          	j	13cc <music_player+0x180>
    13e4:	00006537          	lui	a0,0x6
    13e8:	d9050513          	addi	a0,a0,-624 # 5d90 <LEDS+0x64>
    13ec:	00001097          	auipc	ra,0x1
    13f0:	36c080e7          	jalr	876(ra) # 2758 <printf>
    13f4:	00001097          	auipc	ra,0x1
    13f8:	1f8080e7          	jalr	504(ra) # 25ec <display_refresh>
    13fc:	01012783          	lw	a5,16(sp)
    1400:	fff9c993          	not	s3,s3
    1404:	0007a483          	lw	s1,0(a5)
    1408:	0099f9b3          	and	s3,s3,s1
    140c:	0109f793          	andi	a5,s3,16
    1410:	00078863          	beqz	a5,1420 <music_player+0x1d4>
    1414:	00140413          	addi	s0,s0,1
    1418:	fffff097          	auipc	ra,0xfffff
    141c:	d44080e7          	jalr	-700(ra) # 15c <play_click_noise>
    1420:	0089f793          	andi	a5,s3,8
    1424:	00078863          	beqz	a5,1434 <music_player+0x1e8>
    1428:	fff40413          	addi	s0,s0,-1
    142c:	fffff097          	auipc	ra,0xfffff
    1430:	d30080e7          	jalr	-720(ra) # 15c <play_click_noise>
    1434:	0029f793          	andi	a5,s3,2
    1438:	06078c63          	beqz	a5,14b0 <music_player+0x264>
    143c:	fffff097          	auipc	ra,0xfffff
    1440:	d20080e7          	jalr	-736(ra) # 15c <play_click_noise>
    1444:	00c12503          	lw	a0,12(sp)
    1448:	dc0a8593          	addi	a1,s5,-576
    144c:	fffff097          	auipc	ra,0xfffff
    1450:	bd0080e7          	jalr	-1072(ra) # 1c <strcmp>
    1454:	2c050a63          	beqz	a0,1728 <music_player+0x4dc>
    1458:	00000097          	auipc	ra,0x0
    145c:	8a0080e7          	jalr	-1888(ra) # cf8 <go_up_directory>
    1460:	00c12503          	lw	a0,12(sp)
    1464:	dc0a8593          	addi	a1,s5,-576
    1468:	fffff097          	auipc	ra,0xfffff
    146c:	bfc080e7          	jalr	-1028(ra) # 64 <starts_with>
    1470:	00051a63          	bnez	a0,1484 <music_player+0x238>
    1474:	00c12503          	lw	a0,12(sp)
    1478:	dc0a8593          	addi	a1,s5,-576
    147c:	00001097          	auipc	ra,0x1
    1480:	d98080e7          	jalr	-616(ra) # 2214 <strcpy>
    1484:	00c12503          	lw	a0,12(sp)
    1488:	00000913          	li	s2,0
    148c:	00000413          	li	s0,0
    1490:	fffff097          	auipc	ra,0xfffff
    1494:	628080e7          	jalr	1576(ra) # ab8 <scan_files>
    1498:	00001097          	auipc	ra,0x1
    149c:	fd8080e7          	jalr	-40(ra) # 2470 <display_framebuffer>
    14a0:	00004637          	lui	a2,0x4
    14a4:	00000593          	li	a1,0
    14a8:	00001097          	auipc	ra,0x1
    14ac:	ca8080e7          	jalr	-856(ra) # 2150 <memset>
    14b0:	0049f993          	andi	s3,s3,4
    14b4:	007c8c93          	addi	s9,s9,7
    14b8:	0a098463          	beqz	s3,1560 <music_player+0x314>
    14bc:	fffff097          	auipc	ra,0xfffff
    14c0:	ca0080e7          	jalr	-864(ra) # 15c <play_click_noise>
    14c4:	00341793          	slli	a5,s0,0x3
    14c8:	408787b3          	sub	a5,a5,s0
    14cc:	00279793          	slli	a5,a5,0x2
    14d0:	00006a37          	lui	s4,0x6
    14d4:	408787b3          	sub	a5,a5,s0
    14d8:	404a0a13          	addi	s4,s4,1028 # 6404 <files>
    14dc:	00279793          	slli	a5,a5,0x2
    14e0:	00fa07b3          	add	a5,s4,a5
    14e4:	0687a703          	lw	a4,104(a5)
    14e8:	16070663          	beqz	a4,1654 <music_player+0x408>
    14ec:	000065b7          	lui	a1,0x6
    14f0:	d7858593          	addi	a1,a1,-648 # 5d78 <LEDS+0x4c>
    14f4:	00078513          	mv	a0,a5
    14f8:	00078413          	mv	s0,a5
    14fc:	fffff097          	auipc	ra,0xfffff
    1500:	b20080e7          	jalr	-1248(ra) # 1c <strcmp>
    1504:	12051c63          	bnez	a0,163c <music_player+0x3f0>
    1508:	fffff097          	auipc	ra,0xfffff
    150c:	7f0080e7          	jalr	2032(ra) # cf8 <go_up_directory>
    1510:	00c12503          	lw	a0,12(sp)
    1514:	dc0a8593          	addi	a1,s5,-576
    1518:	fffff097          	auipc	ra,0xfffff
    151c:	b4c080e7          	jalr	-1204(ra) # 64 <starts_with>
    1520:	00051a63          	bnez	a0,1534 <music_player+0x2e8>
    1524:	00c12503          	lw	a0,12(sp)
    1528:	dc0a8593          	addi	a1,s5,-576
    152c:	00001097          	auipc	ra,0x1
    1530:	ce8080e7          	jalr	-792(ra) # 2214 <strcpy>
    1534:	00c12503          	lw	a0,12(sp)
    1538:	00000913          	li	s2,0
    153c:	00000413          	li	s0,0
    1540:	fffff097          	auipc	ra,0xfffff
    1544:	578080e7          	jalr	1400(ra) # ab8 <scan_files>
    1548:	00001097          	auipc	ra,0x1
    154c:	f28080e7          	jalr	-216(ra) # 2470 <display_framebuffer>
    1550:	00004637          	lui	a2,0x4
    1554:	00000593          	li	a1,0
    1558:	00001097          	auipc	ra,0x1
    155c:	bf8080e7          	jalr	-1032(ra) # 2150 <memset>
    1560:	2b8b2783          	lw	a5,696(s6)
    1564:	00f05e63          	blez	a5,1580 <music_player+0x334>
    1568:	1a045463          	bgez	s0,1710 <music_player+0x4c4>
    156c:	fff78413          	addi	s0,a5,-1
    1570:	1b244863          	blt	s0,s2,1720 <music_player+0x4d4>
    1574:	00b90793          	addi	a5,s2,11
    1578:	0087d463          	bge	a5,s0,1580 <music_player+0x334>
    157c:	ff540913          	addi	s2,s0,-11
    1580:	00048993          	mv	s3,s1
    1584:	d59ff06f          	j	12dc <music_player+0x90>
    1588:	012b8d33          	add	s10,s7,s2
    158c:	07a41463          	bne	s0,s10,15f4 <music_player+0x3a8>
    1590:	0ff00593          	li	a1,255
    1594:	00000513          	li	a0,0
    1598:	00001097          	auipc	ra,0x1
    159c:	ef8080e7          	jalr	-264(ra) # 2490 <display_set_front_back_color>
    15a0:	0684a783          	lw	a5,104(s1)
    15a4:	000d0593          	mv	a1,s10
    15a8:	04078c63          	beqz	a5,1600 <music_player+0x3b4>
    15ac:	01812503          	lw	a0,24(sp)
    15b0:	00001097          	auipc	ra,0x1
    15b4:	1a8080e7          	jalr	424(ra) # 2758 <printf>
    15b8:	00000d13          	li	s10,0
    15bc:	01a487b3          	add	a5,s1,s10
    15c0:	0007c503          	lbu	a0,0(a5)
    15c4:	00050a63          	beqz	a0,15d8 <music_player+0x38c>
    15c8:	2ccc2783          	lw	a5,716(s8)
    15cc:	001d0d13          	addi	s10,s10,1
    15d0:	000780e7          	jalr	a5
    15d4:	ffbd14e3          	bne	s10,s11,15bc <music_player+0x370>
    15d8:	2ccc2783          	lw	a5,716(s8)
    15dc:	03bd1663          	bne	s10,s11,1608 <music_player+0x3bc>
    15e0:	00a00513          	li	a0,10
    15e4:	000780e7          	jalr	a5
    15e8:	001b8b93          	addi	s7,s7,1
    15ec:	06c48493          	addi	s1,s1,108
    15f0:	dbdff06f          	j	13ac <music_player+0x160>
    15f4:	00000593          	li	a1,0
    15f8:	0ff00513          	li	a0,255
    15fc:	f9dff06f          	j	1598 <music_player+0x34c>
    1600:	01412503          	lw	a0,20(sp)
    1604:	fadff06f          	j	15b0 <music_player+0x364>
    1608:	02000513          	li	a0,32
    160c:	000780e7          	jalr	a5
    1610:	001d0d13          	addi	s10,s10,1
    1614:	fc5ff06f          	j	15d8 <music_player+0x38c>
    1618:	00178793          	addi	a5,a5,1
    161c:	0007c703          	lbu	a4,0(a5)
    1620:	fe071ce3          	bnez	a4,1618 <music_player+0x3cc>
    1624:	00044703          	lbu	a4,0(s0)
    1628:	00071e63          	bnez	a4,1644 <music_player+0x3f8>
    162c:	02f00713          	li	a4,47
    1630:	00e78023          	sb	a4,0(a5)
    1634:	000780a3          	sb	zero,1(a5)
    1638:	efdff06f          	j	1534 <music_player+0x2e8>
    163c:	00c12783          	lw	a5,12(sp)
    1640:	fddff06f          	j	161c <music_player+0x3d0>
    1644:	00178793          	addi	a5,a5,1
    1648:	00140413          	addi	s0,s0,1
    164c:	fee78fa3          	sb	a4,-1(a5)
    1650:	fd5ff06f          	j	1624 <music_player+0x3d8>
    1654:	00040993          	mv	s3,s0
    1658:	00399593          	slli	a1,s3,0x3
    165c:	413585b3          	sub	a1,a1,s3
    1660:	00259593          	slli	a1,a1,0x2
    1664:	413585b3          	sub	a1,a1,s3
    1668:	00259593          	slli	a1,a1,0x2
    166c:	00ba05b3          	add	a1,s4,a1
    1670:	0685ab83          	lw	s7,104(a1)
    1674:	040b8063          	beqz	s7,16b4 <music_player+0x468>
    1678:	2b8b2783          	lw	a5,696(s6)
    167c:	00198993          	addi	s3,s3,1
    1680:	00f9a7b3          	slt	a5,s3,a5
    1684:	40f007b3          	neg	a5,a5
    1688:	00f9f9b3          	and	s3,s3,a5
    168c:	fd3416e3          	bne	s0,s3,1658 <music_player+0x40c>
    1690:	00001097          	auipc	ra,0x1
    1694:	de0080e7          	jalr	-544(ra) # 2470 <display_framebuffer>
    1698:	00004637          	lui	a2,0x4
    169c:	00000593          	li	a1,0
    16a0:	00001097          	auipc	ra,0x1
    16a4:	ab0080e7          	jalr	-1360(ra) # 2150 <memset>
    16a8:	01012783          	lw	a5,16(sp)
    16ac:	0007a783          	lw	a5,0(a5)
    16b0:	eb1ff06f          	j	1560 <music_player+0x314>
    16b4:	02c10513          	addi	a0,sp,44
    16b8:	00b12a23          	sw	a1,20(sp)
    16bc:	fffff097          	auipc	ra,0xfffff
    16c0:	6b8080e7          	jalr	1720(ra) # d74 <build_full_path>
    16c4:	01412583          	lw	a1,20(sp)
    16c8:	02c10513          	addi	a0,sp,44
    16cc:	0645a603          	lw	a2,100(a1)
    16d0:	fffff097          	auipc	ra,0xfffff
    16d4:	e24080e7          	jalr	-476(ra) # 4f4 <play_music_with_controls>
    16d8:	fa050ce3          	beqz	a0,1690 <music_player+0x444>
    16dc:	00100793          	li	a5,1
    16e0:	00f51e63          	bne	a0,a5,16fc <music_player+0x4b0>
    16e4:	2b8b2783          	lw	a5,696(s6)
    16e8:	00a989b3          	add	s3,s3,a0
    16ec:	00f9d463          	bge	s3,a5,16f4 <music_player+0x4a8>
    16f0:	00098b93          	mv	s7,s3
    16f4:	000b8993          	mv	s3,s7
    16f8:	f61ff06f          	j	1658 <music_player+0x40c>
    16fc:	fff98b93          	addi	s7,s3,-1
    1700:	fe0bdae3          	bgez	s7,16f4 <music_player+0x4a8>
    1704:	2b8b2b83          	lw	s7,696(s6)
    1708:	fffb8b93          	addi	s7,s7,-1
    170c:	fe9ff06f          	j	16f4 <music_player+0x4a8>
    1710:	00f427b3          	slt	a5,s0,a5
    1714:	40f007b3          	neg	a5,a5
    1718:	00f47433          	and	s0,s0,a5
    171c:	e55ff06f          	j	1570 <music_player+0x324>
    1720:	00040913          	mv	s2,s0
    1724:	e5dff06f          	j	1580 <music_player+0x334>
    1728:	25c12083          	lw	ra,604(sp)
    172c:	25812403          	lw	s0,600(sp)
    1730:	25412483          	lw	s1,596(sp)
    1734:	25012903          	lw	s2,592(sp)
    1738:	24c12983          	lw	s3,588(sp)
    173c:	24812a03          	lw	s4,584(sp)
    1740:	24412a83          	lw	s5,580(sp)
    1744:	24012b03          	lw	s6,576(sp)
    1748:	23c12b83          	lw	s7,572(sp)
    174c:	23812c03          	lw	s8,568(sp)
    1750:	23412c83          	lw	s9,564(sp)
    1754:	23012d03          	lw	s10,560(sp)
    1758:	22c12d83          	lw	s11,556(sp)
    175c:	26010113          	addi	sp,sp,608
    1760:	00008067          	ret

00001764 <not_implemented>:
    1764:	ff010113          	addi	sp,sp,-16
    1768:	00812423          	sw	s0,8(sp)
    176c:	00050413          	mv	s0,a0
    1770:	00000513          	li	a0,0
    1774:	00112623          	sw	ra,12(sp)
    1778:	00001097          	auipc	ra,0x1
    177c:	c7c080e7          	jalr	-900(ra) # 23f4 <oled_clear>
    1780:	02800593          	li	a1,40
    1784:	00000513          	li	a0,0
    1788:	00001097          	auipc	ra,0x1
    178c:	cf4080e7          	jalr	-780(ra) # 247c <display_set_cursor>
    1790:	00006537          	lui	a0,0x6
    1794:	00040593          	mv	a1,s0
    1798:	dd850513          	addi	a0,a0,-552 # 5dd8 <LEDS+0xac>
    179c:	00001097          	auipc	ra,0x1
    17a0:	fbc080e7          	jalr	-68(ra) # 2758 <printf>
    17a4:	03c00593          	li	a1,60
    17a8:	00000513          	li	a0,0
    17ac:	00001097          	auipc	ra,0x1
    17b0:	cd0080e7          	jalr	-816(ra) # 247c <display_set_cursor>
    17b4:	00006537          	lui	a0,0x6
    17b8:	de050513          	addi	a0,a0,-544 # 5de0 <LEDS+0xb4>
    17bc:	00001097          	auipc	ra,0x1
    17c0:	f9c080e7          	jalr	-100(ra) # 2758 <printf>
    17c4:	00001097          	auipc	ra,0x1
    17c8:	e28080e7          	jalr	-472(ra) # 25ec <display_refresh>
    17cc:	000067b7          	lui	a5,0x6
    17d0:	d1c7a783          	lw	a5,-740(a5) # 5d1c <BUTTONS>
    17d4:	0007a703          	lw	a4,0(a5)
    17d8:	fe070ee3          	beqz	a4,17d4 <not_implemented+0x70>
    17dc:	0007a703          	lw	a4,0(a5)
    17e0:	fe071ee3          	bnez	a4,17dc <not_implemented+0x78>
    17e4:	00812403          	lw	s0,8(sp)
    17e8:	00c12083          	lw	ra,12(sp)
    17ec:	01010113          	addi	sp,sp,16
    17f0:	fffff317          	auipc	t1,0xfffff
    17f4:	96c30067          	jr	-1684(t1) # 15c <play_click_noise>

000017f8 <main_menu>:
    17f8:	000067b7          	lui	a5,0x6
    17fc:	fc010113          	addi	sp,sp,-64
    1800:	df078793          	addi	a5,a5,-528 # 5df0 <LEDS+0xc4>
    1804:	00f12223          	sw	a5,4(sp)
    1808:	000067b7          	lui	a5,0x6
    180c:	e0078793          	addi	a5,a5,-512 # 5e00 <LEDS+0xd4>
    1810:	03312623          	sw	s3,44(sp)
    1814:	000069b7          	lui	s3,0x6
    1818:	00f12423          	sw	a5,8(sp)
    181c:	e0c98793          	addi	a5,s3,-500 # 5e0c <LEDS+0xe0>
    1820:	00f12623          	sw	a5,12(sp)
    1824:	000067b7          	lui	a5,0x6
    1828:	01912a23          	sw	s9,20(sp)
    182c:	e1478c93          	addi	s9,a5,-492 # 5e14 <LEDS+0xe8>
    1830:	000067b7          	lui	a5,0x6
    1834:	01712e23          	sw	s7,28(sp)
    1838:	e2878b93          	addi	s7,a5,-472 # 5e28 <LEDS+0xfc>
    183c:	000067b7          	lui	a5,0x6
    1840:	01812c23          	sw	s8,24(sp)
    1844:	e3878c13          	addi	s8,a5,-456 # 5e38 <LEDS+0x10c>
    1848:	000067b7          	lui	a5,0x6
    184c:	01a12823          	sw	s10,16(sp)
    1850:	e3c78d13          	addi	s10,a5,-452 # 5e3c <LEDS+0x110>
    1854:	000067b7          	lui	a5,0x6
    1858:	03612023          	sw	s6,32(sp)
    185c:	d1c7ab03          	lw	s6,-740(a5) # 5d1c <BUTTONS>
    1860:	02812c23          	sw	s0,56(sp)
    1864:	02912a23          	sw	s1,52(sp)
    1868:	03412423          	sw	s4,40(sp)
    186c:	02112e23          	sw	ra,60(sp)
    1870:	03212823          	sw	s2,48(sp)
    1874:	03512223          	sw	s5,36(sp)
    1878:	00000493          	li	s1,0
    187c:	00000413          	li	s0,0
    1880:	00300a13          	li	s4,3
    1884:	00000593          	li	a1,0
    1888:	00000513          	li	a0,0
    188c:	00001097          	auipc	ra,0x1
    1890:	bf0080e7          	jalr	-1040(ra) # 247c <display_set_cursor>
    1894:	00000593          	li	a1,0
    1898:	0ff00513          	li	a0,255
    189c:	00001097          	auipc	ra,0x1
    18a0:	bf4080e7          	jalr	-1036(ra) # 2490 <display_set_front_back_color>
    18a4:	000c8513          	mv	a0,s9
    18a8:	00001097          	auipc	ra,0x1
    18ac:	eb0080e7          	jalr	-336(ra) # 2758 <printf>
    18b0:	00410a93          	addi	s5,sp,4
    18b4:	00000913          	li	s2,0
    18b8:	11241263          	bne	s0,s2,19bc <main_menu+0x1c4>
    18bc:	0ff00593          	li	a1,255
    18c0:	00000513          	li	a0,0
    18c4:	00001097          	auipc	ra,0x1
    18c8:	bcc080e7          	jalr	-1076(ra) # 2490 <display_set_front_back_color>
    18cc:	000aa603          	lw	a2,0(s5)
    18d0:	00190913          	addi	s2,s2,1
    18d4:	00090593          	mv	a1,s2
    18d8:	000b8513          	mv	a0,s7
    18dc:	00001097          	auipc	ra,0x1
    18e0:	e7c080e7          	jalr	-388(ra) # 2758 <printf>
    18e4:	000c0513          	mv	a0,s8
    18e8:	00001097          	auipc	ra,0x1
    18ec:	e70080e7          	jalr	-400(ra) # 2758 <printf>
    18f0:	004a8a93          	addi	s5,s5,4
    18f4:	fd4912e3          	bne	s2,s4,18b8 <main_menu+0xc0>
    18f8:	00000593          	li	a1,0
    18fc:	0ff00513          	li	a0,255
    1900:	00001097          	auipc	ra,0x1
    1904:	b90080e7          	jalr	-1136(ra) # 2490 <display_set_front_back_color>
    1908:	06e00593          	li	a1,110
    190c:	00000513          	li	a0,0
    1910:	00001097          	auipc	ra,0x1
    1914:	b6c080e7          	jalr	-1172(ra) # 247c <display_set_cursor>
    1918:	000d0513          	mv	a0,s10
    191c:	00001097          	auipc	ra,0x1
    1920:	e3c080e7          	jalr	-452(ra) # 2758 <printf>
    1924:	00001097          	auipc	ra,0x1
    1928:	cc8080e7          	jalr	-824(ra) # 25ec <display_refresh>
    192c:	000b2903          	lw	s2,0(s6)
    1930:	fff4c493          	not	s1,s1
    1934:	0124f4b3          	and	s1,s1,s2
    1938:	0104f793          	andi	a5,s1,16
    193c:	00078863          	beqz	a5,194c <main_menu+0x154>
    1940:	00140413          	addi	s0,s0,1
    1944:	fffff097          	auipc	ra,0xfffff
    1948:	818080e7          	jalr	-2024(ra) # 15c <play_click_noise>
    194c:	0084f793          	andi	a5,s1,8
    1950:	00078863          	beqz	a5,1960 <main_menu+0x168>
    1954:	fff40413          	addi	s0,s0,-1
    1958:	fffff097          	auipc	ra,0xfffff
    195c:	804080e7          	jalr	-2044(ra) # 15c <play_click_noise>
    1960:	0044f493          	andi	s1,s1,4
    1964:	02048c63          	beqz	s1,199c <main_menu+0x1a4>
    1968:	ffffe097          	auipc	ra,0xffffe
    196c:	7f4080e7          	jalr	2036(ra) # 15c <play_click_noise>
    1970:	04041c63          	bnez	s0,19c8 <main_menu+0x1d0>
    1974:	fffff097          	auipc	ra,0xfffff
    1978:	468080e7          	jalr	1128(ra) # ddc <file_explorer>
    197c:	00001097          	auipc	ra,0x1
    1980:	af4080e7          	jalr	-1292(ra) # 2470 <display_framebuffer>
    1984:	00004637          	lui	a2,0x4
    1988:	00000593          	li	a1,0
    198c:	00000097          	auipc	ra,0x0
    1990:	7c4080e7          	jalr	1988(ra) # 2150 <memset>
    1994:	000b0793          	mv	a5,s6
    1998:	0007a783          	lw	a5,0(a5)
    199c:	fff00793          	li	a5,-1
    19a0:	00f40863          	beq	s0,a5,19b0 <main_menu+0x1b8>
    19a4:	01441863          	bne	s0,s4,19b4 <main_menu+0x1bc>
    19a8:	00000413          	li	s0,0
    19ac:	0080006f          	j	19b4 <main_menu+0x1bc>
    19b0:	00200413          	li	s0,2
    19b4:	00090493          	mv	s1,s2
    19b8:	ecdff06f          	j	1884 <main_menu+0x8c>
    19bc:	00000593          	li	a1,0
    19c0:	0ff00513          	li	a0,255
    19c4:	f01ff06f          	j	18c4 <main_menu+0xcc>
    19c8:	00100793          	li	a5,1
    19cc:	00f41863          	bne	s0,a5,19dc <main_menu+0x1e4>
    19d0:	00000097          	auipc	ra,0x0
    19d4:	87c080e7          	jalr	-1924(ra) # 124c <music_player>
    19d8:	fa5ff06f          	j	197c <main_menu+0x184>
    19dc:	00200793          	li	a5,2
    19e0:	f8f41ee3          	bne	s0,a5,197c <main_menu+0x184>
    19e4:	e0c98513          	addi	a0,s3,-500
    19e8:	00000097          	auipc	ra,0x0
    19ec:	d7c080e7          	jalr	-644(ra) # 1764 <not_implemented>
    19f0:	f8dff06f          	j	197c <main_menu+0x184>

000019f4 <main>:
    19f4:	000067b7          	lui	a5,0x6
    19f8:	d2c7a783          	lw	a5,-724(a5) # 5d2c <LEDS>
    19fc:	ff010113          	addi	sp,sp,-16
    1a00:	00112623          	sw	ra,12(sp)
    1a04:	00812423          	sw	s0,8(sp)
    1a08:	0007a023          	sw	zero,0(a5)
    1a0c:	000027b7          	lui	a5,0x2
    1a10:	4a478793          	addi	a5,a5,1188 # 24a4 <display_putchar>
    1a14:	00006737          	lui	a4,0x6
    1a18:	2cf72623          	sw	a5,716(a4) # 62cc <f_putchar>
    1a1c:	00001097          	auipc	ra,0x1
    1a20:	934080e7          	jalr	-1740(ra) # 2350 <oled_init>
    1a24:	00001097          	auipc	ra,0x1
    1a28:	938080e7          	jalr	-1736(ra) # 235c <oled_fullscreen>
    1a2c:	00001097          	auipc	ra,0x1
    1a30:	a44080e7          	jalr	-1468(ra) # 2470 <display_framebuffer>
    1a34:	00004637          	lui	a2,0x4
    1a38:	00000593          	li	a1,0
    1a3c:	00000097          	auipc	ra,0x0
    1a40:	714080e7          	jalr	1812(ra) # 2150 <memset>
    1a44:	00001097          	auipc	ra,0x1
    1a48:	ba8080e7          	jalr	-1112(ra) # 25ec <display_refresh>
    1a4c:	00000097          	auipc	ra,0x0
    1a50:	4a4080e7          	jalr	1188(ra) # 1ef0 <sdcard_init>
    1a54:	00001097          	auipc	ra,0x1
    1a58:	2d4080e7          	jalr	724(ra) # 2d28 <fl_init>
    1a5c:	00000593          	li	a1,0
    1a60:	00000513          	li	a0,0
    1a64:	00001097          	auipc	ra,0x1
    1a68:	a18080e7          	jalr	-1512(ra) # 247c <display_set_cursor>
    1a6c:	00000593          	li	a1,0
    1a70:	0ff00513          	li	a0,255
    1a74:	00001097          	auipc	ra,0x1
    1a78:	a1c080e7          	jalr	-1508(ra) # 2490 <display_set_front_back_color>
    1a7c:	00006537          	lui	a0,0x6
    1a80:	e5050513          	addi	a0,a0,-432 # 5e50 <LEDS+0x124>
    1a84:	00001097          	auipc	ra,0x1
    1a88:	cd4080e7          	jalr	-812(ra) # 2758 <printf>
    1a8c:	00001097          	auipc	ra,0x1
    1a90:	b60080e7          	jalr	-1184(ra) # 25ec <display_refresh>
    1a94:	000025b7          	lui	a1,0x2
    1a98:	000027b7          	lui	a5,0x2
    1a9c:	09458593          	addi	a1,a1,148 # 2094 <sdcard_writesector>
    1aa0:	04078413          	addi	s0,a5,64 # 2040 <sdcard_readsector>
    1aa4:	00040513          	mv	a0,s0
    1aa8:	00002097          	auipc	ra,0x2
    1aac:	1e0080e7          	jalr	480(ra) # 3c88 <fl_attach_media>
    1ab0:	000027b7          	lui	a5,0x2
    1ab4:	09478593          	addi	a1,a5,148 # 2094 <sdcard_writesector>
    1ab8:	fe0516e3          	bnez	a0,1aa4 <main+0xb0>
    1abc:	00000097          	auipc	ra,0x0
    1ac0:	d3c080e7          	jalr	-708(ra) # 17f8 <main_menu>

00001ac4 <pause>:
    1ac4:	c0002773          	rdcycle	a4
    1ac8:	c00027f3          	rdcycle	a5
    1acc:	40e787b3          	sub	a5,a5,a4
    1ad0:	fea7ece3          	bltu	a5,a0,1ac8 <pause+0x4>
    1ad4:	00008067          	ret

00001ad8 <sdcard_idle>:
    1ad8:	00008067          	ret

00001adc <sdcard_select>:
    1adc:	000067b7          	lui	a5,0x6
    1ae0:	d207a783          	lw	a5,-736(a5) # 5d20 <SDCARD>
    1ae4:	00200713          	li	a4,2
    1ae8:	00e7a023          	sw	a4,0(a5)
    1aec:	00008067          	ret

00001af0 <sdcard_ponder>:
    1af0:	000066b7          	lui	a3,0x6
    1af4:	d206a683          	lw	a3,-736(a3) # 5d20 <SDCARD>
    1af8:	01000793          	li	a5,16
    1afc:	00000713          	li	a4,0
    1b00:	00676613          	ori	a2,a4,6
    1b04:	00c6a023          	sw	a2,0(a3)
    1b08:	00174713          	xori	a4,a4,1
    1b0c:	00000013          	nop
    1b10:	fff78793          	addi	a5,a5,-1
    1b14:	fe0796e3          	bnez	a5,1b00 <sdcard_ponder+0x10>
    1b18:	00008067          	ret

00001b1c <sdcard_unselect>:
    1b1c:	000067b7          	lui	a5,0x6
    1b20:	d207a783          	lw	a5,-736(a5) # 5d20 <SDCARD>
    1b24:	00600713          	li	a4,6
    1b28:	00e7a023          	sw	a4,0(a5)
    1b2c:	00008067          	ret

00001b30 <sdcard_send>:
    1b30:	000067b7          	lui	a5,0x6
    1b34:	d207a783          	lw	a5,-736(a5) # 5d20 <SDCARD>
    1b38:	00655713          	srli	a4,a0,0x6
    1b3c:	00277713          	andi	a4,a4,2
    1b40:	00e7a023          	sw	a4,0(a5)
    1b44:	00176713          	ori	a4,a4,1
    1b48:	00e7a023          	sw	a4,0(a5)
    1b4c:	00555713          	srli	a4,a0,0x5
    1b50:	00277713          	andi	a4,a4,2
    1b54:	00e7a023          	sw	a4,0(a5)
    1b58:	00176713          	ori	a4,a4,1
    1b5c:	00e7a023          	sw	a4,0(a5)
    1b60:	00455713          	srli	a4,a0,0x4
    1b64:	00277713          	andi	a4,a4,2
    1b68:	00e7a023          	sw	a4,0(a5)
    1b6c:	00176713          	ori	a4,a4,1
    1b70:	00e7a023          	sw	a4,0(a5)
    1b74:	00355713          	srli	a4,a0,0x3
    1b78:	00277713          	andi	a4,a4,2
    1b7c:	00e7a023          	sw	a4,0(a5)
    1b80:	00176713          	ori	a4,a4,1
    1b84:	00e7a023          	sw	a4,0(a5)
    1b88:	00255713          	srli	a4,a0,0x2
    1b8c:	00277713          	andi	a4,a4,2
    1b90:	00e7a023          	sw	a4,0(a5)
    1b94:	00176713          	ori	a4,a4,1
    1b98:	00e7a023          	sw	a4,0(a5)
    1b9c:	00155713          	srli	a4,a0,0x1
    1ba0:	00277713          	andi	a4,a4,2
    1ba4:	00e7a023          	sw	a4,0(a5)
    1ba8:	00176713          	ori	a4,a4,1
    1bac:	00e7a023          	sw	a4,0(a5)
    1bb0:	00257713          	andi	a4,a0,2
    1bb4:	00e7a023          	sw	a4,0(a5)
    1bb8:	00151513          	slli	a0,a0,0x1
    1bbc:	00176713          	ori	a4,a4,1
    1bc0:	00e7a023          	sw	a4,0(a5)
    1bc4:	00257513          	andi	a0,a0,2
    1bc8:	00a7a023          	sw	a0,0(a5)
    1bcc:	00156513          	ori	a0,a0,1
    1bd0:	00a7a023          	sw	a0,0(a5)
    1bd4:	00200713          	li	a4,2
    1bd8:	00e7a023          	sw	a4,0(a5)
    1bdc:	000067b7          	lui	a5,0x6
    1be0:	2bc7a783          	lw	a5,700(a5) # 62bc <sdcard_while_loading_callback>
    1be4:	00078067          	jr	a5

00001be8 <sdcard_read>:
    1be8:	fd010113          	addi	sp,sp,-48
    1bec:	fff50793          	addi	a5,a0,-1
    1bf0:	03212023          	sw	s2,32(sp)
    1bf4:	00100913          	li	s2,1
    1bf8:	00f91933          	sll	s2,s2,a5
    1bfc:	000067b7          	lui	a5,0x6
    1c00:	01312e23          	sw	s3,28(sp)
    1c04:	d207a983          	lw	s3,-736(a5) # 5d20 <SDCARD>
    1c08:	02812423          	sw	s0,40(sp)
    1c0c:	02912223          	sw	s1,36(sp)
    1c10:	01412c23          	sw	s4,24(sp)
    1c14:	01512a23          	sw	s5,20(sp)
    1c18:	01612823          	sw	s6,16(sp)
    1c1c:	02112623          	sw	ra,44(sp)
    1c20:	0ff00413          	li	s0,255
    1c24:	00000493          	li	s1,0
    1c28:	00300a13          	li	s4,3
    1c2c:	00200a93          	li	s5,2
    1c30:	00006b37          	lui	s6,0x6
    1c34:	02058c63          	beqz	a1,1c6c <sdcard_read+0x84>
    1c38:	012477b3          	and	a5,s0,s2
    1c3c:	02079a63          	bnez	a5,1c70 <sdcard_read+0x88>
    1c40:	02c12083          	lw	ra,44(sp)
    1c44:	0ff47513          	zext.b	a0,s0
    1c48:	02812403          	lw	s0,40(sp)
    1c4c:	02412483          	lw	s1,36(sp)
    1c50:	02012903          	lw	s2,32(sp)
    1c54:	01c12983          	lw	s3,28(sp)
    1c58:	01812a03          	lw	s4,24(sp)
    1c5c:	01412a83          	lw	s5,20(sp)
    1c60:	01012b03          	lw	s6,16(sp)
    1c64:	03010113          	addi	sp,sp,48
    1c68:	00008067          	ret
    1c6c:	fca4dae3          	bge	s1,a0,1c40 <sdcard_read+0x58>
    1c70:	0149a023          	sw	s4,0(s3)
    1c74:	0159a023          	sw	s5,0(s3)
    1c78:	0009a783          	lw	a5,0(s3)
    1c7c:	00141413          	slli	s0,s0,0x1
    1c80:	00b12623          	sw	a1,12(sp)
    1c84:	00f46433          	or	s0,s0,a5
    1c88:	2bcb2783          	lw	a5,700(s6) # 62bc <sdcard_while_loading_callback>
    1c8c:	00a12423          	sw	a0,8(sp)
    1c90:	00148493          	addi	s1,s1,1
    1c94:	000780e7          	jalr	a5
    1c98:	00c12583          	lw	a1,12(sp)
    1c9c:	00812503          	lw	a0,8(sp)
    1ca0:	f95ff06f          	j	1c34 <sdcard_read+0x4c>

00001ca4 <sdcard_get>:
    1ca4:	fe010113          	addi	sp,sp,-32
    1ca8:	00112e23          	sw	ra,28(sp)
    1cac:	00812c23          	sw	s0,24(sp)
    1cb0:	00912a23          	sw	s1,20(sp)
    1cb4:	00050413          	mv	s0,a0
    1cb8:	00b12623          	sw	a1,12(sp)
    1cbc:	00000097          	auipc	ra,0x0
    1cc0:	e20080e7          	jalr	-480(ra) # 1adc <sdcard_select>
    1cc4:	00c12583          	lw	a1,12(sp)
    1cc8:	00040513          	mv	a0,s0
    1ccc:	00100493          	li	s1,1
    1cd0:	00000097          	auipc	ra,0x0
    1cd4:	f18080e7          	jalr	-232(ra) # 1be8 <sdcard_read>
    1cd8:	00345413          	srli	s0,s0,0x3
    1cdc:	0284c463          	blt	s1,s0,1d04 <sdcard_get+0x60>
    1ce0:	00a12623          	sw	a0,12(sp)
    1ce4:	00000097          	auipc	ra,0x0
    1ce8:	e38080e7          	jalr	-456(ra) # 1b1c <sdcard_unselect>
    1cec:	01c12083          	lw	ra,28(sp)
    1cf0:	01812403          	lw	s0,24(sp)
    1cf4:	00c12503          	lw	a0,12(sp)
    1cf8:	01412483          	lw	s1,20(sp)
    1cfc:	02010113          	addi	sp,sp,32
    1d00:	00008067          	ret
    1d04:	00000593          	li	a1,0
    1d08:	00800513          	li	a0,8
    1d0c:	00000097          	auipc	ra,0x0
    1d10:	edc080e7          	jalr	-292(ra) # 1be8 <sdcard_read>
    1d14:	00148493          	addi	s1,s1,1
    1d18:	fc5ff06f          	j	1cdc <sdcard_get+0x38>

00001d1c <sdcard_cmd>:
    1d1c:	ff010113          	addi	sp,sp,-16
    1d20:	00812423          	sw	s0,8(sp)
    1d24:	00912223          	sw	s1,4(sp)
    1d28:	01212023          	sw	s2,0(sp)
    1d2c:	00112623          	sw	ra,12(sp)
    1d30:	00050913          	mv	s2,a0
    1d34:	00000413          	li	s0,0
    1d38:	00000097          	auipc	ra,0x0
    1d3c:	da4080e7          	jalr	-604(ra) # 1adc <sdcard_select>
    1d40:	00600493          	li	s1,6
    1d44:	008907b3          	add	a5,s2,s0
    1d48:	0007c503          	lbu	a0,0(a5)
    1d4c:	00140413          	addi	s0,s0,1
    1d50:	00000097          	auipc	ra,0x0
    1d54:	de0080e7          	jalr	-544(ra) # 1b30 <sdcard_send>
    1d58:	fe9416e3          	bne	s0,s1,1d44 <sdcard_cmd+0x28>
    1d5c:	00812403          	lw	s0,8(sp)
    1d60:	00c12083          	lw	ra,12(sp)
    1d64:	00412483          	lw	s1,4(sp)
    1d68:	00012903          	lw	s2,0(sp)
    1d6c:	01010113          	addi	sp,sp,16
    1d70:	00000317          	auipc	t1,0x0
    1d74:	dac30067          	jr	-596(t1) # 1b1c <sdcard_unselect>

00001d78 <sdcard_start_sector>:
    1d78:	ff010113          	addi	sp,sp,-16
    1d7c:	00112623          	sw	ra,12(sp)
    1d80:	00812423          	sw	s0,8(sp)
    1d84:	00050413          	mv	s0,a0
    1d88:	00000097          	auipc	ra,0x0
    1d8c:	d54080e7          	jalr	-684(ra) # 1adc <sdcard_select>
    1d90:	05100513          	li	a0,81
    1d94:	00000097          	auipc	ra,0x0
    1d98:	d9c080e7          	jalr	-612(ra) # 1b30 <sdcard_send>
    1d9c:	01845513          	srli	a0,s0,0x18
    1da0:	00000097          	auipc	ra,0x0
    1da4:	d90080e7          	jalr	-624(ra) # 1b30 <sdcard_send>
    1da8:	41045513          	srai	a0,s0,0x10
    1dac:	0ff57513          	zext.b	a0,a0
    1db0:	00000097          	auipc	ra,0x0
    1db4:	d80080e7          	jalr	-640(ra) # 1b30 <sdcard_send>
    1db8:	40845513          	srai	a0,s0,0x8
    1dbc:	0ff57513          	zext.b	a0,a0
    1dc0:	00000097          	auipc	ra,0x0
    1dc4:	d70080e7          	jalr	-656(ra) # 1b30 <sdcard_send>
    1dc8:	0ff47513          	zext.b	a0,s0
    1dcc:	00000097          	auipc	ra,0x0
    1dd0:	d64080e7          	jalr	-668(ra) # 1b30 <sdcard_send>
    1dd4:	05500513          	li	a0,85
    1dd8:	00000097          	auipc	ra,0x0
    1ddc:	d58080e7          	jalr	-680(ra) # 1b30 <sdcard_send>
    1de0:	00000097          	auipc	ra,0x0
    1de4:	d3c080e7          	jalr	-708(ra) # 1b1c <sdcard_unselect>
    1de8:	00812403          	lw	s0,8(sp)
    1dec:	00c12083          	lw	ra,12(sp)
    1df0:	00100593          	li	a1,1
    1df4:	00800513          	li	a0,8
    1df8:	01010113          	addi	sp,sp,16
    1dfc:	00000317          	auipc	t1,0x0
    1e00:	ea830067          	jr	-344(t1) # 1ca4 <sdcard_get>

00001e04 <sdcard_read_sector>:
    1e04:	ff010113          	addi	sp,sp,-16
    1e08:	00812423          	sw	s0,8(sp)
    1e0c:	00112623          	sw	ra,12(sp)
    1e10:	00912223          	sw	s1,4(sp)
    1e14:	01212023          	sw	s2,0(sp)
    1e18:	00058413          	mv	s0,a1
    1e1c:	00000097          	auipc	ra,0x0
    1e20:	f5c080e7          	jalr	-164(ra) # 1d78 <sdcard_start_sector>
    1e24:	04051863          	bnez	a0,1e74 <sdcard_read_sector+0x70>
    1e28:	00100593          	li	a1,1
    1e2c:	00058513          	mv	a0,a1
    1e30:	00000097          	auipc	ra,0x0
    1e34:	e74080e7          	jalr	-396(ra) # 1ca4 <sdcard_get>
    1e38:	00000493          	li	s1,0
    1e3c:	20000913          	li	s2,512
    1e40:	00000593          	li	a1,0
    1e44:	00800513          	li	a0,8
    1e48:	00000097          	auipc	ra,0x0
    1e4c:	e5c080e7          	jalr	-420(ra) # 1ca4 <sdcard_get>
    1e50:	009407b3          	add	a5,s0,s1
    1e54:	00a78023          	sb	a0,0(a5)
    1e58:	00148493          	addi	s1,s1,1
    1e5c:	ff2492e3          	bne	s1,s2,1e40 <sdcard_read_sector+0x3c>
    1e60:	00100593          	li	a1,1
    1e64:	01000513          	li	a0,16
    1e68:	20040413          	addi	s0,s0,512
    1e6c:	00000097          	auipc	ra,0x0
    1e70:	e38080e7          	jalr	-456(ra) # 1ca4 <sdcard_get>
    1e74:	00c12083          	lw	ra,12(sp)
    1e78:	00040513          	mv	a0,s0
    1e7c:	00812403          	lw	s0,8(sp)
    1e80:	00412483          	lw	s1,4(sp)
    1e84:	00012903          	lw	s2,0(sp)
    1e88:	01010113          	addi	sp,sp,16
    1e8c:	00008067          	ret

00001e90 <sdcard_preinit>:
    1e90:	ff010113          	addi	sp,sp,-16
    1e94:	000067b7          	lui	a5,0x6
    1e98:	00812423          	sw	s0,8(sp)
    1e9c:	d207a403          	lw	s0,-736(a5) # 5d20 <SDCARD>
    1ea0:	00112623          	sw	ra,12(sp)
    1ea4:	00600793          	li	a5,6
    1ea8:	01313537          	lui	a0,0x1313
    1eac:	00f42023          	sw	a5,0(s0)
    1eb0:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
    1eb4:	00000097          	auipc	ra,0x0
    1eb8:	c10080e7          	jalr	-1008(ra) # 1ac4 <pause>
    1ebc:	0a000793          	li	a5,160
    1ec0:	00000713          	li	a4,0
    1ec4:	00676693          	ori	a3,a4,6
    1ec8:	00d42023          	sw	a3,0(s0)
    1ecc:	fff78793          	addi	a5,a5,-1
    1ed0:	00174713          	xori	a4,a4,1
    1ed4:	fe0798e3          	bnez	a5,1ec4 <sdcard_preinit+0x34>
    1ed8:	00600793          	li	a5,6
    1edc:	00c12083          	lw	ra,12(sp)
    1ee0:	00f42023          	sw	a5,0(s0)
    1ee4:	00812403          	lw	s0,8(sp)
    1ee8:	01010113          	addi	sp,sp,16
    1eec:	00008067          	ret

00001ef0 <sdcard_init>:
    1ef0:	000027b7          	lui	a5,0x2
    1ef4:	ad878793          	addi	a5,a5,-1320 # 1ad8 <sdcard_idle>
    1ef8:	00006737          	lui	a4,0x6
    1efc:	fe010113          	addi	sp,sp,-32
    1f00:	2af72e23          	sw	a5,700(a4) # 62bc <sdcard_while_loading_callback>
    1f04:	000067b7          	lui	a5,0x6
    1f08:	00812c23          	sw	s0,24(sp)
    1f0c:	00912a23          	sw	s1,20(sp)
    1f10:	00112e23          	sw	ra,28(sp)
    1f14:	d0c78493          	addi	s1,a5,-756 # 5d0c <cmd0>
    1f18:	0ff00413          	li	s0,255
    1f1c:	00000097          	auipc	ra,0x0
    1f20:	f74080e7          	jalr	-140(ra) # 1e90 <sdcard_preinit>
    1f24:	00048513          	mv	a0,s1
    1f28:	00000097          	auipc	ra,0x0
    1f2c:	df4080e7          	jalr	-524(ra) # 1d1c <sdcard_cmd>
    1f30:	00100593          	li	a1,1
    1f34:	00800513          	li	a0,8
    1f38:	00000097          	auipc	ra,0x0
    1f3c:	d6c080e7          	jalr	-660(ra) # 1ca4 <sdcard_get>
    1f40:	00a12623          	sw	a0,12(sp)
    1f44:	00000097          	auipc	ra,0x0
    1f48:	bac080e7          	jalr	-1108(ra) # 1af0 <sdcard_ponder>
    1f4c:	00c12503          	lw	a0,12(sp)
    1f50:	00851c63          	bne	a0,s0,1f68 <sdcard_init+0x78>
    1f54:	01313537          	lui	a0,0x1313
    1f58:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
    1f5c:	00000097          	auipc	ra,0x0
    1f60:	b68080e7          	jalr	-1176(ra) # 1ac4 <pause>
    1f64:	fb9ff06f          	j	1f1c <sdcard_init+0x2c>
    1f68:	00006537          	lui	a0,0x6
    1f6c:	d0450513          	addi	a0,a0,-764 # 5d04 <cmd8>
    1f70:	00000097          	auipc	ra,0x0
    1f74:	dac080e7          	jalr	-596(ra) # 1d1c <sdcard_cmd>
    1f78:	00100593          	li	a1,1
    1f7c:	02800513          	li	a0,40
    1f80:	00000097          	auipc	ra,0x0
    1f84:	d24080e7          	jalr	-732(ra) # 1ca4 <sdcard_get>
    1f88:	00000097          	auipc	ra,0x0
    1f8c:	b68080e7          	jalr	-1176(ra) # 1af0 <sdcard_ponder>
    1f90:	000067b7          	lui	a5,0x6
    1f94:	cfc78413          	addi	s0,a5,-772 # 5cfc <cmd55>
    1f98:	000067b7          	lui	a5,0x6
    1f9c:	cf478493          	addi	s1,a5,-780 # 5cf4 <acmd41>
    1fa0:	00040513          	mv	a0,s0
    1fa4:	00000097          	auipc	ra,0x0
    1fa8:	d78080e7          	jalr	-648(ra) # 1d1c <sdcard_cmd>
    1fac:	00100593          	li	a1,1
    1fb0:	00800513          	li	a0,8
    1fb4:	00000097          	auipc	ra,0x0
    1fb8:	cf0080e7          	jalr	-784(ra) # 1ca4 <sdcard_get>
    1fbc:	00000097          	auipc	ra,0x0
    1fc0:	b34080e7          	jalr	-1228(ra) # 1af0 <sdcard_ponder>
    1fc4:	00048513          	mv	a0,s1
    1fc8:	00000097          	auipc	ra,0x0
    1fcc:	d54080e7          	jalr	-684(ra) # 1d1c <sdcard_cmd>
    1fd0:	00100593          	li	a1,1
    1fd4:	00800513          	li	a0,8
    1fd8:	00000097          	auipc	ra,0x0
    1fdc:	ccc080e7          	jalr	-820(ra) # 1ca4 <sdcard_get>
    1fe0:	00a12623          	sw	a0,12(sp)
    1fe4:	00000097          	auipc	ra,0x0
    1fe8:	b0c080e7          	jalr	-1268(ra) # 1af0 <sdcard_ponder>
    1fec:	00c12503          	lw	a0,12(sp)
    1ff0:	00050c63          	beqz	a0,2008 <sdcard_init+0x118>
    1ff4:	001e8537          	lui	a0,0x1e8
    1ff8:	48050513          	addi	a0,a0,1152 # 1e8480 <__stacktop+0x1d8480>
    1ffc:	00000097          	auipc	ra,0x0
    2000:	ac8080e7          	jalr	-1336(ra) # 1ac4 <pause>
    2004:	f9dff06f          	j	1fa0 <sdcard_init+0xb0>
    2008:	00006537          	lui	a0,0x6
    200c:	cec50513          	addi	a0,a0,-788 # 5cec <cmd16>
    2010:	00000097          	auipc	ra,0x0
    2014:	d0c080e7          	jalr	-756(ra) # 1d1c <sdcard_cmd>
    2018:	00100593          	li	a1,1
    201c:	00800513          	li	a0,8
    2020:	00000097          	auipc	ra,0x0
    2024:	c84080e7          	jalr	-892(ra) # 1ca4 <sdcard_get>
    2028:	01812403          	lw	s0,24(sp)
    202c:	01c12083          	lw	ra,28(sp)
    2030:	01412483          	lw	s1,20(sp)
    2034:	02010113          	addi	sp,sp,32
    2038:	00000317          	auipc	t1,0x0
    203c:	ab830067          	jr	-1352(t1) # 1af0 <sdcard_ponder>

00002040 <sdcard_readsector>:
    2040:	04060663          	beqz	a2,208c <sdcard_readsector+0x4c>
    2044:	ff010113          	addi	sp,sp,-16
    2048:	00812423          	sw	s0,8(sp)
    204c:	00912223          	sw	s1,4(sp)
    2050:	00112623          	sw	ra,12(sp)
    2054:	00050413          	mv	s0,a0
    2058:	00a604b3          	add	s1,a2,a0
    205c:	00040513          	mv	a0,s0
    2060:	00000097          	auipc	ra,0x0
    2064:	da4080e7          	jalr	-604(ra) # 1e04 <sdcard_read_sector>
    2068:	00140413          	addi	s0,s0,1
    206c:	00050593          	mv	a1,a0
    2070:	fe9416e3          	bne	s0,s1,205c <sdcard_readsector+0x1c>
    2074:	00c12083          	lw	ra,12(sp)
    2078:	00812403          	lw	s0,8(sp)
    207c:	00412483          	lw	s1,4(sp)
    2080:	00100513          	li	a0,1
    2084:	01010113          	addi	sp,sp,16
    2088:	00008067          	ret
    208c:	00000513          	li	a0,0
    2090:	00008067          	ret

00002094 <sdcard_writesector>:
    2094:	00000513          	li	a0,0
    2098:	00008067          	ret

0000209c <__divsi3>:
    209c:	06054063          	bltz	a0,20fc <__umodsi3+0x10>
    20a0:	0605c663          	bltz	a1,210c <__umodsi3+0x20>

000020a4 <__udivsi3>:
    20a4:	00058613          	mv	a2,a1
    20a8:	00050593          	mv	a1,a0
    20ac:	fff00513          	li	a0,-1
    20b0:	02060c63          	beqz	a2,20e8 <__udivsi3+0x44>
    20b4:	00100693          	li	a3,1
    20b8:	00b67a63          	bgeu	a2,a1,20cc <__udivsi3+0x28>
    20bc:	00c05863          	blez	a2,20cc <__udivsi3+0x28>
    20c0:	00161613          	slli	a2,a2,0x1
    20c4:	00169693          	slli	a3,a3,0x1
    20c8:	feb66ae3          	bltu	a2,a1,20bc <__udivsi3+0x18>
    20cc:	00000513          	li	a0,0
    20d0:	00c5e663          	bltu	a1,a2,20dc <__udivsi3+0x38>
    20d4:	40c585b3          	sub	a1,a1,a2
    20d8:	00d56533          	or	a0,a0,a3
    20dc:	0016d693          	srli	a3,a3,0x1
    20e0:	00165613          	srli	a2,a2,0x1
    20e4:	fe0696e3          	bnez	a3,20d0 <__udivsi3+0x2c>
    20e8:	00008067          	ret

000020ec <__umodsi3>:
    20ec:	00008293          	mv	t0,ra
    20f0:	fb5ff0ef          	jal	20a4 <__udivsi3>
    20f4:	00058513          	mv	a0,a1
    20f8:	00028067          	jr	t0
    20fc:	40a00533          	neg	a0,a0
    2100:	0005d863          	bgez	a1,2110 <__umodsi3+0x24>
    2104:	40b005b3          	neg	a1,a1
    2108:	f95ff06f          	j	209c <__divsi3>
    210c:	40b005b3          	neg	a1,a1
    2110:	00008293          	mv	t0,ra
    2114:	f89ff0ef          	jal	209c <__divsi3>
    2118:	40a00533          	neg	a0,a0
    211c:	00028067          	jr	t0

00002120 <__modsi3>:
    2120:	00008293          	mv	t0,ra
    2124:	0005ca63          	bltz	a1,2138 <__modsi3+0x18>
    2128:	00054c63          	bltz	a0,2140 <__modsi3+0x20>
    212c:	f79ff0ef          	jal	20a4 <__udivsi3>
    2130:	00058513          	mv	a0,a1
    2134:	00028067          	jr	t0
    2138:	40b005b3          	neg	a1,a1
    213c:	fe0558e3          	bgez	a0,212c <__modsi3+0xc>
    2140:	40a00533          	neg	a0,a0
    2144:	f61ff0ef          	jal	20a4 <__udivsi3>
    2148:	40b00533          	neg	a0,a1
    214c:	00028067          	jr	t0

00002150 <memset>:
    2150:	00c50633          	add	a2,a0,a2
    2154:	00050793          	mv	a5,a0
    2158:	00c79463          	bne	a5,a2,2160 <memset+0x10>
    215c:	00008067          	ret
    2160:	00178793          	addi	a5,a5,1
    2164:	feb78fa3          	sb	a1,-1(a5)
    2168:	ff1ff06f          	j	2158 <memset+0x8>

0000216c <memcpy>:
    216c:	00000793          	li	a5,0
    2170:	00c79463          	bne	a5,a2,2178 <memcpy+0xc>
    2174:	00008067          	ret
    2178:	00f58733          	add	a4,a1,a5
    217c:	00074683          	lbu	a3,0(a4)
    2180:	00f50733          	add	a4,a0,a5
    2184:	00178793          	addi	a5,a5,1
    2188:	00d70023          	sb	a3,0(a4)
    218c:	fe5ff06f          	j	2170 <memcpy+0x4>

00002190 <strlen>:
    2190:	00000793          	li	a5,0
    2194:	00f50733          	add	a4,a0,a5
    2198:	00074703          	lbu	a4,0(a4)
    219c:	00071663          	bnez	a4,21a8 <strlen+0x18>
    21a0:	00078513          	mv	a0,a5
    21a4:	00008067          	ret
    21a8:	00178793          	addi	a5,a5,1
    21ac:	fe9ff06f          	j	2194 <strlen+0x4>

000021b0 <strncmp>:
    21b0:	00000793          	li	a5,0
    21b4:	00c79663          	bne	a5,a2,21c0 <strncmp+0x10>
    21b8:	00000513          	li	a0,0
    21bc:	00008067          	ret
    21c0:	00f50733          	add	a4,a0,a5
    21c4:	00074683          	lbu	a3,0(a4)
    21c8:	00f58733          	add	a4,a1,a5
    21cc:	00074703          	lbu	a4,0(a4)
    21d0:	00e6e863          	bltu	a3,a4,21e0 <strncmp+0x30>
    21d4:	00d76a63          	bltu	a4,a3,21e8 <strncmp+0x38>
    21d8:	00178793          	addi	a5,a5,1
    21dc:	fd9ff06f          	j	21b4 <strncmp+0x4>
    21e0:	fff00513          	li	a0,-1
    21e4:	00008067          	ret
    21e8:	00100513          	li	a0,1
    21ec:	00008067          	ret

000021f0 <strncpy>:
    21f0:	00000793          	li	a5,0
    21f4:	00c79463          	bne	a5,a2,21fc <strncpy+0xc>
    21f8:	00008067          	ret
    21fc:	00f58733          	add	a4,a1,a5
    2200:	00074683          	lbu	a3,0(a4)
    2204:	00f50733          	add	a4,a0,a5
    2208:	00178793          	addi	a5,a5,1
    220c:	00d70023          	sb	a3,0(a4)
    2210:	fe5ff06f          	j	21f4 <strncpy+0x4>

00002214 <strcpy>:
    2214:	0005c783          	lbu	a5,0(a1)
    2218:	00079663          	bnez	a5,2224 <strcpy+0x10>
    221c:	00050023          	sb	zero,0(a0)
    2220:	00008067          	ret
    2224:	00150513          	addi	a0,a0,1
    2228:	00158593          	addi	a1,a1,1
    222c:	fef50fa3          	sb	a5,-1(a0)
    2230:	fe5ff06f          	j	2214 <strcpy>

00002234 <oled_wait>:
    2234:	00000013          	nop
    2238:	00000013          	nop
    223c:	00000013          	nop
    2240:	00000013          	nop
    2244:	00000013          	nop
    2248:	00000013          	nop
    224c:	00000013          	nop
    2250:	00008067          	ret

00002254 <oled_init_mode>:
    2254:	000067b7          	lui	a5,0x6
    2258:	d247a703          	lw	a4,-732(a5) # 5d24 <OLED_RST>
    225c:	fe010113          	addi	sp,sp,-32
    2260:	00112e23          	sw	ra,28(sp)
    2264:	00812c23          	sw	s0,24(sp)
    2268:	00072023          	sw	zero,0(a4)
    226c:	00040737          	lui	a4,0x40
    2270:	00000013          	nop
    2274:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
    2278:	fe071ce3          	bnez	a4,2270 <oled_init_mode+0x1c>
    227c:	d247a703          	lw	a4,-732(a5)
    2280:	00100693          	li	a3,1
    2284:	00d72023          	sw	a3,0(a4)
    2288:	00040737          	lui	a4,0x40
    228c:	00000013          	nop
    2290:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
    2294:	fe071ce3          	bnez	a4,228c <oled_init_mode+0x38>
    2298:	d247a783          	lw	a5,-732(a5)
    229c:	0007a023          	sw	zero,0(a5)
    22a0:	000407b7          	lui	a5,0x40
    22a4:	00000013          	nop
    22a8:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
    22ac:	fe079ce3          	bnez	a5,22a4 <oled_init_mode+0x50>
    22b0:	00006737          	lui	a4,0x6
    22b4:	d2872783          	lw	a5,-728(a4) # 5d28 <OLED>
    22b8:	2af00693          	li	a3,687
    22bc:	00d7a023          	sw	a3,0(a5)
    22c0:	000407b7          	lui	a5,0x40
    22c4:	00000013          	nop
    22c8:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
    22cc:	fe079ce3          	bnez	a5,22c4 <oled_init_mode+0x70>
    22d0:	d2872403          	lw	s0,-728(a4)
    22d4:	2a000793          	li	a5,672
    22d8:	00a12623          	sw	a0,12(sp)
    22dc:	00f42023          	sw	a5,0(s0)
    22e0:	00000097          	auipc	ra,0x0
    22e4:	f54080e7          	jalr	-172(ra) # 2234 <oled_wait>
    22e8:	00c12503          	lw	a0,12(sp)
    22ec:	4a000793          	li	a5,1184
    22f0:	00050463          	beqz	a0,22f8 <oled_init_mode+0xa4>
    22f4:	42000793          	li	a5,1056
    22f8:	00f42023          	sw	a5,0(s0)
    22fc:	00000097          	auipc	ra,0x0
    2300:	f38080e7          	jalr	-200(ra) # 2234 <oled_wait>
    2304:	2fd00793          	li	a5,765
    2308:	00f42023          	sw	a5,0(s0)
    230c:	00000097          	auipc	ra,0x0
    2310:	f28080e7          	jalr	-216(ra) # 2234 <oled_wait>
    2314:	4b100793          	li	a5,1201
    2318:	00f42023          	sw	a5,0(s0)
    231c:	00000097          	auipc	ra,0x0
    2320:	f18080e7          	jalr	-232(ra) # 2234 <oled_wait>
    2324:	2a200793          	li	a5,674
    2328:	00f42023          	sw	a5,0(s0)
    232c:	00000097          	auipc	ra,0x0
    2330:	f08080e7          	jalr	-248(ra) # 2234 <oled_wait>
    2334:	40000793          	li	a5,1024
    2338:	00f42023          	sw	a5,0(s0)
    233c:	01812403          	lw	s0,24(sp)
    2340:	01c12083          	lw	ra,28(sp)
    2344:	02010113          	addi	sp,sp,32
    2348:	00000317          	auipc	t1,0x0
    234c:	eec30067          	jr	-276(t1) # 2234 <oled_wait>

00002350 <oled_init>:
    2350:	00000513          	li	a0,0
    2354:	00000317          	auipc	t1,0x0
    2358:	f0030067          	jr	-256(t1) # 2254 <oled_init_mode>

0000235c <oled_fullscreen>:
    235c:	ff010113          	addi	sp,sp,-16
    2360:	000067b7          	lui	a5,0x6
    2364:	00812423          	sw	s0,8(sp)
    2368:	d287a403          	lw	s0,-728(a5) # 5d28 <OLED>
    236c:	00112623          	sw	ra,12(sp)
    2370:	00912223          	sw	s1,4(sp)
    2374:	01212023          	sw	s2,0(sp)
    2378:	21500793          	li	a5,533
    237c:	00f42023          	sw	a5,0(s0)
    2380:	40000913          	li	s2,1024
    2384:	00000097          	auipc	ra,0x0
    2388:	eb0080e7          	jalr	-336(ra) # 2234 <oled_wait>
    238c:	47f00493          	li	s1,1151
    2390:	01242023          	sw	s2,0(s0)
    2394:	00000097          	auipc	ra,0x0
    2398:	ea0080e7          	jalr	-352(ra) # 2234 <oled_wait>
    239c:	00942023          	sw	s1,0(s0)
    23a0:	00000097          	auipc	ra,0x0
    23a4:	e94080e7          	jalr	-364(ra) # 2234 <oled_wait>
    23a8:	27500793          	li	a5,629
    23ac:	00f42023          	sw	a5,0(s0)
    23b0:	00000097          	auipc	ra,0x0
    23b4:	e84080e7          	jalr	-380(ra) # 2234 <oled_wait>
    23b8:	01242023          	sw	s2,0(s0)
    23bc:	00000097          	auipc	ra,0x0
    23c0:	e78080e7          	jalr	-392(ra) # 2234 <oled_wait>
    23c4:	00942023          	sw	s1,0(s0)
    23c8:	00000097          	auipc	ra,0x0
    23cc:	e6c080e7          	jalr	-404(ra) # 2234 <oled_wait>
    23d0:	25c00793          	li	a5,604
    23d4:	00f42023          	sw	a5,0(s0)
    23d8:	00812403          	lw	s0,8(sp)
    23dc:	00c12083          	lw	ra,12(sp)
    23e0:	00412483          	lw	s1,4(sp)
    23e4:	00012903          	lw	s2,0(sp)
    23e8:	01010113          	addi	sp,sp,16
    23ec:	00000317          	auipc	t1,0x0
    23f0:	e4830067          	jr	-440(t1) # 2234 <oled_wait>

000023f4 <oled_clear>:
    23f4:	fe010113          	addi	sp,sp,-32
    23f8:	000067b7          	lui	a5,0x6
    23fc:	01312623          	sw	s3,12(sp)
    2400:	d287a983          	lw	s3,-728(a5) # 5d28 <OLED>
    2404:	00812c23          	sw	s0,24(sp)
    2408:	01212823          	sw	s2,16(sp)
    240c:	00112e23          	sw	ra,28(sp)
    2410:	00912a23          	sw	s1,20(sp)
    2414:	08000913          	li	s2,128
    2418:	40056413          	ori	s0,a0,1024
    241c:	08000493          	li	s1,128
    2420:	0089a023          	sw	s0,0(s3)
    2424:	00000097          	auipc	ra,0x0
    2428:	e10080e7          	jalr	-496(ra) # 2234 <oled_wait>
    242c:	0089a023          	sw	s0,0(s3)
    2430:	00000097          	auipc	ra,0x0
    2434:	e04080e7          	jalr	-508(ra) # 2234 <oled_wait>
    2438:	fff48493          	addi	s1,s1,-1
    243c:	0089a023          	sw	s0,0(s3)
    2440:	00000097          	auipc	ra,0x0
    2444:	df4080e7          	jalr	-524(ra) # 2234 <oled_wait>
    2448:	fc049ce3          	bnez	s1,2420 <oled_clear+0x2c>
    244c:	fff90913          	addi	s2,s2,-1
    2450:	fc0916e3          	bnez	s2,241c <oled_clear+0x28>
    2454:	01c12083          	lw	ra,28(sp)
    2458:	01812403          	lw	s0,24(sp)
    245c:	01412483          	lw	s1,20(sp)
    2460:	01012903          	lw	s2,16(sp)
    2464:	00c12983          	lw	s3,12(sp)
    2468:	02010113          	addi	sp,sp,32
    246c:	00008067          	ret

00002470 <display_framebuffer>:
    2470:	000067b7          	lui	a5,0x6
    2474:	d187a503          	lw	a0,-744(a5) # 5d18 <DISPLAY>
    2478:	00008067          	ret

0000247c <display_set_cursor>:
    247c:	000067b7          	lui	a5,0x6
    2480:	2ca7a423          	sw	a0,712(a5) # 62c8 <cursor_x>
    2484:	000067b7          	lui	a5,0x6
    2488:	2cb7a223          	sw	a1,708(a5) # 62c4 <cursor_y>
    248c:	00008067          	ret

00002490 <display_set_front_back_color>:
    2490:	000067b7          	lui	a5,0x6
    2494:	2ca780a3          	sb	a0,705(a5) # 62c1 <front_color>
    2498:	000067b7          	lui	a5,0x6
    249c:	2cb78023          	sb	a1,704(a5) # 62c0 <back_color>
    24a0:	00008067          	ret

000024a4 <display_putchar>:
    24a4:	00a00793          	li	a5,10
    24a8:	00006737          	lui	a4,0x6
    24ac:	02f51663          	bne	a0,a5,24d8 <display_putchar+0x34>
    24b0:	2c072423          	sw	zero,712(a4) # 62c8 <cursor_x>
    24b4:	00006737          	lui	a4,0x6
    24b8:	2c472783          	lw	a5,708(a4) # 62c4 <cursor_y>
    24bc:	00878793          	addi	a5,a5,8
    24c0:	2cf72223          	sw	a5,708(a4)
    24c4:	07f00713          	li	a4,127
    24c8:	00f75663          	bge	a4,a5,24d4 <display_putchar+0x30>
    24cc:	000067b7          	lui	a5,0x6
    24d0:	2c07a223          	sw	zero,708(a5) # 62c4 <cursor_y>
    24d4:	00008067          	ret
    24d8:	ff010113          	addi	sp,sp,-16
    24dc:	00812623          	sw	s0,12(sp)
    24e0:	01f00793          	li	a5,31
    24e4:	0ca7d263          	bge	a5,a0,25a8 <display_putchar+0x104>
    24e8:	00006e37          	lui	t3,0x6
    24ec:	2c4e2783          	lw	a5,708(t3) # 62c4 <cursor_y>
    24f0:	07800693          	li	a3,120
    24f4:	00800593          	li	a1,8
    24f8:	00f6d663          	bge	a3,a5,2504 <display_putchar+0x60>
    24fc:	08000593          	li	a1,128
    2500:	40f585b3          	sub	a1,a1,a5
    2504:	2c872783          	lw	a5,712(a4)
    2508:	07b00693          	li	a3,123
    250c:	00500813          	li	a6,5
    2510:	00f6d663          	bge	a3,a5,251c <display_putchar+0x78>
    2514:	08000813          	li	a6,128
    2518:	40f80833          	sub	a6,a6,a5
    251c:	000067b7          	lui	a5,0x6
    2520:	d187a283          	lw	t0,-744(a5) # 5d18 <DISPLAY>
    2524:	000066b7          	lui	a3,0x6
    2528:	00251793          	slli	a5,a0,0x2
    252c:	eac68693          	addi	a3,a3,-340 # 5eac <font>
    2530:	00a787b3          	add	a5,a5,a0
    2534:	00d78533          	add	a0,a5,a3
    2538:	00100f93          	li	t6,1
    253c:	00000693          	li	a3,0
    2540:	000063b7          	lui	t2,0x6
    2544:	00006437          	lui	s0,0x6
    2548:	06b6d063          	bge	a3,a1,25a8 <display_putchar+0x104>
    254c:	00df9f33          	sll	t5,t6,a3
    2550:	00050893          	mv	a7,a0
    2554:	00000613          	li	a2,0
    2558:	03c0006f          	j	2594 <display_putchar+0xf0>
    255c:	f608c783          	lbu	a5,-160(a7)
    2560:	01e7f7b3          	and	a5,a5,t5
    2564:	02078e63          	beqz	a5,25a0 <display_putchar+0xfc>
    2568:	2c144e83          	lbu	t4,705(s0) # 62c1 <front_color>
    256c:	2c872783          	lw	a5,712(a4)
    2570:	2c4e2303          	lw	t1,708(t3)
    2574:	00188893          	addi	a7,a7,1
    2578:	00f607b3          	add	a5,a2,a5
    257c:	00779793          	slli	a5,a5,0x7
    2580:	00668333          	add	t1,a3,t1
    2584:	006787b3          	add	a5,a5,t1
    2588:	00f287b3          	add	a5,t0,a5
    258c:	01d78023          	sb	t4,0(a5)
    2590:	00160613          	addi	a2,a2,1 # 4001 <fatfs_get_file_entry+0x41>
    2594:	fd0644e3          	blt	a2,a6,255c <display_putchar+0xb8>
    2598:	00168693          	addi	a3,a3,1
    259c:	fadff06f          	j	2548 <display_putchar+0xa4>
    25a0:	2c03ce83          	lbu	t4,704(t2) # 62c0 <back_color>
    25a4:	fc9ff06f          	j	256c <display_putchar+0xc8>
    25a8:	2c872783          	lw	a5,712(a4)
    25ac:	07f00693          	li	a3,127
    25b0:	00578793          	addi	a5,a5,5
    25b4:	00f6c663          	blt	a3,a5,25c0 <display_putchar+0x11c>
    25b8:	2cf72423          	sw	a5,712(a4)
    25bc:	0240006f          	j	25e0 <display_putchar+0x13c>
    25c0:	2c072423          	sw	zero,712(a4)
    25c4:	00006737          	lui	a4,0x6
    25c8:	2c472783          	lw	a5,708(a4) # 62c4 <cursor_y>
    25cc:	00878793          	addi	a5,a5,8
    25d0:	2cf72223          	sw	a5,708(a4)
    25d4:	00f6d663          	bge	a3,a5,25e0 <display_putchar+0x13c>
    25d8:	000067b7          	lui	a5,0x6
    25dc:	2c07a223          	sw	zero,708(a5) # 62c4 <cursor_y>
    25e0:	00c12403          	lw	s0,12(sp)
    25e4:	01010113          	addi	sp,sp,16
    25e8:	00008067          	ret

000025ec <display_refresh>:
    25ec:	00008067          	ret

000025f0 <print_string>:
    25f0:	ff010113          	addi	sp,sp,-16
    25f4:	00812423          	sw	s0,8(sp)
    25f8:	00912223          	sw	s1,4(sp)
    25fc:	00112623          	sw	ra,12(sp)
    2600:	00050413          	mv	s0,a0
    2604:	000064b7          	lui	s1,0x6
    2608:	00044503          	lbu	a0,0(s0)
    260c:	00051c63          	bnez	a0,2624 <print_string+0x34>
    2610:	00c12083          	lw	ra,12(sp)
    2614:	00812403          	lw	s0,8(sp)
    2618:	00412483          	lw	s1,4(sp)
    261c:	01010113          	addi	sp,sp,16
    2620:	00008067          	ret
    2624:	2cc4a783          	lw	a5,716(s1) # 62cc <f_putchar>
    2628:	00140413          	addi	s0,s0,1
    262c:	000780e7          	jalr	a5
    2630:	fd9ff06f          	j	2608 <print_string+0x18>

00002634 <print_dec>:
    2634:	ef010113          	addi	sp,sp,-272
    2638:	10812423          	sw	s0,264(sp)
    263c:	10912223          	sw	s1,260(sp)
    2640:	10112623          	sw	ra,268(sp)
    2644:	11212023          	sw	s2,256(sp)
    2648:	00050413          	mv	s0,a0
    264c:	000064b7          	lui	s1,0x6
    2650:	08045063          	bgez	s0,26d0 <print_dec+0x9c>
    2654:	2cc4a783          	lw	a5,716(s1) # 62cc <f_putchar>
    2658:	02d00513          	li	a0,45
    265c:	40800433          	neg	s0,s0
    2660:	000780e7          	jalr	a5
    2664:	fedff06f          	j	2650 <print_dec+0x1c>
    2668:	00040513          	mv	a0,s0
    266c:	00a00593          	li	a1,10
    2670:	00000097          	auipc	ra,0x0
    2674:	a2c080e7          	jalr	-1492(ra) # 209c <__divsi3>
    2678:	00251793          	slli	a5,a0,0x2
    267c:	00f507b3          	add	a5,a0,a5
    2680:	00179793          	slli	a5,a5,0x1
    2684:	40f40433          	sub	s0,s0,a5
    2688:	00148493          	addi	s1,s1,1
    268c:	fe848fa3          	sb	s0,-1(s1)
    2690:	00050413          	mv	s0,a0
    2694:	fc041ae3          	bnez	s0,2668 <print_dec+0x34>
    2698:	fd2488e3          	beq	s1,s2,2668 <print_dec+0x34>
    269c:	00006437          	lui	s0,0x6
    26a0:	fff4c503          	lbu	a0,-1(s1)
    26a4:	2cc42783          	lw	a5,716(s0) # 62cc <f_putchar>
    26a8:	fff48493          	addi	s1,s1,-1
    26ac:	03050513          	addi	a0,a0,48
    26b0:	000780e7          	jalr	a5
    26b4:	ff2496e3          	bne	s1,s2,26a0 <print_dec+0x6c>
    26b8:	10c12083          	lw	ra,268(sp)
    26bc:	10812403          	lw	s0,264(sp)
    26c0:	10412483          	lw	s1,260(sp)
    26c4:	10012903          	lw	s2,256(sp)
    26c8:	11010113          	addi	sp,sp,272
    26cc:	00008067          	ret
    26d0:	00010493          	mv	s1,sp
    26d4:	00010913          	mv	s2,sp
    26d8:	fbdff06f          	j	2694 <print_dec+0x60>

000026dc <print_hex_digits>:
    26dc:	fe010113          	addi	sp,sp,-32
    26e0:	00812c23          	sw	s0,24(sp)
    26e4:	00912a23          	sw	s1,20(sp)
    26e8:	fff58413          	addi	s0,a1,-1
    26ec:	000064b7          	lui	s1,0x6
    26f0:	01212823          	sw	s2,16(sp)
    26f4:	01312623          	sw	s3,12(sp)
    26f8:	00112e23          	sw	ra,28(sp)
    26fc:	00050993          	mv	s3,a0
    2700:	00241413          	slli	s0,s0,0x2
    2704:	e6448493          	addi	s1,s1,-412 # 5e64 <LEDS+0x138>
    2708:	00006937          	lui	s2,0x6
    270c:	02045063          	bgez	s0,272c <print_hex_digits+0x50>
    2710:	01c12083          	lw	ra,28(sp)
    2714:	01812403          	lw	s0,24(sp)
    2718:	01412483          	lw	s1,20(sp)
    271c:	01012903          	lw	s2,16(sp)
    2720:	00c12983          	lw	s3,12(sp)
    2724:	02010113          	addi	sp,sp,32
    2728:	00008067          	ret
    272c:	0089d7b3          	srl	a5,s3,s0
    2730:	00f7f793          	andi	a5,a5,15
    2734:	00f487b3          	add	a5,s1,a5
    2738:	2cc92703          	lw	a4,716(s2) # 62cc <f_putchar>
    273c:	0007c503          	lbu	a0,0(a5)
    2740:	ffc40413          	addi	s0,s0,-4
    2744:	000700e7          	jalr	a4
    2748:	fc5ff06f          	j	270c <print_hex_digits+0x30>

0000274c <print_hex>:
    274c:	00800593          	li	a1,8
    2750:	00000317          	auipc	t1,0x0
    2754:	f8c30067          	jr	-116(t1) # 26dc <print_hex_digits>

00002758 <printf>:
    2758:	fa010113          	addi	sp,sp,-96
    275c:	04f12a23          	sw	a5,84(sp)
    2760:	04410793          	addi	a5,sp,68
    2764:	02812c23          	sw	s0,56(sp)
    2768:	02912a23          	sw	s1,52(sp)
    276c:	03212823          	sw	s2,48(sp)
    2770:	03312623          	sw	s3,44(sp)
    2774:	03412423          	sw	s4,40(sp)
    2778:	03512223          	sw	s5,36(sp)
    277c:	03612023          	sw	s6,32(sp)
    2780:	02112e23          	sw	ra,60(sp)
    2784:	01712e23          	sw	s7,28(sp)
    2788:	00050413          	mv	s0,a0
    278c:	04b12223          	sw	a1,68(sp)
    2790:	04c12423          	sw	a2,72(sp)
    2794:	04d12623          	sw	a3,76(sp)
    2798:	04e12823          	sw	a4,80(sp)
    279c:	05012c23          	sw	a6,88(sp)
    27a0:	05112e23          	sw	a7,92(sp)
    27a4:	00f12623          	sw	a5,12(sp)
    27a8:	02500913          	li	s2,37
    27ac:	000064b7          	lui	s1,0x6
    27b0:	07300993          	li	s3,115
    27b4:	07800a13          	li	s4,120
    27b8:	06400a93          	li	s5,100
    27bc:	06300b13          	li	s6,99
    27c0:	00044503          	lbu	a0,0(s0)
    27c4:	02051863          	bnez	a0,27f4 <printf+0x9c>
    27c8:	03c12083          	lw	ra,60(sp)
    27cc:	03812403          	lw	s0,56(sp)
    27d0:	03412483          	lw	s1,52(sp)
    27d4:	03012903          	lw	s2,48(sp)
    27d8:	02c12983          	lw	s3,44(sp)
    27dc:	02812a03          	lw	s4,40(sp)
    27e0:	02412a83          	lw	s5,36(sp)
    27e4:	02012b03          	lw	s6,32(sp)
    27e8:	01c12b83          	lw	s7,28(sp)
    27ec:	06010113          	addi	sp,sp,96
    27f0:	00008067          	ret
    27f4:	09251a63          	bne	a0,s2,2888 <printf+0x130>
    27f8:	00144503          	lbu	a0,1(s0)
    27fc:	00140b93          	addi	s7,s0,1
    2800:	03351463          	bne	a0,s3,2828 <printf+0xd0>
    2804:	00c12783          	lw	a5,12(sp)
    2808:	0007a503          	lw	a0,0(a5)
    280c:	00478713          	addi	a4,a5,4
    2810:	00e12623          	sw	a4,12(sp)
    2814:	00000097          	auipc	ra,0x0
    2818:	ddc080e7          	jalr	-548(ra) # 25f0 <print_string>
    281c:	000b8413          	mv	s0,s7
    2820:	00140413          	addi	s0,s0,1
    2824:	f9dff06f          	j	27c0 <printf+0x68>
    2828:	03451063          	bne	a0,s4,2848 <printf+0xf0>
    282c:	00c12783          	lw	a5,12(sp)
    2830:	0007a503          	lw	a0,0(a5)
    2834:	00478713          	addi	a4,a5,4
    2838:	00e12623          	sw	a4,12(sp)
    283c:	00000097          	auipc	ra,0x0
    2840:	f10080e7          	jalr	-240(ra) # 274c <print_hex>
    2844:	fd9ff06f          	j	281c <printf+0xc4>
    2848:	03551063          	bne	a0,s5,2868 <printf+0x110>
    284c:	00c12783          	lw	a5,12(sp)
    2850:	0007a503          	lw	a0,0(a5)
    2854:	00478713          	addi	a4,a5,4
    2858:	00e12623          	sw	a4,12(sp)
    285c:	00000097          	auipc	ra,0x0
    2860:	dd8080e7          	jalr	-552(ra) # 2634 <print_dec>
    2864:	fb9ff06f          	j	281c <printf+0xc4>
    2868:	2cc4a783          	lw	a5,716(s1) # 62cc <f_putchar>
    286c:	01651a63          	bne	a0,s6,2880 <printf+0x128>
    2870:	00c12703          	lw	a4,12(sp)
    2874:	00072503          	lw	a0,0(a4)
    2878:	00470693          	addi	a3,a4,4
    287c:	00d12623          	sw	a3,12(sp)
    2880:	000780e7          	jalr	a5
    2884:	f99ff06f          	j	281c <printf+0xc4>
    2888:	2cc4a783          	lw	a5,716(s1)
    288c:	000780e7          	jalr	a5
    2890:	f91ff06f          	j	2820 <printf+0xc8>

00002894 <__mulsi3>:
    2894:	00050793          	mv	a5,a0
    2898:	00000513          	li	a0,0
    289c:	00079463          	bnez	a5,28a4 <__mulsi3+0x10>
    28a0:	00008067          	ret
    28a4:	01f79693          	slli	a3,a5,0x1f
    28a8:	41f6d713          	srai	a4,a3,0x1f
    28ac:	00b77733          	and	a4,a4,a1
    28b0:	00e50533          	add	a0,a0,a4
    28b4:	0017d793          	srli	a5,a5,0x1
    28b8:	00159593          	slli	a1,a1,0x1
    28bc:	fe1ff06f          	j	289c <__mulsi3+0x8>

000028c0 <fat_list_insert_last>:
    28c0:	00452783          	lw	a5,4(a0)
    28c4:	04079263          	bnez	a5,2908 <fat_list_insert_last+0x48>
    28c8:	00052783          	lw	a5,0(a0)
    28cc:	00079c63          	bnez	a5,28e4 <fat_list_insert_last+0x24>
    28d0:	00b52023          	sw	a1,0(a0)
    28d4:	00b52223          	sw	a1,4(a0)
    28d8:	0005a023          	sw	zero,0(a1)
    28dc:	0005a223          	sw	zero,4(a1)
    28e0:	00008067          	ret
    28e4:	0007a703          	lw	a4,0(a5)
    28e8:	00f5a223          	sw	a5,4(a1)
    28ec:	00e5a023          	sw	a4,0(a1)
    28f0:	00071863          	bnez	a4,2900 <fat_list_insert_last+0x40>
    28f4:	00b52023          	sw	a1,0(a0)
    28f8:	00b7a023          	sw	a1,0(a5)
    28fc:	00008067          	ret
    2900:	00b72223          	sw	a1,4(a4)
    2904:	ff5ff06f          	j	28f8 <fat_list_insert_last+0x38>
    2908:	0047a703          	lw	a4,4(a5)
    290c:	00f5a023          	sw	a5,0(a1)
    2910:	00e5a223          	sw	a4,4(a1)
    2914:	00071863          	bnez	a4,2924 <fat_list_insert_last+0x64>
    2918:	00b52223          	sw	a1,4(a0)
    291c:	00b7a223          	sw	a1,4(a5)
    2920:	00008067          	ret
    2924:	00b72023          	sw	a1,0(a4)
    2928:	ff5ff06f          	j	291c <fat_list_insert_last+0x5c>

0000292c <FileString_StrCmpNoCase>:
    292c:	00050e93          	mv	t4,a0
    2930:	00000793          	li	a5,0
    2934:	01900e13          	li	t3,25
    2938:	00c79663          	bne	a5,a2,2944 <FileString_StrCmpNoCase+0x18>
    293c:	00000513          	li	a0,0
    2940:	00008067          	ret
    2944:	00fe8733          	add	a4,t4,a5
    2948:	00074803          	lbu	a6,0(a4)
    294c:	00f58733          	add	a4,a1,a5
    2950:	00074883          	lbu	a7,0(a4)
    2954:	fbf80713          	addi	a4,a6,-65
    2958:	0ff77713          	zext.b	a4,a4
    295c:	00080693          	mv	a3,a6
    2960:	00ee6663          	bltu	t3,a4,296c <FileString_StrCmpNoCase+0x40>
    2964:	02080693          	addi	a3,a6,32
    2968:	0ff6f693          	zext.b	a3,a3
    296c:	fbf88313          	addi	t1,a7,-65
    2970:	0ff37313          	zext.b	t1,t1
    2974:	00088713          	mv	a4,a7
    2978:	006e6663          	bltu	t3,t1,2984 <FileString_StrCmpNoCase+0x58>
    297c:	02088713          	addi	a4,a7,32
    2980:	0ff77713          	zext.b	a4,a4
    2984:	40e68533          	sub	a0,a3,a4
    2988:	00e69863          	bne	a3,a4,2998 <FileString_StrCmpNoCase+0x6c>
    298c:	00178793          	addi	a5,a5,1
    2990:	00088463          	beqz	a7,2998 <FileString_StrCmpNoCase+0x6c>
    2994:	fa0812e3          	bnez	a6,2938 <FileString_StrCmpNoCase+0xc>
    2998:	00008067          	ret

0000299c <FileString_GetExtension>:
    299c:	00050793          	mv	a5,a0
    29a0:	fff00713          	li	a4,-1
    29a4:	02e00613          	li	a2,46
    29a8:	0007c683          	lbu	a3,0(a5)
    29ac:	00069663          	bnez	a3,29b8 <FileString_GetExtension+0x1c>
    29b0:	00070513          	mv	a0,a4
    29b4:	00008067          	ret
    29b8:	00c69463          	bne	a3,a2,29c0 <FileString_GetExtension+0x24>
    29bc:	40a78733          	sub	a4,a5,a0
    29c0:	00178793          	addi	a5,a5,1
    29c4:	fe5ff06f          	j	29a8 <FileString_GetExtension+0xc>

000029c8 <fatfs_fat_writeback>:
    29c8:	00059e63          	bnez	a1,29e4 <fatfs_fat_writeback+0x1c>
    29cc:	00000513          	li	a0,0
    29d0:	00008067          	ret
    29d4:	00000513          	li	a0,0
    29d8:	01c12083          	lw	ra,28(sp)
    29dc:	02010113          	addi	sp,sp,32
    29e0:	00008067          	ret
    29e4:	2045a783          	lw	a5,516(a1)
    29e8:	04078e63          	beqz	a5,2a44 <fatfs_fat_writeback+0x7c>
    29ec:	03852683          	lw	a3,56(a0)
    29f0:	00050793          	mv	a5,a0
    29f4:	04068663          	beqz	a3,2a40 <fatfs_fat_writeback+0x78>
    29f8:	0147a703          	lw	a4,20(a5)
    29fc:	2005a503          	lw	a0,512(a1)
    2a00:	0207a803          	lw	a6,32(a5)
    2a04:	00100613          	li	a2,1
    2a08:	fe010113          	addi	sp,sp,-32
    2a0c:	40e607b3          	sub	a5,a2,a4
    2a10:	00112e23          	sw	ra,28(sp)
    2a14:	00a787b3          	add	a5,a5,a0
    2a18:	00f87663          	bgeu	a6,a5,2a24 <fatfs_fat_writeback+0x5c>
    2a1c:	01070733          	add	a4,a4,a6
    2a20:	40a70633          	sub	a2,a4,a0
    2a24:	00b12623          	sw	a1,12(sp)
    2a28:	000680e7          	jalr	a3
    2a2c:	fa0504e3          	beqz	a0,29d4 <fatfs_fat_writeback+0xc>
    2a30:	00c12583          	lw	a1,12(sp)
    2a34:	00100513          	li	a0,1
    2a38:	2005a223          	sw	zero,516(a1)
    2a3c:	f9dff06f          	j	29d8 <fatfs_fat_writeback+0x10>
    2a40:	2005a223          	sw	zero,516(a1)
    2a44:	00100513          	li	a0,1
    2a48:	00008067          	ret

00002a4c <fatfs_fat_read_sector>:
    2a4c:	fe010113          	addi	sp,sp,-32
    2a50:	01212823          	sw	s2,16(sp)
    2a54:	25452903          	lw	s2,596(a0)
    2a58:	00812c23          	sw	s0,24(sp)
    2a5c:	00112e23          	sw	ra,28(sp)
    2a60:	00912a23          	sw	s1,20(sp)
    2a64:	01312623          	sw	s3,12(sp)
    2a68:	00000413          	li	s0,0
    2a6c:	04091463          	bnez	s2,2ab4 <fatfs_fat_read_sector+0x68>
    2a70:	25452783          	lw	a5,596(a0)
    2a74:	00058493          	mv	s1,a1
    2a78:	00050993          	mv	s3,a0
    2a7c:	20f42623          	sw	a5,524(s0)
    2a80:	20442783          	lw	a5,516(s0)
    2a84:	24852a23          	sw	s0,596(a0)
    2a88:	08079863          	bnez	a5,2b18 <fatfs_fat_read_sector+0xcc>
    2a8c:	0349a783          	lw	a5,52(s3)
    2a90:	20942023          	sw	s1,512(s0)
    2a94:	00100613          	li	a2,1
    2a98:	00040593          	mv	a1,s0
    2a9c:	00048513          	mv	a0,s1
    2aa0:	000780e7          	jalr	a5
    2aa4:	08051463          	bnez	a0,2b2c <fatfs_fat_read_sector+0xe0>
    2aa8:	fff00793          	li	a5,-1
    2aac:	20f42023          	sw	a5,512(s0)
    2ab0:	0480006f          	j	2af8 <fatfs_fat_read_sector+0xac>
    2ab4:	20092783          	lw	a5,512(s2)
    2ab8:	00f5e663          	bltu	a1,a5,2ac4 <fatfs_fat_read_sector+0x78>
    2abc:	00178713          	addi	a4,a5,1
    2ac0:	02e5e463          	bltu	a1,a4,2ae8 <fatfs_fat_read_sector+0x9c>
    2ac4:	20c92783          	lw	a5,524(s2)
    2ac8:	00079663          	bnez	a5,2ad4 <fatfs_fat_read_sector+0x88>
    2acc:	00040a63          	beqz	s0,2ae0 <fatfs_fat_read_sector+0x94>
    2ad0:	20042623          	sw	zero,524(s0)
    2ad4:	00090413          	mv	s0,s2
    2ad8:	20c92903          	lw	s2,524(s2)
    2adc:	f91ff06f          	j	2a6c <fatfs_fat_read_sector+0x20>
    2ae0:	24052a23          	sw	zero,596(a0)
    2ae4:	ff1ff06f          	j	2ad4 <fatfs_fat_read_sector+0x88>
    2ae8:	40f585b3          	sub	a1,a1,a5
    2aec:	00959593          	slli	a1,a1,0x9
    2af0:	00b905b3          	add	a1,s2,a1
    2af4:	20b92423          	sw	a1,520(s2)
    2af8:	01c12083          	lw	ra,28(sp)
    2afc:	01812403          	lw	s0,24(sp)
    2b00:	01412483          	lw	s1,20(sp)
    2b04:	00c12983          	lw	s3,12(sp)
    2b08:	00090513          	mv	a0,s2
    2b0c:	01012903          	lw	s2,16(sp)
    2b10:	02010113          	addi	sp,sp,32
    2b14:	00008067          	ret
    2b18:	00040593          	mv	a1,s0
    2b1c:	00000097          	auipc	ra,0x0
    2b20:	eac080e7          	jalr	-340(ra) # 29c8 <fatfs_fat_writeback>
    2b24:	f60514e3          	bnez	a0,2a8c <fatfs_fat_read_sector+0x40>
    2b28:	fd1ff06f          	j	2af8 <fatfs_fat_read_sector+0xac>
    2b2c:	20842423          	sw	s0,520(s0)
    2b30:	00040913          	mv	s2,s0
    2b34:	fc5ff06f          	j	2af8 <fatfs_fat_read_sector+0xac>

00002b38 <_allocate_file>:
    2b38:	000067b7          	lui	a5,0x6
    2b3c:	2d078793          	addi	a5,a5,720 # 62d0 <_free_file_list>
    2b40:	0007a583          	lw	a1,0(a5)
    2b44:	06058263          	beqz	a1,2ba8 <_allocate_file+0x70>
    2b48:	0005a703          	lw	a4,0(a1)
    2b4c:	fe010113          	addi	sp,sp,-32
    2b50:	00112e23          	sw	ra,28(sp)
    2b54:	0045a683          	lw	a3,4(a1)
    2b58:	04071063          	bnez	a4,2b98 <_allocate_file+0x60>
    2b5c:	00d7a023          	sw	a3,0(a5)
    2b60:	0045a683          	lw	a3,4(a1)
    2b64:	02069e63          	bnez	a3,2ba0 <_allocate_file+0x68>
    2b68:	00e7a223          	sw	a4,4(a5)
    2b6c:	00006537          	lui	a0,0x6
    2b70:	2d850513          	addi	a0,a0,728 # 62d8 <_open_file_list>
    2b74:	00b12623          	sw	a1,12(sp)
    2b78:	00000097          	auipc	ra,0x0
    2b7c:	d48080e7          	jalr	-696(ra) # 28c0 <fat_list_insert_last>
    2b80:	00c12583          	lw	a1,12(sp)
    2b84:	01c12083          	lw	ra,28(sp)
    2b88:	bc458593          	addi	a1,a1,-1084
    2b8c:	00058513          	mv	a0,a1
    2b90:	02010113          	addi	sp,sp,32
    2b94:	00008067          	ret
    2b98:	00d72223          	sw	a3,4(a4)
    2b9c:	fc5ff06f          	j	2b60 <_allocate_file+0x28>
    2ba0:	00e6a023          	sw	a4,0(a3)
    2ba4:	fc9ff06f          	j	2b6c <_allocate_file+0x34>
    2ba8:	00058513          	mv	a0,a1
    2bac:	00008067          	ret

00002bb0 <_free_file>:
    2bb0:	43c52783          	lw	a5,1084(a0)
    2bb4:	44052703          	lw	a4,1088(a0)
    2bb8:	43c50593          	addi	a1,a0,1084
    2bbc:	02079663          	bnez	a5,2be8 <_free_file+0x38>
    2bc0:	000066b7          	lui	a3,0x6
    2bc4:	2ce6ac23          	sw	a4,728(a3) # 62d8 <_open_file_list>
    2bc8:	44052703          	lw	a4,1088(a0)
    2bcc:	02071263          	bnez	a4,2bf0 <_free_file+0x40>
    2bd0:	00006737          	lui	a4,0x6
    2bd4:	2cf72e23          	sw	a5,732(a4) # 62dc <_open_file_list+0x4>
    2bd8:	00006537          	lui	a0,0x6
    2bdc:	2d050513          	addi	a0,a0,720 # 62d0 <_free_file_list>
    2be0:	00000317          	auipc	t1,0x0
    2be4:	ce030067          	jr	-800(t1) # 28c0 <fat_list_insert_last>
    2be8:	00e7a223          	sw	a4,4(a5)
    2bec:	fddff06f          	j	2bc8 <_free_file+0x18>
    2bf0:	00f72023          	sw	a5,0(a4)
    2bf4:	fe5ff06f          	j	2bd8 <_free_file+0x28>

00002bf8 <fatfs_lba_of_cluster>:
    2bf8:	ff010113          	addi	sp,sp,-16
    2bfc:	00812423          	sw	s0,8(sp)
    2c00:	00112623          	sw	ra,12(sp)
    2c04:	00050413          	mv	s0,a0
    2c08:	ffe58513          	addi	a0,a1,-2
    2c0c:	00044583          	lbu	a1,0(s0)
    2c10:	00000097          	auipc	ra,0x0
    2c14:	c84080e7          	jalr	-892(ra) # 2894 <__mulsi3>
    2c18:	00442783          	lw	a5,4(s0)
    2c1c:	00f50533          	add	a0,a0,a5
    2c20:	03042783          	lw	a5,48(s0)
    2c24:	00079863          	bnez	a5,2c34 <fatfs_lba_of_cluster+0x3c>
    2c28:	02845783          	lhu	a5,40(s0)
    2c2c:	4047d793          	srai	a5,a5,0x4
    2c30:	00f50533          	add	a0,a0,a5
    2c34:	00c12083          	lw	ra,12(sp)
    2c38:	00812403          	lw	s0,8(sp)
    2c3c:	01010113          	addi	sp,sp,16
    2c40:	00008067          	ret

00002c44 <fatfs_sector_read>:
    2c44:	03452783          	lw	a5,52(a0)
    2c48:	00058713          	mv	a4,a1
    2c4c:	00070513          	mv	a0,a4
    2c50:	00060593          	mv	a1,a2
    2c54:	00068613          	mv	a2,a3
    2c58:	00078067          	jr	a5

00002c5c <fatfs_sector_write>:
    2c5c:	03852783          	lw	a5,56(a0)
    2c60:	00058713          	mv	a4,a1
    2c64:	00070513          	mv	a0,a4
    2c68:	00060593          	mv	a1,a2
    2c6c:	00068613          	mv	a2,a3
    2c70:	00078067          	jr	a5

00002c74 <fatfs_write_sector>:
    2c74:	03852703          	lw	a4,56(a0)
    2c78:	0a070463          	beqz	a4,2d20 <fatfs_write_sector+0xac>
    2c7c:	03052883          	lw	a7,48(a0)
    2c80:	00050793          	mv	a5,a0
    2c84:	0115e833          	or	a6,a1,a7
    2c88:	02081e63          	bnez	a6,2cc4 <fatfs_write_sector+0x50>
    2c8c:	01052583          	lw	a1,16(a0)
    2c90:	08b67863          	bgeu	a2,a1,2d20 <fatfs_write_sector+0xac>
    2c94:	01c52503          	lw	a0,28(a0)
    2c98:	00c7a583          	lw	a1,12(a5)
    2c9c:	00b50533          	add	a0,a0,a1
    2ca0:	00c50533          	add	a0,a0,a2
    2ca4:	00068863          	beqz	a3,2cb4 <fatfs_write_sector+0x40>
    2ca8:	00100613          	li	a2,1
    2cac:	00068593          	mv	a1,a3
    2cb0:	00070067          	jr	a4
    2cb4:	24a7a223          	sw	a0,580(a5)
    2cb8:	00100613          	li	a2,1
    2cbc:	04478593          	addi	a1,a5,68
    2cc0:	ff1ff06f          	j	2cb0 <fatfs_write_sector+0x3c>
    2cc4:	fe010113          	addi	sp,sp,-32
    2cc8:	00e12623          	sw	a4,12(sp)
    2ccc:	00d12423          	sw	a3,8(sp)
    2cd0:	00c12223          	sw	a2,4(sp)
    2cd4:	00112e23          	sw	ra,28(sp)
    2cd8:	00a12023          	sw	a0,0(sp)
    2cdc:	00000097          	auipc	ra,0x0
    2ce0:	f1c080e7          	jalr	-228(ra) # 2bf8 <fatfs_lba_of_cluster>
    2ce4:	00412603          	lw	a2,4(sp)
    2ce8:	00812683          	lw	a3,8(sp)
    2cec:	00012783          	lw	a5,0(sp)
    2cf0:	00c12703          	lw	a4,12(sp)
    2cf4:	00a60533          	add	a0,a2,a0
    2cf8:	00068c63          	beqz	a3,2d10 <fatfs_write_sector+0x9c>
    2cfc:	00100613          	li	a2,1
    2d00:	00068593          	mv	a1,a3
    2d04:	01c12083          	lw	ra,28(sp)
    2d08:	02010113          	addi	sp,sp,32
    2d0c:	fa5ff06f          	j	2cb0 <fatfs_write_sector+0x3c>
    2d10:	24a7a223          	sw	a0,580(a5)
    2d14:	00100613          	li	a2,1
    2d18:	04478593          	addi	a1,a5,68
    2d1c:	fe9ff06f          	j	2d04 <fatfs_write_sector+0x90>
    2d20:	00000513          	li	a0,0
    2d24:	00008067          	ret

00002d28 <fl_init>:
    2d28:	ff010113          	addi	sp,sp,-16
    2d2c:	00006537          	lui	a0,0x6
    2d30:	000067b7          	lui	a5,0x6
    2d34:	000085b7          	lui	a1,0x8
    2d38:	00112623          	sw	ra,12(sp)
    2d3c:	2d050513          	addi	a0,a0,720 # 62d0 <_free_file_list>
    2d40:	2d878793          	addi	a5,a5,728 # 62d8 <_open_file_list>
    2d44:	7a858593          	addi	a1,a1,1960 # 87a8 <_files+0x43c>
    2d48:	00052223          	sw	zero,4(a0)
    2d4c:	00052023          	sw	zero,0(a0)
    2d50:	0007a223          	sw	zero,4(a5)
    2d54:	0007a023          	sw	zero,0(a5)
    2d58:	00000097          	auipc	ra,0x0
    2d5c:	b68080e7          	jalr	-1176(ra) # 28c0 <fat_list_insert_last>
    2d60:	000067b7          	lui	a5,0x6
    2d64:	000095b7          	lui	a1,0x9
    2d68:	2d078513          	addi	a0,a5,720 # 62d0 <_free_file_list>
    2d6c:	bec58593          	addi	a1,a1,-1044 # 8bec <_files+0x880>
    2d70:	00000097          	auipc	ra,0x0
    2d74:	b50080e7          	jalr	-1200(ra) # 28c0 <fat_list_insert_last>
    2d78:	00c12083          	lw	ra,12(sp)
    2d7c:	000067b7          	lui	a5,0x6
    2d80:	00100713          	li	a4,1
    2d84:	2ee7a223          	sw	a4,740(a5) # 62e4 <_filelib_init>
    2d88:	01010113          	addi	sp,sp,16
    2d8c:	00008067          	ret

00002d90 <fl_fseek>:
    2d90:	000067b7          	lui	a5,0x6
    2d94:	2e47a783          	lw	a5,740(a5) # 62e4 <_filelib_init>
    2d98:	fd010113          	addi	sp,sp,-48
    2d9c:	02812423          	sw	s0,40(sp)
    2da0:	02912223          	sw	s1,36(sp)
    2da4:	01312e23          	sw	s3,28(sp)
    2da8:	02112623          	sw	ra,44(sp)
    2dac:	03212023          	sw	s2,32(sp)
    2db0:	00050413          	mv	s0,a0
    2db4:	00058493          	mv	s1,a1
    2db8:	00060993          	mv	s3,a2
    2dbc:	00079663          	bnez	a5,2dc8 <fl_fseek+0x38>
    2dc0:	00000097          	auipc	ra,0x0
    2dc4:	f68080e7          	jalr	-152(ra) # 2d28 <fl_init>
    2dc8:	fff00513          	li	a0,-1
    2dcc:	08040263          	beqz	s0,2e50 <fl_fseek+0xc0>
    2dd0:	00048663          	beqz	s1,2ddc <fl_fseek+0x4c>
    2dd4:	ffe98793          	addi	a5,s3,-2
    2dd8:	06078c63          	beqz	a5,2e50 <fl_fseek+0xc0>
    2ddc:	00008937          	lui	s2,0x8
    2de0:	f0490913          	addi	s2,s2,-252 # 7f04 <_fs>
    2de4:	03c92783          	lw	a5,60(s2)
    2de8:	00078463          	beqz	a5,2df0 <fl_fseek+0x60>
    2dec:	000780e7          	jalr	a5
    2df0:	fff00513          	li	a0,-1
    2df4:	42a42823          	sw	a0,1072(s0)
    2df8:	42042a23          	sw	zero,1076(s0)
    2dfc:	00099c63          	bnez	s3,2e14 <fl_fseek+0x84>
    2e00:	00c42783          	lw	a5,12(s0)
    2e04:	00942423          	sw	s1,8(s0)
    2e08:	0297f863          	bgeu	a5,s1,2e38 <fl_fseek+0xa8>
    2e0c:	00f42423          	sw	a5,8(s0)
    2e10:	0280006f          	j	2e38 <fl_fseek+0xa8>
    2e14:	00100793          	li	a5,1
    2e18:	06f99063          	bne	s3,a5,2e78 <fl_fseek+0xe8>
    2e1c:	00842783          	lw	a5,8(s0)
    2e20:	0004c663          	bltz	s1,2e2c <fl_fseek+0x9c>
    2e24:	00f484b3          	add	s1,s1,a5
    2e28:	fd9ff06f          	j	2e00 <fl_fseek+0x70>
    2e2c:	40900733          	neg	a4,s1
    2e30:	02e7fe63          	bgeu	a5,a4,2e6c <fl_fseek+0xdc>
    2e34:	00042423          	sw	zero,8(s0)
    2e38:	00000513          	li	a0,0
    2e3c:	04092783          	lw	a5,64(s2)
    2e40:	00078863          	beqz	a5,2e50 <fl_fseek+0xc0>
    2e44:	00a12623          	sw	a0,12(sp)
    2e48:	000780e7          	jalr	a5
    2e4c:	00c12503          	lw	a0,12(sp)
    2e50:	02c12083          	lw	ra,44(sp)
    2e54:	02812403          	lw	s0,40(sp)
    2e58:	02412483          	lw	s1,36(sp)
    2e5c:	02012903          	lw	s2,32(sp)
    2e60:	01c12983          	lw	s3,28(sp)
    2e64:	03010113          	addi	sp,sp,48
    2e68:	00008067          	ret
    2e6c:	00f484b3          	add	s1,s1,a5
    2e70:	00942423          	sw	s1,8(s0)
    2e74:	fc5ff06f          	j	2e38 <fl_fseek+0xa8>
    2e78:	00200793          	li	a5,2
    2e7c:	fcf990e3          	bne	s3,a5,2e3c <fl_fseek+0xac>
    2e80:	00c42783          	lw	a5,12(s0)
    2e84:	f89ff06f          	j	2e0c <fl_fseek+0x7c>

00002e88 <fl_closedir>:
    2e88:	00000513          	li	a0,0
    2e8c:	00008067          	ret

00002e90 <fatfs_lfn_cache_entry>:
    2e90:	0005c783          	lbu	a5,0(a1)
    2e94:	01300693          	li	a3,19
    2e98:	01f7f793          	andi	a5,a5,31
    2e9c:	fff78713          	addi	a4,a5,-1
    2ea0:	0ff77613          	zext.b	a2,a4
    2ea4:	0ac6ea63          	bltu	a3,a2,2f58 <fatfs_lfn_cache_entry+0xc8>
    2ea8:	10554683          	lbu	a3,261(a0)
    2eac:	00069463          	bnez	a3,2eb4 <fatfs_lfn_cache_entry+0x24>
    2eb0:	10f502a3          	sb	a5,261(a0)
    2eb4:	00171793          	slli	a5,a4,0x1
    2eb8:	00e787b3          	add	a5,a5,a4
    2ebc:	0015c683          	lbu	a3,1(a1)
    2ec0:	00279793          	slli	a5,a5,0x2
    2ec4:	00e787b3          	add	a5,a5,a4
    2ec8:	00f50533          	add	a0,a0,a5
    2ecc:	00d50023          	sb	a3,0(a0)
    2ed0:	0035c783          	lbu	a5,3(a1)
    2ed4:	0ff00713          	li	a4,255
    2ed8:	02000693          	li	a3,32
    2edc:	00f500a3          	sb	a5,1(a0)
    2ee0:	0055c783          	lbu	a5,5(a1)
    2ee4:	00f50123          	sb	a5,2(a0)
    2ee8:	0075c783          	lbu	a5,7(a1)
    2eec:	00f501a3          	sb	a5,3(a0)
    2ef0:	0095c783          	lbu	a5,9(a1)
    2ef4:	00f50223          	sb	a5,4(a0)
    2ef8:	00e5c783          	lbu	a5,14(a1)
    2efc:	00f502a3          	sb	a5,5(a0)
    2f00:	0105c783          	lbu	a5,16(a1)
    2f04:	00f50323          	sb	a5,6(a0)
    2f08:	0125c783          	lbu	a5,18(a1)
    2f0c:	00f503a3          	sb	a5,7(a0)
    2f10:	0145c783          	lbu	a5,20(a1)
    2f14:	00f50423          	sb	a5,8(a0)
    2f18:	0165c783          	lbu	a5,22(a1)
    2f1c:	00f504a3          	sb	a5,9(a0)
    2f20:	0185c783          	lbu	a5,24(a1)
    2f24:	00f50523          	sb	a5,10(a0)
    2f28:	01c5c783          	lbu	a5,28(a1)
    2f2c:	00f505a3          	sb	a5,11(a0)
    2f30:	01e5c783          	lbu	a5,30(a1)
    2f34:	00f50623          	sb	a5,12(a0)
    2f38:	00d00793          	li	a5,13
    2f3c:	00054603          	lbu	a2,0(a0)
    2f40:	00e61463          	bne	a2,a4,2f48 <fatfs_lfn_cache_entry+0xb8>
    2f44:	00d50023          	sb	a3,0(a0)
    2f48:	fff78793          	addi	a5,a5,-1
    2f4c:	0ff7f793          	zext.b	a5,a5
    2f50:	00150513          	addi	a0,a0,1
    2f54:	fe0794e3          	bnez	a5,2f3c <fatfs_lfn_cache_entry+0xac>
    2f58:	00008067          	ret

00002f5c <fatfs_lfn_cache_get>:
    2f5c:	10554703          	lbu	a4,261(a0)
    2f60:	01400793          	li	a5,20
    2f64:	00f71663          	bne	a4,a5,2f70 <fatfs_lfn_cache_get+0x14>
    2f68:	10050223          	sb	zero,260(a0)
    2f6c:	00008067          	ret
    2f70:	02070063          	beqz	a4,2f90 <fatfs_lfn_cache_get+0x34>
    2f74:	00171793          	slli	a5,a4,0x1
    2f78:	00e787b3          	add	a5,a5,a4
    2f7c:	00279793          	slli	a5,a5,0x2
    2f80:	00e787b3          	add	a5,a5,a4
    2f84:	00f507b3          	add	a5,a0,a5
    2f88:	00078023          	sb	zero,0(a5)
    2f8c:	00008067          	ret
    2f90:	00050023          	sb	zero,0(a0)
    2f94:	00008067          	ret

00002f98 <fatfs_entry_lfn_text>:
    2f98:	00b54503          	lbu	a0,11(a0)
    2f9c:	00f57513          	andi	a0,a0,15
    2fa0:	ff150513          	addi	a0,a0,-15
    2fa4:	00153513          	seqz	a0,a0
    2fa8:	00008067          	ret

00002fac <fatfs_entry_lfn_invalid>:
    2fac:	00054783          	lbu	a5,0(a0)
    2fb0:	f1b78713          	addi	a4,a5,-229
    2fb4:	02070263          	beqz	a4,2fd8 <fatfs_entry_lfn_invalid+0x2c>
    2fb8:	02078063          	beqz	a5,2fd8 <fatfs_entry_lfn_invalid+0x2c>
    2fbc:	00b54783          	lbu	a5,11(a0)
    2fc0:	00800713          	li	a4,8
    2fc4:	00100513          	li	a0,1
    2fc8:	00e78a63          	beq	a5,a4,2fdc <fatfs_entry_lfn_invalid+0x30>
    2fcc:	0067f793          	andi	a5,a5,6
    2fd0:	00f03533          	snez	a0,a5
    2fd4:	00008067          	ret
    2fd8:	00100513          	li	a0,1
    2fdc:	00008067          	ret

00002fe0 <fatfs_entry_lfn_exists>:
    2fe0:	00b5c783          	lbu	a5,11(a1)
    2fe4:	00f00713          	li	a4,15
    2fe8:	04e78063          	beq	a5,a4,3028 <fatfs_entry_lfn_exists+0x48>
    2fec:	0005c683          	lbu	a3,0(a1)
    2ff0:	f1b68713          	addi	a4,a3,-229
    2ff4:	00e03733          	snez	a4,a4
    2ff8:	00d036b3          	snez	a3,a3
    2ffc:	00d77733          	and	a4,a4,a3
    3000:	02070463          	beqz	a4,3028 <fatfs_entry_lfn_exists+0x48>
    3004:	ff878713          	addi	a4,a5,-8
    3008:	02070063          	beqz	a4,3028 <fatfs_entry_lfn_exists+0x48>
    300c:	0067f713          	andi	a4,a5,6
    3010:	00000793          	li	a5,0
    3014:	00071663          	bnez	a4,3020 <fatfs_entry_lfn_exists+0x40>
    3018:	10554783          	lbu	a5,261(a0)
    301c:	00f037b3          	snez	a5,a5
    3020:	00078513          	mv	a0,a5
    3024:	00008067          	ret
    3028:	00000793          	li	a5,0
    302c:	ff5ff06f          	j	3020 <fatfs_entry_lfn_exists+0x40>

00003030 <fatfs_entry_sfn_only>:
    3030:	00b54783          	lbu	a5,11(a0)
    3034:	00f00713          	li	a4,15
    3038:	02e78863          	beq	a5,a4,3068 <fatfs_entry_sfn_only+0x38>
    303c:	00054683          	lbu	a3,0(a0)
    3040:	f1b68713          	addi	a4,a3,-229
    3044:	00e03733          	snez	a4,a4
    3048:	00d036b3          	snez	a3,a3
    304c:	00d77733          	and	a4,a4,a3
    3050:	00070c63          	beqz	a4,3068 <fatfs_entry_sfn_only+0x38>
    3054:	ff878713          	addi	a4,a5,-8
    3058:	00070863          	beqz	a4,3068 <fatfs_entry_sfn_only+0x38>
    305c:	0067f513          	andi	a0,a5,6
    3060:	00153513          	seqz	a0,a0
    3064:	00008067          	ret
    3068:	00000513          	li	a0,0
    306c:	00008067          	ret

00003070 <fatfs_entry_is_dir>:
    3070:	00b54503          	lbu	a0,11(a0)
    3074:	00455513          	srli	a0,a0,0x4
    3078:	00157513          	andi	a0,a0,1
    307c:	00008067          	ret

00003080 <fatfs_lfn_entries_required>:
    3080:	ff010113          	addi	sp,sp,-16
    3084:	00112623          	sw	ra,12(sp)
    3088:	fffff097          	auipc	ra,0xfffff
    308c:	108080e7          	jalr	264(ra) # 2190 <strlen>
    3090:	00050a63          	beqz	a0,30a4 <fatfs_lfn_entries_required+0x24>
    3094:	00d00593          	li	a1,13
    3098:	00c50513          	addi	a0,a0,12
    309c:	fffff097          	auipc	ra,0xfffff
    30a0:	000080e7          	jalr	ra # 209c <__divsi3>
    30a4:	00c12083          	lw	ra,12(sp)
    30a8:	01010113          	addi	sp,sp,16
    30ac:	00008067          	ret

000030b0 <fatfs_filename_to_lfn>:
    30b0:	f9010113          	addi	sp,sp,-112
    30b4:	06812423          	sw	s0,104(sp)
    30b8:	00058413          	mv	s0,a1
    30bc:	000065b7          	lui	a1,0x6
    30c0:	08c58593          	addi	a1,a1,140 # 608c <font+0x1e0>
    30c4:	06912223          	sw	s1,100(sp)
    30c8:	05312e23          	sw	s3,92(sp)
    30cc:	00060493          	mv	s1,a2
    30d0:	00050993          	mv	s3,a0
    30d4:	03400613          	li	a2,52
    30d8:	01c10513          	addi	a0,sp,28
    30dc:	00d12623          	sw	a3,12(sp)
    30e0:	06112623          	sw	ra,108(sp)
    30e4:	07212023          	sw	s2,96(sp)
    30e8:	05412c23          	sw	s4,88(sp)
    30ec:	fffff097          	auipc	ra,0xfffff
    30f0:	080080e7          	jalr	128(ra) # 216c <memcpy>
    30f4:	00098513          	mv	a0,s3
    30f8:	fffff097          	auipc	ra,0xfffff
    30fc:	098080e7          	jalr	152(ra) # 2190 <strlen>
    3100:	00050913          	mv	s2,a0
    3104:	00098513          	mv	a0,s3
    3108:	00000097          	auipc	ra,0x0
    310c:	f78080e7          	jalr	-136(ra) # 3080 <fatfs_lfn_entries_required>
    3110:	00050a13          	mv	s4,a0
    3114:	02000613          	li	a2,32
    3118:	00000593          	li	a1,0
    311c:	00040513          	mv	a0,s0
    3120:	fffff097          	auipc	ra,0xfffff
    3124:	030080e7          	jalr	48(ra) # 2150 <memset>
    3128:	fffa0713          	addi	a4,s4,-1
    312c:	00c12683          	lw	a3,12(sp)
    3130:	00148793          	addi	a5,s1,1
    3134:	00971463          	bne	a4,s1,313c <fatfs_filename_to_lfn+0x8c>
    3138:	0407e793          	ori	a5,a5,64
    313c:	00149613          	slli	a2,s1,0x1
    3140:	00960633          	add	a2,a2,s1
    3144:	00f40023          	sb	a5,0(s0)
    3148:	00261613          	slli	a2,a2,0x2
    314c:	00f00793          	li	a5,15
    3150:	00f405a3          	sb	a5,11(s0)
    3154:	00d406a3          	sb	a3,13(s0)
    3158:	01c10793          	addi	a5,sp,28
    315c:	00960633          	add	a2,a2,s1
    3160:	fff00693          	li	a3,-1
    3164:	0007a703          	lw	a4,0(a5)
    3168:	00e40733          	add	a4,s0,a4
    316c:	05265063          	bge	a2,s2,31ac <fatfs_filename_to_lfn+0xfc>
    3170:	00c985b3          	add	a1,s3,a2
    3174:	0005c583          	lbu	a1,0(a1)
    3178:	00b70023          	sb	a1,0(a4)
    317c:	00478793          	addi	a5,a5,4
    3180:	05010713          	addi	a4,sp,80
    3184:	00160613          	addi	a2,a2,1
    3188:	fce79ee3          	bne	a5,a4,3164 <fatfs_filename_to_lfn+0xb4>
    318c:	06c12083          	lw	ra,108(sp)
    3190:	06812403          	lw	s0,104(sp)
    3194:	06412483          	lw	s1,100(sp)
    3198:	06012903          	lw	s2,96(sp)
    319c:	05c12983          	lw	s3,92(sp)
    31a0:	05812a03          	lw	s4,88(sp)
    31a4:	07010113          	addi	sp,sp,112
    31a8:	00008067          	ret
    31ac:	01261663          	bne	a2,s2,31b8 <fatfs_filename_to_lfn+0x108>
    31b0:	00070023          	sb	zero,0(a4)
    31b4:	fc9ff06f          	j	317c <fatfs_filename_to_lfn+0xcc>
    31b8:	00d70023          	sb	a3,0(a4)
    31bc:	00d700a3          	sb	a3,1(a4)
    31c0:	fbdff06f          	j	317c <fatfs_filename_to_lfn+0xcc>

000031c4 <fatfs_sfn_create_entry>:
    31c4:	00000793          	li	a5,0
    31c8:	00b00813          	li	a6,11
    31cc:	00f508b3          	add	a7,a0,a5
    31d0:	0008c303          	lbu	t1,0(a7)
    31d4:	00f688b3          	add	a7,a3,a5
    31d8:	00178793          	addi	a5,a5,1
    31dc:	00688023          	sb	t1,0(a7)
    31e0:	ff0796e3          	bne	a5,a6,31cc <fatfs_sfn_create_entry+0x8>
    31e4:	00e03733          	snez	a4,a4
    31e8:	40e00733          	neg	a4,a4
    31ec:	02000793          	li	a5,32
    31f0:	ff077713          	andi	a4,a4,-16
    31f4:	00f70733          	add	a4,a4,a5
    31f8:	00f68823          	sb	a5,16(a3)
    31fc:	00f68923          	sb	a5,18(a3)
    3200:	00f68c23          	sb	a5,24(a3)
    3204:	01065793          	srli	a5,a2,0x10
    3208:	00f68a23          	sb	a5,20(a3)
    320c:	01865793          	srli	a5,a2,0x18
    3210:	00f68aa3          	sb	a5,21(a3)
    3214:	0085d793          	srli	a5,a1,0x8
    3218:	00c68d23          	sb	a2,26(a3)
    321c:	00b68e23          	sb	a1,28(a3)
    3220:	00865613          	srli	a2,a2,0x8
    3224:	00f68ea3          	sb	a5,29(a3)
    3228:	0105d793          	srli	a5,a1,0x10
    322c:	0185d593          	srli	a1,a1,0x18
    3230:	000686a3          	sb	zero,13(a3)
    3234:	00068723          	sb	zero,14(a3)
    3238:	000687a3          	sb	zero,15(a3)
    323c:	000688a3          	sb	zero,17(a3)
    3240:	000689a3          	sb	zero,19(a3)
    3244:	00068b23          	sb	zero,22(a3)
    3248:	00068ba3          	sb	zero,23(a3)
    324c:	00068ca3          	sb	zero,25(a3)
    3250:	00e685a3          	sb	a4,11(a3)
    3254:	00068623          	sb	zero,12(a3)
    3258:	00c68da3          	sb	a2,27(a3)
    325c:	00f68f23          	sb	a5,30(a3)
    3260:	00b68fa3          	sb	a1,31(a3)
    3264:	00008067          	ret

00003268 <fatfs_lfn_create_sfn>:
    3268:	fd010113          	addi	sp,sp,-48
    326c:	02912223          	sw	s1,36(sp)
    3270:	00050493          	mv	s1,a0
    3274:	00058513          	mv	a0,a1
    3278:	02812423          	sw	s0,40(sp)
    327c:	01312e23          	sw	s3,28(sp)
    3280:	00058413          	mv	s0,a1
    3284:	02112623          	sw	ra,44(sp)
    3288:	03212023          	sw	s2,32(sp)
    328c:	fffff097          	auipc	ra,0xfffff
    3290:	f04080e7          	jalr	-252(ra) # 2190 <strlen>
    3294:	00044783          	lbu	a5,0(s0)
    3298:	02e00993          	li	s3,46
    329c:	15378063          	beq	a5,s3,33dc <fatfs_lfn_create_sfn+0x174>
    32a0:	00b00613          	li	a2,11
    32a4:	02000593          	li	a1,32
    32a8:	00050913          	mv	s2,a0
    32ac:	00048513          	mv	a0,s1
    32b0:	fffff097          	auipc	ra,0xfffff
    32b4:	ea0080e7          	jalr	-352(ra) # 2150 <memset>
    32b8:	00300613          	li	a2,3
    32bc:	02000593          	li	a1,32
    32c0:	00c10513          	addi	a0,sp,12
    32c4:	fffff097          	auipc	ra,0xfffff
    32c8:	e8c080e7          	jalr	-372(ra) # 2150 <memset>
    32cc:	fff00793          	li	a5,-1
    32d0:	00000713          	li	a4,0
    32d4:	0d274263          	blt	a4,s2,3398 <fatfs_lfn_create_sfn+0x130>
    32d8:	fff00713          	li	a4,-1
    32dc:	0ee78863          	beq	a5,a4,33cc <fatfs_lfn_create_sfn+0x164>
    32e0:	00178713          	addi	a4,a5,1
    32e4:	00c10693          	addi	a3,sp,12
    32e8:	00478613          	addi	a2,a5,4
    32ec:	0ce61263          	bne	a2,a4,33b0 <fatfs_lfn_create_sfn+0x148>
    32f0:	00000613          	li	a2,0
    32f4:	00000693          	li	a3,0
    32f8:	01900813          	li	a6,25
    32fc:	00800893          	li	a7,8
    3300:	02f6de63          	bge	a3,a5,333c <fatfs_lfn_create_sfn+0xd4>
    3304:	00d40733          	add	a4,s0,a3
    3308:	00074703          	lbu	a4,0(a4)
    330c:	fe070513          	addi	a0,a4,-32
    3310:	0c050263          	beqz	a0,33d4 <fatfs_lfn_create_sfn+0x16c>
    3314:	fd270593          	addi	a1,a4,-46
    3318:	0a058e63          	beqz	a1,33d4 <fatfs_lfn_create_sfn+0x16c>
    331c:	f9f70593          	addi	a1,a4,-97
    3320:	0ff5f593          	zext.b	a1,a1
    3324:	00c48333          	add	t1,s1,a2
    3328:	00160613          	addi	a2,a2,1
    332c:	00b86463          	bltu	a6,a1,3334 <fatfs_lfn_create_sfn+0xcc>
    3330:	0ff57713          	zext.b	a4,a0
    3334:	00e30023          	sb	a4,0(t1)
    3338:	09161e63          	bne	a2,a7,33d4 <fatfs_lfn_create_sfn+0x16c>
    333c:	00c10793          	addi	a5,sp,12
    3340:	00800693          	li	a3,8
    3344:	01900513          	li	a0,25
    3348:	00b00593          	li	a1,11
    334c:	0007c703          	lbu	a4,0(a5)
    3350:	f9f70613          	addi	a2,a4,-97
    3354:	0ff67613          	zext.b	a2,a2
    3358:	00c56663          	bltu	a0,a2,3364 <fatfs_lfn_create_sfn+0xfc>
    335c:	fe070713          	addi	a4,a4,-32
    3360:	0ff77713          	zext.b	a4,a4
    3364:	00d48633          	add	a2,s1,a3
    3368:	00e60023          	sb	a4,0(a2)
    336c:	00168693          	addi	a3,a3,1
    3370:	00178793          	addi	a5,a5,1
    3374:	fcb69ce3          	bne	a3,a1,334c <fatfs_lfn_create_sfn+0xe4>
    3378:	00100513          	li	a0,1
    337c:	02c12083          	lw	ra,44(sp)
    3380:	02812403          	lw	s0,40(sp)
    3384:	02412483          	lw	s1,36(sp)
    3388:	02012903          	lw	s2,32(sp)
    338c:	01c12983          	lw	s3,28(sp)
    3390:	03010113          	addi	sp,sp,48
    3394:	00008067          	ret
    3398:	00e406b3          	add	a3,s0,a4
    339c:	0006c683          	lbu	a3,0(a3)
    33a0:	01369463          	bne	a3,s3,33a8 <fatfs_lfn_create_sfn+0x140>
    33a4:	00070793          	mv	a5,a4
    33a8:	00170713          	addi	a4,a4,1
    33ac:	f29ff06f          	j	32d4 <fatfs_lfn_create_sfn+0x6c>
    33b0:	01275863          	bge	a4,s2,33c0 <fatfs_lfn_create_sfn+0x158>
    33b4:	00e405b3          	add	a1,s0,a4
    33b8:	0005c583          	lbu	a1,0(a1)
    33bc:	00b68023          	sb	a1,0(a3)
    33c0:	00170713          	addi	a4,a4,1
    33c4:	00168693          	addi	a3,a3,1
    33c8:	f25ff06f          	j	32ec <fatfs_lfn_create_sfn+0x84>
    33cc:	00090793          	mv	a5,s2
    33d0:	f21ff06f          	j	32f0 <fatfs_lfn_create_sfn+0x88>
    33d4:	00168693          	addi	a3,a3,1
    33d8:	f29ff06f          	j	3300 <fatfs_lfn_create_sfn+0x98>
    33dc:	00000513          	li	a0,0
    33e0:	f9dff06f          	j	337c <fatfs_lfn_create_sfn+0x114>

000033e4 <fatfs_lfn_generate_tail>:
    33e4:	000187b7          	lui	a5,0x18
    33e8:	69f78793          	addi	a5,a5,1695 # 1869f <__stacktop+0x869f>
    33ec:	16c7e463          	bltu	a5,a2,3554 <fatfs_lfn_generate_tail+0x170>
    33f0:	fa010113          	addi	sp,sp,-96
    33f4:	04812c23          	sw	s0,88(sp)
    33f8:	04912a23          	sw	s1,84(sp)
    33fc:	03712e23          	sw	s7,60(sp)
    3400:	00060413          	mv	s0,a2
    3404:	00058b93          	mv	s7,a1
    3408:	00c00613          	li	a2,12
    340c:	00000593          	li	a1,0
    3410:	00050493          	mv	s1,a0
    3414:	00410513          	addi	a0,sp,4
    3418:	04112e23          	sw	ra,92(sp)
    341c:	05312623          	sw	s3,76(sp)
    3420:	05412423          	sw	s4,72(sp)
    3424:	05612023          	sw	s6,64(sp)
    3428:	05212823          	sw	s2,80(sp)
    342c:	05512223          	sw	s5,68(sp)
    3430:	fffff097          	auipc	ra,0xfffff
    3434:	d20080e7          	jalr	-736(ra) # 2150 <memset>
    3438:	000065b7          	lui	a1,0x6
    343c:	07e00793          	li	a5,126
    3440:	01100613          	li	a2,17
    3444:	e6458593          	addi	a1,a1,-412 # 5e64 <LEDS+0x138>
    3448:	01c10513          	addi	a0,sp,28
    344c:	01010993          	addi	s3,sp,16
    3450:	00f10223          	sb	a5,4(sp)
    3454:	00098a13          	mv	s4,s3
    3458:	fffff097          	auipc	ra,0xfffff
    345c:	d14080e7          	jalr	-748(ra) # 216c <memcpy>
    3460:	00900b13          	li	s6,9
    3464:	00a00593          	li	a1,10
    3468:	00040513          	mv	a0,s0
    346c:	fffff097          	auipc	ra,0xfffff
    3470:	c80080e7          	jalr	-896(ra) # 20ec <__umodsi3>
    3474:	03050793          	addi	a5,a0,48
    3478:	00278533          	add	a0,a5,sp
    347c:	fec54783          	lbu	a5,-20(a0)
    3480:	00098913          	mv	s2,s3
    3484:	00040513          	mv	a0,s0
    3488:	00a00593          	li	a1,10
    348c:	00f98023          	sb	a5,0(s3)
    3490:	00040a93          	mv	s5,s0
    3494:	fffff097          	auipc	ra,0xfffff
    3498:	c10080e7          	jalr	-1008(ra) # 20a4 <__udivsi3>
    349c:	00198993          	addi	s3,s3,1
    34a0:	00050413          	mv	s0,a0
    34a4:	fd5b60e3          	bltu	s6,s5,3464 <fatfs_lfn_generate_tail+0x80>
    34a8:	00098023          	sb	zero,0(s3)
    34ac:	00410713          	addi	a4,sp,4
    34b0:	00090793          	mv	a5,s2
    34b4:	0947f663          	bgeu	a5,s4,3540 <fatfs_lfn_generate_tail+0x15c>
    34b8:	00f10713          	addi	a4,sp,15
    34bc:	00000793          	li	a5,0
    34c0:	00e96663          	bltu	s2,a4,34cc <fatfs_lfn_generate_tail+0xe8>
    34c4:	41490933          	sub	s2,s2,s4
    34c8:	00190793          	addi	a5,s2,1
    34cc:	03078793          	addi	a5,a5,48
    34d0:	002787b3          	add	a5,a5,sp
    34d4:	000b8593          	mv	a1,s7
    34d8:	fc078aa3          	sb	zero,-43(a5)
    34dc:	00b00613          	li	a2,11
    34e0:	00048513          	mv	a0,s1
    34e4:	fffff097          	auipc	ra,0xfffff
    34e8:	c88080e7          	jalr	-888(ra) # 216c <memcpy>
    34ec:	00410513          	addi	a0,sp,4
    34f0:	fffff097          	auipc	ra,0xfffff
    34f4:	ca0080e7          	jalr	-864(ra) # 2190 <strlen>
    34f8:	40a484b3          	sub	s1,s1,a0
    34fc:	00050613          	mv	a2,a0
    3500:	00410593          	addi	a1,sp,4
    3504:	00848513          	addi	a0,s1,8
    3508:	fffff097          	auipc	ra,0xfffff
    350c:	c64080e7          	jalr	-924(ra) # 216c <memcpy>
    3510:	05c12083          	lw	ra,92(sp)
    3514:	05812403          	lw	s0,88(sp)
    3518:	05412483          	lw	s1,84(sp)
    351c:	05012903          	lw	s2,80(sp)
    3520:	04c12983          	lw	s3,76(sp)
    3524:	04812a03          	lw	s4,72(sp)
    3528:	04412a83          	lw	s5,68(sp)
    352c:	04012b03          	lw	s6,64(sp)
    3530:	03c12b83          	lw	s7,60(sp)
    3534:	00100513          	li	a0,1
    3538:	06010113          	addi	sp,sp,96
    353c:	00008067          	ret
    3540:	0007c683          	lbu	a3,0(a5)
    3544:	00170713          	addi	a4,a4,1
    3548:	fff78793          	addi	a5,a5,-1
    354c:	00d70023          	sb	a3,0(a4)
    3550:	f65ff06f          	j	34b4 <fatfs_lfn_generate_tail+0xd0>
    3554:	00000513          	li	a0,0
    3558:	00008067          	ret

0000355c <fatfs_total_path_levels>:
    355c:	fff00793          	li	a5,-1
    3560:	06050263          	beqz	a0,35c4 <fatfs_total_path_levels+0x68>
    3564:	00054703          	lbu	a4,0(a0)
    3568:	02f00793          	li	a5,47
    356c:	00f71863          	bne	a4,a5,357c <fatfs_total_path_levels+0x20>
    3570:	00150513          	addi	a0,a0,1
    3574:	00000793          	li	a5,0
    3578:	0400006f          	j	35b8 <fatfs_total_path_levels+0x5c>
    357c:	00154703          	lbu	a4,1(a0)
    3580:	03a00793          	li	a5,58
    3584:	00f70a63          	beq	a4,a5,3598 <fatfs_total_path_levels+0x3c>
    3588:	00254683          	lbu	a3,2(a0)
    358c:	05c00713          	li	a4,92
    3590:	fff00793          	li	a5,-1
    3594:	02e69863          	bne	a3,a4,35c4 <fatfs_total_path_levels+0x68>
    3598:	00350513          	addi	a0,a0,3
    359c:	05c00713          	li	a4,92
    35a0:	fd5ff06f          	j	3574 <fatfs_total_path_levels+0x18>
    35a4:	00150513          	addi	a0,a0,1
    35a8:	00e68663          	beq	a3,a4,35b4 <fatfs_total_path_levels+0x58>
    35ac:	00054683          	lbu	a3,0(a0)
    35b0:	fe069ae3          	bnez	a3,35a4 <fatfs_total_path_levels+0x48>
    35b4:	00178793          	addi	a5,a5,1
    35b8:	00054683          	lbu	a3,0(a0)
    35bc:	fe0698e3          	bnez	a3,35ac <fatfs_total_path_levels+0x50>
    35c0:	fff78793          	addi	a5,a5,-1
    35c4:	00078513          	mv	a0,a5
    35c8:	00008067          	ret

000035cc <fatfs_get_substring>:
    35cc:	0cd05e63          	blez	a3,36a8 <fatfs_get_substring+0xdc>
    35d0:	0c050c63          	beqz	a0,36a8 <fatfs_get_substring+0xdc>
    35d4:	fe010113          	addi	sp,sp,-32
    35d8:	00812c23          	sw	s0,24(sp)
    35dc:	00112e23          	sw	ra,28(sp)
    35e0:	00912a23          	sw	s1,20(sp)
    35e4:	00054483          	lbu	s1,0(a0)
    35e8:	02f00793          	li	a5,47
    35ec:	00150413          	addi	s0,a0,1
    35f0:	02f48463          	beq	s1,a5,3618 <fatfs_get_substring+0x4c>
    35f4:	00154703          	lbu	a4,1(a0)
    35f8:	03a00793          	li	a5,58
    35fc:	00f70a63          	beq	a4,a5,3610 <fatfs_get_substring+0x44>
    3600:	00254803          	lbu	a6,2(a0)
    3604:	05c00713          	li	a4,92
    3608:	fff00793          	li	a5,-1
    360c:	04e81c63          	bne	a6,a4,3664 <fatfs_get_substring+0x98>
    3610:	00350413          	addi	s0,a0,3
    3614:	05c00493          	li	s1,92
    3618:	00040513          	mv	a0,s0
    361c:	00d12623          	sw	a3,12(sp)
    3620:	00c12423          	sw	a2,8(sp)
    3624:	00b12223          	sw	a1,4(sp)
    3628:	fffff097          	auipc	ra,0xfffff
    362c:	b68080e7          	jalr	-1176(ra) # 2190 <strlen>
    3630:	00c12683          	lw	a3,12(sp)
    3634:	00412583          	lw	a1,4(sp)
    3638:	00812603          	lw	a2,8(sp)
    363c:	00000713          	li	a4,0
    3640:	00000813          	li	a6,0
    3644:	00000793          	li	a5,0
    3648:	fff68693          	addi	a3,a3,-1
    364c:	00e608b3          	add	a7,a2,a4
    3650:	02a7c663          	blt	a5,a0,367c <fatfs_get_substring+0xb0>
    3654:	00088023          	sb	zero,0(a7)
    3658:	00064783          	lbu	a5,0(a2)
    365c:	0017b793          	seqz	a5,a5
    3660:	40f007b3          	neg	a5,a5
    3664:	01c12083          	lw	ra,28(sp)
    3668:	01812403          	lw	s0,24(sp)
    366c:	01412483          	lw	s1,20(sp)
    3670:	00078513          	mv	a0,a5
    3674:	02010113          	addi	sp,sp,32
    3678:	00008067          	ret
    367c:	00f40333          	add	t1,s0,a5
    3680:	00034303          	lbu	t1,0(t1)
    3684:	00931863          	bne	t1,s1,3694 <fatfs_get_substring+0xc8>
    3688:	00180813          	addi	a6,a6,1
    368c:	00178793          	addi	a5,a5,1
    3690:	fbdff06f          	j	364c <fatfs_get_substring+0x80>
    3694:	feb81ce3          	bne	a6,a1,368c <fatfs_get_substring+0xc0>
    3698:	fed75ae3          	bge	a4,a3,368c <fatfs_get_substring+0xc0>
    369c:	00170713          	addi	a4,a4,1
    36a0:	00688023          	sb	t1,0(a7)
    36a4:	fe9ff06f          	j	368c <fatfs_get_substring+0xc0>
    36a8:	fff00793          	li	a5,-1
    36ac:	00078513          	mv	a0,a5
    36b0:	00008067          	ret

000036b4 <fatfs_split_path>:
    36b4:	fd010113          	addi	sp,sp,-48
    36b8:	02912223          	sw	s1,36(sp)
    36bc:	03212023          	sw	s2,32(sp)
    36c0:	01312e23          	sw	s3,28(sp)
    36c4:	01412c23          	sw	s4,24(sp)
    36c8:	02112623          	sw	ra,44(sp)
    36cc:	02812423          	sw	s0,40(sp)
    36d0:	01512a23          	sw	s5,20(sp)
    36d4:	00050993          	mv	s3,a0
    36d8:	00058493          	mv	s1,a1
    36dc:	00060913          	mv	s2,a2
    36e0:	00068a13          	mv	s4,a3
    36e4:	00e12623          	sw	a4,12(sp)
    36e8:	00000097          	auipc	ra,0x0
    36ec:	e74080e7          	jalr	-396(ra) # 355c <fatfs_total_path_levels>
    36f0:	fff00793          	li	a5,-1
    36f4:	02f51863          	bne	a0,a5,3724 <fatfs_split_path+0x70>
    36f8:	fff00413          	li	s0,-1
    36fc:	02c12083          	lw	ra,44(sp)
    3700:	00040513          	mv	a0,s0
    3704:	02812403          	lw	s0,40(sp)
    3708:	02412483          	lw	s1,36(sp)
    370c:	02012903          	lw	s2,32(sp)
    3710:	01c12983          	lw	s3,28(sp)
    3714:	01812a03          	lw	s4,24(sp)
    3718:	01412a83          	lw	s5,20(sp)
    371c:	03010113          	addi	sp,sp,48
    3720:	00008067          	ret
    3724:	00c12683          	lw	a3,12(sp)
    3728:	00050593          	mv	a1,a0
    372c:	00a12623          	sw	a0,12(sp)
    3730:	000a0613          	mv	a2,s4
    3734:	00098513          	mv	a0,s3
    3738:	00000097          	auipc	ra,0x0
    373c:	e94080e7          	jalr	-364(ra) # 35cc <fatfs_get_substring>
    3740:	00050413          	mv	s0,a0
    3744:	fa051ae3          	bnez	a0,36f8 <fatfs_split_path+0x44>
    3748:	00c12583          	lw	a1,12(sp)
    374c:	00059663          	bnez	a1,3758 <fatfs_split_path+0xa4>
    3750:	00048023          	sb	zero,0(s1)
    3754:	fa9ff06f          	j	36fc <fatfs_split_path+0x48>
    3758:	00098513          	mv	a0,s3
    375c:	fffff097          	auipc	ra,0xfffff
    3760:	a34080e7          	jalr	-1484(ra) # 2190 <strlen>
    3764:	00050a93          	mv	s5,a0
    3768:	000a0513          	mv	a0,s4
    376c:	fffff097          	auipc	ra,0xfffff
    3770:	a24080e7          	jalr	-1500(ra) # 2190 <strlen>
    3774:	40aa8633          	sub	a2,s5,a0
    3778:	00c95463          	bge	s2,a2,3780 <fatfs_split_path+0xcc>
    377c:	00090613          	mv	a2,s2
    3780:	00048513          	mv	a0,s1
    3784:	00098593          	mv	a1,s3
    3788:	00c12623          	sw	a2,12(sp)
    378c:	fffff097          	auipc	ra,0xfffff
    3790:	9e0080e7          	jalr	-1568(ra) # 216c <memcpy>
    3794:	00c12603          	lw	a2,12(sp)
    3798:	00c484b3          	add	s1,s1,a2
    379c:	fe048fa3          	sb	zero,-1(s1)
    37a0:	f5dff06f          	j	36fc <fatfs_split_path+0x48>

000037a4 <fatfs_compare_names>:
    37a4:	fd010113          	addi	sp,sp,-48
    37a8:	02112623          	sw	ra,44(sp)
    37ac:	03212023          	sw	s2,32(sp)
    37b0:	01312e23          	sw	s3,28(sp)
    37b4:	01412c23          	sw	s4,24(sp)
    37b8:	01512a23          	sw	s5,20(sp)
    37bc:	00058a13          	mv	s4,a1
    37c0:	02812423          	sw	s0,40(sp)
    37c4:	02912223          	sw	s1,36(sp)
    37c8:	01612823          	sw	s6,16(sp)
    37cc:	01712623          	sw	s7,12(sp)
    37d0:	01812423          	sw	s8,8(sp)
    37d4:	00050a93          	mv	s5,a0
    37d8:	fffff097          	auipc	ra,0xfffff
    37dc:	1c4080e7          	jalr	452(ra) # 299c <FileString_GetExtension>
    37e0:	00050993          	mv	s3,a0
    37e4:	000a0513          	mv	a0,s4
    37e8:	fffff097          	auipc	ra,0xfffff
    37ec:	1b4080e7          	jalr	436(ra) # 299c <FileString_GetExtension>
    37f0:	fff00793          	li	a5,-1
    37f4:	00050913          	mv	s2,a0
    37f8:	02f99e63          	bne	s3,a5,3834 <fatfs_compare_names+0x90>
    37fc:	0f350063          	beq	a0,s3,38dc <fatfs_compare_names+0x138>
    3800:	00000513          	li	a0,0
    3804:	02c12083          	lw	ra,44(sp)
    3808:	02812403          	lw	s0,40(sp)
    380c:	02412483          	lw	s1,36(sp)
    3810:	02012903          	lw	s2,32(sp)
    3814:	01c12983          	lw	s3,28(sp)
    3818:	01812a03          	lw	s4,24(sp)
    381c:	01412a83          	lw	s5,20(sp)
    3820:	01012b03          	lw	s6,16(sp)
    3824:	00c12b83          	lw	s7,12(sp)
    3828:	00812c03          	lw	s8,8(sp)
    382c:	03010113          	addi	sp,sp,48
    3830:	00008067          	ret
    3834:	fcf506e3          	beq	a0,a5,3800 <fatfs_compare_names+0x5c>
    3838:	00198793          	addi	a5,s3,1
    383c:	00fa8b33          	add	s6,s5,a5
    3840:	00050413          	mv	s0,a0
    3844:	00150793          	addi	a5,a0,1
    3848:	000b0513          	mv	a0,s6
    384c:	00fa0bb3          	add	s7,s4,a5
    3850:	fffff097          	auipc	ra,0xfffff
    3854:	940080e7          	jalr	-1728(ra) # 2190 <strlen>
    3858:	00050c13          	mv	s8,a0
    385c:	000b8513          	mv	a0,s7
    3860:	00098493          	mv	s1,s3
    3864:	fffff097          	auipc	ra,0xfffff
    3868:	92c080e7          	jalr	-1748(ra) # 2190 <strlen>
    386c:	f8ac1ae3          	bne	s8,a0,3800 <fatfs_compare_names+0x5c>
    3870:	000b0513          	mv	a0,s6
    3874:	fffff097          	auipc	ra,0xfffff
    3878:	91c080e7          	jalr	-1764(ra) # 2190 <strlen>
    387c:	00050613          	mv	a2,a0
    3880:	000b8593          	mv	a1,s7
    3884:	000b0513          	mv	a0,s6
    3888:	fffff097          	auipc	ra,0xfffff
    388c:	0a4080e7          	jalr	164(ra) # 292c <FileString_StrCmpNoCase>
    3890:	f60518e3          	bnez	a0,3800 <fatfs_compare_names+0x5c>
    3894:	fff48793          	addi	a5,s1,-1
    3898:	00fa87b3          	add	a5,s5,a5
    389c:	41378733          	sub	a4,a5,s3
    38a0:	02000693          	li	a3,32
    38a4:	06e79263          	bne	a5,a4,3908 <fatfs_compare_names+0x164>
    38a8:	fff40793          	addi	a5,s0,-1
    38ac:	00fa07b3          	add	a5,s4,a5
    38b0:	41278733          	sub	a4,a5,s2
    38b4:	02000693          	li	a3,32
    38b8:	06e79263          	bne	a5,a4,391c <fatfs_compare_names+0x178>
    38bc:	f53912e3          	bne	s2,s3,3800 <fatfs_compare_names+0x5c>
    38c0:	00090613          	mv	a2,s2
    38c4:	000a0593          	mv	a1,s4
    38c8:	000a8513          	mv	a0,s5
    38cc:	fffff097          	auipc	ra,0xfffff
    38d0:	060080e7          	jalr	96(ra) # 292c <FileString_StrCmpNoCase>
    38d4:	00153513          	seqz	a0,a0
    38d8:	f2dff06f          	j	3804 <fatfs_compare_names+0x60>
    38dc:	000a8513          	mv	a0,s5
    38e0:	fffff097          	auipc	ra,0xfffff
    38e4:	8b0080e7          	jalr	-1872(ra) # 2190 <strlen>
    38e8:	00050493          	mv	s1,a0
    38ec:	00050993          	mv	s3,a0
    38f0:	000a0513          	mv	a0,s4
    38f4:	fffff097          	auipc	ra,0xfffff
    38f8:	89c080e7          	jalr	-1892(ra) # 2190 <strlen>
    38fc:	00050413          	mv	s0,a0
    3900:	00050913          	mv	s2,a0
    3904:	f91ff06f          	j	3894 <fatfs_compare_names+0xf0>
    3908:	0007c603          	lbu	a2,0(a5)
    390c:	f8d61ee3          	bne	a2,a3,38a8 <fatfs_compare_names+0x104>
    3910:	415789b3          	sub	s3,a5,s5
    3914:	fff78793          	addi	a5,a5,-1
    3918:	f8dff06f          	j	38a4 <fatfs_compare_names+0x100>
    391c:	0007c603          	lbu	a2,0(a5)
    3920:	f8d61ee3          	bne	a2,a3,38bc <fatfs_compare_names+0x118>
    3924:	41478933          	sub	s2,a5,s4
    3928:	fff78793          	addi	a5,a5,-1
    392c:	f8dff06f          	j	38b8 <fatfs_compare_names+0x114>

00003930 <_check_file_open>:
    3930:	fe010113          	addi	sp,sp,-32
    3934:	000067b7          	lui	a5,0x6
    3938:	00812c23          	sw	s0,24(sp)
    393c:	2d87a403          	lw	s0,728(a5) # 62d8 <_open_file_list>
    3940:	00912a23          	sw	s1,20(sp)
    3944:	00112e23          	sw	ra,28(sp)
    3948:	01212823          	sw	s2,16(sp)
    394c:	01312623          	sw	s3,12(sp)
    3950:	00050493          	mv	s1,a0
    3954:	00041663          	bnez	s0,3960 <_check_file_open+0x30>
    3958:	00000513          	li	a0,0
    395c:	03c0006f          	j	3998 <_check_file_open+0x68>
    3960:	bc440793          	addi	a5,s0,-1084
    3964:	00f49663          	bne	s1,a5,3970 <_check_file_open+0x40>
    3968:	00442403          	lw	s0,4(s0)
    396c:	fe9ff06f          	j	3954 <_check_file_open+0x24>
    3970:	01448593          	addi	a1,s1,20
    3974:	bd840513          	addi	a0,s0,-1064
    3978:	00000097          	auipc	ra,0x0
    397c:	e2c080e7          	jalr	-468(ra) # 37a4 <fatfs_compare_names>
    3980:	fe0504e3          	beqz	a0,3968 <_check_file_open+0x38>
    3984:	11848593          	addi	a1,s1,280
    3988:	cdc40513          	addi	a0,s0,-804
    398c:	00000097          	auipc	ra,0x0
    3990:	e18080e7          	jalr	-488(ra) # 37a4 <fatfs_compare_names>
    3994:	fc050ae3          	beqz	a0,3968 <_check_file_open+0x38>
    3998:	01c12083          	lw	ra,28(sp)
    399c:	01812403          	lw	s0,24(sp)
    39a0:	01412483          	lw	s1,20(sp)
    39a4:	01012903          	lw	s2,16(sp)
    39a8:	00c12983          	lw	s3,12(sp)
    39ac:	02010113          	addi	sp,sp,32
    39b0:	00008067          	ret

000039b4 <fatfs_get_sfn_display_name>:
    39b4:	00000713          	li	a4,0
    39b8:	02000613          	li	a2,32
    39bc:	01900813          	li	a6,25
    39c0:	0005c783          	lbu	a5,0(a1)
    39c4:	00078663          	beqz	a5,39d0 <fatfs_get_sfn_display_name+0x1c>
    39c8:	ff470693          	addi	a3,a4,-12
    39cc:	00069863          	bnez	a3,39dc <fatfs_get_sfn_display_name+0x28>
    39d0:	00050023          	sb	zero,0(a0)
    39d4:	00100513          	li	a0,1
    39d8:	00008067          	ret
    39dc:	00158593          	addi	a1,a1,1
    39e0:	fec780e3          	beq	a5,a2,39c0 <fatfs_get_sfn_display_name+0xc>
    39e4:	fbf78693          	addi	a3,a5,-65
    39e8:	0ff6f693          	zext.b	a3,a3
    39ec:	00d86663          	bltu	a6,a3,39f8 <fatfs_get_sfn_display_name+0x44>
    39f0:	02078793          	addi	a5,a5,32
    39f4:	0ff7f793          	zext.b	a5,a5
    39f8:	00f50023          	sb	a5,0(a0)
    39fc:	00170713          	addi	a4,a4,1
    3a00:	00150513          	addi	a0,a0,1
    3a04:	fbdff06f          	j	39c0 <fatfs_get_sfn_display_name+0xc>

00003a08 <fatfs_fat_init>:
    3a08:	ff010113          	addi	sp,sp,-16
    3a0c:	00812423          	sw	s0,8(sp)
    3a10:	00912223          	sw	s1,4(sp)
    3a14:	00112623          	sw	ra,12(sp)
    3a18:	fff00793          	li	a5,-1
    3a1c:	25850493          	addi	s1,a0,600
    3a20:	00050413          	mv	s0,a0
    3a24:	44f52c23          	sw	a5,1112(a0)
    3a28:	24052a23          	sw	zero,596(a0)
    3a2c:	44052e23          	sw	zero,1116(a0)
    3a30:	20000613          	li	a2,512
    3a34:	00048513          	mv	a0,s1
    3a38:	00000593          	li	a1,0
    3a3c:	ffffe097          	auipc	ra,0xffffe
    3a40:	714080e7          	jalr	1812(ra) # 2150 <memset>
    3a44:	25442783          	lw	a5,596(s0)
    3a48:	00c12083          	lw	ra,12(sp)
    3a4c:	24942a23          	sw	s1,596(s0)
    3a50:	46042023          	sw	zero,1120(s0)
    3a54:	46f42223          	sw	a5,1124(s0)
    3a58:	00812403          	lw	s0,8(sp)
    3a5c:	00412483          	lw	s1,4(sp)
    3a60:	01010113          	addi	sp,sp,16
    3a64:	00008067          	ret

00003a68 <fatfs_init>:
    3a68:	fd010113          	addi	sp,sp,-48
    3a6c:	02812423          	sw	s0,40(sp)
    3a70:	02112623          	sw	ra,44(sp)
    3a74:	02912223          	sw	s1,36(sp)
    3a78:	03212023          	sw	s2,32(sp)
    3a7c:	01312e23          	sw	s3,28(sp)
    3a80:	fff00793          	li	a5,-1
    3a84:	24f52223          	sw	a5,580(a0)
    3a88:	24052423          	sw	zero,584(a0)
    3a8c:	02052223          	sw	zero,36(a0)
    3a90:	00050413          	mv	s0,a0
    3a94:	00000097          	auipc	ra,0x0
    3a98:	f74080e7          	jalr	-140(ra) # 3a08 <fatfs_fat_init>
    3a9c:	03442783          	lw	a5,52(s0)
    3aa0:	02079463          	bnez	a5,3ac8 <fatfs_init+0x60>
    3aa4:	fff00713          	li	a4,-1
    3aa8:	02c12083          	lw	ra,44(sp)
    3aac:	02812403          	lw	s0,40(sp)
    3ab0:	02412483          	lw	s1,36(sp)
    3ab4:	02012903          	lw	s2,32(sp)
    3ab8:	01c12983          	lw	s3,28(sp)
    3abc:	00070513          	mv	a0,a4
    3ac0:	03010113          	addi	sp,sp,48
    3ac4:	00008067          	ret
    3ac8:	04440593          	addi	a1,s0,68
    3acc:	00100613          	li	a2,1
    3ad0:	00000513          	li	a0,0
    3ad4:	00b12623          	sw	a1,12(sp)
    3ad8:	000780e7          	jalr	a5
    3adc:	fc0504e3          	beqz	a0,3aa4 <fatfs_init+0x3c>
    3ae0:	24244703          	lbu	a4,578(s0)
    3ae4:	05500793          	li	a5,85
    3ae8:	00c12583          	lw	a1,12(sp)
    3aec:	00f70663          	beq	a4,a5,3af8 <fatfs_init+0x90>
    3af0:	ffd00713          	li	a4,-3
    3af4:	fb5ff06f          	j	3aa8 <fatfs_init+0x40>
    3af8:	24344703          	lbu	a4,579(s0)
    3afc:	0aa00793          	li	a5,170
    3b00:	fef718e3          	bne	a4,a5,3af0 <fatfs_init+0x88>
    3b04:	20644783          	lbu	a5,518(s0)
    3b08:	00600713          	li	a4,6
    3b0c:	02f76463          	bltu	a4,a5,3b34 <fatfs_init+0xcc>
    3b10:	00400713          	li	a4,4
    3b14:	00f76663          	bltu	a4,a5,3b20 <fatfs_init+0xb8>
    3b18:	00000513          	li	a0,0
    3b1c:	02078663          	beqz	a5,3b48 <fatfs_init+0xe0>
    3b20:	20c45503          	lhu	a0,524(s0)
    3b24:	20a45783          	lhu	a5,522(s0)
    3b28:	01051513          	slli	a0,a0,0x10
    3b2c:	00f56533          	or	a0,a0,a5
    3b30:	0180006f          	j	3b48 <fatfs_init+0xe0>
    3b34:	00c00713          	li	a4,12
    3b38:	12f76663          	bltu	a4,a5,3c64 <fatfs_init+0x1fc>
    3b3c:	00a00713          	li	a4,10
    3b40:	00000513          	li	a0,0
    3b44:	fcf76ee3          	bltu	a4,a5,3b20 <fatfs_init+0xb8>
    3b48:	03442783          	lw	a5,52(s0)
    3b4c:	00a42e23          	sw	a0,28(s0)
    3b50:	00100613          	li	a2,1
    3b54:	000780e7          	jalr	a5
    3b58:	f40506e3          	beqz	a0,3aa4 <fatfs_init+0x3c>
    3b5c:	05044783          	lbu	a5,80(s0)
    3b60:	04f44703          	lbu	a4,79(s0)
    3b64:	20000693          	li	a3,512
    3b68:	00879793          	slli	a5,a5,0x8
    3b6c:	00e7e7b3          	or	a5,a5,a4
    3b70:	ffe00713          	li	a4,-2
    3b74:	f2d79ae3          	bne	a5,a3,3aa8 <fatfs_init+0x40>
    3b78:	05644483          	lbu	s1,86(s0)
    3b7c:	05544783          	lbu	a5,85(s0)
    3b80:	05144983          	lbu	s3,81(s0)
    3b84:	00849493          	slli	s1,s1,0x8
    3b88:	05a45583          	lhu	a1,90(s0)
    3b8c:	00f4e4b3          	or	s1,s1,a5
    3b90:	01340023          	sb	s3,0(s0)
    3b94:	02941423          	sh	s1,40(s0)
    3b98:	05245903          	lhu	s2,82(s0)
    3b9c:	05444503          	lbu	a0,84(s0)
    3ba0:	00059463          	bnez	a1,3ba8 <fatfs_init+0x140>
    3ba4:	06842583          	lw	a1,104(s0)
    3ba8:	07042783          	lw	a5,112(s0)
    3bac:	02b42023          	sw	a1,32(s0)
    3bb0:	00549493          	slli	s1,s1,0x5
    3bb4:	00f42423          	sw	a5,8(s0)
    3bb8:	07445783          	lhu	a5,116(s0)
    3bbc:	1ff48493          	addi	s1,s1,511
    3bc0:	4094d493          	srai	s1,s1,0x9
    3bc4:	00f41c23          	sh	a5,24(s0)
    3bc8:	fffff097          	auipc	ra,0xfffff
    3bcc:	ccc080e7          	jalr	-820(ra) # 2894 <__mulsi3>
    3bd0:	00a907b3          	add	a5,s2,a0
    3bd4:	00f42623          	sw	a5,12(s0)
    3bd8:	01c42783          	lw	a5,28(s0)
    3bdc:	24245703          	lhu	a4,578(s0)
    3be0:	00942823          	sw	s1,16(s0)
    3be4:	00f907b3          	add	a5,s2,a5
    3be8:	00f42a23          	sw	a5,20(s0)
    3bec:	00f507b3          	add	a5,a0,a5
    3bf0:	00f42223          	sw	a5,4(s0)
    3bf4:	0000b7b7          	lui	a5,0xb
    3bf8:	a5578793          	addi	a5,a5,-1451 # aa55 <_files+0x26e9>
    3bfc:	eef71ae3          	bne	a4,a5,3af0 <fatfs_init+0x88>
    3c00:	05844783          	lbu	a5,88(s0)
    3c04:	05744703          	lbu	a4,87(s0)
    3c08:	00879793          	slli	a5,a5,0x8
    3c0c:	00e7e7b3          	or	a5,a5,a4
    3c10:	00079463          	bnez	a5,3c18 <fatfs_init+0x1b0>
    3c14:	06442783          	lw	a5,100(s0)
    3c18:	ffb00713          	li	a4,-5
    3c1c:	e80986e3          	beqz	s3,3aa8 <fatfs_init+0x40>
    3c20:	00990933          	add	s2,s2,s1
    3c24:	00a90533          	add	a0,s2,a0
    3c28:	40a78533          	sub	a0,a5,a0
    3c2c:	00098593          	mv	a1,s3
    3c30:	ffffe097          	auipc	ra,0xffffe
    3c34:	474080e7          	jalr	1140(ra) # 20a4 <__udivsi3>
    3c38:	000017b7          	lui	a5,0x1
    3c3c:	ff478793          	addi	a5,a5,-12 # ff4 <file_explorer+0x218>
    3c40:	ffb00713          	li	a4,-5
    3c44:	e6a7f2e3          	bgeu	a5,a0,3aa8 <fatfs_init+0x40>
    3c48:	000107b7          	lui	a5,0x10
    3c4c:	ff478793          	addi	a5,a5,-12 # fff4 <_files+0x7c88>
    3c50:	02a7e663          	bltu	a5,a0,3c7c <fatfs_init+0x214>
    3c54:	00042423          	sw	zero,8(s0)
    3c58:	02042823          	sw	zero,48(s0)
    3c5c:	00000713          	li	a4,0
    3c60:	e49ff06f          	j	3aa8 <fatfs_init+0x40>
    3c64:	ff278793          	addi	a5,a5,-14
    3c68:	0ff7f793          	zext.b	a5,a5
    3c6c:	00100713          	li	a4,1
    3c70:	00000513          	li	a0,0
    3c74:	eaf776e3          	bgeu	a4,a5,3b20 <fatfs_init+0xb8>
    3c78:	ed1ff06f          	j	3b48 <fatfs_init+0xe0>
    3c7c:	00100793          	li	a5,1
    3c80:	02f42823          	sw	a5,48(s0)
    3c84:	fd9ff06f          	j	3c5c <fatfs_init+0x1f4>

00003c88 <fl_attach_media>:
    3c88:	000067b7          	lui	a5,0x6
    3c8c:	2e47a783          	lw	a5,740(a5) # 62e4 <_filelib_init>
    3c90:	fe010113          	addi	sp,sp,-32
    3c94:	00812c23          	sw	s0,24(sp)
    3c98:	00112e23          	sw	ra,28(sp)
    3c9c:	00050413          	mv	s0,a0
    3ca0:	00079a63          	bnez	a5,3cb4 <fl_attach_media+0x2c>
    3ca4:	00b12623          	sw	a1,12(sp)
    3ca8:	fffff097          	auipc	ra,0xfffff
    3cac:	080080e7          	jalr	128(ra) # 2d28 <fl_init>
    3cb0:	00c12583          	lw	a1,12(sp)
    3cb4:	000087b7          	lui	a5,0x8
    3cb8:	f0478513          	addi	a0,a5,-252 # 7f04 <_fs>
    3cbc:	02b52c23          	sw	a1,56(a0)
    3cc0:	02852a23          	sw	s0,52(a0)
    3cc4:	00000097          	auipc	ra,0x0
    3cc8:	da4080e7          	jalr	-604(ra) # 3a68 <fatfs_init>
    3ccc:	00050593          	mv	a1,a0
    3cd0:	02050863          	beqz	a0,3d00 <fl_attach_media+0x78>
    3cd4:	00a12623          	sw	a0,12(sp)
    3cd8:	00006537          	lui	a0,0x6
    3cdc:	e7850513          	addi	a0,a0,-392 # 5e78 <LEDS+0x14c>
    3ce0:	fffff097          	auipc	ra,0xfffff
    3ce4:	a78080e7          	jalr	-1416(ra) # 2758 <printf>
    3ce8:	00c12583          	lw	a1,12(sp)
    3cec:	01c12083          	lw	ra,28(sp)
    3cf0:	01812403          	lw	s0,24(sp)
    3cf4:	00058513          	mv	a0,a1
    3cf8:	02010113          	addi	sp,sp,32
    3cfc:	00008067          	ret
    3d00:	000067b7          	lui	a5,0x6
    3d04:	00100713          	li	a4,1
    3d08:	2ee7a023          	sw	a4,736(a5) # 62e0 <_filelib_valid>
    3d0c:	fe1ff06f          	j	3cec <fl_attach_media+0x64>

00003d10 <fatfs_fat_purge>:
    3d10:	25452583          	lw	a1,596(a0)
    3d14:	fe010113          	addi	sp,sp,-32
    3d18:	00812c23          	sw	s0,24(sp)
    3d1c:	00112e23          	sw	ra,28(sp)
    3d20:	00050413          	mv	s0,a0
    3d24:	00059663          	bnez	a1,3d30 <fatfs_fat_purge+0x20>
    3d28:	00100513          	li	a0,1
    3d2c:	02c0006f          	j	3d58 <fatfs_fat_purge+0x48>
    3d30:	2045a783          	lw	a5,516(a1)
    3d34:	00079663          	bnez	a5,3d40 <fatfs_fat_purge+0x30>
    3d38:	20c5a583          	lw	a1,524(a1)
    3d3c:	fe9ff06f          	j	3d24 <fatfs_fat_purge+0x14>
    3d40:	00040513          	mv	a0,s0
    3d44:	00b12623          	sw	a1,12(sp)
    3d48:	fffff097          	auipc	ra,0xfffff
    3d4c:	c80080e7          	jalr	-896(ra) # 29c8 <fatfs_fat_writeback>
    3d50:	00c12583          	lw	a1,12(sp)
    3d54:	fe0512e3          	bnez	a0,3d38 <fatfs_fat_purge+0x28>
    3d58:	01c12083          	lw	ra,28(sp)
    3d5c:	01812403          	lw	s0,24(sp)
    3d60:	02010113          	addi	sp,sp,32
    3d64:	00008067          	ret

00003d68 <fatfs_find_next_cluster>:
    3d68:	ff010113          	addi	sp,sp,-16
    3d6c:	00812423          	sw	s0,8(sp)
    3d70:	01212023          	sw	s2,0(sp)
    3d74:	00112623          	sw	ra,12(sp)
    3d78:	00912223          	sw	s1,4(sp)
    3d7c:	00050913          	mv	s2,a0
    3d80:	00200413          	li	s0,2
    3d84:	00058463          	beqz	a1,3d8c <fatfs_find_next_cluster+0x24>
    3d88:	00058413          	mv	s0,a1
    3d8c:	03092783          	lw	a5,48(s2)
    3d90:	00745493          	srli	s1,s0,0x7
    3d94:	00079463          	bnez	a5,3d9c <fatfs_find_next_cluster+0x34>
    3d98:	00845493          	srli	s1,s0,0x8
    3d9c:	01492583          	lw	a1,20(s2)
    3da0:	00090513          	mv	a0,s2
    3da4:	00b485b3          	add	a1,s1,a1
    3da8:	fffff097          	auipc	ra,0xfffff
    3dac:	ca4080e7          	jalr	-860(ra) # 2a4c <fatfs_fat_read_sector>
    3db0:	00050793          	mv	a5,a0
    3db4:	fff00513          	li	a0,-1
    3db8:	04078863          	beqz	a5,3e08 <fatfs_find_next_cluster+0xa0>
    3dbc:	03092703          	lw	a4,48(s2)
    3dc0:	2087a783          	lw	a5,520(a5)
    3dc4:	04071e63          	bnez	a4,3e20 <fatfs_find_next_cluster+0xb8>
    3dc8:	00849493          	slli	s1,s1,0x8
    3dcc:	40940433          	sub	s0,s0,s1
    3dd0:	00141413          	slli	s0,s0,0x1
    3dd4:	01041413          	slli	s0,s0,0x10
    3dd8:	01045413          	srli	s0,s0,0x10
    3ddc:	008787b3          	add	a5,a5,s0
    3de0:	0017c503          	lbu	a0,1(a5)
    3de4:	0007c783          	lbu	a5,0(a5)
    3de8:	00851513          	slli	a0,a0,0x8
    3dec:	00f50533          	add	a0,a0,a5
    3df0:	ffff07b7          	lui	a5,0xffff0
    3df4:	00878793          	addi	a5,a5,8 # ffff0008 <__stacktop+0xfffe0008>
    3df8:	00f507b3          	add	a5,a0,a5
    3dfc:	00700713          	li	a4,7
    3e00:	00f76463          	bltu	a4,a5,3e08 <fatfs_find_next_cluster+0xa0>
    3e04:	fff00513          	li	a0,-1
    3e08:	00c12083          	lw	ra,12(sp)
    3e0c:	00812403          	lw	s0,8(sp)
    3e10:	00412483          	lw	s1,4(sp)
    3e14:	00012903          	lw	s2,0(sp)
    3e18:	01010113          	addi	sp,sp,16
    3e1c:	00008067          	ret
    3e20:	00749493          	slli	s1,s1,0x7
    3e24:	40940433          	sub	s0,s0,s1
    3e28:	00241413          	slli	s0,s0,0x2
    3e2c:	01041413          	slli	s0,s0,0x10
    3e30:	01045413          	srli	s0,s0,0x10
    3e34:	008787b3          	add	a5,a5,s0
    3e38:	0037c503          	lbu	a0,3(a5)
    3e3c:	0027c703          	lbu	a4,2(a5)
    3e40:	01851513          	slli	a0,a0,0x18
    3e44:	01071713          	slli	a4,a4,0x10
    3e48:	00e50533          	add	a0,a0,a4
    3e4c:	0007c703          	lbu	a4,0(a5)
    3e50:	0017c783          	lbu	a5,1(a5)
    3e54:	00e50533          	add	a0,a0,a4
    3e58:	00879793          	slli	a5,a5,0x8
    3e5c:	00f50533          	add	a0,a0,a5
    3e60:	00451513          	slli	a0,a0,0x4
    3e64:	00455513          	srli	a0,a0,0x4
    3e68:	f00007b7          	lui	a5,0xf0000
    3e6c:	f89ff06f          	j	3df4 <fatfs_find_next_cluster+0x8c>

00003e70 <fatfs_sector_reader>:
    3e70:	03052783          	lw	a5,48(a0)
    3e74:	fe010113          	addi	sp,sp,-32
    3e78:	00812c23          	sw	s0,24(sp)
    3e7c:	01212823          	sw	s2,16(sp)
    3e80:	01512223          	sw	s5,4(sp)
    3e84:	00112e23          	sw	ra,28(sp)
    3e88:	00912a23          	sw	s1,20(sp)
    3e8c:	01312623          	sw	s3,12(sp)
    3e90:	01412423          	sw	s4,8(sp)
    3e94:	01612023          	sw	s6,0(sp)
    3e98:	00f5e7b3          	or	a5,a1,a5
    3e9c:	00050413          	mv	s0,a0
    3ea0:	00060913          	mv	s2,a2
    3ea4:	00068a93          	mv	s5,a3
    3ea8:	08079063          	bnez	a5,3f28 <fatfs_sector_reader+0xb8>
    3eac:	01052783          	lw	a5,16(a0)
    3eb0:	02f66863          	bltu	a2,a5,3ee0 <fatfs_sector_reader+0x70>
    3eb4:	00000513          	li	a0,0
    3eb8:	01c12083          	lw	ra,28(sp)
    3ebc:	01812403          	lw	s0,24(sp)
    3ec0:	01412483          	lw	s1,20(sp)
    3ec4:	01012903          	lw	s2,16(sp)
    3ec8:	00c12983          	lw	s3,12(sp)
    3ecc:	00812a03          	lw	s4,8(sp)
    3ed0:	00412a83          	lw	s5,4(sp)
    3ed4:	00012b03          	lw	s6,0(sp)
    3ed8:	02010113          	addi	sp,sp,32
    3edc:	00008067          	ret
    3ee0:	01c52503          	lw	a0,28(a0)
    3ee4:	00c42783          	lw	a5,12(s0)
    3ee8:	00f50533          	add	a0,a0,a5
    3eec:	01250533          	add	a0,a0,s2
    3ef0:	0a0a8663          	beqz	s5,3f9c <fatfs_sector_reader+0x12c>
    3ef4:	03442783          	lw	a5,52(s0)
    3ef8:	00100613          	li	a2,1
    3efc:	000a8593          	mv	a1,s5
    3f00:	01812403          	lw	s0,24(sp)
    3f04:	01c12083          	lw	ra,28(sp)
    3f08:	01412483          	lw	s1,20(sp)
    3f0c:	01012903          	lw	s2,16(sp)
    3f10:	00c12983          	lw	s3,12(sp)
    3f14:	00812a03          	lw	s4,8(sp)
    3f18:	00412a83          	lw	s5,4(sp)
    3f1c:	00012b03          	lw	s6,0(sp)
    3f20:	02010113          	addi	sp,sp,32
    3f24:	00078067          	jr	a5 # f0000000 <__stacktop+0xefff0000>
    3f28:	00054783          	lbu	a5,0(a0)
    3f2c:	00058493          	mv	s1,a1
    3f30:	00060513          	mv	a0,a2
    3f34:	00078593          	mv	a1,a5
    3f38:	00078a13          	mv	s4,a5
    3f3c:	ffffe097          	auipc	ra,0xffffe
    3f40:	168080e7          	jalr	360(ra) # 20a4 <__udivsi3>
    3f44:	00050b13          	mv	s6,a0
    3f48:	00000993          	li	s3,0
    3f4c:	03699a63          	bne	s3,s6,3f80 <fatfs_sector_reader+0x110>
    3f50:	fff00793          	li	a5,-1
    3f54:	f6f480e3          	beq	s1,a5,3eb4 <fatfs_sector_reader+0x44>
    3f58:	000a0593          	mv	a1,s4
    3f5c:	00090513          	mv	a0,s2
    3f60:	ffffe097          	auipc	ra,0xffffe
    3f64:	18c080e7          	jalr	396(ra) # 20ec <__umodsi3>
    3f68:	00050913          	mv	s2,a0
    3f6c:	00048593          	mv	a1,s1
    3f70:	00040513          	mv	a0,s0
    3f74:	fffff097          	auipc	ra,0xfffff
    3f78:	c84080e7          	jalr	-892(ra) # 2bf8 <fatfs_lba_of_cluster>
    3f7c:	f71ff06f          	j	3eec <fatfs_sector_reader+0x7c>
    3f80:	00048593          	mv	a1,s1
    3f84:	00040513          	mv	a0,s0
    3f88:	00000097          	auipc	ra,0x0
    3f8c:	de0080e7          	jalr	-544(ra) # 3d68 <fatfs_find_next_cluster>
    3f90:	00050493          	mv	s1,a0
    3f94:	00198993          	addi	s3,s3,1
    3f98:	fb5ff06f          	j	3f4c <fatfs_sector_reader+0xdc>
    3f9c:	24442783          	lw	a5,580(s0)
    3fa0:	00a78c63          	beq	a5,a0,3fb8 <fatfs_sector_reader+0x148>
    3fa4:	03442783          	lw	a5,52(s0)
    3fa8:	24a42223          	sw	a0,580(s0)
    3fac:	00100613          	li	a2,1
    3fb0:	04440593          	addi	a1,s0,68
    3fb4:	f4dff06f          	j	3f00 <fatfs_sector_reader+0x90>
    3fb8:	00100513          	li	a0,1
    3fbc:	efdff06f          	j	3eb8 <fatfs_sector_reader+0x48>

00003fc0 <fatfs_get_file_entry>:
    3fc0:	eb010113          	addi	sp,sp,-336
    3fc4:	14812423          	sw	s0,328(sp)
    3fc8:	14912223          	sw	s1,324(sp)
    3fcc:	13312e23          	sw	s3,316(sp)
    3fd0:	13712623          	sw	s7,300(sp)
    3fd4:	13812423          	sw	s8,296(sp)
    3fd8:	13912223          	sw	s9,292(sp)
    3fdc:	14112623          	sw	ra,332(sp)
    3fe0:	15212023          	sw	s2,320(sp)
    3fe4:	13412c23          	sw	s4,312(sp)
    3fe8:	13512a23          	sw	s5,308(sp)
    3fec:	13612823          	sw	s6,304(sp)
    3ff0:	00050993          	mv	s3,a0
    3ff4:	00058c93          	mv	s9,a1
    3ff8:	00060b93          	mv	s7,a2
    3ffc:	00068c13          	mv	s8,a3
    4000:	10010ea3          	sb	zero,285(sp)
    4004:	01810413          	addi	s0,sp,24
    4008:	11c10493          	addi	s1,sp,284
    400c:	00040513          	mv	a0,s0
    4010:	00d00613          	li	a2,13
    4014:	00000593          	li	a1,0
    4018:	00d40413          	addi	s0,s0,13
    401c:	ffffe097          	auipc	ra,0xffffe
    4020:	134080e7          	jalr	308(ra) # 2150 <memset>
    4024:	fe9414e3          	bne	s0,s1,400c <fatfs_get_file_entry+0x4c>
    4028:	00000493          	li	s1,0
    402c:	24498a13          	addi	s4,s3,580
    4030:	00810913          	addi	s2,sp,8
    4034:	00800a93          	li	s5,8
    4038:	02e00b13          	li	s6,46
    403c:	00000693          	li	a3,0
    4040:	00048613          	mv	a2,s1
    4044:	000c8593          	mv	a1,s9
    4048:	00098513          	mv	a0,s3
    404c:	00000097          	auipc	ra,0x0
    4050:	e24080e7          	jalr	-476(ra) # 3e70 <fatfs_sector_reader>
    4054:	08050c63          	beqz	a0,40ec <fatfs_get_file_entry+0x12c>
    4058:	00148493          	addi	s1,s1,1
    405c:	04498413          	addi	s0,s3,68
    4060:	00040513          	mv	a0,s0
    4064:	fffff097          	auipc	ra,0xfffff
    4068:	f34080e7          	jalr	-204(ra) # 2f98 <fatfs_entry_lfn_text>
    406c:	02050063          	beqz	a0,408c <fatfs_get_file_entry+0xcc>
    4070:	00040593          	mv	a1,s0
    4074:	01810513          	addi	a0,sp,24
    4078:	fffff097          	auipc	ra,0xfffff
    407c:	e18080e7          	jalr	-488(ra) # 2e90 <fatfs_lfn_cache_entry>
    4080:	02040413          	addi	s0,s0,32
    4084:	fd441ee3          	bne	s0,s4,4060 <fatfs_get_file_entry+0xa0>
    4088:	fb5ff06f          	j	403c <fatfs_get_file_entry+0x7c>
    408c:	00040513          	mv	a0,s0
    4090:	fffff097          	auipc	ra,0xfffff
    4094:	f1c080e7          	jalr	-228(ra) # 2fac <fatfs_entry_lfn_invalid>
    4098:	00050663          	beqz	a0,40a4 <fatfs_get_file_entry+0xe4>
    409c:	10010ea3          	sb	zero,285(sp)
    40a0:	fe1ff06f          	j	4080 <fatfs_get_file_entry+0xc0>
    40a4:	00040593          	mv	a1,s0
    40a8:	01810513          	addi	a0,sp,24
    40ac:	fffff097          	auipc	ra,0xfffff
    40b0:	f34080e7          	jalr	-204(ra) # 2fe0 <fatfs_entry_lfn_exists>
    40b4:	06050663          	beqz	a0,4120 <fatfs_get_file_entry+0x160>
    40b8:	01810513          	addi	a0,sp,24
    40bc:	fffff097          	auipc	ra,0xfffff
    40c0:	ea0080e7          	jalr	-352(ra) # 2f5c <fatfs_lfn_cache_get>
    40c4:	000b8593          	mv	a1,s7
    40c8:	fffff097          	auipc	ra,0xfffff
    40cc:	6dc080e7          	jalr	1756(ra) # 37a4 <fatfs_compare_names>
    40d0:	fc0506e3          	beqz	a0,409c <fatfs_get_file_entry+0xdc>
    40d4:	02000613          	li	a2,32
    40d8:	00040593          	mv	a1,s0
    40dc:	000c0513          	mv	a0,s8
    40e0:	ffffe097          	auipc	ra,0xffffe
    40e4:	08c080e7          	jalr	140(ra) # 216c <memcpy>
    40e8:	00100513          	li	a0,1
    40ec:	14c12083          	lw	ra,332(sp)
    40f0:	14812403          	lw	s0,328(sp)
    40f4:	14412483          	lw	s1,324(sp)
    40f8:	14012903          	lw	s2,320(sp)
    40fc:	13c12983          	lw	s3,316(sp)
    4100:	13812a03          	lw	s4,312(sp)
    4104:	13412a83          	lw	s5,308(sp)
    4108:	13012b03          	lw	s6,304(sp)
    410c:	12c12b83          	lw	s7,300(sp)
    4110:	12812c03          	lw	s8,296(sp)
    4114:	12412c83          	lw	s9,292(sp)
    4118:	15010113          	addi	sp,sp,336
    411c:	00008067          	ret
    4120:	00040513          	mv	a0,s0
    4124:	fffff097          	auipc	ra,0xfffff
    4128:	f0c080e7          	jalr	-244(ra) # 3030 <fatfs_entry_sfn_only>
    412c:	f4050ae3          	beqz	a0,4080 <fatfs_get_file_entry+0xc0>
    4130:	00d00613          	li	a2,13
    4134:	00000593          	li	a1,0
    4138:	00090513          	mv	a0,s2
    413c:	ffffe097          	auipc	ra,0xffffe
    4140:	014080e7          	jalr	20(ra) # 2150 <memset>
    4144:	00000793          	li	a5,0
    4148:	00f406b3          	add	a3,s0,a5
    414c:	0006c683          	lbu	a3,0(a3)
    4150:	00f90733          	add	a4,s2,a5
    4154:	00178793          	addi	a5,a5,1
    4158:	00d70023          	sb	a3,0(a4)
    415c:	ff5796e3          	bne	a5,s5,4148 <fatfs_get_file_entry+0x188>
    4160:	00844703          	lbu	a4,8(s0)
    4164:	00944783          	lbu	a5,9(s0)
    4168:	00a44683          	lbu	a3,10(s0)
    416c:	00e108a3          	sb	a4,17(sp)
    4170:	00f10923          	sb	a5,18(sp)
    4174:	fe070713          	addi	a4,a4,-32
    4178:	fe078793          	addi	a5,a5,-32
    417c:	00f037b3          	snez	a5,a5
    4180:	00e03733          	snez	a4,a4
    4184:	00d109a3          	sb	a3,19(sp)
    4188:	00e7e7b3          	or	a5,a5,a4
    418c:	00079863          	bnez	a5,419c <fatfs_get_file_entry+0x1dc>
    4190:	fe068693          	addi	a3,a3,-32
    4194:	02000793          	li	a5,32
    4198:	00068a63          	beqz	a3,41ac <fatfs_get_file_entry+0x1ec>
    419c:	00814703          	lbu	a4,8(sp)
    41a0:	02e00793          	li	a5,46
    41a4:	01671463          	bne	a4,s6,41ac <fatfs_get_file_entry+0x1ec>
    41a8:	02000793          	li	a5,32
    41ac:	00f10823          	sb	a5,16(sp)
    41b0:	000b8593          	mv	a1,s7
    41b4:	00090513          	mv	a0,s2
    41b8:	f11ff06f          	j	40c8 <fatfs_get_file_entry+0x108>

000041bc <_open_directory>:
    41bc:	eb010113          	addi	sp,sp,-336
    41c0:	15212023          	sw	s2,320(sp)
    41c4:	00008937          	lui	s2,0x8
    41c8:	f0490913          	addi	s2,s2,-252 # 7f04 <_fs>
    41cc:	14812423          	sw	s0,328(sp)
    41d0:	00892403          	lw	s0,8(s2)
    41d4:	14912223          	sw	s1,324(sp)
    41d8:	13312e23          	sw	s3,316(sp)
    41dc:	13412c23          	sw	s4,312(sp)
    41e0:	13512a23          	sw	s5,308(sp)
    41e4:	13612823          	sw	s6,304(sp)
    41e8:	14112623          	sw	ra,332(sp)
    41ec:	00050a13          	mv	s4,a0
    41f0:	00058a93          	mv	s5,a1
    41f4:	fffff097          	auipc	ra,0xfffff
    41f8:	368080e7          	jalr	872(ra) # 355c <fatfs_total_path_levels>
    41fc:	00050b13          	mv	s6,a0
    4200:	00000493          	li	s1,0
    4204:	fff00993          	li	s3,-1
    4208:	009b5863          	bge	s6,s1,4218 <_open_directory+0x5c>
    420c:	008aa023          	sw	s0,0(s5)
    4210:	00100513          	li	a0,1
    4214:	0240006f          	j	4238 <_open_directory+0x7c>
    4218:	10400693          	li	a3,260
    421c:	02c10613          	addi	a2,sp,44
    4220:	00048593          	mv	a1,s1
    4224:	000a0513          	mv	a0,s4
    4228:	fffff097          	auipc	ra,0xfffff
    422c:	3a4080e7          	jalr	932(ra) # 35cc <fatfs_get_substring>
    4230:	03351863          	bne	a0,s3,4260 <_open_directory+0xa4>
    4234:	00000513          	li	a0,0
    4238:	14c12083          	lw	ra,332(sp)
    423c:	14812403          	lw	s0,328(sp)
    4240:	14412483          	lw	s1,324(sp)
    4244:	14012903          	lw	s2,320(sp)
    4248:	13c12983          	lw	s3,316(sp)
    424c:	13812a03          	lw	s4,312(sp)
    4250:	13412a83          	lw	s5,308(sp)
    4254:	13012b03          	lw	s6,304(sp)
    4258:	15010113          	addi	sp,sp,336
    425c:	00008067          	ret
    4260:	00c10693          	addi	a3,sp,12
    4264:	02c10613          	addi	a2,sp,44
    4268:	00040593          	mv	a1,s0
    426c:	00090513          	mv	a0,s2
    4270:	00000097          	auipc	ra,0x0
    4274:	d50080e7          	jalr	-688(ra) # 3fc0 <fatfs_get_file_entry>
    4278:	fa050ee3          	beqz	a0,4234 <_open_directory+0x78>
    427c:	01714783          	lbu	a5,23(sp)
    4280:	0107f793          	andi	a5,a5,16
    4284:	fa0788e3          	beqz	a5,4234 <_open_directory+0x78>
    4288:	02015403          	lhu	s0,32(sp)
    428c:	02615783          	lhu	a5,38(sp)
    4290:	00148493          	addi	s1,s1,1
    4294:	01041413          	slli	s0,s0,0x10
    4298:	00f40433          	add	s0,s0,a5
    429c:	f6dff06f          	j	4208 <_open_directory+0x4c>

000042a0 <fl_opendir>:
    42a0:	fe010113          	addi	sp,sp,-32
    42a4:	fff00793          	li	a5,-1
    42a8:	00f12623          	sw	a5,12(sp)
    42ac:	000067b7          	lui	a5,0x6
    42b0:	2e47a783          	lw	a5,740(a5) # 62e4 <_filelib_init>
    42b4:	00812c23          	sw	s0,24(sp)
    42b8:	01212823          	sw	s2,16(sp)
    42bc:	00112e23          	sw	ra,28(sp)
    42c0:	00912a23          	sw	s1,20(sp)
    42c4:	00050913          	mv	s2,a0
    42c8:	00058413          	mv	s0,a1
    42cc:	00079663          	bnez	a5,42d8 <fl_opendir+0x38>
    42d0:	fffff097          	auipc	ra,0xfffff
    42d4:	a58080e7          	jalr	-1448(ra) # 2d28 <fl_init>
    42d8:	000084b7          	lui	s1,0x8
    42dc:	f0448493          	addi	s1,s1,-252 # 7f04 <_fs>
    42e0:	03c4a783          	lw	a5,60(s1)
    42e4:	00078463          	beqz	a5,42ec <fl_opendir+0x4c>
    42e8:	000780e7          	jalr	a5
    42ec:	00090513          	mv	a0,s2
    42f0:	fffff097          	auipc	ra,0xfffff
    42f4:	26c080e7          	jalr	620(ra) # 355c <fatfs_total_path_levels>
    42f8:	fff00793          	li	a5,-1
    42fc:	02f51063          	bne	a0,a5,431c <fl_opendir+0x7c>
    4300:	0084a783          	lw	a5,8(s1)
    4304:	00f12623          	sw	a5,12(sp)
    4308:	00c12783          	lw	a5,12(sp)
    430c:	00042023          	sw	zero,0(s0)
    4310:	00040423          	sb	zero,8(s0)
    4314:	00f42223          	sw	a5,4(s0)
    4318:	0180006f          	j	4330 <fl_opendir+0x90>
    431c:	00c10593          	addi	a1,sp,12
    4320:	00090513          	mv	a0,s2
    4324:	00000097          	auipc	ra,0x0
    4328:	e98080e7          	jalr	-360(ra) # 41bc <_open_directory>
    432c:	fc051ee3          	bnez	a0,4308 <fl_opendir+0x68>
    4330:	0404a783          	lw	a5,64(s1)
    4334:	00078463          	beqz	a5,433c <fl_opendir+0x9c>
    4338:	000780e7          	jalr	a5
    433c:	00c12703          	lw	a4,12(sp)
    4340:	fff00793          	li	a5,-1
    4344:	00f71463          	bne	a4,a5,434c <fl_opendir+0xac>
    4348:	00000413          	li	s0,0
    434c:	01c12083          	lw	ra,28(sp)
    4350:	00040513          	mv	a0,s0
    4354:	01812403          	lw	s0,24(sp)
    4358:	01412483          	lw	s1,20(sp)
    435c:	01012903          	lw	s2,16(sp)
    4360:	02010113          	addi	sp,sp,32
    4364:	00008067          	ret

00004368 <_open_file>:
    4368:	fc010113          	addi	sp,sp,-64
    436c:	03312623          	sw	s3,44(sp)
    4370:	02112e23          	sw	ra,60(sp)
    4374:	02812c23          	sw	s0,56(sp)
    4378:	02912a23          	sw	s1,52(sp)
    437c:	03212823          	sw	s2,48(sp)
    4380:	00050993          	mv	s3,a0
    4384:	ffffe097          	auipc	ra,0xffffe
    4388:	7b4080e7          	jalr	1972(ra) # 2b38 <_allocate_file>
    438c:	06050463          	beqz	a0,43f4 <_open_file+0x8c>
    4390:	01450913          	addi	s2,a0,20
    4394:	00050413          	mv	s0,a0
    4398:	10400613          	li	a2,260
    439c:	00000593          	li	a1,0
    43a0:	00090513          	mv	a0,s2
    43a4:	ffffe097          	auipc	ra,0xffffe
    43a8:	dac080e7          	jalr	-596(ra) # 2150 <memset>
    43ac:	11840493          	addi	s1,s0,280
    43b0:	10400613          	li	a2,260
    43b4:	00000593          	li	a1,0
    43b8:	00048513          	mv	a0,s1
    43bc:	ffffe097          	auipc	ra,0xffffe
    43c0:	d94080e7          	jalr	-620(ra) # 2150 <memset>
    43c4:	10400713          	li	a4,260
    43c8:	00048693          	mv	a3,s1
    43cc:	00070613          	mv	a2,a4
    43d0:	00090593          	mv	a1,s2
    43d4:	00098513          	mv	a0,s3
    43d8:	fffff097          	auipc	ra,0xfffff
    43dc:	2dc080e7          	jalr	732(ra) # 36b4 <fatfs_split_path>
    43e0:	fff00793          	li	a5,-1
    43e4:	02f51a63          	bne	a0,a5,4418 <_open_file+0xb0>
    43e8:	00040513          	mv	a0,s0
    43ec:	ffffe097          	auipc	ra,0xffffe
    43f0:	7c4080e7          	jalr	1988(ra) # 2bb0 <_free_file>
    43f4:	00000413          	li	s0,0
    43f8:	03c12083          	lw	ra,60(sp)
    43fc:	00040513          	mv	a0,s0
    4400:	03812403          	lw	s0,56(sp)
    4404:	03412483          	lw	s1,52(sp)
    4408:	03012903          	lw	s2,48(sp)
    440c:	02c12983          	lw	s3,44(sp)
    4410:	04010113          	addi	sp,sp,64
    4414:	00008067          	ret
    4418:	00040513          	mv	a0,s0
    441c:	fffff097          	auipc	ra,0xfffff
    4420:	514080e7          	jalr	1300(ra) # 3930 <_check_file_open>
    4424:	fc0512e3          	bnez	a0,43e8 <_open_file+0x80>
    4428:	01444783          	lbu	a5,20(s0)
    442c:	08079c63          	bnez	a5,44c4 <_open_file+0x15c>
    4430:	000087b7          	lui	a5,0x8
    4434:	f0c7a783          	lw	a5,-244(a5) # 7f0c <_fs+0x8>
    4438:	00f42023          	sw	a5,0(s0)
    443c:	00042583          	lw	a1,0(s0)
    4440:	00048613          	mv	a2,s1
    4444:	000084b7          	lui	s1,0x8
    4448:	00010693          	mv	a3,sp
    444c:	f0448513          	addi	a0,s1,-252 # 7f04 <_fs>
    4450:	00000097          	auipc	ra,0x0
    4454:	b70080e7          	jalr	-1168(ra) # 3fc0 <fatfs_get_file_entry>
    4458:	f80508e3          	beqz	a0,43e8 <_open_file+0x80>
    445c:	00b14783          	lbu	a5,11(sp)
    4460:	0207f793          	andi	a5,a5,32
    4464:	f80782e3          	beqz	a5,43e8 <_open_file+0x80>
    4468:	00b00613          	li	a2,11
    446c:	00010593          	mv	a1,sp
    4470:	21c40513          	addi	a0,s0,540
    4474:	ffffe097          	auipc	ra,0xffffe
    4478:	cf8080e7          	jalr	-776(ra) # 216c <memcpy>
    447c:	01c12783          	lw	a5,28(sp)
    4480:	01a15703          	lhu	a4,26(sp)
    4484:	00042423          	sw	zero,8(s0)
    4488:	00f42623          	sw	a5,12(s0)
    448c:	01415783          	lhu	a5,20(sp)
    4490:	42042a23          	sw	zero,1076(s0)
    4494:	00042823          	sw	zero,16(s0)
    4498:	01079793          	slli	a5,a5,0x10
    449c:	00e787b3          	add	a5,a5,a4
    44a0:	00f42223          	sw	a5,4(s0)
    44a4:	fff00793          	li	a5,-1
    44a8:	42f42823          	sw	a5,1072(s0)
    44ac:	22f42423          	sw	a5,552(s0)
    44b0:	22f42623          	sw	a5,556(s0)
    44b4:	f0448513          	addi	a0,s1,-252
    44b8:	00000097          	auipc	ra,0x0
    44bc:	858080e7          	jalr	-1960(ra) # 3d10 <fatfs_fat_purge>
    44c0:	f39ff06f          	j	43f8 <_open_file+0x90>
    44c4:	00040593          	mv	a1,s0
    44c8:	00090513          	mv	a0,s2
    44cc:	00000097          	auipc	ra,0x0
    44d0:	cf0080e7          	jalr	-784(ra) # 41bc <_open_directory>
    44d4:	f60514e3          	bnez	a0,443c <_open_file+0xd4>
    44d8:	f11ff06f          	j	43e8 <_open_file+0x80>

000044dc <fatfs_sfn_exists>:
    44dc:	fe010113          	addi	sp,sp,-32
    44e0:	01212823          	sw	s2,16(sp)
    44e4:	01312623          	sw	s3,12(sp)
    44e8:	01412423          	sw	s4,8(sp)
    44ec:	01512223          	sw	s5,4(sp)
    44f0:	01612023          	sw	s6,0(sp)
    44f4:	00112e23          	sw	ra,28(sp)
    44f8:	00812c23          	sw	s0,24(sp)
    44fc:	00912a23          	sw	s1,20(sp)
    4500:	00050993          	mv	s3,a0
    4504:	00058a93          	mv	s5,a1
    4508:	00060b13          	mv	s6,a2
    450c:	00000913          	li	s2,0
    4510:	24450a13          	addi	s4,a0,580
    4514:	00000693          	li	a3,0
    4518:	00090613          	mv	a2,s2
    451c:	000a8593          	mv	a1,s5
    4520:	00098513          	mv	a0,s3
    4524:	00000097          	auipc	ra,0x0
    4528:	94c080e7          	jalr	-1716(ra) # 3e70 <fatfs_sector_reader>
    452c:	00050413          	mv	s0,a0
    4530:	06050263          	beqz	a0,4594 <fatfs_sfn_exists+0xb8>
    4534:	00190913          	addi	s2,s2,1
    4538:	04498493          	addi	s1,s3,68
    453c:	00048513          	mv	a0,s1
    4540:	fffff097          	auipc	ra,0xfffff
    4544:	a58080e7          	jalr	-1448(ra) # 2f98 <fatfs_entry_lfn_text>
    4548:	00050863          	beqz	a0,4558 <fatfs_sfn_exists+0x7c>
    454c:	02048493          	addi	s1,s1,32
    4550:	ff4496e3          	bne	s1,s4,453c <fatfs_sfn_exists+0x60>
    4554:	fc1ff06f          	j	4514 <fatfs_sfn_exists+0x38>
    4558:	00048513          	mv	a0,s1
    455c:	fffff097          	auipc	ra,0xfffff
    4560:	a50080e7          	jalr	-1456(ra) # 2fac <fatfs_entry_lfn_invalid>
    4564:	fe0514e3          	bnez	a0,454c <fatfs_sfn_exists+0x70>
    4568:	00048513          	mv	a0,s1
    456c:	fffff097          	auipc	ra,0xfffff
    4570:	ac4080e7          	jalr	-1340(ra) # 3030 <fatfs_entry_sfn_only>
    4574:	00050413          	mv	s0,a0
    4578:	fc050ae3          	beqz	a0,454c <fatfs_sfn_exists+0x70>
    457c:	00b00613          	li	a2,11
    4580:	000b0593          	mv	a1,s6
    4584:	00048513          	mv	a0,s1
    4588:	ffffe097          	auipc	ra,0xffffe
    458c:	c28080e7          	jalr	-984(ra) # 21b0 <strncmp>
    4590:	fa051ee3          	bnez	a0,454c <fatfs_sfn_exists+0x70>
    4594:	01c12083          	lw	ra,28(sp)
    4598:	00040513          	mv	a0,s0
    459c:	01812403          	lw	s0,24(sp)
    45a0:	01412483          	lw	s1,20(sp)
    45a4:	01012903          	lw	s2,16(sp)
    45a8:	00c12983          	lw	s3,12(sp)
    45ac:	00812a03          	lw	s4,8(sp)
    45b0:	00412a83          	lw	s5,4(sp)
    45b4:	00012b03          	lw	s6,0(sp)
    45b8:	02010113          	addi	sp,sp,32
    45bc:	00008067          	ret

000045c0 <fatfs_update_file_length>:
    45c0:	03852783          	lw	a5,56(a0)
    45c4:	14078e63          	beqz	a5,4720 <fatfs_update_file_length+0x160>
    45c8:	fd010113          	addi	sp,sp,-48
    45cc:	02912223          	sw	s1,36(sp)
    45d0:	03212023          	sw	s2,32(sp)
    45d4:	01312e23          	sw	s3,28(sp)
    45d8:	01412c23          	sw	s4,24(sp)
    45dc:	01612823          	sw	s6,16(sp)
    45e0:	01712623          	sw	s7,12(sp)
    45e4:	02112623          	sw	ra,44(sp)
    45e8:	02812423          	sw	s0,40(sp)
    45ec:	01512a23          	sw	s5,20(sp)
    45f0:	00068913          	mv	s2,a3
    45f4:	00060b93          	mv	s7,a2
    45f8:	00058b13          	mv	s6,a1
    45fc:	00050493          	mv	s1,a0
    4600:	00000993          	li	s3,0
    4604:	24450a13          	addi	s4,a0,580
    4608:	00000693          	li	a3,0
    460c:	00098613          	mv	a2,s3
    4610:	000b0593          	mv	a1,s6
    4614:	00048513          	mv	a0,s1
    4618:	00000097          	auipc	ra,0x0
    461c:	858080e7          	jalr	-1960(ra) # 3e70 <fatfs_sector_reader>
    4620:	0c050863          	beqz	a0,46f0 <fatfs_update_file_length+0x130>
    4624:	04448413          	addi	s0,s1,68
    4628:	00198993          	addi	s3,s3,1
    462c:	00040a93          	mv	s5,s0
    4630:	00040513          	mv	a0,s0
    4634:	fffff097          	auipc	ra,0xfffff
    4638:	964080e7          	jalr	-1692(ra) # 2f98 <fatfs_entry_lfn_text>
    463c:	0a051463          	bnez	a0,46e4 <fatfs_update_file_length+0x124>
    4640:	00040513          	mv	a0,s0
    4644:	fffff097          	auipc	ra,0xfffff
    4648:	968080e7          	jalr	-1688(ra) # 2fac <fatfs_entry_lfn_invalid>
    464c:	08051c63          	bnez	a0,46e4 <fatfs_update_file_length+0x124>
    4650:	00040513          	mv	a0,s0
    4654:	fffff097          	auipc	ra,0xfffff
    4658:	9dc080e7          	jalr	-1572(ra) # 3030 <fatfs_entry_sfn_only>
    465c:	08050463          	beqz	a0,46e4 <fatfs_update_file_length+0x124>
    4660:	00b00613          	li	a2,11
    4664:	000b8593          	mv	a1,s7
    4668:	00040513          	mv	a0,s0
    466c:	ffffe097          	auipc	ra,0xffffe
    4670:	b44080e7          	jalr	-1212(ra) # 21b0 <strncmp>
    4674:	06051863          	bnez	a0,46e4 <fatfs_update_file_length+0x124>
    4678:	00895793          	srli	a5,s2,0x8
    467c:	01240e23          	sb	s2,28(s0)
    4680:	00f40ea3          	sb	a5,29(s0)
    4684:	01095793          	srli	a5,s2,0x10
    4688:	01895913          	srli	s2,s2,0x18
    468c:	00f40f23          	sb	a5,30(s0)
    4690:	01240fa3          	sb	s2,31(s0)
    4694:	00040593          	mv	a1,s0
    4698:	02000613          	li	a2,32
    469c:	00040513          	mv	a0,s0
    46a0:	ffffe097          	auipc	ra,0xffffe
    46a4:	acc080e7          	jalr	-1332(ra) # 216c <memcpy>
    46a8:	02812403          	lw	s0,40(sp)
    46ac:	0384a783          	lw	a5,56(s1)
    46b0:	2444a503          	lw	a0,580(s1)
    46b4:	02c12083          	lw	ra,44(sp)
    46b8:	02412483          	lw	s1,36(sp)
    46bc:	02012903          	lw	s2,32(sp)
    46c0:	01c12983          	lw	s3,28(sp)
    46c4:	01812a03          	lw	s4,24(sp)
    46c8:	01012b03          	lw	s6,16(sp)
    46cc:	00c12b83          	lw	s7,12(sp)
    46d0:	000a8593          	mv	a1,s5
    46d4:	01412a83          	lw	s5,20(sp)
    46d8:	00100613          	li	a2,1
    46dc:	03010113          	addi	sp,sp,48
    46e0:	00078067          	jr	a5
    46e4:	02040413          	addi	s0,s0,32
    46e8:	f54414e3          	bne	s0,s4,4630 <fatfs_update_file_length+0x70>
    46ec:	f1dff06f          	j	4608 <fatfs_update_file_length+0x48>
    46f0:	02c12083          	lw	ra,44(sp)
    46f4:	02812403          	lw	s0,40(sp)
    46f8:	02412483          	lw	s1,36(sp)
    46fc:	02012903          	lw	s2,32(sp)
    4700:	01c12983          	lw	s3,28(sp)
    4704:	01812a03          	lw	s4,24(sp)
    4708:	01412a83          	lw	s5,20(sp)
    470c:	01012b03          	lw	s6,16(sp)
    4710:	00c12b83          	lw	s7,12(sp)
    4714:	00000513          	li	a0,0
    4718:	03010113          	addi	sp,sp,48
    471c:	00008067          	ret
    4720:	00000513          	li	a0,0
    4724:	00008067          	ret

00004728 <fatfs_list_directory_next>:
    4728:	ec010113          	addi	sp,sp,-320
    472c:	13212823          	sw	s2,304(sp)
    4730:	13312623          	sw	s3,300(sp)
    4734:	13412423          	sw	s4,296(sp)
    4738:	13512223          	sw	s5,292(sp)
    473c:	13612023          	sw	s6,288(sp)
    4740:	12112e23          	sw	ra,316(sp)
    4744:	12812c23          	sw	s0,312(sp)
    4748:	12912a23          	sw	s1,308(sp)
    474c:	00050a13          	mv	s4,a0
    4750:	00058913          	mv	s2,a1
    4754:	00060993          	mv	s3,a2
    4758:	10010ea3          	sb	zero,285(sp)
    475c:	04450a93          	addi	s5,a0,68
    4760:	00f00b13          	li	s6,15
    4764:	00092603          	lw	a2,0(s2)
    4768:	00492583          	lw	a1,4(s2)
    476c:	00000693          	li	a3,0
    4770:	000a0513          	mv	a0,s4
    4774:	fffff097          	auipc	ra,0xfffff
    4778:	6fc080e7          	jalr	1788(ra) # 3e70 <fatfs_sector_reader>
    477c:	10050c63          	beqz	a0,4894 <fatfs_list_directory_next+0x16c>
    4780:	00894483          	lbu	s1,8(s2)
    4784:	00549413          	slli	s0,s1,0x5
    4788:	008a8433          	add	s0,s5,s0
    478c:	009b7c63          	bgeu	s6,s1,47a4 <fatfs_list_directory_next+0x7c>
    4790:	00092783          	lw	a5,0(s2)
    4794:	00090423          	sb	zero,8(s2)
    4798:	00178793          	addi	a5,a5,1
    479c:	00f92023          	sw	a5,0(s2)
    47a0:	fc5ff06f          	j	4764 <fatfs_list_directory_next+0x3c>
    47a4:	00040513          	mv	a0,s0
    47a8:	ffffe097          	auipc	ra,0xffffe
    47ac:	7f0080e7          	jalr	2032(ra) # 2f98 <fatfs_entry_lfn_text>
    47b0:	02050263          	beqz	a0,47d4 <fatfs_list_directory_next+0xac>
    47b4:	00040593          	mv	a1,s0
    47b8:	01810513          	addi	a0,sp,24
    47bc:	ffffe097          	auipc	ra,0xffffe
    47c0:	6d4080e7          	jalr	1748(ra) # 2e90 <fatfs_lfn_cache_entry>
    47c4:	00148493          	addi	s1,s1,1
    47c8:	0ff4f493          	zext.b	s1,s1
    47cc:	02040413          	addi	s0,s0,32
    47d0:	fbdff06f          	j	478c <fatfs_list_directory_next+0x64>
    47d4:	00040513          	mv	a0,s0
    47d8:	ffffe097          	auipc	ra,0xffffe
    47dc:	7d4080e7          	jalr	2004(ra) # 2fac <fatfs_entry_lfn_invalid>
    47e0:	00050663          	beqz	a0,47ec <fatfs_list_directory_next+0xc4>
    47e4:	10010ea3          	sb	zero,285(sp)
    47e8:	fddff06f          	j	47c4 <fatfs_list_directory_next+0x9c>
    47ec:	00040593          	mv	a1,s0
    47f0:	01810513          	addi	a0,sp,24
    47f4:	ffffe097          	auipc	ra,0xffffe
    47f8:	7ec080e7          	jalr	2028(ra) # 2fe0 <fatfs_entry_lfn_exists>
    47fc:	0c050063          	beqz	a0,48bc <fatfs_list_directory_next+0x194>
    4800:	01810513          	addi	a0,sp,24
    4804:	ffffe097          	auipc	ra,0xffffe
    4808:	758080e7          	jalr	1880(ra) # 2f5c <fatfs_lfn_cache_get>
    480c:	00050593          	mv	a1,a0
    4810:	10300613          	li	a2,259
    4814:	00098513          	mv	a0,s3
    4818:	ffffe097          	auipc	ra,0xffffe
    481c:	9d8080e7          	jalr	-1576(ra) # 21f0 <strncpy>
    4820:	00040513          	mv	a0,s0
    4824:	fffff097          	auipc	ra,0xfffff
    4828:	84c080e7          	jalr	-1972(ra) # 3070 <fatfs_entry_is_dir>
    482c:	10a98223          	sb	a0,260(s3)
    4830:	01d44783          	lbu	a5,29(s0)
    4834:	01c44703          	lbu	a4,28(s0)
    4838:	00148493          	addi	s1,s1,1
    483c:	00879793          	slli	a5,a5,0x8
    4840:	00e7e7b3          	or	a5,a5,a4
    4844:	01e44703          	lbu	a4,30(s0)
    4848:	00100513          	li	a0,1
    484c:	01071713          	slli	a4,a4,0x10
    4850:	00f76733          	or	a4,a4,a5
    4854:	01f44783          	lbu	a5,31(s0)
    4858:	01879793          	slli	a5,a5,0x18
    485c:	00e7e7b3          	or	a5,a5,a4
    4860:	10f9a623          	sw	a5,268(s3)
    4864:	01544783          	lbu	a5,21(s0)
    4868:	01444703          	lbu	a4,20(s0)
    486c:	01a44683          	lbu	a3,26(s0)
    4870:	00879793          	slli	a5,a5,0x8
    4874:	00e7e7b3          	or	a5,a5,a4
    4878:	01b44703          	lbu	a4,27(s0)
    487c:	01079793          	slli	a5,a5,0x10
    4880:	00871713          	slli	a4,a4,0x8
    4884:	00d76733          	or	a4,a4,a3
    4888:	00e7e7b3          	or	a5,a5,a4
    488c:	10f9a423          	sw	a5,264(s3)
    4890:	00990423          	sb	s1,8(s2)
    4894:	13c12083          	lw	ra,316(sp)
    4898:	13812403          	lw	s0,312(sp)
    489c:	13412483          	lw	s1,308(sp)
    48a0:	13012903          	lw	s2,304(sp)
    48a4:	12c12983          	lw	s3,300(sp)
    48a8:	12812a03          	lw	s4,296(sp)
    48ac:	12412a83          	lw	s5,292(sp)
    48b0:	12012b03          	lw	s6,288(sp)
    48b4:	14010113          	addi	sp,sp,320
    48b8:	00008067          	ret
    48bc:	00040513          	mv	a0,s0
    48c0:	ffffe097          	auipc	ra,0xffffe
    48c4:	770080e7          	jalr	1904(ra) # 3030 <fatfs_entry_sfn_only>
    48c8:	ee050ee3          	beqz	a0,47c4 <fatfs_list_directory_next+0x9c>
    48cc:	00810a13          	addi	s4,sp,8
    48d0:	00d00613          	li	a2,13
    48d4:	00000593          	li	a1,0
    48d8:	000a0513          	mv	a0,s4
    48dc:	10010ea3          	sb	zero,285(sp)
    48e0:	ffffe097          	auipc	ra,0xffffe
    48e4:	870080e7          	jalr	-1936(ra) # 2150 <memset>
    48e8:	00000793          	li	a5,0
    48ec:	00800713          	li	a4,8
    48f0:	00f40633          	add	a2,s0,a5
    48f4:	00064603          	lbu	a2,0(a2)
    48f8:	00fa06b3          	add	a3,s4,a5
    48fc:	00178793          	addi	a5,a5,1
    4900:	00c68023          	sb	a2,0(a3)
    4904:	fee796e3          	bne	a5,a4,48f0 <fatfs_list_directory_next+0x1c8>
    4908:	00844783          	lbu	a5,8(s0)
    490c:	00944703          	lbu	a4,9(s0)
    4910:	00a44683          	lbu	a3,10(s0)
    4914:	00f108a3          	sb	a5,17(sp)
    4918:	00e10923          	sb	a4,18(sp)
    491c:	fe078793          	addi	a5,a5,-32
    4920:	fe070713          	addi	a4,a4,-32
    4924:	00f037b3          	snez	a5,a5
    4928:	00e03733          	snez	a4,a4
    492c:	00d109a3          	sb	a3,19(sp)
    4930:	00e7e7b3          	or	a5,a5,a4
    4934:	00079863          	bnez	a5,4944 <fatfs_list_directory_next+0x21c>
    4938:	fe068693          	addi	a3,a3,-32
    493c:	02000793          	li	a5,32
    4940:	00068a63          	beqz	a3,4954 <fatfs_list_directory_next+0x22c>
    4944:	00814703          	lbu	a4,8(sp)
    4948:	02e00793          	li	a5,46
    494c:	00f71463          	bne	a4,a5,4954 <fatfs_list_directory_next+0x22c>
    4950:	02000793          	li	a5,32
    4954:	000a0593          	mv	a1,s4
    4958:	00098513          	mv	a0,s3
    495c:	00f10823          	sb	a5,16(sp)
    4960:	fffff097          	auipc	ra,0xfffff
    4964:	054080e7          	jalr	84(ra) # 39b4 <fatfs_get_sfn_display_name>
    4968:	eb9ff06f          	j	4820 <fatfs_list_directory_next+0xf8>

0000496c <fl_readdir>:
    496c:	000067b7          	lui	a5,0x6
    4970:	2e47a783          	lw	a5,740(a5) # 62e4 <_filelib_init>
    4974:	fd010113          	addi	sp,sp,-48
    4978:	03212023          	sw	s2,32(sp)
    497c:	01312e23          	sw	s3,28(sp)
    4980:	02112623          	sw	ra,44(sp)
    4984:	02812423          	sw	s0,40(sp)
    4988:	02912223          	sw	s1,36(sp)
    498c:	00050913          	mv	s2,a0
    4990:	00058993          	mv	s3,a1
    4994:	00079663          	bnez	a5,49a0 <fl_readdir+0x34>
    4998:	ffffe097          	auipc	ra,0xffffe
    499c:	390080e7          	jalr	912(ra) # 2d28 <fl_init>
    49a0:	000084b7          	lui	s1,0x8
    49a4:	f0448413          	addi	s0,s1,-252 # 7f04 <_fs>
    49a8:	03c42783          	lw	a5,60(s0)
    49ac:	00078463          	beqz	a5,49b4 <fl_readdir+0x48>
    49b0:	000780e7          	jalr	a5
    49b4:	00098613          	mv	a2,s3
    49b8:	00090593          	mv	a1,s2
    49bc:	f0448513          	addi	a0,s1,-252
    49c0:	00000097          	auipc	ra,0x0
    49c4:	d68080e7          	jalr	-664(ra) # 4728 <fatfs_list_directory_next>
    49c8:	04042783          	lw	a5,64(s0)
    49cc:	00078863          	beqz	a5,49dc <fl_readdir+0x70>
    49d0:	00a12623          	sw	a0,12(sp)
    49d4:	000780e7          	jalr	a5
    49d8:	00c12503          	lw	a0,12(sp)
    49dc:	02c12083          	lw	ra,44(sp)
    49e0:	02812403          	lw	s0,40(sp)
    49e4:	00154513          	xori	a0,a0,1
    49e8:	02412483          	lw	s1,36(sp)
    49ec:	02012903          	lw	s2,32(sp)
    49f0:	01c12983          	lw	s3,28(sp)
    49f4:	40a00533          	neg	a0,a0
    49f8:	03010113          	addi	sp,sp,48
    49fc:	00008067          	ret

00004a00 <_read_sectors>:
    4a00:	fd010113          	addi	sp,sp,-48
    4a04:	01512a23          	sw	s5,20(sp)
    4a08:	00008ab7          	lui	s5,0x8
    4a0c:	01312e23          	sw	s3,28(sp)
    4a10:	f04ac983          	lbu	s3,-252(s5) # 7f04 <_fs>
    4a14:	01612823          	sw	s6,16(sp)
    4a18:	00058b13          	mv	s6,a1
    4a1c:	02912223          	sw	s1,36(sp)
    4a20:	00098593          	mv	a1,s3
    4a24:	00050493          	mv	s1,a0
    4a28:	000b0513          	mv	a0,s6
    4a2c:	02112623          	sw	ra,44(sp)
    4a30:	02812423          	sw	s0,40(sp)
    4a34:	01412c23          	sw	s4,24(sp)
    4a38:	00068413          	mv	s0,a3
    4a3c:	01712623          	sw	s7,12(sp)
    4a40:	01812423          	sw	s8,8(sp)
    4a44:	03212023          	sw	s2,32(sp)
    4a48:	00060c13          	mv	s8,a2
    4a4c:	ffffd097          	auipc	ra,0xffffd
    4a50:	658080e7          	jalr	1624(ra) # 20a4 <__udivsi3>
    4a54:	00050a13          	mv	s4,a0
    4a58:	00098593          	mv	a1,s3
    4a5c:	000b0513          	mv	a0,s6
    4a60:	ffffd097          	auipc	ra,0xffffd
    4a64:	68c080e7          	jalr	1676(ra) # 20ec <__umodsi3>
    4a68:	00a407b3          	add	a5,s0,a0
    4a6c:	00050b93          	mv	s7,a0
    4a70:	00f9fe63          	bgeu	s3,a5,4a8c <_read_sectors+0x8c>
    4a74:	000a0593          	mv	a1,s4
    4a78:	00098513          	mv	a0,s3
    4a7c:	ffffe097          	auipc	ra,0xffffe
    4a80:	e18080e7          	jalr	-488(ra) # 2894 <__mulsi3>
    4a84:	416987b3          	sub	a5,s3,s6
    4a88:	00f50433          	add	s0,a0,a5
    4a8c:	2284a903          	lw	s2,552(s1)
    4a90:	07491863          	bne	s2,s4,4b00 <_read_sectors+0x100>
    4a94:	22c4a583          	lw	a1,556(s1)
    4a98:	fff00793          	li	a5,-1
    4a9c:	02f58663          	beq	a1,a5,4ac8 <_read_sectors+0xc8>
    4aa0:	f04a8513          	addi	a0,s5,-252
    4aa4:	ffffe097          	auipc	ra,0xffffe
    4aa8:	154080e7          	jalr	340(ra) # 2bf8 <fatfs_lba_of_cluster>
    4aac:	017505b3          	add	a1,a0,s7
    4ab0:	00040693          	mv	a3,s0
    4ab4:	000c0613          	mv	a2,s8
    4ab8:	f04a8513          	addi	a0,s5,-252
    4abc:	ffffe097          	auipc	ra,0xffffe
    4ac0:	188080e7          	jalr	392(ra) # 2c44 <fatfs_sector_read>
    4ac4:	00051463          	bnez	a0,4acc <_read_sectors+0xcc>
    4ac8:	00000413          	li	s0,0
    4acc:	02c12083          	lw	ra,44(sp)
    4ad0:	00040513          	mv	a0,s0
    4ad4:	02812403          	lw	s0,40(sp)
    4ad8:	02412483          	lw	s1,36(sp)
    4adc:	02012903          	lw	s2,32(sp)
    4ae0:	01c12983          	lw	s3,28(sp)
    4ae4:	01812a03          	lw	s4,24(sp)
    4ae8:	01412a83          	lw	s5,20(sp)
    4aec:	01012b03          	lw	s6,16(sp)
    4af0:	00c12b83          	lw	s7,12(sp)
    4af4:	00812c03          	lw	s8,8(sp)
    4af8:	03010113          	addi	sp,sp,48
    4afc:	00008067          	ret
    4b00:	033b6463          	bltu	s6,s3,4b28 <_read_sectors+0x128>
    4b04:	00190793          	addi	a5,s2,1
    4b08:	03479063          	bne	a5,s4,4b28 <_read_sectors+0x128>
    4b0c:	22c4a583          	lw	a1,556(s1)
    4b10:	03496263          	bltu	s2,s4,4b34 <_read_sectors+0x134>
    4b14:	fff00793          	li	a5,-1
    4b18:	faf588e3          	beq	a1,a5,4ac8 <_read_sectors+0xc8>
    4b1c:	22b4a623          	sw	a1,556(s1)
    4b20:	2344a423          	sw	s4,552(s1)
    4b24:	f7dff06f          	j	4aa0 <_read_sectors+0xa0>
    4b28:	0044a583          	lw	a1,4(s1)
    4b2c:	00000913          	li	s2,0
    4b30:	fe1ff06f          	j	4b10 <_read_sectors+0x110>
    4b34:	f04a8513          	addi	a0,s5,-252
    4b38:	fffff097          	auipc	ra,0xfffff
    4b3c:	230080e7          	jalr	560(ra) # 3d68 <fatfs_find_next_cluster>
    4b40:	00050593          	mv	a1,a0
    4b44:	00190913          	addi	s2,s2,1
    4b48:	fc9ff06f          	j	4b10 <_read_sectors+0x110>

00004b4c <fatfs_set_fs_info_next_free_cluster>:
    4b4c:	03052783          	lw	a5,48(a0)
    4b50:	0a078463          	beqz	a5,4bf8 <fatfs_set_fs_info_next_free_cluster+0xac>
    4b54:	fe010113          	addi	sp,sp,-32
    4b58:	01c52783          	lw	a5,28(a0)
    4b5c:	00912a23          	sw	s1,20(sp)
    4b60:	00058493          	mv	s1,a1
    4b64:	01855583          	lhu	a1,24(a0)
    4b68:	00812c23          	sw	s0,24(sp)
    4b6c:	00112e23          	sw	ra,28(sp)
    4b70:	00f585b3          	add	a1,a1,a5
    4b74:	00050413          	mv	s0,a0
    4b78:	ffffe097          	auipc	ra,0xffffe
    4b7c:	ed4080e7          	jalr	-300(ra) # 2a4c <fatfs_fat_read_sector>
    4b80:	00050593          	mv	a1,a0
    4b84:	06050063          	beqz	a0,4be4 <fatfs_set_fs_info_next_free_cluster+0x98>
    4b88:	20852783          	lw	a5,520(a0)
    4b8c:	0084d713          	srli	a4,s1,0x8
    4b90:	00100613          	li	a2,1
    4b94:	1e978623          	sb	s1,492(a5)
    4b98:	20852783          	lw	a5,520(a0)
    4b9c:	1ee786a3          	sb	a4,493(a5)
    4ba0:	20852783          	lw	a5,520(a0)
    4ba4:	0104d713          	srli	a4,s1,0x10
    4ba8:	1ee78723          	sb	a4,494(a5)
    4bac:	20852783          	lw	a5,520(a0)
    4bb0:	0184d713          	srli	a4,s1,0x18
    4bb4:	1ee787a3          	sb	a4,495(a5)
    4bb8:	03842783          	lw	a5,56(s0)
    4bbc:	20c52223          	sw	a2,516(a0)
    4bc0:	02942223          	sw	s1,36(s0)
    4bc4:	00078a63          	beqz	a5,4bd8 <fatfs_set_fs_info_next_free_cluster+0x8c>
    4bc8:	20052503          	lw	a0,512(a0)
    4bcc:	00b12623          	sw	a1,12(sp)
    4bd0:	000780e7          	jalr	a5
    4bd4:	00c12583          	lw	a1,12(sp)
    4bd8:	fff00793          	li	a5,-1
    4bdc:	20f5a023          	sw	a5,512(a1)
    4be0:	2005a223          	sw	zero,516(a1)
    4be4:	01c12083          	lw	ra,28(sp)
    4be8:	01812403          	lw	s0,24(sp)
    4bec:	01412483          	lw	s1,20(sp)
    4bf0:	02010113          	addi	sp,sp,32
    4bf4:	00008067          	ret
    4bf8:	00008067          	ret

00004bfc <fatfs_find_blank_cluster>:
    4bfc:	fd010113          	addi	sp,sp,-48
    4c00:	01312e23          	sw	s3,28(sp)
    4c04:	100009b7          	lui	s3,0x10000
    4c08:	02912223          	sw	s1,36(sp)
    4c0c:	03212023          	sw	s2,32(sp)
    4c10:	02112623          	sw	ra,44(sp)
    4c14:	02812423          	sw	s0,40(sp)
    4c18:	00050913          	mv	s2,a0
    4c1c:	00058493          	mv	s1,a1
    4c20:	fff98993          	addi	s3,s3,-1 # fffffff <__stacktop+0xffeffff>
    4c24:	03092783          	lw	a5,48(s2)
    4c28:	0074d413          	srli	s0,s1,0x7
    4c2c:	00079463          	bnez	a5,4c34 <fatfs_find_blank_cluster+0x38>
    4c30:	0084d413          	srli	s0,s1,0x8
    4c34:	02092783          	lw	a5,32(s2)
    4c38:	0cf47863          	bgeu	s0,a5,4d08 <fatfs_find_blank_cluster+0x10c>
    4c3c:	01492583          	lw	a1,20(s2)
    4c40:	00090513          	mv	a0,s2
    4c44:	00c12623          	sw	a2,12(sp)
    4c48:	00b405b3          	add	a1,s0,a1
    4c4c:	ffffe097          	auipc	ra,0xffffe
    4c50:	e00080e7          	jalr	-512(ra) # 2a4c <fatfs_fat_read_sector>
    4c54:	0a050a63          	beqz	a0,4d08 <fatfs_find_blank_cluster+0x10c>
    4c58:	03092783          	lw	a5,48(s2)
    4c5c:	20852703          	lw	a4,520(a0)
    4c60:	00c12603          	lw	a2,12(sp)
    4c64:	04079a63          	bnez	a5,4cb8 <fatfs_find_blank_cluster+0xbc>
    4c68:	00841413          	slli	s0,s0,0x8
    4c6c:	40848433          	sub	s0,s1,s0
    4c70:	00141413          	slli	s0,s0,0x1
    4c74:	01041413          	slli	s0,s0,0x10
    4c78:	01045413          	srli	s0,s0,0x10
    4c7c:	00870733          	add	a4,a4,s0
    4c80:	00174783          	lbu	a5,1(a4)
    4c84:	00074703          	lbu	a4,0(a4)
    4c88:	00879793          	slli	a5,a5,0x8
    4c8c:	00e787b3          	add	a5,a5,a4
    4c90:	06079863          	bnez	a5,4d00 <fatfs_find_blank_cluster+0x104>
    4c94:	00962023          	sw	s1,0(a2)
    4c98:	00100513          	li	a0,1
    4c9c:	02c12083          	lw	ra,44(sp)
    4ca0:	02812403          	lw	s0,40(sp)
    4ca4:	02412483          	lw	s1,36(sp)
    4ca8:	02012903          	lw	s2,32(sp)
    4cac:	01c12983          	lw	s3,28(sp)
    4cb0:	03010113          	addi	sp,sp,48
    4cb4:	00008067          	ret
    4cb8:	00741413          	slli	s0,s0,0x7
    4cbc:	40848433          	sub	s0,s1,s0
    4cc0:	00241413          	slli	s0,s0,0x2
    4cc4:	01041413          	slli	s0,s0,0x10
    4cc8:	01045413          	srli	s0,s0,0x10
    4ccc:	00870733          	add	a4,a4,s0
    4cd0:	00374783          	lbu	a5,3(a4)
    4cd4:	00274683          	lbu	a3,2(a4)
    4cd8:	01879793          	slli	a5,a5,0x18
    4cdc:	01069693          	slli	a3,a3,0x10
    4ce0:	00d787b3          	add	a5,a5,a3
    4ce4:	00074683          	lbu	a3,0(a4)
    4ce8:	00174703          	lbu	a4,1(a4)
    4cec:	00d787b3          	add	a5,a5,a3
    4cf0:	00871713          	slli	a4,a4,0x8
    4cf4:	00e787b3          	add	a5,a5,a4
    4cf8:	0137f7b3          	and	a5,a5,s3
    4cfc:	f95ff06f          	j	4c90 <fatfs_find_blank_cluster+0x94>
    4d00:	00148493          	addi	s1,s1,1
    4d04:	f21ff06f          	j	4c24 <fatfs_find_blank_cluster+0x28>
    4d08:	00000513          	li	a0,0
    4d0c:	f91ff06f          	j	4c9c <fatfs_find_blank_cluster+0xa0>

00004d10 <fatfs_fat_set_cluster>:
    4d10:	03052783          	lw	a5,48(a0)
    4d14:	fe010113          	addi	sp,sp,-32
    4d18:	00812c23          	sw	s0,24(sp)
    4d1c:	00912a23          	sw	s1,20(sp)
    4d20:	01212823          	sw	s2,16(sp)
    4d24:	00112e23          	sw	ra,28(sp)
    4d28:	00050913          	mv	s2,a0
    4d2c:	00058413          	mv	s0,a1
    4d30:	0085d493          	srli	s1,a1,0x8
    4d34:	00078463          	beqz	a5,4d3c <fatfs_fat_set_cluster+0x2c>
    4d38:	0075d493          	srli	s1,a1,0x7
    4d3c:	01492583          	lw	a1,20(s2)
    4d40:	00090513          	mv	a0,s2
    4d44:	00c12623          	sw	a2,12(sp)
    4d48:	00b485b3          	add	a1,s1,a1
    4d4c:	ffffe097          	auipc	ra,0xffffe
    4d50:	d00080e7          	jalr	-768(ra) # 2a4c <fatfs_fat_read_sector>
    4d54:	00050793          	mv	a5,a0
    4d58:	00000513          	li	a0,0
    4d5c:	04078663          	beqz	a5,4da8 <fatfs_fat_set_cluster+0x98>
    4d60:	03092683          	lw	a3,48(s2)
    4d64:	2087a703          	lw	a4,520(a5)
    4d68:	00c12603          	lw	a2,12(sp)
    4d6c:	04069a63          	bnez	a3,4dc0 <fatfs_fat_set_cluster+0xb0>
    4d70:	00849493          	slli	s1,s1,0x8
    4d74:	40940433          	sub	s0,s0,s1
    4d78:	00141413          	slli	s0,s0,0x1
    4d7c:	01041413          	slli	s0,s0,0x10
    4d80:	01045413          	srli	s0,s0,0x10
    4d84:	00870733          	add	a4,a4,s0
    4d88:	00c70023          	sb	a2,0(a4)
    4d8c:	2087a703          	lw	a4,520(a5)
    4d90:	00865613          	srli	a2,a2,0x8
    4d94:	00870733          	add	a4,a4,s0
    4d98:	00c700a3          	sb	a2,1(a4)
    4d9c:	00100713          	li	a4,1
    4da0:	20e7a223          	sw	a4,516(a5)
    4da4:	00100513          	li	a0,1
    4da8:	01c12083          	lw	ra,28(sp)
    4dac:	01812403          	lw	s0,24(sp)
    4db0:	01412483          	lw	s1,20(sp)
    4db4:	01012903          	lw	s2,16(sp)
    4db8:	02010113          	addi	sp,sp,32
    4dbc:	00008067          	ret
    4dc0:	00749493          	slli	s1,s1,0x7
    4dc4:	40940433          	sub	s0,s0,s1
    4dc8:	00241413          	slli	s0,s0,0x2
    4dcc:	01041413          	slli	s0,s0,0x10
    4dd0:	01045413          	srli	s0,s0,0x10
    4dd4:	00870733          	add	a4,a4,s0
    4dd8:	00c70023          	sb	a2,0(a4)
    4ddc:	2087a703          	lw	a4,520(a5)
    4de0:	00865693          	srli	a3,a2,0x8
    4de4:	00870733          	add	a4,a4,s0
    4de8:	00d700a3          	sb	a3,1(a4)
    4dec:	2087a703          	lw	a4,520(a5)
    4df0:	01065693          	srli	a3,a2,0x10
    4df4:	01865613          	srli	a2,a2,0x18
    4df8:	00870733          	add	a4,a4,s0
    4dfc:	00d70123          	sb	a3,2(a4)
    4e00:	2087a703          	lw	a4,520(a5)
    4e04:	00870733          	add	a4,a4,s0
    4e08:	00c701a3          	sb	a2,3(a4)
    4e0c:	f91ff06f          	j	4d9c <fatfs_fat_set_cluster+0x8c>

00004e10 <fatfs_free_cluster_chain>:
    4e10:	fe010113          	addi	sp,sp,-32
    4e14:	00812c23          	sw	s0,24(sp)
    4e18:	00912a23          	sw	s1,20(sp)
    4e1c:	00112e23          	sw	ra,28(sp)
    4e20:	01212823          	sw	s2,16(sp)
    4e24:	00050493          	mv	s1,a0
    4e28:	ffd00413          	li	s0,-3
    4e2c:	fff58793          	addi	a5,a1,-1
    4e30:	02f47063          	bgeu	s0,a5,4e50 <fatfs_free_cluster_chain+0x40>
    4e34:	01c12083          	lw	ra,28(sp)
    4e38:	01812403          	lw	s0,24(sp)
    4e3c:	01412483          	lw	s1,20(sp)
    4e40:	01012903          	lw	s2,16(sp)
    4e44:	00100513          	li	a0,1
    4e48:	02010113          	addi	sp,sp,32
    4e4c:	00008067          	ret
    4e50:	00048513          	mv	a0,s1
    4e54:	00b12623          	sw	a1,12(sp)
    4e58:	fffff097          	auipc	ra,0xfffff
    4e5c:	f10080e7          	jalr	-240(ra) # 3d68 <fatfs_find_next_cluster>
    4e60:	00c12583          	lw	a1,12(sp)
    4e64:	00050913          	mv	s2,a0
    4e68:	00000613          	li	a2,0
    4e6c:	00048513          	mv	a0,s1
    4e70:	00000097          	auipc	ra,0x0
    4e74:	ea0080e7          	jalr	-352(ra) # 4d10 <fatfs_fat_set_cluster>
    4e78:	00090593          	mv	a1,s2
    4e7c:	fb1ff06f          	j	4e2c <fatfs_free_cluster_chain+0x1c>

00004e80 <fatfs_fat_add_cluster_to_chain>:
    4e80:	fd010113          	addi	sp,sp,-48
    4e84:	02912223          	sw	s1,36(sp)
    4e88:	02112623          	sw	ra,44(sp)
    4e8c:	02812423          	sw	s0,40(sp)
    4e90:	03212023          	sw	s2,32(sp)
    4e94:	01312e23          	sw	s3,28(sp)
    4e98:	fff00493          	li	s1,-1
    4e9c:	02959263          	bne	a1,s1,4ec0 <fatfs_fat_add_cluster_to_chain+0x40>
    4ea0:	00000513          	li	a0,0
    4ea4:	02c12083          	lw	ra,44(sp)
    4ea8:	02812403          	lw	s0,40(sp)
    4eac:	02412483          	lw	s1,36(sp)
    4eb0:	02012903          	lw	s2,32(sp)
    4eb4:	01c12983          	lw	s3,28(sp)
    4eb8:	03010113          	addi	sp,sp,48
    4ebc:	00008067          	ret
    4ec0:	00050913          	mv	s2,a0
    4ec4:	00058413          	mv	s0,a1
    4ec8:	00060993          	mv	s3,a2
    4ecc:	00040593          	mv	a1,s0
    4ed0:	00090513          	mv	a0,s2
    4ed4:	00812623          	sw	s0,12(sp)
    4ed8:	fffff097          	auipc	ra,0xfffff
    4edc:	e90080e7          	jalr	-368(ra) # 3d68 <fatfs_find_next_cluster>
    4ee0:	00050413          	mv	s0,a0
    4ee4:	fa050ee3          	beqz	a0,4ea0 <fatfs_fat_add_cluster_to_chain+0x20>
    4ee8:	00c12583          	lw	a1,12(sp)
    4eec:	fe9510e3          	bne	a0,s1,4ecc <fatfs_fat_add_cluster_to_chain+0x4c>
    4ef0:	00098613          	mv	a2,s3
    4ef4:	00090513          	mv	a0,s2
    4ef8:	00000097          	auipc	ra,0x0
    4efc:	e18080e7          	jalr	-488(ra) # 4d10 <fatfs_fat_set_cluster>
    4f00:	00040613          	mv	a2,s0
    4f04:	00098593          	mv	a1,s3
    4f08:	00090513          	mv	a0,s2
    4f0c:	00000097          	auipc	ra,0x0
    4f10:	e04080e7          	jalr	-508(ra) # 4d10 <fatfs_fat_set_cluster>
    4f14:	00100513          	li	a0,1
    4f18:	f8dff06f          	j	4ea4 <fatfs_fat_add_cluster_to_chain+0x24>

00004f1c <fatfs_add_free_space>:
    4f1c:	02452783          	lw	a5,36(a0)
    4f20:	fd010113          	addi	sp,sp,-48
    4f24:	02812423          	sw	s0,40(sp)
    4f28:	01312e23          	sw	s3,28(sp)
    4f2c:	01412c23          	sw	s4,24(sp)
    4f30:	0005a983          	lw	s3,0(a1)
    4f34:	01512a23          	sw	s5,20(sp)
    4f38:	00058a13          	mv	s4,a1
    4f3c:	02112623          	sw	ra,44(sp)
    4f40:	02912223          	sw	s1,36(sp)
    4f44:	03212023          	sw	s2,32(sp)
    4f48:	fff00593          	li	a1,-1
    4f4c:	00050413          	mv	s0,a0
    4f50:	00060a93          	mv	s5,a2
    4f54:	00b78663          	beq	a5,a1,4f60 <fatfs_add_free_space+0x44>
    4f58:	00000097          	auipc	ra,0x0
    4f5c:	bf4080e7          	jalr	-1036(ra) # 4b4c <fatfs_set_fs_info_next_free_cluster>
    4f60:	00000493          	li	s1,0
    4f64:	03549663          	bne	s1,s5,4f90 <fatfs_add_free_space+0x74>
    4f68:	00100513          	li	a0,1
    4f6c:	02c12083          	lw	ra,44(sp)
    4f70:	02812403          	lw	s0,40(sp)
    4f74:	02412483          	lw	s1,36(sp)
    4f78:	02012903          	lw	s2,32(sp)
    4f7c:	01c12983          	lw	s3,28(sp)
    4f80:	01812a03          	lw	s4,24(sp)
    4f84:	01412a83          	lw	s5,20(sp)
    4f88:	03010113          	addi	sp,sp,48
    4f8c:	00008067          	ret
    4f90:	00842583          	lw	a1,8(s0)
    4f94:	00c10613          	addi	a2,sp,12
    4f98:	00040513          	mv	a0,s0
    4f9c:	00000097          	auipc	ra,0x0
    4fa0:	c60080e7          	jalr	-928(ra) # 4bfc <fatfs_find_blank_cluster>
    4fa4:	fc0504e3          	beqz	a0,4f6c <fatfs_add_free_space+0x50>
    4fa8:	00c12903          	lw	s2,12(sp)
    4fac:	00098593          	mv	a1,s3
    4fb0:	00040513          	mv	a0,s0
    4fb4:	00090613          	mv	a2,s2
    4fb8:	00000097          	auipc	ra,0x0
    4fbc:	d58080e7          	jalr	-680(ra) # 4d10 <fatfs_fat_set_cluster>
    4fc0:	fff00613          	li	a2,-1
    4fc4:	00090593          	mv	a1,s2
    4fc8:	00040513          	mv	a0,s0
    4fcc:	00000097          	auipc	ra,0x0
    4fd0:	d44080e7          	jalr	-700(ra) # 4d10 <fatfs_fat_set_cluster>
    4fd4:	00049463          	bnez	s1,4fdc <fatfs_add_free_space+0xc0>
    4fd8:	012a2023          	sw	s2,0(s4)
    4fdc:	00148493          	addi	s1,s1,1
    4fe0:	00090993          	mv	s3,s2
    4fe4:	f81ff06f          	j	4f64 <fatfs_add_free_space+0x48>

00004fe8 <_write_sectors>:
    4fe8:	fb010113          	addi	sp,sp,-80
    4fec:	03512a23          	sw	s5,52(sp)
    4ff0:	00008ab7          	lui	s5,0x8
    4ff4:	04112623          	sw	ra,76(sp)
    4ff8:	04812423          	sw	s0,72(sp)
    4ffc:	04912223          	sw	s1,68(sp)
    5000:	03412c23          	sw	s4,56(sp)
    5004:	03612823          	sw	s6,48(sp)
    5008:	03712623          	sw	s7,44(sp)
    500c:	03812423          	sw	s8,40(sp)
    5010:	03912223          	sw	s9,36(sp)
    5014:	03a12023          	sw	s10,32(sp)
    5018:	05212023          	sw	s2,64(sp)
    501c:	03312e23          	sw	s3,60(sp)
    5020:	f04a8b93          	addi	s7,s5,-252 # 7f04 <_fs>
    5024:	000bc983          	lbu	s3,0(s7)
    5028:	00058b13          	mv	s6,a1
    502c:	fff00793          	li	a5,-1
    5030:	00098593          	mv	a1,s3
    5034:	00050493          	mv	s1,a0
    5038:	000b0513          	mv	a0,s6
    503c:	00068c13          	mv	s8,a3
    5040:	00f12e23          	sw	a5,28(sp)
    5044:	00060d13          	mv	s10,a2
    5048:	ffffd097          	auipc	ra,0xffffd
    504c:	05c080e7          	jalr	92(ra) # 20a4 <__udivsi3>
    5050:	00050a13          	mv	s4,a0
    5054:	00098593          	mv	a1,s3
    5058:	000b0513          	mv	a0,s6
    505c:	ffffd097          	auipc	ra,0xffffd
    5060:	090080e7          	jalr	144(ra) # 20ec <__umodsi3>
    5064:	00ac07b3          	add	a5,s8,a0
    5068:	00050c93          	mv	s9,a0
    506c:	000c0413          	mv	s0,s8
    5070:	00f9fe63          	bgeu	s3,a5,508c <_write_sectors+0xa4>
    5074:	000a0593          	mv	a1,s4
    5078:	00098513          	mv	a0,s3
    507c:	ffffe097          	auipc	ra,0xffffe
    5080:	818080e7          	jalr	-2024(ra) # 2894 <__mulsi3>
    5084:	416987b3          	sub	a5,s3,s6
    5088:	00f50433          	add	s0,a0,a5
    508c:	2284a903          	lw	s2,552(s1)
    5090:	03491a63          	bne	s2,s4,50c4 <_write_sectors+0xdc>
    5094:	22c4a583          	lw	a1,556(s1)
    5098:	f04a8513          	addi	a0,s5,-252
    509c:	ffffe097          	auipc	ra,0xffffe
    50a0:	b5c080e7          	jalr	-1188(ra) # 2bf8 <fatfs_lba_of_cluster>
    50a4:	019505b3          	add	a1,a0,s9
    50a8:	00040693          	mv	a3,s0
    50ac:	000d0613          	mv	a2,s10
    50b0:	f04a8513          	addi	a0,s5,-252
    50b4:	ffffe097          	auipc	ra,0xffffe
    50b8:	ba8080e7          	jalr	-1112(ra) # 2c5c <fatfs_sector_write>
    50bc:	04050a63          	beqz	a0,5110 <_write_sectors+0x128>
    50c0:	0540006f          	j	5114 <_write_sectors+0x12c>
    50c4:	093b6663          	bltu	s6,s3,5150 <_write_sectors+0x168>
    50c8:	00190793          	addi	a5,s2,1
    50cc:	09479263          	bne	a5,s4,5150 <_write_sectors+0x168>
    50d0:	22c4a583          	lw	a1,556(s1)
    50d4:	fff00b13          	li	s6,-1
    50d8:	09496263          	bltu	s2,s4,515c <_write_sectors+0x174>
    50dc:	fff00793          	li	a5,-1
    50e0:	0af59463          	bne	a1,a5,5188 <_write_sectors+0x1a0>
    50e4:	000bc583          	lbu	a1,0(s7)
    50e8:	fff58513          	addi	a0,a1,-1
    50ec:	01850533          	add	a0,a0,s8
    50f0:	ffffd097          	auipc	ra,0xffffd
    50f4:	fb4080e7          	jalr	-76(ra) # 20a4 <__udivsi3>
    50f8:	00050613          	mv	a2,a0
    50fc:	01c10593          	addi	a1,sp,28
    5100:	000b8513          	mv	a0,s7
    5104:	00000097          	auipc	ra,0x0
    5108:	e18080e7          	jalr	-488(ra) # 4f1c <fatfs_add_free_space>
    510c:	06051c63          	bnez	a0,5184 <_write_sectors+0x19c>
    5110:	00000413          	li	s0,0
    5114:	04c12083          	lw	ra,76(sp)
    5118:	00040513          	mv	a0,s0
    511c:	04812403          	lw	s0,72(sp)
    5120:	04412483          	lw	s1,68(sp)
    5124:	04012903          	lw	s2,64(sp)
    5128:	03c12983          	lw	s3,60(sp)
    512c:	03812a03          	lw	s4,56(sp)
    5130:	03412a83          	lw	s5,52(sp)
    5134:	03012b03          	lw	s6,48(sp)
    5138:	02c12b83          	lw	s7,44(sp)
    513c:	02812c03          	lw	s8,40(sp)
    5140:	02412c83          	lw	s9,36(sp)
    5144:	02012d03          	lw	s10,32(sp)
    5148:	05010113          	addi	sp,sp,80
    514c:	00008067          	ret
    5150:	0044a583          	lw	a1,4(s1)
    5154:	00000913          	li	s2,0
    5158:	f7dff06f          	j	50d4 <_write_sectors+0xec>
    515c:	f04a8513          	addi	a0,s5,-252
    5160:	00b12623          	sw	a1,12(sp)
    5164:	fffff097          	auipc	ra,0xfffff
    5168:	c04080e7          	jalr	-1020(ra) # 3d68 <fatfs_find_next_cluster>
    516c:	00c12583          	lw	a1,12(sp)
    5170:	00b12e23          	sw	a1,28(sp)
    5174:	f76508e3          	beq	a0,s6,50e4 <_write_sectors+0xfc>
    5178:	00190913          	addi	s2,s2,1
    517c:	00050593          	mv	a1,a0
    5180:	f59ff06f          	j	50d8 <_write_sectors+0xf0>
    5184:	01c12583          	lw	a1,28(sp)
    5188:	22b4a623          	sw	a1,556(s1)
    518c:	2344a423          	sw	s4,552(s1)
    5190:	f09ff06f          	j	5098 <_write_sectors+0xb0>

00005194 <fl_fflush>:
    5194:	000067b7          	lui	a5,0x6
    5198:	2e47a783          	lw	a5,740(a5) # 62e4 <_filelib_init>
    519c:	ff010113          	addi	sp,sp,-16
    51a0:	00812423          	sw	s0,8(sp)
    51a4:	00112623          	sw	ra,12(sp)
    51a8:	00912223          	sw	s1,4(sp)
    51ac:	00050413          	mv	s0,a0
    51b0:	00079663          	bnez	a5,51bc <fl_fflush+0x28>
    51b4:	ffffe097          	auipc	ra,0xffffe
    51b8:	b74080e7          	jalr	-1164(ra) # 2d28 <fl_init>
    51bc:	04040663          	beqz	s0,5208 <fl_fflush+0x74>
    51c0:	000084b7          	lui	s1,0x8
    51c4:	f0448493          	addi	s1,s1,-252 # 7f04 <_fs>
    51c8:	03c4a783          	lw	a5,60(s1)
    51cc:	00078463          	beqz	a5,51d4 <fl_fflush+0x40>
    51d0:	000780e7          	jalr	a5
    51d4:	43442783          	lw	a5,1076(s0)
    51d8:	02078263          	beqz	a5,51fc <fl_fflush+0x68>
    51dc:	43042583          	lw	a1,1072(s0)
    51e0:	00100693          	li	a3,1
    51e4:	23040613          	addi	a2,s0,560
    51e8:	00040513          	mv	a0,s0
    51ec:	00000097          	auipc	ra,0x0
    51f0:	dfc080e7          	jalr	-516(ra) # 4fe8 <_write_sectors>
    51f4:	00050463          	beqz	a0,51fc <fl_fflush+0x68>
    51f8:	42042a23          	sw	zero,1076(s0)
    51fc:	0404a783          	lw	a5,64(s1)
    5200:	00078463          	beqz	a5,5208 <fl_fflush+0x74>
    5204:	000780e7          	jalr	a5
    5208:	00c12083          	lw	ra,12(sp)
    520c:	00812403          	lw	s0,8(sp)
    5210:	00412483          	lw	s1,4(sp)
    5214:	00000513          	li	a0,0
    5218:	01010113          	addi	sp,sp,16
    521c:	00008067          	ret

00005220 <fl_fclose>:
    5220:	000067b7          	lui	a5,0x6
    5224:	2e47a783          	lw	a5,740(a5) # 62e4 <_filelib_init>
    5228:	ff010113          	addi	sp,sp,-16
    522c:	00812423          	sw	s0,8(sp)
    5230:	00112623          	sw	ra,12(sp)
    5234:	00912223          	sw	s1,4(sp)
    5238:	01212023          	sw	s2,0(sp)
    523c:	00050413          	mv	s0,a0
    5240:	00079663          	bnez	a5,524c <fl_fclose+0x2c>
    5244:	ffffe097          	auipc	ra,0xffffe
    5248:	ae4080e7          	jalr	-1308(ra) # 2d28 <fl_init>
    524c:	08040c63          	beqz	s0,52e4 <fl_fclose+0xc4>
    5250:	000084b7          	lui	s1,0x8
    5254:	f0448913          	addi	s2,s1,-252 # 7f04 <_fs>
    5258:	03c92783          	lw	a5,60(s2)
    525c:	00078463          	beqz	a5,5264 <fl_fclose+0x44>
    5260:	000780e7          	jalr	a5
    5264:	00040513          	mv	a0,s0
    5268:	00000097          	auipc	ra,0x0
    526c:	f2c080e7          	jalr	-212(ra) # 5194 <fl_fflush>
    5270:	01042783          	lw	a5,16(s0)
    5274:	00078e63          	beqz	a5,5290 <fl_fclose+0x70>
    5278:	00c42683          	lw	a3,12(s0)
    527c:	00042583          	lw	a1,0(s0)
    5280:	21c40613          	addi	a2,s0,540
    5284:	f0448513          	addi	a0,s1,-252
    5288:	fffff097          	auipc	ra,0xfffff
    528c:	338080e7          	jalr	824(ra) # 45c0 <fatfs_update_file_length>
    5290:	fff00793          	li	a5,-1
    5294:	42f42823          	sw	a5,1072(s0)
    5298:	00040513          	mv	a0,s0
    529c:	00042423          	sw	zero,8(s0)
    52a0:	00042623          	sw	zero,12(s0)
    52a4:	00042223          	sw	zero,4(s0)
    52a8:	42042a23          	sw	zero,1076(s0)
    52ac:	00042823          	sw	zero,16(s0)
    52b0:	ffffe097          	auipc	ra,0xffffe
    52b4:	900080e7          	jalr	-1792(ra) # 2bb0 <_free_file>
    52b8:	f0448513          	addi	a0,s1,-252
    52bc:	fffff097          	auipc	ra,0xfffff
    52c0:	a54080e7          	jalr	-1452(ra) # 3d10 <fatfs_fat_purge>
    52c4:	04092783          	lw	a5,64(s2)
    52c8:	00078e63          	beqz	a5,52e4 <fl_fclose+0xc4>
    52cc:	00812403          	lw	s0,8(sp)
    52d0:	00c12083          	lw	ra,12(sp)
    52d4:	00412483          	lw	s1,4(sp)
    52d8:	00012903          	lw	s2,0(sp)
    52dc:	01010113          	addi	sp,sp,16
    52e0:	00078067          	jr	a5
    52e4:	00c12083          	lw	ra,12(sp)
    52e8:	00812403          	lw	s0,8(sp)
    52ec:	00412483          	lw	s1,4(sp)
    52f0:	00012903          	lw	s2,0(sp)
    52f4:	01010113          	addi	sp,sp,16
    52f8:	00008067          	ret

000052fc <fl_fread>:
    52fc:	000067b7          	lui	a5,0x6
    5300:	2e47a783          	lw	a5,740(a5) # 62e4 <_filelib_init>
    5304:	fc010113          	addi	sp,sp,-64
    5308:	02812c23          	sw	s0,56(sp)
    530c:	03512223          	sw	s5,36(sp)
    5310:	02112e23          	sw	ra,60(sp)
    5314:	02912a23          	sw	s1,52(sp)
    5318:	03212823          	sw	s2,48(sp)
    531c:	03312623          	sw	s3,44(sp)
    5320:	03412423          	sw	s4,40(sp)
    5324:	03612023          	sw	s6,32(sp)
    5328:	01712e23          	sw	s7,28(sp)
    532c:	01812c23          	sw	s8,24(sp)
    5330:	01912a23          	sw	s9,20(sp)
    5334:	00050a93          	mv	s5,a0
    5338:	00068413          	mv	s0,a3
    533c:	00058513          	mv	a0,a1
    5340:	00079e63          	bnez	a5,535c <fl_fread+0x60>
    5344:	00c12623          	sw	a2,12(sp)
    5348:	00b12423          	sw	a1,8(sp)
    534c:	ffffe097          	auipc	ra,0xffffe
    5350:	9dc080e7          	jalr	-1572(ra) # 2d28 <fl_init>
    5354:	00c12603          	lw	a2,12(sp)
    5358:	00812503          	lw	a0,8(sp)
    535c:	14040e63          	beqz	s0,54b8 <fl_fread+0x1bc>
    5360:	140a8c63          	beqz	s5,54b8 <fl_fread+0x1bc>
    5364:	43844783          	lbu	a5,1080(s0)
    5368:	fff00493          	li	s1,-1
    536c:	0017f793          	andi	a5,a5,1
    5370:	04078863          	beqz	a5,53c0 <fl_fread+0xc4>
    5374:	00060593          	mv	a1,a2
    5378:	ffffd097          	auipc	ra,0xffffd
    537c:	51c080e7          	jalr	1308(ra) # 2894 <__mulsi3>
    5380:	00050493          	mv	s1,a0
    5384:	02050e63          	beqz	a0,53c0 <fl_fread+0xc4>
    5388:	00842583          	lw	a1,8(s0)
    538c:	00c42783          	lw	a5,12(s0)
    5390:	12f5f463          	bgeu	a1,a5,54b8 <fl_fread+0x1bc>
    5394:	00b50733          	add	a4,a0,a1
    5398:	00e7f463          	bgeu	a5,a4,53a0 <fl_fread+0xa4>
    539c:	40b784b3          	sub	s1,a5,a1
    53a0:	0095da13          	srli	s4,a1,0x9
    53a4:	1ff5f913          	andi	s2,a1,511
    53a8:	00000993          	li	s3,0
    53ac:	23040b13          	addi	s6,s0,560
    53b0:	20000b93          	li	s7,512
    53b4:	1ff00c13          	li	s8,511
    53b8:	0499c063          	blt	s3,s1,53f8 <fl_fread+0xfc>
    53bc:	00098493          	mv	s1,s3
    53c0:	03c12083          	lw	ra,60(sp)
    53c4:	03812403          	lw	s0,56(sp)
    53c8:	03012903          	lw	s2,48(sp)
    53cc:	02c12983          	lw	s3,44(sp)
    53d0:	02812a03          	lw	s4,40(sp)
    53d4:	02412a83          	lw	s5,36(sp)
    53d8:	02012b03          	lw	s6,32(sp)
    53dc:	01c12b83          	lw	s7,28(sp)
    53e0:	01812c03          	lw	s8,24(sp)
    53e4:	01412c83          	lw	s9,20(sp)
    53e8:	00048513          	mv	a0,s1
    53ec:	03412483          	lw	s1,52(sp)
    53f0:	04010113          	addi	sp,sp,64
    53f4:	00008067          	ret
    53f8:	04091663          	bnez	s2,5444 <fl_fread+0x148>
    53fc:	413486b3          	sub	a3,s1,s3
    5400:	04dc5263          	bge	s8,a3,5444 <fl_fread+0x148>
    5404:	4096d693          	srai	a3,a3,0x9
    5408:	013a8633          	add	a2,s5,s3
    540c:	000a0593          	mv	a1,s4
    5410:	00040513          	mv	a0,s0
    5414:	fffff097          	auipc	ra,0xfffff
    5418:	5ec080e7          	jalr	1516(ra) # 4a00 <_read_sectors>
    541c:	fa0500e3          	beqz	a0,53bc <fl_fread+0xc0>
    5420:	00951c93          	slli	s9,a0,0x9
    5424:	000c8613          	mv	a2,s9
    5428:	00aa0a33          	add	s4,s4,a0
    542c:	00842783          	lw	a5,8(s0)
    5430:	00c989b3          	add	s3,s3,a2
    5434:	00000913          	li	s2,0
    5438:	019787b3          	add	a5,a5,s9
    543c:	00f42423          	sw	a5,8(s0)
    5440:	f79ff06f          	j	53b8 <fl_fread+0xbc>
    5444:	43042783          	lw	a5,1072(s0)
    5448:	03478e63          	beq	a5,s4,5484 <fl_fread+0x188>
    544c:	43442783          	lw	a5,1076(s0)
    5450:	00078863          	beqz	a5,5460 <fl_fread+0x164>
    5454:	00040513          	mv	a0,s0
    5458:	00000097          	auipc	ra,0x0
    545c:	d3c080e7          	jalr	-708(ra) # 5194 <fl_fflush>
    5460:	00100693          	li	a3,1
    5464:	000b0613          	mv	a2,s6
    5468:	000a0593          	mv	a1,s4
    546c:	00040513          	mv	a0,s0
    5470:	fffff097          	auipc	ra,0xfffff
    5474:	590080e7          	jalr	1424(ra) # 4a00 <_read_sectors>
    5478:	f40502e3          	beqz	a0,53bc <fl_fread+0xc0>
    547c:	43442823          	sw	s4,1072(s0)
    5480:	42042a23          	sw	zero,1076(s0)
    5484:	412b87b3          	sub	a5,s7,s2
    5488:	41348633          	sub	a2,s1,s3
    548c:	00c7d463          	bge	a5,a2,5494 <fl_fread+0x198>
    5490:	00078613          	mv	a2,a5
    5494:	012b05b3          	add	a1,s6,s2
    5498:	013a8533          	add	a0,s5,s3
    549c:	00060c93          	mv	s9,a2
    54a0:	00c12423          	sw	a2,8(sp)
    54a4:	ffffd097          	auipc	ra,0xffffd
    54a8:	cc8080e7          	jalr	-824(ra) # 216c <memcpy>
    54ac:	00812603          	lw	a2,8(sp)
    54b0:	001a0a13          	addi	s4,s4,1
    54b4:	f79ff06f          	j	542c <fl_fread+0x130>
    54b8:	fff00493          	li	s1,-1
    54bc:	f05ff06f          	j	53c0 <fl_fread+0xc4>

000054c0 <fatfs_allocate_free_space>:
    54c0:	fd010113          	addi	sp,sp,-48
    54c4:	02112623          	sw	ra,44(sp)
    54c8:	02812423          	sw	s0,40(sp)
    54cc:	02912223          	sw	s1,36(sp)
    54d0:	03212023          	sw	s2,32(sp)
    54d4:	01312e23          	sw	s3,28(sp)
    54d8:	01412c23          	sw	s4,24(sp)
    54dc:	01512a23          	sw	s5,20(sp)
    54e0:	02069863          	bnez	a3,5510 <fatfs_allocate_free_space+0x50>
    54e4:	00000413          	li	s0,0
    54e8:	02c12083          	lw	ra,44(sp)
    54ec:	00040513          	mv	a0,s0
    54f0:	02812403          	lw	s0,40(sp)
    54f4:	02412483          	lw	s1,36(sp)
    54f8:	02012903          	lw	s2,32(sp)
    54fc:	01c12983          	lw	s3,28(sp)
    5500:	01812a03          	lw	s4,24(sp)
    5504:	01412a83          	lw	s5,20(sp)
    5508:	03010113          	addi	sp,sp,48
    550c:	00008067          	ret
    5510:	02452783          	lw	a5,36(a0)
    5514:	00058a13          	mv	s4,a1
    5518:	fff00593          	li	a1,-1
    551c:	00050493          	mv	s1,a0
    5520:	00068913          	mv	s2,a3
    5524:	00060993          	mv	s3,a2
    5528:	00b78663          	beq	a5,a1,5534 <fatfs_allocate_free_space+0x74>
    552c:	fffff097          	auipc	ra,0xfffff
    5530:	620080e7          	jalr	1568(ra) # 4b4c <fatfs_set_fs_info_next_free_cluster>
    5534:	0004c783          	lbu	a5,0(s1)
    5538:	00090513          	mv	a0,s2
    553c:	00979a93          	slli	s5,a5,0x9
    5540:	000a8593          	mv	a1,s5
    5544:	ffffd097          	auipc	ra,0xffffd
    5548:	b60080e7          	jalr	-1184(ra) # 20a4 <__udivsi3>
    554c:	00050413          	mv	s0,a0
    5550:	00050593          	mv	a1,a0
    5554:	000a8513          	mv	a0,s5
    5558:	ffffd097          	auipc	ra,0xffffd
    555c:	33c080e7          	jalr	828(ra) # 2894 <__mulsi3>
    5560:	41250533          	sub	a0,a0,s2
    5564:	00a03533          	snez	a0,a0
    5568:	00a40933          	add	s2,s0,a0
    556c:	040a0463          	beqz	s4,55b4 <fatfs_allocate_free_space+0xf4>
    5570:	0084a583          	lw	a1,8(s1)
    5574:	00c10613          	addi	a2,sp,12
    5578:	00048513          	mv	a0,s1
    557c:	fffff097          	auipc	ra,0xfffff
    5580:	680080e7          	jalr	1664(ra) # 4bfc <fatfs_find_blank_cluster>
    5584:	00050413          	mv	s0,a0
    5588:	f4050ee3          	beqz	a0,54e4 <fatfs_allocate_free_space+0x24>
    558c:	00100793          	li	a5,1
    5590:	02f91663          	bne	s2,a5,55bc <fatfs_allocate_free_space+0xfc>
    5594:	00c12903          	lw	s2,12(sp)
    5598:	fff00613          	li	a2,-1
    559c:	00048513          	mv	a0,s1
    55a0:	00090593          	mv	a1,s2
    55a4:	fffff097          	auipc	ra,0xfffff
    55a8:	76c080e7          	jalr	1900(ra) # 4d10 <fatfs_fat_set_cluster>
    55ac:	0129a023          	sw	s2,0(s3)
    55b0:	f39ff06f          	j	54e8 <fatfs_allocate_free_space+0x28>
    55b4:	0009a783          	lw	a5,0(s3)
    55b8:	00f12623          	sw	a5,12(sp)
    55bc:	00090613          	mv	a2,s2
    55c0:	00c10593          	addi	a1,sp,12
    55c4:	00048513          	mv	a0,s1
    55c8:	00000097          	auipc	ra,0x0
    55cc:	954080e7          	jalr	-1708(ra) # 4f1c <fatfs_add_free_space>
    55d0:	00050413          	mv	s0,a0
    55d4:	f15ff06f          	j	54e8 <fatfs_allocate_free_space+0x28>

000055d8 <fatfs_add_file_entry>:
    55d8:	03852883          	lw	a7,56(a0)
    55dc:	30088e63          	beqz	a7,58f8 <fatfs_add_file_entry+0x320>
    55e0:	f8010113          	addi	sp,sp,-128
    55e4:	06812c23          	sw	s0,120(sp)
    55e8:	00050413          	mv	s0,a0
    55ec:	00060513          	mv	a0,a2
    55f0:	06912a23          	sw	s1,116(sp)
    55f4:	07512223          	sw	s5,100(sp)
    55f8:	00f12c23          	sw	a5,24(sp)
    55fc:	00e12a23          	sw	a4,20(sp)
    5600:	06112e23          	sw	ra,124(sp)
    5604:	07212823          	sw	s2,112(sp)
    5608:	07312623          	sw	s3,108(sp)
    560c:	07412423          	sw	s4,104(sp)
    5610:	07612023          	sw	s6,96(sp)
    5614:	05712e23          	sw	s7,92(sp)
    5618:	05812c23          	sw	s8,88(sp)
    561c:	05912a23          	sw	s9,84(sp)
    5620:	05a12823          	sw	s10,80(sp)
    5624:	05b12623          	sw	s11,76(sp)
    5628:	01012e23          	sw	a6,28(sp)
    562c:	00068a93          	mv	s5,a3
    5630:	00c12823          	sw	a2,16(sp)
    5634:	00b12423          	sw	a1,8(sp)
    5638:	ffffe097          	auipc	ra,0xffffe
    563c:	a48080e7          	jalr	-1464(ra) # 3080 <fatfs_lfn_entries_required>
    5640:	00150713          	addi	a4,a0,1
    5644:	00100793          	li	a5,1
    5648:	00050493          	mv	s1,a0
    564c:	2ae7f263          	bgeu	a5,a4,58f0 <fatfs_add_file_entry+0x318>
    5650:	00000a13          	li	s4,0
    5654:	00000993          	li	s3,0
    5658:	00000913          	li	s2,0
    565c:	00000c93          	li	s9,0
    5660:	00000b13          	li	s6,0
    5664:	01000c13          	li	s8,16
    5668:	00812583          	lw	a1,8(sp)
    566c:	00000693          	li	a3,0
    5670:	000b0613          	mv	a2,s6
    5674:	00040513          	mv	a0,s0
    5678:	000b0b93          	mv	s7,s6
    567c:	ffffe097          	auipc	ra,0xffffe
    5680:	7f4080e7          	jalr	2036(ra) # 3e70 <fatfs_sector_reader>
    5684:	18050463          	beqz	a0,580c <fatfs_add_file_entry+0x234>
    5688:	001b0b13          	addi	s6,s6,1
    568c:	04440793          	addi	a5,s0,68
    5690:	000c8d13          	mv	s10,s9
    5694:	00000d93          	li	s11,0
    5698:	00078513          	mv	a0,a5
    569c:	00f12623          	sw	a5,12(sp)
    56a0:	ffffe097          	auipc	ra,0xffffe
    56a4:	8f8080e7          	jalr	-1800(ra) # 2f98 <fatfs_entry_lfn_text>
    56a8:	00c12783          	lw	a5,12(sp)
    56ac:	00050c93          	mv	s9,a0
    56b0:	02050c63          	beqz	a0,56e8 <fatfs_add_file_entry+0x110>
    56b4:	020d0463          	beqz	s10,56dc <fatfs_add_file_entry+0x104>
    56b8:	00090c93          	mv	s9,s2
    56bc:	000c8913          	mv	s2,s9
    56c0:	001d0c93          	addi	s9,s10,1
    56c4:	001d8d93          	addi	s11,s11,1
    56c8:	0ffdfd93          	zext.b	s11,s11
    56cc:	02078793          	addi	a5,a5,32
    56d0:	f98d8ce3          	beq	s11,s8,5668 <fatfs_add_file_entry+0x90>
    56d4:	000c8d13          	mv	s10,s9
    56d8:	fc1ff06f          	j	5698 <fatfs_add_file_entry+0xc0>
    56dc:	000d8a13          	mv	s4,s11
    56e0:	000b8993          	mv	s3,s7
    56e4:	fd9ff06f          	j	56bc <fatfs_add_file_entry+0xe4>
    56e8:	0007c683          	lbu	a3,0(a5)
    56ec:	0e500713          	li	a4,229
    56f0:	10e69863          	bne	a3,a4,5800 <fatfs_add_file_entry+0x228>
    56f4:	000d1863          	bnez	s10,5704 <fatfs_add_file_entry+0x12c>
    56f8:	000d8a13          	mv	s4,s11
    56fc:	000b8993          	mv	s3,s7
    5700:	00100913          	li	s2,1
    5704:	fa9d4ee3          	blt	s10,s1,56c0 <fatfs_add_file_entry+0xe8>
    5708:	00ba8693          	addi	a3,s5,11
    570c:	000a8713          	mv	a4,s5
    5710:	00000913          	li	s2,0
    5714:	00074603          	lbu	a2,0(a4)
    5718:	00195793          	srli	a5,s2,0x1
    571c:	00791913          	slli	s2,s2,0x7
    5720:	012787b3          	add	a5,a5,s2
    5724:	00170713          	addi	a4,a4,1
    5728:	00c787b3          	add	a5,a5,a2
    572c:	0ff7f913          	zext.b	s2,a5
    5730:	fed712e3          	bne	a4,a3,5714 <fatfs_add_file_entry+0x13c>
    5734:	00098b13          	mv	s6,s3
    5738:	00000d13          	li	s10,0
    573c:	01000b93          	li	s7,16
    5740:	00812583          	lw	a1,8(sp)
    5744:	00000693          	li	a3,0
    5748:	000b0613          	mv	a2,s6
    574c:	00040513          	mv	a0,s0
    5750:	ffffe097          	auipc	ra,0xffffe
    5754:	720080e7          	jalr	1824(ra) # 3e70 <fatfs_sector_reader>
    5758:	18050c63          	beqz	a0,58f0 <fatfs_add_file_entry+0x318>
    575c:	04440c93          	addi	s9,s0,68
    5760:	413b0db3          	sub	s11,s6,s3
    5764:	00000793          	li	a5,0
    5768:	00000c13          	li	s8,0
    576c:	01912623          	sw	s9,12(sp)
    5770:	000d1663          	bnez	s10,577c <fatfs_add_file_entry+0x1a4>
    5774:	154c1863          	bne	s8,s4,58c4 <fatfs_add_file_entry+0x2ec>
    5778:	140d9663          	bnez	s11,58c4 <fatfs_add_file_entry+0x2ec>
    577c:	12049263          	bnez	s1,58a0 <fatfs_add_file_entry+0x2c8>
    5780:	01c12703          	lw	a4,28(sp)
    5784:	01412603          	lw	a2,20(sp)
    5788:	01812583          	lw	a1,24(sp)
    578c:	02010693          	addi	a3,sp,32
    5790:	000a8513          	mv	a0,s5
    5794:	ffffe097          	auipc	ra,0xffffe
    5798:	a30080e7          	jalr	-1488(ra) # 31c4 <fatfs_sfn_create_entry>
    579c:	02000613          	li	a2,32
    57a0:	00c105b3          	add	a1,sp,a2
    57a4:	000c8513          	mv	a0,s9
    57a8:	ffffd097          	auipc	ra,0xffffd
    57ac:	9c4080e7          	jalr	-1596(ra) # 216c <memcpy>
    57b0:	03842783          	lw	a5,56(s0)
    57b4:	00c12583          	lw	a1,12(sp)
    57b8:	24442503          	lw	a0,580(s0)
    57bc:	00100613          	li	a2,1
    57c0:	000780e7          	jalr	a5
    57c4:	07c12083          	lw	ra,124(sp)
    57c8:	07812403          	lw	s0,120(sp)
    57cc:	07412483          	lw	s1,116(sp)
    57d0:	07012903          	lw	s2,112(sp)
    57d4:	06c12983          	lw	s3,108(sp)
    57d8:	06812a03          	lw	s4,104(sp)
    57dc:	06412a83          	lw	s5,100(sp)
    57e0:	06012b03          	lw	s6,96(sp)
    57e4:	05c12b83          	lw	s7,92(sp)
    57e8:	05812c03          	lw	s8,88(sp)
    57ec:	05412c83          	lw	s9,84(sp)
    57f0:	05012d03          	lw	s10,80(sp)
    57f4:	04c12d83          	lw	s11,76(sp)
    57f8:	08010113          	addi	sp,sp,128
    57fc:	00008067          	ret
    5800:	ee068ae3          	beqz	a3,56f4 <fatfs_add_file_entry+0x11c>
    5804:	00000913          	li	s2,0
    5808:	ebdff06f          	j	56c4 <fatfs_add_file_entry+0xec>
    580c:	00842583          	lw	a1,8(s0)
    5810:	02010613          	addi	a2,sp,32
    5814:	00040513          	mv	a0,s0
    5818:	fffff097          	auipc	ra,0xfffff
    581c:	3e4080e7          	jalr	996(ra) # 4bfc <fatfs_find_blank_cluster>
    5820:	0c050863          	beqz	a0,58f0 <fatfs_add_file_entry+0x318>
    5824:	02012b83          	lw	s7,32(sp)
    5828:	00812583          	lw	a1,8(sp)
    582c:	00040513          	mv	a0,s0
    5830:	000b8613          	mv	a2,s7
    5834:	fffff097          	auipc	ra,0xfffff
    5838:	64c080e7          	jalr	1612(ra) # 4e80 <fatfs_fat_add_cluster_to_chain>
    583c:	0a050a63          	beqz	a0,58f0 <fatfs_add_file_entry+0x318>
    5840:	20000613          	li	a2,512
    5844:	00000593          	li	a1,0
    5848:	04440513          	addi	a0,s0,68
    584c:	ffffd097          	auipc	ra,0xffffd
    5850:	904080e7          	jalr	-1788(ra) # 2150 <memset>
    5854:	00000c13          	li	s8,0
    5858:	00044783          	lbu	a5,0(s0)
    585c:	00fc6a63          	bltu	s8,a5,5870 <fatfs_add_file_entry+0x298>
    5860:	ea0914e3          	bnez	s2,5708 <fatfs_add_file_entry+0x130>
    5864:	000b0993          	mv	s3,s6
    5868:	00000a13          	li	s4,0
    586c:	e9dff06f          	j	5708 <fatfs_add_file_entry+0x130>
    5870:	00000693          	li	a3,0
    5874:	000c0613          	mv	a2,s8
    5878:	000b8593          	mv	a1,s7
    587c:	00040513          	mv	a0,s0
    5880:	ffffd097          	auipc	ra,0xffffd
    5884:	3f4080e7          	jalr	1012(ra) # 2c74 <fatfs_write_sector>
    5888:	06050463          	beqz	a0,58f0 <fatfs_add_file_entry+0x318>
    588c:	001c0c13          	addi	s8,s8,1
    5890:	0ffc7c13          	zext.b	s8,s8
    5894:	fc5ff06f          	j	5858 <fatfs_add_file_entry+0x280>
    5898:	001b0b13          	addi	s6,s6,1
    589c:	ea5ff06f          	j	5740 <fatfs_add_file_entry+0x168>
    58a0:	01012503          	lw	a0,16(sp)
    58a4:	fff48493          	addi	s1,s1,-1
    58a8:	00090693          	mv	a3,s2
    58ac:	00048613          	mv	a2,s1
    58b0:	000c8593          	mv	a1,s9
    58b4:	ffffd097          	auipc	ra,0xffffd
    58b8:	7fc080e7          	jalr	2044(ra) # 30b0 <fatfs_filename_to_lfn>
    58bc:	00100d13          	li	s10,1
    58c0:	000d0793          	mv	a5,s10
    58c4:	001c0c13          	addi	s8,s8,1
    58c8:	0ffc7c13          	zext.b	s8,s8
    58cc:	020c8c93          	addi	s9,s9,32
    58d0:	eb7c10e3          	bne	s8,s7,5770 <fatfs_add_file_entry+0x198>
    58d4:	fc0782e3          	beqz	a5,5898 <fatfs_add_file_entry+0x2c0>
    58d8:	03842783          	lw	a5,56(s0)
    58dc:	00c12583          	lw	a1,12(sp)
    58e0:	24442503          	lw	a0,580(s0)
    58e4:	00100613          	li	a2,1
    58e8:	000780e7          	jalr	a5
    58ec:	fa0516e3          	bnez	a0,5898 <fatfs_add_file_entry+0x2c0>
    58f0:	00000513          	li	a0,0
    58f4:	ed1ff06f          	j	57c4 <fatfs_add_file_entry+0x1ec>
    58f8:	00000513          	li	a0,0
    58fc:	00008067          	ret

00005900 <fl_fopen>:
    5900:	000067b7          	lui	a5,0x6
    5904:	2e47a783          	lw	a5,740(a5) # 62e4 <_filelib_init>
    5908:	fa010113          	addi	sp,sp,-96
    590c:	05212823          	sw	s2,80(sp)
    5910:	03a12823          	sw	s10,48(sp)
    5914:	04112e23          	sw	ra,92(sp)
    5918:	04812c23          	sw	s0,88(sp)
    591c:	04912a23          	sw	s1,84(sp)
    5920:	05312623          	sw	s3,76(sp)
    5924:	05412423          	sw	s4,72(sp)
    5928:	05512223          	sw	s5,68(sp)
    592c:	05612023          	sw	s6,64(sp)
    5930:	03712e23          	sw	s7,60(sp)
    5934:	03812c23          	sw	s8,56(sp)
    5938:	03912a23          	sw	s9,52(sp)
    593c:	00050d13          	mv	s10,a0
    5940:	00058913          	mv	s2,a1
    5944:	00079663          	bnez	a5,5950 <fl_fopen+0x50>
    5948:	ffffd097          	auipc	ra,0xffffd
    594c:	3e0080e7          	jalr	992(ra) # 2d28 <fl_init>
    5950:	000067b7          	lui	a5,0x6
    5954:	2e07a783          	lw	a5,736(a5) # 62e0 <_filelib_valid>
    5958:	00193713          	seqz	a4,s2
    595c:	0017b793          	seqz	a5,a5
    5960:	00e7e7b3          	or	a5,a5,a4
    5964:	36079e63          	bnez	a5,5ce0 <fl_fopen+0x3e0>
    5968:	360d0c63          	beqz	s10,5ce0 <fl_fopen+0x3e0>
    596c:	00000493          	li	s1,0
    5970:	00000413          	li	s0,0
    5974:	05700993          	li	s3,87
    5978:	07200a13          	li	s4,114
    597c:	07700b13          	li	s6,119
    5980:	06100b93          	li	s7,97
    5984:	06200c13          	li	s8,98
    5988:	04100a93          	li	s5,65
    598c:	04200c93          	li	s9,66
    5990:	00090513          	mv	a0,s2
    5994:	ffffc097          	auipc	ra,0xffffc
    5998:	7fc080e7          	jalr	2044(ra) # 2190 <strlen>
    599c:	10a44a63          	blt	s0,a0,5ab0 <fl_fopen+0x1b0>
    59a0:	000089b7          	lui	s3,0x8
    59a4:	f0498a13          	addi	s4,s3,-252 # 7f04 <_fs>
    59a8:	038a2783          	lw	a5,56(s4)
    59ac:	00079463          	bnez	a5,59b4 <fl_fopen+0xb4>
    59b0:	fd94f493          	andi	s1,s1,-39
    59b4:	03ca2783          	lw	a5,60(s4)
    59b8:	00078463          	beqz	a5,59c0 <fl_fopen+0xc0>
    59bc:	000780e7          	jalr	a5
    59c0:	0014f793          	andi	a5,s1,1
    59c4:	18079263          	bnez	a5,5b48 <fl_fopen+0x248>
    59c8:	0204f793          	andi	a5,s1,32
    59cc:	08078c63          	beqz	a5,5a64 <fl_fopen+0x164>
    59d0:	038a2783          	lw	a5,56(s4)
    59d4:	06078a63          	beqz	a5,5a48 <fl_fopen+0x148>
    59d8:	ffffd097          	auipc	ra,0xffffd
    59dc:	160080e7          	jalr	352(ra) # 2b38 <_allocate_file>
    59e0:	00050413          	mv	s0,a0
    59e4:	06050263          	beqz	a0,5a48 <fl_fopen+0x148>
    59e8:	01450a93          	addi	s5,a0,20
    59ec:	10400613          	li	a2,260
    59f0:	00000593          	li	a1,0
    59f4:	000a8513          	mv	a0,s5
    59f8:	ffffc097          	auipc	ra,0xffffc
    59fc:	758080e7          	jalr	1880(ra) # 2150 <memset>
    5a00:	11840b13          	addi	s6,s0,280
    5a04:	10400613          	li	a2,260
    5a08:	00000593          	li	a1,0
    5a0c:	000b0513          	mv	a0,s6
    5a10:	ffffc097          	auipc	ra,0xffffc
    5a14:	740080e7          	jalr	1856(ra) # 2150 <memset>
    5a18:	10400713          	li	a4,260
    5a1c:	000b0693          	mv	a3,s6
    5a20:	00070613          	mv	a2,a4
    5a24:	000a8593          	mv	a1,s5
    5a28:	000d0513          	mv	a0,s10
    5a2c:	ffffe097          	auipc	ra,0xffffe
    5a30:	c88080e7          	jalr	-888(ra) # 36b4 <fatfs_split_path>
    5a34:	fff00793          	li	a5,-1
    5a38:	12f51663          	bne	a0,a5,5b64 <fl_fopen+0x264>
    5a3c:	00040513          	mv	a0,s0
    5a40:	ffffd097          	auipc	ra,0xffffd
    5a44:	170080e7          	jalr	368(ra) # 2bb0 <_free_file>
    5a48:	00000413          	li	s0,0
    5a4c:	0214f793          	andi	a5,s1,33
    5a50:	02000713          	li	a4,32
    5a54:	28e79263          	bne	a5,a4,5cd8 <fl_fopen+0x3d8>
    5a58:	10041263          	bnez	s0,5b5c <fl_fopen+0x25c>
    5a5c:	0064f793          	andi	a5,s1,6
    5a60:	26079463          	bnez	a5,5cc8 <fl_fopen+0x3c8>
    5a64:	00000413          	li	s0,0
    5a68:	040a2783          	lw	a5,64(s4)
    5a6c:	00078463          	beqz	a5,5a74 <fl_fopen+0x174>
    5a70:	000780e7          	jalr	a5
    5a74:	05c12083          	lw	ra,92(sp)
    5a78:	00040513          	mv	a0,s0
    5a7c:	05812403          	lw	s0,88(sp)
    5a80:	05412483          	lw	s1,84(sp)
    5a84:	05012903          	lw	s2,80(sp)
    5a88:	04c12983          	lw	s3,76(sp)
    5a8c:	04812a03          	lw	s4,72(sp)
    5a90:	04412a83          	lw	s5,68(sp)
    5a94:	04012b03          	lw	s6,64(sp)
    5a98:	03c12b83          	lw	s7,60(sp)
    5a9c:	03812c03          	lw	s8,56(sp)
    5aa0:	03412c83          	lw	s9,52(sp)
    5aa4:	03012d03          	lw	s10,48(sp)
    5aa8:	06010113          	addi	sp,sp,96
    5aac:	00008067          	ret
    5ab0:	008907b3          	add	a5,s2,s0
    5ab4:	0007c783          	lbu	a5,0(a5)
    5ab8:	05378863          	beq	a5,s3,5b08 <fl_fopen+0x208>
    5abc:	02f9e863          	bltu	s3,a5,5aec <fl_fopen+0x1ec>
    5ac0:	05578863          	beq	a5,s5,5b10 <fl_fopen+0x210>
    5ac4:	00faea63          	bltu	s5,a5,5ad8 <fl_fopen+0x1d8>
    5ac8:	02b00713          	li	a4,43
    5acc:	04e78663          	beq	a5,a4,5b18 <fl_fopen+0x218>
    5ad0:	00140413          	addi	s0,s0,1
    5ad4:	ebdff06f          	j	5990 <fl_fopen+0x90>
    5ad8:	03978263          	beq	a5,s9,5afc <fl_fopen+0x1fc>
    5adc:	05200713          	li	a4,82
    5ae0:	fee798e3          	bne	a5,a4,5ad0 <fl_fopen+0x1d0>
    5ae4:	0014e493          	ori	s1,s1,1
    5ae8:	fe9ff06f          	j	5ad0 <fl_fopen+0x1d0>
    5aec:	ff478ce3          	beq	a5,s4,5ae4 <fl_fopen+0x1e4>
    5af0:	00fa6a63          	bltu	s4,a5,5b04 <fl_fopen+0x204>
    5af4:	01778e63          	beq	a5,s7,5b10 <fl_fopen+0x210>
    5af8:	fd879ce3          	bne	a5,s8,5ad0 <fl_fopen+0x1d0>
    5afc:	0084e493          	ori	s1,s1,8
    5b00:	fd1ff06f          	j	5ad0 <fl_fopen+0x1d0>
    5b04:	fd6796e3          	bne	a5,s6,5ad0 <fl_fopen+0x1d0>
    5b08:	0324e493          	ori	s1,s1,50
    5b0c:	fc5ff06f          	j	5ad0 <fl_fopen+0x1d0>
    5b10:	0264e493          	ori	s1,s1,38
    5b14:	fbdff06f          	j	5ad0 <fl_fopen+0x1d0>
    5b18:	0014f793          	andi	a5,s1,1
    5b1c:	00078663          	beqz	a5,5b28 <fl_fopen+0x228>
    5b20:	0024e493          	ori	s1,s1,2
    5b24:	fadff06f          	j	5ad0 <fl_fopen+0x1d0>
    5b28:	0024f793          	andi	a5,s1,2
    5b2c:	00078663          	beqz	a5,5b38 <fl_fopen+0x238>
    5b30:	0314e493          	ori	s1,s1,49
    5b34:	f9dff06f          	j	5ad0 <fl_fopen+0x1d0>
    5b38:	0044f793          	andi	a5,s1,4
    5b3c:	f8078ae3          	beqz	a5,5ad0 <fl_fopen+0x1d0>
    5b40:	0274e493          	ori	s1,s1,39
    5b44:	f8dff06f          	j	5ad0 <fl_fopen+0x1d0>
    5b48:	000d0513          	mv	a0,s10
    5b4c:	fffff097          	auipc	ra,0xfffff
    5b50:	81c080e7          	jalr	-2020(ra) # 4368 <_open_file>
    5b54:	00050413          	mv	s0,a0
    5b58:	e60508e3          	beqz	a0,59c8 <fl_fopen+0xc8>
    5b5c:	42940c23          	sb	s1,1080(s0)
    5b60:	f09ff06f          	j	5a68 <fl_fopen+0x168>
    5b64:	00040513          	mv	a0,s0
    5b68:	ffffe097          	auipc	ra,0xffffe
    5b6c:	dc8080e7          	jalr	-568(ra) # 3930 <_check_file_open>
    5b70:	00050913          	mv	s2,a0
    5b74:	ec0514e3          	bnez	a0,5a3c <fl_fopen+0x13c>
    5b78:	01444783          	lbu	a5,20(s0)
    5b7c:	0e079663          	bnez	a5,5c68 <fl_fopen+0x368>
    5b80:	008a2783          	lw	a5,8(s4)
    5b84:	00f42023          	sw	a5,0(s0)
    5b88:	00042583          	lw	a1,0(s0)
    5b8c:	01010693          	addi	a3,sp,16
    5b90:	000b0613          	mv	a2,s6
    5b94:	f0498513          	addi	a0,s3,-252
    5b98:	ffffe097          	auipc	ra,0xffffe
    5b9c:	428080e7          	jalr	1064(ra) # 3fc0 <fatfs_get_file_entry>
    5ba0:	00100693          	li	a3,1
    5ba4:	e8d50ce3          	beq	a0,a3,5a3c <fl_fopen+0x13c>
    5ba8:	00042223          	sw	zero,4(s0)
    5bac:	00440613          	addi	a2,s0,4
    5bb0:	00068593          	mv	a1,a3
    5bb4:	f0498513          	addi	a0,s3,-252
    5bb8:	00000097          	auipc	ra,0x0
    5bbc:	908080e7          	jalr	-1784(ra) # 54c0 <fatfs_allocate_free_space>
    5bc0:	e6050ee3          	beqz	a0,5a3c <fl_fopen+0x13c>
    5bc4:	00002ab7          	lui	s5,0x2
    5bc8:	21c40b93          	addi	s7,s0,540
    5bcc:	f0498c13          	addi	s8,s3,-252
    5bd0:	70fa8a93          	addi	s5,s5,1807 # 270f <print_hex_digits+0x33>
    5bd4:	000b0593          	mv	a1,s6
    5bd8:	00410513          	addi	a0,sp,4
    5bdc:	ffffd097          	auipc	ra,0xffffd
    5be0:	68c080e7          	jalr	1676(ra) # 3268 <fatfs_lfn_create_sfn>
    5be4:	08090e63          	beqz	s2,5c80 <fl_fopen+0x380>
    5be8:	00090613          	mv	a2,s2
    5bec:	00410593          	addi	a1,sp,4
    5bf0:	000b8513          	mv	a0,s7
    5bf4:	ffffd097          	auipc	ra,0xffffd
    5bf8:	7f0080e7          	jalr	2032(ra) # 33e4 <fatfs_lfn_generate_tail>
    5bfc:	00042583          	lw	a1,0(s0)
    5c00:	000b8613          	mv	a2,s7
    5c04:	000c0513          	mv	a0,s8
    5c08:	fffff097          	auipc	ra,0xfffff
    5c0c:	8d4080e7          	jalr	-1836(ra) # 44dc <fatfs_sfn_exists>
    5c10:	00050663          	beqz	a0,5c1c <fl_fopen+0x31c>
    5c14:	00190913          	addi	s2,s2,1
    5c18:	fb591ee3          	bne	s2,s5,5bd4 <fl_fopen+0x2d4>
    5c1c:	00442703          	lw	a4,4(s0)
    5c20:	000027b7          	lui	a5,0x2
    5c24:	70f78793          	addi	a5,a5,1807 # 270f <print_hex_digits+0x33>
    5c28:	00070593          	mv	a1,a4
    5c2c:	02f90663          	beq	s2,a5,5c58 <fl_fopen+0x358>
    5c30:	00042583          	lw	a1,0(s0)
    5c34:	00000813          	li	a6,0
    5c38:	00000793          	li	a5,0
    5c3c:	000b8693          	mv	a3,s7
    5c40:	000b0613          	mv	a2,s6
    5c44:	f0498513          	addi	a0,s3,-252
    5c48:	00000097          	auipc	ra,0x0
    5c4c:	990080e7          	jalr	-1648(ra) # 55d8 <fatfs_add_file_entry>
    5c50:	04051463          	bnez	a0,5c98 <fl_fopen+0x398>
    5c54:	00442583          	lw	a1,4(s0)
    5c58:	f0498513          	addi	a0,s3,-252
    5c5c:	fffff097          	auipc	ra,0xfffff
    5c60:	1b4080e7          	jalr	436(ra) # 4e10 <fatfs_free_cluster_chain>
    5c64:	dd9ff06f          	j	5a3c <fl_fopen+0x13c>
    5c68:	00040593          	mv	a1,s0
    5c6c:	000a8513          	mv	a0,s5
    5c70:	ffffe097          	auipc	ra,0xffffe
    5c74:	54c080e7          	jalr	1356(ra) # 41bc <_open_directory>
    5c78:	f00518e3          	bnez	a0,5b88 <fl_fopen+0x288>
    5c7c:	dc1ff06f          	j	5a3c <fl_fopen+0x13c>
    5c80:	00b00613          	li	a2,11
    5c84:	00410593          	addi	a1,sp,4
    5c88:	000b8513          	mv	a0,s7
    5c8c:	ffffc097          	auipc	ra,0xffffc
    5c90:	4e0080e7          	jalr	1248(ra) # 216c <memcpy>
    5c94:	f69ff06f          	j	5bfc <fl_fopen+0x2fc>
    5c98:	fff00793          	li	a5,-1
    5c9c:	00042623          	sw	zero,12(s0)
    5ca0:	00042423          	sw	zero,8(s0)
    5ca4:	42f42823          	sw	a5,1072(s0)
    5ca8:	42042a23          	sw	zero,1076(s0)
    5cac:	00042823          	sw	zero,16(s0)
    5cb0:	22f42423          	sw	a5,552(s0)
    5cb4:	22f42623          	sw	a5,556(s0)
    5cb8:	f0498513          	addi	a0,s3,-252
    5cbc:	ffffe097          	auipc	ra,0xffffe
    5cc0:	054080e7          	jalr	84(ra) # 3d10 <fatfs_fat_purge>
    5cc4:	d89ff06f          	j	5a4c <fl_fopen+0x14c>
    5cc8:	000d0513          	mv	a0,s10
    5ccc:	ffffe097          	auipc	ra,0xffffe
    5cd0:	69c080e7          	jalr	1692(ra) # 4368 <_open_file>
    5cd4:	00050413          	mv	s0,a0
    5cd8:	e80412e3          	bnez	s0,5b5c <fl_fopen+0x25c>
    5cdc:	d89ff06f          	j	5a64 <fl_fopen+0x164>
    5ce0:	00000413          	li	s0,0
    5ce4:	d91ff06f          	j	5a74 <fl_fopen+0x174>

00005ce8 <led_pos>:
    5ce8:	00000001                                ....

00005cec <cmd16>:
    5cec:	02000050 00001500                       P.......

00005cf4 <acmd41>:
    5cf4:	00004069 00000100                       i@......

00005cfc <cmd55>:
    5cfc:	00000077 00000100                       w.......

00005d04 <cmd8>:
    5d04:	01000048 000087aa                       H.......

00005d0c <cmd0>:
    5d0c:	00000040 00009500                       @.......

00005d14 <AUDIO>:
    5d14:	00018000                                ....

00005d18 <DISPLAY>:
    5d18:	00014000                                .@..

00005d1c <BUTTONS>:
    5d1c:	00010100                                ....

00005d20 <SDCARD>:
    5d20:	00010080                                ....

00005d24 <OLED_RST>:
    5d24:	00010010                                ....

00005d28 <OLED>:
    5d28:	00010008                                ....

00005d2c <LEDS>:
    5d2c:	00010004 00006272 00000000 696c632f     ....rb....../cli
    5d3c:	722e6b63 00007761 50207c7c 45535541     ck.raw..|| PAUSE
    5d4c:	20202044 00202020 0000203e 676d692f     D      .> ../img
    5d5c:	00002f73 43206f4e 7265766f 00000000     s/..No Cover....
    5d6c:	3a727245 0a732520 00000000 00002e2e     Err: %s.........
    5d7c:	0000002e 0000002f 4c494620 203a5345     ..../... FILES: 
    5d8c:	00000000 74706d45 000a2179 5d64255b     ....Empty!..[%d]
    5d9c:	00000020 203e6425 00000000 20202020      ...%d> ....    
    5dac:	20202020 20202020 20202020 20202020                     
    5dbc:	00000a20 626c612f 2f736d75 00000000      .../albums/....
    5dcc:	53554d20 203a4349 00000000 25202020      MUSIC: ....   %
    5ddc:	00000a73 6f432020 676e696d 6f6f5320     s...  Coming Soo
    5dec:	000a216e 656c6946 70784520 65726f6c     n!..File Explore
    5dfc:	00000072 79616c50 6e6f5320 00007367     r...Play Songs..
    5e0c:	4d204a44 0065646f 203d3d3d 4e49414d     DJ Mode.=== MAIN
    5e1c:	4e454d20 3d3d2055 000a0a3d 2e642520      MENU ===... %d.
    5e2c:	20732520 20202020 000a2020 0000000a      %s       ......
    5e3c:	656c6553 26207463 65725020 42207373     Select & Press B
    5e4c:	00006e74 74696e49 20445320 64726163     tn..Init SD card
    5e5c:	0a2e2e2e 00000000 33323130 37363534     ........01234567
    5e6c:	42413938 46454443 00000000 5f544146     89ABCDEF....FAT_
    5e7c:	203a5346 6f727245 6f632072 20646c75     FS: Error could 
    5e8c:	20746f6e 64616f6c 54414620 74656420     not load FAT det
    5e9c:	736c6961 64252820 0a0d2129 00000000     ails (%d)!......

00005eac <font>:
    5eac:	00000000 00002f00 00030000 14000003     ...../..........
    5ebc:	143e143e 3a2b6a2e 08122600 171c3224     >.>..j+:.&..$2..
    5ecc:	03003415 00000000 0000211e 001e2100     .4.......!...!..
    5edc:	08220000 0822081c 0000081c 00002040     .."...".....@ ..
    5eec:	00080800 00200000 20000000 02040810     ...... .... ....
    5efc:	3f21213f 003f0100 253d0000 25002725     ?!!?..?...=%%'.%
    5f0c:	003f2525 3f040407 25252700 253f003d     %%?....?.'%%=.?%
    5f1c:	01003d25 00030539 3f25253f 25252700     %=..9...?%%?.'%%
    5f2c:	0028003f 40000000 00000028 00110a04     ?.(....@(.......
    5f3c:	00141400 0a110000 01000004 0007052d     ............-...
    5f4c:	253d213f 09093f1f 253f003f 3f003c27     ?!=%.?..?.?%'<.?
    5f5c:	00212121 1e21213f 25253f00 053f0025     !!!.?!!..?%%%.?.
    5f6c:	3f000505 003d2521 3f04043f 213f2100     ...?!%=.?..?.!?!
    5f7c:	20380000 3f013f21 003b0404 2020203f     ..8 !?.?..;.?   
    5f8c:	3f013f00 023f3f01 3f003f04 003f2121     .?.?.??..?.?!!?.
    5f9c:	0f09093f 31213f00 093f003f 27002f39     ?....?!1?.?.9/.'
    5fac:	003d2525 013f0101 20203f01 100f003f     %%=...?..?  ?...
    5fbc:	3f001f30 3f203f20 3b04043b 38080f00     0..? ? ?;..;...8
    5fcc:	2931000f 3f002325 00000021 04081020     ..1)%#.?!... ...
    5fdc:	003f2102 01020000 20000201 00000020     .!?........  ...
    5fec:	00000201 24243800 243f003c 3c003c24     .....8$$<.?$$<.<
    5ffc:	00242424 3f24243c 2c2c3c00 3f04002c     $$$.<$$?.<,,,..?
    600c:	bc000005 00fca4a4 3c04043f 00003d00     ........?..<.=..
    601c:	fd800000 3f000000 00340808 0000003f     .......?..4.?...
    602c:	3c043c00 043c3c04 3c003c04 003c2424     .<.<.<<..<.<$$<.
    603c:	3c2424fc 24243c00 083c00fc 2c000004     .$$<.<$$..<....,
    604c:	003c2c2c 00243f04 20203c00 100c003c     ,,<..?$..<  <...
    605c:	3c001c30 3c203c20 34080834 a0a0bc00     0..< < <4..4....
    606c:	342400fc 0400242c 0000213f 0000003f     ..$4,$..?!..?...
    607c:	043f2100 02010000 00000102 00000000     .!?.............
    608c:	00000001 00000003 00000005 00000007     ................
    609c:	00000009 0000000e 00000010 00000012     ................
    60ac:	00000014 00000016 00000018 0000001c     ................
    60bc:	0000001e                                ....

000060c0 <current_path>:
    60c0:	0000002f 00000000 00000000 00000000     /...............
	...

000062b4 <led_dir>:
    62b4:	00000000                                ....

000062b8 <n_items>:
    62b8:	00000000                                ....

000062bc <sdcard_while_loading_callback>:
    62bc:	00000000                                ....

000062c0 <back_color>:
	...

000062c1 <front_color>:
    62c1:	                                         ...

000062c4 <cursor_y>:
    62c4:	00000000                                ....

000062c8 <cursor_x>:
    62c8:	00000000                                ....

000062cc <f_putchar>:
    62cc:	00000000                                ....

000062d0 <_free_file_list>:
	...

000062d8 <_open_file_list>:
	...

000062e0 <_filelib_valid>:
    62e0:	00000000                                ....

000062e4 <_filelib_init>:
    62e4:	00000000                                ....
