
code.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00010137          	lui	sp,0x10
       4:	00000097          	auipc	ra,0x0
       8:	6b0080e7          	jalr	1712(ra) # 6b4 <main>
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

00000064 <clear_audio>:
      64:	fe010113          	addi	sp,sp,-32 # ffe0 <_files+0x4bbc>
      68:	000057b7          	lui	a5,0x5
      6c:	00812c23          	sw	s0,24(sp)
      70:	e707a403          	lw	s0,-400(a5) # 4e70 <AUDIO>
      74:	00112e23          	sw	ra,28(sp)
      78:	00912a23          	sw	s1,20(sp)
      7c:	00042703          	lw	a4,0(s0)
      80:	01212823          	sw	s2,16(sp)
      84:	01312623          	sw	s3,12(sp)
      88:	00042783          	lw	a5,0(s0)
      8c:	fef70ee3          	beq	a4,a5,88 <clear_audio+0x24>
      90:	00200493          	li	s1,2
      94:	00100993          	li	s3,1
      98:	00042903          	lw	s2,0(s0)
      9c:	20000613          	li	a2,512
      a0:	00000593          	li	a1,0
      a4:	00090513          	mv	a0,s2
      a8:	00001097          	auipc	ra,0x1
      ac:	178080e7          	jalr	376(ra) # 1220 <memset>
      b0:	00042783          	lw	a5,0(s0)
      b4:	fef90ee3          	beq	s2,a5,b0 <clear_audio+0x4c>
      b8:	03349063          	bne	s1,s3,d8 <clear_audio+0x74>
      bc:	01c12083          	lw	ra,28(sp)
      c0:	01812403          	lw	s0,24(sp)
      c4:	01412483          	lw	s1,20(sp)
      c8:	01012903          	lw	s2,16(sp)
      cc:	00c12983          	lw	s3,12(sp)
      d0:	02010113          	addi	sp,sp,32
      d4:	00008067          	ret
      d8:	00100493          	li	s1,1
      dc:	fbdff06f          	j	98 <clear_audio+0x34>

000000e0 <play_click_noise>:
      e0:	000055b7          	lui	a1,0x5
      e4:	00005537          	lui	a0,0x5
      e8:	fe010113          	addi	sp,sp,-32
      ec:	e8858593          	addi	a1,a1,-376 # 4e88 <LEDS+0x4>
      f0:	e8c50513          	addi	a0,a0,-372 # 4e8c <LEDS+0x8>
      f4:	00112e23          	sw	ra,28(sp)
      f8:	00812c23          	sw	s0,24(sp)
      fc:	00912a23          	sw	s1,20(sp)
     100:	01212823          	sw	s2,16(sp)
     104:	01312623          	sw	s3,12(sp)
     108:	01412423          	sw	s4,8(sp)
     10c:	01512223          	sw	s5,4(sp)
     110:	00005097          	auipc	ra,0x5
     114:	950080e7          	jalr	-1712(ra) # 4a60 <fl_fopen>
     118:	0a050063          	beqz	a0,1b8 <play_click_noise+0xd8>
     11c:	00000613          	li	a2,0
     120:	32000593          	li	a1,800
     124:	00050a13          	mv	s4,a0
     128:	00002097          	auipc	ra,0x2
     12c:	dc8080e7          	jalr	-568(ra) # 1ef0 <fl_fseek>
     130:	000057b7          	lui	a5,0x5
     134:	e707aa83          	lw	s5,-400(a5) # 4e70 <AUDIO>
     138:	20000993          	li	s3,512
     13c:	1ff00913          	li	s2,511
     140:	000aa483          	lw	s1,0(s5)
     144:	000a0693          	mv	a3,s4
     148:	20000613          	li	a2,512
     14c:	00100593          	li	a1,1
     150:	00048513          	mv	a0,s1
     154:	00004097          	auipc	ra,0x4
     158:	308080e7          	jalr	776(ra) # 445c <fl_fread>
     15c:	00050413          	mv	s0,a0
     160:	00a94c63          	blt	s2,a0,178 <play_click_noise+0x98>
     164:	40a98633          	sub	a2,s3,a0
     168:	00000593          	li	a1,0
     16c:	00a48533          	add	a0,s1,a0
     170:	00001097          	auipc	ra,0x1
     174:	0b0080e7          	jalr	176(ra) # 1220 <memset>
     178:	000aa783          	lw	a5,0(s5)
     17c:	fef48ee3          	beq	s1,a5,178 <play_click_noise+0x98>
     180:	fc8940e3          	blt	s2,s0,140 <play_click_noise+0x60>
     184:	000a0513          	mv	a0,s4
     188:	00004097          	auipc	ra,0x4
     18c:	1f8080e7          	jalr	504(ra) # 4380 <fl_fclose>
     190:	01812403          	lw	s0,24(sp)
     194:	01c12083          	lw	ra,28(sp)
     198:	01412483          	lw	s1,20(sp)
     19c:	01012903          	lw	s2,16(sp)
     1a0:	00c12983          	lw	s3,12(sp)
     1a4:	00812a03          	lw	s4,8(sp)
     1a8:	00412a83          	lw	s5,4(sp)
     1ac:	02010113          	addi	sp,sp,32
     1b0:	00000317          	auipc	t1,0x0
     1b4:	eb430067          	jr	-332(t1) # 64 <clear_audio>
     1b8:	01c12083          	lw	ra,28(sp)
     1bc:	01812403          	lw	s0,24(sp)
     1c0:	01412483          	lw	s1,20(sp)
     1c4:	01012903          	lw	s2,16(sp)
     1c8:	00c12983          	lw	s3,12(sp)
     1cc:	00812a03          	lw	s4,8(sp)
     1d0:	00412a83          	lw	s5,4(sp)
     1d4:	02010113          	addi	sp,sp,32
     1d8:	00008067          	ret

000001dc <view_image_file>:
     1dc:	000055b7          	lui	a1,0x5
     1e0:	ff010113          	addi	sp,sp,-16
     1e4:	e8858593          	addi	a1,a1,-376 # 4e88 <LEDS+0x4>
     1e8:	00112623          	sw	ra,12(sp)
     1ec:	00812423          	sw	s0,8(sp)
     1f0:	00005097          	auipc	ra,0x5
     1f4:	870080e7          	jalr	-1936(ra) # 4a60 <fl_fopen>
     1f8:	06050c63          	beqz	a0,270 <view_image_file+0x94>
     1fc:	00050413          	mv	s0,a0
     200:	00001097          	auipc	ra,0x1
     204:	360080e7          	jalr	864(ra) # 1560 <display_framebuffer>
     208:	00040693          	mv	a3,s0
     20c:	00004637          	lui	a2,0x4
     210:	00100593          	li	a1,1
     214:	00004097          	auipc	ra,0x4
     218:	248080e7          	jalr	584(ra) # 445c <fl_fread>
     21c:	00040513          	mv	a0,s0
     220:	00004097          	auipc	ra,0x4
     224:	160080e7          	jalr	352(ra) # 4380 <fl_fclose>
     228:	00001097          	auipc	ra,0x1
     22c:	498080e7          	jalr	1176(ra) # 16c0 <display_refresh>
     230:	000057b7          	lui	a5,0x5
     234:	e747a683          	lw	a3,-396(a5) # 4e74 <BUTTONS>
     238:	0006a703          	lw	a4,0(a3)
     23c:	fe071ee3          	bnez	a4,238 <view_image_file+0x5c>
     240:	fff74793          	not	a5,a4
     244:	0006a703          	lw	a4,0(a3)
     248:	00e7f7b3          	and	a5,a5,a4
     24c:	fe078ae3          	beqz	a5,240 <view_image_file+0x64>
     250:	00000097          	auipc	ra,0x0
     254:	e90080e7          	jalr	-368(ra) # e0 <play_click_noise>
     258:	00812403          	lw	s0,8(sp)
     25c:	00c12083          	lw	ra,12(sp)
     260:	00000513          	li	a0,0
     264:	01010113          	addi	sp,sp,16
     268:	00001317          	auipc	t1,0x1
     26c:	25c30067          	jr	604(t1) # 14c4 <oled_clear>
     270:	00c12083          	lw	ra,12(sp)
     274:	00812403          	lw	s0,8(sp)
     278:	01010113          	addi	sp,sp,16
     27c:	00008067          	ret

00000280 <play_music_file>:
     280:	000055b7          	lui	a1,0x5
     284:	fc010113          	addi	sp,sp,-64
     288:	e8858593          	addi	a1,a1,-376 # 4e88 <LEDS+0x4>
     28c:	02812c23          	sw	s0,56(sp)
     290:	02112e23          	sw	ra,60(sp)
     294:	02912a23          	sw	s1,52(sp)
     298:	03212823          	sw	s2,48(sp)
     29c:	03312623          	sw	s3,44(sp)
     2a0:	03412423          	sw	s4,40(sp)
     2a4:	03512223          	sw	s5,36(sp)
     2a8:	03612023          	sw	s6,32(sp)
     2ac:	01712e23          	sw	s7,28(sp)
     2b0:	01812c23          	sw	s8,24(sp)
     2b4:	01912a23          	sw	s9,20(sp)
     2b8:	01a12823          	sw	s10,16(sp)
     2bc:	01b12623          	sw	s11,12(sp)
     2c0:	00050413          	mv	s0,a0
     2c4:	00004097          	auipc	ra,0x4
     2c8:	79c080e7          	jalr	1948(ra) # 4a60 <fl_fopen>
     2cc:	08051063          	bnez	a0,34c <play_music_file+0xcc>
     2d0:	00000593          	li	a1,0
     2d4:	0ff00513          	li	a0,255
     2d8:	00001097          	auipc	ra,0x1
     2dc:	2a8080e7          	jalr	680(ra) # 1580 <display_set_front_back_color>
     2e0:	00005537          	lui	a0,0x5
     2e4:	00040593          	mv	a1,s0
     2e8:	e9850513          	addi	a0,a0,-360 # 4e98 <LEDS+0x14>
     2ec:	00001097          	auipc	ra,0x1
     2f0:	5cc080e7          	jalr	1484(ra) # 18b8 <printf>
     2f4:	00001097          	auipc	ra,0x1
     2f8:	3cc080e7          	jalr	972(ra) # 16c0 <display_refresh>
     2fc:	000317b7          	lui	a5,0x31
     300:	d4078793          	addi	a5,a5,-704 # 30d40 <__stacktop+0x20d40>
     304:	00000013          	nop
     308:	fff78793          	addi	a5,a5,-1
     30c:	fe079ce3          	bnez	a5,304 <play_music_file+0x84>
     310:	03c12083          	lw	ra,60(sp)
     314:	03812403          	lw	s0,56(sp)
     318:	03412483          	lw	s1,52(sp)
     31c:	03012903          	lw	s2,48(sp)
     320:	02c12983          	lw	s3,44(sp)
     324:	02812a03          	lw	s4,40(sp)
     328:	02412a83          	lw	s5,36(sp)
     32c:	02012b03          	lw	s6,32(sp)
     330:	01c12b83          	lw	s7,28(sp)
     334:	01812c03          	lw	s8,24(sp)
     338:	01412c83          	lw	s9,20(sp)
     33c:	01012d03          	lw	s10,16(sp)
     340:	00c12d83          	lw	s11,12(sp)
     344:	04010113          	addi	sp,sp,64
     348:	00008067          	ret
     34c:	00000593          	li	a1,0
     350:	00050c13          	mv	s8,a0
     354:	00000513          	li	a0,0
     358:	00001097          	auipc	ra,0x1
     35c:	214080e7          	jalr	532(ra) # 156c <display_set_cursor>
     360:	00000593          	li	a1,0
     364:	0ff00513          	li	a0,255
     368:	00001097          	auipc	ra,0x1
     36c:	218080e7          	jalr	536(ra) # 1580 <display_set_front_back_color>
     370:	00005537          	lui	a0,0x5
     374:	00040593          	mv	a1,s0
     378:	ea450513          	addi	a0,a0,-348 # 4ea4 <LEDS+0x20>
     37c:	00001097          	auipc	ra,0x1
     380:	53c080e7          	jalr	1340(ra) # 18b8 <printf>
     384:	00001097          	auipc	ra,0x1
     388:	33c080e7          	jalr	828(ra) # 16c0 <display_refresh>
     38c:	000057b7          	lui	a5,0x5
     390:	e747a783          	lw	a5,-396(a5) # 4e74 <BUTTONS>
     394:	00000b13          	li	s6,0
     398:	00100413          	li	s0,1
     39c:	0007a483          	lw	s1,0(a5)
     3a0:	00078c93          	mv	s9,a5
     3a4:	000057b7          	lui	a5,0x5
     3a8:	e707ad03          	lw	s10,-400(a5) # 4e70 <AUDIO>
     3ac:	20000a13          	li	s4,512
     3b0:	1ff00993          	li	s3,511
     3b4:	00005937          	lui	s2,0x5
     3b8:	000d2b83          	lw	s7,0(s10)
     3bc:	000c0693          	mv	a3,s8
     3c0:	20000613          	li	a2,512
     3c4:	00100593          	li	a1,1
     3c8:	000b8513          	mv	a0,s7
     3cc:	00004097          	auipc	ra,0x4
     3d0:	090080e7          	jalr	144(ra) # 445c <fl_fread>
     3d4:	00050a93          	mv	s5,a0
     3d8:	00a9cc63          	blt	s3,a0,3f0 <play_music_file+0x170>
     3dc:	40aa0633          	sub	a2,s4,a0
     3e0:	00000593          	li	a1,0
     3e4:	00ab8533          	add	a0,s7,a0
     3e8:	00001097          	auipc	ra,0x1
     3ec:	e38080e7          	jalr	-456(ra) # 1220 <memset>
     3f0:	000d2783          	lw	a5,0(s10)
     3f4:	fefb8ee3          	beq	s7,a5,3f0 <play_music_file+0x170>
     3f8:	0559d263          	bge	s3,s5,43c <play_music_file+0x1bc>
     3fc:	fff40793          	addi	a5,s0,-1
     400:	f8040713          	addi	a4,s0,-128
     404:	00173713          	seqz	a4,a4
     408:	0017b793          	seqz	a5,a5
     40c:	00e7e7b3          	or	a5,a5,a4
     410:	00fb4733          	xor	a4,s6,a5
     414:	04fb0a63          	beq	s6,a5,468 <play_music_file+0x1e8>
     418:	00141413          	slli	s0,s0,0x1
     41c:	e8492783          	lw	a5,-380(s2) # 4e84 <LEDS>
     420:	fff4c493          	not	s1,s1
     424:	0087a023          	sw	s0,0(a5)
     428:	000ca783          	lw	a5,0(s9)
     42c:	00f4f4b3          	and	s1,s1,a5
     430:	02048663          	beqz	s1,45c <play_music_file+0x1dc>
     434:	00000097          	auipc	ra,0x0
     438:	cac080e7          	jalr	-852(ra) # e0 <play_click_noise>
     43c:	000c0513          	mv	a0,s8
     440:	00004097          	auipc	ra,0x4
     444:	f40080e7          	jalr	-192(ra) # 4380 <fl_fclose>
     448:	00000097          	auipc	ra,0x0
     44c:	c1c080e7          	jalr	-996(ra) # 64 <clear_audio>
     450:	e8492783          	lw	a5,-380(s2)
     454:	0007a023          	sw	zero,0(a5)
     458:	eb9ff06f          	j	310 <play_music_file+0x90>
     45c:	00070b13          	mv	s6,a4
     460:	00078493          	mv	s1,a5
     464:	f55ff06f          	j	3b8 <play_music_file+0x138>
     468:	40145413          	srai	s0,s0,0x1
     46c:	fb1ff06f          	j	41c <play_music_file+0x19c>

00000470 <scan_files>:
     470:	fd010113          	addi	sp,sp,-48
     474:	02912223          	sw	s1,36(sp)
     478:	000055b7          	lui	a1,0x5
     47c:	000054b7          	lui	s1,0x5
     480:	02812423          	sw	s0,40(sp)
     484:	ebc58593          	addi	a1,a1,-324 # 4ebc <LEDS+0x38>
     488:	00005437          	lui	s0,0x5
     48c:	17c48513          	addi	a0,s1,380 # 517c <current_path>
     490:	02112623          	sw	ra,44(sp)
     494:	03212023          	sw	s2,32(sp)
     498:	01312e23          	sw	s3,28(sp)
     49c:	01412c23          	sw	s4,24(sp)
     4a0:	01512a23          	sw	s5,20(sp)
     4a4:	01612823          	sw	s6,16(sp)
     4a8:	01712623          	sw	s7,12(sp)
     4ac:	36042823          	sw	zero,880(s0) # 5370 <n_items>
     4b0:	00000097          	auipc	ra,0x0
     4b4:	b6c080e7          	jalr	-1172(ra) # 1c <strcmp>
     4b8:	06050e63          	beqz	a0,534 <scan_files+0xc4>
     4bc:	00005937          	lui	s2,0x5
     4c0:	06400613          	li	a2,100
     4c4:	00000593          	li	a1,0
     4c8:	4bc90513          	addi	a0,s2,1212 # 54bc <files>
     4cc:	00001097          	auipc	ra,0x1
     4d0:	d54080e7          	jalr	-684(ra) # 1220 <memset>
     4d4:	37042783          	lw	a5,880(s0)
     4d8:	4bc90913          	addi	s2,s2,1212
     4dc:	000055b7          	lui	a1,0x5
     4e0:	00379513          	slli	a0,a5,0x3
     4e4:	40f50533          	sub	a0,a0,a5
     4e8:	00251513          	slli	a0,a0,0x2
     4ec:	40f50533          	sub	a0,a0,a5
     4f0:	00251513          	slli	a0,a0,0x2
     4f4:	00a90533          	add	a0,s2,a0
     4f8:	ec058593          	addi	a1,a1,-320 # 4ec0 <LEDS+0x3c>
     4fc:	00001097          	auipc	ra,0x1
     500:	de8080e7          	jalr	-536(ra) # 12e4 <strcpy>
     504:	37042703          	lw	a4,880(s0)
     508:	00371793          	slli	a5,a4,0x3
     50c:	40e787b3          	sub	a5,a5,a4
     510:	00279793          	slli	a5,a5,0x2
     514:	40e787b3          	sub	a5,a5,a4
     518:	00279793          	slli	a5,a5,0x2
     51c:	00f90933          	add	s2,s2,a5
     520:	00100793          	li	a5,1
     524:	00f70733          	add	a4,a4,a5
     528:	06092223          	sw	zero,100(s2)
     52c:	06f92423          	sw	a5,104(s2)
     530:	36e42823          	sw	a4,880(s0)
     534:	000059b7          	lui	s3,0x5
     538:	4b098593          	addi	a1,s3,1200 # 54b0 <dirstat.1>
     53c:	17c48513          	addi	a0,s1,380
     540:	00003097          	auipc	ra,0x3
     544:	ec0080e7          	jalr	-320(ra) # 3400 <fl_opendir>
     548:	14050063          	beqz	a0,688 <scan_files+0x218>
     54c:	00005937          	lui	s2,0x5
     550:	000057b7          	lui	a5,0x5
     554:	000054b7          	lui	s1,0x5
     558:	ec478b93          	addi	s7,a5,-316 # 4ec4 <LEDS+0x40>
     55c:	4bc48493          	addi	s1,s1,1212 # 54bc <files>
     560:	3a090a13          	addi	s4,s2,928 # 53a0 <dirent.0>
     564:	3a090593          	addi	a1,s2,928
     568:	4b098513          	addi	a0,s3,1200
     56c:	00003097          	auipc	ra,0x3
     570:	560080e7          	jalr	1376(ra) # 3acc <fl_readdir>
     574:	00050a93          	mv	s5,a0
     578:	00051863          	bnez	a0,588 <scan_files+0x118>
     57c:	37042b03          	lw	s6,880(s0)
     580:	03f00793          	li	a5,63
     584:	0367dc63          	bge	a5,s6,5bc <scan_files+0x14c>
     588:	02812403          	lw	s0,40(sp)
     58c:	02c12083          	lw	ra,44(sp)
     590:	02412483          	lw	s1,36(sp)
     594:	02012903          	lw	s2,32(sp)
     598:	01812a03          	lw	s4,24(sp)
     59c:	01412a83          	lw	s5,20(sp)
     5a0:	01012b03          	lw	s6,16(sp)
     5a4:	00c12b83          	lw	s7,12(sp)
     5a8:	4b098513          	addi	a0,s3,1200
     5ac:	01c12983          	lw	s3,28(sp)
     5b0:	03010113          	addi	sp,sp,48
     5b4:	00002317          	auipc	t1,0x2
     5b8:	a3430067          	jr	-1484(t1) # 1fe8 <fl_closedir>
     5bc:	000b8593          	mv	a1,s7
     5c0:	3a090513          	addi	a0,s2,928
     5c4:	00000097          	auipc	ra,0x0
     5c8:	a58080e7          	jalr	-1448(ra) # 1c <strcmp>
     5cc:	f8050ce3          	beqz	a0,564 <scan_files+0xf4>
     5d0:	000055b7          	lui	a1,0x5
     5d4:	ec058593          	addi	a1,a1,-320 # 4ec0 <LEDS+0x3c>
     5d8:	3a090513          	addi	a0,s2,928
     5dc:	00000097          	auipc	ra,0x0
     5e0:	a40080e7          	jalr	-1472(ra) # 1c <strcmp>
     5e4:	f80500e3          	beqz	a0,564 <scan_files+0xf4>
     5e8:	003b1513          	slli	a0,s6,0x3
     5ec:	41650533          	sub	a0,a0,s6
     5f0:	00251513          	slli	a0,a0,0x2
     5f4:	41650533          	sub	a0,a0,s6
     5f8:	00251513          	slli	a0,a0,0x2
     5fc:	06400613          	li	a2,100
     600:	00000593          	li	a1,0
     604:	00a48533          	add	a0,s1,a0
     608:	00001097          	auipc	ra,0x1
     60c:	c18080e7          	jalr	-1000(ra) # 1220 <memset>
     610:	37042703          	lw	a4,880(s0)
     614:	06300513          	li	a0,99
     618:	00371793          	slli	a5,a4,0x3
     61c:	40e786b3          	sub	a3,a5,a4
     620:	00269693          	slli	a3,a3,0x2
     624:	40e686b3          	sub	a3,a3,a4
     628:	00269693          	slli	a3,a3,0x2
     62c:	014a8633          	add	a2,s5,s4
     630:	00064583          	lbu	a1,0(a2) # 4000 <fatfs_fat_add_cluster_to_chain+0x20>
     634:	00058463          	beqz	a1,63c <scan_files+0x1cc>
     638:	02aa9e63          	bne	s5,a0,674 <scan_files+0x204>
     63c:	40e787b3          	sub	a5,a5,a4
     640:	00279793          	slli	a5,a5,0x2
     644:	10ca2683          	lw	a3,268(s4)
     648:	40e787b3          	sub	a5,a5,a4
     64c:	00279793          	slli	a5,a5,0x2
     650:	00f487b3          	add	a5,s1,a5
     654:	06d7a223          	sw	a3,100(a5)
     658:	104a4683          	lbu	a3,260(s4)
     65c:	01578ab3          	add	s5,a5,s5
     660:	00170713          	addi	a4,a4,1
     664:	000a8023          	sb	zero,0(s5)
     668:	06d7a423          	sw	a3,104(a5)
     66c:	36e42823          	sw	a4,880(s0)
     670:	ef5ff06f          	j	564 <scan_files+0xf4>
     674:	00da8633          	add	a2,s5,a3
     678:	00c48633          	add	a2,s1,a2
     67c:	00b60023          	sb	a1,0(a2)
     680:	001a8a93          	addi	s5,s5,1
     684:	fa9ff06f          	j	62c <scan_files+0x1bc>
     688:	02c12083          	lw	ra,44(sp)
     68c:	02812403          	lw	s0,40(sp)
     690:	02412483          	lw	s1,36(sp)
     694:	02012903          	lw	s2,32(sp)
     698:	01c12983          	lw	s3,28(sp)
     69c:	01812a03          	lw	s4,24(sp)
     6a0:	01412a83          	lw	s5,20(sp)
     6a4:	01012b03          	lw	s6,16(sp)
     6a8:	00c12b83          	lw	s7,12(sp)
     6ac:	03010113          	addi	sp,sp,48
     6b0:	00008067          	ret

000006b4 <main>:
     6b4:	000057b7          	lui	a5,0x5
     6b8:	e847a783          	lw	a5,-380(a5) # 4e84 <LEDS>
     6bc:	db010113          	addi	sp,sp,-592
     6c0:	24112623          	sw	ra,588(sp)
     6c4:	24812423          	sw	s0,584(sp)
     6c8:	24912223          	sw	s1,580(sp)
     6cc:	23612823          	sw	s6,560(sp)
     6d0:	25212023          	sw	s2,576(sp)
     6d4:	23312e23          	sw	s3,572(sp)
     6d8:	23412c23          	sw	s4,568(sp)
     6dc:	23512a23          	sw	s5,564(sp)
     6e0:	23712623          	sw	s7,556(sp)
     6e4:	23812423          	sw	s8,552(sp)
     6e8:	23912223          	sw	s9,548(sp)
     6ec:	23a12023          	sw	s10,544(sp)
     6f0:	21b12e23          	sw	s11,540(sp)
     6f4:	0007a023          	sw	zero,0(a5)
     6f8:	000017b7          	lui	a5,0x1
     6fc:	59478793          	addi	a5,a5,1428 # 1594 <display_putchar>
     700:	00005b37          	lui	s6,0x5
     704:	38fb2223          	sw	a5,900(s6) # 5384 <f_putchar>
     708:	00001097          	auipc	ra,0x1
     70c:	d18080e7          	jalr	-744(ra) # 1420 <oled_init>
     710:	00001097          	auipc	ra,0x1
     714:	d1c080e7          	jalr	-740(ra) # 142c <oled_fullscreen>
     718:	00000513          	li	a0,0
     71c:	00001097          	auipc	ra,0x1
     720:	da8080e7          	jalr	-600(ra) # 14c4 <oled_clear>
     724:	00001097          	auipc	ra,0x1
     728:	89c080e7          	jalr	-1892(ra) # fc0 <sdcard_init>
     72c:	00001097          	auipc	ra,0x1
     730:	75c080e7          	jalr	1884(ra) # 1e88 <fl_init>
     734:	00000593          	li	a1,0
     738:	00000513          	li	a0,0
     73c:	00001097          	auipc	ra,0x1
     740:	e30080e7          	jalr	-464(ra) # 156c <display_set_cursor>
     744:	00000593          	li	a1,0
     748:	0ff00513          	li	a0,255
     74c:	00001097          	auipc	ra,0x1
     750:	e34080e7          	jalr	-460(ra) # 1580 <display_set_front_back_color>
     754:	00005537          	lui	a0,0x5
     758:	ec850513          	addi	a0,a0,-312 # 4ec8 <LEDS+0x44>
     75c:	00001097          	auipc	ra,0x1
     760:	15c080e7          	jalr	348(ra) # 18b8 <printf>
     764:	000014b7          	lui	s1,0x1
     768:	00001437          	lui	s0,0x1
     76c:	00001097          	auipc	ra,0x1
     770:	f54080e7          	jalr	-172(ra) # 16c0 <display_refresh>
     774:	16448493          	addi	s1,s1,356 # 1164 <sdcard_writesector>
     778:	11040413          	addi	s0,s0,272 # 1110 <sdcard_readsector>
     77c:	00048593          	mv	a1,s1
     780:	00040513          	mv	a0,s0
     784:	00002097          	auipc	ra,0x2
     788:	664080e7          	jalr	1636(ra) # 2de8 <fl_attach_media>
     78c:	fe0518e3          	bnez	a0,77c <main+0xc8>
     790:	00000097          	auipc	ra,0x0
     794:	ce0080e7          	jalr	-800(ra) # 470 <scan_files>
     798:	000057b7          	lui	a5,0x5
     79c:	edc78793          	addi	a5,a5,-292 # 4edc <LEDS+0x58>
     7a0:	00f12423          	sw	a5,8(sp)
     7a4:	000057b7          	lui	a5,0x5
     7a8:	e747a783          	lw	a5,-396(a5) # 4e74 <BUTTONS>
     7ac:	00005ab7          	lui	s5,0x5
     7b0:	00000913          	li	s2,0
     7b4:	00000993          	li	s3,0
     7b8:	00000c13          	li	s8,0
     7bc:	00000413          	li	s0,0
     7c0:	17ca8a93          	addi	s5,s5,380 # 517c <current_path>
     7c4:	00f12623          	sw	a5,12(sp)
     7c8:	00000593          	li	a1,0
     7cc:	00000513          	li	a0,0
     7d0:	00001097          	auipc	ra,0x1
     7d4:	d9c080e7          	jalr	-612(ra) # 156c <display_set_cursor>
     7d8:	0ffc7593          	zext.b	a1,s8
     7dc:	07f58513          	addi	a0,a1,127
     7e0:	0ff57513          	zext.b	a0,a0
     7e4:	00001097          	auipc	ra,0x1
     7e8:	d9c080e7          	jalr	-612(ra) # 1580 <display_set_front_back_color>
     7ec:	00812503          	lw	a0,8(sp)
     7f0:	00000493          	li	s1,0
     7f4:	00f00a13          	li	s4,15
     7f8:	00001097          	auipc	ra,0x1
     7fc:	0c0080e7          	jalr	192(ra) # 18b8 <printf>
     800:	015487b3          	add	a5,s1,s5
     804:	0007c503          	lbu	a0,0(a5)
     808:	00050a63          	beqz	a0,81c <main+0x168>
     80c:	384b2783          	lw	a5,900(s6)
     810:	00148493          	addi	s1,s1,1
     814:	000780e7          	jalr	a5
     818:	ff4494e3          	bne	s1,s4,800 <main+0x14c>
     81c:	384b2783          	lw	a5,900(s6)
     820:	00a00513          	li	a0,10
     824:	00005d37          	lui	s10,0x5
     828:	000780e7          	jalr	a5
     82c:	00000593          	li	a1,0
     830:	0ff00513          	li	a0,255
     834:	00001097          	auipc	ra,0x1
     838:	d4c080e7          	jalr	-692(ra) # 1580 <display_set_front_back_color>
     83c:	370d2a03          	lw	s4,880(s10) # 5370 <n_items>
     840:	0a0a0463          	beqz	s4,8e8 <main+0x234>
     844:	412a0a33          	sub	s4,s4,s2
     848:	00c00793          	li	a5,12
     84c:	0147d463          	bge	a5,s4,854 <main+0x1a0>
     850:	00078a13          	mv	s4,a5
     854:	00391493          	slli	s1,s2,0x3
     858:	412484b3          	sub	s1,s1,s2
     85c:	00249493          	slli	s1,s1,0x2
     860:	412484b3          	sub	s1,s1,s2
     864:	000057b7          	lui	a5,0x5
     868:	4bc78793          	addi	a5,a5,1212 # 54bc <files>
     86c:	00249493          	slli	s1,s1,0x2
     870:	00f484b3          	add	s1,s1,a5
     874:	000057b7          	lui	a5,0x5
     878:	f0078793          	addi	a5,a5,-256 # 4f00 <LEDS+0x7c>
     87c:	00f12023          	sw	a5,0(sp)
     880:	000057b7          	lui	a5,0x5
     884:	ef878793          	addi	a5,a5,-264 # 4ef8 <LEDS+0x74>
     888:	00000b93          	li	s7,0
     88c:	00f12223          	sw	a5,4(sp)
     890:	01200d93          	li	s11,18
     894:	174bc663          	blt	s7,s4,a00 <main+0x34c>
     898:	00000593          	li	a1,0
     89c:	00000513          	li	a0,0
     8a0:	000054b7          	lui	s1,0x5
     8a4:	00001097          	auipc	ra,0x1
     8a8:	cdc080e7          	jalr	-804(ra) # 1580 <display_set_front_back_color>
     8ac:	00c00b93          	li	s7,12
     8b0:	f0848493          	addi	s1,s1,-248 # 4f08 <LEDS+0x84>
     8b4:	057a0263          	beq	s4,s7,8f8 <main+0x244>
     8b8:	00048513          	mv	a0,s1
     8bc:	00001097          	auipc	ra,0x1
     8c0:	ffc080e7          	jalr	-4(ra) # 18b8 <printf>
     8c4:	001a0a13          	addi	s4,s4,1
     8c8:	fedff06f          	j	8b4 <main+0x200>
     8cc:	00000913          	li	s2,0
     8d0:	00000413          	li	s0,0
     8d4:	007c0c13          	addi	s8,s8,7
     8d8:	000a0993          	mv	s3,s4
     8dc:	eedff06f          	j	7c8 <main+0x114>
     8e0:	00040913          	mv	s2,s0
     8e4:	ff1ff06f          	j	8d4 <main+0x220>
     8e8:	00005537          	lui	a0,0x5
     8ec:	ee450513          	addi	a0,a0,-284 # 4ee4 <LEDS+0x60>
     8f0:	00001097          	auipc	ra,0x1
     8f4:	fc8080e7          	jalr	-56(ra) # 18b8 <printf>
     8f8:	00001097          	auipc	ra,0x1
     8fc:	dc8080e7          	jalr	-568(ra) # 16c0 <display_refresh>
     900:	00c12783          	lw	a5,12(sp)
     904:	fff9c993          	not	s3,s3
     908:	0007aa03          	lw	s4,0(a5)
     90c:	0149f9b3          	and	s3,s3,s4
     910:	0109f793          	andi	a5,s3,16
     914:	00078863          	beqz	a5,924 <main+0x270>
     918:	00140413          	addi	s0,s0,1
     91c:	fffff097          	auipc	ra,0xfffff
     920:	7c4080e7          	jalr	1988(ra) # e0 <play_click_noise>
     924:	0089f793          	andi	a5,s3,8
     928:	00078863          	beqz	a5,938 <main+0x284>
     92c:	fff40413          	addi	s0,s0,-1
     930:	fffff097          	auipc	ra,0xfffff
     934:	7b0080e7          	jalr	1968(ra) # e0 <play_click_noise>
     938:	0049f993          	andi	s3,s3,4
     93c:	08098e63          	beqz	s3,9d8 <main+0x324>
     940:	00341993          	slli	s3,s0,0x3
     944:	408984b3          	sub	s1,s3,s0
     948:	00249493          	slli	s1,s1,0x2
     94c:	408484b3          	sub	s1,s1,s0
     950:	00005bb7          	lui	s7,0x5
     954:	00249493          	slli	s1,s1,0x2
     958:	4bcb8b93          	addi	s7,s7,1212 # 54bc <files>
     95c:	fffff097          	auipc	ra,0xfffff
     960:	784080e7          	jalr	1924(ra) # e0 <play_click_noise>
     964:	017484b3          	add	s1,s1,s7
     968:	0684a783          	lw	a5,104(s1)
     96c:	18078e63          	beqz	a5,b08 <main+0x454>
     970:	000055b7          	lui	a1,0x5
     974:	ec058593          	addi	a1,a1,-320 # 4ec0 <LEDS+0x3c>
     978:	00048513          	mv	a0,s1
     97c:	fffff097          	auipc	ra,0xfffff
     980:	6a0080e7          	jalr	1696(ra) # 1c <strcmp>
     984:	00000713          	li	a4,0
     988:	12051663          	bnez	a0,ab4 <main+0x400>
     98c:	00aa87b3          	add	a5,s5,a0
     990:	0007c703          	lbu	a4,0(a5)
     994:	0e071e63          	bnez	a4,a90 <main+0x3dc>
     998:	00100713          	li	a4,1
     99c:	02a75063          	bge	a4,a0,9bc <main+0x308>
     9a0:	02f00593          	li	a1,47
     9a4:	000a8513          	mv	a0,s5
     9a8:	fe078fa3          	sb	zero,-1(a5)
     9ac:	fffff097          	auipc	ra,0xfffff
     9b0:	694080e7          	jalr	1684(ra) # 40 <strrchr>
     9b4:	0e050263          	beqz	a0,a98 <main+0x3e4>
     9b8:	000500a3          	sb	zero,1(a0)
     9bc:	00000097          	auipc	ra,0x0
     9c0:	ab4080e7          	jalr	-1356(ra) # 470 <scan_files>
     9c4:	00000513          	li	a0,0
     9c8:	00001097          	auipc	ra,0x1
     9cc:	afc080e7          	jalr	-1284(ra) # 14c4 <oled_clear>
     9d0:	00000913          	li	s2,0
     9d4:	00000413          	li	s0,0
     9d8:	370d2783          	lw	a5,880(s10)
     9dc:	eef058e3          	blez	a5,8cc <main+0x218>
     9e0:	fff00713          	li	a4,-1
     9e4:	1ae41063          	bne	s0,a4,b84 <main+0x4d0>
     9e8:	00878433          	add	s0,a5,s0
     9ec:	ef244ae3          	blt	s0,s2,8e0 <main+0x22c>
     9f0:	00b90793          	addi	a5,s2,11
     9f4:	ee87d0e3          	bge	a5,s0,8d4 <main+0x220>
     9f8:	ff540913          	addi	s2,s0,-11
     9fc:	ed9ff06f          	j	8d4 <main+0x220>
     a00:	012b8cb3          	add	s9,s7,s2
     a04:	07941463          	bne	s0,s9,a6c <main+0x3b8>
     a08:	0ff00593          	li	a1,255
     a0c:	00000513          	li	a0,0
     a10:	00001097          	auipc	ra,0x1
     a14:	b70080e7          	jalr	-1168(ra) # 1580 <display_set_front_back_color>
     a18:	0684a783          	lw	a5,104(s1)
     a1c:	000c8593          	mv	a1,s9
     a20:	04078c63          	beqz	a5,a78 <main+0x3c4>
     a24:	00412503          	lw	a0,4(sp)
     a28:	00001097          	auipc	ra,0x1
     a2c:	e90080e7          	jalr	-368(ra) # 18b8 <printf>
     a30:	00000c93          	li	s9,0
     a34:	019487b3          	add	a5,s1,s9
     a38:	0007c503          	lbu	a0,0(a5)
     a3c:	00050a63          	beqz	a0,a50 <main+0x39c>
     a40:	384b2783          	lw	a5,900(s6)
     a44:	001c8c93          	addi	s9,s9,1
     a48:	000780e7          	jalr	a5
     a4c:	ffbc94e3          	bne	s9,s11,a34 <main+0x380>
     a50:	384b2783          	lw	a5,900(s6)
     a54:	03bc9663          	bne	s9,s11,a80 <main+0x3cc>
     a58:	00a00513          	li	a0,10
     a5c:	000780e7          	jalr	a5
     a60:	001b8b93          	addi	s7,s7,1
     a64:	06c48493          	addi	s1,s1,108
     a68:	e2dff06f          	j	894 <main+0x1e0>
     a6c:	00000593          	li	a1,0
     a70:	0ff00513          	li	a0,255
     a74:	f9dff06f          	j	a10 <main+0x35c>
     a78:	00012503          	lw	a0,0(sp)
     a7c:	fadff06f          	j	a28 <main+0x374>
     a80:	02000513          	li	a0,32
     a84:	000780e7          	jalr	a5
     a88:	001c8c93          	addi	s9,s9,1
     a8c:	fc5ff06f          	j	a50 <main+0x39c>
     a90:	00150513          	addi	a0,a0,1
     a94:	ef9ff06f          	j	98c <main+0x2d8>
     a98:	000055b7          	lui	a1,0x5
     a9c:	ebc58593          	addi	a1,a1,-324 # 4ebc <LEDS+0x38>
     aa0:	000a8513          	mv	a0,s5
     aa4:	00001097          	auipc	ra,0x1
     aa8:	840080e7          	jalr	-1984(ra) # 12e4 <strcpy>
     aac:	f11ff06f          	j	9bc <main+0x308>
     ab0:	00170713          	addi	a4,a4,1
     ab4:	00ea87b3          	add	a5,s5,a4
     ab8:	0007c683          	lbu	a3,0(a5)
     abc:	fe069ae3          	bnez	a3,ab0 <main+0x3fc>
     ac0:	00d48633          	add	a2,s1,a3
     ac4:	00064603          	lbu	a2,0(a2)
     ac8:	02061463          	bnez	a2,af0 <main+0x43c>
     acc:	00d70733          	add	a4,a4,a3
     ad0:	1f100693          	li	a3,497
     ad4:	eee6c4e3          	blt	a3,a4,9bc <main+0x308>
     ad8:	0004c703          	lbu	a4,0(s1)
     adc:	00071e63          	bnez	a4,af8 <main+0x444>
     ae0:	02f00713          	li	a4,47
     ae4:	00e78023          	sb	a4,0(a5)
     ae8:	000780a3          	sb	zero,1(a5)
     aec:	ed1ff06f          	j	9bc <main+0x308>
     af0:	00168693          	addi	a3,a3,1
     af4:	fcdff06f          	j	ac0 <main+0x40c>
     af8:	00178793          	addi	a5,a5,1
     afc:	00148493          	addi	s1,s1,1
     b00:	fee78fa3          	sb	a4,-1(a5)
     b04:	fd5ff06f          	j	ad8 <main+0x424>
     b08:	000a8593          	mv	a1,s5
     b0c:	01c10513          	addi	a0,sp,28
     b10:	00000097          	auipc	ra,0x0
     b14:	7d4080e7          	jalr	2004(ra) # 12e4 <strcpy>
     b18:	01c10793          	addi	a5,sp,28
     b1c:	0007c703          	lbu	a4,0(a5)
     b20:	04071063          	bnez	a4,b60 <main+0x4ac>
     b24:	0004c703          	lbu	a4,0(s1)
     b28:	04071063          	bnez	a4,b68 <main+0x4b4>
     b2c:	408989b3          	sub	s3,s3,s0
     b30:	00299993          	slli	s3,s3,0x2
     b34:	408989b3          	sub	s3,s3,s0
     b38:	00299993          	slli	s3,s3,0x2
     b3c:	013b8bb3          	add	s7,s7,s3
     b40:	064ba703          	lw	a4,100(s7)
     b44:	00078023          	sb	zero,0(a5)
     b48:	000047b7          	lui	a5,0x4
     b4c:	01c10513          	addi	a0,sp,28
     b50:	02f71463          	bne	a4,a5,b78 <main+0x4c4>
     b54:	fffff097          	auipc	ra,0xfffff
     b58:	688080e7          	jalr	1672(ra) # 1dc <view_image_file>
     b5c:	e7dff06f          	j	9d8 <main+0x324>
     b60:	00178793          	addi	a5,a5,1 # 4001 <fatfs_fat_add_cluster_to_chain+0x21>
     b64:	fb9ff06f          	j	b1c <main+0x468>
     b68:	00178793          	addi	a5,a5,1
     b6c:	00148493          	addi	s1,s1,1
     b70:	fee78fa3          	sb	a4,-1(a5)
     b74:	fb1ff06f          	j	b24 <main+0x470>
     b78:	fffff097          	auipc	ra,0xfffff
     b7c:	708080e7          	jalr	1800(ra) # 280 <play_music_file>
     b80:	e59ff06f          	j	9d8 <main+0x324>
     b84:	00f427b3          	slt	a5,s0,a5
     b88:	40f007b3          	neg	a5,a5
     b8c:	00f47433          	and	s0,s0,a5
     b90:	e5dff06f          	j	9ec <main+0x338>

