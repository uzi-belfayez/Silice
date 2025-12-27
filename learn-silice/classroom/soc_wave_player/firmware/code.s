
code.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00010137          	lui	sp,0x10
       4:	00001097          	auipc	ra,0x1
       8:	564080e7          	jalr	1380(ra) # 1568 <main>
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
      64:	fe010113          	addi	sp,sp,-32 # ffe0 <_files+0x80c8>
      68:	000067b7          	lui	a5,0x6
      6c:	00812c23          	sw	s0,24(sp)
      70:	8b07a403          	lw	s0,-1872(a5) # 58b0 <AUDIO>
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
      a8:	00002097          	auipc	ra,0x2
      ac:	c1c080e7          	jalr	-996(ra) # 1cc4 <memset>
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
      e0:	000065b7          	lui	a1,0x6
      e4:	00006537          	lui	a0,0x6
      e8:	fe010113          	addi	sp,sp,-32
      ec:	8cc58593          	addi	a1,a1,-1844 # 58cc <LEDS+0x4>
      f0:	8d450513          	addi	a0,a0,-1836 # 58d4 <LEDS+0xc>
      f4:	00112e23          	sw	ra,28(sp)
      f8:	00812c23          	sw	s0,24(sp)
      fc:	00912a23          	sw	s1,20(sp)
     100:	01212823          	sw	s2,16(sp)
     104:	01312623          	sw	s3,12(sp)
     108:	01412423          	sw	s4,8(sp)
     10c:	01512223          	sw	s5,4(sp)
     110:	00005097          	auipc	ra,0x5
     114:	390080e7          	jalr	912(ra) # 54a0 <fl_fopen>
     118:	0a050063          	beqz	a0,1b8 <play_click_noise+0xd8>
     11c:	00000613          	li	a2,0
     120:	32000593          	li	a1,800
     124:	00050a13          	mv	s4,a0
     128:	00003097          	auipc	ra,0x3
     12c:	808080e7          	jalr	-2040(ra) # 2930 <fl_fseek>
     130:	000067b7          	lui	a5,0x6
     134:	8b07aa83          	lw	s5,-1872(a5) # 58b0 <AUDIO>
     138:	20000993          	li	s3,512
     13c:	1ff00913          	li	s2,511
     140:	000aa483          	lw	s1,0(s5)
     144:	000a0693          	mv	a3,s4
     148:	20000613          	li	a2,512
     14c:	00100593          	li	a1,1
     150:	00048513          	mv	a0,s1
     154:	00005097          	auipc	ra,0x5
     158:	d48080e7          	jalr	-696(ra) # 4e9c <fl_fread>
     15c:	00050413          	mv	s0,a0
     160:	00a94c63          	blt	s2,a0,178 <play_click_noise+0x98>
     164:	40a98633          	sub	a2,s3,a0
     168:	00000593          	li	a1,0
     16c:	00a48533          	add	a0,s1,a0
     170:	00002097          	auipc	ra,0x2
     174:	b54080e7          	jalr	-1196(ra) # 1cc4 <memset>
     178:	000aa783          	lw	a5,0(s5)
     17c:	fef48ee3          	beq	s1,a5,178 <play_click_noise+0x98>
     180:	fc8940e3          	blt	s2,s0,140 <play_click_noise+0x60>
     184:	000a0513          	mv	a0,s4
     188:	00005097          	auipc	ra,0x5
     18c:	c38080e7          	jalr	-968(ra) # 4dc0 <fl_fclose>
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
     1dc:	000065b7          	lui	a1,0x6
     1e0:	ff010113          	addi	sp,sp,-16
     1e4:	8cc58593          	addi	a1,a1,-1844 # 58cc <LEDS+0x4>
     1e8:	00112623          	sw	ra,12(sp)
     1ec:	00812423          	sw	s0,8(sp)
     1f0:	00005097          	auipc	ra,0x5
     1f4:	2b0080e7          	jalr	688(ra) # 54a0 <fl_fopen>
     1f8:	08050663          	beqz	a0,284 <view_image_file+0xa8>
     1fc:	00050413          	mv	s0,a0
     200:	00002097          	auipc	ra,0x2
     204:	e10080e7          	jalr	-496(ra) # 2010 <display_framebuffer>
     208:	00040693          	mv	a3,s0
     20c:	00004637          	lui	a2,0x4
     210:	00100593          	li	a1,1
     214:	00005097          	auipc	ra,0x5
     218:	c88080e7          	jalr	-888(ra) # 4e9c <fl_fread>
     21c:	00040513          	mv	a0,s0
     220:	00005097          	auipc	ra,0x5
     224:	ba0080e7          	jalr	-1120(ra) # 4dc0 <fl_fclose>
     228:	00002097          	auipc	ra,0x2
     22c:	f64080e7          	jalr	-156(ra) # 218c <display_refresh>
     230:	000067b7          	lui	a5,0x6
     234:	8b87a683          	lw	a3,-1864(a5) # 58b8 <BUTTONS>
     238:	0006a703          	lw	a4,0(a3)
     23c:	fff74793          	not	a5,a4
     240:	0006a703          	lw	a4,0(a3)
     244:	00e7f7b3          	and	a5,a5,a4
     248:	0067f793          	andi	a5,a5,6
     24c:	fe0788e3          	beqz	a5,23c <view_image_file+0x60>
     250:	00000097          	auipc	ra,0x0
     254:	e90080e7          	jalr	-368(ra) # e0 <play_click_noise>
     258:	00002097          	auipc	ra,0x2
     25c:	db8080e7          	jalr	-584(ra) # 2010 <display_framebuffer>
     260:	00004637          	lui	a2,0x4
     264:	00000593          	li	a1,0
     268:	00002097          	auipc	ra,0x2
     26c:	a5c080e7          	jalr	-1444(ra) # 1cc4 <memset>
     270:	00812403          	lw	s0,8(sp)
     274:	00c12083          	lw	ra,12(sp)
     278:	01010113          	addi	sp,sp,16
     27c:	00002317          	auipc	t1,0x2
     280:	f1030067          	jr	-240(t1) # 218c <display_refresh>
     284:	00c12083          	lw	ra,12(sp)
     288:	00812403          	lw	s0,8(sp)
     28c:	01010113          	addi	sp,sp,16
     290:	00008067          	ret

00000294 <play_music_file>:
     294:	000065b7          	lui	a1,0x6
     298:	fc010113          	addi	sp,sp,-64
     29c:	8cc58593          	addi	a1,a1,-1844 # 58cc <LEDS+0x4>
     2a0:	02812c23          	sw	s0,56(sp)
     2a4:	02112e23          	sw	ra,60(sp)
     2a8:	02912a23          	sw	s1,52(sp)
     2ac:	03212823          	sw	s2,48(sp)
     2b0:	03312623          	sw	s3,44(sp)
     2b4:	03412423          	sw	s4,40(sp)
     2b8:	03512223          	sw	s5,36(sp)
     2bc:	03612023          	sw	s6,32(sp)
     2c0:	01712e23          	sw	s7,28(sp)
     2c4:	01812c23          	sw	s8,24(sp)
     2c8:	01912a23          	sw	s9,20(sp)
     2cc:	01a12823          	sw	s10,16(sp)
     2d0:	01b12623          	sw	s11,12(sp)
     2d4:	00050413          	mv	s0,a0
     2d8:	00005097          	auipc	ra,0x5
     2dc:	1c8080e7          	jalr	456(ra) # 54a0 <fl_fopen>
     2e0:	08051063          	bnez	a0,360 <play_music_file+0xcc>
     2e4:	00000593          	li	a1,0
     2e8:	0ff00513          	li	a0,255
     2ec:	00002097          	auipc	ra,0x2
     2f0:	d44080e7          	jalr	-700(ra) # 2030 <display_set_front_back_color>
     2f4:	00006537          	lui	a0,0x6
     2f8:	00040593          	mv	a1,s0
     2fc:	8e050513          	addi	a0,a0,-1824 # 58e0 <LEDS+0x18>
     300:	00002097          	auipc	ra,0x2
     304:	ff8080e7          	jalr	-8(ra) # 22f8 <printf>
     308:	00002097          	auipc	ra,0x2
     30c:	e84080e7          	jalr	-380(ra) # 218c <display_refresh>
     310:	000317b7          	lui	a5,0x31
     314:	d4078793          	addi	a5,a5,-704 # 30d40 <__stacktop+0x20d40>
     318:	00000013          	nop
     31c:	fff78793          	addi	a5,a5,-1
     320:	fe079ce3          	bnez	a5,318 <play_music_file+0x84>
     324:	03c12083          	lw	ra,60(sp)
     328:	03812403          	lw	s0,56(sp)
     32c:	03412483          	lw	s1,52(sp)
     330:	03012903          	lw	s2,48(sp)
     334:	02c12983          	lw	s3,44(sp)
     338:	02812a03          	lw	s4,40(sp)
     33c:	02412a83          	lw	s5,36(sp)
     340:	02012b03          	lw	s6,32(sp)
     344:	01c12b83          	lw	s7,28(sp)
     348:	01812c03          	lw	s8,24(sp)
     34c:	01412c83          	lw	s9,20(sp)
     350:	01012d03          	lw	s10,16(sp)
     354:	00c12d83          	lw	s11,12(sp)
     358:	04010113          	addi	sp,sp,64
     35c:	00008067          	ret
     360:	00000593          	li	a1,0
     364:	00050c13          	mv	s8,a0
     368:	00000513          	li	a0,0
     36c:	00002097          	auipc	ra,0x2
     370:	cb0080e7          	jalr	-848(ra) # 201c <display_set_cursor>
     374:	00000593          	li	a1,0
     378:	0ff00513          	li	a0,255
     37c:	00002097          	auipc	ra,0x2
     380:	cb4080e7          	jalr	-844(ra) # 2030 <display_set_front_back_color>
     384:	00006537          	lui	a0,0x6
     388:	00040593          	mv	a1,s0
     38c:	8ec50513          	addi	a0,a0,-1812 # 58ec <LEDS+0x24>
     390:	00002097          	auipc	ra,0x2
     394:	f68080e7          	jalr	-152(ra) # 22f8 <printf>
     398:	00002097          	auipc	ra,0x2
     39c:	df4080e7          	jalr	-524(ra) # 218c <display_refresh>
     3a0:	000067b7          	lui	a5,0x6
     3a4:	8b87a783          	lw	a5,-1864(a5) # 58b8 <BUTTONS>
     3a8:	00000b13          	li	s6,0
     3ac:	00100413          	li	s0,1
     3b0:	0007a483          	lw	s1,0(a5)
     3b4:	00078c93          	mv	s9,a5
     3b8:	000067b7          	lui	a5,0x6
     3bc:	8b07ad03          	lw	s10,-1872(a5) # 58b0 <AUDIO>
     3c0:	20000a13          	li	s4,512
     3c4:	1ff00993          	li	s3,511
     3c8:	00006937          	lui	s2,0x6
     3cc:	000d2b83          	lw	s7,0(s10)
     3d0:	000c0693          	mv	a3,s8
     3d4:	20000613          	li	a2,512
     3d8:	00100593          	li	a1,1
     3dc:	000b8513          	mv	a0,s7
     3e0:	00005097          	auipc	ra,0x5
     3e4:	abc080e7          	jalr	-1348(ra) # 4e9c <fl_fread>
     3e8:	00050a93          	mv	s5,a0
     3ec:	00a9cc63          	blt	s3,a0,404 <play_music_file+0x170>
     3f0:	40aa0633          	sub	a2,s4,a0
     3f4:	00000593          	li	a1,0
     3f8:	00ab8533          	add	a0,s7,a0
     3fc:	00002097          	auipc	ra,0x2
     400:	8c8080e7          	jalr	-1848(ra) # 1cc4 <memset>
     404:	000d2783          	lw	a5,0(s10)
     408:	fefb8ee3          	beq	s7,a5,404 <play_music_file+0x170>
     40c:	0559d263          	bge	s3,s5,450 <play_music_file+0x1bc>
     410:	fff40793          	addi	a5,s0,-1
     414:	f8040713          	addi	a4,s0,-128
     418:	00173713          	seqz	a4,a4
     41c:	0017b793          	seqz	a5,a5
     420:	00e7e7b3          	or	a5,a5,a4
     424:	00fb4733          	xor	a4,s6,a5
     428:	0afb0463          	beq	s6,a5,4d0 <play_music_file+0x23c>
     42c:	00141413          	slli	s0,s0,0x1
     430:	8c892783          	lw	a5,-1848(s2) # 58c8 <LEDS>
     434:	fff4c493          	not	s1,s1
     438:	0087a023          	sw	s0,0(a5)
     43c:	000ca783          	lw	a5,0(s9)
     440:	00f4f4b3          	and	s1,s1,a5
     444:	08048063          	beqz	s1,4c4 <play_music_file+0x230>
     448:	00000097          	auipc	ra,0x0
     44c:	c98080e7          	jalr	-872(ra) # e0 <play_click_noise>
     450:	000c0513          	mv	a0,s8
     454:	00005097          	auipc	ra,0x5
     458:	96c080e7          	jalr	-1684(ra) # 4dc0 <fl_fclose>
     45c:	00000097          	auipc	ra,0x0
     460:	c08080e7          	jalr	-1016(ra) # 64 <clear_audio>
     464:	8c892783          	lw	a5,-1848(s2)
     468:	0007a023          	sw	zero,0(a5)
     46c:	00002097          	auipc	ra,0x2
     470:	ba4080e7          	jalr	-1116(ra) # 2010 <display_framebuffer>
     474:	00004637          	lui	a2,0x4
     478:	00000593          	li	a1,0
     47c:	00002097          	auipc	ra,0x2
     480:	848080e7          	jalr	-1976(ra) # 1cc4 <memset>
     484:	03812403          	lw	s0,56(sp)
     488:	03c12083          	lw	ra,60(sp)
     48c:	03412483          	lw	s1,52(sp)
     490:	03012903          	lw	s2,48(sp)
     494:	02c12983          	lw	s3,44(sp)
     498:	02812a03          	lw	s4,40(sp)
     49c:	02412a83          	lw	s5,36(sp)
     4a0:	02012b03          	lw	s6,32(sp)
     4a4:	01c12b83          	lw	s7,28(sp)
     4a8:	01812c03          	lw	s8,24(sp)
     4ac:	01412c83          	lw	s9,20(sp)
     4b0:	01012d03          	lw	s10,16(sp)
     4b4:	00c12d83          	lw	s11,12(sp)
     4b8:	04010113          	addi	sp,sp,64
     4bc:	00002317          	auipc	t1,0x2
     4c0:	cd030067          	jr	-816(t1) # 218c <display_refresh>
     4c4:	00070b13          	mv	s6,a4
     4c8:	00078493          	mv	s1,a5
     4cc:	f01ff06f          	j	3cc <play_music_file+0x138>
     4d0:	40145413          	srai	s0,s0,0x1
     4d4:	f5dff06f          	j	430 <play_music_file+0x19c>

000004d8 <play_song_with_cover>:
     4d8:	dc010113          	addi	sp,sp,-576
     4dc:	22812c23          	sw	s0,568(sp)
     4e0:	00058413          	mv	s0,a1
     4e4:	000065b7          	lui	a1,0x6
     4e8:	23212823          	sw	s2,560(sp)
     4ec:	90458593          	addi	a1,a1,-1788 # 5904 <LEDS+0x3c>
     4f0:	00050913          	mv	s2,a0
     4f4:	00c10513          	addi	a0,sp,12
     4f8:	22112e23          	sw	ra,572(sp)
     4fc:	22912a23          	sw	s1,564(sp)
     500:	23312623          	sw	s3,556(sp)
     504:	23412423          	sw	s4,552(sp)
     508:	23512223          	sw	s5,548(sp)
     50c:	23612023          	sw	s6,544(sp)
     510:	21712e23          	sw	s7,540(sp)
     514:	21812c23          	sw	s8,536(sp)
     518:	21912a23          	sw	s9,532(sp)
     51c:	21a12823          	sw	s10,528(sp)
     520:	21b12623          	sw	s11,524(sp)
     524:	00002097          	auipc	ra,0x2
     528:	864080e7          	jalr	-1948(ra) # 1d88 <strcpy>
     52c:	00040593          	mv	a1,s0
     530:	00c10513          	addi	a0,sp,12
     534:	00002097          	auipc	ra,0x2
     538:	874080e7          	jalr	-1932(ra) # 1da8 <strcat>
     53c:	000064b7          	lui	s1,0x6
     540:	8cc48593          	addi	a1,s1,-1844 # 58cc <LEDS+0x4>
     544:	00c10513          	addi	a0,sp,12
     548:	00005097          	auipc	ra,0x5
     54c:	f58080e7          	jalr	-168(ra) # 54a0 <fl_fopen>
     550:	08050e63          	beqz	a0,5ec <play_song_with_cover+0x114>
     554:	00050413          	mv	s0,a0
     558:	00002097          	auipc	ra,0x2
     55c:	ab8080e7          	jalr	-1352(ra) # 2010 <display_framebuffer>
     560:	00040693          	mv	a3,s0
     564:	00004637          	lui	a2,0x4
     568:	00100593          	li	a1,1
     56c:	00005097          	auipc	ra,0x5
     570:	930080e7          	jalr	-1744(ra) # 4e9c <fl_fread>
     574:	00040513          	mv	a0,s0
     578:	00005097          	auipc	ra,0x5
     57c:	848080e7          	jalr	-1976(ra) # 4dc0 <fl_fclose>
     580:	00002097          	auipc	ra,0x2
     584:	c0c080e7          	jalr	-1012(ra) # 218c <display_refresh>
     588:	00090513          	mv	a0,s2
     58c:	8cc48593          	addi	a1,s1,-1844
     590:	00005097          	auipc	ra,0x5
     594:	f10080e7          	jalr	-240(ra) # 54a0 <fl_fopen>
     598:	000067b7          	lui	a5,0x6
     59c:	8b87a903          	lw	s2,-1864(a5) # 58b8 <BUTTONS>
     5a0:	00050c93          	mv	s9,a0
     5a4:	08051263          	bnez	a0,628 <play_song_with_cover+0x150>
     5a8:	00092783          	lw	a5,0(s2)
     5ac:	fe078ee3          	beqz	a5,5a8 <play_song_with_cover+0xd0>
     5b0:	23c12083          	lw	ra,572(sp)
     5b4:	23812403          	lw	s0,568(sp)
     5b8:	23412483          	lw	s1,564(sp)
     5bc:	23012903          	lw	s2,560(sp)
     5c0:	22c12983          	lw	s3,556(sp)
     5c4:	22812a03          	lw	s4,552(sp)
     5c8:	22412a83          	lw	s5,548(sp)
     5cc:	22012b03          	lw	s6,544(sp)
     5d0:	21c12b83          	lw	s7,540(sp)
     5d4:	21812c03          	lw	s8,536(sp)
     5d8:	21412c83          	lw	s9,532(sp)
     5dc:	21012d03          	lw	s10,528(sp)
     5e0:	20c12d83          	lw	s11,524(sp)
     5e4:	24010113          	addi	sp,sp,576
     5e8:	00008067          	ret
     5ec:	00002097          	auipc	ra,0x2
     5f0:	9a8080e7          	jalr	-1624(ra) # 1f94 <oled_clear>
     5f4:	03200593          	li	a1,50
     5f8:	00000513          	li	a0,0
     5fc:	00002097          	auipc	ra,0x2
     600:	a20080e7          	jalr	-1504(ra) # 201c <display_set_cursor>
     604:	00000593          	li	a1,0
     608:	0ff00513          	li	a0,255
     60c:	00002097          	auipc	ra,0x2
     610:	a24080e7          	jalr	-1500(ra) # 2030 <display_set_front_back_color>
     614:	00006537          	lui	a0,0x6
     618:	90c50513          	addi	a0,a0,-1780 # 590c <LEDS+0x44>
     61c:	00002097          	auipc	ra,0x2
     620:	cdc080e7          	jalr	-804(ra) # 22f8 <printf>
     624:	f5dff06f          	j	580 <play_song_with_cover+0xa8>
     628:	000067b7          	lui	a5,0x6
     62c:	00092483          	lw	s1,0(s2)
     630:	8b07ad03          	lw	s10,-1872(a5) # 58b0 <AUDIO>
     634:	00000b93          	li	s7,0
     638:	00100413          	li	s0,1
     63c:	20000a93          	li	s5,512
     640:	1ff00a13          	li	s4,511
     644:	000069b7          	lui	s3,0x6
     648:	000d2c03          	lw	s8,0(s10)
     64c:	000c8693          	mv	a3,s9
     650:	20000613          	li	a2,512
     654:	00100593          	li	a1,1
     658:	000c0513          	mv	a0,s8
     65c:	00005097          	auipc	ra,0x5
     660:	840080e7          	jalr	-1984(ra) # 4e9c <fl_fread>
     664:	00050b13          	mv	s6,a0
     668:	00aa4c63          	blt	s4,a0,680 <play_song_with_cover+0x1a8>
     66c:	40aa8633          	sub	a2,s5,a0
     670:	00000593          	li	a1,0
     674:	00ac0533          	add	a0,s8,a0
     678:	00001097          	auipc	ra,0x1
     67c:	64c080e7          	jalr	1612(ra) # 1cc4 <memset>
     680:	000d2783          	lw	a5,0(s10)
     684:	fefc0ee3          	beq	s8,a5,680 <play_song_with_cover+0x1a8>
     688:	056a5263          	bge	s4,s6,6cc <play_song_with_cover+0x1f4>
     68c:	fff40793          	addi	a5,s0,-1
     690:	f8040713          	addi	a4,s0,-128
     694:	00173713          	seqz	a4,a4
     698:	0017b793          	seqz	a5,a5
     69c:	00e7e7b3          	or	a5,a5,a4
     6a0:	00fbc733          	xor	a4,s7,a5
     6a4:	06fb8a63          	beq	s7,a5,718 <play_song_with_cover+0x240>
     6a8:	00141413          	slli	s0,s0,0x1
     6ac:	8c89a783          	lw	a5,-1848(s3) # 58c8 <LEDS>
     6b0:	fff4c493          	not	s1,s1
     6b4:	0087a023          	sw	s0,0(a5)
     6b8:	00092783          	lw	a5,0(s2)
     6bc:	00f4f4b3          	and	s1,s1,a5
     6c0:	04048663          	beqz	s1,70c <play_song_with_cover+0x234>
     6c4:	00000097          	auipc	ra,0x0
     6c8:	a1c080e7          	jalr	-1508(ra) # e0 <play_click_noise>
     6cc:	000c8513          	mv	a0,s9
     6d0:	00004097          	auipc	ra,0x4
     6d4:	6f0080e7          	jalr	1776(ra) # 4dc0 <fl_fclose>
     6d8:	00000097          	auipc	ra,0x0
     6dc:	98c080e7          	jalr	-1652(ra) # 64 <clear_audio>
     6e0:	8c89a783          	lw	a5,-1848(s3)
     6e4:	0007a023          	sw	zero,0(a5)
     6e8:	00002097          	auipc	ra,0x2
     6ec:	928080e7          	jalr	-1752(ra) # 2010 <display_framebuffer>
     6f0:	00004637          	lui	a2,0x4
     6f4:	00000593          	li	a1,0
     6f8:	00001097          	auipc	ra,0x1
     6fc:	5cc080e7          	jalr	1484(ra) # 1cc4 <memset>
     700:	00002097          	auipc	ra,0x2
     704:	a8c080e7          	jalr	-1396(ra) # 218c <display_refresh>
     708:	ea9ff06f          	j	5b0 <play_song_with_cover+0xd8>
     70c:	00070b93          	mv	s7,a4
     710:	00078493          	mv	s1,a5
     714:	f35ff06f          	j	648 <play_song_with_cover+0x170>
     718:	40145413          	srai	s0,s0,0x1
     71c:	f91ff06f          	j	6ac <play_song_with_cover+0x1d4>

00000720 <scan_files>:
     720:	fd010113          	addi	sp,sp,-48
     724:	02912223          	sw	s1,36(sp)
     728:	000064b7          	lui	s1,0x6
     72c:	02812423          	sw	s0,40(sp)
     730:	00050593          	mv	a1,a0
     734:	00006437          	lui	s0,0x6
     738:	c7048513          	addi	a0,s1,-912 # 5c70 <current_path>
     73c:	02112623          	sw	ra,44(sp)
     740:	03212023          	sw	s2,32(sp)
     744:	01312e23          	sw	s3,28(sp)
     748:	01412c23          	sw	s4,24(sp)
     74c:	01512a23          	sw	s5,20(sp)
     750:	01612823          	sw	s6,16(sp)
     754:	01712623          	sw	s7,12(sp)
     758:	e6042223          	sw	zero,-412(s0) # 5e64 <n_items>
     75c:	00000097          	auipc	ra,0x0
     760:	8c0080e7          	jalr	-1856(ra) # 1c <strcmp>
     764:	06050e63          	beqz	a0,7e0 <scan_files+0xc0>
     768:	00006937          	lui	s2,0x6
     76c:	06400613          	li	a2,100
     770:	00000593          	li	a1,0
     774:	fb090513          	addi	a0,s2,-80 # 5fb0 <files>
     778:	00001097          	auipc	ra,0x1
     77c:	54c080e7          	jalr	1356(ra) # 1cc4 <memset>
     780:	e6442783          	lw	a5,-412(s0)
     784:	fb090913          	addi	s2,s2,-80
     788:	000065b7          	lui	a1,0x6
     78c:	00379513          	slli	a0,a5,0x3
     790:	40f50533          	sub	a0,a0,a5
     794:	00251513          	slli	a0,a0,0x2
     798:	40f50533          	sub	a0,a0,a5
     79c:	00251513          	slli	a0,a0,0x2
     7a0:	00a90533          	add	a0,s2,a0
     7a4:	92058593          	addi	a1,a1,-1760 # 5920 <LEDS+0x58>
     7a8:	00001097          	auipc	ra,0x1
     7ac:	5e0080e7          	jalr	1504(ra) # 1d88 <strcpy>
     7b0:	e6442703          	lw	a4,-412(s0)
     7b4:	00371793          	slli	a5,a4,0x3
     7b8:	40e787b3          	sub	a5,a5,a4
     7bc:	00279793          	slli	a5,a5,0x2
     7c0:	40e787b3          	sub	a5,a5,a4
     7c4:	00279793          	slli	a5,a5,0x2
     7c8:	00f90933          	add	s2,s2,a5
     7cc:	00100793          	li	a5,1
     7d0:	00f70733          	add	a4,a4,a5
     7d4:	06092223          	sw	zero,100(s2)
     7d8:	06f92423          	sw	a5,104(s2)
     7dc:	e6e42223          	sw	a4,-412(s0)
     7e0:	000069b7          	lui	s3,0x6
     7e4:	fa498593          	addi	a1,s3,-92 # 5fa4 <dirstat.1>
     7e8:	c7048513          	addi	a0,s1,-912
     7ec:	00003097          	auipc	ra,0x3
     7f0:	654080e7          	jalr	1620(ra) # 3e40 <fl_opendir>
     7f4:	14050063          	beqz	a0,934 <scan_files+0x214>
     7f8:	00006937          	lui	s2,0x6
     7fc:	000067b7          	lui	a5,0x6
     800:	000064b7          	lui	s1,0x6
     804:	92478b93          	addi	s7,a5,-1756 # 5924 <LEDS+0x5c>
     808:	fb048493          	addi	s1,s1,-80 # 5fb0 <files>
     80c:	e9490a13          	addi	s4,s2,-364 # 5e94 <dirent.0>
     810:	e9490593          	addi	a1,s2,-364
     814:	fa498513          	addi	a0,s3,-92
     818:	00004097          	auipc	ra,0x4
     81c:	cf4080e7          	jalr	-780(ra) # 450c <fl_readdir>
     820:	00050a93          	mv	s5,a0
     824:	00051863          	bnez	a0,834 <scan_files+0x114>
     828:	e6442b03          	lw	s6,-412(s0)
     82c:	03f00793          	li	a5,63
     830:	0367dc63          	bge	a5,s6,868 <scan_files+0x148>
     834:	02812403          	lw	s0,40(sp)
     838:	02c12083          	lw	ra,44(sp)
     83c:	02412483          	lw	s1,36(sp)
     840:	02012903          	lw	s2,32(sp)
     844:	01812a03          	lw	s4,24(sp)
     848:	01412a83          	lw	s5,20(sp)
     84c:	01012b03          	lw	s6,16(sp)
     850:	00c12b83          	lw	s7,12(sp)
     854:	fa498513          	addi	a0,s3,-92
     858:	01c12983          	lw	s3,28(sp)
     85c:	03010113          	addi	sp,sp,48
     860:	00002317          	auipc	t1,0x2
     864:	1c830067          	jr	456(t1) # 2a28 <fl_closedir>
     868:	000b8593          	mv	a1,s7
     86c:	e9490513          	addi	a0,s2,-364
     870:	fffff097          	auipc	ra,0xfffff
     874:	7ac080e7          	jalr	1964(ra) # 1c <strcmp>
     878:	f8050ce3          	beqz	a0,810 <scan_files+0xf0>
     87c:	000065b7          	lui	a1,0x6
     880:	92058593          	addi	a1,a1,-1760 # 5920 <LEDS+0x58>
     884:	e9490513          	addi	a0,s2,-364
     888:	fffff097          	auipc	ra,0xfffff
     88c:	794080e7          	jalr	1940(ra) # 1c <strcmp>
     890:	f80500e3          	beqz	a0,810 <scan_files+0xf0>
     894:	003b1513          	slli	a0,s6,0x3
     898:	41650533          	sub	a0,a0,s6
     89c:	00251513          	slli	a0,a0,0x2
     8a0:	41650533          	sub	a0,a0,s6
     8a4:	00251513          	slli	a0,a0,0x2
     8a8:	06400613          	li	a2,100
     8ac:	00000593          	li	a1,0
     8b0:	00a48533          	add	a0,s1,a0
     8b4:	00001097          	auipc	ra,0x1
     8b8:	410080e7          	jalr	1040(ra) # 1cc4 <memset>
     8bc:	e6442703          	lw	a4,-412(s0)
     8c0:	06300513          	li	a0,99
     8c4:	00371793          	slli	a5,a4,0x3
     8c8:	40e786b3          	sub	a3,a5,a4
     8cc:	00269693          	slli	a3,a3,0x2
     8d0:	40e686b3          	sub	a3,a3,a4
     8d4:	00269693          	slli	a3,a3,0x2
     8d8:	014a8633          	add	a2,s5,s4
     8dc:	00064583          	lbu	a1,0(a2) # 4000 <_open_file+0xf8>
     8e0:	00058463          	beqz	a1,8e8 <scan_files+0x1c8>
     8e4:	02aa9e63          	bne	s5,a0,920 <scan_files+0x200>
     8e8:	40e787b3          	sub	a5,a5,a4
     8ec:	00279793          	slli	a5,a5,0x2
     8f0:	10ca2683          	lw	a3,268(s4)
     8f4:	40e787b3          	sub	a5,a5,a4
     8f8:	00279793          	slli	a5,a5,0x2
     8fc:	00f487b3          	add	a5,s1,a5
     900:	06d7a223          	sw	a3,100(a5)
     904:	104a4683          	lbu	a3,260(s4)
     908:	01578ab3          	add	s5,a5,s5
     90c:	00170713          	addi	a4,a4,1
     910:	000a8023          	sb	zero,0(s5)
     914:	06d7a423          	sw	a3,104(a5)
     918:	e6e42223          	sw	a4,-412(s0)
     91c:	ef5ff06f          	j	810 <scan_files+0xf0>
     920:	00da8633          	add	a2,s5,a3
     924:	00c48633          	add	a2,s1,a2
     928:	00b60023          	sb	a1,0(a2)
     92c:	001a8a93          	addi	s5,s5,1
     930:	fa9ff06f          	j	8d8 <scan_files+0x1b8>
     934:	02c12083          	lw	ra,44(sp)
     938:	02812403          	lw	s0,40(sp)
     93c:	02412483          	lw	s1,36(sp)
     940:	02012903          	lw	s2,32(sp)
     944:	01c12983          	lw	s3,28(sp)
     948:	01812a03          	lw	s4,24(sp)
     94c:	01412a83          	lw	s5,20(sp)
     950:	01012b03          	lw	s6,16(sp)
     954:	00c12b83          	lw	s7,12(sp)
     958:	03010113          	addi	sp,sp,48
     95c:	00008067          	ret

00000960 <go_up_directory>:
     960:	ff010113          	addi	sp,sp,-16
     964:	00812423          	sw	s0,8(sp)
     968:	00006437          	lui	s0,0x6
     96c:	00112623          	sw	ra,12(sp)
     970:	00000793          	li	a5,0
     974:	c7040413          	addi	s0,s0,-912 # 5c70 <current_path>
     978:	00878733          	add	a4,a5,s0
     97c:	00074683          	lbu	a3,0(a4)
     980:	02069c63          	bnez	a3,9b8 <go_up_directory+0x58>
     984:	00100693          	li	a3,1
     988:	02f6d063          	bge	a3,a5,9a8 <go_up_directory+0x48>
     98c:	02f00593          	li	a1,47
     990:	00040513          	mv	a0,s0
     994:	fe070fa3          	sb	zero,-1(a4)
     998:	fffff097          	auipc	ra,0xfffff
     99c:	6a8080e7          	jalr	1704(ra) # 40 <strrchr>
     9a0:	02050063          	beqz	a0,9c0 <go_up_directory+0x60>
     9a4:	000500a3          	sb	zero,1(a0)
     9a8:	00c12083          	lw	ra,12(sp)
     9ac:	00812403          	lw	s0,8(sp)
     9b0:	01010113          	addi	sp,sp,16
     9b4:	00008067          	ret
     9b8:	00178793          	addi	a5,a5,1
     9bc:	fbdff06f          	j	978 <go_up_directory+0x18>
     9c0:	00040513          	mv	a0,s0
     9c4:	00812403          	lw	s0,8(sp)
     9c8:	00c12083          	lw	ra,12(sp)
     9cc:	000065b7          	lui	a1,0x6
     9d0:	92858593          	addi	a1,a1,-1752 # 5928 <LEDS+0x60>
     9d4:	01010113          	addi	sp,sp,16
     9d8:	00001317          	auipc	t1,0x1
     9dc:	3b030067          	jr	944(t1) # 1d88 <strcpy>

000009e0 <build_full_path>:
     9e0:	ff010113          	addi	sp,sp,-16
     9e4:	00912223          	sw	s1,4(sp)
     9e8:	00058493          	mv	s1,a1
     9ec:	000065b7          	lui	a1,0x6
     9f0:	c7058593          	addi	a1,a1,-912 # 5c70 <current_path>
     9f4:	00812423          	sw	s0,8(sp)
     9f8:	00112623          	sw	ra,12(sp)
     9fc:	00050413          	mv	s0,a0
     a00:	00001097          	auipc	ra,0x1
     a04:	388080e7          	jalr	904(ra) # 1d88 <strcpy>
     a08:	00044783          	lbu	a5,0(s0)
     a0c:	02079263          	bnez	a5,a30 <build_full_path+0x50>
     a10:	0004c783          	lbu	a5,0(s1)
     a14:	02079263          	bnez	a5,a38 <build_full_path+0x58>
     a18:	00040023          	sb	zero,0(s0)
     a1c:	00c12083          	lw	ra,12(sp)
     a20:	00812403          	lw	s0,8(sp)
     a24:	00412483          	lw	s1,4(sp)
     a28:	01010113          	addi	sp,sp,16
     a2c:	00008067          	ret
     a30:	00140413          	addi	s0,s0,1
     a34:	fd5ff06f          	j	a08 <build_full_path+0x28>
     a38:	00140413          	addi	s0,s0,1
     a3c:	00148493          	addi	s1,s1,1
     a40:	fef40fa3          	sb	a5,-1(s0)
     a44:	fcdff06f          	j	a10 <build_full_path+0x30>

00000a48 <file_explorer>:
     a48:	da010113          	addi	sp,sp,-608
     a4c:	24912a23          	sw	s1,596(sp)
     a50:	25512223          	sw	s5,580(sp)
     a54:	000064b7          	lui	s1,0x6
     a58:	00006ab7          	lui	s5,0x6
     a5c:	928a8593          	addi	a1,s5,-1752 # 5928 <LEDS+0x60>
     a60:	c7048513          	addi	a0,s1,-912 # 5c70 <current_path>
     a64:	24112e23          	sw	ra,604(sp)
     a68:	24812c23          	sw	s0,600(sp)
     a6c:	25212823          	sw	s2,592(sp)
     a70:	25312623          	sw	s3,588(sp)
     a74:	23812c23          	sw	s8,568(sp)
     a78:	23a12823          	sw	s10,560(sp)
     a7c:	25412423          	sw	s4,584(sp)
     a80:	25612023          	sw	s6,576(sp)
     a84:	23712e23          	sw	s7,572(sp)
     a88:	23912a23          	sw	s9,564(sp)
     a8c:	23b12623          	sw	s11,556(sp)
     a90:	00001097          	auipc	ra,0x1
     a94:	2f8080e7          	jalr	760(ra) # 1d88 <strcpy>
     a98:	928a8513          	addi	a0,s5,-1752
     a9c:	00000097          	auipc	ra,0x0
     aa0:	c84080e7          	jalr	-892(ra) # 720 <scan_files>
     aa4:	000067b7          	lui	a5,0x6
     aa8:	92c78793          	addi	a5,a5,-1748 # 592c <LEDS+0x64>
     aac:	00f12c23          	sw	a5,24(sp)
     ab0:	c7048793          	addi	a5,s1,-912
     ab4:	00f12623          	sw	a5,12(sp)
     ab8:	000067b7          	lui	a5,0x6
     abc:	8b87a783          	lw	a5,-1864(a5) # 58b8 <BUTTONS>
     ac0:	00000c13          	li	s8,0
     ac4:	00000993          	li	s3,0
     ac8:	00000913          	li	s2,0
     acc:	00000413          	li	s0,0
     ad0:	01200d13          	li	s10,18
     ad4:	00f12e23          	sw	a5,28(sp)
     ad8:	00000593          	li	a1,0
     adc:	00000513          	li	a0,0
     ae0:	00001097          	auipc	ra,0x1
     ae4:	53c080e7          	jalr	1340(ra) # 201c <display_set_cursor>
     ae8:	0ffc7593          	zext.b	a1,s8
     aec:	07f58513          	addi	a0,a1,127
     af0:	0ff57513          	zext.b	a0,a0
     af4:	00001097          	auipc	ra,0x1
     af8:	53c080e7          	jalr	1340(ra) # 2030 <display_set_front_back_color>
     afc:	01812503          	lw	a0,24(sp)
     b00:	00000493          	li	s1,0
     b04:	00006bb7          	lui	s7,0x6
     b08:	00001097          	auipc	ra,0x1
     b0c:	7f0080e7          	jalr	2032(ra) # 22f8 <printf>
     b10:	00c00a13          	li	s4,12
     b14:	00c12783          	lw	a5,12(sp)
     b18:	00f487b3          	add	a5,s1,a5
     b1c:	0007c503          	lbu	a0,0(a5)
     b20:	00050a63          	beqz	a0,b34 <file_explorer+0xec>
     b24:	e78ba783          	lw	a5,-392(s7) # 5e78 <f_putchar>
     b28:	00148493          	addi	s1,s1,1
     b2c:	000780e7          	jalr	a5
     b30:	ff4492e3          	bne	s1,s4,b14 <file_explorer+0xcc>
     b34:	e78ba783          	lw	a5,-392(s7)
     b38:	00a00513          	li	a0,10
     b3c:	00006db7          	lui	s11,0x6
     b40:	000780e7          	jalr	a5
     b44:	00000593          	li	a1,0
     b48:	0ff00513          	li	a0,255
     b4c:	00001097          	auipc	ra,0x1
     b50:	4e4080e7          	jalr	1252(ra) # 2030 <display_set_front_back_color>
     b54:	e64daa03          	lw	s4,-412(s11) # 5e64 <n_items>
     b58:	080a0463          	beqz	s4,be0 <file_explorer+0x198>
     b5c:	412a0a33          	sub	s4,s4,s2
     b60:	00c00793          	li	a5,12
     b64:	0147d463          	bge	a5,s4,b6c <file_explorer+0x124>
     b68:	00078a13          	mv	s4,a5
     b6c:	00391493          	slli	s1,s2,0x3
     b70:	412484b3          	sub	s1,s1,s2
     b74:	00249493          	slli	s1,s1,0x2
     b78:	412484b3          	sub	s1,s1,s2
     b7c:	000067b7          	lui	a5,0x6
     b80:	fb078793          	addi	a5,a5,-80 # 5fb0 <files>
     b84:	00249493          	slli	s1,s1,0x2
     b88:	00f484b3          	add	s1,s1,a5
     b8c:	000067b7          	lui	a5,0x6
     b90:	94878793          	addi	a5,a5,-1720 # 5948 <LEDS+0x80>
     b94:	00f12823          	sw	a5,16(sp)
     b98:	000067b7          	lui	a5,0x6
     b9c:	94078793          	addi	a5,a5,-1728 # 5940 <LEDS+0x78>
     ba0:	00000b13          	li	s6,0
     ba4:	00f12a23          	sw	a5,20(sp)
     ba8:	194b4863          	blt	s6,s4,d38 <file_explorer+0x2f0>
     bac:	00000593          	li	a1,0
     bb0:	00000513          	li	a0,0
     bb4:	000064b7          	lui	s1,0x6
     bb8:	00001097          	auipc	ra,0x1
     bbc:	478080e7          	jalr	1144(ra) # 2030 <display_set_front_back_color>
     bc0:	00c00b13          	li	s6,12
     bc4:	95048493          	addi	s1,s1,-1712 # 5950 <LEDS+0x88>
     bc8:	036a0463          	beq	s4,s6,bf0 <file_explorer+0x1a8>
     bcc:	00048513          	mv	a0,s1
     bd0:	00001097          	auipc	ra,0x1
     bd4:	728080e7          	jalr	1832(ra) # 22f8 <printf>
     bd8:	001a0a13          	addi	s4,s4,1
     bdc:	fedff06f          	j	bc8 <file_explorer+0x180>
     be0:	00006537          	lui	a0,0x6
     be4:	93850513          	addi	a0,a0,-1736 # 5938 <LEDS+0x70>
     be8:	00001097          	auipc	ra,0x1
     bec:	710080e7          	jalr	1808(ra) # 22f8 <printf>
     bf0:	00001097          	auipc	ra,0x1
     bf4:	59c080e7          	jalr	1436(ra) # 218c <display_refresh>
     bf8:	01c12783          	lw	a5,28(sp)
     bfc:	fff9c993          	not	s3,s3
     c00:	0007aa03          	lw	s4,0(a5)
     c04:	0149f9b3          	and	s3,s3,s4
     c08:	0109f793          	andi	a5,s3,16
     c0c:	00078863          	beqz	a5,c1c <file_explorer+0x1d4>
     c10:	00140413          	addi	s0,s0,1
     c14:	fffff097          	auipc	ra,0xfffff
     c18:	4cc080e7          	jalr	1228(ra) # e0 <play_click_noise>
     c1c:	0089f793          	andi	a5,s3,8
     c20:	00078863          	beqz	a5,c30 <file_explorer+0x1e8>
     c24:	fff40413          	addi	s0,s0,-1
     c28:	fffff097          	auipc	ra,0xfffff
     c2c:	4b8080e7          	jalr	1208(ra) # e0 <play_click_noise>
     c30:	0029f793          	andi	a5,s3,2
     c34:	04078a63          	beqz	a5,c88 <file_explorer+0x240>
     c38:	fffff097          	auipc	ra,0xfffff
     c3c:	4a8080e7          	jalr	1192(ra) # e0 <play_click_noise>
     c40:	00c12503          	lw	a0,12(sp)
     c44:	928a8593          	addi	a1,s5,-1752
     c48:	fffff097          	auipc	ra,0xfffff
     c4c:	3d4080e7          	jalr	980(ra) # 1c <strcmp>
     c50:	20050263          	beqz	a0,e54 <file_explorer+0x40c>
     c54:	00000097          	auipc	ra,0x0
     c58:	d0c080e7          	jalr	-756(ra) # 960 <go_up_directory>
     c5c:	928a8513          	addi	a0,s5,-1752
     c60:	00000097          	auipc	ra,0x0
     c64:	ac0080e7          	jalr	-1344(ra) # 720 <scan_files>
     c68:	00001097          	auipc	ra,0x1
     c6c:	3a8080e7          	jalr	936(ra) # 2010 <display_framebuffer>
     c70:	00004637          	lui	a2,0x4
     c74:	00000593          	li	a1,0
     c78:	00001097          	auipc	ra,0x1
     c7c:	04c080e7          	jalr	76(ra) # 1cc4 <memset>
     c80:	00000913          	li	s2,0
     c84:	00000413          	li	s0,0
     c88:	0049f993          	andi	s3,s3,4
     c8c:	007c0c13          	addi	s8,s8,7
     c90:	08098063          	beqz	s3,d10 <file_explorer+0x2c8>
     c94:	00341493          	slli	s1,s0,0x3
     c98:	408484b3          	sub	s1,s1,s0
     c9c:	fffff097          	auipc	ra,0xfffff
     ca0:	444080e7          	jalr	1092(ra) # e0 <play_click_noise>
     ca4:	00249493          	slli	s1,s1,0x2
     ca8:	408484b3          	sub	s1,s1,s0
     cac:	000067b7          	lui	a5,0x6
     cb0:	fb078793          	addi	a5,a5,-80 # 5fb0 <files>
     cb4:	00249493          	slli	s1,s1,0x2
     cb8:	00f484b3          	add	s1,s1,a5
     cbc:	0684a783          	lw	a5,104(s1)
     cc0:	14078263          	beqz	a5,e04 <file_explorer+0x3bc>
     cc4:	000065b7          	lui	a1,0x6
     cc8:	92058593          	addi	a1,a1,-1760 # 5920 <LEDS+0x58>
     ccc:	00048513          	mv	a0,s1
     cd0:	fffff097          	auipc	ra,0xfffff
     cd4:	34c080e7          	jalr	844(ra) # 1c <strcmp>
     cd8:	10051a63          	bnez	a0,dec <file_explorer+0x3a4>
     cdc:	00000097          	auipc	ra,0x0
     ce0:	c84080e7          	jalr	-892(ra) # 960 <go_up_directory>
     ce4:	928a8513          	addi	a0,s5,-1752
     ce8:	00000097          	auipc	ra,0x0
     cec:	a38080e7          	jalr	-1480(ra) # 720 <scan_files>
     cf0:	00001097          	auipc	ra,0x1
     cf4:	320080e7          	jalr	800(ra) # 2010 <display_framebuffer>
     cf8:	00004637          	lui	a2,0x4
     cfc:	00000593          	li	a1,0
     d00:	00001097          	auipc	ra,0x1
     d04:	fc4080e7          	jalr	-60(ra) # 1cc4 <memset>
     d08:	00000913          	li	s2,0
     d0c:	00000413          	li	s0,0
     d10:	e64da783          	lw	a5,-412(s11)
     d14:	00f05e63          	blez	a5,d30 <file_explorer+0x2e8>
     d18:	12045263          	bgez	s0,e3c <file_explorer+0x3f4>
     d1c:	fff78413          	addi	s0,a5,-1
     d20:	13244663          	blt	s0,s2,e4c <file_explorer+0x404>
     d24:	00b90793          	addi	a5,s2,11
     d28:	0087d463          	bge	a5,s0,d30 <file_explorer+0x2e8>
     d2c:	ff540913          	addi	s2,s0,-11
     d30:	000a0993          	mv	s3,s4
     d34:	da5ff06f          	j	ad8 <file_explorer+0x90>
     d38:	012b0cb3          	add	s9,s6,s2
     d3c:	07941463          	bne	s0,s9,da4 <file_explorer+0x35c>
     d40:	0ff00593          	li	a1,255
     d44:	00000513          	li	a0,0
     d48:	00001097          	auipc	ra,0x1
     d4c:	2e8080e7          	jalr	744(ra) # 2030 <display_set_front_back_color>
     d50:	0684a783          	lw	a5,104(s1)
     d54:	000c8593          	mv	a1,s9
     d58:	04078c63          	beqz	a5,db0 <file_explorer+0x368>
     d5c:	01412503          	lw	a0,20(sp)
     d60:	00001097          	auipc	ra,0x1
     d64:	598080e7          	jalr	1432(ra) # 22f8 <printf>
     d68:	00000c93          	li	s9,0
     d6c:	019487b3          	add	a5,s1,s9
     d70:	0007c503          	lbu	a0,0(a5)
     d74:	00050a63          	beqz	a0,d88 <file_explorer+0x340>
     d78:	e78ba783          	lw	a5,-392(s7)
     d7c:	001c8c93          	addi	s9,s9,1
     d80:	000780e7          	jalr	a5
     d84:	ffac94e3          	bne	s9,s10,d6c <file_explorer+0x324>
     d88:	e78ba783          	lw	a5,-392(s7)
     d8c:	03ac9663          	bne	s9,s10,db8 <file_explorer+0x370>
     d90:	00a00513          	li	a0,10
     d94:	000780e7          	jalr	a5
     d98:	001b0b13          	addi	s6,s6,1
     d9c:	06c48493          	addi	s1,s1,108
     da0:	e09ff06f          	j	ba8 <file_explorer+0x160>
     da4:	00000593          	li	a1,0
     da8:	0ff00513          	li	a0,255
     dac:	f9dff06f          	j	d48 <file_explorer+0x300>
     db0:	01012503          	lw	a0,16(sp)
     db4:	fadff06f          	j	d60 <file_explorer+0x318>
     db8:	02000513          	li	a0,32
     dbc:	000780e7          	jalr	a5
     dc0:	001c8c93          	addi	s9,s9,1
     dc4:	fc5ff06f          	j	d88 <file_explorer+0x340>
     dc8:	00178793          	addi	a5,a5,1
     dcc:	0007c703          	lbu	a4,0(a5)
     dd0:	fe071ce3          	bnez	a4,dc8 <file_explorer+0x380>
     dd4:	0004c703          	lbu	a4,0(s1)
     dd8:	00071e63          	bnez	a4,df4 <file_explorer+0x3ac>
     ddc:	02f00713          	li	a4,47
     de0:	00e78023          	sb	a4,0(a5)
     de4:	000780a3          	sb	zero,1(a5)
     de8:	efdff06f          	j	ce4 <file_explorer+0x29c>
     dec:	00c12783          	lw	a5,12(sp)
     df0:	fddff06f          	j	dcc <file_explorer+0x384>
     df4:	00178793          	addi	a5,a5,1
     df8:	00148493          	addi	s1,s1,1
     dfc:	fee78fa3          	sb	a4,-1(a5)
     e00:	fd5ff06f          	j	dd4 <file_explorer+0x38c>
     e04:	02c10513          	addi	a0,sp,44
     e08:	00048593          	mv	a1,s1
     e0c:	00000097          	auipc	ra,0x0
     e10:	bd4080e7          	jalr	-1068(ra) # 9e0 <build_full_path>
     e14:	0644a703          	lw	a4,100(s1)
     e18:	000047b7          	lui	a5,0x4
     e1c:	02c10513          	addi	a0,sp,44
     e20:	00f71863          	bne	a4,a5,e30 <file_explorer+0x3e8>
     e24:	fffff097          	auipc	ra,0xfffff
     e28:	3b8080e7          	jalr	952(ra) # 1dc <view_image_file>
     e2c:	ee5ff06f          	j	d10 <file_explorer+0x2c8>
     e30:	fffff097          	auipc	ra,0xfffff
     e34:	464080e7          	jalr	1124(ra) # 294 <play_music_file>
     e38:	ed9ff06f          	j	d10 <file_explorer+0x2c8>
     e3c:	00f427b3          	slt	a5,s0,a5
     e40:	40f007b3          	neg	a5,a5
     e44:	00f47433          	and	s0,s0,a5
     e48:	ed9ff06f          	j	d20 <file_explorer+0x2d8>
     e4c:	00040913          	mv	s2,s0
     e50:	ee1ff06f          	j	d30 <file_explorer+0x2e8>
     e54:	25c12083          	lw	ra,604(sp)
     e58:	25812403          	lw	s0,600(sp)
     e5c:	25412483          	lw	s1,596(sp)
     e60:	25012903          	lw	s2,592(sp)
     e64:	24c12983          	lw	s3,588(sp)
     e68:	24812a03          	lw	s4,584(sp)
     e6c:	24412a83          	lw	s5,580(sp)
     e70:	24012b03          	lw	s6,576(sp)
     e74:	23c12b83          	lw	s7,572(sp)
     e78:	23812c03          	lw	s8,568(sp)
     e7c:	23412c83          	lw	s9,564(sp)
     e80:	23012d03          	lw	s10,560(sp)
     e84:	22c12d83          	lw	s11,556(sp)
     e88:	26010113          	addi	sp,sp,608
     e8c:	00008067          	ret

00000e90 <music_player>:
     e90:	db010113          	addi	sp,sp,-592
     e94:	24812423          	sw	s0,584(sp)
     e98:	23512a23          	sw	s5,564(sp)
     e9c:	00006437          	lui	s0,0x6
     ea0:	00006ab7          	lui	s5,0x6
     ea4:	96840593          	addi	a1,s0,-1688 # 5968 <LEDS+0xa0>
     ea8:	c70a8513          	addi	a0,s5,-912 # 5c70 <current_path>
     eac:	24112623          	sw	ra,588(sp)
     eb0:	25212023          	sw	s2,576(sp)
     eb4:	23312e23          	sw	s3,572(sp)
     eb8:	23812423          	sw	s8,552(sp)
     ebc:	23a12023          	sw	s10,544(sp)
     ec0:	24912223          	sw	s1,580(sp)
     ec4:	23412c23          	sw	s4,568(sp)
     ec8:	23612823          	sw	s6,560(sp)
     ecc:	23712623          	sw	s7,556(sp)
     ed0:	23912223          	sw	s9,548(sp)
     ed4:	21b12e23          	sw	s11,540(sp)
     ed8:	00001097          	auipc	ra,0x1
     edc:	eb0080e7          	jalr	-336(ra) # 1d88 <strcpy>
     ee0:	96840513          	addi	a0,s0,-1688
     ee4:	00000097          	auipc	ra,0x0
     ee8:	83c080e7          	jalr	-1988(ra) # 720 <scan_files>
     eec:	000067b7          	lui	a5,0x6
     ef0:	97478793          	addi	a5,a5,-1676 # 5974 <LEDS+0xac>
     ef4:	00f12423          	sw	a5,8(sp)
     ef8:	000067b7          	lui	a5,0x6
     efc:	8b87a783          	lw	a5,-1864(a5) # 58b8 <BUTTONS>
     f00:	00000c13          	li	s8,0
     f04:	00000993          	li	s3,0
     f08:	00000913          	li	s2,0
     f0c:	00000413          	li	s0,0
     f10:	c70a8a93          	addi	s5,s5,-912
     f14:	01200d13          	li	s10,18
     f18:	00f12623          	sw	a5,12(sp)
     f1c:	00000593          	li	a1,0
     f20:	00000513          	li	a0,0
     f24:	00001097          	auipc	ra,0x1
     f28:	0f8080e7          	jalr	248(ra) # 201c <display_set_cursor>
     f2c:	0ffc7593          	zext.b	a1,s8
     f30:	07f58513          	addi	a0,a1,127
     f34:	0ff57513          	zext.b	a0,a0
     f38:	00001097          	auipc	ra,0x1
     f3c:	0f8080e7          	jalr	248(ra) # 2030 <display_set_front_back_color>
     f40:	00812503          	lw	a0,8(sp)
     f44:	00000493          	li	s1,0
     f48:	00006bb7          	lui	s7,0x6
     f4c:	00001097          	auipc	ra,0x1
     f50:	3ac080e7          	jalr	940(ra) # 22f8 <printf>
     f54:	00c00a13          	li	s4,12
     f58:	015487b3          	add	a5,s1,s5
     f5c:	0007c503          	lbu	a0,0(a5)
     f60:	00050a63          	beqz	a0,f74 <music_player+0xe4>
     f64:	e78ba783          	lw	a5,-392(s7) # 5e78 <f_putchar>
     f68:	00148493          	addi	s1,s1,1
     f6c:	000780e7          	jalr	a5
     f70:	ff4494e3          	bne	s1,s4,f58 <music_player+0xc8>
     f74:	e78ba783          	lw	a5,-392(s7)
     f78:	00a00513          	li	a0,10
     f7c:	00006db7          	lui	s11,0x6
     f80:	000780e7          	jalr	a5
     f84:	00000593          	li	a1,0
     f88:	0ff00513          	li	a0,255
     f8c:	00001097          	auipc	ra,0x1
     f90:	0a4080e7          	jalr	164(ra) # 2030 <display_set_front_back_color>
     f94:	e64daa03          	lw	s4,-412(s11) # 5e64 <n_items>
     f98:	080a0463          	beqz	s4,1020 <music_player+0x190>
     f9c:	412a0a33          	sub	s4,s4,s2
     fa0:	00c00793          	li	a5,12
     fa4:	0147d463          	bge	a5,s4,fac <music_player+0x11c>
     fa8:	00078a13          	mv	s4,a5
     fac:	00391493          	slli	s1,s2,0x3
     fb0:	412484b3          	sub	s1,s1,s2
     fb4:	00249493          	slli	s1,s1,0x2
     fb8:	412484b3          	sub	s1,s1,s2
     fbc:	000067b7          	lui	a5,0x6
     fc0:	fb078793          	addi	a5,a5,-80 # 5fb0 <files>
     fc4:	00249493          	slli	s1,s1,0x2
     fc8:	00f484b3          	add	s1,s1,a5
     fcc:	000067b7          	lui	a5,0x6
     fd0:	94878793          	addi	a5,a5,-1720 # 5948 <LEDS+0x80>
     fd4:	00f12023          	sw	a5,0(sp)
     fd8:	000067b7          	lui	a5,0x6
     fdc:	94078793          	addi	a5,a5,-1728 # 5940 <LEDS+0x78>
     fe0:	00000b13          	li	s6,0
     fe4:	00f12223          	sw	a5,4(sp)
     fe8:	194b4c63          	blt	s6,s4,1180 <music_player+0x2f0>
     fec:	00000593          	li	a1,0
     ff0:	00000513          	li	a0,0
     ff4:	000064b7          	lui	s1,0x6
     ff8:	00001097          	auipc	ra,0x1
     ffc:	038080e7          	jalr	56(ra) # 2030 <display_set_front_back_color>
    1000:	00c00b13          	li	s6,12
    1004:	95048493          	addi	s1,s1,-1712 # 5950 <LEDS+0x88>
    1008:	036a0463          	beq	s4,s6,1030 <music_player+0x1a0>
    100c:	00048513          	mv	a0,s1
    1010:	00001097          	auipc	ra,0x1
    1014:	2e8080e7          	jalr	744(ra) # 22f8 <printf>
    1018:	001a0a13          	addi	s4,s4,1
    101c:	fedff06f          	j	1008 <music_player+0x178>
    1020:	00006537          	lui	a0,0x6
    1024:	93850513          	addi	a0,a0,-1736 # 5938 <LEDS+0x70>
    1028:	00001097          	auipc	ra,0x1
    102c:	2d0080e7          	jalr	720(ra) # 22f8 <printf>
    1030:	00001097          	auipc	ra,0x1
    1034:	15c080e7          	jalr	348(ra) # 218c <display_refresh>
    1038:	00c12783          	lw	a5,12(sp)
    103c:	fff9c993          	not	s3,s3
    1040:	0007aa03          	lw	s4,0(a5)
    1044:	0149f9b3          	and	s3,s3,s4
    1048:	0109f793          	andi	a5,s3,16
    104c:	00078863          	beqz	a5,105c <music_player+0x1cc>
    1050:	00140413          	addi	s0,s0,1
    1054:	fffff097          	auipc	ra,0xfffff
    1058:	08c080e7          	jalr	140(ra) # e0 <play_click_noise>
    105c:	0089f793          	andi	a5,s3,8
    1060:	00078863          	beqz	a5,1070 <music_player+0x1e0>
    1064:	fff40413          	addi	s0,s0,-1
    1068:	fffff097          	auipc	ra,0xfffff
    106c:	078080e7          	jalr	120(ra) # e0 <play_click_noise>
    1070:	0029f793          	andi	a5,s3,2
    1074:	04078c63          	beqz	a5,10cc <music_player+0x23c>
    1078:	fffff097          	auipc	ra,0xfffff
    107c:	068080e7          	jalr	104(ra) # e0 <play_click_noise>
    1080:	00006437          	lui	s0,0x6
    1084:	98040593          	addi	a1,s0,-1664 # 5980 <LEDS+0xb8>
    1088:	000a8513          	mv	a0,s5
    108c:	fffff097          	auipc	ra,0xfffff
    1090:	f90080e7          	jalr	-112(ra) # 1c <strcmp>
    1094:	20050863          	beqz	a0,12a4 <music_player+0x414>
    1098:	00000097          	auipc	ra,0x0
    109c:	8c8080e7          	jalr	-1848(ra) # 960 <go_up_directory>
    10a0:	98040513          	addi	a0,s0,-1664
    10a4:	fffff097          	auipc	ra,0xfffff
    10a8:	67c080e7          	jalr	1660(ra) # 720 <scan_files>
    10ac:	00001097          	auipc	ra,0x1
    10b0:	f64080e7          	jalr	-156(ra) # 2010 <display_framebuffer>
    10b4:	00004637          	lui	a2,0x4
    10b8:	00000593          	li	a1,0
    10bc:	00001097          	auipc	ra,0x1
    10c0:	c08080e7          	jalr	-1016(ra) # 1cc4 <memset>
    10c4:	00000913          	li	s2,0
    10c8:	00000413          	li	s0,0
    10cc:	0049f993          	andi	s3,s3,4
    10d0:	007c0c13          	addi	s8,s8,7
    10d4:	08098263          	beqz	s3,1158 <music_player+0x2c8>
    10d8:	00341493          	slli	s1,s0,0x3
    10dc:	408484b3          	sub	s1,s1,s0
    10e0:	fffff097          	auipc	ra,0xfffff
    10e4:	000080e7          	jalr	ra # e0 <play_click_noise>
    10e8:	00249493          	slli	s1,s1,0x2
    10ec:	408484b3          	sub	s1,s1,s0
    10f0:	000067b7          	lui	a5,0x6
    10f4:	fb078793          	addi	a5,a5,-80 # 5fb0 <files>
    10f8:	00249493          	slli	s1,s1,0x2
    10fc:	00f484b3          	add	s1,s1,a5
    1100:	0684a783          	lw	a5,104(s1)
    1104:	14078463          	beqz	a5,124c <music_player+0x3bc>
    1108:	000065b7          	lui	a1,0x6
    110c:	92058593          	addi	a1,a1,-1760 # 5920 <LEDS+0x58>
    1110:	00048513          	mv	a0,s1
    1114:	fffff097          	auipc	ra,0xfffff
    1118:	f08080e7          	jalr	-248(ra) # 1c <strcmp>
    111c:	10051c63          	bnez	a0,1234 <music_player+0x3a4>
    1120:	00000097          	auipc	ra,0x0
    1124:	840080e7          	jalr	-1984(ra) # 960 <go_up_directory>
    1128:	00006537          	lui	a0,0x6
    112c:	98050513          	addi	a0,a0,-1664 # 5980 <LEDS+0xb8>
    1130:	fffff097          	auipc	ra,0xfffff
    1134:	5f0080e7          	jalr	1520(ra) # 720 <scan_files>
    1138:	00001097          	auipc	ra,0x1
    113c:	ed8080e7          	jalr	-296(ra) # 2010 <display_framebuffer>
    1140:	00004637          	lui	a2,0x4
    1144:	00000593          	li	a1,0
    1148:	00001097          	auipc	ra,0x1
    114c:	b7c080e7          	jalr	-1156(ra) # 1cc4 <memset>
    1150:	00000913          	li	s2,0
    1154:	00000413          	li	s0,0
    1158:	e64da783          	lw	a5,-412(s11)
    115c:	00f05e63          	blez	a5,1178 <music_player+0x2e8>
    1160:	12045663          	bgez	s0,128c <music_player+0x3fc>
    1164:	fff78413          	addi	s0,a5,-1
    1168:	13244a63          	blt	s0,s2,129c <music_player+0x40c>
    116c:	00b90793          	addi	a5,s2,11
    1170:	0087d463          	bge	a5,s0,1178 <music_player+0x2e8>
    1174:	ff540913          	addi	s2,s0,-11
    1178:	000a0993          	mv	s3,s4
    117c:	da1ff06f          	j	f1c <music_player+0x8c>
    1180:	012b0cb3          	add	s9,s6,s2
    1184:	07941463          	bne	s0,s9,11ec <music_player+0x35c>
    1188:	0ff00593          	li	a1,255
    118c:	00000513          	li	a0,0
    1190:	00001097          	auipc	ra,0x1
    1194:	ea0080e7          	jalr	-352(ra) # 2030 <display_set_front_back_color>
    1198:	0684a783          	lw	a5,104(s1)
    119c:	000c8593          	mv	a1,s9
    11a0:	04078c63          	beqz	a5,11f8 <music_player+0x368>
    11a4:	00412503          	lw	a0,4(sp)
    11a8:	00001097          	auipc	ra,0x1
    11ac:	150080e7          	jalr	336(ra) # 22f8 <printf>
    11b0:	00000c93          	li	s9,0
    11b4:	019487b3          	add	a5,s1,s9
    11b8:	0007c503          	lbu	a0,0(a5)
    11bc:	00050a63          	beqz	a0,11d0 <music_player+0x340>
    11c0:	e78ba783          	lw	a5,-392(s7)
    11c4:	001c8c93          	addi	s9,s9,1
    11c8:	000780e7          	jalr	a5
    11cc:	ffac94e3          	bne	s9,s10,11b4 <music_player+0x324>
    11d0:	e78ba783          	lw	a5,-392(s7)
    11d4:	03ac9663          	bne	s9,s10,1200 <music_player+0x370>
    11d8:	00a00513          	li	a0,10
    11dc:	000780e7          	jalr	a5
    11e0:	001b0b13          	addi	s6,s6,1
    11e4:	06c48493          	addi	s1,s1,108
    11e8:	e01ff06f          	j	fe8 <music_player+0x158>
    11ec:	00000593          	li	a1,0
    11f0:	0ff00513          	li	a0,255
    11f4:	f9dff06f          	j	1190 <music_player+0x300>
    11f8:	00012503          	lw	a0,0(sp)
    11fc:	fadff06f          	j	11a8 <music_player+0x318>
    1200:	02000513          	li	a0,32
    1204:	000780e7          	jalr	a5
    1208:	001c8c93          	addi	s9,s9,1
    120c:	fc5ff06f          	j	11d0 <music_player+0x340>
    1210:	00178793          	addi	a5,a5,1
    1214:	0007c703          	lbu	a4,0(a5)
    1218:	fe071ce3          	bnez	a4,1210 <music_player+0x380>
    121c:	0004c703          	lbu	a4,0(s1)
    1220:	00071e63          	bnez	a4,123c <music_player+0x3ac>
    1224:	02f00713          	li	a4,47
    1228:	00e78023          	sb	a4,0(a5)
    122c:	000780a3          	sb	zero,1(a5)
    1230:	ef9ff06f          	j	1128 <music_player+0x298>
    1234:	000a8793          	mv	a5,s5
    1238:	fddff06f          	j	1214 <music_player+0x384>
    123c:	00178793          	addi	a5,a5,1
    1240:	00148493          	addi	s1,s1,1
    1244:	fee78fa3          	sb	a4,-1(a5)
    1248:	fd5ff06f          	j	121c <music_player+0x38c>
    124c:	00048593          	mv	a1,s1
    1250:	01c10513          	addi	a0,sp,28
    1254:	fffff097          	auipc	ra,0xfffff
    1258:	78c080e7          	jalr	1932(ra) # 9e0 <build_full_path>
    125c:	0644a703          	lw	a4,100(s1)
    1260:	000047b7          	lui	a5,0x4
    1264:	00f71a63          	bne	a4,a5,1278 <music_player+0x3e8>
    1268:	01c10513          	addi	a0,sp,28
    126c:	fffff097          	auipc	ra,0xfffff
    1270:	f70080e7          	jalr	-144(ra) # 1dc <view_image_file>
    1274:	ee5ff06f          	j	1158 <music_player+0x2c8>
    1278:	00048593          	mv	a1,s1
    127c:	01c10513          	addi	a0,sp,28
    1280:	fffff097          	auipc	ra,0xfffff
    1284:	258080e7          	jalr	600(ra) # 4d8 <play_song_with_cover>
    1288:	ed1ff06f          	j	1158 <music_player+0x2c8>
    128c:	00f427b3          	slt	a5,s0,a5
    1290:	40f007b3          	neg	a5,a5
    1294:	00f47433          	and	s0,s0,a5
    1298:	ed1ff06f          	j	1168 <music_player+0x2d8>
    129c:	00040913          	mv	s2,s0
    12a0:	ed9ff06f          	j	1178 <music_player+0x2e8>
    12a4:	24c12083          	lw	ra,588(sp)
    12a8:	24812403          	lw	s0,584(sp)
    12ac:	24412483          	lw	s1,580(sp)
    12b0:	24012903          	lw	s2,576(sp)
    12b4:	23c12983          	lw	s3,572(sp)
    12b8:	23812a03          	lw	s4,568(sp)
    12bc:	23412a83          	lw	s5,564(sp)
    12c0:	23012b03          	lw	s6,560(sp)
    12c4:	22c12b83          	lw	s7,556(sp)
    12c8:	22812c03          	lw	s8,552(sp)
    12cc:	22412c83          	lw	s9,548(sp)
    12d0:	22012d03          	lw	s10,544(sp)
    12d4:	21c12d83          	lw	s11,540(sp)
    12d8:	25010113          	addi	sp,sp,592
    12dc:	00008067          	ret

000012e0 <not_implemented>:
    12e0:	ff010113          	addi	sp,sp,-16
    12e4:	00812423          	sw	s0,8(sp)
    12e8:	00050413          	mv	s0,a0
    12ec:	00000513          	li	a0,0
    12f0:	00112623          	sw	ra,12(sp)
    12f4:	00001097          	auipc	ra,0x1
    12f8:	ca0080e7          	jalr	-864(ra) # 1f94 <oled_clear>
    12fc:	02800593          	li	a1,40
    1300:	00000513          	li	a0,0
    1304:	00001097          	auipc	ra,0x1
    1308:	d18080e7          	jalr	-744(ra) # 201c <display_set_cursor>
    130c:	00006537          	lui	a0,0x6
    1310:	00040593          	mv	a1,s0
    1314:	98850513          	addi	a0,a0,-1656 # 5988 <LEDS+0xc0>
    1318:	00001097          	auipc	ra,0x1
    131c:	fe0080e7          	jalr	-32(ra) # 22f8 <printf>
    1320:	03c00593          	li	a1,60
    1324:	00000513          	li	a0,0
    1328:	00001097          	auipc	ra,0x1
    132c:	cf4080e7          	jalr	-780(ra) # 201c <display_set_cursor>
    1330:	00006537          	lui	a0,0x6
    1334:	99050513          	addi	a0,a0,-1648 # 5990 <LEDS+0xc8>
    1338:	00001097          	auipc	ra,0x1
    133c:	fc0080e7          	jalr	-64(ra) # 22f8 <printf>
    1340:	00001097          	auipc	ra,0x1
    1344:	e4c080e7          	jalr	-436(ra) # 218c <display_refresh>
    1348:	000067b7          	lui	a5,0x6
    134c:	8b87a783          	lw	a5,-1864(a5) # 58b8 <BUTTONS>
    1350:	0007a703          	lw	a4,0(a5)
    1354:	fe070ee3          	beqz	a4,1350 <not_implemented+0x70>
    1358:	0007a703          	lw	a4,0(a5)
    135c:	fe071ee3          	bnez	a4,1358 <not_implemented+0x78>
    1360:	00812403          	lw	s0,8(sp)
    1364:	00c12083          	lw	ra,12(sp)
    1368:	01010113          	addi	sp,sp,16
    136c:	fffff317          	auipc	t1,0xfffff
    1370:	d7430067          	jr	-652(t1) # e0 <play_click_noise>

00001374 <main_menu>:
    1374:	000067b7          	lui	a5,0x6
    1378:	fc010113          	addi	sp,sp,-64
    137c:	9a078793          	addi	a5,a5,-1632 # 59a0 <LEDS+0xd8>
    1380:	00f12223          	sw	a5,4(sp)
    1384:	000067b7          	lui	a5,0x6
    1388:	9b078793          	addi	a5,a5,-1616 # 59b0 <LEDS+0xe8>
    138c:	03312623          	sw	s3,44(sp)
    1390:	000069b7          	lui	s3,0x6
    1394:	00f12423          	sw	a5,8(sp)
    1398:	9bc98793          	addi	a5,s3,-1604 # 59bc <LEDS+0xf4>
    139c:	00f12623          	sw	a5,12(sp)
    13a0:	000067b7          	lui	a5,0x6
    13a4:	01912a23          	sw	s9,20(sp)
    13a8:	9c478c93          	addi	s9,a5,-1596 # 59c4 <LEDS+0xfc>
    13ac:	000067b7          	lui	a5,0x6
    13b0:	01712e23          	sw	s7,28(sp)
    13b4:	9d878b93          	addi	s7,a5,-1576 # 59d8 <LEDS+0x110>
    13b8:	000067b7          	lui	a5,0x6
    13bc:	01812c23          	sw	s8,24(sp)
    13c0:	9e878c13          	addi	s8,a5,-1560 # 59e8 <LEDS+0x120>
    13c4:	000067b7          	lui	a5,0x6
    13c8:	01a12823          	sw	s10,16(sp)
    13cc:	9ec78d13          	addi	s10,a5,-1556 # 59ec <LEDS+0x124>
    13d0:	000067b7          	lui	a5,0x6
    13d4:	03612023          	sw	s6,32(sp)
    13d8:	8b87ab03          	lw	s6,-1864(a5) # 58b8 <BUTTONS>
    13dc:	02812c23          	sw	s0,56(sp)
    13e0:	02912a23          	sw	s1,52(sp)
    13e4:	03412423          	sw	s4,40(sp)
    13e8:	02112e23          	sw	ra,60(sp)
    13ec:	03212823          	sw	s2,48(sp)
    13f0:	03512223          	sw	s5,36(sp)
    13f4:	00000493          	li	s1,0
    13f8:	00000413          	li	s0,0
    13fc:	00300a13          	li	s4,3
    1400:	00000593          	li	a1,0
    1404:	00000513          	li	a0,0
    1408:	00001097          	auipc	ra,0x1
    140c:	c14080e7          	jalr	-1004(ra) # 201c <display_set_cursor>
    1410:	00000593          	li	a1,0
    1414:	0ff00513          	li	a0,255
    1418:	00001097          	auipc	ra,0x1
    141c:	c18080e7          	jalr	-1000(ra) # 2030 <display_set_front_back_color>
    1420:	000c8513          	mv	a0,s9
    1424:	00001097          	auipc	ra,0x1
    1428:	ed4080e7          	jalr	-300(ra) # 22f8 <printf>
    142c:	00410a93          	addi	s5,sp,4
    1430:	00000913          	li	s2,0
    1434:	0f241e63          	bne	s0,s2,1530 <main_menu+0x1bc>
    1438:	0ff00593          	li	a1,255
    143c:	00000513          	li	a0,0
    1440:	00001097          	auipc	ra,0x1
    1444:	bf0080e7          	jalr	-1040(ra) # 2030 <display_set_front_back_color>
    1448:	000aa603          	lw	a2,0(s5)
    144c:	00190913          	addi	s2,s2,1
    1450:	00090593          	mv	a1,s2
    1454:	000b8513          	mv	a0,s7
    1458:	00001097          	auipc	ra,0x1
    145c:	ea0080e7          	jalr	-352(ra) # 22f8 <printf>
    1460:	000c0513          	mv	a0,s8
    1464:	00001097          	auipc	ra,0x1
    1468:	e94080e7          	jalr	-364(ra) # 22f8 <printf>
    146c:	004a8a93          	addi	s5,s5,4
    1470:	fd4912e3          	bne	s2,s4,1434 <main_menu+0xc0>
    1474:	00000593          	li	a1,0
    1478:	0ff00513          	li	a0,255
    147c:	00001097          	auipc	ra,0x1
    1480:	bb4080e7          	jalr	-1100(ra) # 2030 <display_set_front_back_color>
    1484:	06e00593          	li	a1,110
    1488:	00000513          	li	a0,0
    148c:	00001097          	auipc	ra,0x1
    1490:	b90080e7          	jalr	-1136(ra) # 201c <display_set_cursor>
    1494:	000d0513          	mv	a0,s10
    1498:	00001097          	auipc	ra,0x1
    149c:	e60080e7          	jalr	-416(ra) # 22f8 <printf>
    14a0:	00001097          	auipc	ra,0x1
    14a4:	cec080e7          	jalr	-788(ra) # 218c <display_refresh>
    14a8:	000b2903          	lw	s2,0(s6)
    14ac:	fff4c493          	not	s1,s1
    14b0:	0124f4b3          	and	s1,s1,s2
    14b4:	0104f793          	andi	a5,s1,16
    14b8:	00078863          	beqz	a5,14c8 <main_menu+0x154>
    14bc:	00140413          	addi	s0,s0,1
    14c0:	fffff097          	auipc	ra,0xfffff
    14c4:	c20080e7          	jalr	-992(ra) # e0 <play_click_noise>
    14c8:	0084f793          	andi	a5,s1,8
    14cc:	00078863          	beqz	a5,14dc <main_menu+0x168>
    14d0:	fff40413          	addi	s0,s0,-1
    14d4:	fffff097          	auipc	ra,0xfffff
    14d8:	c0c080e7          	jalr	-1012(ra) # e0 <play_click_noise>
    14dc:	0044f493          	andi	s1,s1,4
    14e0:	02048863          	beqz	s1,1510 <main_menu+0x19c>
    14e4:	fffff097          	auipc	ra,0xfffff
    14e8:	bfc080e7          	jalr	-1028(ra) # e0 <play_click_noise>
    14ec:	04041863          	bnez	s0,153c <main_menu+0x1c8>
    14f0:	fffff097          	auipc	ra,0xfffff
    14f4:	558080e7          	jalr	1368(ra) # a48 <file_explorer>
    14f8:	00001097          	auipc	ra,0x1
    14fc:	b18080e7          	jalr	-1256(ra) # 2010 <display_framebuffer>
    1500:	00004637          	lui	a2,0x4
    1504:	00000593          	li	a1,0
    1508:	00000097          	auipc	ra,0x0
    150c:	7bc080e7          	jalr	1980(ra) # 1cc4 <memset>
    1510:	fff00793          	li	a5,-1
    1514:	00f40863          	beq	s0,a5,1524 <main_menu+0x1b0>
    1518:	01441863          	bne	s0,s4,1528 <main_menu+0x1b4>
    151c:	00000413          	li	s0,0
    1520:	0080006f          	j	1528 <main_menu+0x1b4>
    1524:	00200413          	li	s0,2
    1528:	00090493          	mv	s1,s2
    152c:	ed5ff06f          	j	1400 <main_menu+0x8c>
    1530:	00000593          	li	a1,0
    1534:	0ff00513          	li	a0,255
    1538:	f09ff06f          	j	1440 <main_menu+0xcc>
    153c:	00100793          	li	a5,1
    1540:	00f41863          	bne	s0,a5,1550 <main_menu+0x1dc>
    1544:	00000097          	auipc	ra,0x0
    1548:	94c080e7          	jalr	-1716(ra) # e90 <music_player>
    154c:	fadff06f          	j	14f8 <main_menu+0x184>
    1550:	00200793          	li	a5,2
    1554:	faf412e3          	bne	s0,a5,14f8 <main_menu+0x184>
    1558:	9bc98513          	addi	a0,s3,-1604
    155c:	00000097          	auipc	ra,0x0
    1560:	d84080e7          	jalr	-636(ra) # 12e0 <not_implemented>
    1564:	f95ff06f          	j	14f8 <main_menu+0x184>

00001568 <main>:
    1568:	000067b7          	lui	a5,0x6
    156c:	8c87a783          	lw	a5,-1848(a5) # 58c8 <LEDS>
    1570:	ff010113          	addi	sp,sp,-16
    1574:	00112623          	sw	ra,12(sp)
    1578:	00812423          	sw	s0,8(sp)
    157c:	0007a023          	sw	zero,0(a5)
    1580:	000027b7          	lui	a5,0x2
    1584:	04478793          	addi	a5,a5,68 # 2044 <display_putchar>
    1588:	00006737          	lui	a4,0x6
    158c:	e6f72c23          	sw	a5,-392(a4) # 5e78 <f_putchar>
    1590:	00001097          	auipc	ra,0x1
    1594:	960080e7          	jalr	-1696(ra) # 1ef0 <oled_init>
    1598:	00001097          	auipc	ra,0x1
    159c:	964080e7          	jalr	-1692(ra) # 1efc <oled_fullscreen>
    15a0:	00001097          	auipc	ra,0x1
    15a4:	a70080e7          	jalr	-1424(ra) # 2010 <display_framebuffer>
    15a8:	00004637          	lui	a2,0x4
    15ac:	00000593          	li	a1,0
    15b0:	00000097          	auipc	ra,0x0
    15b4:	714080e7          	jalr	1812(ra) # 1cc4 <memset>
    15b8:	00001097          	auipc	ra,0x1
    15bc:	bd4080e7          	jalr	-1068(ra) # 218c <display_refresh>
    15c0:	00000097          	auipc	ra,0x0
    15c4:	4a4080e7          	jalr	1188(ra) # 1a64 <sdcard_init>
    15c8:	00001097          	auipc	ra,0x1
    15cc:	300080e7          	jalr	768(ra) # 28c8 <fl_init>
    15d0:	00000593          	li	a1,0
    15d4:	00000513          	li	a0,0
    15d8:	00001097          	auipc	ra,0x1
    15dc:	a44080e7          	jalr	-1468(ra) # 201c <display_set_cursor>
    15e0:	00000593          	li	a1,0
    15e4:	0ff00513          	li	a0,255
    15e8:	00001097          	auipc	ra,0x1
    15ec:	a48080e7          	jalr	-1464(ra) # 2030 <display_set_front_back_color>
    15f0:	00006537          	lui	a0,0x6
    15f4:	a0050513          	addi	a0,a0,-1536 # 5a00 <LEDS+0x138>
    15f8:	00001097          	auipc	ra,0x1
    15fc:	d00080e7          	jalr	-768(ra) # 22f8 <printf>
    1600:	00001097          	auipc	ra,0x1
    1604:	b8c080e7          	jalr	-1140(ra) # 218c <display_refresh>
    1608:	000025b7          	lui	a1,0x2
    160c:	000027b7          	lui	a5,0x2
    1610:	c0858593          	addi	a1,a1,-1016 # 1c08 <sdcard_writesector>
    1614:	bb478413          	addi	s0,a5,-1100 # 1bb4 <sdcard_readsector>
    1618:	00040513          	mv	a0,s0
    161c:	00002097          	auipc	ra,0x2
    1620:	20c080e7          	jalr	524(ra) # 3828 <fl_attach_media>
    1624:	000027b7          	lui	a5,0x2
    1628:	c0878593          	addi	a1,a5,-1016 # 1c08 <sdcard_writesector>
    162c:	fe0516e3          	bnez	a0,1618 <main+0xb0>
    1630:	00000097          	auipc	ra,0x0
    1634:	d44080e7          	jalr	-700(ra) # 1374 <main_menu>

00001638 <pause>:
    1638:	c0002773          	rdcycle	a4
    163c:	c00027f3          	rdcycle	a5
    1640:	40e787b3          	sub	a5,a5,a4
    1644:	fea7ece3          	bltu	a5,a0,163c <pause+0x4>
    1648:	00008067          	ret

0000164c <sdcard_idle>:
    164c:	00008067          	ret

00001650 <sdcard_select>:
    1650:	000067b7          	lui	a5,0x6
    1654:	8bc7a783          	lw	a5,-1860(a5) # 58bc <SDCARD>
    1658:	00200713          	li	a4,2
    165c:	00e7a023          	sw	a4,0(a5)
    1660:	00008067          	ret

00001664 <sdcard_ponder>:
    1664:	000066b7          	lui	a3,0x6
    1668:	8bc6a683          	lw	a3,-1860(a3) # 58bc <SDCARD>
    166c:	01000793          	li	a5,16
    1670:	00000713          	li	a4,0
    1674:	00676613          	ori	a2,a4,6
    1678:	00c6a023          	sw	a2,0(a3)
    167c:	00174713          	xori	a4,a4,1
    1680:	00000013          	nop
    1684:	fff78793          	addi	a5,a5,-1
    1688:	fe0796e3          	bnez	a5,1674 <sdcard_ponder+0x10>
    168c:	00008067          	ret

00001690 <sdcard_unselect>:
    1690:	000067b7          	lui	a5,0x6
    1694:	8bc7a783          	lw	a5,-1860(a5) # 58bc <SDCARD>
    1698:	00600713          	li	a4,6
    169c:	00e7a023          	sw	a4,0(a5)
    16a0:	00008067          	ret

000016a4 <sdcard_send>:
    16a4:	000067b7          	lui	a5,0x6
    16a8:	8bc7a783          	lw	a5,-1860(a5) # 58bc <SDCARD>
    16ac:	00655713          	srli	a4,a0,0x6
    16b0:	00277713          	andi	a4,a4,2
    16b4:	00e7a023          	sw	a4,0(a5)
    16b8:	00176713          	ori	a4,a4,1
    16bc:	00e7a023          	sw	a4,0(a5)
    16c0:	00555713          	srli	a4,a0,0x5
    16c4:	00277713          	andi	a4,a4,2
    16c8:	00e7a023          	sw	a4,0(a5)
    16cc:	00176713          	ori	a4,a4,1
    16d0:	00e7a023          	sw	a4,0(a5)
    16d4:	00455713          	srli	a4,a0,0x4
    16d8:	00277713          	andi	a4,a4,2
    16dc:	00e7a023          	sw	a4,0(a5)
    16e0:	00176713          	ori	a4,a4,1
    16e4:	00e7a023          	sw	a4,0(a5)
    16e8:	00355713          	srli	a4,a0,0x3
    16ec:	00277713          	andi	a4,a4,2
    16f0:	00e7a023          	sw	a4,0(a5)
    16f4:	00176713          	ori	a4,a4,1
    16f8:	00e7a023          	sw	a4,0(a5)
    16fc:	00255713          	srli	a4,a0,0x2
    1700:	00277713          	andi	a4,a4,2
    1704:	00e7a023          	sw	a4,0(a5)
    1708:	00176713          	ori	a4,a4,1
    170c:	00e7a023          	sw	a4,0(a5)
    1710:	00155713          	srli	a4,a0,0x1
    1714:	00277713          	andi	a4,a4,2
    1718:	00e7a023          	sw	a4,0(a5)
    171c:	00176713          	ori	a4,a4,1
    1720:	00e7a023          	sw	a4,0(a5)
    1724:	00257713          	andi	a4,a0,2
    1728:	00e7a023          	sw	a4,0(a5)
    172c:	00151513          	slli	a0,a0,0x1
    1730:	00176713          	ori	a4,a4,1
    1734:	00e7a023          	sw	a4,0(a5)
    1738:	00257513          	andi	a0,a0,2
    173c:	00a7a023          	sw	a0,0(a5)
    1740:	00156513          	ori	a0,a0,1
    1744:	00a7a023          	sw	a0,0(a5)
    1748:	00200713          	li	a4,2
    174c:	00e7a023          	sw	a4,0(a5)
    1750:	000067b7          	lui	a5,0x6
    1754:	e687a783          	lw	a5,-408(a5) # 5e68 <sdcard_while_loading_callback>
    1758:	00078067          	jr	a5

0000175c <sdcard_read>:
    175c:	fd010113          	addi	sp,sp,-48
    1760:	fff50793          	addi	a5,a0,-1
    1764:	03212023          	sw	s2,32(sp)
    1768:	00100913          	li	s2,1
    176c:	00f91933          	sll	s2,s2,a5
    1770:	000067b7          	lui	a5,0x6
    1774:	01312e23          	sw	s3,28(sp)
    1778:	8bc7a983          	lw	s3,-1860(a5) # 58bc <SDCARD>
    177c:	02812423          	sw	s0,40(sp)
    1780:	02912223          	sw	s1,36(sp)
    1784:	01412c23          	sw	s4,24(sp)
    1788:	01512a23          	sw	s5,20(sp)
    178c:	01612823          	sw	s6,16(sp)
    1790:	02112623          	sw	ra,44(sp)
    1794:	0ff00413          	li	s0,255
    1798:	00000493          	li	s1,0
    179c:	00300a13          	li	s4,3
    17a0:	00200a93          	li	s5,2
    17a4:	00006b37          	lui	s6,0x6
    17a8:	02058c63          	beqz	a1,17e0 <sdcard_read+0x84>
    17ac:	012477b3          	and	a5,s0,s2
    17b0:	02079a63          	bnez	a5,17e4 <sdcard_read+0x88>
    17b4:	02c12083          	lw	ra,44(sp)
    17b8:	0ff47513          	zext.b	a0,s0
    17bc:	02812403          	lw	s0,40(sp)
    17c0:	02412483          	lw	s1,36(sp)
    17c4:	02012903          	lw	s2,32(sp)
    17c8:	01c12983          	lw	s3,28(sp)
    17cc:	01812a03          	lw	s4,24(sp)
    17d0:	01412a83          	lw	s5,20(sp)
    17d4:	01012b03          	lw	s6,16(sp)
    17d8:	03010113          	addi	sp,sp,48
    17dc:	00008067          	ret
    17e0:	fca4dae3          	bge	s1,a0,17b4 <sdcard_read+0x58>
    17e4:	0149a023          	sw	s4,0(s3)
    17e8:	0159a023          	sw	s5,0(s3)
    17ec:	0009a783          	lw	a5,0(s3)
    17f0:	00141413          	slli	s0,s0,0x1
    17f4:	00b12623          	sw	a1,12(sp)
    17f8:	00f46433          	or	s0,s0,a5
    17fc:	e68b2783          	lw	a5,-408(s6) # 5e68 <sdcard_while_loading_callback>
    1800:	00a12423          	sw	a0,8(sp)
    1804:	00148493          	addi	s1,s1,1
    1808:	000780e7          	jalr	a5
    180c:	00c12583          	lw	a1,12(sp)
    1810:	00812503          	lw	a0,8(sp)
    1814:	f95ff06f          	j	17a8 <sdcard_read+0x4c>

00001818 <sdcard_get>:
    1818:	fe010113          	addi	sp,sp,-32
    181c:	00112e23          	sw	ra,28(sp)
    1820:	00812c23          	sw	s0,24(sp)
    1824:	00912a23          	sw	s1,20(sp)
    1828:	00050413          	mv	s0,a0
    182c:	00b12623          	sw	a1,12(sp)
    1830:	00000097          	auipc	ra,0x0
    1834:	e20080e7          	jalr	-480(ra) # 1650 <sdcard_select>
    1838:	00c12583          	lw	a1,12(sp)
    183c:	00040513          	mv	a0,s0
    1840:	00100493          	li	s1,1
    1844:	00000097          	auipc	ra,0x0
    1848:	f18080e7          	jalr	-232(ra) # 175c <sdcard_read>
    184c:	00345413          	srli	s0,s0,0x3
    1850:	0284c463          	blt	s1,s0,1878 <sdcard_get+0x60>
    1854:	00a12623          	sw	a0,12(sp)
    1858:	00000097          	auipc	ra,0x0
    185c:	e38080e7          	jalr	-456(ra) # 1690 <sdcard_unselect>
    1860:	01c12083          	lw	ra,28(sp)
    1864:	01812403          	lw	s0,24(sp)
    1868:	00c12503          	lw	a0,12(sp)
    186c:	01412483          	lw	s1,20(sp)
    1870:	02010113          	addi	sp,sp,32
    1874:	00008067          	ret
    1878:	00000593          	li	a1,0
    187c:	00800513          	li	a0,8
    1880:	00000097          	auipc	ra,0x0
    1884:	edc080e7          	jalr	-292(ra) # 175c <sdcard_read>
    1888:	00148493          	addi	s1,s1,1
    188c:	fc5ff06f          	j	1850 <sdcard_get+0x38>

00001890 <sdcard_cmd>:
    1890:	ff010113          	addi	sp,sp,-16
    1894:	00812423          	sw	s0,8(sp)
    1898:	00912223          	sw	s1,4(sp)
    189c:	01212023          	sw	s2,0(sp)
    18a0:	00112623          	sw	ra,12(sp)
    18a4:	00050913          	mv	s2,a0
    18a8:	00000413          	li	s0,0
    18ac:	00000097          	auipc	ra,0x0
    18b0:	da4080e7          	jalr	-604(ra) # 1650 <sdcard_select>
    18b4:	00600493          	li	s1,6
    18b8:	008907b3          	add	a5,s2,s0
    18bc:	0007c503          	lbu	a0,0(a5)
    18c0:	00140413          	addi	s0,s0,1
    18c4:	00000097          	auipc	ra,0x0
    18c8:	de0080e7          	jalr	-544(ra) # 16a4 <sdcard_send>
    18cc:	fe9416e3          	bne	s0,s1,18b8 <sdcard_cmd+0x28>
    18d0:	00812403          	lw	s0,8(sp)
    18d4:	00c12083          	lw	ra,12(sp)
    18d8:	00412483          	lw	s1,4(sp)
    18dc:	00012903          	lw	s2,0(sp)
    18e0:	01010113          	addi	sp,sp,16
    18e4:	00000317          	auipc	t1,0x0
    18e8:	dac30067          	jr	-596(t1) # 1690 <sdcard_unselect>

000018ec <sdcard_start_sector>:
    18ec:	ff010113          	addi	sp,sp,-16
    18f0:	00112623          	sw	ra,12(sp)
    18f4:	00812423          	sw	s0,8(sp)
    18f8:	00050413          	mv	s0,a0
    18fc:	00000097          	auipc	ra,0x0
    1900:	d54080e7          	jalr	-684(ra) # 1650 <sdcard_select>
    1904:	05100513          	li	a0,81
    1908:	00000097          	auipc	ra,0x0
    190c:	d9c080e7          	jalr	-612(ra) # 16a4 <sdcard_send>
    1910:	01845513          	srli	a0,s0,0x18
    1914:	00000097          	auipc	ra,0x0
    1918:	d90080e7          	jalr	-624(ra) # 16a4 <sdcard_send>
    191c:	41045513          	srai	a0,s0,0x10
    1920:	0ff57513          	zext.b	a0,a0
    1924:	00000097          	auipc	ra,0x0
    1928:	d80080e7          	jalr	-640(ra) # 16a4 <sdcard_send>
    192c:	40845513          	srai	a0,s0,0x8
    1930:	0ff57513          	zext.b	a0,a0
    1934:	00000097          	auipc	ra,0x0
    1938:	d70080e7          	jalr	-656(ra) # 16a4 <sdcard_send>
    193c:	0ff47513          	zext.b	a0,s0
    1940:	00000097          	auipc	ra,0x0
    1944:	d64080e7          	jalr	-668(ra) # 16a4 <sdcard_send>
    1948:	05500513          	li	a0,85
    194c:	00000097          	auipc	ra,0x0
    1950:	d58080e7          	jalr	-680(ra) # 16a4 <sdcard_send>
    1954:	00000097          	auipc	ra,0x0
    1958:	d3c080e7          	jalr	-708(ra) # 1690 <sdcard_unselect>
    195c:	00812403          	lw	s0,8(sp)
    1960:	00c12083          	lw	ra,12(sp)
    1964:	00100593          	li	a1,1
    1968:	00800513          	li	a0,8
    196c:	01010113          	addi	sp,sp,16
    1970:	00000317          	auipc	t1,0x0
    1974:	ea830067          	jr	-344(t1) # 1818 <sdcard_get>

00001978 <sdcard_read_sector>:
    1978:	ff010113          	addi	sp,sp,-16
    197c:	00812423          	sw	s0,8(sp)
    1980:	00112623          	sw	ra,12(sp)
    1984:	00912223          	sw	s1,4(sp)
    1988:	01212023          	sw	s2,0(sp)
    198c:	00058413          	mv	s0,a1
    1990:	00000097          	auipc	ra,0x0
    1994:	f5c080e7          	jalr	-164(ra) # 18ec <sdcard_start_sector>
    1998:	04051863          	bnez	a0,19e8 <sdcard_read_sector+0x70>
    199c:	00100593          	li	a1,1
    19a0:	00058513          	mv	a0,a1
    19a4:	00000097          	auipc	ra,0x0
    19a8:	e74080e7          	jalr	-396(ra) # 1818 <sdcard_get>
    19ac:	00000493          	li	s1,0
    19b0:	20000913          	li	s2,512
    19b4:	00000593          	li	a1,0
    19b8:	00800513          	li	a0,8
    19bc:	00000097          	auipc	ra,0x0
    19c0:	e5c080e7          	jalr	-420(ra) # 1818 <sdcard_get>
    19c4:	009407b3          	add	a5,s0,s1
    19c8:	00a78023          	sb	a0,0(a5)
    19cc:	00148493          	addi	s1,s1,1
    19d0:	ff2492e3          	bne	s1,s2,19b4 <sdcard_read_sector+0x3c>
    19d4:	00100593          	li	a1,1
    19d8:	01000513          	li	a0,16
    19dc:	20040413          	addi	s0,s0,512
    19e0:	00000097          	auipc	ra,0x0
    19e4:	e38080e7          	jalr	-456(ra) # 1818 <sdcard_get>
    19e8:	00c12083          	lw	ra,12(sp)
    19ec:	00040513          	mv	a0,s0
    19f0:	00812403          	lw	s0,8(sp)
    19f4:	00412483          	lw	s1,4(sp)
    19f8:	00012903          	lw	s2,0(sp)
    19fc:	01010113          	addi	sp,sp,16
    1a00:	00008067          	ret

00001a04 <sdcard_preinit>:
    1a04:	ff010113          	addi	sp,sp,-16
    1a08:	000067b7          	lui	a5,0x6
    1a0c:	00812423          	sw	s0,8(sp)
    1a10:	8bc7a403          	lw	s0,-1860(a5) # 58bc <SDCARD>
    1a14:	00112623          	sw	ra,12(sp)
    1a18:	00600793          	li	a5,6
    1a1c:	01313537          	lui	a0,0x1313
    1a20:	00f42023          	sw	a5,0(s0)
    1a24:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
    1a28:	00000097          	auipc	ra,0x0
    1a2c:	c10080e7          	jalr	-1008(ra) # 1638 <pause>
    1a30:	0a000793          	li	a5,160
    1a34:	00000713          	li	a4,0
    1a38:	00676693          	ori	a3,a4,6
    1a3c:	00d42023          	sw	a3,0(s0)
    1a40:	fff78793          	addi	a5,a5,-1
    1a44:	00174713          	xori	a4,a4,1
    1a48:	fe0798e3          	bnez	a5,1a38 <sdcard_preinit+0x34>
    1a4c:	00600793          	li	a5,6
    1a50:	00c12083          	lw	ra,12(sp)
    1a54:	00f42023          	sw	a5,0(s0)
    1a58:	00812403          	lw	s0,8(sp)
    1a5c:	01010113          	addi	sp,sp,16
    1a60:	00008067          	ret

00001a64 <sdcard_init>:
    1a64:	000017b7          	lui	a5,0x1
    1a68:	64c78793          	addi	a5,a5,1612 # 164c <sdcard_idle>
    1a6c:	00006737          	lui	a4,0x6
    1a70:	fe010113          	addi	sp,sp,-32
    1a74:	e6f72423          	sw	a5,-408(a4) # 5e68 <sdcard_while_loading_callback>
    1a78:	000067b7          	lui	a5,0x6
    1a7c:	00812c23          	sw	s0,24(sp)
    1a80:	00912a23          	sw	s1,20(sp)
    1a84:	00112e23          	sw	ra,28(sp)
    1a88:	8a878493          	addi	s1,a5,-1880 # 58a8 <cmd0>
    1a8c:	0ff00413          	li	s0,255
    1a90:	00000097          	auipc	ra,0x0
    1a94:	f74080e7          	jalr	-140(ra) # 1a04 <sdcard_preinit>
    1a98:	00048513          	mv	a0,s1
    1a9c:	00000097          	auipc	ra,0x0
    1aa0:	df4080e7          	jalr	-524(ra) # 1890 <sdcard_cmd>
    1aa4:	00100593          	li	a1,1
    1aa8:	00800513          	li	a0,8
    1aac:	00000097          	auipc	ra,0x0
    1ab0:	d6c080e7          	jalr	-660(ra) # 1818 <sdcard_get>
    1ab4:	00a12623          	sw	a0,12(sp)
    1ab8:	00000097          	auipc	ra,0x0
    1abc:	bac080e7          	jalr	-1108(ra) # 1664 <sdcard_ponder>
    1ac0:	00c12503          	lw	a0,12(sp)
    1ac4:	00851c63          	bne	a0,s0,1adc <sdcard_init+0x78>
    1ac8:	01313537          	lui	a0,0x1313
    1acc:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
    1ad0:	00000097          	auipc	ra,0x0
    1ad4:	b68080e7          	jalr	-1176(ra) # 1638 <pause>
    1ad8:	fb9ff06f          	j	1a90 <sdcard_init+0x2c>
    1adc:	00006537          	lui	a0,0x6
    1ae0:	8a050513          	addi	a0,a0,-1888 # 58a0 <cmd8>
    1ae4:	00000097          	auipc	ra,0x0
    1ae8:	dac080e7          	jalr	-596(ra) # 1890 <sdcard_cmd>
    1aec:	00100593          	li	a1,1
    1af0:	02800513          	li	a0,40
    1af4:	00000097          	auipc	ra,0x0
    1af8:	d24080e7          	jalr	-732(ra) # 1818 <sdcard_get>
    1afc:	00000097          	auipc	ra,0x0
    1b00:	b68080e7          	jalr	-1176(ra) # 1664 <sdcard_ponder>
    1b04:	000067b7          	lui	a5,0x6
    1b08:	89878413          	addi	s0,a5,-1896 # 5898 <cmd55>
    1b0c:	000067b7          	lui	a5,0x6
    1b10:	89078493          	addi	s1,a5,-1904 # 5890 <acmd41>
    1b14:	00040513          	mv	a0,s0
    1b18:	00000097          	auipc	ra,0x0
    1b1c:	d78080e7          	jalr	-648(ra) # 1890 <sdcard_cmd>
    1b20:	00100593          	li	a1,1
    1b24:	00800513          	li	a0,8
    1b28:	00000097          	auipc	ra,0x0
    1b2c:	cf0080e7          	jalr	-784(ra) # 1818 <sdcard_get>
    1b30:	00000097          	auipc	ra,0x0
    1b34:	b34080e7          	jalr	-1228(ra) # 1664 <sdcard_ponder>
    1b38:	00048513          	mv	a0,s1
    1b3c:	00000097          	auipc	ra,0x0
    1b40:	d54080e7          	jalr	-684(ra) # 1890 <sdcard_cmd>
    1b44:	00100593          	li	a1,1
    1b48:	00800513          	li	a0,8
    1b4c:	00000097          	auipc	ra,0x0
    1b50:	ccc080e7          	jalr	-820(ra) # 1818 <sdcard_get>
    1b54:	00a12623          	sw	a0,12(sp)
    1b58:	00000097          	auipc	ra,0x0
    1b5c:	b0c080e7          	jalr	-1268(ra) # 1664 <sdcard_ponder>
    1b60:	00c12503          	lw	a0,12(sp)
    1b64:	00050c63          	beqz	a0,1b7c <sdcard_init+0x118>
    1b68:	001e8537          	lui	a0,0x1e8
    1b6c:	48050513          	addi	a0,a0,1152 # 1e8480 <__stacktop+0x1d8480>
    1b70:	00000097          	auipc	ra,0x0
    1b74:	ac8080e7          	jalr	-1336(ra) # 1638 <pause>
    1b78:	f9dff06f          	j	1b14 <sdcard_init+0xb0>
    1b7c:	00006537          	lui	a0,0x6
    1b80:	88850513          	addi	a0,a0,-1912 # 5888 <cmd16>
    1b84:	00000097          	auipc	ra,0x0
    1b88:	d0c080e7          	jalr	-756(ra) # 1890 <sdcard_cmd>
    1b8c:	00100593          	li	a1,1
    1b90:	00800513          	li	a0,8
    1b94:	00000097          	auipc	ra,0x0
    1b98:	c84080e7          	jalr	-892(ra) # 1818 <sdcard_get>
    1b9c:	01812403          	lw	s0,24(sp)
    1ba0:	01c12083          	lw	ra,28(sp)
    1ba4:	01412483          	lw	s1,20(sp)
    1ba8:	02010113          	addi	sp,sp,32
    1bac:	00000317          	auipc	t1,0x0
    1bb0:	ab830067          	jr	-1352(t1) # 1664 <sdcard_ponder>

00001bb4 <sdcard_readsector>:
    1bb4:	04060663          	beqz	a2,1c00 <sdcard_readsector+0x4c>
    1bb8:	ff010113          	addi	sp,sp,-16
    1bbc:	00812423          	sw	s0,8(sp)
    1bc0:	00912223          	sw	s1,4(sp)
    1bc4:	00112623          	sw	ra,12(sp)
    1bc8:	00050413          	mv	s0,a0
    1bcc:	00a604b3          	add	s1,a2,a0
    1bd0:	00040513          	mv	a0,s0
    1bd4:	00000097          	auipc	ra,0x0
    1bd8:	da4080e7          	jalr	-604(ra) # 1978 <sdcard_read_sector>
    1bdc:	00140413          	addi	s0,s0,1
    1be0:	00050593          	mv	a1,a0
    1be4:	fe9416e3          	bne	s0,s1,1bd0 <sdcard_readsector+0x1c>
    1be8:	00c12083          	lw	ra,12(sp)
    1bec:	00812403          	lw	s0,8(sp)
    1bf0:	00412483          	lw	s1,4(sp)
    1bf4:	00100513          	li	a0,1
    1bf8:	01010113          	addi	sp,sp,16
    1bfc:	00008067          	ret
    1c00:	00000513          	li	a0,0
    1c04:	00008067          	ret

00001c08 <sdcard_writesector>:
    1c08:	00000513          	li	a0,0
    1c0c:	00008067          	ret

00001c10 <__divsi3>:
    1c10:	06054063          	bltz	a0,1c70 <__umodsi3+0x10>
    1c14:	0605c663          	bltz	a1,1c80 <__umodsi3+0x20>

00001c18 <__udivsi3>:
    1c18:	00058613          	mv	a2,a1
    1c1c:	00050593          	mv	a1,a0
    1c20:	fff00513          	li	a0,-1
    1c24:	02060c63          	beqz	a2,1c5c <__udivsi3+0x44>
    1c28:	00100693          	li	a3,1
    1c2c:	00b67a63          	bgeu	a2,a1,1c40 <__udivsi3+0x28>
    1c30:	00c05863          	blez	a2,1c40 <__udivsi3+0x28>
    1c34:	00161613          	slli	a2,a2,0x1
    1c38:	00169693          	slli	a3,a3,0x1
    1c3c:	feb66ae3          	bltu	a2,a1,1c30 <__udivsi3+0x18>
    1c40:	00000513          	li	a0,0
    1c44:	00c5e663          	bltu	a1,a2,1c50 <__udivsi3+0x38>
    1c48:	40c585b3          	sub	a1,a1,a2
    1c4c:	00d56533          	or	a0,a0,a3
    1c50:	0016d693          	srli	a3,a3,0x1
    1c54:	00165613          	srli	a2,a2,0x1
    1c58:	fe0696e3          	bnez	a3,1c44 <__udivsi3+0x2c>
    1c5c:	00008067          	ret

00001c60 <__umodsi3>:
    1c60:	00008293          	mv	t0,ra
    1c64:	fb5ff0ef          	jal	1c18 <__udivsi3>
    1c68:	00058513          	mv	a0,a1
    1c6c:	00028067          	jr	t0
    1c70:	40a00533          	neg	a0,a0
    1c74:	0005d863          	bgez	a1,1c84 <__umodsi3+0x24>
    1c78:	40b005b3          	neg	a1,a1
    1c7c:	f95ff06f          	j	1c10 <__divsi3>
    1c80:	40b005b3          	neg	a1,a1
    1c84:	00008293          	mv	t0,ra
    1c88:	f89ff0ef          	jal	1c10 <__divsi3>
    1c8c:	40a00533          	neg	a0,a0
    1c90:	00028067          	jr	t0

00001c94 <__modsi3>:
    1c94:	00008293          	mv	t0,ra
    1c98:	0005ca63          	bltz	a1,1cac <__modsi3+0x18>
    1c9c:	00054c63          	bltz	a0,1cb4 <__modsi3+0x20>
    1ca0:	f79ff0ef          	jal	1c18 <__udivsi3>
    1ca4:	00058513          	mv	a0,a1
    1ca8:	00028067          	jr	t0
    1cac:	40b005b3          	neg	a1,a1
    1cb0:	fe0558e3          	bgez	a0,1ca0 <__modsi3+0xc>
    1cb4:	40a00533          	neg	a0,a0
    1cb8:	f61ff0ef          	jal	1c18 <__udivsi3>
    1cbc:	40b00533          	neg	a0,a1
    1cc0:	00028067          	jr	t0

00001cc4 <memset>:
    1cc4:	00c50633          	add	a2,a0,a2
    1cc8:	00050793          	mv	a5,a0
    1ccc:	00c79463          	bne	a5,a2,1cd4 <memset+0x10>
    1cd0:	00008067          	ret
    1cd4:	00178793          	addi	a5,a5,1
    1cd8:	feb78fa3          	sb	a1,-1(a5)
    1cdc:	ff1ff06f          	j	1ccc <memset+0x8>

00001ce0 <memcpy>:
    1ce0:	00000793          	li	a5,0
    1ce4:	00c79463          	bne	a5,a2,1cec <memcpy+0xc>
    1ce8:	00008067          	ret
    1cec:	00f58733          	add	a4,a1,a5
    1cf0:	00074683          	lbu	a3,0(a4)
    1cf4:	00f50733          	add	a4,a0,a5
    1cf8:	00178793          	addi	a5,a5,1
    1cfc:	00d70023          	sb	a3,0(a4)
    1d00:	fe5ff06f          	j	1ce4 <memcpy+0x4>

00001d04 <strlen>:
    1d04:	00000793          	li	a5,0
    1d08:	00f50733          	add	a4,a0,a5
    1d0c:	00074703          	lbu	a4,0(a4)
    1d10:	00071663          	bnez	a4,1d1c <strlen+0x18>
    1d14:	00078513          	mv	a0,a5
    1d18:	00008067          	ret
    1d1c:	00178793          	addi	a5,a5,1
    1d20:	fe9ff06f          	j	1d08 <strlen+0x4>

00001d24 <strncmp>:
    1d24:	00000793          	li	a5,0
    1d28:	00c79663          	bne	a5,a2,1d34 <strncmp+0x10>
    1d2c:	00000513          	li	a0,0
    1d30:	00008067          	ret
    1d34:	00f50733          	add	a4,a0,a5
    1d38:	00074683          	lbu	a3,0(a4)
    1d3c:	00f58733          	add	a4,a1,a5
    1d40:	00074703          	lbu	a4,0(a4)
    1d44:	00e6e863          	bltu	a3,a4,1d54 <strncmp+0x30>
    1d48:	00d76a63          	bltu	a4,a3,1d5c <strncmp+0x38>
    1d4c:	00178793          	addi	a5,a5,1
    1d50:	fd9ff06f          	j	1d28 <strncmp+0x4>
    1d54:	fff00513          	li	a0,-1
    1d58:	00008067          	ret
    1d5c:	00100513          	li	a0,1
    1d60:	00008067          	ret

00001d64 <strncpy>:
    1d64:	00000793          	li	a5,0
    1d68:	00c79463          	bne	a5,a2,1d70 <strncpy+0xc>
    1d6c:	00008067          	ret
    1d70:	00f58733          	add	a4,a1,a5
    1d74:	00074683          	lbu	a3,0(a4)
    1d78:	00f50733          	add	a4,a0,a5
    1d7c:	00178793          	addi	a5,a5,1
    1d80:	00d70023          	sb	a3,0(a4)
    1d84:	fe5ff06f          	j	1d68 <strncpy+0x4>

00001d88 <strcpy>:
    1d88:	0005c783          	lbu	a5,0(a1)
    1d8c:	00079663          	bnez	a5,1d98 <strcpy+0x10>
    1d90:	00050023          	sb	zero,0(a0)
    1d94:	00008067          	ret
    1d98:	00150513          	addi	a0,a0,1
    1d9c:	00158593          	addi	a1,a1,1
    1da0:	fef50fa3          	sb	a5,-1(a0)
    1da4:	fe5ff06f          	j	1d88 <strcpy>

00001da8 <strcat>:
    1da8:	00050793          	mv	a5,a0
    1dac:	0007c683          	lbu	a3,0(a5)
    1db0:	00078713          	mv	a4,a5
    1db4:	00178793          	addi	a5,a5,1
    1db8:	fe069ae3          	bnez	a3,1dac <strcat+0x4>
    1dbc:	0005c783          	lbu	a5,0(a1)
    1dc0:	00158593          	addi	a1,a1,1
    1dc4:	00170713          	addi	a4,a4,1
    1dc8:	fef70fa3          	sb	a5,-1(a4)
    1dcc:	fe0798e3          	bnez	a5,1dbc <strcat+0x14>
    1dd0:	00008067          	ret

00001dd4 <oled_wait>:
    1dd4:	00000013          	nop
    1dd8:	00000013          	nop
    1ddc:	00000013          	nop
    1de0:	00000013          	nop
    1de4:	00000013          	nop
    1de8:	00000013          	nop
    1dec:	00000013          	nop
    1df0:	00008067          	ret

00001df4 <oled_init_mode>:
    1df4:	000067b7          	lui	a5,0x6
    1df8:	8c07a703          	lw	a4,-1856(a5) # 58c0 <OLED_RST>
    1dfc:	fe010113          	addi	sp,sp,-32
    1e00:	00112e23          	sw	ra,28(sp)
    1e04:	00812c23          	sw	s0,24(sp)
    1e08:	00072023          	sw	zero,0(a4)
    1e0c:	00040737          	lui	a4,0x40
    1e10:	00000013          	nop
    1e14:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
    1e18:	fe071ce3          	bnez	a4,1e10 <oled_init_mode+0x1c>
    1e1c:	8c07a703          	lw	a4,-1856(a5)
    1e20:	00100693          	li	a3,1
    1e24:	00d72023          	sw	a3,0(a4)
    1e28:	00040737          	lui	a4,0x40
    1e2c:	00000013          	nop
    1e30:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
    1e34:	fe071ce3          	bnez	a4,1e2c <oled_init_mode+0x38>
    1e38:	8c07a783          	lw	a5,-1856(a5)
    1e3c:	0007a023          	sw	zero,0(a5)
    1e40:	000407b7          	lui	a5,0x40
    1e44:	00000013          	nop
    1e48:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
    1e4c:	fe079ce3          	bnez	a5,1e44 <oled_init_mode+0x50>
    1e50:	00006737          	lui	a4,0x6
    1e54:	8c472783          	lw	a5,-1852(a4) # 58c4 <OLED>
    1e58:	2af00693          	li	a3,687
    1e5c:	00d7a023          	sw	a3,0(a5)
    1e60:	000407b7          	lui	a5,0x40
    1e64:	00000013          	nop
    1e68:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
    1e6c:	fe079ce3          	bnez	a5,1e64 <oled_init_mode+0x70>
    1e70:	8c472403          	lw	s0,-1852(a4)
    1e74:	2a000793          	li	a5,672
    1e78:	00a12623          	sw	a0,12(sp)
    1e7c:	00f42023          	sw	a5,0(s0)
    1e80:	00000097          	auipc	ra,0x0
    1e84:	f54080e7          	jalr	-172(ra) # 1dd4 <oled_wait>
    1e88:	00c12503          	lw	a0,12(sp)
    1e8c:	4a000793          	li	a5,1184
    1e90:	00050463          	beqz	a0,1e98 <oled_init_mode+0xa4>
    1e94:	42000793          	li	a5,1056
    1e98:	00f42023          	sw	a5,0(s0)
    1e9c:	00000097          	auipc	ra,0x0
    1ea0:	f38080e7          	jalr	-200(ra) # 1dd4 <oled_wait>
    1ea4:	2fd00793          	li	a5,765
    1ea8:	00f42023          	sw	a5,0(s0)
    1eac:	00000097          	auipc	ra,0x0
    1eb0:	f28080e7          	jalr	-216(ra) # 1dd4 <oled_wait>
    1eb4:	4b100793          	li	a5,1201
    1eb8:	00f42023          	sw	a5,0(s0)
    1ebc:	00000097          	auipc	ra,0x0
    1ec0:	f18080e7          	jalr	-232(ra) # 1dd4 <oled_wait>
    1ec4:	2a200793          	li	a5,674
    1ec8:	00f42023          	sw	a5,0(s0)
    1ecc:	00000097          	auipc	ra,0x0
    1ed0:	f08080e7          	jalr	-248(ra) # 1dd4 <oled_wait>
    1ed4:	40000793          	li	a5,1024
    1ed8:	00f42023          	sw	a5,0(s0)
    1edc:	01812403          	lw	s0,24(sp)
    1ee0:	01c12083          	lw	ra,28(sp)
    1ee4:	02010113          	addi	sp,sp,32
    1ee8:	00000317          	auipc	t1,0x0
    1eec:	eec30067          	jr	-276(t1) # 1dd4 <oled_wait>

00001ef0 <oled_init>:
    1ef0:	00000513          	li	a0,0
    1ef4:	00000317          	auipc	t1,0x0
    1ef8:	f0030067          	jr	-256(t1) # 1df4 <oled_init_mode>

00001efc <oled_fullscreen>:
    1efc:	ff010113          	addi	sp,sp,-16
    1f00:	000067b7          	lui	a5,0x6
    1f04:	00812423          	sw	s0,8(sp)
    1f08:	8c47a403          	lw	s0,-1852(a5) # 58c4 <OLED>
    1f0c:	00112623          	sw	ra,12(sp)
    1f10:	00912223          	sw	s1,4(sp)
    1f14:	01212023          	sw	s2,0(sp)
    1f18:	21500793          	li	a5,533
    1f1c:	00f42023          	sw	a5,0(s0)
    1f20:	40000913          	li	s2,1024
    1f24:	00000097          	auipc	ra,0x0
    1f28:	eb0080e7          	jalr	-336(ra) # 1dd4 <oled_wait>
    1f2c:	47f00493          	li	s1,1151
    1f30:	01242023          	sw	s2,0(s0)
    1f34:	00000097          	auipc	ra,0x0
    1f38:	ea0080e7          	jalr	-352(ra) # 1dd4 <oled_wait>
    1f3c:	00942023          	sw	s1,0(s0)
    1f40:	00000097          	auipc	ra,0x0
    1f44:	e94080e7          	jalr	-364(ra) # 1dd4 <oled_wait>
    1f48:	27500793          	li	a5,629
    1f4c:	00f42023          	sw	a5,0(s0)
    1f50:	00000097          	auipc	ra,0x0
    1f54:	e84080e7          	jalr	-380(ra) # 1dd4 <oled_wait>
    1f58:	01242023          	sw	s2,0(s0)
    1f5c:	00000097          	auipc	ra,0x0
    1f60:	e78080e7          	jalr	-392(ra) # 1dd4 <oled_wait>
    1f64:	00942023          	sw	s1,0(s0)
    1f68:	00000097          	auipc	ra,0x0
    1f6c:	e6c080e7          	jalr	-404(ra) # 1dd4 <oled_wait>
    1f70:	25c00793          	li	a5,604
    1f74:	00f42023          	sw	a5,0(s0)
    1f78:	00812403          	lw	s0,8(sp)
    1f7c:	00c12083          	lw	ra,12(sp)
    1f80:	00412483          	lw	s1,4(sp)
    1f84:	00012903          	lw	s2,0(sp)
    1f88:	01010113          	addi	sp,sp,16
    1f8c:	00000317          	auipc	t1,0x0
    1f90:	e4830067          	jr	-440(t1) # 1dd4 <oled_wait>

00001f94 <oled_clear>:
    1f94:	fe010113          	addi	sp,sp,-32
    1f98:	000067b7          	lui	a5,0x6
    1f9c:	01312623          	sw	s3,12(sp)
    1fa0:	8c47a983          	lw	s3,-1852(a5) # 58c4 <OLED>
    1fa4:	00812c23          	sw	s0,24(sp)
    1fa8:	01212823          	sw	s2,16(sp)
    1fac:	00112e23          	sw	ra,28(sp)
    1fb0:	00912a23          	sw	s1,20(sp)
    1fb4:	08000913          	li	s2,128
    1fb8:	40056413          	ori	s0,a0,1024
    1fbc:	08000493          	li	s1,128
    1fc0:	0089a023          	sw	s0,0(s3)
    1fc4:	00000097          	auipc	ra,0x0
    1fc8:	e10080e7          	jalr	-496(ra) # 1dd4 <oled_wait>
    1fcc:	0089a023          	sw	s0,0(s3)
    1fd0:	00000097          	auipc	ra,0x0
    1fd4:	e04080e7          	jalr	-508(ra) # 1dd4 <oled_wait>
    1fd8:	fff48493          	addi	s1,s1,-1
    1fdc:	0089a023          	sw	s0,0(s3)
    1fe0:	00000097          	auipc	ra,0x0
    1fe4:	df4080e7          	jalr	-524(ra) # 1dd4 <oled_wait>
    1fe8:	fc049ce3          	bnez	s1,1fc0 <oled_clear+0x2c>
    1fec:	fff90913          	addi	s2,s2,-1
    1ff0:	fc0916e3          	bnez	s2,1fbc <oled_clear+0x28>
    1ff4:	01c12083          	lw	ra,28(sp)
    1ff8:	01812403          	lw	s0,24(sp)
    1ffc:	01412483          	lw	s1,20(sp)
    2000:	01012903          	lw	s2,16(sp)
    2004:	00c12983          	lw	s3,12(sp)
    2008:	02010113          	addi	sp,sp,32
    200c:	00008067          	ret

00002010 <display_framebuffer>:
    2010:	000067b7          	lui	a5,0x6
    2014:	8b47a503          	lw	a0,-1868(a5) # 58b4 <DISPLAY>
    2018:	00008067          	ret

0000201c <display_set_cursor>:
    201c:	000067b7          	lui	a5,0x6
    2020:	e6a7aa23          	sw	a0,-396(a5) # 5e74 <cursor_x>
    2024:	000067b7          	lui	a5,0x6
    2028:	e6b7a823          	sw	a1,-400(a5) # 5e70 <cursor_y>
    202c:	00008067          	ret

00002030 <display_set_front_back_color>:
    2030:	000067b7          	lui	a5,0x6
    2034:	e6a786a3          	sb	a0,-403(a5) # 5e6d <front_color>
    2038:	000067b7          	lui	a5,0x6
    203c:	e6b78623          	sb	a1,-404(a5) # 5e6c <back_color>
    2040:	00008067          	ret

00002044 <display_putchar>:
    2044:	00a00793          	li	a5,10
    2048:	00006737          	lui	a4,0x6
    204c:	02f51663          	bne	a0,a5,2078 <display_putchar+0x34>
    2050:	e6072a23          	sw	zero,-396(a4) # 5e74 <cursor_x>
    2054:	00006737          	lui	a4,0x6
    2058:	e7072783          	lw	a5,-400(a4) # 5e70 <cursor_y>
    205c:	00878793          	addi	a5,a5,8
    2060:	e6f72823          	sw	a5,-400(a4)
    2064:	07f00713          	li	a4,127
    2068:	00f75663          	bge	a4,a5,2074 <display_putchar+0x30>
    206c:	000067b7          	lui	a5,0x6
    2070:	e607a823          	sw	zero,-400(a5) # 5e70 <cursor_y>
    2074:	00008067          	ret
    2078:	ff010113          	addi	sp,sp,-16
    207c:	00812623          	sw	s0,12(sp)
    2080:	01f00793          	li	a5,31
    2084:	0ca7d263          	bge	a5,a0,2148 <display_putchar+0x104>
    2088:	00006e37          	lui	t3,0x6
    208c:	e70e2783          	lw	a5,-400(t3) # 5e70 <cursor_y>
    2090:	07800693          	li	a3,120
    2094:	00800593          	li	a1,8
    2098:	00f6d663          	bge	a3,a5,20a4 <display_putchar+0x60>
    209c:	08000593          	li	a1,128
    20a0:	40f585b3          	sub	a1,a1,a5
    20a4:	e7472783          	lw	a5,-396(a4)
    20a8:	07b00693          	li	a3,123
    20ac:	00500813          	li	a6,5
    20b0:	00f6d663          	bge	a3,a5,20bc <display_putchar+0x78>
    20b4:	08000813          	li	a6,128
    20b8:	40f80833          	sub	a6,a6,a5
    20bc:	000067b7          	lui	a5,0x6
    20c0:	8b47a283          	lw	t0,-1868(a5) # 58b4 <DISPLAY>
    20c4:	000066b7          	lui	a3,0x6
    20c8:	00251793          	slli	a5,a0,0x2
    20cc:	a5c68693          	addi	a3,a3,-1444 # 5a5c <font>
    20d0:	00a787b3          	add	a5,a5,a0
    20d4:	00d78533          	add	a0,a5,a3
    20d8:	00100f93          	li	t6,1
    20dc:	00000693          	li	a3,0
    20e0:	000063b7          	lui	t2,0x6
    20e4:	00006437          	lui	s0,0x6
    20e8:	06b6d063          	bge	a3,a1,2148 <display_putchar+0x104>
    20ec:	00df9f33          	sll	t5,t6,a3
    20f0:	00050893          	mv	a7,a0
    20f4:	00000613          	li	a2,0
    20f8:	03c0006f          	j	2134 <display_putchar+0xf0>
    20fc:	f608c783          	lbu	a5,-160(a7)
    2100:	01e7f7b3          	and	a5,a5,t5
    2104:	02078e63          	beqz	a5,2140 <display_putchar+0xfc>
    2108:	e6d44e83          	lbu	t4,-403(s0) # 5e6d <front_color>
    210c:	e7472783          	lw	a5,-396(a4)
    2110:	e70e2303          	lw	t1,-400(t3)
    2114:	00188893          	addi	a7,a7,1
    2118:	00f607b3          	add	a5,a2,a5
    211c:	00779793          	slli	a5,a5,0x7
    2120:	00668333          	add	t1,a3,t1
    2124:	006787b3          	add	a5,a5,t1
    2128:	00f287b3          	add	a5,t0,a5
    212c:	01d78023          	sb	t4,0(a5)
    2130:	00160613          	addi	a2,a2,1 # 4001 <_open_file+0xf9>
    2134:	fd0644e3          	blt	a2,a6,20fc <display_putchar+0xb8>
    2138:	00168693          	addi	a3,a3,1
    213c:	fadff06f          	j	20e8 <display_putchar+0xa4>
    2140:	e6c3ce83          	lbu	t4,-404(t2) # 5e6c <back_color>
    2144:	fc9ff06f          	j	210c <display_putchar+0xc8>
    2148:	e7472783          	lw	a5,-396(a4)
    214c:	07f00693          	li	a3,127
    2150:	00578793          	addi	a5,a5,5
    2154:	00f6c663          	blt	a3,a5,2160 <display_putchar+0x11c>
    2158:	e6f72a23          	sw	a5,-396(a4)
    215c:	0240006f          	j	2180 <display_putchar+0x13c>
    2160:	e6072a23          	sw	zero,-396(a4)
    2164:	00006737          	lui	a4,0x6
    2168:	e7072783          	lw	a5,-400(a4) # 5e70 <cursor_y>
    216c:	00878793          	addi	a5,a5,8
    2170:	e6f72823          	sw	a5,-400(a4)
    2174:	00f6d663          	bge	a3,a5,2180 <display_putchar+0x13c>
    2178:	000067b7          	lui	a5,0x6
    217c:	e607a823          	sw	zero,-400(a5) # 5e70 <cursor_y>
    2180:	00c12403          	lw	s0,12(sp)
    2184:	01010113          	addi	sp,sp,16
    2188:	00008067          	ret

0000218c <display_refresh>:
    218c:	00008067          	ret

00002190 <print_string>:
    2190:	ff010113          	addi	sp,sp,-16
    2194:	00812423          	sw	s0,8(sp)
    2198:	00912223          	sw	s1,4(sp)
    219c:	00112623          	sw	ra,12(sp)
    21a0:	00050413          	mv	s0,a0
    21a4:	000064b7          	lui	s1,0x6
    21a8:	00044503          	lbu	a0,0(s0)
    21ac:	00051c63          	bnez	a0,21c4 <print_string+0x34>
    21b0:	00c12083          	lw	ra,12(sp)
    21b4:	00812403          	lw	s0,8(sp)
    21b8:	00412483          	lw	s1,4(sp)
    21bc:	01010113          	addi	sp,sp,16
    21c0:	00008067          	ret
    21c4:	e784a783          	lw	a5,-392(s1) # 5e78 <f_putchar>
    21c8:	00140413          	addi	s0,s0,1
    21cc:	000780e7          	jalr	a5
    21d0:	fd9ff06f          	j	21a8 <print_string+0x18>

000021d4 <print_dec>:
    21d4:	ef010113          	addi	sp,sp,-272
    21d8:	10812423          	sw	s0,264(sp)
    21dc:	10912223          	sw	s1,260(sp)
    21e0:	10112623          	sw	ra,268(sp)
    21e4:	11212023          	sw	s2,256(sp)
    21e8:	00050413          	mv	s0,a0
    21ec:	000064b7          	lui	s1,0x6
    21f0:	08045063          	bgez	s0,2270 <print_dec+0x9c>
    21f4:	e784a783          	lw	a5,-392(s1) # 5e78 <f_putchar>
    21f8:	02d00513          	li	a0,45
    21fc:	40800433          	neg	s0,s0
    2200:	000780e7          	jalr	a5
    2204:	fedff06f          	j	21f0 <print_dec+0x1c>
    2208:	00040513          	mv	a0,s0
    220c:	00a00593          	li	a1,10
    2210:	00000097          	auipc	ra,0x0
    2214:	a00080e7          	jalr	-1536(ra) # 1c10 <__divsi3>
    2218:	00251793          	slli	a5,a0,0x2
    221c:	00f507b3          	add	a5,a0,a5
    2220:	00179793          	slli	a5,a5,0x1
    2224:	40f40433          	sub	s0,s0,a5
    2228:	00148493          	addi	s1,s1,1
    222c:	fe848fa3          	sb	s0,-1(s1)
    2230:	00050413          	mv	s0,a0
    2234:	fc041ae3          	bnez	s0,2208 <print_dec+0x34>
    2238:	fd2488e3          	beq	s1,s2,2208 <print_dec+0x34>
    223c:	00006437          	lui	s0,0x6
    2240:	fff4c503          	lbu	a0,-1(s1)
    2244:	e7842783          	lw	a5,-392(s0) # 5e78 <f_putchar>
    2248:	fff48493          	addi	s1,s1,-1
    224c:	03050513          	addi	a0,a0,48
    2250:	000780e7          	jalr	a5
    2254:	ff2496e3          	bne	s1,s2,2240 <print_dec+0x6c>
    2258:	10c12083          	lw	ra,268(sp)
    225c:	10812403          	lw	s0,264(sp)
    2260:	10412483          	lw	s1,260(sp)
    2264:	10012903          	lw	s2,256(sp)
    2268:	11010113          	addi	sp,sp,272
    226c:	00008067          	ret
    2270:	00010493          	mv	s1,sp
    2274:	00010913          	mv	s2,sp
    2278:	fbdff06f          	j	2234 <print_dec+0x60>

0000227c <print_hex_digits>:
    227c:	fe010113          	addi	sp,sp,-32
    2280:	00812c23          	sw	s0,24(sp)
    2284:	00912a23          	sw	s1,20(sp)
    2288:	fff58413          	addi	s0,a1,-1
    228c:	000064b7          	lui	s1,0x6
    2290:	01212823          	sw	s2,16(sp)
    2294:	01312623          	sw	s3,12(sp)
    2298:	00112e23          	sw	ra,28(sp)
    229c:	00050993          	mv	s3,a0
    22a0:	00241413          	slli	s0,s0,0x2
    22a4:	a1448493          	addi	s1,s1,-1516 # 5a14 <LEDS+0x14c>
    22a8:	00006937          	lui	s2,0x6
    22ac:	02045063          	bgez	s0,22cc <print_hex_digits+0x50>
    22b0:	01c12083          	lw	ra,28(sp)
    22b4:	01812403          	lw	s0,24(sp)
    22b8:	01412483          	lw	s1,20(sp)
    22bc:	01012903          	lw	s2,16(sp)
    22c0:	00c12983          	lw	s3,12(sp)
    22c4:	02010113          	addi	sp,sp,32
    22c8:	00008067          	ret
    22cc:	0089d7b3          	srl	a5,s3,s0
    22d0:	00f7f793          	andi	a5,a5,15
    22d4:	00f487b3          	add	a5,s1,a5
    22d8:	e7892703          	lw	a4,-392(s2) # 5e78 <f_putchar>
    22dc:	0007c503          	lbu	a0,0(a5)
    22e0:	ffc40413          	addi	s0,s0,-4
    22e4:	000700e7          	jalr	a4
    22e8:	fc5ff06f          	j	22ac <print_hex_digits+0x30>

000022ec <print_hex>:
    22ec:	00800593          	li	a1,8
    22f0:	00000317          	auipc	t1,0x0
    22f4:	f8c30067          	jr	-116(t1) # 227c <print_hex_digits>

000022f8 <printf>:
    22f8:	fa010113          	addi	sp,sp,-96
    22fc:	04f12a23          	sw	a5,84(sp)
    2300:	04410793          	addi	a5,sp,68
    2304:	02812c23          	sw	s0,56(sp)
    2308:	02912a23          	sw	s1,52(sp)
    230c:	03212823          	sw	s2,48(sp)
    2310:	03312623          	sw	s3,44(sp)
    2314:	03412423          	sw	s4,40(sp)
    2318:	03512223          	sw	s5,36(sp)
    231c:	03612023          	sw	s6,32(sp)
    2320:	02112e23          	sw	ra,60(sp)
    2324:	01712e23          	sw	s7,28(sp)
    2328:	00050413          	mv	s0,a0
    232c:	04b12223          	sw	a1,68(sp)
    2330:	04c12423          	sw	a2,72(sp)
    2334:	04d12623          	sw	a3,76(sp)
    2338:	04e12823          	sw	a4,80(sp)
    233c:	05012c23          	sw	a6,88(sp)
    2340:	05112e23          	sw	a7,92(sp)
    2344:	00f12623          	sw	a5,12(sp)
    2348:	02500913          	li	s2,37
    234c:	000064b7          	lui	s1,0x6
    2350:	07300993          	li	s3,115
    2354:	07800a13          	li	s4,120
    2358:	06400a93          	li	s5,100
    235c:	06300b13          	li	s6,99
    2360:	00044503          	lbu	a0,0(s0)
    2364:	02051863          	bnez	a0,2394 <printf+0x9c>
    2368:	03c12083          	lw	ra,60(sp)
    236c:	03812403          	lw	s0,56(sp)
    2370:	03412483          	lw	s1,52(sp)
    2374:	03012903          	lw	s2,48(sp)
    2378:	02c12983          	lw	s3,44(sp)
    237c:	02812a03          	lw	s4,40(sp)
    2380:	02412a83          	lw	s5,36(sp)
    2384:	02012b03          	lw	s6,32(sp)
    2388:	01c12b83          	lw	s7,28(sp)
    238c:	06010113          	addi	sp,sp,96
    2390:	00008067          	ret
    2394:	09251a63          	bne	a0,s2,2428 <printf+0x130>
    2398:	00144503          	lbu	a0,1(s0)
    239c:	00140b93          	addi	s7,s0,1
    23a0:	03351463          	bne	a0,s3,23c8 <printf+0xd0>
    23a4:	00c12783          	lw	a5,12(sp)
    23a8:	0007a503          	lw	a0,0(a5)
    23ac:	00478713          	addi	a4,a5,4
    23b0:	00e12623          	sw	a4,12(sp)
    23b4:	00000097          	auipc	ra,0x0
    23b8:	ddc080e7          	jalr	-548(ra) # 2190 <print_string>
    23bc:	000b8413          	mv	s0,s7
    23c0:	00140413          	addi	s0,s0,1
    23c4:	f9dff06f          	j	2360 <printf+0x68>
    23c8:	03451063          	bne	a0,s4,23e8 <printf+0xf0>
    23cc:	00c12783          	lw	a5,12(sp)
    23d0:	0007a503          	lw	a0,0(a5)
    23d4:	00478713          	addi	a4,a5,4
    23d8:	00e12623          	sw	a4,12(sp)
    23dc:	00000097          	auipc	ra,0x0
    23e0:	f10080e7          	jalr	-240(ra) # 22ec <print_hex>
    23e4:	fd9ff06f          	j	23bc <printf+0xc4>
    23e8:	03551063          	bne	a0,s5,2408 <printf+0x110>
    23ec:	00c12783          	lw	a5,12(sp)
    23f0:	0007a503          	lw	a0,0(a5)
    23f4:	00478713          	addi	a4,a5,4
    23f8:	00e12623          	sw	a4,12(sp)
    23fc:	00000097          	auipc	ra,0x0
    2400:	dd8080e7          	jalr	-552(ra) # 21d4 <print_dec>
    2404:	fb9ff06f          	j	23bc <printf+0xc4>
    2408:	e784a783          	lw	a5,-392(s1) # 5e78 <f_putchar>
    240c:	01651a63          	bne	a0,s6,2420 <printf+0x128>
    2410:	00c12703          	lw	a4,12(sp)
    2414:	00072503          	lw	a0,0(a4)
    2418:	00470693          	addi	a3,a4,4
    241c:	00d12623          	sw	a3,12(sp)
    2420:	000780e7          	jalr	a5
    2424:	f99ff06f          	j	23bc <printf+0xc4>
    2428:	e784a783          	lw	a5,-392(s1)
    242c:	000780e7          	jalr	a5
    2430:	f91ff06f          	j	23c0 <printf+0xc8>

00002434 <__mulsi3>:
    2434:	00050793          	mv	a5,a0
    2438:	00000513          	li	a0,0
    243c:	00079463          	bnez	a5,2444 <__mulsi3+0x10>
    2440:	00008067          	ret
    2444:	01f79693          	slli	a3,a5,0x1f
    2448:	41f6d713          	srai	a4,a3,0x1f
    244c:	00b77733          	and	a4,a4,a1
    2450:	00e50533          	add	a0,a0,a4
    2454:	0017d793          	srli	a5,a5,0x1
    2458:	00159593          	slli	a1,a1,0x1
    245c:	fe1ff06f          	j	243c <__mulsi3+0x8>

00002460 <fat_list_insert_last>:
    2460:	00452783          	lw	a5,4(a0)
    2464:	04079263          	bnez	a5,24a8 <fat_list_insert_last+0x48>
    2468:	00052783          	lw	a5,0(a0)
    246c:	00079c63          	bnez	a5,2484 <fat_list_insert_last+0x24>
    2470:	00b52023          	sw	a1,0(a0)
    2474:	00b52223          	sw	a1,4(a0)
    2478:	0005a023          	sw	zero,0(a1)
    247c:	0005a223          	sw	zero,4(a1)
    2480:	00008067          	ret
    2484:	0007a703          	lw	a4,0(a5)
    2488:	00f5a223          	sw	a5,4(a1)
    248c:	00e5a023          	sw	a4,0(a1)
    2490:	00071863          	bnez	a4,24a0 <fat_list_insert_last+0x40>
    2494:	00b52023          	sw	a1,0(a0)
    2498:	00b7a023          	sw	a1,0(a5)
    249c:	00008067          	ret
    24a0:	00b72223          	sw	a1,4(a4)
    24a4:	ff5ff06f          	j	2498 <fat_list_insert_last+0x38>
    24a8:	0047a703          	lw	a4,4(a5)
    24ac:	00f5a023          	sw	a5,0(a1)
    24b0:	00e5a223          	sw	a4,4(a1)
    24b4:	00071863          	bnez	a4,24c4 <fat_list_insert_last+0x64>
    24b8:	00b52223          	sw	a1,4(a0)
    24bc:	00b7a223          	sw	a1,4(a5)
    24c0:	00008067          	ret
    24c4:	00b72023          	sw	a1,0(a4)
    24c8:	ff5ff06f          	j	24bc <fat_list_insert_last+0x5c>

000024cc <FileString_StrCmpNoCase>:
    24cc:	00050e93          	mv	t4,a0
    24d0:	00000793          	li	a5,0
    24d4:	01900e13          	li	t3,25
    24d8:	00c79663          	bne	a5,a2,24e4 <FileString_StrCmpNoCase+0x18>
    24dc:	00000513          	li	a0,0
    24e0:	00008067          	ret
    24e4:	00fe8733          	add	a4,t4,a5
    24e8:	00074803          	lbu	a6,0(a4)
    24ec:	00f58733          	add	a4,a1,a5
    24f0:	00074883          	lbu	a7,0(a4)
    24f4:	fbf80713          	addi	a4,a6,-65
    24f8:	0ff77713          	zext.b	a4,a4
    24fc:	00080693          	mv	a3,a6
    2500:	00ee6663          	bltu	t3,a4,250c <FileString_StrCmpNoCase+0x40>
    2504:	02080693          	addi	a3,a6,32
    2508:	0ff6f693          	zext.b	a3,a3
    250c:	fbf88313          	addi	t1,a7,-65
    2510:	0ff37313          	zext.b	t1,t1
    2514:	00088713          	mv	a4,a7
    2518:	006e6663          	bltu	t3,t1,2524 <FileString_StrCmpNoCase+0x58>
    251c:	02088713          	addi	a4,a7,32
    2520:	0ff77713          	zext.b	a4,a4
    2524:	40e68533          	sub	a0,a3,a4
    2528:	00e69863          	bne	a3,a4,2538 <FileString_StrCmpNoCase+0x6c>
    252c:	00178793          	addi	a5,a5,1
    2530:	00088463          	beqz	a7,2538 <FileString_StrCmpNoCase+0x6c>
    2534:	fa0812e3          	bnez	a6,24d8 <FileString_StrCmpNoCase+0xc>
    2538:	00008067          	ret

0000253c <FileString_GetExtension>:
    253c:	00050793          	mv	a5,a0
    2540:	fff00713          	li	a4,-1
    2544:	02e00613          	li	a2,46
    2548:	0007c683          	lbu	a3,0(a5)
    254c:	00069663          	bnez	a3,2558 <FileString_GetExtension+0x1c>
    2550:	00070513          	mv	a0,a4
    2554:	00008067          	ret
    2558:	00c69463          	bne	a3,a2,2560 <FileString_GetExtension+0x24>
    255c:	40a78733          	sub	a4,a5,a0
    2560:	00178793          	addi	a5,a5,1
    2564:	fe5ff06f          	j	2548 <FileString_GetExtension+0xc>

00002568 <fatfs_fat_writeback>:
    2568:	00059e63          	bnez	a1,2584 <fatfs_fat_writeback+0x1c>
    256c:	00000513          	li	a0,0
    2570:	00008067          	ret
    2574:	00000513          	li	a0,0
    2578:	01c12083          	lw	ra,28(sp)
    257c:	02010113          	addi	sp,sp,32
    2580:	00008067          	ret
    2584:	2045a783          	lw	a5,516(a1)
    2588:	04078e63          	beqz	a5,25e4 <fatfs_fat_writeback+0x7c>
    258c:	03852683          	lw	a3,56(a0)
    2590:	00050793          	mv	a5,a0
    2594:	04068663          	beqz	a3,25e0 <fatfs_fat_writeback+0x78>
    2598:	0147a703          	lw	a4,20(a5)
    259c:	2005a503          	lw	a0,512(a1)
    25a0:	0207a803          	lw	a6,32(a5)
    25a4:	00100613          	li	a2,1
    25a8:	fe010113          	addi	sp,sp,-32
    25ac:	40e607b3          	sub	a5,a2,a4
    25b0:	00112e23          	sw	ra,28(sp)
    25b4:	00a787b3          	add	a5,a5,a0
    25b8:	00f87663          	bgeu	a6,a5,25c4 <fatfs_fat_writeback+0x5c>
    25bc:	01070733          	add	a4,a4,a6
    25c0:	40a70633          	sub	a2,a4,a0
    25c4:	00b12623          	sw	a1,12(sp)
    25c8:	000680e7          	jalr	a3
    25cc:	fa0504e3          	beqz	a0,2574 <fatfs_fat_writeback+0xc>
    25d0:	00c12583          	lw	a1,12(sp)
    25d4:	00100513          	li	a0,1
    25d8:	2005a223          	sw	zero,516(a1)
    25dc:	f9dff06f          	j	2578 <fatfs_fat_writeback+0x10>
    25e0:	2005a223          	sw	zero,516(a1)
    25e4:	00100513          	li	a0,1
    25e8:	00008067          	ret

000025ec <fatfs_fat_read_sector>:
    25ec:	fe010113          	addi	sp,sp,-32
    25f0:	01212823          	sw	s2,16(sp)
    25f4:	25452903          	lw	s2,596(a0)
    25f8:	00812c23          	sw	s0,24(sp)
    25fc:	00112e23          	sw	ra,28(sp)
    2600:	00912a23          	sw	s1,20(sp)
    2604:	01312623          	sw	s3,12(sp)
    2608:	00000413          	li	s0,0
    260c:	04091463          	bnez	s2,2654 <fatfs_fat_read_sector+0x68>
    2610:	25452783          	lw	a5,596(a0)
    2614:	00058493          	mv	s1,a1
    2618:	00050993          	mv	s3,a0
    261c:	20f42623          	sw	a5,524(s0)
    2620:	20442783          	lw	a5,516(s0)
    2624:	24852a23          	sw	s0,596(a0)
    2628:	08079863          	bnez	a5,26b8 <fatfs_fat_read_sector+0xcc>
    262c:	0349a783          	lw	a5,52(s3)
    2630:	20942023          	sw	s1,512(s0)
    2634:	00100613          	li	a2,1
    2638:	00040593          	mv	a1,s0
    263c:	00048513          	mv	a0,s1
    2640:	000780e7          	jalr	a5
    2644:	08051463          	bnez	a0,26cc <fatfs_fat_read_sector+0xe0>
    2648:	fff00793          	li	a5,-1
    264c:	20f42023          	sw	a5,512(s0)
    2650:	0480006f          	j	2698 <fatfs_fat_read_sector+0xac>
    2654:	20092783          	lw	a5,512(s2)
    2658:	00f5e663          	bltu	a1,a5,2664 <fatfs_fat_read_sector+0x78>
    265c:	00178713          	addi	a4,a5,1
    2660:	02e5e463          	bltu	a1,a4,2688 <fatfs_fat_read_sector+0x9c>
    2664:	20c92783          	lw	a5,524(s2)
    2668:	00079663          	bnez	a5,2674 <fatfs_fat_read_sector+0x88>
    266c:	00040a63          	beqz	s0,2680 <fatfs_fat_read_sector+0x94>
    2670:	20042623          	sw	zero,524(s0)
    2674:	00090413          	mv	s0,s2
    2678:	20c92903          	lw	s2,524(s2)
    267c:	f91ff06f          	j	260c <fatfs_fat_read_sector+0x20>
    2680:	24052a23          	sw	zero,596(a0)
    2684:	ff1ff06f          	j	2674 <fatfs_fat_read_sector+0x88>
    2688:	40f585b3          	sub	a1,a1,a5
    268c:	00959593          	slli	a1,a1,0x9
    2690:	00b905b3          	add	a1,s2,a1
    2694:	20b92423          	sw	a1,520(s2)
    2698:	01c12083          	lw	ra,28(sp)
    269c:	01812403          	lw	s0,24(sp)
    26a0:	01412483          	lw	s1,20(sp)
    26a4:	00c12983          	lw	s3,12(sp)
    26a8:	00090513          	mv	a0,s2
    26ac:	01012903          	lw	s2,16(sp)
    26b0:	02010113          	addi	sp,sp,32
    26b4:	00008067          	ret
    26b8:	00040593          	mv	a1,s0
    26bc:	00000097          	auipc	ra,0x0
    26c0:	eac080e7          	jalr	-340(ra) # 2568 <fatfs_fat_writeback>
    26c4:	f60514e3          	bnez	a0,262c <fatfs_fat_read_sector+0x40>
    26c8:	fd1ff06f          	j	2698 <fatfs_fat_read_sector+0xac>
    26cc:	20842423          	sw	s0,520(s0)
    26d0:	00040913          	mv	s2,s0
    26d4:	fc5ff06f          	j	2698 <fatfs_fat_read_sector+0xac>

000026d8 <_allocate_file>:
    26d8:	000067b7          	lui	a5,0x6
    26dc:	e7c78793          	addi	a5,a5,-388 # 5e7c <_free_file_list>
    26e0:	0007a583          	lw	a1,0(a5)
    26e4:	06058263          	beqz	a1,2748 <_allocate_file+0x70>
    26e8:	0005a703          	lw	a4,0(a1)
    26ec:	fe010113          	addi	sp,sp,-32
    26f0:	00112e23          	sw	ra,28(sp)
    26f4:	0045a683          	lw	a3,4(a1)
    26f8:	04071063          	bnez	a4,2738 <_allocate_file+0x60>
    26fc:	00d7a023          	sw	a3,0(a5)
    2700:	0045a683          	lw	a3,4(a1)
    2704:	02069e63          	bnez	a3,2740 <_allocate_file+0x68>
    2708:	00e7a223          	sw	a4,4(a5)
    270c:	00006537          	lui	a0,0x6
    2710:	e8450513          	addi	a0,a0,-380 # 5e84 <_open_file_list>
    2714:	00b12623          	sw	a1,12(sp)
    2718:	00000097          	auipc	ra,0x0
    271c:	d48080e7          	jalr	-696(ra) # 2460 <fat_list_insert_last>
    2720:	00c12583          	lw	a1,12(sp)
    2724:	01c12083          	lw	ra,28(sp)
    2728:	bc458593          	addi	a1,a1,-1084
    272c:	00058513          	mv	a0,a1
    2730:	02010113          	addi	sp,sp,32
    2734:	00008067          	ret
    2738:	00d72223          	sw	a3,4(a4)
    273c:	fc5ff06f          	j	2700 <_allocate_file+0x28>
    2740:	00e6a023          	sw	a4,0(a3)
    2744:	fc9ff06f          	j	270c <_allocate_file+0x34>
    2748:	00058513          	mv	a0,a1
    274c:	00008067          	ret

00002750 <_free_file>:
    2750:	43c52783          	lw	a5,1084(a0)
    2754:	44052703          	lw	a4,1088(a0)
    2758:	43c50593          	addi	a1,a0,1084
    275c:	02079663          	bnez	a5,2788 <_free_file+0x38>
    2760:	000066b7          	lui	a3,0x6
    2764:	e8e6a223          	sw	a4,-380(a3) # 5e84 <_open_file_list>
    2768:	44052703          	lw	a4,1088(a0)
    276c:	02071263          	bnez	a4,2790 <_free_file+0x40>
    2770:	00006737          	lui	a4,0x6
    2774:	e8f72423          	sw	a5,-376(a4) # 5e88 <_open_file_list+0x4>
    2778:	00006537          	lui	a0,0x6
    277c:	e7c50513          	addi	a0,a0,-388 # 5e7c <_free_file_list>
    2780:	00000317          	auipc	t1,0x0
    2784:	ce030067          	jr	-800(t1) # 2460 <fat_list_insert_last>
    2788:	00e7a223          	sw	a4,4(a5)
    278c:	fddff06f          	j	2768 <_free_file+0x18>
    2790:	00f72023          	sw	a5,0(a4)
    2794:	fe5ff06f          	j	2778 <_free_file+0x28>

00002798 <fatfs_lba_of_cluster>:
    2798:	ff010113          	addi	sp,sp,-16
    279c:	00812423          	sw	s0,8(sp)
    27a0:	00112623          	sw	ra,12(sp)
    27a4:	00050413          	mv	s0,a0
    27a8:	ffe58513          	addi	a0,a1,-2
    27ac:	00044583          	lbu	a1,0(s0)
    27b0:	00000097          	auipc	ra,0x0
    27b4:	c84080e7          	jalr	-892(ra) # 2434 <__mulsi3>
    27b8:	00442783          	lw	a5,4(s0)
    27bc:	00f50533          	add	a0,a0,a5
    27c0:	03042783          	lw	a5,48(s0)
    27c4:	00079863          	bnez	a5,27d4 <fatfs_lba_of_cluster+0x3c>
    27c8:	02845783          	lhu	a5,40(s0)
    27cc:	4047d793          	srai	a5,a5,0x4
    27d0:	00f50533          	add	a0,a0,a5
    27d4:	00c12083          	lw	ra,12(sp)
    27d8:	00812403          	lw	s0,8(sp)
    27dc:	01010113          	addi	sp,sp,16
    27e0:	00008067          	ret

000027e4 <fatfs_sector_read>:
    27e4:	03452783          	lw	a5,52(a0)
    27e8:	00058713          	mv	a4,a1
    27ec:	00070513          	mv	a0,a4
    27f0:	00060593          	mv	a1,a2
    27f4:	00068613          	mv	a2,a3
    27f8:	00078067          	jr	a5

000027fc <fatfs_sector_write>:
    27fc:	03852783          	lw	a5,56(a0)
    2800:	00058713          	mv	a4,a1
    2804:	00070513          	mv	a0,a4
    2808:	00060593          	mv	a1,a2
    280c:	00068613          	mv	a2,a3
    2810:	00078067          	jr	a5

00002814 <fatfs_write_sector>:
    2814:	03852703          	lw	a4,56(a0)
    2818:	0a070463          	beqz	a4,28c0 <fatfs_write_sector+0xac>
    281c:	03052883          	lw	a7,48(a0)
    2820:	00050793          	mv	a5,a0
    2824:	0115e833          	or	a6,a1,a7
    2828:	02081e63          	bnez	a6,2864 <fatfs_write_sector+0x50>
    282c:	01052583          	lw	a1,16(a0)
    2830:	08b67863          	bgeu	a2,a1,28c0 <fatfs_write_sector+0xac>
    2834:	01c52503          	lw	a0,28(a0)
    2838:	00c7a583          	lw	a1,12(a5)
    283c:	00b50533          	add	a0,a0,a1
    2840:	00c50533          	add	a0,a0,a2
    2844:	00068863          	beqz	a3,2854 <fatfs_write_sector+0x40>
    2848:	00100613          	li	a2,1
    284c:	00068593          	mv	a1,a3
    2850:	00070067          	jr	a4
    2854:	24a7a223          	sw	a0,580(a5)
    2858:	00100613          	li	a2,1
    285c:	04478593          	addi	a1,a5,68
    2860:	ff1ff06f          	j	2850 <fatfs_write_sector+0x3c>
    2864:	fe010113          	addi	sp,sp,-32
    2868:	00e12623          	sw	a4,12(sp)
    286c:	00d12423          	sw	a3,8(sp)
    2870:	00c12223          	sw	a2,4(sp)
    2874:	00112e23          	sw	ra,28(sp)
    2878:	00a12023          	sw	a0,0(sp)
    287c:	00000097          	auipc	ra,0x0
    2880:	f1c080e7          	jalr	-228(ra) # 2798 <fatfs_lba_of_cluster>
    2884:	00412603          	lw	a2,4(sp)
    2888:	00812683          	lw	a3,8(sp)
    288c:	00012783          	lw	a5,0(sp)
    2890:	00c12703          	lw	a4,12(sp)
    2894:	00a60533          	add	a0,a2,a0
    2898:	00068c63          	beqz	a3,28b0 <fatfs_write_sector+0x9c>
    289c:	00100613          	li	a2,1
    28a0:	00068593          	mv	a1,a3
    28a4:	01c12083          	lw	ra,28(sp)
    28a8:	02010113          	addi	sp,sp,32
    28ac:	fa5ff06f          	j	2850 <fatfs_write_sector+0x3c>
    28b0:	24a7a223          	sw	a0,580(a5)
    28b4:	00100613          	li	a2,1
    28b8:	04478593          	addi	a1,a5,68
    28bc:	fe9ff06f          	j	28a4 <fatfs_write_sector+0x90>
    28c0:	00000513          	li	a0,0
    28c4:	00008067          	ret

000028c8 <fl_init>:
    28c8:	ff010113          	addi	sp,sp,-16
    28cc:	00006537          	lui	a0,0x6
    28d0:	000067b7          	lui	a5,0x6
    28d4:	000085b7          	lui	a1,0x8
    28d8:	00112623          	sw	ra,12(sp)
    28dc:	e7c50513          	addi	a0,a0,-388 # 5e7c <_free_file_list>
    28e0:	e8478793          	addi	a5,a5,-380 # 5e84 <_open_file_list>
    28e4:	35458593          	addi	a1,a1,852 # 8354 <_files+0x43c>
    28e8:	00052223          	sw	zero,4(a0)
    28ec:	00052023          	sw	zero,0(a0)
    28f0:	0007a223          	sw	zero,4(a5)
    28f4:	0007a023          	sw	zero,0(a5)
    28f8:	00000097          	auipc	ra,0x0
    28fc:	b68080e7          	jalr	-1176(ra) # 2460 <fat_list_insert_last>
    2900:	000067b7          	lui	a5,0x6
    2904:	000085b7          	lui	a1,0x8
    2908:	e7c78513          	addi	a0,a5,-388 # 5e7c <_free_file_list>
    290c:	79858593          	addi	a1,a1,1944 # 8798 <_files+0x880>
    2910:	00000097          	auipc	ra,0x0
    2914:	b50080e7          	jalr	-1200(ra) # 2460 <fat_list_insert_last>
    2918:	00c12083          	lw	ra,12(sp)
    291c:	000067b7          	lui	a5,0x6
    2920:	00100713          	li	a4,1
    2924:	e8e7a823          	sw	a4,-368(a5) # 5e90 <_filelib_init>
    2928:	01010113          	addi	sp,sp,16
    292c:	00008067          	ret

00002930 <fl_fseek>:
    2930:	000067b7          	lui	a5,0x6
    2934:	e907a783          	lw	a5,-368(a5) # 5e90 <_filelib_init>
    2938:	fd010113          	addi	sp,sp,-48
    293c:	02812423          	sw	s0,40(sp)
    2940:	02912223          	sw	s1,36(sp)
    2944:	01312e23          	sw	s3,28(sp)
    2948:	02112623          	sw	ra,44(sp)
    294c:	03212023          	sw	s2,32(sp)
    2950:	00050413          	mv	s0,a0
    2954:	00058493          	mv	s1,a1
    2958:	00060993          	mv	s3,a2
    295c:	00079663          	bnez	a5,2968 <fl_fseek+0x38>
    2960:	00000097          	auipc	ra,0x0
    2964:	f68080e7          	jalr	-152(ra) # 28c8 <fl_init>
    2968:	fff00513          	li	a0,-1
    296c:	08040263          	beqz	s0,29f0 <fl_fseek+0xc0>
    2970:	00048663          	beqz	s1,297c <fl_fseek+0x4c>
    2974:	ffe98793          	addi	a5,s3,-2
    2978:	06078c63          	beqz	a5,29f0 <fl_fseek+0xc0>
    297c:	00008937          	lui	s2,0x8
    2980:	ab090913          	addi	s2,s2,-1360 # 7ab0 <_fs>
    2984:	03c92783          	lw	a5,60(s2)
    2988:	00078463          	beqz	a5,2990 <fl_fseek+0x60>
    298c:	000780e7          	jalr	a5
    2990:	fff00513          	li	a0,-1
    2994:	42a42823          	sw	a0,1072(s0)
    2998:	42042a23          	sw	zero,1076(s0)
    299c:	00099c63          	bnez	s3,29b4 <fl_fseek+0x84>
    29a0:	00c42783          	lw	a5,12(s0)
    29a4:	00942423          	sw	s1,8(s0)
    29a8:	0297f863          	bgeu	a5,s1,29d8 <fl_fseek+0xa8>
    29ac:	00f42423          	sw	a5,8(s0)
    29b0:	0280006f          	j	29d8 <fl_fseek+0xa8>
    29b4:	00100793          	li	a5,1
    29b8:	06f99063          	bne	s3,a5,2a18 <fl_fseek+0xe8>
    29bc:	00842783          	lw	a5,8(s0)
    29c0:	0004c663          	bltz	s1,29cc <fl_fseek+0x9c>
    29c4:	00f484b3          	add	s1,s1,a5
    29c8:	fd9ff06f          	j	29a0 <fl_fseek+0x70>
    29cc:	40900733          	neg	a4,s1
    29d0:	02e7fe63          	bgeu	a5,a4,2a0c <fl_fseek+0xdc>
    29d4:	00042423          	sw	zero,8(s0)
    29d8:	00000513          	li	a0,0
    29dc:	04092783          	lw	a5,64(s2)
    29e0:	00078863          	beqz	a5,29f0 <fl_fseek+0xc0>
    29e4:	00a12623          	sw	a0,12(sp)
    29e8:	000780e7          	jalr	a5
    29ec:	00c12503          	lw	a0,12(sp)
    29f0:	02c12083          	lw	ra,44(sp)
    29f4:	02812403          	lw	s0,40(sp)
    29f8:	02412483          	lw	s1,36(sp)
    29fc:	02012903          	lw	s2,32(sp)
    2a00:	01c12983          	lw	s3,28(sp)
    2a04:	03010113          	addi	sp,sp,48
    2a08:	00008067          	ret
    2a0c:	00f484b3          	add	s1,s1,a5
    2a10:	00942423          	sw	s1,8(s0)
    2a14:	fc5ff06f          	j	29d8 <fl_fseek+0xa8>
    2a18:	00200793          	li	a5,2
    2a1c:	fcf990e3          	bne	s3,a5,29dc <fl_fseek+0xac>
    2a20:	00c42783          	lw	a5,12(s0)
    2a24:	f89ff06f          	j	29ac <fl_fseek+0x7c>

00002a28 <fl_closedir>:
    2a28:	00000513          	li	a0,0
    2a2c:	00008067          	ret

00002a30 <fatfs_lfn_cache_entry>:
    2a30:	0005c783          	lbu	a5,0(a1)
    2a34:	01300693          	li	a3,19
    2a38:	01f7f793          	andi	a5,a5,31
    2a3c:	fff78713          	addi	a4,a5,-1
    2a40:	0ff77613          	zext.b	a2,a4
    2a44:	0ac6ea63          	bltu	a3,a2,2af8 <fatfs_lfn_cache_entry+0xc8>
    2a48:	10554683          	lbu	a3,261(a0)
    2a4c:	00069463          	bnez	a3,2a54 <fatfs_lfn_cache_entry+0x24>
    2a50:	10f502a3          	sb	a5,261(a0)
    2a54:	00171793          	slli	a5,a4,0x1
    2a58:	00e787b3          	add	a5,a5,a4
    2a5c:	0015c683          	lbu	a3,1(a1)
    2a60:	00279793          	slli	a5,a5,0x2
    2a64:	00e787b3          	add	a5,a5,a4
    2a68:	00f50533          	add	a0,a0,a5
    2a6c:	00d50023          	sb	a3,0(a0)
    2a70:	0035c783          	lbu	a5,3(a1)
    2a74:	0ff00713          	li	a4,255
    2a78:	02000693          	li	a3,32
    2a7c:	00f500a3          	sb	a5,1(a0)
    2a80:	0055c783          	lbu	a5,5(a1)
    2a84:	00f50123          	sb	a5,2(a0)
    2a88:	0075c783          	lbu	a5,7(a1)
    2a8c:	00f501a3          	sb	a5,3(a0)
    2a90:	0095c783          	lbu	a5,9(a1)
    2a94:	00f50223          	sb	a5,4(a0)
    2a98:	00e5c783          	lbu	a5,14(a1)
    2a9c:	00f502a3          	sb	a5,5(a0)
    2aa0:	0105c783          	lbu	a5,16(a1)
    2aa4:	00f50323          	sb	a5,6(a0)
    2aa8:	0125c783          	lbu	a5,18(a1)
    2aac:	00f503a3          	sb	a5,7(a0)
    2ab0:	0145c783          	lbu	a5,20(a1)
    2ab4:	00f50423          	sb	a5,8(a0)
    2ab8:	0165c783          	lbu	a5,22(a1)
    2abc:	00f504a3          	sb	a5,9(a0)
    2ac0:	0185c783          	lbu	a5,24(a1)
    2ac4:	00f50523          	sb	a5,10(a0)
    2ac8:	01c5c783          	lbu	a5,28(a1)
    2acc:	00f505a3          	sb	a5,11(a0)
    2ad0:	01e5c783          	lbu	a5,30(a1)
    2ad4:	00f50623          	sb	a5,12(a0)
    2ad8:	00d00793          	li	a5,13
    2adc:	00054603          	lbu	a2,0(a0)
    2ae0:	00e61463          	bne	a2,a4,2ae8 <fatfs_lfn_cache_entry+0xb8>
    2ae4:	00d50023          	sb	a3,0(a0)
    2ae8:	fff78793          	addi	a5,a5,-1
    2aec:	0ff7f793          	zext.b	a5,a5
    2af0:	00150513          	addi	a0,a0,1
    2af4:	fe0794e3          	bnez	a5,2adc <fatfs_lfn_cache_entry+0xac>
    2af8:	00008067          	ret

00002afc <fatfs_lfn_cache_get>:
    2afc:	10554703          	lbu	a4,261(a0)
    2b00:	01400793          	li	a5,20
    2b04:	00f71663          	bne	a4,a5,2b10 <fatfs_lfn_cache_get+0x14>
    2b08:	10050223          	sb	zero,260(a0)
    2b0c:	00008067          	ret
    2b10:	02070063          	beqz	a4,2b30 <fatfs_lfn_cache_get+0x34>
    2b14:	00171793          	slli	a5,a4,0x1
    2b18:	00e787b3          	add	a5,a5,a4
    2b1c:	00279793          	slli	a5,a5,0x2
    2b20:	00e787b3          	add	a5,a5,a4
    2b24:	00f507b3          	add	a5,a0,a5
    2b28:	00078023          	sb	zero,0(a5)
    2b2c:	00008067          	ret
    2b30:	00050023          	sb	zero,0(a0)
    2b34:	00008067          	ret

00002b38 <fatfs_entry_lfn_text>:
    2b38:	00b54503          	lbu	a0,11(a0)
    2b3c:	00f57513          	andi	a0,a0,15
    2b40:	ff150513          	addi	a0,a0,-15
    2b44:	00153513          	seqz	a0,a0
    2b48:	00008067          	ret

00002b4c <fatfs_entry_lfn_invalid>:
    2b4c:	00054783          	lbu	a5,0(a0)
    2b50:	f1b78713          	addi	a4,a5,-229
    2b54:	02070263          	beqz	a4,2b78 <fatfs_entry_lfn_invalid+0x2c>
    2b58:	02078063          	beqz	a5,2b78 <fatfs_entry_lfn_invalid+0x2c>
    2b5c:	00b54783          	lbu	a5,11(a0)
    2b60:	00800713          	li	a4,8
    2b64:	00100513          	li	a0,1
    2b68:	00e78a63          	beq	a5,a4,2b7c <fatfs_entry_lfn_invalid+0x30>
    2b6c:	0067f793          	andi	a5,a5,6
    2b70:	00f03533          	snez	a0,a5
    2b74:	00008067          	ret
    2b78:	00100513          	li	a0,1
    2b7c:	00008067          	ret

00002b80 <fatfs_entry_lfn_exists>:
    2b80:	00b5c783          	lbu	a5,11(a1)
    2b84:	00f00713          	li	a4,15
    2b88:	04e78063          	beq	a5,a4,2bc8 <fatfs_entry_lfn_exists+0x48>
    2b8c:	0005c683          	lbu	a3,0(a1)
    2b90:	f1b68713          	addi	a4,a3,-229
    2b94:	00e03733          	snez	a4,a4
    2b98:	00d036b3          	snez	a3,a3
    2b9c:	00d77733          	and	a4,a4,a3
    2ba0:	02070463          	beqz	a4,2bc8 <fatfs_entry_lfn_exists+0x48>
    2ba4:	ff878713          	addi	a4,a5,-8
    2ba8:	02070063          	beqz	a4,2bc8 <fatfs_entry_lfn_exists+0x48>
    2bac:	0067f713          	andi	a4,a5,6
    2bb0:	00000793          	li	a5,0
    2bb4:	00071663          	bnez	a4,2bc0 <fatfs_entry_lfn_exists+0x40>
    2bb8:	10554783          	lbu	a5,261(a0)
    2bbc:	00f037b3          	snez	a5,a5
    2bc0:	00078513          	mv	a0,a5
    2bc4:	00008067          	ret
    2bc8:	00000793          	li	a5,0
    2bcc:	ff5ff06f          	j	2bc0 <fatfs_entry_lfn_exists+0x40>

00002bd0 <fatfs_entry_sfn_only>:
    2bd0:	00b54783          	lbu	a5,11(a0)
    2bd4:	00f00713          	li	a4,15
    2bd8:	02e78863          	beq	a5,a4,2c08 <fatfs_entry_sfn_only+0x38>
    2bdc:	00054683          	lbu	a3,0(a0)
    2be0:	f1b68713          	addi	a4,a3,-229
    2be4:	00e03733          	snez	a4,a4
    2be8:	00d036b3          	snez	a3,a3
    2bec:	00d77733          	and	a4,a4,a3
    2bf0:	00070c63          	beqz	a4,2c08 <fatfs_entry_sfn_only+0x38>
    2bf4:	ff878713          	addi	a4,a5,-8
    2bf8:	00070863          	beqz	a4,2c08 <fatfs_entry_sfn_only+0x38>
    2bfc:	0067f513          	andi	a0,a5,6
    2c00:	00153513          	seqz	a0,a0
    2c04:	00008067          	ret
    2c08:	00000513          	li	a0,0
    2c0c:	00008067          	ret

00002c10 <fatfs_entry_is_dir>:
    2c10:	00b54503          	lbu	a0,11(a0)
    2c14:	00455513          	srli	a0,a0,0x4
    2c18:	00157513          	andi	a0,a0,1
    2c1c:	00008067          	ret

00002c20 <fatfs_lfn_entries_required>:
    2c20:	ff010113          	addi	sp,sp,-16
    2c24:	00112623          	sw	ra,12(sp)
    2c28:	fffff097          	auipc	ra,0xfffff
    2c2c:	0dc080e7          	jalr	220(ra) # 1d04 <strlen>
    2c30:	00050a63          	beqz	a0,2c44 <fatfs_lfn_entries_required+0x24>
    2c34:	00d00593          	li	a1,13
    2c38:	00c50513          	addi	a0,a0,12
    2c3c:	fffff097          	auipc	ra,0xfffff
    2c40:	fd4080e7          	jalr	-44(ra) # 1c10 <__divsi3>
    2c44:	00c12083          	lw	ra,12(sp)
    2c48:	01010113          	addi	sp,sp,16
    2c4c:	00008067          	ret

00002c50 <fatfs_filename_to_lfn>:
    2c50:	f9010113          	addi	sp,sp,-112
    2c54:	06812423          	sw	s0,104(sp)
    2c58:	00058413          	mv	s0,a1
    2c5c:	000065b7          	lui	a1,0x6
    2c60:	c3c58593          	addi	a1,a1,-964 # 5c3c <font+0x1e0>
    2c64:	06912223          	sw	s1,100(sp)
    2c68:	05312e23          	sw	s3,92(sp)
    2c6c:	00060493          	mv	s1,a2
    2c70:	00050993          	mv	s3,a0
    2c74:	03400613          	li	a2,52
    2c78:	01c10513          	addi	a0,sp,28
    2c7c:	00d12623          	sw	a3,12(sp)
    2c80:	06112623          	sw	ra,108(sp)
    2c84:	07212023          	sw	s2,96(sp)
    2c88:	05412c23          	sw	s4,88(sp)
    2c8c:	fffff097          	auipc	ra,0xfffff
    2c90:	054080e7          	jalr	84(ra) # 1ce0 <memcpy>
    2c94:	00098513          	mv	a0,s3
    2c98:	fffff097          	auipc	ra,0xfffff
    2c9c:	06c080e7          	jalr	108(ra) # 1d04 <strlen>
    2ca0:	00050913          	mv	s2,a0
    2ca4:	00098513          	mv	a0,s3
    2ca8:	00000097          	auipc	ra,0x0
    2cac:	f78080e7          	jalr	-136(ra) # 2c20 <fatfs_lfn_entries_required>
    2cb0:	00050a13          	mv	s4,a0
    2cb4:	02000613          	li	a2,32
    2cb8:	00000593          	li	a1,0
    2cbc:	00040513          	mv	a0,s0
    2cc0:	fffff097          	auipc	ra,0xfffff
    2cc4:	004080e7          	jalr	4(ra) # 1cc4 <memset>
    2cc8:	fffa0713          	addi	a4,s4,-1
    2ccc:	00c12683          	lw	a3,12(sp)
    2cd0:	00148793          	addi	a5,s1,1
    2cd4:	00971463          	bne	a4,s1,2cdc <fatfs_filename_to_lfn+0x8c>
    2cd8:	0407e793          	ori	a5,a5,64
    2cdc:	00149613          	slli	a2,s1,0x1
    2ce0:	00960633          	add	a2,a2,s1
    2ce4:	00f40023          	sb	a5,0(s0)
    2ce8:	00261613          	slli	a2,a2,0x2
    2cec:	00f00793          	li	a5,15
    2cf0:	00f405a3          	sb	a5,11(s0)
    2cf4:	00d406a3          	sb	a3,13(s0)
    2cf8:	01c10793          	addi	a5,sp,28
    2cfc:	00960633          	add	a2,a2,s1
    2d00:	fff00693          	li	a3,-1
    2d04:	0007a703          	lw	a4,0(a5)
    2d08:	00e40733          	add	a4,s0,a4
    2d0c:	05265063          	bge	a2,s2,2d4c <fatfs_filename_to_lfn+0xfc>
    2d10:	00c985b3          	add	a1,s3,a2
    2d14:	0005c583          	lbu	a1,0(a1)
    2d18:	00b70023          	sb	a1,0(a4)
    2d1c:	00478793          	addi	a5,a5,4
    2d20:	05010713          	addi	a4,sp,80
    2d24:	00160613          	addi	a2,a2,1
    2d28:	fce79ee3          	bne	a5,a4,2d04 <fatfs_filename_to_lfn+0xb4>
    2d2c:	06c12083          	lw	ra,108(sp)
    2d30:	06812403          	lw	s0,104(sp)
    2d34:	06412483          	lw	s1,100(sp)
    2d38:	06012903          	lw	s2,96(sp)
    2d3c:	05c12983          	lw	s3,92(sp)
    2d40:	05812a03          	lw	s4,88(sp)
    2d44:	07010113          	addi	sp,sp,112
    2d48:	00008067          	ret
    2d4c:	01261663          	bne	a2,s2,2d58 <fatfs_filename_to_lfn+0x108>
    2d50:	00070023          	sb	zero,0(a4)
    2d54:	fc9ff06f          	j	2d1c <fatfs_filename_to_lfn+0xcc>
    2d58:	00d70023          	sb	a3,0(a4)
    2d5c:	00d700a3          	sb	a3,1(a4)
    2d60:	fbdff06f          	j	2d1c <fatfs_filename_to_lfn+0xcc>

00002d64 <fatfs_sfn_create_entry>:
    2d64:	00000793          	li	a5,0
    2d68:	00b00813          	li	a6,11
    2d6c:	00f508b3          	add	a7,a0,a5
    2d70:	0008c303          	lbu	t1,0(a7)
    2d74:	00f688b3          	add	a7,a3,a5
    2d78:	00178793          	addi	a5,a5,1
    2d7c:	00688023          	sb	t1,0(a7)
    2d80:	ff0796e3          	bne	a5,a6,2d6c <fatfs_sfn_create_entry+0x8>
    2d84:	00e03733          	snez	a4,a4
    2d88:	40e00733          	neg	a4,a4
    2d8c:	02000793          	li	a5,32
    2d90:	ff077713          	andi	a4,a4,-16
    2d94:	00f70733          	add	a4,a4,a5
    2d98:	00f68823          	sb	a5,16(a3)
    2d9c:	00f68923          	sb	a5,18(a3)
    2da0:	00f68c23          	sb	a5,24(a3)
    2da4:	01065793          	srli	a5,a2,0x10
    2da8:	00f68a23          	sb	a5,20(a3)
    2dac:	01865793          	srli	a5,a2,0x18
    2db0:	00f68aa3          	sb	a5,21(a3)
    2db4:	0085d793          	srli	a5,a1,0x8
    2db8:	00c68d23          	sb	a2,26(a3)
    2dbc:	00b68e23          	sb	a1,28(a3)
    2dc0:	00865613          	srli	a2,a2,0x8
    2dc4:	00f68ea3          	sb	a5,29(a3)
    2dc8:	0105d793          	srli	a5,a1,0x10
    2dcc:	0185d593          	srli	a1,a1,0x18
    2dd0:	000686a3          	sb	zero,13(a3)
    2dd4:	00068723          	sb	zero,14(a3)
    2dd8:	000687a3          	sb	zero,15(a3)
    2ddc:	000688a3          	sb	zero,17(a3)
    2de0:	000689a3          	sb	zero,19(a3)
    2de4:	00068b23          	sb	zero,22(a3)
    2de8:	00068ba3          	sb	zero,23(a3)
    2dec:	00068ca3          	sb	zero,25(a3)
    2df0:	00e685a3          	sb	a4,11(a3)
    2df4:	00068623          	sb	zero,12(a3)
    2df8:	00c68da3          	sb	a2,27(a3)
    2dfc:	00f68f23          	sb	a5,30(a3)
    2e00:	00b68fa3          	sb	a1,31(a3)
    2e04:	00008067          	ret

00002e08 <fatfs_lfn_create_sfn>:
    2e08:	fd010113          	addi	sp,sp,-48
    2e0c:	02912223          	sw	s1,36(sp)
    2e10:	00050493          	mv	s1,a0
    2e14:	00058513          	mv	a0,a1
    2e18:	02812423          	sw	s0,40(sp)
    2e1c:	01312e23          	sw	s3,28(sp)
    2e20:	00058413          	mv	s0,a1
    2e24:	02112623          	sw	ra,44(sp)
    2e28:	03212023          	sw	s2,32(sp)
    2e2c:	fffff097          	auipc	ra,0xfffff
    2e30:	ed8080e7          	jalr	-296(ra) # 1d04 <strlen>
    2e34:	00044783          	lbu	a5,0(s0)
    2e38:	02e00993          	li	s3,46
    2e3c:	15378063          	beq	a5,s3,2f7c <fatfs_lfn_create_sfn+0x174>
    2e40:	00b00613          	li	a2,11
    2e44:	02000593          	li	a1,32
    2e48:	00050913          	mv	s2,a0
    2e4c:	00048513          	mv	a0,s1
    2e50:	fffff097          	auipc	ra,0xfffff
    2e54:	e74080e7          	jalr	-396(ra) # 1cc4 <memset>
    2e58:	00300613          	li	a2,3
    2e5c:	02000593          	li	a1,32
    2e60:	00c10513          	addi	a0,sp,12
    2e64:	fffff097          	auipc	ra,0xfffff
    2e68:	e60080e7          	jalr	-416(ra) # 1cc4 <memset>
    2e6c:	fff00793          	li	a5,-1
    2e70:	00000713          	li	a4,0
    2e74:	0d274263          	blt	a4,s2,2f38 <fatfs_lfn_create_sfn+0x130>
    2e78:	fff00713          	li	a4,-1
    2e7c:	0ee78863          	beq	a5,a4,2f6c <fatfs_lfn_create_sfn+0x164>
    2e80:	00178713          	addi	a4,a5,1
    2e84:	00c10693          	addi	a3,sp,12
    2e88:	00478613          	addi	a2,a5,4
    2e8c:	0ce61263          	bne	a2,a4,2f50 <fatfs_lfn_create_sfn+0x148>
    2e90:	00000613          	li	a2,0
    2e94:	00000693          	li	a3,0
    2e98:	01900813          	li	a6,25
    2e9c:	00800893          	li	a7,8
    2ea0:	02f6de63          	bge	a3,a5,2edc <fatfs_lfn_create_sfn+0xd4>
    2ea4:	00d40733          	add	a4,s0,a3
    2ea8:	00074703          	lbu	a4,0(a4)
    2eac:	fe070513          	addi	a0,a4,-32
    2eb0:	0c050263          	beqz	a0,2f74 <fatfs_lfn_create_sfn+0x16c>
    2eb4:	fd270593          	addi	a1,a4,-46
    2eb8:	0a058e63          	beqz	a1,2f74 <fatfs_lfn_create_sfn+0x16c>
    2ebc:	f9f70593          	addi	a1,a4,-97
    2ec0:	0ff5f593          	zext.b	a1,a1
    2ec4:	00c48333          	add	t1,s1,a2
    2ec8:	00160613          	addi	a2,a2,1
    2ecc:	00b86463          	bltu	a6,a1,2ed4 <fatfs_lfn_create_sfn+0xcc>
    2ed0:	0ff57713          	zext.b	a4,a0
    2ed4:	00e30023          	sb	a4,0(t1)
    2ed8:	09161e63          	bne	a2,a7,2f74 <fatfs_lfn_create_sfn+0x16c>
    2edc:	00c10793          	addi	a5,sp,12
    2ee0:	00800693          	li	a3,8
    2ee4:	01900513          	li	a0,25
    2ee8:	00b00593          	li	a1,11
    2eec:	0007c703          	lbu	a4,0(a5)
    2ef0:	f9f70613          	addi	a2,a4,-97
    2ef4:	0ff67613          	zext.b	a2,a2
    2ef8:	00c56663          	bltu	a0,a2,2f04 <fatfs_lfn_create_sfn+0xfc>
    2efc:	fe070713          	addi	a4,a4,-32
    2f00:	0ff77713          	zext.b	a4,a4
    2f04:	00d48633          	add	a2,s1,a3
    2f08:	00e60023          	sb	a4,0(a2)
    2f0c:	00168693          	addi	a3,a3,1
    2f10:	00178793          	addi	a5,a5,1
    2f14:	fcb69ce3          	bne	a3,a1,2eec <fatfs_lfn_create_sfn+0xe4>
    2f18:	00100513          	li	a0,1
    2f1c:	02c12083          	lw	ra,44(sp)
    2f20:	02812403          	lw	s0,40(sp)
    2f24:	02412483          	lw	s1,36(sp)
    2f28:	02012903          	lw	s2,32(sp)
    2f2c:	01c12983          	lw	s3,28(sp)
    2f30:	03010113          	addi	sp,sp,48
    2f34:	00008067          	ret
    2f38:	00e406b3          	add	a3,s0,a4
    2f3c:	0006c683          	lbu	a3,0(a3)
    2f40:	01369463          	bne	a3,s3,2f48 <fatfs_lfn_create_sfn+0x140>
    2f44:	00070793          	mv	a5,a4
    2f48:	00170713          	addi	a4,a4,1
    2f4c:	f29ff06f          	j	2e74 <fatfs_lfn_create_sfn+0x6c>
    2f50:	01275863          	bge	a4,s2,2f60 <fatfs_lfn_create_sfn+0x158>
    2f54:	00e405b3          	add	a1,s0,a4
    2f58:	0005c583          	lbu	a1,0(a1)
    2f5c:	00b68023          	sb	a1,0(a3)
    2f60:	00170713          	addi	a4,a4,1
    2f64:	00168693          	addi	a3,a3,1
    2f68:	f25ff06f          	j	2e8c <fatfs_lfn_create_sfn+0x84>
    2f6c:	00090793          	mv	a5,s2
    2f70:	f21ff06f          	j	2e90 <fatfs_lfn_create_sfn+0x88>
    2f74:	00168693          	addi	a3,a3,1
    2f78:	f29ff06f          	j	2ea0 <fatfs_lfn_create_sfn+0x98>
    2f7c:	00000513          	li	a0,0
    2f80:	f9dff06f          	j	2f1c <fatfs_lfn_create_sfn+0x114>

00002f84 <fatfs_lfn_generate_tail>:
    2f84:	000187b7          	lui	a5,0x18
    2f88:	69f78793          	addi	a5,a5,1695 # 1869f <__stacktop+0x869f>
    2f8c:	16c7e463          	bltu	a5,a2,30f4 <fatfs_lfn_generate_tail+0x170>
    2f90:	fa010113          	addi	sp,sp,-96
    2f94:	04812c23          	sw	s0,88(sp)
    2f98:	04912a23          	sw	s1,84(sp)
    2f9c:	03712e23          	sw	s7,60(sp)
    2fa0:	00060413          	mv	s0,a2
    2fa4:	00058b93          	mv	s7,a1
    2fa8:	00c00613          	li	a2,12
    2fac:	00000593          	li	a1,0
    2fb0:	00050493          	mv	s1,a0
    2fb4:	00410513          	addi	a0,sp,4
    2fb8:	04112e23          	sw	ra,92(sp)
    2fbc:	05312623          	sw	s3,76(sp)
    2fc0:	05412423          	sw	s4,72(sp)
    2fc4:	05612023          	sw	s6,64(sp)
    2fc8:	05212823          	sw	s2,80(sp)
    2fcc:	05512223          	sw	s5,68(sp)
    2fd0:	fffff097          	auipc	ra,0xfffff
    2fd4:	cf4080e7          	jalr	-780(ra) # 1cc4 <memset>
    2fd8:	000065b7          	lui	a1,0x6
    2fdc:	07e00793          	li	a5,126
    2fe0:	01100613          	li	a2,17
    2fe4:	a1458593          	addi	a1,a1,-1516 # 5a14 <LEDS+0x14c>
    2fe8:	01c10513          	addi	a0,sp,28
    2fec:	01010993          	addi	s3,sp,16
    2ff0:	00f10223          	sb	a5,4(sp)
    2ff4:	00098a13          	mv	s4,s3
    2ff8:	fffff097          	auipc	ra,0xfffff
    2ffc:	ce8080e7          	jalr	-792(ra) # 1ce0 <memcpy>
    3000:	00900b13          	li	s6,9
    3004:	00a00593          	li	a1,10
    3008:	00040513          	mv	a0,s0
    300c:	fffff097          	auipc	ra,0xfffff
    3010:	c54080e7          	jalr	-940(ra) # 1c60 <__umodsi3>
    3014:	03050793          	addi	a5,a0,48
    3018:	00278533          	add	a0,a5,sp
    301c:	fec54783          	lbu	a5,-20(a0)
    3020:	00098913          	mv	s2,s3
    3024:	00040513          	mv	a0,s0
    3028:	00a00593          	li	a1,10
    302c:	00f98023          	sb	a5,0(s3)
    3030:	00040a93          	mv	s5,s0
    3034:	fffff097          	auipc	ra,0xfffff
    3038:	be4080e7          	jalr	-1052(ra) # 1c18 <__udivsi3>
    303c:	00198993          	addi	s3,s3,1
    3040:	00050413          	mv	s0,a0
    3044:	fd5b60e3          	bltu	s6,s5,3004 <fatfs_lfn_generate_tail+0x80>
    3048:	00098023          	sb	zero,0(s3)
    304c:	00410713          	addi	a4,sp,4
    3050:	00090793          	mv	a5,s2
    3054:	0947f663          	bgeu	a5,s4,30e0 <fatfs_lfn_generate_tail+0x15c>
    3058:	00f10713          	addi	a4,sp,15
    305c:	00000793          	li	a5,0
    3060:	00e96663          	bltu	s2,a4,306c <fatfs_lfn_generate_tail+0xe8>
    3064:	41490933          	sub	s2,s2,s4
    3068:	00190793          	addi	a5,s2,1
    306c:	03078793          	addi	a5,a5,48
    3070:	002787b3          	add	a5,a5,sp
    3074:	000b8593          	mv	a1,s7
    3078:	fc078aa3          	sb	zero,-43(a5)
    307c:	00b00613          	li	a2,11
    3080:	00048513          	mv	a0,s1
    3084:	fffff097          	auipc	ra,0xfffff
    3088:	c5c080e7          	jalr	-932(ra) # 1ce0 <memcpy>
    308c:	00410513          	addi	a0,sp,4
    3090:	fffff097          	auipc	ra,0xfffff
    3094:	c74080e7          	jalr	-908(ra) # 1d04 <strlen>
    3098:	40a484b3          	sub	s1,s1,a0
    309c:	00050613          	mv	a2,a0
    30a0:	00410593          	addi	a1,sp,4
    30a4:	00848513          	addi	a0,s1,8
    30a8:	fffff097          	auipc	ra,0xfffff
    30ac:	c38080e7          	jalr	-968(ra) # 1ce0 <memcpy>
    30b0:	05c12083          	lw	ra,92(sp)
    30b4:	05812403          	lw	s0,88(sp)
    30b8:	05412483          	lw	s1,84(sp)
    30bc:	05012903          	lw	s2,80(sp)
    30c0:	04c12983          	lw	s3,76(sp)
    30c4:	04812a03          	lw	s4,72(sp)
    30c8:	04412a83          	lw	s5,68(sp)
    30cc:	04012b03          	lw	s6,64(sp)
    30d0:	03c12b83          	lw	s7,60(sp)
    30d4:	00100513          	li	a0,1
    30d8:	06010113          	addi	sp,sp,96
    30dc:	00008067          	ret
    30e0:	0007c683          	lbu	a3,0(a5)
    30e4:	00170713          	addi	a4,a4,1
    30e8:	fff78793          	addi	a5,a5,-1
    30ec:	00d70023          	sb	a3,0(a4)
    30f0:	f65ff06f          	j	3054 <fatfs_lfn_generate_tail+0xd0>
    30f4:	00000513          	li	a0,0
    30f8:	00008067          	ret

000030fc <fatfs_total_path_levels>:
    30fc:	fff00793          	li	a5,-1
    3100:	06050263          	beqz	a0,3164 <fatfs_total_path_levels+0x68>
    3104:	00054703          	lbu	a4,0(a0)
    3108:	02f00793          	li	a5,47
    310c:	00f71863          	bne	a4,a5,311c <fatfs_total_path_levels+0x20>
    3110:	00150513          	addi	a0,a0,1
    3114:	00000793          	li	a5,0
    3118:	0400006f          	j	3158 <fatfs_total_path_levels+0x5c>
    311c:	00154703          	lbu	a4,1(a0)
    3120:	03a00793          	li	a5,58
    3124:	00f70a63          	beq	a4,a5,3138 <fatfs_total_path_levels+0x3c>
    3128:	00254683          	lbu	a3,2(a0)
    312c:	05c00713          	li	a4,92
    3130:	fff00793          	li	a5,-1
    3134:	02e69863          	bne	a3,a4,3164 <fatfs_total_path_levels+0x68>
    3138:	00350513          	addi	a0,a0,3
    313c:	05c00713          	li	a4,92
    3140:	fd5ff06f          	j	3114 <fatfs_total_path_levels+0x18>
    3144:	00150513          	addi	a0,a0,1
    3148:	00e68663          	beq	a3,a4,3154 <fatfs_total_path_levels+0x58>
    314c:	00054683          	lbu	a3,0(a0)
    3150:	fe069ae3          	bnez	a3,3144 <fatfs_total_path_levels+0x48>
    3154:	00178793          	addi	a5,a5,1
    3158:	00054683          	lbu	a3,0(a0)
    315c:	fe0698e3          	bnez	a3,314c <fatfs_total_path_levels+0x50>
    3160:	fff78793          	addi	a5,a5,-1
    3164:	00078513          	mv	a0,a5
    3168:	00008067          	ret

0000316c <fatfs_get_substring>:
    316c:	0cd05e63          	blez	a3,3248 <fatfs_get_substring+0xdc>
    3170:	0c050c63          	beqz	a0,3248 <fatfs_get_substring+0xdc>
    3174:	fe010113          	addi	sp,sp,-32
    3178:	00812c23          	sw	s0,24(sp)
    317c:	00112e23          	sw	ra,28(sp)
    3180:	00912a23          	sw	s1,20(sp)
    3184:	00054483          	lbu	s1,0(a0)
    3188:	02f00793          	li	a5,47
    318c:	00150413          	addi	s0,a0,1
    3190:	02f48463          	beq	s1,a5,31b8 <fatfs_get_substring+0x4c>
    3194:	00154703          	lbu	a4,1(a0)
    3198:	03a00793          	li	a5,58
    319c:	00f70a63          	beq	a4,a5,31b0 <fatfs_get_substring+0x44>
    31a0:	00254803          	lbu	a6,2(a0)
    31a4:	05c00713          	li	a4,92
    31a8:	fff00793          	li	a5,-1
    31ac:	04e81c63          	bne	a6,a4,3204 <fatfs_get_substring+0x98>
    31b0:	00350413          	addi	s0,a0,3
    31b4:	05c00493          	li	s1,92
    31b8:	00040513          	mv	a0,s0
    31bc:	00d12623          	sw	a3,12(sp)
    31c0:	00c12423          	sw	a2,8(sp)
    31c4:	00b12223          	sw	a1,4(sp)
    31c8:	fffff097          	auipc	ra,0xfffff
    31cc:	b3c080e7          	jalr	-1220(ra) # 1d04 <strlen>
    31d0:	00c12683          	lw	a3,12(sp)
    31d4:	00412583          	lw	a1,4(sp)
    31d8:	00812603          	lw	a2,8(sp)
    31dc:	00000713          	li	a4,0
    31e0:	00000813          	li	a6,0
    31e4:	00000793          	li	a5,0
    31e8:	fff68693          	addi	a3,a3,-1
    31ec:	00e608b3          	add	a7,a2,a4
    31f0:	02a7c663          	blt	a5,a0,321c <fatfs_get_substring+0xb0>
    31f4:	00088023          	sb	zero,0(a7)
    31f8:	00064783          	lbu	a5,0(a2)
    31fc:	0017b793          	seqz	a5,a5
    3200:	40f007b3          	neg	a5,a5
    3204:	01c12083          	lw	ra,28(sp)
    3208:	01812403          	lw	s0,24(sp)
    320c:	01412483          	lw	s1,20(sp)
    3210:	00078513          	mv	a0,a5
    3214:	02010113          	addi	sp,sp,32
    3218:	00008067          	ret
    321c:	00f40333          	add	t1,s0,a5
    3220:	00034303          	lbu	t1,0(t1)
    3224:	00931863          	bne	t1,s1,3234 <fatfs_get_substring+0xc8>
    3228:	00180813          	addi	a6,a6,1
    322c:	00178793          	addi	a5,a5,1
    3230:	fbdff06f          	j	31ec <fatfs_get_substring+0x80>
    3234:	feb81ce3          	bne	a6,a1,322c <fatfs_get_substring+0xc0>
    3238:	fed75ae3          	bge	a4,a3,322c <fatfs_get_substring+0xc0>
    323c:	00170713          	addi	a4,a4,1
    3240:	00688023          	sb	t1,0(a7)
    3244:	fe9ff06f          	j	322c <fatfs_get_substring+0xc0>
    3248:	fff00793          	li	a5,-1
    324c:	00078513          	mv	a0,a5
    3250:	00008067          	ret

00003254 <fatfs_split_path>:
    3254:	fd010113          	addi	sp,sp,-48
    3258:	02912223          	sw	s1,36(sp)
    325c:	03212023          	sw	s2,32(sp)
    3260:	01312e23          	sw	s3,28(sp)
    3264:	01412c23          	sw	s4,24(sp)
    3268:	02112623          	sw	ra,44(sp)
    326c:	02812423          	sw	s0,40(sp)
    3270:	01512a23          	sw	s5,20(sp)
    3274:	00050993          	mv	s3,a0
    3278:	00058493          	mv	s1,a1
    327c:	00060913          	mv	s2,a2
    3280:	00068a13          	mv	s4,a3
    3284:	00e12623          	sw	a4,12(sp)
    3288:	00000097          	auipc	ra,0x0
    328c:	e74080e7          	jalr	-396(ra) # 30fc <fatfs_total_path_levels>
    3290:	fff00793          	li	a5,-1
    3294:	02f51863          	bne	a0,a5,32c4 <fatfs_split_path+0x70>
    3298:	fff00413          	li	s0,-1
    329c:	02c12083          	lw	ra,44(sp)
    32a0:	00040513          	mv	a0,s0
    32a4:	02812403          	lw	s0,40(sp)
    32a8:	02412483          	lw	s1,36(sp)
    32ac:	02012903          	lw	s2,32(sp)
    32b0:	01c12983          	lw	s3,28(sp)
    32b4:	01812a03          	lw	s4,24(sp)
    32b8:	01412a83          	lw	s5,20(sp)
    32bc:	03010113          	addi	sp,sp,48
    32c0:	00008067          	ret
    32c4:	00c12683          	lw	a3,12(sp)
    32c8:	00050593          	mv	a1,a0
    32cc:	00a12623          	sw	a0,12(sp)
    32d0:	000a0613          	mv	a2,s4
    32d4:	00098513          	mv	a0,s3
    32d8:	00000097          	auipc	ra,0x0
    32dc:	e94080e7          	jalr	-364(ra) # 316c <fatfs_get_substring>
    32e0:	00050413          	mv	s0,a0
    32e4:	fa051ae3          	bnez	a0,3298 <fatfs_split_path+0x44>
    32e8:	00c12583          	lw	a1,12(sp)
    32ec:	00059663          	bnez	a1,32f8 <fatfs_split_path+0xa4>
    32f0:	00048023          	sb	zero,0(s1)
    32f4:	fa9ff06f          	j	329c <fatfs_split_path+0x48>
    32f8:	00098513          	mv	a0,s3
    32fc:	fffff097          	auipc	ra,0xfffff
    3300:	a08080e7          	jalr	-1528(ra) # 1d04 <strlen>
    3304:	00050a93          	mv	s5,a0
    3308:	000a0513          	mv	a0,s4
    330c:	fffff097          	auipc	ra,0xfffff
    3310:	9f8080e7          	jalr	-1544(ra) # 1d04 <strlen>
    3314:	40aa8633          	sub	a2,s5,a0
    3318:	00c95463          	bge	s2,a2,3320 <fatfs_split_path+0xcc>
    331c:	00090613          	mv	a2,s2
    3320:	00048513          	mv	a0,s1
    3324:	00098593          	mv	a1,s3
    3328:	00c12623          	sw	a2,12(sp)
    332c:	fffff097          	auipc	ra,0xfffff
    3330:	9b4080e7          	jalr	-1612(ra) # 1ce0 <memcpy>
    3334:	00c12603          	lw	a2,12(sp)
    3338:	00c484b3          	add	s1,s1,a2
    333c:	fe048fa3          	sb	zero,-1(s1)
    3340:	f5dff06f          	j	329c <fatfs_split_path+0x48>

00003344 <fatfs_compare_names>:
    3344:	fd010113          	addi	sp,sp,-48
    3348:	02112623          	sw	ra,44(sp)
    334c:	03212023          	sw	s2,32(sp)
    3350:	01312e23          	sw	s3,28(sp)
    3354:	01412c23          	sw	s4,24(sp)
    3358:	01512a23          	sw	s5,20(sp)
    335c:	00058a13          	mv	s4,a1
    3360:	02812423          	sw	s0,40(sp)
    3364:	02912223          	sw	s1,36(sp)
    3368:	01612823          	sw	s6,16(sp)
    336c:	01712623          	sw	s7,12(sp)
    3370:	01812423          	sw	s8,8(sp)
    3374:	00050a93          	mv	s5,a0
    3378:	fffff097          	auipc	ra,0xfffff
    337c:	1c4080e7          	jalr	452(ra) # 253c <FileString_GetExtension>
    3380:	00050993          	mv	s3,a0
    3384:	000a0513          	mv	a0,s4
    3388:	fffff097          	auipc	ra,0xfffff
    338c:	1b4080e7          	jalr	436(ra) # 253c <FileString_GetExtension>
    3390:	fff00793          	li	a5,-1
    3394:	00050913          	mv	s2,a0
    3398:	02f99e63          	bne	s3,a5,33d4 <fatfs_compare_names+0x90>
    339c:	0f350063          	beq	a0,s3,347c <fatfs_compare_names+0x138>
    33a0:	00000513          	li	a0,0
    33a4:	02c12083          	lw	ra,44(sp)
    33a8:	02812403          	lw	s0,40(sp)
    33ac:	02412483          	lw	s1,36(sp)
    33b0:	02012903          	lw	s2,32(sp)
    33b4:	01c12983          	lw	s3,28(sp)
    33b8:	01812a03          	lw	s4,24(sp)
    33bc:	01412a83          	lw	s5,20(sp)
    33c0:	01012b03          	lw	s6,16(sp)
    33c4:	00c12b83          	lw	s7,12(sp)
    33c8:	00812c03          	lw	s8,8(sp)
    33cc:	03010113          	addi	sp,sp,48
    33d0:	00008067          	ret
    33d4:	fcf506e3          	beq	a0,a5,33a0 <fatfs_compare_names+0x5c>
    33d8:	00198793          	addi	a5,s3,1
    33dc:	00fa8b33          	add	s6,s5,a5
    33e0:	00050413          	mv	s0,a0
    33e4:	00150793          	addi	a5,a0,1
    33e8:	000b0513          	mv	a0,s6
    33ec:	00fa0bb3          	add	s7,s4,a5
    33f0:	fffff097          	auipc	ra,0xfffff
    33f4:	914080e7          	jalr	-1772(ra) # 1d04 <strlen>
    33f8:	00050c13          	mv	s8,a0
    33fc:	000b8513          	mv	a0,s7
    3400:	00098493          	mv	s1,s3
    3404:	fffff097          	auipc	ra,0xfffff
    3408:	900080e7          	jalr	-1792(ra) # 1d04 <strlen>
    340c:	f8ac1ae3          	bne	s8,a0,33a0 <fatfs_compare_names+0x5c>
    3410:	000b0513          	mv	a0,s6
    3414:	fffff097          	auipc	ra,0xfffff
    3418:	8f0080e7          	jalr	-1808(ra) # 1d04 <strlen>
    341c:	00050613          	mv	a2,a0
    3420:	000b8593          	mv	a1,s7
    3424:	000b0513          	mv	a0,s6
    3428:	fffff097          	auipc	ra,0xfffff
    342c:	0a4080e7          	jalr	164(ra) # 24cc <FileString_StrCmpNoCase>
    3430:	f60518e3          	bnez	a0,33a0 <fatfs_compare_names+0x5c>
    3434:	fff48793          	addi	a5,s1,-1
    3438:	00fa87b3          	add	a5,s5,a5
    343c:	41378733          	sub	a4,a5,s3
    3440:	02000693          	li	a3,32
    3444:	06e79263          	bne	a5,a4,34a8 <fatfs_compare_names+0x164>
    3448:	fff40793          	addi	a5,s0,-1
    344c:	00fa07b3          	add	a5,s4,a5
    3450:	41278733          	sub	a4,a5,s2
    3454:	02000693          	li	a3,32
    3458:	06e79263          	bne	a5,a4,34bc <fatfs_compare_names+0x178>
    345c:	f53912e3          	bne	s2,s3,33a0 <fatfs_compare_names+0x5c>
    3460:	00090613          	mv	a2,s2
    3464:	000a0593          	mv	a1,s4
    3468:	000a8513          	mv	a0,s5
    346c:	fffff097          	auipc	ra,0xfffff
    3470:	060080e7          	jalr	96(ra) # 24cc <FileString_StrCmpNoCase>
    3474:	00153513          	seqz	a0,a0
    3478:	f2dff06f          	j	33a4 <fatfs_compare_names+0x60>
    347c:	000a8513          	mv	a0,s5
    3480:	fffff097          	auipc	ra,0xfffff
    3484:	884080e7          	jalr	-1916(ra) # 1d04 <strlen>
    3488:	00050493          	mv	s1,a0
    348c:	00050993          	mv	s3,a0
    3490:	000a0513          	mv	a0,s4
    3494:	fffff097          	auipc	ra,0xfffff
    3498:	870080e7          	jalr	-1936(ra) # 1d04 <strlen>
    349c:	00050413          	mv	s0,a0
    34a0:	00050913          	mv	s2,a0
    34a4:	f91ff06f          	j	3434 <fatfs_compare_names+0xf0>
    34a8:	0007c603          	lbu	a2,0(a5)
    34ac:	f8d61ee3          	bne	a2,a3,3448 <fatfs_compare_names+0x104>
    34b0:	415789b3          	sub	s3,a5,s5
    34b4:	fff78793          	addi	a5,a5,-1
    34b8:	f8dff06f          	j	3444 <fatfs_compare_names+0x100>
    34bc:	0007c603          	lbu	a2,0(a5)
    34c0:	f8d61ee3          	bne	a2,a3,345c <fatfs_compare_names+0x118>
    34c4:	41478933          	sub	s2,a5,s4
    34c8:	fff78793          	addi	a5,a5,-1
    34cc:	f8dff06f          	j	3458 <fatfs_compare_names+0x114>

000034d0 <_check_file_open>:
    34d0:	fe010113          	addi	sp,sp,-32
    34d4:	000067b7          	lui	a5,0x6
    34d8:	00812c23          	sw	s0,24(sp)
    34dc:	e847a403          	lw	s0,-380(a5) # 5e84 <_open_file_list>
    34e0:	00912a23          	sw	s1,20(sp)
    34e4:	00112e23          	sw	ra,28(sp)
    34e8:	01212823          	sw	s2,16(sp)
    34ec:	01312623          	sw	s3,12(sp)
    34f0:	00050493          	mv	s1,a0
    34f4:	00041663          	bnez	s0,3500 <_check_file_open+0x30>
    34f8:	00000513          	li	a0,0
    34fc:	03c0006f          	j	3538 <_check_file_open+0x68>
    3500:	bc440793          	addi	a5,s0,-1084
    3504:	00f49663          	bne	s1,a5,3510 <_check_file_open+0x40>
    3508:	00442403          	lw	s0,4(s0)
    350c:	fe9ff06f          	j	34f4 <_check_file_open+0x24>
    3510:	01448593          	addi	a1,s1,20
    3514:	bd840513          	addi	a0,s0,-1064
    3518:	00000097          	auipc	ra,0x0
    351c:	e2c080e7          	jalr	-468(ra) # 3344 <fatfs_compare_names>
    3520:	fe0504e3          	beqz	a0,3508 <_check_file_open+0x38>
    3524:	11848593          	addi	a1,s1,280
    3528:	cdc40513          	addi	a0,s0,-804
    352c:	00000097          	auipc	ra,0x0
    3530:	e18080e7          	jalr	-488(ra) # 3344 <fatfs_compare_names>
    3534:	fc050ae3          	beqz	a0,3508 <_check_file_open+0x38>
    3538:	01c12083          	lw	ra,28(sp)
    353c:	01812403          	lw	s0,24(sp)
    3540:	01412483          	lw	s1,20(sp)
    3544:	01012903          	lw	s2,16(sp)
    3548:	00c12983          	lw	s3,12(sp)
    354c:	02010113          	addi	sp,sp,32
    3550:	00008067          	ret

00003554 <fatfs_get_sfn_display_name>:
    3554:	00000713          	li	a4,0
    3558:	02000613          	li	a2,32
    355c:	01900813          	li	a6,25
    3560:	0005c783          	lbu	a5,0(a1)
    3564:	00078663          	beqz	a5,3570 <fatfs_get_sfn_display_name+0x1c>
    3568:	ff470693          	addi	a3,a4,-12
    356c:	00069863          	bnez	a3,357c <fatfs_get_sfn_display_name+0x28>
    3570:	00050023          	sb	zero,0(a0)
    3574:	00100513          	li	a0,1
    3578:	00008067          	ret
    357c:	00158593          	addi	a1,a1,1
    3580:	fec780e3          	beq	a5,a2,3560 <fatfs_get_sfn_display_name+0xc>
    3584:	fbf78693          	addi	a3,a5,-65
    3588:	0ff6f693          	zext.b	a3,a3
    358c:	00d86663          	bltu	a6,a3,3598 <fatfs_get_sfn_display_name+0x44>
    3590:	02078793          	addi	a5,a5,32
    3594:	0ff7f793          	zext.b	a5,a5
    3598:	00f50023          	sb	a5,0(a0)
    359c:	00170713          	addi	a4,a4,1
    35a0:	00150513          	addi	a0,a0,1
    35a4:	fbdff06f          	j	3560 <fatfs_get_sfn_display_name+0xc>

000035a8 <fatfs_fat_init>:
    35a8:	ff010113          	addi	sp,sp,-16
    35ac:	00812423          	sw	s0,8(sp)
    35b0:	00912223          	sw	s1,4(sp)
    35b4:	00112623          	sw	ra,12(sp)
    35b8:	fff00793          	li	a5,-1
    35bc:	25850493          	addi	s1,a0,600
    35c0:	00050413          	mv	s0,a0
    35c4:	44f52c23          	sw	a5,1112(a0)
    35c8:	24052a23          	sw	zero,596(a0)
    35cc:	44052e23          	sw	zero,1116(a0)
    35d0:	20000613          	li	a2,512
    35d4:	00048513          	mv	a0,s1
    35d8:	00000593          	li	a1,0
    35dc:	ffffe097          	auipc	ra,0xffffe
    35e0:	6e8080e7          	jalr	1768(ra) # 1cc4 <memset>
    35e4:	25442783          	lw	a5,596(s0)
    35e8:	00c12083          	lw	ra,12(sp)
    35ec:	24942a23          	sw	s1,596(s0)
    35f0:	46042023          	sw	zero,1120(s0)
    35f4:	46f42223          	sw	a5,1124(s0)
    35f8:	00812403          	lw	s0,8(sp)
    35fc:	00412483          	lw	s1,4(sp)
    3600:	01010113          	addi	sp,sp,16
    3604:	00008067          	ret

00003608 <fatfs_init>:
    3608:	fd010113          	addi	sp,sp,-48
    360c:	02812423          	sw	s0,40(sp)
    3610:	02112623          	sw	ra,44(sp)
    3614:	02912223          	sw	s1,36(sp)
    3618:	03212023          	sw	s2,32(sp)
    361c:	01312e23          	sw	s3,28(sp)
    3620:	fff00793          	li	a5,-1
    3624:	24f52223          	sw	a5,580(a0)
    3628:	24052423          	sw	zero,584(a0)
    362c:	02052223          	sw	zero,36(a0)
    3630:	00050413          	mv	s0,a0
    3634:	00000097          	auipc	ra,0x0
    3638:	f74080e7          	jalr	-140(ra) # 35a8 <fatfs_fat_init>
    363c:	03442783          	lw	a5,52(s0)
    3640:	02079463          	bnez	a5,3668 <fatfs_init+0x60>
    3644:	fff00713          	li	a4,-1
    3648:	02c12083          	lw	ra,44(sp)
    364c:	02812403          	lw	s0,40(sp)
    3650:	02412483          	lw	s1,36(sp)
    3654:	02012903          	lw	s2,32(sp)
    3658:	01c12983          	lw	s3,28(sp)
    365c:	00070513          	mv	a0,a4
    3660:	03010113          	addi	sp,sp,48
    3664:	00008067          	ret
    3668:	04440593          	addi	a1,s0,68
    366c:	00100613          	li	a2,1
    3670:	00000513          	li	a0,0
    3674:	00b12623          	sw	a1,12(sp)
    3678:	000780e7          	jalr	a5
    367c:	fc0504e3          	beqz	a0,3644 <fatfs_init+0x3c>
    3680:	24244703          	lbu	a4,578(s0)
    3684:	05500793          	li	a5,85
    3688:	00c12583          	lw	a1,12(sp)
    368c:	00f70663          	beq	a4,a5,3698 <fatfs_init+0x90>
    3690:	ffd00713          	li	a4,-3
    3694:	fb5ff06f          	j	3648 <fatfs_init+0x40>
    3698:	24344703          	lbu	a4,579(s0)
    369c:	0aa00793          	li	a5,170
    36a0:	fef718e3          	bne	a4,a5,3690 <fatfs_init+0x88>
    36a4:	20644783          	lbu	a5,518(s0)
    36a8:	00600713          	li	a4,6
    36ac:	02f76463          	bltu	a4,a5,36d4 <fatfs_init+0xcc>
    36b0:	00400713          	li	a4,4
    36b4:	00f76663          	bltu	a4,a5,36c0 <fatfs_init+0xb8>
    36b8:	00000513          	li	a0,0
    36bc:	02078663          	beqz	a5,36e8 <fatfs_init+0xe0>
    36c0:	20c45503          	lhu	a0,524(s0)
    36c4:	20a45783          	lhu	a5,522(s0)
    36c8:	01051513          	slli	a0,a0,0x10
    36cc:	00f56533          	or	a0,a0,a5
    36d0:	0180006f          	j	36e8 <fatfs_init+0xe0>
    36d4:	00c00713          	li	a4,12
    36d8:	12f76663          	bltu	a4,a5,3804 <fatfs_init+0x1fc>
    36dc:	00a00713          	li	a4,10
    36e0:	00000513          	li	a0,0
    36e4:	fcf76ee3          	bltu	a4,a5,36c0 <fatfs_init+0xb8>
    36e8:	03442783          	lw	a5,52(s0)
    36ec:	00a42e23          	sw	a0,28(s0)
    36f0:	00100613          	li	a2,1
    36f4:	000780e7          	jalr	a5
    36f8:	f40506e3          	beqz	a0,3644 <fatfs_init+0x3c>
    36fc:	05044783          	lbu	a5,80(s0)
    3700:	04f44703          	lbu	a4,79(s0)
    3704:	20000693          	li	a3,512
    3708:	00879793          	slli	a5,a5,0x8
    370c:	00e7e7b3          	or	a5,a5,a4
    3710:	ffe00713          	li	a4,-2
    3714:	f2d79ae3          	bne	a5,a3,3648 <fatfs_init+0x40>
    3718:	05644483          	lbu	s1,86(s0)
    371c:	05544783          	lbu	a5,85(s0)
    3720:	05144983          	lbu	s3,81(s0)
    3724:	00849493          	slli	s1,s1,0x8
    3728:	05a45583          	lhu	a1,90(s0)
    372c:	00f4e4b3          	or	s1,s1,a5
    3730:	01340023          	sb	s3,0(s0)
    3734:	02941423          	sh	s1,40(s0)
    3738:	05245903          	lhu	s2,82(s0)
    373c:	05444503          	lbu	a0,84(s0)
    3740:	00059463          	bnez	a1,3748 <fatfs_init+0x140>
    3744:	06842583          	lw	a1,104(s0)
    3748:	07042783          	lw	a5,112(s0)
    374c:	02b42023          	sw	a1,32(s0)
    3750:	00549493          	slli	s1,s1,0x5
    3754:	00f42423          	sw	a5,8(s0)
    3758:	07445783          	lhu	a5,116(s0)
    375c:	1ff48493          	addi	s1,s1,511
    3760:	4094d493          	srai	s1,s1,0x9
    3764:	00f41c23          	sh	a5,24(s0)
    3768:	fffff097          	auipc	ra,0xfffff
    376c:	ccc080e7          	jalr	-820(ra) # 2434 <__mulsi3>
    3770:	00a907b3          	add	a5,s2,a0
    3774:	00f42623          	sw	a5,12(s0)
    3778:	01c42783          	lw	a5,28(s0)
    377c:	24245703          	lhu	a4,578(s0)
    3780:	00942823          	sw	s1,16(s0)
    3784:	00f907b3          	add	a5,s2,a5
    3788:	00f42a23          	sw	a5,20(s0)
    378c:	00f507b3          	add	a5,a0,a5
    3790:	00f42223          	sw	a5,4(s0)
    3794:	0000b7b7          	lui	a5,0xb
    3798:	a5578793          	addi	a5,a5,-1451 # aa55 <_files+0x2b3d>
    379c:	eef71ae3          	bne	a4,a5,3690 <fatfs_init+0x88>
    37a0:	05844783          	lbu	a5,88(s0)
    37a4:	05744703          	lbu	a4,87(s0)
    37a8:	00879793          	slli	a5,a5,0x8
    37ac:	00e7e7b3          	or	a5,a5,a4
    37b0:	00079463          	bnez	a5,37b8 <fatfs_init+0x1b0>
    37b4:	06442783          	lw	a5,100(s0)
    37b8:	ffb00713          	li	a4,-5
    37bc:	e80986e3          	beqz	s3,3648 <fatfs_init+0x40>
    37c0:	00990933          	add	s2,s2,s1
    37c4:	00a90533          	add	a0,s2,a0
    37c8:	40a78533          	sub	a0,a5,a0
    37cc:	00098593          	mv	a1,s3
    37d0:	ffffe097          	auipc	ra,0xffffe
    37d4:	448080e7          	jalr	1096(ra) # 1c18 <__udivsi3>
    37d8:	000017b7          	lui	a5,0x1
    37dc:	ff478793          	addi	a5,a5,-12 # ff4 <music_player+0x164>
    37e0:	ffb00713          	li	a4,-5
    37e4:	e6a7f2e3          	bgeu	a5,a0,3648 <fatfs_init+0x40>
    37e8:	000107b7          	lui	a5,0x10
    37ec:	ff478793          	addi	a5,a5,-12 # fff4 <_files+0x80dc>
    37f0:	02a7e663          	bltu	a5,a0,381c <fatfs_init+0x214>
    37f4:	00042423          	sw	zero,8(s0)
    37f8:	02042823          	sw	zero,48(s0)
    37fc:	00000713          	li	a4,0
    3800:	e49ff06f          	j	3648 <fatfs_init+0x40>
    3804:	ff278793          	addi	a5,a5,-14
    3808:	0ff7f793          	zext.b	a5,a5
    380c:	00100713          	li	a4,1
    3810:	00000513          	li	a0,0
    3814:	eaf776e3          	bgeu	a4,a5,36c0 <fatfs_init+0xb8>
    3818:	ed1ff06f          	j	36e8 <fatfs_init+0xe0>
    381c:	00100793          	li	a5,1
    3820:	02f42823          	sw	a5,48(s0)
    3824:	fd9ff06f          	j	37fc <fatfs_init+0x1f4>

00003828 <fl_attach_media>:
    3828:	000067b7          	lui	a5,0x6
    382c:	e907a783          	lw	a5,-368(a5) # 5e90 <_filelib_init>
    3830:	fe010113          	addi	sp,sp,-32
    3834:	00812c23          	sw	s0,24(sp)
    3838:	00112e23          	sw	ra,28(sp)
    383c:	00050413          	mv	s0,a0
    3840:	00079a63          	bnez	a5,3854 <fl_attach_media+0x2c>
    3844:	00b12623          	sw	a1,12(sp)
    3848:	fffff097          	auipc	ra,0xfffff
    384c:	080080e7          	jalr	128(ra) # 28c8 <fl_init>
    3850:	00c12583          	lw	a1,12(sp)
    3854:	000087b7          	lui	a5,0x8
    3858:	ab078513          	addi	a0,a5,-1360 # 7ab0 <_fs>
    385c:	02b52c23          	sw	a1,56(a0)
    3860:	02852a23          	sw	s0,52(a0)
    3864:	00000097          	auipc	ra,0x0
    3868:	da4080e7          	jalr	-604(ra) # 3608 <fatfs_init>
    386c:	00050593          	mv	a1,a0
    3870:	02050863          	beqz	a0,38a0 <fl_attach_media+0x78>
    3874:	00a12623          	sw	a0,12(sp)
    3878:	00006537          	lui	a0,0x6
    387c:	a2850513          	addi	a0,a0,-1496 # 5a28 <LEDS+0x160>
    3880:	fffff097          	auipc	ra,0xfffff
    3884:	a78080e7          	jalr	-1416(ra) # 22f8 <printf>
    3888:	00c12583          	lw	a1,12(sp)
    388c:	01c12083          	lw	ra,28(sp)
    3890:	01812403          	lw	s0,24(sp)
    3894:	00058513          	mv	a0,a1
    3898:	02010113          	addi	sp,sp,32
    389c:	00008067          	ret
    38a0:	000067b7          	lui	a5,0x6
    38a4:	00100713          	li	a4,1
    38a8:	e8e7a623          	sw	a4,-372(a5) # 5e8c <_filelib_valid>
    38ac:	fe1ff06f          	j	388c <fl_attach_media+0x64>

000038b0 <fatfs_fat_purge>:
    38b0:	25452583          	lw	a1,596(a0)
    38b4:	fe010113          	addi	sp,sp,-32
    38b8:	00812c23          	sw	s0,24(sp)
    38bc:	00112e23          	sw	ra,28(sp)
    38c0:	00050413          	mv	s0,a0
    38c4:	00059663          	bnez	a1,38d0 <fatfs_fat_purge+0x20>
    38c8:	00100513          	li	a0,1
    38cc:	02c0006f          	j	38f8 <fatfs_fat_purge+0x48>
    38d0:	2045a783          	lw	a5,516(a1)
    38d4:	00079663          	bnez	a5,38e0 <fatfs_fat_purge+0x30>
    38d8:	20c5a583          	lw	a1,524(a1)
    38dc:	fe9ff06f          	j	38c4 <fatfs_fat_purge+0x14>
    38e0:	00040513          	mv	a0,s0
    38e4:	00b12623          	sw	a1,12(sp)
    38e8:	fffff097          	auipc	ra,0xfffff
    38ec:	c80080e7          	jalr	-896(ra) # 2568 <fatfs_fat_writeback>
    38f0:	00c12583          	lw	a1,12(sp)
    38f4:	fe0512e3          	bnez	a0,38d8 <fatfs_fat_purge+0x28>
    38f8:	01c12083          	lw	ra,28(sp)
    38fc:	01812403          	lw	s0,24(sp)
    3900:	02010113          	addi	sp,sp,32
    3904:	00008067          	ret

00003908 <fatfs_find_next_cluster>:
    3908:	ff010113          	addi	sp,sp,-16
    390c:	00812423          	sw	s0,8(sp)
    3910:	01212023          	sw	s2,0(sp)
    3914:	00112623          	sw	ra,12(sp)
    3918:	00912223          	sw	s1,4(sp)
    391c:	00050913          	mv	s2,a0
    3920:	00200413          	li	s0,2
    3924:	00058463          	beqz	a1,392c <fatfs_find_next_cluster+0x24>
    3928:	00058413          	mv	s0,a1
    392c:	03092783          	lw	a5,48(s2)
    3930:	00745493          	srli	s1,s0,0x7
    3934:	00079463          	bnez	a5,393c <fatfs_find_next_cluster+0x34>
    3938:	00845493          	srli	s1,s0,0x8
    393c:	01492583          	lw	a1,20(s2)
    3940:	00090513          	mv	a0,s2
    3944:	00b485b3          	add	a1,s1,a1
    3948:	fffff097          	auipc	ra,0xfffff
    394c:	ca4080e7          	jalr	-860(ra) # 25ec <fatfs_fat_read_sector>
    3950:	00050793          	mv	a5,a0
    3954:	fff00513          	li	a0,-1
    3958:	04078863          	beqz	a5,39a8 <fatfs_find_next_cluster+0xa0>
    395c:	03092703          	lw	a4,48(s2)
    3960:	2087a783          	lw	a5,520(a5)
    3964:	04071e63          	bnez	a4,39c0 <fatfs_find_next_cluster+0xb8>
    3968:	00849493          	slli	s1,s1,0x8
    396c:	40940433          	sub	s0,s0,s1
    3970:	00141413          	slli	s0,s0,0x1
    3974:	01041413          	slli	s0,s0,0x10
    3978:	01045413          	srli	s0,s0,0x10
    397c:	008787b3          	add	a5,a5,s0
    3980:	0017c503          	lbu	a0,1(a5)
    3984:	0007c783          	lbu	a5,0(a5)
    3988:	00851513          	slli	a0,a0,0x8
    398c:	00f50533          	add	a0,a0,a5
    3990:	ffff07b7          	lui	a5,0xffff0
    3994:	00878793          	addi	a5,a5,8 # ffff0008 <__stacktop+0xfffe0008>
    3998:	00f507b3          	add	a5,a0,a5
    399c:	00700713          	li	a4,7
    39a0:	00f76463          	bltu	a4,a5,39a8 <fatfs_find_next_cluster+0xa0>
    39a4:	fff00513          	li	a0,-1
    39a8:	00c12083          	lw	ra,12(sp)
    39ac:	00812403          	lw	s0,8(sp)
    39b0:	00412483          	lw	s1,4(sp)
    39b4:	00012903          	lw	s2,0(sp)
    39b8:	01010113          	addi	sp,sp,16
    39bc:	00008067          	ret
    39c0:	00749493          	slli	s1,s1,0x7
    39c4:	40940433          	sub	s0,s0,s1
    39c8:	00241413          	slli	s0,s0,0x2
    39cc:	01041413          	slli	s0,s0,0x10
    39d0:	01045413          	srli	s0,s0,0x10
    39d4:	008787b3          	add	a5,a5,s0
    39d8:	0037c503          	lbu	a0,3(a5)
    39dc:	0027c703          	lbu	a4,2(a5)
    39e0:	01851513          	slli	a0,a0,0x18
    39e4:	01071713          	slli	a4,a4,0x10
    39e8:	00e50533          	add	a0,a0,a4
    39ec:	0007c703          	lbu	a4,0(a5)
    39f0:	0017c783          	lbu	a5,1(a5)
    39f4:	00e50533          	add	a0,a0,a4
    39f8:	00879793          	slli	a5,a5,0x8
    39fc:	00f50533          	add	a0,a0,a5
    3a00:	00451513          	slli	a0,a0,0x4
    3a04:	00455513          	srli	a0,a0,0x4
    3a08:	f00007b7          	lui	a5,0xf0000
    3a0c:	f89ff06f          	j	3994 <fatfs_find_next_cluster+0x8c>

00003a10 <fatfs_sector_reader>:
    3a10:	03052783          	lw	a5,48(a0)
    3a14:	fe010113          	addi	sp,sp,-32
    3a18:	00812c23          	sw	s0,24(sp)
    3a1c:	01212823          	sw	s2,16(sp)
    3a20:	01512223          	sw	s5,4(sp)
    3a24:	00112e23          	sw	ra,28(sp)
    3a28:	00912a23          	sw	s1,20(sp)
    3a2c:	01312623          	sw	s3,12(sp)
    3a30:	01412423          	sw	s4,8(sp)
    3a34:	01612023          	sw	s6,0(sp)
    3a38:	00f5e7b3          	or	a5,a1,a5
    3a3c:	00050413          	mv	s0,a0
    3a40:	00060913          	mv	s2,a2
    3a44:	00068a93          	mv	s5,a3
    3a48:	08079063          	bnez	a5,3ac8 <fatfs_sector_reader+0xb8>
    3a4c:	01052783          	lw	a5,16(a0)
    3a50:	02f66863          	bltu	a2,a5,3a80 <fatfs_sector_reader+0x70>
    3a54:	00000513          	li	a0,0
    3a58:	01c12083          	lw	ra,28(sp)
    3a5c:	01812403          	lw	s0,24(sp)
    3a60:	01412483          	lw	s1,20(sp)
    3a64:	01012903          	lw	s2,16(sp)
    3a68:	00c12983          	lw	s3,12(sp)
    3a6c:	00812a03          	lw	s4,8(sp)
    3a70:	00412a83          	lw	s5,4(sp)
    3a74:	00012b03          	lw	s6,0(sp)
    3a78:	02010113          	addi	sp,sp,32
    3a7c:	00008067          	ret
    3a80:	01c52503          	lw	a0,28(a0)
    3a84:	00c42783          	lw	a5,12(s0)
    3a88:	00f50533          	add	a0,a0,a5
    3a8c:	01250533          	add	a0,a0,s2
    3a90:	0a0a8663          	beqz	s5,3b3c <fatfs_sector_reader+0x12c>
    3a94:	03442783          	lw	a5,52(s0)
    3a98:	00100613          	li	a2,1
    3a9c:	000a8593          	mv	a1,s5
    3aa0:	01812403          	lw	s0,24(sp)
    3aa4:	01c12083          	lw	ra,28(sp)
    3aa8:	01412483          	lw	s1,20(sp)
    3aac:	01012903          	lw	s2,16(sp)
    3ab0:	00c12983          	lw	s3,12(sp)
    3ab4:	00812a03          	lw	s4,8(sp)
    3ab8:	00412a83          	lw	s5,4(sp)
    3abc:	00012b03          	lw	s6,0(sp)
    3ac0:	02010113          	addi	sp,sp,32
    3ac4:	00078067          	jr	a5 # f0000000 <__stacktop+0xefff0000>
    3ac8:	00054783          	lbu	a5,0(a0)
    3acc:	00058493          	mv	s1,a1
    3ad0:	00060513          	mv	a0,a2
    3ad4:	00078593          	mv	a1,a5
    3ad8:	00078a13          	mv	s4,a5
    3adc:	ffffe097          	auipc	ra,0xffffe
    3ae0:	13c080e7          	jalr	316(ra) # 1c18 <__udivsi3>
    3ae4:	00050b13          	mv	s6,a0
    3ae8:	00000993          	li	s3,0
    3aec:	03699a63          	bne	s3,s6,3b20 <fatfs_sector_reader+0x110>
    3af0:	fff00793          	li	a5,-1
    3af4:	f6f480e3          	beq	s1,a5,3a54 <fatfs_sector_reader+0x44>
    3af8:	000a0593          	mv	a1,s4
    3afc:	00090513          	mv	a0,s2
    3b00:	ffffe097          	auipc	ra,0xffffe
    3b04:	160080e7          	jalr	352(ra) # 1c60 <__umodsi3>
    3b08:	00050913          	mv	s2,a0
    3b0c:	00048593          	mv	a1,s1
    3b10:	00040513          	mv	a0,s0
    3b14:	fffff097          	auipc	ra,0xfffff
    3b18:	c84080e7          	jalr	-892(ra) # 2798 <fatfs_lba_of_cluster>
    3b1c:	f71ff06f          	j	3a8c <fatfs_sector_reader+0x7c>
    3b20:	00048593          	mv	a1,s1
    3b24:	00040513          	mv	a0,s0
    3b28:	00000097          	auipc	ra,0x0
    3b2c:	de0080e7          	jalr	-544(ra) # 3908 <fatfs_find_next_cluster>
    3b30:	00050493          	mv	s1,a0
    3b34:	00198993          	addi	s3,s3,1
    3b38:	fb5ff06f          	j	3aec <fatfs_sector_reader+0xdc>
    3b3c:	24442783          	lw	a5,580(s0)
    3b40:	00a78c63          	beq	a5,a0,3b58 <fatfs_sector_reader+0x148>
    3b44:	03442783          	lw	a5,52(s0)
    3b48:	24a42223          	sw	a0,580(s0)
    3b4c:	00100613          	li	a2,1
    3b50:	04440593          	addi	a1,s0,68
    3b54:	f4dff06f          	j	3aa0 <fatfs_sector_reader+0x90>
    3b58:	00100513          	li	a0,1
    3b5c:	efdff06f          	j	3a58 <fatfs_sector_reader+0x48>

00003b60 <fatfs_get_file_entry>:
    3b60:	eb010113          	addi	sp,sp,-336
    3b64:	14812423          	sw	s0,328(sp)
    3b68:	14912223          	sw	s1,324(sp)
    3b6c:	13312e23          	sw	s3,316(sp)
    3b70:	13712623          	sw	s7,300(sp)
    3b74:	13812423          	sw	s8,296(sp)
    3b78:	13912223          	sw	s9,292(sp)
    3b7c:	14112623          	sw	ra,332(sp)
    3b80:	15212023          	sw	s2,320(sp)
    3b84:	13412c23          	sw	s4,312(sp)
    3b88:	13512a23          	sw	s5,308(sp)
    3b8c:	13612823          	sw	s6,304(sp)
    3b90:	00050993          	mv	s3,a0
    3b94:	00058c93          	mv	s9,a1
    3b98:	00060b93          	mv	s7,a2
    3b9c:	00068c13          	mv	s8,a3
    3ba0:	10010ea3          	sb	zero,285(sp)
    3ba4:	01810413          	addi	s0,sp,24
    3ba8:	11c10493          	addi	s1,sp,284
    3bac:	00040513          	mv	a0,s0
    3bb0:	00d00613          	li	a2,13
    3bb4:	00000593          	li	a1,0
    3bb8:	00d40413          	addi	s0,s0,13
    3bbc:	ffffe097          	auipc	ra,0xffffe
    3bc0:	108080e7          	jalr	264(ra) # 1cc4 <memset>
    3bc4:	fe9414e3          	bne	s0,s1,3bac <fatfs_get_file_entry+0x4c>
    3bc8:	00000493          	li	s1,0
    3bcc:	24498a13          	addi	s4,s3,580
    3bd0:	00810913          	addi	s2,sp,8
    3bd4:	00800a93          	li	s5,8
    3bd8:	02e00b13          	li	s6,46
    3bdc:	00000693          	li	a3,0
    3be0:	00048613          	mv	a2,s1
    3be4:	000c8593          	mv	a1,s9
    3be8:	00098513          	mv	a0,s3
    3bec:	00000097          	auipc	ra,0x0
    3bf0:	e24080e7          	jalr	-476(ra) # 3a10 <fatfs_sector_reader>
    3bf4:	08050c63          	beqz	a0,3c8c <fatfs_get_file_entry+0x12c>
    3bf8:	00148493          	addi	s1,s1,1
    3bfc:	04498413          	addi	s0,s3,68
    3c00:	00040513          	mv	a0,s0
    3c04:	fffff097          	auipc	ra,0xfffff
    3c08:	f34080e7          	jalr	-204(ra) # 2b38 <fatfs_entry_lfn_text>
    3c0c:	02050063          	beqz	a0,3c2c <fatfs_get_file_entry+0xcc>
    3c10:	00040593          	mv	a1,s0
    3c14:	01810513          	addi	a0,sp,24
    3c18:	fffff097          	auipc	ra,0xfffff
    3c1c:	e18080e7          	jalr	-488(ra) # 2a30 <fatfs_lfn_cache_entry>
    3c20:	02040413          	addi	s0,s0,32
    3c24:	fd441ee3          	bne	s0,s4,3c00 <fatfs_get_file_entry+0xa0>
    3c28:	fb5ff06f          	j	3bdc <fatfs_get_file_entry+0x7c>
    3c2c:	00040513          	mv	a0,s0
    3c30:	fffff097          	auipc	ra,0xfffff
    3c34:	f1c080e7          	jalr	-228(ra) # 2b4c <fatfs_entry_lfn_invalid>
    3c38:	00050663          	beqz	a0,3c44 <fatfs_get_file_entry+0xe4>
    3c3c:	10010ea3          	sb	zero,285(sp)
    3c40:	fe1ff06f          	j	3c20 <fatfs_get_file_entry+0xc0>
    3c44:	00040593          	mv	a1,s0
    3c48:	01810513          	addi	a0,sp,24
    3c4c:	fffff097          	auipc	ra,0xfffff
    3c50:	f34080e7          	jalr	-204(ra) # 2b80 <fatfs_entry_lfn_exists>
    3c54:	06050663          	beqz	a0,3cc0 <fatfs_get_file_entry+0x160>
    3c58:	01810513          	addi	a0,sp,24
    3c5c:	fffff097          	auipc	ra,0xfffff
    3c60:	ea0080e7          	jalr	-352(ra) # 2afc <fatfs_lfn_cache_get>
    3c64:	000b8593          	mv	a1,s7
    3c68:	fffff097          	auipc	ra,0xfffff
    3c6c:	6dc080e7          	jalr	1756(ra) # 3344 <fatfs_compare_names>
    3c70:	fc0506e3          	beqz	a0,3c3c <fatfs_get_file_entry+0xdc>
    3c74:	02000613          	li	a2,32
    3c78:	00040593          	mv	a1,s0
    3c7c:	000c0513          	mv	a0,s8
    3c80:	ffffe097          	auipc	ra,0xffffe
    3c84:	060080e7          	jalr	96(ra) # 1ce0 <memcpy>
    3c88:	00100513          	li	a0,1
    3c8c:	14c12083          	lw	ra,332(sp)
    3c90:	14812403          	lw	s0,328(sp)
    3c94:	14412483          	lw	s1,324(sp)
    3c98:	14012903          	lw	s2,320(sp)
    3c9c:	13c12983          	lw	s3,316(sp)
    3ca0:	13812a03          	lw	s4,312(sp)
    3ca4:	13412a83          	lw	s5,308(sp)
    3ca8:	13012b03          	lw	s6,304(sp)
    3cac:	12c12b83          	lw	s7,300(sp)
    3cb0:	12812c03          	lw	s8,296(sp)
    3cb4:	12412c83          	lw	s9,292(sp)
    3cb8:	15010113          	addi	sp,sp,336
    3cbc:	00008067          	ret
    3cc0:	00040513          	mv	a0,s0
    3cc4:	fffff097          	auipc	ra,0xfffff
    3cc8:	f0c080e7          	jalr	-244(ra) # 2bd0 <fatfs_entry_sfn_only>
    3ccc:	f4050ae3          	beqz	a0,3c20 <fatfs_get_file_entry+0xc0>
    3cd0:	00d00613          	li	a2,13
    3cd4:	00000593          	li	a1,0
    3cd8:	00090513          	mv	a0,s2
    3cdc:	ffffe097          	auipc	ra,0xffffe
    3ce0:	fe8080e7          	jalr	-24(ra) # 1cc4 <memset>
    3ce4:	00000793          	li	a5,0
    3ce8:	00f406b3          	add	a3,s0,a5
    3cec:	0006c683          	lbu	a3,0(a3)
    3cf0:	00f90733          	add	a4,s2,a5
    3cf4:	00178793          	addi	a5,a5,1
    3cf8:	00d70023          	sb	a3,0(a4)
    3cfc:	ff5796e3          	bne	a5,s5,3ce8 <fatfs_get_file_entry+0x188>
    3d00:	00844703          	lbu	a4,8(s0)
    3d04:	00944783          	lbu	a5,9(s0)
    3d08:	00a44683          	lbu	a3,10(s0)
    3d0c:	00e108a3          	sb	a4,17(sp)
    3d10:	00f10923          	sb	a5,18(sp)
    3d14:	fe070713          	addi	a4,a4,-32
    3d18:	fe078793          	addi	a5,a5,-32
    3d1c:	00f037b3          	snez	a5,a5
    3d20:	00e03733          	snez	a4,a4
    3d24:	00d109a3          	sb	a3,19(sp)
    3d28:	00e7e7b3          	or	a5,a5,a4
    3d2c:	00079863          	bnez	a5,3d3c <fatfs_get_file_entry+0x1dc>
    3d30:	fe068693          	addi	a3,a3,-32
    3d34:	02000793          	li	a5,32
    3d38:	00068a63          	beqz	a3,3d4c <fatfs_get_file_entry+0x1ec>
    3d3c:	00814703          	lbu	a4,8(sp)
    3d40:	02e00793          	li	a5,46
    3d44:	01671463          	bne	a4,s6,3d4c <fatfs_get_file_entry+0x1ec>
    3d48:	02000793          	li	a5,32
    3d4c:	00f10823          	sb	a5,16(sp)
    3d50:	000b8593          	mv	a1,s7
    3d54:	00090513          	mv	a0,s2
    3d58:	f11ff06f          	j	3c68 <fatfs_get_file_entry+0x108>

00003d5c <_open_directory>:
    3d5c:	eb010113          	addi	sp,sp,-336
    3d60:	15212023          	sw	s2,320(sp)
    3d64:	00008937          	lui	s2,0x8
    3d68:	ab090913          	addi	s2,s2,-1360 # 7ab0 <_fs>
    3d6c:	14812423          	sw	s0,328(sp)
    3d70:	00892403          	lw	s0,8(s2)
    3d74:	14912223          	sw	s1,324(sp)
    3d78:	13312e23          	sw	s3,316(sp)
    3d7c:	13412c23          	sw	s4,312(sp)
    3d80:	13512a23          	sw	s5,308(sp)
    3d84:	13612823          	sw	s6,304(sp)
    3d88:	14112623          	sw	ra,332(sp)
    3d8c:	00050a13          	mv	s4,a0
    3d90:	00058a93          	mv	s5,a1
    3d94:	fffff097          	auipc	ra,0xfffff
    3d98:	368080e7          	jalr	872(ra) # 30fc <fatfs_total_path_levels>
    3d9c:	00050b13          	mv	s6,a0
    3da0:	00000493          	li	s1,0
    3da4:	fff00993          	li	s3,-1
    3da8:	009b5863          	bge	s6,s1,3db8 <_open_directory+0x5c>
    3dac:	008aa023          	sw	s0,0(s5)
    3db0:	00100513          	li	a0,1
    3db4:	0240006f          	j	3dd8 <_open_directory+0x7c>
    3db8:	10400693          	li	a3,260
    3dbc:	02c10613          	addi	a2,sp,44
    3dc0:	00048593          	mv	a1,s1
    3dc4:	000a0513          	mv	a0,s4
    3dc8:	fffff097          	auipc	ra,0xfffff
    3dcc:	3a4080e7          	jalr	932(ra) # 316c <fatfs_get_substring>
    3dd0:	03351863          	bne	a0,s3,3e00 <_open_directory+0xa4>
    3dd4:	00000513          	li	a0,0
    3dd8:	14c12083          	lw	ra,332(sp)
    3ddc:	14812403          	lw	s0,328(sp)
    3de0:	14412483          	lw	s1,324(sp)
    3de4:	14012903          	lw	s2,320(sp)
    3de8:	13c12983          	lw	s3,316(sp)
    3dec:	13812a03          	lw	s4,312(sp)
    3df0:	13412a83          	lw	s5,308(sp)
    3df4:	13012b03          	lw	s6,304(sp)
    3df8:	15010113          	addi	sp,sp,336
    3dfc:	00008067          	ret
    3e00:	00c10693          	addi	a3,sp,12
    3e04:	02c10613          	addi	a2,sp,44
    3e08:	00040593          	mv	a1,s0
    3e0c:	00090513          	mv	a0,s2
    3e10:	00000097          	auipc	ra,0x0
    3e14:	d50080e7          	jalr	-688(ra) # 3b60 <fatfs_get_file_entry>
    3e18:	fa050ee3          	beqz	a0,3dd4 <_open_directory+0x78>
    3e1c:	01714783          	lbu	a5,23(sp)
    3e20:	0107f793          	andi	a5,a5,16
    3e24:	fa0788e3          	beqz	a5,3dd4 <_open_directory+0x78>
    3e28:	02015403          	lhu	s0,32(sp)
    3e2c:	02615783          	lhu	a5,38(sp)
    3e30:	00148493          	addi	s1,s1,1
    3e34:	01041413          	slli	s0,s0,0x10
    3e38:	00f40433          	add	s0,s0,a5
    3e3c:	f6dff06f          	j	3da8 <_open_directory+0x4c>

00003e40 <fl_opendir>:
    3e40:	fe010113          	addi	sp,sp,-32
    3e44:	fff00793          	li	a5,-1
    3e48:	00f12623          	sw	a5,12(sp)
    3e4c:	000067b7          	lui	a5,0x6
    3e50:	e907a783          	lw	a5,-368(a5) # 5e90 <_filelib_init>
    3e54:	00812c23          	sw	s0,24(sp)
    3e58:	01212823          	sw	s2,16(sp)
    3e5c:	00112e23          	sw	ra,28(sp)
    3e60:	00912a23          	sw	s1,20(sp)
    3e64:	00050913          	mv	s2,a0
    3e68:	00058413          	mv	s0,a1
    3e6c:	00079663          	bnez	a5,3e78 <fl_opendir+0x38>
    3e70:	fffff097          	auipc	ra,0xfffff
    3e74:	a58080e7          	jalr	-1448(ra) # 28c8 <fl_init>
    3e78:	000084b7          	lui	s1,0x8
    3e7c:	ab048493          	addi	s1,s1,-1360 # 7ab0 <_fs>
    3e80:	03c4a783          	lw	a5,60(s1)
    3e84:	00078463          	beqz	a5,3e8c <fl_opendir+0x4c>
    3e88:	000780e7          	jalr	a5
    3e8c:	00090513          	mv	a0,s2
    3e90:	fffff097          	auipc	ra,0xfffff
    3e94:	26c080e7          	jalr	620(ra) # 30fc <fatfs_total_path_levels>
    3e98:	fff00793          	li	a5,-1
    3e9c:	02f51063          	bne	a0,a5,3ebc <fl_opendir+0x7c>
    3ea0:	0084a783          	lw	a5,8(s1)
    3ea4:	00f12623          	sw	a5,12(sp)
    3ea8:	00c12783          	lw	a5,12(sp)
    3eac:	00042023          	sw	zero,0(s0)
    3eb0:	00040423          	sb	zero,8(s0)
    3eb4:	00f42223          	sw	a5,4(s0)
    3eb8:	0180006f          	j	3ed0 <fl_opendir+0x90>
    3ebc:	00c10593          	addi	a1,sp,12
    3ec0:	00090513          	mv	a0,s2
    3ec4:	00000097          	auipc	ra,0x0
    3ec8:	e98080e7          	jalr	-360(ra) # 3d5c <_open_directory>
    3ecc:	fc051ee3          	bnez	a0,3ea8 <fl_opendir+0x68>
    3ed0:	0404a783          	lw	a5,64(s1)
    3ed4:	00078463          	beqz	a5,3edc <fl_opendir+0x9c>
    3ed8:	000780e7          	jalr	a5
    3edc:	00c12703          	lw	a4,12(sp)
    3ee0:	fff00793          	li	a5,-1
    3ee4:	00f71463          	bne	a4,a5,3eec <fl_opendir+0xac>
    3ee8:	00000413          	li	s0,0
    3eec:	01c12083          	lw	ra,28(sp)
    3ef0:	00040513          	mv	a0,s0
    3ef4:	01812403          	lw	s0,24(sp)
    3ef8:	01412483          	lw	s1,20(sp)
    3efc:	01012903          	lw	s2,16(sp)
    3f00:	02010113          	addi	sp,sp,32
    3f04:	00008067          	ret

00003f08 <_open_file>:
    3f08:	fc010113          	addi	sp,sp,-64
    3f0c:	03312623          	sw	s3,44(sp)
    3f10:	02112e23          	sw	ra,60(sp)
    3f14:	02812c23          	sw	s0,56(sp)
    3f18:	02912a23          	sw	s1,52(sp)
    3f1c:	03212823          	sw	s2,48(sp)
    3f20:	00050993          	mv	s3,a0
    3f24:	ffffe097          	auipc	ra,0xffffe
    3f28:	7b4080e7          	jalr	1972(ra) # 26d8 <_allocate_file>
    3f2c:	06050463          	beqz	a0,3f94 <_open_file+0x8c>
    3f30:	01450913          	addi	s2,a0,20
    3f34:	00050413          	mv	s0,a0
    3f38:	10400613          	li	a2,260
    3f3c:	00000593          	li	a1,0
    3f40:	00090513          	mv	a0,s2
    3f44:	ffffe097          	auipc	ra,0xffffe
    3f48:	d80080e7          	jalr	-640(ra) # 1cc4 <memset>
    3f4c:	11840493          	addi	s1,s0,280
    3f50:	10400613          	li	a2,260
    3f54:	00000593          	li	a1,0
    3f58:	00048513          	mv	a0,s1
    3f5c:	ffffe097          	auipc	ra,0xffffe
    3f60:	d68080e7          	jalr	-664(ra) # 1cc4 <memset>
    3f64:	10400713          	li	a4,260
    3f68:	00048693          	mv	a3,s1
    3f6c:	00070613          	mv	a2,a4
    3f70:	00090593          	mv	a1,s2
    3f74:	00098513          	mv	a0,s3
    3f78:	fffff097          	auipc	ra,0xfffff
    3f7c:	2dc080e7          	jalr	732(ra) # 3254 <fatfs_split_path>
    3f80:	fff00793          	li	a5,-1
    3f84:	02f51a63          	bne	a0,a5,3fb8 <_open_file+0xb0>
    3f88:	00040513          	mv	a0,s0
    3f8c:	ffffe097          	auipc	ra,0xffffe
    3f90:	7c4080e7          	jalr	1988(ra) # 2750 <_free_file>
    3f94:	00000413          	li	s0,0
    3f98:	03c12083          	lw	ra,60(sp)
    3f9c:	00040513          	mv	a0,s0
    3fa0:	03812403          	lw	s0,56(sp)
    3fa4:	03412483          	lw	s1,52(sp)
    3fa8:	03012903          	lw	s2,48(sp)
    3fac:	02c12983          	lw	s3,44(sp)
    3fb0:	04010113          	addi	sp,sp,64
    3fb4:	00008067          	ret
    3fb8:	00040513          	mv	a0,s0
    3fbc:	fffff097          	auipc	ra,0xfffff
    3fc0:	514080e7          	jalr	1300(ra) # 34d0 <_check_file_open>
    3fc4:	fc0512e3          	bnez	a0,3f88 <_open_file+0x80>
    3fc8:	01444783          	lbu	a5,20(s0)
    3fcc:	08079c63          	bnez	a5,4064 <_open_file+0x15c>
    3fd0:	000087b7          	lui	a5,0x8
    3fd4:	ab87a783          	lw	a5,-1352(a5) # 7ab8 <_fs+0x8>
    3fd8:	00f42023          	sw	a5,0(s0)
    3fdc:	00042583          	lw	a1,0(s0)
    3fe0:	00048613          	mv	a2,s1
    3fe4:	000084b7          	lui	s1,0x8
    3fe8:	00010693          	mv	a3,sp
    3fec:	ab048513          	addi	a0,s1,-1360 # 7ab0 <_fs>
    3ff0:	00000097          	auipc	ra,0x0
    3ff4:	b70080e7          	jalr	-1168(ra) # 3b60 <fatfs_get_file_entry>
    3ff8:	f80508e3          	beqz	a0,3f88 <_open_file+0x80>
    3ffc:	00b14783          	lbu	a5,11(sp)
    4000:	0207f793          	andi	a5,a5,32
    4004:	f80782e3          	beqz	a5,3f88 <_open_file+0x80>
    4008:	00b00613          	li	a2,11
    400c:	00010593          	mv	a1,sp
    4010:	21c40513          	addi	a0,s0,540
    4014:	ffffe097          	auipc	ra,0xffffe
    4018:	ccc080e7          	jalr	-820(ra) # 1ce0 <memcpy>
    401c:	01c12783          	lw	a5,28(sp)
    4020:	01a15703          	lhu	a4,26(sp)
    4024:	00042423          	sw	zero,8(s0)
    4028:	00f42623          	sw	a5,12(s0)
    402c:	01415783          	lhu	a5,20(sp)
    4030:	42042a23          	sw	zero,1076(s0)
    4034:	00042823          	sw	zero,16(s0)
    4038:	01079793          	slli	a5,a5,0x10
    403c:	00e787b3          	add	a5,a5,a4
    4040:	00f42223          	sw	a5,4(s0)
    4044:	fff00793          	li	a5,-1
    4048:	42f42823          	sw	a5,1072(s0)
    404c:	22f42423          	sw	a5,552(s0)
    4050:	22f42623          	sw	a5,556(s0)
    4054:	ab048513          	addi	a0,s1,-1360
    4058:	00000097          	auipc	ra,0x0
    405c:	858080e7          	jalr	-1960(ra) # 38b0 <fatfs_fat_purge>
    4060:	f39ff06f          	j	3f98 <_open_file+0x90>
    4064:	00040593          	mv	a1,s0
    4068:	00090513          	mv	a0,s2
    406c:	00000097          	auipc	ra,0x0
    4070:	cf0080e7          	jalr	-784(ra) # 3d5c <_open_directory>
    4074:	f60514e3          	bnez	a0,3fdc <_open_file+0xd4>
    4078:	f11ff06f          	j	3f88 <_open_file+0x80>

0000407c <fatfs_sfn_exists>:
    407c:	fe010113          	addi	sp,sp,-32
    4080:	01212823          	sw	s2,16(sp)
    4084:	01312623          	sw	s3,12(sp)
    4088:	01412423          	sw	s4,8(sp)
    408c:	01512223          	sw	s5,4(sp)
    4090:	01612023          	sw	s6,0(sp)
    4094:	00112e23          	sw	ra,28(sp)
    4098:	00812c23          	sw	s0,24(sp)
    409c:	00912a23          	sw	s1,20(sp)
    40a0:	00050993          	mv	s3,a0
    40a4:	00058a93          	mv	s5,a1
    40a8:	00060b13          	mv	s6,a2
    40ac:	00000913          	li	s2,0
    40b0:	24450a13          	addi	s4,a0,580
    40b4:	00000693          	li	a3,0
    40b8:	00090613          	mv	a2,s2
    40bc:	000a8593          	mv	a1,s5
    40c0:	00098513          	mv	a0,s3
    40c4:	00000097          	auipc	ra,0x0
    40c8:	94c080e7          	jalr	-1716(ra) # 3a10 <fatfs_sector_reader>
    40cc:	00050413          	mv	s0,a0
    40d0:	06050263          	beqz	a0,4134 <fatfs_sfn_exists+0xb8>
    40d4:	00190913          	addi	s2,s2,1
    40d8:	04498493          	addi	s1,s3,68
    40dc:	00048513          	mv	a0,s1
    40e0:	fffff097          	auipc	ra,0xfffff
    40e4:	a58080e7          	jalr	-1448(ra) # 2b38 <fatfs_entry_lfn_text>
    40e8:	00050863          	beqz	a0,40f8 <fatfs_sfn_exists+0x7c>
    40ec:	02048493          	addi	s1,s1,32
    40f0:	ff4496e3          	bne	s1,s4,40dc <fatfs_sfn_exists+0x60>
    40f4:	fc1ff06f          	j	40b4 <fatfs_sfn_exists+0x38>
    40f8:	00048513          	mv	a0,s1
    40fc:	fffff097          	auipc	ra,0xfffff
    4100:	a50080e7          	jalr	-1456(ra) # 2b4c <fatfs_entry_lfn_invalid>
    4104:	fe0514e3          	bnez	a0,40ec <fatfs_sfn_exists+0x70>
    4108:	00048513          	mv	a0,s1
    410c:	fffff097          	auipc	ra,0xfffff
    4110:	ac4080e7          	jalr	-1340(ra) # 2bd0 <fatfs_entry_sfn_only>
    4114:	00050413          	mv	s0,a0
    4118:	fc050ae3          	beqz	a0,40ec <fatfs_sfn_exists+0x70>
    411c:	00b00613          	li	a2,11
    4120:	000b0593          	mv	a1,s6
    4124:	00048513          	mv	a0,s1
    4128:	ffffe097          	auipc	ra,0xffffe
    412c:	bfc080e7          	jalr	-1028(ra) # 1d24 <strncmp>
    4130:	fa051ee3          	bnez	a0,40ec <fatfs_sfn_exists+0x70>
    4134:	01c12083          	lw	ra,28(sp)
    4138:	00040513          	mv	a0,s0
    413c:	01812403          	lw	s0,24(sp)
    4140:	01412483          	lw	s1,20(sp)
    4144:	01012903          	lw	s2,16(sp)
    4148:	00c12983          	lw	s3,12(sp)
    414c:	00812a03          	lw	s4,8(sp)
    4150:	00412a83          	lw	s5,4(sp)
    4154:	00012b03          	lw	s6,0(sp)
    4158:	02010113          	addi	sp,sp,32
    415c:	00008067          	ret

00004160 <fatfs_update_file_length>:
    4160:	03852783          	lw	a5,56(a0)
    4164:	14078e63          	beqz	a5,42c0 <fatfs_update_file_length+0x160>
    4168:	fd010113          	addi	sp,sp,-48
    416c:	02912223          	sw	s1,36(sp)
    4170:	03212023          	sw	s2,32(sp)
    4174:	01312e23          	sw	s3,28(sp)
    4178:	01412c23          	sw	s4,24(sp)
    417c:	01612823          	sw	s6,16(sp)
    4180:	01712623          	sw	s7,12(sp)
    4184:	02112623          	sw	ra,44(sp)
    4188:	02812423          	sw	s0,40(sp)
    418c:	01512a23          	sw	s5,20(sp)
    4190:	00068913          	mv	s2,a3
    4194:	00060b93          	mv	s7,a2
    4198:	00058b13          	mv	s6,a1
    419c:	00050493          	mv	s1,a0
    41a0:	00000993          	li	s3,0
    41a4:	24450a13          	addi	s4,a0,580
    41a8:	00000693          	li	a3,0
    41ac:	00098613          	mv	a2,s3
    41b0:	000b0593          	mv	a1,s6
    41b4:	00048513          	mv	a0,s1
    41b8:	00000097          	auipc	ra,0x0
    41bc:	858080e7          	jalr	-1960(ra) # 3a10 <fatfs_sector_reader>
    41c0:	0c050863          	beqz	a0,4290 <fatfs_update_file_length+0x130>
    41c4:	04448413          	addi	s0,s1,68
    41c8:	00198993          	addi	s3,s3,1
    41cc:	00040a93          	mv	s5,s0
    41d0:	00040513          	mv	a0,s0
    41d4:	fffff097          	auipc	ra,0xfffff
    41d8:	964080e7          	jalr	-1692(ra) # 2b38 <fatfs_entry_lfn_text>
    41dc:	0a051463          	bnez	a0,4284 <fatfs_update_file_length+0x124>
    41e0:	00040513          	mv	a0,s0
    41e4:	fffff097          	auipc	ra,0xfffff
    41e8:	968080e7          	jalr	-1688(ra) # 2b4c <fatfs_entry_lfn_invalid>
    41ec:	08051c63          	bnez	a0,4284 <fatfs_update_file_length+0x124>
    41f0:	00040513          	mv	a0,s0
    41f4:	fffff097          	auipc	ra,0xfffff
    41f8:	9dc080e7          	jalr	-1572(ra) # 2bd0 <fatfs_entry_sfn_only>
    41fc:	08050463          	beqz	a0,4284 <fatfs_update_file_length+0x124>
    4200:	00b00613          	li	a2,11
    4204:	000b8593          	mv	a1,s7
    4208:	00040513          	mv	a0,s0
    420c:	ffffe097          	auipc	ra,0xffffe
    4210:	b18080e7          	jalr	-1256(ra) # 1d24 <strncmp>
    4214:	06051863          	bnez	a0,4284 <fatfs_update_file_length+0x124>
    4218:	00895793          	srli	a5,s2,0x8
    421c:	01240e23          	sb	s2,28(s0)
    4220:	00f40ea3          	sb	a5,29(s0)
    4224:	01095793          	srli	a5,s2,0x10
    4228:	01895913          	srli	s2,s2,0x18
    422c:	00f40f23          	sb	a5,30(s0)
    4230:	01240fa3          	sb	s2,31(s0)
    4234:	00040593          	mv	a1,s0
    4238:	02000613          	li	a2,32
    423c:	00040513          	mv	a0,s0
    4240:	ffffe097          	auipc	ra,0xffffe
    4244:	aa0080e7          	jalr	-1376(ra) # 1ce0 <memcpy>
    4248:	02812403          	lw	s0,40(sp)
    424c:	0384a783          	lw	a5,56(s1)
    4250:	2444a503          	lw	a0,580(s1)
    4254:	02c12083          	lw	ra,44(sp)
    4258:	02412483          	lw	s1,36(sp)
    425c:	02012903          	lw	s2,32(sp)
    4260:	01c12983          	lw	s3,28(sp)
    4264:	01812a03          	lw	s4,24(sp)
    4268:	01012b03          	lw	s6,16(sp)
    426c:	00c12b83          	lw	s7,12(sp)
    4270:	000a8593          	mv	a1,s5
    4274:	01412a83          	lw	s5,20(sp)
    4278:	00100613          	li	a2,1
    427c:	03010113          	addi	sp,sp,48
    4280:	00078067          	jr	a5
    4284:	02040413          	addi	s0,s0,32
    4288:	f54414e3          	bne	s0,s4,41d0 <fatfs_update_file_length+0x70>
    428c:	f1dff06f          	j	41a8 <fatfs_update_file_length+0x48>
    4290:	02c12083          	lw	ra,44(sp)
    4294:	02812403          	lw	s0,40(sp)
    4298:	02412483          	lw	s1,36(sp)
    429c:	02012903          	lw	s2,32(sp)
    42a0:	01c12983          	lw	s3,28(sp)
    42a4:	01812a03          	lw	s4,24(sp)
    42a8:	01412a83          	lw	s5,20(sp)
    42ac:	01012b03          	lw	s6,16(sp)
    42b0:	00c12b83          	lw	s7,12(sp)
    42b4:	00000513          	li	a0,0
    42b8:	03010113          	addi	sp,sp,48
    42bc:	00008067          	ret
    42c0:	00000513          	li	a0,0
    42c4:	00008067          	ret

000042c8 <fatfs_list_directory_next>:
    42c8:	ec010113          	addi	sp,sp,-320
    42cc:	13212823          	sw	s2,304(sp)
    42d0:	13312623          	sw	s3,300(sp)
    42d4:	13412423          	sw	s4,296(sp)
    42d8:	13512223          	sw	s5,292(sp)
    42dc:	13612023          	sw	s6,288(sp)
    42e0:	12112e23          	sw	ra,316(sp)
    42e4:	12812c23          	sw	s0,312(sp)
    42e8:	12912a23          	sw	s1,308(sp)
    42ec:	00050a13          	mv	s4,a0
    42f0:	00058913          	mv	s2,a1
    42f4:	00060993          	mv	s3,a2
    42f8:	10010ea3          	sb	zero,285(sp)
    42fc:	04450a93          	addi	s5,a0,68
    4300:	00f00b13          	li	s6,15
    4304:	00092603          	lw	a2,0(s2)
    4308:	00492583          	lw	a1,4(s2)
    430c:	00000693          	li	a3,0
    4310:	000a0513          	mv	a0,s4
    4314:	fffff097          	auipc	ra,0xfffff
    4318:	6fc080e7          	jalr	1788(ra) # 3a10 <fatfs_sector_reader>
    431c:	10050c63          	beqz	a0,4434 <fatfs_list_directory_next+0x16c>
    4320:	00894483          	lbu	s1,8(s2)
    4324:	00549413          	slli	s0,s1,0x5
    4328:	008a8433          	add	s0,s5,s0
    432c:	009b7c63          	bgeu	s6,s1,4344 <fatfs_list_directory_next+0x7c>
    4330:	00092783          	lw	a5,0(s2)
    4334:	00090423          	sb	zero,8(s2)
    4338:	00178793          	addi	a5,a5,1
    433c:	00f92023          	sw	a5,0(s2)
    4340:	fc5ff06f          	j	4304 <fatfs_list_directory_next+0x3c>
    4344:	00040513          	mv	a0,s0
    4348:	ffffe097          	auipc	ra,0xffffe
    434c:	7f0080e7          	jalr	2032(ra) # 2b38 <fatfs_entry_lfn_text>
    4350:	02050263          	beqz	a0,4374 <fatfs_list_directory_next+0xac>
    4354:	00040593          	mv	a1,s0
    4358:	01810513          	addi	a0,sp,24
    435c:	ffffe097          	auipc	ra,0xffffe
    4360:	6d4080e7          	jalr	1748(ra) # 2a30 <fatfs_lfn_cache_entry>
    4364:	00148493          	addi	s1,s1,1
    4368:	0ff4f493          	zext.b	s1,s1
    436c:	02040413          	addi	s0,s0,32
    4370:	fbdff06f          	j	432c <fatfs_list_directory_next+0x64>
    4374:	00040513          	mv	a0,s0
    4378:	ffffe097          	auipc	ra,0xffffe
    437c:	7d4080e7          	jalr	2004(ra) # 2b4c <fatfs_entry_lfn_invalid>
    4380:	00050663          	beqz	a0,438c <fatfs_list_directory_next+0xc4>
    4384:	10010ea3          	sb	zero,285(sp)
    4388:	fddff06f          	j	4364 <fatfs_list_directory_next+0x9c>
    438c:	00040593          	mv	a1,s0
    4390:	01810513          	addi	a0,sp,24
    4394:	ffffe097          	auipc	ra,0xffffe
    4398:	7ec080e7          	jalr	2028(ra) # 2b80 <fatfs_entry_lfn_exists>
    439c:	0c050063          	beqz	a0,445c <fatfs_list_directory_next+0x194>
    43a0:	01810513          	addi	a0,sp,24
    43a4:	ffffe097          	auipc	ra,0xffffe
    43a8:	758080e7          	jalr	1880(ra) # 2afc <fatfs_lfn_cache_get>
    43ac:	00050593          	mv	a1,a0
    43b0:	10300613          	li	a2,259
    43b4:	00098513          	mv	a0,s3
    43b8:	ffffe097          	auipc	ra,0xffffe
    43bc:	9ac080e7          	jalr	-1620(ra) # 1d64 <strncpy>
    43c0:	00040513          	mv	a0,s0
    43c4:	fffff097          	auipc	ra,0xfffff
    43c8:	84c080e7          	jalr	-1972(ra) # 2c10 <fatfs_entry_is_dir>
    43cc:	10a98223          	sb	a0,260(s3)
    43d0:	01d44783          	lbu	a5,29(s0)
    43d4:	01c44703          	lbu	a4,28(s0)
    43d8:	00148493          	addi	s1,s1,1
    43dc:	00879793          	slli	a5,a5,0x8
    43e0:	00e7e7b3          	or	a5,a5,a4
    43e4:	01e44703          	lbu	a4,30(s0)
    43e8:	00100513          	li	a0,1
    43ec:	01071713          	slli	a4,a4,0x10
    43f0:	00f76733          	or	a4,a4,a5
    43f4:	01f44783          	lbu	a5,31(s0)
    43f8:	01879793          	slli	a5,a5,0x18
    43fc:	00e7e7b3          	or	a5,a5,a4
    4400:	10f9a623          	sw	a5,268(s3)
    4404:	01544783          	lbu	a5,21(s0)
    4408:	01444703          	lbu	a4,20(s0)
    440c:	01a44683          	lbu	a3,26(s0)
    4410:	00879793          	slli	a5,a5,0x8
    4414:	00e7e7b3          	or	a5,a5,a4
    4418:	01b44703          	lbu	a4,27(s0)
    441c:	01079793          	slli	a5,a5,0x10
    4420:	00871713          	slli	a4,a4,0x8
    4424:	00d76733          	or	a4,a4,a3
    4428:	00e7e7b3          	or	a5,a5,a4
    442c:	10f9a423          	sw	a5,264(s3)
    4430:	00990423          	sb	s1,8(s2)
    4434:	13c12083          	lw	ra,316(sp)
    4438:	13812403          	lw	s0,312(sp)
    443c:	13412483          	lw	s1,308(sp)
    4440:	13012903          	lw	s2,304(sp)
    4444:	12c12983          	lw	s3,300(sp)
    4448:	12812a03          	lw	s4,296(sp)
    444c:	12412a83          	lw	s5,292(sp)
    4450:	12012b03          	lw	s6,288(sp)
    4454:	14010113          	addi	sp,sp,320
    4458:	00008067          	ret
    445c:	00040513          	mv	a0,s0
    4460:	ffffe097          	auipc	ra,0xffffe
    4464:	770080e7          	jalr	1904(ra) # 2bd0 <fatfs_entry_sfn_only>
    4468:	ee050ee3          	beqz	a0,4364 <fatfs_list_directory_next+0x9c>
    446c:	00810a13          	addi	s4,sp,8
    4470:	00d00613          	li	a2,13
    4474:	00000593          	li	a1,0
    4478:	000a0513          	mv	a0,s4
    447c:	10010ea3          	sb	zero,285(sp)
    4480:	ffffe097          	auipc	ra,0xffffe
    4484:	844080e7          	jalr	-1980(ra) # 1cc4 <memset>
    4488:	00000793          	li	a5,0
    448c:	00800713          	li	a4,8
    4490:	00f40633          	add	a2,s0,a5
    4494:	00064603          	lbu	a2,0(a2)
    4498:	00fa06b3          	add	a3,s4,a5
    449c:	00178793          	addi	a5,a5,1
    44a0:	00c68023          	sb	a2,0(a3)
    44a4:	fee796e3          	bne	a5,a4,4490 <fatfs_list_directory_next+0x1c8>
    44a8:	00844783          	lbu	a5,8(s0)
    44ac:	00944703          	lbu	a4,9(s0)
    44b0:	00a44683          	lbu	a3,10(s0)
    44b4:	00f108a3          	sb	a5,17(sp)
    44b8:	00e10923          	sb	a4,18(sp)
    44bc:	fe078793          	addi	a5,a5,-32
    44c0:	fe070713          	addi	a4,a4,-32
    44c4:	00f037b3          	snez	a5,a5
    44c8:	00e03733          	snez	a4,a4
    44cc:	00d109a3          	sb	a3,19(sp)
    44d0:	00e7e7b3          	or	a5,a5,a4
    44d4:	00079863          	bnez	a5,44e4 <fatfs_list_directory_next+0x21c>
    44d8:	fe068693          	addi	a3,a3,-32
    44dc:	02000793          	li	a5,32
    44e0:	00068a63          	beqz	a3,44f4 <fatfs_list_directory_next+0x22c>
    44e4:	00814703          	lbu	a4,8(sp)
    44e8:	02e00793          	li	a5,46
    44ec:	00f71463          	bne	a4,a5,44f4 <fatfs_list_directory_next+0x22c>
    44f0:	02000793          	li	a5,32
    44f4:	000a0593          	mv	a1,s4
    44f8:	00098513          	mv	a0,s3
    44fc:	00f10823          	sb	a5,16(sp)
    4500:	fffff097          	auipc	ra,0xfffff
    4504:	054080e7          	jalr	84(ra) # 3554 <fatfs_get_sfn_display_name>
    4508:	eb9ff06f          	j	43c0 <fatfs_list_directory_next+0xf8>

0000450c <fl_readdir>:
    450c:	000067b7          	lui	a5,0x6
    4510:	e907a783          	lw	a5,-368(a5) # 5e90 <_filelib_init>
    4514:	fd010113          	addi	sp,sp,-48
    4518:	03212023          	sw	s2,32(sp)
    451c:	01312e23          	sw	s3,28(sp)
    4520:	02112623          	sw	ra,44(sp)
    4524:	02812423          	sw	s0,40(sp)
    4528:	02912223          	sw	s1,36(sp)
    452c:	00050913          	mv	s2,a0
    4530:	00058993          	mv	s3,a1
    4534:	00079663          	bnez	a5,4540 <fl_readdir+0x34>
    4538:	ffffe097          	auipc	ra,0xffffe
    453c:	390080e7          	jalr	912(ra) # 28c8 <fl_init>
    4540:	000084b7          	lui	s1,0x8
    4544:	ab048413          	addi	s0,s1,-1360 # 7ab0 <_fs>
    4548:	03c42783          	lw	a5,60(s0)
    454c:	00078463          	beqz	a5,4554 <fl_readdir+0x48>
    4550:	000780e7          	jalr	a5
    4554:	00098613          	mv	a2,s3
    4558:	00090593          	mv	a1,s2
    455c:	ab048513          	addi	a0,s1,-1360
    4560:	00000097          	auipc	ra,0x0
    4564:	d68080e7          	jalr	-664(ra) # 42c8 <fatfs_list_directory_next>
    4568:	04042783          	lw	a5,64(s0)
    456c:	00078863          	beqz	a5,457c <fl_readdir+0x70>
    4570:	00a12623          	sw	a0,12(sp)
    4574:	000780e7          	jalr	a5
    4578:	00c12503          	lw	a0,12(sp)
    457c:	02c12083          	lw	ra,44(sp)
    4580:	02812403          	lw	s0,40(sp)
    4584:	00154513          	xori	a0,a0,1
    4588:	02412483          	lw	s1,36(sp)
    458c:	02012903          	lw	s2,32(sp)
    4590:	01c12983          	lw	s3,28(sp)
    4594:	40a00533          	neg	a0,a0
    4598:	03010113          	addi	sp,sp,48
    459c:	00008067          	ret

000045a0 <_read_sectors>:
    45a0:	fd010113          	addi	sp,sp,-48
    45a4:	01512a23          	sw	s5,20(sp)
    45a8:	00008ab7          	lui	s5,0x8
    45ac:	01312e23          	sw	s3,28(sp)
    45b0:	ab0ac983          	lbu	s3,-1360(s5) # 7ab0 <_fs>
    45b4:	01612823          	sw	s6,16(sp)
    45b8:	00058b13          	mv	s6,a1
    45bc:	02912223          	sw	s1,36(sp)
    45c0:	00098593          	mv	a1,s3
    45c4:	00050493          	mv	s1,a0
    45c8:	000b0513          	mv	a0,s6
    45cc:	02112623          	sw	ra,44(sp)
    45d0:	02812423          	sw	s0,40(sp)
    45d4:	01412c23          	sw	s4,24(sp)
    45d8:	00068413          	mv	s0,a3
    45dc:	01712623          	sw	s7,12(sp)
    45e0:	01812423          	sw	s8,8(sp)
    45e4:	03212023          	sw	s2,32(sp)
    45e8:	00060c13          	mv	s8,a2
    45ec:	ffffd097          	auipc	ra,0xffffd
    45f0:	62c080e7          	jalr	1580(ra) # 1c18 <__udivsi3>
    45f4:	00050a13          	mv	s4,a0
    45f8:	00098593          	mv	a1,s3
    45fc:	000b0513          	mv	a0,s6
    4600:	ffffd097          	auipc	ra,0xffffd
    4604:	660080e7          	jalr	1632(ra) # 1c60 <__umodsi3>
    4608:	00a407b3          	add	a5,s0,a0
    460c:	00050b93          	mv	s7,a0
    4610:	00f9fe63          	bgeu	s3,a5,462c <_read_sectors+0x8c>
    4614:	000a0593          	mv	a1,s4
    4618:	00098513          	mv	a0,s3
    461c:	ffffe097          	auipc	ra,0xffffe
    4620:	e18080e7          	jalr	-488(ra) # 2434 <__mulsi3>
    4624:	416987b3          	sub	a5,s3,s6
    4628:	00f50433          	add	s0,a0,a5
    462c:	2284a903          	lw	s2,552(s1)
    4630:	07491863          	bne	s2,s4,46a0 <_read_sectors+0x100>
    4634:	22c4a583          	lw	a1,556(s1)
    4638:	fff00793          	li	a5,-1
    463c:	02f58663          	beq	a1,a5,4668 <_read_sectors+0xc8>
    4640:	ab0a8513          	addi	a0,s5,-1360
    4644:	ffffe097          	auipc	ra,0xffffe
    4648:	154080e7          	jalr	340(ra) # 2798 <fatfs_lba_of_cluster>
    464c:	017505b3          	add	a1,a0,s7
    4650:	00040693          	mv	a3,s0
    4654:	000c0613          	mv	a2,s8
    4658:	ab0a8513          	addi	a0,s5,-1360
    465c:	ffffe097          	auipc	ra,0xffffe
    4660:	188080e7          	jalr	392(ra) # 27e4 <fatfs_sector_read>
    4664:	00051463          	bnez	a0,466c <_read_sectors+0xcc>
    4668:	00000413          	li	s0,0
    466c:	02c12083          	lw	ra,44(sp)
    4670:	00040513          	mv	a0,s0
    4674:	02812403          	lw	s0,40(sp)
    4678:	02412483          	lw	s1,36(sp)
    467c:	02012903          	lw	s2,32(sp)
    4680:	01c12983          	lw	s3,28(sp)
    4684:	01812a03          	lw	s4,24(sp)
    4688:	01412a83          	lw	s5,20(sp)
    468c:	01012b03          	lw	s6,16(sp)
    4690:	00c12b83          	lw	s7,12(sp)
    4694:	00812c03          	lw	s8,8(sp)
    4698:	03010113          	addi	sp,sp,48
    469c:	00008067          	ret
    46a0:	033b6463          	bltu	s6,s3,46c8 <_read_sectors+0x128>
    46a4:	00190793          	addi	a5,s2,1
    46a8:	03479063          	bne	a5,s4,46c8 <_read_sectors+0x128>
    46ac:	22c4a583          	lw	a1,556(s1)
    46b0:	03496263          	bltu	s2,s4,46d4 <_read_sectors+0x134>
    46b4:	fff00793          	li	a5,-1
    46b8:	faf588e3          	beq	a1,a5,4668 <_read_sectors+0xc8>
    46bc:	22b4a623          	sw	a1,556(s1)
    46c0:	2344a423          	sw	s4,552(s1)
    46c4:	f7dff06f          	j	4640 <_read_sectors+0xa0>
    46c8:	0044a583          	lw	a1,4(s1)
    46cc:	00000913          	li	s2,0
    46d0:	fe1ff06f          	j	46b0 <_read_sectors+0x110>
    46d4:	ab0a8513          	addi	a0,s5,-1360
    46d8:	fffff097          	auipc	ra,0xfffff
    46dc:	230080e7          	jalr	560(ra) # 3908 <fatfs_find_next_cluster>
    46e0:	00050593          	mv	a1,a0
    46e4:	00190913          	addi	s2,s2,1
    46e8:	fc9ff06f          	j	46b0 <_read_sectors+0x110>

000046ec <fatfs_set_fs_info_next_free_cluster>:
    46ec:	03052783          	lw	a5,48(a0)
    46f0:	0a078463          	beqz	a5,4798 <fatfs_set_fs_info_next_free_cluster+0xac>
    46f4:	fe010113          	addi	sp,sp,-32
    46f8:	01c52783          	lw	a5,28(a0)
    46fc:	00912a23          	sw	s1,20(sp)
    4700:	00058493          	mv	s1,a1
    4704:	01855583          	lhu	a1,24(a0)
    4708:	00812c23          	sw	s0,24(sp)
    470c:	00112e23          	sw	ra,28(sp)
    4710:	00f585b3          	add	a1,a1,a5
    4714:	00050413          	mv	s0,a0
    4718:	ffffe097          	auipc	ra,0xffffe
    471c:	ed4080e7          	jalr	-300(ra) # 25ec <fatfs_fat_read_sector>
    4720:	00050593          	mv	a1,a0
    4724:	06050063          	beqz	a0,4784 <fatfs_set_fs_info_next_free_cluster+0x98>
    4728:	20852783          	lw	a5,520(a0)
    472c:	0084d713          	srli	a4,s1,0x8
    4730:	00100613          	li	a2,1
    4734:	1e978623          	sb	s1,492(a5)
    4738:	20852783          	lw	a5,520(a0)
    473c:	1ee786a3          	sb	a4,493(a5)
    4740:	20852783          	lw	a5,520(a0)
    4744:	0104d713          	srli	a4,s1,0x10
    4748:	1ee78723          	sb	a4,494(a5)
    474c:	20852783          	lw	a5,520(a0)
    4750:	0184d713          	srli	a4,s1,0x18
    4754:	1ee787a3          	sb	a4,495(a5)
    4758:	03842783          	lw	a5,56(s0)
    475c:	20c52223          	sw	a2,516(a0)
    4760:	02942223          	sw	s1,36(s0)
    4764:	00078a63          	beqz	a5,4778 <fatfs_set_fs_info_next_free_cluster+0x8c>
    4768:	20052503          	lw	a0,512(a0)
    476c:	00b12623          	sw	a1,12(sp)
    4770:	000780e7          	jalr	a5
    4774:	00c12583          	lw	a1,12(sp)
    4778:	fff00793          	li	a5,-1
    477c:	20f5a023          	sw	a5,512(a1)
    4780:	2005a223          	sw	zero,516(a1)
    4784:	01c12083          	lw	ra,28(sp)
    4788:	01812403          	lw	s0,24(sp)
    478c:	01412483          	lw	s1,20(sp)
    4790:	02010113          	addi	sp,sp,32
    4794:	00008067          	ret
    4798:	00008067          	ret

0000479c <fatfs_find_blank_cluster>:
    479c:	fd010113          	addi	sp,sp,-48
    47a0:	01312e23          	sw	s3,28(sp)
    47a4:	100009b7          	lui	s3,0x10000
    47a8:	02912223          	sw	s1,36(sp)
    47ac:	03212023          	sw	s2,32(sp)
    47b0:	02112623          	sw	ra,44(sp)
    47b4:	02812423          	sw	s0,40(sp)
    47b8:	00050913          	mv	s2,a0
    47bc:	00058493          	mv	s1,a1
    47c0:	fff98993          	addi	s3,s3,-1 # fffffff <__stacktop+0xffeffff>
    47c4:	03092783          	lw	a5,48(s2)
    47c8:	0074d413          	srli	s0,s1,0x7
    47cc:	00079463          	bnez	a5,47d4 <fatfs_find_blank_cluster+0x38>
    47d0:	0084d413          	srli	s0,s1,0x8
    47d4:	02092783          	lw	a5,32(s2)
    47d8:	0cf47863          	bgeu	s0,a5,48a8 <fatfs_find_blank_cluster+0x10c>
    47dc:	01492583          	lw	a1,20(s2)
    47e0:	00090513          	mv	a0,s2
    47e4:	00c12623          	sw	a2,12(sp)
    47e8:	00b405b3          	add	a1,s0,a1
    47ec:	ffffe097          	auipc	ra,0xffffe
    47f0:	e00080e7          	jalr	-512(ra) # 25ec <fatfs_fat_read_sector>
    47f4:	0a050a63          	beqz	a0,48a8 <fatfs_find_blank_cluster+0x10c>
    47f8:	03092783          	lw	a5,48(s2)
    47fc:	20852703          	lw	a4,520(a0)
    4800:	00c12603          	lw	a2,12(sp)
    4804:	04079a63          	bnez	a5,4858 <fatfs_find_blank_cluster+0xbc>
    4808:	00841413          	slli	s0,s0,0x8
    480c:	40848433          	sub	s0,s1,s0
    4810:	00141413          	slli	s0,s0,0x1
    4814:	01041413          	slli	s0,s0,0x10
    4818:	01045413          	srli	s0,s0,0x10
    481c:	00870733          	add	a4,a4,s0
    4820:	00174783          	lbu	a5,1(a4)
    4824:	00074703          	lbu	a4,0(a4)
    4828:	00879793          	slli	a5,a5,0x8
    482c:	00e787b3          	add	a5,a5,a4
    4830:	06079863          	bnez	a5,48a0 <fatfs_find_blank_cluster+0x104>
    4834:	00962023          	sw	s1,0(a2)
    4838:	00100513          	li	a0,1
    483c:	02c12083          	lw	ra,44(sp)
    4840:	02812403          	lw	s0,40(sp)
    4844:	02412483          	lw	s1,36(sp)
    4848:	02012903          	lw	s2,32(sp)
    484c:	01c12983          	lw	s3,28(sp)
    4850:	03010113          	addi	sp,sp,48
    4854:	00008067          	ret
    4858:	00741413          	slli	s0,s0,0x7
    485c:	40848433          	sub	s0,s1,s0
    4860:	00241413          	slli	s0,s0,0x2
    4864:	01041413          	slli	s0,s0,0x10
    4868:	01045413          	srli	s0,s0,0x10
    486c:	00870733          	add	a4,a4,s0
    4870:	00374783          	lbu	a5,3(a4)
    4874:	00274683          	lbu	a3,2(a4)
    4878:	01879793          	slli	a5,a5,0x18
    487c:	01069693          	slli	a3,a3,0x10
    4880:	00d787b3          	add	a5,a5,a3
    4884:	00074683          	lbu	a3,0(a4)
    4888:	00174703          	lbu	a4,1(a4)
    488c:	00d787b3          	add	a5,a5,a3
    4890:	00871713          	slli	a4,a4,0x8
    4894:	00e787b3          	add	a5,a5,a4
    4898:	0137f7b3          	and	a5,a5,s3
    489c:	f95ff06f          	j	4830 <fatfs_find_blank_cluster+0x94>
    48a0:	00148493          	addi	s1,s1,1
    48a4:	f21ff06f          	j	47c4 <fatfs_find_blank_cluster+0x28>
    48a8:	00000513          	li	a0,0
    48ac:	f91ff06f          	j	483c <fatfs_find_blank_cluster+0xa0>

000048b0 <fatfs_fat_set_cluster>:
    48b0:	03052783          	lw	a5,48(a0)
    48b4:	fe010113          	addi	sp,sp,-32
    48b8:	00812c23          	sw	s0,24(sp)
    48bc:	00912a23          	sw	s1,20(sp)
    48c0:	01212823          	sw	s2,16(sp)
    48c4:	00112e23          	sw	ra,28(sp)
    48c8:	00050913          	mv	s2,a0
    48cc:	00058413          	mv	s0,a1
    48d0:	0085d493          	srli	s1,a1,0x8
    48d4:	00078463          	beqz	a5,48dc <fatfs_fat_set_cluster+0x2c>
    48d8:	0075d493          	srli	s1,a1,0x7
    48dc:	01492583          	lw	a1,20(s2)
    48e0:	00090513          	mv	a0,s2
    48e4:	00c12623          	sw	a2,12(sp)
    48e8:	00b485b3          	add	a1,s1,a1
    48ec:	ffffe097          	auipc	ra,0xffffe
    48f0:	d00080e7          	jalr	-768(ra) # 25ec <fatfs_fat_read_sector>
    48f4:	00050793          	mv	a5,a0
    48f8:	00000513          	li	a0,0
    48fc:	04078663          	beqz	a5,4948 <fatfs_fat_set_cluster+0x98>
    4900:	03092683          	lw	a3,48(s2)
    4904:	2087a703          	lw	a4,520(a5)
    4908:	00c12603          	lw	a2,12(sp)
    490c:	04069a63          	bnez	a3,4960 <fatfs_fat_set_cluster+0xb0>
    4910:	00849493          	slli	s1,s1,0x8
    4914:	40940433          	sub	s0,s0,s1
    4918:	00141413          	slli	s0,s0,0x1
    491c:	01041413          	slli	s0,s0,0x10
    4920:	01045413          	srli	s0,s0,0x10
    4924:	00870733          	add	a4,a4,s0
    4928:	00c70023          	sb	a2,0(a4)
    492c:	2087a703          	lw	a4,520(a5)
    4930:	00865613          	srli	a2,a2,0x8
    4934:	00870733          	add	a4,a4,s0
    4938:	00c700a3          	sb	a2,1(a4)
    493c:	00100713          	li	a4,1
    4940:	20e7a223          	sw	a4,516(a5)
    4944:	00100513          	li	a0,1
    4948:	01c12083          	lw	ra,28(sp)
    494c:	01812403          	lw	s0,24(sp)
    4950:	01412483          	lw	s1,20(sp)
    4954:	01012903          	lw	s2,16(sp)
    4958:	02010113          	addi	sp,sp,32
    495c:	00008067          	ret
    4960:	00749493          	slli	s1,s1,0x7
    4964:	40940433          	sub	s0,s0,s1
    4968:	00241413          	slli	s0,s0,0x2
    496c:	01041413          	slli	s0,s0,0x10
    4970:	01045413          	srli	s0,s0,0x10
    4974:	00870733          	add	a4,a4,s0
    4978:	00c70023          	sb	a2,0(a4)
    497c:	2087a703          	lw	a4,520(a5)
    4980:	00865693          	srli	a3,a2,0x8
    4984:	00870733          	add	a4,a4,s0
    4988:	00d700a3          	sb	a3,1(a4)
    498c:	2087a703          	lw	a4,520(a5)
    4990:	01065693          	srli	a3,a2,0x10
    4994:	01865613          	srli	a2,a2,0x18
    4998:	00870733          	add	a4,a4,s0
    499c:	00d70123          	sb	a3,2(a4)
    49a0:	2087a703          	lw	a4,520(a5)
    49a4:	00870733          	add	a4,a4,s0
    49a8:	00c701a3          	sb	a2,3(a4)
    49ac:	f91ff06f          	j	493c <fatfs_fat_set_cluster+0x8c>

000049b0 <fatfs_free_cluster_chain>:
    49b0:	fe010113          	addi	sp,sp,-32
    49b4:	00812c23          	sw	s0,24(sp)
    49b8:	00912a23          	sw	s1,20(sp)
    49bc:	00112e23          	sw	ra,28(sp)
    49c0:	01212823          	sw	s2,16(sp)
    49c4:	00050493          	mv	s1,a0
    49c8:	ffd00413          	li	s0,-3
    49cc:	fff58793          	addi	a5,a1,-1
    49d0:	02f47063          	bgeu	s0,a5,49f0 <fatfs_free_cluster_chain+0x40>
    49d4:	01c12083          	lw	ra,28(sp)
    49d8:	01812403          	lw	s0,24(sp)
    49dc:	01412483          	lw	s1,20(sp)
    49e0:	01012903          	lw	s2,16(sp)
    49e4:	00100513          	li	a0,1
    49e8:	02010113          	addi	sp,sp,32
    49ec:	00008067          	ret
    49f0:	00048513          	mv	a0,s1
    49f4:	00b12623          	sw	a1,12(sp)
    49f8:	fffff097          	auipc	ra,0xfffff
    49fc:	f10080e7          	jalr	-240(ra) # 3908 <fatfs_find_next_cluster>
    4a00:	00c12583          	lw	a1,12(sp)
    4a04:	00050913          	mv	s2,a0
    4a08:	00000613          	li	a2,0
    4a0c:	00048513          	mv	a0,s1
    4a10:	00000097          	auipc	ra,0x0
    4a14:	ea0080e7          	jalr	-352(ra) # 48b0 <fatfs_fat_set_cluster>
    4a18:	00090593          	mv	a1,s2
    4a1c:	fb1ff06f          	j	49cc <fatfs_free_cluster_chain+0x1c>

00004a20 <fatfs_fat_add_cluster_to_chain>:
    4a20:	fd010113          	addi	sp,sp,-48
    4a24:	02912223          	sw	s1,36(sp)
    4a28:	02112623          	sw	ra,44(sp)
    4a2c:	02812423          	sw	s0,40(sp)
    4a30:	03212023          	sw	s2,32(sp)
    4a34:	01312e23          	sw	s3,28(sp)
    4a38:	fff00493          	li	s1,-1
    4a3c:	02959263          	bne	a1,s1,4a60 <fatfs_fat_add_cluster_to_chain+0x40>
    4a40:	00000513          	li	a0,0
    4a44:	02c12083          	lw	ra,44(sp)
    4a48:	02812403          	lw	s0,40(sp)
    4a4c:	02412483          	lw	s1,36(sp)
    4a50:	02012903          	lw	s2,32(sp)
    4a54:	01c12983          	lw	s3,28(sp)
    4a58:	03010113          	addi	sp,sp,48
    4a5c:	00008067          	ret
    4a60:	00050913          	mv	s2,a0
    4a64:	00058413          	mv	s0,a1
    4a68:	00060993          	mv	s3,a2
    4a6c:	00040593          	mv	a1,s0
    4a70:	00090513          	mv	a0,s2
    4a74:	00812623          	sw	s0,12(sp)
    4a78:	fffff097          	auipc	ra,0xfffff
    4a7c:	e90080e7          	jalr	-368(ra) # 3908 <fatfs_find_next_cluster>
    4a80:	00050413          	mv	s0,a0
    4a84:	fa050ee3          	beqz	a0,4a40 <fatfs_fat_add_cluster_to_chain+0x20>
    4a88:	00c12583          	lw	a1,12(sp)
    4a8c:	fe9510e3          	bne	a0,s1,4a6c <fatfs_fat_add_cluster_to_chain+0x4c>
    4a90:	00098613          	mv	a2,s3
    4a94:	00090513          	mv	a0,s2
    4a98:	00000097          	auipc	ra,0x0
    4a9c:	e18080e7          	jalr	-488(ra) # 48b0 <fatfs_fat_set_cluster>
    4aa0:	00040613          	mv	a2,s0
    4aa4:	00098593          	mv	a1,s3
    4aa8:	00090513          	mv	a0,s2
    4aac:	00000097          	auipc	ra,0x0
    4ab0:	e04080e7          	jalr	-508(ra) # 48b0 <fatfs_fat_set_cluster>
    4ab4:	00100513          	li	a0,1
    4ab8:	f8dff06f          	j	4a44 <fatfs_fat_add_cluster_to_chain+0x24>

00004abc <fatfs_add_free_space>:
    4abc:	02452783          	lw	a5,36(a0)
    4ac0:	fd010113          	addi	sp,sp,-48
    4ac4:	02812423          	sw	s0,40(sp)
    4ac8:	01312e23          	sw	s3,28(sp)
    4acc:	01412c23          	sw	s4,24(sp)
    4ad0:	0005a983          	lw	s3,0(a1)
    4ad4:	01512a23          	sw	s5,20(sp)
    4ad8:	00058a13          	mv	s4,a1
    4adc:	02112623          	sw	ra,44(sp)
    4ae0:	02912223          	sw	s1,36(sp)
    4ae4:	03212023          	sw	s2,32(sp)
    4ae8:	fff00593          	li	a1,-1
    4aec:	00050413          	mv	s0,a0
    4af0:	00060a93          	mv	s5,a2
    4af4:	00b78663          	beq	a5,a1,4b00 <fatfs_add_free_space+0x44>
    4af8:	00000097          	auipc	ra,0x0
    4afc:	bf4080e7          	jalr	-1036(ra) # 46ec <fatfs_set_fs_info_next_free_cluster>
    4b00:	00000493          	li	s1,0
    4b04:	03549663          	bne	s1,s5,4b30 <fatfs_add_free_space+0x74>
    4b08:	00100513          	li	a0,1
    4b0c:	02c12083          	lw	ra,44(sp)
    4b10:	02812403          	lw	s0,40(sp)
    4b14:	02412483          	lw	s1,36(sp)
    4b18:	02012903          	lw	s2,32(sp)
    4b1c:	01c12983          	lw	s3,28(sp)
    4b20:	01812a03          	lw	s4,24(sp)
    4b24:	01412a83          	lw	s5,20(sp)
    4b28:	03010113          	addi	sp,sp,48
    4b2c:	00008067          	ret
    4b30:	00842583          	lw	a1,8(s0)
    4b34:	00c10613          	addi	a2,sp,12
    4b38:	00040513          	mv	a0,s0
    4b3c:	00000097          	auipc	ra,0x0
    4b40:	c60080e7          	jalr	-928(ra) # 479c <fatfs_find_blank_cluster>
    4b44:	fc0504e3          	beqz	a0,4b0c <fatfs_add_free_space+0x50>
    4b48:	00c12903          	lw	s2,12(sp)
    4b4c:	00098593          	mv	a1,s3
    4b50:	00040513          	mv	a0,s0
    4b54:	00090613          	mv	a2,s2
    4b58:	00000097          	auipc	ra,0x0
    4b5c:	d58080e7          	jalr	-680(ra) # 48b0 <fatfs_fat_set_cluster>
    4b60:	fff00613          	li	a2,-1
    4b64:	00090593          	mv	a1,s2
    4b68:	00040513          	mv	a0,s0
    4b6c:	00000097          	auipc	ra,0x0
    4b70:	d44080e7          	jalr	-700(ra) # 48b0 <fatfs_fat_set_cluster>
    4b74:	00049463          	bnez	s1,4b7c <fatfs_add_free_space+0xc0>
    4b78:	012a2023          	sw	s2,0(s4)
    4b7c:	00148493          	addi	s1,s1,1
    4b80:	00090993          	mv	s3,s2
    4b84:	f81ff06f          	j	4b04 <fatfs_add_free_space+0x48>

00004b88 <_write_sectors>:
    4b88:	fb010113          	addi	sp,sp,-80
    4b8c:	03512a23          	sw	s5,52(sp)
    4b90:	00008ab7          	lui	s5,0x8
    4b94:	04112623          	sw	ra,76(sp)
    4b98:	04812423          	sw	s0,72(sp)
    4b9c:	04912223          	sw	s1,68(sp)
    4ba0:	03412c23          	sw	s4,56(sp)
    4ba4:	03612823          	sw	s6,48(sp)
    4ba8:	03712623          	sw	s7,44(sp)
    4bac:	03812423          	sw	s8,40(sp)
    4bb0:	03912223          	sw	s9,36(sp)
    4bb4:	03a12023          	sw	s10,32(sp)
    4bb8:	05212023          	sw	s2,64(sp)
    4bbc:	03312e23          	sw	s3,60(sp)
    4bc0:	ab0a8b93          	addi	s7,s5,-1360 # 7ab0 <_fs>
    4bc4:	000bc983          	lbu	s3,0(s7)
    4bc8:	00058b13          	mv	s6,a1
    4bcc:	fff00793          	li	a5,-1
    4bd0:	00098593          	mv	a1,s3
    4bd4:	00050493          	mv	s1,a0
    4bd8:	000b0513          	mv	a0,s6
    4bdc:	00068c13          	mv	s8,a3
    4be0:	00f12e23          	sw	a5,28(sp)
    4be4:	00060d13          	mv	s10,a2
    4be8:	ffffd097          	auipc	ra,0xffffd
    4bec:	030080e7          	jalr	48(ra) # 1c18 <__udivsi3>
    4bf0:	00050a13          	mv	s4,a0
    4bf4:	00098593          	mv	a1,s3
    4bf8:	000b0513          	mv	a0,s6
    4bfc:	ffffd097          	auipc	ra,0xffffd
    4c00:	064080e7          	jalr	100(ra) # 1c60 <__umodsi3>
    4c04:	00ac07b3          	add	a5,s8,a0
    4c08:	00050c93          	mv	s9,a0
    4c0c:	000c0413          	mv	s0,s8
    4c10:	00f9fe63          	bgeu	s3,a5,4c2c <_write_sectors+0xa4>
    4c14:	000a0593          	mv	a1,s4
    4c18:	00098513          	mv	a0,s3
    4c1c:	ffffe097          	auipc	ra,0xffffe
    4c20:	818080e7          	jalr	-2024(ra) # 2434 <__mulsi3>
    4c24:	416987b3          	sub	a5,s3,s6
    4c28:	00f50433          	add	s0,a0,a5
    4c2c:	2284a903          	lw	s2,552(s1)
    4c30:	03491a63          	bne	s2,s4,4c64 <_write_sectors+0xdc>
    4c34:	22c4a583          	lw	a1,556(s1)
    4c38:	ab0a8513          	addi	a0,s5,-1360
    4c3c:	ffffe097          	auipc	ra,0xffffe
    4c40:	b5c080e7          	jalr	-1188(ra) # 2798 <fatfs_lba_of_cluster>
    4c44:	019505b3          	add	a1,a0,s9
    4c48:	00040693          	mv	a3,s0
    4c4c:	000d0613          	mv	a2,s10
    4c50:	ab0a8513          	addi	a0,s5,-1360
    4c54:	ffffe097          	auipc	ra,0xffffe
    4c58:	ba8080e7          	jalr	-1112(ra) # 27fc <fatfs_sector_write>
    4c5c:	04050a63          	beqz	a0,4cb0 <_write_sectors+0x128>
    4c60:	0540006f          	j	4cb4 <_write_sectors+0x12c>
    4c64:	093b6663          	bltu	s6,s3,4cf0 <_write_sectors+0x168>
    4c68:	00190793          	addi	a5,s2,1
    4c6c:	09479263          	bne	a5,s4,4cf0 <_write_sectors+0x168>
    4c70:	22c4a583          	lw	a1,556(s1)
    4c74:	fff00b13          	li	s6,-1
    4c78:	09496263          	bltu	s2,s4,4cfc <_write_sectors+0x174>
    4c7c:	fff00793          	li	a5,-1
    4c80:	0af59463          	bne	a1,a5,4d28 <_write_sectors+0x1a0>
    4c84:	000bc583          	lbu	a1,0(s7)
    4c88:	fff58513          	addi	a0,a1,-1
    4c8c:	01850533          	add	a0,a0,s8
    4c90:	ffffd097          	auipc	ra,0xffffd
    4c94:	f88080e7          	jalr	-120(ra) # 1c18 <__udivsi3>
    4c98:	00050613          	mv	a2,a0
    4c9c:	01c10593          	addi	a1,sp,28
    4ca0:	000b8513          	mv	a0,s7
    4ca4:	00000097          	auipc	ra,0x0
    4ca8:	e18080e7          	jalr	-488(ra) # 4abc <fatfs_add_free_space>
    4cac:	06051c63          	bnez	a0,4d24 <_write_sectors+0x19c>
    4cb0:	00000413          	li	s0,0
    4cb4:	04c12083          	lw	ra,76(sp)
    4cb8:	00040513          	mv	a0,s0
    4cbc:	04812403          	lw	s0,72(sp)
    4cc0:	04412483          	lw	s1,68(sp)
    4cc4:	04012903          	lw	s2,64(sp)
    4cc8:	03c12983          	lw	s3,60(sp)
    4ccc:	03812a03          	lw	s4,56(sp)
    4cd0:	03412a83          	lw	s5,52(sp)
    4cd4:	03012b03          	lw	s6,48(sp)
    4cd8:	02c12b83          	lw	s7,44(sp)
    4cdc:	02812c03          	lw	s8,40(sp)
    4ce0:	02412c83          	lw	s9,36(sp)
    4ce4:	02012d03          	lw	s10,32(sp)
    4ce8:	05010113          	addi	sp,sp,80
    4cec:	00008067          	ret
    4cf0:	0044a583          	lw	a1,4(s1)
    4cf4:	00000913          	li	s2,0
    4cf8:	f7dff06f          	j	4c74 <_write_sectors+0xec>
    4cfc:	ab0a8513          	addi	a0,s5,-1360
    4d00:	00b12623          	sw	a1,12(sp)
    4d04:	fffff097          	auipc	ra,0xfffff
    4d08:	c04080e7          	jalr	-1020(ra) # 3908 <fatfs_find_next_cluster>
    4d0c:	00c12583          	lw	a1,12(sp)
    4d10:	00b12e23          	sw	a1,28(sp)
    4d14:	f76508e3          	beq	a0,s6,4c84 <_write_sectors+0xfc>
    4d18:	00190913          	addi	s2,s2,1
    4d1c:	00050593          	mv	a1,a0
    4d20:	f59ff06f          	j	4c78 <_write_sectors+0xf0>
    4d24:	01c12583          	lw	a1,28(sp)
    4d28:	22b4a623          	sw	a1,556(s1)
    4d2c:	2344a423          	sw	s4,552(s1)
    4d30:	f09ff06f          	j	4c38 <_write_sectors+0xb0>

00004d34 <fl_fflush>:
    4d34:	000067b7          	lui	a5,0x6
    4d38:	e907a783          	lw	a5,-368(a5) # 5e90 <_filelib_init>
    4d3c:	ff010113          	addi	sp,sp,-16
    4d40:	00812423          	sw	s0,8(sp)
    4d44:	00112623          	sw	ra,12(sp)
    4d48:	00912223          	sw	s1,4(sp)
    4d4c:	00050413          	mv	s0,a0
    4d50:	00079663          	bnez	a5,4d5c <fl_fflush+0x28>
    4d54:	ffffe097          	auipc	ra,0xffffe
    4d58:	b74080e7          	jalr	-1164(ra) # 28c8 <fl_init>
    4d5c:	04040663          	beqz	s0,4da8 <fl_fflush+0x74>
    4d60:	000084b7          	lui	s1,0x8
    4d64:	ab048493          	addi	s1,s1,-1360 # 7ab0 <_fs>
    4d68:	03c4a783          	lw	a5,60(s1)
    4d6c:	00078463          	beqz	a5,4d74 <fl_fflush+0x40>
    4d70:	000780e7          	jalr	a5
    4d74:	43442783          	lw	a5,1076(s0)
    4d78:	02078263          	beqz	a5,4d9c <fl_fflush+0x68>
    4d7c:	43042583          	lw	a1,1072(s0)
    4d80:	00100693          	li	a3,1
    4d84:	23040613          	addi	a2,s0,560
    4d88:	00040513          	mv	a0,s0
    4d8c:	00000097          	auipc	ra,0x0
    4d90:	dfc080e7          	jalr	-516(ra) # 4b88 <_write_sectors>
    4d94:	00050463          	beqz	a0,4d9c <fl_fflush+0x68>
    4d98:	42042a23          	sw	zero,1076(s0)
    4d9c:	0404a783          	lw	a5,64(s1)
    4da0:	00078463          	beqz	a5,4da8 <fl_fflush+0x74>
    4da4:	000780e7          	jalr	a5
    4da8:	00c12083          	lw	ra,12(sp)
    4dac:	00812403          	lw	s0,8(sp)
    4db0:	00412483          	lw	s1,4(sp)
    4db4:	00000513          	li	a0,0
    4db8:	01010113          	addi	sp,sp,16
    4dbc:	00008067          	ret

00004dc0 <fl_fclose>:
    4dc0:	000067b7          	lui	a5,0x6
    4dc4:	e907a783          	lw	a5,-368(a5) # 5e90 <_filelib_init>
    4dc8:	ff010113          	addi	sp,sp,-16
    4dcc:	00812423          	sw	s0,8(sp)
    4dd0:	00112623          	sw	ra,12(sp)
    4dd4:	00912223          	sw	s1,4(sp)
    4dd8:	01212023          	sw	s2,0(sp)
    4ddc:	00050413          	mv	s0,a0
    4de0:	00079663          	bnez	a5,4dec <fl_fclose+0x2c>
    4de4:	ffffe097          	auipc	ra,0xffffe
    4de8:	ae4080e7          	jalr	-1308(ra) # 28c8 <fl_init>
    4dec:	08040c63          	beqz	s0,4e84 <fl_fclose+0xc4>
    4df0:	000084b7          	lui	s1,0x8
    4df4:	ab048913          	addi	s2,s1,-1360 # 7ab0 <_fs>
    4df8:	03c92783          	lw	a5,60(s2)
    4dfc:	00078463          	beqz	a5,4e04 <fl_fclose+0x44>
    4e00:	000780e7          	jalr	a5
    4e04:	00040513          	mv	a0,s0
    4e08:	00000097          	auipc	ra,0x0
    4e0c:	f2c080e7          	jalr	-212(ra) # 4d34 <fl_fflush>
    4e10:	01042783          	lw	a5,16(s0)
    4e14:	00078e63          	beqz	a5,4e30 <fl_fclose+0x70>
    4e18:	00c42683          	lw	a3,12(s0)
    4e1c:	00042583          	lw	a1,0(s0)
    4e20:	21c40613          	addi	a2,s0,540
    4e24:	ab048513          	addi	a0,s1,-1360
    4e28:	fffff097          	auipc	ra,0xfffff
    4e2c:	338080e7          	jalr	824(ra) # 4160 <fatfs_update_file_length>
    4e30:	fff00793          	li	a5,-1
    4e34:	42f42823          	sw	a5,1072(s0)
    4e38:	00040513          	mv	a0,s0
    4e3c:	00042423          	sw	zero,8(s0)
    4e40:	00042623          	sw	zero,12(s0)
    4e44:	00042223          	sw	zero,4(s0)
    4e48:	42042a23          	sw	zero,1076(s0)
    4e4c:	00042823          	sw	zero,16(s0)
    4e50:	ffffe097          	auipc	ra,0xffffe
    4e54:	900080e7          	jalr	-1792(ra) # 2750 <_free_file>
    4e58:	ab048513          	addi	a0,s1,-1360
    4e5c:	fffff097          	auipc	ra,0xfffff
    4e60:	a54080e7          	jalr	-1452(ra) # 38b0 <fatfs_fat_purge>
    4e64:	04092783          	lw	a5,64(s2)
    4e68:	00078e63          	beqz	a5,4e84 <fl_fclose+0xc4>
    4e6c:	00812403          	lw	s0,8(sp)
    4e70:	00c12083          	lw	ra,12(sp)
    4e74:	00412483          	lw	s1,4(sp)
    4e78:	00012903          	lw	s2,0(sp)
    4e7c:	01010113          	addi	sp,sp,16
    4e80:	00078067          	jr	a5
    4e84:	00c12083          	lw	ra,12(sp)
    4e88:	00812403          	lw	s0,8(sp)
    4e8c:	00412483          	lw	s1,4(sp)
    4e90:	00012903          	lw	s2,0(sp)
    4e94:	01010113          	addi	sp,sp,16
    4e98:	00008067          	ret

00004e9c <fl_fread>:
    4e9c:	000067b7          	lui	a5,0x6
    4ea0:	e907a783          	lw	a5,-368(a5) # 5e90 <_filelib_init>
    4ea4:	fc010113          	addi	sp,sp,-64
    4ea8:	02812c23          	sw	s0,56(sp)
    4eac:	03512223          	sw	s5,36(sp)
    4eb0:	02112e23          	sw	ra,60(sp)
    4eb4:	02912a23          	sw	s1,52(sp)
    4eb8:	03212823          	sw	s2,48(sp)
    4ebc:	03312623          	sw	s3,44(sp)
    4ec0:	03412423          	sw	s4,40(sp)
    4ec4:	03612023          	sw	s6,32(sp)
    4ec8:	01712e23          	sw	s7,28(sp)
    4ecc:	01812c23          	sw	s8,24(sp)
    4ed0:	01912a23          	sw	s9,20(sp)
    4ed4:	00050a93          	mv	s5,a0
    4ed8:	00068413          	mv	s0,a3
    4edc:	00058513          	mv	a0,a1
    4ee0:	00079e63          	bnez	a5,4efc <fl_fread+0x60>
    4ee4:	00c12623          	sw	a2,12(sp)
    4ee8:	00b12423          	sw	a1,8(sp)
    4eec:	ffffe097          	auipc	ra,0xffffe
    4ef0:	9dc080e7          	jalr	-1572(ra) # 28c8 <fl_init>
    4ef4:	00c12603          	lw	a2,12(sp)
    4ef8:	00812503          	lw	a0,8(sp)
    4efc:	14040e63          	beqz	s0,5058 <fl_fread+0x1bc>
    4f00:	140a8c63          	beqz	s5,5058 <fl_fread+0x1bc>
    4f04:	43844783          	lbu	a5,1080(s0)
    4f08:	fff00493          	li	s1,-1
    4f0c:	0017f793          	andi	a5,a5,1
    4f10:	04078863          	beqz	a5,4f60 <fl_fread+0xc4>
    4f14:	00060593          	mv	a1,a2
    4f18:	ffffd097          	auipc	ra,0xffffd
    4f1c:	51c080e7          	jalr	1308(ra) # 2434 <__mulsi3>
    4f20:	00050493          	mv	s1,a0
    4f24:	02050e63          	beqz	a0,4f60 <fl_fread+0xc4>
    4f28:	00842583          	lw	a1,8(s0)
    4f2c:	00c42783          	lw	a5,12(s0)
    4f30:	12f5f463          	bgeu	a1,a5,5058 <fl_fread+0x1bc>
    4f34:	00b50733          	add	a4,a0,a1
    4f38:	00e7f463          	bgeu	a5,a4,4f40 <fl_fread+0xa4>
    4f3c:	40b784b3          	sub	s1,a5,a1
    4f40:	0095da13          	srli	s4,a1,0x9
    4f44:	1ff5f913          	andi	s2,a1,511
    4f48:	00000993          	li	s3,0
    4f4c:	23040b13          	addi	s6,s0,560
    4f50:	20000b93          	li	s7,512
    4f54:	1ff00c13          	li	s8,511
    4f58:	0499c063          	blt	s3,s1,4f98 <fl_fread+0xfc>
    4f5c:	00098493          	mv	s1,s3
    4f60:	03c12083          	lw	ra,60(sp)
    4f64:	03812403          	lw	s0,56(sp)
    4f68:	03012903          	lw	s2,48(sp)
    4f6c:	02c12983          	lw	s3,44(sp)
    4f70:	02812a03          	lw	s4,40(sp)
    4f74:	02412a83          	lw	s5,36(sp)
    4f78:	02012b03          	lw	s6,32(sp)
    4f7c:	01c12b83          	lw	s7,28(sp)
    4f80:	01812c03          	lw	s8,24(sp)
    4f84:	01412c83          	lw	s9,20(sp)
    4f88:	00048513          	mv	a0,s1
    4f8c:	03412483          	lw	s1,52(sp)
    4f90:	04010113          	addi	sp,sp,64
    4f94:	00008067          	ret
    4f98:	04091663          	bnez	s2,4fe4 <fl_fread+0x148>
    4f9c:	413486b3          	sub	a3,s1,s3
    4fa0:	04dc5263          	bge	s8,a3,4fe4 <fl_fread+0x148>
    4fa4:	4096d693          	srai	a3,a3,0x9
    4fa8:	013a8633          	add	a2,s5,s3
    4fac:	000a0593          	mv	a1,s4
    4fb0:	00040513          	mv	a0,s0
    4fb4:	fffff097          	auipc	ra,0xfffff
    4fb8:	5ec080e7          	jalr	1516(ra) # 45a0 <_read_sectors>
    4fbc:	fa0500e3          	beqz	a0,4f5c <fl_fread+0xc0>
    4fc0:	00951c93          	slli	s9,a0,0x9
    4fc4:	000c8613          	mv	a2,s9
    4fc8:	00aa0a33          	add	s4,s4,a0
    4fcc:	00842783          	lw	a5,8(s0)
    4fd0:	00c989b3          	add	s3,s3,a2
    4fd4:	00000913          	li	s2,0
    4fd8:	019787b3          	add	a5,a5,s9
    4fdc:	00f42423          	sw	a5,8(s0)
    4fe0:	f79ff06f          	j	4f58 <fl_fread+0xbc>
    4fe4:	43042783          	lw	a5,1072(s0)
    4fe8:	03478e63          	beq	a5,s4,5024 <fl_fread+0x188>
    4fec:	43442783          	lw	a5,1076(s0)
    4ff0:	00078863          	beqz	a5,5000 <fl_fread+0x164>
    4ff4:	00040513          	mv	a0,s0
    4ff8:	00000097          	auipc	ra,0x0
    4ffc:	d3c080e7          	jalr	-708(ra) # 4d34 <fl_fflush>
    5000:	00100693          	li	a3,1
    5004:	000b0613          	mv	a2,s6
    5008:	000a0593          	mv	a1,s4
    500c:	00040513          	mv	a0,s0
    5010:	fffff097          	auipc	ra,0xfffff
    5014:	590080e7          	jalr	1424(ra) # 45a0 <_read_sectors>
    5018:	f40502e3          	beqz	a0,4f5c <fl_fread+0xc0>
    501c:	43442823          	sw	s4,1072(s0)
    5020:	42042a23          	sw	zero,1076(s0)
    5024:	412b87b3          	sub	a5,s7,s2
    5028:	41348633          	sub	a2,s1,s3
    502c:	00c7d463          	bge	a5,a2,5034 <fl_fread+0x198>
    5030:	00078613          	mv	a2,a5
    5034:	012b05b3          	add	a1,s6,s2
    5038:	013a8533          	add	a0,s5,s3
    503c:	00060c93          	mv	s9,a2
    5040:	00c12423          	sw	a2,8(sp)
    5044:	ffffd097          	auipc	ra,0xffffd
    5048:	c9c080e7          	jalr	-868(ra) # 1ce0 <memcpy>
    504c:	00812603          	lw	a2,8(sp)
    5050:	001a0a13          	addi	s4,s4,1
    5054:	f79ff06f          	j	4fcc <fl_fread+0x130>
    5058:	fff00493          	li	s1,-1
    505c:	f05ff06f          	j	4f60 <fl_fread+0xc4>

00005060 <fatfs_allocate_free_space>:
    5060:	fd010113          	addi	sp,sp,-48
    5064:	02112623          	sw	ra,44(sp)
    5068:	02812423          	sw	s0,40(sp)
    506c:	02912223          	sw	s1,36(sp)
    5070:	03212023          	sw	s2,32(sp)
    5074:	01312e23          	sw	s3,28(sp)
    5078:	01412c23          	sw	s4,24(sp)
    507c:	01512a23          	sw	s5,20(sp)
    5080:	02069863          	bnez	a3,50b0 <fatfs_allocate_free_space+0x50>
    5084:	00000413          	li	s0,0
    5088:	02c12083          	lw	ra,44(sp)
    508c:	00040513          	mv	a0,s0
    5090:	02812403          	lw	s0,40(sp)
    5094:	02412483          	lw	s1,36(sp)
    5098:	02012903          	lw	s2,32(sp)
    509c:	01c12983          	lw	s3,28(sp)
    50a0:	01812a03          	lw	s4,24(sp)
    50a4:	01412a83          	lw	s5,20(sp)
    50a8:	03010113          	addi	sp,sp,48
    50ac:	00008067          	ret
    50b0:	02452783          	lw	a5,36(a0)
    50b4:	00058a13          	mv	s4,a1
    50b8:	fff00593          	li	a1,-1
    50bc:	00050493          	mv	s1,a0
    50c0:	00068913          	mv	s2,a3
    50c4:	00060993          	mv	s3,a2
    50c8:	00b78663          	beq	a5,a1,50d4 <fatfs_allocate_free_space+0x74>
    50cc:	fffff097          	auipc	ra,0xfffff
    50d0:	620080e7          	jalr	1568(ra) # 46ec <fatfs_set_fs_info_next_free_cluster>
    50d4:	0004c783          	lbu	a5,0(s1)
    50d8:	00090513          	mv	a0,s2
    50dc:	00979a93          	slli	s5,a5,0x9
    50e0:	000a8593          	mv	a1,s5
    50e4:	ffffd097          	auipc	ra,0xffffd
    50e8:	b34080e7          	jalr	-1228(ra) # 1c18 <__udivsi3>
    50ec:	00050413          	mv	s0,a0
    50f0:	00050593          	mv	a1,a0
    50f4:	000a8513          	mv	a0,s5
    50f8:	ffffd097          	auipc	ra,0xffffd
    50fc:	33c080e7          	jalr	828(ra) # 2434 <__mulsi3>
    5100:	41250533          	sub	a0,a0,s2
    5104:	00a03533          	snez	a0,a0
    5108:	00a40933          	add	s2,s0,a0
    510c:	040a0463          	beqz	s4,5154 <fatfs_allocate_free_space+0xf4>
    5110:	0084a583          	lw	a1,8(s1)
    5114:	00c10613          	addi	a2,sp,12
    5118:	00048513          	mv	a0,s1
    511c:	fffff097          	auipc	ra,0xfffff
    5120:	680080e7          	jalr	1664(ra) # 479c <fatfs_find_blank_cluster>
    5124:	00050413          	mv	s0,a0
    5128:	f4050ee3          	beqz	a0,5084 <fatfs_allocate_free_space+0x24>
    512c:	00100793          	li	a5,1
    5130:	02f91663          	bne	s2,a5,515c <fatfs_allocate_free_space+0xfc>
    5134:	00c12903          	lw	s2,12(sp)
    5138:	fff00613          	li	a2,-1
    513c:	00048513          	mv	a0,s1
    5140:	00090593          	mv	a1,s2
    5144:	fffff097          	auipc	ra,0xfffff
    5148:	76c080e7          	jalr	1900(ra) # 48b0 <fatfs_fat_set_cluster>
    514c:	0129a023          	sw	s2,0(s3)
    5150:	f39ff06f          	j	5088 <fatfs_allocate_free_space+0x28>
    5154:	0009a783          	lw	a5,0(s3)
    5158:	00f12623          	sw	a5,12(sp)
    515c:	00090613          	mv	a2,s2
    5160:	00c10593          	addi	a1,sp,12
    5164:	00048513          	mv	a0,s1
    5168:	00000097          	auipc	ra,0x0
    516c:	954080e7          	jalr	-1708(ra) # 4abc <fatfs_add_free_space>
    5170:	00050413          	mv	s0,a0
    5174:	f15ff06f          	j	5088 <fatfs_allocate_free_space+0x28>

00005178 <fatfs_add_file_entry>:
    5178:	03852883          	lw	a7,56(a0)
    517c:	30088e63          	beqz	a7,5498 <fatfs_add_file_entry+0x320>
    5180:	f8010113          	addi	sp,sp,-128
    5184:	06812c23          	sw	s0,120(sp)
    5188:	00050413          	mv	s0,a0
    518c:	00060513          	mv	a0,a2
    5190:	06912a23          	sw	s1,116(sp)
    5194:	07512223          	sw	s5,100(sp)
    5198:	00f12c23          	sw	a5,24(sp)
    519c:	00e12a23          	sw	a4,20(sp)
    51a0:	06112e23          	sw	ra,124(sp)
    51a4:	07212823          	sw	s2,112(sp)
    51a8:	07312623          	sw	s3,108(sp)
    51ac:	07412423          	sw	s4,104(sp)
    51b0:	07612023          	sw	s6,96(sp)
    51b4:	05712e23          	sw	s7,92(sp)
    51b8:	05812c23          	sw	s8,88(sp)
    51bc:	05912a23          	sw	s9,84(sp)
    51c0:	05a12823          	sw	s10,80(sp)
    51c4:	05b12623          	sw	s11,76(sp)
    51c8:	01012e23          	sw	a6,28(sp)
    51cc:	00068a93          	mv	s5,a3
    51d0:	00c12823          	sw	a2,16(sp)
    51d4:	00b12423          	sw	a1,8(sp)
    51d8:	ffffe097          	auipc	ra,0xffffe
    51dc:	a48080e7          	jalr	-1464(ra) # 2c20 <fatfs_lfn_entries_required>
    51e0:	00150713          	addi	a4,a0,1
    51e4:	00100793          	li	a5,1
    51e8:	00050493          	mv	s1,a0
    51ec:	2ae7f263          	bgeu	a5,a4,5490 <fatfs_add_file_entry+0x318>
    51f0:	00000a13          	li	s4,0
    51f4:	00000993          	li	s3,0
    51f8:	00000913          	li	s2,0
    51fc:	00000c93          	li	s9,0
    5200:	00000b13          	li	s6,0
    5204:	01000c13          	li	s8,16
    5208:	00812583          	lw	a1,8(sp)
    520c:	00000693          	li	a3,0
    5210:	000b0613          	mv	a2,s6
    5214:	00040513          	mv	a0,s0
    5218:	000b0b93          	mv	s7,s6
    521c:	ffffe097          	auipc	ra,0xffffe
    5220:	7f4080e7          	jalr	2036(ra) # 3a10 <fatfs_sector_reader>
    5224:	18050463          	beqz	a0,53ac <fatfs_add_file_entry+0x234>
    5228:	001b0b13          	addi	s6,s6,1
    522c:	04440793          	addi	a5,s0,68
    5230:	000c8d13          	mv	s10,s9
    5234:	00000d93          	li	s11,0
    5238:	00078513          	mv	a0,a5
    523c:	00f12623          	sw	a5,12(sp)
    5240:	ffffe097          	auipc	ra,0xffffe
    5244:	8f8080e7          	jalr	-1800(ra) # 2b38 <fatfs_entry_lfn_text>
    5248:	00c12783          	lw	a5,12(sp)
    524c:	00050c93          	mv	s9,a0
    5250:	02050c63          	beqz	a0,5288 <fatfs_add_file_entry+0x110>
    5254:	020d0463          	beqz	s10,527c <fatfs_add_file_entry+0x104>
    5258:	00090c93          	mv	s9,s2
    525c:	000c8913          	mv	s2,s9
    5260:	001d0c93          	addi	s9,s10,1
    5264:	001d8d93          	addi	s11,s11,1
    5268:	0ffdfd93          	zext.b	s11,s11
    526c:	02078793          	addi	a5,a5,32
    5270:	f98d8ce3          	beq	s11,s8,5208 <fatfs_add_file_entry+0x90>
    5274:	000c8d13          	mv	s10,s9
    5278:	fc1ff06f          	j	5238 <fatfs_add_file_entry+0xc0>
    527c:	000d8a13          	mv	s4,s11
    5280:	000b8993          	mv	s3,s7
    5284:	fd9ff06f          	j	525c <fatfs_add_file_entry+0xe4>
    5288:	0007c683          	lbu	a3,0(a5)
    528c:	0e500713          	li	a4,229
    5290:	10e69863          	bne	a3,a4,53a0 <fatfs_add_file_entry+0x228>
    5294:	000d1863          	bnez	s10,52a4 <fatfs_add_file_entry+0x12c>
    5298:	000d8a13          	mv	s4,s11
    529c:	000b8993          	mv	s3,s7
    52a0:	00100913          	li	s2,1
    52a4:	fa9d4ee3          	blt	s10,s1,5260 <fatfs_add_file_entry+0xe8>
    52a8:	00ba8693          	addi	a3,s5,11
    52ac:	000a8713          	mv	a4,s5
    52b0:	00000913          	li	s2,0
    52b4:	00074603          	lbu	a2,0(a4)
    52b8:	00195793          	srli	a5,s2,0x1
    52bc:	00791913          	slli	s2,s2,0x7
    52c0:	012787b3          	add	a5,a5,s2
    52c4:	00170713          	addi	a4,a4,1
    52c8:	00c787b3          	add	a5,a5,a2
    52cc:	0ff7f913          	zext.b	s2,a5
    52d0:	fed712e3          	bne	a4,a3,52b4 <fatfs_add_file_entry+0x13c>
    52d4:	00098b13          	mv	s6,s3
    52d8:	00000d13          	li	s10,0
    52dc:	01000b93          	li	s7,16
    52e0:	00812583          	lw	a1,8(sp)
    52e4:	00000693          	li	a3,0
    52e8:	000b0613          	mv	a2,s6
    52ec:	00040513          	mv	a0,s0
    52f0:	ffffe097          	auipc	ra,0xffffe
    52f4:	720080e7          	jalr	1824(ra) # 3a10 <fatfs_sector_reader>
    52f8:	18050c63          	beqz	a0,5490 <fatfs_add_file_entry+0x318>
    52fc:	04440c93          	addi	s9,s0,68
    5300:	413b0db3          	sub	s11,s6,s3
    5304:	00000793          	li	a5,0
    5308:	00000c13          	li	s8,0
    530c:	01912623          	sw	s9,12(sp)
    5310:	000d1663          	bnez	s10,531c <fatfs_add_file_entry+0x1a4>
    5314:	154c1863          	bne	s8,s4,5464 <fatfs_add_file_entry+0x2ec>
    5318:	140d9663          	bnez	s11,5464 <fatfs_add_file_entry+0x2ec>
    531c:	12049263          	bnez	s1,5440 <fatfs_add_file_entry+0x2c8>
    5320:	01c12703          	lw	a4,28(sp)
    5324:	01412603          	lw	a2,20(sp)
    5328:	01812583          	lw	a1,24(sp)
    532c:	02010693          	addi	a3,sp,32
    5330:	000a8513          	mv	a0,s5
    5334:	ffffe097          	auipc	ra,0xffffe
    5338:	a30080e7          	jalr	-1488(ra) # 2d64 <fatfs_sfn_create_entry>
    533c:	02000613          	li	a2,32
    5340:	00c105b3          	add	a1,sp,a2
    5344:	000c8513          	mv	a0,s9
    5348:	ffffd097          	auipc	ra,0xffffd
    534c:	998080e7          	jalr	-1640(ra) # 1ce0 <memcpy>
    5350:	03842783          	lw	a5,56(s0)
    5354:	00c12583          	lw	a1,12(sp)
    5358:	24442503          	lw	a0,580(s0)
    535c:	00100613          	li	a2,1
    5360:	000780e7          	jalr	a5
    5364:	07c12083          	lw	ra,124(sp)
    5368:	07812403          	lw	s0,120(sp)
    536c:	07412483          	lw	s1,116(sp)
    5370:	07012903          	lw	s2,112(sp)
    5374:	06c12983          	lw	s3,108(sp)
    5378:	06812a03          	lw	s4,104(sp)
    537c:	06412a83          	lw	s5,100(sp)
    5380:	06012b03          	lw	s6,96(sp)
    5384:	05c12b83          	lw	s7,92(sp)
    5388:	05812c03          	lw	s8,88(sp)
    538c:	05412c83          	lw	s9,84(sp)
    5390:	05012d03          	lw	s10,80(sp)
    5394:	04c12d83          	lw	s11,76(sp)
    5398:	08010113          	addi	sp,sp,128
    539c:	00008067          	ret
    53a0:	ee068ae3          	beqz	a3,5294 <fatfs_add_file_entry+0x11c>
    53a4:	00000913          	li	s2,0
    53a8:	ebdff06f          	j	5264 <fatfs_add_file_entry+0xec>
    53ac:	00842583          	lw	a1,8(s0)
    53b0:	02010613          	addi	a2,sp,32
    53b4:	00040513          	mv	a0,s0
    53b8:	fffff097          	auipc	ra,0xfffff
    53bc:	3e4080e7          	jalr	996(ra) # 479c <fatfs_find_blank_cluster>
    53c0:	0c050863          	beqz	a0,5490 <fatfs_add_file_entry+0x318>
    53c4:	02012b83          	lw	s7,32(sp)
    53c8:	00812583          	lw	a1,8(sp)
    53cc:	00040513          	mv	a0,s0
    53d0:	000b8613          	mv	a2,s7
    53d4:	fffff097          	auipc	ra,0xfffff
    53d8:	64c080e7          	jalr	1612(ra) # 4a20 <fatfs_fat_add_cluster_to_chain>
    53dc:	0a050a63          	beqz	a0,5490 <fatfs_add_file_entry+0x318>
    53e0:	20000613          	li	a2,512
    53e4:	00000593          	li	a1,0
    53e8:	04440513          	addi	a0,s0,68
    53ec:	ffffd097          	auipc	ra,0xffffd
    53f0:	8d8080e7          	jalr	-1832(ra) # 1cc4 <memset>
    53f4:	00000c13          	li	s8,0
    53f8:	00044783          	lbu	a5,0(s0)
    53fc:	00fc6a63          	bltu	s8,a5,5410 <fatfs_add_file_entry+0x298>
    5400:	ea0914e3          	bnez	s2,52a8 <fatfs_add_file_entry+0x130>
    5404:	000b0993          	mv	s3,s6
    5408:	00000a13          	li	s4,0
    540c:	e9dff06f          	j	52a8 <fatfs_add_file_entry+0x130>
    5410:	00000693          	li	a3,0
    5414:	000c0613          	mv	a2,s8
    5418:	000b8593          	mv	a1,s7
    541c:	00040513          	mv	a0,s0
    5420:	ffffd097          	auipc	ra,0xffffd
    5424:	3f4080e7          	jalr	1012(ra) # 2814 <fatfs_write_sector>
    5428:	06050463          	beqz	a0,5490 <fatfs_add_file_entry+0x318>
    542c:	001c0c13          	addi	s8,s8,1
    5430:	0ffc7c13          	zext.b	s8,s8
    5434:	fc5ff06f          	j	53f8 <fatfs_add_file_entry+0x280>
    5438:	001b0b13          	addi	s6,s6,1
    543c:	ea5ff06f          	j	52e0 <fatfs_add_file_entry+0x168>
    5440:	01012503          	lw	a0,16(sp)
    5444:	fff48493          	addi	s1,s1,-1
    5448:	00090693          	mv	a3,s2
    544c:	00048613          	mv	a2,s1
    5450:	000c8593          	mv	a1,s9
    5454:	ffffd097          	auipc	ra,0xffffd
    5458:	7fc080e7          	jalr	2044(ra) # 2c50 <fatfs_filename_to_lfn>
    545c:	00100d13          	li	s10,1
    5460:	000d0793          	mv	a5,s10
    5464:	001c0c13          	addi	s8,s8,1
    5468:	0ffc7c13          	zext.b	s8,s8
    546c:	020c8c93          	addi	s9,s9,32
    5470:	eb7c10e3          	bne	s8,s7,5310 <fatfs_add_file_entry+0x198>
    5474:	fc0782e3          	beqz	a5,5438 <fatfs_add_file_entry+0x2c0>
    5478:	03842783          	lw	a5,56(s0)
    547c:	00c12583          	lw	a1,12(sp)
    5480:	24442503          	lw	a0,580(s0)
    5484:	00100613          	li	a2,1
    5488:	000780e7          	jalr	a5
    548c:	fa0516e3          	bnez	a0,5438 <fatfs_add_file_entry+0x2c0>
    5490:	00000513          	li	a0,0
    5494:	ed1ff06f          	j	5364 <fatfs_add_file_entry+0x1ec>
    5498:	00000513          	li	a0,0
    549c:	00008067          	ret

000054a0 <fl_fopen>:
    54a0:	000067b7          	lui	a5,0x6
    54a4:	e907a783          	lw	a5,-368(a5) # 5e90 <_filelib_init>
    54a8:	fa010113          	addi	sp,sp,-96
    54ac:	05212823          	sw	s2,80(sp)
    54b0:	03a12823          	sw	s10,48(sp)
    54b4:	04112e23          	sw	ra,92(sp)
    54b8:	04812c23          	sw	s0,88(sp)
    54bc:	04912a23          	sw	s1,84(sp)
    54c0:	05312623          	sw	s3,76(sp)
    54c4:	05412423          	sw	s4,72(sp)
    54c8:	05512223          	sw	s5,68(sp)
    54cc:	05612023          	sw	s6,64(sp)
    54d0:	03712e23          	sw	s7,60(sp)
    54d4:	03812c23          	sw	s8,56(sp)
    54d8:	03912a23          	sw	s9,52(sp)
    54dc:	00050d13          	mv	s10,a0
    54e0:	00058913          	mv	s2,a1
    54e4:	00079663          	bnez	a5,54f0 <fl_fopen+0x50>
    54e8:	ffffd097          	auipc	ra,0xffffd
    54ec:	3e0080e7          	jalr	992(ra) # 28c8 <fl_init>
    54f0:	000067b7          	lui	a5,0x6
    54f4:	e8c7a783          	lw	a5,-372(a5) # 5e8c <_filelib_valid>
    54f8:	00193713          	seqz	a4,s2
    54fc:	0017b793          	seqz	a5,a5
    5500:	00e7e7b3          	or	a5,a5,a4
    5504:	36079e63          	bnez	a5,5880 <fl_fopen+0x3e0>
    5508:	360d0c63          	beqz	s10,5880 <fl_fopen+0x3e0>
    550c:	00000493          	li	s1,0
    5510:	00000413          	li	s0,0
    5514:	05700993          	li	s3,87
    5518:	07200a13          	li	s4,114
    551c:	07700b13          	li	s6,119
    5520:	06100b93          	li	s7,97
    5524:	06200c13          	li	s8,98
    5528:	04100a93          	li	s5,65
    552c:	04200c93          	li	s9,66
    5530:	00090513          	mv	a0,s2
    5534:	ffffc097          	auipc	ra,0xffffc
    5538:	7d0080e7          	jalr	2000(ra) # 1d04 <strlen>
    553c:	10a44a63          	blt	s0,a0,5650 <fl_fopen+0x1b0>
    5540:	000089b7          	lui	s3,0x8
    5544:	ab098a13          	addi	s4,s3,-1360 # 7ab0 <_fs>
    5548:	038a2783          	lw	a5,56(s4)
    554c:	00079463          	bnez	a5,5554 <fl_fopen+0xb4>
    5550:	fd94f493          	andi	s1,s1,-39
    5554:	03ca2783          	lw	a5,60(s4)
    5558:	00078463          	beqz	a5,5560 <fl_fopen+0xc0>
    555c:	000780e7          	jalr	a5
    5560:	0014f793          	andi	a5,s1,1
    5564:	18079263          	bnez	a5,56e8 <fl_fopen+0x248>
    5568:	0204f793          	andi	a5,s1,32
    556c:	08078c63          	beqz	a5,5604 <fl_fopen+0x164>
    5570:	038a2783          	lw	a5,56(s4)
    5574:	06078a63          	beqz	a5,55e8 <fl_fopen+0x148>
    5578:	ffffd097          	auipc	ra,0xffffd
    557c:	160080e7          	jalr	352(ra) # 26d8 <_allocate_file>
    5580:	00050413          	mv	s0,a0
    5584:	06050263          	beqz	a0,55e8 <fl_fopen+0x148>
    5588:	01450a93          	addi	s5,a0,20
    558c:	10400613          	li	a2,260
    5590:	00000593          	li	a1,0
    5594:	000a8513          	mv	a0,s5
    5598:	ffffc097          	auipc	ra,0xffffc
    559c:	72c080e7          	jalr	1836(ra) # 1cc4 <memset>
    55a0:	11840b13          	addi	s6,s0,280
    55a4:	10400613          	li	a2,260
    55a8:	00000593          	li	a1,0
    55ac:	000b0513          	mv	a0,s6
    55b0:	ffffc097          	auipc	ra,0xffffc
    55b4:	714080e7          	jalr	1812(ra) # 1cc4 <memset>
    55b8:	10400713          	li	a4,260
    55bc:	000b0693          	mv	a3,s6
    55c0:	00070613          	mv	a2,a4
    55c4:	000a8593          	mv	a1,s5
    55c8:	000d0513          	mv	a0,s10
    55cc:	ffffe097          	auipc	ra,0xffffe
    55d0:	c88080e7          	jalr	-888(ra) # 3254 <fatfs_split_path>
    55d4:	fff00793          	li	a5,-1
    55d8:	12f51663          	bne	a0,a5,5704 <fl_fopen+0x264>
    55dc:	00040513          	mv	a0,s0
    55e0:	ffffd097          	auipc	ra,0xffffd
    55e4:	170080e7          	jalr	368(ra) # 2750 <_free_file>
    55e8:	00000413          	li	s0,0
    55ec:	0214f793          	andi	a5,s1,33
    55f0:	02000713          	li	a4,32
    55f4:	28e79263          	bne	a5,a4,5878 <fl_fopen+0x3d8>
    55f8:	10041263          	bnez	s0,56fc <fl_fopen+0x25c>
    55fc:	0064f793          	andi	a5,s1,6
    5600:	26079463          	bnez	a5,5868 <fl_fopen+0x3c8>
    5604:	00000413          	li	s0,0
    5608:	040a2783          	lw	a5,64(s4)
    560c:	00078463          	beqz	a5,5614 <fl_fopen+0x174>
    5610:	000780e7          	jalr	a5
    5614:	05c12083          	lw	ra,92(sp)
    5618:	00040513          	mv	a0,s0
    561c:	05812403          	lw	s0,88(sp)
    5620:	05412483          	lw	s1,84(sp)
    5624:	05012903          	lw	s2,80(sp)
    5628:	04c12983          	lw	s3,76(sp)
    562c:	04812a03          	lw	s4,72(sp)
    5630:	04412a83          	lw	s5,68(sp)
    5634:	04012b03          	lw	s6,64(sp)
    5638:	03c12b83          	lw	s7,60(sp)
    563c:	03812c03          	lw	s8,56(sp)
    5640:	03412c83          	lw	s9,52(sp)
    5644:	03012d03          	lw	s10,48(sp)
    5648:	06010113          	addi	sp,sp,96
    564c:	00008067          	ret
    5650:	008907b3          	add	a5,s2,s0
    5654:	0007c783          	lbu	a5,0(a5)
    5658:	05378863          	beq	a5,s3,56a8 <fl_fopen+0x208>
    565c:	02f9e863          	bltu	s3,a5,568c <fl_fopen+0x1ec>
    5660:	05578863          	beq	a5,s5,56b0 <fl_fopen+0x210>
    5664:	00faea63          	bltu	s5,a5,5678 <fl_fopen+0x1d8>
    5668:	02b00713          	li	a4,43
    566c:	04e78663          	beq	a5,a4,56b8 <fl_fopen+0x218>
    5670:	00140413          	addi	s0,s0,1
    5674:	ebdff06f          	j	5530 <fl_fopen+0x90>
    5678:	03978263          	beq	a5,s9,569c <fl_fopen+0x1fc>
    567c:	05200713          	li	a4,82
    5680:	fee798e3          	bne	a5,a4,5670 <fl_fopen+0x1d0>
    5684:	0014e493          	ori	s1,s1,1
    5688:	fe9ff06f          	j	5670 <fl_fopen+0x1d0>
    568c:	ff478ce3          	beq	a5,s4,5684 <fl_fopen+0x1e4>
    5690:	00fa6a63          	bltu	s4,a5,56a4 <fl_fopen+0x204>
    5694:	01778e63          	beq	a5,s7,56b0 <fl_fopen+0x210>
    5698:	fd879ce3          	bne	a5,s8,5670 <fl_fopen+0x1d0>
    569c:	0084e493          	ori	s1,s1,8
    56a0:	fd1ff06f          	j	5670 <fl_fopen+0x1d0>
    56a4:	fd6796e3          	bne	a5,s6,5670 <fl_fopen+0x1d0>
    56a8:	0324e493          	ori	s1,s1,50
    56ac:	fc5ff06f          	j	5670 <fl_fopen+0x1d0>
    56b0:	0264e493          	ori	s1,s1,38
    56b4:	fbdff06f          	j	5670 <fl_fopen+0x1d0>
    56b8:	0014f793          	andi	a5,s1,1
    56bc:	00078663          	beqz	a5,56c8 <fl_fopen+0x228>
    56c0:	0024e493          	ori	s1,s1,2
    56c4:	fadff06f          	j	5670 <fl_fopen+0x1d0>
    56c8:	0024f793          	andi	a5,s1,2
    56cc:	00078663          	beqz	a5,56d8 <fl_fopen+0x238>
    56d0:	0314e493          	ori	s1,s1,49
    56d4:	f9dff06f          	j	5670 <fl_fopen+0x1d0>
    56d8:	0044f793          	andi	a5,s1,4
    56dc:	f8078ae3          	beqz	a5,5670 <fl_fopen+0x1d0>
    56e0:	0274e493          	ori	s1,s1,39
    56e4:	f8dff06f          	j	5670 <fl_fopen+0x1d0>
    56e8:	000d0513          	mv	a0,s10
    56ec:	fffff097          	auipc	ra,0xfffff
    56f0:	81c080e7          	jalr	-2020(ra) # 3f08 <_open_file>
    56f4:	00050413          	mv	s0,a0
    56f8:	e60508e3          	beqz	a0,5568 <fl_fopen+0xc8>
    56fc:	42940c23          	sb	s1,1080(s0)
    5700:	f09ff06f          	j	5608 <fl_fopen+0x168>
    5704:	00040513          	mv	a0,s0
    5708:	ffffe097          	auipc	ra,0xffffe
    570c:	dc8080e7          	jalr	-568(ra) # 34d0 <_check_file_open>
    5710:	00050913          	mv	s2,a0
    5714:	ec0514e3          	bnez	a0,55dc <fl_fopen+0x13c>
    5718:	01444783          	lbu	a5,20(s0)
    571c:	0e079663          	bnez	a5,5808 <fl_fopen+0x368>
    5720:	008a2783          	lw	a5,8(s4)
    5724:	00f42023          	sw	a5,0(s0)
    5728:	00042583          	lw	a1,0(s0)
    572c:	01010693          	addi	a3,sp,16
    5730:	000b0613          	mv	a2,s6
    5734:	ab098513          	addi	a0,s3,-1360
    5738:	ffffe097          	auipc	ra,0xffffe
    573c:	428080e7          	jalr	1064(ra) # 3b60 <fatfs_get_file_entry>
    5740:	00100693          	li	a3,1
    5744:	e8d50ce3          	beq	a0,a3,55dc <fl_fopen+0x13c>
    5748:	00042223          	sw	zero,4(s0)
    574c:	00440613          	addi	a2,s0,4
    5750:	00068593          	mv	a1,a3
    5754:	ab098513          	addi	a0,s3,-1360
    5758:	00000097          	auipc	ra,0x0
    575c:	908080e7          	jalr	-1784(ra) # 5060 <fatfs_allocate_free_space>
    5760:	e6050ee3          	beqz	a0,55dc <fl_fopen+0x13c>
    5764:	00002ab7          	lui	s5,0x2
    5768:	21c40b93          	addi	s7,s0,540
    576c:	ab098c13          	addi	s8,s3,-1360
    5770:	70fa8a93          	addi	s5,s5,1807 # 270f <_allocate_file+0x37>
    5774:	000b0593          	mv	a1,s6
    5778:	00410513          	addi	a0,sp,4
    577c:	ffffd097          	auipc	ra,0xffffd
    5780:	68c080e7          	jalr	1676(ra) # 2e08 <fatfs_lfn_create_sfn>
    5784:	08090e63          	beqz	s2,5820 <fl_fopen+0x380>
    5788:	00090613          	mv	a2,s2
    578c:	00410593          	addi	a1,sp,4
    5790:	000b8513          	mv	a0,s7
    5794:	ffffd097          	auipc	ra,0xffffd
    5798:	7f0080e7          	jalr	2032(ra) # 2f84 <fatfs_lfn_generate_tail>
    579c:	00042583          	lw	a1,0(s0)
    57a0:	000b8613          	mv	a2,s7
    57a4:	000c0513          	mv	a0,s8
    57a8:	fffff097          	auipc	ra,0xfffff
    57ac:	8d4080e7          	jalr	-1836(ra) # 407c <fatfs_sfn_exists>
    57b0:	00050663          	beqz	a0,57bc <fl_fopen+0x31c>
    57b4:	00190913          	addi	s2,s2,1
    57b8:	fb591ee3          	bne	s2,s5,5774 <fl_fopen+0x2d4>
    57bc:	00442703          	lw	a4,4(s0)
    57c0:	000027b7          	lui	a5,0x2
    57c4:	70f78793          	addi	a5,a5,1807 # 270f <_allocate_file+0x37>
    57c8:	00070593          	mv	a1,a4
    57cc:	02f90663          	beq	s2,a5,57f8 <fl_fopen+0x358>
    57d0:	00042583          	lw	a1,0(s0)
    57d4:	00000813          	li	a6,0
    57d8:	00000793          	li	a5,0
    57dc:	000b8693          	mv	a3,s7
    57e0:	000b0613          	mv	a2,s6
    57e4:	ab098513          	addi	a0,s3,-1360
    57e8:	00000097          	auipc	ra,0x0
    57ec:	990080e7          	jalr	-1648(ra) # 5178 <fatfs_add_file_entry>
    57f0:	04051463          	bnez	a0,5838 <fl_fopen+0x398>
    57f4:	00442583          	lw	a1,4(s0)
    57f8:	ab098513          	addi	a0,s3,-1360
    57fc:	fffff097          	auipc	ra,0xfffff
    5800:	1b4080e7          	jalr	436(ra) # 49b0 <fatfs_free_cluster_chain>
    5804:	dd9ff06f          	j	55dc <fl_fopen+0x13c>
    5808:	00040593          	mv	a1,s0
    580c:	000a8513          	mv	a0,s5
    5810:	ffffe097          	auipc	ra,0xffffe
    5814:	54c080e7          	jalr	1356(ra) # 3d5c <_open_directory>
    5818:	f00518e3          	bnez	a0,5728 <fl_fopen+0x288>
    581c:	dc1ff06f          	j	55dc <fl_fopen+0x13c>
    5820:	00b00613          	li	a2,11
    5824:	00410593          	addi	a1,sp,4
    5828:	000b8513          	mv	a0,s7
    582c:	ffffc097          	auipc	ra,0xffffc
    5830:	4b4080e7          	jalr	1204(ra) # 1ce0 <memcpy>
    5834:	f69ff06f          	j	579c <fl_fopen+0x2fc>
    5838:	fff00793          	li	a5,-1
    583c:	00042623          	sw	zero,12(s0)
    5840:	00042423          	sw	zero,8(s0)
    5844:	42f42823          	sw	a5,1072(s0)
    5848:	42042a23          	sw	zero,1076(s0)
    584c:	00042823          	sw	zero,16(s0)
    5850:	22f42423          	sw	a5,552(s0)
    5854:	22f42623          	sw	a5,556(s0)
    5858:	ab098513          	addi	a0,s3,-1360
    585c:	ffffe097          	auipc	ra,0xffffe
    5860:	054080e7          	jalr	84(ra) # 38b0 <fatfs_fat_purge>
    5864:	d89ff06f          	j	55ec <fl_fopen+0x14c>
    5868:	000d0513          	mv	a0,s10
    586c:	ffffe097          	auipc	ra,0xffffe
    5870:	69c080e7          	jalr	1692(ra) # 3f08 <_open_file>
    5874:	00050413          	mv	s0,a0
    5878:	e80412e3          	bnez	s0,56fc <fl_fopen+0x25c>
    587c:	d89ff06f          	j	5604 <fl_fopen+0x164>
    5880:	00000413          	li	s0,0
    5884:	d91ff06f          	j	5614 <fl_fopen+0x174>

00005888 <cmd16>:
    5888:	02000050 00001500                       P.......

00005890 <acmd41>:
    5890:	00004069 00000100                       i@......

00005898 <cmd55>:
    5898:	00000077 00000100                       w.......

000058a0 <cmd8>:
    58a0:	01000048 000087aa                       H.......

000058a8 <cmd0>:
    58a8:	00000040 00009500                       @.......

000058b0 <AUDIO>:
    58b0:	00018000                                ....

000058b4 <DISPLAY>:
    58b4:	00014000                                .@..

000058b8 <BUTTONS>:
    58b8:	00010100                                ....

000058bc <SDCARD>:
    58bc:	00010080                                ....

000058c0 <OLED_RST>:
    58c0:	00010010                                ....

000058c4 <OLED>:
    58c4:	00010008                                ....

000058c8 <LEDS>:
    58c8:	00010004 00006272 00000000 696c632f     ....rb....../cli
    58d8:	722e6b63 00007761 3a727245 0a732520     ck.raw..Err: %s.
    58e8:	00000000 79616c50 3a676e69 20732520     ....Playing: %s 
    58f8:	20202020 20202020 000a2020 676d692f               ../img
    5908:	00002f73 4e202020 6f43206f 20726576     s/..   No Cover 
    5918:	0a747241 00000000 00002e2e 0000002e     Art.............
    5928:	0000002f 4c494620 203a5345 00000000     /... FILES: ....
    5938:	74706d45 000a2179 5d64255b 00000020     Empty!..[%d] ...
    5948:	203e6425 00000000 20202020 20202020     %d> ....        
    5958:	20202020 20202020 20202020 00000a20                  ...
    5968:	626c612f 2f736d75 00000000 53554d20     /albums/.... MUS
    5978:	203a4349 00000000 73756d2f 002f6369     IC: ..../music/.
    5988:	25202020 00000a73 6f432020 676e696d        %s...  Coming
    5998:	6f6f5320 000a216e 656c6946 70784520      Soon!..File Exp
    59a8:	65726f6c 00000072 79616c50 6e6f5320     lorer...Play Son
    59b8:	00007367 4d204a44 0065646f 203d3d3d     gs..DJ Mode.=== 
    59c8:	4e49414d 4e454d20 3d3d2055 000a0a3d     MAIN MENU ===...
    59d8:	2e642520 20732520 20202020 000a2020      %d. %s       ..
    59e8:	0000000a 656c6553 26207463 65725020     ....Select & Pre
    59f8:	42207373 00006e74 74696e49 20445320     ss Btn..Init SD 
    5a08:	64726163 0a2e2e2e 00000000 33323130     card........0123
    5a18:	37363534 42413938 46454443 00000000     456789ABCDEF....
    5a28:	5f544146 203a5346 6f727245 6f632072     FAT_FS: Error co
    5a38:	20646c75 20746f6e 64616f6c 54414620     uld not load FAT
    5a48:	74656420 736c6961 64252820 0a0d2129      details (%d)!..
    5a58:	00000000                                ....

00005a5c <font>:
    5a5c:	00000000 00002f00 00030000 14000003     ...../..........
    5a6c:	143e143e 3a2b6a2e 08122600 171c3224     >.>..j+:.&..$2..
    5a7c:	03003415 00000000 0000211e 001e2100     .4.......!...!..
    5a8c:	08220000 0822081c 0000081c 00002040     .."...".....@ ..
    5a9c:	00080800 00200000 20000000 02040810     ...... .... ....
    5aac:	3f21213f 003f0100 253d0000 25002725     ?!!?..?...=%%'.%
    5abc:	003f2525 3f040407 25252700 253f003d     %%?....?.'%%=.?%
    5acc:	01003d25 00030539 3f25253f 25252700     %=..9...?%%?.'%%
    5adc:	0028003f 40000000 00000028 00110a04     ?.(....@(.......
    5aec:	00141400 0a110000 01000004 0007052d     ............-...
    5afc:	253d213f 09093f1f 253f003f 3f003c27     ?!=%.?..?.?%'<.?
    5b0c:	00212121 1e21213f 25253f00 053f0025     !!!.?!!..?%%%.?.
    5b1c:	3f000505 003d2521 3f04043f 213f2100     ...?!%=.?..?.!?!
    5b2c:	20380000 3f013f21 003b0404 2020203f     ..8 !?.?..;.?   
    5b3c:	3f013f00 023f3f01 3f003f04 003f2121     .?.?.??..?.?!!?.
    5b4c:	0f09093f 31213f00 093f003f 27002f39     ?....?!1?.?.9/.'
    5b5c:	003d2525 013f0101 20203f01 100f003f     %%=...?..?  ?...
    5b6c:	3f001f30 3f203f20 3b04043b 38080f00     0..? ? ?;..;...8
    5b7c:	2931000f 3f002325 00000021 04081020     ..1)%#.?!... ...
    5b8c:	003f2102 01020000 20000201 00000020     .!?........  ...
    5b9c:	00000201 24243800 243f003c 3c003c24     .....8$$<.?$$<.<
    5bac:	00242424 3f24243c 2c2c3c00 3f04002c     $$$.<$$?.<,,,..?
    5bbc:	bc000005 00fca4a4 3c04043f 00003d00     ........?..<.=..
    5bcc:	fd800000 3f000000 00340808 0000003f     .......?..4.?...
    5bdc:	3c043c00 043c3c04 3c003c04 003c2424     .<.<.<<..<.<$$<.
    5bec:	3c2424fc 24243c00 083c00fc 2c000004     .$$<.<$$..<....,
    5bfc:	003c2c2c 00243f04 20203c00 100c003c     ,,<..?$..<  <...
    5c0c:	3c001c30 3c203c20 34080834 a0a0bc00     0..< < <4..4....
    5c1c:	342400fc 0400242c 0000213f 0000003f     ..$4,$..?!..?...
    5c2c:	043f2100 02010000 00000102 00000000     .!?.............
    5c3c:	00000001 00000003 00000005 00000007     ................
    5c4c:	00000009 0000000e 00000010 00000012     ................
    5c5c:	00000014 00000016 00000018 0000001c     ................
    5c6c:	0000001e                                ....

00005c70 <current_path>:
    5c70:	0000002f 00000000 00000000 00000000     /...............
	...

00005e64 <n_items>:
    5e64:	00000000                                ....

00005e68 <sdcard_while_loading_callback>:
    5e68:	00000000                                ....

00005e6c <back_color>:
	...

00005e6d <front_color>:
    5e6d:	                                         ...

00005e70 <cursor_y>:
    5e70:	00000000                                ....

00005e74 <cursor_x>:
    5e74:	00000000                                ....

00005e78 <f_putchar>:
    5e78:	00000000                                ....

00005e7c <_free_file_list>:
	...

00005e84 <_open_file_list>:
	...

00005e8c <_filelib_valid>:
    5e8c:	00000000                                ....

00005e90 <_filelib_init>:
    5e90:	00000000                                ....
