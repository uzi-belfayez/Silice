
code.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00010137          	lui	sp,0x10
       4:	00002097          	auipc	ra,0x2
       8:	678080e7          	jalr	1656(ra) # 267c <main>
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
      e0:	fe010113          	addi	sp,sp,-32 # ffe0 <_files+0x6f4c>
      e4:	000077b7          	lui	a5,0x7
      e8:	00812c23          	sw	s0,24(sp)
      ec:	92c7a403          	lw	s0,-1748(a5) # 692c <AUDIO>
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
     128:	cbc080e7          	jalr	-836(ra) # 2de0 <memset>
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
     15c:	000075b7          	lui	a1,0x7
     160:	00007537          	lui	a0,0x7
     164:	fe010113          	addi	sp,sp,-32
     168:	94858593          	addi	a1,a1,-1720 # 6948 <LEDS+0x4>
     16c:	94c50513          	addi	a0,a0,-1716 # 694c <LEDS+0x8>
     170:	00112e23          	sw	ra,28(sp)
     174:	00812c23          	sw	s0,24(sp)
     178:	00912a23          	sw	s1,20(sp)
     17c:	01212823          	sw	s2,16(sp)
     180:	01312623          	sw	s3,12(sp)
     184:	01412423          	sw	s4,8(sp)
     188:	01512223          	sw	s5,4(sp)
     18c:	00006097          	auipc	ra,0x6
     190:	388080e7          	jalr	904(ra) # 6514 <fl_fopen>
     194:	0a050263          	beqz	a0,238 <play_click_noise+0xdc>
     198:	000015b7          	lui	a1,0x1
     19c:	00000613          	li	a2,0
     1a0:	19458593          	addi	a1,a1,404 # 1194 <play_music_with_controls+0x49c>
     1a4:	00050a13          	mv	s4,a0
     1a8:	00003097          	auipc	ra,0x3
     1ac:	7fc080e7          	jalr	2044(ra) # 39a4 <fl_fseek>
     1b0:	000077b7          	lui	a5,0x7
     1b4:	92c7aa83          	lw	s5,-1748(a5) # 692c <AUDIO>
     1b8:	20000993          	li	s3,512
     1bc:	1ff00913          	li	s2,511
     1c0:	000aa483          	lw	s1,0(s5)
     1c4:	000a0693          	mv	a3,s4
     1c8:	20000613          	li	a2,512
     1cc:	00100593          	li	a1,1
     1d0:	00048513          	mv	a0,s1
     1d4:	00006097          	auipc	ra,0x6
     1d8:	d3c080e7          	jalr	-708(ra) # 5f10 <fl_fread>
     1dc:	00050413          	mv	s0,a0
     1e0:	00a94c63          	blt	s2,a0,1f8 <play_click_noise+0x9c>
     1e4:	40a98633          	sub	a2,s3,a0
     1e8:	00000593          	li	a1,0
     1ec:	00a48533          	add	a0,s1,a0
     1f0:	00003097          	auipc	ra,0x3
     1f4:	bf0080e7          	jalr	-1040(ra) # 2de0 <memset>
     1f8:	000aa783          	lw	a5,0(s5)
     1fc:	fef48ee3          	beq	s1,a5,1f8 <play_click_noise+0x9c>
     200:	fc8940e3          	blt	s2,s0,1c0 <play_click_noise+0x64>
     204:	000a0513          	mv	a0,s4
     208:	00006097          	auipc	ra,0x6
     20c:	c2c080e7          	jalr	-980(ra) # 5e34 <fl_fclose>
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
     278:	00007637          	lui	a2,0x7
     27c:	90062703          	lw	a4,-1792(a2) # 6900 <led_pos>
     280:	000077b7          	lui	a5,0x7
     284:	fff70693          	addi	a3,a4,-1
     288:	00068663          	beqz	a3,294 <update_led_dance+0x38>
     28c:	f8070693          	addi	a3,a4,-128
     290:	00069a63          	bnez	a3,2a4 <update_led_dance+0x48>
     294:	fdc7a583          	lw	a1,-36(a5) # 6fdc <led_dir>
     298:	00100693          	li	a3,1
     29c:	40b686b3          	sub	a3,a3,a1
     2a0:	fcd7ae23          	sw	a3,-36(a5)
     2a4:	fdc7a683          	lw	a3,-36(a5)
     2a8:	40175793          	srai	a5,a4,0x1
     2ac:	00068463          	beqz	a3,2b4 <update_led_dance+0x58>
     2b0:	00171793          	slli	a5,a4,0x1
     2b4:	08000713          	li	a4,128
     2b8:	02f75e63          	bge	a4,a5,2f4 <update_led_dance+0x98>
     2bc:	00070793          	mv	a5,a4
     2c0:	00007737          	lui	a4,0x7
     2c4:	94472703          	lw	a4,-1724(a4) # 6944 <LEDS>
     2c8:	90f62023          	sw	a5,-1792(a2)
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
     328:	d60080e7          	jalr	-672(ra) # 3084 <display_framebuffer>
     32c:	000037b7          	lui	a5,0x3
     330:	00050413          	mv	s0,a0
     334:	48078793          	addi	a5,a5,1152 # 3480 <printf+0x114>
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
     3dc:	a9378793          	addi	a5,a5,-1389 # 2a93 <sdcard_start_sector+0x8b>
     3e0:	06c00693          	li	a3,108
     3e4:	00a7ca63          	blt	a5,a0,3f8 <update_player_ui+0xf8>
     3e8:	06400593          	li	a1,100
     3ec:	00003097          	auipc	ra,0x3
     3f0:	940080e7          	jalr	-1728(ra) # 2d2c <__divsi3>
     3f4:	00050693          	mv	a3,a0
     3f8:	000037b7          	lui	a5,0x3
     3fc:	00004637          	lui	a2,0x4
     400:	78078793          	addi	a5,a5,1920 # 3780 <_allocate_file+0x34>
     404:	07600593          	li	a1,118
     408:	07500513          	li	a0,117
     40c:	00a00813          	li	a6,10
     410:	fff00893          	li	a7,-1
     414:	90060613          	addi	a2,a2,-1792 # 3900 <fatfs_write_sector+0x78>
     418:	40d58733          	sub	a4,a1,a3
     41c:	00f40333          	add	t1,s0,a5
     420:	06e55c63          	bge	a0,a4,498 <update_player_ui+0x198>
     424:	08078793          	addi	a5,a5,128
     428:	fec798e3          	bne	a5,a2,418 <update_player_ui+0x118>
     42c:	07600593          	li	a1,118
     430:	00a00513          	li	a0,10
     434:	00003097          	auipc	ra,0x3
     438:	c5c080e7          	jalr	-932(ra) # 3090 <display_set_cursor>
     43c:	00000593          	li	a1,0
     440:	0ff00513          	li	a0,255
     444:	00003097          	auipc	ra,0x3
     448:	c60080e7          	jalr	-928(ra) # 30a4 <display_set_front_back_color>
     44c:	0004c783          	lbu	a5,0(s1)
     450:	08079e63          	bnez	a5,4ec <update_player_ui+0x1ec>
     454:	000074b7          	lui	s1,0x7
     458:	ff44a783          	lw	a5,-12(s1) # 6ff4 <f_putchar>
     45c:	03e00513          	li	a0,62
     460:	00200413          	li	s0,2
     464:	000780e7          	jalr	a5
     468:	ff44a783          	lw	a5,-12(s1)
     46c:	02000513          	li	a0,32
     470:	00e00913          	li	s2,14
     474:	000780e7          	jalr	a5
     478:	008987b3          	add	a5,s3,s0
     47c:	ffe7c503          	lbu	a0,-2(a5)
     480:	04050263          	beqz	a0,4c4 <update_player_ui+0x1c4>
     484:	ff44a783          	lw	a5,-12(s1)
     488:	00140413          	addi	s0,s0,1
     48c:	000780e7          	jalr	a5
     490:	ff2414e3          	bne	s0,s2,478 <update_player_ui+0x178>
     494:	0300006f          	j	4c4 <update_player_ui+0x1c4>
     498:	01070663          	beq	a4,a6,4a4 <update_player_ui+0x1a4>
     49c:	00e30e33          	add	t3,t1,a4
     4a0:	011e0023          	sb	a7,0(t3)
     4a4:	00170713          	addi	a4,a4,1
     4a8:	f79ff06f          	j	420 <update_player_ui+0x120>
     4ac:	ff492783          	lw	a5,-12(s2)
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
     4f8:	ff492783          	lw	a5,-12(s2) # 6ff4 <f_putchar>
     4fc:	02000513          	li	a0,32
     500:	00140413          	addi	s0,s0,1
     504:	000780e7          	jalr	a5
     508:	fc5ff06f          	j	4cc <update_player_ui+0x1cc>

0000050c <fast_rand>:
     50c:	ff010113          	addi	sp,sp,-16
     510:	00812423          	sw	s0,8(sp)
     514:	00007437          	lui	s0,0x7
     518:	8fc42503          	lw	a0,-1796(s0) # 68fc <lcg_seed>
     51c:	001965b7          	lui	a1,0x196
     520:	60d58593          	addi	a1,a1,1549 # 19660d <__stacktop+0x18660d>
     524:	00112623          	sw	ra,12(sp)
     528:	00003097          	auipc	ra,0x3
     52c:	f80080e7          	jalr	-128(ra) # 34a8 <__mulsi3>
     530:	3c6ef7b7          	lui	a5,0x3c6ef
     534:	35f78793          	addi	a5,a5,863 # 3c6ef35f <__stacktop+0x3c6df35f>
     538:	00f50533          	add	a0,a0,a5
     53c:	8ea42e23          	sw	a0,-1796(s0)
     540:	00c12083          	lw	ra,12(sp)
     544:	00812403          	lw	s0,8(sp)
     548:	01055513          	srli	a0,a0,0x10
     54c:	0ff57513          	zext.b	a0,a0
     550:	01010113          	addi	sp,sp,16
     554:	00008067          	ret

00000558 <synth_90s_mode>:
     558:	db010113          	addi	sp,sp,-592
     55c:	24112623          	sw	ra,588(sp)
     560:	24812423          	sw	s0,584(sp)
     564:	24912223          	sw	s1,580(sp)
     568:	25212023          	sw	s2,576(sp)
     56c:	23312e23          	sw	s3,572(sp)
     570:	23412c23          	sw	s4,568(sp)
     574:	23612823          	sw	s6,560(sp)
     578:	23512a23          	sw	s5,564(sp)
     57c:	23712623          	sw	s7,556(sp)
     580:	23812423          	sw	s8,552(sp)
     584:	23912223          	sw	s9,548(sp)
     588:	23a12023          	sw	s10,544(sp)
     58c:	21b12e23          	sw	s11,540(sp)
     590:	00003097          	auipc	ra,0x3
     594:	af4080e7          	jalr	-1292(ra) # 3084 <display_framebuffer>
     598:	00004637          	lui	a2,0x4
     59c:	00000593          	li	a1,0
     5a0:	00003097          	auipc	ra,0x3
     5a4:	840080e7          	jalr	-1984(ra) # 2de0 <memset>
     5a8:	00a00593          	li	a1,10
     5ac:	00058513          	mv	a0,a1
     5b0:	00003097          	auipc	ra,0x3
     5b4:	ae0080e7          	jalr	-1312(ra) # 3090 <display_set_cursor>
     5b8:	00000593          	li	a1,0
     5bc:	0ff00513          	li	a0,255
     5c0:	00003097          	auipc	ra,0x3
     5c4:	ae4080e7          	jalr	-1308(ra) # 30a4 <display_set_front_back_color>
     5c8:	00007537          	lui	a0,0x7
     5cc:	95850513          	addi	a0,a0,-1704 # 6958 <LEDS+0x14>
     5d0:	00003097          	auipc	ra,0x3
     5d4:	d9c080e7          	jalr	-612(ra) # 336c <printf>
     5d8:	02800593          	li	a1,40
     5dc:	00a00513          	li	a0,10
     5e0:	00003097          	auipc	ra,0x3
     5e4:	ab0080e7          	jalr	-1360(ra) # 3090 <display_set_cursor>
     5e8:	00007537          	lui	a0,0x7
     5ec:	96c50513          	addi	a0,a0,-1684 # 696c <LEDS+0x28>
     5f0:	00003097          	auipc	ra,0x3
     5f4:	d7c080e7          	jalr	-644(ra) # 336c <printf>
     5f8:	03700593          	li	a1,55
     5fc:	00a00513          	li	a0,10
     600:	00003097          	auipc	ra,0x3
     604:	a90080e7          	jalr	-1392(ra) # 3090 <display_set_cursor>
     608:	00007537          	lui	a0,0x7
     60c:	97850513          	addi	a0,a0,-1672 # 6978 <LEDS+0x34>
     610:	00003097          	auipc	ra,0x3
     614:	d5c080e7          	jalr	-676(ra) # 336c <printf>
     618:	04600593          	li	a1,70
     61c:	00a00513          	li	a0,10
     620:	00003097          	auipc	ra,0x3
     624:	a70080e7          	jalr	-1424(ra) # 3090 <display_set_cursor>
     628:	00007537          	lui	a0,0x7
     62c:	98450513          	addi	a0,a0,-1660 # 6984 <LEDS+0x40>
     630:	00003097          	auipc	ra,0x3
     634:	d3c080e7          	jalr	-708(ra) # 336c <printf>
     638:	05500593          	li	a1,85
     63c:	00a00513          	li	a0,10
     640:	00003097          	auipc	ra,0x3
     644:	a50080e7          	jalr	-1456(ra) # 3090 <display_set_cursor>
     648:	00007537          	lui	a0,0x7
     64c:	99050513          	addi	a0,a0,-1648 # 6990 <LEDS+0x4c>
     650:	00003097          	auipc	ra,0x3
     654:	d1c080e7          	jalr	-740(ra) # 336c <printf>
     658:	06400593          	li	a1,100
     65c:	00a00513          	li	a0,10
     660:	00003097          	auipc	ra,0x3
     664:	a30080e7          	jalr	-1488(ra) # 3090 <display_set_cursor>
     668:	00007537          	lui	a0,0x7
     66c:	99c50513          	addi	a0,a0,-1636 # 699c <LEDS+0x58>
     670:	00003097          	auipc	ra,0x3
     674:	cfc080e7          	jalr	-772(ra) # 336c <printf>
     678:	00003097          	auipc	ra,0x3
     67c:	b88080e7          	jalr	-1144(ra) # 3200 <display_refresh>
     680:	00007737          	lui	a4,0x7
     684:	93472703          	lw	a4,-1740(a4) # 6934 <BUTTONS>
     688:	00007b37          	lui	s6,0x7
     68c:	00000793          	li	a5,0
     690:	00e12623          	sw	a4,12(sp)
     694:	00007737          	lui	a4,0x7
     698:	92c72703          	lw	a4,-1748(a4) # 692c <AUDIO>
     69c:	00000a13          	li	s4,0
     6a0:	00000493          	li	s1,0
     6a4:	00000413          	li	s0,0
     6a8:	00000993          	li	s3,0
     6ac:	00000913          	li	s2,0
     6b0:	bb0b0b13          	addi	s6,s6,-1104 # 6bb0 <LEDS+0x26c>
     6b4:	00e12423          	sw	a4,8(sp)
     6b8:	00c12703          	lw	a4,12(sp)
     6bc:	fff7c793          	not	a5,a5
     6c0:	00072a83          	lw	s5,0(a4)
     6c4:	0157f7b3          	and	a5,a5,s5
     6c8:	0027fd13          	andi	s10,a5,2
     6cc:	060d0863          	beqz	s10,73c <synth_90s_mode+0x1e4>
     6d0:	00000097          	auipc	ra,0x0
     6d4:	a8c080e7          	jalr	-1396(ra) # 15c <play_click_noise>
     6d8:	000077b7          	lui	a5,0x7
     6dc:	9447a783          	lw	a5,-1724(a5) # 6944 <LEDS>
     6e0:	0007a023          	sw	zero,0(a5)
     6e4:	00003097          	auipc	ra,0x3
     6e8:	9a0080e7          	jalr	-1632(ra) # 3084 <display_framebuffer>
     6ec:	00004637          	lui	a2,0x4
     6f0:	00000593          	li	a1,0
     6f4:	00002097          	auipc	ra,0x2
     6f8:	6ec080e7          	jalr	1772(ra) # 2de0 <memset>
     6fc:	24812403          	lw	s0,584(sp)
     700:	24c12083          	lw	ra,588(sp)
     704:	24412483          	lw	s1,580(sp)
     708:	24012903          	lw	s2,576(sp)
     70c:	23c12983          	lw	s3,572(sp)
     710:	23812a03          	lw	s4,568(sp)
     714:	23412a83          	lw	s5,564(sp)
     718:	23012b03          	lw	s6,560(sp)
     71c:	22c12b83          	lw	s7,556(sp)
     720:	22812c03          	lw	s8,552(sp)
     724:	22412c83          	lw	s9,548(sp)
     728:	22012d03          	lw	s10,544(sp)
     72c:	21c12d83          	lw	s11,540(sp)
     730:	25010113          	addi	sp,sp,592
     734:	00003317          	auipc	t1,0x3
     738:	acc30067          	jr	-1332(t1) # 3200 <display_refresh>
     73c:	0047f713          	andi	a4,a5,4
     740:	08071863          	bnez	a4,7d0 <synth_90s_mode+0x278>
     744:	00040713          	mv	a4,s0
     748:	0087f693          	andi	a3,a5,8
     74c:	00068663          	beqz	a3,758 <synth_90s_mode+0x200>
     750:	00200493          	li	s1,2
     754:	0c800713          	li	a4,200
     758:	0107f793          	andi	a5,a5,16
     75c:	00078663          	beqz	a5,768 <synth_90s_mode+0x210>
     760:	00300493          	li	s1,3
     764:	0ff00713          	li	a4,255
     768:	020af793          	andi	a5,s5,32
     76c:	00078863          	beqz	a5,77c <synth_90s_mode+0x224>
     770:	00400493          	li	s1,4
     774:	0ff00713          	li	a4,255
     778:	12c00993          	li	s3,300
     77c:	040af413          	andi	s0,s5,64
     780:	1a041663          	bnez	s0,92c <synth_90s_mode+0x3d4>
     784:	00079663          	bnez	a5,790 <synth_90s_mode+0x238>
     788:	ffc48793          	addi	a5,s1,-4
     78c:	1a078863          	beqz	a5,93c <synth_90s_mode+0x3e4>
     790:	00500793          	li	a5,5
     794:	00f48463          	beq	s1,a5,79c <synth_90s_mode+0x244>
     798:	00070413          	mv	s0,a4
     79c:	fff48c93          	addi	s9,s1,-1
     7a0:	0044a793          	slti	a5,s1,4
     7a4:	fffa4c13          	not	s8,s4
     7a8:	002c9b93          	slli	s7,s9,0x2
     7ac:	00fc7c33          	and	s8,s8,a5
     7b0:	08000d93          	li	s11,128
     7b4:	016b8bb3          	add	s7,s7,s6
     7b8:	08000513          	li	a0,128
     7bc:	06040e63          	beqz	s0,838 <synth_90s_mode+0x2e0>
     7c0:	00400793          	li	a5,4
     7c4:	0597ea63          	bltu	a5,s9,818 <synth_90s_mode+0x2c0>
     7c8:	000ba783          	lw	a5,0(s7)
     7cc:	00078067          	jr	a5
     7d0:	00000913          	li	s2,0
     7d4:	00100493          	li	s1,1
     7d8:	0ff00713          	li	a4,255
     7dc:	32000993          	li	s3,800
     7e0:	f69ff06f          	j	748 <synth_90s_mode+0x1f0>
     7e4:	10097793          	andi	a5,s2,256
     7e8:	0ff97513          	zext.b	a0,s2
     7ec:	00078663          	beqz	a5,7f8 <synth_90s_mode+0x2a0>
     7f0:	0ff00793          	li	a5,255
     7f4:	40a78533          	sub	a0,a5,a0
     7f8:	0659a713          	slti	a4,s3,101
     7fc:	01fd7793          	andi	a5,s10,31
     800:	0017b793          	seqz	a5,a5
     804:	00173713          	seqz	a4,a4
     808:	00e7f7b3          	and	a5,a5,a4
     80c:	40f007b3          	neg	a5,a5
     810:	ffc7f793          	andi	a5,a5,-4
     814:	00f989b3          	add	s3,s3,a5
     818:	00040593          	mv	a1,s0
     81c:	f8050513          	addi	a0,a0,-128
     820:	00003097          	auipc	ra,0x3
     824:	c88080e7          	jalr	-888(ra) # 34a8 <__mulsi3>
     828:	40855513          	srai	a0,a0,0x8
     82c:	01390933          	add	s2,s2,s3
     830:	08050513          	addi	a0,a0,128
     834:	41840433          	sub	s0,s0,s8
     838:	01010793          	addi	a5,sp,16
     83c:	01a78733          	add	a4,a5,s10
     840:	00a70023          	sb	a0,0(a4)
     844:	001d0d13          	addi	s10,s10,1
     848:	20000713          	li	a4,512
     84c:	f6ed16e3          	bne	s10,a4,7b8 <synth_90s_mode+0x260>
     850:	00812703          	lw	a4,8(sp)
     854:	000d0593          	mv	a1,s10
     858:	00078513          	mv	a0,a5
     85c:	00072b83          	lw	s7,0(a4)
     860:	00000097          	auipc	ra,0x0
     864:	9fc080e7          	jalr	-1540(ra) # 25c <update_led_dance>
     868:	000d0613          	mv	a2,s10
     86c:	01010593          	addi	a1,sp,16
     870:	000b8513          	mv	a0,s7
     874:	001a0a13          	addi	s4,s4,1
     878:	00000097          	auipc	ra,0x0
     87c:	844080e7          	jalr	-1980(ra) # bc <memcpy_custom>
     880:	00812783          	lw	a5,8(sp)
     884:	0007a783          	lw	a5,0(a5)
     888:	fefb8ce3          	beq	s7,a5,880 <synth_90s_mode+0x328>
     88c:	0c800793          	li	a5,200
     890:	0a87da63          	bge	a5,s0,944 <synth_90s_mode+0x3ec>
     894:	00a00593          	li	a1,10
     898:	000a0513          	mv	a0,s4
     89c:	00002097          	auipc	ra,0x2
     8a0:	514080e7          	jalr	1300(ra) # 2db0 <__modsi3>
     8a4:	02051663          	bnez	a0,8d0 <synth_90s_mode+0x378>
     8a8:	05000513          	li	a0,80
     8ac:	01400593          	li	a1,20
     8b0:	00002097          	auipc	ra,0x2
     8b4:	7e0080e7          	jalr	2016(ra) # 3090 <display_set_cursor>
     8b8:	00007537          	lui	a0,0x7
     8bc:	9a850513          	addi	a0,a0,-1624 # 69a8 <LEDS+0x64>
     8c0:	00003097          	auipc	ra,0x3
     8c4:	aac080e7          	jalr	-1364(ra) # 336c <printf>
     8c8:	00003097          	auipc	ra,0x3
     8cc:	938080e7          	jalr	-1736(ra) # 3200 <display_refresh>
     8d0:	000a8793          	mv	a5,s5
     8d4:	de5ff06f          	j	6b8 <synth_90s_mode+0x160>
     8d8:	00000097          	auipc	ra,0x0
     8dc:	c34080e7          	jalr	-972(ra) # 50c <fast_rand>
     8e0:	f39ff06f          	j	818 <synth_90s_mode+0x2c0>
     8e4:	00000097          	auipc	ra,0x0
     8e8:	c28080e7          	jalr	-984(ra) # 50c <fast_rand>
     8ec:	03200793          	li	a5,50
     8f0:	00adf463          	bgeu	s11,a0,8f8 <synth_90s_mode+0x3a0>
     8f4:	0c800793          	li	a5,200
     8f8:	0ff97513          	zext.b	a0,s2
     8fc:	00f50533          	add	a0,a0,a5
     900:	40155513          	srai	a0,a0,0x1
     904:	f15ff06f          	j	818 <synth_90s_mode+0x2c0>
     908:	40295513          	srai	a0,s2,0x2
     90c:	0ff57513          	zext.b	a0,a0
     910:	f09ff06f          	j	818 <synth_90s_mode+0x2c0>
     914:	20097513          	andi	a0,s2,512
     918:	00153513          	seqz	a0,a0
     91c:	40a00533          	neg	a0,a0
     920:	f6a57513          	andi	a0,a0,-150
     924:	0c850513          	addi	a0,a0,200
     928:	ef1ff06f          	j	818 <synth_90s_mode+0x2c0>
     92c:	00500493          	li	s1,5
     930:	4b000993          	li	s3,1200
     934:	0ff00413          	li	s0,255
     938:	e65ff06f          	j	79c <synth_90s_mode+0x244>
     93c:	00400493          	li	s1,4
     940:	e5dff06f          	j	79c <synth_90s_mode+0x244>
     944:	f80416e3          	bnez	s0,8d0 <synth_90s_mode+0x378>
     948:	01400593          	li	a1,20
     94c:	000a0513          	mv	a0,s4
     950:	00002097          	auipc	ra,0x2
     954:	460080e7          	jalr	1120(ra) # 2db0 <__modsi3>
     958:	f6051ce3          	bnez	a0,8d0 <synth_90s_mode+0x378>
     95c:	05000513          	li	a0,80
     960:	01400593          	li	a1,20
     964:	00002097          	auipc	ra,0x2
     968:	72c080e7          	jalr	1836(ra) # 3090 <display_set_cursor>
     96c:	00007537          	lui	a0,0x7
     970:	9b050513          	addi	a0,a0,-1616 # 69b0 <LEDS+0x6c>
     974:	f4dff06f          	j	8c0 <synth_90s_mode+0x368>

00000978 <intro_sequence>:
     978:	dc010113          	addi	sp,sp,-576
     97c:	22112e23          	sw	ra,572(sp)
     980:	22812c23          	sw	s0,568(sp)
     984:	22912a23          	sw	s1,564(sp)
     988:	23212823          	sw	s2,560(sp)
     98c:	23312623          	sw	s3,556(sp)
     990:	23412423          	sw	s4,552(sp)
     994:	23512223          	sw	s5,548(sp)
     998:	23612023          	sw	s6,544(sp)
     99c:	21712e23          	sw	s7,540(sp)
     9a0:	21812c23          	sw	s8,536(sp)
     9a4:	21912a23          	sw	s9,532(sp)
     9a8:	21a12823          	sw	s10,528(sp)
     9ac:	21b12623          	sw	s11,524(sp)
     9b0:	00002097          	auipc	ra,0x2
     9b4:	6d4080e7          	jalr	1748(ra) # 3084 <display_framebuffer>
     9b8:	00004637          	lui	a2,0x4
     9bc:	00000593          	li	a1,0
     9c0:	00002097          	auipc	ra,0x2
     9c4:	420080e7          	jalr	1056(ra) # 2de0 <memset>
     9c8:	03c00593          	li	a1,60
     9cc:	02300513          	li	a0,35
     9d0:	00002097          	auipc	ra,0x2
     9d4:	6c0080e7          	jalr	1728(ra) # 3090 <display_set_cursor>
     9d8:	00000593          	li	a1,0
     9dc:	0ff00513          	li	a0,255
     9e0:	00002097          	auipc	ra,0x2
     9e4:	6c4080e7          	jalr	1732(ra) # 30a4 <display_set_front_back_color>
     9e8:	00007537          	lui	a0,0x7
     9ec:	9b850513          	addi	a0,a0,-1608 # 69b8 <LEDS+0x74>
     9f0:	00003097          	auipc	ra,0x3
     9f4:	97c080e7          	jalr	-1668(ra) # 336c <printf>
     9f8:	00003097          	auipc	ra,0x3
     9fc:	808080e7          	jalr	-2040(ra) # 3200 <display_refresh>
     a00:	000074b7          	lui	s1,0x7
     a04:	00007537          	lui	a0,0x7
     a08:	94848593          	addi	a1,s1,-1720 # 6948 <LEDS+0x4>
     a0c:	9c450513          	addi	a0,a0,-1596 # 69c4 <LEDS+0x80>
     a10:	00006097          	auipc	ra,0x6
     a14:	b04080e7          	jalr	-1276(ra) # 6514 <fl_fopen>
     a18:	00050413          	mv	s0,a0
     a1c:	02051063          	bnez	a0,a3c <intro_sequence+0xc4>
     a20:	00007537          	lui	a0,0x7
     a24:	94848593          	addi	a1,s1,-1720
     a28:	9d050513          	addi	a0,a0,-1584 # 69d0 <LEDS+0x8c>
     a2c:	00006097          	auipc	ra,0x6
     a30:	ae8080e7          	jalr	-1304(ra) # 6514 <fl_fopen>
     a34:	00050413          	mv	s0,a0
     a38:	1e050a63          	beqz	a0,c2c <intro_sequence+0x2b4>
     a3c:	02300513          	li	a0,35
     a40:	04600593          	li	a1,70
     a44:	00002097          	auipc	ra,0x2
     a48:	64c080e7          	jalr	1612(ra) # 3090 <display_set_cursor>
     a4c:	00007537          	lui	a0,0x7
     a50:	9dc50513          	addi	a0,a0,-1572 # 69dc <LEDS+0x98>
     a54:	00003097          	auipc	ra,0x3
     a58:	918080e7          	jalr	-1768(ra) # 336c <printf>
     a5c:	00002097          	auipc	ra,0x2
     a60:	7a4080e7          	jalr	1956(ra) # 3200 <display_refresh>
     a64:	20000613          	li	a2,512
     a68:	08000593          	li	a1,128
     a6c:	00010513          	mv	a0,sp
     a70:	00002097          	auipc	ra,0x2
     a74:	370080e7          	jalr	880(ra) # 2de0 <memset>
     a78:	000077b7          	lui	a5,0x7
     a7c:	92c7ac03          	lw	s8,-1748(a5) # 692c <AUDIO>
     a80:	000077b7          	lui	a5,0x7
     a84:	9f878d13          	addi	s10,a5,-1544 # 69f8 <LEDS+0xb4>
     a88:	000077b7          	lui	a5,0x7
     a8c:	9347ad83          	lw	s11,-1740(a5) # 6934 <BUTTONS>
     a90:	00803cb3          	snez	s9,s0
     a94:	00000a93          	li	s5,0
     a98:	00000b13          	li	s6,0
     a9c:	00100a13          	li	s4,1
     aa0:	00200993          	li	s3,2
     aa4:	03200913          	li	s2,50
     aa8:	01400493          	li	s1,20
     aac:	000c2b83          	lw	s7,0(s8)
     ab0:	1c0c8463          	beqz	s9,c78 <intro_sequence+0x300>
     ab4:	00040693          	mv	a3,s0
     ab8:	20000613          	li	a2,512
     abc:	00100593          	li	a1,1
     ac0:	00010513          	mv	a0,sp
     ac4:	00005097          	auipc	ra,0x5
     ac8:	44c080e7          	jalr	1100(ra) # 5f10 <fl_fread>
     acc:	1ff00793          	li	a5,511
     ad0:	16a7cc63          	blt	a5,a0,c48 <intro_sequence+0x2d0>
     ad4:	00040513          	mv	a0,s0
     ad8:	00005097          	auipc	ra,0x5
     adc:	35c080e7          	jalr	860(ra) # 5e34 <fl_fclose>
     ae0:	00000c93          	li	s9,0
     ae4:	00000413          	li	s0,0
     ae8:	001b0b13          	addi	s6,s6,1
     aec:	00300793          	li	a5,3
     af0:	0afb1463          	bne	s6,a5,b98 <intro_sequence+0x220>
     af4:	00002097          	auipc	ra,0x2
     af8:	590080e7          	jalr	1424(ra) # 3084 <display_framebuffer>
     afc:	00004637          	lui	a2,0x4
     b00:	00000593          	li	a1,0
     b04:	00050b13          	mv	s6,a0
     b08:	00002097          	auipc	ra,0x2
     b0c:	2d8080e7          	jalr	728(ra) # 2de0 <memset>
     b10:	000046b7          	lui	a3,0x4
     b14:	00000793          	li	a5,0
     b18:	fff00613          	li	a2,-1
     b1c:	f8068693          	addi	a3,a3,-128 # 3f80 <fatfs_lfn_create_sfn+0x104>
     b20:	08000593          	li	a1,128
     b24:	00fb0733          	add	a4,s6,a5
     b28:	00c70023          	sb	a2,0(a4)
     b2c:	00d70733          	add	a4,a4,a3
     b30:	00c70023          	sb	a2,0(a4)
     b34:	00178793          	addi	a5,a5,1
     b38:	feb796e3          	bne	a5,a1,b24 <intro_sequence+0x1ac>
     b3c:	00090593          	mv	a1,s2
     b40:	00048513          	mv	a0,s1
     b44:	00002097          	auipc	ra,0x2
     b48:	54c080e7          	jalr	1356(ra) # 3090 <display_set_cursor>
     b4c:	00000593          	li	a1,0
     b50:	0ff00513          	li	a0,255
     b54:	00002097          	auipc	ra,0x2
     b58:	550080e7          	jalr	1360(ra) # 30a4 <display_set_front_back_color>
     b5c:	000d0513          	mv	a0,s10
     b60:	00003097          	auipc	ra,0x3
     b64:	80c080e7          	jalr	-2036(ra) # 336c <printf>
     b68:	013484b3          	add	s1,s1,s3
     b6c:	00400793          	li	a5,4
     b70:	01490933          	add	s2,s2,s4
     b74:	1497c663          	blt	a5,s1,cc0 <intro_sequence+0x348>
     b78:	413009b3          	neg	s3,s3
     b7c:	00078493          	mv	s1,a5
     b80:	1527ca63          	blt	a5,s2,cd4 <intro_sequence+0x35c>
     b84:	41400a33          	neg	s4,s4
     b88:	00400913          	li	s2,4
     b8c:	00002097          	auipc	ra,0x2
     b90:	674080e7          	jalr	1652(ra) # 3200 <display_refresh>
     b94:	00000b13          	li	s6,0
     b98:	001a8a93          	addi	s5,s5,1
     b9c:	03c00793          	li	a5,60
     ba0:	1557d463          	bge	a5,s5,ce8 <intro_sequence+0x370>
     ba4:	000da783          	lw	a5,0(s11)
     ba8:	14078063          	beqz	a5,ce8 <intro_sequence+0x370>
     bac:	fffff097          	auipc	ra,0xfffff
     bb0:	5b0080e7          	jalr	1456(ra) # 15c <play_click_noise>
     bb4:	00040863          	beqz	s0,bc4 <intro_sequence+0x24c>
     bb8:	00040513          	mv	a0,s0
     bbc:	00005097          	auipc	ra,0x5
     bc0:	278080e7          	jalr	632(ra) # 5e34 <fl_fclose>
     bc4:	000077b7          	lui	a5,0x7
     bc8:	9447a783          	lw	a5,-1724(a5) # 6944 <LEDS>
     bcc:	0007a023          	sw	zero,0(a5)
     bd0:	00002097          	auipc	ra,0x2
     bd4:	4b4080e7          	jalr	1204(ra) # 3084 <display_framebuffer>
     bd8:	00004637          	lui	a2,0x4
     bdc:	00000593          	li	a1,0
     be0:	00002097          	auipc	ra,0x2
     be4:	200080e7          	jalr	512(ra) # 2de0 <memset>
     be8:	00002097          	auipc	ra,0x2
     bec:	618080e7          	jalr	1560(ra) # 3200 <display_refresh>
     bf0:	23c12083          	lw	ra,572(sp)
     bf4:	23812403          	lw	s0,568(sp)
     bf8:	23412483          	lw	s1,564(sp)
     bfc:	23012903          	lw	s2,560(sp)
     c00:	22c12983          	lw	s3,556(sp)
     c04:	22812a03          	lw	s4,552(sp)
     c08:	22412a83          	lw	s5,548(sp)
     c0c:	22012b03          	lw	s6,544(sp)
     c10:	21c12b83          	lw	s7,540(sp)
     c14:	21812c03          	lw	s8,536(sp)
     c18:	21412c83          	lw	s9,532(sp)
     c1c:	21012d03          	lw	s10,528(sp)
     c20:	20c12d83          	lw	s11,524(sp)
     c24:	24010113          	addi	sp,sp,576
     c28:	00008067          	ret
     c2c:	00a00513          	li	a0,10
     c30:	04600593          	li	a1,70
     c34:	00002097          	auipc	ra,0x2
     c38:	45c080e7          	jalr	1116(ra) # 3090 <display_set_cursor>
     c3c:	00007537          	lui	a0,0x7
     c40:	9e850513          	addi	a0,a0,-1560 # 69e8 <LEDS+0xa4>
     c44:	e11ff06f          	j	a54 <intro_sequence+0xdc>
     c48:	20000593          	li	a1,512
     c4c:	00010513          	mv	a0,sp
     c50:	fffff097          	auipc	ra,0xfffff
     c54:	60c080e7          	jalr	1548(ra) # 25c <update_led_dance>
     c58:	20000613          	li	a2,512
     c5c:	00010593          	mv	a1,sp
     c60:	000b8513          	mv	a0,s7
     c64:	fffff097          	auipc	ra,0xfffff
     c68:	458080e7          	jalr	1112(ra) # bc <memcpy_custom>
     c6c:	000c2783          	lw	a5,0(s8)
     c70:	fefb8ee3          	beq	s7,a5,c6c <intro_sequence+0x2f4>
     c74:	e75ff06f          	j	ae8 <intro_sequence+0x170>
     c78:	000057b7          	lui	a5,0x5
     c7c:	e2078793          	addi	a5,a5,-480 # 4e20 <_open_directory+0x50>
     c80:	00000013          	nop
     c84:	fff78793          	addi	a5,a5,-1
     c88:	fe079ce3          	bnez	a5,c80 <intro_sequence+0x308>
     c8c:	20000613          	li	a2,512
     c90:	08000593          	li	a1,128
     c94:	00010513          	mv	a0,sp
     c98:	00002097          	auipc	ra,0x2
     c9c:	148080e7          	jalr	328(ra) # 2de0 <memset>
     ca0:	20000613          	li	a2,512
     ca4:	00010593          	mv	a1,sp
     ca8:	000b8513          	mv	a0,s7
     cac:	fffff097          	auipc	ra,0xfffff
     cb0:	410080e7          	jalr	1040(ra) # bc <memcpy_custom>
     cb4:	000c2783          	lw	a5,0(s8)
     cb8:	fefb8ee3          	beq	s7,a5,cb4 <intro_sequence+0x33c>
     cbc:	e2dff06f          	j	ae8 <intro_sequence+0x170>
     cc0:	02700713          	li	a4,39
     cc4:	ea975ee3          	bge	a4,s1,b80 <intro_sequence+0x208>
     cc8:	413009b3          	neg	s3,s3
     ccc:	02800493          	li	s1,40
     cd0:	eb1ff06f          	j	b80 <intro_sequence+0x208>
     cd4:	07500793          	li	a5,117
     cd8:	eb27dae3          	bge	a5,s2,b8c <intro_sequence+0x214>
     cdc:	41400a33          	neg	s4,s4
     ce0:	07600913          	li	s2,118
     ce4:	ea9ff06f          	j	b8c <intro_sequence+0x214>
     ce8:	dc0c92e3          	bnez	s9,aac <intro_sequence+0x134>
     cec:	19000793          	li	a5,400
     cf0:	db57dee3          	bge	a5,s5,aac <intro_sequence+0x134>
     cf4:	ec1ff06f          	j	bb4 <intro_sequence+0x23c>

00000cf8 <play_music_with_controls>:
     cf8:	ba010113          	addi	sp,sp,-1120
     cfc:	44112e23          	sw	ra,1116(sp)
     d00:	44912a23          	sw	s1,1108(sp)
     d04:	45212823          	sw	s2,1104(sp)
     d08:	45312623          	sw	s3,1100(sp)
     d0c:	44812c23          	sw	s0,1112(sp)
     d10:	45412423          	sw	s4,1096(sp)
     d14:	45512223          	sw	s5,1092(sp)
     d18:	45612023          	sw	s6,1088(sp)
     d1c:	43712e23          	sw	s7,1084(sp)
     d20:	43812c23          	sw	s8,1080(sp)
     d24:	43912a23          	sw	s9,1076(sp)
     d28:	43a12823          	sw	s10,1072(sp)
     d2c:	43b12623          	sw	s11,1068(sp)
     d30:	00b12623          	sw	a1,12(sp)
     d34:	00060913          	mv	s2,a2
     d38:	00050993          	mv	s3,a0
     d3c:	00002097          	auipc	ra,0x2
     d40:	348080e7          	jalr	840(ra) # 3084 <display_framebuffer>
     d44:	00004637          	lui	a2,0x4
     d48:	00000593          	li	a1,0
     d4c:	00002097          	auipc	ra,0x2
     d50:	094080e7          	jalr	148(ra) # 2de0 <memset>
     d54:	000075b7          	lui	a1,0x7
     d58:	a0858593          	addi	a1,a1,-1528 # 6a08 <LEDS+0xc4>
     d5c:	02c10513          	addi	a0,sp,44
     d60:	00002097          	auipc	ra,0x2
     d64:	144080e7          	jalr	324(ra) # 2ea4 <strcpy>
     d68:	00c12583          	lw	a1,12(sp)
     d6c:	02c10513          	addi	a0,sp,44
     d70:	000074b7          	lui	s1,0x7
     d74:	fffff097          	auipc	ra,0xfffff
     d78:	318080e7          	jalr	792(ra) # 8c <strcat_custom>
     d7c:	94848593          	addi	a1,s1,-1720 # 6948 <LEDS+0x4>
     d80:	02c10513          	addi	a0,sp,44
     d84:	00005097          	auipc	ra,0x5
     d88:	790080e7          	jalr	1936(ra) # 6514 <fl_fopen>
     d8c:	28050a63          	beqz	a0,1020 <play_music_with_controls+0x328>
     d90:	00050413          	mv	s0,a0
     d94:	00002097          	auipc	ra,0x2
     d98:	2f0080e7          	jalr	752(ra) # 3084 <display_framebuffer>
     d9c:	00040693          	mv	a3,s0
     da0:	00004637          	lui	a2,0x4
     da4:	00100593          	li	a1,1
     da8:	00005097          	auipc	ra,0x5
     dac:	168080e7          	jalr	360(ra) # 5f10 <fl_fread>
     db0:	00040513          	mv	a0,s0
     db4:	00005097          	auipc	ra,0x5
     db8:	080080e7          	jalr	128(ra) # 5e34 <fl_fclose>
     dbc:	94848593          	addi	a1,s1,-1720
     dc0:	00098513          	mv	a0,s3
     dc4:	00005097          	auipc	ra,0x5
     dc8:	750080e7          	jalr	1872(ra) # 6514 <fl_fopen>
     dcc:	00a12823          	sw	a0,16(sp)
     dd0:	00000413          	li	s0,0
     dd4:	20050663          	beqz	a0,fe0 <play_music_with_controls+0x2e8>
     dd8:	00c12603          	lw	a2,12(sp)
     ddc:	00007c37          	lui	s8,0x7
     de0:	bacc0593          	addi	a1,s8,-1108 # 6bac <LEDS+0x268>
     de4:	00000513          	li	a0,0
     de8:	fffff097          	auipc	ra,0xfffff
     dec:	518080e7          	jalr	1304(ra) # 300 <update_player_ui>
     df0:	00007cb7          	lui	s9,0x7
     df4:	00002097          	auipc	ra,0x2
     df8:	40c080e7          	jalr	1036(ra) # 3200 <display_refresh>
     dfc:	934ca783          	lw	a5,-1740(s9) # 6934 <BUTTONS>
     e00:	00000a93          	li	s5,0
     e04:	00000b13          	li	s6,0
     e08:	0007a483          	lw	s1,0(a5)
     e0c:	00f12a23          	sw	a5,20(sp)
     e10:	000077b7          	lui	a5,0x7
     e14:	92c7ad03          	lw	s10,-1748(a5) # 692c <AUDIO>
     e18:	000077b7          	lui	a5,0x7
     e1c:	9447a783          	lw	a5,-1724(a5) # 6944 <LEDS>
     e20:	00000993          	li	s3,0
     e24:	22010b93          	addi	s7,sp,544
     e28:	00f12e23          	sw	a5,28(sp)
     e2c:	000077b7          	lui	a5,0x7
     e30:	a1c78793          	addi	a5,a5,-1508 # 6a1c <LEDS+0xd8>
     e34:	00f12c23          	sw	a5,24(sp)
     e38:	000d2a03          	lw	s4,0(s10)
     e3c:	20098c63          	beqz	s3,1054 <play_music_with_controls+0x35c>
     e40:	20000613          	li	a2,512
     e44:	00000593          	li	a1,0
     e48:	000a0513          	mv	a0,s4
     e4c:	00002097          	auipc	ra,0x2
     e50:	f94080e7          	jalr	-108(ra) # 2de0 <memset>
     e54:	01c12783          	lw	a5,28(sp)
     e58:	0007a023          	sw	zero,0(a5)
     e5c:	000d2783          	lw	a5,0(s10)
     e60:	fefa0ee3          	beq	s4,a5,e5c <play_music_with_controls+0x164>
     e64:	001b0b13          	addi	s6,s6,1
     e68:	01500793          	li	a5,21
     e6c:	04fb1863          	bne	s6,a5,ebc <play_music_with_controls+0x1c4>
     e70:	00000513          	li	a0,0
     e74:	03205263          	blez	s2,e98 <play_music_with_controls+0x1a0>
     e78:	00141513          	slli	a0,s0,0x1
     e7c:	00850533          	add	a0,a0,s0
     e80:	00351513          	slli	a0,a0,0x3
     e84:	00850533          	add	a0,a0,s0
     e88:	00090593          	mv	a1,s2
     e8c:	00251513          	slli	a0,a0,0x2
     e90:	00002097          	auipc	ra,0x2
     e94:	e9c080e7          	jalr	-356(ra) # 2d2c <__divsi3>
     e98:	00c12603          	lw	a2,12(sp)
     e9c:	bacc0593          	addi	a1,s8,-1108
     ea0:	00098463          	beqz	s3,ea8 <play_music_with_controls+0x1b0>
     ea4:	01812583          	lw	a1,24(sp)
     ea8:	fffff097          	auipc	ra,0xfffff
     eac:	458080e7          	jalr	1112(ra) # 300 <update_player_ui>
     eb0:	00000b13          	li	s6,0
     eb4:	00002097          	auipc	ra,0x2
     eb8:	34c080e7          	jalr	844(ra) # 3200 <display_refresh>
     ebc:	01412783          	lw	a5,20(sp)
     ec0:	0007aa03          	lw	s4,0(a5)
     ec4:	020a7793          	andi	a5,s4,32
     ec8:	06078863          	beqz	a5,f38 <play_music_with_controls+0x240>
     ecc:	ffffe7b7          	lui	a5,0xffffe
     ed0:	00f40433          	add	s0,s0,a5
     ed4:	fff44793          	not	a5,s0
     ed8:	41f7d793          	srai	a5,a5,0x1f
     edc:	01012503          	lw	a0,16(sp)
     ee0:	00f47433          	and	s0,s0,a5
     ee4:	00000613          	li	a2,0
     ee8:	00040593          	mv	a1,s0
     eec:	00003097          	auipc	ra,0x3
     ef0:	ab8080e7          	jalr	-1352(ra) # 39a4 <fl_fseek>
     ef4:	00000513          	li	a0,0
     ef8:	03205263          	blez	s2,f1c <play_music_with_controls+0x224>
     efc:	00141513          	slli	a0,s0,0x1
     f00:	00850533          	add	a0,a0,s0
     f04:	00351513          	slli	a0,a0,0x3
     f08:	00850533          	add	a0,a0,s0
     f0c:	00090593          	mv	a1,s2
     f10:	00251513          	slli	a0,a0,0x2
     f14:	00002097          	auipc	ra,0x2
     f18:	e18080e7          	jalr	-488(ra) # 2d2c <__divsi3>
     f1c:	00c12603          	lw	a2,12(sp)
     f20:	000075b7          	lui	a1,0x7
     f24:	a2858593          	addi	a1,a1,-1496 # 6a28 <LEDS+0xe4>
     f28:	fffff097          	auipc	ra,0xfffff
     f2c:	3d8080e7          	jalr	984(ra) # 300 <update_player_ui>
     f30:	00002097          	auipc	ra,0x2
     f34:	2d0080e7          	jalr	720(ra) # 3200 <display_refresh>
     f38:	040a7793          	andi	a5,s4,64
     f3c:	06078463          	beqz	a5,fa4 <play_music_with_controls+0x2ac>
     f40:	000027b7          	lui	a5,0x2
     f44:	00f40433          	add	s0,s0,a5
     f48:	27245e63          	bge	s0,s2,11c4 <play_music_with_controls+0x4cc>
     f4c:	01012503          	lw	a0,16(sp)
     f50:	00000613          	li	a2,0
     f54:	00040593          	mv	a1,s0
     f58:	00003097          	auipc	ra,0x3
     f5c:	a4c080e7          	jalr	-1460(ra) # 39a4 <fl_fseek>
     f60:	00000513          	li	a0,0
     f64:	03205263          	blez	s2,f88 <play_music_with_controls+0x290>
     f68:	00141513          	slli	a0,s0,0x1
     f6c:	00850533          	add	a0,a0,s0
     f70:	00351513          	slli	a0,a0,0x3
     f74:	00850533          	add	a0,a0,s0
     f78:	00090593          	mv	a1,s2
     f7c:	00251513          	slli	a0,a0,0x2
     f80:	00002097          	auipc	ra,0x2
     f84:	dac080e7          	jalr	-596(ra) # 2d2c <__divsi3>
     f88:	00c12603          	lw	a2,12(sp)
     f8c:	000075b7          	lui	a1,0x7
     f90:	a3458593          	addi	a1,a1,-1484 # 6a34 <LEDS+0xf0>
     f94:	fffff097          	auipc	ra,0xfffff
     f98:	36c080e7          	jalr	876(ra) # 300 <update_player_ui>
     f9c:	00002097          	auipc	ra,0x2
     fa0:	264080e7          	jalr	612(ra) # 3200 <display_refresh>
     fa4:	fff4c493          	not	s1,s1
     fa8:	0144f4b3          	and	s1,s1,s4
     fac:	0024f793          	andi	a5,s1,2
     fb0:	10078e63          	beqz	a5,10cc <play_music_with_controls+0x3d4>
     fb4:	fffff097          	auipc	ra,0xfffff
     fb8:	1a8080e7          	jalr	424(ra) # 15c <play_click_noise>
     fbc:	00000413          	li	s0,0
     fc0:	01012503          	lw	a0,16(sp)
     fc4:	00005097          	auipc	ra,0x5
     fc8:	e70080e7          	jalr	-400(ra) # 5e34 <fl_fclose>
     fcc:	fffff097          	auipc	ra,0xfffff
     fd0:	114080e7          	jalr	276(ra) # e0 <clear_audio>
     fd4:	000077b7          	lui	a5,0x7
     fd8:	9447a783          	lw	a5,-1724(a5) # 6944 <LEDS>
     fdc:	0007a023          	sw	zero,0(a5)
     fe0:	45c12083          	lw	ra,1116(sp)
     fe4:	00040513          	mv	a0,s0
     fe8:	45812403          	lw	s0,1112(sp)
     fec:	45412483          	lw	s1,1108(sp)
     ff0:	45012903          	lw	s2,1104(sp)
     ff4:	44c12983          	lw	s3,1100(sp)
     ff8:	44812a03          	lw	s4,1096(sp)
     ffc:	44412a83          	lw	s5,1092(sp)
    1000:	44012b03          	lw	s6,1088(sp)
    1004:	43c12b83          	lw	s7,1084(sp)
    1008:	43812c03          	lw	s8,1080(sp)
    100c:	43412c83          	lw	s9,1076(sp)
    1010:	43012d03          	lw	s10,1072(sp)
    1014:	42c12d83          	lw	s11,1068(sp)
    1018:	46010113          	addi	sp,sp,1120
    101c:	00008067          	ret
    1020:	03200593          	li	a1,50
    1024:	01e00513          	li	a0,30
    1028:	00002097          	auipc	ra,0x2
    102c:	068080e7          	jalr	104(ra) # 3090 <display_set_cursor>
    1030:	00000593          	li	a1,0
    1034:	0ff00513          	li	a0,255
    1038:	00002097          	auipc	ra,0x2
    103c:	06c080e7          	jalr	108(ra) # 30a4 <display_set_front_back_color>
    1040:	00007537          	lui	a0,0x7
    1044:	a1050513          	addi	a0,a0,-1520 # 6a10 <LEDS+0xcc>
    1048:	00002097          	auipc	ra,0x2
    104c:	324080e7          	jalr	804(ra) # 336c <printf>
    1050:	d6dff06f          	j	dbc <play_music_with_controls+0xc4>
    1054:	01012683          	lw	a3,16(sp)
    1058:	20000613          	li	a2,512
    105c:	00100593          	li	a1,1
    1060:	000b8513          	mv	a0,s7
    1064:	00005097          	auipc	ra,0x5
    1068:	eac080e7          	jalr	-340(ra) # 5f10 <fl_fread>
    106c:	1ff00793          	li	a5,511
    1070:	00050d93          	mv	s11,a0
    1074:	00a7ce63          	blt	a5,a0,1090 <play_music_with_controls+0x398>
    1078:	00050793          	mv	a5,a0
    107c:	20000713          	li	a4,512
    1080:	00fb86b3          	add	a3,s7,a5
    1084:	00068023          	sb	zero,0(a3)
    1088:	00178793          	addi	a5,a5,1
    108c:	fee79ae3          	bne	a5,a4,1080 <play_music_with_controls+0x388>
    1090:	20000593          	li	a1,512
    1094:	000b8513          	mv	a0,s7
    1098:	fffff097          	auipc	ra,0xfffff
    109c:	1c4080e7          	jalr	452(ra) # 25c <update_led_dance>
    10a0:	20000613          	li	a2,512
    10a4:	000b8593          	mv	a1,s7
    10a8:	000a0513          	mv	a0,s4
    10ac:	fffff097          	auipc	ra,0xfffff
    10b0:	010080e7          	jalr	16(ra) # bc <memcpy_custom>
    10b4:	000d2783          	lw	a5,0(s10)
    10b8:	fefa0ee3          	beq	s4,a5,10b4 <play_music_with_controls+0x3bc>
    10bc:	1ff00793          	li	a5,511
    10c0:	11b7d263          	bge	a5,s11,11c4 <play_music_with_controls+0x4cc>
    10c4:	01b40433          	add	s0,s0,s11
    10c8:	d9dff06f          	j	e64 <play_music_with_controls+0x16c>
    10cc:	0084f793          	andi	a5,s1,8
    10d0:	0e079e63          	bnez	a5,11cc <play_music_with_controls+0x4d4>
    10d4:	0104f493          	andi	s1,s1,16
    10d8:	0e049663          	bnez	s1,11c4 <play_music_with_controls+0x4cc>
    10dc:	004a7493          	andi	s1,s4,4
    10e0:	08048063          	beqz	s1,1160 <play_music_with_controls+0x468>
    10e4:	001a8493          	addi	s1,s5,1
    10e8:	01e00793          	li	a5,30
    10ec:	06f49063          	bne	s1,a5,114c <play_music_with_controls+0x454>
    10f0:	fffff097          	auipc	ra,0xfffff
    10f4:	06c080e7          	jalr	108(ra) # 15c <play_click_noise>
    10f8:	01012503          	lw	a0,16(sp)
    10fc:	00000613          	li	a2,0
    1100:	00000593          	li	a1,0
    1104:	00003097          	auipc	ra,0x3
    1108:	8a0080e7          	jalr	-1888(ra) # 39a4 <fl_fseek>
    110c:	00c12603          	lw	a2,12(sp)
    1110:	000075b7          	lui	a1,0x7
    1114:	a3c58593          	addi	a1,a1,-1476 # 6a3c <LEDS+0xf8>
    1118:	00000513          	li	a0,0
    111c:	fffff097          	auipc	ra,0xfffff
    1120:	1e4080e7          	jalr	484(ra) # 300 <update_player_ui>
    1124:	00002097          	auipc	ra,0x2
    1128:	0dc080e7          	jalr	220(ra) # 3200 <display_refresh>
    112c:	fffff097          	auipc	ra,0xfffff
    1130:	fb4080e7          	jalr	-76(ra) # e0 <clear_audio>
    1134:	934ca783          	lw	a5,-1740(s9)
    1138:	0007a403          	lw	s0,0(a5)
    113c:	00447413          	andi	s0,s0,4
    1140:	00041c63          	bnez	s0,1158 <play_music_with_controls+0x460>
    1144:	00000493          	li	s1,0
    1148:	00000993          	li	s3,0
    114c:	00048a93          	mv	s5,s1
    1150:	000a0493          	mv	s1,s4
    1154:	ce5ff06f          	j	e38 <play_music_with_controls+0x140>
    1158:	00000013          	nop
    115c:	fddff06f          	j	1138 <play_music_with_controls+0x440>
    1160:	fffa8a93          	addi	s5,s5,-1
    1164:	01c00793          	li	a5,28
    1168:	ff57e2e3          	bltu	a5,s5,114c <play_music_with_controls+0x454>
    116c:	0019ca93          	xori	s5,s3,1
    1170:	00000513          	li	a0,0
    1174:	03205263          	blez	s2,1198 <play_music_with_controls+0x4a0>
    1178:	00141513          	slli	a0,s0,0x1
    117c:	00850533          	add	a0,a0,s0
    1180:	00351513          	slli	a0,a0,0x3
    1184:	00850533          	add	a0,a0,s0
    1188:	00090593          	mv	a1,s2
    118c:	00251513          	slli	a0,a0,0x2
    1190:	00002097          	auipc	ra,0x2
    1194:	b9c080e7          	jalr	-1124(ra) # 2d2c <__divsi3>
    1198:	00100793          	li	a5,1
    119c:	00c12603          	lw	a2,12(sp)
    11a0:	bacc0593          	addi	a1,s8,-1108
    11a4:	00f98463          	beq	s3,a5,11ac <play_music_with_controls+0x4b4>
    11a8:	01812583          	lw	a1,24(sp)
    11ac:	fffff097          	auipc	ra,0xfffff
    11b0:	154080e7          	jalr	340(ra) # 300 <update_player_ui>
    11b4:	000a8993          	mv	s3,s5
    11b8:	00002097          	auipc	ra,0x2
    11bc:	048080e7          	jalr	72(ra) # 3200 <display_refresh>
    11c0:	f8dff06f          	j	114c <play_music_with_controls+0x454>
    11c4:	00100413          	li	s0,1
    11c8:	df9ff06f          	j	fc0 <play_music_with_controls+0x2c8>
    11cc:	fff00413          	li	s0,-1
    11d0:	df1ff06f          	j	fc0 <play_music_with_controls+0x2c8>

000011d4 <play_dj_mode>:
    11d4:	81010113          	addi	sp,sp,-2032
    11d8:	7e112623          	sw	ra,2028(sp)
    11dc:	7e912223          	sw	s1,2020(sp)
    11e0:	7f212023          	sw	s2,2016(sp)
    11e4:	7e812423          	sw	s0,2024(sp)
    11e8:	7d312e23          	sw	s3,2012(sp)
    11ec:	7d412c23          	sw	s4,2008(sp)
    11f0:	7d512a23          	sw	s5,2004(sp)
    11f4:	7d612823          	sw	s6,2000(sp)
    11f8:	7d712623          	sw	s7,1996(sp)
    11fc:	7d812423          	sw	s8,1992(sp)
    1200:	7d912223          	sw	s9,1988(sp)
    1204:	7da12023          	sw	s10,1984(sp)
    1208:	7bb12e23          	sw	s11,1980(sp)
    120c:	f9010113          	addi	sp,sp,-112
    1210:	00b12623          	sw	a1,12(sp)
    1214:	00c12a23          	sw	a2,20(sp)
    1218:	00050913          	mv	s2,a0
    121c:	00002097          	auipc	ra,0x2
    1220:	e68080e7          	jalr	-408(ra) # 3084 <display_framebuffer>
    1224:	00004637          	lui	a2,0x4
    1228:	00000593          	li	a1,0
    122c:	00002097          	auipc	ra,0x2
    1230:	bb4080e7          	jalr	-1100(ra) # 2de0 <memset>
    1234:	000075b7          	lui	a1,0x7
    1238:	a0858593          	addi	a1,a1,-1528 # 6a08 <LEDS+0xc4>
    123c:	02c10513          	addi	a0,sp,44
    1240:	00002097          	auipc	ra,0x2
    1244:	c64080e7          	jalr	-924(ra) # 2ea4 <strcpy>
    1248:	00c12583          	lw	a1,12(sp)
    124c:	02c10513          	addi	a0,sp,44
    1250:	000074b7          	lui	s1,0x7
    1254:	fffff097          	auipc	ra,0xfffff
    1258:	e38080e7          	jalr	-456(ra) # 8c <strcat_custom>
    125c:	94848593          	addi	a1,s1,-1720 # 6948 <LEDS+0x4>
    1260:	02c10513          	addi	a0,sp,44
    1264:	00005097          	auipc	ra,0x5
    1268:	2b0080e7          	jalr	688(ra) # 6514 <fl_fopen>
    126c:	14050863          	beqz	a0,13bc <play_dj_mode+0x1e8>
    1270:	00050413          	mv	s0,a0
    1274:	00002097          	auipc	ra,0x2
    1278:	e10080e7          	jalr	-496(ra) # 3084 <display_framebuffer>
    127c:	00040693          	mv	a3,s0
    1280:	00004637          	lui	a2,0x4
    1284:	00100593          	li	a1,1
    1288:	00005097          	auipc	ra,0x5
    128c:	c88080e7          	jalr	-888(ra) # 5f10 <fl_fread>
    1290:	00040513          	mv	a0,s0
    1294:	00005097          	auipc	ra,0x5
    1298:	ba0080e7          	jalr	-1120(ra) # 5e34 <fl_fclose>
    129c:	94848593          	addi	a1,s1,-1720
    12a0:	00090513          	mv	a0,s2
    12a4:	00005097          	auipc	ra,0x5
    12a8:	270080e7          	jalr	624(ra) # 6514 <fl_fopen>
    12ac:	00a12823          	sw	a0,16(sp)
    12b0:	20050e63          	beqz	a0,14cc <play_dj_mode+0x2f8>
    12b4:	07600593          	li	a1,118
    12b8:	00a00513          	li	a0,10
    12bc:	00002097          	auipc	ra,0x2
    12c0:	dd4080e7          	jalr	-556(ra) # 3090 <display_set_cursor>
    12c4:	00000593          	li	a1,0
    12c8:	0ff00513          	li	a0,255
    12cc:	00002097          	auipc	ra,0x2
    12d0:	dd8080e7          	jalr	-552(ra) # 30a4 <display_set_front_back_color>
    12d4:	00c12603          	lw	a2,12(sp)
    12d8:	000075b7          	lui	a1,0x7
    12dc:	a6058593          	addi	a1,a1,-1440 # 6a60 <LEDS+0x11c>
    12e0:	00000513          	li	a0,0
    12e4:	fffff097          	auipc	ra,0xfffff
    12e8:	01c080e7          	jalr	28(ra) # 300 <update_player_ui>
    12ec:	00002097          	auipc	ra,0x2
    12f0:	f14080e7          	jalr	-236(ra) # 3200 <display_refresh>
    12f4:	000077b7          	lui	a5,0x7
    12f8:	9347a783          	lw	a5,-1740(a5) # 6934 <BUTTONS>
    12fc:	00000493          	li	s1,0
    1300:	00000913          	li	s2,0
    1304:	0007a403          	lw	s0,0(a5)
    1308:	00f12c23          	sw	a5,24(sp)
    130c:	000077b7          	lui	a5,0x7
    1310:	92c7ac83          	lw	s9,-1748(a5) # 692c <AUDIO>
    1314:	000077b7          	lui	a5,0x7
    1318:	a7878793          	addi	a5,a5,-1416 # 6a78 <LEDS+0x134>
    131c:	00000d13          	li	s10,0
    1320:	00007bb7          	lui	s7,0x7
    1324:	00007c37          	lui	s8,0x7
    1328:	00f12e23          	sw	a5,28(sp)
    132c:	01812783          	lw	a5,24(sp)
    1330:	000caa83          	lw	s5,0(s9)
    1334:	0007a983          	lw	s3,0(a5)
    1338:	0049fd93          	andi	s11,s3,4
    133c:	0a0d8a63          	beqz	s11,13f0 <play_dj_mode+0x21c>
    1340:	20000593          	li	a1,512
    1344:	22010513          	addi	a0,sp,544
    1348:	fffff097          	auipc	ra,0xfffff
    134c:	f14080e7          	jalr	-236(ra) # 25c <update_led_dance>
    1350:	20000613          	li	a2,512
    1354:	22010593          	addi	a1,sp,544
    1358:	000a8513          	mv	a0,s5
    135c:	fffff097          	auipc	ra,0xfffff
    1360:	d60080e7          	jalr	-672(ra) # bc <memcpy_custom>
    1364:	000ca783          	lw	a5,0(s9)
    1368:	fefa8ee3          	beq	s5,a5,1364 <play_dj_mode+0x190>
    136c:	00190913          	addi	s2,s2,1
    1370:	00a00793          	li	a5,10
    1374:	fb27dce3          	bge	a5,s2,132c <play_dj_mode+0x158>
    1378:	001d1513          	slli	a0,s10,0x1
    137c:	01a50533          	add	a0,a0,s10
    1380:	01412583          	lw	a1,20(sp)
    1384:	00351513          	slli	a0,a0,0x3
    1388:	01a50533          	add	a0,a0,s10
    138c:	00251513          	slli	a0,a0,0x2
    1390:	00002097          	auipc	ra,0x2
    1394:	99c080e7          	jalr	-1636(ra) # 2d2c <__divsi3>
    1398:	00c12603          	lw	a2,12(sp)
    139c:	000075b7          	lui	a1,0x7
    13a0:	a6c58593          	addi	a1,a1,-1428 # 6a6c <LEDS+0x128>
    13a4:	fffff097          	auipc	ra,0xfffff
    13a8:	f5c080e7          	jalr	-164(ra) # 300 <update_player_ui>
    13ac:	00000913          	li	s2,0
    13b0:	00002097          	auipc	ra,0x2
    13b4:	e50080e7          	jalr	-432(ra) # 3200 <display_refresh>
    13b8:	f75ff06f          	j	132c <play_dj_mode+0x158>
    13bc:	00000593          	li	a1,0
    13c0:	0ff00513          	li	a0,255
    13c4:	00002097          	auipc	ra,0x2
    13c8:	ce0080e7          	jalr	-800(ra) # 30a4 <display_set_front_back_color>
    13cc:	03200593          	li	a1,50
    13d0:	02300513          	li	a0,35
    13d4:	00002097          	auipc	ra,0x2
    13d8:	cbc080e7          	jalr	-836(ra) # 3090 <display_set_cursor>
    13dc:	00007537          	lui	a0,0x7
    13e0:	a5850513          	addi	a0,a0,-1448 # 6a58 <LEDS+0x114>
    13e4:	00002097          	auipc	ra,0x2
    13e8:	f88080e7          	jalr	-120(ra) # 336c <printf>
    13ec:	eb1ff06f          	j	129c <play_dj_mode+0xc8>
    13f0:	00100793          	li	a5,1
    13f4:	40000a13          	li	s4,1024
    13f8:	00f48a63          	beq	s1,a5,140c <play_dj_mode+0x238>
    13fc:	fff00793          	li	a5,-1
    1400:	10000a13          	li	s4,256
    1404:	00f48463          	beq	s1,a5,140c <play_dj_mode+0x238>
    1408:	20000a13          	li	s4,512
    140c:	01012683          	lw	a3,16(sp)
    1410:	000a0613          	mv	a2,s4
    1414:	00100593          	li	a1,1
    1418:	42010513          	addi	a0,sp,1056
    141c:	00005097          	auipc	ra,0x5
    1420:	af4080e7          	jalr	-1292(ra) # 5f10 <fl_fread>
    1424:	00050b13          	mv	s6,a0
    1428:	42010793          	addi	a5,sp,1056
    142c:	03455063          	bge	a0,s4,144c <play_dj_mode+0x278>
    1430:	01012503          	lw	a0,16(sp)
    1434:	00000613          	li	a2,0
    1438:	00000593          	li	a1,0
    143c:	00002097          	auipc	ra,0x2
    1440:	568080e7          	jalr	1384(ra) # 39a4 <fl_fseek>
    1444:	00000d13          	li	s10,0
    1448:	ee5ff06f          	j	132c <play_dj_mode+0x158>
    144c:	22010a13          	addi	s4,sp,544
    1450:	0a049e63          	bnez	s1,150c <play_dj_mode+0x338>
    1454:	20000613          	li	a2,512
    1458:	00078593          	mv	a1,a5
    145c:	000a0513          	mv	a0,s4
    1460:	fffff097          	auipc	ra,0xfffff
    1464:	c5c080e7          	jalr	-932(ra) # bc <memcpy_custom>
    1468:	20000593          	li	a1,512
    146c:	000a0513          	mv	a0,s4
    1470:	fffff097          	auipc	ra,0xfffff
    1474:	dec080e7          	jalr	-532(ra) # 25c <update_led_dance>
    1478:	20000613          	li	a2,512
    147c:	000a0593          	mv	a1,s4
    1480:	000a8513          	mv	a0,s5
    1484:	fffff097          	auipc	ra,0xfffff
    1488:	c38080e7          	jalr	-968(ra) # bc <memcpy_custom>
    148c:	000ca783          	lw	a5,0(s9)
    1490:	fefa8ee3          	beq	s5,a5,148c <play_dj_mode+0x2b8>
    1494:	fff44413          	not	s0,s0
    1498:	01347433          	and	s0,s0,s3
    149c:	00247793          	andi	a5,s0,2
    14a0:	0a078e63          	beqz	a5,155c <play_dj_mode+0x388>
    14a4:	fffff097          	auipc	ra,0xfffff
    14a8:	cb8080e7          	jalr	-840(ra) # 15c <play_click_noise>
    14ac:	01012503          	lw	a0,16(sp)
    14b0:	00005097          	auipc	ra,0x5
    14b4:	984080e7          	jalr	-1660(ra) # 5e34 <fl_fclose>
    14b8:	fffff097          	auipc	ra,0xfffff
    14bc:	c28080e7          	jalr	-984(ra) # e0 <clear_audio>
    14c0:	000077b7          	lui	a5,0x7
    14c4:	9447a783          	lw	a5,-1724(a5) # 6944 <LEDS>
    14c8:	0007a023          	sw	zero,0(a5)
    14cc:	07010113          	addi	sp,sp,112
    14d0:	7ec12083          	lw	ra,2028(sp)
    14d4:	7e812403          	lw	s0,2024(sp)
    14d8:	7e412483          	lw	s1,2020(sp)
    14dc:	7e012903          	lw	s2,2016(sp)
    14e0:	7dc12983          	lw	s3,2012(sp)
    14e4:	7d812a03          	lw	s4,2008(sp)
    14e8:	7d412a83          	lw	s5,2004(sp)
    14ec:	7d012b03          	lw	s6,2000(sp)
    14f0:	7cc12b83          	lw	s7,1996(sp)
    14f4:	7c812c03          	lw	s8,1992(sp)
    14f8:	7c412c83          	lw	s9,1988(sp)
    14fc:	7c012d03          	lw	s10,1984(sp)
    1500:	7bc12d83          	lw	s11,1980(sp)
    1504:	7f010113          	addi	sp,sp,2032
    1508:	00008067          	ret
    150c:	00100693          	li	a3,1
    1510:	000a0713          	mv	a4,s4
    1514:	10000613          	li	a2,256
    1518:	02d49263          	bne	s1,a3,153c <play_dj_mode+0x368>
    151c:	20000713          	li	a4,512
    1520:	0007c603          	lbu	a2,0(a5)
    1524:	01ba06b3          	add	a3,s4,s11
    1528:	001d8d93          	addi	s11,s11,1
    152c:	00c68023          	sb	a2,0(a3)
    1530:	00278793          	addi	a5,a5,2
    1534:	feed96e3          	bne	s11,a4,1520 <play_dj_mode+0x34c>
    1538:	f31ff06f          	j	1468 <play_dj_mode+0x294>
    153c:	01b786b3          	add	a3,a5,s11
    1540:	0006c683          	lbu	a3,0(a3)
    1544:	001d8d93          	addi	s11,s11,1
    1548:	00270713          	addi	a4,a4,2
    154c:	fed70f23          	sb	a3,-2(a4)
    1550:	fed70fa3          	sb	a3,-1(a4)
    1554:	fecd94e3          	bne	s11,a2,153c <play_dj_mode+0x368>
    1558:	f11ff06f          	j	1468 <play_dj_mode+0x294>
    155c:	00847793          	andi	a5,s0,8
    1560:	016d0d33          	add	s10,s10,s6
    1564:	00078463          	beqz	a5,156c <play_dj_mode+0x398>
    1568:	00100493          	li	s1,1
    156c:	01047793          	andi	a5,s0,16
    1570:	00078463          	beqz	a5,1578 <play_dj_mode+0x3a4>
    1574:	fff00493          	li	s1,-1
    1578:	04047413          	andi	s0,s0,64
    157c:	00143413          	seqz	s0,s0
    1580:	40800433          	neg	s0,s0
    1584:	0209f793          	andi	a5,s3,32
    1588:	0084f4b3          	and	s1,s1,s0
    158c:	06078263          	beqz	a5,15f0 <play_dj_mode+0x41c>
    1590:	ffffc7b7          	lui	a5,0xffffc
    1594:	00fd0d33          	add	s10,s10,a5
    1598:	fffd4793          	not	a5,s10
    159c:	41f7d793          	srai	a5,a5,0x1f
    15a0:	01012503          	lw	a0,16(sp)
    15a4:	00fd7d33          	and	s10,s10,a5
    15a8:	00000613          	li	a2,0
    15ac:	000d0593          	mv	a1,s10
    15b0:	00002097          	auipc	ra,0x2
    15b4:	3f4080e7          	jalr	1012(ra) # 39a4 <fl_fseek>
    15b8:	001d1513          	slli	a0,s10,0x1
    15bc:	01a50533          	add	a0,a0,s10
    15c0:	01412583          	lw	a1,20(sp)
    15c4:	00351513          	slli	a0,a0,0x3
    15c8:	01a50533          	add	a0,a0,s10
    15cc:	00251513          	slli	a0,a0,0x2
    15d0:	00001097          	auipc	ra,0x1
    15d4:	75c080e7          	jalr	1884(ra) # 2d2c <__divsi3>
    15d8:	00c12603          	lw	a2,12(sp)
    15dc:	01c12583          	lw	a1,28(sp)
    15e0:	fffff097          	auipc	ra,0xfffff
    15e4:	d20080e7          	jalr	-736(ra) # 300 <update_player_ui>
    15e8:	00002097          	auipc	ra,0x2
    15ec:	c18080e7          	jalr	-1000(ra) # 3200 <display_refresh>
    15f0:	00190913          	addi	s2,s2,1
    15f4:	01400793          	li	a5,20
    15f8:	00098413          	mv	s0,s3
    15fc:	d327d8e3          	bge	a5,s2,132c <play_dj_mode+0x158>
    1600:	01412783          	lw	a5,20(sp)
    1604:	00000513          	li	a0,0
    1608:	02f05263          	blez	a5,162c <play_dj_mode+0x458>
    160c:	001d1513          	slli	a0,s10,0x1
    1610:	01a50533          	add	a0,a0,s10
    1614:	00351513          	slli	a0,a0,0x3
    1618:	01a50533          	add	a0,a0,s10
    161c:	00078593          	mv	a1,a5
    1620:	00251513          	slli	a0,a0,0x2
    1624:	00001097          	auipc	ra,0x1
    1628:	708080e7          	jalr	1800(ra) # 2d2c <__divsi3>
    162c:	00100793          	li	a5,1
    1630:	a44b8593          	addi	a1,s7,-1468 # 6a44 <LEDS+0x100>
    1634:	00f48c63          	beq	s1,a5,164c <play_dj_mode+0x478>
    1638:	fff00793          	li	a5,-1
    163c:	bacc0593          	addi	a1,s8,-1108 # 6bac <LEDS+0x268>
    1640:	00f49663          	bne	s1,a5,164c <play_dj_mode+0x478>
    1644:	000075b7          	lui	a1,0x7
    1648:	a4c58593          	addi	a1,a1,-1460 # 6a4c <LEDS+0x108>
    164c:	00c12603          	lw	a2,12(sp)
    1650:	00000913          	li	s2,0
    1654:	00098413          	mv	s0,s3
    1658:	fffff097          	auipc	ra,0xfffff
    165c:	ca8080e7          	jalr	-856(ra) # 300 <update_player_ui>
    1660:	00002097          	auipc	ra,0x2
    1664:	ba0080e7          	jalr	-1120(ra) # 3200 <display_refresh>
    1668:	cc5ff06f          	j	132c <play_dj_mode+0x158>

0000166c <view_image_file>:
    166c:	ff010113          	addi	sp,sp,-16
    1670:	00112623          	sw	ra,12(sp)
    1674:	00812423          	sw	s0,8(sp)
    1678:	00050413          	mv	s0,a0
    167c:	00002097          	auipc	ra,0x2
    1680:	a08080e7          	jalr	-1528(ra) # 3084 <display_framebuffer>
    1684:	00000593          	li	a1,0
    1688:	00004637          	lui	a2,0x4
    168c:	00001097          	auipc	ra,0x1
    1690:	754080e7          	jalr	1876(ra) # 2de0 <memset>
    1694:	00002097          	auipc	ra,0x2
    1698:	b6c080e7          	jalr	-1172(ra) # 3200 <display_refresh>
    169c:	000075b7          	lui	a1,0x7
    16a0:	94858593          	addi	a1,a1,-1720 # 6948 <LEDS+0x4>
    16a4:	00040513          	mv	a0,s0
    16a8:	00005097          	auipc	ra,0x5
    16ac:	e6c080e7          	jalr	-404(ra) # 6514 <fl_fopen>
    16b0:	0a050263          	beqz	a0,1754 <view_image_file+0xe8>
    16b4:	00050413          	mv	s0,a0
    16b8:	00002097          	auipc	ra,0x2
    16bc:	9cc080e7          	jalr	-1588(ra) # 3084 <display_framebuffer>
    16c0:	00040693          	mv	a3,s0
    16c4:	00004637          	lui	a2,0x4
    16c8:	00100593          	li	a1,1
    16cc:	00005097          	auipc	ra,0x5
    16d0:	844080e7          	jalr	-1980(ra) # 5f10 <fl_fread>
    16d4:	00040513          	mv	a0,s0
    16d8:	00004097          	auipc	ra,0x4
    16dc:	75c080e7          	jalr	1884(ra) # 5e34 <fl_fclose>
    16e0:	00002097          	auipc	ra,0x2
    16e4:	b20080e7          	jalr	-1248(ra) # 3200 <display_refresh>
    16e8:	000076b7          	lui	a3,0x7
    16ec:	9346a783          	lw	a5,-1740(a3) # 6934 <BUTTONS>
    16f0:	0007a703          	lw	a4,0(a5) # ffffc000 <__stacktop+0xfffec000>
    16f4:	000027b7          	lui	a5,0x2
    16f8:	71078793          	addi	a5,a5,1808 # 2710 <main+0x94>
    16fc:	00000013          	nop
    1700:	fff78793          	addi	a5,a5,-1
    1704:	fe079ce3          	bnez	a5,16fc <view_image_file+0x90>
    1708:	9346a683          	lw	a3,-1740(a3)
    170c:	fff74793          	not	a5,a4
    1710:	0006a703          	lw	a4,0(a3)
    1714:	00e7f7b3          	and	a5,a5,a4
    1718:	0067f793          	andi	a5,a5,6
    171c:	fe0788e3          	beqz	a5,170c <view_image_file+0xa0>
    1720:	fffff097          	auipc	ra,0xfffff
    1724:	a3c080e7          	jalr	-1476(ra) # 15c <play_click_noise>
    1728:	00002097          	auipc	ra,0x2
    172c:	95c080e7          	jalr	-1700(ra) # 3084 <display_framebuffer>
    1730:	00004637          	lui	a2,0x4
    1734:	00000593          	li	a1,0
    1738:	00001097          	auipc	ra,0x1
    173c:	6a8080e7          	jalr	1704(ra) # 2de0 <memset>
    1740:	00812403          	lw	s0,8(sp)
    1744:	00c12083          	lw	ra,12(sp)
    1748:	01010113          	addi	sp,sp,16
    174c:	00002317          	auipc	t1,0x2
    1750:	ab430067          	jr	-1356(t1) # 3200 <display_refresh>
    1754:	00c12083          	lw	ra,12(sp)
    1758:	00812403          	lw	s0,8(sp)
    175c:	01010113          	addi	sp,sp,16
    1760:	00008067          	ret

00001764 <scan_files>:
    1764:	fd010113          	addi	sp,sp,-48
    1768:	02912223          	sw	s1,36(sp)
    176c:	000074b7          	lui	s1,0x7
    1770:	02812423          	sw	s0,40(sp)
    1774:	00050593          	mv	a1,a0
    1778:	00007437          	lui	s0,0x7
    177c:	de848513          	addi	a0,s1,-536 # 6de8 <current_path>
    1780:	02112623          	sw	ra,44(sp)
    1784:	03212023          	sw	s2,32(sp)
    1788:	01312e23          	sw	s3,28(sp)
    178c:	01412c23          	sw	s4,24(sp)
    1790:	01512a23          	sw	s5,20(sp)
    1794:	01612823          	sw	s6,16(sp)
    1798:	01712623          	sw	s7,12(sp)
    179c:	fe042023          	sw	zero,-32(s0) # 6fe0 <n_items>
    17a0:	fffff097          	auipc	ra,0xfffff
    17a4:	87c080e7          	jalr	-1924(ra) # 1c <strcmp>
    17a8:	06050e63          	beqz	a0,1824 <scan_files+0xc0>
    17ac:	00007937          	lui	s2,0x7
    17b0:	06400613          	li	a2,100
    17b4:	00000593          	li	a1,0
    17b8:	12c90513          	addi	a0,s2,300 # 712c <files>
    17bc:	00001097          	auipc	ra,0x1
    17c0:	624080e7          	jalr	1572(ra) # 2de0 <memset>
    17c4:	fe042783          	lw	a5,-32(s0)
    17c8:	12c90913          	addi	s2,s2,300
    17cc:	000075b7          	lui	a1,0x7
    17d0:	00379513          	slli	a0,a5,0x3
    17d4:	40f50533          	sub	a0,a0,a5
    17d8:	00251513          	slli	a0,a0,0x2
    17dc:	40f50533          	sub	a0,a0,a5
    17e0:	00251513          	slli	a0,a0,0x2
    17e4:	00a90533          	add	a0,s2,a0
    17e8:	9c058593          	addi	a1,a1,-1600 # 69c0 <LEDS+0x7c>
    17ec:	00001097          	auipc	ra,0x1
    17f0:	6b8080e7          	jalr	1720(ra) # 2ea4 <strcpy>
    17f4:	fe042703          	lw	a4,-32(s0)
    17f8:	00371793          	slli	a5,a4,0x3
    17fc:	40e787b3          	sub	a5,a5,a4
    1800:	00279793          	slli	a5,a5,0x2
    1804:	40e787b3          	sub	a5,a5,a4
    1808:	00279793          	slli	a5,a5,0x2
    180c:	00f90933          	add	s2,s2,a5
    1810:	00100793          	li	a5,1
    1814:	00f70733          	add	a4,a4,a5
    1818:	06092223          	sw	zero,100(s2)
    181c:	06f92423          	sw	a5,104(s2)
    1820:	fee42023          	sw	a4,-32(s0)
    1824:	000079b7          	lui	s3,0x7
    1828:	12098593          	addi	a1,s3,288 # 7120 <dirstat.1>
    182c:	de848513          	addi	a0,s1,-536
    1830:	00003097          	auipc	ra,0x3
    1834:	684080e7          	jalr	1668(ra) # 4eb4 <fl_opendir>
    1838:	14050063          	beqz	a0,1978 <scan_files+0x214>
    183c:	00007937          	lui	s2,0x7
    1840:	000077b7          	lui	a5,0x7
    1844:	000074b7          	lui	s1,0x7
    1848:	a8078b93          	addi	s7,a5,-1408 # 6a80 <LEDS+0x13c>
    184c:	12c48493          	addi	s1,s1,300 # 712c <files>
    1850:	01090a13          	addi	s4,s2,16 # 7010 <dirent.0>
    1854:	01090593          	addi	a1,s2,16
    1858:	12098513          	addi	a0,s3,288
    185c:	00004097          	auipc	ra,0x4
    1860:	d24080e7          	jalr	-732(ra) # 5580 <fl_readdir>
    1864:	00050a93          	mv	s5,a0
    1868:	00051863          	bnez	a0,1878 <scan_files+0x114>
    186c:	fe042b03          	lw	s6,-32(s0)
    1870:	03f00793          	li	a5,63
    1874:	0367dc63          	bge	a5,s6,18ac <scan_files+0x148>
    1878:	02812403          	lw	s0,40(sp)
    187c:	02c12083          	lw	ra,44(sp)
    1880:	02412483          	lw	s1,36(sp)
    1884:	02012903          	lw	s2,32(sp)
    1888:	01812a03          	lw	s4,24(sp)
    188c:	01412a83          	lw	s5,20(sp)
    1890:	01012b03          	lw	s6,16(sp)
    1894:	00c12b83          	lw	s7,12(sp)
    1898:	12098513          	addi	a0,s3,288
    189c:	01c12983          	lw	s3,28(sp)
    18a0:	03010113          	addi	sp,sp,48
    18a4:	00002317          	auipc	t1,0x2
    18a8:	1f830067          	jr	504(t1) # 3a9c <fl_closedir>
    18ac:	000b8593          	mv	a1,s7
    18b0:	01090513          	addi	a0,s2,16
    18b4:	ffffe097          	auipc	ra,0xffffe
    18b8:	768080e7          	jalr	1896(ra) # 1c <strcmp>
    18bc:	f8050ce3          	beqz	a0,1854 <scan_files+0xf0>
    18c0:	000075b7          	lui	a1,0x7
    18c4:	9c058593          	addi	a1,a1,-1600 # 69c0 <LEDS+0x7c>
    18c8:	01090513          	addi	a0,s2,16
    18cc:	ffffe097          	auipc	ra,0xffffe
    18d0:	750080e7          	jalr	1872(ra) # 1c <strcmp>
    18d4:	f80500e3          	beqz	a0,1854 <scan_files+0xf0>
    18d8:	003b1513          	slli	a0,s6,0x3
    18dc:	41650533          	sub	a0,a0,s6
    18e0:	00251513          	slli	a0,a0,0x2
    18e4:	41650533          	sub	a0,a0,s6
    18e8:	00251513          	slli	a0,a0,0x2
    18ec:	06400613          	li	a2,100
    18f0:	00000593          	li	a1,0
    18f4:	00a48533          	add	a0,s1,a0
    18f8:	00001097          	auipc	ra,0x1
    18fc:	4e8080e7          	jalr	1256(ra) # 2de0 <memset>
    1900:	fe042703          	lw	a4,-32(s0)
    1904:	06300513          	li	a0,99
    1908:	00371793          	slli	a5,a4,0x3
    190c:	40e786b3          	sub	a3,a5,a4
    1910:	00269693          	slli	a3,a3,0x2
    1914:	40e686b3          	sub	a3,a3,a4
    1918:	00269693          	slli	a3,a3,0x2
    191c:	014a8633          	add	a2,s5,s4
    1920:	00064583          	lbu	a1,0(a2) # 4000 <fatfs_lfn_generate_tail+0x8>
    1924:	00058463          	beqz	a1,192c <scan_files+0x1c8>
    1928:	02aa9e63          	bne	s5,a0,1964 <scan_files+0x200>
    192c:	40e787b3          	sub	a5,a5,a4
    1930:	00279793          	slli	a5,a5,0x2
    1934:	10ca2683          	lw	a3,268(s4)
    1938:	40e787b3          	sub	a5,a5,a4
    193c:	00279793          	slli	a5,a5,0x2
    1940:	00f487b3          	add	a5,s1,a5
    1944:	06d7a223          	sw	a3,100(a5)
    1948:	104a4683          	lbu	a3,260(s4)
    194c:	01578ab3          	add	s5,a5,s5
    1950:	00170713          	addi	a4,a4,1
    1954:	000a8023          	sb	zero,0(s5)
    1958:	06d7a423          	sw	a3,104(a5)
    195c:	fee42023          	sw	a4,-32(s0)
    1960:	ef5ff06f          	j	1854 <scan_files+0xf0>
    1964:	00da8633          	add	a2,s5,a3
    1968:	00c48633          	add	a2,s1,a2
    196c:	00b60023          	sb	a1,0(a2)
    1970:	001a8a93          	addi	s5,s5,1
    1974:	fa9ff06f          	j	191c <scan_files+0x1b8>
    1978:	02c12083          	lw	ra,44(sp)
    197c:	02812403          	lw	s0,40(sp)
    1980:	02412483          	lw	s1,36(sp)
    1984:	02012903          	lw	s2,32(sp)
    1988:	01c12983          	lw	s3,28(sp)
    198c:	01812a03          	lw	s4,24(sp)
    1990:	01412a83          	lw	s5,20(sp)
    1994:	01012b03          	lw	s6,16(sp)
    1998:	00c12b83          	lw	s7,12(sp)
    199c:	03010113          	addi	sp,sp,48
    19a0:	00008067          	ret

000019a4 <go_up_directory>:
    19a4:	ff010113          	addi	sp,sp,-16
    19a8:	00812423          	sw	s0,8(sp)
    19ac:	00007437          	lui	s0,0x7
    19b0:	00112623          	sw	ra,12(sp)
    19b4:	00000793          	li	a5,0
    19b8:	de840513          	addi	a0,s0,-536 # 6de8 <current_path>
    19bc:	00a78733          	add	a4,a5,a0
    19c0:	00074683          	lbu	a3,0(a4)
    19c4:	02069a63          	bnez	a3,19f8 <go_up_directory+0x54>
    19c8:	00100693          	li	a3,1
    19cc:	02f6da63          	bge	a3,a5,1a00 <go_up_directory+0x5c>
    19d0:	02f00593          	li	a1,47
    19d4:	fe070fa3          	sb	zero,-1(a4)
    19d8:	ffffe097          	auipc	ra,0xffffe
    19dc:	668080e7          	jalr	1640(ra) # 40 <strrchr>
    19e0:	02050063          	beqz	a0,1a00 <go_up_directory+0x5c>
    19e4:	000500a3          	sb	zero,1(a0)
    19e8:	00c12083          	lw	ra,12(sp)
    19ec:	00812403          	lw	s0,8(sp)
    19f0:	01010113          	addi	sp,sp,16
    19f4:	00008067          	ret
    19f8:	00178793          	addi	a5,a5,1
    19fc:	fc1ff06f          	j	19bc <go_up_directory+0x18>
    1a00:	de840513          	addi	a0,s0,-536
    1a04:	00812403          	lw	s0,8(sp)
    1a08:	00c12083          	lw	ra,12(sp)
    1a0c:	000075b7          	lui	a1,0x7
    1a10:	a8458593          	addi	a1,a1,-1404 # 6a84 <LEDS+0x140>
    1a14:	01010113          	addi	sp,sp,16
    1a18:	00001317          	auipc	t1,0x1
    1a1c:	48c30067          	jr	1164(t1) # 2ea4 <strcpy>

00001a20 <build_full_path>:
    1a20:	ff010113          	addi	sp,sp,-16
    1a24:	00912223          	sw	s1,4(sp)
    1a28:	00058493          	mv	s1,a1
    1a2c:	000075b7          	lui	a1,0x7
    1a30:	de858593          	addi	a1,a1,-536 # 6de8 <current_path>
    1a34:	00812423          	sw	s0,8(sp)
    1a38:	00112623          	sw	ra,12(sp)
    1a3c:	00050413          	mv	s0,a0
    1a40:	00001097          	auipc	ra,0x1
    1a44:	464080e7          	jalr	1124(ra) # 2ea4 <strcpy>
    1a48:	00044783          	lbu	a5,0(s0)
    1a4c:	02079263          	bnez	a5,1a70 <build_full_path+0x50>
    1a50:	0004c783          	lbu	a5,0(s1)
    1a54:	02079263          	bnez	a5,1a78 <build_full_path+0x58>
    1a58:	00040023          	sb	zero,0(s0)
    1a5c:	00c12083          	lw	ra,12(sp)
    1a60:	00812403          	lw	s0,8(sp)
    1a64:	00412483          	lw	s1,4(sp)
    1a68:	01010113          	addi	sp,sp,16
    1a6c:	00008067          	ret
    1a70:	00140413          	addi	s0,s0,1
    1a74:	fd5ff06f          	j	1a48 <build_full_path+0x28>
    1a78:	00140413          	addi	s0,s0,1
    1a7c:	00148493          	addi	s1,s1,1
    1a80:	fef40fa3          	sb	a5,-1(s0)
    1a84:	fcdff06f          	j	1a50 <build_full_path+0x30>

00001a88 <file_explorer>:
    1a88:	db010113          	addi	sp,sp,-592
    1a8c:	24112623          	sw	ra,588(sp)
    1a90:	24812423          	sw	s0,584(sp)
    1a94:	25212023          	sw	s2,576(sp)
    1a98:	23312e23          	sw	s3,572(sp)
    1a9c:	23512a23          	sw	s5,564(sp)
    1aa0:	23612823          	sw	s6,560(sp)
    1aa4:	23912223          	sw	s9,548(sp)
    1aa8:	24912223          	sw	s1,580(sp)
    1aac:	23412c23          	sw	s4,568(sp)
    1ab0:	23712623          	sw	s7,556(sp)
    1ab4:	23812423          	sw	s8,552(sp)
    1ab8:	23a12023          	sw	s10,544(sp)
    1abc:	21b12e23          	sw	s11,540(sp)
    1ac0:	00001097          	auipc	ra,0x1
    1ac4:	5c4080e7          	jalr	1476(ra) # 3084 <display_framebuffer>
    1ac8:	00004637          	lui	a2,0x4
    1acc:	00000593          	li	a1,0
    1ad0:	00001097          	auipc	ra,0x1
    1ad4:	310080e7          	jalr	784(ra) # 2de0 <memset>
    1ad8:	00001097          	auipc	ra,0x1
    1adc:	728080e7          	jalr	1832(ra) # 3200 <display_refresh>
    1ae0:	00007b37          	lui	s6,0x7
    1ae4:	00007ab7          	lui	s5,0x7
    1ae8:	a84b0593          	addi	a1,s6,-1404 # 6a84 <LEDS+0x140>
    1aec:	de8a8513          	addi	a0,s5,-536 # 6de8 <current_path>
    1af0:	00001097          	auipc	ra,0x1
    1af4:	3b4080e7          	jalr	948(ra) # 2ea4 <strcpy>
    1af8:	a84b0513          	addi	a0,s6,-1404
    1afc:	00000097          	auipc	ra,0x0
    1b00:	c68080e7          	jalr	-920(ra) # 1764 <scan_files>
    1b04:	000077b7          	lui	a5,0x7
    1b08:	a8878793          	addi	a5,a5,-1400 # 6a88 <LEDS+0x144>
    1b0c:	00f12623          	sw	a5,12(sp)
    1b10:	000077b7          	lui	a5,0x7
    1b14:	9347a783          	lw	a5,-1740(a5) # 6934 <BUTTONS>
    1b18:	00000c93          	li	s9,0
    1b1c:	00000993          	li	s3,0
    1b20:	00000913          	li	s2,0
    1b24:	00000413          	li	s0,0
    1b28:	de8a8a93          	addi	s5,s5,-536
    1b2c:	00f12023          	sw	a5,0(sp)
    1b30:	00000593          	li	a1,0
    1b34:	00000513          	li	a0,0
    1b38:	00001097          	auipc	ra,0x1
    1b3c:	558080e7          	jalr	1368(ra) # 3090 <display_set_cursor>
    1b40:	0ffcf593          	zext.b	a1,s9
    1b44:	07f58513          	addi	a0,a1,127
    1b48:	0ff57513          	zext.b	a0,a0
    1b4c:	00001097          	auipc	ra,0x1
    1b50:	558080e7          	jalr	1368(ra) # 30a4 <display_set_front_back_color>
    1b54:	00c12503          	lw	a0,12(sp)
    1b58:	00000493          	li	s1,0
    1b5c:	00007c37          	lui	s8,0x7
    1b60:	00002097          	auipc	ra,0x2
    1b64:	80c080e7          	jalr	-2036(ra) # 336c <printf>
    1b68:	00c00a13          	li	s4,12
    1b6c:	015487b3          	add	a5,s1,s5
    1b70:	0007c503          	lbu	a0,0(a5)
    1b74:	00050a63          	beqz	a0,1b88 <file_explorer+0x100>
    1b78:	ff4c2783          	lw	a5,-12(s8) # 6ff4 <f_putchar>
    1b7c:	00148493          	addi	s1,s1,1
    1b80:	000780e7          	jalr	a5
    1b84:	ff4494e3          	bne	s1,s4,1b6c <file_explorer+0xe4>
    1b88:	ff4c2783          	lw	a5,-12(s8)
    1b8c:	00a00513          	li	a0,10
    1b90:	00007db7          	lui	s11,0x7
    1b94:	000780e7          	jalr	a5
    1b98:	00000593          	li	a1,0
    1b9c:	0ff00513          	li	a0,255
    1ba0:	00001097          	auipc	ra,0x1
    1ba4:	504080e7          	jalr	1284(ra) # 30a4 <display_set_front_back_color>
    1ba8:	fe0daa03          	lw	s4,-32(s11) # 6fe0 <n_items>
    1bac:	080a0463          	beqz	s4,1c34 <file_explorer+0x1ac>
    1bb0:	412a0a33          	sub	s4,s4,s2
    1bb4:	00f00793          	li	a5,15
    1bb8:	0147d463          	bge	a5,s4,1bc0 <file_explorer+0x138>
    1bbc:	00078a13          	mv	s4,a5
    1bc0:	00391493          	slli	s1,s2,0x3
    1bc4:	412484b3          	sub	s1,s1,s2
    1bc8:	00249493          	slli	s1,s1,0x2
    1bcc:	412484b3          	sub	s1,s1,s2
    1bd0:	000077b7          	lui	a5,0x7
    1bd4:	12c78793          	addi	a5,a5,300 # 712c <files>
    1bd8:	00249493          	slli	s1,s1,0x2
    1bdc:	00f484b3          	add	s1,s1,a5
    1be0:	000077b7          	lui	a5,0x7
    1be4:	aa478793          	addi	a5,a5,-1372 # 6aa4 <LEDS+0x160>
    1be8:	00f12223          	sw	a5,4(sp)
    1bec:	000077b7          	lui	a5,0x7
    1bf0:	a9c78793          	addi	a5,a5,-1380 # 6a9c <LEDS+0x158>
    1bf4:	00000b93          	li	s7,0
    1bf8:	00f12423          	sw	a5,8(sp)
    1bfc:	194bc863          	blt	s7,s4,1d8c <file_explorer+0x304>
    1c00:	00000593          	li	a1,0
    1c04:	00000513          	li	a0,0
    1c08:	000074b7          	lui	s1,0x7
    1c0c:	00001097          	auipc	ra,0x1
    1c10:	498080e7          	jalr	1176(ra) # 30a4 <display_set_front_back_color>
    1c14:	00f00b93          	li	s7,15
    1c18:	aac48493          	addi	s1,s1,-1364 # 6aac <LEDS+0x168>
    1c1c:	037a0463          	beq	s4,s7,1c44 <file_explorer+0x1bc>
    1c20:	00048513          	mv	a0,s1
    1c24:	00001097          	auipc	ra,0x1
    1c28:	748080e7          	jalr	1864(ra) # 336c <printf>
    1c2c:	001a0a13          	addi	s4,s4,1
    1c30:	fedff06f          	j	1c1c <file_explorer+0x194>
    1c34:	00007537          	lui	a0,0x7
    1c38:	a9450513          	addi	a0,a0,-1388 # 6a94 <LEDS+0x150>
    1c3c:	00001097          	auipc	ra,0x1
    1c40:	730080e7          	jalr	1840(ra) # 336c <printf>
    1c44:	00001097          	auipc	ra,0x1
    1c48:	5bc080e7          	jalr	1468(ra) # 3200 <display_refresh>
    1c4c:	00012783          	lw	a5,0(sp)
    1c50:	fff9c993          	not	s3,s3
    1c54:	0007aa03          	lw	s4,0(a5)
    1c58:	0149f9b3          	and	s3,s3,s4
    1c5c:	0109f793          	andi	a5,s3,16
    1c60:	00078863          	beqz	a5,1c70 <file_explorer+0x1e8>
    1c64:	00140413          	addi	s0,s0,1
    1c68:	ffffe097          	auipc	ra,0xffffe
    1c6c:	4f4080e7          	jalr	1268(ra) # 15c <play_click_noise>
    1c70:	0089f793          	andi	a5,s3,8
    1c74:	00078863          	beqz	a5,1c84 <file_explorer+0x1fc>
    1c78:	fff40413          	addi	s0,s0,-1
    1c7c:	ffffe097          	auipc	ra,0xffffe
    1c80:	4e0080e7          	jalr	1248(ra) # 15c <play_click_noise>
    1c84:	0029f793          	andi	a5,s3,2
    1c88:	04078a63          	beqz	a5,1cdc <file_explorer+0x254>
    1c8c:	ffffe097          	auipc	ra,0xffffe
    1c90:	4d0080e7          	jalr	1232(ra) # 15c <play_click_noise>
    1c94:	a84b0593          	addi	a1,s6,-1404
    1c98:	000a8513          	mv	a0,s5
    1c9c:	ffffe097          	auipc	ra,0xffffe
    1ca0:	380080e7          	jalr	896(ra) # 1c <strcmp>
    1ca4:	20050e63          	beqz	a0,1ec0 <file_explorer+0x438>
    1ca8:	00000097          	auipc	ra,0x0
    1cac:	cfc080e7          	jalr	-772(ra) # 19a4 <go_up_directory>
    1cb0:	a84b0513          	addi	a0,s6,-1404
    1cb4:	00000097          	auipc	ra,0x0
    1cb8:	ab0080e7          	jalr	-1360(ra) # 1764 <scan_files>
    1cbc:	00001097          	auipc	ra,0x1
    1cc0:	3c8080e7          	jalr	968(ra) # 3084 <display_framebuffer>
    1cc4:	00004637          	lui	a2,0x4
    1cc8:	00000593          	li	a1,0
    1ccc:	00001097          	auipc	ra,0x1
    1cd0:	114080e7          	jalr	276(ra) # 2de0 <memset>
    1cd4:	00000913          	li	s2,0
    1cd8:	00000413          	li	s0,0
    1cdc:	0049f993          	andi	s3,s3,4
    1ce0:	007c8c93          	addi	s9,s9,7
    1ce4:	08098063          	beqz	s3,1d64 <file_explorer+0x2dc>
    1ce8:	00341493          	slli	s1,s0,0x3
    1cec:	408484b3          	sub	s1,s1,s0
    1cf0:	ffffe097          	auipc	ra,0xffffe
    1cf4:	46c080e7          	jalr	1132(ra) # 15c <play_click_noise>
    1cf8:	00249493          	slli	s1,s1,0x2
    1cfc:	408484b3          	sub	s1,s1,s0
    1d00:	000077b7          	lui	a5,0x7
    1d04:	12c78793          	addi	a5,a5,300 # 712c <files>
    1d08:	00249493          	slli	s1,s1,0x2
    1d0c:	00f484b3          	add	s1,s1,a5
    1d10:	0684a783          	lw	a5,104(s1)
    1d14:	12078a63          	beqz	a5,1e48 <file_explorer+0x3c0>
    1d18:	000075b7          	lui	a1,0x7
    1d1c:	9c058593          	addi	a1,a1,-1600 # 69c0 <LEDS+0x7c>
    1d20:	00048513          	mv	a0,s1
    1d24:	ffffe097          	auipc	ra,0xffffe
    1d28:	2f8080e7          	jalr	760(ra) # 1c <strcmp>
    1d2c:	10051263          	bnez	a0,1e30 <file_explorer+0x3a8>
    1d30:	00000097          	auipc	ra,0x0
    1d34:	c74080e7          	jalr	-908(ra) # 19a4 <go_up_directory>
    1d38:	a84b0513          	addi	a0,s6,-1404
    1d3c:	00000097          	auipc	ra,0x0
    1d40:	a28080e7          	jalr	-1496(ra) # 1764 <scan_files>
    1d44:	00001097          	auipc	ra,0x1
    1d48:	340080e7          	jalr	832(ra) # 3084 <display_framebuffer>
    1d4c:	00004637          	lui	a2,0x4
    1d50:	00000593          	li	a1,0
    1d54:	00001097          	auipc	ra,0x1
    1d58:	08c080e7          	jalr	140(ra) # 2de0 <memset>
    1d5c:	00000913          	li	s2,0
    1d60:	00000413          	li	s0,0
    1d64:	fe0da783          	lw	a5,-32(s11)
    1d68:	00f05e63          	blez	a5,1d84 <file_explorer+0x2fc>
    1d6c:	12045e63          	bgez	s0,1ea8 <file_explorer+0x420>
    1d70:	fff78413          	addi	s0,a5,-1
    1d74:	15244263          	blt	s0,s2,1eb8 <file_explorer+0x430>
    1d78:	00e90793          	addi	a5,s2,14
    1d7c:	0087d463          	bge	a5,s0,1d84 <file_explorer+0x2fc>
    1d80:	ff240913          	addi	s2,s0,-14
    1d84:	000a0993          	mv	s3,s4
    1d88:	da9ff06f          	j	1b30 <file_explorer+0xa8>
    1d8c:	012b8d33          	add	s10,s7,s2
    1d90:	07a41463          	bne	s0,s10,1df8 <file_explorer+0x370>
    1d94:	0ff00593          	li	a1,255
    1d98:	00000513          	li	a0,0
    1d9c:	00001097          	auipc	ra,0x1
    1da0:	308080e7          	jalr	776(ra) # 30a4 <display_set_front_back_color>
    1da4:	0684a783          	lw	a5,104(s1)
    1da8:	000d0593          	mv	a1,s10
    1dac:	04078c63          	beqz	a5,1e04 <file_explorer+0x37c>
    1db0:	00812503          	lw	a0,8(sp)
    1db4:	00001097          	auipc	ra,0x1
    1db8:	5b8080e7          	jalr	1464(ra) # 336c <printf>
    1dbc:	00000d13          	li	s10,0
    1dc0:	01a487b3          	add	a5,s1,s10
    1dc4:	0007c503          	lbu	a0,0(a5)
    1dc8:	00050c63          	beqz	a0,1de0 <file_explorer+0x358>
    1dcc:	ff4c2783          	lw	a5,-12(s8)
    1dd0:	001d0d13          	addi	s10,s10,1
    1dd4:	000780e7          	jalr	a5
    1dd8:	01200793          	li	a5,18
    1ddc:	fefd12e3          	bne	s10,a5,1dc0 <file_explorer+0x338>
    1de0:	ff4c2783          	lw	a5,-12(s8)
    1de4:	00a00513          	li	a0,10
    1de8:	001b8b93          	addi	s7,s7,1
    1dec:	000780e7          	jalr	a5
    1df0:	06c48493          	addi	s1,s1,108
    1df4:	e09ff06f          	j	1bfc <file_explorer+0x174>
    1df8:	00000593          	li	a1,0
    1dfc:	0ff00513          	li	a0,255
    1e00:	f9dff06f          	j	1d9c <file_explorer+0x314>
    1e04:	00412503          	lw	a0,4(sp)
    1e08:	fadff06f          	j	1db4 <file_explorer+0x32c>
    1e0c:	00178793          	addi	a5,a5,1
    1e10:	0007c703          	lbu	a4,0(a5)
    1e14:	fe071ce3          	bnez	a4,1e0c <file_explorer+0x384>
    1e18:	0004c703          	lbu	a4,0(s1)
    1e1c:	00071e63          	bnez	a4,1e38 <file_explorer+0x3b0>
    1e20:	02f00713          	li	a4,47
    1e24:	00e78023          	sb	a4,0(a5)
    1e28:	000780a3          	sb	zero,1(a5)
    1e2c:	f0dff06f          	j	1d38 <file_explorer+0x2b0>
    1e30:	000a8793          	mv	a5,s5
    1e34:	fddff06f          	j	1e10 <file_explorer+0x388>
    1e38:	00178793          	addi	a5,a5,1
    1e3c:	00148493          	addi	s1,s1,1
    1e40:	fee78fa3          	sb	a4,-1(a5)
    1e44:	fd5ff06f          	j	1e18 <file_explorer+0x390>
    1e48:	00048593          	mv	a1,s1
    1e4c:	01c10513          	addi	a0,sp,28
    1e50:	00000097          	auipc	ra,0x0
    1e54:	bd0080e7          	jalr	-1072(ra) # 1a20 <build_full_path>
    1e58:	0644a603          	lw	a2,100(s1)
    1e5c:	000047b7          	lui	a5,0x4
    1e60:	02f61a63          	bne	a2,a5,1e94 <file_explorer+0x40c>
    1e64:	01c10513          	addi	a0,sp,28
    1e68:	00000097          	auipc	ra,0x0
    1e6c:	804080e7          	jalr	-2044(ra) # 166c <view_image_file>
    1e70:	00001097          	auipc	ra,0x1
    1e74:	214080e7          	jalr	532(ra) # 3084 <display_framebuffer>
    1e78:	00004637          	lui	a2,0x4
    1e7c:	00000593          	li	a1,0
    1e80:	00001097          	auipc	ra,0x1
    1e84:	f60080e7          	jalr	-160(ra) # 2de0 <memset>
    1e88:	00012783          	lw	a5,0(sp)
    1e8c:	0007a783          	lw	a5,0(a5) # 4000 <fatfs_lfn_generate_tail+0x8>
    1e90:	ed5ff06f          	j	1d64 <file_explorer+0x2dc>
    1e94:	00048593          	mv	a1,s1
    1e98:	01c10513          	addi	a0,sp,28
    1e9c:	fffff097          	auipc	ra,0xfffff
    1ea0:	e5c080e7          	jalr	-420(ra) # cf8 <play_music_with_controls>
    1ea4:	fcdff06f          	j	1e70 <file_explorer+0x3e8>
    1ea8:	00f427b3          	slt	a5,s0,a5
    1eac:	40f007b3          	neg	a5,a5
    1eb0:	00f47433          	and	s0,s0,a5
    1eb4:	ec1ff06f          	j	1d74 <file_explorer+0x2ec>
    1eb8:	00040913          	mv	s2,s0
    1ebc:	ec9ff06f          	j	1d84 <file_explorer+0x2fc>
    1ec0:	24c12083          	lw	ra,588(sp)
    1ec4:	24812403          	lw	s0,584(sp)
    1ec8:	24412483          	lw	s1,580(sp)
    1ecc:	24012903          	lw	s2,576(sp)
    1ed0:	23c12983          	lw	s3,572(sp)
    1ed4:	23812a03          	lw	s4,568(sp)
    1ed8:	23412a83          	lw	s5,564(sp)
    1edc:	23012b03          	lw	s6,560(sp)
    1ee0:	22c12b83          	lw	s7,556(sp)
    1ee4:	22812c03          	lw	s8,552(sp)
    1ee8:	22412c83          	lw	s9,548(sp)
    1eec:	22012d03          	lw	s10,544(sp)
    1ef0:	21c12d83          	lw	s11,540(sp)
    1ef4:	25010113          	addi	sp,sp,592
    1ef8:	00008067          	ret

00001efc <music_player_generic>:
    1efc:	da010113          	addi	sp,sp,-608
    1f00:	24112e23          	sw	ra,604(sp)
    1f04:	24812c23          	sw	s0,600(sp)
    1f08:	25212823          	sw	s2,592(sp)
    1f0c:	25312623          	sw	s3,588(sp)
    1f10:	25512223          	sw	s5,580(sp)
    1f14:	23912a23          	sw	s9,564(sp)
    1f18:	24912a23          	sw	s1,596(sp)
    1f1c:	25412423          	sw	s4,584(sp)
    1f20:	25612023          	sw	s6,576(sp)
    1f24:	23712e23          	sw	s7,572(sp)
    1f28:	23812c23          	sw	s8,568(sp)
    1f2c:	23a12823          	sw	s10,560(sp)
    1f30:	23b12623          	sw	s11,556(sp)
    1f34:	00a12823          	sw	a0,16(sp)
    1f38:	00001097          	auipc	ra,0x1
    1f3c:	14c080e7          	jalr	332(ra) # 3084 <display_framebuffer>
    1f40:	00004637          	lui	a2,0x4
    1f44:	00000593          	li	a1,0
    1f48:	00001097          	auipc	ra,0x1
    1f4c:	e98080e7          	jalr	-360(ra) # 2de0 <memset>
    1f50:	00001097          	auipc	ra,0x1
    1f54:	2b0080e7          	jalr	688(ra) # 3200 <display_refresh>
    1f58:	00007ab7          	lui	s5,0x7
    1f5c:	000079b7          	lui	s3,0x7
    1f60:	ac4a8593          	addi	a1,s5,-1340 # 6ac4 <LEDS+0x180>
    1f64:	de898513          	addi	a0,s3,-536 # 6de8 <current_path>
    1f68:	00001097          	auipc	ra,0x1
    1f6c:	f3c080e7          	jalr	-196(ra) # 2ea4 <strcpy>
    1f70:	ac4a8513          	addi	a0,s5,-1340
    1f74:	fffff097          	auipc	ra,0xfffff
    1f78:	7f0080e7          	jalr	2032(ra) # 1764 <scan_files>
    1f7c:	000077b7          	lui	a5,0x7
    1f80:	adc78793          	addi	a5,a5,-1316 # 6adc <LEDS+0x198>
    1f84:	00f12e23          	sw	a5,28(sp)
    1f88:	000077b7          	lui	a5,0x7
    1f8c:	9347a783          	lw	a5,-1740(a5) # 6934 <BUTTONS>
    1f90:	00000c93          	li	s9,0
    1f94:	00012423          	sw	zero,8(sp)
    1f98:	00000913          	li	s2,0
    1f9c:	00000413          	li	s0,0
    1fa0:	00f12623          	sw	a5,12(sp)
    1fa4:	00000593          	li	a1,0
    1fa8:	00000513          	li	a0,0
    1fac:	00001097          	auipc	ra,0x1
    1fb0:	0e4080e7          	jalr	228(ra) # 3090 <display_set_cursor>
    1fb4:	0ffcf593          	zext.b	a1,s9
    1fb8:	07f58513          	addi	a0,a1,127
    1fbc:	0ff57513          	zext.b	a0,a0
    1fc0:	00001097          	auipc	ra,0x1
    1fc4:	0e4080e7          	jalr	228(ra) # 30a4 <display_set_front_back_color>
    1fc8:	01012783          	lw	a5,16(sp)
    1fcc:	0e078663          	beqz	a5,20b8 <music_player_generic+0x1bc>
    1fd0:	00007537          	lui	a0,0x7
    1fd4:	ad050513          	addi	a0,a0,-1328 # 6ad0 <LEDS+0x18c>
    1fd8:	00001097          	auipc	ra,0x1
    1fdc:	394080e7          	jalr	916(ra) # 336c <printf>
    1fe0:	00000493          	li	s1,0
    1fe4:	de898d93          	addi	s11,s3,-536
    1fe8:	00007c37          	lui	s8,0x7
    1fec:	00c00a13          	li	s4,12
    1ff0:	01b487b3          	add	a5,s1,s11
    1ff4:	0007c503          	lbu	a0,0(a5)
    1ff8:	00050a63          	beqz	a0,200c <music_player_generic+0x110>
    1ffc:	ff4c2783          	lw	a5,-12(s8) # 6ff4 <f_putchar>
    2000:	00148493          	addi	s1,s1,1
    2004:	000780e7          	jalr	a5
    2008:	ff4494e3          	bne	s1,s4,1ff0 <music_player_generic+0xf4>
    200c:	ff4c2783          	lw	a5,-12(s8)
    2010:	00a00513          	li	a0,10
    2014:	00007b37          	lui	s6,0x7
    2018:	000780e7          	jalr	a5
    201c:	00000593          	li	a1,0
    2020:	0ff00513          	li	a0,255
    2024:	00001097          	auipc	ra,0x1
    2028:	080080e7          	jalr	128(ra) # 30a4 <display_set_front_back_color>
    202c:	fe0b2a03          	lw	s4,-32(s6) # 6fe0 <n_items>
    2030:	080a0863          	beqz	s4,20c0 <music_player_generic+0x1c4>
    2034:	412a0a33          	sub	s4,s4,s2
    2038:	00f00793          	li	a5,15
    203c:	0147d463          	bge	a5,s4,2044 <music_player_generic+0x148>
    2040:	00078a13          	mv	s4,a5
    2044:	00391493          	slli	s1,s2,0x3
    2048:	412484b3          	sub	s1,s1,s2
    204c:	00249493          	slli	s1,s1,0x2
    2050:	412484b3          	sub	s1,s1,s2
    2054:	000077b7          	lui	a5,0x7
    2058:	12c78793          	addi	a5,a5,300 # 712c <files>
    205c:	00249493          	slli	s1,s1,0x2
    2060:	00f484b3          	add	s1,s1,a5
    2064:	000077b7          	lui	a5,0x7
    2068:	aa478793          	addi	a5,a5,-1372 # 6aa4 <LEDS+0x160>
    206c:	00f12a23          	sw	a5,20(sp)
    2070:	000077b7          	lui	a5,0x7
    2074:	a9c78793          	addi	a5,a5,-1380 # 6a9c <LEDS+0x158>
    2078:	00000b93          	li	s7,0
    207c:	00f12c23          	sw	a5,24(sp)
    2080:	1f4bc463          	blt	s7,s4,2268 <music_player_generic+0x36c>
    2084:	00000593          	li	a1,0
    2088:	00000513          	li	a0,0
    208c:	000074b7          	lui	s1,0x7
    2090:	00001097          	auipc	ra,0x1
    2094:	014080e7          	jalr	20(ra) # 30a4 <display_set_front_back_color>
    2098:	00f00b93          	li	s7,15
    209c:	aac48493          	addi	s1,s1,-1364 # 6aac <LEDS+0x168>
    20a0:	037a0863          	beq	s4,s7,20d0 <music_player_generic+0x1d4>
    20a4:	00048513          	mv	a0,s1
    20a8:	00001097          	auipc	ra,0x1
    20ac:	2c4080e7          	jalr	708(ra) # 336c <printf>
    20b0:	001a0a13          	addi	s4,s4,1
    20b4:	fedff06f          	j	20a0 <music_player_generic+0x1a4>
    20b8:	01c12503          	lw	a0,28(sp)
    20bc:	f1dff06f          	j	1fd8 <music_player_generic+0xdc>
    20c0:	00007537          	lui	a0,0x7
    20c4:	a9450513          	addi	a0,a0,-1388 # 6a94 <LEDS+0x150>
    20c8:	00001097          	auipc	ra,0x1
    20cc:	2a4080e7          	jalr	676(ra) # 336c <printf>
    20d0:	00001097          	auipc	ra,0x1
    20d4:	130080e7          	jalr	304(ra) # 3200 <display_refresh>
    20d8:	00c12783          	lw	a5,12(sp)
    20dc:	0007a483          	lw	s1,0(a5)
    20e0:	00812783          	lw	a5,8(sp)
    20e4:	fff7ca13          	not	s4,a5
    20e8:	009a7a33          	and	s4,s4,s1
    20ec:	010a7793          	andi	a5,s4,16
    20f0:	00078863          	beqz	a5,2100 <music_player_generic+0x204>
    20f4:	00140413          	addi	s0,s0,1
    20f8:	ffffe097          	auipc	ra,0xffffe
    20fc:	064080e7          	jalr	100(ra) # 15c <play_click_noise>
    2100:	008a7793          	andi	a5,s4,8
    2104:	00078863          	beqz	a5,2114 <music_player_generic+0x218>
    2108:	fff40413          	addi	s0,s0,-1
    210c:	ffffe097          	auipc	ra,0xffffe
    2110:	050080e7          	jalr	80(ra) # 15c <play_click_noise>
    2114:	002a7793          	andi	a5,s4,2
    2118:	06078c63          	beqz	a5,2190 <music_player_generic+0x294>
    211c:	ffffe097          	auipc	ra,0xffffe
    2120:	040080e7          	jalr	64(ra) # 15c <play_click_noise>
    2124:	ac4a8593          	addi	a1,s5,-1340
    2128:	de898513          	addi	a0,s3,-536
    212c:	ffffe097          	auipc	ra,0xffffe
    2130:	ef0080e7          	jalr	-272(ra) # 1c <strcmp>
    2134:	2e050c63          	beqz	a0,242c <music_player_generic+0x530>
    2138:	00000097          	auipc	ra,0x0
    213c:	86c080e7          	jalr	-1940(ra) # 19a4 <go_up_directory>
    2140:	ac4a8593          	addi	a1,s5,-1340
    2144:	de898513          	addi	a0,s3,-536
    2148:	ffffe097          	auipc	ra,0xffffe
    214c:	f1c080e7          	jalr	-228(ra) # 64 <starts_with>
    2150:	00051a63          	bnez	a0,2164 <music_player_generic+0x268>
    2154:	ac4a8593          	addi	a1,s5,-1340
    2158:	de898513          	addi	a0,s3,-536
    215c:	00001097          	auipc	ra,0x1
    2160:	d48080e7          	jalr	-696(ra) # 2ea4 <strcpy>
    2164:	de898513          	addi	a0,s3,-536
    2168:	fffff097          	auipc	ra,0xfffff
    216c:	5fc080e7          	jalr	1532(ra) # 1764 <scan_files>
    2170:	00001097          	auipc	ra,0x1
    2174:	f14080e7          	jalr	-236(ra) # 3084 <display_framebuffer>
    2178:	00004637          	lui	a2,0x4
    217c:	00000593          	li	a1,0
    2180:	00001097          	auipc	ra,0x1
    2184:	c60080e7          	jalr	-928(ra) # 2de0 <memset>
    2188:	00000913          	li	s2,0
    218c:	00000413          	li	s0,0
    2190:	004a7a13          	andi	s4,s4,4
    2194:	007c8c93          	addi	s9,s9,7
    2198:	0a0a0463          	beqz	s4,2240 <music_player_generic+0x344>
    219c:	ffffe097          	auipc	ra,0xffffe
    21a0:	fc0080e7          	jalr	-64(ra) # 15c <play_click_noise>
    21a4:	00341793          	slli	a5,s0,0x3
    21a8:	408787b3          	sub	a5,a5,s0
    21ac:	00279793          	slli	a5,a5,0x2
    21b0:	00007a37          	lui	s4,0x7
    21b4:	408787b3          	sub	a5,a5,s0
    21b8:	12ca0a13          	addi	s4,s4,300 # 712c <files>
    21bc:	00279793          	slli	a5,a5,0x2
    21c0:	00fa07b3          	add	a5,s4,a5
    21c4:	0687a703          	lw	a4,104(a5)
    21c8:	14070e63          	beqz	a4,2324 <music_player_generic+0x428>
    21cc:	000075b7          	lui	a1,0x7
    21d0:	9c058593          	addi	a1,a1,-1600 # 69c0 <LEDS+0x7c>
    21d4:	00078513          	mv	a0,a5
    21d8:	00078413          	mv	s0,a5
    21dc:	ffffe097          	auipc	ra,0xffffe
    21e0:	e40080e7          	jalr	-448(ra) # 1c <strcmp>
    21e4:	12051463          	bnez	a0,230c <music_player_generic+0x410>
    21e8:	fffff097          	auipc	ra,0xfffff
    21ec:	7bc080e7          	jalr	1980(ra) # 19a4 <go_up_directory>
    21f0:	ac4a8593          	addi	a1,s5,-1340
    21f4:	de898513          	addi	a0,s3,-536
    21f8:	ffffe097          	auipc	ra,0xffffe
    21fc:	e6c080e7          	jalr	-404(ra) # 64 <starts_with>
    2200:	00051a63          	bnez	a0,2214 <music_player_generic+0x318>
    2204:	ac4a8593          	addi	a1,s5,-1340
    2208:	de898513          	addi	a0,s3,-536
    220c:	00001097          	auipc	ra,0x1
    2210:	c98080e7          	jalr	-872(ra) # 2ea4 <strcpy>
    2214:	de898513          	addi	a0,s3,-536
    2218:	fffff097          	auipc	ra,0xfffff
    221c:	54c080e7          	jalr	1356(ra) # 1764 <scan_files>
    2220:	00001097          	auipc	ra,0x1
    2224:	e64080e7          	jalr	-412(ra) # 3084 <display_framebuffer>
    2228:	00004637          	lui	a2,0x4
    222c:	00000593          	li	a1,0
    2230:	00001097          	auipc	ra,0x1
    2234:	bb0080e7          	jalr	-1104(ra) # 2de0 <memset>
    2238:	00000913          	li	s2,0
    223c:	00000413          	li	s0,0
    2240:	fe0b2783          	lw	a5,-32(s6)
    2244:	00f05e63          	blez	a5,2260 <music_player_generic+0x364>
    2248:	1c045663          	bgez	s0,2414 <music_player_generic+0x518>
    224c:	fff78413          	addi	s0,a5,-1
    2250:	1d244a63          	blt	s0,s2,2424 <music_player_generic+0x528>
    2254:	00e90793          	addi	a5,s2,14
    2258:	0087d463          	bge	a5,s0,2260 <music_player_generic+0x364>
    225c:	ff240913          	addi	s2,s0,-14
    2260:	00912423          	sw	s1,8(sp)
    2264:	d41ff06f          	j	1fa4 <music_player_generic+0xa8>
    2268:	012b8d33          	add	s10,s7,s2
    226c:	07a41463          	bne	s0,s10,22d4 <music_player_generic+0x3d8>
    2270:	0ff00593          	li	a1,255
    2274:	00000513          	li	a0,0
    2278:	00001097          	auipc	ra,0x1
    227c:	e2c080e7          	jalr	-468(ra) # 30a4 <display_set_front_back_color>
    2280:	0684a783          	lw	a5,104(s1)
    2284:	000d0593          	mv	a1,s10
    2288:	04078c63          	beqz	a5,22e0 <music_player_generic+0x3e4>
    228c:	01812503          	lw	a0,24(sp)
    2290:	00001097          	auipc	ra,0x1
    2294:	0dc080e7          	jalr	220(ra) # 336c <printf>
    2298:	00000d13          	li	s10,0
    229c:	01a487b3          	add	a5,s1,s10
    22a0:	0007c503          	lbu	a0,0(a5)
    22a4:	00050c63          	beqz	a0,22bc <music_player_generic+0x3c0>
    22a8:	ff4c2783          	lw	a5,-12(s8)
    22ac:	001d0d13          	addi	s10,s10,1
    22b0:	000780e7          	jalr	a5
    22b4:	01200793          	li	a5,18
    22b8:	fefd12e3          	bne	s10,a5,229c <music_player_generic+0x3a0>
    22bc:	ff4c2783          	lw	a5,-12(s8)
    22c0:	00a00513          	li	a0,10
    22c4:	001b8b93          	addi	s7,s7,1
    22c8:	000780e7          	jalr	a5
    22cc:	06c48493          	addi	s1,s1,108
    22d0:	db1ff06f          	j	2080 <music_player_generic+0x184>
    22d4:	00000593          	li	a1,0
    22d8:	0ff00513          	li	a0,255
    22dc:	f9dff06f          	j	2278 <music_player_generic+0x37c>
    22e0:	01412503          	lw	a0,20(sp)
    22e4:	fadff06f          	j	2290 <music_player_generic+0x394>
    22e8:	00178793          	addi	a5,a5,1
    22ec:	0007c703          	lbu	a4,0(a5)
    22f0:	fe071ce3          	bnez	a4,22e8 <music_player_generic+0x3ec>
    22f4:	00044703          	lbu	a4,0(s0)
    22f8:	00071e63          	bnez	a4,2314 <music_player_generic+0x418>
    22fc:	02f00713          	li	a4,47
    2300:	00e78023          	sb	a4,0(a5)
    2304:	000780a3          	sb	zero,1(a5)
    2308:	f0dff06f          	j	2214 <music_player_generic+0x318>
    230c:	000d8793          	mv	a5,s11
    2310:	fddff06f          	j	22ec <music_player_generic+0x3f0>
    2314:	00178793          	addi	a5,a5,1
    2318:	00140413          	addi	s0,s0,1
    231c:	fee78fa3          	sb	a4,-1(a5)
    2320:	fd5ff06f          	j	22f4 <music_player_generic+0x3f8>
    2324:	00040b93          	mv	s7,s0
    2328:	003b9c13          	slli	s8,s7,0x3
    232c:	417c0c33          	sub	s8,s8,s7
    2330:	002c1c13          	slli	s8,s8,0x2
    2334:	417c0c33          	sub	s8,s8,s7
    2338:	002c1c13          	slli	s8,s8,0x2
    233c:	018a0c33          	add	s8,s4,s8
    2340:	068c2783          	lw	a5,104(s8)
    2344:	04078063          	beqz	a5,2384 <music_player_generic+0x488>
    2348:	fe0b2783          	lw	a5,-32(s6)
    234c:	001b8b93          	addi	s7,s7,1
    2350:	00fba7b3          	slt	a5,s7,a5
    2354:	40f007b3          	neg	a5,a5
    2358:	00fbfbb3          	and	s7,s7,a5
    235c:	fd7416e3          	bne	s0,s7,2328 <music_player_generic+0x42c>
    2360:	00001097          	auipc	ra,0x1
    2364:	d24080e7          	jalr	-732(ra) # 3084 <display_framebuffer>
    2368:	00004637          	lui	a2,0x4
    236c:	00000593          	li	a1,0
    2370:	00001097          	auipc	ra,0x1
    2374:	a70080e7          	jalr	-1424(ra) # 2de0 <memset>
    2378:	00c12783          	lw	a5,12(sp)
    237c:	0007a783          	lw	a5,0(a5)
    2380:	ec1ff06f          	j	2240 <music_player_generic+0x344>
    2384:	000c0593          	mv	a1,s8
    2388:	02c10513          	addi	a0,sp,44
    238c:	fffff097          	auipc	ra,0xfffff
    2390:	694080e7          	jalr	1684(ra) # 1a20 <build_full_path>
    2394:	00001097          	auipc	ra,0x1
    2398:	cf0080e7          	jalr	-784(ra) # 3084 <display_framebuffer>
    239c:	00004637          	lui	a2,0x4
    23a0:	00000593          	li	a1,0
    23a4:	00001097          	auipc	ra,0x1
    23a8:	a3c080e7          	jalr	-1476(ra) # 2de0 <memset>
    23ac:	00001097          	auipc	ra,0x1
    23b0:	e54080e7          	jalr	-428(ra) # 3200 <display_refresh>
    23b4:	01012783          	lw	a5,16(sp)
    23b8:	064c2603          	lw	a2,100(s8)
    23bc:	000c0593          	mv	a1,s8
    23c0:	02c10513          	addi	a0,sp,44
    23c4:	00078863          	beqz	a5,23d4 <music_player_generic+0x4d8>
    23c8:	fffff097          	auipc	ra,0xfffff
    23cc:	e0c080e7          	jalr	-500(ra) # 11d4 <play_dj_mode>
    23d0:	f91ff06f          	j	2360 <music_player_generic+0x464>
    23d4:	fffff097          	auipc	ra,0xfffff
    23d8:	924080e7          	jalr	-1756(ra) # cf8 <play_music_with_controls>
    23dc:	f80502e3          	beqz	a0,2360 <music_player_generic+0x464>
    23e0:	00100793          	li	a5,1
    23e4:	00f51e63          	bne	a0,a5,2400 <music_player_generic+0x504>
    23e8:	fe0b2783          	lw	a5,-32(s6)
    23ec:	00ab8bb3          	add	s7,s7,a0
    23f0:	00fba7b3          	slt	a5,s7,a5
    23f4:	40f007b3          	neg	a5,a5
    23f8:	00fbfbb3          	and	s7,s7,a5
    23fc:	f2dff06f          	j	2328 <music_player_generic+0x42c>
    2400:	fffb8b93          	addi	s7,s7,-1
    2404:	f20bd2e3          	bgez	s7,2328 <music_player_generic+0x42c>
    2408:	fe0b2b83          	lw	s7,-32(s6)
    240c:	fffb8b93          	addi	s7,s7,-1
    2410:	f19ff06f          	j	2328 <music_player_generic+0x42c>
    2414:	00f427b3          	slt	a5,s0,a5
    2418:	40f007b3          	neg	a5,a5
    241c:	00f47433          	and	s0,s0,a5
    2420:	e31ff06f          	j	2250 <music_player_generic+0x354>
    2424:	00040913          	mv	s2,s0
    2428:	e39ff06f          	j	2260 <music_player_generic+0x364>
    242c:	25c12083          	lw	ra,604(sp)
    2430:	25812403          	lw	s0,600(sp)
    2434:	25412483          	lw	s1,596(sp)
    2438:	25012903          	lw	s2,592(sp)
    243c:	24c12983          	lw	s3,588(sp)
    2440:	24812a03          	lw	s4,584(sp)
    2444:	24412a83          	lw	s5,580(sp)
    2448:	24012b03          	lw	s6,576(sp)
    244c:	23c12b83          	lw	s7,572(sp)
    2450:	23812c03          	lw	s8,568(sp)
    2454:	23412c83          	lw	s9,564(sp)
    2458:	23012d03          	lw	s10,560(sp)
    245c:	22c12d83          	lw	s11,556(sp)
    2460:	26010113          	addi	sp,sp,608
    2464:	00008067          	ret

00002468 <main_menu>:
    2468:	fc010113          	addi	sp,sp,-64
    246c:	000075b7          	lui	a1,0x7
    2470:	01000613          	li	a2,16
    2474:	bc458593          	addi	a1,a1,-1084 # 6bc4 <LEDS+0x280>
    2478:	00010513          	mv	a0,sp
    247c:	02812c23          	sw	s0,56(sp)
    2480:	02912a23          	sw	s1,52(sp)
    2484:	03312623          	sw	s3,44(sp)
    2488:	03512223          	sw	s5,36(sp)
    248c:	03612023          	sw	s6,32(sp)
    2490:	01712e23          	sw	s7,28(sp)
    2494:	01812c23          	sw	s8,24(sp)
    2498:	01912a23          	sw	s9,20(sp)
    249c:	02112e23          	sw	ra,60(sp)
    24a0:	03212823          	sw	s2,48(sp)
    24a4:	03412423          	sw	s4,40(sp)
    24a8:	00001097          	auipc	ra,0x1
    24ac:	954080e7          	jalr	-1708(ra) # 2dfc <memcpy>
    24b0:	000077b7          	lui	a5,0x7
    24b4:	ae878c13          	addi	s8,a5,-1304 # 6ae8 <LEDS+0x1a4>
    24b8:	000077b7          	lui	a5,0x7
    24bc:	afc78b13          	addi	s6,a5,-1284 # 6afc <LEDS+0x1b8>
    24c0:	000077b7          	lui	a5,0x7
    24c4:	b0c78b93          	addi	s7,a5,-1268 # 6b0c <LEDS+0x1c8>
    24c8:	000077b7          	lui	a5,0x7
    24cc:	b1078c93          	addi	s9,a5,-1264 # 6b10 <LEDS+0x1cc>
    24d0:	000077b7          	lui	a5,0x7
    24d4:	9347aa83          	lw	s5,-1740(a5) # 6934 <BUTTONS>
    24d8:	00000493          	li	s1,0
    24dc:	00000413          	li	s0,0
    24e0:	00400993          	li	s3,4
    24e4:	00000593          	li	a1,0
    24e8:	00000513          	li	a0,0
    24ec:	00001097          	auipc	ra,0x1
    24f0:	ba4080e7          	jalr	-1116(ra) # 3090 <display_set_cursor>
    24f4:	00000593          	li	a1,0
    24f8:	0ff00513          	li	a0,255
    24fc:	00001097          	auipc	ra,0x1
    2500:	ba8080e7          	jalr	-1112(ra) # 30a4 <display_set_front_back_color>
    2504:	000c0513          	mv	a0,s8
    2508:	00001097          	auipc	ra,0x1
    250c:	e64080e7          	jalr	-412(ra) # 336c <printf>
    2510:	00010a13          	mv	s4,sp
    2514:	00000913          	li	s2,0
    2518:	13241263          	bne	s0,s2,263c <main_menu+0x1d4>
    251c:	0ff00593          	li	a1,255
    2520:	00000513          	li	a0,0
    2524:	00001097          	auipc	ra,0x1
    2528:	b80080e7          	jalr	-1152(ra) # 30a4 <display_set_front_back_color>
    252c:	000a2603          	lw	a2,0(s4)
    2530:	00190913          	addi	s2,s2,1
    2534:	00090593          	mv	a1,s2
    2538:	000b0513          	mv	a0,s6
    253c:	00001097          	auipc	ra,0x1
    2540:	e30080e7          	jalr	-464(ra) # 336c <printf>
    2544:	000b8513          	mv	a0,s7
    2548:	00001097          	auipc	ra,0x1
    254c:	e24080e7          	jalr	-476(ra) # 336c <printf>
    2550:	004a0a13          	addi	s4,s4,4
    2554:	fd3912e3          	bne	s2,s3,2518 <main_menu+0xb0>
    2558:	00000593          	li	a1,0
    255c:	0ff00513          	li	a0,255
    2560:	00001097          	auipc	ra,0x1
    2564:	b44080e7          	jalr	-1212(ra) # 30a4 <display_set_front_back_color>
    2568:	06e00593          	li	a1,110
    256c:	00000513          	li	a0,0
    2570:	00001097          	auipc	ra,0x1
    2574:	b20080e7          	jalr	-1248(ra) # 3090 <display_set_cursor>
    2578:	000c8513          	mv	a0,s9
    257c:	00001097          	auipc	ra,0x1
    2580:	df0080e7          	jalr	-528(ra) # 336c <printf>
    2584:	00001097          	auipc	ra,0x1
    2588:	c7c080e7          	jalr	-900(ra) # 3200 <display_refresh>
    258c:	000aa903          	lw	s2,0(s5)
    2590:	fff4c493          	not	s1,s1
    2594:	0124f4b3          	and	s1,s1,s2
    2598:	0104f793          	andi	a5,s1,16
    259c:	00078863          	beqz	a5,25ac <main_menu+0x144>
    25a0:	00140413          	addi	s0,s0,1
    25a4:	ffffe097          	auipc	ra,0xffffe
    25a8:	bb8080e7          	jalr	-1096(ra) # 15c <play_click_noise>
    25ac:	0084f793          	andi	a5,s1,8
    25b0:	00078863          	beqz	a5,25c0 <main_menu+0x158>
    25b4:	fff40413          	addi	s0,s0,-1
    25b8:	ffffe097          	auipc	ra,0xffffe
    25bc:	ba4080e7          	jalr	-1116(ra) # 15c <play_click_noise>
    25c0:	0044f493          	andi	s1,s1,4
    25c4:	04048c63          	beqz	s1,261c <main_menu+0x1b4>
    25c8:	ffffe097          	auipc	ra,0xffffe
    25cc:	b94080e7          	jalr	-1132(ra) # 15c <play_click_noise>
    25d0:	00001097          	auipc	ra,0x1
    25d4:	ab4080e7          	jalr	-1356(ra) # 3084 <display_framebuffer>
    25d8:	00004637          	lui	a2,0x4
    25dc:	00000593          	li	a1,0
    25e0:	00001097          	auipc	ra,0x1
    25e4:	800080e7          	jalr	-2048(ra) # 2de0 <memset>
    25e8:	00001097          	auipc	ra,0x1
    25ec:	c18080e7          	jalr	-1000(ra) # 3200 <display_refresh>
    25f0:	04041c63          	bnez	s0,2648 <main_menu+0x1e0>
    25f4:	fffff097          	auipc	ra,0xfffff
    25f8:	494080e7          	jalr	1172(ra) # 1a88 <file_explorer>
    25fc:	00001097          	auipc	ra,0x1
    2600:	a88080e7          	jalr	-1400(ra) # 3084 <display_framebuffer>
    2604:	00004637          	lui	a2,0x4
    2608:	00000593          	li	a1,0
    260c:	00000097          	auipc	ra,0x0
    2610:	7d4080e7          	jalr	2004(ra) # 2de0 <memset>
    2614:	000a8793          	mv	a5,s5
    2618:	0007a783          	lw	a5,0(a5)
    261c:	fff00793          	li	a5,-1
    2620:	00f40863          	beq	s0,a5,2630 <main_menu+0x1c8>
    2624:	01341863          	bne	s0,s3,2634 <main_menu+0x1cc>
    2628:	00000413          	li	s0,0
    262c:	0080006f          	j	2634 <main_menu+0x1cc>
    2630:	00300413          	li	s0,3
    2634:	00090493          	mv	s1,s2
    2638:	eadff06f          	j	24e4 <main_menu+0x7c>
    263c:	00000593          	li	a1,0
    2640:	0ff00513          	li	a0,255
    2644:	ee1ff06f          	j	2524 <main_menu+0xbc>
    2648:	00100513          	li	a0,1
    264c:	00a41a63          	bne	s0,a0,2660 <main_menu+0x1f8>
    2650:	00000513          	li	a0,0
    2654:	00000097          	auipc	ra,0x0
    2658:	8a8080e7          	jalr	-1880(ra) # 1efc <music_player_generic>
    265c:	fa1ff06f          	j	25fc <main_menu+0x194>
    2660:	00200793          	li	a5,2
    2664:	fef408e3          	beq	s0,a5,2654 <main_menu+0x1ec>
    2668:	00300793          	li	a5,3
    266c:	f8f418e3          	bne	s0,a5,25fc <main_menu+0x194>
    2670:	ffffe097          	auipc	ra,0xffffe
    2674:	ee8080e7          	jalr	-280(ra) # 558 <synth_90s_mode>
    2678:	f85ff06f          	j	25fc <main_menu+0x194>

0000267c <main>:
    267c:	000077b7          	lui	a5,0x7
    2680:	9447a783          	lw	a5,-1724(a5) # 6944 <LEDS>
    2684:	ff010113          	addi	sp,sp,-16
    2688:	00112623          	sw	ra,12(sp)
    268c:	00812423          	sw	s0,8(sp)
    2690:	0007a023          	sw	zero,0(a5)
    2694:	000037b7          	lui	a5,0x3
    2698:	0b878793          	addi	a5,a5,184 # 30b8 <display_putchar>
    269c:	00007737          	lui	a4,0x7
    26a0:	fef72a23          	sw	a5,-12(a4) # 6ff4 <f_putchar>
    26a4:	00001097          	auipc	ra,0x1
    26a8:	93c080e7          	jalr	-1732(ra) # 2fe0 <oled_init>
    26ac:	00001097          	auipc	ra,0x1
    26b0:	940080e7          	jalr	-1728(ra) # 2fec <oled_fullscreen>
    26b4:	00001097          	auipc	ra,0x1
    26b8:	9d0080e7          	jalr	-1584(ra) # 3084 <display_framebuffer>
    26bc:	00004637          	lui	a2,0x4
    26c0:	00000593          	li	a1,0
    26c4:	00000097          	auipc	ra,0x0
    26c8:	71c080e7          	jalr	1820(ra) # 2de0 <memset>
    26cc:	00001097          	auipc	ra,0x1
    26d0:	b34080e7          	jalr	-1228(ra) # 3200 <display_refresh>
    26d4:	00000097          	auipc	ra,0x0
    26d8:	4ac080e7          	jalr	1196(ra) # 2b80 <sdcard_init>
    26dc:	00001097          	auipc	ra,0x1
    26e0:	260080e7          	jalr	608(ra) # 393c <fl_init>
    26e4:	00000593          	li	a1,0
    26e8:	00000513          	li	a0,0
    26ec:	00001097          	auipc	ra,0x1
    26f0:	9a4080e7          	jalr	-1628(ra) # 3090 <display_set_cursor>
    26f4:	00000593          	li	a1,0
    26f8:	0ff00513          	li	a0,255
    26fc:	00001097          	auipc	ra,0x1
    2700:	9a8080e7          	jalr	-1624(ra) # 30a4 <display_set_front_back_color>
    2704:	00007537          	lui	a0,0x7
    2708:	b2450513          	addi	a0,a0,-1244 # 6b24 <LEDS+0x1e0>
    270c:	00001097          	auipc	ra,0x1
    2710:	c60080e7          	jalr	-928(ra) # 336c <printf>
    2714:	00001097          	auipc	ra,0x1
    2718:	aec080e7          	jalr	-1300(ra) # 3200 <display_refresh>
    271c:	000035b7          	lui	a1,0x3
    2720:	000037b7          	lui	a5,0x3
    2724:	d2458593          	addi	a1,a1,-732 # 2d24 <sdcard_writesector>
    2728:	cd078413          	addi	s0,a5,-816 # 2cd0 <sdcard_readsector>
    272c:	00040513          	mv	a0,s0
    2730:	00002097          	auipc	ra,0x2
    2734:	16c080e7          	jalr	364(ra) # 489c <fl_attach_media>
    2738:	000037b7          	lui	a5,0x3
    273c:	d2478593          	addi	a1,a5,-732 # 2d24 <sdcard_writesector>
    2740:	fe0516e3          	bnez	a0,272c <main+0xb0>
    2744:	ffffe097          	auipc	ra,0xffffe
    2748:	234080e7          	jalr	564(ra) # 978 <intro_sequence>
    274c:	00000097          	auipc	ra,0x0
    2750:	d1c080e7          	jalr	-740(ra) # 2468 <main_menu>

00002754 <pause>:
    2754:	c0002773          	rdcycle	a4
    2758:	c00027f3          	rdcycle	a5
    275c:	40e787b3          	sub	a5,a5,a4
    2760:	fea7ece3          	bltu	a5,a0,2758 <pause+0x4>
    2764:	00008067          	ret

00002768 <sdcard_idle>:
    2768:	00008067          	ret

0000276c <sdcard_select>:
    276c:	000077b7          	lui	a5,0x7
    2770:	9387a783          	lw	a5,-1736(a5) # 6938 <SDCARD>
    2774:	00200713          	li	a4,2
    2778:	00e7a023          	sw	a4,0(a5)
    277c:	00008067          	ret

00002780 <sdcard_ponder>:
    2780:	000076b7          	lui	a3,0x7
    2784:	9386a683          	lw	a3,-1736(a3) # 6938 <SDCARD>
    2788:	01000793          	li	a5,16
    278c:	00000713          	li	a4,0
    2790:	00676613          	ori	a2,a4,6
    2794:	00c6a023          	sw	a2,0(a3)
    2798:	00174713          	xori	a4,a4,1
    279c:	00000013          	nop
    27a0:	fff78793          	addi	a5,a5,-1
    27a4:	fe0796e3          	bnez	a5,2790 <sdcard_ponder+0x10>
    27a8:	00008067          	ret

000027ac <sdcard_unselect>:
    27ac:	000077b7          	lui	a5,0x7
    27b0:	9387a783          	lw	a5,-1736(a5) # 6938 <SDCARD>
    27b4:	00600713          	li	a4,6
    27b8:	00e7a023          	sw	a4,0(a5)
    27bc:	00008067          	ret

000027c0 <sdcard_send>:
    27c0:	000077b7          	lui	a5,0x7
    27c4:	9387a783          	lw	a5,-1736(a5) # 6938 <SDCARD>
    27c8:	00655713          	srli	a4,a0,0x6
    27cc:	00277713          	andi	a4,a4,2
    27d0:	00e7a023          	sw	a4,0(a5)
    27d4:	00176713          	ori	a4,a4,1
    27d8:	00e7a023          	sw	a4,0(a5)
    27dc:	00555713          	srli	a4,a0,0x5
    27e0:	00277713          	andi	a4,a4,2
    27e4:	00e7a023          	sw	a4,0(a5)
    27e8:	00176713          	ori	a4,a4,1
    27ec:	00e7a023          	sw	a4,0(a5)
    27f0:	00455713          	srli	a4,a0,0x4
    27f4:	00277713          	andi	a4,a4,2
    27f8:	00e7a023          	sw	a4,0(a5)
    27fc:	00176713          	ori	a4,a4,1
    2800:	00e7a023          	sw	a4,0(a5)
    2804:	00355713          	srli	a4,a0,0x3
    2808:	00277713          	andi	a4,a4,2
    280c:	00e7a023          	sw	a4,0(a5)
    2810:	00176713          	ori	a4,a4,1
    2814:	00e7a023          	sw	a4,0(a5)
    2818:	00255713          	srli	a4,a0,0x2
    281c:	00277713          	andi	a4,a4,2
    2820:	00e7a023          	sw	a4,0(a5)
    2824:	00176713          	ori	a4,a4,1
    2828:	00e7a023          	sw	a4,0(a5)
    282c:	00155713          	srli	a4,a0,0x1
    2830:	00277713          	andi	a4,a4,2
    2834:	00e7a023          	sw	a4,0(a5)
    2838:	00176713          	ori	a4,a4,1
    283c:	00e7a023          	sw	a4,0(a5)
    2840:	00257713          	andi	a4,a0,2
    2844:	00e7a023          	sw	a4,0(a5)
    2848:	00151513          	slli	a0,a0,0x1
    284c:	00176713          	ori	a4,a4,1
    2850:	00e7a023          	sw	a4,0(a5)
    2854:	00257513          	andi	a0,a0,2
    2858:	00a7a023          	sw	a0,0(a5)
    285c:	00156513          	ori	a0,a0,1
    2860:	00a7a023          	sw	a0,0(a5)
    2864:	00200713          	li	a4,2
    2868:	00e7a023          	sw	a4,0(a5)
    286c:	000077b7          	lui	a5,0x7
    2870:	fe47a783          	lw	a5,-28(a5) # 6fe4 <sdcard_while_loading_callback>
    2874:	00078067          	jr	a5

00002878 <sdcard_read>:
    2878:	fd010113          	addi	sp,sp,-48
    287c:	fff50793          	addi	a5,a0,-1
    2880:	03212023          	sw	s2,32(sp)
    2884:	00100913          	li	s2,1
    2888:	00f91933          	sll	s2,s2,a5
    288c:	000077b7          	lui	a5,0x7
    2890:	01312e23          	sw	s3,28(sp)
    2894:	9387a983          	lw	s3,-1736(a5) # 6938 <SDCARD>
    2898:	02812423          	sw	s0,40(sp)
    289c:	02912223          	sw	s1,36(sp)
    28a0:	01412c23          	sw	s4,24(sp)
    28a4:	01512a23          	sw	s5,20(sp)
    28a8:	01612823          	sw	s6,16(sp)
    28ac:	02112623          	sw	ra,44(sp)
    28b0:	0ff00413          	li	s0,255
    28b4:	00000493          	li	s1,0
    28b8:	00300a13          	li	s4,3
    28bc:	00200a93          	li	s5,2
    28c0:	00007b37          	lui	s6,0x7
    28c4:	02058c63          	beqz	a1,28fc <sdcard_read+0x84>
    28c8:	012477b3          	and	a5,s0,s2
    28cc:	02079a63          	bnez	a5,2900 <sdcard_read+0x88>
    28d0:	02c12083          	lw	ra,44(sp)
    28d4:	0ff47513          	zext.b	a0,s0
    28d8:	02812403          	lw	s0,40(sp)
    28dc:	02412483          	lw	s1,36(sp)
    28e0:	02012903          	lw	s2,32(sp)
    28e4:	01c12983          	lw	s3,28(sp)
    28e8:	01812a03          	lw	s4,24(sp)
    28ec:	01412a83          	lw	s5,20(sp)
    28f0:	01012b03          	lw	s6,16(sp)
    28f4:	03010113          	addi	sp,sp,48
    28f8:	00008067          	ret
    28fc:	fca4dae3          	bge	s1,a0,28d0 <sdcard_read+0x58>
    2900:	0149a023          	sw	s4,0(s3)
    2904:	0159a023          	sw	s5,0(s3)
    2908:	0009a783          	lw	a5,0(s3)
    290c:	00141413          	slli	s0,s0,0x1
    2910:	00b12623          	sw	a1,12(sp)
    2914:	00f46433          	or	s0,s0,a5
    2918:	fe4b2783          	lw	a5,-28(s6) # 6fe4 <sdcard_while_loading_callback>
    291c:	00a12423          	sw	a0,8(sp)
    2920:	00148493          	addi	s1,s1,1
    2924:	000780e7          	jalr	a5
    2928:	00c12583          	lw	a1,12(sp)
    292c:	00812503          	lw	a0,8(sp)
    2930:	f95ff06f          	j	28c4 <sdcard_read+0x4c>

00002934 <sdcard_get>:
    2934:	fe010113          	addi	sp,sp,-32
    2938:	00112e23          	sw	ra,28(sp)
    293c:	00812c23          	sw	s0,24(sp)
    2940:	00912a23          	sw	s1,20(sp)
    2944:	00050413          	mv	s0,a0
    2948:	00b12623          	sw	a1,12(sp)
    294c:	00000097          	auipc	ra,0x0
    2950:	e20080e7          	jalr	-480(ra) # 276c <sdcard_select>
    2954:	00c12583          	lw	a1,12(sp)
    2958:	00040513          	mv	a0,s0
    295c:	00100493          	li	s1,1
    2960:	00000097          	auipc	ra,0x0
    2964:	f18080e7          	jalr	-232(ra) # 2878 <sdcard_read>
    2968:	00345413          	srli	s0,s0,0x3
    296c:	0284c463          	blt	s1,s0,2994 <sdcard_get+0x60>
    2970:	00a12623          	sw	a0,12(sp)
    2974:	00000097          	auipc	ra,0x0
    2978:	e38080e7          	jalr	-456(ra) # 27ac <sdcard_unselect>
    297c:	01c12083          	lw	ra,28(sp)
    2980:	01812403          	lw	s0,24(sp)
    2984:	00c12503          	lw	a0,12(sp)
    2988:	01412483          	lw	s1,20(sp)
    298c:	02010113          	addi	sp,sp,32
    2990:	00008067          	ret
    2994:	00000593          	li	a1,0
    2998:	00800513          	li	a0,8
    299c:	00000097          	auipc	ra,0x0
    29a0:	edc080e7          	jalr	-292(ra) # 2878 <sdcard_read>
    29a4:	00148493          	addi	s1,s1,1
    29a8:	fc5ff06f          	j	296c <sdcard_get+0x38>

000029ac <sdcard_cmd>:
    29ac:	ff010113          	addi	sp,sp,-16
    29b0:	00812423          	sw	s0,8(sp)
    29b4:	00912223          	sw	s1,4(sp)
    29b8:	01212023          	sw	s2,0(sp)
    29bc:	00112623          	sw	ra,12(sp)
    29c0:	00050913          	mv	s2,a0
    29c4:	00000413          	li	s0,0
    29c8:	00000097          	auipc	ra,0x0
    29cc:	da4080e7          	jalr	-604(ra) # 276c <sdcard_select>
    29d0:	00600493          	li	s1,6
    29d4:	008907b3          	add	a5,s2,s0
    29d8:	0007c503          	lbu	a0,0(a5)
    29dc:	00140413          	addi	s0,s0,1
    29e0:	00000097          	auipc	ra,0x0
    29e4:	de0080e7          	jalr	-544(ra) # 27c0 <sdcard_send>
    29e8:	fe9416e3          	bne	s0,s1,29d4 <sdcard_cmd+0x28>
    29ec:	00812403          	lw	s0,8(sp)
    29f0:	00c12083          	lw	ra,12(sp)
    29f4:	00412483          	lw	s1,4(sp)
    29f8:	00012903          	lw	s2,0(sp)
    29fc:	01010113          	addi	sp,sp,16
    2a00:	00000317          	auipc	t1,0x0
    2a04:	dac30067          	jr	-596(t1) # 27ac <sdcard_unselect>

00002a08 <sdcard_start_sector>:
    2a08:	ff010113          	addi	sp,sp,-16
    2a0c:	00112623          	sw	ra,12(sp)
    2a10:	00812423          	sw	s0,8(sp)
    2a14:	00050413          	mv	s0,a0
    2a18:	00000097          	auipc	ra,0x0
    2a1c:	d54080e7          	jalr	-684(ra) # 276c <sdcard_select>
    2a20:	05100513          	li	a0,81
    2a24:	00000097          	auipc	ra,0x0
    2a28:	d9c080e7          	jalr	-612(ra) # 27c0 <sdcard_send>
    2a2c:	01845513          	srli	a0,s0,0x18
    2a30:	00000097          	auipc	ra,0x0
    2a34:	d90080e7          	jalr	-624(ra) # 27c0 <sdcard_send>
    2a38:	41045513          	srai	a0,s0,0x10
    2a3c:	0ff57513          	zext.b	a0,a0
    2a40:	00000097          	auipc	ra,0x0
    2a44:	d80080e7          	jalr	-640(ra) # 27c0 <sdcard_send>
    2a48:	40845513          	srai	a0,s0,0x8
    2a4c:	0ff57513          	zext.b	a0,a0
    2a50:	00000097          	auipc	ra,0x0
    2a54:	d70080e7          	jalr	-656(ra) # 27c0 <sdcard_send>
    2a58:	0ff47513          	zext.b	a0,s0
    2a5c:	00000097          	auipc	ra,0x0
    2a60:	d64080e7          	jalr	-668(ra) # 27c0 <sdcard_send>
    2a64:	05500513          	li	a0,85
    2a68:	00000097          	auipc	ra,0x0
    2a6c:	d58080e7          	jalr	-680(ra) # 27c0 <sdcard_send>
    2a70:	00000097          	auipc	ra,0x0
    2a74:	d3c080e7          	jalr	-708(ra) # 27ac <sdcard_unselect>
    2a78:	00812403          	lw	s0,8(sp)
    2a7c:	00c12083          	lw	ra,12(sp)
    2a80:	00100593          	li	a1,1
    2a84:	00800513          	li	a0,8
    2a88:	01010113          	addi	sp,sp,16
    2a8c:	00000317          	auipc	t1,0x0
    2a90:	ea830067          	jr	-344(t1) # 2934 <sdcard_get>

00002a94 <sdcard_read_sector>:
    2a94:	ff010113          	addi	sp,sp,-16
    2a98:	00812423          	sw	s0,8(sp)
    2a9c:	00112623          	sw	ra,12(sp)
    2aa0:	00912223          	sw	s1,4(sp)
    2aa4:	01212023          	sw	s2,0(sp)
    2aa8:	00058413          	mv	s0,a1
    2aac:	00000097          	auipc	ra,0x0
    2ab0:	f5c080e7          	jalr	-164(ra) # 2a08 <sdcard_start_sector>
    2ab4:	04051863          	bnez	a0,2b04 <sdcard_read_sector+0x70>
    2ab8:	00100593          	li	a1,1
    2abc:	00058513          	mv	a0,a1
    2ac0:	00000097          	auipc	ra,0x0
    2ac4:	e74080e7          	jalr	-396(ra) # 2934 <sdcard_get>
    2ac8:	00000493          	li	s1,0
    2acc:	20000913          	li	s2,512
    2ad0:	00000593          	li	a1,0
    2ad4:	00800513          	li	a0,8
    2ad8:	00000097          	auipc	ra,0x0
    2adc:	e5c080e7          	jalr	-420(ra) # 2934 <sdcard_get>
    2ae0:	009407b3          	add	a5,s0,s1
    2ae4:	00a78023          	sb	a0,0(a5)
    2ae8:	00148493          	addi	s1,s1,1
    2aec:	ff2492e3          	bne	s1,s2,2ad0 <sdcard_read_sector+0x3c>
    2af0:	00100593          	li	a1,1
    2af4:	01000513          	li	a0,16
    2af8:	20040413          	addi	s0,s0,512
    2afc:	00000097          	auipc	ra,0x0
    2b00:	e38080e7          	jalr	-456(ra) # 2934 <sdcard_get>
    2b04:	00c12083          	lw	ra,12(sp)
    2b08:	00040513          	mv	a0,s0
    2b0c:	00812403          	lw	s0,8(sp)
    2b10:	00412483          	lw	s1,4(sp)
    2b14:	00012903          	lw	s2,0(sp)
    2b18:	01010113          	addi	sp,sp,16
    2b1c:	00008067          	ret

00002b20 <sdcard_preinit>:
    2b20:	ff010113          	addi	sp,sp,-16
    2b24:	000077b7          	lui	a5,0x7
    2b28:	00812423          	sw	s0,8(sp)
    2b2c:	9387a403          	lw	s0,-1736(a5) # 6938 <SDCARD>
    2b30:	00112623          	sw	ra,12(sp)
    2b34:	00600793          	li	a5,6
    2b38:	01313537          	lui	a0,0x1313
    2b3c:	00f42023          	sw	a5,0(s0)
    2b40:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
    2b44:	00000097          	auipc	ra,0x0
    2b48:	c10080e7          	jalr	-1008(ra) # 2754 <pause>
    2b4c:	0a000793          	li	a5,160
    2b50:	00000713          	li	a4,0
    2b54:	00676693          	ori	a3,a4,6
    2b58:	00d42023          	sw	a3,0(s0)
    2b5c:	fff78793          	addi	a5,a5,-1
    2b60:	00174713          	xori	a4,a4,1
    2b64:	fe0798e3          	bnez	a5,2b54 <sdcard_preinit+0x34>
    2b68:	00600793          	li	a5,6
    2b6c:	00c12083          	lw	ra,12(sp)
    2b70:	00f42023          	sw	a5,0(s0)
    2b74:	00812403          	lw	s0,8(sp)
    2b78:	01010113          	addi	sp,sp,16
    2b7c:	00008067          	ret

00002b80 <sdcard_init>:
    2b80:	000027b7          	lui	a5,0x2
    2b84:	76878793          	addi	a5,a5,1896 # 2768 <sdcard_idle>
    2b88:	00007737          	lui	a4,0x7
    2b8c:	fe010113          	addi	sp,sp,-32
    2b90:	fef72223          	sw	a5,-28(a4) # 6fe4 <sdcard_while_loading_callback>
    2b94:	000077b7          	lui	a5,0x7
    2b98:	00812c23          	sw	s0,24(sp)
    2b9c:	00912a23          	sw	s1,20(sp)
    2ba0:	00112e23          	sw	ra,28(sp)
    2ba4:	92478493          	addi	s1,a5,-1756 # 6924 <cmd0>
    2ba8:	0ff00413          	li	s0,255
    2bac:	00000097          	auipc	ra,0x0
    2bb0:	f74080e7          	jalr	-140(ra) # 2b20 <sdcard_preinit>
    2bb4:	00048513          	mv	a0,s1
    2bb8:	00000097          	auipc	ra,0x0
    2bbc:	df4080e7          	jalr	-524(ra) # 29ac <sdcard_cmd>
    2bc0:	00100593          	li	a1,1
    2bc4:	00800513          	li	a0,8
    2bc8:	00000097          	auipc	ra,0x0
    2bcc:	d6c080e7          	jalr	-660(ra) # 2934 <sdcard_get>
    2bd0:	00a12623          	sw	a0,12(sp)
    2bd4:	00000097          	auipc	ra,0x0
    2bd8:	bac080e7          	jalr	-1108(ra) # 2780 <sdcard_ponder>
    2bdc:	00c12503          	lw	a0,12(sp)
    2be0:	00851c63          	bne	a0,s0,2bf8 <sdcard_init+0x78>
    2be4:	01313537          	lui	a0,0x1313
    2be8:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
    2bec:	00000097          	auipc	ra,0x0
    2bf0:	b68080e7          	jalr	-1176(ra) # 2754 <pause>
    2bf4:	fb9ff06f          	j	2bac <sdcard_init+0x2c>
    2bf8:	00007537          	lui	a0,0x7
    2bfc:	91c50513          	addi	a0,a0,-1764 # 691c <cmd8>
    2c00:	00000097          	auipc	ra,0x0
    2c04:	dac080e7          	jalr	-596(ra) # 29ac <sdcard_cmd>
    2c08:	00100593          	li	a1,1
    2c0c:	02800513          	li	a0,40
    2c10:	00000097          	auipc	ra,0x0
    2c14:	d24080e7          	jalr	-732(ra) # 2934 <sdcard_get>
    2c18:	00000097          	auipc	ra,0x0
    2c1c:	b68080e7          	jalr	-1176(ra) # 2780 <sdcard_ponder>
    2c20:	000077b7          	lui	a5,0x7
    2c24:	91478413          	addi	s0,a5,-1772 # 6914 <cmd55>
    2c28:	000077b7          	lui	a5,0x7
    2c2c:	90c78493          	addi	s1,a5,-1780 # 690c <acmd41>
    2c30:	00040513          	mv	a0,s0
    2c34:	00000097          	auipc	ra,0x0
    2c38:	d78080e7          	jalr	-648(ra) # 29ac <sdcard_cmd>
    2c3c:	00100593          	li	a1,1
    2c40:	00800513          	li	a0,8
    2c44:	00000097          	auipc	ra,0x0
    2c48:	cf0080e7          	jalr	-784(ra) # 2934 <sdcard_get>
    2c4c:	00000097          	auipc	ra,0x0
    2c50:	b34080e7          	jalr	-1228(ra) # 2780 <sdcard_ponder>
    2c54:	00048513          	mv	a0,s1
    2c58:	00000097          	auipc	ra,0x0
    2c5c:	d54080e7          	jalr	-684(ra) # 29ac <sdcard_cmd>
    2c60:	00100593          	li	a1,1
    2c64:	00800513          	li	a0,8
    2c68:	00000097          	auipc	ra,0x0
    2c6c:	ccc080e7          	jalr	-820(ra) # 2934 <sdcard_get>
    2c70:	00a12623          	sw	a0,12(sp)
    2c74:	00000097          	auipc	ra,0x0
    2c78:	b0c080e7          	jalr	-1268(ra) # 2780 <sdcard_ponder>
    2c7c:	00c12503          	lw	a0,12(sp)
    2c80:	00050c63          	beqz	a0,2c98 <sdcard_init+0x118>
    2c84:	001e8537          	lui	a0,0x1e8
    2c88:	48050513          	addi	a0,a0,1152 # 1e8480 <__stacktop+0x1d8480>
    2c8c:	00000097          	auipc	ra,0x0
    2c90:	ac8080e7          	jalr	-1336(ra) # 2754 <pause>
    2c94:	f9dff06f          	j	2c30 <sdcard_init+0xb0>
    2c98:	00007537          	lui	a0,0x7
    2c9c:	90450513          	addi	a0,a0,-1788 # 6904 <cmd16>
    2ca0:	00000097          	auipc	ra,0x0
    2ca4:	d0c080e7          	jalr	-756(ra) # 29ac <sdcard_cmd>
    2ca8:	00100593          	li	a1,1
    2cac:	00800513          	li	a0,8
    2cb0:	00000097          	auipc	ra,0x0
    2cb4:	c84080e7          	jalr	-892(ra) # 2934 <sdcard_get>
    2cb8:	01812403          	lw	s0,24(sp)
    2cbc:	01c12083          	lw	ra,28(sp)
    2cc0:	01412483          	lw	s1,20(sp)
    2cc4:	02010113          	addi	sp,sp,32
    2cc8:	00000317          	auipc	t1,0x0
    2ccc:	ab830067          	jr	-1352(t1) # 2780 <sdcard_ponder>

00002cd0 <sdcard_readsector>:
    2cd0:	04060663          	beqz	a2,2d1c <sdcard_readsector+0x4c>
    2cd4:	ff010113          	addi	sp,sp,-16
    2cd8:	00812423          	sw	s0,8(sp)
    2cdc:	00912223          	sw	s1,4(sp)
    2ce0:	00112623          	sw	ra,12(sp)
    2ce4:	00050413          	mv	s0,a0
    2ce8:	00a604b3          	add	s1,a2,a0
    2cec:	00040513          	mv	a0,s0
    2cf0:	00000097          	auipc	ra,0x0
    2cf4:	da4080e7          	jalr	-604(ra) # 2a94 <sdcard_read_sector>
    2cf8:	00140413          	addi	s0,s0,1
    2cfc:	00050593          	mv	a1,a0
    2d00:	fe9416e3          	bne	s0,s1,2cec <sdcard_readsector+0x1c>
    2d04:	00c12083          	lw	ra,12(sp)
    2d08:	00812403          	lw	s0,8(sp)
    2d0c:	00412483          	lw	s1,4(sp)
    2d10:	00100513          	li	a0,1
    2d14:	01010113          	addi	sp,sp,16
    2d18:	00008067          	ret
    2d1c:	00000513          	li	a0,0
    2d20:	00008067          	ret

00002d24 <sdcard_writesector>:
    2d24:	00000513          	li	a0,0
    2d28:	00008067          	ret

00002d2c <__divsi3>:
    2d2c:	06054063          	bltz	a0,2d8c <__umodsi3+0x10>
    2d30:	0605c663          	bltz	a1,2d9c <__umodsi3+0x20>

00002d34 <__udivsi3>:
    2d34:	00058613          	mv	a2,a1
    2d38:	00050593          	mv	a1,a0
    2d3c:	fff00513          	li	a0,-1
    2d40:	02060c63          	beqz	a2,2d78 <__udivsi3+0x44>
    2d44:	00100693          	li	a3,1
    2d48:	00b67a63          	bgeu	a2,a1,2d5c <__udivsi3+0x28>
    2d4c:	00c05863          	blez	a2,2d5c <__udivsi3+0x28>
    2d50:	00161613          	slli	a2,a2,0x1
    2d54:	00169693          	slli	a3,a3,0x1
    2d58:	feb66ae3          	bltu	a2,a1,2d4c <__udivsi3+0x18>
    2d5c:	00000513          	li	a0,0
    2d60:	00c5e663          	bltu	a1,a2,2d6c <__udivsi3+0x38>
    2d64:	40c585b3          	sub	a1,a1,a2
    2d68:	00d56533          	or	a0,a0,a3
    2d6c:	0016d693          	srli	a3,a3,0x1
    2d70:	00165613          	srli	a2,a2,0x1
    2d74:	fe0696e3          	bnez	a3,2d60 <__udivsi3+0x2c>
    2d78:	00008067          	ret

00002d7c <__umodsi3>:
    2d7c:	00008293          	mv	t0,ra
    2d80:	fb5ff0ef          	jal	2d34 <__udivsi3>
    2d84:	00058513          	mv	a0,a1
    2d88:	00028067          	jr	t0
    2d8c:	40a00533          	neg	a0,a0
    2d90:	0005d863          	bgez	a1,2da0 <__umodsi3+0x24>
    2d94:	40b005b3          	neg	a1,a1
    2d98:	f95ff06f          	j	2d2c <__divsi3>
    2d9c:	40b005b3          	neg	a1,a1
    2da0:	00008293          	mv	t0,ra
    2da4:	f89ff0ef          	jal	2d2c <__divsi3>
    2da8:	40a00533          	neg	a0,a0
    2dac:	00028067          	jr	t0

00002db0 <__modsi3>:
    2db0:	00008293          	mv	t0,ra
    2db4:	0005ca63          	bltz	a1,2dc8 <__modsi3+0x18>
    2db8:	00054c63          	bltz	a0,2dd0 <__modsi3+0x20>
    2dbc:	f79ff0ef          	jal	2d34 <__udivsi3>
    2dc0:	00058513          	mv	a0,a1
    2dc4:	00028067          	jr	t0
    2dc8:	40b005b3          	neg	a1,a1
    2dcc:	fe0558e3          	bgez	a0,2dbc <__modsi3+0xc>
    2dd0:	40a00533          	neg	a0,a0
    2dd4:	f61ff0ef          	jal	2d34 <__udivsi3>
    2dd8:	40b00533          	neg	a0,a1
    2ddc:	00028067          	jr	t0

00002de0 <memset>:
    2de0:	00c50633          	add	a2,a0,a2
    2de4:	00050793          	mv	a5,a0
    2de8:	00c79463          	bne	a5,a2,2df0 <memset+0x10>
    2dec:	00008067          	ret
    2df0:	00178793          	addi	a5,a5,1
    2df4:	feb78fa3          	sb	a1,-1(a5)
    2df8:	ff1ff06f          	j	2de8 <memset+0x8>

00002dfc <memcpy>:
    2dfc:	00000793          	li	a5,0
    2e00:	00c79463          	bne	a5,a2,2e08 <memcpy+0xc>
    2e04:	00008067          	ret
    2e08:	00f58733          	add	a4,a1,a5
    2e0c:	00074683          	lbu	a3,0(a4)
    2e10:	00f50733          	add	a4,a0,a5
    2e14:	00178793          	addi	a5,a5,1
    2e18:	00d70023          	sb	a3,0(a4)
    2e1c:	fe5ff06f          	j	2e00 <memcpy+0x4>

00002e20 <strlen>:
    2e20:	00000793          	li	a5,0
    2e24:	00f50733          	add	a4,a0,a5
    2e28:	00074703          	lbu	a4,0(a4)
    2e2c:	00071663          	bnez	a4,2e38 <strlen+0x18>
    2e30:	00078513          	mv	a0,a5
    2e34:	00008067          	ret
    2e38:	00178793          	addi	a5,a5,1
    2e3c:	fe9ff06f          	j	2e24 <strlen+0x4>

00002e40 <strncmp>:
    2e40:	00000793          	li	a5,0
    2e44:	00c79663          	bne	a5,a2,2e50 <strncmp+0x10>
    2e48:	00000513          	li	a0,0
    2e4c:	00008067          	ret
    2e50:	00f50733          	add	a4,a0,a5
    2e54:	00074683          	lbu	a3,0(a4)
    2e58:	00f58733          	add	a4,a1,a5
    2e5c:	00074703          	lbu	a4,0(a4)
    2e60:	00e6e863          	bltu	a3,a4,2e70 <strncmp+0x30>
    2e64:	00d76a63          	bltu	a4,a3,2e78 <strncmp+0x38>
    2e68:	00178793          	addi	a5,a5,1
    2e6c:	fd9ff06f          	j	2e44 <strncmp+0x4>
    2e70:	fff00513          	li	a0,-1
    2e74:	00008067          	ret
    2e78:	00100513          	li	a0,1
    2e7c:	00008067          	ret

00002e80 <strncpy>:
    2e80:	00000793          	li	a5,0
    2e84:	00c79463          	bne	a5,a2,2e8c <strncpy+0xc>
    2e88:	00008067          	ret
    2e8c:	00f58733          	add	a4,a1,a5
    2e90:	00074683          	lbu	a3,0(a4)
    2e94:	00f50733          	add	a4,a0,a5
    2e98:	00178793          	addi	a5,a5,1
    2e9c:	00d70023          	sb	a3,0(a4)
    2ea0:	fe5ff06f          	j	2e84 <strncpy+0x4>

00002ea4 <strcpy>:
    2ea4:	0005c783          	lbu	a5,0(a1)
    2ea8:	00079663          	bnez	a5,2eb4 <strcpy+0x10>
    2eac:	00050023          	sb	zero,0(a0)
    2eb0:	00008067          	ret
    2eb4:	00150513          	addi	a0,a0,1
    2eb8:	00158593          	addi	a1,a1,1
    2ebc:	fef50fa3          	sb	a5,-1(a0)
    2ec0:	fe5ff06f          	j	2ea4 <strcpy>

00002ec4 <oled_wait>:
    2ec4:	00000013          	nop
    2ec8:	00000013          	nop
    2ecc:	00000013          	nop
    2ed0:	00000013          	nop
    2ed4:	00000013          	nop
    2ed8:	00000013          	nop
    2edc:	00000013          	nop
    2ee0:	00008067          	ret

00002ee4 <oled_init_mode>:
    2ee4:	000077b7          	lui	a5,0x7
    2ee8:	93c7a703          	lw	a4,-1732(a5) # 693c <OLED_RST>
    2eec:	fe010113          	addi	sp,sp,-32
    2ef0:	00112e23          	sw	ra,28(sp)
    2ef4:	00812c23          	sw	s0,24(sp)
    2ef8:	00072023          	sw	zero,0(a4)
    2efc:	00040737          	lui	a4,0x40
    2f00:	00000013          	nop
    2f04:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
    2f08:	fe071ce3          	bnez	a4,2f00 <oled_init_mode+0x1c>
    2f0c:	93c7a703          	lw	a4,-1732(a5)
    2f10:	00100693          	li	a3,1
    2f14:	00d72023          	sw	a3,0(a4)
    2f18:	00040737          	lui	a4,0x40
    2f1c:	00000013          	nop
    2f20:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
    2f24:	fe071ce3          	bnez	a4,2f1c <oled_init_mode+0x38>
    2f28:	93c7a783          	lw	a5,-1732(a5)
    2f2c:	0007a023          	sw	zero,0(a5)
    2f30:	000407b7          	lui	a5,0x40
    2f34:	00000013          	nop
    2f38:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
    2f3c:	fe079ce3          	bnez	a5,2f34 <oled_init_mode+0x50>
    2f40:	00007737          	lui	a4,0x7
    2f44:	94072783          	lw	a5,-1728(a4) # 6940 <OLED>
    2f48:	2af00693          	li	a3,687
    2f4c:	00d7a023          	sw	a3,0(a5)
    2f50:	000407b7          	lui	a5,0x40
    2f54:	00000013          	nop
    2f58:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
    2f5c:	fe079ce3          	bnez	a5,2f54 <oled_init_mode+0x70>
    2f60:	94072403          	lw	s0,-1728(a4)
    2f64:	2a000793          	li	a5,672
    2f68:	00a12623          	sw	a0,12(sp)
    2f6c:	00f42023          	sw	a5,0(s0)
    2f70:	00000097          	auipc	ra,0x0
    2f74:	f54080e7          	jalr	-172(ra) # 2ec4 <oled_wait>
    2f78:	00c12503          	lw	a0,12(sp)
    2f7c:	4a000793          	li	a5,1184
    2f80:	00050463          	beqz	a0,2f88 <oled_init_mode+0xa4>
    2f84:	42000793          	li	a5,1056
    2f88:	00f42023          	sw	a5,0(s0)
    2f8c:	00000097          	auipc	ra,0x0
    2f90:	f38080e7          	jalr	-200(ra) # 2ec4 <oled_wait>
    2f94:	2fd00793          	li	a5,765
    2f98:	00f42023          	sw	a5,0(s0)
    2f9c:	00000097          	auipc	ra,0x0
    2fa0:	f28080e7          	jalr	-216(ra) # 2ec4 <oled_wait>
    2fa4:	4b100793          	li	a5,1201
    2fa8:	00f42023          	sw	a5,0(s0)
    2fac:	00000097          	auipc	ra,0x0
    2fb0:	f18080e7          	jalr	-232(ra) # 2ec4 <oled_wait>
    2fb4:	2a200793          	li	a5,674
    2fb8:	00f42023          	sw	a5,0(s0)
    2fbc:	00000097          	auipc	ra,0x0
    2fc0:	f08080e7          	jalr	-248(ra) # 2ec4 <oled_wait>
    2fc4:	40000793          	li	a5,1024
    2fc8:	00f42023          	sw	a5,0(s0)
    2fcc:	01812403          	lw	s0,24(sp)
    2fd0:	01c12083          	lw	ra,28(sp)
    2fd4:	02010113          	addi	sp,sp,32
    2fd8:	00000317          	auipc	t1,0x0
    2fdc:	eec30067          	jr	-276(t1) # 2ec4 <oled_wait>

00002fe0 <oled_init>:
    2fe0:	00000513          	li	a0,0
    2fe4:	00000317          	auipc	t1,0x0
    2fe8:	f0030067          	jr	-256(t1) # 2ee4 <oled_init_mode>

00002fec <oled_fullscreen>:
    2fec:	ff010113          	addi	sp,sp,-16
    2ff0:	000077b7          	lui	a5,0x7
    2ff4:	00812423          	sw	s0,8(sp)
    2ff8:	9407a403          	lw	s0,-1728(a5) # 6940 <OLED>
    2ffc:	00112623          	sw	ra,12(sp)
    3000:	00912223          	sw	s1,4(sp)
    3004:	01212023          	sw	s2,0(sp)
    3008:	21500793          	li	a5,533
    300c:	00f42023          	sw	a5,0(s0)
    3010:	40000913          	li	s2,1024
    3014:	00000097          	auipc	ra,0x0
    3018:	eb0080e7          	jalr	-336(ra) # 2ec4 <oled_wait>
    301c:	47f00493          	li	s1,1151
    3020:	01242023          	sw	s2,0(s0)
    3024:	00000097          	auipc	ra,0x0
    3028:	ea0080e7          	jalr	-352(ra) # 2ec4 <oled_wait>
    302c:	00942023          	sw	s1,0(s0)
    3030:	00000097          	auipc	ra,0x0
    3034:	e94080e7          	jalr	-364(ra) # 2ec4 <oled_wait>
    3038:	27500793          	li	a5,629
    303c:	00f42023          	sw	a5,0(s0)
    3040:	00000097          	auipc	ra,0x0
    3044:	e84080e7          	jalr	-380(ra) # 2ec4 <oled_wait>
    3048:	01242023          	sw	s2,0(s0)
    304c:	00000097          	auipc	ra,0x0
    3050:	e78080e7          	jalr	-392(ra) # 2ec4 <oled_wait>
    3054:	00942023          	sw	s1,0(s0)
    3058:	00000097          	auipc	ra,0x0
    305c:	e6c080e7          	jalr	-404(ra) # 2ec4 <oled_wait>
    3060:	25c00793          	li	a5,604
    3064:	00f42023          	sw	a5,0(s0)
    3068:	00812403          	lw	s0,8(sp)
    306c:	00c12083          	lw	ra,12(sp)
    3070:	00412483          	lw	s1,4(sp)
    3074:	00012903          	lw	s2,0(sp)
    3078:	01010113          	addi	sp,sp,16
    307c:	00000317          	auipc	t1,0x0
    3080:	e4830067          	jr	-440(t1) # 2ec4 <oled_wait>

00003084 <display_framebuffer>:
    3084:	000077b7          	lui	a5,0x7
    3088:	9307a503          	lw	a0,-1744(a5) # 6930 <DISPLAY>
    308c:	00008067          	ret

00003090 <display_set_cursor>:
    3090:	000077b7          	lui	a5,0x7
    3094:	fea7a823          	sw	a0,-16(a5) # 6ff0 <cursor_x>
    3098:	000077b7          	lui	a5,0x7
    309c:	feb7a623          	sw	a1,-20(a5) # 6fec <cursor_y>
    30a0:	00008067          	ret

000030a4 <display_set_front_back_color>:
    30a4:	000077b7          	lui	a5,0x7
    30a8:	fea784a3          	sb	a0,-23(a5) # 6fe9 <front_color>
    30ac:	000077b7          	lui	a5,0x7
    30b0:	feb78423          	sb	a1,-24(a5) # 6fe8 <back_color>
    30b4:	00008067          	ret

000030b8 <display_putchar>:
    30b8:	00a00793          	li	a5,10
    30bc:	00007737          	lui	a4,0x7
    30c0:	02f51663          	bne	a0,a5,30ec <display_putchar+0x34>
    30c4:	fe072823          	sw	zero,-16(a4) # 6ff0 <cursor_x>
    30c8:	00007737          	lui	a4,0x7
    30cc:	fec72783          	lw	a5,-20(a4) # 6fec <cursor_y>
    30d0:	00878793          	addi	a5,a5,8
    30d4:	fef72623          	sw	a5,-20(a4)
    30d8:	07f00713          	li	a4,127
    30dc:	00f75663          	bge	a4,a5,30e8 <display_putchar+0x30>
    30e0:	000077b7          	lui	a5,0x7
    30e4:	fe07a623          	sw	zero,-20(a5) # 6fec <cursor_y>
    30e8:	00008067          	ret
    30ec:	ff010113          	addi	sp,sp,-16
    30f0:	00812623          	sw	s0,12(sp)
    30f4:	01f00793          	li	a5,31
    30f8:	0ca7d263          	bge	a5,a0,31bc <display_putchar+0x104>
    30fc:	00007e37          	lui	t3,0x7
    3100:	fece2783          	lw	a5,-20(t3) # 6fec <cursor_y>
    3104:	07800693          	li	a3,120
    3108:	00800593          	li	a1,8
    310c:	00f6d663          	bge	a3,a5,3118 <display_putchar+0x60>
    3110:	08000593          	li	a1,128
    3114:	40f585b3          	sub	a1,a1,a5
    3118:	ff072783          	lw	a5,-16(a4)
    311c:	07b00693          	li	a3,123
    3120:	00500813          	li	a6,5
    3124:	00f6d663          	bge	a3,a5,3130 <display_putchar+0x78>
    3128:	08000813          	li	a6,128
    312c:	40f80833          	sub	a6,a6,a5
    3130:	000077b7          	lui	a5,0x7
    3134:	9307a283          	lw	t0,-1744(a5) # 6930 <DISPLAY>
    3138:	000076b7          	lui	a3,0x7
    313c:	00251793          	slli	a5,a0,0x2
    3140:	bd468693          	addi	a3,a3,-1068 # 6bd4 <font>
    3144:	00a787b3          	add	a5,a5,a0
    3148:	00d78533          	add	a0,a5,a3
    314c:	00100f93          	li	t6,1
    3150:	00000693          	li	a3,0
    3154:	000073b7          	lui	t2,0x7
    3158:	00007437          	lui	s0,0x7
    315c:	06b6d063          	bge	a3,a1,31bc <display_putchar+0x104>
    3160:	00df9f33          	sll	t5,t6,a3
    3164:	00050893          	mv	a7,a0
    3168:	00000613          	li	a2,0
    316c:	03c0006f          	j	31a8 <display_putchar+0xf0>
    3170:	f608c783          	lbu	a5,-160(a7)
    3174:	01e7f7b3          	and	a5,a5,t5
    3178:	02078e63          	beqz	a5,31b4 <display_putchar+0xfc>
    317c:	fe944e83          	lbu	t4,-23(s0) # 6fe9 <front_color>
    3180:	ff072783          	lw	a5,-16(a4)
    3184:	fece2303          	lw	t1,-20(t3)
    3188:	00188893          	addi	a7,a7,1
    318c:	00f607b3          	add	a5,a2,a5
    3190:	00779793          	slli	a5,a5,0x7
    3194:	00668333          	add	t1,a3,t1
    3198:	006787b3          	add	a5,a5,t1
    319c:	00f287b3          	add	a5,t0,a5
    31a0:	01d78023          	sb	t4,0(a5)
    31a4:	00160613          	addi	a2,a2,1 # 4001 <fatfs_lfn_generate_tail+0x9>
    31a8:	fd0644e3          	blt	a2,a6,3170 <display_putchar+0xb8>
    31ac:	00168693          	addi	a3,a3,1
    31b0:	fadff06f          	j	315c <display_putchar+0xa4>
    31b4:	fe83ce83          	lbu	t4,-24(t2) # 6fe8 <back_color>
    31b8:	fc9ff06f          	j	3180 <display_putchar+0xc8>
    31bc:	ff072783          	lw	a5,-16(a4)
    31c0:	07f00693          	li	a3,127
    31c4:	00578793          	addi	a5,a5,5
    31c8:	00f6c663          	blt	a3,a5,31d4 <display_putchar+0x11c>
    31cc:	fef72823          	sw	a5,-16(a4)
    31d0:	0240006f          	j	31f4 <display_putchar+0x13c>
    31d4:	fe072823          	sw	zero,-16(a4)
    31d8:	00007737          	lui	a4,0x7
    31dc:	fec72783          	lw	a5,-20(a4) # 6fec <cursor_y>
    31e0:	00878793          	addi	a5,a5,8
    31e4:	fef72623          	sw	a5,-20(a4)
    31e8:	00f6d663          	bge	a3,a5,31f4 <display_putchar+0x13c>
    31ec:	000077b7          	lui	a5,0x7
    31f0:	fe07a623          	sw	zero,-20(a5) # 6fec <cursor_y>
    31f4:	00c12403          	lw	s0,12(sp)
    31f8:	01010113          	addi	sp,sp,16
    31fc:	00008067          	ret

00003200 <display_refresh>:
    3200:	00008067          	ret

00003204 <print_string>:
    3204:	ff010113          	addi	sp,sp,-16
    3208:	00812423          	sw	s0,8(sp)
    320c:	00912223          	sw	s1,4(sp)
    3210:	00112623          	sw	ra,12(sp)
    3214:	00050413          	mv	s0,a0
    3218:	000074b7          	lui	s1,0x7
    321c:	00044503          	lbu	a0,0(s0)
    3220:	00051c63          	bnez	a0,3238 <print_string+0x34>
    3224:	00c12083          	lw	ra,12(sp)
    3228:	00812403          	lw	s0,8(sp)
    322c:	00412483          	lw	s1,4(sp)
    3230:	01010113          	addi	sp,sp,16
    3234:	00008067          	ret
    3238:	ff44a783          	lw	a5,-12(s1) # 6ff4 <f_putchar>
    323c:	00140413          	addi	s0,s0,1
    3240:	000780e7          	jalr	a5
    3244:	fd9ff06f          	j	321c <print_string+0x18>

00003248 <print_dec>:
    3248:	ef010113          	addi	sp,sp,-272
    324c:	10812423          	sw	s0,264(sp)
    3250:	10912223          	sw	s1,260(sp)
    3254:	10112623          	sw	ra,268(sp)
    3258:	11212023          	sw	s2,256(sp)
    325c:	00050413          	mv	s0,a0
    3260:	000074b7          	lui	s1,0x7
    3264:	08045063          	bgez	s0,32e4 <print_dec+0x9c>
    3268:	ff44a783          	lw	a5,-12(s1) # 6ff4 <f_putchar>
    326c:	02d00513          	li	a0,45
    3270:	40800433          	neg	s0,s0
    3274:	000780e7          	jalr	a5
    3278:	fedff06f          	j	3264 <print_dec+0x1c>
    327c:	00040513          	mv	a0,s0
    3280:	00a00593          	li	a1,10
    3284:	00000097          	auipc	ra,0x0
    3288:	aa8080e7          	jalr	-1368(ra) # 2d2c <__divsi3>
    328c:	00251793          	slli	a5,a0,0x2
    3290:	00f507b3          	add	a5,a0,a5
    3294:	00179793          	slli	a5,a5,0x1
    3298:	40f40433          	sub	s0,s0,a5
    329c:	00148493          	addi	s1,s1,1
    32a0:	fe848fa3          	sb	s0,-1(s1)
    32a4:	00050413          	mv	s0,a0
    32a8:	fc041ae3          	bnez	s0,327c <print_dec+0x34>
    32ac:	fd2488e3          	beq	s1,s2,327c <print_dec+0x34>
    32b0:	00007437          	lui	s0,0x7
    32b4:	fff4c503          	lbu	a0,-1(s1)
    32b8:	ff442783          	lw	a5,-12(s0) # 6ff4 <f_putchar>
    32bc:	fff48493          	addi	s1,s1,-1
    32c0:	03050513          	addi	a0,a0,48
    32c4:	000780e7          	jalr	a5
    32c8:	ff2496e3          	bne	s1,s2,32b4 <print_dec+0x6c>
    32cc:	10c12083          	lw	ra,268(sp)
    32d0:	10812403          	lw	s0,264(sp)
    32d4:	10412483          	lw	s1,260(sp)
    32d8:	10012903          	lw	s2,256(sp)
    32dc:	11010113          	addi	sp,sp,272
    32e0:	00008067          	ret
    32e4:	00010493          	mv	s1,sp
    32e8:	00010913          	mv	s2,sp
    32ec:	fbdff06f          	j	32a8 <print_dec+0x60>

000032f0 <print_hex_digits>:
    32f0:	fe010113          	addi	sp,sp,-32
    32f4:	00812c23          	sw	s0,24(sp)
    32f8:	00912a23          	sw	s1,20(sp)
    32fc:	fff58413          	addi	s0,a1,-1
    3300:	000074b7          	lui	s1,0x7
    3304:	01212823          	sw	s2,16(sp)
    3308:	01312623          	sw	s3,12(sp)
    330c:	00112e23          	sw	ra,28(sp)
    3310:	00050993          	mv	s3,a0
    3314:	00241413          	slli	s0,s0,0x2
    3318:	b6848493          	addi	s1,s1,-1176 # 6b68 <LEDS+0x224>
    331c:	00007937          	lui	s2,0x7
    3320:	02045063          	bgez	s0,3340 <print_hex_digits+0x50>
    3324:	01c12083          	lw	ra,28(sp)
    3328:	01812403          	lw	s0,24(sp)
    332c:	01412483          	lw	s1,20(sp)
    3330:	01012903          	lw	s2,16(sp)
    3334:	00c12983          	lw	s3,12(sp)
    3338:	02010113          	addi	sp,sp,32
    333c:	00008067          	ret
    3340:	0089d7b3          	srl	a5,s3,s0
    3344:	00f7f793          	andi	a5,a5,15
    3348:	00f487b3          	add	a5,s1,a5
    334c:	ff492703          	lw	a4,-12(s2) # 6ff4 <f_putchar>
    3350:	0007c503          	lbu	a0,0(a5)
    3354:	ffc40413          	addi	s0,s0,-4
    3358:	000700e7          	jalr	a4
    335c:	fc5ff06f          	j	3320 <print_hex_digits+0x30>

00003360 <print_hex>:
    3360:	00800593          	li	a1,8
    3364:	00000317          	auipc	t1,0x0
    3368:	f8c30067          	jr	-116(t1) # 32f0 <print_hex_digits>

0000336c <printf>:
    336c:	fa010113          	addi	sp,sp,-96
    3370:	04f12a23          	sw	a5,84(sp)
    3374:	04410793          	addi	a5,sp,68
    3378:	02812c23          	sw	s0,56(sp)
    337c:	02912a23          	sw	s1,52(sp)
    3380:	03212823          	sw	s2,48(sp)
    3384:	03312623          	sw	s3,44(sp)
    3388:	03412423          	sw	s4,40(sp)
    338c:	03512223          	sw	s5,36(sp)
    3390:	03612023          	sw	s6,32(sp)
    3394:	02112e23          	sw	ra,60(sp)
    3398:	01712e23          	sw	s7,28(sp)
    339c:	00050413          	mv	s0,a0
    33a0:	04b12223          	sw	a1,68(sp)
    33a4:	04c12423          	sw	a2,72(sp)
    33a8:	04d12623          	sw	a3,76(sp)
    33ac:	04e12823          	sw	a4,80(sp)
    33b0:	05012c23          	sw	a6,88(sp)
    33b4:	05112e23          	sw	a7,92(sp)
    33b8:	00f12623          	sw	a5,12(sp)
    33bc:	02500913          	li	s2,37
    33c0:	000074b7          	lui	s1,0x7
    33c4:	07300993          	li	s3,115
    33c8:	07800a13          	li	s4,120
    33cc:	06400a93          	li	s5,100
    33d0:	06300b13          	li	s6,99
    33d4:	00044503          	lbu	a0,0(s0)
    33d8:	02051863          	bnez	a0,3408 <printf+0x9c>
    33dc:	03c12083          	lw	ra,60(sp)
    33e0:	03812403          	lw	s0,56(sp)
    33e4:	03412483          	lw	s1,52(sp)
    33e8:	03012903          	lw	s2,48(sp)
    33ec:	02c12983          	lw	s3,44(sp)
    33f0:	02812a03          	lw	s4,40(sp)
    33f4:	02412a83          	lw	s5,36(sp)
    33f8:	02012b03          	lw	s6,32(sp)
    33fc:	01c12b83          	lw	s7,28(sp)
    3400:	06010113          	addi	sp,sp,96
    3404:	00008067          	ret
    3408:	09251a63          	bne	a0,s2,349c <printf+0x130>
    340c:	00144503          	lbu	a0,1(s0)
    3410:	00140b93          	addi	s7,s0,1
    3414:	03351463          	bne	a0,s3,343c <printf+0xd0>
    3418:	00c12783          	lw	a5,12(sp)
    341c:	0007a503          	lw	a0,0(a5)
    3420:	00478713          	addi	a4,a5,4
    3424:	00e12623          	sw	a4,12(sp)
    3428:	00000097          	auipc	ra,0x0
    342c:	ddc080e7          	jalr	-548(ra) # 3204 <print_string>
    3430:	000b8413          	mv	s0,s7
    3434:	00140413          	addi	s0,s0,1
    3438:	f9dff06f          	j	33d4 <printf+0x68>
    343c:	03451063          	bne	a0,s4,345c <printf+0xf0>
    3440:	00c12783          	lw	a5,12(sp)
    3444:	0007a503          	lw	a0,0(a5)
    3448:	00478713          	addi	a4,a5,4
    344c:	00e12623          	sw	a4,12(sp)
    3450:	00000097          	auipc	ra,0x0
    3454:	f10080e7          	jalr	-240(ra) # 3360 <print_hex>
    3458:	fd9ff06f          	j	3430 <printf+0xc4>
    345c:	03551063          	bne	a0,s5,347c <printf+0x110>
    3460:	00c12783          	lw	a5,12(sp)
    3464:	0007a503          	lw	a0,0(a5)
    3468:	00478713          	addi	a4,a5,4
    346c:	00e12623          	sw	a4,12(sp)
    3470:	00000097          	auipc	ra,0x0
    3474:	dd8080e7          	jalr	-552(ra) # 3248 <print_dec>
    3478:	fb9ff06f          	j	3430 <printf+0xc4>
    347c:	ff44a783          	lw	a5,-12(s1) # 6ff4 <f_putchar>
    3480:	01651a63          	bne	a0,s6,3494 <printf+0x128>
    3484:	00c12703          	lw	a4,12(sp)
    3488:	00072503          	lw	a0,0(a4)
    348c:	00470693          	addi	a3,a4,4
    3490:	00d12623          	sw	a3,12(sp)
    3494:	000780e7          	jalr	a5
    3498:	f99ff06f          	j	3430 <printf+0xc4>
    349c:	ff44a783          	lw	a5,-12(s1)
    34a0:	000780e7          	jalr	a5
    34a4:	f91ff06f          	j	3434 <printf+0xc8>

000034a8 <__mulsi3>:
    34a8:	00050793          	mv	a5,a0
    34ac:	00000513          	li	a0,0
    34b0:	00079463          	bnez	a5,34b8 <__mulsi3+0x10>
    34b4:	00008067          	ret
    34b8:	01f79693          	slli	a3,a5,0x1f
    34bc:	41f6d713          	srai	a4,a3,0x1f
    34c0:	00b77733          	and	a4,a4,a1
    34c4:	00e50533          	add	a0,a0,a4
    34c8:	0017d793          	srli	a5,a5,0x1
    34cc:	00159593          	slli	a1,a1,0x1
    34d0:	fe1ff06f          	j	34b0 <__mulsi3+0x8>

000034d4 <fat_list_insert_last>:
    34d4:	00452783          	lw	a5,4(a0)
    34d8:	04079263          	bnez	a5,351c <fat_list_insert_last+0x48>
    34dc:	00052783          	lw	a5,0(a0)
    34e0:	00079c63          	bnez	a5,34f8 <fat_list_insert_last+0x24>
    34e4:	00b52023          	sw	a1,0(a0)
    34e8:	00b52223          	sw	a1,4(a0)
    34ec:	0005a023          	sw	zero,0(a1)
    34f0:	0005a223          	sw	zero,4(a1)
    34f4:	00008067          	ret
    34f8:	0007a703          	lw	a4,0(a5)
    34fc:	00f5a223          	sw	a5,4(a1)
    3500:	00e5a023          	sw	a4,0(a1)
    3504:	00071863          	bnez	a4,3514 <fat_list_insert_last+0x40>
    3508:	00b52023          	sw	a1,0(a0)
    350c:	00b7a023          	sw	a1,0(a5)
    3510:	00008067          	ret
    3514:	00b72223          	sw	a1,4(a4)
    3518:	ff5ff06f          	j	350c <fat_list_insert_last+0x38>
    351c:	0047a703          	lw	a4,4(a5)
    3520:	00f5a023          	sw	a5,0(a1)
    3524:	00e5a223          	sw	a4,4(a1)
    3528:	00071863          	bnez	a4,3538 <fat_list_insert_last+0x64>
    352c:	00b52223          	sw	a1,4(a0)
    3530:	00b7a223          	sw	a1,4(a5)
    3534:	00008067          	ret
    3538:	00b72023          	sw	a1,0(a4)
    353c:	ff5ff06f          	j	3530 <fat_list_insert_last+0x5c>

00003540 <FileString_StrCmpNoCase>:
    3540:	00050e93          	mv	t4,a0
    3544:	00000793          	li	a5,0
    3548:	01900e13          	li	t3,25
    354c:	00c79663          	bne	a5,a2,3558 <FileString_StrCmpNoCase+0x18>
    3550:	00000513          	li	a0,0
    3554:	00008067          	ret
    3558:	00fe8733          	add	a4,t4,a5
    355c:	00074803          	lbu	a6,0(a4)
    3560:	00f58733          	add	a4,a1,a5
    3564:	00074883          	lbu	a7,0(a4)
    3568:	fbf80713          	addi	a4,a6,-65
    356c:	0ff77713          	zext.b	a4,a4
    3570:	00080693          	mv	a3,a6
    3574:	00ee6663          	bltu	t3,a4,3580 <FileString_StrCmpNoCase+0x40>
    3578:	02080693          	addi	a3,a6,32
    357c:	0ff6f693          	zext.b	a3,a3
    3580:	fbf88313          	addi	t1,a7,-65
    3584:	0ff37313          	zext.b	t1,t1
    3588:	00088713          	mv	a4,a7
    358c:	006e6663          	bltu	t3,t1,3598 <FileString_StrCmpNoCase+0x58>
    3590:	02088713          	addi	a4,a7,32
    3594:	0ff77713          	zext.b	a4,a4
    3598:	40e68533          	sub	a0,a3,a4
    359c:	00e69863          	bne	a3,a4,35ac <FileString_StrCmpNoCase+0x6c>
    35a0:	00178793          	addi	a5,a5,1
    35a4:	00088463          	beqz	a7,35ac <FileString_StrCmpNoCase+0x6c>
    35a8:	fa0812e3          	bnez	a6,354c <FileString_StrCmpNoCase+0xc>
    35ac:	00008067          	ret

000035b0 <FileString_GetExtension>:
    35b0:	00050793          	mv	a5,a0
    35b4:	fff00713          	li	a4,-1
    35b8:	02e00613          	li	a2,46
    35bc:	0007c683          	lbu	a3,0(a5)
    35c0:	00069663          	bnez	a3,35cc <FileString_GetExtension+0x1c>
    35c4:	00070513          	mv	a0,a4
    35c8:	00008067          	ret
    35cc:	00c69463          	bne	a3,a2,35d4 <FileString_GetExtension+0x24>
    35d0:	40a78733          	sub	a4,a5,a0
    35d4:	00178793          	addi	a5,a5,1
    35d8:	fe5ff06f          	j	35bc <FileString_GetExtension+0xc>

000035dc <fatfs_fat_writeback>:
    35dc:	00059e63          	bnez	a1,35f8 <fatfs_fat_writeback+0x1c>
    35e0:	00000513          	li	a0,0
    35e4:	00008067          	ret
    35e8:	00000513          	li	a0,0
    35ec:	01c12083          	lw	ra,28(sp)
    35f0:	02010113          	addi	sp,sp,32
    35f4:	00008067          	ret
    35f8:	2045a783          	lw	a5,516(a1)
    35fc:	04078e63          	beqz	a5,3658 <fatfs_fat_writeback+0x7c>
    3600:	03852683          	lw	a3,56(a0)
    3604:	00050793          	mv	a5,a0
    3608:	04068663          	beqz	a3,3654 <fatfs_fat_writeback+0x78>
    360c:	0147a703          	lw	a4,20(a5)
    3610:	2005a503          	lw	a0,512(a1)
    3614:	0207a803          	lw	a6,32(a5)
    3618:	00100613          	li	a2,1
    361c:	fe010113          	addi	sp,sp,-32
    3620:	40e607b3          	sub	a5,a2,a4
    3624:	00112e23          	sw	ra,28(sp)
    3628:	00a787b3          	add	a5,a5,a0
    362c:	00f87663          	bgeu	a6,a5,3638 <fatfs_fat_writeback+0x5c>
    3630:	01070733          	add	a4,a4,a6
    3634:	40a70633          	sub	a2,a4,a0
    3638:	00b12623          	sw	a1,12(sp)
    363c:	000680e7          	jalr	a3
    3640:	fa0504e3          	beqz	a0,35e8 <fatfs_fat_writeback+0xc>
    3644:	00c12583          	lw	a1,12(sp)
    3648:	00100513          	li	a0,1
    364c:	2005a223          	sw	zero,516(a1)
    3650:	f9dff06f          	j	35ec <fatfs_fat_writeback+0x10>
    3654:	2005a223          	sw	zero,516(a1)
    3658:	00100513          	li	a0,1
    365c:	00008067          	ret

00003660 <fatfs_fat_read_sector>:
    3660:	fe010113          	addi	sp,sp,-32
    3664:	01212823          	sw	s2,16(sp)
    3668:	25452903          	lw	s2,596(a0)
    366c:	00812c23          	sw	s0,24(sp)
    3670:	00112e23          	sw	ra,28(sp)
    3674:	00912a23          	sw	s1,20(sp)
    3678:	01312623          	sw	s3,12(sp)
    367c:	00000413          	li	s0,0
    3680:	04091463          	bnez	s2,36c8 <fatfs_fat_read_sector+0x68>
    3684:	25452783          	lw	a5,596(a0)
    3688:	00058493          	mv	s1,a1
    368c:	00050993          	mv	s3,a0
    3690:	20f42623          	sw	a5,524(s0)
    3694:	20442783          	lw	a5,516(s0)
    3698:	24852a23          	sw	s0,596(a0)
    369c:	08079863          	bnez	a5,372c <fatfs_fat_read_sector+0xcc>
    36a0:	0349a783          	lw	a5,52(s3)
    36a4:	20942023          	sw	s1,512(s0)
    36a8:	00100613          	li	a2,1
    36ac:	00040593          	mv	a1,s0
    36b0:	00048513          	mv	a0,s1
    36b4:	000780e7          	jalr	a5
    36b8:	08051463          	bnez	a0,3740 <fatfs_fat_read_sector+0xe0>
    36bc:	fff00793          	li	a5,-1
    36c0:	20f42023          	sw	a5,512(s0)
    36c4:	0480006f          	j	370c <fatfs_fat_read_sector+0xac>
    36c8:	20092783          	lw	a5,512(s2)
    36cc:	00f5e663          	bltu	a1,a5,36d8 <fatfs_fat_read_sector+0x78>
    36d0:	00178713          	addi	a4,a5,1
    36d4:	02e5e463          	bltu	a1,a4,36fc <fatfs_fat_read_sector+0x9c>
    36d8:	20c92783          	lw	a5,524(s2)
    36dc:	00079663          	bnez	a5,36e8 <fatfs_fat_read_sector+0x88>
    36e0:	00040a63          	beqz	s0,36f4 <fatfs_fat_read_sector+0x94>
    36e4:	20042623          	sw	zero,524(s0)
    36e8:	00090413          	mv	s0,s2
    36ec:	20c92903          	lw	s2,524(s2)
    36f0:	f91ff06f          	j	3680 <fatfs_fat_read_sector+0x20>
    36f4:	24052a23          	sw	zero,596(a0)
    36f8:	ff1ff06f          	j	36e8 <fatfs_fat_read_sector+0x88>
    36fc:	40f585b3          	sub	a1,a1,a5
    3700:	00959593          	slli	a1,a1,0x9
    3704:	00b905b3          	add	a1,s2,a1
    3708:	20b92423          	sw	a1,520(s2)
    370c:	01c12083          	lw	ra,28(sp)
    3710:	01812403          	lw	s0,24(sp)
    3714:	01412483          	lw	s1,20(sp)
    3718:	00c12983          	lw	s3,12(sp)
    371c:	00090513          	mv	a0,s2
    3720:	01012903          	lw	s2,16(sp)
    3724:	02010113          	addi	sp,sp,32
    3728:	00008067          	ret
    372c:	00040593          	mv	a1,s0
    3730:	00000097          	auipc	ra,0x0
    3734:	eac080e7          	jalr	-340(ra) # 35dc <fatfs_fat_writeback>
    3738:	f60514e3          	bnez	a0,36a0 <fatfs_fat_read_sector+0x40>
    373c:	fd1ff06f          	j	370c <fatfs_fat_read_sector+0xac>
    3740:	20842423          	sw	s0,520(s0)
    3744:	00040913          	mv	s2,s0
    3748:	fc5ff06f          	j	370c <fatfs_fat_read_sector+0xac>

0000374c <_allocate_file>:
    374c:	000077b7          	lui	a5,0x7
    3750:	ff878793          	addi	a5,a5,-8 # 6ff8 <_free_file_list>
    3754:	0007a583          	lw	a1,0(a5)
    3758:	06058263          	beqz	a1,37bc <_allocate_file+0x70>
    375c:	0005a703          	lw	a4,0(a1)
    3760:	fe010113          	addi	sp,sp,-32
    3764:	00112e23          	sw	ra,28(sp)
    3768:	0045a683          	lw	a3,4(a1)
    376c:	04071063          	bnez	a4,37ac <_allocate_file+0x60>
    3770:	00d7a023          	sw	a3,0(a5)
    3774:	0045a683          	lw	a3,4(a1)
    3778:	02069e63          	bnez	a3,37b4 <_allocate_file+0x68>
    377c:	00e7a223          	sw	a4,4(a5)
    3780:	00007537          	lui	a0,0x7
    3784:	00050513          	mv	a0,a0
    3788:	00b12623          	sw	a1,12(sp)
    378c:	00000097          	auipc	ra,0x0
    3790:	d48080e7          	jalr	-696(ra) # 34d4 <fat_list_insert_last>
    3794:	00c12583          	lw	a1,12(sp)
    3798:	01c12083          	lw	ra,28(sp)
    379c:	bc458593          	addi	a1,a1,-1084
    37a0:	00058513          	mv	a0,a1
    37a4:	02010113          	addi	sp,sp,32
    37a8:	00008067          	ret
    37ac:	00d72223          	sw	a3,4(a4)
    37b0:	fc5ff06f          	j	3774 <_allocate_file+0x28>
    37b4:	00e6a023          	sw	a4,0(a3)
    37b8:	fc9ff06f          	j	3780 <_allocate_file+0x34>
    37bc:	00058513          	mv	a0,a1
    37c0:	00008067          	ret

000037c4 <_free_file>:
    37c4:	43c52783          	lw	a5,1084(a0) # 743c <files+0x310>
    37c8:	44052703          	lw	a4,1088(a0)
    37cc:	43c50593          	addi	a1,a0,1084
    37d0:	02079663          	bnez	a5,37fc <_free_file+0x38>
    37d4:	000076b7          	lui	a3,0x7
    37d8:	00e6a023          	sw	a4,0(a3) # 7000 <_open_file_list>
    37dc:	44052703          	lw	a4,1088(a0)
    37e0:	02071263          	bnez	a4,3804 <_free_file+0x40>
    37e4:	00007737          	lui	a4,0x7
    37e8:	00f72223          	sw	a5,4(a4) # 7004 <_open_file_list+0x4>
    37ec:	00007537          	lui	a0,0x7
    37f0:	ff850513          	addi	a0,a0,-8 # 6ff8 <_free_file_list>
    37f4:	00000317          	auipc	t1,0x0
    37f8:	ce030067          	jr	-800(t1) # 34d4 <fat_list_insert_last>
    37fc:	00e7a223          	sw	a4,4(a5)
    3800:	fddff06f          	j	37dc <_free_file+0x18>
    3804:	00f72023          	sw	a5,0(a4)
    3808:	fe5ff06f          	j	37ec <_free_file+0x28>

0000380c <fatfs_lba_of_cluster>:
    380c:	ff010113          	addi	sp,sp,-16
    3810:	00812423          	sw	s0,8(sp)
    3814:	00112623          	sw	ra,12(sp)
    3818:	00050413          	mv	s0,a0
    381c:	ffe58513          	addi	a0,a1,-2
    3820:	00044583          	lbu	a1,0(s0)
    3824:	00000097          	auipc	ra,0x0
    3828:	c84080e7          	jalr	-892(ra) # 34a8 <__mulsi3>
    382c:	00442783          	lw	a5,4(s0)
    3830:	00f50533          	add	a0,a0,a5
    3834:	03042783          	lw	a5,48(s0)
    3838:	00079863          	bnez	a5,3848 <fatfs_lba_of_cluster+0x3c>
    383c:	02845783          	lhu	a5,40(s0)
    3840:	4047d793          	srai	a5,a5,0x4
    3844:	00f50533          	add	a0,a0,a5
    3848:	00c12083          	lw	ra,12(sp)
    384c:	00812403          	lw	s0,8(sp)
    3850:	01010113          	addi	sp,sp,16
    3854:	00008067          	ret

00003858 <fatfs_sector_read>:
    3858:	03452783          	lw	a5,52(a0)
    385c:	00058713          	mv	a4,a1
    3860:	00070513          	mv	a0,a4
    3864:	00060593          	mv	a1,a2
    3868:	00068613          	mv	a2,a3
    386c:	00078067          	jr	a5

00003870 <fatfs_sector_write>:
    3870:	03852783          	lw	a5,56(a0)
    3874:	00058713          	mv	a4,a1
    3878:	00070513          	mv	a0,a4
    387c:	00060593          	mv	a1,a2
    3880:	00068613          	mv	a2,a3
    3884:	00078067          	jr	a5

00003888 <fatfs_write_sector>:
    3888:	03852703          	lw	a4,56(a0)
    388c:	0a070463          	beqz	a4,3934 <fatfs_write_sector+0xac>
    3890:	03052883          	lw	a7,48(a0)
    3894:	00050793          	mv	a5,a0
    3898:	0115e833          	or	a6,a1,a7
    389c:	02081e63          	bnez	a6,38d8 <fatfs_write_sector+0x50>
    38a0:	01052583          	lw	a1,16(a0)
    38a4:	08b67863          	bgeu	a2,a1,3934 <fatfs_write_sector+0xac>
    38a8:	01c52503          	lw	a0,28(a0)
    38ac:	00c7a583          	lw	a1,12(a5)
    38b0:	00b50533          	add	a0,a0,a1
    38b4:	00c50533          	add	a0,a0,a2
    38b8:	00068863          	beqz	a3,38c8 <fatfs_write_sector+0x40>
    38bc:	00100613          	li	a2,1
    38c0:	00068593          	mv	a1,a3
    38c4:	00070067          	jr	a4
    38c8:	24a7a223          	sw	a0,580(a5)
    38cc:	00100613          	li	a2,1
    38d0:	04478593          	addi	a1,a5,68
    38d4:	ff1ff06f          	j	38c4 <fatfs_write_sector+0x3c>
    38d8:	fe010113          	addi	sp,sp,-32
    38dc:	00e12623          	sw	a4,12(sp)
    38e0:	00d12423          	sw	a3,8(sp)
    38e4:	00c12223          	sw	a2,4(sp)
    38e8:	00112e23          	sw	ra,28(sp)
    38ec:	00a12023          	sw	a0,0(sp)
    38f0:	00000097          	auipc	ra,0x0
    38f4:	f1c080e7          	jalr	-228(ra) # 380c <fatfs_lba_of_cluster>
    38f8:	00412603          	lw	a2,4(sp)
    38fc:	00812683          	lw	a3,8(sp)
    3900:	00012783          	lw	a5,0(sp)
    3904:	00c12703          	lw	a4,12(sp)
    3908:	00a60533          	add	a0,a2,a0
    390c:	00068c63          	beqz	a3,3924 <fatfs_write_sector+0x9c>
    3910:	00100613          	li	a2,1
    3914:	00068593          	mv	a1,a3
    3918:	01c12083          	lw	ra,28(sp)
    391c:	02010113          	addi	sp,sp,32
    3920:	fa5ff06f          	j	38c4 <fatfs_write_sector+0x3c>
    3924:	24a7a223          	sw	a0,580(a5)
    3928:	00100613          	li	a2,1
    392c:	04478593          	addi	a1,a5,68
    3930:	fe9ff06f          	j	3918 <fatfs_write_sector+0x90>
    3934:	00000513          	li	a0,0
    3938:	00008067          	ret

0000393c <fl_init>:
    393c:	ff010113          	addi	sp,sp,-16
    3940:	00007537          	lui	a0,0x7
    3944:	000077b7          	lui	a5,0x7
    3948:	000095b7          	lui	a1,0x9
    394c:	00112623          	sw	ra,12(sp)
    3950:	ff850513          	addi	a0,a0,-8 # 6ff8 <_free_file_list>
    3954:	00078793          	mv	a5,a5
    3958:	4d058593          	addi	a1,a1,1232 # 94d0 <_files+0x43c>
    395c:	00052223          	sw	zero,4(a0)
    3960:	00052023          	sw	zero,0(a0)
    3964:	0007a223          	sw	zero,4(a5) # 7004 <_open_file_list+0x4>
    3968:	0007a023          	sw	zero,0(a5)
    396c:	00000097          	auipc	ra,0x0
    3970:	b68080e7          	jalr	-1176(ra) # 34d4 <fat_list_insert_last>
    3974:	000077b7          	lui	a5,0x7
    3978:	0000a5b7          	lui	a1,0xa
    397c:	ff878513          	addi	a0,a5,-8 # 6ff8 <_free_file_list>
    3980:	91458593          	addi	a1,a1,-1772 # 9914 <_files+0x880>
    3984:	00000097          	auipc	ra,0x0
    3988:	b50080e7          	jalr	-1200(ra) # 34d4 <fat_list_insert_last>
    398c:	00c12083          	lw	ra,12(sp)
    3990:	000077b7          	lui	a5,0x7
    3994:	00100713          	li	a4,1
    3998:	00e7a623          	sw	a4,12(a5) # 700c <_filelib_init>
    399c:	01010113          	addi	sp,sp,16
    39a0:	00008067          	ret

000039a4 <fl_fseek>:
    39a4:	000077b7          	lui	a5,0x7
    39a8:	00c7a783          	lw	a5,12(a5) # 700c <_filelib_init>
    39ac:	fd010113          	addi	sp,sp,-48
    39b0:	02812423          	sw	s0,40(sp)
    39b4:	02912223          	sw	s1,36(sp)
    39b8:	01312e23          	sw	s3,28(sp)
    39bc:	02112623          	sw	ra,44(sp)
    39c0:	03212023          	sw	s2,32(sp)
    39c4:	00050413          	mv	s0,a0
    39c8:	00058493          	mv	s1,a1
    39cc:	00060993          	mv	s3,a2
    39d0:	00079663          	bnez	a5,39dc <fl_fseek+0x38>
    39d4:	00000097          	auipc	ra,0x0
    39d8:	f68080e7          	jalr	-152(ra) # 393c <fl_init>
    39dc:	fff00513          	li	a0,-1
    39e0:	08040263          	beqz	s0,3a64 <fl_fseek+0xc0>
    39e4:	00048663          	beqz	s1,39f0 <fl_fseek+0x4c>
    39e8:	ffe98793          	addi	a5,s3,-2
    39ec:	06078c63          	beqz	a5,3a64 <fl_fseek+0xc0>
    39f0:	00009937          	lui	s2,0x9
    39f4:	c2c90913          	addi	s2,s2,-980 # 8c2c <_fs>
    39f8:	03c92783          	lw	a5,60(s2)
    39fc:	00078463          	beqz	a5,3a04 <fl_fseek+0x60>
    3a00:	000780e7          	jalr	a5
    3a04:	fff00513          	li	a0,-1
    3a08:	42a42823          	sw	a0,1072(s0)
    3a0c:	42042a23          	sw	zero,1076(s0)
    3a10:	00099c63          	bnez	s3,3a28 <fl_fseek+0x84>
    3a14:	00c42783          	lw	a5,12(s0)
    3a18:	00942423          	sw	s1,8(s0)
    3a1c:	0297f863          	bgeu	a5,s1,3a4c <fl_fseek+0xa8>
    3a20:	00f42423          	sw	a5,8(s0)
    3a24:	0280006f          	j	3a4c <fl_fseek+0xa8>
    3a28:	00100793          	li	a5,1
    3a2c:	06f99063          	bne	s3,a5,3a8c <fl_fseek+0xe8>
    3a30:	00842783          	lw	a5,8(s0)
    3a34:	0004c663          	bltz	s1,3a40 <fl_fseek+0x9c>
    3a38:	00f484b3          	add	s1,s1,a5
    3a3c:	fd9ff06f          	j	3a14 <fl_fseek+0x70>
    3a40:	40900733          	neg	a4,s1
    3a44:	02e7fe63          	bgeu	a5,a4,3a80 <fl_fseek+0xdc>
    3a48:	00042423          	sw	zero,8(s0)
    3a4c:	00000513          	li	a0,0
    3a50:	04092783          	lw	a5,64(s2)
    3a54:	00078863          	beqz	a5,3a64 <fl_fseek+0xc0>
    3a58:	00a12623          	sw	a0,12(sp)
    3a5c:	000780e7          	jalr	a5
    3a60:	00c12503          	lw	a0,12(sp)
    3a64:	02c12083          	lw	ra,44(sp)
    3a68:	02812403          	lw	s0,40(sp)
    3a6c:	02412483          	lw	s1,36(sp)
    3a70:	02012903          	lw	s2,32(sp)
    3a74:	01c12983          	lw	s3,28(sp)
    3a78:	03010113          	addi	sp,sp,48
    3a7c:	00008067          	ret
    3a80:	00f484b3          	add	s1,s1,a5
    3a84:	00942423          	sw	s1,8(s0)
    3a88:	fc5ff06f          	j	3a4c <fl_fseek+0xa8>
    3a8c:	00200793          	li	a5,2
    3a90:	fcf990e3          	bne	s3,a5,3a50 <fl_fseek+0xac>
    3a94:	00c42783          	lw	a5,12(s0)
    3a98:	f89ff06f          	j	3a20 <fl_fseek+0x7c>

00003a9c <fl_closedir>:
    3a9c:	00000513          	li	a0,0
    3aa0:	00008067          	ret

00003aa4 <fatfs_lfn_cache_entry>:
    3aa4:	0005c783          	lbu	a5,0(a1)
    3aa8:	01300693          	li	a3,19
    3aac:	01f7f793          	andi	a5,a5,31
    3ab0:	fff78713          	addi	a4,a5,-1
    3ab4:	0ff77613          	zext.b	a2,a4
    3ab8:	0ac6ea63          	bltu	a3,a2,3b6c <fatfs_lfn_cache_entry+0xc8>
    3abc:	10554683          	lbu	a3,261(a0)
    3ac0:	00069463          	bnez	a3,3ac8 <fatfs_lfn_cache_entry+0x24>
    3ac4:	10f502a3          	sb	a5,261(a0)
    3ac8:	00171793          	slli	a5,a4,0x1
    3acc:	00e787b3          	add	a5,a5,a4
    3ad0:	0015c683          	lbu	a3,1(a1)
    3ad4:	00279793          	slli	a5,a5,0x2
    3ad8:	00e787b3          	add	a5,a5,a4
    3adc:	00f50533          	add	a0,a0,a5
    3ae0:	00d50023          	sb	a3,0(a0)
    3ae4:	0035c783          	lbu	a5,3(a1)
    3ae8:	0ff00713          	li	a4,255
    3aec:	02000693          	li	a3,32
    3af0:	00f500a3          	sb	a5,1(a0)
    3af4:	0055c783          	lbu	a5,5(a1)
    3af8:	00f50123          	sb	a5,2(a0)
    3afc:	0075c783          	lbu	a5,7(a1)
    3b00:	00f501a3          	sb	a5,3(a0)
    3b04:	0095c783          	lbu	a5,9(a1)
    3b08:	00f50223          	sb	a5,4(a0)
    3b0c:	00e5c783          	lbu	a5,14(a1)
    3b10:	00f502a3          	sb	a5,5(a0)
    3b14:	0105c783          	lbu	a5,16(a1)
    3b18:	00f50323          	sb	a5,6(a0)
    3b1c:	0125c783          	lbu	a5,18(a1)
    3b20:	00f503a3          	sb	a5,7(a0)
    3b24:	0145c783          	lbu	a5,20(a1)
    3b28:	00f50423          	sb	a5,8(a0)
    3b2c:	0165c783          	lbu	a5,22(a1)
    3b30:	00f504a3          	sb	a5,9(a0)
    3b34:	0185c783          	lbu	a5,24(a1)
    3b38:	00f50523          	sb	a5,10(a0)
    3b3c:	01c5c783          	lbu	a5,28(a1)
    3b40:	00f505a3          	sb	a5,11(a0)
    3b44:	01e5c783          	lbu	a5,30(a1)
    3b48:	00f50623          	sb	a5,12(a0)
    3b4c:	00d00793          	li	a5,13
    3b50:	00054603          	lbu	a2,0(a0)
    3b54:	00e61463          	bne	a2,a4,3b5c <fatfs_lfn_cache_entry+0xb8>
    3b58:	00d50023          	sb	a3,0(a0)
    3b5c:	fff78793          	addi	a5,a5,-1
    3b60:	0ff7f793          	zext.b	a5,a5
    3b64:	00150513          	addi	a0,a0,1
    3b68:	fe0794e3          	bnez	a5,3b50 <fatfs_lfn_cache_entry+0xac>
    3b6c:	00008067          	ret

00003b70 <fatfs_lfn_cache_get>:
    3b70:	10554703          	lbu	a4,261(a0)
    3b74:	01400793          	li	a5,20
    3b78:	00f71663          	bne	a4,a5,3b84 <fatfs_lfn_cache_get+0x14>
    3b7c:	10050223          	sb	zero,260(a0)
    3b80:	00008067          	ret
    3b84:	02070063          	beqz	a4,3ba4 <fatfs_lfn_cache_get+0x34>
    3b88:	00171793          	slli	a5,a4,0x1
    3b8c:	00e787b3          	add	a5,a5,a4
    3b90:	00279793          	slli	a5,a5,0x2
    3b94:	00e787b3          	add	a5,a5,a4
    3b98:	00f507b3          	add	a5,a0,a5
    3b9c:	00078023          	sb	zero,0(a5)
    3ba0:	00008067          	ret
    3ba4:	00050023          	sb	zero,0(a0)
    3ba8:	00008067          	ret

00003bac <fatfs_entry_lfn_text>:
    3bac:	00b54503          	lbu	a0,11(a0)
    3bb0:	00f57513          	andi	a0,a0,15
    3bb4:	ff150513          	addi	a0,a0,-15
    3bb8:	00153513          	seqz	a0,a0
    3bbc:	00008067          	ret

00003bc0 <fatfs_entry_lfn_invalid>:
    3bc0:	00054783          	lbu	a5,0(a0)
    3bc4:	f1b78713          	addi	a4,a5,-229
    3bc8:	02070263          	beqz	a4,3bec <fatfs_entry_lfn_invalid+0x2c>
    3bcc:	02078063          	beqz	a5,3bec <fatfs_entry_lfn_invalid+0x2c>
    3bd0:	00b54783          	lbu	a5,11(a0)
    3bd4:	00800713          	li	a4,8
    3bd8:	00100513          	li	a0,1
    3bdc:	00e78a63          	beq	a5,a4,3bf0 <fatfs_entry_lfn_invalid+0x30>
    3be0:	0067f793          	andi	a5,a5,6
    3be4:	00f03533          	snez	a0,a5
    3be8:	00008067          	ret
    3bec:	00100513          	li	a0,1
    3bf0:	00008067          	ret

00003bf4 <fatfs_entry_lfn_exists>:
    3bf4:	00b5c783          	lbu	a5,11(a1)
    3bf8:	00f00713          	li	a4,15
    3bfc:	04e78063          	beq	a5,a4,3c3c <fatfs_entry_lfn_exists+0x48>
    3c00:	0005c683          	lbu	a3,0(a1)
    3c04:	f1b68713          	addi	a4,a3,-229
    3c08:	00e03733          	snez	a4,a4
    3c0c:	00d036b3          	snez	a3,a3
    3c10:	00d77733          	and	a4,a4,a3
    3c14:	02070463          	beqz	a4,3c3c <fatfs_entry_lfn_exists+0x48>
    3c18:	ff878713          	addi	a4,a5,-8
    3c1c:	02070063          	beqz	a4,3c3c <fatfs_entry_lfn_exists+0x48>
    3c20:	0067f713          	andi	a4,a5,6
    3c24:	00000793          	li	a5,0
    3c28:	00071663          	bnez	a4,3c34 <fatfs_entry_lfn_exists+0x40>
    3c2c:	10554783          	lbu	a5,261(a0)
    3c30:	00f037b3          	snez	a5,a5
    3c34:	00078513          	mv	a0,a5
    3c38:	00008067          	ret
    3c3c:	00000793          	li	a5,0
    3c40:	ff5ff06f          	j	3c34 <fatfs_entry_lfn_exists+0x40>

00003c44 <fatfs_entry_sfn_only>:
    3c44:	00b54783          	lbu	a5,11(a0)
    3c48:	00f00713          	li	a4,15
    3c4c:	02e78863          	beq	a5,a4,3c7c <fatfs_entry_sfn_only+0x38>
    3c50:	00054683          	lbu	a3,0(a0)
    3c54:	f1b68713          	addi	a4,a3,-229
    3c58:	00e03733          	snez	a4,a4
    3c5c:	00d036b3          	snez	a3,a3
    3c60:	00d77733          	and	a4,a4,a3
    3c64:	00070c63          	beqz	a4,3c7c <fatfs_entry_sfn_only+0x38>
    3c68:	ff878713          	addi	a4,a5,-8
    3c6c:	00070863          	beqz	a4,3c7c <fatfs_entry_sfn_only+0x38>
    3c70:	0067f513          	andi	a0,a5,6
    3c74:	00153513          	seqz	a0,a0
    3c78:	00008067          	ret
    3c7c:	00000513          	li	a0,0
    3c80:	00008067          	ret

00003c84 <fatfs_entry_is_dir>:
    3c84:	00b54503          	lbu	a0,11(a0)
    3c88:	00455513          	srli	a0,a0,0x4
    3c8c:	00157513          	andi	a0,a0,1
    3c90:	00008067          	ret

00003c94 <fatfs_lfn_entries_required>:
    3c94:	ff010113          	addi	sp,sp,-16
    3c98:	00112623          	sw	ra,12(sp)
    3c9c:	fffff097          	auipc	ra,0xfffff
    3ca0:	184080e7          	jalr	388(ra) # 2e20 <strlen>
    3ca4:	00050a63          	beqz	a0,3cb8 <fatfs_lfn_entries_required+0x24>
    3ca8:	00d00593          	li	a1,13
    3cac:	00c50513          	addi	a0,a0,12
    3cb0:	fffff097          	auipc	ra,0xfffff
    3cb4:	07c080e7          	jalr	124(ra) # 2d2c <__divsi3>
    3cb8:	00c12083          	lw	ra,12(sp)
    3cbc:	01010113          	addi	sp,sp,16
    3cc0:	00008067          	ret

00003cc4 <fatfs_filename_to_lfn>:
    3cc4:	f9010113          	addi	sp,sp,-112
    3cc8:	06812423          	sw	s0,104(sp)
    3ccc:	00058413          	mv	s0,a1
    3cd0:	000075b7          	lui	a1,0x7
    3cd4:	db458593          	addi	a1,a1,-588 # 6db4 <font+0x1e0>
    3cd8:	06912223          	sw	s1,100(sp)
    3cdc:	05312e23          	sw	s3,92(sp)
    3ce0:	00060493          	mv	s1,a2
    3ce4:	00050993          	mv	s3,a0
    3ce8:	03400613          	li	a2,52
    3cec:	01c10513          	addi	a0,sp,28
    3cf0:	00d12623          	sw	a3,12(sp)
    3cf4:	06112623          	sw	ra,108(sp)
    3cf8:	07212023          	sw	s2,96(sp)
    3cfc:	05412c23          	sw	s4,88(sp)
    3d00:	fffff097          	auipc	ra,0xfffff
    3d04:	0fc080e7          	jalr	252(ra) # 2dfc <memcpy>
    3d08:	00098513          	mv	a0,s3
    3d0c:	fffff097          	auipc	ra,0xfffff
    3d10:	114080e7          	jalr	276(ra) # 2e20 <strlen>
    3d14:	00050913          	mv	s2,a0
    3d18:	00098513          	mv	a0,s3
    3d1c:	00000097          	auipc	ra,0x0
    3d20:	f78080e7          	jalr	-136(ra) # 3c94 <fatfs_lfn_entries_required>
    3d24:	00050a13          	mv	s4,a0
    3d28:	02000613          	li	a2,32
    3d2c:	00000593          	li	a1,0
    3d30:	00040513          	mv	a0,s0
    3d34:	fffff097          	auipc	ra,0xfffff
    3d38:	0ac080e7          	jalr	172(ra) # 2de0 <memset>
    3d3c:	fffa0713          	addi	a4,s4,-1
    3d40:	00c12683          	lw	a3,12(sp)
    3d44:	00148793          	addi	a5,s1,1
    3d48:	00971463          	bne	a4,s1,3d50 <fatfs_filename_to_lfn+0x8c>
    3d4c:	0407e793          	ori	a5,a5,64
    3d50:	00149613          	slli	a2,s1,0x1
    3d54:	00960633          	add	a2,a2,s1
    3d58:	00f40023          	sb	a5,0(s0)
    3d5c:	00261613          	slli	a2,a2,0x2
    3d60:	00f00793          	li	a5,15
    3d64:	00f405a3          	sb	a5,11(s0)
    3d68:	00d406a3          	sb	a3,13(s0)
    3d6c:	01c10793          	addi	a5,sp,28
    3d70:	00960633          	add	a2,a2,s1
    3d74:	fff00693          	li	a3,-1
    3d78:	0007a703          	lw	a4,0(a5)
    3d7c:	00e40733          	add	a4,s0,a4
    3d80:	05265063          	bge	a2,s2,3dc0 <fatfs_filename_to_lfn+0xfc>
    3d84:	00c985b3          	add	a1,s3,a2
    3d88:	0005c583          	lbu	a1,0(a1)
    3d8c:	00b70023          	sb	a1,0(a4)
    3d90:	00478793          	addi	a5,a5,4
    3d94:	05010713          	addi	a4,sp,80
    3d98:	00160613          	addi	a2,a2,1
    3d9c:	fce79ee3          	bne	a5,a4,3d78 <fatfs_filename_to_lfn+0xb4>
    3da0:	06c12083          	lw	ra,108(sp)
    3da4:	06812403          	lw	s0,104(sp)
    3da8:	06412483          	lw	s1,100(sp)
    3dac:	06012903          	lw	s2,96(sp)
    3db0:	05c12983          	lw	s3,92(sp)
    3db4:	05812a03          	lw	s4,88(sp)
    3db8:	07010113          	addi	sp,sp,112
    3dbc:	00008067          	ret
    3dc0:	01261663          	bne	a2,s2,3dcc <fatfs_filename_to_lfn+0x108>
    3dc4:	00070023          	sb	zero,0(a4)
    3dc8:	fc9ff06f          	j	3d90 <fatfs_filename_to_lfn+0xcc>
    3dcc:	00d70023          	sb	a3,0(a4)
    3dd0:	00d700a3          	sb	a3,1(a4)
    3dd4:	fbdff06f          	j	3d90 <fatfs_filename_to_lfn+0xcc>

00003dd8 <fatfs_sfn_create_entry>:
    3dd8:	00000793          	li	a5,0
    3ddc:	00b00813          	li	a6,11
    3de0:	00f508b3          	add	a7,a0,a5
    3de4:	0008c303          	lbu	t1,0(a7)
    3de8:	00f688b3          	add	a7,a3,a5
    3dec:	00178793          	addi	a5,a5,1
    3df0:	00688023          	sb	t1,0(a7)
    3df4:	ff0796e3          	bne	a5,a6,3de0 <fatfs_sfn_create_entry+0x8>
    3df8:	00e03733          	snez	a4,a4
    3dfc:	40e00733          	neg	a4,a4
    3e00:	02000793          	li	a5,32
    3e04:	ff077713          	andi	a4,a4,-16
    3e08:	00f70733          	add	a4,a4,a5
    3e0c:	00f68823          	sb	a5,16(a3)
    3e10:	00f68923          	sb	a5,18(a3)
    3e14:	00f68c23          	sb	a5,24(a3)
    3e18:	01065793          	srli	a5,a2,0x10
    3e1c:	00f68a23          	sb	a5,20(a3)
    3e20:	01865793          	srli	a5,a2,0x18
    3e24:	00f68aa3          	sb	a5,21(a3)
    3e28:	0085d793          	srli	a5,a1,0x8
    3e2c:	00c68d23          	sb	a2,26(a3)
    3e30:	00b68e23          	sb	a1,28(a3)
    3e34:	00865613          	srli	a2,a2,0x8
    3e38:	00f68ea3          	sb	a5,29(a3)
    3e3c:	0105d793          	srli	a5,a1,0x10
    3e40:	0185d593          	srli	a1,a1,0x18
    3e44:	000686a3          	sb	zero,13(a3)
    3e48:	00068723          	sb	zero,14(a3)
    3e4c:	000687a3          	sb	zero,15(a3)
    3e50:	000688a3          	sb	zero,17(a3)
    3e54:	000689a3          	sb	zero,19(a3)
    3e58:	00068b23          	sb	zero,22(a3)
    3e5c:	00068ba3          	sb	zero,23(a3)
    3e60:	00068ca3          	sb	zero,25(a3)
    3e64:	00e685a3          	sb	a4,11(a3)
    3e68:	00068623          	sb	zero,12(a3)
    3e6c:	00c68da3          	sb	a2,27(a3)
    3e70:	00f68f23          	sb	a5,30(a3)
    3e74:	00b68fa3          	sb	a1,31(a3)
    3e78:	00008067          	ret

00003e7c <fatfs_lfn_create_sfn>:
    3e7c:	fd010113          	addi	sp,sp,-48
    3e80:	02912223          	sw	s1,36(sp)
    3e84:	00050493          	mv	s1,a0
    3e88:	00058513          	mv	a0,a1
    3e8c:	02812423          	sw	s0,40(sp)
    3e90:	01312e23          	sw	s3,28(sp)
    3e94:	00058413          	mv	s0,a1
    3e98:	02112623          	sw	ra,44(sp)
    3e9c:	03212023          	sw	s2,32(sp)
    3ea0:	fffff097          	auipc	ra,0xfffff
    3ea4:	f80080e7          	jalr	-128(ra) # 2e20 <strlen>
    3ea8:	00044783          	lbu	a5,0(s0)
    3eac:	02e00993          	li	s3,46
    3eb0:	15378063          	beq	a5,s3,3ff0 <fatfs_lfn_create_sfn+0x174>
    3eb4:	00b00613          	li	a2,11
    3eb8:	02000593          	li	a1,32
    3ebc:	00050913          	mv	s2,a0
    3ec0:	00048513          	mv	a0,s1
    3ec4:	fffff097          	auipc	ra,0xfffff
    3ec8:	f1c080e7          	jalr	-228(ra) # 2de0 <memset>
    3ecc:	00300613          	li	a2,3
    3ed0:	02000593          	li	a1,32
    3ed4:	00c10513          	addi	a0,sp,12
    3ed8:	fffff097          	auipc	ra,0xfffff
    3edc:	f08080e7          	jalr	-248(ra) # 2de0 <memset>
    3ee0:	fff00793          	li	a5,-1
    3ee4:	00000713          	li	a4,0
    3ee8:	0d274263          	blt	a4,s2,3fac <fatfs_lfn_create_sfn+0x130>
    3eec:	fff00713          	li	a4,-1
    3ef0:	0ee78863          	beq	a5,a4,3fe0 <fatfs_lfn_create_sfn+0x164>
    3ef4:	00178713          	addi	a4,a5,1
    3ef8:	00c10693          	addi	a3,sp,12
    3efc:	00478613          	addi	a2,a5,4
    3f00:	0ce61263          	bne	a2,a4,3fc4 <fatfs_lfn_create_sfn+0x148>
    3f04:	00000613          	li	a2,0
    3f08:	00000693          	li	a3,0
    3f0c:	01900813          	li	a6,25
    3f10:	00800893          	li	a7,8
    3f14:	02f6de63          	bge	a3,a5,3f50 <fatfs_lfn_create_sfn+0xd4>
    3f18:	00d40733          	add	a4,s0,a3
    3f1c:	00074703          	lbu	a4,0(a4)
    3f20:	fe070513          	addi	a0,a4,-32
    3f24:	0c050263          	beqz	a0,3fe8 <fatfs_lfn_create_sfn+0x16c>
    3f28:	fd270593          	addi	a1,a4,-46
    3f2c:	0a058e63          	beqz	a1,3fe8 <fatfs_lfn_create_sfn+0x16c>
    3f30:	f9f70593          	addi	a1,a4,-97
    3f34:	0ff5f593          	zext.b	a1,a1
    3f38:	00c48333          	add	t1,s1,a2
    3f3c:	00160613          	addi	a2,a2,1
    3f40:	00b86463          	bltu	a6,a1,3f48 <fatfs_lfn_create_sfn+0xcc>
    3f44:	0ff57713          	zext.b	a4,a0
    3f48:	00e30023          	sb	a4,0(t1)
    3f4c:	09161e63          	bne	a2,a7,3fe8 <fatfs_lfn_create_sfn+0x16c>
    3f50:	00c10793          	addi	a5,sp,12
    3f54:	00800693          	li	a3,8
    3f58:	01900513          	li	a0,25
    3f5c:	00b00593          	li	a1,11
    3f60:	0007c703          	lbu	a4,0(a5)
    3f64:	f9f70613          	addi	a2,a4,-97
    3f68:	0ff67613          	zext.b	a2,a2
    3f6c:	00c56663          	bltu	a0,a2,3f78 <fatfs_lfn_create_sfn+0xfc>
    3f70:	fe070713          	addi	a4,a4,-32
    3f74:	0ff77713          	zext.b	a4,a4
    3f78:	00d48633          	add	a2,s1,a3
    3f7c:	00e60023          	sb	a4,0(a2)
    3f80:	00168693          	addi	a3,a3,1
    3f84:	00178793          	addi	a5,a5,1
    3f88:	fcb69ce3          	bne	a3,a1,3f60 <fatfs_lfn_create_sfn+0xe4>
    3f8c:	00100513          	li	a0,1
    3f90:	02c12083          	lw	ra,44(sp)
    3f94:	02812403          	lw	s0,40(sp)
    3f98:	02412483          	lw	s1,36(sp)
    3f9c:	02012903          	lw	s2,32(sp)
    3fa0:	01c12983          	lw	s3,28(sp)
    3fa4:	03010113          	addi	sp,sp,48
    3fa8:	00008067          	ret
    3fac:	00e406b3          	add	a3,s0,a4
    3fb0:	0006c683          	lbu	a3,0(a3)
    3fb4:	01369463          	bne	a3,s3,3fbc <fatfs_lfn_create_sfn+0x140>
    3fb8:	00070793          	mv	a5,a4
    3fbc:	00170713          	addi	a4,a4,1
    3fc0:	f29ff06f          	j	3ee8 <fatfs_lfn_create_sfn+0x6c>
    3fc4:	01275863          	bge	a4,s2,3fd4 <fatfs_lfn_create_sfn+0x158>
    3fc8:	00e405b3          	add	a1,s0,a4
    3fcc:	0005c583          	lbu	a1,0(a1)
    3fd0:	00b68023          	sb	a1,0(a3)
    3fd4:	00170713          	addi	a4,a4,1
    3fd8:	00168693          	addi	a3,a3,1
    3fdc:	f25ff06f          	j	3f00 <fatfs_lfn_create_sfn+0x84>
    3fe0:	00090793          	mv	a5,s2
    3fe4:	f21ff06f          	j	3f04 <fatfs_lfn_create_sfn+0x88>
    3fe8:	00168693          	addi	a3,a3,1
    3fec:	f29ff06f          	j	3f14 <fatfs_lfn_create_sfn+0x98>
    3ff0:	00000513          	li	a0,0
    3ff4:	f9dff06f          	j	3f90 <fatfs_lfn_create_sfn+0x114>

00003ff8 <fatfs_lfn_generate_tail>:
    3ff8:	000187b7          	lui	a5,0x18
    3ffc:	69f78793          	addi	a5,a5,1695 # 1869f <__stacktop+0x869f>
    4000:	16c7e463          	bltu	a5,a2,4168 <fatfs_lfn_generate_tail+0x170>
    4004:	fa010113          	addi	sp,sp,-96
    4008:	04812c23          	sw	s0,88(sp)
    400c:	04912a23          	sw	s1,84(sp)
    4010:	03712e23          	sw	s7,60(sp)
    4014:	00060413          	mv	s0,a2
    4018:	00058b93          	mv	s7,a1
    401c:	00c00613          	li	a2,12
    4020:	00000593          	li	a1,0
    4024:	00050493          	mv	s1,a0
    4028:	00410513          	addi	a0,sp,4
    402c:	04112e23          	sw	ra,92(sp)
    4030:	05312623          	sw	s3,76(sp)
    4034:	05412423          	sw	s4,72(sp)
    4038:	05612023          	sw	s6,64(sp)
    403c:	05212823          	sw	s2,80(sp)
    4040:	05512223          	sw	s5,68(sp)
    4044:	fffff097          	auipc	ra,0xfffff
    4048:	d9c080e7          	jalr	-612(ra) # 2de0 <memset>
    404c:	000075b7          	lui	a1,0x7
    4050:	07e00793          	li	a5,126
    4054:	01100613          	li	a2,17
    4058:	b6858593          	addi	a1,a1,-1176 # 6b68 <LEDS+0x224>
    405c:	01c10513          	addi	a0,sp,28
    4060:	01010993          	addi	s3,sp,16
    4064:	00f10223          	sb	a5,4(sp)
    4068:	00098a13          	mv	s4,s3
    406c:	fffff097          	auipc	ra,0xfffff
    4070:	d90080e7          	jalr	-624(ra) # 2dfc <memcpy>
    4074:	00900b13          	li	s6,9
    4078:	00a00593          	li	a1,10
    407c:	00040513          	mv	a0,s0
    4080:	fffff097          	auipc	ra,0xfffff
    4084:	cfc080e7          	jalr	-772(ra) # 2d7c <__umodsi3>
    4088:	03050793          	addi	a5,a0,48
    408c:	00278533          	add	a0,a5,sp
    4090:	fec54783          	lbu	a5,-20(a0)
    4094:	00098913          	mv	s2,s3
    4098:	00040513          	mv	a0,s0
    409c:	00a00593          	li	a1,10
    40a0:	00f98023          	sb	a5,0(s3)
    40a4:	00040a93          	mv	s5,s0
    40a8:	fffff097          	auipc	ra,0xfffff
    40ac:	c8c080e7          	jalr	-884(ra) # 2d34 <__udivsi3>
    40b0:	00198993          	addi	s3,s3,1
    40b4:	00050413          	mv	s0,a0
    40b8:	fd5b60e3          	bltu	s6,s5,4078 <fatfs_lfn_generate_tail+0x80>
    40bc:	00098023          	sb	zero,0(s3)
    40c0:	00410713          	addi	a4,sp,4
    40c4:	00090793          	mv	a5,s2
    40c8:	0947f663          	bgeu	a5,s4,4154 <fatfs_lfn_generate_tail+0x15c>
    40cc:	00f10713          	addi	a4,sp,15
    40d0:	00000793          	li	a5,0
    40d4:	00e96663          	bltu	s2,a4,40e0 <fatfs_lfn_generate_tail+0xe8>
    40d8:	41490933          	sub	s2,s2,s4
    40dc:	00190793          	addi	a5,s2,1
    40e0:	03078793          	addi	a5,a5,48
    40e4:	002787b3          	add	a5,a5,sp
    40e8:	000b8593          	mv	a1,s7
    40ec:	fc078aa3          	sb	zero,-43(a5)
    40f0:	00b00613          	li	a2,11
    40f4:	00048513          	mv	a0,s1
    40f8:	fffff097          	auipc	ra,0xfffff
    40fc:	d04080e7          	jalr	-764(ra) # 2dfc <memcpy>
    4100:	00410513          	addi	a0,sp,4
    4104:	fffff097          	auipc	ra,0xfffff
    4108:	d1c080e7          	jalr	-740(ra) # 2e20 <strlen>
    410c:	40a484b3          	sub	s1,s1,a0
    4110:	00050613          	mv	a2,a0
    4114:	00410593          	addi	a1,sp,4
    4118:	00848513          	addi	a0,s1,8
    411c:	fffff097          	auipc	ra,0xfffff
    4120:	ce0080e7          	jalr	-800(ra) # 2dfc <memcpy>
    4124:	05c12083          	lw	ra,92(sp)
    4128:	05812403          	lw	s0,88(sp)
    412c:	05412483          	lw	s1,84(sp)
    4130:	05012903          	lw	s2,80(sp)
    4134:	04c12983          	lw	s3,76(sp)
    4138:	04812a03          	lw	s4,72(sp)
    413c:	04412a83          	lw	s5,68(sp)
    4140:	04012b03          	lw	s6,64(sp)
    4144:	03c12b83          	lw	s7,60(sp)
    4148:	00100513          	li	a0,1
    414c:	06010113          	addi	sp,sp,96
    4150:	00008067          	ret
    4154:	0007c683          	lbu	a3,0(a5)
    4158:	00170713          	addi	a4,a4,1
    415c:	fff78793          	addi	a5,a5,-1
    4160:	00d70023          	sb	a3,0(a4)
    4164:	f65ff06f          	j	40c8 <fatfs_lfn_generate_tail+0xd0>
    4168:	00000513          	li	a0,0
    416c:	00008067          	ret

00004170 <fatfs_total_path_levels>:
    4170:	fff00793          	li	a5,-1
    4174:	06050263          	beqz	a0,41d8 <fatfs_total_path_levels+0x68>
    4178:	00054703          	lbu	a4,0(a0)
    417c:	02f00793          	li	a5,47
    4180:	00f71863          	bne	a4,a5,4190 <fatfs_total_path_levels+0x20>
    4184:	00150513          	addi	a0,a0,1
    4188:	00000793          	li	a5,0
    418c:	0400006f          	j	41cc <fatfs_total_path_levels+0x5c>
    4190:	00154703          	lbu	a4,1(a0)
    4194:	03a00793          	li	a5,58
    4198:	00f70a63          	beq	a4,a5,41ac <fatfs_total_path_levels+0x3c>
    419c:	00254683          	lbu	a3,2(a0)
    41a0:	05c00713          	li	a4,92
    41a4:	fff00793          	li	a5,-1
    41a8:	02e69863          	bne	a3,a4,41d8 <fatfs_total_path_levels+0x68>
    41ac:	00350513          	addi	a0,a0,3
    41b0:	05c00713          	li	a4,92
    41b4:	fd5ff06f          	j	4188 <fatfs_total_path_levels+0x18>
    41b8:	00150513          	addi	a0,a0,1
    41bc:	00e68663          	beq	a3,a4,41c8 <fatfs_total_path_levels+0x58>
    41c0:	00054683          	lbu	a3,0(a0)
    41c4:	fe069ae3          	bnez	a3,41b8 <fatfs_total_path_levels+0x48>
    41c8:	00178793          	addi	a5,a5,1
    41cc:	00054683          	lbu	a3,0(a0)
    41d0:	fe0698e3          	bnez	a3,41c0 <fatfs_total_path_levels+0x50>
    41d4:	fff78793          	addi	a5,a5,-1
    41d8:	00078513          	mv	a0,a5
    41dc:	00008067          	ret

000041e0 <fatfs_get_substring>:
    41e0:	0cd05e63          	blez	a3,42bc <fatfs_get_substring+0xdc>
    41e4:	0c050c63          	beqz	a0,42bc <fatfs_get_substring+0xdc>
    41e8:	fe010113          	addi	sp,sp,-32
    41ec:	00812c23          	sw	s0,24(sp)
    41f0:	00112e23          	sw	ra,28(sp)
    41f4:	00912a23          	sw	s1,20(sp)
    41f8:	00054483          	lbu	s1,0(a0)
    41fc:	02f00793          	li	a5,47
    4200:	00150413          	addi	s0,a0,1
    4204:	02f48463          	beq	s1,a5,422c <fatfs_get_substring+0x4c>
    4208:	00154703          	lbu	a4,1(a0)
    420c:	03a00793          	li	a5,58
    4210:	00f70a63          	beq	a4,a5,4224 <fatfs_get_substring+0x44>
    4214:	00254803          	lbu	a6,2(a0)
    4218:	05c00713          	li	a4,92
    421c:	fff00793          	li	a5,-1
    4220:	04e81c63          	bne	a6,a4,4278 <fatfs_get_substring+0x98>
    4224:	00350413          	addi	s0,a0,3
    4228:	05c00493          	li	s1,92
    422c:	00040513          	mv	a0,s0
    4230:	00d12623          	sw	a3,12(sp)
    4234:	00c12423          	sw	a2,8(sp)
    4238:	00b12223          	sw	a1,4(sp)
    423c:	fffff097          	auipc	ra,0xfffff
    4240:	be4080e7          	jalr	-1052(ra) # 2e20 <strlen>
    4244:	00c12683          	lw	a3,12(sp)
    4248:	00412583          	lw	a1,4(sp)
    424c:	00812603          	lw	a2,8(sp)
    4250:	00000713          	li	a4,0
    4254:	00000813          	li	a6,0
    4258:	00000793          	li	a5,0
    425c:	fff68693          	addi	a3,a3,-1
    4260:	00e608b3          	add	a7,a2,a4
    4264:	02a7c663          	blt	a5,a0,4290 <fatfs_get_substring+0xb0>
    4268:	00088023          	sb	zero,0(a7)
    426c:	00064783          	lbu	a5,0(a2)
    4270:	0017b793          	seqz	a5,a5
    4274:	40f007b3          	neg	a5,a5
    4278:	01c12083          	lw	ra,28(sp)
    427c:	01812403          	lw	s0,24(sp)
    4280:	01412483          	lw	s1,20(sp)
    4284:	00078513          	mv	a0,a5
    4288:	02010113          	addi	sp,sp,32
    428c:	00008067          	ret
    4290:	00f40333          	add	t1,s0,a5
    4294:	00034303          	lbu	t1,0(t1)
    4298:	00931863          	bne	t1,s1,42a8 <fatfs_get_substring+0xc8>
    429c:	00180813          	addi	a6,a6,1
    42a0:	00178793          	addi	a5,a5,1
    42a4:	fbdff06f          	j	4260 <fatfs_get_substring+0x80>
    42a8:	feb81ce3          	bne	a6,a1,42a0 <fatfs_get_substring+0xc0>
    42ac:	fed75ae3          	bge	a4,a3,42a0 <fatfs_get_substring+0xc0>
    42b0:	00170713          	addi	a4,a4,1
    42b4:	00688023          	sb	t1,0(a7)
    42b8:	fe9ff06f          	j	42a0 <fatfs_get_substring+0xc0>
    42bc:	fff00793          	li	a5,-1
    42c0:	00078513          	mv	a0,a5
    42c4:	00008067          	ret

000042c8 <fatfs_split_path>:
    42c8:	fd010113          	addi	sp,sp,-48
    42cc:	02912223          	sw	s1,36(sp)
    42d0:	03212023          	sw	s2,32(sp)
    42d4:	01312e23          	sw	s3,28(sp)
    42d8:	01412c23          	sw	s4,24(sp)
    42dc:	02112623          	sw	ra,44(sp)
    42e0:	02812423          	sw	s0,40(sp)
    42e4:	01512a23          	sw	s5,20(sp)
    42e8:	00050993          	mv	s3,a0
    42ec:	00058493          	mv	s1,a1
    42f0:	00060913          	mv	s2,a2
    42f4:	00068a13          	mv	s4,a3
    42f8:	00e12623          	sw	a4,12(sp)
    42fc:	00000097          	auipc	ra,0x0
    4300:	e74080e7          	jalr	-396(ra) # 4170 <fatfs_total_path_levels>
    4304:	fff00793          	li	a5,-1
    4308:	02f51863          	bne	a0,a5,4338 <fatfs_split_path+0x70>
    430c:	fff00413          	li	s0,-1
    4310:	02c12083          	lw	ra,44(sp)
    4314:	00040513          	mv	a0,s0
    4318:	02812403          	lw	s0,40(sp)
    431c:	02412483          	lw	s1,36(sp)
    4320:	02012903          	lw	s2,32(sp)
    4324:	01c12983          	lw	s3,28(sp)
    4328:	01812a03          	lw	s4,24(sp)
    432c:	01412a83          	lw	s5,20(sp)
    4330:	03010113          	addi	sp,sp,48
    4334:	00008067          	ret
    4338:	00c12683          	lw	a3,12(sp)
    433c:	00050593          	mv	a1,a0
    4340:	00a12623          	sw	a0,12(sp)
    4344:	000a0613          	mv	a2,s4
    4348:	00098513          	mv	a0,s3
    434c:	00000097          	auipc	ra,0x0
    4350:	e94080e7          	jalr	-364(ra) # 41e0 <fatfs_get_substring>
    4354:	00050413          	mv	s0,a0
    4358:	fa051ae3          	bnez	a0,430c <fatfs_split_path+0x44>
    435c:	00c12583          	lw	a1,12(sp)
    4360:	00059663          	bnez	a1,436c <fatfs_split_path+0xa4>
    4364:	00048023          	sb	zero,0(s1)
    4368:	fa9ff06f          	j	4310 <fatfs_split_path+0x48>
    436c:	00098513          	mv	a0,s3
    4370:	fffff097          	auipc	ra,0xfffff
    4374:	ab0080e7          	jalr	-1360(ra) # 2e20 <strlen>
    4378:	00050a93          	mv	s5,a0
    437c:	000a0513          	mv	a0,s4
    4380:	fffff097          	auipc	ra,0xfffff
    4384:	aa0080e7          	jalr	-1376(ra) # 2e20 <strlen>
    4388:	40aa8633          	sub	a2,s5,a0
    438c:	00c95463          	bge	s2,a2,4394 <fatfs_split_path+0xcc>
    4390:	00090613          	mv	a2,s2
    4394:	00048513          	mv	a0,s1
    4398:	00098593          	mv	a1,s3
    439c:	00c12623          	sw	a2,12(sp)
    43a0:	fffff097          	auipc	ra,0xfffff
    43a4:	a5c080e7          	jalr	-1444(ra) # 2dfc <memcpy>
    43a8:	00c12603          	lw	a2,12(sp)
    43ac:	00c484b3          	add	s1,s1,a2
    43b0:	fe048fa3          	sb	zero,-1(s1)
    43b4:	f5dff06f          	j	4310 <fatfs_split_path+0x48>

000043b8 <fatfs_compare_names>:
    43b8:	fd010113          	addi	sp,sp,-48
    43bc:	02112623          	sw	ra,44(sp)
    43c0:	03212023          	sw	s2,32(sp)
    43c4:	01312e23          	sw	s3,28(sp)
    43c8:	01412c23          	sw	s4,24(sp)
    43cc:	01512a23          	sw	s5,20(sp)
    43d0:	00058a13          	mv	s4,a1
    43d4:	02812423          	sw	s0,40(sp)
    43d8:	02912223          	sw	s1,36(sp)
    43dc:	01612823          	sw	s6,16(sp)
    43e0:	01712623          	sw	s7,12(sp)
    43e4:	01812423          	sw	s8,8(sp)
    43e8:	00050a93          	mv	s5,a0
    43ec:	fffff097          	auipc	ra,0xfffff
    43f0:	1c4080e7          	jalr	452(ra) # 35b0 <FileString_GetExtension>
    43f4:	00050993          	mv	s3,a0
    43f8:	000a0513          	mv	a0,s4
    43fc:	fffff097          	auipc	ra,0xfffff
    4400:	1b4080e7          	jalr	436(ra) # 35b0 <FileString_GetExtension>
    4404:	fff00793          	li	a5,-1
    4408:	00050913          	mv	s2,a0
    440c:	02f99e63          	bne	s3,a5,4448 <fatfs_compare_names+0x90>
    4410:	0f350063          	beq	a0,s3,44f0 <fatfs_compare_names+0x138>
    4414:	00000513          	li	a0,0
    4418:	02c12083          	lw	ra,44(sp)
    441c:	02812403          	lw	s0,40(sp)
    4420:	02412483          	lw	s1,36(sp)
    4424:	02012903          	lw	s2,32(sp)
    4428:	01c12983          	lw	s3,28(sp)
    442c:	01812a03          	lw	s4,24(sp)
    4430:	01412a83          	lw	s5,20(sp)
    4434:	01012b03          	lw	s6,16(sp)
    4438:	00c12b83          	lw	s7,12(sp)
    443c:	00812c03          	lw	s8,8(sp)
    4440:	03010113          	addi	sp,sp,48
    4444:	00008067          	ret
    4448:	fcf506e3          	beq	a0,a5,4414 <fatfs_compare_names+0x5c>
    444c:	00198793          	addi	a5,s3,1
    4450:	00fa8b33          	add	s6,s5,a5
    4454:	00050413          	mv	s0,a0
    4458:	00150793          	addi	a5,a0,1
    445c:	000b0513          	mv	a0,s6
    4460:	00fa0bb3          	add	s7,s4,a5
    4464:	fffff097          	auipc	ra,0xfffff
    4468:	9bc080e7          	jalr	-1604(ra) # 2e20 <strlen>
    446c:	00050c13          	mv	s8,a0
    4470:	000b8513          	mv	a0,s7
    4474:	00098493          	mv	s1,s3
    4478:	fffff097          	auipc	ra,0xfffff
    447c:	9a8080e7          	jalr	-1624(ra) # 2e20 <strlen>
    4480:	f8ac1ae3          	bne	s8,a0,4414 <fatfs_compare_names+0x5c>
    4484:	000b0513          	mv	a0,s6
    4488:	fffff097          	auipc	ra,0xfffff
    448c:	998080e7          	jalr	-1640(ra) # 2e20 <strlen>
    4490:	00050613          	mv	a2,a0
    4494:	000b8593          	mv	a1,s7
    4498:	000b0513          	mv	a0,s6
    449c:	fffff097          	auipc	ra,0xfffff
    44a0:	0a4080e7          	jalr	164(ra) # 3540 <FileString_StrCmpNoCase>
    44a4:	f60518e3          	bnez	a0,4414 <fatfs_compare_names+0x5c>
    44a8:	fff48793          	addi	a5,s1,-1
    44ac:	00fa87b3          	add	a5,s5,a5
    44b0:	41378733          	sub	a4,a5,s3
    44b4:	02000693          	li	a3,32
    44b8:	06e79263          	bne	a5,a4,451c <fatfs_compare_names+0x164>
    44bc:	fff40793          	addi	a5,s0,-1
    44c0:	00fa07b3          	add	a5,s4,a5
    44c4:	41278733          	sub	a4,a5,s2
    44c8:	02000693          	li	a3,32
    44cc:	06e79263          	bne	a5,a4,4530 <fatfs_compare_names+0x178>
    44d0:	f53912e3          	bne	s2,s3,4414 <fatfs_compare_names+0x5c>
    44d4:	00090613          	mv	a2,s2
    44d8:	000a0593          	mv	a1,s4
    44dc:	000a8513          	mv	a0,s5
    44e0:	fffff097          	auipc	ra,0xfffff
    44e4:	060080e7          	jalr	96(ra) # 3540 <FileString_StrCmpNoCase>
    44e8:	00153513          	seqz	a0,a0
    44ec:	f2dff06f          	j	4418 <fatfs_compare_names+0x60>
    44f0:	000a8513          	mv	a0,s5
    44f4:	fffff097          	auipc	ra,0xfffff
    44f8:	92c080e7          	jalr	-1748(ra) # 2e20 <strlen>
    44fc:	00050493          	mv	s1,a0
    4500:	00050993          	mv	s3,a0
    4504:	000a0513          	mv	a0,s4
    4508:	fffff097          	auipc	ra,0xfffff
    450c:	918080e7          	jalr	-1768(ra) # 2e20 <strlen>
    4510:	00050413          	mv	s0,a0
    4514:	00050913          	mv	s2,a0
    4518:	f91ff06f          	j	44a8 <fatfs_compare_names+0xf0>
    451c:	0007c603          	lbu	a2,0(a5)
    4520:	f8d61ee3          	bne	a2,a3,44bc <fatfs_compare_names+0x104>
    4524:	415789b3          	sub	s3,a5,s5
    4528:	fff78793          	addi	a5,a5,-1
    452c:	f8dff06f          	j	44b8 <fatfs_compare_names+0x100>
    4530:	0007c603          	lbu	a2,0(a5)
    4534:	f8d61ee3          	bne	a2,a3,44d0 <fatfs_compare_names+0x118>
    4538:	41478933          	sub	s2,a5,s4
    453c:	fff78793          	addi	a5,a5,-1
    4540:	f8dff06f          	j	44cc <fatfs_compare_names+0x114>

00004544 <_check_file_open>:
    4544:	fe010113          	addi	sp,sp,-32
    4548:	000077b7          	lui	a5,0x7
    454c:	00812c23          	sw	s0,24(sp)
    4550:	0007a403          	lw	s0,0(a5) # 7000 <_open_file_list>
    4554:	00912a23          	sw	s1,20(sp)
    4558:	00112e23          	sw	ra,28(sp)
    455c:	01212823          	sw	s2,16(sp)
    4560:	01312623          	sw	s3,12(sp)
    4564:	00050493          	mv	s1,a0
    4568:	00041663          	bnez	s0,4574 <_check_file_open+0x30>
    456c:	00000513          	li	a0,0
    4570:	03c0006f          	j	45ac <_check_file_open+0x68>
    4574:	bc440793          	addi	a5,s0,-1084
    4578:	00f49663          	bne	s1,a5,4584 <_check_file_open+0x40>
    457c:	00442403          	lw	s0,4(s0)
    4580:	fe9ff06f          	j	4568 <_check_file_open+0x24>
    4584:	01448593          	addi	a1,s1,20
    4588:	bd840513          	addi	a0,s0,-1064
    458c:	00000097          	auipc	ra,0x0
    4590:	e2c080e7          	jalr	-468(ra) # 43b8 <fatfs_compare_names>
    4594:	fe0504e3          	beqz	a0,457c <_check_file_open+0x38>
    4598:	11848593          	addi	a1,s1,280
    459c:	cdc40513          	addi	a0,s0,-804
    45a0:	00000097          	auipc	ra,0x0
    45a4:	e18080e7          	jalr	-488(ra) # 43b8 <fatfs_compare_names>
    45a8:	fc050ae3          	beqz	a0,457c <_check_file_open+0x38>
    45ac:	01c12083          	lw	ra,28(sp)
    45b0:	01812403          	lw	s0,24(sp)
    45b4:	01412483          	lw	s1,20(sp)
    45b8:	01012903          	lw	s2,16(sp)
    45bc:	00c12983          	lw	s3,12(sp)
    45c0:	02010113          	addi	sp,sp,32
    45c4:	00008067          	ret

000045c8 <fatfs_get_sfn_display_name>:
    45c8:	00000713          	li	a4,0
    45cc:	02000613          	li	a2,32
    45d0:	01900813          	li	a6,25
    45d4:	0005c783          	lbu	a5,0(a1)
    45d8:	00078663          	beqz	a5,45e4 <fatfs_get_sfn_display_name+0x1c>
    45dc:	ff470693          	addi	a3,a4,-12
    45e0:	00069863          	bnez	a3,45f0 <fatfs_get_sfn_display_name+0x28>
    45e4:	00050023          	sb	zero,0(a0)
    45e8:	00100513          	li	a0,1
    45ec:	00008067          	ret
    45f0:	00158593          	addi	a1,a1,1
    45f4:	fec780e3          	beq	a5,a2,45d4 <fatfs_get_sfn_display_name+0xc>
    45f8:	fbf78693          	addi	a3,a5,-65
    45fc:	0ff6f693          	zext.b	a3,a3
    4600:	00d86663          	bltu	a6,a3,460c <fatfs_get_sfn_display_name+0x44>
    4604:	02078793          	addi	a5,a5,32
    4608:	0ff7f793          	zext.b	a5,a5
    460c:	00f50023          	sb	a5,0(a0)
    4610:	00170713          	addi	a4,a4,1
    4614:	00150513          	addi	a0,a0,1
    4618:	fbdff06f          	j	45d4 <fatfs_get_sfn_display_name+0xc>

0000461c <fatfs_fat_init>:
    461c:	ff010113          	addi	sp,sp,-16
    4620:	00812423          	sw	s0,8(sp)
    4624:	00912223          	sw	s1,4(sp)
    4628:	00112623          	sw	ra,12(sp)
    462c:	fff00793          	li	a5,-1
    4630:	25850493          	addi	s1,a0,600
    4634:	00050413          	mv	s0,a0
    4638:	44f52c23          	sw	a5,1112(a0)
    463c:	24052a23          	sw	zero,596(a0)
    4640:	44052e23          	sw	zero,1116(a0)
    4644:	20000613          	li	a2,512
    4648:	00048513          	mv	a0,s1
    464c:	00000593          	li	a1,0
    4650:	ffffe097          	auipc	ra,0xffffe
    4654:	790080e7          	jalr	1936(ra) # 2de0 <memset>
    4658:	25442783          	lw	a5,596(s0)
    465c:	00c12083          	lw	ra,12(sp)
    4660:	24942a23          	sw	s1,596(s0)
    4664:	46042023          	sw	zero,1120(s0)
    4668:	46f42223          	sw	a5,1124(s0)
    466c:	00812403          	lw	s0,8(sp)
    4670:	00412483          	lw	s1,4(sp)
    4674:	01010113          	addi	sp,sp,16
    4678:	00008067          	ret

0000467c <fatfs_init>:
    467c:	fd010113          	addi	sp,sp,-48
    4680:	02812423          	sw	s0,40(sp)
    4684:	02112623          	sw	ra,44(sp)
    4688:	02912223          	sw	s1,36(sp)
    468c:	03212023          	sw	s2,32(sp)
    4690:	01312e23          	sw	s3,28(sp)
    4694:	fff00793          	li	a5,-1
    4698:	24f52223          	sw	a5,580(a0)
    469c:	24052423          	sw	zero,584(a0)
    46a0:	02052223          	sw	zero,36(a0)
    46a4:	00050413          	mv	s0,a0
    46a8:	00000097          	auipc	ra,0x0
    46ac:	f74080e7          	jalr	-140(ra) # 461c <fatfs_fat_init>
    46b0:	03442783          	lw	a5,52(s0)
    46b4:	02079463          	bnez	a5,46dc <fatfs_init+0x60>
    46b8:	fff00713          	li	a4,-1
    46bc:	02c12083          	lw	ra,44(sp)
    46c0:	02812403          	lw	s0,40(sp)
    46c4:	02412483          	lw	s1,36(sp)
    46c8:	02012903          	lw	s2,32(sp)
    46cc:	01c12983          	lw	s3,28(sp)
    46d0:	00070513          	mv	a0,a4
    46d4:	03010113          	addi	sp,sp,48
    46d8:	00008067          	ret
    46dc:	04440593          	addi	a1,s0,68
    46e0:	00100613          	li	a2,1
    46e4:	00000513          	li	a0,0
    46e8:	00b12623          	sw	a1,12(sp)
    46ec:	000780e7          	jalr	a5
    46f0:	fc0504e3          	beqz	a0,46b8 <fatfs_init+0x3c>
    46f4:	24244703          	lbu	a4,578(s0)
    46f8:	05500793          	li	a5,85
    46fc:	00c12583          	lw	a1,12(sp)
    4700:	00f70663          	beq	a4,a5,470c <fatfs_init+0x90>
    4704:	ffd00713          	li	a4,-3
    4708:	fb5ff06f          	j	46bc <fatfs_init+0x40>
    470c:	24344703          	lbu	a4,579(s0)
    4710:	0aa00793          	li	a5,170
    4714:	fef718e3          	bne	a4,a5,4704 <fatfs_init+0x88>
    4718:	20644783          	lbu	a5,518(s0)
    471c:	00600713          	li	a4,6
    4720:	02f76463          	bltu	a4,a5,4748 <fatfs_init+0xcc>
    4724:	00400713          	li	a4,4
    4728:	00f76663          	bltu	a4,a5,4734 <fatfs_init+0xb8>
    472c:	00000513          	li	a0,0
    4730:	02078663          	beqz	a5,475c <fatfs_init+0xe0>
    4734:	20c45503          	lhu	a0,524(s0)
    4738:	20a45783          	lhu	a5,522(s0)
    473c:	01051513          	slli	a0,a0,0x10
    4740:	00f56533          	or	a0,a0,a5
    4744:	0180006f          	j	475c <fatfs_init+0xe0>
    4748:	00c00713          	li	a4,12
    474c:	12f76663          	bltu	a4,a5,4878 <fatfs_init+0x1fc>
    4750:	00a00713          	li	a4,10
    4754:	00000513          	li	a0,0
    4758:	fcf76ee3          	bltu	a4,a5,4734 <fatfs_init+0xb8>
    475c:	03442783          	lw	a5,52(s0)
    4760:	00a42e23          	sw	a0,28(s0)
    4764:	00100613          	li	a2,1
    4768:	000780e7          	jalr	a5
    476c:	f40506e3          	beqz	a0,46b8 <fatfs_init+0x3c>
    4770:	05044783          	lbu	a5,80(s0)
    4774:	04f44703          	lbu	a4,79(s0)
    4778:	20000693          	li	a3,512
    477c:	00879793          	slli	a5,a5,0x8
    4780:	00e7e7b3          	or	a5,a5,a4
    4784:	ffe00713          	li	a4,-2
    4788:	f2d79ae3          	bne	a5,a3,46bc <fatfs_init+0x40>
    478c:	05644483          	lbu	s1,86(s0)
    4790:	05544783          	lbu	a5,85(s0)
    4794:	05144983          	lbu	s3,81(s0)
    4798:	00849493          	slli	s1,s1,0x8
    479c:	05a45583          	lhu	a1,90(s0)
    47a0:	00f4e4b3          	or	s1,s1,a5
    47a4:	01340023          	sb	s3,0(s0)
    47a8:	02941423          	sh	s1,40(s0)
    47ac:	05245903          	lhu	s2,82(s0)
    47b0:	05444503          	lbu	a0,84(s0)
    47b4:	00059463          	bnez	a1,47bc <fatfs_init+0x140>
    47b8:	06842583          	lw	a1,104(s0)
    47bc:	07042783          	lw	a5,112(s0)
    47c0:	02b42023          	sw	a1,32(s0)
    47c4:	00549493          	slli	s1,s1,0x5
    47c8:	00f42423          	sw	a5,8(s0)
    47cc:	07445783          	lhu	a5,116(s0)
    47d0:	1ff48493          	addi	s1,s1,511
    47d4:	4094d493          	srai	s1,s1,0x9
    47d8:	00f41c23          	sh	a5,24(s0)
    47dc:	fffff097          	auipc	ra,0xfffff
    47e0:	ccc080e7          	jalr	-820(ra) # 34a8 <__mulsi3>
    47e4:	00a907b3          	add	a5,s2,a0
    47e8:	00f42623          	sw	a5,12(s0)
    47ec:	01c42783          	lw	a5,28(s0)
    47f0:	24245703          	lhu	a4,578(s0)
    47f4:	00942823          	sw	s1,16(s0)
    47f8:	00f907b3          	add	a5,s2,a5
    47fc:	00f42a23          	sw	a5,20(s0)
    4800:	00f507b3          	add	a5,a0,a5
    4804:	00f42223          	sw	a5,4(s0)
    4808:	0000b7b7          	lui	a5,0xb
    480c:	a5578793          	addi	a5,a5,-1451 # aa55 <_files+0x19c1>
    4810:	eef71ae3          	bne	a4,a5,4704 <fatfs_init+0x88>
    4814:	05844783          	lbu	a5,88(s0)
    4818:	05744703          	lbu	a4,87(s0)
    481c:	00879793          	slli	a5,a5,0x8
    4820:	00e7e7b3          	or	a5,a5,a4
    4824:	00079463          	bnez	a5,482c <fatfs_init+0x1b0>
    4828:	06442783          	lw	a5,100(s0)
    482c:	ffb00713          	li	a4,-5
    4830:	e80986e3          	beqz	s3,46bc <fatfs_init+0x40>
    4834:	00990933          	add	s2,s2,s1
    4838:	00a90533          	add	a0,s2,a0
    483c:	40a78533          	sub	a0,a5,a0
    4840:	00098593          	mv	a1,s3
    4844:	ffffe097          	auipc	ra,0xffffe
    4848:	4f0080e7          	jalr	1264(ra) # 2d34 <__udivsi3>
    484c:	000017b7          	lui	a5,0x1
    4850:	ff478793          	addi	a5,a5,-12 # ff4 <play_music_with_controls+0x2fc>
    4854:	ffb00713          	li	a4,-5
    4858:	e6a7f2e3          	bgeu	a5,a0,46bc <fatfs_init+0x40>
    485c:	000107b7          	lui	a5,0x10
    4860:	ff478793          	addi	a5,a5,-12 # fff4 <_files+0x6f60>
    4864:	02a7e663          	bltu	a5,a0,4890 <fatfs_init+0x214>
    4868:	00042423          	sw	zero,8(s0)
    486c:	02042823          	sw	zero,48(s0)
    4870:	00000713          	li	a4,0
    4874:	e49ff06f          	j	46bc <fatfs_init+0x40>
    4878:	ff278793          	addi	a5,a5,-14
    487c:	0ff7f793          	zext.b	a5,a5
    4880:	00100713          	li	a4,1
    4884:	00000513          	li	a0,0
    4888:	eaf776e3          	bgeu	a4,a5,4734 <fatfs_init+0xb8>
    488c:	ed1ff06f          	j	475c <fatfs_init+0xe0>
    4890:	00100793          	li	a5,1
    4894:	02f42823          	sw	a5,48(s0)
    4898:	fd9ff06f          	j	4870 <fatfs_init+0x1f4>

0000489c <fl_attach_media>:
    489c:	000077b7          	lui	a5,0x7
    48a0:	00c7a783          	lw	a5,12(a5) # 700c <_filelib_init>
    48a4:	fe010113          	addi	sp,sp,-32
    48a8:	00812c23          	sw	s0,24(sp)
    48ac:	00112e23          	sw	ra,28(sp)
    48b0:	00050413          	mv	s0,a0
    48b4:	00079a63          	bnez	a5,48c8 <fl_attach_media+0x2c>
    48b8:	00b12623          	sw	a1,12(sp)
    48bc:	fffff097          	auipc	ra,0xfffff
    48c0:	080080e7          	jalr	128(ra) # 393c <fl_init>
    48c4:	00c12583          	lw	a1,12(sp)
    48c8:	000097b7          	lui	a5,0x9
    48cc:	c2c78513          	addi	a0,a5,-980 # 8c2c <_fs>
    48d0:	02b52c23          	sw	a1,56(a0)
    48d4:	02852a23          	sw	s0,52(a0)
    48d8:	00000097          	auipc	ra,0x0
    48dc:	da4080e7          	jalr	-604(ra) # 467c <fatfs_init>
    48e0:	00050593          	mv	a1,a0
    48e4:	02050863          	beqz	a0,4914 <fl_attach_media+0x78>
    48e8:	00a12623          	sw	a0,12(sp)
    48ec:	00007537          	lui	a0,0x7
    48f0:	b7c50513          	addi	a0,a0,-1156 # 6b7c <LEDS+0x238>
    48f4:	fffff097          	auipc	ra,0xfffff
    48f8:	a78080e7          	jalr	-1416(ra) # 336c <printf>
    48fc:	00c12583          	lw	a1,12(sp)
    4900:	01c12083          	lw	ra,28(sp)
    4904:	01812403          	lw	s0,24(sp)
    4908:	00058513          	mv	a0,a1
    490c:	02010113          	addi	sp,sp,32
    4910:	00008067          	ret
    4914:	000077b7          	lui	a5,0x7
    4918:	00100713          	li	a4,1
    491c:	00e7a423          	sw	a4,8(a5) # 7008 <_filelib_valid>
    4920:	fe1ff06f          	j	4900 <fl_attach_media+0x64>

00004924 <fatfs_fat_purge>:
    4924:	25452583          	lw	a1,596(a0)
    4928:	fe010113          	addi	sp,sp,-32
    492c:	00812c23          	sw	s0,24(sp)
    4930:	00112e23          	sw	ra,28(sp)
    4934:	00050413          	mv	s0,a0
    4938:	00059663          	bnez	a1,4944 <fatfs_fat_purge+0x20>
    493c:	00100513          	li	a0,1
    4940:	02c0006f          	j	496c <fatfs_fat_purge+0x48>
    4944:	2045a783          	lw	a5,516(a1)
    4948:	00079663          	bnez	a5,4954 <fatfs_fat_purge+0x30>
    494c:	20c5a583          	lw	a1,524(a1)
    4950:	fe9ff06f          	j	4938 <fatfs_fat_purge+0x14>
    4954:	00040513          	mv	a0,s0
    4958:	00b12623          	sw	a1,12(sp)
    495c:	fffff097          	auipc	ra,0xfffff
    4960:	c80080e7          	jalr	-896(ra) # 35dc <fatfs_fat_writeback>
    4964:	00c12583          	lw	a1,12(sp)
    4968:	fe0512e3          	bnez	a0,494c <fatfs_fat_purge+0x28>
    496c:	01c12083          	lw	ra,28(sp)
    4970:	01812403          	lw	s0,24(sp)
    4974:	02010113          	addi	sp,sp,32
    4978:	00008067          	ret

0000497c <fatfs_find_next_cluster>:
    497c:	ff010113          	addi	sp,sp,-16
    4980:	00812423          	sw	s0,8(sp)
    4984:	01212023          	sw	s2,0(sp)
    4988:	00112623          	sw	ra,12(sp)
    498c:	00912223          	sw	s1,4(sp)
    4990:	00050913          	mv	s2,a0
    4994:	00200413          	li	s0,2
    4998:	00058463          	beqz	a1,49a0 <fatfs_find_next_cluster+0x24>
    499c:	00058413          	mv	s0,a1
    49a0:	03092783          	lw	a5,48(s2)
    49a4:	00745493          	srli	s1,s0,0x7
    49a8:	00079463          	bnez	a5,49b0 <fatfs_find_next_cluster+0x34>
    49ac:	00845493          	srli	s1,s0,0x8
    49b0:	01492583          	lw	a1,20(s2)
    49b4:	00090513          	mv	a0,s2
    49b8:	00b485b3          	add	a1,s1,a1
    49bc:	fffff097          	auipc	ra,0xfffff
    49c0:	ca4080e7          	jalr	-860(ra) # 3660 <fatfs_fat_read_sector>
    49c4:	00050793          	mv	a5,a0
    49c8:	fff00513          	li	a0,-1
    49cc:	04078863          	beqz	a5,4a1c <fatfs_find_next_cluster+0xa0>
    49d0:	03092703          	lw	a4,48(s2)
    49d4:	2087a783          	lw	a5,520(a5)
    49d8:	04071e63          	bnez	a4,4a34 <fatfs_find_next_cluster+0xb8>
    49dc:	00849493          	slli	s1,s1,0x8
    49e0:	40940433          	sub	s0,s0,s1
    49e4:	00141413          	slli	s0,s0,0x1
    49e8:	01041413          	slli	s0,s0,0x10
    49ec:	01045413          	srli	s0,s0,0x10
    49f0:	008787b3          	add	a5,a5,s0
    49f4:	0017c503          	lbu	a0,1(a5)
    49f8:	0007c783          	lbu	a5,0(a5)
    49fc:	00851513          	slli	a0,a0,0x8
    4a00:	00f50533          	add	a0,a0,a5
    4a04:	ffff07b7          	lui	a5,0xffff0
    4a08:	00878793          	addi	a5,a5,8 # ffff0008 <__stacktop+0xfffe0008>
    4a0c:	00f507b3          	add	a5,a0,a5
    4a10:	00700713          	li	a4,7
    4a14:	00f76463          	bltu	a4,a5,4a1c <fatfs_find_next_cluster+0xa0>
    4a18:	fff00513          	li	a0,-1
    4a1c:	00c12083          	lw	ra,12(sp)
    4a20:	00812403          	lw	s0,8(sp)
    4a24:	00412483          	lw	s1,4(sp)
    4a28:	00012903          	lw	s2,0(sp)
    4a2c:	01010113          	addi	sp,sp,16
    4a30:	00008067          	ret
    4a34:	00749493          	slli	s1,s1,0x7
    4a38:	40940433          	sub	s0,s0,s1
    4a3c:	00241413          	slli	s0,s0,0x2
    4a40:	01041413          	slli	s0,s0,0x10
    4a44:	01045413          	srli	s0,s0,0x10
    4a48:	008787b3          	add	a5,a5,s0
    4a4c:	0037c503          	lbu	a0,3(a5)
    4a50:	0027c703          	lbu	a4,2(a5)
    4a54:	01851513          	slli	a0,a0,0x18
    4a58:	01071713          	slli	a4,a4,0x10
    4a5c:	00e50533          	add	a0,a0,a4
    4a60:	0007c703          	lbu	a4,0(a5)
    4a64:	0017c783          	lbu	a5,1(a5)
    4a68:	00e50533          	add	a0,a0,a4
    4a6c:	00879793          	slli	a5,a5,0x8
    4a70:	00f50533          	add	a0,a0,a5
    4a74:	00451513          	slli	a0,a0,0x4
    4a78:	00455513          	srli	a0,a0,0x4
    4a7c:	f00007b7          	lui	a5,0xf0000
    4a80:	f89ff06f          	j	4a08 <fatfs_find_next_cluster+0x8c>

00004a84 <fatfs_sector_reader>:
    4a84:	03052783          	lw	a5,48(a0)
    4a88:	fe010113          	addi	sp,sp,-32
    4a8c:	00812c23          	sw	s0,24(sp)
    4a90:	01212823          	sw	s2,16(sp)
    4a94:	01512223          	sw	s5,4(sp)
    4a98:	00112e23          	sw	ra,28(sp)
    4a9c:	00912a23          	sw	s1,20(sp)
    4aa0:	01312623          	sw	s3,12(sp)
    4aa4:	01412423          	sw	s4,8(sp)
    4aa8:	01612023          	sw	s6,0(sp)
    4aac:	00f5e7b3          	or	a5,a1,a5
    4ab0:	00050413          	mv	s0,a0
    4ab4:	00060913          	mv	s2,a2
    4ab8:	00068a93          	mv	s5,a3
    4abc:	08079063          	bnez	a5,4b3c <fatfs_sector_reader+0xb8>
    4ac0:	01052783          	lw	a5,16(a0)
    4ac4:	02f66863          	bltu	a2,a5,4af4 <fatfs_sector_reader+0x70>
    4ac8:	00000513          	li	a0,0
    4acc:	01c12083          	lw	ra,28(sp)
    4ad0:	01812403          	lw	s0,24(sp)
    4ad4:	01412483          	lw	s1,20(sp)
    4ad8:	01012903          	lw	s2,16(sp)
    4adc:	00c12983          	lw	s3,12(sp)
    4ae0:	00812a03          	lw	s4,8(sp)
    4ae4:	00412a83          	lw	s5,4(sp)
    4ae8:	00012b03          	lw	s6,0(sp)
    4aec:	02010113          	addi	sp,sp,32
    4af0:	00008067          	ret
    4af4:	01c52503          	lw	a0,28(a0)
    4af8:	00c42783          	lw	a5,12(s0)
    4afc:	00f50533          	add	a0,a0,a5
    4b00:	01250533          	add	a0,a0,s2
    4b04:	0a0a8663          	beqz	s5,4bb0 <fatfs_sector_reader+0x12c>
    4b08:	03442783          	lw	a5,52(s0)
    4b0c:	00100613          	li	a2,1
    4b10:	000a8593          	mv	a1,s5
    4b14:	01812403          	lw	s0,24(sp)
    4b18:	01c12083          	lw	ra,28(sp)
    4b1c:	01412483          	lw	s1,20(sp)
    4b20:	01012903          	lw	s2,16(sp)
    4b24:	00c12983          	lw	s3,12(sp)
    4b28:	00812a03          	lw	s4,8(sp)
    4b2c:	00412a83          	lw	s5,4(sp)
    4b30:	00012b03          	lw	s6,0(sp)
    4b34:	02010113          	addi	sp,sp,32
    4b38:	00078067          	jr	a5 # f0000000 <__stacktop+0xefff0000>
    4b3c:	00054783          	lbu	a5,0(a0)
    4b40:	00058493          	mv	s1,a1
    4b44:	00060513          	mv	a0,a2
    4b48:	00078593          	mv	a1,a5
    4b4c:	00078a13          	mv	s4,a5
    4b50:	ffffe097          	auipc	ra,0xffffe
    4b54:	1e4080e7          	jalr	484(ra) # 2d34 <__udivsi3>
    4b58:	00050b13          	mv	s6,a0
    4b5c:	00000993          	li	s3,0
    4b60:	03699a63          	bne	s3,s6,4b94 <fatfs_sector_reader+0x110>
    4b64:	fff00793          	li	a5,-1
    4b68:	f6f480e3          	beq	s1,a5,4ac8 <fatfs_sector_reader+0x44>
    4b6c:	000a0593          	mv	a1,s4
    4b70:	00090513          	mv	a0,s2
    4b74:	ffffe097          	auipc	ra,0xffffe
    4b78:	208080e7          	jalr	520(ra) # 2d7c <__umodsi3>
    4b7c:	00050913          	mv	s2,a0
    4b80:	00048593          	mv	a1,s1
    4b84:	00040513          	mv	a0,s0
    4b88:	fffff097          	auipc	ra,0xfffff
    4b8c:	c84080e7          	jalr	-892(ra) # 380c <fatfs_lba_of_cluster>
    4b90:	f71ff06f          	j	4b00 <fatfs_sector_reader+0x7c>
    4b94:	00048593          	mv	a1,s1
    4b98:	00040513          	mv	a0,s0
    4b9c:	00000097          	auipc	ra,0x0
    4ba0:	de0080e7          	jalr	-544(ra) # 497c <fatfs_find_next_cluster>
    4ba4:	00050493          	mv	s1,a0
    4ba8:	00198993          	addi	s3,s3,1
    4bac:	fb5ff06f          	j	4b60 <fatfs_sector_reader+0xdc>
    4bb0:	24442783          	lw	a5,580(s0)
    4bb4:	00a78c63          	beq	a5,a0,4bcc <fatfs_sector_reader+0x148>
    4bb8:	03442783          	lw	a5,52(s0)
    4bbc:	24a42223          	sw	a0,580(s0)
    4bc0:	00100613          	li	a2,1
    4bc4:	04440593          	addi	a1,s0,68
    4bc8:	f4dff06f          	j	4b14 <fatfs_sector_reader+0x90>
    4bcc:	00100513          	li	a0,1
    4bd0:	efdff06f          	j	4acc <fatfs_sector_reader+0x48>

00004bd4 <fatfs_get_file_entry>:
    4bd4:	eb010113          	addi	sp,sp,-336
    4bd8:	14812423          	sw	s0,328(sp)
    4bdc:	14912223          	sw	s1,324(sp)
    4be0:	13312e23          	sw	s3,316(sp)
    4be4:	13712623          	sw	s7,300(sp)
    4be8:	13812423          	sw	s8,296(sp)
    4bec:	13912223          	sw	s9,292(sp)
    4bf0:	14112623          	sw	ra,332(sp)
    4bf4:	15212023          	sw	s2,320(sp)
    4bf8:	13412c23          	sw	s4,312(sp)
    4bfc:	13512a23          	sw	s5,308(sp)
    4c00:	13612823          	sw	s6,304(sp)
    4c04:	00050993          	mv	s3,a0
    4c08:	00058c93          	mv	s9,a1
    4c0c:	00060b93          	mv	s7,a2
    4c10:	00068c13          	mv	s8,a3
    4c14:	10010ea3          	sb	zero,285(sp)
    4c18:	01810413          	addi	s0,sp,24
    4c1c:	11c10493          	addi	s1,sp,284
    4c20:	00040513          	mv	a0,s0
    4c24:	00d00613          	li	a2,13
    4c28:	00000593          	li	a1,0
    4c2c:	00d40413          	addi	s0,s0,13
    4c30:	ffffe097          	auipc	ra,0xffffe
    4c34:	1b0080e7          	jalr	432(ra) # 2de0 <memset>
    4c38:	fe9414e3          	bne	s0,s1,4c20 <fatfs_get_file_entry+0x4c>
    4c3c:	00000493          	li	s1,0
    4c40:	24498a13          	addi	s4,s3,580
    4c44:	00810913          	addi	s2,sp,8
    4c48:	00800a93          	li	s5,8
    4c4c:	02e00b13          	li	s6,46
    4c50:	00000693          	li	a3,0
    4c54:	00048613          	mv	a2,s1
    4c58:	000c8593          	mv	a1,s9
    4c5c:	00098513          	mv	a0,s3
    4c60:	00000097          	auipc	ra,0x0
    4c64:	e24080e7          	jalr	-476(ra) # 4a84 <fatfs_sector_reader>
    4c68:	08050c63          	beqz	a0,4d00 <fatfs_get_file_entry+0x12c>
    4c6c:	00148493          	addi	s1,s1,1
    4c70:	04498413          	addi	s0,s3,68
    4c74:	00040513          	mv	a0,s0
    4c78:	fffff097          	auipc	ra,0xfffff
    4c7c:	f34080e7          	jalr	-204(ra) # 3bac <fatfs_entry_lfn_text>
    4c80:	02050063          	beqz	a0,4ca0 <fatfs_get_file_entry+0xcc>
    4c84:	00040593          	mv	a1,s0
    4c88:	01810513          	addi	a0,sp,24
    4c8c:	fffff097          	auipc	ra,0xfffff
    4c90:	e18080e7          	jalr	-488(ra) # 3aa4 <fatfs_lfn_cache_entry>
    4c94:	02040413          	addi	s0,s0,32
    4c98:	fd441ee3          	bne	s0,s4,4c74 <fatfs_get_file_entry+0xa0>
    4c9c:	fb5ff06f          	j	4c50 <fatfs_get_file_entry+0x7c>
    4ca0:	00040513          	mv	a0,s0
    4ca4:	fffff097          	auipc	ra,0xfffff
    4ca8:	f1c080e7          	jalr	-228(ra) # 3bc0 <fatfs_entry_lfn_invalid>
    4cac:	00050663          	beqz	a0,4cb8 <fatfs_get_file_entry+0xe4>
    4cb0:	10010ea3          	sb	zero,285(sp)
    4cb4:	fe1ff06f          	j	4c94 <fatfs_get_file_entry+0xc0>
    4cb8:	00040593          	mv	a1,s0
    4cbc:	01810513          	addi	a0,sp,24
    4cc0:	fffff097          	auipc	ra,0xfffff
    4cc4:	f34080e7          	jalr	-204(ra) # 3bf4 <fatfs_entry_lfn_exists>
    4cc8:	06050663          	beqz	a0,4d34 <fatfs_get_file_entry+0x160>
    4ccc:	01810513          	addi	a0,sp,24
    4cd0:	fffff097          	auipc	ra,0xfffff
    4cd4:	ea0080e7          	jalr	-352(ra) # 3b70 <fatfs_lfn_cache_get>
    4cd8:	000b8593          	mv	a1,s7
    4cdc:	fffff097          	auipc	ra,0xfffff
    4ce0:	6dc080e7          	jalr	1756(ra) # 43b8 <fatfs_compare_names>
    4ce4:	fc0506e3          	beqz	a0,4cb0 <fatfs_get_file_entry+0xdc>
    4ce8:	02000613          	li	a2,32
    4cec:	00040593          	mv	a1,s0
    4cf0:	000c0513          	mv	a0,s8
    4cf4:	ffffe097          	auipc	ra,0xffffe
    4cf8:	108080e7          	jalr	264(ra) # 2dfc <memcpy>
    4cfc:	00100513          	li	a0,1
    4d00:	14c12083          	lw	ra,332(sp)
    4d04:	14812403          	lw	s0,328(sp)
    4d08:	14412483          	lw	s1,324(sp)
    4d0c:	14012903          	lw	s2,320(sp)
    4d10:	13c12983          	lw	s3,316(sp)
    4d14:	13812a03          	lw	s4,312(sp)
    4d18:	13412a83          	lw	s5,308(sp)
    4d1c:	13012b03          	lw	s6,304(sp)
    4d20:	12c12b83          	lw	s7,300(sp)
    4d24:	12812c03          	lw	s8,296(sp)
    4d28:	12412c83          	lw	s9,292(sp)
    4d2c:	15010113          	addi	sp,sp,336
    4d30:	00008067          	ret
    4d34:	00040513          	mv	a0,s0
    4d38:	fffff097          	auipc	ra,0xfffff
    4d3c:	f0c080e7          	jalr	-244(ra) # 3c44 <fatfs_entry_sfn_only>
    4d40:	f4050ae3          	beqz	a0,4c94 <fatfs_get_file_entry+0xc0>
    4d44:	00d00613          	li	a2,13
    4d48:	00000593          	li	a1,0
    4d4c:	00090513          	mv	a0,s2
    4d50:	ffffe097          	auipc	ra,0xffffe
    4d54:	090080e7          	jalr	144(ra) # 2de0 <memset>
    4d58:	00000793          	li	a5,0
    4d5c:	00f406b3          	add	a3,s0,a5
    4d60:	0006c683          	lbu	a3,0(a3)
    4d64:	00f90733          	add	a4,s2,a5
    4d68:	00178793          	addi	a5,a5,1
    4d6c:	00d70023          	sb	a3,0(a4)
    4d70:	ff5796e3          	bne	a5,s5,4d5c <fatfs_get_file_entry+0x188>
    4d74:	00844703          	lbu	a4,8(s0)
    4d78:	00944783          	lbu	a5,9(s0)
    4d7c:	00a44683          	lbu	a3,10(s0)
    4d80:	00e108a3          	sb	a4,17(sp)
    4d84:	00f10923          	sb	a5,18(sp)
    4d88:	fe070713          	addi	a4,a4,-32
    4d8c:	fe078793          	addi	a5,a5,-32
    4d90:	00f037b3          	snez	a5,a5
    4d94:	00e03733          	snez	a4,a4
    4d98:	00d109a3          	sb	a3,19(sp)
    4d9c:	00e7e7b3          	or	a5,a5,a4
    4da0:	00079863          	bnez	a5,4db0 <fatfs_get_file_entry+0x1dc>
    4da4:	fe068693          	addi	a3,a3,-32
    4da8:	02000793          	li	a5,32
    4dac:	00068a63          	beqz	a3,4dc0 <fatfs_get_file_entry+0x1ec>
    4db0:	00814703          	lbu	a4,8(sp)
    4db4:	02e00793          	li	a5,46
    4db8:	01671463          	bne	a4,s6,4dc0 <fatfs_get_file_entry+0x1ec>
    4dbc:	02000793          	li	a5,32
    4dc0:	00f10823          	sb	a5,16(sp)
    4dc4:	000b8593          	mv	a1,s7
    4dc8:	00090513          	mv	a0,s2
    4dcc:	f11ff06f          	j	4cdc <fatfs_get_file_entry+0x108>

00004dd0 <_open_directory>:
    4dd0:	eb010113          	addi	sp,sp,-336
    4dd4:	15212023          	sw	s2,320(sp)
    4dd8:	00009937          	lui	s2,0x9
    4ddc:	c2c90913          	addi	s2,s2,-980 # 8c2c <_fs>
    4de0:	14812423          	sw	s0,328(sp)
    4de4:	00892403          	lw	s0,8(s2)
    4de8:	14912223          	sw	s1,324(sp)
    4dec:	13312e23          	sw	s3,316(sp)
    4df0:	13412c23          	sw	s4,312(sp)
    4df4:	13512a23          	sw	s5,308(sp)
    4df8:	13612823          	sw	s6,304(sp)
    4dfc:	14112623          	sw	ra,332(sp)
    4e00:	00050a13          	mv	s4,a0
    4e04:	00058a93          	mv	s5,a1
    4e08:	fffff097          	auipc	ra,0xfffff
    4e0c:	368080e7          	jalr	872(ra) # 4170 <fatfs_total_path_levels>
    4e10:	00050b13          	mv	s6,a0
    4e14:	00000493          	li	s1,0
    4e18:	fff00993          	li	s3,-1
    4e1c:	009b5863          	bge	s6,s1,4e2c <_open_directory+0x5c>
    4e20:	008aa023          	sw	s0,0(s5)
    4e24:	00100513          	li	a0,1
    4e28:	0240006f          	j	4e4c <_open_directory+0x7c>
    4e2c:	10400693          	li	a3,260
    4e30:	02c10613          	addi	a2,sp,44
    4e34:	00048593          	mv	a1,s1
    4e38:	000a0513          	mv	a0,s4
    4e3c:	fffff097          	auipc	ra,0xfffff
    4e40:	3a4080e7          	jalr	932(ra) # 41e0 <fatfs_get_substring>
    4e44:	03351863          	bne	a0,s3,4e74 <_open_directory+0xa4>
    4e48:	00000513          	li	a0,0
    4e4c:	14c12083          	lw	ra,332(sp)
    4e50:	14812403          	lw	s0,328(sp)
    4e54:	14412483          	lw	s1,324(sp)
    4e58:	14012903          	lw	s2,320(sp)
    4e5c:	13c12983          	lw	s3,316(sp)
    4e60:	13812a03          	lw	s4,312(sp)
    4e64:	13412a83          	lw	s5,308(sp)
    4e68:	13012b03          	lw	s6,304(sp)
    4e6c:	15010113          	addi	sp,sp,336
    4e70:	00008067          	ret
    4e74:	00c10693          	addi	a3,sp,12
    4e78:	02c10613          	addi	a2,sp,44
    4e7c:	00040593          	mv	a1,s0
    4e80:	00090513          	mv	a0,s2
    4e84:	00000097          	auipc	ra,0x0
    4e88:	d50080e7          	jalr	-688(ra) # 4bd4 <fatfs_get_file_entry>
    4e8c:	fa050ee3          	beqz	a0,4e48 <_open_directory+0x78>
    4e90:	01714783          	lbu	a5,23(sp)
    4e94:	0107f793          	andi	a5,a5,16
    4e98:	fa0788e3          	beqz	a5,4e48 <_open_directory+0x78>
    4e9c:	02015403          	lhu	s0,32(sp)
    4ea0:	02615783          	lhu	a5,38(sp)
    4ea4:	00148493          	addi	s1,s1,1
    4ea8:	01041413          	slli	s0,s0,0x10
    4eac:	00f40433          	add	s0,s0,a5
    4eb0:	f6dff06f          	j	4e1c <_open_directory+0x4c>

00004eb4 <fl_opendir>:
    4eb4:	fe010113          	addi	sp,sp,-32
    4eb8:	fff00793          	li	a5,-1
    4ebc:	00f12623          	sw	a5,12(sp)
    4ec0:	000077b7          	lui	a5,0x7
    4ec4:	00c7a783          	lw	a5,12(a5) # 700c <_filelib_init>
    4ec8:	00812c23          	sw	s0,24(sp)
    4ecc:	01212823          	sw	s2,16(sp)
    4ed0:	00112e23          	sw	ra,28(sp)
    4ed4:	00912a23          	sw	s1,20(sp)
    4ed8:	00050913          	mv	s2,a0
    4edc:	00058413          	mv	s0,a1
    4ee0:	00079663          	bnez	a5,4eec <fl_opendir+0x38>
    4ee4:	fffff097          	auipc	ra,0xfffff
    4ee8:	a58080e7          	jalr	-1448(ra) # 393c <fl_init>
    4eec:	000094b7          	lui	s1,0x9
    4ef0:	c2c48493          	addi	s1,s1,-980 # 8c2c <_fs>
    4ef4:	03c4a783          	lw	a5,60(s1)
    4ef8:	00078463          	beqz	a5,4f00 <fl_opendir+0x4c>
    4efc:	000780e7          	jalr	a5
    4f00:	00090513          	mv	a0,s2
    4f04:	fffff097          	auipc	ra,0xfffff
    4f08:	26c080e7          	jalr	620(ra) # 4170 <fatfs_total_path_levels>
    4f0c:	fff00793          	li	a5,-1
    4f10:	02f51063          	bne	a0,a5,4f30 <fl_opendir+0x7c>
    4f14:	0084a783          	lw	a5,8(s1)
    4f18:	00f12623          	sw	a5,12(sp)
    4f1c:	00c12783          	lw	a5,12(sp)
    4f20:	00042023          	sw	zero,0(s0)
    4f24:	00040423          	sb	zero,8(s0)
    4f28:	00f42223          	sw	a5,4(s0)
    4f2c:	0180006f          	j	4f44 <fl_opendir+0x90>
    4f30:	00c10593          	addi	a1,sp,12
    4f34:	00090513          	mv	a0,s2
    4f38:	00000097          	auipc	ra,0x0
    4f3c:	e98080e7          	jalr	-360(ra) # 4dd0 <_open_directory>
    4f40:	fc051ee3          	bnez	a0,4f1c <fl_opendir+0x68>
    4f44:	0404a783          	lw	a5,64(s1)
    4f48:	00078463          	beqz	a5,4f50 <fl_opendir+0x9c>
    4f4c:	000780e7          	jalr	a5
    4f50:	00c12703          	lw	a4,12(sp)
    4f54:	fff00793          	li	a5,-1
    4f58:	00f71463          	bne	a4,a5,4f60 <fl_opendir+0xac>
    4f5c:	00000413          	li	s0,0
    4f60:	01c12083          	lw	ra,28(sp)
    4f64:	00040513          	mv	a0,s0
    4f68:	01812403          	lw	s0,24(sp)
    4f6c:	01412483          	lw	s1,20(sp)
    4f70:	01012903          	lw	s2,16(sp)
    4f74:	02010113          	addi	sp,sp,32
    4f78:	00008067          	ret

00004f7c <_open_file>:
    4f7c:	fc010113          	addi	sp,sp,-64
    4f80:	03312623          	sw	s3,44(sp)
    4f84:	02112e23          	sw	ra,60(sp)
    4f88:	02812c23          	sw	s0,56(sp)
    4f8c:	02912a23          	sw	s1,52(sp)
    4f90:	03212823          	sw	s2,48(sp)
    4f94:	00050993          	mv	s3,a0
    4f98:	ffffe097          	auipc	ra,0xffffe
    4f9c:	7b4080e7          	jalr	1972(ra) # 374c <_allocate_file>
    4fa0:	06050463          	beqz	a0,5008 <_open_file+0x8c>
    4fa4:	01450913          	addi	s2,a0,20
    4fa8:	00050413          	mv	s0,a0
    4fac:	10400613          	li	a2,260
    4fb0:	00000593          	li	a1,0
    4fb4:	00090513          	mv	a0,s2
    4fb8:	ffffe097          	auipc	ra,0xffffe
    4fbc:	e28080e7          	jalr	-472(ra) # 2de0 <memset>
    4fc0:	11840493          	addi	s1,s0,280
    4fc4:	10400613          	li	a2,260
    4fc8:	00000593          	li	a1,0
    4fcc:	00048513          	mv	a0,s1
    4fd0:	ffffe097          	auipc	ra,0xffffe
    4fd4:	e10080e7          	jalr	-496(ra) # 2de0 <memset>
    4fd8:	10400713          	li	a4,260
    4fdc:	00048693          	mv	a3,s1
    4fe0:	00070613          	mv	a2,a4
    4fe4:	00090593          	mv	a1,s2
    4fe8:	00098513          	mv	a0,s3
    4fec:	fffff097          	auipc	ra,0xfffff
    4ff0:	2dc080e7          	jalr	732(ra) # 42c8 <fatfs_split_path>
    4ff4:	fff00793          	li	a5,-1
    4ff8:	02f51a63          	bne	a0,a5,502c <_open_file+0xb0>
    4ffc:	00040513          	mv	a0,s0
    5000:	ffffe097          	auipc	ra,0xffffe
    5004:	7c4080e7          	jalr	1988(ra) # 37c4 <_free_file>
    5008:	00000413          	li	s0,0
    500c:	03c12083          	lw	ra,60(sp)
    5010:	00040513          	mv	a0,s0
    5014:	03812403          	lw	s0,56(sp)
    5018:	03412483          	lw	s1,52(sp)
    501c:	03012903          	lw	s2,48(sp)
    5020:	02c12983          	lw	s3,44(sp)
    5024:	04010113          	addi	sp,sp,64
    5028:	00008067          	ret
    502c:	00040513          	mv	a0,s0
    5030:	fffff097          	auipc	ra,0xfffff
    5034:	514080e7          	jalr	1300(ra) # 4544 <_check_file_open>
    5038:	fc0512e3          	bnez	a0,4ffc <_open_file+0x80>
    503c:	01444783          	lbu	a5,20(s0)
    5040:	08079c63          	bnez	a5,50d8 <_open_file+0x15c>
    5044:	000097b7          	lui	a5,0x9
    5048:	c347a783          	lw	a5,-972(a5) # 8c34 <_fs+0x8>
    504c:	00f42023          	sw	a5,0(s0)
    5050:	00042583          	lw	a1,0(s0)
    5054:	00048613          	mv	a2,s1
    5058:	000094b7          	lui	s1,0x9
    505c:	00010693          	mv	a3,sp
    5060:	c2c48513          	addi	a0,s1,-980 # 8c2c <_fs>
    5064:	00000097          	auipc	ra,0x0
    5068:	b70080e7          	jalr	-1168(ra) # 4bd4 <fatfs_get_file_entry>
    506c:	f80508e3          	beqz	a0,4ffc <_open_file+0x80>
    5070:	00b14783          	lbu	a5,11(sp)
    5074:	0207f793          	andi	a5,a5,32
    5078:	f80782e3          	beqz	a5,4ffc <_open_file+0x80>
    507c:	00b00613          	li	a2,11
    5080:	00010593          	mv	a1,sp
    5084:	21c40513          	addi	a0,s0,540
    5088:	ffffe097          	auipc	ra,0xffffe
    508c:	d74080e7          	jalr	-652(ra) # 2dfc <memcpy>
    5090:	01c12783          	lw	a5,28(sp)
    5094:	01a15703          	lhu	a4,26(sp)
    5098:	00042423          	sw	zero,8(s0)
    509c:	00f42623          	sw	a5,12(s0)
    50a0:	01415783          	lhu	a5,20(sp)
    50a4:	42042a23          	sw	zero,1076(s0)
    50a8:	00042823          	sw	zero,16(s0)
    50ac:	01079793          	slli	a5,a5,0x10
    50b0:	00e787b3          	add	a5,a5,a4
    50b4:	00f42223          	sw	a5,4(s0)
    50b8:	fff00793          	li	a5,-1
    50bc:	42f42823          	sw	a5,1072(s0)
    50c0:	22f42423          	sw	a5,552(s0)
    50c4:	22f42623          	sw	a5,556(s0)
    50c8:	c2c48513          	addi	a0,s1,-980
    50cc:	00000097          	auipc	ra,0x0
    50d0:	858080e7          	jalr	-1960(ra) # 4924 <fatfs_fat_purge>
    50d4:	f39ff06f          	j	500c <_open_file+0x90>
    50d8:	00040593          	mv	a1,s0
    50dc:	00090513          	mv	a0,s2
    50e0:	00000097          	auipc	ra,0x0
    50e4:	cf0080e7          	jalr	-784(ra) # 4dd0 <_open_directory>
    50e8:	f60514e3          	bnez	a0,5050 <_open_file+0xd4>
    50ec:	f11ff06f          	j	4ffc <_open_file+0x80>

000050f0 <fatfs_sfn_exists>:
    50f0:	fe010113          	addi	sp,sp,-32
    50f4:	01212823          	sw	s2,16(sp)
    50f8:	01312623          	sw	s3,12(sp)
    50fc:	01412423          	sw	s4,8(sp)
    5100:	01512223          	sw	s5,4(sp)
    5104:	01612023          	sw	s6,0(sp)
    5108:	00112e23          	sw	ra,28(sp)
    510c:	00812c23          	sw	s0,24(sp)
    5110:	00912a23          	sw	s1,20(sp)
    5114:	00050993          	mv	s3,a0
    5118:	00058a93          	mv	s5,a1
    511c:	00060b13          	mv	s6,a2
    5120:	00000913          	li	s2,0
    5124:	24450a13          	addi	s4,a0,580
    5128:	00000693          	li	a3,0
    512c:	00090613          	mv	a2,s2
    5130:	000a8593          	mv	a1,s5
    5134:	00098513          	mv	a0,s3
    5138:	00000097          	auipc	ra,0x0
    513c:	94c080e7          	jalr	-1716(ra) # 4a84 <fatfs_sector_reader>
    5140:	00050413          	mv	s0,a0
    5144:	06050263          	beqz	a0,51a8 <fatfs_sfn_exists+0xb8>
    5148:	00190913          	addi	s2,s2,1
    514c:	04498493          	addi	s1,s3,68
    5150:	00048513          	mv	a0,s1
    5154:	fffff097          	auipc	ra,0xfffff
    5158:	a58080e7          	jalr	-1448(ra) # 3bac <fatfs_entry_lfn_text>
    515c:	00050863          	beqz	a0,516c <fatfs_sfn_exists+0x7c>
    5160:	02048493          	addi	s1,s1,32
    5164:	ff4496e3          	bne	s1,s4,5150 <fatfs_sfn_exists+0x60>
    5168:	fc1ff06f          	j	5128 <fatfs_sfn_exists+0x38>
    516c:	00048513          	mv	a0,s1
    5170:	fffff097          	auipc	ra,0xfffff
    5174:	a50080e7          	jalr	-1456(ra) # 3bc0 <fatfs_entry_lfn_invalid>
    5178:	fe0514e3          	bnez	a0,5160 <fatfs_sfn_exists+0x70>
    517c:	00048513          	mv	a0,s1
    5180:	fffff097          	auipc	ra,0xfffff
    5184:	ac4080e7          	jalr	-1340(ra) # 3c44 <fatfs_entry_sfn_only>
    5188:	00050413          	mv	s0,a0
    518c:	fc050ae3          	beqz	a0,5160 <fatfs_sfn_exists+0x70>
    5190:	00b00613          	li	a2,11
    5194:	000b0593          	mv	a1,s6
    5198:	00048513          	mv	a0,s1
    519c:	ffffe097          	auipc	ra,0xffffe
    51a0:	ca4080e7          	jalr	-860(ra) # 2e40 <strncmp>
    51a4:	fa051ee3          	bnez	a0,5160 <fatfs_sfn_exists+0x70>
    51a8:	01c12083          	lw	ra,28(sp)
    51ac:	00040513          	mv	a0,s0
    51b0:	01812403          	lw	s0,24(sp)
    51b4:	01412483          	lw	s1,20(sp)
    51b8:	01012903          	lw	s2,16(sp)
    51bc:	00c12983          	lw	s3,12(sp)
    51c0:	00812a03          	lw	s4,8(sp)
    51c4:	00412a83          	lw	s5,4(sp)
    51c8:	00012b03          	lw	s6,0(sp)
    51cc:	02010113          	addi	sp,sp,32
    51d0:	00008067          	ret

000051d4 <fatfs_update_file_length>:
    51d4:	03852783          	lw	a5,56(a0)
    51d8:	14078e63          	beqz	a5,5334 <fatfs_update_file_length+0x160>
    51dc:	fd010113          	addi	sp,sp,-48
    51e0:	02912223          	sw	s1,36(sp)
    51e4:	03212023          	sw	s2,32(sp)
    51e8:	01312e23          	sw	s3,28(sp)
    51ec:	01412c23          	sw	s4,24(sp)
    51f0:	01612823          	sw	s6,16(sp)
    51f4:	01712623          	sw	s7,12(sp)
    51f8:	02112623          	sw	ra,44(sp)
    51fc:	02812423          	sw	s0,40(sp)
    5200:	01512a23          	sw	s5,20(sp)
    5204:	00068913          	mv	s2,a3
    5208:	00060b93          	mv	s7,a2
    520c:	00058b13          	mv	s6,a1
    5210:	00050493          	mv	s1,a0
    5214:	00000993          	li	s3,0
    5218:	24450a13          	addi	s4,a0,580
    521c:	00000693          	li	a3,0
    5220:	00098613          	mv	a2,s3
    5224:	000b0593          	mv	a1,s6
    5228:	00048513          	mv	a0,s1
    522c:	00000097          	auipc	ra,0x0
    5230:	858080e7          	jalr	-1960(ra) # 4a84 <fatfs_sector_reader>
    5234:	0c050863          	beqz	a0,5304 <fatfs_update_file_length+0x130>
    5238:	04448413          	addi	s0,s1,68
    523c:	00198993          	addi	s3,s3,1
    5240:	00040a93          	mv	s5,s0
    5244:	00040513          	mv	a0,s0
    5248:	fffff097          	auipc	ra,0xfffff
    524c:	964080e7          	jalr	-1692(ra) # 3bac <fatfs_entry_lfn_text>
    5250:	0a051463          	bnez	a0,52f8 <fatfs_update_file_length+0x124>
    5254:	00040513          	mv	a0,s0
    5258:	fffff097          	auipc	ra,0xfffff
    525c:	968080e7          	jalr	-1688(ra) # 3bc0 <fatfs_entry_lfn_invalid>
    5260:	08051c63          	bnez	a0,52f8 <fatfs_update_file_length+0x124>
    5264:	00040513          	mv	a0,s0
    5268:	fffff097          	auipc	ra,0xfffff
    526c:	9dc080e7          	jalr	-1572(ra) # 3c44 <fatfs_entry_sfn_only>
    5270:	08050463          	beqz	a0,52f8 <fatfs_update_file_length+0x124>
    5274:	00b00613          	li	a2,11
    5278:	000b8593          	mv	a1,s7
    527c:	00040513          	mv	a0,s0
    5280:	ffffe097          	auipc	ra,0xffffe
    5284:	bc0080e7          	jalr	-1088(ra) # 2e40 <strncmp>
    5288:	06051863          	bnez	a0,52f8 <fatfs_update_file_length+0x124>
    528c:	00895793          	srli	a5,s2,0x8
    5290:	01240e23          	sb	s2,28(s0)
    5294:	00f40ea3          	sb	a5,29(s0)
    5298:	01095793          	srli	a5,s2,0x10
    529c:	01895913          	srli	s2,s2,0x18
    52a0:	00f40f23          	sb	a5,30(s0)
    52a4:	01240fa3          	sb	s2,31(s0)
    52a8:	00040593          	mv	a1,s0
    52ac:	02000613          	li	a2,32
    52b0:	00040513          	mv	a0,s0
    52b4:	ffffe097          	auipc	ra,0xffffe
    52b8:	b48080e7          	jalr	-1208(ra) # 2dfc <memcpy>
    52bc:	02812403          	lw	s0,40(sp)
    52c0:	0384a783          	lw	a5,56(s1)
    52c4:	2444a503          	lw	a0,580(s1)
    52c8:	02c12083          	lw	ra,44(sp)
    52cc:	02412483          	lw	s1,36(sp)
    52d0:	02012903          	lw	s2,32(sp)
    52d4:	01c12983          	lw	s3,28(sp)
    52d8:	01812a03          	lw	s4,24(sp)
    52dc:	01012b03          	lw	s6,16(sp)
    52e0:	00c12b83          	lw	s7,12(sp)
    52e4:	000a8593          	mv	a1,s5
    52e8:	01412a83          	lw	s5,20(sp)
    52ec:	00100613          	li	a2,1
    52f0:	03010113          	addi	sp,sp,48
    52f4:	00078067          	jr	a5
    52f8:	02040413          	addi	s0,s0,32
    52fc:	f54414e3          	bne	s0,s4,5244 <fatfs_update_file_length+0x70>
    5300:	f1dff06f          	j	521c <fatfs_update_file_length+0x48>
    5304:	02c12083          	lw	ra,44(sp)
    5308:	02812403          	lw	s0,40(sp)
    530c:	02412483          	lw	s1,36(sp)
    5310:	02012903          	lw	s2,32(sp)
    5314:	01c12983          	lw	s3,28(sp)
    5318:	01812a03          	lw	s4,24(sp)
    531c:	01412a83          	lw	s5,20(sp)
    5320:	01012b03          	lw	s6,16(sp)
    5324:	00c12b83          	lw	s7,12(sp)
    5328:	00000513          	li	a0,0
    532c:	03010113          	addi	sp,sp,48
    5330:	00008067          	ret
    5334:	00000513          	li	a0,0
    5338:	00008067          	ret

0000533c <fatfs_list_directory_next>:
    533c:	ec010113          	addi	sp,sp,-320
    5340:	13212823          	sw	s2,304(sp)
    5344:	13312623          	sw	s3,300(sp)
    5348:	13412423          	sw	s4,296(sp)
    534c:	13512223          	sw	s5,292(sp)
    5350:	13612023          	sw	s6,288(sp)
    5354:	12112e23          	sw	ra,316(sp)
    5358:	12812c23          	sw	s0,312(sp)
    535c:	12912a23          	sw	s1,308(sp)
    5360:	00050a13          	mv	s4,a0
    5364:	00058913          	mv	s2,a1
    5368:	00060993          	mv	s3,a2
    536c:	10010ea3          	sb	zero,285(sp)
    5370:	04450a93          	addi	s5,a0,68
    5374:	00f00b13          	li	s6,15
    5378:	00092603          	lw	a2,0(s2)
    537c:	00492583          	lw	a1,4(s2)
    5380:	00000693          	li	a3,0
    5384:	000a0513          	mv	a0,s4
    5388:	fffff097          	auipc	ra,0xfffff
    538c:	6fc080e7          	jalr	1788(ra) # 4a84 <fatfs_sector_reader>
    5390:	10050c63          	beqz	a0,54a8 <fatfs_list_directory_next+0x16c>
    5394:	00894483          	lbu	s1,8(s2)
    5398:	00549413          	slli	s0,s1,0x5
    539c:	008a8433          	add	s0,s5,s0
    53a0:	009b7c63          	bgeu	s6,s1,53b8 <fatfs_list_directory_next+0x7c>
    53a4:	00092783          	lw	a5,0(s2)
    53a8:	00090423          	sb	zero,8(s2)
    53ac:	00178793          	addi	a5,a5,1
    53b0:	00f92023          	sw	a5,0(s2)
    53b4:	fc5ff06f          	j	5378 <fatfs_list_directory_next+0x3c>
    53b8:	00040513          	mv	a0,s0
    53bc:	ffffe097          	auipc	ra,0xffffe
    53c0:	7f0080e7          	jalr	2032(ra) # 3bac <fatfs_entry_lfn_text>
    53c4:	02050263          	beqz	a0,53e8 <fatfs_list_directory_next+0xac>
    53c8:	00040593          	mv	a1,s0
    53cc:	01810513          	addi	a0,sp,24
    53d0:	ffffe097          	auipc	ra,0xffffe
    53d4:	6d4080e7          	jalr	1748(ra) # 3aa4 <fatfs_lfn_cache_entry>
    53d8:	00148493          	addi	s1,s1,1
    53dc:	0ff4f493          	zext.b	s1,s1
    53e0:	02040413          	addi	s0,s0,32
    53e4:	fbdff06f          	j	53a0 <fatfs_list_directory_next+0x64>
    53e8:	00040513          	mv	a0,s0
    53ec:	ffffe097          	auipc	ra,0xffffe
    53f0:	7d4080e7          	jalr	2004(ra) # 3bc0 <fatfs_entry_lfn_invalid>
    53f4:	00050663          	beqz	a0,5400 <fatfs_list_directory_next+0xc4>
    53f8:	10010ea3          	sb	zero,285(sp)
    53fc:	fddff06f          	j	53d8 <fatfs_list_directory_next+0x9c>
    5400:	00040593          	mv	a1,s0
    5404:	01810513          	addi	a0,sp,24
    5408:	ffffe097          	auipc	ra,0xffffe
    540c:	7ec080e7          	jalr	2028(ra) # 3bf4 <fatfs_entry_lfn_exists>
    5410:	0c050063          	beqz	a0,54d0 <fatfs_list_directory_next+0x194>
    5414:	01810513          	addi	a0,sp,24
    5418:	ffffe097          	auipc	ra,0xffffe
    541c:	758080e7          	jalr	1880(ra) # 3b70 <fatfs_lfn_cache_get>
    5420:	00050593          	mv	a1,a0
    5424:	10300613          	li	a2,259
    5428:	00098513          	mv	a0,s3
    542c:	ffffe097          	auipc	ra,0xffffe
    5430:	a54080e7          	jalr	-1452(ra) # 2e80 <strncpy>
    5434:	00040513          	mv	a0,s0
    5438:	fffff097          	auipc	ra,0xfffff
    543c:	84c080e7          	jalr	-1972(ra) # 3c84 <fatfs_entry_is_dir>
    5440:	10a98223          	sb	a0,260(s3)
    5444:	01d44783          	lbu	a5,29(s0)
    5448:	01c44703          	lbu	a4,28(s0)
    544c:	00148493          	addi	s1,s1,1
    5450:	00879793          	slli	a5,a5,0x8
    5454:	00e7e7b3          	or	a5,a5,a4
    5458:	01e44703          	lbu	a4,30(s0)
    545c:	00100513          	li	a0,1
    5460:	01071713          	slli	a4,a4,0x10
    5464:	00f76733          	or	a4,a4,a5
    5468:	01f44783          	lbu	a5,31(s0)
    546c:	01879793          	slli	a5,a5,0x18
    5470:	00e7e7b3          	or	a5,a5,a4
    5474:	10f9a623          	sw	a5,268(s3)
    5478:	01544783          	lbu	a5,21(s0)
    547c:	01444703          	lbu	a4,20(s0)
    5480:	01a44683          	lbu	a3,26(s0)
    5484:	00879793          	slli	a5,a5,0x8
    5488:	00e7e7b3          	or	a5,a5,a4
    548c:	01b44703          	lbu	a4,27(s0)
    5490:	01079793          	slli	a5,a5,0x10
    5494:	00871713          	slli	a4,a4,0x8
    5498:	00d76733          	or	a4,a4,a3
    549c:	00e7e7b3          	or	a5,a5,a4
    54a0:	10f9a423          	sw	a5,264(s3)
    54a4:	00990423          	sb	s1,8(s2)
    54a8:	13c12083          	lw	ra,316(sp)
    54ac:	13812403          	lw	s0,312(sp)
    54b0:	13412483          	lw	s1,308(sp)
    54b4:	13012903          	lw	s2,304(sp)
    54b8:	12c12983          	lw	s3,300(sp)
    54bc:	12812a03          	lw	s4,296(sp)
    54c0:	12412a83          	lw	s5,292(sp)
    54c4:	12012b03          	lw	s6,288(sp)
    54c8:	14010113          	addi	sp,sp,320
    54cc:	00008067          	ret
    54d0:	00040513          	mv	a0,s0
    54d4:	ffffe097          	auipc	ra,0xffffe
    54d8:	770080e7          	jalr	1904(ra) # 3c44 <fatfs_entry_sfn_only>
    54dc:	ee050ee3          	beqz	a0,53d8 <fatfs_list_directory_next+0x9c>
    54e0:	00810a13          	addi	s4,sp,8
    54e4:	00d00613          	li	a2,13
    54e8:	00000593          	li	a1,0
    54ec:	000a0513          	mv	a0,s4
    54f0:	10010ea3          	sb	zero,285(sp)
    54f4:	ffffe097          	auipc	ra,0xffffe
    54f8:	8ec080e7          	jalr	-1812(ra) # 2de0 <memset>
    54fc:	00000793          	li	a5,0
    5500:	00800713          	li	a4,8
    5504:	00f40633          	add	a2,s0,a5
    5508:	00064603          	lbu	a2,0(a2)
    550c:	00fa06b3          	add	a3,s4,a5
    5510:	00178793          	addi	a5,a5,1
    5514:	00c68023          	sb	a2,0(a3)
    5518:	fee796e3          	bne	a5,a4,5504 <fatfs_list_directory_next+0x1c8>
    551c:	00844783          	lbu	a5,8(s0)
    5520:	00944703          	lbu	a4,9(s0)
    5524:	00a44683          	lbu	a3,10(s0)
    5528:	00f108a3          	sb	a5,17(sp)
    552c:	00e10923          	sb	a4,18(sp)
    5530:	fe078793          	addi	a5,a5,-32
    5534:	fe070713          	addi	a4,a4,-32
    5538:	00f037b3          	snez	a5,a5
    553c:	00e03733          	snez	a4,a4
    5540:	00d109a3          	sb	a3,19(sp)
    5544:	00e7e7b3          	or	a5,a5,a4
    5548:	00079863          	bnez	a5,5558 <fatfs_list_directory_next+0x21c>
    554c:	fe068693          	addi	a3,a3,-32
    5550:	02000793          	li	a5,32
    5554:	00068a63          	beqz	a3,5568 <fatfs_list_directory_next+0x22c>
    5558:	00814703          	lbu	a4,8(sp)
    555c:	02e00793          	li	a5,46
    5560:	00f71463          	bne	a4,a5,5568 <fatfs_list_directory_next+0x22c>
    5564:	02000793          	li	a5,32
    5568:	000a0593          	mv	a1,s4
    556c:	00098513          	mv	a0,s3
    5570:	00f10823          	sb	a5,16(sp)
    5574:	fffff097          	auipc	ra,0xfffff
    5578:	054080e7          	jalr	84(ra) # 45c8 <fatfs_get_sfn_display_name>
    557c:	eb9ff06f          	j	5434 <fatfs_list_directory_next+0xf8>

00005580 <fl_readdir>:
    5580:	000077b7          	lui	a5,0x7
    5584:	00c7a783          	lw	a5,12(a5) # 700c <_filelib_init>
    5588:	fd010113          	addi	sp,sp,-48
    558c:	03212023          	sw	s2,32(sp)
    5590:	01312e23          	sw	s3,28(sp)
    5594:	02112623          	sw	ra,44(sp)
    5598:	02812423          	sw	s0,40(sp)
    559c:	02912223          	sw	s1,36(sp)
    55a0:	00050913          	mv	s2,a0
    55a4:	00058993          	mv	s3,a1
    55a8:	00079663          	bnez	a5,55b4 <fl_readdir+0x34>
    55ac:	ffffe097          	auipc	ra,0xffffe
    55b0:	390080e7          	jalr	912(ra) # 393c <fl_init>
    55b4:	000094b7          	lui	s1,0x9
    55b8:	c2c48413          	addi	s0,s1,-980 # 8c2c <_fs>
    55bc:	03c42783          	lw	a5,60(s0)
    55c0:	00078463          	beqz	a5,55c8 <fl_readdir+0x48>
    55c4:	000780e7          	jalr	a5
    55c8:	00098613          	mv	a2,s3
    55cc:	00090593          	mv	a1,s2
    55d0:	c2c48513          	addi	a0,s1,-980
    55d4:	00000097          	auipc	ra,0x0
    55d8:	d68080e7          	jalr	-664(ra) # 533c <fatfs_list_directory_next>
    55dc:	04042783          	lw	a5,64(s0)
    55e0:	00078863          	beqz	a5,55f0 <fl_readdir+0x70>
    55e4:	00a12623          	sw	a0,12(sp)
    55e8:	000780e7          	jalr	a5
    55ec:	00c12503          	lw	a0,12(sp)
    55f0:	02c12083          	lw	ra,44(sp)
    55f4:	02812403          	lw	s0,40(sp)
    55f8:	00154513          	xori	a0,a0,1
    55fc:	02412483          	lw	s1,36(sp)
    5600:	02012903          	lw	s2,32(sp)
    5604:	01c12983          	lw	s3,28(sp)
    5608:	40a00533          	neg	a0,a0
    560c:	03010113          	addi	sp,sp,48
    5610:	00008067          	ret

00005614 <_read_sectors>:
    5614:	fd010113          	addi	sp,sp,-48
    5618:	01512a23          	sw	s5,20(sp)
    561c:	00009ab7          	lui	s5,0x9
    5620:	01312e23          	sw	s3,28(sp)
    5624:	c2cac983          	lbu	s3,-980(s5) # 8c2c <_fs>
    5628:	01612823          	sw	s6,16(sp)
    562c:	00058b13          	mv	s6,a1
    5630:	02912223          	sw	s1,36(sp)
    5634:	00098593          	mv	a1,s3
    5638:	00050493          	mv	s1,a0
    563c:	000b0513          	mv	a0,s6
    5640:	02112623          	sw	ra,44(sp)
    5644:	02812423          	sw	s0,40(sp)
    5648:	01412c23          	sw	s4,24(sp)
    564c:	00068413          	mv	s0,a3
    5650:	01712623          	sw	s7,12(sp)
    5654:	01812423          	sw	s8,8(sp)
    5658:	03212023          	sw	s2,32(sp)
    565c:	00060c13          	mv	s8,a2
    5660:	ffffd097          	auipc	ra,0xffffd
    5664:	6d4080e7          	jalr	1748(ra) # 2d34 <__udivsi3>
    5668:	00050a13          	mv	s4,a0
    566c:	00098593          	mv	a1,s3
    5670:	000b0513          	mv	a0,s6
    5674:	ffffd097          	auipc	ra,0xffffd
    5678:	708080e7          	jalr	1800(ra) # 2d7c <__umodsi3>
    567c:	00a407b3          	add	a5,s0,a0
    5680:	00050b93          	mv	s7,a0
    5684:	00f9fe63          	bgeu	s3,a5,56a0 <_read_sectors+0x8c>
    5688:	000a0593          	mv	a1,s4
    568c:	00098513          	mv	a0,s3
    5690:	ffffe097          	auipc	ra,0xffffe
    5694:	e18080e7          	jalr	-488(ra) # 34a8 <__mulsi3>
    5698:	416987b3          	sub	a5,s3,s6
    569c:	00f50433          	add	s0,a0,a5
    56a0:	2284a903          	lw	s2,552(s1)
    56a4:	07491863          	bne	s2,s4,5714 <_read_sectors+0x100>
    56a8:	22c4a583          	lw	a1,556(s1)
    56ac:	fff00793          	li	a5,-1
    56b0:	02f58663          	beq	a1,a5,56dc <_read_sectors+0xc8>
    56b4:	c2ca8513          	addi	a0,s5,-980
    56b8:	ffffe097          	auipc	ra,0xffffe
    56bc:	154080e7          	jalr	340(ra) # 380c <fatfs_lba_of_cluster>
    56c0:	017505b3          	add	a1,a0,s7
    56c4:	00040693          	mv	a3,s0
    56c8:	000c0613          	mv	a2,s8
    56cc:	c2ca8513          	addi	a0,s5,-980
    56d0:	ffffe097          	auipc	ra,0xffffe
    56d4:	188080e7          	jalr	392(ra) # 3858 <fatfs_sector_read>
    56d8:	00051463          	bnez	a0,56e0 <_read_sectors+0xcc>
    56dc:	00000413          	li	s0,0
    56e0:	02c12083          	lw	ra,44(sp)
    56e4:	00040513          	mv	a0,s0
    56e8:	02812403          	lw	s0,40(sp)
    56ec:	02412483          	lw	s1,36(sp)
    56f0:	02012903          	lw	s2,32(sp)
    56f4:	01c12983          	lw	s3,28(sp)
    56f8:	01812a03          	lw	s4,24(sp)
    56fc:	01412a83          	lw	s5,20(sp)
    5700:	01012b03          	lw	s6,16(sp)
    5704:	00c12b83          	lw	s7,12(sp)
    5708:	00812c03          	lw	s8,8(sp)
    570c:	03010113          	addi	sp,sp,48
    5710:	00008067          	ret
    5714:	033b6463          	bltu	s6,s3,573c <_read_sectors+0x128>
    5718:	00190793          	addi	a5,s2,1
    571c:	03479063          	bne	a5,s4,573c <_read_sectors+0x128>
    5720:	22c4a583          	lw	a1,556(s1)
    5724:	03496263          	bltu	s2,s4,5748 <_read_sectors+0x134>
    5728:	fff00793          	li	a5,-1
    572c:	faf588e3          	beq	a1,a5,56dc <_read_sectors+0xc8>
    5730:	22b4a623          	sw	a1,556(s1)
    5734:	2344a423          	sw	s4,552(s1)
    5738:	f7dff06f          	j	56b4 <_read_sectors+0xa0>
    573c:	0044a583          	lw	a1,4(s1)
    5740:	00000913          	li	s2,0
    5744:	fe1ff06f          	j	5724 <_read_sectors+0x110>
    5748:	c2ca8513          	addi	a0,s5,-980
    574c:	fffff097          	auipc	ra,0xfffff
    5750:	230080e7          	jalr	560(ra) # 497c <fatfs_find_next_cluster>
    5754:	00050593          	mv	a1,a0
    5758:	00190913          	addi	s2,s2,1
    575c:	fc9ff06f          	j	5724 <_read_sectors+0x110>

00005760 <fatfs_set_fs_info_next_free_cluster>:
    5760:	03052783          	lw	a5,48(a0)
    5764:	0a078463          	beqz	a5,580c <fatfs_set_fs_info_next_free_cluster+0xac>
    5768:	fe010113          	addi	sp,sp,-32
    576c:	01c52783          	lw	a5,28(a0)
    5770:	00912a23          	sw	s1,20(sp)
    5774:	00058493          	mv	s1,a1
    5778:	01855583          	lhu	a1,24(a0)
    577c:	00812c23          	sw	s0,24(sp)
    5780:	00112e23          	sw	ra,28(sp)
    5784:	00f585b3          	add	a1,a1,a5
    5788:	00050413          	mv	s0,a0
    578c:	ffffe097          	auipc	ra,0xffffe
    5790:	ed4080e7          	jalr	-300(ra) # 3660 <fatfs_fat_read_sector>
    5794:	00050593          	mv	a1,a0
    5798:	06050063          	beqz	a0,57f8 <fatfs_set_fs_info_next_free_cluster+0x98>
    579c:	20852783          	lw	a5,520(a0)
    57a0:	0084d713          	srli	a4,s1,0x8
    57a4:	00100613          	li	a2,1
    57a8:	1e978623          	sb	s1,492(a5)
    57ac:	20852783          	lw	a5,520(a0)
    57b0:	1ee786a3          	sb	a4,493(a5)
    57b4:	20852783          	lw	a5,520(a0)
    57b8:	0104d713          	srli	a4,s1,0x10
    57bc:	1ee78723          	sb	a4,494(a5)
    57c0:	20852783          	lw	a5,520(a0)
    57c4:	0184d713          	srli	a4,s1,0x18
    57c8:	1ee787a3          	sb	a4,495(a5)
    57cc:	03842783          	lw	a5,56(s0)
    57d0:	20c52223          	sw	a2,516(a0)
    57d4:	02942223          	sw	s1,36(s0)
    57d8:	00078a63          	beqz	a5,57ec <fatfs_set_fs_info_next_free_cluster+0x8c>
    57dc:	20052503          	lw	a0,512(a0)
    57e0:	00b12623          	sw	a1,12(sp)
    57e4:	000780e7          	jalr	a5
    57e8:	00c12583          	lw	a1,12(sp)
    57ec:	fff00793          	li	a5,-1
    57f0:	20f5a023          	sw	a5,512(a1)
    57f4:	2005a223          	sw	zero,516(a1)
    57f8:	01c12083          	lw	ra,28(sp)
    57fc:	01812403          	lw	s0,24(sp)
    5800:	01412483          	lw	s1,20(sp)
    5804:	02010113          	addi	sp,sp,32
    5808:	00008067          	ret
    580c:	00008067          	ret

00005810 <fatfs_find_blank_cluster>:
    5810:	fd010113          	addi	sp,sp,-48
    5814:	01312e23          	sw	s3,28(sp)
    5818:	100009b7          	lui	s3,0x10000
    581c:	02912223          	sw	s1,36(sp)
    5820:	03212023          	sw	s2,32(sp)
    5824:	02112623          	sw	ra,44(sp)
    5828:	02812423          	sw	s0,40(sp)
    582c:	00050913          	mv	s2,a0
    5830:	00058493          	mv	s1,a1
    5834:	fff98993          	addi	s3,s3,-1 # fffffff <__stacktop+0xffeffff>
    5838:	03092783          	lw	a5,48(s2)
    583c:	0074d413          	srli	s0,s1,0x7
    5840:	00079463          	bnez	a5,5848 <fatfs_find_blank_cluster+0x38>
    5844:	0084d413          	srli	s0,s1,0x8
    5848:	02092783          	lw	a5,32(s2)
    584c:	0cf47863          	bgeu	s0,a5,591c <fatfs_find_blank_cluster+0x10c>
    5850:	01492583          	lw	a1,20(s2)
    5854:	00090513          	mv	a0,s2
    5858:	00c12623          	sw	a2,12(sp)
    585c:	00b405b3          	add	a1,s0,a1
    5860:	ffffe097          	auipc	ra,0xffffe
    5864:	e00080e7          	jalr	-512(ra) # 3660 <fatfs_fat_read_sector>
    5868:	0a050a63          	beqz	a0,591c <fatfs_find_blank_cluster+0x10c>
    586c:	03092783          	lw	a5,48(s2)
    5870:	20852703          	lw	a4,520(a0)
    5874:	00c12603          	lw	a2,12(sp)
    5878:	04079a63          	bnez	a5,58cc <fatfs_find_blank_cluster+0xbc>
    587c:	00841413          	slli	s0,s0,0x8
    5880:	40848433          	sub	s0,s1,s0
    5884:	00141413          	slli	s0,s0,0x1
    5888:	01041413          	slli	s0,s0,0x10
    588c:	01045413          	srli	s0,s0,0x10
    5890:	00870733          	add	a4,a4,s0
    5894:	00174783          	lbu	a5,1(a4)
    5898:	00074703          	lbu	a4,0(a4)
    589c:	00879793          	slli	a5,a5,0x8
    58a0:	00e787b3          	add	a5,a5,a4
    58a4:	06079863          	bnez	a5,5914 <fatfs_find_blank_cluster+0x104>
    58a8:	00962023          	sw	s1,0(a2)
    58ac:	00100513          	li	a0,1
    58b0:	02c12083          	lw	ra,44(sp)
    58b4:	02812403          	lw	s0,40(sp)
    58b8:	02412483          	lw	s1,36(sp)
    58bc:	02012903          	lw	s2,32(sp)
    58c0:	01c12983          	lw	s3,28(sp)
    58c4:	03010113          	addi	sp,sp,48
    58c8:	00008067          	ret
    58cc:	00741413          	slli	s0,s0,0x7
    58d0:	40848433          	sub	s0,s1,s0
    58d4:	00241413          	slli	s0,s0,0x2
    58d8:	01041413          	slli	s0,s0,0x10
    58dc:	01045413          	srli	s0,s0,0x10
    58e0:	00870733          	add	a4,a4,s0
    58e4:	00374783          	lbu	a5,3(a4)
    58e8:	00274683          	lbu	a3,2(a4)
    58ec:	01879793          	slli	a5,a5,0x18
    58f0:	01069693          	slli	a3,a3,0x10
    58f4:	00d787b3          	add	a5,a5,a3
    58f8:	00074683          	lbu	a3,0(a4)
    58fc:	00174703          	lbu	a4,1(a4)
    5900:	00d787b3          	add	a5,a5,a3
    5904:	00871713          	slli	a4,a4,0x8
    5908:	00e787b3          	add	a5,a5,a4
    590c:	0137f7b3          	and	a5,a5,s3
    5910:	f95ff06f          	j	58a4 <fatfs_find_blank_cluster+0x94>
    5914:	00148493          	addi	s1,s1,1
    5918:	f21ff06f          	j	5838 <fatfs_find_blank_cluster+0x28>
    591c:	00000513          	li	a0,0
    5920:	f91ff06f          	j	58b0 <fatfs_find_blank_cluster+0xa0>

00005924 <fatfs_fat_set_cluster>:
    5924:	03052783          	lw	a5,48(a0)
    5928:	fe010113          	addi	sp,sp,-32
    592c:	00812c23          	sw	s0,24(sp)
    5930:	00912a23          	sw	s1,20(sp)
    5934:	01212823          	sw	s2,16(sp)
    5938:	00112e23          	sw	ra,28(sp)
    593c:	00050913          	mv	s2,a0
    5940:	00058413          	mv	s0,a1
    5944:	0085d493          	srli	s1,a1,0x8
    5948:	00078463          	beqz	a5,5950 <fatfs_fat_set_cluster+0x2c>
    594c:	0075d493          	srli	s1,a1,0x7
    5950:	01492583          	lw	a1,20(s2)
    5954:	00090513          	mv	a0,s2
    5958:	00c12623          	sw	a2,12(sp)
    595c:	00b485b3          	add	a1,s1,a1
    5960:	ffffe097          	auipc	ra,0xffffe
    5964:	d00080e7          	jalr	-768(ra) # 3660 <fatfs_fat_read_sector>
    5968:	00050793          	mv	a5,a0
    596c:	00000513          	li	a0,0
    5970:	04078663          	beqz	a5,59bc <fatfs_fat_set_cluster+0x98>
    5974:	03092683          	lw	a3,48(s2)
    5978:	2087a703          	lw	a4,520(a5)
    597c:	00c12603          	lw	a2,12(sp)
    5980:	04069a63          	bnez	a3,59d4 <fatfs_fat_set_cluster+0xb0>
    5984:	00849493          	slli	s1,s1,0x8
    5988:	40940433          	sub	s0,s0,s1
    598c:	00141413          	slli	s0,s0,0x1
    5990:	01041413          	slli	s0,s0,0x10
    5994:	01045413          	srli	s0,s0,0x10
    5998:	00870733          	add	a4,a4,s0
    599c:	00c70023          	sb	a2,0(a4)
    59a0:	2087a703          	lw	a4,520(a5)
    59a4:	00865613          	srli	a2,a2,0x8
    59a8:	00870733          	add	a4,a4,s0
    59ac:	00c700a3          	sb	a2,1(a4)
    59b0:	00100713          	li	a4,1
    59b4:	20e7a223          	sw	a4,516(a5)
    59b8:	00100513          	li	a0,1
    59bc:	01c12083          	lw	ra,28(sp)
    59c0:	01812403          	lw	s0,24(sp)
    59c4:	01412483          	lw	s1,20(sp)
    59c8:	01012903          	lw	s2,16(sp)
    59cc:	02010113          	addi	sp,sp,32
    59d0:	00008067          	ret
    59d4:	00749493          	slli	s1,s1,0x7
    59d8:	40940433          	sub	s0,s0,s1
    59dc:	00241413          	slli	s0,s0,0x2
    59e0:	01041413          	slli	s0,s0,0x10
    59e4:	01045413          	srli	s0,s0,0x10
    59e8:	00870733          	add	a4,a4,s0
    59ec:	00c70023          	sb	a2,0(a4)
    59f0:	2087a703          	lw	a4,520(a5)
    59f4:	00865693          	srli	a3,a2,0x8
    59f8:	00870733          	add	a4,a4,s0
    59fc:	00d700a3          	sb	a3,1(a4)
    5a00:	2087a703          	lw	a4,520(a5)
    5a04:	01065693          	srli	a3,a2,0x10
    5a08:	01865613          	srli	a2,a2,0x18
    5a0c:	00870733          	add	a4,a4,s0
    5a10:	00d70123          	sb	a3,2(a4)
    5a14:	2087a703          	lw	a4,520(a5)
    5a18:	00870733          	add	a4,a4,s0
    5a1c:	00c701a3          	sb	a2,3(a4)
    5a20:	f91ff06f          	j	59b0 <fatfs_fat_set_cluster+0x8c>

00005a24 <fatfs_free_cluster_chain>:
    5a24:	fe010113          	addi	sp,sp,-32
    5a28:	00812c23          	sw	s0,24(sp)
    5a2c:	00912a23          	sw	s1,20(sp)
    5a30:	00112e23          	sw	ra,28(sp)
    5a34:	01212823          	sw	s2,16(sp)
    5a38:	00050493          	mv	s1,a0
    5a3c:	ffd00413          	li	s0,-3
    5a40:	fff58793          	addi	a5,a1,-1
    5a44:	02f47063          	bgeu	s0,a5,5a64 <fatfs_free_cluster_chain+0x40>
    5a48:	01c12083          	lw	ra,28(sp)
    5a4c:	01812403          	lw	s0,24(sp)
    5a50:	01412483          	lw	s1,20(sp)
    5a54:	01012903          	lw	s2,16(sp)
    5a58:	00100513          	li	a0,1
    5a5c:	02010113          	addi	sp,sp,32
    5a60:	00008067          	ret
    5a64:	00048513          	mv	a0,s1
    5a68:	00b12623          	sw	a1,12(sp)
    5a6c:	fffff097          	auipc	ra,0xfffff
    5a70:	f10080e7          	jalr	-240(ra) # 497c <fatfs_find_next_cluster>
    5a74:	00c12583          	lw	a1,12(sp)
    5a78:	00050913          	mv	s2,a0
    5a7c:	00000613          	li	a2,0
    5a80:	00048513          	mv	a0,s1
    5a84:	00000097          	auipc	ra,0x0
    5a88:	ea0080e7          	jalr	-352(ra) # 5924 <fatfs_fat_set_cluster>
    5a8c:	00090593          	mv	a1,s2
    5a90:	fb1ff06f          	j	5a40 <fatfs_free_cluster_chain+0x1c>

00005a94 <fatfs_fat_add_cluster_to_chain>:
    5a94:	fd010113          	addi	sp,sp,-48
    5a98:	02912223          	sw	s1,36(sp)
    5a9c:	02112623          	sw	ra,44(sp)
    5aa0:	02812423          	sw	s0,40(sp)
    5aa4:	03212023          	sw	s2,32(sp)
    5aa8:	01312e23          	sw	s3,28(sp)
    5aac:	fff00493          	li	s1,-1
    5ab0:	02959263          	bne	a1,s1,5ad4 <fatfs_fat_add_cluster_to_chain+0x40>
    5ab4:	00000513          	li	a0,0
    5ab8:	02c12083          	lw	ra,44(sp)
    5abc:	02812403          	lw	s0,40(sp)
    5ac0:	02412483          	lw	s1,36(sp)
    5ac4:	02012903          	lw	s2,32(sp)
    5ac8:	01c12983          	lw	s3,28(sp)
    5acc:	03010113          	addi	sp,sp,48
    5ad0:	00008067          	ret
    5ad4:	00050913          	mv	s2,a0
    5ad8:	00058413          	mv	s0,a1
    5adc:	00060993          	mv	s3,a2
    5ae0:	00040593          	mv	a1,s0
    5ae4:	00090513          	mv	a0,s2
    5ae8:	00812623          	sw	s0,12(sp)
    5aec:	fffff097          	auipc	ra,0xfffff
    5af0:	e90080e7          	jalr	-368(ra) # 497c <fatfs_find_next_cluster>
    5af4:	00050413          	mv	s0,a0
    5af8:	fa050ee3          	beqz	a0,5ab4 <fatfs_fat_add_cluster_to_chain+0x20>
    5afc:	00c12583          	lw	a1,12(sp)
    5b00:	fe9510e3          	bne	a0,s1,5ae0 <fatfs_fat_add_cluster_to_chain+0x4c>
    5b04:	00098613          	mv	a2,s3
    5b08:	00090513          	mv	a0,s2
    5b0c:	00000097          	auipc	ra,0x0
    5b10:	e18080e7          	jalr	-488(ra) # 5924 <fatfs_fat_set_cluster>
    5b14:	00040613          	mv	a2,s0
    5b18:	00098593          	mv	a1,s3
    5b1c:	00090513          	mv	a0,s2
    5b20:	00000097          	auipc	ra,0x0
    5b24:	e04080e7          	jalr	-508(ra) # 5924 <fatfs_fat_set_cluster>
    5b28:	00100513          	li	a0,1
    5b2c:	f8dff06f          	j	5ab8 <fatfs_fat_add_cluster_to_chain+0x24>

00005b30 <fatfs_add_free_space>:
    5b30:	02452783          	lw	a5,36(a0)
    5b34:	fd010113          	addi	sp,sp,-48
    5b38:	02812423          	sw	s0,40(sp)
    5b3c:	01312e23          	sw	s3,28(sp)
    5b40:	01412c23          	sw	s4,24(sp)
    5b44:	0005a983          	lw	s3,0(a1)
    5b48:	01512a23          	sw	s5,20(sp)
    5b4c:	00058a13          	mv	s4,a1
    5b50:	02112623          	sw	ra,44(sp)
    5b54:	02912223          	sw	s1,36(sp)
    5b58:	03212023          	sw	s2,32(sp)
    5b5c:	fff00593          	li	a1,-1
    5b60:	00050413          	mv	s0,a0
    5b64:	00060a93          	mv	s5,a2
    5b68:	00b78663          	beq	a5,a1,5b74 <fatfs_add_free_space+0x44>
    5b6c:	00000097          	auipc	ra,0x0
    5b70:	bf4080e7          	jalr	-1036(ra) # 5760 <fatfs_set_fs_info_next_free_cluster>
    5b74:	00000493          	li	s1,0
    5b78:	03549663          	bne	s1,s5,5ba4 <fatfs_add_free_space+0x74>
    5b7c:	00100513          	li	a0,1
    5b80:	02c12083          	lw	ra,44(sp)
    5b84:	02812403          	lw	s0,40(sp)
    5b88:	02412483          	lw	s1,36(sp)
    5b8c:	02012903          	lw	s2,32(sp)
    5b90:	01c12983          	lw	s3,28(sp)
    5b94:	01812a03          	lw	s4,24(sp)
    5b98:	01412a83          	lw	s5,20(sp)
    5b9c:	03010113          	addi	sp,sp,48
    5ba0:	00008067          	ret
    5ba4:	00842583          	lw	a1,8(s0)
    5ba8:	00c10613          	addi	a2,sp,12
    5bac:	00040513          	mv	a0,s0
    5bb0:	00000097          	auipc	ra,0x0
    5bb4:	c60080e7          	jalr	-928(ra) # 5810 <fatfs_find_blank_cluster>
    5bb8:	fc0504e3          	beqz	a0,5b80 <fatfs_add_free_space+0x50>
    5bbc:	00c12903          	lw	s2,12(sp)
    5bc0:	00098593          	mv	a1,s3
    5bc4:	00040513          	mv	a0,s0
    5bc8:	00090613          	mv	a2,s2
    5bcc:	00000097          	auipc	ra,0x0
    5bd0:	d58080e7          	jalr	-680(ra) # 5924 <fatfs_fat_set_cluster>
    5bd4:	fff00613          	li	a2,-1
    5bd8:	00090593          	mv	a1,s2
    5bdc:	00040513          	mv	a0,s0
    5be0:	00000097          	auipc	ra,0x0
    5be4:	d44080e7          	jalr	-700(ra) # 5924 <fatfs_fat_set_cluster>
    5be8:	00049463          	bnez	s1,5bf0 <fatfs_add_free_space+0xc0>
    5bec:	012a2023          	sw	s2,0(s4)
    5bf0:	00148493          	addi	s1,s1,1
    5bf4:	00090993          	mv	s3,s2
    5bf8:	f81ff06f          	j	5b78 <fatfs_add_free_space+0x48>

00005bfc <_write_sectors>:
    5bfc:	fb010113          	addi	sp,sp,-80
    5c00:	03512a23          	sw	s5,52(sp)
    5c04:	00009ab7          	lui	s5,0x9
    5c08:	04112623          	sw	ra,76(sp)
    5c0c:	04812423          	sw	s0,72(sp)
    5c10:	04912223          	sw	s1,68(sp)
    5c14:	03412c23          	sw	s4,56(sp)
    5c18:	03612823          	sw	s6,48(sp)
    5c1c:	03712623          	sw	s7,44(sp)
    5c20:	03812423          	sw	s8,40(sp)
    5c24:	03912223          	sw	s9,36(sp)
    5c28:	03a12023          	sw	s10,32(sp)
    5c2c:	05212023          	sw	s2,64(sp)
    5c30:	03312e23          	sw	s3,60(sp)
    5c34:	c2ca8b93          	addi	s7,s5,-980 # 8c2c <_fs>
    5c38:	000bc983          	lbu	s3,0(s7)
    5c3c:	00058b13          	mv	s6,a1
    5c40:	fff00793          	li	a5,-1
    5c44:	00098593          	mv	a1,s3
    5c48:	00050493          	mv	s1,a0
    5c4c:	000b0513          	mv	a0,s6
    5c50:	00068c13          	mv	s8,a3
    5c54:	00f12e23          	sw	a5,28(sp)
    5c58:	00060d13          	mv	s10,a2
    5c5c:	ffffd097          	auipc	ra,0xffffd
    5c60:	0d8080e7          	jalr	216(ra) # 2d34 <__udivsi3>
    5c64:	00050a13          	mv	s4,a0
    5c68:	00098593          	mv	a1,s3
    5c6c:	000b0513          	mv	a0,s6
    5c70:	ffffd097          	auipc	ra,0xffffd
    5c74:	10c080e7          	jalr	268(ra) # 2d7c <__umodsi3>
    5c78:	00ac07b3          	add	a5,s8,a0
    5c7c:	00050c93          	mv	s9,a0
    5c80:	000c0413          	mv	s0,s8
    5c84:	00f9fe63          	bgeu	s3,a5,5ca0 <_write_sectors+0xa4>
    5c88:	000a0593          	mv	a1,s4
    5c8c:	00098513          	mv	a0,s3
    5c90:	ffffe097          	auipc	ra,0xffffe
    5c94:	818080e7          	jalr	-2024(ra) # 34a8 <__mulsi3>
    5c98:	416987b3          	sub	a5,s3,s6
    5c9c:	00f50433          	add	s0,a0,a5
    5ca0:	2284a903          	lw	s2,552(s1)
    5ca4:	03491a63          	bne	s2,s4,5cd8 <_write_sectors+0xdc>
    5ca8:	22c4a583          	lw	a1,556(s1)
    5cac:	c2ca8513          	addi	a0,s5,-980
    5cb0:	ffffe097          	auipc	ra,0xffffe
    5cb4:	b5c080e7          	jalr	-1188(ra) # 380c <fatfs_lba_of_cluster>
    5cb8:	019505b3          	add	a1,a0,s9
    5cbc:	00040693          	mv	a3,s0
    5cc0:	000d0613          	mv	a2,s10
    5cc4:	c2ca8513          	addi	a0,s5,-980
    5cc8:	ffffe097          	auipc	ra,0xffffe
    5ccc:	ba8080e7          	jalr	-1112(ra) # 3870 <fatfs_sector_write>
    5cd0:	04050a63          	beqz	a0,5d24 <_write_sectors+0x128>
    5cd4:	0540006f          	j	5d28 <_write_sectors+0x12c>
    5cd8:	093b6663          	bltu	s6,s3,5d64 <_write_sectors+0x168>
    5cdc:	00190793          	addi	a5,s2,1
    5ce0:	09479263          	bne	a5,s4,5d64 <_write_sectors+0x168>
    5ce4:	22c4a583          	lw	a1,556(s1)
    5ce8:	fff00b13          	li	s6,-1
    5cec:	09496263          	bltu	s2,s4,5d70 <_write_sectors+0x174>
    5cf0:	fff00793          	li	a5,-1
    5cf4:	0af59463          	bne	a1,a5,5d9c <_write_sectors+0x1a0>
    5cf8:	000bc583          	lbu	a1,0(s7)
    5cfc:	fff58513          	addi	a0,a1,-1
    5d00:	01850533          	add	a0,a0,s8
    5d04:	ffffd097          	auipc	ra,0xffffd
    5d08:	030080e7          	jalr	48(ra) # 2d34 <__udivsi3>
    5d0c:	00050613          	mv	a2,a0
    5d10:	01c10593          	addi	a1,sp,28
    5d14:	000b8513          	mv	a0,s7
    5d18:	00000097          	auipc	ra,0x0
    5d1c:	e18080e7          	jalr	-488(ra) # 5b30 <fatfs_add_free_space>
    5d20:	06051c63          	bnez	a0,5d98 <_write_sectors+0x19c>
    5d24:	00000413          	li	s0,0
    5d28:	04c12083          	lw	ra,76(sp)
    5d2c:	00040513          	mv	a0,s0
    5d30:	04812403          	lw	s0,72(sp)
    5d34:	04412483          	lw	s1,68(sp)
    5d38:	04012903          	lw	s2,64(sp)
    5d3c:	03c12983          	lw	s3,60(sp)
    5d40:	03812a03          	lw	s4,56(sp)
    5d44:	03412a83          	lw	s5,52(sp)
    5d48:	03012b03          	lw	s6,48(sp)
    5d4c:	02c12b83          	lw	s7,44(sp)
    5d50:	02812c03          	lw	s8,40(sp)
    5d54:	02412c83          	lw	s9,36(sp)
    5d58:	02012d03          	lw	s10,32(sp)
    5d5c:	05010113          	addi	sp,sp,80
    5d60:	00008067          	ret
    5d64:	0044a583          	lw	a1,4(s1)
    5d68:	00000913          	li	s2,0
    5d6c:	f7dff06f          	j	5ce8 <_write_sectors+0xec>
    5d70:	c2ca8513          	addi	a0,s5,-980
    5d74:	00b12623          	sw	a1,12(sp)
    5d78:	fffff097          	auipc	ra,0xfffff
    5d7c:	c04080e7          	jalr	-1020(ra) # 497c <fatfs_find_next_cluster>
    5d80:	00c12583          	lw	a1,12(sp)
    5d84:	00b12e23          	sw	a1,28(sp)
    5d88:	f76508e3          	beq	a0,s6,5cf8 <_write_sectors+0xfc>
    5d8c:	00190913          	addi	s2,s2,1
    5d90:	00050593          	mv	a1,a0
    5d94:	f59ff06f          	j	5cec <_write_sectors+0xf0>
    5d98:	01c12583          	lw	a1,28(sp)
    5d9c:	22b4a623          	sw	a1,556(s1)
    5da0:	2344a423          	sw	s4,552(s1)
    5da4:	f09ff06f          	j	5cac <_write_sectors+0xb0>

00005da8 <fl_fflush>:
    5da8:	000077b7          	lui	a5,0x7
    5dac:	00c7a783          	lw	a5,12(a5) # 700c <_filelib_init>
    5db0:	ff010113          	addi	sp,sp,-16
    5db4:	00812423          	sw	s0,8(sp)
    5db8:	00112623          	sw	ra,12(sp)
    5dbc:	00912223          	sw	s1,4(sp)
    5dc0:	00050413          	mv	s0,a0
    5dc4:	00079663          	bnez	a5,5dd0 <fl_fflush+0x28>
    5dc8:	ffffe097          	auipc	ra,0xffffe
    5dcc:	b74080e7          	jalr	-1164(ra) # 393c <fl_init>
    5dd0:	04040663          	beqz	s0,5e1c <fl_fflush+0x74>
    5dd4:	000094b7          	lui	s1,0x9
    5dd8:	c2c48493          	addi	s1,s1,-980 # 8c2c <_fs>
    5ddc:	03c4a783          	lw	a5,60(s1)
    5de0:	00078463          	beqz	a5,5de8 <fl_fflush+0x40>
    5de4:	000780e7          	jalr	a5
    5de8:	43442783          	lw	a5,1076(s0)
    5dec:	02078263          	beqz	a5,5e10 <fl_fflush+0x68>
    5df0:	43042583          	lw	a1,1072(s0)
    5df4:	00100693          	li	a3,1
    5df8:	23040613          	addi	a2,s0,560
    5dfc:	00040513          	mv	a0,s0
    5e00:	00000097          	auipc	ra,0x0
    5e04:	dfc080e7          	jalr	-516(ra) # 5bfc <_write_sectors>
    5e08:	00050463          	beqz	a0,5e10 <fl_fflush+0x68>
    5e0c:	42042a23          	sw	zero,1076(s0)
    5e10:	0404a783          	lw	a5,64(s1)
    5e14:	00078463          	beqz	a5,5e1c <fl_fflush+0x74>
    5e18:	000780e7          	jalr	a5
    5e1c:	00c12083          	lw	ra,12(sp)
    5e20:	00812403          	lw	s0,8(sp)
    5e24:	00412483          	lw	s1,4(sp)
    5e28:	00000513          	li	a0,0
    5e2c:	01010113          	addi	sp,sp,16
    5e30:	00008067          	ret

00005e34 <fl_fclose>:
    5e34:	000077b7          	lui	a5,0x7
    5e38:	00c7a783          	lw	a5,12(a5) # 700c <_filelib_init>
    5e3c:	ff010113          	addi	sp,sp,-16
    5e40:	00812423          	sw	s0,8(sp)
    5e44:	00112623          	sw	ra,12(sp)
    5e48:	00912223          	sw	s1,4(sp)
    5e4c:	01212023          	sw	s2,0(sp)
    5e50:	00050413          	mv	s0,a0
    5e54:	00079663          	bnez	a5,5e60 <fl_fclose+0x2c>
    5e58:	ffffe097          	auipc	ra,0xffffe
    5e5c:	ae4080e7          	jalr	-1308(ra) # 393c <fl_init>
    5e60:	08040c63          	beqz	s0,5ef8 <fl_fclose+0xc4>
    5e64:	000094b7          	lui	s1,0x9
    5e68:	c2c48913          	addi	s2,s1,-980 # 8c2c <_fs>
    5e6c:	03c92783          	lw	a5,60(s2)
    5e70:	00078463          	beqz	a5,5e78 <fl_fclose+0x44>
    5e74:	000780e7          	jalr	a5
    5e78:	00040513          	mv	a0,s0
    5e7c:	00000097          	auipc	ra,0x0
    5e80:	f2c080e7          	jalr	-212(ra) # 5da8 <fl_fflush>
    5e84:	01042783          	lw	a5,16(s0)
    5e88:	00078e63          	beqz	a5,5ea4 <fl_fclose+0x70>
    5e8c:	00c42683          	lw	a3,12(s0)
    5e90:	00042583          	lw	a1,0(s0)
    5e94:	21c40613          	addi	a2,s0,540
    5e98:	c2c48513          	addi	a0,s1,-980
    5e9c:	fffff097          	auipc	ra,0xfffff
    5ea0:	338080e7          	jalr	824(ra) # 51d4 <fatfs_update_file_length>
    5ea4:	fff00793          	li	a5,-1
    5ea8:	42f42823          	sw	a5,1072(s0)
    5eac:	00040513          	mv	a0,s0
    5eb0:	00042423          	sw	zero,8(s0)
    5eb4:	00042623          	sw	zero,12(s0)
    5eb8:	00042223          	sw	zero,4(s0)
    5ebc:	42042a23          	sw	zero,1076(s0)
    5ec0:	00042823          	sw	zero,16(s0)
    5ec4:	ffffe097          	auipc	ra,0xffffe
    5ec8:	900080e7          	jalr	-1792(ra) # 37c4 <_free_file>
    5ecc:	c2c48513          	addi	a0,s1,-980
    5ed0:	fffff097          	auipc	ra,0xfffff
    5ed4:	a54080e7          	jalr	-1452(ra) # 4924 <fatfs_fat_purge>
    5ed8:	04092783          	lw	a5,64(s2)
    5edc:	00078e63          	beqz	a5,5ef8 <fl_fclose+0xc4>
    5ee0:	00812403          	lw	s0,8(sp)
    5ee4:	00c12083          	lw	ra,12(sp)
    5ee8:	00412483          	lw	s1,4(sp)
    5eec:	00012903          	lw	s2,0(sp)
    5ef0:	01010113          	addi	sp,sp,16
    5ef4:	00078067          	jr	a5
    5ef8:	00c12083          	lw	ra,12(sp)
    5efc:	00812403          	lw	s0,8(sp)
    5f00:	00412483          	lw	s1,4(sp)
    5f04:	00012903          	lw	s2,0(sp)
    5f08:	01010113          	addi	sp,sp,16
    5f0c:	00008067          	ret

00005f10 <fl_fread>:
    5f10:	000077b7          	lui	a5,0x7
    5f14:	00c7a783          	lw	a5,12(a5) # 700c <_filelib_init>
    5f18:	fc010113          	addi	sp,sp,-64
    5f1c:	02812c23          	sw	s0,56(sp)
    5f20:	03512223          	sw	s5,36(sp)
    5f24:	02112e23          	sw	ra,60(sp)
    5f28:	02912a23          	sw	s1,52(sp)
    5f2c:	03212823          	sw	s2,48(sp)
    5f30:	03312623          	sw	s3,44(sp)
    5f34:	03412423          	sw	s4,40(sp)
    5f38:	03612023          	sw	s6,32(sp)
    5f3c:	01712e23          	sw	s7,28(sp)
    5f40:	01812c23          	sw	s8,24(sp)
    5f44:	01912a23          	sw	s9,20(sp)
    5f48:	00050a93          	mv	s5,a0
    5f4c:	00068413          	mv	s0,a3
    5f50:	00058513          	mv	a0,a1
    5f54:	00079e63          	bnez	a5,5f70 <fl_fread+0x60>
    5f58:	00c12623          	sw	a2,12(sp)
    5f5c:	00b12423          	sw	a1,8(sp)
    5f60:	ffffe097          	auipc	ra,0xffffe
    5f64:	9dc080e7          	jalr	-1572(ra) # 393c <fl_init>
    5f68:	00c12603          	lw	a2,12(sp)
    5f6c:	00812503          	lw	a0,8(sp)
    5f70:	14040e63          	beqz	s0,60cc <fl_fread+0x1bc>
    5f74:	140a8c63          	beqz	s5,60cc <fl_fread+0x1bc>
    5f78:	43844783          	lbu	a5,1080(s0)
    5f7c:	fff00493          	li	s1,-1
    5f80:	0017f793          	andi	a5,a5,1
    5f84:	04078863          	beqz	a5,5fd4 <fl_fread+0xc4>
    5f88:	00060593          	mv	a1,a2
    5f8c:	ffffd097          	auipc	ra,0xffffd
    5f90:	51c080e7          	jalr	1308(ra) # 34a8 <__mulsi3>
    5f94:	00050493          	mv	s1,a0
    5f98:	02050e63          	beqz	a0,5fd4 <fl_fread+0xc4>
    5f9c:	00842583          	lw	a1,8(s0)
    5fa0:	00c42783          	lw	a5,12(s0)
    5fa4:	12f5f463          	bgeu	a1,a5,60cc <fl_fread+0x1bc>
    5fa8:	00b50733          	add	a4,a0,a1
    5fac:	00e7f463          	bgeu	a5,a4,5fb4 <fl_fread+0xa4>
    5fb0:	40b784b3          	sub	s1,a5,a1
    5fb4:	0095da13          	srli	s4,a1,0x9
    5fb8:	1ff5f913          	andi	s2,a1,511
    5fbc:	00000993          	li	s3,0
    5fc0:	23040b13          	addi	s6,s0,560
    5fc4:	20000b93          	li	s7,512
    5fc8:	1ff00c13          	li	s8,511
    5fcc:	0499c063          	blt	s3,s1,600c <fl_fread+0xfc>
    5fd0:	00098493          	mv	s1,s3
    5fd4:	03c12083          	lw	ra,60(sp)
    5fd8:	03812403          	lw	s0,56(sp)
    5fdc:	03012903          	lw	s2,48(sp)
    5fe0:	02c12983          	lw	s3,44(sp)
    5fe4:	02812a03          	lw	s4,40(sp)
    5fe8:	02412a83          	lw	s5,36(sp)
    5fec:	02012b03          	lw	s6,32(sp)
    5ff0:	01c12b83          	lw	s7,28(sp)
    5ff4:	01812c03          	lw	s8,24(sp)
    5ff8:	01412c83          	lw	s9,20(sp)
    5ffc:	00048513          	mv	a0,s1
    6000:	03412483          	lw	s1,52(sp)
    6004:	04010113          	addi	sp,sp,64
    6008:	00008067          	ret
    600c:	04091663          	bnez	s2,6058 <fl_fread+0x148>
    6010:	413486b3          	sub	a3,s1,s3
    6014:	04dc5263          	bge	s8,a3,6058 <fl_fread+0x148>
    6018:	4096d693          	srai	a3,a3,0x9
    601c:	013a8633          	add	a2,s5,s3
    6020:	000a0593          	mv	a1,s4
    6024:	00040513          	mv	a0,s0
    6028:	fffff097          	auipc	ra,0xfffff
    602c:	5ec080e7          	jalr	1516(ra) # 5614 <_read_sectors>
    6030:	fa0500e3          	beqz	a0,5fd0 <fl_fread+0xc0>
    6034:	00951c93          	slli	s9,a0,0x9
    6038:	000c8613          	mv	a2,s9
    603c:	00aa0a33          	add	s4,s4,a0
    6040:	00842783          	lw	a5,8(s0)
    6044:	00c989b3          	add	s3,s3,a2
    6048:	00000913          	li	s2,0
    604c:	019787b3          	add	a5,a5,s9
    6050:	00f42423          	sw	a5,8(s0)
    6054:	f79ff06f          	j	5fcc <fl_fread+0xbc>
    6058:	43042783          	lw	a5,1072(s0)
    605c:	03478e63          	beq	a5,s4,6098 <fl_fread+0x188>
    6060:	43442783          	lw	a5,1076(s0)
    6064:	00078863          	beqz	a5,6074 <fl_fread+0x164>
    6068:	00040513          	mv	a0,s0
    606c:	00000097          	auipc	ra,0x0
    6070:	d3c080e7          	jalr	-708(ra) # 5da8 <fl_fflush>
    6074:	00100693          	li	a3,1
    6078:	000b0613          	mv	a2,s6
    607c:	000a0593          	mv	a1,s4
    6080:	00040513          	mv	a0,s0
    6084:	fffff097          	auipc	ra,0xfffff
    6088:	590080e7          	jalr	1424(ra) # 5614 <_read_sectors>
    608c:	f40502e3          	beqz	a0,5fd0 <fl_fread+0xc0>
    6090:	43442823          	sw	s4,1072(s0)
    6094:	42042a23          	sw	zero,1076(s0)
    6098:	412b87b3          	sub	a5,s7,s2
    609c:	41348633          	sub	a2,s1,s3
    60a0:	00c7d463          	bge	a5,a2,60a8 <fl_fread+0x198>
    60a4:	00078613          	mv	a2,a5
    60a8:	012b05b3          	add	a1,s6,s2
    60ac:	013a8533          	add	a0,s5,s3
    60b0:	00060c93          	mv	s9,a2
    60b4:	00c12423          	sw	a2,8(sp)
    60b8:	ffffd097          	auipc	ra,0xffffd
    60bc:	d44080e7          	jalr	-700(ra) # 2dfc <memcpy>
    60c0:	00812603          	lw	a2,8(sp)
    60c4:	001a0a13          	addi	s4,s4,1
    60c8:	f79ff06f          	j	6040 <fl_fread+0x130>
    60cc:	fff00493          	li	s1,-1
    60d0:	f05ff06f          	j	5fd4 <fl_fread+0xc4>

000060d4 <fatfs_allocate_free_space>:
    60d4:	fd010113          	addi	sp,sp,-48
    60d8:	02112623          	sw	ra,44(sp)
    60dc:	02812423          	sw	s0,40(sp)
    60e0:	02912223          	sw	s1,36(sp)
    60e4:	03212023          	sw	s2,32(sp)
    60e8:	01312e23          	sw	s3,28(sp)
    60ec:	01412c23          	sw	s4,24(sp)
    60f0:	01512a23          	sw	s5,20(sp)
    60f4:	02069863          	bnez	a3,6124 <fatfs_allocate_free_space+0x50>
    60f8:	00000413          	li	s0,0
    60fc:	02c12083          	lw	ra,44(sp)
    6100:	00040513          	mv	a0,s0
    6104:	02812403          	lw	s0,40(sp)
    6108:	02412483          	lw	s1,36(sp)
    610c:	02012903          	lw	s2,32(sp)
    6110:	01c12983          	lw	s3,28(sp)
    6114:	01812a03          	lw	s4,24(sp)
    6118:	01412a83          	lw	s5,20(sp)
    611c:	03010113          	addi	sp,sp,48
    6120:	00008067          	ret
    6124:	02452783          	lw	a5,36(a0)
    6128:	00058a13          	mv	s4,a1
    612c:	fff00593          	li	a1,-1
    6130:	00050493          	mv	s1,a0
    6134:	00068913          	mv	s2,a3
    6138:	00060993          	mv	s3,a2
    613c:	00b78663          	beq	a5,a1,6148 <fatfs_allocate_free_space+0x74>
    6140:	fffff097          	auipc	ra,0xfffff
    6144:	620080e7          	jalr	1568(ra) # 5760 <fatfs_set_fs_info_next_free_cluster>
    6148:	0004c783          	lbu	a5,0(s1)
    614c:	00090513          	mv	a0,s2
    6150:	00979a93          	slli	s5,a5,0x9
    6154:	000a8593          	mv	a1,s5
    6158:	ffffd097          	auipc	ra,0xffffd
    615c:	bdc080e7          	jalr	-1060(ra) # 2d34 <__udivsi3>
    6160:	00050413          	mv	s0,a0
    6164:	00050593          	mv	a1,a0
    6168:	000a8513          	mv	a0,s5
    616c:	ffffd097          	auipc	ra,0xffffd
    6170:	33c080e7          	jalr	828(ra) # 34a8 <__mulsi3>
    6174:	41250533          	sub	a0,a0,s2
    6178:	00a03533          	snez	a0,a0
    617c:	00a40933          	add	s2,s0,a0
    6180:	040a0463          	beqz	s4,61c8 <fatfs_allocate_free_space+0xf4>
    6184:	0084a583          	lw	a1,8(s1)
    6188:	00c10613          	addi	a2,sp,12
    618c:	00048513          	mv	a0,s1
    6190:	fffff097          	auipc	ra,0xfffff
    6194:	680080e7          	jalr	1664(ra) # 5810 <fatfs_find_blank_cluster>
    6198:	00050413          	mv	s0,a0
    619c:	f4050ee3          	beqz	a0,60f8 <fatfs_allocate_free_space+0x24>
    61a0:	00100793          	li	a5,1
    61a4:	02f91663          	bne	s2,a5,61d0 <fatfs_allocate_free_space+0xfc>
    61a8:	00c12903          	lw	s2,12(sp)
    61ac:	fff00613          	li	a2,-1
    61b0:	00048513          	mv	a0,s1
    61b4:	00090593          	mv	a1,s2
    61b8:	fffff097          	auipc	ra,0xfffff
    61bc:	76c080e7          	jalr	1900(ra) # 5924 <fatfs_fat_set_cluster>
    61c0:	0129a023          	sw	s2,0(s3)
    61c4:	f39ff06f          	j	60fc <fatfs_allocate_free_space+0x28>
    61c8:	0009a783          	lw	a5,0(s3)
    61cc:	00f12623          	sw	a5,12(sp)
    61d0:	00090613          	mv	a2,s2
    61d4:	00c10593          	addi	a1,sp,12
    61d8:	00048513          	mv	a0,s1
    61dc:	00000097          	auipc	ra,0x0
    61e0:	954080e7          	jalr	-1708(ra) # 5b30 <fatfs_add_free_space>
    61e4:	00050413          	mv	s0,a0
    61e8:	f15ff06f          	j	60fc <fatfs_allocate_free_space+0x28>

000061ec <fatfs_add_file_entry>:
    61ec:	03852883          	lw	a7,56(a0)
    61f0:	30088e63          	beqz	a7,650c <fatfs_add_file_entry+0x320>
    61f4:	f8010113          	addi	sp,sp,-128
    61f8:	06812c23          	sw	s0,120(sp)
    61fc:	00050413          	mv	s0,a0
    6200:	00060513          	mv	a0,a2
    6204:	06912a23          	sw	s1,116(sp)
    6208:	07512223          	sw	s5,100(sp)
    620c:	00f12c23          	sw	a5,24(sp)
    6210:	00e12a23          	sw	a4,20(sp)
    6214:	06112e23          	sw	ra,124(sp)
    6218:	07212823          	sw	s2,112(sp)
    621c:	07312623          	sw	s3,108(sp)
    6220:	07412423          	sw	s4,104(sp)
    6224:	07612023          	sw	s6,96(sp)
    6228:	05712e23          	sw	s7,92(sp)
    622c:	05812c23          	sw	s8,88(sp)
    6230:	05912a23          	sw	s9,84(sp)
    6234:	05a12823          	sw	s10,80(sp)
    6238:	05b12623          	sw	s11,76(sp)
    623c:	01012e23          	sw	a6,28(sp)
    6240:	00068a93          	mv	s5,a3
    6244:	00c12823          	sw	a2,16(sp)
    6248:	00b12423          	sw	a1,8(sp)
    624c:	ffffe097          	auipc	ra,0xffffe
    6250:	a48080e7          	jalr	-1464(ra) # 3c94 <fatfs_lfn_entries_required>
    6254:	00150713          	addi	a4,a0,1
    6258:	00100793          	li	a5,1
    625c:	00050493          	mv	s1,a0
    6260:	2ae7f263          	bgeu	a5,a4,6504 <fatfs_add_file_entry+0x318>
    6264:	00000a13          	li	s4,0
    6268:	00000993          	li	s3,0
    626c:	00000913          	li	s2,0
    6270:	00000c93          	li	s9,0
    6274:	00000b13          	li	s6,0
    6278:	01000c13          	li	s8,16
    627c:	00812583          	lw	a1,8(sp)
    6280:	00000693          	li	a3,0
    6284:	000b0613          	mv	a2,s6
    6288:	00040513          	mv	a0,s0
    628c:	000b0b93          	mv	s7,s6
    6290:	ffffe097          	auipc	ra,0xffffe
    6294:	7f4080e7          	jalr	2036(ra) # 4a84 <fatfs_sector_reader>
    6298:	18050463          	beqz	a0,6420 <fatfs_add_file_entry+0x234>
    629c:	001b0b13          	addi	s6,s6,1
    62a0:	04440793          	addi	a5,s0,68
    62a4:	000c8d13          	mv	s10,s9
    62a8:	00000d93          	li	s11,0
    62ac:	00078513          	mv	a0,a5
    62b0:	00f12623          	sw	a5,12(sp)
    62b4:	ffffe097          	auipc	ra,0xffffe
    62b8:	8f8080e7          	jalr	-1800(ra) # 3bac <fatfs_entry_lfn_text>
    62bc:	00c12783          	lw	a5,12(sp)
    62c0:	00050c93          	mv	s9,a0
    62c4:	02050c63          	beqz	a0,62fc <fatfs_add_file_entry+0x110>
    62c8:	020d0463          	beqz	s10,62f0 <fatfs_add_file_entry+0x104>
    62cc:	00090c93          	mv	s9,s2
    62d0:	000c8913          	mv	s2,s9
    62d4:	001d0c93          	addi	s9,s10,1
    62d8:	001d8d93          	addi	s11,s11,1
    62dc:	0ffdfd93          	zext.b	s11,s11
    62e0:	02078793          	addi	a5,a5,32
    62e4:	f98d8ce3          	beq	s11,s8,627c <fatfs_add_file_entry+0x90>
    62e8:	000c8d13          	mv	s10,s9
    62ec:	fc1ff06f          	j	62ac <fatfs_add_file_entry+0xc0>
    62f0:	000d8a13          	mv	s4,s11
    62f4:	000b8993          	mv	s3,s7
    62f8:	fd9ff06f          	j	62d0 <fatfs_add_file_entry+0xe4>
    62fc:	0007c683          	lbu	a3,0(a5)
    6300:	0e500713          	li	a4,229
    6304:	10e69863          	bne	a3,a4,6414 <fatfs_add_file_entry+0x228>
    6308:	000d1863          	bnez	s10,6318 <fatfs_add_file_entry+0x12c>
    630c:	000d8a13          	mv	s4,s11
    6310:	000b8993          	mv	s3,s7
    6314:	00100913          	li	s2,1
    6318:	fa9d4ee3          	blt	s10,s1,62d4 <fatfs_add_file_entry+0xe8>
    631c:	00ba8693          	addi	a3,s5,11
    6320:	000a8713          	mv	a4,s5
    6324:	00000913          	li	s2,0
    6328:	00074603          	lbu	a2,0(a4)
    632c:	00195793          	srli	a5,s2,0x1
    6330:	00791913          	slli	s2,s2,0x7
    6334:	012787b3          	add	a5,a5,s2
    6338:	00170713          	addi	a4,a4,1
    633c:	00c787b3          	add	a5,a5,a2
    6340:	0ff7f913          	zext.b	s2,a5
    6344:	fed712e3          	bne	a4,a3,6328 <fatfs_add_file_entry+0x13c>
    6348:	00098b13          	mv	s6,s3
    634c:	00000d13          	li	s10,0
    6350:	01000b93          	li	s7,16
    6354:	00812583          	lw	a1,8(sp)
    6358:	00000693          	li	a3,0
    635c:	000b0613          	mv	a2,s6
    6360:	00040513          	mv	a0,s0
    6364:	ffffe097          	auipc	ra,0xffffe
    6368:	720080e7          	jalr	1824(ra) # 4a84 <fatfs_sector_reader>
    636c:	18050c63          	beqz	a0,6504 <fatfs_add_file_entry+0x318>
    6370:	04440c93          	addi	s9,s0,68
    6374:	413b0db3          	sub	s11,s6,s3
    6378:	00000793          	li	a5,0
    637c:	00000c13          	li	s8,0
    6380:	01912623          	sw	s9,12(sp)
    6384:	000d1663          	bnez	s10,6390 <fatfs_add_file_entry+0x1a4>
    6388:	154c1863          	bne	s8,s4,64d8 <fatfs_add_file_entry+0x2ec>
    638c:	140d9663          	bnez	s11,64d8 <fatfs_add_file_entry+0x2ec>
    6390:	12049263          	bnez	s1,64b4 <fatfs_add_file_entry+0x2c8>
    6394:	01c12703          	lw	a4,28(sp)
    6398:	01412603          	lw	a2,20(sp)
    639c:	01812583          	lw	a1,24(sp)
    63a0:	02010693          	addi	a3,sp,32
    63a4:	000a8513          	mv	a0,s5
    63a8:	ffffe097          	auipc	ra,0xffffe
    63ac:	a30080e7          	jalr	-1488(ra) # 3dd8 <fatfs_sfn_create_entry>
    63b0:	02000613          	li	a2,32
    63b4:	00c105b3          	add	a1,sp,a2
    63b8:	000c8513          	mv	a0,s9
    63bc:	ffffd097          	auipc	ra,0xffffd
    63c0:	a40080e7          	jalr	-1472(ra) # 2dfc <memcpy>
    63c4:	03842783          	lw	a5,56(s0)
    63c8:	00c12583          	lw	a1,12(sp)
    63cc:	24442503          	lw	a0,580(s0)
    63d0:	00100613          	li	a2,1
    63d4:	000780e7          	jalr	a5
    63d8:	07c12083          	lw	ra,124(sp)
    63dc:	07812403          	lw	s0,120(sp)
    63e0:	07412483          	lw	s1,116(sp)
    63e4:	07012903          	lw	s2,112(sp)
    63e8:	06c12983          	lw	s3,108(sp)
    63ec:	06812a03          	lw	s4,104(sp)
    63f0:	06412a83          	lw	s5,100(sp)
    63f4:	06012b03          	lw	s6,96(sp)
    63f8:	05c12b83          	lw	s7,92(sp)
    63fc:	05812c03          	lw	s8,88(sp)
    6400:	05412c83          	lw	s9,84(sp)
    6404:	05012d03          	lw	s10,80(sp)
    6408:	04c12d83          	lw	s11,76(sp)
    640c:	08010113          	addi	sp,sp,128
    6410:	00008067          	ret
    6414:	ee068ae3          	beqz	a3,6308 <fatfs_add_file_entry+0x11c>
    6418:	00000913          	li	s2,0
    641c:	ebdff06f          	j	62d8 <fatfs_add_file_entry+0xec>
    6420:	00842583          	lw	a1,8(s0)
    6424:	02010613          	addi	a2,sp,32
    6428:	00040513          	mv	a0,s0
    642c:	fffff097          	auipc	ra,0xfffff
    6430:	3e4080e7          	jalr	996(ra) # 5810 <fatfs_find_blank_cluster>
    6434:	0c050863          	beqz	a0,6504 <fatfs_add_file_entry+0x318>
    6438:	02012b83          	lw	s7,32(sp)
    643c:	00812583          	lw	a1,8(sp)
    6440:	00040513          	mv	a0,s0
    6444:	000b8613          	mv	a2,s7
    6448:	fffff097          	auipc	ra,0xfffff
    644c:	64c080e7          	jalr	1612(ra) # 5a94 <fatfs_fat_add_cluster_to_chain>
    6450:	0a050a63          	beqz	a0,6504 <fatfs_add_file_entry+0x318>
    6454:	20000613          	li	a2,512
    6458:	00000593          	li	a1,0
    645c:	04440513          	addi	a0,s0,68
    6460:	ffffd097          	auipc	ra,0xffffd
    6464:	980080e7          	jalr	-1664(ra) # 2de0 <memset>
    6468:	00000c13          	li	s8,0
    646c:	00044783          	lbu	a5,0(s0)
    6470:	00fc6a63          	bltu	s8,a5,6484 <fatfs_add_file_entry+0x298>
    6474:	ea0914e3          	bnez	s2,631c <fatfs_add_file_entry+0x130>
    6478:	000b0993          	mv	s3,s6
    647c:	00000a13          	li	s4,0
    6480:	e9dff06f          	j	631c <fatfs_add_file_entry+0x130>
    6484:	00000693          	li	a3,0
    6488:	000c0613          	mv	a2,s8
    648c:	000b8593          	mv	a1,s7
    6490:	00040513          	mv	a0,s0
    6494:	ffffd097          	auipc	ra,0xffffd
    6498:	3f4080e7          	jalr	1012(ra) # 3888 <fatfs_write_sector>
    649c:	06050463          	beqz	a0,6504 <fatfs_add_file_entry+0x318>
    64a0:	001c0c13          	addi	s8,s8,1
    64a4:	0ffc7c13          	zext.b	s8,s8
    64a8:	fc5ff06f          	j	646c <fatfs_add_file_entry+0x280>
    64ac:	001b0b13          	addi	s6,s6,1
    64b0:	ea5ff06f          	j	6354 <fatfs_add_file_entry+0x168>
    64b4:	01012503          	lw	a0,16(sp)
    64b8:	fff48493          	addi	s1,s1,-1
    64bc:	00090693          	mv	a3,s2
    64c0:	00048613          	mv	a2,s1
    64c4:	000c8593          	mv	a1,s9
    64c8:	ffffd097          	auipc	ra,0xffffd
    64cc:	7fc080e7          	jalr	2044(ra) # 3cc4 <fatfs_filename_to_lfn>
    64d0:	00100d13          	li	s10,1
    64d4:	000d0793          	mv	a5,s10
    64d8:	001c0c13          	addi	s8,s8,1
    64dc:	0ffc7c13          	zext.b	s8,s8
    64e0:	020c8c93          	addi	s9,s9,32
    64e4:	eb7c10e3          	bne	s8,s7,6384 <fatfs_add_file_entry+0x198>
    64e8:	fc0782e3          	beqz	a5,64ac <fatfs_add_file_entry+0x2c0>
    64ec:	03842783          	lw	a5,56(s0)
    64f0:	00c12583          	lw	a1,12(sp)
    64f4:	24442503          	lw	a0,580(s0)
    64f8:	00100613          	li	a2,1
    64fc:	000780e7          	jalr	a5
    6500:	fa0516e3          	bnez	a0,64ac <fatfs_add_file_entry+0x2c0>
    6504:	00000513          	li	a0,0
    6508:	ed1ff06f          	j	63d8 <fatfs_add_file_entry+0x1ec>
    650c:	00000513          	li	a0,0
    6510:	00008067          	ret

00006514 <fl_fopen>:
    6514:	000077b7          	lui	a5,0x7
    6518:	00c7a783          	lw	a5,12(a5) # 700c <_filelib_init>
    651c:	fa010113          	addi	sp,sp,-96
    6520:	05212823          	sw	s2,80(sp)
    6524:	03a12823          	sw	s10,48(sp)
    6528:	04112e23          	sw	ra,92(sp)
    652c:	04812c23          	sw	s0,88(sp)
    6530:	04912a23          	sw	s1,84(sp)
    6534:	05312623          	sw	s3,76(sp)
    6538:	05412423          	sw	s4,72(sp)
    653c:	05512223          	sw	s5,68(sp)
    6540:	05612023          	sw	s6,64(sp)
    6544:	03712e23          	sw	s7,60(sp)
    6548:	03812c23          	sw	s8,56(sp)
    654c:	03912a23          	sw	s9,52(sp)
    6550:	00050d13          	mv	s10,a0
    6554:	00058913          	mv	s2,a1
    6558:	00079663          	bnez	a5,6564 <fl_fopen+0x50>
    655c:	ffffd097          	auipc	ra,0xffffd
    6560:	3e0080e7          	jalr	992(ra) # 393c <fl_init>
    6564:	000077b7          	lui	a5,0x7
    6568:	0087a783          	lw	a5,8(a5) # 7008 <_filelib_valid>
    656c:	00193713          	seqz	a4,s2
    6570:	0017b793          	seqz	a5,a5
    6574:	00e7e7b3          	or	a5,a5,a4
    6578:	36079e63          	bnez	a5,68f4 <fl_fopen+0x3e0>
    657c:	360d0c63          	beqz	s10,68f4 <fl_fopen+0x3e0>
    6580:	00000493          	li	s1,0
    6584:	00000413          	li	s0,0
    6588:	05700993          	li	s3,87
    658c:	07200a13          	li	s4,114
    6590:	07700b13          	li	s6,119
    6594:	06100b93          	li	s7,97
    6598:	06200c13          	li	s8,98
    659c:	04100a93          	li	s5,65
    65a0:	04200c93          	li	s9,66
    65a4:	00090513          	mv	a0,s2
    65a8:	ffffd097          	auipc	ra,0xffffd
    65ac:	878080e7          	jalr	-1928(ra) # 2e20 <strlen>
    65b0:	10a44a63          	blt	s0,a0,66c4 <fl_fopen+0x1b0>
    65b4:	000099b7          	lui	s3,0x9
    65b8:	c2c98a13          	addi	s4,s3,-980 # 8c2c <_fs>
    65bc:	038a2783          	lw	a5,56(s4)
    65c0:	00079463          	bnez	a5,65c8 <fl_fopen+0xb4>
    65c4:	fd94f493          	andi	s1,s1,-39
    65c8:	03ca2783          	lw	a5,60(s4)
    65cc:	00078463          	beqz	a5,65d4 <fl_fopen+0xc0>
    65d0:	000780e7          	jalr	a5
    65d4:	0014f793          	andi	a5,s1,1
    65d8:	18079263          	bnez	a5,675c <fl_fopen+0x248>
    65dc:	0204f793          	andi	a5,s1,32
    65e0:	08078c63          	beqz	a5,6678 <fl_fopen+0x164>
    65e4:	038a2783          	lw	a5,56(s4)
    65e8:	06078a63          	beqz	a5,665c <fl_fopen+0x148>
    65ec:	ffffd097          	auipc	ra,0xffffd
    65f0:	160080e7          	jalr	352(ra) # 374c <_allocate_file>
    65f4:	00050413          	mv	s0,a0
    65f8:	06050263          	beqz	a0,665c <fl_fopen+0x148>
    65fc:	01450a93          	addi	s5,a0,20
    6600:	10400613          	li	a2,260
    6604:	00000593          	li	a1,0
    6608:	000a8513          	mv	a0,s5
    660c:	ffffc097          	auipc	ra,0xffffc
    6610:	7d4080e7          	jalr	2004(ra) # 2de0 <memset>
    6614:	11840b13          	addi	s6,s0,280
    6618:	10400613          	li	a2,260
    661c:	00000593          	li	a1,0
    6620:	000b0513          	mv	a0,s6
    6624:	ffffc097          	auipc	ra,0xffffc
    6628:	7bc080e7          	jalr	1980(ra) # 2de0 <memset>
    662c:	10400713          	li	a4,260
    6630:	000b0693          	mv	a3,s6
    6634:	00070613          	mv	a2,a4
    6638:	000a8593          	mv	a1,s5
    663c:	000d0513          	mv	a0,s10
    6640:	ffffe097          	auipc	ra,0xffffe
    6644:	c88080e7          	jalr	-888(ra) # 42c8 <fatfs_split_path>
    6648:	fff00793          	li	a5,-1
    664c:	12f51663          	bne	a0,a5,6778 <fl_fopen+0x264>
    6650:	00040513          	mv	a0,s0
    6654:	ffffd097          	auipc	ra,0xffffd
    6658:	170080e7          	jalr	368(ra) # 37c4 <_free_file>
    665c:	00000413          	li	s0,0
    6660:	0214f793          	andi	a5,s1,33
    6664:	02000713          	li	a4,32
    6668:	28e79263          	bne	a5,a4,68ec <fl_fopen+0x3d8>
    666c:	10041263          	bnez	s0,6770 <fl_fopen+0x25c>
    6670:	0064f793          	andi	a5,s1,6
    6674:	26079463          	bnez	a5,68dc <fl_fopen+0x3c8>
    6678:	00000413          	li	s0,0
    667c:	040a2783          	lw	a5,64(s4)
    6680:	00078463          	beqz	a5,6688 <fl_fopen+0x174>
    6684:	000780e7          	jalr	a5
    6688:	05c12083          	lw	ra,92(sp)
    668c:	00040513          	mv	a0,s0
    6690:	05812403          	lw	s0,88(sp)
    6694:	05412483          	lw	s1,84(sp)
    6698:	05012903          	lw	s2,80(sp)
    669c:	04c12983          	lw	s3,76(sp)
    66a0:	04812a03          	lw	s4,72(sp)
    66a4:	04412a83          	lw	s5,68(sp)
    66a8:	04012b03          	lw	s6,64(sp)
    66ac:	03c12b83          	lw	s7,60(sp)
    66b0:	03812c03          	lw	s8,56(sp)
    66b4:	03412c83          	lw	s9,52(sp)
    66b8:	03012d03          	lw	s10,48(sp)
    66bc:	06010113          	addi	sp,sp,96
    66c0:	00008067          	ret
    66c4:	008907b3          	add	a5,s2,s0
    66c8:	0007c783          	lbu	a5,0(a5)
    66cc:	05378863          	beq	a5,s3,671c <fl_fopen+0x208>
    66d0:	02f9e863          	bltu	s3,a5,6700 <fl_fopen+0x1ec>
    66d4:	05578863          	beq	a5,s5,6724 <fl_fopen+0x210>
    66d8:	00faea63          	bltu	s5,a5,66ec <fl_fopen+0x1d8>
    66dc:	02b00713          	li	a4,43
    66e0:	04e78663          	beq	a5,a4,672c <fl_fopen+0x218>
    66e4:	00140413          	addi	s0,s0,1
    66e8:	ebdff06f          	j	65a4 <fl_fopen+0x90>
    66ec:	03978263          	beq	a5,s9,6710 <fl_fopen+0x1fc>
    66f0:	05200713          	li	a4,82
    66f4:	fee798e3          	bne	a5,a4,66e4 <fl_fopen+0x1d0>
    66f8:	0014e493          	ori	s1,s1,1
    66fc:	fe9ff06f          	j	66e4 <fl_fopen+0x1d0>
    6700:	ff478ce3          	beq	a5,s4,66f8 <fl_fopen+0x1e4>
    6704:	00fa6a63          	bltu	s4,a5,6718 <fl_fopen+0x204>
    6708:	01778e63          	beq	a5,s7,6724 <fl_fopen+0x210>
    670c:	fd879ce3          	bne	a5,s8,66e4 <fl_fopen+0x1d0>
    6710:	0084e493          	ori	s1,s1,8
    6714:	fd1ff06f          	j	66e4 <fl_fopen+0x1d0>
    6718:	fd6796e3          	bne	a5,s6,66e4 <fl_fopen+0x1d0>
    671c:	0324e493          	ori	s1,s1,50
    6720:	fc5ff06f          	j	66e4 <fl_fopen+0x1d0>
    6724:	0264e493          	ori	s1,s1,38
    6728:	fbdff06f          	j	66e4 <fl_fopen+0x1d0>
    672c:	0014f793          	andi	a5,s1,1
    6730:	00078663          	beqz	a5,673c <fl_fopen+0x228>
    6734:	0024e493          	ori	s1,s1,2
    6738:	fadff06f          	j	66e4 <fl_fopen+0x1d0>
    673c:	0024f793          	andi	a5,s1,2
    6740:	00078663          	beqz	a5,674c <fl_fopen+0x238>
    6744:	0314e493          	ori	s1,s1,49
    6748:	f9dff06f          	j	66e4 <fl_fopen+0x1d0>
    674c:	0044f793          	andi	a5,s1,4
    6750:	f8078ae3          	beqz	a5,66e4 <fl_fopen+0x1d0>
    6754:	0274e493          	ori	s1,s1,39
    6758:	f8dff06f          	j	66e4 <fl_fopen+0x1d0>
    675c:	000d0513          	mv	a0,s10
    6760:	fffff097          	auipc	ra,0xfffff
    6764:	81c080e7          	jalr	-2020(ra) # 4f7c <_open_file>
    6768:	00050413          	mv	s0,a0
    676c:	e60508e3          	beqz	a0,65dc <fl_fopen+0xc8>
    6770:	42940c23          	sb	s1,1080(s0)
    6774:	f09ff06f          	j	667c <fl_fopen+0x168>
    6778:	00040513          	mv	a0,s0
    677c:	ffffe097          	auipc	ra,0xffffe
    6780:	dc8080e7          	jalr	-568(ra) # 4544 <_check_file_open>
    6784:	00050913          	mv	s2,a0
    6788:	ec0514e3          	bnez	a0,6650 <fl_fopen+0x13c>
    678c:	01444783          	lbu	a5,20(s0)
    6790:	0e079663          	bnez	a5,687c <fl_fopen+0x368>
    6794:	008a2783          	lw	a5,8(s4)
    6798:	00f42023          	sw	a5,0(s0)
    679c:	00042583          	lw	a1,0(s0)
    67a0:	01010693          	addi	a3,sp,16
    67a4:	000b0613          	mv	a2,s6
    67a8:	c2c98513          	addi	a0,s3,-980
    67ac:	ffffe097          	auipc	ra,0xffffe
    67b0:	428080e7          	jalr	1064(ra) # 4bd4 <fatfs_get_file_entry>
    67b4:	00100693          	li	a3,1
    67b8:	e8d50ce3          	beq	a0,a3,6650 <fl_fopen+0x13c>
    67bc:	00042223          	sw	zero,4(s0)
    67c0:	00440613          	addi	a2,s0,4
    67c4:	00068593          	mv	a1,a3
    67c8:	c2c98513          	addi	a0,s3,-980
    67cc:	00000097          	auipc	ra,0x0
    67d0:	908080e7          	jalr	-1784(ra) # 60d4 <fatfs_allocate_free_space>
    67d4:	e6050ee3          	beqz	a0,6650 <fl_fopen+0x13c>
    67d8:	00002ab7          	lui	s5,0x2
    67dc:	21c40b93          	addi	s7,s0,540
    67e0:	c2c98c13          	addi	s8,s3,-980
    67e4:	70fa8a93          	addi	s5,s5,1807 # 270f <main+0x93>
    67e8:	000b0593          	mv	a1,s6
    67ec:	00410513          	addi	a0,sp,4
    67f0:	ffffd097          	auipc	ra,0xffffd
    67f4:	68c080e7          	jalr	1676(ra) # 3e7c <fatfs_lfn_create_sfn>
    67f8:	08090e63          	beqz	s2,6894 <fl_fopen+0x380>
    67fc:	00090613          	mv	a2,s2
    6800:	00410593          	addi	a1,sp,4
    6804:	000b8513          	mv	a0,s7
    6808:	ffffd097          	auipc	ra,0xffffd
    680c:	7f0080e7          	jalr	2032(ra) # 3ff8 <fatfs_lfn_generate_tail>
    6810:	00042583          	lw	a1,0(s0)
    6814:	000b8613          	mv	a2,s7
    6818:	000c0513          	mv	a0,s8
    681c:	fffff097          	auipc	ra,0xfffff
    6820:	8d4080e7          	jalr	-1836(ra) # 50f0 <fatfs_sfn_exists>
    6824:	00050663          	beqz	a0,6830 <fl_fopen+0x31c>
    6828:	00190913          	addi	s2,s2,1
    682c:	fb591ee3          	bne	s2,s5,67e8 <fl_fopen+0x2d4>
    6830:	00442703          	lw	a4,4(s0)
    6834:	000027b7          	lui	a5,0x2
    6838:	70f78793          	addi	a5,a5,1807 # 270f <main+0x93>
    683c:	00070593          	mv	a1,a4
    6840:	02f90663          	beq	s2,a5,686c <fl_fopen+0x358>
    6844:	00042583          	lw	a1,0(s0)
    6848:	00000813          	li	a6,0
    684c:	00000793          	li	a5,0
    6850:	000b8693          	mv	a3,s7
    6854:	000b0613          	mv	a2,s6
    6858:	c2c98513          	addi	a0,s3,-980
    685c:	00000097          	auipc	ra,0x0
    6860:	990080e7          	jalr	-1648(ra) # 61ec <fatfs_add_file_entry>
    6864:	04051463          	bnez	a0,68ac <fl_fopen+0x398>
    6868:	00442583          	lw	a1,4(s0)
    686c:	c2c98513          	addi	a0,s3,-980
    6870:	fffff097          	auipc	ra,0xfffff
    6874:	1b4080e7          	jalr	436(ra) # 5a24 <fatfs_free_cluster_chain>
    6878:	dd9ff06f          	j	6650 <fl_fopen+0x13c>
    687c:	00040593          	mv	a1,s0
    6880:	000a8513          	mv	a0,s5
    6884:	ffffe097          	auipc	ra,0xffffe
    6888:	54c080e7          	jalr	1356(ra) # 4dd0 <_open_directory>
    688c:	f00518e3          	bnez	a0,679c <fl_fopen+0x288>
    6890:	dc1ff06f          	j	6650 <fl_fopen+0x13c>
    6894:	00b00613          	li	a2,11
    6898:	00410593          	addi	a1,sp,4
    689c:	000b8513          	mv	a0,s7
    68a0:	ffffc097          	auipc	ra,0xffffc
    68a4:	55c080e7          	jalr	1372(ra) # 2dfc <memcpy>
    68a8:	f69ff06f          	j	6810 <fl_fopen+0x2fc>
    68ac:	fff00793          	li	a5,-1
    68b0:	00042623          	sw	zero,12(s0)
    68b4:	00042423          	sw	zero,8(s0)
    68b8:	42f42823          	sw	a5,1072(s0)
    68bc:	42042a23          	sw	zero,1076(s0)
    68c0:	00042823          	sw	zero,16(s0)
    68c4:	22f42423          	sw	a5,552(s0)
    68c8:	22f42623          	sw	a5,556(s0)
    68cc:	c2c98513          	addi	a0,s3,-980
    68d0:	ffffe097          	auipc	ra,0xffffe
    68d4:	054080e7          	jalr	84(ra) # 4924 <fatfs_fat_purge>
    68d8:	d89ff06f          	j	6660 <fl_fopen+0x14c>
    68dc:	000d0513          	mv	a0,s10
    68e0:	ffffe097          	auipc	ra,0xffffe
    68e4:	69c080e7          	jalr	1692(ra) # 4f7c <_open_file>
    68e8:	00050413          	mv	s0,a0
    68ec:	e80412e3          	bnez	s0,6770 <fl_fopen+0x25c>
    68f0:	d89ff06f          	j	6678 <fl_fopen+0x164>
    68f4:	00000413          	li	s0,0
    68f8:	d91ff06f          	j	6688 <fl_fopen+0x174>

000068fc <lcg_seed>:
    68fc:	0000007b                                {...

00006900 <led_pos>:
    6900:	00000001                                ....

00006904 <cmd16>:
    6904:	02000050 00001500                       P.......

0000690c <acmd41>:
    690c:	00004069 00000100                       i@......

00006914 <cmd55>:
    6914:	00000077 00000100                       w.......

0000691c <cmd8>:
    691c:	01000048 000087aa                       H.......

00006924 <cmd0>:
    6924:	00000040 00009500                       @.......

0000692c <AUDIO>:
    692c:	00018000                                ....

00006930 <DISPLAY>:
    6930:	00014000                                .@..

00006934 <BUTTONS>:
    6934:	00010100                                ....

00006938 <SDCARD>:
    6938:	00010080                                ....

0000693c <OLED_RST>:
    693c:	00010010                                ....

00006940 <OLED>:
    6940:	00010008                                ....

00006944 <LEDS>:
    6944:	00010004 00006272 696c632f 722e6b63     ....rb../click.r
    6954:	00007761 39203d3d 20732730 544e5953     aw..== 90's SYNT
    6964:	3d3d2048 00000000 203a3242 4b43494b     H ==....B2: KICK
    6974:	00000000 203a3342 482d4948 00005441     ....B3: HI-HAT..
    6984:	203a3442 52414e53 00000045 203a3542     B4: SNARE...B5: 
    6994:	53534142 00000000 203a3642 4441454c     BASS....B6: LEAD
    69a4:	00000000 21544948 00000000 20202020     ....HIT!....    
    69b4:	00000000 44414f4c 2e474e49 00002e2e     ....LOADING.....
    69c4:	4154532f 522e5452 00005741 4154532f     /START.RAW../STA
    69d4:	722e5452 00007761 59414c50 21474e49     RT.raw..PLAYING!
    69e4:	00000000 46204f4e 20454c49 4e554f46     ....NO FILE FOUN
    69f4:	00000044 434c4557 20454d4f 52455355     D...WELCOME USER
    6a04:	00000000 676d692f 00002f73 43206f4e     ..../imgs/..No C
    6a14:	7265766f 00000000 50207c7c 45535541     over....|| PAUSE
    6a24:	00000044 52203c3c 4e495745 00000044     D...<< REWIND...
    6a34:	46203e3e 00545341 54534552 00545241     >> FAST.RESTART.
    6a44:	54534146 00583220 574f4c53 352e3020     FAST 2X.SLOW 0.5
    6a54:	00000058 4d204a44 0045444f 52204a44     X...DJ MODE.DJ R
    6a64:	59444145 00000000 54555453 21524554     EADY....STUTTER!
    6a74:	00000021 53203c3c 004e4950 0000002e     !...<< SPIN.....
    6a84:	0000002f 4c494620 203a5345 00000000     /... FILES: ....
    6a94:	74706d45 000a2179 5d64255b 00000020     Empty!..[%d] ...
    6aa4:	203e6425 00000000 20202020 20202020     %d> ....        
    6ab4:	20202020 20202020 20202020 00000a20                  ...
    6ac4:	626c612f 2f736d75 00000000 204a4420     /albums/.... DJ 
    6ad4:	3a4c4553 00000020 53554d20 203a4349     SEL: ... MUSIC: 
    6ae4:	00000020 203d3d3d 4e49414d 4e454d20      ...=== MAIN MEN
    6af4:	3d3d2055 000a0a3d 2e642520 20732520     U ===... %d. %s 
    6b04:	20202020 000a2020 0000000a 656c6553           ......Sele
    6b14:	26207463 65725020 42207373 00006e74     ct & Press Btn..
    6b24:	74696e49 20445320 64726163 0a2e2e2e     Init SD card....
    6b34:	00000000 656c6946 70784520 65726f6c     ....File Explore
    6b44:	00000072 79616c50 6e6f5320 00007367     r...Play Songs..
    6b54:	4d204a44 0065646f 20733039 746e7953     DJ Mode.90s Synt
    6b64:	00000068 33323130 37363534 42413938     h...0123456789AB
    6b74:	46454443 00000000 5f544146 203a5346     CDEF....FAT_FS: 
    6b84:	6f727245 6f632072 20646c75 20746f6e     Error could not 
    6b94:	64616f6c 54414620 74656420 736c6961     load FAT details
    6ba4:	64252820 0a0d2129 00000000 000007e4      (%d)!..........
    6bb4:	000008d8 000008e4 00000908 00000914     ................
    6bc4:	00006b38 00006b48 00006b54 00006b5c     8k..Hk..Tk..\k..

00006bd4 <font>:
    6bd4:	00000000 00002f00 00030000 14000003     ...../..........
    6be4:	143e143e 3a2b6a2e 08122600 171c3224     >.>..j+:.&..$2..
    6bf4:	03003415 00000000 0000211e 001e2100     .4.......!...!..
    6c04:	08220000 0822081c 0000081c 00002040     .."...".....@ ..
    6c14:	00080800 00200000 20000000 02040810     ...... .... ....
    6c24:	3f21213f 003f0100 253d0000 25002725     ?!!?..?...=%%'.%
    6c34:	003f2525 3f040407 25252700 253f003d     %%?....?.'%%=.?%
    6c44:	01003d25 00030539 3f25253f 25252700     %=..9...?%%?.'%%
    6c54:	0028003f 40000000 00000028 00110a04     ?.(....@(.......
    6c64:	00141400 0a110000 01000004 0007052d     ............-...
    6c74:	253d213f 09093f1f 253f003f 3f003c27     ?!=%.?..?.?%'<.?
    6c84:	00212121 1e21213f 25253f00 053f0025     !!!.?!!..?%%%.?.
    6c94:	3f000505 003d2521 3f04043f 213f2100     ...?!%=.?..?.!?!
    6ca4:	20380000 3f013f21 003b0404 2020203f     ..8 !?.?..;.?   
    6cb4:	3f013f00 023f3f01 3f003f04 003f2121     .?.?.??..?.?!!?.
    6cc4:	0f09093f 31213f00 093f003f 27002f39     ?....?!1?.?.9/.'
    6cd4:	003d2525 013f0101 20203f01 100f003f     %%=...?..?  ?...
    6ce4:	3f001f30 3f203f20 3b04043b 38080f00     0..? ? ?;..;...8
    6cf4:	2931000f 3f002325 00000021 04081020     ..1)%#.?!... ...
    6d04:	003f2102 01020000 20000201 00000020     .!?........  ...
    6d14:	00000201 24243800 243f003c 3c003c24     .....8$$<.?$$<.<
    6d24:	00242424 3f24243c 2c2c3c00 3f04002c     $$$.<$$?.<,,,..?
    6d34:	bc000005 00fca4a4 3c04043f 00003d00     ........?..<.=..
    6d44:	fd800000 3f000000 00340808 0000003f     .......?..4.?...
    6d54:	3c043c00 043c3c04 3c003c04 003c2424     .<.<.<<..<.<$$<.
    6d64:	3c2424fc 24243c00 083c00fc 2c000004     .$$<.<$$..<....,
    6d74:	003c2c2c 00243f04 20203c00 100c003c     ,,<..?$..<  <...
    6d84:	3c001c30 3c203c20 34080834 a0a0bc00     0..< < <4..4....
    6d94:	342400fc 0400242c 0000213f 0000003f     ..$4,$..?!..?...
    6da4:	043f2100 02010000 00000102 00000000     .!?.............
    6db4:	00000001 00000003 00000005 00000007     ................
    6dc4:	00000009 0000000e 00000010 00000012     ................
    6dd4:	00000014 00000016 00000018 0000001c     ................
    6de4:	0000001e                                ....

00006de8 <current_path>:
    6de8:	0000002f 00000000 00000000 00000000     /...............
	...

00006fdc <led_dir>:
    6fdc:	00000000                                ....

00006fe0 <n_items>:
    6fe0:	00000000                                ....

00006fe4 <sdcard_while_loading_callback>:
    6fe4:	00000000                                ....

00006fe8 <back_color>:
	...

00006fe9 <front_color>:
    6fe9:	                                         ...

00006fec <cursor_y>:
    6fec:	00000000                                ....

00006ff0 <cursor_x>:
    6ff0:	00000000                                ....

00006ff4 <f_putchar>:
    6ff4:	00000000                                ....

00006ff8 <_free_file_list>:
	...

00007000 <_open_file_list>:
	...

00007008 <_filelib_valid>:
    7008:	00000000                                ....

0000700c <_filelib_init>:
    700c:	00000000                                ....