00000b94 <pause>:
     b94:	c0002773          	rdcycle	a4
     b98:	c00027f3          	rdcycle	a5
     b9c:	40e787b3          	sub	a5,a5,a4
     ba0:	fea7ece3          	bltu	a5,a0,b98 <pause+0x4>
     ba4:	00008067          	ret

00000ba8 <sdcard_idle>:
     ba8:	00008067          	ret

00000bac <sdcard_select>:
     bac:	000057b7          	lui	a5,0x5
     bb0:	e787a783          	lw	a5,-392(a5) # 4e78 <SDCARD>
     bb4:	00200713          	li	a4,2
     bb8:	00e7a023          	sw	a4,0(a5)
     bbc:	00008067          	ret

00000bc0 <sdcard_ponder>:
     bc0:	000056b7          	lui	a3,0x5
     bc4:	e786a683          	lw	a3,-392(a3) # 4e78 <SDCARD>
     bc8:	01000793          	li	a5,16
     bcc:	00000713          	li	a4,0
     bd0:	00676613          	ori	a2,a4,6
     bd4:	00c6a023          	sw	a2,0(a3)
     bd8:	00174713          	xori	a4,a4,1
     bdc:	00000013          	nop
     be0:	fff78793          	addi	a5,a5,-1
     be4:	fe0796e3          	bnez	a5,bd0 <sdcard_ponder+0x10>
     be8:	00008067          	ret

00000bec <sdcard_unselect>:
     bec:	000057b7          	lui	a5,0x5
     bf0:	e787a783          	lw	a5,-392(a5) # 4e78 <SDCARD>
     bf4:	00600713          	li	a4,6
     bf8:	00e7a023          	sw	a4,0(a5)
     bfc:	00008067          	ret

00000c00 <sdcard_send>:
     c00:	000057b7          	lui	a5,0x5
     c04:	e787a783          	lw	a5,-392(a5) # 4e78 <SDCARD>
     c08:	00655713          	srli	a4,a0,0x6
     c0c:	00277713          	andi	a4,a4,2
     c10:	00e7a023          	sw	a4,0(a5)
     c14:	00176713          	ori	a4,a4,1
     c18:	00e7a023          	sw	a4,0(a5)
     c1c:	00555713          	srli	a4,a0,0x5
     c20:	00277713          	andi	a4,a4,2
     c24:	00e7a023          	sw	a4,0(a5)
     c28:	00176713          	ori	a4,a4,1
     c2c:	00e7a023          	sw	a4,0(a5)
     c30:	00455713          	srli	a4,a0,0x4
     c34:	00277713          	andi	a4,a4,2
     c38:	00e7a023          	sw	a4,0(a5)
     c3c:	00176713          	ori	a4,a4,1
     c40:	00e7a023          	sw	a4,0(a5)
     c44:	00355713          	srli	a4,a0,0x3
     c48:	00277713          	andi	a4,a4,2
     c4c:	00e7a023          	sw	a4,0(a5)
     c50:	00176713          	ori	a4,a4,1
     c54:	00e7a023          	sw	a4,0(a5)
     c58:	00255713          	srli	a4,a0,0x2
     c5c:	00277713          	andi	a4,a4,2
     c60:	00e7a023          	sw	a4,0(a5)
     c64:	00176713          	ori	a4,a4,1
     c68:	00e7a023          	sw	a4,0(a5)
     c6c:	00155713          	srli	a4,a0,0x1
     c70:	00277713          	andi	a4,a4,2
     c74:	00e7a023          	sw	a4,0(a5)
     c78:	00176713          	ori	a4,a4,1
     c7c:	00e7a023          	sw	a4,0(a5)
     c80:	00257713          	andi	a4,a0,2
     c84:	00e7a023          	sw	a4,0(a5)
     c88:	00151513          	slli	a0,a0,0x1
     c8c:	00176713          	ori	a4,a4,1
     c90:	00e7a023          	sw	a4,0(a5)
     c94:	00257513          	andi	a0,a0,2
     c98:	00a7a023          	sw	a0,0(a5)
     c9c:	00156513          	ori	a0,a0,1
     ca0:	00a7a023          	sw	a0,0(a5)
     ca4:	00200713          	li	a4,2
     ca8:	00e7a023          	sw	a4,0(a5)
     cac:	000057b7          	lui	a5,0x5
     cb0:	3747a783          	lw	a5,884(a5) # 5374 <sdcard_while_loading_callback>
     cb4:	00078067          	jr	a5

00000cb8 <sdcard_read>:
     cb8:	fd010113          	addi	sp,sp,-48
     cbc:	fff50793          	addi	a5,a0,-1
     cc0:	03212023          	sw	s2,32(sp)
     cc4:	00100913          	li	s2,1
     cc8:	00f91933          	sll	s2,s2,a5
     ccc:	000057b7          	lui	a5,0x5
     cd0:	01312e23          	sw	s3,28(sp)
     cd4:	e787a983          	lw	s3,-392(a5) # 4e78 <SDCARD>
     cd8:	02812423          	sw	s0,40(sp)
     cdc:	02912223          	sw	s1,36(sp)
     ce0:	01412c23          	sw	s4,24(sp)
     ce4:	01512a23          	sw	s5,20(sp)
     ce8:	01612823          	sw	s6,16(sp)
     cec:	02112623          	sw	ra,44(sp)
     cf0:	0ff00413          	li	s0,255
     cf4:	00000493          	li	s1,0
     cf8:	00300a13          	li	s4,3
     cfc:	00200a93          	li	s5,2
     d00:	00005b37          	lui	s6,0x5
     d04:	02058c63          	beqz	a1,d3c <sdcard_read+0x84>
     d08:	012477b3          	and	a5,s0,s2
     d0c:	02079a63          	bnez	a5,d40 <sdcard_read+0x88>
     d10:	02c12083          	lw	ra,44(sp)
     d14:	0ff47513          	zext.b	a0,s0
     d18:	02812403          	lw	s0,40(sp)
     d1c:	02412483          	lw	s1,36(sp)
     d20:	02012903          	lw	s2,32(sp)
     d24:	01c12983          	lw	s3,28(sp)
     d28:	01812a03          	lw	s4,24(sp)
     d2c:	01412a83          	lw	s5,20(sp)
     d30:	01012b03          	lw	s6,16(sp)
     d34:	03010113          	addi	sp,sp,48
     d38:	00008067          	ret
     d3c:	fca4dae3          	bge	s1,a0,d10 <sdcard_read+0x58>
     d40:	0149a023          	sw	s4,0(s3)
     d44:	0159a023          	sw	s5,0(s3)
     d48:	0009a783          	lw	a5,0(s3)
     d4c:	00141413          	slli	s0,s0,0x1
     d50:	00b12623          	sw	a1,12(sp)
     d54:	00f46433          	or	s0,s0,a5
     d58:	374b2783          	lw	a5,884(s6) # 5374 <sdcard_while_loading_callback>
     d5c:	00a12423          	sw	a0,8(sp)
     d60:	00148493          	addi	s1,s1,1
     d64:	000780e7          	jalr	a5
     d68:	00c12583          	lw	a1,12(sp)
     d6c:	00812503          	lw	a0,8(sp)
     d70:	f95ff06f          	j	d04 <sdcard_read+0x4c>

00000d74 <sdcard_get>:
     d74:	fe010113          	addi	sp,sp,-32
     d78:	00112e23          	sw	ra,28(sp)
     d7c:	00812c23          	sw	s0,24(sp)
     d80:	00912a23          	sw	s1,20(sp)
     d84:	00050413          	mv	s0,a0
     d88:	00b12623          	sw	a1,12(sp)
     d8c:	00000097          	auipc	ra,0x0
     d90:	e20080e7          	jalr	-480(ra) # bac <sdcard_select>
     d94:	00c12583          	lw	a1,12(sp)
     d98:	00040513          	mv	a0,s0
     d9c:	00100493          	li	s1,1
     da0:	00000097          	auipc	ra,0x0
     da4:	f18080e7          	jalr	-232(ra) # cb8 <sdcard_read>
     da8:	00345413          	srli	s0,s0,0x3
     dac:	0284c463          	blt	s1,s0,dd4 <sdcard_get+0x60>
     db0:	00a12623          	sw	a0,12(sp)
     db4:	00000097          	auipc	ra,0x0
     db8:	e38080e7          	jalr	-456(ra) # bec <sdcard_unselect>
     dbc:	01c12083          	lw	ra,28(sp)
     dc0:	01812403          	lw	s0,24(sp)
     dc4:	00c12503          	lw	a0,12(sp)
     dc8:	01412483          	lw	s1,20(sp)
     dcc:	02010113          	addi	sp,sp,32
     dd0:	00008067          	ret
     dd4:	00000593          	li	a1,0
     dd8:	00800513          	li	a0,8
     ddc:	00000097          	auipc	ra,0x0
     de0:	edc080e7          	jalr	-292(ra) # cb8 <sdcard_read>
     de4:	00148493          	addi	s1,s1,1
     de8:	fc5ff06f          	j	dac <sdcard_get+0x38>

00000dec <sdcard_cmd>:
     dec:	ff010113          	addi	sp,sp,-16
     df0:	00812423          	sw	s0,8(sp)
     df4:	00912223          	sw	s1,4(sp)
     df8:	01212023          	sw	s2,0(sp)
     dfc:	00112623          	sw	ra,12(sp)
     e00:	00050913          	mv	s2,a0
     e04:	00000413          	li	s0,0
     e08:	00000097          	auipc	ra,0x0
     e0c:	da4080e7          	jalr	-604(ra) # bac <sdcard_select>
     e10:	00600493          	li	s1,6
     e14:	008907b3          	add	a5,s2,s0
     e18:	0007c503          	lbu	a0,0(a5)
     e1c:	00140413          	addi	s0,s0,1
     e20:	00000097          	auipc	ra,0x0
     e24:	de0080e7          	jalr	-544(ra) # c00 <sdcard_send>
     e28:	fe9416e3          	bne	s0,s1,e14 <sdcard_cmd+0x28>
     e2c:	00812403          	lw	s0,8(sp)
     e30:	00c12083          	lw	ra,12(sp)
     e34:	00412483          	lw	s1,4(sp)
     e38:	00012903          	lw	s2,0(sp)
     e3c:	01010113          	addi	sp,sp,16
     e40:	00000317          	auipc	t1,0x0
     e44:	dac30067          	jr	-596(t1) # bec <sdcard_unselect>

00000e48 <sdcard_start_sector>:
     e48:	ff010113          	addi	sp,sp,-16
     e4c:	00112623          	sw	ra,12(sp)
     e50:	00812423          	sw	s0,8(sp)
     e54:	00050413          	mv	s0,a0
     e58:	00000097          	auipc	ra,0x0
     e5c:	d54080e7          	jalr	-684(ra) # bac <sdcard_select>
     e60:	05100513          	li	a0,81
     e64:	00000097          	auipc	ra,0x0
     e68:	d9c080e7          	jalr	-612(ra) # c00 <sdcard_send>
     e6c:	01845513          	srli	a0,s0,0x18
     e70:	00000097          	auipc	ra,0x0
     e74:	d90080e7          	jalr	-624(ra) # c00 <sdcard_send>
     e78:	41045513          	srai	a0,s0,0x10
     e7c:	0ff57513          	zext.b	a0,a0
     e80:	00000097          	auipc	ra,0x0
     e84:	d80080e7          	jalr	-640(ra) # c00 <sdcard_send>
     e88:	40845513          	srai	a0,s0,0x8
     e8c:	0ff57513          	zext.b	a0,a0
     e90:	00000097          	auipc	ra,0x0
     e94:	d70080e7          	jalr	-656(ra) # c00 <sdcard_send>
     e98:	0ff47513          	zext.b	a0,s0
     e9c:	00000097          	auipc	ra,0x0
     ea0:	d64080e7          	jalr	-668(ra) # c00 <sdcard_send>
     ea4:	05500513          	li	a0,85
     ea8:	00000097          	auipc	ra,0x0
     eac:	d58080e7          	jalr	-680(ra) # c00 <sdcard_send>
     eb0:	00000097          	auipc	ra,0x0
     eb4:	d3c080e7          	jalr	-708(ra) # bec <sdcard_unselect>
     eb8:	00812403          	lw	s0,8(sp)
     ebc:	00c12083          	lw	ra,12(sp)
     ec0:	00100593          	li	a1,1
     ec4:	00800513          	li	a0,8
     ec8:	01010113          	addi	sp,sp,16
     ecc:	00000317          	auipc	t1,0x0
     ed0:	ea830067          	jr	-344(t1) # d74 <sdcard_get>

00000ed4 <sdcard_read_sector>:
     ed4:	ff010113          	addi	sp,sp,-16
     ed8:	00812423          	sw	s0,8(sp)
     edc:	00112623          	sw	ra,12(sp)
     ee0:	00912223          	sw	s1,4(sp)
     ee4:	01212023          	sw	s2,0(sp)
     ee8:	00058413          	mv	s0,a1
     eec:	00000097          	auipc	ra,0x0
     ef0:	f5c080e7          	jalr	-164(ra) # e48 <sdcard_start_sector>
     ef4:	04051863          	bnez	a0,f44 <sdcard_read_sector+0x70>
     ef8:	00100593          	li	a1,1
     efc:	00058513          	mv	a0,a1
     f00:	00000097          	auipc	ra,0x0
     f04:	e74080e7          	jalr	-396(ra) # d74 <sdcard_get>
     f08:	00000493          	li	s1,0
     f0c:	20000913          	li	s2,512
     f10:	00000593          	li	a1,0
     f14:	00800513          	li	a0,8
     f18:	00000097          	auipc	ra,0x0
     f1c:	e5c080e7          	jalr	-420(ra) # d74 <sdcard_get>
     f20:	009407b3          	add	a5,s0,s1
     f24:	00a78023          	sb	a0,0(a5)
     f28:	00148493          	addi	s1,s1,1
     f2c:	ff2492e3          	bne	s1,s2,f10 <sdcard_read_sector+0x3c>
     f30:	00100593          	li	a1,1
     f34:	01000513          	li	a0,16
     f38:	20040413          	addi	s0,s0,512
     f3c:	00000097          	auipc	ra,0x0
     f40:	e38080e7          	jalr	-456(ra) # d74 <sdcard_get>
     f44:	00c12083          	lw	ra,12(sp)
     f48:	00040513          	mv	a0,s0
     f4c:	00812403          	lw	s0,8(sp)
     f50:	00412483          	lw	s1,4(sp)
     f54:	00012903          	lw	s2,0(sp)
     f58:	01010113          	addi	sp,sp,16
     f5c:	00008067          	ret

00000f60 <sdcard_preinit>:
     f60:	ff010113          	addi	sp,sp,-16
     f64:	000057b7          	lui	a5,0x5
     f68:	00812423          	sw	s0,8(sp)
     f6c:	e787a403          	lw	s0,-392(a5) # 4e78 <SDCARD>
     f70:	00112623          	sw	ra,12(sp)
     f74:	00600793          	li	a5,6
     f78:	01313537          	lui	a0,0x1313
     f7c:	00f42023          	sw	a5,0(s0)
     f80:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
     f84:	00000097          	auipc	ra,0x0
     f88:	c10080e7          	jalr	-1008(ra) # b94 <pause>
     f8c:	0a000793          	li	a5,160
     f90:	00000713          	li	a4,0
     f94:	00676693          	ori	a3,a4,6
     f98:	00d42023          	sw	a3,0(s0)
     f9c:	fff78793          	addi	a5,a5,-1
     fa0:	00174713          	xori	a4,a4,1
     fa4:	fe0798e3          	bnez	a5,f94 <sdcard_preinit+0x34>
     fa8:	00600793          	li	a5,6
     fac:	00c12083          	lw	ra,12(sp)
     fb0:	00f42023          	sw	a5,0(s0)
     fb4:	00812403          	lw	s0,8(sp)
     fb8:	01010113          	addi	sp,sp,16
     fbc:	00008067          	ret

00000fc0 <sdcard_init>:
     fc0:	000017b7          	lui	a5,0x1
     fc4:	ba878793          	addi	a5,a5,-1112 # ba8 <sdcard_idle>
     fc8:	00005737          	lui	a4,0x5
     fcc:	fe010113          	addi	sp,sp,-32
     fd0:	36f72a23          	sw	a5,884(a4) # 5374 <sdcard_while_loading_callback>
     fd4:	000057b7          	lui	a5,0x5
     fd8:	00812c23          	sw	s0,24(sp)
     fdc:	00912a23          	sw	s1,20(sp)
     fe0:	00112e23          	sw	ra,28(sp)
     fe4:	e6878493          	addi	s1,a5,-408 # 4e68 <cmd0>
     fe8:	0ff00413          	li	s0,255
     fec:	00000097          	auipc	ra,0x0
     ff0:	f74080e7          	jalr	-140(ra) # f60 <sdcard_preinit>
     ff4:	00048513          	mv	a0,s1
     ff8:	00000097          	auipc	ra,0x0
     ffc:	df4080e7          	jalr	-524(ra) # dec <sdcard_cmd>
    1000:	00100593          	li	a1,1
    1004:	00800513          	li	a0,8
    1008:	00000097          	auipc	ra,0x0
    100c:	d6c080e7          	jalr	-660(ra) # d74 <sdcard_get>
    1010:	00a12623          	sw	a0,12(sp)
    1014:	00000097          	auipc	ra,0x0
    1018:	bac080e7          	jalr	-1108(ra) # bc0 <sdcard_ponder>
    101c:	00c12503          	lw	a0,12(sp)
    1020:	00851c63          	bne	a0,s0,1038 <sdcard_init+0x78>
    1024:	01313537          	lui	a0,0x1313
    1028:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
    102c:	00000097          	auipc	ra,0x0
    1030:	b68080e7          	jalr	-1176(ra) # b94 <pause>
    1034:	fb9ff06f          	j	fec <sdcard_init+0x2c>
    1038:	00005537          	lui	a0,0x5
    103c:	e6050513          	addi	a0,a0,-416 # 4e60 <cmd8>
    1040:	00000097          	auipc	ra,0x0
    1044:	dac080e7          	jalr	-596(ra) # dec <sdcard_cmd>
    1048:	00100593          	li	a1,1
    104c:	02800513          	li	a0,40
    1050:	00000097          	auipc	ra,0x0
    1054:	d24080e7          	jalr	-732(ra) # d74 <sdcard_get>
    1058:	00000097          	auipc	ra,0x0
    105c:	b68080e7          	jalr	-1176(ra) # bc0 <sdcard_ponder>
    1060:	000057b7          	lui	a5,0x5
    1064:	e5878413          	addi	s0,a5,-424 # 4e58 <cmd55>
    1068:	000057b7          	lui	a5,0x5
    106c:	e5078493          	addi	s1,a5,-432 # 4e50 <acmd41>
    1070:	00040513          	mv	a0,s0
    1074:	00000097          	auipc	ra,0x0
    1078:	d78080e7          	jalr	-648(ra) # dec <sdcard_cmd>
    107c:	00100593          	li	a1,1
    1080:	00800513          	li	a0,8
    1084:	00000097          	auipc	ra,0x0
    1088:	cf0080e7          	jalr	-784(ra) # d74 <sdcard_get>
    108c:	00000097          	auipc	ra,0x0
    1090:	b34080e7          	jalr	-1228(ra) # bc0 <sdcard_ponder>
    1094:	00048513          	mv	a0,s1
    1098:	00000097          	auipc	ra,0x0
    109c:	d54080e7          	jalr	-684(ra) # dec <sdcard_cmd>
    10a0:	00100593          	li	a1,1
    10a4:	00800513          	li	a0,8
    10a8:	00000097          	auipc	ra,0x0
    10ac:	ccc080e7          	jalr	-820(ra) # d74 <sdcard_get>
    10b0:	00a12623          	sw	a0,12(sp)
    10b4:	00000097          	auipc	ra,0x0
    10b8:	b0c080e7          	jalr	-1268(ra) # bc0 <sdcard_ponder>
    10bc:	00c12503          	lw	a0,12(sp)
    10c0:	00050c63          	beqz	a0,10d8 <sdcard_init+0x118>
    10c4:	001e8537          	lui	a0,0x1e8
    10c8:	48050513          	addi	a0,a0,1152 # 1e8480 <__stacktop+0x1d8480>
    10cc:	00000097          	auipc	ra,0x0
    10d0:	ac8080e7          	jalr	-1336(ra) # b94 <pause>
    10d4:	f9dff06f          	j	1070 <sdcard_init+0xb0>
    10d8:	00005537          	lui	a0,0x5
    10dc:	e4850513          	addi	a0,a0,-440 # 4e48 <cmd16>
    10e0:	00000097          	auipc	ra,0x0
    10e4:	d0c080e7          	jalr	-756(ra) # dec <sdcard_cmd>
    10e8:	00100593          	li	a1,1
    10ec:	00800513          	li	a0,8
    10f0:	00000097          	auipc	ra,0x0
    10f4:	c84080e7          	jalr	-892(ra) # d74 <sdcard_get>
    10f8:	01812403          	lw	s0,24(sp)
    10fc:	01c12083          	lw	ra,28(sp)
    1100:	01412483          	lw	s1,20(sp)
    1104:	02010113          	addi	sp,sp,32
    1108:	00000317          	auipc	t1,0x0
    110c:	ab830067          	jr	-1352(t1) # bc0 <sdcard_ponder>

00001110 <sdcard_readsector>:
    1110:	04060663          	beqz	a2,115c <sdcard_readsector+0x4c>
    1114:	ff010113          	addi	sp,sp,-16
    1118:	00812423          	sw	s0,8(sp)
    111c:	00912223          	sw	s1,4(sp)
    1120:	00112623          	sw	ra,12(sp)
    1124:	00050413          	mv	s0,a0
    1128:	00a604b3          	add	s1,a2,a0
    112c:	00040513          	mv	a0,s0
    1130:	00000097          	auipc	ra,0x0
    1134:	da4080e7          	jalr	-604(ra) # ed4 <sdcard_read_sector>
    1138:	00140413          	addi	s0,s0,1
    113c:	00050593          	mv	a1,a0
    1140:	fe9416e3          	bne	s0,s1,112c <sdcard_readsector+0x1c>
    1144:	00c12083          	lw	ra,12(sp)
    1148:	00812403          	lw	s0,8(sp)
    114c:	00412483          	lw	s1,4(sp)
    1150:	00100513          	li	a0,1
    1154:	01010113          	addi	sp,sp,16
    1158:	00008067          	ret
    115c:	00000513          	li	a0,0
    1160:	00008067          	ret

00001164 <sdcard_writesector>:
    1164:	00000513          	li	a0,0
    1168:	00008067          	ret

0000116c <__divsi3>:
    116c:	06054063          	bltz	a0,11cc <__umodsi3+0x10>
    1170:	0605c663          	bltz	a1,11dc <__umodsi3+0x20>

00001174 <__udivsi3>:
    1174:	00058613          	mv	a2,a1
    1178:	00050593          	mv	a1,a0
    117c:	fff00513          	li	a0,-1
    1180:	02060c63          	beqz	a2,11b8 <__udivsi3+0x44>
    1184:	00100693          	li	a3,1
    1188:	00b67a63          	bgeu	a2,a1,119c <__udivsi3+0x28>
    118c:	00c05863          	blez	a2,119c <__udivsi3+0x28>
    1190:	00161613          	slli	a2,a2,0x1
    1194:	00169693          	slli	a3,a3,0x1
    1198:	feb66ae3          	bltu	a2,a1,118c <__udivsi3+0x18>
    119c:	00000513          	li	a0,0
    11a0:	00c5e663          	bltu	a1,a2,11ac <__udivsi3+0x38>
    11a4:	40c585b3          	sub	a1,a1,a2
    11a8:	00d56533          	or	a0,a0,a3
    11ac:	0016d693          	srli	a3,a3,0x1
    11b0:	00165613          	srli	a2,a2,0x1
    11b4:	fe0696e3          	bnez	a3,11a0 <__udivsi3+0x2c>
    11b8:	00008067          	ret

000011bc <__umodsi3>:
    11bc:	00008293          	mv	t0,ra
    11c0:	fb5ff0ef          	jal	1174 <__udivsi3>
    11c4:	00058513          	mv	a0,a1
    11c8:	00028067          	jr	t0
    11cc:	40a00533          	neg	a0,a0
    11d0:	0005d863          	bgez	a1,11e0 <__umodsi3+0x24>
    11d4:	40b005b3          	neg	a1,a1
    11d8:	f95ff06f          	j	116c <__divsi3>
    11dc:	40b005b3          	neg	a1,a1
    11e0:	00008293          	mv	t0,ra
    11e4:	f89ff0ef          	jal	116c <__divsi3>
    11e8:	40a00533          	neg	a0,a0
    11ec:	00028067          	jr	t0

000011f0 <__modsi3>:
    11f0:	00008293          	mv	t0,ra
    11f4:	0005ca63          	bltz	a1,1208 <__modsi3+0x18>
    11f8:	00054c63          	bltz	a0,1210 <__modsi3+0x20>
    11fc:	f79ff0ef          	jal	1174 <__udivsi3>
    1200:	00058513          	mv	a0,a1
    1204:	00028067          	jr	t0
    1208:	40b005b3          	neg	a1,a1
    120c:	fe0558e3          	bgez	a0,11fc <__modsi3+0xc>
    1210:	40a00533          	neg	a0,a0
    1214:	f61ff0ef          	jal	1174 <__udivsi3>
    1218:	40b00533          	neg	a0,a1
    121c:	00028067          	jr	t0

00001220 <memset>:
    1220:	00c50633          	add	a2,a0,a2
    1224:	00050793          	mv	a5,a0
    1228:	00c79463          	bne	a5,a2,1230 <memset+0x10>
    122c:	00008067          	ret
    1230:	00178793          	addi	a5,a5,1
    1234:	feb78fa3          	sb	a1,-1(a5)
    1238:	ff1ff06f          	j	1228 <memset+0x8>

0000123c <memcpy>:
    123c:	00000793          	li	a5,0
    1240:	00c79463          	bne	a5,a2,1248 <memcpy+0xc>
    1244:	00008067          	ret
    1248:	00f58733          	add	a4,a1,a5
    124c:	00074683          	lbu	a3,0(a4)
    1250:	00f50733          	add	a4,a0,a5
    1254:	00178793          	addi	a5,a5,1
    1258:	00d70023          	sb	a3,0(a4)
    125c:	fe5ff06f          	j	1240 <memcpy+0x4>

00001260 <strlen>:
    1260:	00000793          	li	a5,0
    1264:	00f50733          	add	a4,a0,a5
    1268:	00074703          	lbu	a4,0(a4)
    126c:	00071663          	bnez	a4,1278 <strlen+0x18>
    1270:	00078513          	mv	a0,a5
    1274:	00008067          	ret
    1278:	00178793          	addi	a5,a5,1
    127c:	fe9ff06f          	j	1264 <strlen+0x4>

00001280 <strncmp>:
    1280:	00000793          	li	a5,0
    1284:	00c79663          	bne	a5,a2,1290 <strncmp+0x10>
    1288:	00000513          	li	a0,0
    128c:	00008067          	ret
    1290:	00f50733          	add	a4,a0,a5
    1294:	00074683          	lbu	a3,0(a4)
    1298:	00f58733          	add	a4,a1,a5
    129c:	00074703          	lbu	a4,0(a4)
    12a0:	00e6e863          	bltu	a3,a4,12b0 <strncmp+0x30>
    12a4:	00d76a63          	bltu	a4,a3,12b8 <strncmp+0x38>
    12a8:	00178793          	addi	a5,a5,1
    12ac:	fd9ff06f          	j	1284 <strncmp+0x4>
    12b0:	fff00513          	li	a0,-1
    12b4:	00008067          	ret
    12b8:	00100513          	li	a0,1
    12bc:	00008067          	ret

000012c0 <strncpy>:
    12c0:	00000793          	li	a5,0
    12c4:	00c79463          	bne	a5,a2,12cc <strncpy+0xc>
    12c8:	00008067          	ret
    12cc:	00f58733          	add	a4,a1,a5
    12d0:	00074683          	lbu	a3,0(a4)
    12d4:	00f50733          	add	a4,a0,a5
    12d8:	00178793          	addi	a5,a5,1
    12dc:	00d70023          	sb	a3,0(a4)
    12e0:	fe5ff06f          	j	12c4 <strncpy+0x4>

000012e4 <strcpy>:
    12e4:	0005c783          	lbu	a5,0(a1)
    12e8:	00079663          	bnez	a5,12f4 <strcpy+0x10>
    12ec:	00050023          	sb	zero,0(a0)
    12f0:	00008067          	ret
    12f4:	00150513          	addi	a0,a0,1
    12f8:	00158593          	addi	a1,a1,1
    12fc:	fef50fa3          	sb	a5,-1(a0)
    1300:	fe5ff06f          	j	12e4 <strcpy>

00001304 <oled_wait>:
    1304:	00000013          	nop
    1308:	00000013          	nop
    130c:	00000013          	nop
    1310:	00000013          	nop
    1314:	00000013          	nop
    1318:	00000013          	nop
    131c:	00000013          	nop
    1320:	00008067          	ret

00001324 <oled_init_mode>:
    1324:	000057b7          	lui	a5,0x5
    1328:	e7c7a703          	lw	a4,-388(a5) # 4e7c <OLED_RST>
    132c:	fe010113          	addi	sp,sp,-32
    1330:	00112e23          	sw	ra,28(sp)
    1334:	00812c23          	sw	s0,24(sp)
    1338:	00072023          	sw	zero,0(a4)
    133c:	00040737          	lui	a4,0x40
    1340:	00000013          	nop
    1344:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
    1348:	fe071ce3          	bnez	a4,1340 <oled_init_mode+0x1c>
    134c:	e7c7a703          	lw	a4,-388(a5)
    1350:	00100693          	li	a3,1
    1354:	00d72023          	sw	a3,0(a4)
    1358:	00040737          	lui	a4,0x40
    135c:	00000013          	nop
    1360:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
    1364:	fe071ce3          	bnez	a4,135c <oled_init_mode+0x38>
    1368:	e7c7a783          	lw	a5,-388(a5)
    136c:	0007a023          	sw	zero,0(a5)
    1370:	000407b7          	lui	a5,0x40
    1374:	00000013          	nop
    1378:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
    137c:	fe079ce3          	bnez	a5,1374 <oled_init_mode+0x50>
    1380:	00005737          	lui	a4,0x5
    1384:	e8072783          	lw	a5,-384(a4) # 4e80 <OLED>
    1388:	2af00693          	li	a3,687
    138c:	00d7a023          	sw	a3,0(a5)
    1390:	000407b7          	lui	a5,0x40
    1394:	00000013          	nop
    1398:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
    139c:	fe079ce3          	bnez	a5,1394 <oled_init_mode+0x70>
    13a0:	e8072403          	lw	s0,-384(a4)
    13a4:	2a000793          	li	a5,672
    13a8:	00a12623          	sw	a0,12(sp)
    13ac:	00f42023          	sw	a5,0(s0)
    13b0:	00000097          	auipc	ra,0x0
    13b4:	f54080e7          	jalr	-172(ra) # 1304 <oled_wait>
    13b8:	00c12503          	lw	a0,12(sp)
    13bc:	4a000793          	li	a5,1184
    13c0:	00050463          	beqz	a0,13c8 <oled_init_mode+0xa4>
    13c4:	42000793          	li	a5,1056
    13c8:	00f42023          	sw	a5,0(s0)
    13cc:	00000097          	auipc	ra,0x0
    13d0:	f38080e7          	jalr	-200(ra) # 1304 <oled_wait>
    13d4:	2fd00793          	li	a5,765
    13d8:	00f42023          	sw	a5,0(s0)
    13dc:	00000097          	auipc	ra,0x0
    13e0:	f28080e7          	jalr	-216(ra) # 1304 <oled_wait>
    13e4:	4b100793          	li	a5,1201
    13e8:	00f42023          	sw	a5,0(s0)
    13ec:	00000097          	auipc	ra,0x0
    13f0:	f18080e7          	jalr	-232(ra) # 1304 <oled_wait>
    13f4:	2a200793          	li	a5,674
    13f8:	00f42023          	sw	a5,0(s0)
    13fc:	00000097          	auipc	ra,0x0
    1400:	f08080e7          	jalr	-248(ra) # 1304 <oled_wait>
    1404:	40000793          	li	a5,1024
    1408:	00f42023          	sw	a5,0(s0)
    140c:	01812403          	lw	s0,24(sp)
    1410:	01c12083          	lw	ra,28(sp)
    1414:	02010113          	addi	sp,sp,32
    1418:	00000317          	auipc	t1,0x0
    141c:	eec30067          	jr	-276(t1) # 1304 <oled_wait>

00001420 <oled_init>:
    1420:	00000513          	li	a0,0
    1424:	00000317          	auipc	t1,0x0
    1428:	f0030067          	jr	-256(t1) # 1324 <oled_init_mode>

0000142c <oled_fullscreen>:
    142c:	ff010113          	addi	sp,sp,-16
    1430:	000057b7          	lui	a5,0x5
    1434:	00812423          	sw	s0,8(sp)
    1438:	e807a403          	lw	s0,-384(a5) # 4e80 <OLED>
    143c:	00112623          	sw	ra,12(sp)
    1440:	00912223          	sw	s1,4(sp)
    1444:	01212023          	sw	s2,0(sp)
    1448:	21500793          	li	a5,533
    144c:	00f42023          	sw	a5,0(s0)
    1450:	40000913          	li	s2,1024
    1454:	00000097          	auipc	ra,0x0
    1458:	eb0080e7          	jalr	-336(ra) # 1304 <oled_wait>
    145c:	47f00493          	li	s1,1151
    1460:	01242023          	sw	s2,0(s0)
    1464:	00000097          	auipc	ra,0x0
    1468:	ea0080e7          	jalr	-352(ra) # 1304 <oled_wait>
    146c:	00942023          	sw	s1,0(s0)
    1470:	00000097          	auipc	ra,0x0
    1474:	e94080e7          	jalr	-364(ra) # 1304 <oled_wait>
    1478:	27500793          	li	a5,629
    147c:	00f42023          	sw	a5,0(s0)
    1480:	00000097          	auipc	ra,0x0
    1484:	e84080e7          	jalr	-380(ra) # 1304 <oled_wait>
    1488:	01242023          	sw	s2,0(s0)
    148c:	00000097          	auipc	ra,0x0
    1490:	e78080e7          	jalr	-392(ra) # 1304 <oled_wait>
    1494:	00942023          	sw	s1,0(s0)
    1498:	00000097          	auipc	ra,0x0
    149c:	e6c080e7          	jalr	-404(ra) # 1304 <oled_wait>
    14a0:	25c00793          	li	a5,604
    14a4:	00f42023          	sw	a5,0(s0)
    14a8:	00812403          	lw	s0,8(sp)
    14ac:	00c12083          	lw	ra,12(sp)
    14b0:	00412483          	lw	s1,4(sp)
    14b4:	00012903          	lw	s2,0(sp)
    14b8:	01010113          	addi	sp,sp,16
    14bc:	00000317          	auipc	t1,0x0
    14c0:	e4830067          	jr	-440(t1) # 1304 <oled_wait>

000014c4 <oled_clear>:
    14c4:	fe010113          	addi	sp,sp,-32
    14c8:	000057b7          	lui	a5,0x5
    14cc:	01312623          	sw	s3,12(sp)
    14d0:	e807a983          	lw	s3,-384(a5) # 4e80 <OLED>
    14d4:	00812c23          	sw	s0,24(sp)
    14d8:	01212823          	sw	s2,16(sp)
    14dc:	00112e23          	sw	ra,28(sp)
    14e0:	00912a23          	sw	s1,20(sp)
    14e4:	08000913          	li	s2,128
    14e8:	40056413          	ori	s0,a0,1024
    14ec:	08000493          	li	s1,128
    14f0:	0089a023          	sw	s0,0(s3)
    14f4:	00000097          	auipc	ra,0x0
    14f8:	e10080e7          	jalr	-496(ra) # 1304 <oled_wait>
    14fc:	0089a023          	sw	s0,0(s3)
    1500:	00000097          	auipc	ra,0x0
    1504:	e04080e7          	jalr	-508(ra) # 1304 <oled_wait>
    1508:	fff48493          	addi	s1,s1,-1
    150c:	0089a023          	sw	s0,0(s3)
    1510:	00000097          	auipc	ra,0x0
    1514:	df4080e7          	jalr	-524(ra) # 1304 <oled_wait>
    1518:	fc049ce3          	bnez	s1,14f0 <oled_clear+0x2c>
    151c:	fff90913          	addi	s2,s2,-1
    1520:	fc0916e3          	bnez	s2,14ec <oled_clear+0x28>
    1524:	01c12083          	lw	ra,28(sp)
    1528:	01812403          	lw	s0,24(sp)
    152c:	01412483          	lw	s1,20(sp)
    1530:	01012903          	lw	s2,16(sp)
    1534:	00c12983          	lw	s3,12(sp)
    1538:	02010113          	addi	sp,sp,32
    153c:	00008067          	ret

00001540 <oled_wait>:
    1540:	00000013          	nop
    1544:	00000013          	nop
    1548:	00000013          	nop
    154c:	00000013          	nop
    1550:	00000013          	nop
    1554:	00000013          	nop
    1558:	00000013          	nop
    155c:	00008067          	ret

00001560 <display_framebuffer>:
    1560:	00007537          	lui	a0,0x7
    1564:	fbc50513          	addi	a0,a0,-68 # 6fbc <framebuffer>
    1568:	00008067          	ret

0000156c <display_set_cursor>:
    156c:	000057b7          	lui	a5,0x5
    1570:	38a7a023          	sw	a0,896(a5) # 5380 <cursor_x>
    1574:	000057b7          	lui	a5,0x5
    1578:	36b7ae23          	sw	a1,892(a5) # 537c <cursor_y>
    157c:	00008067          	ret

00001580 <display_set_front_back_color>:
    1580:	000057b7          	lui	a5,0x5
    1584:	36a78ca3          	sb	a0,889(a5) # 5379 <front_color>
    1588:	000057b7          	lui	a5,0x5
    158c:	36b78c23          	sb	a1,888(a5) # 5378 <back_color>
    1590:	00008067          	ret

00001594 <display_putchar>:
    1594:	00a00793          	li	a5,10
    1598:	00005737          	lui	a4,0x5
    159c:	02f51663          	bne	a0,a5,15c8 <display_putchar+0x34>
    15a0:	38072023          	sw	zero,896(a4) # 5380 <cursor_x>
    15a4:	00005737          	lui	a4,0x5
    15a8:	37c72783          	lw	a5,892(a4) # 537c <cursor_y>
    15ac:	00878793          	addi	a5,a5,8
    15b0:	36f72e23          	sw	a5,892(a4)
    15b4:	07f00713          	li	a4,127
    15b8:	10f75263          	bge	a4,a5,16bc <display_putchar+0x128>
    15bc:	000057b7          	lui	a5,0x5
    15c0:	3607ae23          	sw	zero,892(a5) # 537c <cursor_y>
    15c4:	00008067          	ret
    15c8:	01f00793          	li	a5,31
    15cc:	0ca7d063          	bge	a5,a0,168c <display_putchar+0xf8>
    15d0:	000057b7          	lui	a5,0x5
    15d4:	37c7a783          	lw	a5,892(a5) # 537c <cursor_y>
    15d8:	07800693          	li	a3,120
    15dc:	00800593          	li	a1,8
    15e0:	00f6d663          	bge	a3,a5,15ec <display_putchar+0x58>
    15e4:	08000593          	li	a1,128
    15e8:	40f585b3          	sub	a1,a1,a5
    15ec:	38072683          	lw	a3,896(a4)
    15f0:	07b00613          	li	a2,123
    15f4:	00500813          	li	a6,5
    15f8:	00d65663          	bge	a2,a3,1604 <display_putchar+0x70>
    15fc:	08000813          	li	a6,128
    1600:	40d80833          	sub	a6,a6,a3
    1604:	00005637          	lui	a2,0x5
    1608:	37864283          	lbu	t0,888(a2) # 5378 <back_color>
    160c:	00005637          	lui	a2,0x5
    1610:	37964383          	lbu	t2,889(a2) # 5379 <front_color>
    1614:	00007637          	lui	a2,0x7
    1618:	fbc60613          	addi	a2,a2,-68 # 6fbc <framebuffer>
    161c:	00c787b3          	add	a5,a5,a2
    1620:	00769693          	slli	a3,a3,0x7
    1624:	00d787b3          	add	a5,a5,a3
    1628:	00005637          	lui	a2,0x5
    162c:	00251693          	slli	a3,a0,0x2
    1630:	f6860613          	addi	a2,a2,-152 # 4f68 <font>
    1634:	00a686b3          	add	a3,a3,a0
    1638:	00c686b3          	add	a3,a3,a2
    163c:	00100f93          	li	t6,1
    1640:	00000613          	li	a2,0
    1644:	04b65463          	bge	a2,a1,168c <display_putchar+0xf8>
    1648:	00cf9f33          	sll	t5,t6,a2
    164c:	00f60333          	add	t1,a2,a5
    1650:	00068893          	mv	a7,a3
    1654:	00000513          	li	a0,0
    1658:	0280006f          	j	1680 <display_putchar+0xec>
    165c:	f608ce03          	lbu	t3,-160(a7)
    1660:	00038e93          	mv	t4,t2
    1664:	01ee7e33          	and	t3,t3,t5
    1668:	000e1463          	bnez	t3,1670 <display_putchar+0xdc>
    166c:	00028e93          	mv	t4,t0
    1670:	01d30023          	sb	t4,0(t1)
    1674:	00150513          	addi	a0,a0,1
    1678:	08030313          	addi	t1,t1,128
    167c:	00188893          	addi	a7,a7,1
    1680:	fd054ee3          	blt	a0,a6,165c <display_putchar+0xc8>
    1684:	00160613          	addi	a2,a2,1
    1688:	fbdff06f          	j	1644 <display_putchar+0xb0>
    168c:	38072783          	lw	a5,896(a4)
    1690:	07f00693          	li	a3,127
    1694:	00578793          	addi	a5,a5,5
    1698:	00f6c663          	blt	a3,a5,16a4 <display_putchar+0x110>
    169c:	38f72023          	sw	a5,896(a4)
    16a0:	00008067          	ret
    16a4:	38072023          	sw	zero,896(a4)
    16a8:	00005737          	lui	a4,0x5
    16ac:	37c72783          	lw	a5,892(a4) # 537c <cursor_y>
    16b0:	00878793          	addi	a5,a5,8
    16b4:	36f72e23          	sw	a5,892(a4)
    16b8:	f0f6c2e3          	blt	a3,a5,15bc <display_putchar+0x28>
    16bc:	00008067          	ret

000016c0 <display_refresh>:
    16c0:	fe010113          	addi	sp,sp,-32
    16c4:	000057b7          	lui	a5,0x5
    16c8:	01212823          	sw	s2,16(sp)
    16cc:	e807a903          	lw	s2,-384(a5) # 4e80 <OLED>
    16d0:	01312623          	sw	s3,12(sp)
    16d4:	000079b7          	lui	s3,0x7
    16d8:	00912a23          	sw	s1,20(sp)
    16dc:	01412423          	sw	s4,8(sp)
    16e0:	00112e23          	sw	ra,28(sp)
    16e4:	00812c23          	sw	s0,24(sp)
    16e8:	00000493          	li	s1,0
    16ec:	fbc98993          	addi	s3,s3,-68 # 6fbc <framebuffer>
    16f0:	00004a37          	lui	s4,0x4
    16f4:	013487b3          	add	a5,s1,s3
    16f8:	0007c403          	lbu	s0,0(a5)
    16fc:	00148493          	addi	s1,s1,1
    1700:	00245413          	srli	s0,s0,0x2
    1704:	40046413          	ori	s0,s0,1024
    1708:	00892023          	sw	s0,0(s2)
    170c:	00000097          	auipc	ra,0x0
    1710:	e34080e7          	jalr	-460(ra) # 1540 <oled_wait>
    1714:	00892023          	sw	s0,0(s2)
    1718:	00000097          	auipc	ra,0x0
    171c:	e28080e7          	jalr	-472(ra) # 1540 <oled_wait>
    1720:	00892023          	sw	s0,0(s2)
    1724:	00000097          	auipc	ra,0x0
    1728:	e1c080e7          	jalr	-484(ra) # 1540 <oled_wait>
    172c:	fd4494e3          	bne	s1,s4,16f4 <display_refresh+0x34>
    1730:	01c12083          	lw	ra,28(sp)
    1734:	01812403          	lw	s0,24(sp)
    1738:	01412483          	lw	s1,20(sp)
    173c:	01012903          	lw	s2,16(sp)
    1740:	00c12983          	lw	s3,12(sp)
    1744:	00812a03          	lw	s4,8(sp)
    1748:	02010113          	addi	sp,sp,32
    174c:	00008067          	ret

00001750 <print_string>:
    1750:	ff010113          	addi	sp,sp,-16
    1754:	00812423          	sw	s0,8(sp)
    1758:	00912223          	sw	s1,4(sp)
    175c:	00112623          	sw	ra,12(sp)
    1760:	00050413          	mv	s0,a0
    1764:	000054b7          	lui	s1,0x5
    1768:	00044503          	lbu	a0,0(s0)
    176c:	00051c63          	bnez	a0,1784 <print_string+0x34>
    1770:	00c12083          	lw	ra,12(sp)
    1774:	00812403          	lw	s0,8(sp)
    1778:	00412483          	lw	s1,4(sp)
    177c:	01010113          	addi	sp,sp,16
    1780:	00008067          	ret
    1784:	3844a783          	lw	a5,900(s1) # 5384 <f_putchar>
    1788:	00140413          	addi	s0,s0,1
    178c:	000780e7          	jalr	a5
    1790:	fd9ff06f          	j	1768 <print_string+0x18>

00001794 <print_dec>:
    1794:	ef010113          	addi	sp,sp,-272
    1798:	10812423          	sw	s0,264(sp)
    179c:	10912223          	sw	s1,260(sp)
    17a0:	10112623          	sw	ra,268(sp)
    17a4:	11212023          	sw	s2,256(sp)
    17a8:	00050413          	mv	s0,a0
    17ac:	000054b7          	lui	s1,0x5
    17b0:	08045063          	bgez	s0,1830 <print_dec+0x9c>
    17b4:	3844a783          	lw	a5,900(s1) # 5384 <f_putchar>
    17b8:	02d00513          	li	a0,45
    17bc:	40800433          	neg	s0,s0
    17c0:	000780e7          	jalr	a5
    17c4:	fedff06f          	j	17b0 <print_dec+0x1c>
    17c8:	00040513          	mv	a0,s0
    17cc:	00a00593          	li	a1,10
    17d0:	00000097          	auipc	ra,0x0
    17d4:	99c080e7          	jalr	-1636(ra) # 116c <__divsi3>
    17d8:	00251793          	slli	a5,a0,0x2
    17dc:	00f507b3          	add	a5,a0,a5
    17e0:	00179793          	slli	a5,a5,0x1
    17e4:	40f40433          	sub	s0,s0,a5
    17e8:	00148493          	addi	s1,s1,1
    17ec:	fe848fa3          	sb	s0,-1(s1)
    17f0:	00050413          	mv	s0,a0
    17f4:	fc041ae3          	bnez	s0,17c8 <print_dec+0x34>
    17f8:	fd2488e3          	beq	s1,s2,17c8 <print_dec+0x34>
    17fc:	00005437          	lui	s0,0x5
    1800:	fff4c503          	lbu	a0,-1(s1)
    1804:	38442783          	lw	a5,900(s0) # 5384 <f_putchar>
    1808:	fff48493          	addi	s1,s1,-1
    180c:	03050513          	addi	a0,a0,48
    1810:	000780e7          	jalr	a5
    1814:	ff2496e3          	bne	s1,s2,1800 <print_dec+0x6c>
    1818:	10c12083          	lw	ra,268(sp)
    181c:	10812403          	lw	s0,264(sp)
    1820:	10412483          	lw	s1,260(sp)
    1824:	10012903          	lw	s2,256(sp)
    1828:	11010113          	addi	sp,sp,272
    182c:	00008067          	ret
    1830:	00010493          	mv	s1,sp
    1834:	00010913          	mv	s2,sp
    1838:	fbdff06f          	j	17f4 <print_dec+0x60>

0000183c <print_hex_digits>:
    183c:	fe010113          	addi	sp,sp,-32
    1840:	00812c23          	sw	s0,24(sp)
    1844:	00912a23          	sw	s1,20(sp)
    1848:	fff58413          	addi	s0,a1,-1
    184c:	000054b7          	lui	s1,0x5
    1850:	01212823          	sw	s2,16(sp)
    1854:	01312623          	sw	s3,12(sp)
    1858:	00112e23          	sw	ra,28(sp)
    185c:	00050993          	mv	s3,a0
    1860:	00241413          	slli	s0,s0,0x2
    1864:	f2048493          	addi	s1,s1,-224 # 4f20 <LEDS+0x9c>
    1868:	00005937          	lui	s2,0x5
    186c:	02045063          	bgez	s0,188c <print_hex_digits+0x50>
    1870:	01c12083          	lw	ra,28(sp)
    1874:	01812403          	lw	s0,24(sp)
    1878:	01412483          	lw	s1,20(sp)
    187c:	01012903          	lw	s2,16(sp)
    1880:	00c12983          	lw	s3,12(sp)
    1884:	02010113          	addi	sp,sp,32
    1888:	00008067          	ret
    188c:	0089d7b3          	srl	a5,s3,s0
    1890:	00f7f793          	andi	a5,a5,15
    1894:	00f487b3          	add	a5,s1,a5
    1898:	38492703          	lw	a4,900(s2) # 5384 <f_putchar>
    189c:	0007c503          	lbu	a0,0(a5)
    18a0:	ffc40413          	addi	s0,s0,-4
    18a4:	000700e7          	jalr	a4
    18a8:	fc5ff06f          	j	186c <print_hex_digits+0x30>

000018ac <print_hex>:
    18ac:	00800593          	li	a1,8
    18b0:	00000317          	auipc	t1,0x0
    18b4:	f8c30067          	jr	-116(t1) # 183c <print_hex_digits>

000018b8 <printf>:
    18b8:	fa010113          	addi	sp,sp,-96
    18bc:	04f12a23          	sw	a5,84(sp)
    18c0:	04410793          	addi	a5,sp,68
    18c4:	02812c23          	sw	s0,56(sp)
    18c8:	02912a23          	sw	s1,52(sp)
    18cc:	03212823          	sw	s2,48(sp)
    18d0:	03312623          	sw	s3,44(sp)
    18d4:	03412423          	sw	s4,40(sp)
    18d8:	03512223          	sw	s5,36(sp)
    18dc:	03612023          	sw	s6,32(sp)
    18e0:	02112e23          	sw	ra,60(sp)
    18e4:	01712e23          	sw	s7,28(sp)
    18e8:	00050413          	mv	s0,a0
    18ec:	04b12223          	sw	a1,68(sp)
    18f0:	04c12423          	sw	a2,72(sp)
    18f4:	04d12623          	sw	a3,76(sp)
    18f8:	04e12823          	sw	a4,80(sp)
    18fc:	05012c23          	sw	a6,88(sp)
    1900:	05112e23          	sw	a7,92(sp)
    1904:	00f12623          	sw	a5,12(sp)
    1908:	02500913          	li	s2,37
    190c:	000054b7          	lui	s1,0x5
    1910:	07300993          	li	s3,115
    1914:	07800a13          	li	s4,120
    1918:	06400a93          	li	s5,100
    191c:	06300b13          	li	s6,99
    1920:	00044503          	lbu	a0,0(s0)
    1924:	02051863          	bnez	a0,1954 <printf+0x9c>
    1928:	03c12083          	lw	ra,60(sp)
    192c:	03812403          	lw	s0,56(sp)
    1930:	03412483          	lw	s1,52(sp)
    1934:	03012903          	lw	s2,48(sp)
    1938:	02c12983          	lw	s3,44(sp)
    193c:	02812a03          	lw	s4,40(sp)
    1940:	02412a83          	lw	s5,36(sp)
    1944:	02012b03          	lw	s6,32(sp)
    1948:	01c12b83          	lw	s7,28(sp)
    194c:	06010113          	addi	sp,sp,96
    1950:	00008067          	ret
    1954:	09251a63          	bne	a0,s2,19e8 <printf+0x130>
    1958:	00144503          	lbu	a0,1(s0)
    195c:	00140b93          	addi	s7,s0,1
    1960:	03351463          	bne	a0,s3,1988 <printf+0xd0>
    1964:	00c12783          	lw	a5,12(sp)
    1968:	0007a503          	lw	a0,0(a5)
    196c:	00478713          	addi	a4,a5,4
    1970:	00e12623          	sw	a4,12(sp)
    1974:	00000097          	auipc	ra,0x0
    1978:	ddc080e7          	jalr	-548(ra) # 1750 <print_string>
    197c:	000b8413          	mv	s0,s7
    1980:	00140413          	addi	s0,s0,1
    1984:	f9dff06f          	j	1920 <printf+0x68>
    1988:	03451063          	bne	a0,s4,19a8 <printf+0xf0>
    198c:	00c12783          	lw	a5,12(sp)
    1990:	0007a503          	lw	a0,0(a5)
    1994:	00478713          	addi	a4,a5,4
    1998:	00e12623          	sw	a4,12(sp)
    199c:	00000097          	auipc	ra,0x0
    19a0:	f10080e7          	jalr	-240(ra) # 18ac <print_hex>
    19a4:	fd9ff06f          	j	197c <printf+0xc4>
    19a8:	03551063          	bne	a0,s5,19c8 <printf+0x110>
    19ac:	00c12783          	lw	a5,12(sp)
    19b0:	0007a503          	lw	a0,0(a5)
    19b4:	00478713          	addi	a4,a5,4
    19b8:	00e12623          	sw	a4,12(sp)
    19bc:	00000097          	auipc	ra,0x0
    19c0:	dd8080e7          	jalr	-552(ra) # 1794 <print_dec>
    19c4:	fb9ff06f          	j	197c <printf+0xc4>
    19c8:	3844a783          	lw	a5,900(s1) # 5384 <f_putchar>
    19cc:	01651a63          	bne	a0,s6,19e0 <printf+0x128>
    19d0:	00c12703          	lw	a4,12(sp)
    19d4:	00072503          	lw	a0,0(a4)
    19d8:	00470693          	addi	a3,a4,4
    19dc:	00d12623          	sw	a3,12(sp)
    19e0:	000780e7          	jalr	a5
    19e4:	f99ff06f          	j	197c <printf+0xc4>
    19e8:	3844a783          	lw	a5,900(s1)
    19ec:	000780e7          	jalr	a5
    19f0:	f91ff06f          	j	1980 <printf+0xc8>

000019f4 <__mulsi3>:
    19f4:	00050793          	mv	a5,a0
    19f8:	00000513          	li	a0,0
    19fc:	00079463          	bnez	a5,1a04 <__mulsi3+0x10>
    1a00:	00008067          	ret
    1a04:	01f79693          	slli	a3,a5,0x1f
    1a08:	41f6d713          	srai	a4,a3,0x1f
    1a0c:	00b77733          	and	a4,a4,a1
    1a10:	00e50533          	add	a0,a0,a4
    1a14:	0017d793          	srli	a5,a5,0x1
    1a18:	00159593          	slli	a1,a1,0x1
    1a1c:	fe1ff06f          	j	19fc <__mulsi3+0x8>

00001a20 <fat_list_insert_last>:
    1a20:	00452783          	lw	a5,4(a0)
    1a24:	04079263          	bnez	a5,1a68 <fat_list_insert_last+0x48>
    1a28:	00052783          	lw	a5,0(a0)
    1a2c:	00079c63          	bnez	a5,1a44 <fat_list_insert_last+0x24>
    1a30:	00b52023          	sw	a1,0(a0)
    1a34:	00b52223          	sw	a1,4(a0)
    1a38:	0005a023          	sw	zero,0(a1)
    1a3c:	0005a223          	sw	zero,4(a1)
    1a40:	00008067          	ret
    1a44:	0007a703          	lw	a4,0(a5)
    1a48:	00f5a223          	sw	a5,4(a1)
    1a4c:	00e5a023          	sw	a4,0(a1)
    1a50:	00071863          	bnez	a4,1a60 <fat_list_insert_last+0x40>
    1a54:	00b52023          	sw	a1,0(a0)
    1a58:	00b7a023          	sw	a1,0(a5)
    1a5c:	00008067          	ret
    1a60:	00b72223          	sw	a1,4(a4)
    1a64:	ff5ff06f          	j	1a58 <fat_list_insert_last+0x38>
    1a68:	0047a703          	lw	a4,4(a5)
    1a6c:	00f5a023          	sw	a5,0(a1)
    1a70:	00e5a223          	sw	a4,4(a1)
    1a74:	00071863          	bnez	a4,1a84 <fat_list_insert_last+0x64>
    1a78:	00b52223          	sw	a1,4(a0)
    1a7c:	00b7a223          	sw	a1,4(a5)
    1a80:	00008067          	ret
    1a84:	00b72023          	sw	a1,0(a4)
    1a88:	ff5ff06f          	j	1a7c <fat_list_insert_last+0x5c>

00001a8c <FileString_StrCmpNoCase>:
    1a8c:	00050e93          	mv	t4,a0
    1a90:	00000793          	li	a5,0
    1a94:	01900e13          	li	t3,25
    1a98:	00c79663          	bne	a5,a2,1aa4 <FileString_StrCmpNoCase+0x18>
    1a9c:	00000513          	li	a0,0
    1aa0:	00008067          	ret
    1aa4:	00fe8733          	add	a4,t4,a5
    1aa8:	00074803          	lbu	a6,0(a4)
    1aac:	00f58733          	add	a4,a1,a5
    1ab0:	00074883          	lbu	a7,0(a4)
    1ab4:	fbf80713          	addi	a4,a6,-65
    1ab8:	0ff77713          	zext.b	a4,a4
    1abc:	00080693          	mv	a3,a6
    1ac0:	00ee6663          	bltu	t3,a4,1acc <FileString_StrCmpNoCase+0x40>
    1ac4:	02080693          	addi	a3,a6,32
    1ac8:	0ff6f693          	zext.b	a3,a3
    1acc:	fbf88313          	addi	t1,a7,-65
    1ad0:	0ff37313          	zext.b	t1,t1
    1ad4:	00088713          	mv	a4,a7
    1ad8:	006e6663          	bltu	t3,t1,1ae4 <FileString_StrCmpNoCase+0x58>
    1adc:	02088713          	addi	a4,a7,32
    1ae0:	0ff77713          	zext.b	a4,a4
    1ae4:	40e68533          	sub	a0,a3,a4
    1ae8:	00e69863          	bne	a3,a4,1af8 <FileString_StrCmpNoCase+0x6c>
    1aec:	00178793          	addi	a5,a5,1
    1af0:	00088463          	beqz	a7,1af8 <FileString_StrCmpNoCase+0x6c>
    1af4:	fa0812e3          	bnez	a6,1a98 <FileString_StrCmpNoCase+0xc>
    1af8:	00008067          	ret

00001afc <FileString_GetExtension>:
    1afc:	00050793          	mv	a5,a0
    1b00:	fff00713          	li	a4,-1
    1b04:	02e00613          	li	a2,46
    1b08:	0007c683          	lbu	a3,0(a5)
    1b0c:	00069663          	bnez	a3,1b18 <FileString_GetExtension+0x1c>
    1b10:	00070513          	mv	a0,a4
    1b14:	00008067          	ret
    1b18:	00c69463          	bne	a3,a2,1b20 <FileString_GetExtension+0x24>
    1b1c:	40a78733          	sub	a4,a5,a0
    1b20:	00178793          	addi	a5,a5,1
    1b24:	fe5ff06f          	j	1b08 <FileString_GetExtension+0xc>

00001b28 <fatfs_fat_writeback>:
    1b28:	00059e63          	bnez	a1,1b44 <fatfs_fat_writeback+0x1c>
    1b2c:	00000513          	li	a0,0
    1b30:	00008067          	ret
    1b34:	00000513          	li	a0,0
    1b38:	01c12083          	lw	ra,28(sp)
    1b3c:	02010113          	addi	sp,sp,32
    1b40:	00008067          	ret
    1b44:	2045a783          	lw	a5,516(a1)
    1b48:	04078e63          	beqz	a5,1ba4 <fatfs_fat_writeback+0x7c>
    1b4c:	03852683          	lw	a3,56(a0)
    1b50:	00050793          	mv	a5,a0
    1b54:	04068663          	beqz	a3,1ba0 <fatfs_fat_writeback+0x78>
    1b58:	0147a703          	lw	a4,20(a5)
    1b5c:	2005a503          	lw	a0,512(a1)
    1b60:	0207a803          	lw	a6,32(a5)
    1b64:	00100613          	li	a2,1
    1b68:	fe010113          	addi	sp,sp,-32
    1b6c:	40e607b3          	sub	a5,a2,a4
    1b70:	00112e23          	sw	ra,28(sp)
    1b74:	00a787b3          	add	a5,a5,a0
    1b78:	00f87663          	bgeu	a6,a5,1b84 <fatfs_fat_writeback+0x5c>
    1b7c:	01070733          	add	a4,a4,a6
    1b80:	40a70633          	sub	a2,a4,a0
    1b84:	00b12623          	sw	a1,12(sp)
    1b88:	000680e7          	jalr	a3
    1b8c:	fa0504e3          	beqz	a0,1b34 <fatfs_fat_writeback+0xc>
    1b90:	00c12583          	lw	a1,12(sp)
    1b94:	00100513          	li	a0,1
    1b98:	2005a223          	sw	zero,516(a1)
    1b9c:	f9dff06f          	j	1b38 <fatfs_fat_writeback+0x10>
    1ba0:	2005a223          	sw	zero,516(a1)
    1ba4:	00100513          	li	a0,1
    1ba8:	00008067          	ret

00001bac <fatfs_fat_read_sector>:
    1bac:	fe010113          	addi	sp,sp,-32
    1bb0:	01212823          	sw	s2,16(sp)
    1bb4:	25452903          	lw	s2,596(a0)
    1bb8:	00812c23          	sw	s0,24(sp)
    1bbc:	00112e23          	sw	ra,28(sp)
    1bc0:	00912a23          	sw	s1,20(sp)
    1bc4:	01312623          	sw	s3,12(sp)
    1bc8:	00000413          	li	s0,0
    1bcc:	04091463          	bnez	s2,1c14 <fatfs_fat_read_sector+0x68>
    1bd0:	25452783          	lw	a5,596(a0)
    1bd4:	00058493          	mv	s1,a1
    1bd8:	00050993          	mv	s3,a0
    1bdc:	20f42623          	sw	a5,524(s0)
    1be0:	20442783          	lw	a5,516(s0)
    1be4:	24852a23          	sw	s0,596(a0)
    1be8:	08079863          	bnez	a5,1c78 <fatfs_fat_read_sector+0xcc>
    1bec:	0349a783          	lw	a5,52(s3)
    1bf0:	20942023          	sw	s1,512(s0)
    1bf4:	00100613          	li	a2,1
    1bf8:	00040593          	mv	a1,s0
    1bfc:	00048513          	mv	a0,s1
    1c00:	000780e7          	jalr	a5
    1c04:	08051463          	bnez	a0,1c8c <fatfs_fat_read_sector+0xe0>
    1c08:	fff00793          	li	a5,-1
    1c0c:	20f42023          	sw	a5,512(s0)
    1c10:	0480006f          	j	1c58 <fatfs_fat_read_sector+0xac>
    1c14:	20092783          	lw	a5,512(s2)
    1c18:	00f5e663          	bltu	a1,a5,1c24 <fatfs_fat_read_sector+0x78>
    1c1c:	00178713          	addi	a4,a5,1
    1c20:	02e5e463          	bltu	a1,a4,1c48 <fatfs_fat_read_sector+0x9c>
    1c24:	20c92783          	lw	a5,524(s2)
    1c28:	00079663          	bnez	a5,1c34 <fatfs_fat_read_sector+0x88>
    1c2c:	00040a63          	beqz	s0,1c40 <fatfs_fat_read_sector+0x94>
    1c30:	20042623          	sw	zero,524(s0)
    1c34:	00090413          	mv	s0,s2
    1c38:	20c92903          	lw	s2,524(s2)
    1c3c:	f91ff06f          	j	1bcc <fatfs_fat_read_sector+0x20>
    1c40:	24052a23          	sw	zero,596(a0)
    1c44:	ff1ff06f          	j	1c34 <fatfs_fat_read_sector+0x88>
    1c48:	40f585b3          	sub	a1,a1,a5
    1c4c:	00959593          	slli	a1,a1,0x9
    1c50:	00b905b3          	add	a1,s2,a1
    1c54:	20b92423          	sw	a1,520(s2)
    1c58:	01c12083          	lw	ra,28(sp)
    1c5c:	01812403          	lw	s0,24(sp)
    1c60:	01412483          	lw	s1,20(sp)
    1c64:	00c12983          	lw	s3,12(sp)
    1c68:	00090513          	mv	a0,s2
    1c6c:	01012903          	lw	s2,16(sp)
    1c70:	02010113          	addi	sp,sp,32
    1c74:	00008067          	ret
    1c78:	00040593          	mv	a1,s0
    1c7c:	00000097          	auipc	ra,0x0
    1c80:	eac080e7          	jalr	-340(ra) # 1b28 <fatfs_fat_writeback>
    1c84:	f60514e3          	bnez	a0,1bec <fatfs_fat_read_sector+0x40>
    1c88:	fd1ff06f          	j	1c58 <fatfs_fat_read_sector+0xac>
    1c8c:	20842423          	sw	s0,520(s0)
    1c90:	00040913          	mv	s2,s0
    1c94:	fc5ff06f          	j	1c58 <fatfs_fat_read_sector+0xac>

00001c98 <_allocate_file>:
    1c98:	000057b7          	lui	a5,0x5
    1c9c:	38878793          	addi	a5,a5,904 # 5388 <_free_file_list>
    1ca0:	0007a583          	lw	a1,0(a5)
    1ca4:	06058263          	beqz	a1,1d08 <_allocate_file+0x70>
    1ca8:	0005a703          	lw	a4,0(a1)
    1cac:	fe010113          	addi	sp,sp,-32
    1cb0:	00112e23          	sw	ra,28(sp)
    1cb4:	0045a683          	lw	a3,4(a1)
    1cb8:	04071063          	bnez	a4,1cf8 <_allocate_file+0x60>
    1cbc:	00d7a023          	sw	a3,0(a5)
    1cc0:	0045a683          	lw	a3,4(a1)
    1cc4:	02069e63          	bnez	a3,1d00 <_allocate_file+0x68>
    1cc8:	00e7a223          	sw	a4,4(a5)
    1ccc:	00005537          	lui	a0,0x5
    1cd0:	39050513          	addi	a0,a0,912 # 5390 <_open_file_list>
    1cd4:	00b12623          	sw	a1,12(sp)
    1cd8:	00000097          	auipc	ra,0x0
    1cdc:	d48080e7          	jalr	-696(ra) # 1a20 <fat_list_insert_last>
    1ce0:	00c12583          	lw	a1,12(sp)
    1ce4:	01c12083          	lw	ra,28(sp)
    1ce8:	bc458593          	addi	a1,a1,-1084
    1cec:	00058513          	mv	a0,a1
    1cf0:	02010113          	addi	sp,sp,32
    1cf4:	00008067          	ret
    1cf8:	00d72223          	sw	a3,4(a4)
    1cfc:	fc5ff06f          	j	1cc0 <_allocate_file+0x28>
    1d00:	00e6a023          	sw	a4,0(a3)
    1d04:	fc9ff06f          	j	1ccc <_allocate_file+0x34>
    1d08:	00058513          	mv	a0,a1
    1d0c:	00008067          	ret

00001d10 <_free_file>:
    1d10:	43c52783          	lw	a5,1084(a0)
    1d14:	44052703          	lw	a4,1088(a0)
    1d18:	43c50593          	addi	a1,a0,1084
    1d1c:	02079663          	bnez	a5,1d48 <_free_file+0x38>
    1d20:	000056b7          	lui	a3,0x5
    1d24:	38e6a823          	sw	a4,912(a3) # 5390 <_open_file_list>
    1d28:	44052703          	lw	a4,1088(a0)
    1d2c:	02071263          	bnez	a4,1d50 <_free_file+0x40>
    1d30:	00005737          	lui	a4,0x5
    1d34:	38f72a23          	sw	a5,916(a4) # 5394 <_open_file_list+0x4>
    1d38:	00005537          	lui	a0,0x5
    1d3c:	38850513          	addi	a0,a0,904 # 5388 <_free_file_list>
    1d40:	00000317          	auipc	t1,0x0
    1d44:	ce030067          	jr	-800(t1) # 1a20 <fat_list_insert_last>
    1d48:	00e7a223          	sw	a4,4(a5)
    1d4c:	fddff06f          	j	1d28 <_free_file+0x18>
    1d50:	00f72023          	sw	a5,0(a4)
    1d54:	fe5ff06f          	j	1d38 <_free_file+0x28>

00001d58 <fatfs_lba_of_cluster>:
    1d58:	ff010113          	addi	sp,sp,-16
    1d5c:	00812423          	sw	s0,8(sp)
    1d60:	00112623          	sw	ra,12(sp)
    1d64:	00050413          	mv	s0,a0
    1d68:	ffe58513          	addi	a0,a1,-2
    1d6c:	00044583          	lbu	a1,0(s0)
    1d70:	00000097          	auipc	ra,0x0
    1d74:	c84080e7          	jalr	-892(ra) # 19f4 <__mulsi3>
    1d78:	00442783          	lw	a5,4(s0)
    1d7c:	00f50533          	add	a0,a0,a5
    1d80:	03042783          	lw	a5,48(s0)
    1d84:	00079863          	bnez	a5,1d94 <fatfs_lba_of_cluster+0x3c>
    1d88:	02845783          	lhu	a5,40(s0)
    1d8c:	4047d793          	srai	a5,a5,0x4
    1d90:	00f50533          	add	a0,a0,a5
    1d94:	00c12083          	lw	ra,12(sp)
    1d98:	00812403          	lw	s0,8(sp)
    1d9c:	01010113          	addi	sp,sp,16
    1da0:	00008067          	ret

00001da4 <fatfs_sector_read>:
    1da4:	03452783          	lw	a5,52(a0)
    1da8:	00058713          	mv	a4,a1
    1dac:	00070513          	mv	a0,a4
    1db0:	00060593          	mv	a1,a2
    1db4:	00068613          	mv	a2,a3
    1db8:	00078067          	jr	a5

00001dbc <fatfs_sector_write>:
    1dbc:	03852783          	lw	a5,56(a0)
    1dc0:	00058713          	mv	a4,a1
    1dc4:	00070513          	mv	a0,a4
    1dc8:	00060593          	mv	a1,a2
    1dcc:	00068613          	mv	a2,a3
    1dd0:	00078067          	jr	a5

00001dd4 <fatfs_write_sector>:
    1dd4:	03852703          	lw	a4,56(a0)
    1dd8:	0a070463          	beqz	a4,1e80 <fatfs_write_sector+0xac>
    1ddc:	03052883          	lw	a7,48(a0)
    1de0:	00050793          	mv	a5,a0
    1de4:	0115e833          	or	a6,a1,a7
    1de8:	02081e63          	bnez	a6,1e24 <fatfs_write_sector+0x50>
    1dec:	01052583          	lw	a1,16(a0)
    1df0:	08b67863          	bgeu	a2,a1,1e80 <fatfs_write_sector+0xac>
    1df4:	01c52503          	lw	a0,28(a0)
    1df8:	00c7a583          	lw	a1,12(a5)
    1dfc:	00b50533          	add	a0,a0,a1
    1e00:	00c50533          	add	a0,a0,a2
    1e04:	00068863          	beqz	a3,1e14 <fatfs_write_sector+0x40>
    1e08:	00100613          	li	a2,1
    1e0c:	00068593          	mv	a1,a3
    1e10:	00070067          	jr	a4
    1e14:	24a7a223          	sw	a0,580(a5)
    1e18:	00100613          	li	a2,1
    1e1c:	04478593          	addi	a1,a5,68
    1e20:	ff1ff06f          	j	1e10 <fatfs_write_sector+0x3c>
    1e24:	fe010113          	addi	sp,sp,-32
    1e28:	00e12623          	sw	a4,12(sp)
    1e2c:	00d12423          	sw	a3,8(sp)
    1e30:	00c12223          	sw	a2,4(sp)
    1e34:	00112e23          	sw	ra,28(sp)
    1e38:	00a12023          	sw	a0,0(sp)
    1e3c:	00000097          	auipc	ra,0x0
    1e40:	f1c080e7          	jalr	-228(ra) # 1d58 <fatfs_lba_of_cluster>
    1e44:	00412603          	lw	a2,4(sp)
    1e48:	00812683          	lw	a3,8(sp)
    1e4c:	00012783          	lw	a5,0(sp)
    1e50:	00c12703          	lw	a4,12(sp)
    1e54:	00a60533          	add	a0,a2,a0
    1e58:	00068c63          	beqz	a3,1e70 <fatfs_write_sector+0x9c>
    1e5c:	00100613          	li	a2,1
    1e60:	00068593          	mv	a1,a3
    1e64:	01c12083          	lw	ra,28(sp)
    1e68:	02010113          	addi	sp,sp,32
    1e6c:	fa5ff06f          	j	1e10 <fatfs_write_sector+0x3c>
    1e70:	24a7a223          	sw	a0,580(a5)
    1e74:	00100613          	li	a2,1
    1e78:	04478593          	addi	a1,a5,68
    1e7c:	fe9ff06f          	j	1e64 <fatfs_write_sector+0x90>
    1e80:	00000513          	li	a0,0
    1e84:	00008067          	ret

00001e88 <fl_init>:
    1e88:	ff010113          	addi	sp,sp,-16
    1e8c:	00005537          	lui	a0,0x5
    1e90:	000057b7          	lui	a5,0x5
    1e94:	0000c5b7          	lui	a1,0xc
    1e98:	00112623          	sw	ra,12(sp)
    1e9c:	38850513          	addi	a0,a0,904 # 5388 <_free_file_list>
    1ea0:	39078793          	addi	a5,a5,912 # 5390 <_open_file_list>
    1ea4:	86058593          	addi	a1,a1,-1952 # b860 <_files+0x43c>
    1ea8:	00052223          	sw	zero,4(a0)
    1eac:	00052023          	sw	zero,0(a0)
    1eb0:	0007a223          	sw	zero,4(a5)
    1eb4:	0007a023          	sw	zero,0(a5)
    1eb8:	00000097          	auipc	ra,0x0
    1ebc:	b68080e7          	jalr	-1176(ra) # 1a20 <fat_list_insert_last>
    1ec0:	000057b7          	lui	a5,0x5
    1ec4:	0000c5b7          	lui	a1,0xc
    1ec8:	38878513          	addi	a0,a5,904 # 5388 <_free_file_list>
    1ecc:	ca458593          	addi	a1,a1,-860 # bca4 <_files+0x880>
    1ed0:	00000097          	auipc	ra,0x0
    1ed4:	b50080e7          	jalr	-1200(ra) # 1a20 <fat_list_insert_last>
    1ed8:	00c12083          	lw	ra,12(sp)
    1edc:	000057b7          	lui	a5,0x5
    1ee0:	00100713          	li	a4,1
    1ee4:	38e7ae23          	sw	a4,924(a5) # 539c <_filelib_init>
    1ee8:	01010113          	addi	sp,sp,16
    1eec:	00008067          	ret

00001ef0 <fl_fseek>:
    1ef0:	000057b7          	lui	a5,0x5
    1ef4:	39c7a783          	lw	a5,924(a5) # 539c <_filelib_init>
    1ef8:	fd010113          	addi	sp,sp,-48
    1efc:	02812423          	sw	s0,40(sp)
    1f00:	02912223          	sw	s1,36(sp)
    1f04:	01312e23          	sw	s3,28(sp)
    1f08:	02112623          	sw	ra,44(sp)
    1f0c:	03212023          	sw	s2,32(sp)
    1f10:	00050413          	mv	s0,a0
    1f14:	00058493          	mv	s1,a1
    1f18:	00060993          	mv	s3,a2
    1f1c:	00079663          	bnez	a5,1f28 <fl_fseek+0x38>
    1f20:	00000097          	auipc	ra,0x0
    1f24:	f68080e7          	jalr	-152(ra) # 1e88 <fl_init>
    1f28:	fff00513          	li	a0,-1
    1f2c:	08040263          	beqz	s0,1fb0 <fl_fseek+0xc0>
    1f30:	00048663          	beqz	s1,1f3c <fl_fseek+0x4c>
    1f34:	ffe98793          	addi	a5,s3,-2
    1f38:	06078c63          	beqz	a5,1fb0 <fl_fseek+0xc0>
    1f3c:	0000b937          	lui	s2,0xb
    1f40:	fbc90913          	addi	s2,s2,-68 # afbc <_fs>
    1f44:	03c92783          	lw	a5,60(s2)
    1f48:	00078463          	beqz	a5,1f50 <fl_fseek+0x60>
    1f4c:	000780e7          	jalr	a5
    1f50:	fff00513          	li	a0,-1
    1f54:	42a42823          	sw	a0,1072(s0)
    1f58:	42042a23          	sw	zero,1076(s0)
    1f5c:	00099c63          	bnez	s3,1f74 <fl_fseek+0x84>
    1f60:	00c42783          	lw	a5,12(s0)
    1f64:	00942423          	sw	s1,8(s0)
    1f68:	0297f863          	bgeu	a5,s1,1f98 <fl_fseek+0xa8>
    1f6c:	00f42423          	sw	a5,8(s0)
    1f70:	0280006f          	j	1f98 <fl_fseek+0xa8>
    1f74:	00100793          	li	a5,1
    1f78:	06f99063          	bne	s3,a5,1fd8 <fl_fseek+0xe8>
    1f7c:	00842783          	lw	a5,8(s0)
    1f80:	0004c663          	bltz	s1,1f8c <fl_fseek+0x9c>
    1f84:	00f484b3          	add	s1,s1,a5
    1f88:	fd9ff06f          	j	1f60 <fl_fseek+0x70>
    1f8c:	40900733          	neg	a4,s1
    1f90:	02e7fe63          	bgeu	a5,a4,1fcc <fl_fseek+0xdc>
    1f94:	00042423          	sw	zero,8(s0)
    1f98:	00000513          	li	a0,0
    1f9c:	04092783          	lw	a5,64(s2)
    1fa0:	00078863          	beqz	a5,1fb0 <fl_fseek+0xc0>
    1fa4:	00a12623          	sw	a0,12(sp)
    1fa8:	000780e7          	jalr	a5
    1fac:	00c12503          	lw	a0,12(sp)
    1fb0:	02c12083          	lw	ra,44(sp)
    1fb4:	02812403          	lw	s0,40(sp)
    1fb8:	02412483          	lw	s1,36(sp)
    1fbc:	02012903          	lw	s2,32(sp)
    1fc0:	01c12983          	lw	s3,28(sp)
    1fc4:	03010113          	addi	sp,sp,48
    1fc8:	00008067          	ret
    1fcc:	00f484b3          	add	s1,s1,a5
    1fd0:	00942423          	sw	s1,8(s0)
    1fd4:	fc5ff06f          	j	1f98 <fl_fseek+0xa8>
    1fd8:	00200793          	li	a5,2
    1fdc:	fcf990e3          	bne	s3,a5,1f9c <fl_fseek+0xac>
    1fe0:	00c42783          	lw	a5,12(s0)
    1fe4:	f89ff06f          	j	1f6c <fl_fseek+0x7c>

00001fe8 <fl_closedir>:
    1fe8:	00000513          	li	a0,0
    1fec:	00008067          	ret

00001ff0 <fatfs_lfn_cache_entry>:
    1ff0:	0005c783          	lbu	a5,0(a1)
    1ff4:	01300693          	li	a3,19
    1ff8:	01f7f793          	andi	a5,a5,31
    1ffc:	fff78713          	addi	a4,a5,-1
    2000:	0ff77613          	zext.b	a2,a4
    2004:	0ac6ea63          	bltu	a3,a2,20b8 <fatfs_lfn_cache_entry+0xc8>
    2008:	10554683          	lbu	a3,261(a0)
    200c:	00069463          	bnez	a3,2014 <fatfs_lfn_cache_entry+0x24>
    2010:	10f502a3          	sb	a5,261(a0)
    2014:	00171793          	slli	a5,a4,0x1
    2018:	00e787b3          	add	a5,a5,a4
    201c:	0015c683          	lbu	a3,1(a1)
    2020:	00279793          	slli	a5,a5,0x2
    2024:	00e787b3          	add	a5,a5,a4
    2028:	00f50533          	add	a0,a0,a5
    202c:	00d50023          	sb	a3,0(a0)
    2030:	0035c783          	lbu	a5,3(a1)
    2034:	0ff00713          	li	a4,255
    2038:	02000693          	li	a3,32
    203c:	00f500a3          	sb	a5,1(a0)
    2040:	0055c783          	lbu	a5,5(a1)
    2044:	00f50123          	sb	a5,2(a0)
    2048:	0075c783          	lbu	a5,7(a1)
    204c:	00f501a3          	sb	a5,3(a0)
    2050:	0095c783          	lbu	a5,9(a1)
    2054:	00f50223          	sb	a5,4(a0)
    2058:	00e5c783          	lbu	a5,14(a1)
    205c:	00f502a3          	sb	a5,5(a0)
    2060:	0105c783          	lbu	a5,16(a1)
    2064:	00f50323          	sb	a5,6(a0)
    2068:	0125c783          	lbu	a5,18(a1)
    206c:	00f503a3          	sb	a5,7(a0)
    2070:	0145c783          	lbu	a5,20(a1)
    2074:	00f50423          	sb	a5,8(a0)
    2078:	0165c783          	lbu	a5,22(a1)
    207c:	00f504a3          	sb	a5,9(a0)
    2080:	0185c783          	lbu	a5,24(a1)
    2084:	00f50523          	sb	a5,10(a0)
    2088:	01c5c783          	lbu	a5,28(a1)
    208c:	00f505a3          	sb	a5,11(a0)
    2090:	01e5c783          	lbu	a5,30(a1)
    2094:	00f50623          	sb	a5,12(a0)
    2098:	00d00793          	li	a5,13
    209c:	00054603          	lbu	a2,0(a0)
    20a0:	00e61463          	bne	a2,a4,20a8 <fatfs_lfn_cache_entry+0xb8>
    20a4:	00d50023          	sb	a3,0(a0)
    20a8:	fff78793          	addi	a5,a5,-1
    20ac:	0ff7f793          	zext.b	a5,a5
    20b0:	00150513          	addi	a0,a0,1
    20b4:	fe0794e3          	bnez	a5,209c <fatfs_lfn_cache_entry+0xac>
    20b8:	00008067          	ret

000020bc <fatfs_lfn_cache_get>:
    20bc:	10554703          	lbu	a4,261(a0)
    20c0:	01400793          	li	a5,20
    20c4:	00f71663          	bne	a4,a5,20d0 <fatfs_lfn_cache_get+0x14>
    20c8:	10050223          	sb	zero,260(a0)
    20cc:	00008067          	ret
    20d0:	02070063          	beqz	a4,20f0 <fatfs_lfn_cache_get+0x34>
    20d4:	00171793          	slli	a5,a4,0x1
    20d8:	00e787b3          	add	a5,a5,a4
    20dc:	00279793          	slli	a5,a5,0x2
    20e0:	00e787b3          	add	a5,a5,a4
    20e4:	00f507b3          	add	a5,a0,a5
    20e8:	00078023          	sb	zero,0(a5)
    20ec:	00008067          	ret
    20f0:	00050023          	sb	zero,0(a0)
    20f4:	00008067          	ret

000020f8 <fatfs_entry_lfn_text>:
    20f8:	00b54503          	lbu	a0,11(a0)
    20fc:	00f57513          	andi	a0,a0,15
    2100:	ff150513          	addi	a0,a0,-15
    2104:	00153513          	seqz	a0,a0
    2108:	00008067          	ret

0000210c <fatfs_entry_lfn_invalid>:
    210c:	00054783          	lbu	a5,0(a0)
    2110:	f1b78713          	addi	a4,a5,-229
    2114:	02070263          	beqz	a4,2138 <fatfs_entry_lfn_invalid+0x2c>
    2118:	02078063          	beqz	a5,2138 <fatfs_entry_lfn_invalid+0x2c>
    211c:	00b54783          	lbu	a5,11(a0)
    2120:	00800713          	li	a4,8
    2124:	00100513          	li	a0,1
    2128:	00e78a63          	beq	a5,a4,213c <fatfs_entry_lfn_invalid+0x30>
    212c:	0067f793          	andi	a5,a5,6
    2130:	00f03533          	snez	a0,a5
    2134:	00008067          	ret
    2138:	00100513          	li	a0,1
    213c:	00008067          	ret

00002140 <fatfs_entry_lfn_exists>:
    2140:	00b5c783          	lbu	a5,11(a1)
    2144:	00f00713          	li	a4,15
    2148:	04e78063          	beq	a5,a4,2188 <fatfs_entry_lfn_exists+0x48>
    214c:	0005c683          	lbu	a3,0(a1)
    2150:	f1b68713          	addi	a4,a3,-229
    2154:	00e03733          	snez	a4,a4
    2158:	00d036b3          	snez	a3,a3
    215c:	00d77733          	and	a4,a4,a3
    2160:	02070463          	beqz	a4,2188 <fatfs_entry_lfn_exists+0x48>
    2164:	ff878713          	addi	a4,a5,-8
    2168:	02070063          	beqz	a4,2188 <fatfs_entry_lfn_exists+0x48>
    216c:	0067f713          	andi	a4,a5,6
    2170:	00000793          	li	a5,0
    2174:	00071663          	bnez	a4,2180 <fatfs_entry_lfn_exists+0x40>
    2178:	10554783          	lbu	a5,261(a0)
    217c:	00f037b3          	snez	a5,a5
    2180:	00078513          	mv	a0,a5
    2184:	00008067          	ret
    2188:	00000793          	li	a5,0
    218c:	ff5ff06f          	j	2180 <fatfs_entry_lfn_exists+0x40>

00002190 <fatfs_entry_sfn_only>:
    2190:	00b54783          	lbu	a5,11(a0)
    2194:	00f00713          	li	a4,15
    2198:	02e78863          	beq	a5,a4,21c8 <fatfs_entry_sfn_only+0x38>
    219c:	00054683          	lbu	a3,0(a0)
    21a0:	f1b68713          	addi	a4,a3,-229
    21a4:	00e03733          	snez	a4,a4
    21a8:	00d036b3          	snez	a3,a3
    21ac:	00d77733          	and	a4,a4,a3
    21b0:	00070c63          	beqz	a4,21c8 <fatfs_entry_sfn_only+0x38>
    21b4:	ff878713          	addi	a4,a5,-8
    21b8:	00070863          	beqz	a4,21c8 <fatfs_entry_sfn_only+0x38>
    21bc:	0067f513          	andi	a0,a5,6
    21c0:	00153513          	seqz	a0,a0
    21c4:	00008067          	ret
    21c8:	00000513          	li	a0,0
    21cc:	00008067          	ret

000021d0 <fatfs_entry_is_dir>:
    21d0:	00b54503          	lbu	a0,11(a0)
    21d4:	00455513          	srli	a0,a0,0x4
    21d8:	00157513          	andi	a0,a0,1
    21dc:	00008067          	ret

000021e0 <fatfs_lfn_entries_required>:
    21e0:	ff010113          	addi	sp,sp,-16
    21e4:	00112623          	sw	ra,12(sp)
    21e8:	fffff097          	auipc	ra,0xfffff
    21ec:	078080e7          	jalr	120(ra) # 1260 <strlen>
    21f0:	00050a63          	beqz	a0,2204 <fatfs_lfn_entries_required+0x24>
    21f4:	00d00593          	li	a1,13
    21f8:	00c50513          	addi	a0,a0,12
    21fc:	fffff097          	auipc	ra,0xfffff
    2200:	f70080e7          	jalr	-144(ra) # 116c <__divsi3>
    2204:	00c12083          	lw	ra,12(sp)
    2208:	01010113          	addi	sp,sp,16
    220c:	00008067          	ret

00002210 <fatfs_filename_to_lfn>:
    2210:	f9010113          	addi	sp,sp,-112
    2214:	06812423          	sw	s0,104(sp)
    2218:	00058413          	mv	s0,a1
    221c:	000055b7          	lui	a1,0x5
    2220:	14858593          	addi	a1,a1,328 # 5148 <font+0x1e0>
    2224:	06912223          	sw	s1,100(sp)
    2228:	05312e23          	sw	s3,92(sp)
    222c:	00060493          	mv	s1,a2
    2230:	00050993          	mv	s3,a0
    2234:	03400613          	li	a2,52
    2238:	01c10513          	addi	a0,sp,28
    223c:	00d12623          	sw	a3,12(sp)
    2240:	06112623          	sw	ra,108(sp)
    2244:	07212023          	sw	s2,96(sp)
    2248:	05412c23          	sw	s4,88(sp)
    224c:	fffff097          	auipc	ra,0xfffff
    2250:	ff0080e7          	jalr	-16(ra) # 123c <memcpy>
    2254:	00098513          	mv	a0,s3
    2258:	fffff097          	auipc	ra,0xfffff
    225c:	008080e7          	jalr	8(ra) # 1260 <strlen>
    2260:	00050913          	mv	s2,a0
    2264:	00098513          	mv	a0,s3
    2268:	00000097          	auipc	ra,0x0
    226c:	f78080e7          	jalr	-136(ra) # 21e0 <fatfs_lfn_entries_required>
    2270:	00050a13          	mv	s4,a0
    2274:	02000613          	li	a2,32
    2278:	00000593          	li	a1,0
    227c:	00040513          	mv	a0,s0
    2280:	fffff097          	auipc	ra,0xfffff
    2284:	fa0080e7          	jalr	-96(ra) # 1220 <memset>
    2288:	fffa0713          	addi	a4,s4,-1 # 3fff <fatfs_fat_add_cluster_to_chain+0x1f>
    228c:	00c12683          	lw	a3,12(sp)
    2290:	00148793          	addi	a5,s1,1
    2294:	00971463          	bne	a4,s1,229c <fatfs_filename_to_lfn+0x8c>
    2298:	0407e793          	ori	a5,a5,64
    229c:	00149613          	slli	a2,s1,0x1
    22a0:	00960633          	add	a2,a2,s1
    22a4:	00f40023          	sb	a5,0(s0)
    22a8:	00261613          	slli	a2,a2,0x2
    22ac:	00f00793          	li	a5,15
    22b0:	00f405a3          	sb	a5,11(s0)
    22b4:	00d406a3          	sb	a3,13(s0)
    22b8:	01c10793          	addi	a5,sp,28
    22bc:	00960633          	add	a2,a2,s1
    22c0:	fff00693          	li	a3,-1
    22c4:	0007a703          	lw	a4,0(a5)
    22c8:	00e40733          	add	a4,s0,a4
    22cc:	05265063          	bge	a2,s2,230c <fatfs_filename_to_lfn+0xfc>
    22d0:	00c985b3          	add	a1,s3,a2
    22d4:	0005c583          	lbu	a1,0(a1)
    22d8:	00b70023          	sb	a1,0(a4)
    22dc:	00478793          	addi	a5,a5,4
    22e0:	05010713          	addi	a4,sp,80
    22e4:	00160613          	addi	a2,a2,1
    22e8:	fce79ee3          	bne	a5,a4,22c4 <fatfs_filename_to_lfn+0xb4>
    22ec:	06c12083          	lw	ra,108(sp)
    22f0:	06812403          	lw	s0,104(sp)
    22f4:	06412483          	lw	s1,100(sp)
    22f8:	06012903          	lw	s2,96(sp)
    22fc:	05c12983          	lw	s3,92(sp)
    2300:	05812a03          	lw	s4,88(sp)
    2304:	07010113          	addi	sp,sp,112
    2308:	00008067          	ret
    230c:	01261663          	bne	a2,s2,2318 <fatfs_filename_to_lfn+0x108>
    2310:	00070023          	sb	zero,0(a4)
    2314:	fc9ff06f          	j	22dc <fatfs_filename_to_lfn+0xcc>
    2318:	00d70023          	sb	a3,0(a4)
    231c:	00d700a3          	sb	a3,1(a4)
    2320:	fbdff06f          	j	22dc <fatfs_filename_to_lfn+0xcc>

00002324 <fatfs_sfn_create_entry>:
    2324:	00000793          	li	a5,0
    2328:	00b00813          	li	a6,11
    232c:	00f508b3          	add	a7,a0,a5
    2330:	0008c303          	lbu	t1,0(a7)
    2334:	00f688b3          	add	a7,a3,a5
    2338:	00178793          	addi	a5,a5,1
    233c:	00688023          	sb	t1,0(a7)
    2340:	ff0796e3          	bne	a5,a6,232c <fatfs_sfn_create_entry+0x8>
    2344:	00e03733          	snez	a4,a4
    2348:	40e00733          	neg	a4,a4
    234c:	02000793          	li	a5,32
    2350:	ff077713          	andi	a4,a4,-16
    2354:	00f70733          	add	a4,a4,a5
    2358:	00f68823          	sb	a5,16(a3)
    235c:	00f68923          	sb	a5,18(a3)
    2360:	00f68c23          	sb	a5,24(a3)
    2364:	01065793          	srli	a5,a2,0x10
    2368:	00f68a23          	sb	a5,20(a3)
    236c:	01865793          	srli	a5,a2,0x18
    2370:	00f68aa3          	sb	a5,21(a3)
    2374:	0085d793          	srli	a5,a1,0x8
    2378:	00c68d23          	sb	a2,26(a3)
    237c:	00b68e23          	sb	a1,28(a3)
    2380:	00865613          	srli	a2,a2,0x8
    2384:	00f68ea3          	sb	a5,29(a3)
    2388:	0105d793          	srli	a5,a1,0x10
    238c:	0185d593          	srli	a1,a1,0x18
    2390:	000686a3          	sb	zero,13(a3)
    2394:	00068723          	sb	zero,14(a3)
    2398:	000687a3          	sb	zero,15(a3)
    239c:	000688a3          	sb	zero,17(a3)
    23a0:	000689a3          	sb	zero,19(a3)
    23a4:	00068b23          	sb	zero,22(a3)
    23a8:	00068ba3          	sb	zero,23(a3)
    23ac:	00068ca3          	sb	zero,25(a3)
    23b0:	00e685a3          	sb	a4,11(a3)
    23b4:	00068623          	sb	zero,12(a3)
    23b8:	00c68da3          	sb	a2,27(a3)
    23bc:	00f68f23          	sb	a5,30(a3)
    23c0:	00b68fa3          	sb	a1,31(a3)
    23c4:	00008067          	ret

000023c8 <fatfs_lfn_create_sfn>:
    23c8:	fd010113          	addi	sp,sp,-48
    23cc:	02912223          	sw	s1,36(sp)
    23d0:	00050493          	mv	s1,a0
    23d4:	00058513          	mv	a0,a1
    23d8:	02812423          	sw	s0,40(sp)
    23dc:	01312e23          	sw	s3,28(sp)
    23e0:	00058413          	mv	s0,a1
    23e4:	02112623          	sw	ra,44(sp)
    23e8:	03212023          	sw	s2,32(sp)
    23ec:	fffff097          	auipc	ra,0xfffff
    23f0:	e74080e7          	jalr	-396(ra) # 1260 <strlen>
    23f4:	00044783          	lbu	a5,0(s0)
    23f8:	02e00993          	li	s3,46
    23fc:	15378063          	beq	a5,s3,253c <fatfs_lfn_create_sfn+0x174>
    2400:	00b00613          	li	a2,11
    2404:	02000593          	li	a1,32
    2408:	00050913          	mv	s2,a0
    240c:	00048513          	mv	a0,s1
    2410:	fffff097          	auipc	ra,0xfffff
    2414:	e10080e7          	jalr	-496(ra) # 1220 <memset>
    2418:	00300613          	li	a2,3
    241c:	02000593          	li	a1,32
    2420:	00c10513          	addi	a0,sp,12
    2424:	fffff097          	auipc	ra,0xfffff
    2428:	dfc080e7          	jalr	-516(ra) # 1220 <memset>
    242c:	fff00793          	li	a5,-1
    2430:	00000713          	li	a4,0
    2434:	0d274263          	blt	a4,s2,24f8 <fatfs_lfn_create_sfn+0x130>
    2438:	fff00713          	li	a4,-1
    243c:	0ee78863          	beq	a5,a4,252c <fatfs_lfn_create_sfn+0x164>
    2440:	00178713          	addi	a4,a5,1
    2444:	00c10693          	addi	a3,sp,12
    2448:	00478613          	addi	a2,a5,4
    244c:	0ce61263          	bne	a2,a4,2510 <fatfs_lfn_create_sfn+0x148>
    2450:	00000613          	li	a2,0
    2454:	00000693          	li	a3,0
    2458:	01900813          	li	a6,25
    245c:	00800893          	li	a7,8
    2460:	02f6de63          	bge	a3,a5,249c <fatfs_lfn_create_sfn+0xd4>
    2464:	00d40733          	add	a4,s0,a3
    2468:	00074703          	lbu	a4,0(a4)
    246c:	fe070513          	addi	a0,a4,-32
    2470:	0c050263          	beqz	a0,2534 <fatfs_lfn_create_sfn+0x16c>
    2474:	fd270593          	addi	a1,a4,-46
    2478:	0a058e63          	beqz	a1,2534 <fatfs_lfn_create_sfn+0x16c>
    247c:	f9f70593          	addi	a1,a4,-97
    2480:	0ff5f593          	zext.b	a1,a1
    2484:	00c48333          	add	t1,s1,a2
    2488:	00160613          	addi	a2,a2,1
    248c:	00b86463          	bltu	a6,a1,2494 <fatfs_lfn_create_sfn+0xcc>
    2490:	0ff57713          	zext.b	a4,a0
    2494:	00e30023          	sb	a4,0(t1)
    2498:	09161e63          	bne	a2,a7,2534 <fatfs_lfn_create_sfn+0x16c>
    249c:	00c10793          	addi	a5,sp,12
    24a0:	00800693          	li	a3,8
    24a4:	01900513          	li	a0,25
    24a8:	00b00593          	li	a1,11
    24ac:	0007c703          	lbu	a4,0(a5)
    24b0:	f9f70613          	addi	a2,a4,-97
    24b4:	0ff67613          	zext.b	a2,a2
    24b8:	00c56663          	bltu	a0,a2,24c4 <fatfs_lfn_create_sfn+0xfc>
    24bc:	fe070713          	addi	a4,a4,-32
    24c0:	0ff77713          	zext.b	a4,a4
    24c4:	00d48633          	add	a2,s1,a3
    24c8:	00e60023          	sb	a4,0(a2)
    24cc:	00168693          	addi	a3,a3,1
    24d0:	00178793          	addi	a5,a5,1
    24d4:	fcb69ce3          	bne	a3,a1,24ac <fatfs_lfn_create_sfn+0xe4>
    24d8:	00100513          	li	a0,1
    24dc:	02c12083          	lw	ra,44(sp)
    24e0:	02812403          	lw	s0,40(sp)
    24e4:	02412483          	lw	s1,36(sp)
    24e8:	02012903          	lw	s2,32(sp)
    24ec:	01c12983          	lw	s3,28(sp)
    24f0:	03010113          	addi	sp,sp,48
    24f4:	00008067          	ret
    24f8:	00e406b3          	add	a3,s0,a4
    24fc:	0006c683          	lbu	a3,0(a3)
    2500:	01369463          	bne	a3,s3,2508 <fatfs_lfn_create_sfn+0x140>
    2504:	00070793          	mv	a5,a4
    2508:	00170713          	addi	a4,a4,1
    250c:	f29ff06f          	j	2434 <fatfs_lfn_create_sfn+0x6c>
    2510:	01275863          	bge	a4,s2,2520 <fatfs_lfn_create_sfn+0x158>
    2514:	00e405b3          	add	a1,s0,a4
    2518:	0005c583          	lbu	a1,0(a1)
    251c:	00b68023          	sb	a1,0(a3)
    2520:	00170713          	addi	a4,a4,1
    2524:	00168693          	addi	a3,a3,1
    2528:	f25ff06f          	j	244c <fatfs_lfn_create_sfn+0x84>
    252c:	00090793          	mv	a5,s2
    2530:	f21ff06f          	j	2450 <fatfs_lfn_create_sfn+0x88>
    2534:	00168693          	addi	a3,a3,1
    2538:	f29ff06f          	j	2460 <fatfs_lfn_create_sfn+0x98>
    253c:	00000513          	li	a0,0
    2540:	f9dff06f          	j	24dc <fatfs_lfn_create_sfn+0x114>

00002544 <fatfs_lfn_generate_tail>:
    2544:	000187b7          	lui	a5,0x18
    2548:	69f78793          	addi	a5,a5,1695 # 1869f <__stacktop+0x869f>
    254c:	16c7e463          	bltu	a5,a2,26b4 <fatfs_lfn_generate_tail+0x170>
    2550:	fa010113          	addi	sp,sp,-96
    2554:	04812c23          	sw	s0,88(sp)
    2558:	04912a23          	sw	s1,84(sp)
    255c:	03712e23          	sw	s7,60(sp)
    2560:	00060413          	mv	s0,a2
    2564:	00058b93          	mv	s7,a1
    2568:	00c00613          	li	a2,12
    256c:	00000593          	li	a1,0
    2570:	00050493          	mv	s1,a0
    2574:	00410513          	addi	a0,sp,4
    2578:	04112e23          	sw	ra,92(sp)
    257c:	05312623          	sw	s3,76(sp)
    2580:	05412423          	sw	s4,72(sp)
    2584:	05612023          	sw	s6,64(sp)
    2588:	05212823          	sw	s2,80(sp)
    258c:	05512223          	sw	s5,68(sp)
    2590:	fffff097          	auipc	ra,0xfffff
    2594:	c90080e7          	jalr	-880(ra) # 1220 <memset>
    2598:	000055b7          	lui	a1,0x5
    259c:	07e00793          	li	a5,126
    25a0:	01100613          	li	a2,17
    25a4:	f2058593          	addi	a1,a1,-224 # 4f20 <LEDS+0x9c>
    25a8:	01c10513          	addi	a0,sp,28
    25ac:	01010993          	addi	s3,sp,16
    25b0:	00f10223          	sb	a5,4(sp)
    25b4:	00098a13          	mv	s4,s3
    25b8:	fffff097          	auipc	ra,0xfffff
    25bc:	c84080e7          	jalr	-892(ra) # 123c <memcpy>
    25c0:	00900b13          	li	s6,9
    25c4:	00a00593          	li	a1,10
    25c8:	00040513          	mv	a0,s0
    25cc:	fffff097          	auipc	ra,0xfffff
    25d0:	bf0080e7          	jalr	-1040(ra) # 11bc <__umodsi3>
    25d4:	03050793          	addi	a5,a0,48
    25d8:	00278533          	add	a0,a5,sp
    25dc:	fec54783          	lbu	a5,-20(a0)
    25e0:	00098913          	mv	s2,s3
    25e4:	00040513          	mv	a0,s0
    25e8:	00a00593          	li	a1,10
    25ec:	00f98023          	sb	a5,0(s3)
    25f0:	00040a93          	mv	s5,s0
    25f4:	fffff097          	auipc	ra,0xfffff
    25f8:	b80080e7          	jalr	-1152(ra) # 1174 <__udivsi3>
    25fc:	00198993          	addi	s3,s3,1
    2600:	00050413          	mv	s0,a0
    2604:	fd5b60e3          	bltu	s6,s5,25c4 <fatfs_lfn_generate_tail+0x80>
    2608:	00098023          	sb	zero,0(s3)
    260c:	00410713          	addi	a4,sp,4
    2610:	00090793          	mv	a5,s2
    2614:	0947f663          	bgeu	a5,s4,26a0 <fatfs_lfn_generate_tail+0x15c>
    2618:	00f10713          	addi	a4,sp,15
    261c:	00000793          	li	a5,0
    2620:	00e96663          	bltu	s2,a4,262c <fatfs_lfn_generate_tail+0xe8>
    2624:	41490933          	sub	s2,s2,s4
    2628:	00190793          	addi	a5,s2,1
    262c:	03078793          	addi	a5,a5,48
    2630:	002787b3          	add	a5,a5,sp
    2634:	000b8593          	mv	a1,s7
    2638:	fc078aa3          	sb	zero,-43(a5)
    263c:	00b00613          	li	a2,11
    2640:	00048513          	mv	a0,s1
    2644:	fffff097          	auipc	ra,0xfffff
    2648:	bf8080e7          	jalr	-1032(ra) # 123c <memcpy>
    264c:	00410513          	addi	a0,sp,4
    2650:	fffff097          	auipc	ra,0xfffff
    2654:	c10080e7          	jalr	-1008(ra) # 1260 <strlen>
    2658:	40a484b3          	sub	s1,s1,a0
    265c:	00050613          	mv	a2,a0
    2660:	00410593          	addi	a1,sp,4
    2664:	00848513          	addi	a0,s1,8
    2668:	fffff097          	auipc	ra,0xfffff
    266c:	bd4080e7          	jalr	-1068(ra) # 123c <memcpy>
    2670:	05c12083          	lw	ra,92(sp)
    2674:	05812403          	lw	s0,88(sp)
    2678:	05412483          	lw	s1,84(sp)
    267c:	05012903          	lw	s2,80(sp)
    2680:	04c12983          	lw	s3,76(sp)
    2684:	04812a03          	lw	s4,72(sp)
    2688:	04412a83          	lw	s5,68(sp)
    268c:	04012b03          	lw	s6,64(sp)
    2690:	03c12b83          	lw	s7,60(sp)
    2694:	00100513          	li	a0,1
    2698:	06010113          	addi	sp,sp,96
    269c:	00008067          	ret
    26a0:	0007c683          	lbu	a3,0(a5)
    26a4:	00170713          	addi	a4,a4,1
    26a8:	fff78793          	addi	a5,a5,-1
    26ac:	00d70023          	sb	a3,0(a4)
    26b0:	f65ff06f          	j	2614 <fatfs_lfn_generate_tail+0xd0>
    26b4:	00000513          	li	a0,0
    26b8:	00008067          	ret

000026bc <fatfs_total_path_levels>:
    26bc:	fff00793          	li	a5,-1
    26c0:	06050263          	beqz	a0,2724 <fatfs_total_path_levels+0x68>
    26c4:	00054703          	lbu	a4,0(a0)
    26c8:	02f00793          	li	a5,47
    26cc:	00f71863          	bne	a4,a5,26dc <fatfs_total_path_levels+0x20>
    26d0:	00150513          	addi	a0,a0,1
    26d4:	00000793          	li	a5,0
    26d8:	0400006f          	j	2718 <fatfs_total_path_levels+0x5c>
    26dc:	00154703          	lbu	a4,1(a0)
    26e0:	03a00793          	li	a5,58
    26e4:	00f70a63          	beq	a4,a5,26f8 <fatfs_total_path_levels+0x3c>
    26e8:	00254683          	lbu	a3,2(a0)
    26ec:	05c00713          	li	a4,92
    26f0:	fff00793          	li	a5,-1
    26f4:	02e69863          	bne	a3,a4,2724 <fatfs_total_path_levels+0x68>
    26f8:	00350513          	addi	a0,a0,3
    26fc:	05c00713          	li	a4,92
    2700:	fd5ff06f          	j	26d4 <fatfs_total_path_levels+0x18>
    2704:	00150513          	addi	a0,a0,1
    2708:	00e68663          	beq	a3,a4,2714 <fatfs_total_path_levels+0x58>
    270c:	00054683          	lbu	a3,0(a0)
    2710:	fe069ae3          	bnez	a3,2704 <fatfs_total_path_levels+0x48>
    2714:	00178793          	addi	a5,a5,1
    2718:	00054683          	lbu	a3,0(a0)
    271c:	fe0698e3          	bnez	a3,270c <fatfs_total_path_levels+0x50>
    2720:	fff78793          	addi	a5,a5,-1
    2724:	00078513          	mv	a0,a5
    2728:	00008067          	ret

0000272c <fatfs_get_substring>:
    272c:	0cd05e63          	blez	a3,2808 <fatfs_get_substring+0xdc>
    2730:	0c050c63          	beqz	a0,2808 <fatfs_get_substring+0xdc>
    2734:	fe010113          	addi	sp,sp,-32
    2738:	00812c23          	sw	s0,24(sp)
    273c:	00112e23          	sw	ra,28(sp)
    2740:	00912a23          	sw	s1,20(sp)
    2744:	00054483          	lbu	s1,0(a0)
    2748:	02f00793          	li	a5,47
    274c:	00150413          	addi	s0,a0,1
    2750:	02f48463          	beq	s1,a5,2778 <fatfs_get_substring+0x4c>
    2754:	00154703          	lbu	a4,1(a0)
    2758:	03a00793          	li	a5,58
    275c:	00f70a63          	beq	a4,a5,2770 <fatfs_get_substring+0x44>
    2760:	00254803          	lbu	a6,2(a0)
    2764:	05c00713          	li	a4,92
    2768:	fff00793          	li	a5,-1
    276c:	04e81c63          	bne	a6,a4,27c4 <fatfs_get_substring+0x98>
    2770:	00350413          	addi	s0,a0,3
    2774:	05c00493          	li	s1,92
    2778:	00040513          	mv	a0,s0
    277c:	00d12623          	sw	a3,12(sp)
    2780:	00c12423          	sw	a2,8(sp)
    2784:	00b12223          	sw	a1,4(sp)
    2788:	fffff097          	auipc	ra,0xfffff
    278c:	ad8080e7          	jalr	-1320(ra) # 1260 <strlen>
    2790:	00c12683          	lw	a3,12(sp)
    2794:	00412583          	lw	a1,4(sp)
    2798:	00812603          	lw	a2,8(sp)
    279c:	00000713          	li	a4,0
    27a0:	00000813          	li	a6,0
    27a4:	00000793          	li	a5,0
    27a8:	fff68693          	addi	a3,a3,-1
    27ac:	00e608b3          	add	a7,a2,a4
    27b0:	02a7c663          	blt	a5,a0,27dc <fatfs_get_substring+0xb0>
    27b4:	00088023          	sb	zero,0(a7)
    27b8:	00064783          	lbu	a5,0(a2)
    27bc:	0017b793          	seqz	a5,a5
    27c0:	40f007b3          	neg	a5,a5
    27c4:	01c12083          	lw	ra,28(sp)
    27c8:	01812403          	lw	s0,24(sp)
    27cc:	01412483          	lw	s1,20(sp)
    27d0:	00078513          	mv	a0,a5
    27d4:	02010113          	addi	sp,sp,32
    27d8:	00008067          	ret
    27dc:	00f40333          	add	t1,s0,a5
    27e0:	00034303          	lbu	t1,0(t1)
    27e4:	00931863          	bne	t1,s1,27f4 <fatfs_get_substring+0xc8>
    27e8:	00180813          	addi	a6,a6,1
    27ec:	00178793          	addi	a5,a5,1
    27f0:	fbdff06f          	j	27ac <fatfs_get_substring+0x80>
    27f4:	feb81ce3          	bne	a6,a1,27ec <fatfs_get_substring+0xc0>
    27f8:	fed75ae3          	bge	a4,a3,27ec <fatfs_get_substring+0xc0>
    27fc:	00170713          	addi	a4,a4,1
    2800:	00688023          	sb	t1,0(a7)
    2804:	fe9ff06f          	j	27ec <fatfs_get_substring+0xc0>
    2808:	fff00793          	li	a5,-1
    280c:	00078513          	mv	a0,a5
    2810:	00008067          	ret

00002814 <fatfs_split_path>:
    2814:	fd010113          	addi	sp,sp,-48
    2818:	02912223          	sw	s1,36(sp)
    281c:	03212023          	sw	s2,32(sp)
    2820:	01312e23          	sw	s3,28(sp)
    2824:	01412c23          	sw	s4,24(sp)
    2828:	02112623          	sw	ra,44(sp)
    282c:	02812423          	sw	s0,40(sp)
    2830:	01512a23          	sw	s5,20(sp)
    2834:	00050993          	mv	s3,a0
    2838:	00058493          	mv	s1,a1
    283c:	00060913          	mv	s2,a2
    2840:	00068a13          	mv	s4,a3
    2844:	00e12623          	sw	a4,12(sp)
    2848:	00000097          	auipc	ra,0x0
    284c:	e74080e7          	jalr	-396(ra) # 26bc <fatfs_total_path_levels>
    2850:	fff00793          	li	a5,-1
    2854:	02f51863          	bne	a0,a5,2884 <fatfs_split_path+0x70>
    2858:	fff00413          	li	s0,-1
    285c:	02c12083          	lw	ra,44(sp)
    2860:	00040513          	mv	a0,s0
    2864:	02812403          	lw	s0,40(sp)
    2868:	02412483          	lw	s1,36(sp)
    286c:	02012903          	lw	s2,32(sp)
    2870:	01c12983          	lw	s3,28(sp)
    2874:	01812a03          	lw	s4,24(sp)
    2878:	01412a83          	lw	s5,20(sp)
    287c:	03010113          	addi	sp,sp,48
    2880:	00008067          	ret
    2884:	00c12683          	lw	a3,12(sp)
    2888:	00050593          	mv	a1,a0
    288c:	00a12623          	sw	a0,12(sp)
    2890:	000a0613          	mv	a2,s4
    2894:	00098513          	mv	a0,s3
    2898:	00000097          	auipc	ra,0x0
    289c:	e94080e7          	jalr	-364(ra) # 272c <fatfs_get_substring>
    28a0:	00050413          	mv	s0,a0
    28a4:	fa051ae3          	bnez	a0,2858 <fatfs_split_path+0x44>
    28a8:	00c12583          	lw	a1,12(sp)
    28ac:	00059663          	bnez	a1,28b8 <fatfs_split_path+0xa4>
    28b0:	00048023          	sb	zero,0(s1)
    28b4:	fa9ff06f          	j	285c <fatfs_split_path+0x48>
    28b8:	00098513          	mv	a0,s3
    28bc:	fffff097          	auipc	ra,0xfffff
    28c0:	9a4080e7          	jalr	-1628(ra) # 1260 <strlen>
    28c4:	00050a93          	mv	s5,a0
    28c8:	000a0513          	mv	a0,s4
    28cc:	fffff097          	auipc	ra,0xfffff
    28d0:	994080e7          	jalr	-1644(ra) # 1260 <strlen>
    28d4:	40aa8633          	sub	a2,s5,a0
    28d8:	00c95463          	bge	s2,a2,28e0 <fatfs_split_path+0xcc>
    28dc:	00090613          	mv	a2,s2
    28e0:	00048513          	mv	a0,s1
    28e4:	00098593          	mv	a1,s3
    28e8:	00c12623          	sw	a2,12(sp)
    28ec:	fffff097          	auipc	ra,0xfffff
    28f0:	950080e7          	jalr	-1712(ra) # 123c <memcpy>
    28f4:	00c12603          	lw	a2,12(sp)
    28f8:	00c484b3          	add	s1,s1,a2
    28fc:	fe048fa3          	sb	zero,-1(s1)
    2900:	f5dff06f          	j	285c <fatfs_split_path+0x48>

00002904 <fatfs_compare_names>:
    2904:	fd010113          	addi	sp,sp,-48
    2908:	02112623          	sw	ra,44(sp)
    290c:	03212023          	sw	s2,32(sp)
    2910:	01312e23          	sw	s3,28(sp)
    2914:	01412c23          	sw	s4,24(sp)
    2918:	01512a23          	sw	s5,20(sp)
    291c:	00058a13          	mv	s4,a1
    2920:	02812423          	sw	s0,40(sp)
    2924:	02912223          	sw	s1,36(sp)
    2928:	01612823          	sw	s6,16(sp)
    292c:	01712623          	sw	s7,12(sp)
    2930:	01812423          	sw	s8,8(sp)
    2934:	00050a93          	mv	s5,a0
    2938:	fffff097          	auipc	ra,0xfffff
    293c:	1c4080e7          	jalr	452(ra) # 1afc <FileString_GetExtension>
    2940:	00050993          	mv	s3,a0
    2944:	000a0513          	mv	a0,s4
    2948:	fffff097          	auipc	ra,0xfffff
    294c:	1b4080e7          	jalr	436(ra) # 1afc <FileString_GetExtension>
    2950:	fff00793          	li	a5,-1
    2954:	00050913          	mv	s2,a0
    2958:	02f99e63          	bne	s3,a5,2994 <fatfs_compare_names+0x90>
    295c:	0f350063          	beq	a0,s3,2a3c <fatfs_compare_names+0x138>
    2960:	00000513          	li	a0,0
    2964:	02c12083          	lw	ra,44(sp)
    2968:	02812403          	lw	s0,40(sp)
    296c:	02412483          	lw	s1,36(sp)
    2970:	02012903          	lw	s2,32(sp)
    2974:	01c12983          	lw	s3,28(sp)
    2978:	01812a03          	lw	s4,24(sp)
    297c:	01412a83          	lw	s5,20(sp)
    2980:	01012b03          	lw	s6,16(sp)
    2984:	00c12b83          	lw	s7,12(sp)
    2988:	00812c03          	lw	s8,8(sp)
    298c:	03010113          	addi	sp,sp,48
    2990:	00008067          	ret
    2994:	fcf506e3          	beq	a0,a5,2960 <fatfs_compare_names+0x5c>
    2998:	00198793          	addi	a5,s3,1
    299c:	00fa8b33          	add	s6,s5,a5
    29a0:	00050413          	mv	s0,a0
    29a4:	00150793          	addi	a5,a0,1
    29a8:	000b0513          	mv	a0,s6
    29ac:	00fa0bb3          	add	s7,s4,a5
    29b0:	fffff097          	auipc	ra,0xfffff
    29b4:	8b0080e7          	jalr	-1872(ra) # 1260 <strlen>
    29b8:	00050c13          	mv	s8,a0
    29bc:	000b8513          	mv	a0,s7
    29c0:	00098493          	mv	s1,s3
    29c4:	fffff097          	auipc	ra,0xfffff
    29c8:	89c080e7          	jalr	-1892(ra) # 1260 <strlen>
    29cc:	f8ac1ae3          	bne	s8,a0,2960 <fatfs_compare_names+0x5c>
    29d0:	000b0513          	mv	a0,s6
    29d4:	fffff097          	auipc	ra,0xfffff
    29d8:	88c080e7          	jalr	-1908(ra) # 1260 <strlen>
    29dc:	00050613          	mv	a2,a0
    29e0:	000b8593          	mv	a1,s7
    29e4:	000b0513          	mv	a0,s6
    29e8:	fffff097          	auipc	ra,0xfffff
    29ec:	0a4080e7          	jalr	164(ra) # 1a8c <FileString_StrCmpNoCase>
    29f0:	f60518e3          	bnez	a0,2960 <fatfs_compare_names+0x5c>
    29f4:	fff48793          	addi	a5,s1,-1
    29f8:	00fa87b3          	add	a5,s5,a5
    29fc:	41378733          	sub	a4,a5,s3
    2a00:	02000693          	li	a3,32
    2a04:	06e79263          	bne	a5,a4,2a68 <fatfs_compare_names+0x164>
    2a08:	fff40793          	addi	a5,s0,-1
    2a0c:	00fa07b3          	add	a5,s4,a5
    2a10:	41278733          	sub	a4,a5,s2
    2a14:	02000693          	li	a3,32
    2a18:	06e79263          	bne	a5,a4,2a7c <fatfs_compare_names+0x178>
    2a1c:	f53912e3          	bne	s2,s3,2960 <fatfs_compare_names+0x5c>
    2a20:	00090613          	mv	a2,s2
    2a24:	000a0593          	mv	a1,s4
    2a28:	000a8513          	mv	a0,s5
    2a2c:	fffff097          	auipc	ra,0xfffff
    2a30:	060080e7          	jalr	96(ra) # 1a8c <FileString_StrCmpNoCase>
    2a34:	00153513          	seqz	a0,a0
    2a38:	f2dff06f          	j	2964 <fatfs_compare_names+0x60>
    2a3c:	000a8513          	mv	a0,s5
    2a40:	fffff097          	auipc	ra,0xfffff
    2a44:	820080e7          	jalr	-2016(ra) # 1260 <strlen>
    2a48:	00050493          	mv	s1,a0
    2a4c:	00050993          	mv	s3,a0
    2a50:	000a0513          	mv	a0,s4
    2a54:	fffff097          	auipc	ra,0xfffff
    2a58:	80c080e7          	jalr	-2036(ra) # 1260 <strlen>
    2a5c:	00050413          	mv	s0,a0
    2a60:	00050913          	mv	s2,a0
    2a64:	f91ff06f          	j	29f4 <fatfs_compare_names+0xf0>
    2a68:	0007c603          	lbu	a2,0(a5)
    2a6c:	f8d61ee3          	bne	a2,a3,2a08 <fatfs_compare_names+0x104>
    2a70:	415789b3          	sub	s3,a5,s5
    2a74:	fff78793          	addi	a5,a5,-1
    2a78:	f8dff06f          	j	2a04 <fatfs_compare_names+0x100>
    2a7c:	0007c603          	lbu	a2,0(a5)
    2a80:	f8d61ee3          	bne	a2,a3,2a1c <fatfs_compare_names+0x118>
    2a84:	41478933          	sub	s2,a5,s4
    2a88:	fff78793          	addi	a5,a5,-1
    2a8c:	f8dff06f          	j	2a18 <fatfs_compare_names+0x114>

00002a90 <_check_file_open>:
    2a90:	fe010113          	addi	sp,sp,-32
    2a94:	000057b7          	lui	a5,0x5
    2a98:	00812c23          	sw	s0,24(sp)
    2a9c:	3907a403          	lw	s0,912(a5) # 5390 <_open_file_list>
    2aa0:	00912a23          	sw	s1,20(sp)
    2aa4:	00112e23          	sw	ra,28(sp)
    2aa8:	01212823          	sw	s2,16(sp)
    2aac:	01312623          	sw	s3,12(sp)
    2ab0:	00050493          	mv	s1,a0
    2ab4:	00041663          	bnez	s0,2ac0 <_check_file_open+0x30>
    2ab8:	00000513          	li	a0,0
    2abc:	03c0006f          	j	2af8 <_check_file_open+0x68>
    2ac0:	bc440793          	addi	a5,s0,-1084
    2ac4:	00f49663          	bne	s1,a5,2ad0 <_check_file_open+0x40>
    2ac8:	00442403          	lw	s0,4(s0)
    2acc:	fe9ff06f          	j	2ab4 <_check_file_open+0x24>
    2ad0:	01448593          	addi	a1,s1,20
    2ad4:	bd840513          	addi	a0,s0,-1064
    2ad8:	00000097          	auipc	ra,0x0
    2adc:	e2c080e7          	jalr	-468(ra) # 2904 <fatfs_compare_names>
    2ae0:	fe0504e3          	beqz	a0,2ac8 <_check_file_open+0x38>
    2ae4:	11848593          	addi	a1,s1,280
    2ae8:	cdc40513          	addi	a0,s0,-804
    2aec:	00000097          	auipc	ra,0x0
    2af0:	e18080e7          	jalr	-488(ra) # 2904 <fatfs_compare_names>
    2af4:	fc050ae3          	beqz	a0,2ac8 <_check_file_open+0x38>
    2af8:	01c12083          	lw	ra,28(sp)
    2afc:	01812403          	lw	s0,24(sp)
    2b00:	01412483          	lw	s1,20(sp)
    2b04:	01012903          	lw	s2,16(sp)
    2b08:	00c12983          	lw	s3,12(sp)
    2b0c:	02010113          	addi	sp,sp,32
    2b10:	00008067          	ret

00002b14 <fatfs_get_sfn_display_name>:
    2b14:	00000713          	li	a4,0
    2b18:	02000613          	li	a2,32
    2b1c:	01900813          	li	a6,25
    2b20:	0005c783          	lbu	a5,0(a1)
    2b24:	00078663          	beqz	a5,2b30 <fatfs_get_sfn_display_name+0x1c>
    2b28:	ff470693          	addi	a3,a4,-12
    2b2c:	00069863          	bnez	a3,2b3c <fatfs_get_sfn_display_name+0x28>
    2b30:	00050023          	sb	zero,0(a0)
    2b34:	00100513          	li	a0,1
    2b38:	00008067          	ret
    2b3c:	00158593          	addi	a1,a1,1
    2b40:	fec780e3          	beq	a5,a2,2b20 <fatfs_get_sfn_display_name+0xc>
    2b44:	fbf78693          	addi	a3,a5,-65
    2b48:	0ff6f693          	zext.b	a3,a3
    2b4c:	00d86663          	bltu	a6,a3,2b58 <fatfs_get_sfn_display_name+0x44>
    2b50:	02078793          	addi	a5,a5,32
    2b54:	0ff7f793          	zext.b	a5,a5
    2b58:	00f50023          	sb	a5,0(a0)
    2b5c:	00170713          	addi	a4,a4,1
    2b60:	00150513          	addi	a0,a0,1
    2b64:	fbdff06f          	j	2b20 <fatfs_get_sfn_display_name+0xc>

00002b68 <fatfs_fat_init>:
    2b68:	ff010113          	addi	sp,sp,-16
    2b6c:	00812423          	sw	s0,8(sp)
    2b70:	00912223          	sw	s1,4(sp)
    2b74:	00112623          	sw	ra,12(sp)
    2b78:	fff00793          	li	a5,-1
    2b7c:	25850493          	addi	s1,a0,600
    2b80:	00050413          	mv	s0,a0
    2b84:	44f52c23          	sw	a5,1112(a0)
    2b88:	24052a23          	sw	zero,596(a0)
    2b8c:	44052e23          	sw	zero,1116(a0)
    2b90:	20000613          	li	a2,512
    2b94:	00048513          	mv	a0,s1
    2b98:	00000593          	li	a1,0
    2b9c:	ffffe097          	auipc	ra,0xffffe
    2ba0:	684080e7          	jalr	1668(ra) # 1220 <memset>
    2ba4:	25442783          	lw	a5,596(s0)
    2ba8:	00c12083          	lw	ra,12(sp)
    2bac:	24942a23          	sw	s1,596(s0)
    2bb0:	46042023          	sw	zero,1120(s0)
    2bb4:	46f42223          	sw	a5,1124(s0)
    2bb8:	00812403          	lw	s0,8(sp)
    2bbc:	00412483          	lw	s1,4(sp)
    2bc0:	01010113          	addi	sp,sp,16
    2bc4:	00008067          	ret

00002bc8 <fatfs_init>:
    2bc8:	fd010113          	addi	sp,sp,-48
    2bcc:	02812423          	sw	s0,40(sp)
    2bd0:	02112623          	sw	ra,44(sp)
    2bd4:	02912223          	sw	s1,36(sp)
    2bd8:	03212023          	sw	s2,32(sp)
    2bdc:	01312e23          	sw	s3,28(sp)
    2be0:	fff00793          	li	a5,-1
    2be4:	24f52223          	sw	a5,580(a0)
    2be8:	24052423          	sw	zero,584(a0)
    2bec:	02052223          	sw	zero,36(a0)
    2bf0:	00050413          	mv	s0,a0
    2bf4:	00000097          	auipc	ra,0x0
    2bf8:	f74080e7          	jalr	-140(ra) # 2b68 <fatfs_fat_init>
    2bfc:	03442783          	lw	a5,52(s0)
    2c00:	02079463          	bnez	a5,2c28 <fatfs_init+0x60>
    2c04:	fff00713          	li	a4,-1
    2c08:	02c12083          	lw	ra,44(sp)
    2c0c:	02812403          	lw	s0,40(sp)
    2c10:	02412483          	lw	s1,36(sp)
    2c14:	02012903          	lw	s2,32(sp)
    2c18:	01c12983          	lw	s3,28(sp)
    2c1c:	00070513          	mv	a0,a4
    2c20:	03010113          	addi	sp,sp,48
    2c24:	00008067          	ret
    2c28:	04440593          	addi	a1,s0,68
    2c2c:	00100613          	li	a2,1
    2c30:	00000513          	li	a0,0
    2c34:	00b12623          	sw	a1,12(sp)
    2c38:	000780e7          	jalr	a5
    2c3c:	fc0504e3          	beqz	a0,2c04 <fatfs_init+0x3c>
    2c40:	24244703          	lbu	a4,578(s0)
    2c44:	05500793          	li	a5,85
    2c48:	00c12583          	lw	a1,12(sp)
    2c4c:	00f70663          	beq	a4,a5,2c58 <fatfs_init+0x90>
    2c50:	ffd00713          	li	a4,-3
    2c54:	fb5ff06f          	j	2c08 <fatfs_init+0x40>
    2c58:	24344703          	lbu	a4,579(s0)
    2c5c:	0aa00793          	li	a5,170
    2c60:	fef718e3          	bne	a4,a5,2c50 <fatfs_init+0x88>
    2c64:	20644783          	lbu	a5,518(s0)
    2c68:	00600713          	li	a4,6
    2c6c:	02f76463          	bltu	a4,a5,2c94 <fatfs_init+0xcc>
    2c70:	00400713          	li	a4,4
    2c74:	00f76663          	bltu	a4,a5,2c80 <fatfs_init+0xb8>
    2c78:	00000513          	li	a0,0
    2c7c:	02078663          	beqz	a5,2ca8 <fatfs_init+0xe0>
    2c80:	20c45503          	lhu	a0,524(s0)
    2c84:	20a45783          	lhu	a5,522(s0)
    2c88:	01051513          	slli	a0,a0,0x10
    2c8c:	00f56533          	or	a0,a0,a5
    2c90:	0180006f          	j	2ca8 <fatfs_init+0xe0>
    2c94:	00c00713          	li	a4,12
    2c98:	12f76663          	bltu	a4,a5,2dc4 <fatfs_init+0x1fc>
    2c9c:	00a00713          	li	a4,10
    2ca0:	00000513          	li	a0,0
    2ca4:	fcf76ee3          	bltu	a4,a5,2c80 <fatfs_init+0xb8>
    2ca8:	03442783          	lw	a5,52(s0)
    2cac:	00a42e23          	sw	a0,28(s0)
    2cb0:	00100613          	li	a2,1
    2cb4:	000780e7          	jalr	a5
    2cb8:	f40506e3          	beqz	a0,2c04 <fatfs_init+0x3c>
    2cbc:	05044783          	lbu	a5,80(s0)
    2cc0:	04f44703          	lbu	a4,79(s0)
    2cc4:	20000693          	li	a3,512
    2cc8:	00879793          	slli	a5,a5,0x8
    2ccc:	00e7e7b3          	or	a5,a5,a4
    2cd0:	ffe00713          	li	a4,-2
    2cd4:	f2d79ae3          	bne	a5,a3,2c08 <fatfs_init+0x40>
    2cd8:	05644483          	lbu	s1,86(s0)
    2cdc:	05544783          	lbu	a5,85(s0)
    2ce0:	05144983          	lbu	s3,81(s0)
    2ce4:	00849493          	slli	s1,s1,0x8
    2ce8:	05a45583          	lhu	a1,90(s0)
    2cec:	00f4e4b3          	or	s1,s1,a5
    2cf0:	01340023          	sb	s3,0(s0)
    2cf4:	02941423          	sh	s1,40(s0)
    2cf8:	05245903          	lhu	s2,82(s0)
    2cfc:	05444503          	lbu	a0,84(s0)
    2d00:	00059463          	bnez	a1,2d08 <fatfs_init+0x140>
    2d04:	06842583          	lw	a1,104(s0)
    2d08:	07042783          	lw	a5,112(s0)
    2d0c:	02b42023          	sw	a1,32(s0)
    2d10:	00549493          	slli	s1,s1,0x5
    2d14:	00f42423          	sw	a5,8(s0)
    2d18:	07445783          	lhu	a5,116(s0)
    2d1c:	1ff48493          	addi	s1,s1,511
    2d20:	4094d493          	srai	s1,s1,0x9
    2d24:	00f41c23          	sh	a5,24(s0)
    2d28:	fffff097          	auipc	ra,0xfffff
    2d2c:	ccc080e7          	jalr	-820(ra) # 19f4 <__mulsi3>
    2d30:	00a907b3          	add	a5,s2,a0
    2d34:	00f42623          	sw	a5,12(s0)
    2d38:	01c42783          	lw	a5,28(s0)
    2d3c:	24245703          	lhu	a4,578(s0)
    2d40:	00942823          	sw	s1,16(s0)
    2d44:	00f907b3          	add	a5,s2,a5
    2d48:	00f42a23          	sw	a5,20(s0)
    2d4c:	00f507b3          	add	a5,a0,a5
    2d50:	00f42223          	sw	a5,4(s0)
    2d54:	0000b7b7          	lui	a5,0xb
    2d58:	a5578793          	addi	a5,a5,-1451 # aa55 <framebuffer+0x3a99>
    2d5c:	eef71ae3          	bne	a4,a5,2c50 <fatfs_init+0x88>
    2d60:	05844783          	lbu	a5,88(s0)
    2d64:	05744703          	lbu	a4,87(s0)
    2d68:	00879793          	slli	a5,a5,0x8
    2d6c:	00e7e7b3          	or	a5,a5,a4
    2d70:	00079463          	bnez	a5,2d78 <fatfs_init+0x1b0>
    2d74:	06442783          	lw	a5,100(s0)
    2d78:	ffb00713          	li	a4,-5
    2d7c:	e80986e3          	beqz	s3,2c08 <fatfs_init+0x40>
    2d80:	00990933          	add	s2,s2,s1
    2d84:	00a90533          	add	a0,s2,a0
    2d88:	40a78533          	sub	a0,a5,a0
    2d8c:	00098593          	mv	a1,s3
    2d90:	ffffe097          	auipc	ra,0xffffe
    2d94:	3e4080e7          	jalr	996(ra) # 1174 <__udivsi3>
    2d98:	000017b7          	lui	a5,0x1
    2d9c:	ff478793          	addi	a5,a5,-12 # ff4 <sdcard_init+0x34>
    2da0:	ffb00713          	li	a4,-5
    2da4:	e6a7f2e3          	bgeu	a5,a0,2c08 <fatfs_init+0x40>
    2da8:	000107b7          	lui	a5,0x10
    2dac:	ff478793          	addi	a5,a5,-12 # fff4 <_files+0x4bd0>
    2db0:	02a7e663          	bltu	a5,a0,2ddc <fatfs_init+0x214>
    2db4:	00042423          	sw	zero,8(s0)
    2db8:	02042823          	sw	zero,48(s0)
    2dbc:	00000713          	li	a4,0
    2dc0:	e49ff06f          	j	2c08 <fatfs_init+0x40>
    2dc4:	ff278793          	addi	a5,a5,-14
    2dc8:	0ff7f793          	zext.b	a5,a5
    2dcc:	00100713          	li	a4,1
    2dd0:	00000513          	li	a0,0
    2dd4:	eaf776e3          	bgeu	a4,a5,2c80 <fatfs_init+0xb8>
    2dd8:	ed1ff06f          	j	2ca8 <fatfs_init+0xe0>
    2ddc:	00100793          	li	a5,1
    2de0:	02f42823          	sw	a5,48(s0)
    2de4:	fd9ff06f          	j	2dbc <fatfs_init+0x1f4>

00002de8 <fl_attach_media>:
    2de8:	000057b7          	lui	a5,0x5
    2dec:	39c7a783          	lw	a5,924(a5) # 539c <_filelib_init>
    2df0:	fe010113          	addi	sp,sp,-32
    2df4:	00812c23          	sw	s0,24(sp)
    2df8:	00112e23          	sw	ra,28(sp)
    2dfc:	00050413          	mv	s0,a0
    2e00:	00079a63          	bnez	a5,2e14 <fl_attach_media+0x2c>
    2e04:	00b12623          	sw	a1,12(sp)
    2e08:	fffff097          	auipc	ra,0xfffff
    2e0c:	080080e7          	jalr	128(ra) # 1e88 <fl_init>
    2e10:	00c12583          	lw	a1,12(sp)
    2e14:	0000b7b7          	lui	a5,0xb
    2e18:	fbc78513          	addi	a0,a5,-68 # afbc <_fs>
    2e1c:	02b52c23          	sw	a1,56(a0)
    2e20:	02852a23          	sw	s0,52(a0)
    2e24:	00000097          	auipc	ra,0x0
    2e28:	da4080e7          	jalr	-604(ra) # 2bc8 <fatfs_init>
    2e2c:	00050593          	mv	a1,a0
    2e30:	02050863          	beqz	a0,2e60 <fl_attach_media+0x78>
    2e34:	00a12623          	sw	a0,12(sp)
    2e38:	00005537          	lui	a0,0x5
    2e3c:	f3450513          	addi	a0,a0,-204 # 4f34 <LEDS+0xb0>
    2e40:	fffff097          	auipc	ra,0xfffff
    2e44:	a78080e7          	jalr	-1416(ra) # 18b8 <printf>
    2e48:	00c12583          	lw	a1,12(sp)
    2e4c:	01c12083          	lw	ra,28(sp)
    2e50:	01812403          	lw	s0,24(sp)
    2e54:	00058513          	mv	a0,a1
    2e58:	02010113          	addi	sp,sp,32
    2e5c:	00008067          	ret
    2e60:	000057b7          	lui	a5,0x5
    2e64:	00100713          	li	a4,1
    2e68:	38e7ac23          	sw	a4,920(a5) # 5398 <_filelib_valid>
    2e6c:	fe1ff06f          	j	2e4c <fl_attach_media+0x64>

00002e70 <fatfs_fat_purge>:
    2e70:	25452583          	lw	a1,596(a0)
    2e74:	fe010113          	addi	sp,sp,-32
    2e78:	00812c23          	sw	s0,24(sp)
    2e7c:	00112e23          	sw	ra,28(sp)
    2e80:	00050413          	mv	s0,a0
    2e84:	00059663          	bnez	a1,2e90 <fatfs_fat_purge+0x20>
    2e88:	00100513          	li	a0,1
    2e8c:	02c0006f          	j	2eb8 <fatfs_fat_purge+0x48>
    2e90:	2045a783          	lw	a5,516(a1)
    2e94:	00079663          	bnez	a5,2ea0 <fatfs_fat_purge+0x30>
    2e98:	20c5a583          	lw	a1,524(a1)
    2e9c:	fe9ff06f          	j	2e84 <fatfs_fat_purge+0x14>
    2ea0:	00040513          	mv	a0,s0
    2ea4:	00b12623          	sw	a1,12(sp)
    2ea8:	fffff097          	auipc	ra,0xfffff
    2eac:	c80080e7          	jalr	-896(ra) # 1b28 <fatfs_fat_writeback>
    2eb0:	00c12583          	lw	a1,12(sp)
    2eb4:	fe0512e3          	bnez	a0,2e98 <fatfs_fat_purge+0x28>
    2eb8:	01c12083          	lw	ra,28(sp)
    2ebc:	01812403          	lw	s0,24(sp)
    2ec0:	02010113          	addi	sp,sp,32
    2ec4:	00008067          	ret

00002ec8 <fatfs_find_next_cluster>:
    2ec8:	ff010113          	addi	sp,sp,-16
    2ecc:	00812423          	sw	s0,8(sp)
    2ed0:	01212023          	sw	s2,0(sp)
    2ed4:	00112623          	sw	ra,12(sp)
    2ed8:	00912223          	sw	s1,4(sp)
    2edc:	00050913          	mv	s2,a0
    2ee0:	00200413          	li	s0,2
    2ee4:	00058463          	beqz	a1,2eec <fatfs_find_next_cluster+0x24>
    2ee8:	00058413          	mv	s0,a1
    2eec:	03092783          	lw	a5,48(s2)
    2ef0:	00745493          	srli	s1,s0,0x7
    2ef4:	00079463          	bnez	a5,2efc <fatfs_find_next_cluster+0x34>
    2ef8:	00845493          	srli	s1,s0,0x8
    2efc:	01492583          	lw	a1,20(s2)
    2f00:	00090513          	mv	a0,s2
    2f04:	00b485b3          	add	a1,s1,a1
    2f08:	fffff097          	auipc	ra,0xfffff
    2f0c:	ca4080e7          	jalr	-860(ra) # 1bac <fatfs_fat_read_sector>
    2f10:	00050793          	mv	a5,a0
    2f14:	fff00513          	li	a0,-1
    2f18:	04078863          	beqz	a5,2f68 <fatfs_find_next_cluster+0xa0>
    2f1c:	03092703          	lw	a4,48(s2)
    2f20:	2087a783          	lw	a5,520(a5)
    2f24:	04071e63          	bnez	a4,2f80 <fatfs_find_next_cluster+0xb8>
    2f28:	00849493          	slli	s1,s1,0x8
    2f2c:	40940433          	sub	s0,s0,s1
    2f30:	00141413          	slli	s0,s0,0x1
    2f34:	01041413          	slli	s0,s0,0x10
    2f38:	01045413          	srli	s0,s0,0x10
    2f3c:	008787b3          	add	a5,a5,s0
    2f40:	0017c503          	lbu	a0,1(a5)
    2f44:	0007c783          	lbu	a5,0(a5)
    2f48:	00851513          	slli	a0,a0,0x8
    2f4c:	00f50533          	add	a0,a0,a5
    2f50:	ffff07b7          	lui	a5,0xffff0
    2f54:	00878793          	addi	a5,a5,8 # ffff0008 <__stacktop+0xfffe0008>
    2f58:	00f507b3          	add	a5,a0,a5
    2f5c:	00700713          	li	a4,7
    2f60:	00f76463          	bltu	a4,a5,2f68 <fatfs_find_next_cluster+0xa0>
    2f64:	fff00513          	li	a0,-1
    2f68:	00c12083          	lw	ra,12(sp)
    2f6c:	00812403          	lw	s0,8(sp)
    2f70:	00412483          	lw	s1,4(sp)
    2f74:	00012903          	lw	s2,0(sp)
    2f78:	01010113          	addi	sp,sp,16
    2f7c:	00008067          	ret
    2f80:	00749493          	slli	s1,s1,0x7
    2f84:	40940433          	sub	s0,s0,s1
    2f88:	00241413          	slli	s0,s0,0x2
    2f8c:	01041413          	slli	s0,s0,0x10
    2f90:	01045413          	srli	s0,s0,0x10
    2f94:	008787b3          	add	a5,a5,s0
    2f98:	0037c503          	lbu	a0,3(a5)
    2f9c:	0027c703          	lbu	a4,2(a5)
    2fa0:	01851513          	slli	a0,a0,0x18
    2fa4:	01071713          	slli	a4,a4,0x10
    2fa8:	00e50533          	add	a0,a0,a4
    2fac:	0007c703          	lbu	a4,0(a5)
    2fb0:	0017c783          	lbu	a5,1(a5)
    2fb4:	00e50533          	add	a0,a0,a4
    2fb8:	00879793          	slli	a5,a5,0x8
    2fbc:	00f50533          	add	a0,a0,a5
    2fc0:	00451513          	slli	a0,a0,0x4
    2fc4:	00455513          	srli	a0,a0,0x4
    2fc8:	f00007b7          	lui	a5,0xf0000
    2fcc:	f89ff06f          	j	2f54 <fatfs_find_next_cluster+0x8c>

00002fd0 <fatfs_sector_reader>:
    2fd0:	03052783          	lw	a5,48(a0)
    2fd4:	fe010113          	addi	sp,sp,-32
    2fd8:	00812c23          	sw	s0,24(sp)
    2fdc:	01212823          	sw	s2,16(sp)
    2fe0:	01512223          	sw	s5,4(sp)
    2fe4:	00112e23          	sw	ra,28(sp)
    2fe8:	00912a23          	sw	s1,20(sp)
    2fec:	01312623          	sw	s3,12(sp)
    2ff0:	01412423          	sw	s4,8(sp)
    2ff4:	01612023          	sw	s6,0(sp)
    2ff8:	00f5e7b3          	or	a5,a1,a5
    2ffc:	00050413          	mv	s0,a0
    3000:	00060913          	mv	s2,a2
    3004:	00068a93          	mv	s5,a3
    3008:	08079063          	bnez	a5,3088 <fatfs_sector_reader+0xb8>
    300c:	01052783          	lw	a5,16(a0)
    3010:	02f66863          	bltu	a2,a5,3040 <fatfs_sector_reader+0x70>
    3014:	00000513          	li	a0,0
    3018:	01c12083          	lw	ra,28(sp)
    301c:	01812403          	lw	s0,24(sp)
    3020:	01412483          	lw	s1,20(sp)
    3024:	01012903          	lw	s2,16(sp)
    3028:	00c12983          	lw	s3,12(sp)
    302c:	00812a03          	lw	s4,8(sp)
    3030:	00412a83          	lw	s5,4(sp)
    3034:	00012b03          	lw	s6,0(sp)
    3038:	02010113          	addi	sp,sp,32
    303c:	00008067          	ret
    3040:	01c52503          	lw	a0,28(a0)
    3044:	00c42783          	lw	a5,12(s0)
    3048:	00f50533          	add	a0,a0,a5
    304c:	01250533          	add	a0,a0,s2
    3050:	0a0a8663          	beqz	s5,30fc <fatfs_sector_reader+0x12c>
    3054:	03442783          	lw	a5,52(s0)
    3058:	00100613          	li	a2,1
    305c:	000a8593          	mv	a1,s5
    3060:	01812403          	lw	s0,24(sp)
    3064:	01c12083          	lw	ra,28(sp)
    3068:	01412483          	lw	s1,20(sp)
    306c:	01012903          	lw	s2,16(sp)
    3070:	00c12983          	lw	s3,12(sp)
    3074:	00812a03          	lw	s4,8(sp)
    3078:	00412a83          	lw	s5,4(sp)
    307c:	00012b03          	lw	s6,0(sp)
    3080:	02010113          	addi	sp,sp,32
    3084:	00078067          	jr	a5 # f0000000 <__stacktop+0xefff0000>
    3088:	00054783          	lbu	a5,0(a0)
    308c:	00058493          	mv	s1,a1
    3090:	00060513          	mv	a0,a2
    3094:	00078593          	mv	a1,a5
    3098:	00078a13          	mv	s4,a5
    309c:	ffffe097          	auipc	ra,0xffffe
    30a0:	0d8080e7          	jalr	216(ra) # 1174 <__udivsi3>
    30a4:	00050b13          	mv	s6,a0
    30a8:	00000993          	li	s3,0
    30ac:	03699a63          	bne	s3,s6,30e0 <fatfs_sector_reader+0x110>
    30b0:	fff00793          	li	a5,-1
    30b4:	f6f480e3          	beq	s1,a5,3014 <fatfs_sector_reader+0x44>
    30b8:	000a0593          	mv	a1,s4
    30bc:	00090513          	mv	a0,s2
    30c0:	ffffe097          	auipc	ra,0xffffe
    30c4:	0fc080e7          	jalr	252(ra) # 11bc <__umodsi3>
    30c8:	00050913          	mv	s2,a0
    30cc:	00048593          	mv	a1,s1
    30d0:	00040513          	mv	a0,s0
    30d4:	fffff097          	auipc	ra,0xfffff
    30d8:	c84080e7          	jalr	-892(ra) # 1d58 <fatfs_lba_of_cluster>
    30dc:	f71ff06f          	j	304c <fatfs_sector_reader+0x7c>
    30e0:	00048593          	mv	a1,s1
    30e4:	00040513          	mv	a0,s0
    30e8:	00000097          	auipc	ra,0x0
    30ec:	de0080e7          	jalr	-544(ra) # 2ec8 <fatfs_find_next_cluster>
    30f0:	00050493          	mv	s1,a0
    30f4:	00198993          	addi	s3,s3,1
    30f8:	fb5ff06f          	j	30ac <fatfs_sector_reader+0xdc>
    30fc:	24442783          	lw	a5,580(s0)
    3100:	00a78c63          	beq	a5,a0,3118 <fatfs_sector_reader+0x148>
    3104:	03442783          	lw	a5,52(s0)
    3108:	24a42223          	sw	a0,580(s0)
    310c:	00100613          	li	a2,1
    3110:	04440593          	addi	a1,s0,68
    3114:	f4dff06f          	j	3060 <fatfs_sector_reader+0x90>
    3118:	00100513          	li	a0,1
    311c:	efdff06f          	j	3018 <fatfs_sector_reader+0x48>

00003120 <fatfs_get_file_entry>:
    3120:	eb010113          	addi	sp,sp,-336
    3124:	14812423          	sw	s0,328(sp)
    3128:	14912223          	sw	s1,324(sp)
    312c:	13312e23          	sw	s3,316(sp)
    3130:	13712623          	sw	s7,300(sp)
    3134:	13812423          	sw	s8,296(sp)
    3138:	13912223          	sw	s9,292(sp)
    313c:	14112623          	sw	ra,332(sp)
    3140:	15212023          	sw	s2,320(sp)
    3144:	13412c23          	sw	s4,312(sp)
    3148:	13512a23          	sw	s5,308(sp)
    314c:	13612823          	sw	s6,304(sp)
    3150:	00050993          	mv	s3,a0
    3154:	00058c93          	mv	s9,a1
    3158:	00060b93          	mv	s7,a2
    315c:	00068c13          	mv	s8,a3
    3160:	10010ea3          	sb	zero,285(sp)
    3164:	01810413          	addi	s0,sp,24
    3168:	11c10493          	addi	s1,sp,284
    316c:	00040513          	mv	a0,s0
    3170:	00d00613          	li	a2,13
    3174:	00000593          	li	a1,0
    3178:	00d40413          	addi	s0,s0,13
    317c:	ffffe097          	auipc	ra,0xffffe
    3180:	0a4080e7          	jalr	164(ra) # 1220 <memset>
    3184:	fe9414e3          	bne	s0,s1,316c <fatfs_get_file_entry+0x4c>
    3188:	00000493          	li	s1,0
    318c:	24498a13          	addi	s4,s3,580
    3190:	00810913          	addi	s2,sp,8
    3194:	00800a93          	li	s5,8
    3198:	02e00b13          	li	s6,46
    319c:	00000693          	li	a3,0
    31a0:	00048613          	mv	a2,s1
    31a4:	000c8593          	mv	a1,s9
    31a8:	00098513          	mv	a0,s3
    31ac:	00000097          	auipc	ra,0x0
    31b0:	e24080e7          	jalr	-476(ra) # 2fd0 <fatfs_sector_reader>
    31b4:	08050c63          	beqz	a0,324c <fatfs_get_file_entry+0x12c>
    31b8:	00148493          	addi	s1,s1,1
    31bc:	04498413          	addi	s0,s3,68
    31c0:	00040513          	mv	a0,s0
    31c4:	fffff097          	auipc	ra,0xfffff
    31c8:	f34080e7          	jalr	-204(ra) # 20f8 <fatfs_entry_lfn_text>
    31cc:	02050063          	beqz	a0,31ec <fatfs_get_file_entry+0xcc>
    31d0:	00040593          	mv	a1,s0
    31d4:	01810513          	addi	a0,sp,24
    31d8:	fffff097          	auipc	ra,0xfffff
    31dc:	e18080e7          	jalr	-488(ra) # 1ff0 <fatfs_lfn_cache_entry>
    31e0:	02040413          	addi	s0,s0,32
    31e4:	fd441ee3          	bne	s0,s4,31c0 <fatfs_get_file_entry+0xa0>
    31e8:	fb5ff06f          	j	319c <fatfs_get_file_entry+0x7c>
    31ec:	00040513          	mv	a0,s0
    31f0:	fffff097          	auipc	ra,0xfffff
    31f4:	f1c080e7          	jalr	-228(ra) # 210c <fatfs_entry_lfn_invalid>
    31f8:	00050663          	beqz	a0,3204 <fatfs_get_file_entry+0xe4>
    31fc:	10010ea3          	sb	zero,285(sp)
    3200:	fe1ff06f          	j	31e0 <fatfs_get_file_entry+0xc0>
    3204:	00040593          	mv	a1,s0
    3208:	01810513          	addi	a0,sp,24
    320c:	fffff097          	auipc	ra,0xfffff
    3210:	f34080e7          	jalr	-204(ra) # 2140 <fatfs_entry_lfn_exists>
    3214:	06050663          	beqz	a0,3280 <fatfs_get_file_entry+0x160>
    3218:	01810513          	addi	a0,sp,24
    321c:	fffff097          	auipc	ra,0xfffff
    3220:	ea0080e7          	jalr	-352(ra) # 20bc <fatfs_lfn_cache_get>
    3224:	000b8593          	mv	a1,s7
    3228:	fffff097          	auipc	ra,0xfffff
    322c:	6dc080e7          	jalr	1756(ra) # 2904 <fatfs_compare_names>
    3230:	fc0506e3          	beqz	a0,31fc <fatfs_get_file_entry+0xdc>
    3234:	02000613          	li	a2,32
    3238:	00040593          	mv	a1,s0
    323c:	000c0513          	mv	a0,s8
    3240:	ffffe097          	auipc	ra,0xffffe
    3244:	ffc080e7          	jalr	-4(ra) # 123c <memcpy>
    3248:	00100513          	li	a0,1
    324c:	14c12083          	lw	ra,332(sp)
    3250:	14812403          	lw	s0,328(sp)
    3254:	14412483          	lw	s1,324(sp)
    3258:	14012903          	lw	s2,320(sp)
    325c:	13c12983          	lw	s3,316(sp)
    3260:	13812a03          	lw	s4,312(sp)
    3264:	13412a83          	lw	s5,308(sp)
    3268:	13012b03          	lw	s6,304(sp)
    326c:	12c12b83          	lw	s7,300(sp)
    3270:	12812c03          	lw	s8,296(sp)
    3274:	12412c83          	lw	s9,292(sp)
    3278:	15010113          	addi	sp,sp,336
    327c:	00008067          	ret
    3280:	00040513          	mv	a0,s0
    3284:	fffff097          	auipc	ra,0xfffff
    3288:	f0c080e7          	jalr	-244(ra) # 2190 <fatfs_entry_sfn_only>
    328c:	f4050ae3          	beqz	a0,31e0 <fatfs_get_file_entry+0xc0>
    3290:	00d00613          	li	a2,13
    3294:	00000593          	li	a1,0
    3298:	00090513          	mv	a0,s2
    329c:	ffffe097          	auipc	ra,0xffffe
    32a0:	f84080e7          	jalr	-124(ra) # 1220 <memset>
    32a4:	00000793          	li	a5,0
    32a8:	00f406b3          	add	a3,s0,a5
    32ac:	0006c683          	lbu	a3,0(a3)
    32b0:	00f90733          	add	a4,s2,a5
    32b4:	00178793          	addi	a5,a5,1
    32b8:	00d70023          	sb	a3,0(a4)
    32bc:	ff5796e3          	bne	a5,s5,32a8 <fatfs_get_file_entry+0x188>
    32c0:	00844703          	lbu	a4,8(s0)
    32c4:	00944783          	lbu	a5,9(s0)
    32c8:	00a44683          	lbu	a3,10(s0)
    32cc:	00e108a3          	sb	a4,17(sp)
    32d0:	00f10923          	sb	a5,18(sp)
    32d4:	fe070713          	addi	a4,a4,-32
    32d8:	fe078793          	addi	a5,a5,-32
    32dc:	00f037b3          	snez	a5,a5
    32e0:	00e03733          	snez	a4,a4
    32e4:	00d109a3          	sb	a3,19(sp)
    32e8:	00e7e7b3          	or	a5,a5,a4
    32ec:	00079863          	bnez	a5,32fc <fatfs_get_file_entry+0x1dc>
    32f0:	fe068693          	addi	a3,a3,-32
    32f4:	02000793          	li	a5,32
    32f8:	00068a63          	beqz	a3,330c <fatfs_get_file_entry+0x1ec>
    32fc:	00814703          	lbu	a4,8(sp)
    3300:	02e00793          	li	a5,46
    3304:	01671463          	bne	a4,s6,330c <fatfs_get_file_entry+0x1ec>
    3308:	02000793          	li	a5,32
    330c:	00f10823          	sb	a5,16(sp)
    3310:	000b8593          	mv	a1,s7
    3314:	00090513          	mv	a0,s2
    3318:	f11ff06f          	j	3228 <fatfs_get_file_entry+0x108>

0000331c <_open_directory>:
    331c:	eb010113          	addi	sp,sp,-336
    3320:	15212023          	sw	s2,320(sp)
    3324:	0000b937          	lui	s2,0xb
    3328:	fbc90913          	addi	s2,s2,-68 # afbc <_fs>
    332c:	14812423          	sw	s0,328(sp)
    3330:	00892403          	lw	s0,8(s2)
    3334:	14912223          	sw	s1,324(sp)
    3338:	13312e23          	sw	s3,316(sp)
    333c:	13412c23          	sw	s4,312(sp)
    3340:	13512a23          	sw	s5,308(sp)
    3344:	13612823          	sw	s6,304(sp)
    3348:	14112623          	sw	ra,332(sp)
    334c:	00050a13          	mv	s4,a0
    3350:	00058a93          	mv	s5,a1
    3354:	fffff097          	auipc	ra,0xfffff
    3358:	368080e7          	jalr	872(ra) # 26bc <fatfs_total_path_levels>
    335c:	00050b13          	mv	s6,a0
    3360:	00000493          	li	s1,0
    3364:	fff00993          	li	s3,-1
    3368:	009b5863          	bge	s6,s1,3378 <_open_directory+0x5c>
    336c:	008aa023          	sw	s0,0(s5)
    3370:	00100513          	li	a0,1
    3374:	0240006f          	j	3398 <_open_directory+0x7c>
    3378:	10400693          	li	a3,260
    337c:	02c10613          	addi	a2,sp,44
    3380:	00048593          	mv	a1,s1
    3384:	000a0513          	mv	a0,s4
    3388:	fffff097          	auipc	ra,0xfffff
    338c:	3a4080e7          	jalr	932(ra) # 272c <fatfs_get_substring>
    3390:	03351863          	bne	a0,s3,33c0 <_open_directory+0xa4>
    3394:	00000513          	li	a0,0
    3398:	14c12083          	lw	ra,332(sp)
    339c:	14812403          	lw	s0,328(sp)
    33a0:	14412483          	lw	s1,324(sp)
    33a4:	14012903          	lw	s2,320(sp)
    33a8:	13c12983          	lw	s3,316(sp)
    33ac:	13812a03          	lw	s4,312(sp)
    33b0:	13412a83          	lw	s5,308(sp)
    33b4:	13012b03          	lw	s6,304(sp)
    33b8:	15010113          	addi	sp,sp,336
    33bc:	00008067          	ret
    33c0:	00c10693          	addi	a3,sp,12
    33c4:	02c10613          	addi	a2,sp,44
    33c8:	00040593          	mv	a1,s0
    33cc:	00090513          	mv	a0,s2
    33d0:	00000097          	auipc	ra,0x0
    33d4:	d50080e7          	jalr	-688(ra) # 3120 <fatfs_get_file_entry>
    33d8:	fa050ee3          	beqz	a0,3394 <_open_directory+0x78>
    33dc:	01714783          	lbu	a5,23(sp)
    33e0:	0107f793          	andi	a5,a5,16
    33e4:	fa0788e3          	beqz	a5,3394 <_open_directory+0x78>
    33e8:	02015403          	lhu	s0,32(sp)
    33ec:	02615783          	lhu	a5,38(sp)
    33f0:	00148493          	addi	s1,s1,1
    33f4:	01041413          	slli	s0,s0,0x10
    33f8:	00f40433          	add	s0,s0,a5
    33fc:	f6dff06f          	j	3368 <_open_directory+0x4c>

00003400 <fl_opendir>:
    3400:	fe010113          	addi	sp,sp,-32
    3404:	fff00793          	li	a5,-1
    3408:	00f12623          	sw	a5,12(sp)
    340c:	000057b7          	lui	a5,0x5
    3410:	39c7a783          	lw	a5,924(a5) # 539c <_filelib_init>
    3414:	00812c23          	sw	s0,24(sp)
    3418:	01212823          	sw	s2,16(sp)
    341c:	00112e23          	sw	ra,28(sp)
    3420:	00912a23          	sw	s1,20(sp)
    3424:	00050913          	mv	s2,a0
    3428:	00058413          	mv	s0,a1
    342c:	00079663          	bnez	a5,3438 <fl_opendir+0x38>
    3430:	fffff097          	auipc	ra,0xfffff
    3434:	a58080e7          	jalr	-1448(ra) # 1e88 <fl_init>
    3438:	0000b4b7          	lui	s1,0xb
    343c:	fbc48493          	addi	s1,s1,-68 # afbc <_fs>
    3440:	03c4a783          	lw	a5,60(s1)
    3444:	00078463          	beqz	a5,344c <fl_opendir+0x4c>
    3448:	000780e7          	jalr	a5
    344c:	00090513          	mv	a0,s2
    3450:	fffff097          	auipc	ra,0xfffff
    3454:	26c080e7          	jalr	620(ra) # 26bc <fatfs_total_path_levels>
    3458:	fff00793          	li	a5,-1
    345c:	02f51063          	bne	a0,a5,347c <fl_opendir+0x7c>
    3460:	0084a783          	lw	a5,8(s1)
    3464:	00f12623          	sw	a5,12(sp)
    3468:	00c12783          	lw	a5,12(sp)
    346c:	00042023          	sw	zero,0(s0)
    3470:	00040423          	sb	zero,8(s0)
    3474:	00f42223          	sw	a5,4(s0)
    3478:	0180006f          	j	3490 <fl_opendir+0x90>
    347c:	00c10593          	addi	a1,sp,12
    3480:	00090513          	mv	a0,s2
    3484:	00000097          	auipc	ra,0x0
    3488:	e98080e7          	jalr	-360(ra) # 331c <_open_directory>
    348c:	fc051ee3          	bnez	a0,3468 <fl_opendir+0x68>
    3490:	0404a783          	lw	a5,64(s1)
    3494:	00078463          	beqz	a5,349c <fl_opendir+0x9c>
    3498:	000780e7          	jalr	a5
    349c:	00c12703          	lw	a4,12(sp)
    34a0:	fff00793          	li	a5,-1
    34a4:	00f71463          	bne	a4,a5,34ac <fl_opendir+0xac>
    34a8:	00000413          	li	s0,0
    34ac:	01c12083          	lw	ra,28(sp)
    34b0:	00040513          	mv	a0,s0
    34b4:	01812403          	lw	s0,24(sp)
    34b8:	01412483          	lw	s1,20(sp)
    34bc:	01012903          	lw	s2,16(sp)
    34c0:	02010113          	addi	sp,sp,32
    34c4:	00008067          	ret

000034c8 <_open_file>:
    34c8:	fc010113          	addi	sp,sp,-64
    34cc:	03312623          	sw	s3,44(sp)
    34d0:	02112e23          	sw	ra,60(sp)
    34d4:	02812c23          	sw	s0,56(sp)
    34d8:	02912a23          	sw	s1,52(sp)
    34dc:	03212823          	sw	s2,48(sp)
    34e0:	00050993          	mv	s3,a0
    34e4:	ffffe097          	auipc	ra,0xffffe
    34e8:	7b4080e7          	jalr	1972(ra) # 1c98 <_allocate_file>
    34ec:	06050463          	beqz	a0,3554 <_open_file+0x8c>
    34f0:	01450913          	addi	s2,a0,20
    34f4:	00050413          	mv	s0,a0
    34f8:	10400613          	li	a2,260
    34fc:	00000593          	li	a1,0
    3500:	00090513          	mv	a0,s2
    3504:	ffffe097          	auipc	ra,0xffffe
    3508:	d1c080e7          	jalr	-740(ra) # 1220 <memset>
    350c:	11840493          	addi	s1,s0,280
    3510:	10400613          	li	a2,260
    3514:	00000593          	li	a1,0
    3518:	00048513          	mv	a0,s1
    351c:	ffffe097          	auipc	ra,0xffffe
    3520:	d04080e7          	jalr	-764(ra) # 1220 <memset>
    3524:	10400713          	li	a4,260
    3528:	00048693          	mv	a3,s1
    352c:	00070613          	mv	a2,a4
    3530:	00090593          	mv	a1,s2
    3534:	00098513          	mv	a0,s3
    3538:	fffff097          	auipc	ra,0xfffff
    353c:	2dc080e7          	jalr	732(ra) # 2814 <fatfs_split_path>
    3540:	fff00793          	li	a5,-1
    3544:	02f51a63          	bne	a0,a5,3578 <_open_file+0xb0>
    3548:	00040513          	mv	a0,s0
    354c:	ffffe097          	auipc	ra,0xffffe
    3550:	7c4080e7          	jalr	1988(ra) # 1d10 <_free_file>
    3554:	00000413          	li	s0,0
    3558:	03c12083          	lw	ra,60(sp)
    355c:	00040513          	mv	a0,s0
    3560:	03812403          	lw	s0,56(sp)
    3564:	03412483          	lw	s1,52(sp)
    3568:	03012903          	lw	s2,48(sp)
    356c:	02c12983          	lw	s3,44(sp)
    3570:	04010113          	addi	sp,sp,64
    3574:	00008067          	ret
    3578:	00040513          	mv	a0,s0
    357c:	fffff097          	auipc	ra,0xfffff
    3580:	514080e7          	jalr	1300(ra) # 2a90 <_check_file_open>
    3584:	fc0512e3          	bnez	a0,3548 <_open_file+0x80>
    3588:	01444783          	lbu	a5,20(s0)
    358c:	08079c63          	bnez	a5,3624 <_open_file+0x15c>
    3590:	0000b7b7          	lui	a5,0xb
    3594:	fc47a783          	lw	a5,-60(a5) # afc4 <_fs+0x8>
    3598:	00f42023          	sw	a5,0(s0)
    359c:	00042583          	lw	a1,0(s0)
    35a0:	00048613          	mv	a2,s1
    35a4:	0000b4b7          	lui	s1,0xb
    35a8:	00010693          	mv	a3,sp
    35ac:	fbc48513          	addi	a0,s1,-68 # afbc <_fs>
    35b0:	00000097          	auipc	ra,0x0
    35b4:	b70080e7          	jalr	-1168(ra) # 3120 <fatfs_get_file_entry>
    35b8:	f80508e3          	beqz	a0,3548 <_open_file+0x80>
    35bc:	00b14783          	lbu	a5,11(sp)
    35c0:	0207f793          	andi	a5,a5,32
    35c4:	f80782e3          	beqz	a5,3548 <_open_file+0x80>
    35c8:	00b00613          	li	a2,11
    35cc:	00010593          	mv	a1,sp
    35d0:	21c40513          	addi	a0,s0,540
    35d4:	ffffe097          	auipc	ra,0xffffe
    35d8:	c68080e7          	jalr	-920(ra) # 123c <memcpy>
    35dc:	01c12783          	lw	a5,28(sp)
    35e0:	01a15703          	lhu	a4,26(sp)
    35e4:	00042423          	sw	zero,8(s0)
    35e8:	00f42623          	sw	a5,12(s0)
    35ec:	01415783          	lhu	a5,20(sp)
    35f0:	42042a23          	sw	zero,1076(s0)
    35f4:	00042823          	sw	zero,16(s0)
    35f8:	01079793          	slli	a5,a5,0x10
    35fc:	00e787b3          	add	a5,a5,a4
    3600:	00f42223          	sw	a5,4(s0)
    3604:	fff00793          	li	a5,-1
    3608:	42f42823          	sw	a5,1072(s0)
    360c:	22f42423          	sw	a5,552(s0)
    3610:	22f42623          	sw	a5,556(s0)
    3614:	fbc48513          	addi	a0,s1,-68
    3618:	00000097          	auipc	ra,0x0
    361c:	858080e7          	jalr	-1960(ra) # 2e70 <fatfs_fat_purge>
    3620:	f39ff06f          	j	3558 <_open_file+0x90>
    3624:	00040593          	mv	a1,s0
    3628:	00090513          	mv	a0,s2
    362c:	00000097          	auipc	ra,0x0
    3630:	cf0080e7          	jalr	-784(ra) # 331c <_open_directory>
    3634:	f60514e3          	bnez	a0,359c <_open_file+0xd4>
    3638:	f11ff06f          	j	3548 <_open_file+0x80>

0000363c <fatfs_sfn_exists>:
    363c:	fe010113          	addi	sp,sp,-32
    3640:	01212823          	sw	s2,16(sp)
    3644:	01312623          	sw	s3,12(sp)
    3648:	01412423          	sw	s4,8(sp)
    364c:	01512223          	sw	s5,4(sp)
    3650:	01612023          	sw	s6,0(sp)
    3654:	00112e23          	sw	ra,28(sp)
    3658:	00812c23          	sw	s0,24(sp)
    365c:	00912a23          	sw	s1,20(sp)
    3660:	00050993          	mv	s3,a0
    3664:	00058a93          	mv	s5,a1
    3668:	00060b13          	mv	s6,a2
    366c:	00000913          	li	s2,0
    3670:	24450a13          	addi	s4,a0,580
    3674:	00000693          	li	a3,0
    3678:	00090613          	mv	a2,s2
    367c:	000a8593          	mv	a1,s5
    3680:	00098513          	mv	a0,s3
    3684:	00000097          	auipc	ra,0x0
    3688:	94c080e7          	jalr	-1716(ra) # 2fd0 <fatfs_sector_reader>
    368c:	00050413          	mv	s0,a0
    3690:	06050263          	beqz	a0,36f4 <fatfs_sfn_exists+0xb8>
    3694:	00190913          	addi	s2,s2,1
    3698:	04498493          	addi	s1,s3,68
    369c:	00048513          	mv	a0,s1
    36a0:	fffff097          	auipc	ra,0xfffff
    36a4:	a58080e7          	jalr	-1448(ra) # 20f8 <fatfs_entry_lfn_text>
    36a8:	00050863          	beqz	a0,36b8 <fatfs_sfn_exists+0x7c>
    36ac:	02048493          	addi	s1,s1,32
    36b0:	ff4496e3          	bne	s1,s4,369c <fatfs_sfn_exists+0x60>
    36b4:	fc1ff06f          	j	3674 <fatfs_sfn_exists+0x38>
    36b8:	00048513          	mv	a0,s1
    36bc:	fffff097          	auipc	ra,0xfffff
    36c0:	a50080e7          	jalr	-1456(ra) # 210c <fatfs_entry_lfn_invalid>
    36c4:	fe0514e3          	bnez	a0,36ac <fatfs_sfn_exists+0x70>
    36c8:	00048513          	mv	a0,s1
    36cc:	fffff097          	auipc	ra,0xfffff
    36d0:	ac4080e7          	jalr	-1340(ra) # 2190 <fatfs_entry_sfn_only>
    36d4:	00050413          	mv	s0,a0
    36d8:	fc050ae3          	beqz	a0,36ac <fatfs_sfn_exists+0x70>
    36dc:	00b00613          	li	a2,11
    36e0:	000b0593          	mv	a1,s6
    36e4:	00048513          	mv	a0,s1
    36e8:	ffffe097          	auipc	ra,0xffffe
    36ec:	b98080e7          	jalr	-1128(ra) # 1280 <strncmp>
    36f0:	fa051ee3          	bnez	a0,36ac <fatfs_sfn_exists+0x70>
    36f4:	01c12083          	lw	ra,28(sp)
    36f8:	00040513          	mv	a0,s0
    36fc:	01812403          	lw	s0,24(sp)
    3700:	01412483          	lw	s1,20(sp)
    3704:	01012903          	lw	s2,16(sp)
    3708:	00c12983          	lw	s3,12(sp)
    370c:	00812a03          	lw	s4,8(sp)
    3710:	00412a83          	lw	s5,4(sp)
    3714:	00012b03          	lw	s6,0(sp)
    3718:	02010113          	addi	sp,sp,32
    371c:	00008067          	ret

00003720 <fatfs_update_file_length>:
    3720:	03852783          	lw	a5,56(a0)
    3724:	14078e63          	beqz	a5,3880 <fatfs_update_file_length+0x160>
    3728:	fd010113          	addi	sp,sp,-48
    372c:	02912223          	sw	s1,36(sp)
    3730:	03212023          	sw	s2,32(sp)
    3734:	01312e23          	sw	s3,28(sp)
    3738:	01412c23          	sw	s4,24(sp)
    373c:	01612823          	sw	s6,16(sp)
    3740:	01712623          	sw	s7,12(sp)
    3744:	02112623          	sw	ra,44(sp)
    3748:	02812423          	sw	s0,40(sp)
    374c:	01512a23          	sw	s5,20(sp)
    3750:	00068913          	mv	s2,a3
    3754:	00060b93          	mv	s7,a2
    3758:	00058b13          	mv	s6,a1
    375c:	00050493          	mv	s1,a0
    3760:	00000993          	li	s3,0
    3764:	24450a13          	addi	s4,a0,580
    3768:	00000693          	li	a3,0
    376c:	00098613          	mv	a2,s3
    3770:	000b0593          	mv	a1,s6
    3774:	00048513          	mv	a0,s1
    3778:	00000097          	auipc	ra,0x0
    377c:	858080e7          	jalr	-1960(ra) # 2fd0 <fatfs_sector_reader>
    3780:	0c050863          	beqz	a0,3850 <fatfs_update_file_length+0x130>
    3784:	04448413          	addi	s0,s1,68
    3788:	00198993          	addi	s3,s3,1
    378c:	00040a93          	mv	s5,s0
    3790:	00040513          	mv	a0,s0
    3794:	fffff097          	auipc	ra,0xfffff
    3798:	964080e7          	jalr	-1692(ra) # 20f8 <fatfs_entry_lfn_text>
    379c:	0a051463          	bnez	a0,3844 <fatfs_update_file_length+0x124>
    37a0:	00040513          	mv	a0,s0
    37a4:	fffff097          	auipc	ra,0xfffff
    37a8:	968080e7          	jalr	-1688(ra) # 210c <fatfs_entry_lfn_invalid>
    37ac:	08051c63          	bnez	a0,3844 <fatfs_update_file_length+0x124>
    37b0:	00040513          	mv	a0,s0
    37b4:	fffff097          	auipc	ra,0xfffff
    37b8:	9dc080e7          	jalr	-1572(ra) # 2190 <fatfs_entry_sfn_only>
    37bc:	08050463          	beqz	a0,3844 <fatfs_update_file_length+0x124>
    37c0:	00b00613          	li	a2,11
    37c4:	000b8593          	mv	a1,s7
    37c8:	00040513          	mv	a0,s0
    37cc:	ffffe097          	auipc	ra,0xffffe
    37d0:	ab4080e7          	jalr	-1356(ra) # 1280 <strncmp>
    37d4:	06051863          	bnez	a0,3844 <fatfs_update_file_length+0x124>
    37d8:	00895793          	srli	a5,s2,0x8
    37dc:	01240e23          	sb	s2,28(s0)
    37e0:	00f40ea3          	sb	a5,29(s0)
    37e4:	01095793          	srli	a5,s2,0x10
    37e8:	01895913          	srli	s2,s2,0x18
    37ec:	00f40f23          	sb	a5,30(s0)
    37f0:	01240fa3          	sb	s2,31(s0)
    37f4:	00040593          	mv	a1,s0
    37f8:	02000613          	li	a2,32
    37fc:	00040513          	mv	a0,s0
    3800:	ffffe097          	auipc	ra,0xffffe
    3804:	a3c080e7          	jalr	-1476(ra) # 123c <memcpy>
    3808:	02812403          	lw	s0,40(sp)
    380c:	0384a783          	lw	a5,56(s1)
    3810:	2444a503          	lw	a0,580(s1)
    3814:	02c12083          	lw	ra,44(sp)
    3818:	02412483          	lw	s1,36(sp)
    381c:	02012903          	lw	s2,32(sp)
    3820:	01c12983          	lw	s3,28(sp)
    3824:	01812a03          	lw	s4,24(sp)
    3828:	01012b03          	lw	s6,16(sp)
    382c:	00c12b83          	lw	s7,12(sp)
    3830:	000a8593          	mv	a1,s5
    3834:	01412a83          	lw	s5,20(sp)
    3838:	00100613          	li	a2,1
    383c:	03010113          	addi	sp,sp,48
    3840:	00078067          	jr	a5
    3844:	02040413          	addi	s0,s0,32
    3848:	f54414e3          	bne	s0,s4,3790 <fatfs_update_file_length+0x70>
    384c:	f1dff06f          	j	3768 <fatfs_update_file_length+0x48>
    3850:	02c12083          	lw	ra,44(sp)
    3854:	02812403          	lw	s0,40(sp)
    3858:	02412483          	lw	s1,36(sp)
    385c:	02012903          	lw	s2,32(sp)
    3860:	01c12983          	lw	s3,28(sp)
    3864:	01812a03          	lw	s4,24(sp)
    3868:	01412a83          	lw	s5,20(sp)
    386c:	01012b03          	lw	s6,16(sp)
    3870:	00c12b83          	lw	s7,12(sp)
    3874:	00000513          	li	a0,0
    3878:	03010113          	addi	sp,sp,48
    387c:	00008067          	ret
    3880:	00000513          	li	a0,0
    3884:	00008067          	ret

00003888 <fatfs_list_directory_next>:
    3888:	ec010113          	addi	sp,sp,-320
    388c:	13212823          	sw	s2,304(sp)
    3890:	13312623          	sw	s3,300(sp)
    3894:	13412423          	sw	s4,296(sp)
    3898:	13512223          	sw	s5,292(sp)
    389c:	13612023          	sw	s6,288(sp)
    38a0:	12112e23          	sw	ra,316(sp)
    38a4:	12812c23          	sw	s0,312(sp)
    38a8:	12912a23          	sw	s1,308(sp)
    38ac:	00050a13          	mv	s4,a0
    38b0:	00058913          	mv	s2,a1
    38b4:	00060993          	mv	s3,a2
    38b8:	10010ea3          	sb	zero,285(sp)
    38bc:	04450a93          	addi	s5,a0,68
    38c0:	00f00b13          	li	s6,15
    38c4:	00092603          	lw	a2,0(s2)
    38c8:	00492583          	lw	a1,4(s2)
    38cc:	00000693          	li	a3,0
    38d0:	000a0513          	mv	a0,s4
    38d4:	fffff097          	auipc	ra,0xfffff
    38d8:	6fc080e7          	jalr	1788(ra) # 2fd0 <fatfs_sector_reader>
    38dc:	10050c63          	beqz	a0,39f4 <fatfs_list_directory_next+0x16c>
    38e0:	00894483          	lbu	s1,8(s2)
    38e4:	00549413          	slli	s0,s1,0x5
    38e8:	008a8433          	add	s0,s5,s0
    38ec:	009b7c63          	bgeu	s6,s1,3904 <fatfs_list_directory_next+0x7c>
    38f0:	00092783          	lw	a5,0(s2)
    38f4:	00090423          	sb	zero,8(s2)
    38f8:	00178793          	addi	a5,a5,1
    38fc:	00f92023          	sw	a5,0(s2)
    3900:	fc5ff06f          	j	38c4 <fatfs_list_directory_next+0x3c>
    3904:	00040513          	mv	a0,s0
    3908:	ffffe097          	auipc	ra,0xffffe
    390c:	7f0080e7          	jalr	2032(ra) # 20f8 <fatfs_entry_lfn_text>
    3910:	02050263          	beqz	a0,3934 <fatfs_list_directory_next+0xac>
    3914:	00040593          	mv	a1,s0
    3918:	01810513          	addi	a0,sp,24
    391c:	ffffe097          	auipc	ra,0xffffe
    3920:	6d4080e7          	jalr	1748(ra) # 1ff0 <fatfs_lfn_cache_entry>
    3924:	00148493          	addi	s1,s1,1
    3928:	0ff4f493          	zext.b	s1,s1
    392c:	02040413          	addi	s0,s0,32
    3930:	fbdff06f          	j	38ec <fatfs_list_directory_next+0x64>
    3934:	00040513          	mv	a0,s0
    3938:	ffffe097          	auipc	ra,0xffffe
    393c:	7d4080e7          	jalr	2004(ra) # 210c <fatfs_entry_lfn_invalid>
    3940:	00050663          	beqz	a0,394c <fatfs_list_directory_next+0xc4>
    3944:	10010ea3          	sb	zero,285(sp)
    3948:	fddff06f          	j	3924 <fatfs_list_directory_next+0x9c>
    394c:	00040593          	mv	a1,s0
    3950:	01810513          	addi	a0,sp,24
    3954:	ffffe097          	auipc	ra,0xffffe
    3958:	7ec080e7          	jalr	2028(ra) # 2140 <fatfs_entry_lfn_exists>
    395c:	0c050063          	beqz	a0,3a1c <fatfs_list_directory_next+0x194>
    3960:	01810513          	addi	a0,sp,24
    3964:	ffffe097          	auipc	ra,0xffffe
    3968:	758080e7          	jalr	1880(ra) # 20bc <fatfs_lfn_cache_get>
    396c:	00050593          	mv	a1,a0
    3970:	10300613          	li	a2,259
    3974:	00098513          	mv	a0,s3
    3978:	ffffe097          	auipc	ra,0xffffe
    397c:	948080e7          	jalr	-1720(ra) # 12c0 <strncpy>
    3980:	00040513          	mv	a0,s0
    3984:	fffff097          	auipc	ra,0xfffff
    3988:	84c080e7          	jalr	-1972(ra) # 21d0 <fatfs_entry_is_dir>
    398c:	10a98223          	sb	a0,260(s3)
    3990:	01d44783          	lbu	a5,29(s0)
    3994:	01c44703          	lbu	a4,28(s0)
    3998:	00148493          	addi	s1,s1,1
    399c:	00879793          	slli	a5,a5,0x8
    39a0:	00e7e7b3          	or	a5,a5,a4
    39a4:	01e44703          	lbu	a4,30(s0)
    39a8:	00100513          	li	a0,1
    39ac:	01071713          	slli	a4,a4,0x10
    39b0:	00f76733          	or	a4,a4,a5
    39b4:	01f44783          	lbu	a5,31(s0)
    39b8:	01879793          	slli	a5,a5,0x18
    39bc:	00e7e7b3          	or	a5,a5,a4
    39c0:	10f9a623          	sw	a5,268(s3)
    39c4:	01544783          	lbu	a5,21(s0)
    39c8:	01444703          	lbu	a4,20(s0)
    39cc:	01a44683          	lbu	a3,26(s0)
    39d0:	00879793          	slli	a5,a5,0x8
    39d4:	00e7e7b3          	or	a5,a5,a4
    39d8:	01b44703          	lbu	a4,27(s0)
    39dc:	01079793          	slli	a5,a5,0x10
    39e0:	00871713          	slli	a4,a4,0x8
    39e4:	00d76733          	or	a4,a4,a3
    39e8:	00e7e7b3          	or	a5,a5,a4
    39ec:	10f9a423          	sw	a5,264(s3)
    39f0:	00990423          	sb	s1,8(s2)
    39f4:	13c12083          	lw	ra,316(sp)
    39f8:	13812403          	lw	s0,312(sp)
    39fc:	13412483          	lw	s1,308(sp)
    3a00:	13012903          	lw	s2,304(sp)
    3a04:	12c12983          	lw	s3,300(sp)
    3a08:	12812a03          	lw	s4,296(sp)
    3a0c:	12412a83          	lw	s5,292(sp)
    3a10:	12012b03          	lw	s6,288(sp)
    3a14:	14010113          	addi	sp,sp,320
    3a18:	00008067          	ret
    3a1c:	00040513          	mv	a0,s0
    3a20:	ffffe097          	auipc	ra,0xffffe
    3a24:	770080e7          	jalr	1904(ra) # 2190 <fatfs_entry_sfn_only>
    3a28:	ee050ee3          	beqz	a0,3924 <fatfs_list_directory_next+0x9c>
    3a2c:	00810a13          	addi	s4,sp,8
    3a30:	00d00613          	li	a2,13
    3a34:	00000593          	li	a1,0
    3a38:	000a0513          	mv	a0,s4
    3a3c:	10010ea3          	sb	zero,285(sp)
    3a40:	ffffd097          	auipc	ra,0xffffd
    3a44:	7e0080e7          	jalr	2016(ra) # 1220 <memset>
    3a48:	00000793          	li	a5,0
    3a4c:	00800713          	li	a4,8
    3a50:	00f40633          	add	a2,s0,a5
    3a54:	00064603          	lbu	a2,0(a2)
    3a58:	00fa06b3          	add	a3,s4,a5
    3a5c:	00178793          	addi	a5,a5,1
    3a60:	00c68023          	sb	a2,0(a3)
    3a64:	fee796e3          	bne	a5,a4,3a50 <fatfs_list_directory_next+0x1c8>
    3a68:	00844783          	lbu	a5,8(s0)
    3a6c:	00944703          	lbu	a4,9(s0)
    3a70:	00a44683          	lbu	a3,10(s0)
    3a74:	00f108a3          	sb	a5,17(sp)
    3a78:	00e10923          	sb	a4,18(sp)
    3a7c:	fe078793          	addi	a5,a5,-32
    3a80:	fe070713          	addi	a4,a4,-32
    3a84:	00f037b3          	snez	a5,a5
    3a88:	00e03733          	snez	a4,a4
    3a8c:	00d109a3          	sb	a3,19(sp)
    3a90:	00e7e7b3          	or	a5,a5,a4
    3a94:	00079863          	bnez	a5,3aa4 <fatfs_list_directory_next+0x21c>
    3a98:	fe068693          	addi	a3,a3,-32
    3a9c:	02000793          	li	a5,32
    3aa0:	00068a63          	beqz	a3,3ab4 <fatfs_list_directory_next+0x22c>
    3aa4:	00814703          	lbu	a4,8(sp)
    3aa8:	02e00793          	li	a5,46
    3aac:	00f71463          	bne	a4,a5,3ab4 <fatfs_list_directory_next+0x22c>
    3ab0:	02000793          	li	a5,32
    3ab4:	000a0593          	mv	a1,s4
    3ab8:	00098513          	mv	a0,s3
    3abc:	00f10823          	sb	a5,16(sp)
    3ac0:	fffff097          	auipc	ra,0xfffff
    3ac4:	054080e7          	jalr	84(ra) # 2b14 <fatfs_get_sfn_display_name>
    3ac8:	eb9ff06f          	j	3980 <fatfs_list_directory_next+0xf8>

00003acc <fl_readdir>:
    3acc:	000057b7          	lui	a5,0x5
    3ad0:	39c7a783          	lw	a5,924(a5) # 539c <_filelib_init>
    3ad4:	fd010113          	addi	sp,sp,-48
    3ad8:	03212023          	sw	s2,32(sp)
    3adc:	01312e23          	sw	s3,28(sp)
    3ae0:	02112623          	sw	ra,44(sp)
    3ae4:	02812423          	sw	s0,40(sp)
    3ae8:	02912223          	sw	s1,36(sp)
    3aec:	00050913          	mv	s2,a0
    3af0:	00058993          	mv	s3,a1
    3af4:	00079663          	bnez	a5,3b00 <fl_readdir+0x34>
    3af8:	ffffe097          	auipc	ra,0xffffe
    3afc:	390080e7          	jalr	912(ra) # 1e88 <fl_init>
    3b00:	0000b4b7          	lui	s1,0xb
    3b04:	fbc48413          	addi	s0,s1,-68 # afbc <_fs>
    3b08:	03c42783          	lw	a5,60(s0)
    3b0c:	00078463          	beqz	a5,3b14 <fl_readdir+0x48>
    3b10:	000780e7          	jalr	a5
    3b14:	00098613          	mv	a2,s3
    3b18:	00090593          	mv	a1,s2
    3b1c:	fbc48513          	addi	a0,s1,-68
    3b20:	00000097          	auipc	ra,0x0
    3b24:	d68080e7          	jalr	-664(ra) # 3888 <fatfs_list_directory_next>
    3b28:	04042783          	lw	a5,64(s0)
    3b2c:	00078863          	beqz	a5,3b3c <fl_readdir+0x70>
    3b30:	00a12623          	sw	a0,12(sp)
    3b34:	000780e7          	jalr	a5
    3b38:	00c12503          	lw	a0,12(sp)
    3b3c:	02c12083          	lw	ra,44(sp)
    3b40:	02812403          	lw	s0,40(sp)
    3b44:	00154513          	xori	a0,a0,1
    3b48:	02412483          	lw	s1,36(sp)
    3b4c:	02012903          	lw	s2,32(sp)
    3b50:	01c12983          	lw	s3,28(sp)
    3b54:	40a00533          	neg	a0,a0
    3b58:	03010113          	addi	sp,sp,48
    3b5c:	00008067          	ret

00003b60 <_read_sectors>:
    3b60:	fd010113          	addi	sp,sp,-48
    3b64:	01512a23          	sw	s5,20(sp)
    3b68:	0000bab7          	lui	s5,0xb
    3b6c:	01312e23          	sw	s3,28(sp)
    3b70:	fbcac983          	lbu	s3,-68(s5) # afbc <_fs>
    3b74:	01612823          	sw	s6,16(sp)
    3b78:	00058b13          	mv	s6,a1
    3b7c:	02912223          	sw	s1,36(sp)
    3b80:	00098593          	mv	a1,s3
    3b84:	00050493          	mv	s1,a0
    3b88:	000b0513          	mv	a0,s6
    3b8c:	02112623          	sw	ra,44(sp)
    3b90:	02812423          	sw	s0,40(sp)
    3b94:	01412c23          	sw	s4,24(sp)
    3b98:	00068413          	mv	s0,a3
    3b9c:	01712623          	sw	s7,12(sp)
    3ba0:	01812423          	sw	s8,8(sp)
    3ba4:	03212023          	sw	s2,32(sp)
    3ba8:	00060c13          	mv	s8,a2
    3bac:	ffffd097          	auipc	ra,0xffffd
    3bb0:	5c8080e7          	jalr	1480(ra) # 1174 <__udivsi3>
    3bb4:	00050a13          	mv	s4,a0
    3bb8:	00098593          	mv	a1,s3
    3bbc:	000b0513          	mv	a0,s6
    3bc0:	ffffd097          	auipc	ra,0xffffd
    3bc4:	5fc080e7          	jalr	1532(ra) # 11bc <__umodsi3>
    3bc8:	00a407b3          	add	a5,s0,a0
    3bcc:	00050b93          	mv	s7,a0
    3bd0:	00f9fe63          	bgeu	s3,a5,3bec <_read_sectors+0x8c>
    3bd4:	000a0593          	mv	a1,s4
    3bd8:	00098513          	mv	a0,s3
    3bdc:	ffffe097          	auipc	ra,0xffffe
    3be0:	e18080e7          	jalr	-488(ra) # 19f4 <__mulsi3>
    3be4:	416987b3          	sub	a5,s3,s6
    3be8:	00f50433          	add	s0,a0,a5
    3bec:	2284a903          	lw	s2,552(s1)
    3bf0:	07491863          	bne	s2,s4,3c60 <_read_sectors+0x100>
    3bf4:	22c4a583          	lw	a1,556(s1)
    3bf8:	fff00793          	li	a5,-1
    3bfc:	02f58663          	beq	a1,a5,3c28 <_read_sectors+0xc8>
    3c00:	fbca8513          	addi	a0,s5,-68
    3c04:	ffffe097          	auipc	ra,0xffffe
    3c08:	154080e7          	jalr	340(ra) # 1d58 <fatfs_lba_of_cluster>
    3c0c:	017505b3          	add	a1,a0,s7
    3c10:	00040693          	mv	a3,s0
    3c14:	000c0613          	mv	a2,s8
    3c18:	fbca8513          	addi	a0,s5,-68
    3c1c:	ffffe097          	auipc	ra,0xffffe
    3c20:	188080e7          	jalr	392(ra) # 1da4 <fatfs_sector_read>
    3c24:	00051463          	bnez	a0,3c2c <_read_sectors+0xcc>
    3c28:	00000413          	li	s0,0
    3c2c:	02c12083          	lw	ra,44(sp)
    3c30:	00040513          	mv	a0,s0
    3c34:	02812403          	lw	s0,40(sp)
    3c38:	02412483          	lw	s1,36(sp)
    3c3c:	02012903          	lw	s2,32(sp)
    3c40:	01c12983          	lw	s3,28(sp)
    3c44:	01812a03          	lw	s4,24(sp)
    3c48:	01412a83          	lw	s5,20(sp)
    3c4c:	01012b03          	lw	s6,16(sp)
    3c50:	00c12b83          	lw	s7,12(sp)
    3c54:	00812c03          	lw	s8,8(sp)
    3c58:	03010113          	addi	sp,sp,48
    3c5c:	00008067          	ret
    3c60:	033b6463          	bltu	s6,s3,3c88 <_read_sectors+0x128>
    3c64:	00190793          	addi	a5,s2,1
    3c68:	03479063          	bne	a5,s4,3c88 <_read_sectors+0x128>
    3c6c:	22c4a583          	lw	a1,556(s1)
    3c70:	03496263          	bltu	s2,s4,3c94 <_read_sectors+0x134>
    3c74:	fff00793          	li	a5,-1
    3c78:	faf588e3          	beq	a1,a5,3c28 <_read_sectors+0xc8>
    3c7c:	22b4a623          	sw	a1,556(s1)
    3c80:	2344a423          	sw	s4,552(s1)
    3c84:	f7dff06f          	j	3c00 <_read_sectors+0xa0>
    3c88:	0044a583          	lw	a1,4(s1)
    3c8c:	00000913          	li	s2,0
    3c90:	fe1ff06f          	j	3c70 <_read_sectors+0x110>
    3c94:	fbca8513          	addi	a0,s5,-68
    3c98:	fffff097          	auipc	ra,0xfffff
    3c9c:	230080e7          	jalr	560(ra) # 2ec8 <fatfs_find_next_cluster>
    3ca0:	00050593          	mv	a1,a0
    3ca4:	00190913          	addi	s2,s2,1
    3ca8:	fc9ff06f          	j	3c70 <_read_sectors+0x110>

00003cac <fatfs_set_fs_info_next_free_cluster>:
    3cac:	03052783          	lw	a5,48(a0)
    3cb0:	0a078463          	beqz	a5,3d58 <fatfs_set_fs_info_next_free_cluster+0xac>
    3cb4:	fe010113          	addi	sp,sp,-32
    3cb8:	01c52783          	lw	a5,28(a0)
    3cbc:	00912a23          	sw	s1,20(sp)
    3cc0:	00058493          	mv	s1,a1
    3cc4:	01855583          	lhu	a1,24(a0)
    3cc8:	00812c23          	sw	s0,24(sp)
    3ccc:	00112e23          	sw	ra,28(sp)
    3cd0:	00f585b3          	add	a1,a1,a5
    3cd4:	00050413          	mv	s0,a0
    3cd8:	ffffe097          	auipc	ra,0xffffe
    3cdc:	ed4080e7          	jalr	-300(ra) # 1bac <fatfs_fat_read_sector>
    3ce0:	00050593          	mv	a1,a0
    3ce4:	06050063          	beqz	a0,3d44 <fatfs_set_fs_info_next_free_cluster+0x98>
    3ce8:	20852783          	lw	a5,520(a0)
    3cec:	0084d713          	srli	a4,s1,0x8
    3cf0:	00100613          	li	a2,1
    3cf4:	1e978623          	sb	s1,492(a5)
    3cf8:	20852783          	lw	a5,520(a0)
    3cfc:	1ee786a3          	sb	a4,493(a5)
    3d00:	20852783          	lw	a5,520(a0)
    3d04:	0104d713          	srli	a4,s1,0x10
    3d08:	1ee78723          	sb	a4,494(a5)
    3d0c:	20852783          	lw	a5,520(a0)
    3d10:	0184d713          	srli	a4,s1,0x18
    3d14:	1ee787a3          	sb	a4,495(a5)
    3d18:	03842783          	lw	a5,56(s0)
    3d1c:	20c52223          	sw	a2,516(a0)
    3d20:	02942223          	sw	s1,36(s0)
    3d24:	00078a63          	beqz	a5,3d38 <fatfs_set_fs_info_next_free_cluster+0x8c>
    3d28:	20052503          	lw	a0,512(a0)
    3d2c:	00b12623          	sw	a1,12(sp)
    3d30:	000780e7          	jalr	a5
    3d34:	00c12583          	lw	a1,12(sp)
    3d38:	fff00793          	li	a5,-1
    3d3c:	20f5a023          	sw	a5,512(a1)
    3d40:	2005a223          	sw	zero,516(a1)
    3d44:	01c12083          	lw	ra,28(sp)
    3d48:	01812403          	lw	s0,24(sp)
    3d4c:	01412483          	lw	s1,20(sp)
    3d50:	02010113          	addi	sp,sp,32
    3d54:	00008067          	ret
    3d58:	00008067          	ret

00003d5c <fatfs_find_blank_cluster>:
    3d5c:	fd010113          	addi	sp,sp,-48
    3d60:	01312e23          	sw	s3,28(sp)
    3d64:	100009b7          	lui	s3,0x10000
    3d68:	02912223          	sw	s1,36(sp)
    3d6c:	03212023          	sw	s2,32(sp)
    3d70:	02112623          	sw	ra,44(sp)
    3d74:	02812423          	sw	s0,40(sp)
    3d78:	00050913          	mv	s2,a0
    3d7c:	00058493          	mv	s1,a1
    3d80:	fff98993          	addi	s3,s3,-1 # fffffff <__stacktop+0xffeffff>
    3d84:	03092783          	lw	a5,48(s2)
    3d88:	0074d413          	srli	s0,s1,0x7
    3d8c:	00079463          	bnez	a5,3d94 <fatfs_find_blank_cluster+0x38>
    3d90:	0084d413          	srli	s0,s1,0x8
    3d94:	02092783          	lw	a5,32(s2)
    3d98:	0cf47863          	bgeu	s0,a5,3e68 <fatfs_find_blank_cluster+0x10c>
    3d9c:	01492583          	lw	a1,20(s2)
    3da0:	00090513          	mv	a0,s2
    3da4:	00c12623          	sw	a2,12(sp)
    3da8:	00b405b3          	add	a1,s0,a1
    3dac:	ffffe097          	auipc	ra,0xffffe
    3db0:	e00080e7          	jalr	-512(ra) # 1bac <fatfs_fat_read_sector>
    3db4:	0a050a63          	beqz	a0,3e68 <fatfs_find_blank_cluster+0x10c>
    3db8:	03092783          	lw	a5,48(s2)
    3dbc:	20852703          	lw	a4,520(a0)
    3dc0:	00c12603          	lw	a2,12(sp)
    3dc4:	04079a63          	bnez	a5,3e18 <fatfs_find_blank_cluster+0xbc>
    3dc8:	00841413          	slli	s0,s0,0x8
    3dcc:	40848433          	sub	s0,s1,s0
    3dd0:	00141413          	slli	s0,s0,0x1
    3dd4:	01041413          	slli	s0,s0,0x10
    3dd8:	01045413          	srli	s0,s0,0x10
    3ddc:	00870733          	add	a4,a4,s0
    3de0:	00174783          	lbu	a5,1(a4)
    3de4:	00074703          	lbu	a4,0(a4)
    3de8:	00879793          	slli	a5,a5,0x8
    3dec:	00e787b3          	add	a5,a5,a4
    3df0:	06079863          	bnez	a5,3e60 <fatfs_find_blank_cluster+0x104>
    3df4:	00962023          	sw	s1,0(a2)
    3df8:	00100513          	li	a0,1
    3dfc:	02c12083          	lw	ra,44(sp)
    3e00:	02812403          	lw	s0,40(sp)
    3e04:	02412483          	lw	s1,36(sp)
    3e08:	02012903          	lw	s2,32(sp)
    3e0c:	01c12983          	lw	s3,28(sp)
    3e10:	03010113          	addi	sp,sp,48
    3e14:	00008067          	ret
    3e18:	00741413          	slli	s0,s0,0x7
    3e1c:	40848433          	sub	s0,s1,s0
    3e20:	00241413          	slli	s0,s0,0x2
    3e24:	01041413          	slli	s0,s0,0x10
    3e28:	01045413          	srli	s0,s0,0x10
    3e2c:	00870733          	add	a4,a4,s0
    3e30:	00374783          	lbu	a5,3(a4)
    3e34:	00274683          	lbu	a3,2(a4)
    3e38:	01879793          	slli	a5,a5,0x18
    3e3c:	01069693          	slli	a3,a3,0x10
    3e40:	00d787b3          	add	a5,a5,a3
    3e44:	00074683          	lbu	a3,0(a4)
    3e48:	00174703          	lbu	a4,1(a4)
    3e4c:	00d787b3          	add	a5,a5,a3
    3e50:	00871713          	slli	a4,a4,0x8
    3e54:	00e787b3          	add	a5,a5,a4
    3e58:	0137f7b3          	and	a5,a5,s3
    3e5c:	f95ff06f          	j	3df0 <fatfs_find_blank_cluster+0x94>
    3e60:	00148493          	addi	s1,s1,1
    3e64:	f21ff06f          	j	3d84 <fatfs_find_blank_cluster+0x28>
    3e68:	00000513          	li	a0,0
    3e6c:	f91ff06f          	j	3dfc <fatfs_find_blank_cluster+0xa0>

00003e70 <fatfs_fat_set_cluster>:
    3e70:	03052783          	lw	a5,48(a0)
    3e74:	fe010113          	addi	sp,sp,-32
    3e78:	00812c23          	sw	s0,24(sp)
    3e7c:	00912a23          	sw	s1,20(sp)
    3e80:	01212823          	sw	s2,16(sp)
    3e84:	00112e23          	sw	ra,28(sp)
    3e88:	00050913          	mv	s2,a0
    3e8c:	00058413          	mv	s0,a1
    3e90:	0085d493          	srli	s1,a1,0x8
    3e94:	00078463          	beqz	a5,3e9c <fatfs_fat_set_cluster+0x2c>
    3e98:	0075d493          	srli	s1,a1,0x7
    3e9c:	01492583          	lw	a1,20(s2)
    3ea0:	00090513          	mv	a0,s2
    3ea4:	00c12623          	sw	a2,12(sp)
    3ea8:	00b485b3          	add	a1,s1,a1
    3eac:	ffffe097          	auipc	ra,0xffffe
    3eb0:	d00080e7          	jalr	-768(ra) # 1bac <fatfs_fat_read_sector>
    3eb4:	00050793          	mv	a5,a0
    3eb8:	00000513          	li	a0,0
    3ebc:	04078663          	beqz	a5,3f08 <fatfs_fat_set_cluster+0x98>
    3ec0:	03092683          	lw	a3,48(s2)
    3ec4:	2087a703          	lw	a4,520(a5)
    3ec8:	00c12603          	lw	a2,12(sp)
    3ecc:	04069a63          	bnez	a3,3f20 <fatfs_fat_set_cluster+0xb0>
    3ed0:	00849493          	slli	s1,s1,0x8
    3ed4:	40940433          	sub	s0,s0,s1
    3ed8:	00141413          	slli	s0,s0,0x1
    3edc:	01041413          	slli	s0,s0,0x10
    3ee0:	01045413          	srli	s0,s0,0x10
    3ee4:	00870733          	add	a4,a4,s0
    3ee8:	00c70023          	sb	a2,0(a4)
    3eec:	2087a703          	lw	a4,520(a5)
    3ef0:	00865613          	srli	a2,a2,0x8
    3ef4:	00870733          	add	a4,a4,s0
    3ef8:	00c700a3          	sb	a2,1(a4)
    3efc:	00100713          	li	a4,1
    3f00:	20e7a223          	sw	a4,516(a5)
    3f04:	00100513          	li	a0,1
    3f08:	01c12083          	lw	ra,28(sp)
    3f0c:	01812403          	lw	s0,24(sp)
    3f10:	01412483          	lw	s1,20(sp)
    3f14:	01012903          	lw	s2,16(sp)
    3f18:	02010113          	addi	sp,sp,32
    3f1c:	00008067          	ret
    3f20:	00749493          	slli	s1,s1,0x7
    3f24:	40940433          	sub	s0,s0,s1
    3f28:	00241413          	slli	s0,s0,0x2
    3f2c:	01041413          	slli	s0,s0,0x10
    3f30:	01045413          	srli	s0,s0,0x10
    3f34:	00870733          	add	a4,a4,s0
    3f38:	00c70023          	sb	a2,0(a4)
    3f3c:	2087a703          	lw	a4,520(a5)
    3f40:	00865693          	srli	a3,a2,0x8
    3f44:	00870733          	add	a4,a4,s0
    3f48:	00d700a3          	sb	a3,1(a4)
    3f4c:	2087a703          	lw	a4,520(a5)
    3f50:	01065693          	srli	a3,a2,0x10
    3f54:	01865613          	srli	a2,a2,0x18
    3f58:	00870733          	add	a4,a4,s0
    3f5c:	00d70123          	sb	a3,2(a4)
    3f60:	2087a703          	lw	a4,520(a5)
    3f64:	00870733          	add	a4,a4,s0
    3f68:	00c701a3          	sb	a2,3(a4)
    3f6c:	f91ff06f          	j	3efc <fatfs_fat_set_cluster+0x8c>

00003f70 <fatfs_free_cluster_chain>:
    3f70:	fe010113          	addi	sp,sp,-32
    3f74:	00812c23          	sw	s0,24(sp)
    3f78:	00912a23          	sw	s1,20(sp)
    3f7c:	00112e23          	sw	ra,28(sp)
    3f80:	01212823          	sw	s2,16(sp)
    3f84:	00050493          	mv	s1,a0
    3f88:	ffd00413          	li	s0,-3
    3f8c:	fff58793          	addi	a5,a1,-1
    3f90:	02f47063          	bgeu	s0,a5,3fb0 <fatfs_free_cluster_chain+0x40>
    3f94:	01c12083          	lw	ra,28(sp)
    3f98:	01812403          	lw	s0,24(sp)
    3f9c:	01412483          	lw	s1,20(sp)
    3fa0:	01012903          	lw	s2,16(sp)
    3fa4:	00100513          	li	a0,1
    3fa8:	02010113          	addi	sp,sp,32
    3fac:	00008067          	ret
    3fb0:	00048513          	mv	a0,s1
    3fb4:	00b12623          	sw	a1,12(sp)
    3fb8:	fffff097          	auipc	ra,0xfffff
    3fbc:	f10080e7          	jalr	-240(ra) # 2ec8 <fatfs_find_next_cluster>
    3fc0:	00c12583          	lw	a1,12(sp)
    3fc4:	00050913          	mv	s2,a0
    3fc8:	00000613          	li	a2,0
    3fcc:	00048513          	mv	a0,s1
    3fd0:	00000097          	auipc	ra,0x0
    3fd4:	ea0080e7          	jalr	-352(ra) # 3e70 <fatfs_fat_set_cluster>
    3fd8:	00090593          	mv	a1,s2
    3fdc:	fb1ff06f          	j	3f8c <fatfs_free_cluster_chain+0x1c>

00003fe0 <fatfs_fat_add_cluster_to_chain>:
    3fe0:	fd010113          	addi	sp,sp,-48
    3fe4:	02912223          	sw	s1,36(sp)
    3fe8:	02112623          	sw	ra,44(sp)
    3fec:	02812423          	sw	s0,40(sp)
    3ff0:	03212023          	sw	s2,32(sp)
    3ff4:	01312e23          	sw	s3,28(sp)
    3ff8:	fff00493          	li	s1,-1
    3ffc:	02959263          	bne	a1,s1,4020 <fatfs_fat_add_cluster_to_chain+0x40>
    4000:	00000513          	li	a0,0
    4004:	02c12083          	lw	ra,44(sp)
    4008:	02812403          	lw	s0,40(sp)
    400c:	02412483          	lw	s1,36(sp)
    4010:	02012903          	lw	s2,32(sp)
    4014:	01c12983          	lw	s3,28(sp)
    4018:	03010113          	addi	sp,sp,48
    401c:	00008067          	ret
    4020:	00050913          	mv	s2,a0
    4024:	00058413          	mv	s0,a1
    4028:	00060993          	mv	s3,a2
    402c:	00040593          	mv	a1,s0
    4030:	00090513          	mv	a0,s2
    4034:	00812623          	sw	s0,12(sp)
    4038:	fffff097          	auipc	ra,0xfffff
    403c:	e90080e7          	jalr	-368(ra) # 2ec8 <fatfs_find_next_cluster>
    4040:	00050413          	mv	s0,a0
    4044:	fa050ee3          	beqz	a0,4000 <fatfs_fat_add_cluster_to_chain+0x20>
    4048:	00c12583          	lw	a1,12(sp)
    404c:	fe9510e3          	bne	a0,s1,402c <fatfs_fat_add_cluster_to_chain+0x4c>
    4050:	00098613          	mv	a2,s3
    4054:	00090513          	mv	a0,s2
    4058:	00000097          	auipc	ra,0x0
    405c:	e18080e7          	jalr	-488(ra) # 3e70 <fatfs_fat_set_cluster>
    4060:	00040613          	mv	a2,s0
    4064:	00098593          	mv	a1,s3
    4068:	00090513          	mv	a0,s2
    406c:	00000097          	auipc	ra,0x0
    4070:	e04080e7          	jalr	-508(ra) # 3e70 <fatfs_fat_set_cluster>
    4074:	00100513          	li	a0,1
    4078:	f8dff06f          	j	4004 <fatfs_fat_add_cluster_to_chain+0x24>

0000407c <fatfs_add_free_space>:
    407c:	02452783          	lw	a5,36(a0)
    4080:	fd010113          	addi	sp,sp,-48
    4084:	02812423          	sw	s0,40(sp)
    4088:	01312e23          	sw	s3,28(sp)
    408c:	01412c23          	sw	s4,24(sp)
    4090:	0005a983          	lw	s3,0(a1)
    4094:	01512a23          	sw	s5,20(sp)
    4098:	00058a13          	mv	s4,a1
    409c:	02112623          	sw	ra,44(sp)
    40a0:	02912223          	sw	s1,36(sp)
    40a4:	03212023          	sw	s2,32(sp)
    40a8:	fff00593          	li	a1,-1
    40ac:	00050413          	mv	s0,a0
    40b0:	00060a93          	mv	s5,a2
    40b4:	00b78663          	beq	a5,a1,40c0 <fatfs_add_free_space+0x44>
    40b8:	00000097          	auipc	ra,0x0
    40bc:	bf4080e7          	jalr	-1036(ra) # 3cac <fatfs_set_fs_info_next_free_cluster>
    40c0:	00000493          	li	s1,0
    40c4:	03549663          	bne	s1,s5,40f0 <fatfs_add_free_space+0x74>
    40c8:	00100513          	li	a0,1
    40cc:	02c12083          	lw	ra,44(sp)
    40d0:	02812403          	lw	s0,40(sp)
    40d4:	02412483          	lw	s1,36(sp)
    40d8:	02012903          	lw	s2,32(sp)
    40dc:	01c12983          	lw	s3,28(sp)
    40e0:	01812a03          	lw	s4,24(sp)
    40e4:	01412a83          	lw	s5,20(sp)
    40e8:	03010113          	addi	sp,sp,48
    40ec:	00008067          	ret
    40f0:	00842583          	lw	a1,8(s0)
    40f4:	00c10613          	addi	a2,sp,12
    40f8:	00040513          	mv	a0,s0
    40fc:	00000097          	auipc	ra,0x0
    4100:	c60080e7          	jalr	-928(ra) # 3d5c <fatfs_find_blank_cluster>
    4104:	fc0504e3          	beqz	a0,40cc <fatfs_add_free_space+0x50>
    4108:	00c12903          	lw	s2,12(sp)
    410c:	00098593          	mv	a1,s3
    4110:	00040513          	mv	a0,s0
    4114:	00090613          	mv	a2,s2
    4118:	00000097          	auipc	ra,0x0
    411c:	d58080e7          	jalr	-680(ra) # 3e70 <fatfs_fat_set_cluster>
    4120:	fff00613          	li	a2,-1
    4124:	00090593          	mv	a1,s2
    4128:	00040513          	mv	a0,s0
    412c:	00000097          	auipc	ra,0x0
    4130:	d44080e7          	jalr	-700(ra) # 3e70 <fatfs_fat_set_cluster>
    4134:	00049463          	bnez	s1,413c <fatfs_add_free_space+0xc0>
    4138:	012a2023          	sw	s2,0(s4)
    413c:	00148493          	addi	s1,s1,1
    4140:	00090993          	mv	s3,s2
    4144:	f81ff06f          	j	40c4 <fatfs_add_free_space+0x48>

00004148 <_write_sectors>:
    4148:	fb010113          	addi	sp,sp,-80
    414c:	03512a23          	sw	s5,52(sp)
    4150:	0000bab7          	lui	s5,0xb
    4154:	04112623          	sw	ra,76(sp)
    4158:	04812423          	sw	s0,72(sp)
    415c:	04912223          	sw	s1,68(sp)
    4160:	03412c23          	sw	s4,56(sp)
    4164:	03612823          	sw	s6,48(sp)
    4168:	03712623          	sw	s7,44(sp)
    416c:	03812423          	sw	s8,40(sp)
    4170:	03912223          	sw	s9,36(sp)
    4174:	03a12023          	sw	s10,32(sp)
    4178:	05212023          	sw	s2,64(sp)
    417c:	03312e23          	sw	s3,60(sp)
    4180:	fbca8b93          	addi	s7,s5,-68 # afbc <_fs>
    4184:	000bc983          	lbu	s3,0(s7)
    4188:	00058b13          	mv	s6,a1
    418c:	fff00793          	li	a5,-1
    4190:	00098593          	mv	a1,s3
    4194:	00050493          	mv	s1,a0
    4198:	000b0513          	mv	a0,s6
    419c:	00068c13          	mv	s8,a3
    41a0:	00f12e23          	sw	a5,28(sp)
    41a4:	00060d13          	mv	s10,a2
    41a8:	ffffd097          	auipc	ra,0xffffd
    41ac:	fcc080e7          	jalr	-52(ra) # 1174 <__udivsi3>
    41b0:	00050a13          	mv	s4,a0
    41b4:	00098593          	mv	a1,s3
    41b8:	000b0513          	mv	a0,s6
    41bc:	ffffd097          	auipc	ra,0xffffd
    41c0:	000080e7          	jalr	ra # 11bc <__umodsi3>
    41c4:	00ac07b3          	add	a5,s8,a0
    41c8:	00050c93          	mv	s9,a0
    41cc:	000c0413          	mv	s0,s8
    41d0:	00f9fe63          	bgeu	s3,a5,41ec <_write_sectors+0xa4>
    41d4:	000a0593          	mv	a1,s4
    41d8:	00098513          	mv	a0,s3
    41dc:	ffffe097          	auipc	ra,0xffffe
    41e0:	818080e7          	jalr	-2024(ra) # 19f4 <__mulsi3>
    41e4:	416987b3          	sub	a5,s3,s6
    41e8:	00f50433          	add	s0,a0,a5
    41ec:	2284a903          	lw	s2,552(s1)
    41f0:	03491a63          	bne	s2,s4,4224 <_write_sectors+0xdc>
    41f4:	22c4a583          	lw	a1,556(s1)
    41f8:	fbca8513          	addi	a0,s5,-68
    41fc:	ffffe097          	auipc	ra,0xffffe
    4200:	b5c080e7          	jalr	-1188(ra) # 1d58 <fatfs_lba_of_cluster>
    4204:	019505b3          	add	a1,a0,s9
    4208:	00040693          	mv	a3,s0
    420c:	000d0613          	mv	a2,s10
    4210:	fbca8513          	addi	a0,s5,-68
    4214:	ffffe097          	auipc	ra,0xffffe
    4218:	ba8080e7          	jalr	-1112(ra) # 1dbc <fatfs_sector_write>
    421c:	04050a63          	beqz	a0,4270 <_write_sectors+0x128>
    4220:	0540006f          	j	4274 <_write_sectors+0x12c>
    4224:	093b6663          	bltu	s6,s3,42b0 <_write_sectors+0x168>
    4228:	00190793          	addi	a5,s2,1
    422c:	09479263          	bne	a5,s4,42b0 <_write_sectors+0x168>
    4230:	22c4a583          	lw	a1,556(s1)
    4234:	fff00b13          	li	s6,-1
    4238:	09496263          	bltu	s2,s4,42bc <_write_sectors+0x174>
    423c:	fff00793          	li	a5,-1
    4240:	0af59463          	bne	a1,a5,42e8 <_write_sectors+0x1a0>
    4244:	000bc583          	lbu	a1,0(s7)
    4248:	fff58513          	addi	a0,a1,-1
    424c:	01850533          	add	a0,a0,s8
    4250:	ffffd097          	auipc	ra,0xffffd
    4254:	f24080e7          	jalr	-220(ra) # 1174 <__udivsi3>
    4258:	00050613          	mv	a2,a0
    425c:	01c10593          	addi	a1,sp,28
    4260:	000b8513          	mv	a0,s7
    4264:	00000097          	auipc	ra,0x0
    4268:	e18080e7          	jalr	-488(ra) # 407c <fatfs_add_free_space>
    426c:	06051c63          	bnez	a0,42e4 <_write_sectors+0x19c>
    4270:	00000413          	li	s0,0
    4274:	04c12083          	lw	ra,76(sp)
    4278:	00040513          	mv	a0,s0
    427c:	04812403          	lw	s0,72(sp)
    4280:	04412483          	lw	s1,68(sp)
    4284:	04012903          	lw	s2,64(sp)
    4288:	03c12983          	lw	s3,60(sp)
    428c:	03812a03          	lw	s4,56(sp)
    4290:	03412a83          	lw	s5,52(sp)
    4294:	03012b03          	lw	s6,48(sp)
    4298:	02c12b83          	lw	s7,44(sp)
    429c:	02812c03          	lw	s8,40(sp)
    42a0:	02412c83          	lw	s9,36(sp)
    42a4:	02012d03          	lw	s10,32(sp)
    42a8:	05010113          	addi	sp,sp,80
    42ac:	00008067          	ret
    42b0:	0044a583          	lw	a1,4(s1)
    42b4:	00000913          	li	s2,0
    42b8:	f7dff06f          	j	4234 <_write_sectors+0xec>
    42bc:	fbca8513          	addi	a0,s5,-68
    42c0:	00b12623          	sw	a1,12(sp)
    42c4:	fffff097          	auipc	ra,0xfffff
    42c8:	c04080e7          	jalr	-1020(ra) # 2ec8 <fatfs_find_next_cluster>
    42cc:	00c12583          	lw	a1,12(sp)
    42d0:	00b12e23          	sw	a1,28(sp)
    42d4:	f76508e3          	beq	a0,s6,4244 <_write_sectors+0xfc>
    42d8:	00190913          	addi	s2,s2,1
    42dc:	00050593          	mv	a1,a0
    42e0:	f59ff06f          	j	4238 <_write_sectors+0xf0>
    42e4:	01c12583          	lw	a1,28(sp)
    42e8:	22b4a623          	sw	a1,556(s1)
    42ec:	2344a423          	sw	s4,552(s1)
    42f0:	f09ff06f          	j	41f8 <_write_sectors+0xb0>

000042f4 <fl_fflush>:
    42f4:	000057b7          	lui	a5,0x5
    42f8:	39c7a783          	lw	a5,924(a5) # 539c <_filelib_init>
    42fc:	ff010113          	addi	sp,sp,-16
    4300:	00812423          	sw	s0,8(sp)
    4304:	00112623          	sw	ra,12(sp)
    4308:	00912223          	sw	s1,4(sp)
    430c:	00050413          	mv	s0,a0
    4310:	00079663          	bnez	a5,431c <fl_fflush+0x28>
    4314:	ffffe097          	auipc	ra,0xffffe
    4318:	b74080e7          	jalr	-1164(ra) # 1e88 <fl_init>
    431c:	04040663          	beqz	s0,4368 <fl_fflush+0x74>
    4320:	0000b4b7          	lui	s1,0xb
    4324:	fbc48493          	addi	s1,s1,-68 # afbc <_fs>
    4328:	03c4a783          	lw	a5,60(s1)
    432c:	00078463          	beqz	a5,4334 <fl_fflush+0x40>
    4330:	000780e7          	jalr	a5
    4334:	43442783          	lw	a5,1076(s0)
    4338:	02078263          	beqz	a5,435c <fl_fflush+0x68>
    433c:	43042583          	lw	a1,1072(s0)
    4340:	00100693          	li	a3,1
    4344:	23040613          	addi	a2,s0,560
    4348:	00040513          	mv	a0,s0
    434c:	00000097          	auipc	ra,0x0
    4350:	dfc080e7          	jalr	-516(ra) # 4148 <_write_sectors>
    4354:	00050463          	beqz	a0,435c <fl_fflush+0x68>
    4358:	42042a23          	sw	zero,1076(s0)
    435c:	0404a783          	lw	a5,64(s1)
    4360:	00078463          	beqz	a5,4368 <fl_fflush+0x74>
    4364:	000780e7          	jalr	a5
    4368:	00c12083          	lw	ra,12(sp)
    436c:	00812403          	lw	s0,8(sp)
    4370:	00412483          	lw	s1,4(sp)
    4374:	00000513          	li	a0,0
    4378:	01010113          	addi	sp,sp,16
    437c:	00008067          	ret

00004380 <fl_fclose>:
    4380:	000057b7          	lui	a5,0x5
    4384:	39c7a783          	lw	a5,924(a5) # 539c <_filelib_init>
    4388:	ff010113          	addi	sp,sp,-16
    438c:	00812423          	sw	s0,8(sp)
    4390:	00112623          	sw	ra,12(sp)
    4394:	00912223          	sw	s1,4(sp)
    4398:	01212023          	sw	s2,0(sp)
    439c:	00050413          	mv	s0,a0
    43a0:	00079663          	bnez	a5,43ac <fl_fclose+0x2c>
    43a4:	ffffe097          	auipc	ra,0xffffe
    43a8:	ae4080e7          	jalr	-1308(ra) # 1e88 <fl_init>
    43ac:	08040c63          	beqz	s0,4444 <fl_fclose+0xc4>
    43b0:	0000b4b7          	lui	s1,0xb
    43b4:	fbc48913          	addi	s2,s1,-68 # afbc <_fs>
    43b8:	03c92783          	lw	a5,60(s2)
    43bc:	00078463          	beqz	a5,43c4 <fl_fclose+0x44>
    43c0:	000780e7          	jalr	a5
    43c4:	00040513          	mv	a0,s0
    43c8:	00000097          	auipc	ra,0x0
    43cc:	f2c080e7          	jalr	-212(ra) # 42f4 <fl_fflush>
    43d0:	01042783          	lw	a5,16(s0)
    43d4:	00078e63          	beqz	a5,43f0 <fl_fclose+0x70>
    43d8:	00c42683          	lw	a3,12(s0)
    43dc:	00042583          	lw	a1,0(s0)
    43e0:	21c40613          	addi	a2,s0,540
    43e4:	fbc48513          	addi	a0,s1,-68
    43e8:	fffff097          	auipc	ra,0xfffff
    43ec:	338080e7          	jalr	824(ra) # 3720 <fatfs_update_file_length>
    43f0:	fff00793          	li	a5,-1
    43f4:	42f42823          	sw	a5,1072(s0)
    43f8:	00040513          	mv	a0,s0
    43fc:	00042423          	sw	zero,8(s0)
    4400:	00042623          	sw	zero,12(s0)
    4404:	00042223          	sw	zero,4(s0)
    4408:	42042a23          	sw	zero,1076(s0)
    440c:	00042823          	sw	zero,16(s0)
    4410:	ffffe097          	auipc	ra,0xffffe
    4414:	900080e7          	jalr	-1792(ra) # 1d10 <_free_file>
    4418:	fbc48513          	addi	a0,s1,-68
    441c:	fffff097          	auipc	ra,0xfffff
    4420:	a54080e7          	jalr	-1452(ra) # 2e70 <fatfs_fat_purge>
    4424:	04092783          	lw	a5,64(s2)
    4428:	00078e63          	beqz	a5,4444 <fl_fclose+0xc4>
    442c:	00812403          	lw	s0,8(sp)
    4430:	00c12083          	lw	ra,12(sp)
    4434:	00412483          	lw	s1,4(sp)
    4438:	00012903          	lw	s2,0(sp)
    443c:	01010113          	addi	sp,sp,16
    4440:	00078067          	jr	a5
    4444:	00c12083          	lw	ra,12(sp)
    4448:	00812403          	lw	s0,8(sp)
    444c:	00412483          	lw	s1,4(sp)
    4450:	00012903          	lw	s2,0(sp)
    4454:	01010113          	addi	sp,sp,16
    4458:	00008067          	ret

0000445c <fl_fread>:
    445c:	000057b7          	lui	a5,0x5
    4460:	39c7a783          	lw	a5,924(a5) # 539c <_filelib_init>
    4464:	fc010113          	addi	sp,sp,-64
    4468:	02812c23          	sw	s0,56(sp)
    446c:	03512223          	sw	s5,36(sp)
    4470:	02112e23          	sw	ra,60(sp)
    4474:	02912a23          	sw	s1,52(sp)
    4478:	03212823          	sw	s2,48(sp)
    447c:	03312623          	sw	s3,44(sp)
    4480:	03412423          	sw	s4,40(sp)
    4484:	03612023          	sw	s6,32(sp)
    4488:	01712e23          	sw	s7,28(sp)
    448c:	01812c23          	sw	s8,24(sp)
    4490:	01912a23          	sw	s9,20(sp)
    4494:	00050a93          	mv	s5,a0
    4498:	00068413          	mv	s0,a3
    449c:	00058513          	mv	a0,a1
    44a0:	00079e63          	bnez	a5,44bc <fl_fread+0x60>
    44a4:	00c12623          	sw	a2,12(sp)
    44a8:	00b12423          	sw	a1,8(sp)
    44ac:	ffffe097          	auipc	ra,0xffffe
    44b0:	9dc080e7          	jalr	-1572(ra) # 1e88 <fl_init>
    44b4:	00c12603          	lw	a2,12(sp)
    44b8:	00812503          	lw	a0,8(sp)
    44bc:	14040e63          	beqz	s0,4618 <fl_fread+0x1bc>
    44c0:	140a8c63          	beqz	s5,4618 <fl_fread+0x1bc>
    44c4:	43844783          	lbu	a5,1080(s0)
    44c8:	fff00493          	li	s1,-1
    44cc:	0017f793          	andi	a5,a5,1
    44d0:	04078863          	beqz	a5,4520 <fl_fread+0xc4>
    44d4:	00060593          	mv	a1,a2
    44d8:	ffffd097          	auipc	ra,0xffffd
    44dc:	51c080e7          	jalr	1308(ra) # 19f4 <__mulsi3>
    44e0:	00050493          	mv	s1,a0
    44e4:	02050e63          	beqz	a0,4520 <fl_fread+0xc4>
    44e8:	00842583          	lw	a1,8(s0)
    44ec:	00c42783          	lw	a5,12(s0)
    44f0:	12f5f463          	bgeu	a1,a5,4618 <fl_fread+0x1bc>
    44f4:	00b50733          	add	a4,a0,a1
    44f8:	00e7f463          	bgeu	a5,a4,4500 <fl_fread+0xa4>
    44fc:	40b784b3          	sub	s1,a5,a1
    4500:	0095da13          	srli	s4,a1,0x9
    4504:	1ff5f913          	andi	s2,a1,511
    4508:	00000993          	li	s3,0
    450c:	23040b13          	addi	s6,s0,560
    4510:	20000b93          	li	s7,512
    4514:	1ff00c13          	li	s8,511
    4518:	0499c063          	blt	s3,s1,4558 <fl_fread+0xfc>
    451c:	00098493          	mv	s1,s3
    4520:	03c12083          	lw	ra,60(sp)
    4524:	03812403          	lw	s0,56(sp)
    4528:	03012903          	lw	s2,48(sp)
    452c:	02c12983          	lw	s3,44(sp)
    4530:	02812a03          	lw	s4,40(sp)
    4534:	02412a83          	lw	s5,36(sp)
    4538:	02012b03          	lw	s6,32(sp)
    453c:	01c12b83          	lw	s7,28(sp)
    4540:	01812c03          	lw	s8,24(sp)
    4544:	01412c83          	lw	s9,20(sp)
    4548:	00048513          	mv	a0,s1
    454c:	03412483          	lw	s1,52(sp)
    4550:	04010113          	addi	sp,sp,64
    4554:	00008067          	ret
    4558:	04091663          	bnez	s2,45a4 <fl_fread+0x148>
    455c:	413486b3          	sub	a3,s1,s3
    4560:	04dc5263          	bge	s8,a3,45a4 <fl_fread+0x148>
    4564:	4096d693          	srai	a3,a3,0x9
    4568:	013a8633          	add	a2,s5,s3
    456c:	000a0593          	mv	a1,s4
    4570:	00040513          	mv	a0,s0
    4574:	fffff097          	auipc	ra,0xfffff
    4578:	5ec080e7          	jalr	1516(ra) # 3b60 <_read_sectors>
    457c:	fa0500e3          	beqz	a0,451c <fl_fread+0xc0>
    4580:	00951c93          	slli	s9,a0,0x9
    4584:	000c8613          	mv	a2,s9
    4588:	00aa0a33          	add	s4,s4,a0
    458c:	00842783          	lw	a5,8(s0)
    4590:	00c989b3          	add	s3,s3,a2
    4594:	00000913          	li	s2,0
    4598:	019787b3          	add	a5,a5,s9
    459c:	00f42423          	sw	a5,8(s0)
    45a0:	f79ff06f          	j	4518 <fl_fread+0xbc>
    45a4:	43042783          	lw	a5,1072(s0)
    45a8:	03478e63          	beq	a5,s4,45e4 <fl_fread+0x188>
    45ac:	43442783          	lw	a5,1076(s0)
    45b0:	00078863          	beqz	a5,45c0 <fl_fread+0x164>
    45b4:	00040513          	mv	a0,s0
    45b8:	00000097          	auipc	ra,0x0
    45bc:	d3c080e7          	jalr	-708(ra) # 42f4 <fl_fflush>
    45c0:	00100693          	li	a3,1
    45c4:	000b0613          	mv	a2,s6
    45c8:	000a0593          	mv	a1,s4
    45cc:	00040513          	mv	a0,s0
    45d0:	fffff097          	auipc	ra,0xfffff
    45d4:	590080e7          	jalr	1424(ra) # 3b60 <_read_sectors>
    45d8:	f40502e3          	beqz	a0,451c <fl_fread+0xc0>
    45dc:	43442823          	sw	s4,1072(s0)
    45e0:	42042a23          	sw	zero,1076(s0)
    45e4:	412b87b3          	sub	a5,s7,s2
    45e8:	41348633          	sub	a2,s1,s3
    45ec:	00c7d463          	bge	a5,a2,45f4 <fl_fread+0x198>
    45f0:	00078613          	mv	a2,a5
    45f4:	012b05b3          	add	a1,s6,s2
    45f8:	013a8533          	add	a0,s5,s3
    45fc:	00060c93          	mv	s9,a2
    4600:	00c12423          	sw	a2,8(sp)
    4604:	ffffd097          	auipc	ra,0xffffd
    4608:	c38080e7          	jalr	-968(ra) # 123c <memcpy>
    460c:	00812603          	lw	a2,8(sp)
    4610:	001a0a13          	addi	s4,s4,1
    4614:	f79ff06f          	j	458c <fl_fread+0x130>
    4618:	fff00493          	li	s1,-1
    461c:	f05ff06f          	j	4520 <fl_fread+0xc4>

00004620 <fatfs_allocate_free_space>:
    4620:	fd010113          	addi	sp,sp,-48
    4624:	02112623          	sw	ra,44(sp)
    4628:	02812423          	sw	s0,40(sp)
    462c:	02912223          	sw	s1,36(sp)
    4630:	03212023          	sw	s2,32(sp)
    4634:	01312e23          	sw	s3,28(sp)
    4638:	01412c23          	sw	s4,24(sp)
    463c:	01512a23          	sw	s5,20(sp)
    4640:	02069863          	bnez	a3,4670 <fatfs_allocate_free_space+0x50>
    4644:	00000413          	li	s0,0
    4648:	02c12083          	lw	ra,44(sp)
    464c:	00040513          	mv	a0,s0
    4650:	02812403          	lw	s0,40(sp)
    4654:	02412483          	lw	s1,36(sp)
    4658:	02012903          	lw	s2,32(sp)
    465c:	01c12983          	lw	s3,28(sp)
    4660:	01812a03          	lw	s4,24(sp)
    4664:	01412a83          	lw	s5,20(sp)
    4668:	03010113          	addi	sp,sp,48
    466c:	00008067          	ret
    4670:	02452783          	lw	a5,36(a0)
    4674:	00058a13          	mv	s4,a1
    4678:	fff00593          	li	a1,-1
    467c:	00050493          	mv	s1,a0
    4680:	00068913          	mv	s2,a3
    4684:	00060993          	mv	s3,a2
    4688:	00b78663          	beq	a5,a1,4694 <fatfs_allocate_free_space+0x74>
    468c:	fffff097          	auipc	ra,0xfffff
    4690:	620080e7          	jalr	1568(ra) # 3cac <fatfs_set_fs_info_next_free_cluster>
    4694:	0004c783          	lbu	a5,0(s1)
    4698:	00090513          	mv	a0,s2
    469c:	00979a93          	slli	s5,a5,0x9
    46a0:	000a8593          	mv	a1,s5
    46a4:	ffffd097          	auipc	ra,0xffffd
    46a8:	ad0080e7          	jalr	-1328(ra) # 1174 <__udivsi3>
    46ac:	00050413          	mv	s0,a0
    46b0:	00050593          	mv	a1,a0
    46b4:	000a8513          	mv	a0,s5
    46b8:	ffffd097          	auipc	ra,0xffffd
    46bc:	33c080e7          	jalr	828(ra) # 19f4 <__mulsi3>
    46c0:	41250533          	sub	a0,a0,s2
    46c4:	00a03533          	snez	a0,a0
    46c8:	00a40933          	add	s2,s0,a0
    46cc:	040a0463          	beqz	s4,4714 <fatfs_allocate_free_space+0xf4>
    46d0:	0084a583          	lw	a1,8(s1)
    46d4:	00c10613          	addi	a2,sp,12
    46d8:	00048513          	mv	a0,s1
    46dc:	fffff097          	auipc	ra,0xfffff
    46e0:	680080e7          	jalr	1664(ra) # 3d5c <fatfs_find_blank_cluster>
    46e4:	00050413          	mv	s0,a0
    46e8:	f4050ee3          	beqz	a0,4644 <fatfs_allocate_free_space+0x24>
    46ec:	00100793          	li	a5,1
    46f0:	02f91663          	bne	s2,a5,471c <fatfs_allocate_free_space+0xfc>
    46f4:	00c12903          	lw	s2,12(sp)
    46f8:	fff00613          	li	a2,-1
    46fc:	00048513          	mv	a0,s1
    4700:	00090593          	mv	a1,s2
    4704:	fffff097          	auipc	ra,0xfffff
    4708:	76c080e7          	jalr	1900(ra) # 3e70 <fatfs_fat_set_cluster>
    470c:	0129a023          	sw	s2,0(s3)
    4710:	f39ff06f          	j	4648 <fatfs_allocate_free_space+0x28>
    4714:	0009a783          	lw	a5,0(s3)
    4718:	00f12623          	sw	a5,12(sp)
    471c:	00090613          	mv	a2,s2
    4720:	00c10593          	addi	a1,sp,12
    4724:	00048513          	mv	a0,s1
    4728:	00000097          	auipc	ra,0x0
    472c:	954080e7          	jalr	-1708(ra) # 407c <fatfs_add_free_space>
    4730:	00050413          	mv	s0,a0
    4734:	f15ff06f          	j	4648 <fatfs_allocate_free_space+0x28>

00004738 <fatfs_add_file_entry>:
    4738:	03852883          	lw	a7,56(a0)
    473c:	30088e63          	beqz	a7,4a58 <fatfs_add_file_entry+0x320>
    4740:	f8010113          	addi	sp,sp,-128
    4744:	06812c23          	sw	s0,120(sp)
    4748:	00050413          	mv	s0,a0
    474c:	00060513          	mv	a0,a2
    4750:	06912a23          	sw	s1,116(sp)
    4754:	07512223          	sw	s5,100(sp)
    4758:	00f12c23          	sw	a5,24(sp)
    475c:	00e12a23          	sw	a4,20(sp)
    4760:	06112e23          	sw	ra,124(sp)
    4764:	07212823          	sw	s2,112(sp)
    4768:	07312623          	sw	s3,108(sp)
    476c:	07412423          	sw	s4,104(sp)
    4770:	07612023          	sw	s6,96(sp)
    4774:	05712e23          	sw	s7,92(sp)
    4778:	05812c23          	sw	s8,88(sp)
    477c:	05912a23          	sw	s9,84(sp)
    4780:	05a12823          	sw	s10,80(sp)
    4784:	05b12623          	sw	s11,76(sp)
    4788:	01012e23          	sw	a6,28(sp)
    478c:	00068a93          	mv	s5,a3
    4790:	00c12823          	sw	a2,16(sp)
    4794:	00b12423          	sw	a1,8(sp)
    4798:	ffffe097          	auipc	ra,0xffffe
    479c:	a48080e7          	jalr	-1464(ra) # 21e0 <fatfs_lfn_entries_required>
    47a0:	00150713          	addi	a4,a0,1
    47a4:	00100793          	li	a5,1
    47a8:	00050493          	mv	s1,a0
    47ac:	2ae7f263          	bgeu	a5,a4,4a50 <fatfs_add_file_entry+0x318>
    47b0:	00000a13          	li	s4,0
    47b4:	00000993          	li	s3,0
    47b8:	00000913          	li	s2,0
    47bc:	00000c93          	li	s9,0
    47c0:	00000b13          	li	s6,0
    47c4:	01000c13          	li	s8,16
    47c8:	00812583          	lw	a1,8(sp)
    47cc:	00000693          	li	a3,0
    47d0:	000b0613          	mv	a2,s6
    47d4:	00040513          	mv	a0,s0
    47d8:	000b0b93          	mv	s7,s6
    47dc:	ffffe097          	auipc	ra,0xffffe
    47e0:	7f4080e7          	jalr	2036(ra) # 2fd0 <fatfs_sector_reader>
    47e4:	18050463          	beqz	a0,496c <fatfs_add_file_entry+0x234>
    47e8:	001b0b13          	addi	s6,s6,1
    47ec:	04440793          	addi	a5,s0,68
    47f0:	000c8d13          	mv	s10,s9
    47f4:	00000d93          	li	s11,0
    47f8:	00078513          	mv	a0,a5
    47fc:	00f12623          	sw	a5,12(sp)
    4800:	ffffe097          	auipc	ra,0xffffe
    4804:	8f8080e7          	jalr	-1800(ra) # 20f8 <fatfs_entry_lfn_text>
    4808:	00c12783          	lw	a5,12(sp)
    480c:	00050c93          	mv	s9,a0
    4810:	02050c63          	beqz	a0,4848 <fatfs_add_file_entry+0x110>
    4814:	020d0463          	beqz	s10,483c <fatfs_add_file_entry+0x104>
    4818:	00090c93          	mv	s9,s2
    481c:	000c8913          	mv	s2,s9
    4820:	001d0c93          	addi	s9,s10,1
    4824:	001d8d93          	addi	s11,s11,1
    4828:	0ffdfd93          	zext.b	s11,s11
    482c:	02078793          	addi	a5,a5,32
    4830:	f98d8ce3          	beq	s11,s8,47c8 <fatfs_add_file_entry+0x90>
    4834:	000c8d13          	mv	s10,s9
    4838:	fc1ff06f          	j	47f8 <fatfs_add_file_entry+0xc0>
    483c:	000d8a13          	mv	s4,s11
    4840:	000b8993          	mv	s3,s7
    4844:	fd9ff06f          	j	481c <fatfs_add_file_entry+0xe4>
    4848:	0007c683          	lbu	a3,0(a5)
    484c:	0e500713          	li	a4,229
    4850:	10e69863          	bne	a3,a4,4960 <fatfs_add_file_entry+0x228>
    4854:	000d1863          	bnez	s10,4864 <fatfs_add_file_entry+0x12c>
    4858:	000d8a13          	mv	s4,s11
    485c:	000b8993          	mv	s3,s7
    4860:	00100913          	li	s2,1
    4864:	fa9d4ee3          	blt	s10,s1,4820 <fatfs_add_file_entry+0xe8>
    4868:	00ba8693          	addi	a3,s5,11
    486c:	000a8713          	mv	a4,s5
    4870:	00000913          	li	s2,0
    4874:	00074603          	lbu	a2,0(a4)
    4878:	00195793          	srli	a5,s2,0x1
    487c:	00791913          	slli	s2,s2,0x7
    4880:	012787b3          	add	a5,a5,s2
    4884:	00170713          	addi	a4,a4,1
    4888:	00c787b3          	add	a5,a5,a2
    488c:	0ff7f913          	zext.b	s2,a5
    4890:	fed712e3          	bne	a4,a3,4874 <fatfs_add_file_entry+0x13c>
    4894:	00098b13          	mv	s6,s3
    4898:	00000d13          	li	s10,0
    489c:	01000b93          	li	s7,16
    48a0:	00812583          	lw	a1,8(sp)
    48a4:	00000693          	li	a3,0
    48a8:	000b0613          	mv	a2,s6
    48ac:	00040513          	mv	a0,s0
    48b0:	ffffe097          	auipc	ra,0xffffe
    48b4:	720080e7          	jalr	1824(ra) # 2fd0 <fatfs_sector_reader>
    48b8:	18050c63          	beqz	a0,4a50 <fatfs_add_file_entry+0x318>
    48bc:	04440c93          	addi	s9,s0,68
    48c0:	413b0db3          	sub	s11,s6,s3
    48c4:	00000793          	li	a5,0
    48c8:	00000c13          	li	s8,0
    48cc:	01912623          	sw	s9,12(sp)
    48d0:	000d1663          	bnez	s10,48dc <fatfs_add_file_entry+0x1a4>
    48d4:	154c1863          	bne	s8,s4,4a24 <fatfs_add_file_entry+0x2ec>
    48d8:	140d9663          	bnez	s11,4a24 <fatfs_add_file_entry+0x2ec>
    48dc:	12049263          	bnez	s1,4a00 <fatfs_add_file_entry+0x2c8>
    48e0:	01c12703          	lw	a4,28(sp)
    48e4:	01412603          	lw	a2,20(sp)
    48e8:	01812583          	lw	a1,24(sp)
    48ec:	02010693          	addi	a3,sp,32
    48f0:	000a8513          	mv	a0,s5
    48f4:	ffffe097          	auipc	ra,0xffffe
    48f8:	a30080e7          	jalr	-1488(ra) # 2324 <fatfs_sfn_create_entry>
    48fc:	02000613          	li	a2,32
    4900:	00c105b3          	add	a1,sp,a2
    4904:	000c8513          	mv	a0,s9
    4908:	ffffd097          	auipc	ra,0xffffd
    490c:	934080e7          	jalr	-1740(ra) # 123c <memcpy>
    4910:	03842783          	lw	a5,56(s0)
    4914:	00c12583          	lw	a1,12(sp)
    4918:	24442503          	lw	a0,580(s0)
    491c:	00100613          	li	a2,1
    4920:	000780e7          	jalr	a5
    4924:	07c12083          	lw	ra,124(sp)
    4928:	07812403          	lw	s0,120(sp)
    492c:	07412483          	lw	s1,116(sp)
    4930:	07012903          	lw	s2,112(sp)
    4934:	06c12983          	lw	s3,108(sp)
    4938:	06812a03          	lw	s4,104(sp)
    493c:	06412a83          	lw	s5,100(sp)
    4940:	06012b03          	lw	s6,96(sp)
    4944:	05c12b83          	lw	s7,92(sp)
    4948:	05812c03          	lw	s8,88(sp)
    494c:	05412c83          	lw	s9,84(sp)
    4950:	05012d03          	lw	s10,80(sp)
    4954:	04c12d83          	lw	s11,76(sp)
    4958:	08010113          	addi	sp,sp,128
    495c:	00008067          	ret
    4960:	ee068ae3          	beqz	a3,4854 <fatfs_add_file_entry+0x11c>
    4964:	00000913          	li	s2,0
    4968:	ebdff06f          	j	4824 <fatfs_add_file_entry+0xec>
    496c:	00842583          	lw	a1,8(s0)
    4970:	02010613          	addi	a2,sp,32
    4974:	00040513          	mv	a0,s0
    4978:	fffff097          	auipc	ra,0xfffff
    497c:	3e4080e7          	jalr	996(ra) # 3d5c <fatfs_find_blank_cluster>
    4980:	0c050863          	beqz	a0,4a50 <fatfs_add_file_entry+0x318>
    4984:	02012b83          	lw	s7,32(sp)
    4988:	00812583          	lw	a1,8(sp)
    498c:	00040513          	mv	a0,s0
    4990:	000b8613          	mv	a2,s7
    4994:	fffff097          	auipc	ra,0xfffff
    4998:	64c080e7          	jalr	1612(ra) # 3fe0 <fatfs_fat_add_cluster_to_chain>
    499c:	0a050a63          	beqz	a0,4a50 <fatfs_add_file_entry+0x318>
    49a0:	20000613          	li	a2,512
    49a4:	00000593          	li	a1,0
    49a8:	04440513          	addi	a0,s0,68
    49ac:	ffffd097          	auipc	ra,0xffffd
    49b0:	874080e7          	jalr	-1932(ra) # 1220 <memset>
    49b4:	00000c13          	li	s8,0
    49b8:	00044783          	lbu	a5,0(s0)
    49bc:	00fc6a63          	bltu	s8,a5,49d0 <fatfs_add_file_entry+0x298>
    49c0:	ea0914e3          	bnez	s2,4868 <fatfs_add_file_entry+0x130>
    49c4:	000b0993          	mv	s3,s6
    49c8:	00000a13          	li	s4,0
    49cc:	e9dff06f          	j	4868 <fatfs_add_file_entry+0x130>
    49d0:	00000693          	li	a3,0
    49d4:	000c0613          	mv	a2,s8
    49d8:	000b8593          	mv	a1,s7
    49dc:	00040513          	mv	a0,s0
    49e0:	ffffd097          	auipc	ra,0xffffd
    49e4:	3f4080e7          	jalr	1012(ra) # 1dd4 <fatfs_write_sector>
    49e8:	06050463          	beqz	a0,4a50 <fatfs_add_file_entry+0x318>
    49ec:	001c0c13          	addi	s8,s8,1
    49f0:	0ffc7c13          	zext.b	s8,s8
    49f4:	fc5ff06f          	j	49b8 <fatfs_add_file_entry+0x280>
    49f8:	001b0b13          	addi	s6,s6,1
    49fc:	ea5ff06f          	j	48a0 <fatfs_add_file_entry+0x168>
    4a00:	01012503          	lw	a0,16(sp)
    4a04:	fff48493          	addi	s1,s1,-1
    4a08:	00090693          	mv	a3,s2
    4a0c:	00048613          	mv	a2,s1
    4a10:	000c8593          	mv	a1,s9
    4a14:	ffffd097          	auipc	ra,0xffffd
    4a18:	7fc080e7          	jalr	2044(ra) # 2210 <fatfs_filename_to_lfn>
    4a1c:	00100d13          	li	s10,1
    4a20:	000d0793          	mv	a5,s10
    4a24:	001c0c13          	addi	s8,s8,1
    4a28:	0ffc7c13          	zext.b	s8,s8
    4a2c:	020c8c93          	addi	s9,s9,32
    4a30:	eb7c10e3          	bne	s8,s7,48d0 <fatfs_add_file_entry+0x198>
    4a34:	fc0782e3          	beqz	a5,49f8 <fatfs_add_file_entry+0x2c0>
    4a38:	03842783          	lw	a5,56(s0)
    4a3c:	00c12583          	lw	a1,12(sp)
    4a40:	24442503          	lw	a0,580(s0)
    4a44:	00100613          	li	a2,1
    4a48:	000780e7          	jalr	a5
    4a4c:	fa0516e3          	bnez	a0,49f8 <fatfs_add_file_entry+0x2c0>
    4a50:	00000513          	li	a0,0
    4a54:	ed1ff06f          	j	4924 <fatfs_add_file_entry+0x1ec>
    4a58:	00000513          	li	a0,0
    4a5c:	00008067          	ret

00004a60 <fl_fopen>:
    4a60:	000057b7          	lui	a5,0x5
    4a64:	39c7a783          	lw	a5,924(a5) # 539c <_filelib_init>
    4a68:	fa010113          	addi	sp,sp,-96
    4a6c:	05212823          	sw	s2,80(sp)
    4a70:	03a12823          	sw	s10,48(sp)
    4a74:	04112e23          	sw	ra,92(sp)
    4a78:	04812c23          	sw	s0,88(sp)
    4a7c:	04912a23          	sw	s1,84(sp)
    4a80:	05312623          	sw	s3,76(sp)
    4a84:	05412423          	sw	s4,72(sp)
    4a88:	05512223          	sw	s5,68(sp)
    4a8c:	05612023          	sw	s6,64(sp)
    4a90:	03712e23          	sw	s7,60(sp)
    4a94:	03812c23          	sw	s8,56(sp)
    4a98:	03912a23          	sw	s9,52(sp)
    4a9c:	00050d13          	mv	s10,a0
    4aa0:	00058913          	mv	s2,a1
    4aa4:	00079663          	bnez	a5,4ab0 <fl_fopen+0x50>
    4aa8:	ffffd097          	auipc	ra,0xffffd
    4aac:	3e0080e7          	jalr	992(ra) # 1e88 <fl_init>
    4ab0:	000057b7          	lui	a5,0x5
    4ab4:	3987a783          	lw	a5,920(a5) # 5398 <_filelib_valid>
    4ab8:	00193713          	seqz	a4,s2
    4abc:	0017b793          	seqz	a5,a5
    4ac0:	00e7e7b3          	or	a5,a5,a4
    4ac4:	36079e63          	bnez	a5,4e40 <fl_fopen+0x3e0>
    4ac8:	360d0c63          	beqz	s10,4e40 <fl_fopen+0x3e0>
    4acc:	00000493          	li	s1,0
    4ad0:	00000413          	li	s0,0
    4ad4:	05700993          	li	s3,87
    4ad8:	07200a13          	li	s4,114
    4adc:	07700b13          	li	s6,119
    4ae0:	06100b93          	li	s7,97
    4ae4:	06200c13          	li	s8,98
    4ae8:	04100a93          	li	s5,65
    4aec:	04200c93          	li	s9,66
    4af0:	00090513          	mv	a0,s2
    4af4:	ffffc097          	auipc	ra,0xffffc
    4af8:	76c080e7          	jalr	1900(ra) # 1260 <strlen>
    4afc:	10a44a63          	blt	s0,a0,4c10 <fl_fopen+0x1b0>
    4b00:	0000b9b7          	lui	s3,0xb
    4b04:	fbc98a13          	addi	s4,s3,-68 # afbc <_fs>
    4b08:	038a2783          	lw	a5,56(s4)
    4b0c:	00079463          	bnez	a5,4b14 <fl_fopen+0xb4>
    4b10:	fd94f493          	andi	s1,s1,-39
    4b14:	03ca2783          	lw	a5,60(s4)
    4b18:	00078463          	beqz	a5,4b20 <fl_fopen+0xc0>
    4b1c:	000780e7          	jalr	a5
    4b20:	0014f793          	andi	a5,s1,1
    4b24:	18079263          	bnez	a5,4ca8 <fl_fopen+0x248>
    4b28:	0204f793          	andi	a5,s1,32
    4b2c:	08078c63          	beqz	a5,4bc4 <fl_fopen+0x164>
    4b30:	038a2783          	lw	a5,56(s4)
    4b34:	06078a63          	beqz	a5,4ba8 <fl_fopen+0x148>
    4b38:	ffffd097          	auipc	ra,0xffffd
    4b3c:	160080e7          	jalr	352(ra) # 1c98 <_allocate_file>
    4b40:	00050413          	mv	s0,a0
    4b44:	06050263          	beqz	a0,4ba8 <fl_fopen+0x148>
    4b48:	01450a93          	addi	s5,a0,20
    4b4c:	10400613          	li	a2,260
    4b50:	00000593          	li	a1,0
    4b54:	000a8513          	mv	a0,s5
    4b58:	ffffc097          	auipc	ra,0xffffc
    4b5c:	6c8080e7          	jalr	1736(ra) # 1220 <memset>
    4b60:	11840b13          	addi	s6,s0,280
    4b64:	10400613          	li	a2,260
    4b68:	00000593          	li	a1,0
    4b6c:	000b0513          	mv	a0,s6
    4b70:	ffffc097          	auipc	ra,0xffffc
    4b74:	6b0080e7          	jalr	1712(ra) # 1220 <memset>
    4b78:	10400713          	li	a4,260
    4b7c:	000b0693          	mv	a3,s6
    4b80:	00070613          	mv	a2,a4
    4b84:	000a8593          	mv	a1,s5
    4b88:	000d0513          	mv	a0,s10
    4b8c:	ffffe097          	auipc	ra,0xffffe
    4b90:	c88080e7          	jalr	-888(ra) # 2814 <fatfs_split_path>
    4b94:	fff00793          	li	a5,-1
    4b98:	12f51663          	bne	a0,a5,4cc4 <fl_fopen+0x264>
    4b9c:	00040513          	mv	a0,s0
    4ba0:	ffffd097          	auipc	ra,0xffffd
    4ba4:	170080e7          	jalr	368(ra) # 1d10 <_free_file>
    4ba8:	00000413          	li	s0,0
    4bac:	0214f793          	andi	a5,s1,33
    4bb0:	02000713          	li	a4,32
    4bb4:	28e79263          	bne	a5,a4,4e38 <fl_fopen+0x3d8>
    4bb8:	10041263          	bnez	s0,4cbc <fl_fopen+0x25c>
    4bbc:	0064f793          	andi	a5,s1,6
    4bc0:	26079463          	bnez	a5,4e28 <fl_fopen+0x3c8>
    4bc4:	00000413          	li	s0,0
    4bc8:	040a2783          	lw	a5,64(s4)
    4bcc:	00078463          	beqz	a5,4bd4 <fl_fopen+0x174>
    4bd0:	000780e7          	jalr	a5
    4bd4:	05c12083          	lw	ra,92(sp)
    4bd8:	00040513          	mv	a0,s0
    4bdc:	05812403          	lw	s0,88(sp)
    4be0:	05412483          	lw	s1,84(sp)
    4be4:	05012903          	lw	s2,80(sp)
    4be8:	04c12983          	lw	s3,76(sp)
    4bec:	04812a03          	lw	s4,72(sp)
    4bf0:	04412a83          	lw	s5,68(sp)
    4bf4:	04012b03          	lw	s6,64(sp)
    4bf8:	03c12b83          	lw	s7,60(sp)
    4bfc:	03812c03          	lw	s8,56(sp)
    4c00:	03412c83          	lw	s9,52(sp)
    4c04:	03012d03          	lw	s10,48(sp)
    4c08:	06010113          	addi	sp,sp,96
    4c0c:	00008067          	ret
    4c10:	008907b3          	add	a5,s2,s0
    4c14:	0007c783          	lbu	a5,0(a5)
    4c18:	05378863          	beq	a5,s3,4c68 <fl_fopen+0x208>
    4c1c:	02f9e863          	bltu	s3,a5,4c4c <fl_fopen+0x1ec>
    4c20:	05578863          	beq	a5,s5,4c70 <fl_fopen+0x210>
    4c24:	00faea63          	bltu	s5,a5,4c38 <fl_fopen+0x1d8>
    4c28:	02b00713          	li	a4,43
    4c2c:	04e78663          	beq	a5,a4,4c78 <fl_fopen+0x218>
    4c30:	00140413          	addi	s0,s0,1
    4c34:	ebdff06f          	j	4af0 <fl_fopen+0x90>
    4c38:	03978263          	beq	a5,s9,4c5c <fl_fopen+0x1fc>
    4c3c:	05200713          	li	a4,82
    4c40:	fee798e3          	bne	a5,a4,4c30 <fl_fopen+0x1d0>
    4c44:	0014e493          	ori	s1,s1,1
    4c48:	fe9ff06f          	j	4c30 <fl_fopen+0x1d0>
    4c4c:	ff478ce3          	beq	a5,s4,4c44 <fl_fopen+0x1e4>
    4c50:	00fa6a63          	bltu	s4,a5,4c64 <fl_fopen+0x204>
    4c54:	01778e63          	beq	a5,s7,4c70 <fl_fopen+0x210>
    4c58:	fd879ce3          	bne	a5,s8,4c30 <fl_fopen+0x1d0>
    4c5c:	0084e493          	ori	s1,s1,8
    4c60:	fd1ff06f          	j	4c30 <fl_fopen+0x1d0>
    4c64:	fd6796e3          	bne	a5,s6,4c30 <fl_fopen+0x1d0>
    4c68:	0324e493          	ori	s1,s1,50
    4c6c:	fc5ff06f          	j	4c30 <fl_fopen+0x1d0>
    4c70:	0264e493          	ori	s1,s1,38
    4c74:	fbdff06f          	j	4c30 <fl_fopen+0x1d0>
    4c78:	0014f793          	andi	a5,s1,1
    4c7c:	00078663          	beqz	a5,4c88 <fl_fopen+0x228>
    4c80:	0024e493          	ori	s1,s1,2
    4c84:	fadff06f          	j	4c30 <fl_fopen+0x1d0>
    4c88:	0024f793          	andi	a5,s1,2
    4c8c:	00078663          	beqz	a5,4c98 <fl_fopen+0x238>
    4c90:	0314e493          	ori	s1,s1,49
    4c94:	f9dff06f          	j	4c30 <fl_fopen+0x1d0>
    4c98:	0044f793          	andi	a5,s1,4
    4c9c:	f8078ae3          	beqz	a5,4c30 <fl_fopen+0x1d0>
    4ca0:	0274e493          	ori	s1,s1,39
    4ca4:	f8dff06f          	j	4c30 <fl_fopen+0x1d0>
    4ca8:	000d0513          	mv	a0,s10
    4cac:	fffff097          	auipc	ra,0xfffff
    4cb0:	81c080e7          	jalr	-2020(ra) # 34c8 <_open_file>
    4cb4:	00050413          	mv	s0,a0
    4cb8:	e60508e3          	beqz	a0,4b28 <fl_fopen+0xc8>
    4cbc:	42940c23          	sb	s1,1080(s0)
    4cc0:	f09ff06f          	j	4bc8 <fl_fopen+0x168>
    4cc4:	00040513          	mv	a0,s0
    4cc8:	ffffe097          	auipc	ra,0xffffe
    4ccc:	dc8080e7          	jalr	-568(ra) # 2a90 <_check_file_open>
    4cd0:	00050913          	mv	s2,a0
    4cd4:	ec0514e3          	bnez	a0,4b9c <fl_fopen+0x13c>
    4cd8:	01444783          	lbu	a5,20(s0)
    4cdc:	0e079663          	bnez	a5,4dc8 <fl_fopen+0x368>
    4ce0:	008a2783          	lw	a5,8(s4)
    4ce4:	00f42023          	sw	a5,0(s0)
    4ce8:	00042583          	lw	a1,0(s0)
    4cec:	01010693          	addi	a3,sp,16
    4cf0:	000b0613          	mv	a2,s6
    4cf4:	fbc98513          	addi	a0,s3,-68
    4cf8:	ffffe097          	auipc	ra,0xffffe
    4cfc:	428080e7          	jalr	1064(ra) # 3120 <fatfs_get_file_entry>
    4d00:	00100693          	li	a3,1
    4d04:	e8d50ce3          	beq	a0,a3,4b9c <fl_fopen+0x13c>
    4d08:	00042223          	sw	zero,4(s0)
    4d0c:	00440613          	addi	a2,s0,4
    4d10:	00068593          	mv	a1,a3
    4d14:	fbc98513          	addi	a0,s3,-68
    4d18:	00000097          	auipc	ra,0x0
    4d1c:	908080e7          	jalr	-1784(ra) # 4620 <fatfs_allocate_free_space>
    4d20:	e6050ee3          	beqz	a0,4b9c <fl_fopen+0x13c>
    4d24:	00002ab7          	lui	s5,0x2
    4d28:	21c40b93          	addi	s7,s0,540
    4d2c:	fbc98c13          	addi	s8,s3,-68
    4d30:	70fa8a93          	addi	s5,s5,1807 # 270f <fatfs_total_path_levels+0x53>
    4d34:	000b0593          	mv	a1,s6
    4d38:	00410513          	addi	a0,sp,4
    4d3c:	ffffd097          	auipc	ra,0xffffd
    4d40:	68c080e7          	jalr	1676(ra) # 23c8 <fatfs_lfn_create_sfn>
    4d44:	08090e63          	beqz	s2,4de0 <fl_fopen+0x380>
    4d48:	00090613          	mv	a2,s2
    4d4c:	00410593          	addi	a1,sp,4
    4d50:	000b8513          	mv	a0,s7
    4d54:	ffffd097          	auipc	ra,0xffffd
    4d58:	7f0080e7          	jalr	2032(ra) # 2544 <fatfs_lfn_generate_tail>
    4d5c:	00042583          	lw	a1,0(s0)
    4d60:	000b8613          	mv	a2,s7
    4d64:	000c0513          	mv	a0,s8
    4d68:	fffff097          	auipc	ra,0xfffff
    4d6c:	8d4080e7          	jalr	-1836(ra) # 363c <fatfs_sfn_exists>
    4d70:	00050663          	beqz	a0,4d7c <fl_fopen+0x31c>
    4d74:	00190913          	addi	s2,s2,1
    4d78:	fb591ee3          	bne	s2,s5,4d34 <fl_fopen+0x2d4>
    4d7c:	00442703          	lw	a4,4(s0)
    4d80:	000027b7          	lui	a5,0x2
    4d84:	70f78793          	addi	a5,a5,1807 # 270f <fatfs_total_path_levels+0x53>
    4d88:	00070593          	mv	a1,a4
    4d8c:	02f90663          	beq	s2,a5,4db8 <fl_fopen+0x358>
    4d90:	00042583          	lw	a1,0(s0)
    4d94:	00000813          	li	a6,0
    4d98:	00000793          	li	a5,0
    4d9c:	000b8693          	mv	a3,s7
    4da0:	000b0613          	mv	a2,s6
    4da4:	fbc98513          	addi	a0,s3,-68
    4da8:	00000097          	auipc	ra,0x0
    4dac:	990080e7          	jalr	-1648(ra) # 4738 <fatfs_add_file_entry>
    4db0:	04051463          	bnez	a0,4df8 <fl_fopen+0x398>
    4db4:	00442583          	lw	a1,4(s0)
    4db8:	fbc98513          	addi	a0,s3,-68
    4dbc:	fffff097          	auipc	ra,0xfffff
    4dc0:	1b4080e7          	jalr	436(ra) # 3f70 <fatfs_free_cluster_chain>
    4dc4:	dd9ff06f          	j	4b9c <fl_fopen+0x13c>
    4dc8:	00040593          	mv	a1,s0
    4dcc:	000a8513          	mv	a0,s5
    4dd0:	ffffe097          	auipc	ra,0xffffe
    4dd4:	54c080e7          	jalr	1356(ra) # 331c <_open_directory>
    4dd8:	f00518e3          	bnez	a0,4ce8 <fl_fopen+0x288>
    4ddc:	dc1ff06f          	j	4b9c <fl_fopen+0x13c>
    4de0:	00b00613          	li	a2,11
    4de4:	00410593          	addi	a1,sp,4
    4de8:	000b8513          	mv	a0,s7
    4dec:	ffffc097          	auipc	ra,0xffffc
    4df0:	450080e7          	jalr	1104(ra) # 123c <memcpy>
    4df4:	f69ff06f          	j	4d5c <fl_fopen+0x2fc>
    4df8:	fff00793          	li	a5,-1
    4dfc:	00042623          	sw	zero,12(s0)
    4e00:	00042423          	sw	zero,8(s0)
    4e04:	42f42823          	sw	a5,1072(s0)
    4e08:	42042a23          	sw	zero,1076(s0)
    4e0c:	00042823          	sw	zero,16(s0)
    4e10:	22f42423          	sw	a5,552(s0)
    4e14:	22f42623          	sw	a5,556(s0)
    4e18:	fbc98513          	addi	a0,s3,-68
    4e1c:	ffffe097          	auipc	ra,0xffffe
    4e20:	054080e7          	jalr	84(ra) # 2e70 <fatfs_fat_purge>
    4e24:	d89ff06f          	j	4bac <fl_fopen+0x14c>
    4e28:	000d0513          	mv	a0,s10
    4e2c:	ffffe097          	auipc	ra,0xffffe
    4e30:	69c080e7          	jalr	1692(ra) # 34c8 <_open_file>
    4e34:	00050413          	mv	s0,a0
    4e38:	e80412e3          	bnez	s0,4cbc <fl_fopen+0x25c>
    4e3c:	d89ff06f          	j	4bc4 <fl_fopen+0x164>
    4e40:	00000413          	li	s0,0
    4e44:	d91ff06f          	j	4bd4 <fl_fopen+0x174>

00004e48 <cmd16>:
    4e48:	02000050 00001500                       P.......

00004e50 <acmd41>:
    4e50:	00004069 00000100                       i@......

00004e58 <cmd55>:
    4e58:	00000077 00000100                       w.......

00004e60 <cmd8>:
    4e60:	01000048 000087aa                       H.......

00004e68 <cmd0>:
    4e68:	00000040 00009500                       @.......

00004e70 <AUDIO>:
    4e70:	00018000                                ....

00004e74 <BUTTONS>:
    4e74:	00010100                                ....

00004e78 <SDCARD>:
    4e78:	00010080                                ....

00004e7c <OLED_RST>:
    4e7c:	00010010                                ....

00004e80 <OLED>:
    4e80:	00010008                                ....

00004e84 <LEDS>:
    4e84:	00010004 00006272 696c632f 722e6b63     ....rb../click.r
    4e94:	00007761 3a727245 0a732520 00000000     aw..Err: %s.....
    4ea4:	79616c50 3a676e69 20732520 20202020     Playing: %s     
    4eb4:	20202020 000a2020 0000002f 00002e2e           ../.......
    4ec4:	0000002e 74696e49 20445320 64726163     ....Init SD card
    4ed4:	0a2e2e2e 00000000 52494420 0000203a     ........ DIR: ..
    4ee4:	74706d45 69642079 74636572 2179726f     Empty directory!
    4ef4:	0000000a 5d64255b 00000020 203e6425     ....[%d] ...%d> 
    4f04:	00000000 20202020 20202020 20202020     ....            
    4f14:	20202020 20202020 00000a20 33323130              ...0123
    4f24:	37363534 42413938 46454443 00000000     456789ABCDEF....
    4f34:	5f544146 203a5346 6f727245 6f632072     FAT_FS: Error co
    4f44:	20646c75 20746f6e 64616f6c 54414620     uld not load FAT
    4f54:	74656420 736c6961 64252820 0a0d2129      details (%d)!..
    4f64:	00000000                                ....

00004f68 <font>:
    4f68:	00000000 00002f00 00030000 14000003     ...../..........
    4f78:	143e143e 3a2b6a2e 08122600 171c3224     >.>..j+:.&..$2..
    4f88:	03003415 00000000 0000211e 001e2100     .4.......!...!..
    4f98:	08220000 0822081c 0000081c 00002040     .."...".....@ ..
    4fa8:	00080800 00200000 20000000 02040810     ...... .... ....
    4fb8:	3f21213f 003f0100 253d0000 25002725     ?!!?..?...=%%'.%
    4fc8:	003f2525 3f040407 25252700 253f003d     %%?....?.'%%=.?%
    4fd8:	01003d25 00030539 3f25253f 25252700     %=..9...?%%?.'%%
    4fe8:	0028003f 40000000 00000028 00110a04     ?.(....@(.......
    4ff8:	00141400 0a110000 01000004 0007052d     ............-...
    5008:	253d213f 09093f1f 253f003f 3f003c27     ?!=%.?..?.?%'<.?
    5018:	00212121 1e21213f 25253f00 053f0025     !!!.?!!..?%%%.?.
    5028:	3f000505 003d2521 3f04043f 213f2100     ...?!%=.?..?.!?!
    5038:	20380000 3f013f21 003b0404 2020203f     ..8 !?.?..;.?   
    5048:	3f013f00 023f3f01 3f003f04 003f2121     .?.?.??..?.?!!?.
    5058:	0f09093f 31213f00 093f003f 27002f39     ?....?!1?.?.9/.'
    5068:	003d2525 013f0101 20203f01 100f003f     %%=...?..?  ?...
    5078:	3f001f30 3f203f20 3b04043b 38080f00     0..? ? ?;..;...8
    5088:	2931000f 3f002325 00000021 04081020     ..1)%#.?!... ...
    5098:	003f2102 01020000 20000201 00000020     .!?........  ...
    50a8:	00000201 24243800 243f003c 3c003c24     .....8$$<.?$$<.<
    50b8:	00242424 3f24243c 2c2c3c00 3f04002c     $$$.<$$?.<,,,..?
    50c8:	bc000005 00fca4a4 3c04043f 00003d00     ........?..<.=..
    50d8:	fd800000 3f000000 00340808 0000003f     .......?..4.?...
    50e8:	3c043c00 043c3c04 3c003c04 003c2424     .<.<.<<..<.<$$<.
    50f8:	3c2424fc 24243c00 083c00fc 2c000004     .$$<.<$$..<....,
    5108:	003c2c2c 00243f04 20203c00 100c003c     ,,<..?$..<  <...
    5118:	3c001c30 3c203c20 34080834 a0a0bc00     0..< < <4..4....
    5128:	342400fc 0400242c 0000213f 0000003f     ..$4,$..?!..?...
    5138:	043f2100 02010000 00000102 00000000     .!?.............
    5148:	00000001 00000003 00000005 00000007     ................
    5158:	00000009 0000000e 00000010 00000012     ................
    5168:	00000014 00000016 00000018 0000001c     ................
    5178:	0000001e                                ....

0000517c <current_path>:
    517c:	0000002f 00000000 00000000 00000000     /...............
	...

00005370 <n_items>:
    5370:	00000000                                ....

00005374 <sdcard_while_loading_callback>:
    5374:	00000000                                ....

00005378 <back_color>:
	...

00005379 <front_color>:
    5379:	                                         ...

0000537c <cursor_y>:
    537c:	00000000                                ....

00005380 <cursor_x>:
    5380:	00000000                                ....

00005384 <f_putchar>:
    5384:	00000000                                ....

00005388 <_free_file_list>:
	...

00005390 <_open_file_list>:
	...

00005398 <_filelib_valid>:
    5398:	00000000                                ....

0000539c <_filelib_init>:
    539c:	00000000                                ....
