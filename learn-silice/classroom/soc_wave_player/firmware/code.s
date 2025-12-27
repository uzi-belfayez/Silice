
code.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00010137          	lui	sp,0x10
       4:	00001097          	auipc	ra,0x1
       8:	5f0080e7          	jalr	1520(ra) # 15f4 <main>
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

0000008c <clear_audio>:
      8c:	fe010113          	addi	sp,sp,-32 # ffe0 <_files+0x8044>
      90:	000067b7          	lui	a5,0x6
      94:	00812c23          	sw	s0,24(sp)
      98:	93c7a403          	lw	s0,-1732(a5) # 593c <AUDIO>
      9c:	00112e23          	sw	ra,28(sp)
      a0:	00912a23          	sw	s1,20(sp)
      a4:	00042703          	lw	a4,0(s0)
      a8:	01212823          	sw	s2,16(sp)
      ac:	01312623          	sw	s3,12(sp)
      b0:	00042783          	lw	a5,0(s0)
      b4:	fef70ee3          	beq	a4,a5,b0 <clear_audio+0x24>
      b8:	00200493          	li	s1,2
      bc:	00100993          	li	s3,1
      c0:	00042903          	lw	s2,0(s0)
      c4:	20000613          	li	a2,512
      c8:	00000593          	li	a1,0
      cc:	00090513          	mv	a0,s2
      d0:	00002097          	auipc	ra,0x2
      d4:	c80080e7          	jalr	-896(ra) # 1d50 <memset>
      d8:	00042783          	lw	a5,0(s0)
      dc:	fef90ee3          	beq	s2,a5,d8 <clear_audio+0x4c>
      e0:	03349063          	bne	s1,s3,100 <clear_audio+0x74>
      e4:	01c12083          	lw	ra,28(sp)
      e8:	01812403          	lw	s0,24(sp)
      ec:	01412483          	lw	s1,20(sp)
      f0:	01012903          	lw	s2,16(sp)
      f4:	00c12983          	lw	s3,12(sp)
      f8:	02010113          	addi	sp,sp,32
      fc:	00008067          	ret
     100:	00100493          	li	s1,1
     104:	fbdff06f          	j	c0 <clear_audio+0x34>

00000108 <play_click_noise>:
     108:	000065b7          	lui	a1,0x6
     10c:	00006537          	lui	a0,0x6
     110:	fe010113          	addi	sp,sp,-32
     114:	95858593          	addi	a1,a1,-1704 # 5958 <LEDS+0x4>
     118:	96050513          	addi	a0,a0,-1696 # 5960 <LEDS+0xc>
     11c:	00112e23          	sw	ra,28(sp)
     120:	00812c23          	sw	s0,24(sp)
     124:	00912a23          	sw	s1,20(sp)
     128:	01212823          	sw	s2,16(sp)
     12c:	01312623          	sw	s3,12(sp)
     130:	01412423          	sw	s4,8(sp)
     134:	01512223          	sw	s5,4(sp)
     138:	00005097          	auipc	ra,0x5
     13c:	3f4080e7          	jalr	1012(ra) # 552c <fl_fopen>
     140:	0a050263          	beqz	a0,1e4 <play_click_noise+0xdc>
     144:	000015b7          	lui	a1,0x1
     148:	00000613          	li	a2,0
     14c:	19458593          	addi	a1,a1,404 # 1194 <music_player+0x2d0>
     150:	00050a13          	mv	s4,a0
     154:	00003097          	auipc	ra,0x3
     158:	868080e7          	jalr	-1944(ra) # 29bc <fl_fseek>
     15c:	000067b7          	lui	a5,0x6
     160:	93c7aa83          	lw	s5,-1732(a5) # 593c <AUDIO>
     164:	20000993          	li	s3,512
     168:	1ff00913          	li	s2,511
     16c:	000aa483          	lw	s1,0(s5)
     170:	000a0693          	mv	a3,s4
     174:	20000613          	li	a2,512
     178:	00100593          	li	a1,1
     17c:	00048513          	mv	a0,s1
     180:	00005097          	auipc	ra,0x5
     184:	da8080e7          	jalr	-600(ra) # 4f28 <fl_fread>
     188:	00050413          	mv	s0,a0
     18c:	00a94c63          	blt	s2,a0,1a4 <play_click_noise+0x9c>
     190:	40a98633          	sub	a2,s3,a0
     194:	00000593          	li	a1,0
     198:	00a48533          	add	a0,s1,a0
     19c:	00002097          	auipc	ra,0x2
     1a0:	bb4080e7          	jalr	-1100(ra) # 1d50 <memset>
     1a4:	000aa783          	lw	a5,0(s5)
     1a8:	fef48ee3          	beq	s1,a5,1a4 <play_click_noise+0x9c>
     1ac:	fc8940e3          	blt	s2,s0,16c <play_click_noise+0x64>
     1b0:	000a0513          	mv	a0,s4
     1b4:	00005097          	auipc	ra,0x5
     1b8:	c98080e7          	jalr	-872(ra) # 4e4c <fl_fclose>
     1bc:	01812403          	lw	s0,24(sp)
     1c0:	01c12083          	lw	ra,28(sp)
     1c4:	01412483          	lw	s1,20(sp)
     1c8:	01012903          	lw	s2,16(sp)
     1cc:	00c12983          	lw	s3,12(sp)
     1d0:	00812a03          	lw	s4,8(sp)
     1d4:	00412a83          	lw	s5,4(sp)
     1d8:	02010113          	addi	sp,sp,32
     1dc:	00000317          	auipc	t1,0x0
     1e0:	eb030067          	jr	-336(t1) # 8c <clear_audio>
     1e4:	01c12083          	lw	ra,28(sp)
     1e8:	01812403          	lw	s0,24(sp)
     1ec:	01412483          	lw	s1,20(sp)
     1f0:	01012903          	lw	s2,16(sp)
     1f4:	00c12983          	lw	s3,12(sp)
     1f8:	00812a03          	lw	s4,8(sp)
     1fc:	00412a83          	lw	s5,4(sp)
     200:	02010113          	addi	sp,sp,32
     204:	00008067          	ret

00000208 <view_image_file>:
     208:	000065b7          	lui	a1,0x6
     20c:	ff010113          	addi	sp,sp,-16
     210:	95858593          	addi	a1,a1,-1704 # 5958 <LEDS+0x4>
     214:	00112623          	sw	ra,12(sp)
     218:	00812423          	sw	s0,8(sp)
     21c:	00005097          	auipc	ra,0x5
     220:	310080e7          	jalr	784(ra) # 552c <fl_fopen>
     224:	08050863          	beqz	a0,2b4 <view_image_file+0xac>
     228:	00050413          	mv	s0,a0
     22c:	00002097          	auipc	ra,0x2
     230:	e70080e7          	jalr	-400(ra) # 209c <display_framebuffer>
     234:	00040693          	mv	a3,s0
     238:	00004637          	lui	a2,0x4
     23c:	00100593          	li	a1,1
     240:	00005097          	auipc	ra,0x5
     244:	ce8080e7          	jalr	-792(ra) # 4f28 <fl_fread>
     248:	00040513          	mv	a0,s0
     24c:	00005097          	auipc	ra,0x5
     250:	c00080e7          	jalr	-1024(ra) # 4e4c <fl_fclose>
     254:	00002097          	auipc	ra,0x2
     258:	fc4080e7          	jalr	-60(ra) # 2218 <display_refresh>
     25c:	000067b7          	lui	a5,0x6
     260:	9447a683          	lw	a3,-1724(a5) # 5944 <BUTTONS>
     264:	0006a703          	lw	a4,0(a3)
     268:	fe071ee3          	bnez	a4,264 <view_image_file+0x5c>
     26c:	fff74793          	not	a5,a4
     270:	0006a703          	lw	a4,0(a3)
     274:	00e7f7b3          	and	a5,a5,a4
     278:	0067f793          	andi	a5,a5,6
     27c:	fe0788e3          	beqz	a5,26c <view_image_file+0x64>
     280:	00000097          	auipc	ra,0x0
     284:	e88080e7          	jalr	-376(ra) # 108 <play_click_noise>
     288:	00002097          	auipc	ra,0x2
     28c:	e14080e7          	jalr	-492(ra) # 209c <display_framebuffer>
     290:	00004637          	lui	a2,0x4
     294:	00000593          	li	a1,0
     298:	00002097          	auipc	ra,0x2
     29c:	ab8080e7          	jalr	-1352(ra) # 1d50 <memset>
     2a0:	00812403          	lw	s0,8(sp)
     2a4:	00c12083          	lw	ra,12(sp)
     2a8:	01010113          	addi	sp,sp,16
     2ac:	00002317          	auipc	t1,0x2
     2b0:	f6c30067          	jr	-148(t1) # 2218 <display_refresh>
     2b4:	00c12083          	lw	ra,12(sp)
     2b8:	00812403          	lw	s0,8(sp)
     2bc:	01010113          	addi	sp,sp,16
     2c0:	00008067          	ret

000002c4 <play_music_file>:
     2c4:	000065b7          	lui	a1,0x6
     2c8:	fc010113          	addi	sp,sp,-64
     2cc:	95858593          	addi	a1,a1,-1704 # 5958 <LEDS+0x4>
     2d0:	02812c23          	sw	s0,56(sp)
     2d4:	02112e23          	sw	ra,60(sp)
     2d8:	02912a23          	sw	s1,52(sp)
     2dc:	03212823          	sw	s2,48(sp)
     2e0:	03312623          	sw	s3,44(sp)
     2e4:	03412423          	sw	s4,40(sp)
     2e8:	03512223          	sw	s5,36(sp)
     2ec:	03612023          	sw	s6,32(sp)
     2f0:	01712e23          	sw	s7,28(sp)
     2f4:	01812c23          	sw	s8,24(sp)
     2f8:	01912a23          	sw	s9,20(sp)
     2fc:	01a12823          	sw	s10,16(sp)
     300:	01b12623          	sw	s11,12(sp)
     304:	00050413          	mv	s0,a0
     308:	00005097          	auipc	ra,0x5
     30c:	224080e7          	jalr	548(ra) # 552c <fl_fopen>
     310:	08051063          	bnez	a0,390 <play_music_file+0xcc>
     314:	00000593          	li	a1,0
     318:	0ff00513          	li	a0,255
     31c:	00002097          	auipc	ra,0x2
     320:	da0080e7          	jalr	-608(ra) # 20bc <display_set_front_back_color>
     324:	00006537          	lui	a0,0x6
     328:	00040593          	mv	a1,s0
     32c:	96c50513          	addi	a0,a0,-1684 # 596c <LEDS+0x18>
     330:	00002097          	auipc	ra,0x2
     334:	054080e7          	jalr	84(ra) # 2384 <printf>
     338:	00002097          	auipc	ra,0x2
     33c:	ee0080e7          	jalr	-288(ra) # 2218 <display_refresh>
     340:	000317b7          	lui	a5,0x31
     344:	d4078793          	addi	a5,a5,-704 # 30d40 <__stacktop+0x20d40>
     348:	00000013          	nop
     34c:	fff78793          	addi	a5,a5,-1
     350:	fe079ce3          	bnez	a5,348 <play_music_file+0x84>
     354:	03c12083          	lw	ra,60(sp)
     358:	03812403          	lw	s0,56(sp)
     35c:	03412483          	lw	s1,52(sp)
     360:	03012903          	lw	s2,48(sp)
     364:	02c12983          	lw	s3,44(sp)
     368:	02812a03          	lw	s4,40(sp)
     36c:	02412a83          	lw	s5,36(sp)
     370:	02012b03          	lw	s6,32(sp)
     374:	01c12b83          	lw	s7,28(sp)
     378:	01812c03          	lw	s8,24(sp)
     37c:	01412c83          	lw	s9,20(sp)
     380:	01012d03          	lw	s10,16(sp)
     384:	00c12d83          	lw	s11,12(sp)
     388:	04010113          	addi	sp,sp,64
     38c:	00008067          	ret
     390:	00000593          	li	a1,0
     394:	00050c13          	mv	s8,a0
     398:	00000513          	li	a0,0
     39c:	00002097          	auipc	ra,0x2
     3a0:	d0c080e7          	jalr	-756(ra) # 20a8 <display_set_cursor>
     3a4:	00000593          	li	a1,0
     3a8:	0ff00513          	li	a0,255
     3ac:	00002097          	auipc	ra,0x2
     3b0:	d10080e7          	jalr	-752(ra) # 20bc <display_set_front_back_color>
     3b4:	00006537          	lui	a0,0x6
     3b8:	00040593          	mv	a1,s0
     3bc:	97850513          	addi	a0,a0,-1672 # 5978 <LEDS+0x24>
     3c0:	00002097          	auipc	ra,0x2
     3c4:	fc4080e7          	jalr	-60(ra) # 2384 <printf>
     3c8:	00002097          	auipc	ra,0x2
     3cc:	e50080e7          	jalr	-432(ra) # 2218 <display_refresh>
     3d0:	000067b7          	lui	a5,0x6
     3d4:	9447a783          	lw	a5,-1724(a5) # 5944 <BUTTONS>
     3d8:	00000b13          	li	s6,0
     3dc:	00100413          	li	s0,1
     3e0:	0007a483          	lw	s1,0(a5)
     3e4:	00078c93          	mv	s9,a5
     3e8:	000067b7          	lui	a5,0x6
     3ec:	93c7ad03          	lw	s10,-1732(a5) # 593c <AUDIO>
     3f0:	20000a13          	li	s4,512
     3f4:	1ff00993          	li	s3,511
     3f8:	00006937          	lui	s2,0x6
     3fc:	000d2b83          	lw	s7,0(s10)
     400:	000c0693          	mv	a3,s8
     404:	20000613          	li	a2,512
     408:	00100593          	li	a1,1
     40c:	000b8513          	mv	a0,s7
     410:	00005097          	auipc	ra,0x5
     414:	b18080e7          	jalr	-1256(ra) # 4f28 <fl_fread>
     418:	00050a93          	mv	s5,a0
     41c:	00a9cc63          	blt	s3,a0,434 <play_music_file+0x170>
     420:	40aa0633          	sub	a2,s4,a0
     424:	00000593          	li	a1,0
     428:	00ab8533          	add	a0,s7,a0
     42c:	00002097          	auipc	ra,0x2
     430:	924080e7          	jalr	-1756(ra) # 1d50 <memset>
     434:	000d2783          	lw	a5,0(s10)
     438:	fefb8ee3          	beq	s7,a5,434 <play_music_file+0x170>
     43c:	0559d263          	bge	s3,s5,480 <play_music_file+0x1bc>
     440:	fff40793          	addi	a5,s0,-1
     444:	f8040713          	addi	a4,s0,-128
     448:	00173713          	seqz	a4,a4
     44c:	0017b793          	seqz	a5,a5
     450:	00e7e7b3          	or	a5,a5,a4
     454:	00fb4733          	xor	a4,s6,a5
     458:	0afb0463          	beq	s6,a5,500 <play_music_file+0x23c>
     45c:	00141413          	slli	s0,s0,0x1
     460:	95492783          	lw	a5,-1708(s2) # 5954 <LEDS>
     464:	fff4c493          	not	s1,s1
     468:	0087a023          	sw	s0,0(a5)
     46c:	000ca783          	lw	a5,0(s9)
     470:	00f4f4b3          	and	s1,s1,a5
     474:	08048063          	beqz	s1,4f4 <play_music_file+0x230>
     478:	00000097          	auipc	ra,0x0
     47c:	c90080e7          	jalr	-880(ra) # 108 <play_click_noise>
     480:	000c0513          	mv	a0,s8
     484:	00005097          	auipc	ra,0x5
     488:	9c8080e7          	jalr	-1592(ra) # 4e4c <fl_fclose>
     48c:	00000097          	auipc	ra,0x0
     490:	c00080e7          	jalr	-1024(ra) # 8c <clear_audio>
     494:	95492783          	lw	a5,-1708(s2)
     498:	0007a023          	sw	zero,0(a5)
     49c:	00002097          	auipc	ra,0x2
     4a0:	c00080e7          	jalr	-1024(ra) # 209c <display_framebuffer>
     4a4:	00004637          	lui	a2,0x4
     4a8:	00000593          	li	a1,0
     4ac:	00002097          	auipc	ra,0x2
     4b0:	8a4080e7          	jalr	-1884(ra) # 1d50 <memset>
     4b4:	03812403          	lw	s0,56(sp)
     4b8:	03c12083          	lw	ra,60(sp)
     4bc:	03412483          	lw	s1,52(sp)
     4c0:	03012903          	lw	s2,48(sp)
     4c4:	02c12983          	lw	s3,44(sp)
     4c8:	02812a03          	lw	s4,40(sp)
     4cc:	02412a83          	lw	s5,36(sp)
     4d0:	02012b03          	lw	s6,32(sp)
     4d4:	01c12b83          	lw	s7,28(sp)
     4d8:	01812c03          	lw	s8,24(sp)
     4dc:	01412c83          	lw	s9,20(sp)
     4e0:	01012d03          	lw	s10,16(sp)
     4e4:	00c12d83          	lw	s11,12(sp)
     4e8:	04010113          	addi	sp,sp,64
     4ec:	00002317          	auipc	t1,0x2
     4f0:	d2c30067          	jr	-724(t1) # 2218 <display_refresh>
     4f4:	00070b13          	mv	s6,a4
     4f8:	00078493          	mv	s1,a5
     4fc:	f01ff06f          	j	3fc <play_music_file+0x138>
     500:	40145413          	srai	s0,s0,0x1
     504:	f5dff06f          	j	460 <play_music_file+0x19c>

00000508 <play_song_with_cover>:
     508:	dc010113          	addi	sp,sp,-576
     50c:	22812c23          	sw	s0,568(sp)
     510:	00058413          	mv	s0,a1
     514:	000065b7          	lui	a1,0x6
     518:	23212823          	sw	s2,560(sp)
     51c:	99058593          	addi	a1,a1,-1648 # 5990 <LEDS+0x3c>
     520:	00050913          	mv	s2,a0
     524:	00c10513          	addi	a0,sp,12
     528:	22112e23          	sw	ra,572(sp)
     52c:	22912a23          	sw	s1,564(sp)
     530:	23312623          	sw	s3,556(sp)
     534:	23412423          	sw	s4,552(sp)
     538:	23512223          	sw	s5,548(sp)
     53c:	23612023          	sw	s6,544(sp)
     540:	21712e23          	sw	s7,540(sp)
     544:	21812c23          	sw	s8,536(sp)
     548:	21912a23          	sw	s9,532(sp)
     54c:	21a12823          	sw	s10,528(sp)
     550:	21b12623          	sw	s11,524(sp)
     554:	00002097          	auipc	ra,0x2
     558:	8c0080e7          	jalr	-1856(ra) # 1e14 <strcpy>
     55c:	00040593          	mv	a1,s0
     560:	00c10513          	addi	a0,sp,12
     564:	00002097          	auipc	ra,0x2
     568:	8d0080e7          	jalr	-1840(ra) # 1e34 <strcat>
     56c:	000064b7          	lui	s1,0x6
     570:	95848593          	addi	a1,s1,-1704 # 5958 <LEDS+0x4>
     574:	00c10513          	addi	a0,sp,12
     578:	00005097          	auipc	ra,0x5
     57c:	fb4080e7          	jalr	-76(ra) # 552c <fl_fopen>
     580:	08050e63          	beqz	a0,61c <play_song_with_cover+0x114>
     584:	00050413          	mv	s0,a0
     588:	00002097          	auipc	ra,0x2
     58c:	b14080e7          	jalr	-1260(ra) # 209c <display_framebuffer>
     590:	00040693          	mv	a3,s0
     594:	00004637          	lui	a2,0x4
     598:	00100593          	li	a1,1
     59c:	00005097          	auipc	ra,0x5
     5a0:	98c080e7          	jalr	-1652(ra) # 4f28 <fl_fread>
     5a4:	00040513          	mv	a0,s0
     5a8:	00005097          	auipc	ra,0x5
     5ac:	8a4080e7          	jalr	-1884(ra) # 4e4c <fl_fclose>
     5b0:	00002097          	auipc	ra,0x2
     5b4:	c68080e7          	jalr	-920(ra) # 2218 <display_refresh>
     5b8:	00090513          	mv	a0,s2
     5bc:	95848593          	addi	a1,s1,-1704
     5c0:	00005097          	auipc	ra,0x5
     5c4:	f6c080e7          	jalr	-148(ra) # 552c <fl_fopen>
     5c8:	000067b7          	lui	a5,0x6
     5cc:	9447a903          	lw	s2,-1724(a5) # 5944 <BUTTONS>
     5d0:	00050c93          	mv	s9,a0
     5d4:	08051263          	bnez	a0,658 <play_song_with_cover+0x150>
     5d8:	00092783          	lw	a5,0(s2)
     5dc:	fe078ee3          	beqz	a5,5d8 <play_song_with_cover+0xd0>
     5e0:	23c12083          	lw	ra,572(sp)
     5e4:	23812403          	lw	s0,568(sp)
     5e8:	23412483          	lw	s1,564(sp)
     5ec:	23012903          	lw	s2,560(sp)
     5f0:	22c12983          	lw	s3,556(sp)
     5f4:	22812a03          	lw	s4,552(sp)
     5f8:	22412a83          	lw	s5,548(sp)
     5fc:	22012b03          	lw	s6,544(sp)
     600:	21c12b83          	lw	s7,540(sp)
     604:	21812c03          	lw	s8,536(sp)
     608:	21412c83          	lw	s9,532(sp)
     60c:	21012d03          	lw	s10,528(sp)
     610:	20c12d83          	lw	s11,524(sp)
     614:	24010113          	addi	sp,sp,576
     618:	00008067          	ret
     61c:	00002097          	auipc	ra,0x2
     620:	a04080e7          	jalr	-1532(ra) # 2020 <oled_clear>
     624:	03200593          	li	a1,50
     628:	00000513          	li	a0,0
     62c:	00002097          	auipc	ra,0x2
     630:	a7c080e7          	jalr	-1412(ra) # 20a8 <display_set_cursor>
     634:	00000593          	li	a1,0
     638:	0ff00513          	li	a0,255
     63c:	00002097          	auipc	ra,0x2
     640:	a80080e7          	jalr	-1408(ra) # 20bc <display_set_front_back_color>
     644:	00006537          	lui	a0,0x6
     648:	99850513          	addi	a0,a0,-1640 # 5998 <LEDS+0x44>
     64c:	00002097          	auipc	ra,0x2
     650:	d38080e7          	jalr	-712(ra) # 2384 <printf>
     654:	f5dff06f          	j	5b0 <play_song_with_cover+0xa8>
     658:	000067b7          	lui	a5,0x6
     65c:	00092483          	lw	s1,0(s2)
     660:	93c7ad03          	lw	s10,-1732(a5) # 593c <AUDIO>
     664:	00000b93          	li	s7,0
     668:	00100413          	li	s0,1
     66c:	20000a93          	li	s5,512
     670:	1ff00a13          	li	s4,511
     674:	000069b7          	lui	s3,0x6
     678:	000d2c03          	lw	s8,0(s10)
     67c:	000c8693          	mv	a3,s9
     680:	20000613          	li	a2,512
     684:	00100593          	li	a1,1
     688:	000c0513          	mv	a0,s8
     68c:	00005097          	auipc	ra,0x5
     690:	89c080e7          	jalr	-1892(ra) # 4f28 <fl_fread>
     694:	00050b13          	mv	s6,a0
     698:	00aa4c63          	blt	s4,a0,6b0 <play_song_with_cover+0x1a8>
     69c:	40aa8633          	sub	a2,s5,a0
     6a0:	00000593          	li	a1,0
     6a4:	00ac0533          	add	a0,s8,a0
     6a8:	00001097          	auipc	ra,0x1
     6ac:	6a8080e7          	jalr	1704(ra) # 1d50 <memset>
     6b0:	000d2783          	lw	a5,0(s10)
     6b4:	fefc0ee3          	beq	s8,a5,6b0 <play_song_with_cover+0x1a8>
     6b8:	056a5263          	bge	s4,s6,6fc <play_song_with_cover+0x1f4>
     6bc:	fff40793          	addi	a5,s0,-1
     6c0:	f8040713          	addi	a4,s0,-128
     6c4:	00173713          	seqz	a4,a4
     6c8:	0017b793          	seqz	a5,a5
     6cc:	00e7e7b3          	or	a5,a5,a4
     6d0:	00fbc733          	xor	a4,s7,a5
     6d4:	06fb8a63          	beq	s7,a5,748 <play_song_with_cover+0x240>
     6d8:	00141413          	slli	s0,s0,0x1
     6dc:	9549a783          	lw	a5,-1708(s3) # 5954 <LEDS>
     6e0:	fff4c493          	not	s1,s1
     6e4:	0087a023          	sw	s0,0(a5)
     6e8:	00092783          	lw	a5,0(s2)
     6ec:	00f4f4b3          	and	s1,s1,a5
     6f0:	04048663          	beqz	s1,73c <play_song_with_cover+0x234>
     6f4:	00000097          	auipc	ra,0x0
     6f8:	a14080e7          	jalr	-1516(ra) # 108 <play_click_noise>
     6fc:	000c8513          	mv	a0,s9
     700:	00004097          	auipc	ra,0x4
     704:	74c080e7          	jalr	1868(ra) # 4e4c <fl_fclose>
     708:	00000097          	auipc	ra,0x0
     70c:	984080e7          	jalr	-1660(ra) # 8c <clear_audio>
     710:	9549a783          	lw	a5,-1708(s3)
     714:	0007a023          	sw	zero,0(a5)
     718:	00002097          	auipc	ra,0x2
     71c:	984080e7          	jalr	-1660(ra) # 209c <display_framebuffer>
     720:	00004637          	lui	a2,0x4
     724:	00000593          	li	a1,0
     728:	00001097          	auipc	ra,0x1
     72c:	628080e7          	jalr	1576(ra) # 1d50 <memset>
     730:	00002097          	auipc	ra,0x2
     734:	ae8080e7          	jalr	-1304(ra) # 2218 <display_refresh>
     738:	ea9ff06f          	j	5e0 <play_song_with_cover+0xd8>
     73c:	00070b93          	mv	s7,a4
     740:	00078493          	mv	s1,a5
     744:	f35ff06f          	j	678 <play_song_with_cover+0x170>
     748:	40145413          	srai	s0,s0,0x1
     74c:	f91ff06f          	j	6dc <play_song_with_cover+0x1d4>

00000750 <scan_files>:
     750:	fd010113          	addi	sp,sp,-48
     754:	02912223          	sw	s1,36(sp)
     758:	000064b7          	lui	s1,0x6
     75c:	02812423          	sw	s0,40(sp)
     760:	00050593          	mv	a1,a0
     764:	00006437          	lui	s0,0x6
     768:	cf448513          	addi	a0,s1,-780 # 5cf4 <current_path>
     76c:	02112623          	sw	ra,44(sp)
     770:	03212023          	sw	s2,32(sp)
     774:	01312e23          	sw	s3,28(sp)
     778:	01412c23          	sw	s4,24(sp)
     77c:	01512a23          	sw	s5,20(sp)
     780:	01612823          	sw	s6,16(sp)
     784:	01712623          	sw	s7,12(sp)
     788:	ee042423          	sw	zero,-280(s0) # 5ee8 <n_items>
     78c:	00000097          	auipc	ra,0x0
     790:	890080e7          	jalr	-1904(ra) # 1c <strcmp>
     794:	06050e63          	beqz	a0,810 <scan_files+0xc0>
     798:	00006937          	lui	s2,0x6
     79c:	06400613          	li	a2,100
     7a0:	00000593          	li	a1,0
     7a4:	03490513          	addi	a0,s2,52 # 6034 <files>
     7a8:	00001097          	auipc	ra,0x1
     7ac:	5a8080e7          	jalr	1448(ra) # 1d50 <memset>
     7b0:	ee842783          	lw	a5,-280(s0)
     7b4:	03490913          	addi	s2,s2,52
     7b8:	000065b7          	lui	a1,0x6
     7bc:	00379513          	slli	a0,a5,0x3
     7c0:	40f50533          	sub	a0,a0,a5
     7c4:	00251513          	slli	a0,a0,0x2
     7c8:	40f50533          	sub	a0,a0,a5
     7cc:	00251513          	slli	a0,a0,0x2
     7d0:	00a90533          	add	a0,s2,a0
     7d4:	9ac58593          	addi	a1,a1,-1620 # 59ac <LEDS+0x58>
     7d8:	00001097          	auipc	ra,0x1
     7dc:	63c080e7          	jalr	1596(ra) # 1e14 <strcpy>
     7e0:	ee842703          	lw	a4,-280(s0)
     7e4:	00371793          	slli	a5,a4,0x3
     7e8:	40e787b3          	sub	a5,a5,a4
     7ec:	00279793          	slli	a5,a5,0x2
     7f0:	40e787b3          	sub	a5,a5,a4
     7f4:	00279793          	slli	a5,a5,0x2
     7f8:	00f90933          	add	s2,s2,a5
     7fc:	00100793          	li	a5,1
     800:	00f70733          	add	a4,a4,a5
     804:	06092223          	sw	zero,100(s2)
     808:	06f92423          	sw	a5,104(s2)
     80c:	eee42423          	sw	a4,-280(s0)
     810:	000069b7          	lui	s3,0x6
     814:	02898593          	addi	a1,s3,40 # 6028 <dirstat.1>
     818:	cf448513          	addi	a0,s1,-780
     81c:	00003097          	auipc	ra,0x3
     820:	6b0080e7          	jalr	1712(ra) # 3ecc <fl_opendir>
     824:	14050063          	beqz	a0,964 <scan_files+0x214>
     828:	00006937          	lui	s2,0x6
     82c:	000067b7          	lui	a5,0x6
     830:	000064b7          	lui	s1,0x6
     834:	9b078b93          	addi	s7,a5,-1616 # 59b0 <LEDS+0x5c>
     838:	03448493          	addi	s1,s1,52 # 6034 <files>
     83c:	f1890a13          	addi	s4,s2,-232 # 5f18 <dirent.0>
     840:	f1890593          	addi	a1,s2,-232
     844:	02898513          	addi	a0,s3,40
     848:	00004097          	auipc	ra,0x4
     84c:	d50080e7          	jalr	-688(ra) # 4598 <fl_readdir>
     850:	00050a93          	mv	s5,a0
     854:	00051863          	bnez	a0,864 <scan_files+0x114>
     858:	ee842b03          	lw	s6,-280(s0)
     85c:	03f00793          	li	a5,63
     860:	0367dc63          	bge	a5,s6,898 <scan_files+0x148>
     864:	02812403          	lw	s0,40(sp)
     868:	02c12083          	lw	ra,44(sp)
     86c:	02412483          	lw	s1,36(sp)
     870:	02012903          	lw	s2,32(sp)
     874:	01812a03          	lw	s4,24(sp)
     878:	01412a83          	lw	s5,20(sp)
     87c:	01012b03          	lw	s6,16(sp)
     880:	00c12b83          	lw	s7,12(sp)
     884:	02898513          	addi	a0,s3,40
     888:	01c12983          	lw	s3,28(sp)
     88c:	03010113          	addi	sp,sp,48
     890:	00002317          	auipc	t1,0x2
     894:	22430067          	jr	548(t1) # 2ab4 <fl_closedir>
     898:	000b8593          	mv	a1,s7
     89c:	f1890513          	addi	a0,s2,-232
     8a0:	fffff097          	auipc	ra,0xfffff
     8a4:	77c080e7          	jalr	1916(ra) # 1c <strcmp>
     8a8:	f8050ce3          	beqz	a0,840 <scan_files+0xf0>
     8ac:	000065b7          	lui	a1,0x6
     8b0:	9ac58593          	addi	a1,a1,-1620 # 59ac <LEDS+0x58>
     8b4:	f1890513          	addi	a0,s2,-232
     8b8:	fffff097          	auipc	ra,0xfffff
     8bc:	764080e7          	jalr	1892(ra) # 1c <strcmp>
     8c0:	f80500e3          	beqz	a0,840 <scan_files+0xf0>
     8c4:	003b1513          	slli	a0,s6,0x3
     8c8:	41650533          	sub	a0,a0,s6
     8cc:	00251513          	slli	a0,a0,0x2
     8d0:	41650533          	sub	a0,a0,s6
     8d4:	00251513          	slli	a0,a0,0x2
     8d8:	06400613          	li	a2,100
     8dc:	00000593          	li	a1,0
     8e0:	00a48533          	add	a0,s1,a0
     8e4:	00001097          	auipc	ra,0x1
     8e8:	46c080e7          	jalr	1132(ra) # 1d50 <memset>
     8ec:	ee842703          	lw	a4,-280(s0)
     8f0:	06300513          	li	a0,99
     8f4:	00371793          	slli	a5,a4,0x3
     8f8:	40e786b3          	sub	a3,a5,a4
     8fc:	00269693          	slli	a3,a3,0x2
     900:	40e686b3          	sub	a3,a3,a4
     904:	00269693          	slli	a3,a3,0x2
     908:	014a8633          	add	a2,s5,s4
     90c:	00064583          	lbu	a1,0(a2) # 4000 <_open_file+0x6c>
     910:	00058463          	beqz	a1,918 <scan_files+0x1c8>
     914:	02aa9e63          	bne	s5,a0,950 <scan_files+0x200>
     918:	40e787b3          	sub	a5,a5,a4
     91c:	00279793          	slli	a5,a5,0x2
     920:	10ca2683          	lw	a3,268(s4)
     924:	40e787b3          	sub	a5,a5,a4
     928:	00279793          	slli	a5,a5,0x2
     92c:	00f487b3          	add	a5,s1,a5
     930:	06d7a223          	sw	a3,100(a5)
     934:	104a4683          	lbu	a3,260(s4)
     938:	01578ab3          	add	s5,a5,s5
     93c:	00170713          	addi	a4,a4,1
     940:	000a8023          	sb	zero,0(s5)
     944:	06d7a423          	sw	a3,104(a5)
     948:	eee42423          	sw	a4,-280(s0)
     94c:	ef5ff06f          	j	840 <scan_files+0xf0>
     950:	00da8633          	add	a2,s5,a3
     954:	00c48633          	add	a2,s1,a2
     958:	00b60023          	sb	a1,0(a2)
     95c:	001a8a93          	addi	s5,s5,1
     960:	fa9ff06f          	j	908 <scan_files+0x1b8>
     964:	02c12083          	lw	ra,44(sp)
     968:	02812403          	lw	s0,40(sp)
     96c:	02412483          	lw	s1,36(sp)
     970:	02012903          	lw	s2,32(sp)
     974:	01c12983          	lw	s3,28(sp)
     978:	01812a03          	lw	s4,24(sp)
     97c:	01412a83          	lw	s5,20(sp)
     980:	01012b03          	lw	s6,16(sp)
     984:	00c12b83          	lw	s7,12(sp)
     988:	03010113          	addi	sp,sp,48
     98c:	00008067          	ret

00000990 <go_up_directory>:
     990:	ff010113          	addi	sp,sp,-16
     994:	00812423          	sw	s0,8(sp)
     998:	00006437          	lui	s0,0x6
     99c:	00112623          	sw	ra,12(sp)
     9a0:	00000793          	li	a5,0
     9a4:	cf440513          	addi	a0,s0,-780 # 5cf4 <current_path>
     9a8:	00a78733          	add	a4,a5,a0
     9ac:	00074683          	lbu	a3,0(a4)
     9b0:	02069a63          	bnez	a3,9e4 <go_up_directory+0x54>
     9b4:	00100693          	li	a3,1
     9b8:	02f6da63          	bge	a3,a5,9ec <go_up_directory+0x5c>
     9bc:	02f00593          	li	a1,47
     9c0:	fe070fa3          	sb	zero,-1(a4)
     9c4:	fffff097          	auipc	ra,0xfffff
     9c8:	67c080e7          	jalr	1660(ra) # 40 <strrchr>
     9cc:	02050063          	beqz	a0,9ec <go_up_directory+0x5c>
     9d0:	000500a3          	sb	zero,1(a0)
     9d4:	00c12083          	lw	ra,12(sp)
     9d8:	00812403          	lw	s0,8(sp)
     9dc:	01010113          	addi	sp,sp,16
     9e0:	00008067          	ret
     9e4:	00178793          	addi	a5,a5,1
     9e8:	fc1ff06f          	j	9a8 <go_up_directory+0x18>
     9ec:	cf440513          	addi	a0,s0,-780
     9f0:	00812403          	lw	s0,8(sp)
     9f4:	00c12083          	lw	ra,12(sp)
     9f8:	000065b7          	lui	a1,0x6
     9fc:	9b458593          	addi	a1,a1,-1612 # 59b4 <LEDS+0x60>
     a00:	01010113          	addi	sp,sp,16
     a04:	00001317          	auipc	t1,0x1
     a08:	41030067          	jr	1040(t1) # 1e14 <strcpy>

00000a0c <build_full_path>:
     a0c:	ff010113          	addi	sp,sp,-16
     a10:	00912223          	sw	s1,4(sp)
     a14:	00058493          	mv	s1,a1
     a18:	000065b7          	lui	a1,0x6
     a1c:	cf458593          	addi	a1,a1,-780 # 5cf4 <current_path>
     a20:	00812423          	sw	s0,8(sp)
     a24:	00112623          	sw	ra,12(sp)
     a28:	00050413          	mv	s0,a0
     a2c:	00001097          	auipc	ra,0x1
     a30:	3e8080e7          	jalr	1000(ra) # 1e14 <strcpy>
     a34:	00044783          	lbu	a5,0(s0)
     a38:	02079263          	bnez	a5,a5c <build_full_path+0x50>
     a3c:	0004c783          	lbu	a5,0(s1)
     a40:	02079263          	bnez	a5,a64 <build_full_path+0x58>
     a44:	00040023          	sb	zero,0(s0)
     a48:	00c12083          	lw	ra,12(sp)
     a4c:	00812403          	lw	s0,8(sp)
     a50:	00412483          	lw	s1,4(sp)
     a54:	01010113          	addi	sp,sp,16
     a58:	00008067          	ret
     a5c:	00140413          	addi	s0,s0,1
     a60:	fd5ff06f          	j	a34 <build_full_path+0x28>
     a64:	00140413          	addi	s0,s0,1
     a68:	00148493          	addi	s1,s1,1
     a6c:	fef40fa3          	sb	a5,-1(s0)
     a70:	fcdff06f          	j	a3c <build_full_path+0x30>

00000a74 <file_explorer>:
     a74:	da010113          	addi	sp,sp,-608
     a78:	24912a23          	sw	s1,596(sp)
     a7c:	25512223          	sw	s5,580(sp)
     a80:	000064b7          	lui	s1,0x6
     a84:	00006ab7          	lui	s5,0x6
     a88:	9b4a8593          	addi	a1,s5,-1612 # 59b4 <LEDS+0x60>
     a8c:	cf448513          	addi	a0,s1,-780 # 5cf4 <current_path>
     a90:	24112e23          	sw	ra,604(sp)
     a94:	24812c23          	sw	s0,600(sp)
     a98:	25212823          	sw	s2,592(sp)
     a9c:	25312623          	sw	s3,588(sp)
     aa0:	23812c23          	sw	s8,568(sp)
     aa4:	23a12823          	sw	s10,560(sp)
     aa8:	25412423          	sw	s4,584(sp)
     aac:	25612023          	sw	s6,576(sp)
     ab0:	23712e23          	sw	s7,572(sp)
     ab4:	23912a23          	sw	s9,564(sp)
     ab8:	23b12623          	sw	s11,556(sp)
     abc:	00001097          	auipc	ra,0x1
     ac0:	358080e7          	jalr	856(ra) # 1e14 <strcpy>
     ac4:	9b4a8513          	addi	a0,s5,-1612
     ac8:	00000097          	auipc	ra,0x0
     acc:	c88080e7          	jalr	-888(ra) # 750 <scan_files>
     ad0:	000067b7          	lui	a5,0x6
     ad4:	9b878793          	addi	a5,a5,-1608 # 59b8 <LEDS+0x64>
     ad8:	00f12e23          	sw	a5,28(sp)
     adc:	cf448793          	addi	a5,s1,-780
     ae0:	00f12623          	sw	a5,12(sp)
     ae4:	000067b7          	lui	a5,0x6
     ae8:	9447a783          	lw	a5,-1724(a5) # 5944 <BUTTONS>
     aec:	00000c13          	li	s8,0
     af0:	00000993          	li	s3,0
     af4:	00000913          	li	s2,0
     af8:	00000413          	li	s0,0
     afc:	01200d13          	li	s10,18
     b00:	00f12823          	sw	a5,16(sp)
     b04:	00000593          	li	a1,0
     b08:	00000513          	li	a0,0
     b0c:	00001097          	auipc	ra,0x1
     b10:	59c080e7          	jalr	1436(ra) # 20a8 <display_set_cursor>
     b14:	0ffc7593          	zext.b	a1,s8
     b18:	07f58513          	addi	a0,a1,127
     b1c:	0ff57513          	zext.b	a0,a0
     b20:	00001097          	auipc	ra,0x1
     b24:	59c080e7          	jalr	1436(ra) # 20bc <display_set_front_back_color>
     b28:	01c12503          	lw	a0,28(sp)
     b2c:	00000493          	li	s1,0
     b30:	00006bb7          	lui	s7,0x6
     b34:	00002097          	auipc	ra,0x2
     b38:	850080e7          	jalr	-1968(ra) # 2384 <printf>
     b3c:	00c00a13          	li	s4,12
     b40:	00c12783          	lw	a5,12(sp)
     b44:	00f487b3          	add	a5,s1,a5
     b48:	0007c503          	lbu	a0,0(a5)
     b4c:	00050a63          	beqz	a0,b60 <file_explorer+0xec>
     b50:	efcba783          	lw	a5,-260(s7) # 5efc <f_putchar>
     b54:	00148493          	addi	s1,s1,1
     b58:	000780e7          	jalr	a5
     b5c:	ff4492e3          	bne	s1,s4,b40 <file_explorer+0xcc>
     b60:	efcba783          	lw	a5,-260(s7)
     b64:	00a00513          	li	a0,10
     b68:	00006db7          	lui	s11,0x6
     b6c:	000780e7          	jalr	a5
     b70:	00000593          	li	a1,0
     b74:	0ff00513          	li	a0,255
     b78:	00001097          	auipc	ra,0x1
     b7c:	544080e7          	jalr	1348(ra) # 20bc <display_set_front_back_color>
     b80:	ee8daa03          	lw	s4,-280(s11) # 5ee8 <n_items>
     b84:	080a0463          	beqz	s4,c0c <file_explorer+0x198>
     b88:	412a0a33          	sub	s4,s4,s2
     b8c:	00c00793          	li	a5,12
     b90:	0147d463          	bge	a5,s4,b98 <file_explorer+0x124>
     b94:	00078a13          	mv	s4,a5
     b98:	00391493          	slli	s1,s2,0x3
     b9c:	412484b3          	sub	s1,s1,s2
     ba0:	00249493          	slli	s1,s1,0x2
     ba4:	412484b3          	sub	s1,s1,s2
     ba8:	000067b7          	lui	a5,0x6
     bac:	03478793          	addi	a5,a5,52 # 6034 <files>
     bb0:	00249493          	slli	s1,s1,0x2
     bb4:	00f484b3          	add	s1,s1,a5
     bb8:	000067b7          	lui	a5,0x6
     bbc:	9d478793          	addi	a5,a5,-1580 # 59d4 <LEDS+0x80>
     bc0:	00f12a23          	sw	a5,20(sp)
     bc4:	000067b7          	lui	a5,0x6
     bc8:	9cc78793          	addi	a5,a5,-1588 # 59cc <LEDS+0x78>
     bcc:	00000b13          	li	s6,0
     bd0:	00f12c23          	sw	a5,24(sp)
     bd4:	194b4863          	blt	s6,s4,d64 <file_explorer+0x2f0>
     bd8:	00000593          	li	a1,0
     bdc:	00000513          	li	a0,0
     be0:	000064b7          	lui	s1,0x6
     be4:	00001097          	auipc	ra,0x1
     be8:	4d8080e7          	jalr	1240(ra) # 20bc <display_set_front_back_color>
     bec:	00c00b13          	li	s6,12
     bf0:	9dc48493          	addi	s1,s1,-1572 # 59dc <LEDS+0x88>
     bf4:	036a0463          	beq	s4,s6,c1c <file_explorer+0x1a8>
     bf8:	00048513          	mv	a0,s1
     bfc:	00001097          	auipc	ra,0x1
     c00:	788080e7          	jalr	1928(ra) # 2384 <printf>
     c04:	001a0a13          	addi	s4,s4,1
     c08:	fedff06f          	j	bf4 <file_explorer+0x180>
     c0c:	00006537          	lui	a0,0x6
     c10:	9c450513          	addi	a0,a0,-1596 # 59c4 <LEDS+0x70>
     c14:	00001097          	auipc	ra,0x1
     c18:	770080e7          	jalr	1904(ra) # 2384 <printf>
     c1c:	00001097          	auipc	ra,0x1
     c20:	5fc080e7          	jalr	1532(ra) # 2218 <display_refresh>
     c24:	01012783          	lw	a5,16(sp)
     c28:	fff9c993          	not	s3,s3
     c2c:	0007aa03          	lw	s4,0(a5)
     c30:	0149f9b3          	and	s3,s3,s4
     c34:	0109f793          	andi	a5,s3,16
     c38:	00078863          	beqz	a5,c48 <file_explorer+0x1d4>
     c3c:	00140413          	addi	s0,s0,1
     c40:	fffff097          	auipc	ra,0xfffff
     c44:	4c8080e7          	jalr	1224(ra) # 108 <play_click_noise>
     c48:	0089f793          	andi	a5,s3,8
     c4c:	00078863          	beqz	a5,c5c <file_explorer+0x1e8>
     c50:	fff40413          	addi	s0,s0,-1
     c54:	fffff097          	auipc	ra,0xfffff
     c58:	4b4080e7          	jalr	1204(ra) # 108 <play_click_noise>
     c5c:	0029f793          	andi	a5,s3,2
     c60:	04078a63          	beqz	a5,cb4 <file_explorer+0x240>
     c64:	fffff097          	auipc	ra,0xfffff
     c68:	4a4080e7          	jalr	1188(ra) # 108 <play_click_noise>
     c6c:	00c12503          	lw	a0,12(sp)
     c70:	9b4a8593          	addi	a1,s5,-1612
     c74:	fffff097          	auipc	ra,0xfffff
     c78:	3a8080e7          	jalr	936(ra) # 1c <strcmp>
     c7c:	20050663          	beqz	a0,e88 <file_explorer+0x414>
     c80:	00000097          	auipc	ra,0x0
     c84:	d10080e7          	jalr	-752(ra) # 990 <go_up_directory>
     c88:	9b4a8513          	addi	a0,s5,-1612
     c8c:	00000097          	auipc	ra,0x0
     c90:	ac4080e7          	jalr	-1340(ra) # 750 <scan_files>
     c94:	00001097          	auipc	ra,0x1
     c98:	408080e7          	jalr	1032(ra) # 209c <display_framebuffer>
     c9c:	00004637          	lui	a2,0x4
     ca0:	00000593          	li	a1,0
     ca4:	00001097          	auipc	ra,0x1
     ca8:	0ac080e7          	jalr	172(ra) # 1d50 <memset>
     cac:	00000913          	li	s2,0
     cb0:	00000413          	li	s0,0
     cb4:	0049f993          	andi	s3,s3,4
     cb8:	007c0c13          	addi	s8,s8,7
     cbc:	08098063          	beqz	s3,d3c <file_explorer+0x2c8>
     cc0:	00341493          	slli	s1,s0,0x3
     cc4:	408484b3          	sub	s1,s1,s0
     cc8:	fffff097          	auipc	ra,0xfffff
     ccc:	440080e7          	jalr	1088(ra) # 108 <play_click_noise>
     cd0:	00249493          	slli	s1,s1,0x2
     cd4:	408484b3          	sub	s1,s1,s0
     cd8:	000067b7          	lui	a5,0x6
     cdc:	03478793          	addi	a5,a5,52 # 6034 <files>
     ce0:	00249493          	slli	s1,s1,0x2
     ce4:	00f484b3          	add	s1,s1,a5
     ce8:	0684a783          	lw	a5,104(s1)
     cec:	14078263          	beqz	a5,e30 <file_explorer+0x3bc>
     cf0:	000065b7          	lui	a1,0x6
     cf4:	9ac58593          	addi	a1,a1,-1620 # 59ac <LEDS+0x58>
     cf8:	00048513          	mv	a0,s1
     cfc:	fffff097          	auipc	ra,0xfffff
     d00:	320080e7          	jalr	800(ra) # 1c <strcmp>
     d04:	10051a63          	bnez	a0,e18 <file_explorer+0x3a4>
     d08:	00000097          	auipc	ra,0x0
     d0c:	c88080e7          	jalr	-888(ra) # 990 <go_up_directory>
     d10:	9b4a8513          	addi	a0,s5,-1612
     d14:	00000097          	auipc	ra,0x0
     d18:	a3c080e7          	jalr	-1476(ra) # 750 <scan_files>
     d1c:	00001097          	auipc	ra,0x1
     d20:	380080e7          	jalr	896(ra) # 209c <display_framebuffer>
     d24:	00004637          	lui	a2,0x4
     d28:	00000593          	li	a1,0
     d2c:	00001097          	auipc	ra,0x1
     d30:	024080e7          	jalr	36(ra) # 1d50 <memset>
     d34:	00000913          	li	s2,0
     d38:	00000413          	li	s0,0
     d3c:	ee8da783          	lw	a5,-280(s11)
     d40:	00f05e63          	blez	a5,d5c <file_explorer+0x2e8>
     d44:	12045663          	bgez	s0,e70 <file_explorer+0x3fc>
     d48:	fff78413          	addi	s0,a5,-1
     d4c:	13244a63          	blt	s0,s2,e80 <file_explorer+0x40c>
     d50:	00b90793          	addi	a5,s2,11
     d54:	0087d463          	bge	a5,s0,d5c <file_explorer+0x2e8>
     d58:	ff540913          	addi	s2,s0,-11
     d5c:	000a0993          	mv	s3,s4
     d60:	da5ff06f          	j	b04 <file_explorer+0x90>
     d64:	012b0cb3          	add	s9,s6,s2
     d68:	07941463          	bne	s0,s9,dd0 <file_explorer+0x35c>
     d6c:	0ff00593          	li	a1,255
     d70:	00000513          	li	a0,0
     d74:	00001097          	auipc	ra,0x1
     d78:	348080e7          	jalr	840(ra) # 20bc <display_set_front_back_color>
     d7c:	0684a783          	lw	a5,104(s1)
     d80:	000c8593          	mv	a1,s9
     d84:	04078c63          	beqz	a5,ddc <file_explorer+0x368>
     d88:	01812503          	lw	a0,24(sp)
     d8c:	00001097          	auipc	ra,0x1
     d90:	5f8080e7          	jalr	1528(ra) # 2384 <printf>
     d94:	00000c93          	li	s9,0
     d98:	019487b3          	add	a5,s1,s9
     d9c:	0007c503          	lbu	a0,0(a5)
     da0:	00050a63          	beqz	a0,db4 <file_explorer+0x340>
     da4:	efcba783          	lw	a5,-260(s7)
     da8:	001c8c93          	addi	s9,s9,1
     dac:	000780e7          	jalr	a5
     db0:	ffac94e3          	bne	s9,s10,d98 <file_explorer+0x324>
     db4:	efcba783          	lw	a5,-260(s7)
     db8:	03ac9663          	bne	s9,s10,de4 <file_explorer+0x370>
     dbc:	00a00513          	li	a0,10
     dc0:	000780e7          	jalr	a5
     dc4:	001b0b13          	addi	s6,s6,1
     dc8:	06c48493          	addi	s1,s1,108
     dcc:	e09ff06f          	j	bd4 <file_explorer+0x160>
     dd0:	00000593          	li	a1,0
     dd4:	0ff00513          	li	a0,255
     dd8:	f9dff06f          	j	d74 <file_explorer+0x300>
     ddc:	01412503          	lw	a0,20(sp)
     de0:	fadff06f          	j	d8c <file_explorer+0x318>
     de4:	02000513          	li	a0,32
     de8:	000780e7          	jalr	a5
     dec:	001c8c93          	addi	s9,s9,1
     df0:	fc5ff06f          	j	db4 <file_explorer+0x340>
     df4:	00178793          	addi	a5,a5,1
     df8:	0007c703          	lbu	a4,0(a5)
     dfc:	fe071ce3          	bnez	a4,df4 <file_explorer+0x380>
     e00:	0004c703          	lbu	a4,0(s1)
     e04:	00071e63          	bnez	a4,e20 <file_explorer+0x3ac>
     e08:	02f00713          	li	a4,47
     e0c:	00e78023          	sb	a4,0(a5)
     e10:	000780a3          	sb	zero,1(a5)
     e14:	efdff06f          	j	d10 <file_explorer+0x29c>
     e18:	00c12783          	lw	a5,12(sp)
     e1c:	fddff06f          	j	df8 <file_explorer+0x384>
     e20:	00178793          	addi	a5,a5,1
     e24:	00148493          	addi	s1,s1,1
     e28:	fee78fa3          	sb	a4,-1(a5)
     e2c:	fd5ff06f          	j	e00 <file_explorer+0x38c>
     e30:	02c10513          	addi	a0,sp,44
     e34:	00048593          	mv	a1,s1
     e38:	00000097          	auipc	ra,0x0
     e3c:	bd4080e7          	jalr	-1068(ra) # a0c <build_full_path>
     e40:	0644a703          	lw	a4,100(s1)
     e44:	000047b7          	lui	a5,0x4
     e48:	02c10513          	addi	a0,sp,44
     e4c:	00f71c63          	bne	a4,a5,e64 <file_explorer+0x3f0>
     e50:	fffff097          	auipc	ra,0xfffff
     e54:	3b8080e7          	jalr	952(ra) # 208 <view_image_file>
     e58:	01012783          	lw	a5,16(sp)
     e5c:	0007a783          	lw	a5,0(a5) # 4000 <_open_file+0x6c>
     e60:	eddff06f          	j	d3c <file_explorer+0x2c8>
     e64:	fffff097          	auipc	ra,0xfffff
     e68:	460080e7          	jalr	1120(ra) # 2c4 <play_music_file>
     e6c:	fedff06f          	j	e58 <file_explorer+0x3e4>
     e70:	00f427b3          	slt	a5,s0,a5
     e74:	40f007b3          	neg	a5,a5
     e78:	00f47433          	and	s0,s0,a5
     e7c:	ed1ff06f          	j	d4c <file_explorer+0x2d8>
     e80:	00040913          	mv	s2,s0
     e84:	ed9ff06f          	j	d5c <file_explorer+0x2e8>
     e88:	25c12083          	lw	ra,604(sp)
     e8c:	25812403          	lw	s0,600(sp)
     e90:	25412483          	lw	s1,596(sp)
     e94:	25012903          	lw	s2,592(sp)
     e98:	24c12983          	lw	s3,588(sp)
     e9c:	24812a03          	lw	s4,584(sp)
     ea0:	24412a83          	lw	s5,580(sp)
     ea4:	24012b03          	lw	s6,576(sp)
     ea8:	23c12b83          	lw	s7,572(sp)
     eac:	23812c03          	lw	s8,568(sp)
     eb0:	23412c83          	lw	s9,564(sp)
     eb4:	23012d03          	lw	s10,560(sp)
     eb8:	22c12d83          	lw	s11,556(sp)
     ebc:	26010113          	addi	sp,sp,608
     ec0:	00008067          	ret

00000ec4 <music_player>:
     ec4:	da010113          	addi	sp,sp,-608
     ec8:	24912a23          	sw	s1,596(sp)
     ecc:	25412423          	sw	s4,584(sp)
     ed0:	000064b7          	lui	s1,0x6
     ed4:	00006a37          	lui	s4,0x6
     ed8:	9f4a0593          	addi	a1,s4,-1548 # 59f4 <LEDS+0xa0>
     edc:	cf448513          	addi	a0,s1,-780 # 5cf4 <current_path>
     ee0:	24112e23          	sw	ra,604(sp)
     ee4:	24812c23          	sw	s0,600(sp)
     ee8:	25212823          	sw	s2,592(sp)
     eec:	25312623          	sw	s3,588(sp)
     ef0:	23812c23          	sw	s8,568(sp)
     ef4:	23a12823          	sw	s10,560(sp)
     ef8:	25512223          	sw	s5,580(sp)
     efc:	25612023          	sw	s6,576(sp)
     f00:	23712e23          	sw	s7,572(sp)
     f04:	23912a23          	sw	s9,564(sp)
     f08:	23b12623          	sw	s11,556(sp)
     f0c:	00001097          	auipc	ra,0x1
     f10:	f08080e7          	jalr	-248(ra) # 1e14 <strcpy>
     f14:	9f4a0513          	addi	a0,s4,-1548
     f18:	00000097          	auipc	ra,0x0
     f1c:	838080e7          	jalr	-1992(ra) # 750 <scan_files>
     f20:	000067b7          	lui	a5,0x6
     f24:	a0078793          	addi	a5,a5,-1536 # 5a00 <LEDS+0xac>
     f28:	00f12e23          	sw	a5,28(sp)
     f2c:	cf448793          	addi	a5,s1,-780
     f30:	00f12623          	sw	a5,12(sp)
     f34:	000067b7          	lui	a5,0x6
     f38:	9447a783          	lw	a5,-1724(a5) # 5944 <BUTTONS>
     f3c:	00000c13          	li	s8,0
     f40:	00000993          	li	s3,0
     f44:	00000913          	li	s2,0
     f48:	00000413          	li	s0,0
     f4c:	01200d13          	li	s10,18
     f50:	00f12823          	sw	a5,16(sp)
     f54:	00000593          	li	a1,0
     f58:	00000513          	li	a0,0
     f5c:	00001097          	auipc	ra,0x1
     f60:	14c080e7          	jalr	332(ra) # 20a8 <display_set_cursor>
     f64:	0ffc7593          	zext.b	a1,s8
     f68:	07f58513          	addi	a0,a1,127
     f6c:	0ff57513          	zext.b	a0,a0
     f70:	00001097          	auipc	ra,0x1
     f74:	14c080e7          	jalr	332(ra) # 20bc <display_set_front_back_color>
     f78:	01c12503          	lw	a0,28(sp)
     f7c:	00000493          	li	s1,0
     f80:	00006bb7          	lui	s7,0x6
     f84:	00001097          	auipc	ra,0x1
     f88:	400080e7          	jalr	1024(ra) # 2384 <printf>
     f8c:	00c00a93          	li	s5,12
     f90:	00c12783          	lw	a5,12(sp)
     f94:	00f487b3          	add	a5,s1,a5
     f98:	0007c503          	lbu	a0,0(a5)
     f9c:	00050a63          	beqz	a0,fb0 <music_player+0xec>
     fa0:	efcba783          	lw	a5,-260(s7) # 5efc <f_putchar>
     fa4:	00148493          	addi	s1,s1,1
     fa8:	000780e7          	jalr	a5
     fac:	ff5492e3          	bne	s1,s5,f90 <music_player+0xcc>
     fb0:	efcba783          	lw	a5,-260(s7)
     fb4:	00a00513          	li	a0,10
     fb8:	00006db7          	lui	s11,0x6
     fbc:	000780e7          	jalr	a5
     fc0:	00000593          	li	a1,0
     fc4:	0ff00513          	li	a0,255
     fc8:	00001097          	auipc	ra,0x1
     fcc:	0f4080e7          	jalr	244(ra) # 20bc <display_set_front_back_color>
     fd0:	ee8daa83          	lw	s5,-280(s11) # 5ee8 <n_items>
     fd4:	080a8463          	beqz	s5,105c <music_player+0x198>
     fd8:	412a8ab3          	sub	s5,s5,s2
     fdc:	00c00793          	li	a5,12
     fe0:	0157d463          	bge	a5,s5,fe8 <music_player+0x124>
     fe4:	00078a93          	mv	s5,a5
     fe8:	00391493          	slli	s1,s2,0x3
     fec:	412484b3          	sub	s1,s1,s2
     ff0:	00249493          	slli	s1,s1,0x2
     ff4:	412484b3          	sub	s1,s1,s2
     ff8:	000067b7          	lui	a5,0x6
     ffc:	03478793          	addi	a5,a5,52 # 6034 <files>
    1000:	00249493          	slli	s1,s1,0x2
    1004:	00f484b3          	add	s1,s1,a5
    1008:	000067b7          	lui	a5,0x6
    100c:	9d478793          	addi	a5,a5,-1580 # 59d4 <LEDS+0x80>
    1010:	00f12a23          	sw	a5,20(sp)
    1014:	000067b7          	lui	a5,0x6
    1018:	9cc78793          	addi	a5,a5,-1588 # 59cc <LEDS+0x78>
    101c:	00000b13          	li	s6,0
    1020:	00f12c23          	sw	a5,24(sp)
    1024:	1d5b4c63          	blt	s6,s5,11fc <music_player+0x338>
    1028:	00000593          	li	a1,0
    102c:	00000513          	li	a0,0
    1030:	000064b7          	lui	s1,0x6
    1034:	00001097          	auipc	ra,0x1
    1038:	088080e7          	jalr	136(ra) # 20bc <display_set_front_back_color>
    103c:	00c00b13          	li	s6,12
    1040:	9dc48493          	addi	s1,s1,-1572 # 59dc <LEDS+0x88>
    1044:	036a8463          	beq	s5,s6,106c <music_player+0x1a8>
    1048:	00048513          	mv	a0,s1
    104c:	00001097          	auipc	ra,0x1
    1050:	338080e7          	jalr	824(ra) # 2384 <printf>
    1054:	001a8a93          	addi	s5,s5,1
    1058:	fedff06f          	j	1044 <music_player+0x180>
    105c:	00006537          	lui	a0,0x6
    1060:	9c450513          	addi	a0,a0,-1596 # 59c4 <LEDS+0x70>
    1064:	00001097          	auipc	ra,0x1
    1068:	320080e7          	jalr	800(ra) # 2384 <printf>
    106c:	00001097          	auipc	ra,0x1
    1070:	1ac080e7          	jalr	428(ra) # 2218 <display_refresh>
    1074:	01012783          	lw	a5,16(sp)
    1078:	fff9c993          	not	s3,s3
    107c:	0007aa83          	lw	s5,0(a5)
    1080:	0159f9b3          	and	s3,s3,s5
    1084:	0109f793          	andi	a5,s3,16
    1088:	00078863          	beqz	a5,1098 <music_player+0x1d4>
    108c:	00140413          	addi	s0,s0,1
    1090:	fffff097          	auipc	ra,0xfffff
    1094:	078080e7          	jalr	120(ra) # 108 <play_click_noise>
    1098:	0089f793          	andi	a5,s3,8
    109c:	00078863          	beqz	a5,10ac <music_player+0x1e8>
    10a0:	fff40413          	addi	s0,s0,-1
    10a4:	fffff097          	auipc	ra,0xfffff
    10a8:	064080e7          	jalr	100(ra) # 108 <play_click_noise>
    10ac:	0029f793          	andi	a5,s3,2
    10b0:	06078c63          	beqz	a5,1128 <music_player+0x264>
    10b4:	fffff097          	auipc	ra,0xfffff
    10b8:	054080e7          	jalr	84(ra) # 108 <play_click_noise>
    10bc:	00c12503          	lw	a0,12(sp)
    10c0:	9f4a0593          	addi	a1,s4,-1548
    10c4:	fffff097          	auipc	ra,0xfffff
    10c8:	f58080e7          	jalr	-168(ra) # 1c <strcmp>
    10cc:	24050e63          	beqz	a0,1328 <music_player+0x464>
    10d0:	00000097          	auipc	ra,0x0
    10d4:	8c0080e7          	jalr	-1856(ra) # 990 <go_up_directory>
    10d8:	00c12503          	lw	a0,12(sp)
    10dc:	9f4a0593          	addi	a1,s4,-1548
    10e0:	fffff097          	auipc	ra,0xfffff
    10e4:	f84080e7          	jalr	-124(ra) # 64 <starts_with>
    10e8:	00051a63          	bnez	a0,10fc <music_player+0x238>
    10ec:	00c12503          	lw	a0,12(sp)
    10f0:	9f4a0593          	addi	a1,s4,-1548
    10f4:	00001097          	auipc	ra,0x1
    10f8:	d20080e7          	jalr	-736(ra) # 1e14 <strcpy>
    10fc:	9f4a0513          	addi	a0,s4,-1548
    1100:	fffff097          	auipc	ra,0xfffff
    1104:	650080e7          	jalr	1616(ra) # 750 <scan_files>
    1108:	00001097          	auipc	ra,0x1
    110c:	f94080e7          	jalr	-108(ra) # 209c <display_framebuffer>
    1110:	00004637          	lui	a2,0x4
    1114:	00000593          	li	a1,0
    1118:	00001097          	auipc	ra,0x1
    111c:	c38080e7          	jalr	-968(ra) # 1d50 <memset>
    1120:	00000913          	li	s2,0
    1124:	00000413          	li	s0,0
    1128:	0049f993          	andi	s3,s3,4
    112c:	007c0c13          	addi	s8,s8,7
    1130:	0a098263          	beqz	s3,11d4 <music_player+0x310>
    1134:	00341493          	slli	s1,s0,0x3
    1138:	408484b3          	sub	s1,s1,s0
    113c:	fffff097          	auipc	ra,0xfffff
    1140:	fcc080e7          	jalr	-52(ra) # 108 <play_click_noise>
    1144:	00249493          	slli	s1,s1,0x2
    1148:	408484b3          	sub	s1,s1,s0
    114c:	000067b7          	lui	a5,0x6
    1150:	03478793          	addi	a5,a5,52 # 6034 <files>
    1154:	00249493          	slli	s1,s1,0x2
    1158:	00f484b3          	add	s1,s1,a5
    115c:	0684a783          	lw	a5,104(s1)
    1160:	16078463          	beqz	a5,12c8 <music_player+0x404>
    1164:	000065b7          	lui	a1,0x6
    1168:	9ac58593          	addi	a1,a1,-1620 # 59ac <LEDS+0x58>
    116c:	00048513          	mv	a0,s1
    1170:	fffff097          	auipc	ra,0xfffff
    1174:	eac080e7          	jalr	-340(ra) # 1c <strcmp>
    1178:	12051c63          	bnez	a0,12b0 <music_player+0x3ec>
    117c:	00000097          	auipc	ra,0x0
    1180:	814080e7          	jalr	-2028(ra) # 990 <go_up_directory>
    1184:	00c12503          	lw	a0,12(sp)
    1188:	9f4a0593          	addi	a1,s4,-1548
    118c:	fffff097          	auipc	ra,0xfffff
    1190:	ed8080e7          	jalr	-296(ra) # 64 <starts_with>
    1194:	00051a63          	bnez	a0,11a8 <music_player+0x2e4>
    1198:	00c12503          	lw	a0,12(sp)
    119c:	9f4a0593          	addi	a1,s4,-1548
    11a0:	00001097          	auipc	ra,0x1
    11a4:	c74080e7          	jalr	-908(ra) # 1e14 <strcpy>
    11a8:	9f4a0513          	addi	a0,s4,-1548
    11ac:	fffff097          	auipc	ra,0xfffff
    11b0:	5a4080e7          	jalr	1444(ra) # 750 <scan_files>
    11b4:	00001097          	auipc	ra,0x1
    11b8:	ee8080e7          	jalr	-280(ra) # 209c <display_framebuffer>
    11bc:	00004637          	lui	a2,0x4
    11c0:	00000593          	li	a1,0
    11c4:	00001097          	auipc	ra,0x1
    11c8:	b8c080e7          	jalr	-1140(ra) # 1d50 <memset>
    11cc:	00000913          	li	s2,0
    11d0:	00000413          	li	s0,0
    11d4:	ee8da783          	lw	a5,-280(s11)
    11d8:	00f05e63          	blez	a5,11f4 <music_player+0x330>
    11dc:	12045a63          	bgez	s0,1310 <music_player+0x44c>
    11e0:	fff78413          	addi	s0,a5,-1
    11e4:	13244e63          	blt	s0,s2,1320 <music_player+0x45c>
    11e8:	00b90793          	addi	a5,s2,11
    11ec:	0087d463          	bge	a5,s0,11f4 <music_player+0x330>
    11f0:	ff540913          	addi	s2,s0,-11
    11f4:	000a8993          	mv	s3,s5
    11f8:	d5dff06f          	j	f54 <music_player+0x90>
    11fc:	012b0cb3          	add	s9,s6,s2
    1200:	07941463          	bne	s0,s9,1268 <music_player+0x3a4>
    1204:	0ff00593          	li	a1,255
    1208:	00000513          	li	a0,0
    120c:	00001097          	auipc	ra,0x1
    1210:	eb0080e7          	jalr	-336(ra) # 20bc <display_set_front_back_color>
    1214:	0684a783          	lw	a5,104(s1)
    1218:	000c8593          	mv	a1,s9
    121c:	04078c63          	beqz	a5,1274 <music_player+0x3b0>
    1220:	01812503          	lw	a0,24(sp)
    1224:	00001097          	auipc	ra,0x1
    1228:	160080e7          	jalr	352(ra) # 2384 <printf>
    122c:	00000c93          	li	s9,0
    1230:	019487b3          	add	a5,s1,s9
    1234:	0007c503          	lbu	a0,0(a5)
    1238:	00050a63          	beqz	a0,124c <music_player+0x388>
    123c:	efcba783          	lw	a5,-260(s7)
    1240:	001c8c93          	addi	s9,s9,1
    1244:	000780e7          	jalr	a5
    1248:	ffac94e3          	bne	s9,s10,1230 <music_player+0x36c>
    124c:	efcba783          	lw	a5,-260(s7)
    1250:	03ac9663          	bne	s9,s10,127c <music_player+0x3b8>
    1254:	00a00513          	li	a0,10
    1258:	000780e7          	jalr	a5
    125c:	001b0b13          	addi	s6,s6,1
    1260:	06c48493          	addi	s1,s1,108
    1264:	dc1ff06f          	j	1024 <music_player+0x160>
    1268:	00000593          	li	a1,0
    126c:	0ff00513          	li	a0,255
    1270:	f9dff06f          	j	120c <music_player+0x348>
    1274:	01412503          	lw	a0,20(sp)
    1278:	fadff06f          	j	1224 <music_player+0x360>
    127c:	02000513          	li	a0,32
    1280:	000780e7          	jalr	a5
    1284:	001c8c93          	addi	s9,s9,1
    1288:	fc5ff06f          	j	124c <music_player+0x388>
    128c:	00178793          	addi	a5,a5,1
    1290:	0007c703          	lbu	a4,0(a5)
    1294:	fe071ce3          	bnez	a4,128c <music_player+0x3c8>
    1298:	0004c703          	lbu	a4,0(s1)
    129c:	00071e63          	bnez	a4,12b8 <music_player+0x3f4>
    12a0:	02f00713          	li	a4,47
    12a4:	00e78023          	sb	a4,0(a5)
    12a8:	000780a3          	sb	zero,1(a5)
    12ac:	efdff06f          	j	11a8 <music_player+0x2e4>
    12b0:	00c12783          	lw	a5,12(sp)
    12b4:	fddff06f          	j	1290 <music_player+0x3cc>
    12b8:	00178793          	addi	a5,a5,1
    12bc:	00148493          	addi	s1,s1,1
    12c0:	fee78fa3          	sb	a4,-1(a5)
    12c4:	fd5ff06f          	j	1298 <music_player+0x3d4>
    12c8:	00048593          	mv	a1,s1
    12cc:	02c10513          	addi	a0,sp,44
    12d0:	fffff097          	auipc	ra,0xfffff
    12d4:	73c080e7          	jalr	1852(ra) # a0c <build_full_path>
    12d8:	0644a703          	lw	a4,100(s1)
    12dc:	000047b7          	lui	a5,0x4
    12e0:	00f71e63          	bne	a4,a5,12fc <music_player+0x438>
    12e4:	02c10513          	addi	a0,sp,44
    12e8:	fffff097          	auipc	ra,0xfffff
    12ec:	f20080e7          	jalr	-224(ra) # 208 <view_image_file>
    12f0:	01012783          	lw	a5,16(sp)
    12f4:	0007a783          	lw	a5,0(a5) # 4000 <_open_file+0x6c>
    12f8:	eddff06f          	j	11d4 <music_player+0x310>
    12fc:	00048593          	mv	a1,s1
    1300:	02c10513          	addi	a0,sp,44
    1304:	fffff097          	auipc	ra,0xfffff
    1308:	204080e7          	jalr	516(ra) # 508 <play_song_with_cover>
    130c:	fe5ff06f          	j	12f0 <music_player+0x42c>
    1310:	00f427b3          	slt	a5,s0,a5
    1314:	40f007b3          	neg	a5,a5
    1318:	00f47433          	and	s0,s0,a5
    131c:	ec9ff06f          	j	11e4 <music_player+0x320>
    1320:	00040913          	mv	s2,s0
    1324:	ed1ff06f          	j	11f4 <music_player+0x330>
    1328:	25c12083          	lw	ra,604(sp)
    132c:	25812403          	lw	s0,600(sp)
    1330:	25412483          	lw	s1,596(sp)
    1334:	25012903          	lw	s2,592(sp)
    1338:	24c12983          	lw	s3,588(sp)
    133c:	24812a03          	lw	s4,584(sp)
    1340:	24412a83          	lw	s5,580(sp)
    1344:	24012b03          	lw	s6,576(sp)
    1348:	23c12b83          	lw	s7,572(sp)
    134c:	23812c03          	lw	s8,568(sp)
    1350:	23412c83          	lw	s9,564(sp)
    1354:	23012d03          	lw	s10,560(sp)
    1358:	22c12d83          	lw	s11,556(sp)
    135c:	26010113          	addi	sp,sp,608
    1360:	00008067          	ret

00001364 <not_implemented>:
    1364:	ff010113          	addi	sp,sp,-16
    1368:	00812423          	sw	s0,8(sp)
    136c:	00050413          	mv	s0,a0
    1370:	00000513          	li	a0,0
    1374:	00112623          	sw	ra,12(sp)
    1378:	00001097          	auipc	ra,0x1
    137c:	ca8080e7          	jalr	-856(ra) # 2020 <oled_clear>
    1380:	02800593          	li	a1,40
    1384:	00000513          	li	a0,0
    1388:	00001097          	auipc	ra,0x1
    138c:	d20080e7          	jalr	-736(ra) # 20a8 <display_set_cursor>
    1390:	00006537          	lui	a0,0x6
    1394:	00040593          	mv	a1,s0
    1398:	a0c50513          	addi	a0,a0,-1524 # 5a0c <LEDS+0xb8>
    139c:	00001097          	auipc	ra,0x1
    13a0:	fe8080e7          	jalr	-24(ra) # 2384 <printf>
    13a4:	03c00593          	li	a1,60
    13a8:	00000513          	li	a0,0
    13ac:	00001097          	auipc	ra,0x1
    13b0:	cfc080e7          	jalr	-772(ra) # 20a8 <display_set_cursor>
    13b4:	00006537          	lui	a0,0x6
    13b8:	a1450513          	addi	a0,a0,-1516 # 5a14 <LEDS+0xc0>
    13bc:	00001097          	auipc	ra,0x1
    13c0:	fc8080e7          	jalr	-56(ra) # 2384 <printf>
    13c4:	00001097          	auipc	ra,0x1
    13c8:	e54080e7          	jalr	-428(ra) # 2218 <display_refresh>
    13cc:	000067b7          	lui	a5,0x6
    13d0:	9447a783          	lw	a5,-1724(a5) # 5944 <BUTTONS>
    13d4:	0007a703          	lw	a4,0(a5)
    13d8:	fe070ee3          	beqz	a4,13d4 <not_implemented+0x70>
    13dc:	0007a703          	lw	a4,0(a5)
    13e0:	fe071ee3          	bnez	a4,13dc <not_implemented+0x78>
    13e4:	00812403          	lw	s0,8(sp)
    13e8:	00c12083          	lw	ra,12(sp)
    13ec:	01010113          	addi	sp,sp,16
    13f0:	fffff317          	auipc	t1,0xfffff
    13f4:	d1830067          	jr	-744(t1) # 108 <play_click_noise>

000013f8 <main_menu>:
    13f8:	000067b7          	lui	a5,0x6
    13fc:	fc010113          	addi	sp,sp,-64
    1400:	a2478793          	addi	a5,a5,-1500 # 5a24 <LEDS+0xd0>
    1404:	00f12223          	sw	a5,4(sp)
    1408:	000067b7          	lui	a5,0x6
    140c:	a3478793          	addi	a5,a5,-1484 # 5a34 <LEDS+0xe0>
    1410:	03312623          	sw	s3,44(sp)
    1414:	000069b7          	lui	s3,0x6
    1418:	00f12423          	sw	a5,8(sp)
    141c:	a4098793          	addi	a5,s3,-1472 # 5a40 <LEDS+0xec>
    1420:	00f12623          	sw	a5,12(sp)
    1424:	000067b7          	lui	a5,0x6
    1428:	01912a23          	sw	s9,20(sp)
    142c:	a4878c93          	addi	s9,a5,-1464 # 5a48 <LEDS+0xf4>
    1430:	000067b7          	lui	a5,0x6
    1434:	01712e23          	sw	s7,28(sp)
    1438:	a5c78b93          	addi	s7,a5,-1444 # 5a5c <LEDS+0x108>
    143c:	000067b7          	lui	a5,0x6
    1440:	01812c23          	sw	s8,24(sp)
    1444:	a6c78c13          	addi	s8,a5,-1428 # 5a6c <LEDS+0x118>
    1448:	000067b7          	lui	a5,0x6
    144c:	01a12823          	sw	s10,16(sp)
    1450:	a7078d13          	addi	s10,a5,-1424 # 5a70 <LEDS+0x11c>
    1454:	000067b7          	lui	a5,0x6
    1458:	03612023          	sw	s6,32(sp)
    145c:	9447ab03          	lw	s6,-1724(a5) # 5944 <BUTTONS>
    1460:	02812c23          	sw	s0,56(sp)
    1464:	02912a23          	sw	s1,52(sp)
    1468:	03412423          	sw	s4,40(sp)
    146c:	02112e23          	sw	ra,60(sp)
    1470:	03212823          	sw	s2,48(sp)
    1474:	03512223          	sw	s5,36(sp)
    1478:	00000493          	li	s1,0
    147c:	00000413          	li	s0,0
    1480:	00300a13          	li	s4,3
    1484:	00000593          	li	a1,0
    1488:	00000513          	li	a0,0
    148c:	00001097          	auipc	ra,0x1
    1490:	c1c080e7          	jalr	-996(ra) # 20a8 <display_set_cursor>
    1494:	00000593          	li	a1,0
    1498:	0ff00513          	li	a0,255
    149c:	00001097          	auipc	ra,0x1
    14a0:	c20080e7          	jalr	-992(ra) # 20bc <display_set_front_back_color>
    14a4:	000c8513          	mv	a0,s9
    14a8:	00001097          	auipc	ra,0x1
    14ac:	edc080e7          	jalr	-292(ra) # 2384 <printf>
    14b0:	00410a93          	addi	s5,sp,4
    14b4:	00000913          	li	s2,0
    14b8:	11241263          	bne	s0,s2,15bc <main_menu+0x1c4>
    14bc:	0ff00593          	li	a1,255
    14c0:	00000513          	li	a0,0
    14c4:	00001097          	auipc	ra,0x1
    14c8:	bf8080e7          	jalr	-1032(ra) # 20bc <display_set_front_back_color>
    14cc:	000aa603          	lw	a2,0(s5)
    14d0:	00190913          	addi	s2,s2,1
    14d4:	00090593          	mv	a1,s2
    14d8:	000b8513          	mv	a0,s7
    14dc:	00001097          	auipc	ra,0x1
    14e0:	ea8080e7          	jalr	-344(ra) # 2384 <printf>
    14e4:	000c0513          	mv	a0,s8
    14e8:	00001097          	auipc	ra,0x1
    14ec:	e9c080e7          	jalr	-356(ra) # 2384 <printf>
    14f0:	004a8a93          	addi	s5,s5,4
    14f4:	fd4912e3          	bne	s2,s4,14b8 <main_menu+0xc0>
    14f8:	00000593          	li	a1,0
    14fc:	0ff00513          	li	a0,255
    1500:	00001097          	auipc	ra,0x1
    1504:	bbc080e7          	jalr	-1092(ra) # 20bc <display_set_front_back_color>
    1508:	06e00593          	li	a1,110
    150c:	00000513          	li	a0,0
    1510:	00001097          	auipc	ra,0x1
    1514:	b98080e7          	jalr	-1128(ra) # 20a8 <display_set_cursor>
    1518:	000d0513          	mv	a0,s10
    151c:	00001097          	auipc	ra,0x1
    1520:	e68080e7          	jalr	-408(ra) # 2384 <printf>
    1524:	00001097          	auipc	ra,0x1
    1528:	cf4080e7          	jalr	-780(ra) # 2218 <display_refresh>
    152c:	000b2903          	lw	s2,0(s6)
    1530:	fff4c493          	not	s1,s1
    1534:	0124f4b3          	and	s1,s1,s2
    1538:	0104f793          	andi	a5,s1,16
    153c:	00078863          	beqz	a5,154c <main_menu+0x154>
    1540:	00140413          	addi	s0,s0,1
    1544:	fffff097          	auipc	ra,0xfffff
    1548:	bc4080e7          	jalr	-1084(ra) # 108 <play_click_noise>
    154c:	0084f793          	andi	a5,s1,8
    1550:	00078863          	beqz	a5,1560 <main_menu+0x168>
    1554:	fff40413          	addi	s0,s0,-1
    1558:	fffff097          	auipc	ra,0xfffff
    155c:	bb0080e7          	jalr	-1104(ra) # 108 <play_click_noise>
    1560:	0044f493          	andi	s1,s1,4
    1564:	02048c63          	beqz	s1,159c <main_menu+0x1a4>
    1568:	fffff097          	auipc	ra,0xfffff
    156c:	ba0080e7          	jalr	-1120(ra) # 108 <play_click_noise>
    1570:	04041c63          	bnez	s0,15c8 <main_menu+0x1d0>
    1574:	fffff097          	auipc	ra,0xfffff
    1578:	500080e7          	jalr	1280(ra) # a74 <file_explorer>
    157c:	00001097          	auipc	ra,0x1
    1580:	b20080e7          	jalr	-1248(ra) # 209c <display_framebuffer>
    1584:	00004637          	lui	a2,0x4
    1588:	00000593          	li	a1,0
    158c:	00000097          	auipc	ra,0x0
    1590:	7c4080e7          	jalr	1988(ra) # 1d50 <memset>
    1594:	000b0793          	mv	a5,s6
    1598:	0007a783          	lw	a5,0(a5)
    159c:	fff00793          	li	a5,-1
    15a0:	00f40863          	beq	s0,a5,15b0 <main_menu+0x1b8>
    15a4:	01441863          	bne	s0,s4,15b4 <main_menu+0x1bc>
    15a8:	00000413          	li	s0,0
    15ac:	0080006f          	j	15b4 <main_menu+0x1bc>
    15b0:	00200413          	li	s0,2
    15b4:	00090493          	mv	s1,s2
    15b8:	ecdff06f          	j	1484 <main_menu+0x8c>
    15bc:	00000593          	li	a1,0
    15c0:	0ff00513          	li	a0,255
    15c4:	f01ff06f          	j	14c4 <main_menu+0xcc>
    15c8:	00100793          	li	a5,1
    15cc:	00f41863          	bne	s0,a5,15dc <main_menu+0x1e4>
    15d0:	00000097          	auipc	ra,0x0
    15d4:	8f4080e7          	jalr	-1804(ra) # ec4 <music_player>
    15d8:	fa5ff06f          	j	157c <main_menu+0x184>
    15dc:	00200793          	li	a5,2
    15e0:	f8f41ee3          	bne	s0,a5,157c <main_menu+0x184>
    15e4:	a4098513          	addi	a0,s3,-1472
    15e8:	00000097          	auipc	ra,0x0
    15ec:	d7c080e7          	jalr	-644(ra) # 1364 <not_implemented>
    15f0:	f8dff06f          	j	157c <main_menu+0x184>

000015f4 <main>:
    15f4:	000067b7          	lui	a5,0x6
    15f8:	9547a783          	lw	a5,-1708(a5) # 5954 <LEDS>
    15fc:	ff010113          	addi	sp,sp,-16
    1600:	00112623          	sw	ra,12(sp)
    1604:	00812423          	sw	s0,8(sp)
    1608:	0007a023          	sw	zero,0(a5)
    160c:	000027b7          	lui	a5,0x2
    1610:	0d078793          	addi	a5,a5,208 # 20d0 <display_putchar>
    1614:	00006737          	lui	a4,0x6
    1618:	eef72e23          	sw	a5,-260(a4) # 5efc <f_putchar>
    161c:	00001097          	auipc	ra,0x1
    1620:	960080e7          	jalr	-1696(ra) # 1f7c <oled_init>
    1624:	00001097          	auipc	ra,0x1
    1628:	964080e7          	jalr	-1692(ra) # 1f88 <oled_fullscreen>
    162c:	00001097          	auipc	ra,0x1
    1630:	a70080e7          	jalr	-1424(ra) # 209c <display_framebuffer>
    1634:	00004637          	lui	a2,0x4
    1638:	00000593          	li	a1,0
    163c:	00000097          	auipc	ra,0x0
    1640:	714080e7          	jalr	1812(ra) # 1d50 <memset>
    1644:	00001097          	auipc	ra,0x1
    1648:	bd4080e7          	jalr	-1068(ra) # 2218 <display_refresh>
    164c:	00000097          	auipc	ra,0x0
    1650:	4a4080e7          	jalr	1188(ra) # 1af0 <sdcard_init>
    1654:	00001097          	auipc	ra,0x1
    1658:	300080e7          	jalr	768(ra) # 2954 <fl_init>
    165c:	00000593          	li	a1,0
    1660:	00000513          	li	a0,0
    1664:	00001097          	auipc	ra,0x1
    1668:	a44080e7          	jalr	-1468(ra) # 20a8 <display_set_cursor>
    166c:	00000593          	li	a1,0
    1670:	0ff00513          	li	a0,255
    1674:	00001097          	auipc	ra,0x1
    1678:	a48080e7          	jalr	-1464(ra) # 20bc <display_set_front_back_color>
    167c:	00006537          	lui	a0,0x6
    1680:	a8450513          	addi	a0,a0,-1404 # 5a84 <LEDS+0x130>
    1684:	00001097          	auipc	ra,0x1
    1688:	d00080e7          	jalr	-768(ra) # 2384 <printf>
    168c:	00001097          	auipc	ra,0x1
    1690:	b8c080e7          	jalr	-1140(ra) # 2218 <display_refresh>
    1694:	000025b7          	lui	a1,0x2
    1698:	000027b7          	lui	a5,0x2
    169c:	c9458593          	addi	a1,a1,-876 # 1c94 <sdcard_writesector>
    16a0:	c4078413          	addi	s0,a5,-960 # 1c40 <sdcard_readsector>
    16a4:	00040513          	mv	a0,s0
    16a8:	00002097          	auipc	ra,0x2
    16ac:	20c080e7          	jalr	524(ra) # 38b4 <fl_attach_media>
    16b0:	000027b7          	lui	a5,0x2
    16b4:	c9478593          	addi	a1,a5,-876 # 1c94 <sdcard_writesector>
    16b8:	fe0516e3          	bnez	a0,16a4 <main+0xb0>
    16bc:	00000097          	auipc	ra,0x0
    16c0:	d3c080e7          	jalr	-708(ra) # 13f8 <main_menu>

000016c4 <pause>:
    16c4:	c0002773          	rdcycle	a4
    16c8:	c00027f3          	rdcycle	a5
    16cc:	40e787b3          	sub	a5,a5,a4
    16d0:	fea7ece3          	bltu	a5,a0,16c8 <pause+0x4>
    16d4:	00008067          	ret

000016d8 <sdcard_idle>:
    16d8:	00008067          	ret

000016dc <sdcard_select>:
    16dc:	000067b7          	lui	a5,0x6
    16e0:	9487a783          	lw	a5,-1720(a5) # 5948 <SDCARD>
    16e4:	00200713          	li	a4,2
    16e8:	00e7a023          	sw	a4,0(a5)
    16ec:	00008067          	ret

000016f0 <sdcard_ponder>:
    16f0:	000066b7          	lui	a3,0x6
    16f4:	9486a683          	lw	a3,-1720(a3) # 5948 <SDCARD>
    16f8:	01000793          	li	a5,16
    16fc:	00000713          	li	a4,0
    1700:	00676613          	ori	a2,a4,6
    1704:	00c6a023          	sw	a2,0(a3)
    1708:	00174713          	xori	a4,a4,1
    170c:	00000013          	nop
    1710:	fff78793          	addi	a5,a5,-1
    1714:	fe0796e3          	bnez	a5,1700 <sdcard_ponder+0x10>
    1718:	00008067          	ret

0000171c <sdcard_unselect>:
    171c:	000067b7          	lui	a5,0x6
    1720:	9487a783          	lw	a5,-1720(a5) # 5948 <SDCARD>
    1724:	00600713          	li	a4,6
    1728:	00e7a023          	sw	a4,0(a5)
    172c:	00008067          	ret

00001730 <sdcard_send>:
    1730:	000067b7          	lui	a5,0x6
    1734:	9487a783          	lw	a5,-1720(a5) # 5948 <SDCARD>
    1738:	00655713          	srli	a4,a0,0x6
    173c:	00277713          	andi	a4,a4,2
    1740:	00e7a023          	sw	a4,0(a5)
    1744:	00176713          	ori	a4,a4,1
    1748:	00e7a023          	sw	a4,0(a5)
    174c:	00555713          	srli	a4,a0,0x5
    1750:	00277713          	andi	a4,a4,2
    1754:	00e7a023          	sw	a4,0(a5)
    1758:	00176713          	ori	a4,a4,1
    175c:	00e7a023          	sw	a4,0(a5)
    1760:	00455713          	srli	a4,a0,0x4
    1764:	00277713          	andi	a4,a4,2
    1768:	00e7a023          	sw	a4,0(a5)
    176c:	00176713          	ori	a4,a4,1
    1770:	00e7a023          	sw	a4,0(a5)
    1774:	00355713          	srli	a4,a0,0x3
    1778:	00277713          	andi	a4,a4,2
    177c:	00e7a023          	sw	a4,0(a5)
    1780:	00176713          	ori	a4,a4,1
    1784:	00e7a023          	sw	a4,0(a5)
    1788:	00255713          	srli	a4,a0,0x2
    178c:	00277713          	andi	a4,a4,2
    1790:	00e7a023          	sw	a4,0(a5)
    1794:	00176713          	ori	a4,a4,1
    1798:	00e7a023          	sw	a4,0(a5)
    179c:	00155713          	srli	a4,a0,0x1
    17a0:	00277713          	andi	a4,a4,2
    17a4:	00e7a023          	sw	a4,0(a5)
    17a8:	00176713          	ori	a4,a4,1
    17ac:	00e7a023          	sw	a4,0(a5)
    17b0:	00257713          	andi	a4,a0,2
    17b4:	00e7a023          	sw	a4,0(a5)
    17b8:	00151513          	slli	a0,a0,0x1
    17bc:	00176713          	ori	a4,a4,1
    17c0:	00e7a023          	sw	a4,0(a5)
    17c4:	00257513          	andi	a0,a0,2
    17c8:	00a7a023          	sw	a0,0(a5)
    17cc:	00156513          	ori	a0,a0,1
    17d0:	00a7a023          	sw	a0,0(a5)
    17d4:	00200713          	li	a4,2
    17d8:	00e7a023          	sw	a4,0(a5)
    17dc:	000067b7          	lui	a5,0x6
    17e0:	eec7a783          	lw	a5,-276(a5) # 5eec <sdcard_while_loading_callback>
    17e4:	00078067          	jr	a5

000017e8 <sdcard_read>:
    17e8:	fd010113          	addi	sp,sp,-48
    17ec:	fff50793          	addi	a5,a0,-1
    17f0:	03212023          	sw	s2,32(sp)
    17f4:	00100913          	li	s2,1
    17f8:	00f91933          	sll	s2,s2,a5
    17fc:	000067b7          	lui	a5,0x6
    1800:	01312e23          	sw	s3,28(sp)
    1804:	9487a983          	lw	s3,-1720(a5) # 5948 <SDCARD>
    1808:	02812423          	sw	s0,40(sp)
    180c:	02912223          	sw	s1,36(sp)
    1810:	01412c23          	sw	s4,24(sp)
    1814:	01512a23          	sw	s5,20(sp)
    1818:	01612823          	sw	s6,16(sp)
    181c:	02112623          	sw	ra,44(sp)
    1820:	0ff00413          	li	s0,255
    1824:	00000493          	li	s1,0
    1828:	00300a13          	li	s4,3
    182c:	00200a93          	li	s5,2
    1830:	00006b37          	lui	s6,0x6
    1834:	02058c63          	beqz	a1,186c <sdcard_read+0x84>
    1838:	012477b3          	and	a5,s0,s2
    183c:	02079a63          	bnez	a5,1870 <sdcard_read+0x88>
    1840:	02c12083          	lw	ra,44(sp)
    1844:	0ff47513          	zext.b	a0,s0
    1848:	02812403          	lw	s0,40(sp)
    184c:	02412483          	lw	s1,36(sp)
    1850:	02012903          	lw	s2,32(sp)
    1854:	01c12983          	lw	s3,28(sp)
    1858:	01812a03          	lw	s4,24(sp)
    185c:	01412a83          	lw	s5,20(sp)
    1860:	01012b03          	lw	s6,16(sp)
    1864:	03010113          	addi	sp,sp,48
    1868:	00008067          	ret
    186c:	fca4dae3          	bge	s1,a0,1840 <sdcard_read+0x58>
    1870:	0149a023          	sw	s4,0(s3)
    1874:	0159a023          	sw	s5,0(s3)
    1878:	0009a783          	lw	a5,0(s3)
    187c:	00141413          	slli	s0,s0,0x1
    1880:	00b12623          	sw	a1,12(sp)
    1884:	00f46433          	or	s0,s0,a5
    1888:	eecb2783          	lw	a5,-276(s6) # 5eec <sdcard_while_loading_callback>
    188c:	00a12423          	sw	a0,8(sp)
    1890:	00148493          	addi	s1,s1,1
    1894:	000780e7          	jalr	a5
    1898:	00c12583          	lw	a1,12(sp)
    189c:	00812503          	lw	a0,8(sp)
    18a0:	f95ff06f          	j	1834 <sdcard_read+0x4c>

000018a4 <sdcard_get>:
    18a4:	fe010113          	addi	sp,sp,-32
    18a8:	00112e23          	sw	ra,28(sp)
    18ac:	00812c23          	sw	s0,24(sp)
    18b0:	00912a23          	sw	s1,20(sp)
    18b4:	00050413          	mv	s0,a0
    18b8:	00b12623          	sw	a1,12(sp)
    18bc:	00000097          	auipc	ra,0x0
    18c0:	e20080e7          	jalr	-480(ra) # 16dc <sdcard_select>
    18c4:	00c12583          	lw	a1,12(sp)
    18c8:	00040513          	mv	a0,s0
    18cc:	00100493          	li	s1,1
    18d0:	00000097          	auipc	ra,0x0
    18d4:	f18080e7          	jalr	-232(ra) # 17e8 <sdcard_read>
    18d8:	00345413          	srli	s0,s0,0x3
    18dc:	0284c463          	blt	s1,s0,1904 <sdcard_get+0x60>
    18e0:	00a12623          	sw	a0,12(sp)
    18e4:	00000097          	auipc	ra,0x0
    18e8:	e38080e7          	jalr	-456(ra) # 171c <sdcard_unselect>
    18ec:	01c12083          	lw	ra,28(sp)
    18f0:	01812403          	lw	s0,24(sp)
    18f4:	00c12503          	lw	a0,12(sp)
    18f8:	01412483          	lw	s1,20(sp)
    18fc:	02010113          	addi	sp,sp,32
    1900:	00008067          	ret
    1904:	00000593          	li	a1,0
    1908:	00800513          	li	a0,8
    190c:	00000097          	auipc	ra,0x0
    1910:	edc080e7          	jalr	-292(ra) # 17e8 <sdcard_read>
    1914:	00148493          	addi	s1,s1,1
    1918:	fc5ff06f          	j	18dc <sdcard_get+0x38>

0000191c <sdcard_cmd>:
    191c:	ff010113          	addi	sp,sp,-16
    1920:	00812423          	sw	s0,8(sp)
    1924:	00912223          	sw	s1,4(sp)
    1928:	01212023          	sw	s2,0(sp)
    192c:	00112623          	sw	ra,12(sp)
    1930:	00050913          	mv	s2,a0
    1934:	00000413          	li	s0,0
    1938:	00000097          	auipc	ra,0x0
    193c:	da4080e7          	jalr	-604(ra) # 16dc <sdcard_select>
    1940:	00600493          	li	s1,6
    1944:	008907b3          	add	a5,s2,s0
    1948:	0007c503          	lbu	a0,0(a5)
    194c:	00140413          	addi	s0,s0,1
    1950:	00000097          	auipc	ra,0x0
    1954:	de0080e7          	jalr	-544(ra) # 1730 <sdcard_send>
    1958:	fe9416e3          	bne	s0,s1,1944 <sdcard_cmd+0x28>
    195c:	00812403          	lw	s0,8(sp)
    1960:	00c12083          	lw	ra,12(sp)
    1964:	00412483          	lw	s1,4(sp)
    1968:	00012903          	lw	s2,0(sp)
    196c:	01010113          	addi	sp,sp,16
    1970:	00000317          	auipc	t1,0x0
    1974:	dac30067          	jr	-596(t1) # 171c <sdcard_unselect>

00001978 <sdcard_start_sector>:
    1978:	ff010113          	addi	sp,sp,-16
    197c:	00112623          	sw	ra,12(sp)
    1980:	00812423          	sw	s0,8(sp)
    1984:	00050413          	mv	s0,a0
    1988:	00000097          	auipc	ra,0x0
    198c:	d54080e7          	jalr	-684(ra) # 16dc <sdcard_select>
    1990:	05100513          	li	a0,81
    1994:	00000097          	auipc	ra,0x0
    1998:	d9c080e7          	jalr	-612(ra) # 1730 <sdcard_send>
    199c:	01845513          	srli	a0,s0,0x18
    19a0:	00000097          	auipc	ra,0x0
    19a4:	d90080e7          	jalr	-624(ra) # 1730 <sdcard_send>
    19a8:	41045513          	srai	a0,s0,0x10
    19ac:	0ff57513          	zext.b	a0,a0
    19b0:	00000097          	auipc	ra,0x0
    19b4:	d80080e7          	jalr	-640(ra) # 1730 <sdcard_send>
    19b8:	40845513          	srai	a0,s0,0x8
    19bc:	0ff57513          	zext.b	a0,a0
    19c0:	00000097          	auipc	ra,0x0
    19c4:	d70080e7          	jalr	-656(ra) # 1730 <sdcard_send>
    19c8:	0ff47513          	zext.b	a0,s0
    19cc:	00000097          	auipc	ra,0x0
    19d0:	d64080e7          	jalr	-668(ra) # 1730 <sdcard_send>
    19d4:	05500513          	li	a0,85
    19d8:	00000097          	auipc	ra,0x0
    19dc:	d58080e7          	jalr	-680(ra) # 1730 <sdcard_send>
    19e0:	00000097          	auipc	ra,0x0
    19e4:	d3c080e7          	jalr	-708(ra) # 171c <sdcard_unselect>
    19e8:	00812403          	lw	s0,8(sp)
    19ec:	00c12083          	lw	ra,12(sp)
    19f0:	00100593          	li	a1,1
    19f4:	00800513          	li	a0,8
    19f8:	01010113          	addi	sp,sp,16
    19fc:	00000317          	auipc	t1,0x0
    1a00:	ea830067          	jr	-344(t1) # 18a4 <sdcard_get>

00001a04 <sdcard_read_sector>:
    1a04:	ff010113          	addi	sp,sp,-16
    1a08:	00812423          	sw	s0,8(sp)
    1a0c:	00112623          	sw	ra,12(sp)
    1a10:	00912223          	sw	s1,4(sp)
    1a14:	01212023          	sw	s2,0(sp)
    1a18:	00058413          	mv	s0,a1
    1a1c:	00000097          	auipc	ra,0x0
    1a20:	f5c080e7          	jalr	-164(ra) # 1978 <sdcard_start_sector>
    1a24:	04051863          	bnez	a0,1a74 <sdcard_read_sector+0x70>
    1a28:	00100593          	li	a1,1
    1a2c:	00058513          	mv	a0,a1
    1a30:	00000097          	auipc	ra,0x0
    1a34:	e74080e7          	jalr	-396(ra) # 18a4 <sdcard_get>
    1a38:	00000493          	li	s1,0
    1a3c:	20000913          	li	s2,512
    1a40:	00000593          	li	a1,0
    1a44:	00800513          	li	a0,8
    1a48:	00000097          	auipc	ra,0x0
    1a4c:	e5c080e7          	jalr	-420(ra) # 18a4 <sdcard_get>
    1a50:	009407b3          	add	a5,s0,s1
    1a54:	00a78023          	sb	a0,0(a5)
    1a58:	00148493          	addi	s1,s1,1
    1a5c:	ff2492e3          	bne	s1,s2,1a40 <sdcard_read_sector+0x3c>
    1a60:	00100593          	li	a1,1
    1a64:	01000513          	li	a0,16
    1a68:	20040413          	addi	s0,s0,512
    1a6c:	00000097          	auipc	ra,0x0
    1a70:	e38080e7          	jalr	-456(ra) # 18a4 <sdcard_get>
    1a74:	00c12083          	lw	ra,12(sp)
    1a78:	00040513          	mv	a0,s0
    1a7c:	00812403          	lw	s0,8(sp)
    1a80:	00412483          	lw	s1,4(sp)
    1a84:	00012903          	lw	s2,0(sp)
    1a88:	01010113          	addi	sp,sp,16
    1a8c:	00008067          	ret

00001a90 <sdcard_preinit>:
    1a90:	ff010113          	addi	sp,sp,-16
    1a94:	000067b7          	lui	a5,0x6
    1a98:	00812423          	sw	s0,8(sp)
    1a9c:	9487a403          	lw	s0,-1720(a5) # 5948 <SDCARD>
    1aa0:	00112623          	sw	ra,12(sp)
    1aa4:	00600793          	li	a5,6
    1aa8:	01313537          	lui	a0,0x1313
    1aac:	00f42023          	sw	a5,0(s0)
    1ab0:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
    1ab4:	00000097          	auipc	ra,0x0
    1ab8:	c10080e7          	jalr	-1008(ra) # 16c4 <pause>
    1abc:	0a000793          	li	a5,160
    1ac0:	00000713          	li	a4,0
    1ac4:	00676693          	ori	a3,a4,6
    1ac8:	00d42023          	sw	a3,0(s0)
    1acc:	fff78793          	addi	a5,a5,-1
    1ad0:	00174713          	xori	a4,a4,1
    1ad4:	fe0798e3          	bnez	a5,1ac4 <sdcard_preinit+0x34>
    1ad8:	00600793          	li	a5,6
    1adc:	00c12083          	lw	ra,12(sp)
    1ae0:	00f42023          	sw	a5,0(s0)
    1ae4:	00812403          	lw	s0,8(sp)
    1ae8:	01010113          	addi	sp,sp,16
    1aec:	00008067          	ret

00001af0 <sdcard_init>:
    1af0:	000017b7          	lui	a5,0x1
    1af4:	6d878793          	addi	a5,a5,1752 # 16d8 <sdcard_idle>
    1af8:	00006737          	lui	a4,0x6
    1afc:	fe010113          	addi	sp,sp,-32
    1b00:	eef72623          	sw	a5,-276(a4) # 5eec <sdcard_while_loading_callback>
    1b04:	000067b7          	lui	a5,0x6
    1b08:	00812c23          	sw	s0,24(sp)
    1b0c:	00912a23          	sw	s1,20(sp)
    1b10:	00112e23          	sw	ra,28(sp)
    1b14:	93478493          	addi	s1,a5,-1740 # 5934 <cmd0>
    1b18:	0ff00413          	li	s0,255
    1b1c:	00000097          	auipc	ra,0x0
    1b20:	f74080e7          	jalr	-140(ra) # 1a90 <sdcard_preinit>
    1b24:	00048513          	mv	a0,s1
    1b28:	00000097          	auipc	ra,0x0
    1b2c:	df4080e7          	jalr	-524(ra) # 191c <sdcard_cmd>
    1b30:	00100593          	li	a1,1
    1b34:	00800513          	li	a0,8
    1b38:	00000097          	auipc	ra,0x0
    1b3c:	d6c080e7          	jalr	-660(ra) # 18a4 <sdcard_get>
    1b40:	00a12623          	sw	a0,12(sp)
    1b44:	00000097          	auipc	ra,0x0
    1b48:	bac080e7          	jalr	-1108(ra) # 16f0 <sdcard_ponder>
    1b4c:	00c12503          	lw	a0,12(sp)
    1b50:	00851c63          	bne	a0,s0,1b68 <sdcard_init+0x78>
    1b54:	01313537          	lui	a0,0x1313
    1b58:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
    1b5c:	00000097          	auipc	ra,0x0
    1b60:	b68080e7          	jalr	-1176(ra) # 16c4 <pause>
    1b64:	fb9ff06f          	j	1b1c <sdcard_init+0x2c>
    1b68:	00006537          	lui	a0,0x6
    1b6c:	92c50513          	addi	a0,a0,-1748 # 592c <cmd8>
    1b70:	00000097          	auipc	ra,0x0
    1b74:	dac080e7          	jalr	-596(ra) # 191c <sdcard_cmd>
    1b78:	00100593          	li	a1,1
    1b7c:	02800513          	li	a0,40
    1b80:	00000097          	auipc	ra,0x0
    1b84:	d24080e7          	jalr	-732(ra) # 18a4 <sdcard_get>
    1b88:	00000097          	auipc	ra,0x0
    1b8c:	b68080e7          	jalr	-1176(ra) # 16f0 <sdcard_ponder>
    1b90:	000067b7          	lui	a5,0x6
    1b94:	92478413          	addi	s0,a5,-1756 # 5924 <cmd55>
    1b98:	000067b7          	lui	a5,0x6
    1b9c:	91c78493          	addi	s1,a5,-1764 # 591c <acmd41>
    1ba0:	00040513          	mv	a0,s0
    1ba4:	00000097          	auipc	ra,0x0
    1ba8:	d78080e7          	jalr	-648(ra) # 191c <sdcard_cmd>
    1bac:	00100593          	li	a1,1
    1bb0:	00800513          	li	a0,8
    1bb4:	00000097          	auipc	ra,0x0
    1bb8:	cf0080e7          	jalr	-784(ra) # 18a4 <sdcard_get>
    1bbc:	00000097          	auipc	ra,0x0
    1bc0:	b34080e7          	jalr	-1228(ra) # 16f0 <sdcard_ponder>
    1bc4:	00048513          	mv	a0,s1
    1bc8:	00000097          	auipc	ra,0x0
    1bcc:	d54080e7          	jalr	-684(ra) # 191c <sdcard_cmd>
    1bd0:	00100593          	li	a1,1
    1bd4:	00800513          	li	a0,8
    1bd8:	00000097          	auipc	ra,0x0
    1bdc:	ccc080e7          	jalr	-820(ra) # 18a4 <sdcard_get>
    1be0:	00a12623          	sw	a0,12(sp)
    1be4:	00000097          	auipc	ra,0x0
    1be8:	b0c080e7          	jalr	-1268(ra) # 16f0 <sdcard_ponder>
    1bec:	00c12503          	lw	a0,12(sp)
    1bf0:	00050c63          	beqz	a0,1c08 <sdcard_init+0x118>
    1bf4:	001e8537          	lui	a0,0x1e8
    1bf8:	48050513          	addi	a0,a0,1152 # 1e8480 <__stacktop+0x1d8480>
    1bfc:	00000097          	auipc	ra,0x0
    1c00:	ac8080e7          	jalr	-1336(ra) # 16c4 <pause>
    1c04:	f9dff06f          	j	1ba0 <sdcard_init+0xb0>
    1c08:	00006537          	lui	a0,0x6
    1c0c:	91450513          	addi	a0,a0,-1772 # 5914 <cmd16>
    1c10:	00000097          	auipc	ra,0x0
    1c14:	d0c080e7          	jalr	-756(ra) # 191c <sdcard_cmd>
    1c18:	00100593          	li	a1,1
    1c1c:	00800513          	li	a0,8
    1c20:	00000097          	auipc	ra,0x0
    1c24:	c84080e7          	jalr	-892(ra) # 18a4 <sdcard_get>
    1c28:	01812403          	lw	s0,24(sp)
    1c2c:	01c12083          	lw	ra,28(sp)
    1c30:	01412483          	lw	s1,20(sp)
    1c34:	02010113          	addi	sp,sp,32
    1c38:	00000317          	auipc	t1,0x0
    1c3c:	ab830067          	jr	-1352(t1) # 16f0 <sdcard_ponder>

00001c40 <sdcard_readsector>:
    1c40:	04060663          	beqz	a2,1c8c <sdcard_readsector+0x4c>
    1c44:	ff010113          	addi	sp,sp,-16
    1c48:	00812423          	sw	s0,8(sp)
    1c4c:	00912223          	sw	s1,4(sp)
    1c50:	00112623          	sw	ra,12(sp)
    1c54:	00050413          	mv	s0,a0
    1c58:	00a604b3          	add	s1,a2,a0
    1c5c:	00040513          	mv	a0,s0
    1c60:	00000097          	auipc	ra,0x0
    1c64:	da4080e7          	jalr	-604(ra) # 1a04 <sdcard_read_sector>
    1c68:	00140413          	addi	s0,s0,1
    1c6c:	00050593          	mv	a1,a0
    1c70:	fe9416e3          	bne	s0,s1,1c5c <sdcard_readsector+0x1c>
    1c74:	00c12083          	lw	ra,12(sp)
    1c78:	00812403          	lw	s0,8(sp)
    1c7c:	00412483          	lw	s1,4(sp)
    1c80:	00100513          	li	a0,1
    1c84:	01010113          	addi	sp,sp,16
    1c88:	00008067          	ret
    1c8c:	00000513          	li	a0,0
    1c90:	00008067          	ret

00001c94 <sdcard_writesector>:
    1c94:	00000513          	li	a0,0
    1c98:	00008067          	ret

00001c9c <__divsi3>:
    1c9c:	06054063          	bltz	a0,1cfc <__umodsi3+0x10>
    1ca0:	0605c663          	bltz	a1,1d0c <__umodsi3+0x20>

00001ca4 <__udivsi3>:
    1ca4:	00058613          	mv	a2,a1
    1ca8:	00050593          	mv	a1,a0
    1cac:	fff00513          	li	a0,-1
    1cb0:	02060c63          	beqz	a2,1ce8 <__udivsi3+0x44>
    1cb4:	00100693          	li	a3,1
    1cb8:	00b67a63          	bgeu	a2,a1,1ccc <__udivsi3+0x28>
    1cbc:	00c05863          	blez	a2,1ccc <__udivsi3+0x28>
    1cc0:	00161613          	slli	a2,a2,0x1
    1cc4:	00169693          	slli	a3,a3,0x1
    1cc8:	feb66ae3          	bltu	a2,a1,1cbc <__udivsi3+0x18>
    1ccc:	00000513          	li	a0,0
    1cd0:	00c5e663          	bltu	a1,a2,1cdc <__udivsi3+0x38>
    1cd4:	40c585b3          	sub	a1,a1,a2
    1cd8:	00d56533          	or	a0,a0,a3
    1cdc:	0016d693          	srli	a3,a3,0x1
    1ce0:	00165613          	srli	a2,a2,0x1
    1ce4:	fe0696e3          	bnez	a3,1cd0 <__udivsi3+0x2c>
    1ce8:	00008067          	ret

00001cec <__umodsi3>:
    1cec:	00008293          	mv	t0,ra
    1cf0:	fb5ff0ef          	jal	1ca4 <__udivsi3>
    1cf4:	00058513          	mv	a0,a1
    1cf8:	00028067          	jr	t0
    1cfc:	40a00533          	neg	a0,a0
    1d00:	0005d863          	bgez	a1,1d10 <__umodsi3+0x24>
    1d04:	40b005b3          	neg	a1,a1
    1d08:	f95ff06f          	j	1c9c <__divsi3>
    1d0c:	40b005b3          	neg	a1,a1
    1d10:	00008293          	mv	t0,ra
    1d14:	f89ff0ef          	jal	1c9c <__divsi3>
    1d18:	40a00533          	neg	a0,a0
    1d1c:	00028067          	jr	t0

00001d20 <__modsi3>:
    1d20:	00008293          	mv	t0,ra
    1d24:	0005ca63          	bltz	a1,1d38 <__modsi3+0x18>
    1d28:	00054c63          	bltz	a0,1d40 <__modsi3+0x20>
    1d2c:	f79ff0ef          	jal	1ca4 <__udivsi3>
    1d30:	00058513          	mv	a0,a1
    1d34:	00028067          	jr	t0
    1d38:	40b005b3          	neg	a1,a1
    1d3c:	fe0558e3          	bgez	a0,1d2c <__modsi3+0xc>
    1d40:	40a00533          	neg	a0,a0
    1d44:	f61ff0ef          	jal	1ca4 <__udivsi3>
    1d48:	40b00533          	neg	a0,a1
    1d4c:	00028067          	jr	t0

00001d50 <memset>:
    1d50:	00c50633          	add	a2,a0,a2
    1d54:	00050793          	mv	a5,a0
    1d58:	00c79463          	bne	a5,a2,1d60 <memset+0x10>
    1d5c:	00008067          	ret
    1d60:	00178793          	addi	a5,a5,1
    1d64:	feb78fa3          	sb	a1,-1(a5)
    1d68:	ff1ff06f          	j	1d58 <memset+0x8>

00001d6c <memcpy>:
    1d6c:	00000793          	li	a5,0
    1d70:	00c79463          	bne	a5,a2,1d78 <memcpy+0xc>
    1d74:	00008067          	ret
    1d78:	00f58733          	add	a4,a1,a5
    1d7c:	00074683          	lbu	a3,0(a4)
    1d80:	00f50733          	add	a4,a0,a5
    1d84:	00178793          	addi	a5,a5,1
    1d88:	00d70023          	sb	a3,0(a4)
    1d8c:	fe5ff06f          	j	1d70 <memcpy+0x4>

00001d90 <strlen>:
    1d90:	00000793          	li	a5,0
    1d94:	00f50733          	add	a4,a0,a5
    1d98:	00074703          	lbu	a4,0(a4)
    1d9c:	00071663          	bnez	a4,1da8 <strlen+0x18>
    1da0:	00078513          	mv	a0,a5
    1da4:	00008067          	ret
    1da8:	00178793          	addi	a5,a5,1
    1dac:	fe9ff06f          	j	1d94 <strlen+0x4>

00001db0 <strncmp>:
    1db0:	00000793          	li	a5,0
    1db4:	00c79663          	bne	a5,a2,1dc0 <strncmp+0x10>
    1db8:	00000513          	li	a0,0
    1dbc:	00008067          	ret
    1dc0:	00f50733          	add	a4,a0,a5
    1dc4:	00074683          	lbu	a3,0(a4)
    1dc8:	00f58733          	add	a4,a1,a5
    1dcc:	00074703          	lbu	a4,0(a4)
    1dd0:	00e6e863          	bltu	a3,a4,1de0 <strncmp+0x30>
    1dd4:	00d76a63          	bltu	a4,a3,1de8 <strncmp+0x38>
    1dd8:	00178793          	addi	a5,a5,1
    1ddc:	fd9ff06f          	j	1db4 <strncmp+0x4>
    1de0:	fff00513          	li	a0,-1
    1de4:	00008067          	ret
    1de8:	00100513          	li	a0,1
    1dec:	00008067          	ret

00001df0 <strncpy>:
    1df0:	00000793          	li	a5,0
    1df4:	00c79463          	bne	a5,a2,1dfc <strncpy+0xc>
    1df8:	00008067          	ret
    1dfc:	00f58733          	add	a4,a1,a5
    1e00:	00074683          	lbu	a3,0(a4)
    1e04:	00f50733          	add	a4,a0,a5
    1e08:	00178793          	addi	a5,a5,1
    1e0c:	00d70023          	sb	a3,0(a4)
    1e10:	fe5ff06f          	j	1df4 <strncpy+0x4>

00001e14 <strcpy>:
    1e14:	0005c783          	lbu	a5,0(a1)
    1e18:	00079663          	bnez	a5,1e24 <strcpy+0x10>
    1e1c:	00050023          	sb	zero,0(a0)
    1e20:	00008067          	ret
    1e24:	00150513          	addi	a0,a0,1
    1e28:	00158593          	addi	a1,a1,1
    1e2c:	fef50fa3          	sb	a5,-1(a0)
    1e30:	fe5ff06f          	j	1e14 <strcpy>

00001e34 <strcat>:
    1e34:	00050793          	mv	a5,a0
    1e38:	0007c683          	lbu	a3,0(a5)
    1e3c:	00078713          	mv	a4,a5
    1e40:	00178793          	addi	a5,a5,1
    1e44:	fe069ae3          	bnez	a3,1e38 <strcat+0x4>
    1e48:	0005c783          	lbu	a5,0(a1)
    1e4c:	00158593          	addi	a1,a1,1
    1e50:	00170713          	addi	a4,a4,1
    1e54:	fef70fa3          	sb	a5,-1(a4)
    1e58:	fe0798e3          	bnez	a5,1e48 <strcat+0x14>
    1e5c:	00008067          	ret

00001e60 <oled_wait>:
    1e60:	00000013          	nop
    1e64:	00000013          	nop
    1e68:	00000013          	nop
    1e6c:	00000013          	nop
    1e70:	00000013          	nop
    1e74:	00000013          	nop
    1e78:	00000013          	nop
    1e7c:	00008067          	ret

00001e80 <oled_init_mode>:
    1e80:	000067b7          	lui	a5,0x6
    1e84:	94c7a703          	lw	a4,-1716(a5) # 594c <OLED_RST>
    1e88:	fe010113          	addi	sp,sp,-32
    1e8c:	00112e23          	sw	ra,28(sp)
    1e90:	00812c23          	sw	s0,24(sp)
    1e94:	00072023          	sw	zero,0(a4)
    1e98:	00040737          	lui	a4,0x40
    1e9c:	00000013          	nop
    1ea0:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
    1ea4:	fe071ce3          	bnez	a4,1e9c <oled_init_mode+0x1c>
    1ea8:	94c7a703          	lw	a4,-1716(a5)
    1eac:	00100693          	li	a3,1
    1eb0:	00d72023          	sw	a3,0(a4)
    1eb4:	00040737          	lui	a4,0x40
    1eb8:	00000013          	nop
    1ebc:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
    1ec0:	fe071ce3          	bnez	a4,1eb8 <oled_init_mode+0x38>
    1ec4:	94c7a783          	lw	a5,-1716(a5)
    1ec8:	0007a023          	sw	zero,0(a5)
    1ecc:	000407b7          	lui	a5,0x40
    1ed0:	00000013          	nop
    1ed4:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
    1ed8:	fe079ce3          	bnez	a5,1ed0 <oled_init_mode+0x50>
    1edc:	00006737          	lui	a4,0x6
    1ee0:	95072783          	lw	a5,-1712(a4) # 5950 <OLED>
    1ee4:	2af00693          	li	a3,687
    1ee8:	00d7a023          	sw	a3,0(a5)
    1eec:	000407b7          	lui	a5,0x40
    1ef0:	00000013          	nop
    1ef4:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
    1ef8:	fe079ce3          	bnez	a5,1ef0 <oled_init_mode+0x70>
    1efc:	95072403          	lw	s0,-1712(a4)
    1f00:	2a000793          	li	a5,672
    1f04:	00a12623          	sw	a0,12(sp)
    1f08:	00f42023          	sw	a5,0(s0)
    1f0c:	00000097          	auipc	ra,0x0
    1f10:	f54080e7          	jalr	-172(ra) # 1e60 <oled_wait>
    1f14:	00c12503          	lw	a0,12(sp)
    1f18:	4a000793          	li	a5,1184
    1f1c:	00050463          	beqz	a0,1f24 <oled_init_mode+0xa4>
    1f20:	42000793          	li	a5,1056
    1f24:	00f42023          	sw	a5,0(s0)
    1f28:	00000097          	auipc	ra,0x0
    1f2c:	f38080e7          	jalr	-200(ra) # 1e60 <oled_wait>
    1f30:	2fd00793          	li	a5,765
    1f34:	00f42023          	sw	a5,0(s0)
    1f38:	00000097          	auipc	ra,0x0
    1f3c:	f28080e7          	jalr	-216(ra) # 1e60 <oled_wait>
    1f40:	4b100793          	li	a5,1201
    1f44:	00f42023          	sw	a5,0(s0)
    1f48:	00000097          	auipc	ra,0x0
    1f4c:	f18080e7          	jalr	-232(ra) # 1e60 <oled_wait>
    1f50:	2a200793          	li	a5,674
    1f54:	00f42023          	sw	a5,0(s0)
    1f58:	00000097          	auipc	ra,0x0
    1f5c:	f08080e7          	jalr	-248(ra) # 1e60 <oled_wait>
    1f60:	40000793          	li	a5,1024
    1f64:	00f42023          	sw	a5,0(s0)
    1f68:	01812403          	lw	s0,24(sp)
    1f6c:	01c12083          	lw	ra,28(sp)
    1f70:	02010113          	addi	sp,sp,32
    1f74:	00000317          	auipc	t1,0x0
    1f78:	eec30067          	jr	-276(t1) # 1e60 <oled_wait>

00001f7c <oled_init>:
    1f7c:	00000513          	li	a0,0
    1f80:	00000317          	auipc	t1,0x0
    1f84:	f0030067          	jr	-256(t1) # 1e80 <oled_init_mode>

00001f88 <oled_fullscreen>:
    1f88:	ff010113          	addi	sp,sp,-16
    1f8c:	000067b7          	lui	a5,0x6
    1f90:	00812423          	sw	s0,8(sp)
    1f94:	9507a403          	lw	s0,-1712(a5) # 5950 <OLED>
    1f98:	00112623          	sw	ra,12(sp)
    1f9c:	00912223          	sw	s1,4(sp)
    1fa0:	01212023          	sw	s2,0(sp)
    1fa4:	21500793          	li	a5,533
    1fa8:	00f42023          	sw	a5,0(s0)
    1fac:	40000913          	li	s2,1024
    1fb0:	00000097          	auipc	ra,0x0
    1fb4:	eb0080e7          	jalr	-336(ra) # 1e60 <oled_wait>
    1fb8:	47f00493          	li	s1,1151
    1fbc:	01242023          	sw	s2,0(s0)
    1fc0:	00000097          	auipc	ra,0x0
    1fc4:	ea0080e7          	jalr	-352(ra) # 1e60 <oled_wait>
    1fc8:	00942023          	sw	s1,0(s0)
    1fcc:	00000097          	auipc	ra,0x0
    1fd0:	e94080e7          	jalr	-364(ra) # 1e60 <oled_wait>
    1fd4:	27500793          	li	a5,629
    1fd8:	00f42023          	sw	a5,0(s0)
    1fdc:	00000097          	auipc	ra,0x0
    1fe0:	e84080e7          	jalr	-380(ra) # 1e60 <oled_wait>
    1fe4:	01242023          	sw	s2,0(s0)
    1fe8:	00000097          	auipc	ra,0x0
    1fec:	e78080e7          	jalr	-392(ra) # 1e60 <oled_wait>
    1ff0:	00942023          	sw	s1,0(s0)
    1ff4:	00000097          	auipc	ra,0x0
    1ff8:	e6c080e7          	jalr	-404(ra) # 1e60 <oled_wait>
    1ffc:	25c00793          	li	a5,604
    2000:	00f42023          	sw	a5,0(s0)
    2004:	00812403          	lw	s0,8(sp)
    2008:	00c12083          	lw	ra,12(sp)
    200c:	00412483          	lw	s1,4(sp)
    2010:	00012903          	lw	s2,0(sp)
    2014:	01010113          	addi	sp,sp,16
    2018:	00000317          	auipc	t1,0x0
    201c:	e4830067          	jr	-440(t1) # 1e60 <oled_wait>

00002020 <oled_clear>:
    2020:	fe010113          	addi	sp,sp,-32
    2024:	000067b7          	lui	a5,0x6
    2028:	01312623          	sw	s3,12(sp)
    202c:	9507a983          	lw	s3,-1712(a5) # 5950 <OLED>
    2030:	00812c23          	sw	s0,24(sp)
    2034:	01212823          	sw	s2,16(sp)
    2038:	00112e23          	sw	ra,28(sp)
    203c:	00912a23          	sw	s1,20(sp)
    2040:	08000913          	li	s2,128
    2044:	40056413          	ori	s0,a0,1024
    2048:	08000493          	li	s1,128
    204c:	0089a023          	sw	s0,0(s3)
    2050:	00000097          	auipc	ra,0x0
    2054:	e10080e7          	jalr	-496(ra) # 1e60 <oled_wait>
    2058:	0089a023          	sw	s0,0(s3)
    205c:	00000097          	auipc	ra,0x0
    2060:	e04080e7          	jalr	-508(ra) # 1e60 <oled_wait>
    2064:	fff48493          	addi	s1,s1,-1
    2068:	0089a023          	sw	s0,0(s3)
    206c:	00000097          	auipc	ra,0x0
    2070:	df4080e7          	jalr	-524(ra) # 1e60 <oled_wait>
    2074:	fc049ce3          	bnez	s1,204c <oled_clear+0x2c>
    2078:	fff90913          	addi	s2,s2,-1
    207c:	fc0916e3          	bnez	s2,2048 <oled_clear+0x28>
    2080:	01c12083          	lw	ra,28(sp)
    2084:	01812403          	lw	s0,24(sp)
    2088:	01412483          	lw	s1,20(sp)
    208c:	01012903          	lw	s2,16(sp)
    2090:	00c12983          	lw	s3,12(sp)
    2094:	02010113          	addi	sp,sp,32
    2098:	00008067          	ret

0000209c <display_framebuffer>:
    209c:	000067b7          	lui	a5,0x6
    20a0:	9407a503          	lw	a0,-1728(a5) # 5940 <DISPLAY>
    20a4:	00008067          	ret

000020a8 <display_set_cursor>:
    20a8:	000067b7          	lui	a5,0x6
    20ac:	eea7ac23          	sw	a0,-264(a5) # 5ef8 <cursor_x>
    20b0:	000067b7          	lui	a5,0x6
    20b4:	eeb7aa23          	sw	a1,-268(a5) # 5ef4 <cursor_y>
    20b8:	00008067          	ret

000020bc <display_set_front_back_color>:
    20bc:	000067b7          	lui	a5,0x6
    20c0:	eea788a3          	sb	a0,-271(a5) # 5ef1 <front_color>
    20c4:	000067b7          	lui	a5,0x6
    20c8:	eeb78823          	sb	a1,-272(a5) # 5ef0 <back_color>
    20cc:	00008067          	ret

000020d0 <display_putchar>:
    20d0:	00a00793          	li	a5,10
    20d4:	00006737          	lui	a4,0x6
    20d8:	02f51663          	bne	a0,a5,2104 <display_putchar+0x34>
    20dc:	ee072c23          	sw	zero,-264(a4) # 5ef8 <cursor_x>
    20e0:	00006737          	lui	a4,0x6
    20e4:	ef472783          	lw	a5,-268(a4) # 5ef4 <cursor_y>
    20e8:	00878793          	addi	a5,a5,8
    20ec:	eef72a23          	sw	a5,-268(a4)
    20f0:	07f00713          	li	a4,127
    20f4:	00f75663          	bge	a4,a5,2100 <display_putchar+0x30>
    20f8:	000067b7          	lui	a5,0x6
    20fc:	ee07aa23          	sw	zero,-268(a5) # 5ef4 <cursor_y>
    2100:	00008067          	ret
    2104:	ff010113          	addi	sp,sp,-16
    2108:	00812623          	sw	s0,12(sp)
    210c:	01f00793          	li	a5,31
    2110:	0ca7d263          	bge	a5,a0,21d4 <display_putchar+0x104>
    2114:	00006e37          	lui	t3,0x6
    2118:	ef4e2783          	lw	a5,-268(t3) # 5ef4 <cursor_y>
    211c:	07800693          	li	a3,120
    2120:	00800593          	li	a1,8
    2124:	00f6d663          	bge	a3,a5,2130 <display_putchar+0x60>
    2128:	08000593          	li	a1,128
    212c:	40f585b3          	sub	a1,a1,a5
    2130:	ef872783          	lw	a5,-264(a4)
    2134:	07b00693          	li	a3,123
    2138:	00500813          	li	a6,5
    213c:	00f6d663          	bge	a3,a5,2148 <display_putchar+0x78>
    2140:	08000813          	li	a6,128
    2144:	40f80833          	sub	a6,a6,a5
    2148:	000067b7          	lui	a5,0x6
    214c:	9407a283          	lw	t0,-1728(a5) # 5940 <DISPLAY>
    2150:	000066b7          	lui	a3,0x6
    2154:	00251793          	slli	a5,a0,0x2
    2158:	ae068693          	addi	a3,a3,-1312 # 5ae0 <font>
    215c:	00a787b3          	add	a5,a5,a0
    2160:	00d78533          	add	a0,a5,a3
    2164:	00100f93          	li	t6,1
    2168:	00000693          	li	a3,0
    216c:	000063b7          	lui	t2,0x6
    2170:	00006437          	lui	s0,0x6
    2174:	06b6d063          	bge	a3,a1,21d4 <display_putchar+0x104>
    2178:	00df9f33          	sll	t5,t6,a3
    217c:	00050893          	mv	a7,a0
    2180:	00000613          	li	a2,0
    2184:	03c0006f          	j	21c0 <display_putchar+0xf0>
    2188:	f608c783          	lbu	a5,-160(a7)
    218c:	01e7f7b3          	and	a5,a5,t5
    2190:	02078e63          	beqz	a5,21cc <display_putchar+0xfc>
    2194:	ef144e83          	lbu	t4,-271(s0) # 5ef1 <front_color>
    2198:	ef872783          	lw	a5,-264(a4)
    219c:	ef4e2303          	lw	t1,-268(t3)
    21a0:	00188893          	addi	a7,a7,1
    21a4:	00f607b3          	add	a5,a2,a5
    21a8:	00779793          	slli	a5,a5,0x7
    21ac:	00668333          	add	t1,a3,t1
    21b0:	006787b3          	add	a5,a5,t1
    21b4:	00f287b3          	add	a5,t0,a5
    21b8:	01d78023          	sb	t4,0(a5)
    21bc:	00160613          	addi	a2,a2,1 # 4001 <_open_file+0x6d>
    21c0:	fd0644e3          	blt	a2,a6,2188 <display_putchar+0xb8>
    21c4:	00168693          	addi	a3,a3,1
    21c8:	fadff06f          	j	2174 <display_putchar+0xa4>
    21cc:	ef03ce83          	lbu	t4,-272(t2) # 5ef0 <back_color>
    21d0:	fc9ff06f          	j	2198 <display_putchar+0xc8>
    21d4:	ef872783          	lw	a5,-264(a4)
    21d8:	07f00693          	li	a3,127
    21dc:	00578793          	addi	a5,a5,5
    21e0:	00f6c663          	blt	a3,a5,21ec <display_putchar+0x11c>
    21e4:	eef72c23          	sw	a5,-264(a4)
    21e8:	0240006f          	j	220c <display_putchar+0x13c>
    21ec:	ee072c23          	sw	zero,-264(a4)
    21f0:	00006737          	lui	a4,0x6
    21f4:	ef472783          	lw	a5,-268(a4) # 5ef4 <cursor_y>
    21f8:	00878793          	addi	a5,a5,8
    21fc:	eef72a23          	sw	a5,-268(a4)
    2200:	00f6d663          	bge	a3,a5,220c <display_putchar+0x13c>
    2204:	000067b7          	lui	a5,0x6
    2208:	ee07aa23          	sw	zero,-268(a5) # 5ef4 <cursor_y>
    220c:	00c12403          	lw	s0,12(sp)
    2210:	01010113          	addi	sp,sp,16
    2214:	00008067          	ret

00002218 <display_refresh>:
    2218:	00008067          	ret

0000221c <print_string>:
    221c:	ff010113          	addi	sp,sp,-16
    2220:	00812423          	sw	s0,8(sp)
    2224:	00912223          	sw	s1,4(sp)
    2228:	00112623          	sw	ra,12(sp)
    222c:	00050413          	mv	s0,a0
    2230:	000064b7          	lui	s1,0x6
    2234:	00044503          	lbu	a0,0(s0)
    2238:	00051c63          	bnez	a0,2250 <print_string+0x34>
    223c:	00c12083          	lw	ra,12(sp)
    2240:	00812403          	lw	s0,8(sp)
    2244:	00412483          	lw	s1,4(sp)
    2248:	01010113          	addi	sp,sp,16
    224c:	00008067          	ret
    2250:	efc4a783          	lw	a5,-260(s1) # 5efc <f_putchar>
    2254:	00140413          	addi	s0,s0,1
    2258:	000780e7          	jalr	a5
    225c:	fd9ff06f          	j	2234 <print_string+0x18>

00002260 <print_dec>:
    2260:	ef010113          	addi	sp,sp,-272
    2264:	10812423          	sw	s0,264(sp)
    2268:	10912223          	sw	s1,260(sp)
    226c:	10112623          	sw	ra,268(sp)
    2270:	11212023          	sw	s2,256(sp)
    2274:	00050413          	mv	s0,a0
    2278:	000064b7          	lui	s1,0x6
    227c:	08045063          	bgez	s0,22fc <print_dec+0x9c>
    2280:	efc4a783          	lw	a5,-260(s1) # 5efc <f_putchar>
    2284:	02d00513          	li	a0,45
    2288:	40800433          	neg	s0,s0
    228c:	000780e7          	jalr	a5
    2290:	fedff06f          	j	227c <print_dec+0x1c>
    2294:	00040513          	mv	a0,s0
    2298:	00a00593          	li	a1,10
    229c:	00000097          	auipc	ra,0x0
    22a0:	a00080e7          	jalr	-1536(ra) # 1c9c <__divsi3>
    22a4:	00251793          	slli	a5,a0,0x2
    22a8:	00f507b3          	add	a5,a0,a5
    22ac:	00179793          	slli	a5,a5,0x1
    22b0:	40f40433          	sub	s0,s0,a5
    22b4:	00148493          	addi	s1,s1,1
    22b8:	fe848fa3          	sb	s0,-1(s1)
    22bc:	00050413          	mv	s0,a0
    22c0:	fc041ae3          	bnez	s0,2294 <print_dec+0x34>
    22c4:	fd2488e3          	beq	s1,s2,2294 <print_dec+0x34>
    22c8:	00006437          	lui	s0,0x6
    22cc:	fff4c503          	lbu	a0,-1(s1)
    22d0:	efc42783          	lw	a5,-260(s0) # 5efc <f_putchar>
    22d4:	fff48493          	addi	s1,s1,-1
    22d8:	03050513          	addi	a0,a0,48
    22dc:	000780e7          	jalr	a5
    22e0:	ff2496e3          	bne	s1,s2,22cc <print_dec+0x6c>
    22e4:	10c12083          	lw	ra,268(sp)
    22e8:	10812403          	lw	s0,264(sp)
    22ec:	10412483          	lw	s1,260(sp)
    22f0:	10012903          	lw	s2,256(sp)
    22f4:	11010113          	addi	sp,sp,272
    22f8:	00008067          	ret
    22fc:	00010493          	mv	s1,sp
    2300:	00010913          	mv	s2,sp
    2304:	fbdff06f          	j	22c0 <print_dec+0x60>

00002308 <print_hex_digits>:
    2308:	fe010113          	addi	sp,sp,-32
    230c:	00812c23          	sw	s0,24(sp)
    2310:	00912a23          	sw	s1,20(sp)
    2314:	fff58413          	addi	s0,a1,-1
    2318:	000064b7          	lui	s1,0x6
    231c:	01212823          	sw	s2,16(sp)
    2320:	01312623          	sw	s3,12(sp)
    2324:	00112e23          	sw	ra,28(sp)
    2328:	00050993          	mv	s3,a0
    232c:	00241413          	slli	s0,s0,0x2
    2330:	a9848493          	addi	s1,s1,-1384 # 5a98 <LEDS+0x144>
    2334:	00006937          	lui	s2,0x6
    2338:	02045063          	bgez	s0,2358 <print_hex_digits+0x50>
    233c:	01c12083          	lw	ra,28(sp)
    2340:	01812403          	lw	s0,24(sp)
    2344:	01412483          	lw	s1,20(sp)
    2348:	01012903          	lw	s2,16(sp)
    234c:	00c12983          	lw	s3,12(sp)
    2350:	02010113          	addi	sp,sp,32
    2354:	00008067          	ret
    2358:	0089d7b3          	srl	a5,s3,s0
    235c:	00f7f793          	andi	a5,a5,15
    2360:	00f487b3          	add	a5,s1,a5
    2364:	efc92703          	lw	a4,-260(s2) # 5efc <f_putchar>
    2368:	0007c503          	lbu	a0,0(a5)
    236c:	ffc40413          	addi	s0,s0,-4
    2370:	000700e7          	jalr	a4
    2374:	fc5ff06f          	j	2338 <print_hex_digits+0x30>

00002378 <print_hex>:
    2378:	00800593          	li	a1,8
    237c:	00000317          	auipc	t1,0x0
    2380:	f8c30067          	jr	-116(t1) # 2308 <print_hex_digits>

00002384 <printf>:
    2384:	fa010113          	addi	sp,sp,-96
    2388:	04f12a23          	sw	a5,84(sp)
    238c:	04410793          	addi	a5,sp,68
    2390:	02812c23          	sw	s0,56(sp)
    2394:	02912a23          	sw	s1,52(sp)
    2398:	03212823          	sw	s2,48(sp)
    239c:	03312623          	sw	s3,44(sp)
    23a0:	03412423          	sw	s4,40(sp)
    23a4:	03512223          	sw	s5,36(sp)
    23a8:	03612023          	sw	s6,32(sp)
    23ac:	02112e23          	sw	ra,60(sp)
    23b0:	01712e23          	sw	s7,28(sp)
    23b4:	00050413          	mv	s0,a0
    23b8:	04b12223          	sw	a1,68(sp)
    23bc:	04c12423          	sw	a2,72(sp)
    23c0:	04d12623          	sw	a3,76(sp)
    23c4:	04e12823          	sw	a4,80(sp)
    23c8:	05012c23          	sw	a6,88(sp)
    23cc:	05112e23          	sw	a7,92(sp)
    23d0:	00f12623          	sw	a5,12(sp)
    23d4:	02500913          	li	s2,37
    23d8:	000064b7          	lui	s1,0x6
    23dc:	07300993          	li	s3,115
    23e0:	07800a13          	li	s4,120
    23e4:	06400a93          	li	s5,100
    23e8:	06300b13          	li	s6,99
    23ec:	00044503          	lbu	a0,0(s0)
    23f0:	02051863          	bnez	a0,2420 <printf+0x9c>
    23f4:	03c12083          	lw	ra,60(sp)
    23f8:	03812403          	lw	s0,56(sp)
    23fc:	03412483          	lw	s1,52(sp)
    2400:	03012903          	lw	s2,48(sp)
    2404:	02c12983          	lw	s3,44(sp)
    2408:	02812a03          	lw	s4,40(sp)
    240c:	02412a83          	lw	s5,36(sp)
    2410:	02012b03          	lw	s6,32(sp)
    2414:	01c12b83          	lw	s7,28(sp)
    2418:	06010113          	addi	sp,sp,96
    241c:	00008067          	ret
    2420:	09251a63          	bne	a0,s2,24b4 <printf+0x130>
    2424:	00144503          	lbu	a0,1(s0)
    2428:	00140b93          	addi	s7,s0,1
    242c:	03351463          	bne	a0,s3,2454 <printf+0xd0>
    2430:	00c12783          	lw	a5,12(sp)
    2434:	0007a503          	lw	a0,0(a5)
    2438:	00478713          	addi	a4,a5,4
    243c:	00e12623          	sw	a4,12(sp)
    2440:	00000097          	auipc	ra,0x0
    2444:	ddc080e7          	jalr	-548(ra) # 221c <print_string>
    2448:	000b8413          	mv	s0,s7
    244c:	00140413          	addi	s0,s0,1
    2450:	f9dff06f          	j	23ec <printf+0x68>
    2454:	03451063          	bne	a0,s4,2474 <printf+0xf0>
    2458:	00c12783          	lw	a5,12(sp)
    245c:	0007a503          	lw	a0,0(a5)
    2460:	00478713          	addi	a4,a5,4
    2464:	00e12623          	sw	a4,12(sp)
    2468:	00000097          	auipc	ra,0x0
    246c:	f10080e7          	jalr	-240(ra) # 2378 <print_hex>
    2470:	fd9ff06f          	j	2448 <printf+0xc4>
    2474:	03551063          	bne	a0,s5,2494 <printf+0x110>
    2478:	00c12783          	lw	a5,12(sp)
    247c:	0007a503          	lw	a0,0(a5)
    2480:	00478713          	addi	a4,a5,4
    2484:	00e12623          	sw	a4,12(sp)
    2488:	00000097          	auipc	ra,0x0
    248c:	dd8080e7          	jalr	-552(ra) # 2260 <print_dec>
    2490:	fb9ff06f          	j	2448 <printf+0xc4>
    2494:	efc4a783          	lw	a5,-260(s1) # 5efc <f_putchar>
    2498:	01651a63          	bne	a0,s6,24ac <printf+0x128>
    249c:	00c12703          	lw	a4,12(sp)
    24a0:	00072503          	lw	a0,0(a4)
    24a4:	00470693          	addi	a3,a4,4
    24a8:	00d12623          	sw	a3,12(sp)
    24ac:	000780e7          	jalr	a5
    24b0:	f99ff06f          	j	2448 <printf+0xc4>
    24b4:	efc4a783          	lw	a5,-260(s1)
    24b8:	000780e7          	jalr	a5
    24bc:	f91ff06f          	j	244c <printf+0xc8>

000024c0 <__mulsi3>:
    24c0:	00050793          	mv	a5,a0
    24c4:	00000513          	li	a0,0
    24c8:	00079463          	bnez	a5,24d0 <__mulsi3+0x10>
    24cc:	00008067          	ret
    24d0:	01f79693          	slli	a3,a5,0x1f
    24d4:	41f6d713          	srai	a4,a3,0x1f
    24d8:	00b77733          	and	a4,a4,a1
    24dc:	00e50533          	add	a0,a0,a4
    24e0:	0017d793          	srli	a5,a5,0x1
    24e4:	00159593          	slli	a1,a1,0x1
    24e8:	fe1ff06f          	j	24c8 <__mulsi3+0x8>

000024ec <fat_list_insert_last>:
    24ec:	00452783          	lw	a5,4(a0)
    24f0:	04079263          	bnez	a5,2534 <fat_list_insert_last+0x48>
    24f4:	00052783          	lw	a5,0(a0)
    24f8:	00079c63          	bnez	a5,2510 <fat_list_insert_last+0x24>
    24fc:	00b52023          	sw	a1,0(a0)
    2500:	00b52223          	sw	a1,4(a0)
    2504:	0005a023          	sw	zero,0(a1)
    2508:	0005a223          	sw	zero,4(a1)
    250c:	00008067          	ret
    2510:	0007a703          	lw	a4,0(a5)
    2514:	00f5a223          	sw	a5,4(a1)
    2518:	00e5a023          	sw	a4,0(a1)
    251c:	00071863          	bnez	a4,252c <fat_list_insert_last+0x40>
    2520:	00b52023          	sw	a1,0(a0)
    2524:	00b7a023          	sw	a1,0(a5)
    2528:	00008067          	ret
    252c:	00b72223          	sw	a1,4(a4)
    2530:	ff5ff06f          	j	2524 <fat_list_insert_last+0x38>
    2534:	0047a703          	lw	a4,4(a5)
    2538:	00f5a023          	sw	a5,0(a1)
    253c:	00e5a223          	sw	a4,4(a1)
    2540:	00071863          	bnez	a4,2550 <fat_list_insert_last+0x64>
    2544:	00b52223          	sw	a1,4(a0)
    2548:	00b7a223          	sw	a1,4(a5)
    254c:	00008067          	ret
    2550:	00b72023          	sw	a1,0(a4)
    2554:	ff5ff06f          	j	2548 <fat_list_insert_last+0x5c>

00002558 <FileString_StrCmpNoCase>:
    2558:	00050e93          	mv	t4,a0
    255c:	00000793          	li	a5,0
    2560:	01900e13          	li	t3,25
    2564:	00c79663          	bne	a5,a2,2570 <FileString_StrCmpNoCase+0x18>
    2568:	00000513          	li	a0,0
    256c:	00008067          	ret
    2570:	00fe8733          	add	a4,t4,a5
    2574:	00074803          	lbu	a6,0(a4)
    2578:	00f58733          	add	a4,a1,a5
    257c:	00074883          	lbu	a7,0(a4)
    2580:	fbf80713          	addi	a4,a6,-65
    2584:	0ff77713          	zext.b	a4,a4
    2588:	00080693          	mv	a3,a6
    258c:	00ee6663          	bltu	t3,a4,2598 <FileString_StrCmpNoCase+0x40>
    2590:	02080693          	addi	a3,a6,32
    2594:	0ff6f693          	zext.b	a3,a3
    2598:	fbf88313          	addi	t1,a7,-65
    259c:	0ff37313          	zext.b	t1,t1
    25a0:	00088713          	mv	a4,a7
    25a4:	006e6663          	bltu	t3,t1,25b0 <FileString_StrCmpNoCase+0x58>
    25a8:	02088713          	addi	a4,a7,32
    25ac:	0ff77713          	zext.b	a4,a4
    25b0:	40e68533          	sub	a0,a3,a4
    25b4:	00e69863          	bne	a3,a4,25c4 <FileString_StrCmpNoCase+0x6c>
    25b8:	00178793          	addi	a5,a5,1
    25bc:	00088463          	beqz	a7,25c4 <FileString_StrCmpNoCase+0x6c>
    25c0:	fa0812e3          	bnez	a6,2564 <FileString_StrCmpNoCase+0xc>
    25c4:	00008067          	ret

000025c8 <FileString_GetExtension>:
    25c8:	00050793          	mv	a5,a0
    25cc:	fff00713          	li	a4,-1
    25d0:	02e00613          	li	a2,46
    25d4:	0007c683          	lbu	a3,0(a5)
    25d8:	00069663          	bnez	a3,25e4 <FileString_GetExtension+0x1c>
    25dc:	00070513          	mv	a0,a4
    25e0:	00008067          	ret
    25e4:	00c69463          	bne	a3,a2,25ec <FileString_GetExtension+0x24>
    25e8:	40a78733          	sub	a4,a5,a0
    25ec:	00178793          	addi	a5,a5,1
    25f0:	fe5ff06f          	j	25d4 <FileString_GetExtension+0xc>

000025f4 <fatfs_fat_writeback>:
    25f4:	00059e63          	bnez	a1,2610 <fatfs_fat_writeback+0x1c>
    25f8:	00000513          	li	a0,0
    25fc:	00008067          	ret
    2600:	00000513          	li	a0,0
    2604:	01c12083          	lw	ra,28(sp)
    2608:	02010113          	addi	sp,sp,32
    260c:	00008067          	ret
    2610:	2045a783          	lw	a5,516(a1)
    2614:	04078e63          	beqz	a5,2670 <fatfs_fat_writeback+0x7c>
    2618:	03852683          	lw	a3,56(a0)
    261c:	00050793          	mv	a5,a0
    2620:	04068663          	beqz	a3,266c <fatfs_fat_writeback+0x78>
    2624:	0147a703          	lw	a4,20(a5)
    2628:	2005a503          	lw	a0,512(a1)
    262c:	0207a803          	lw	a6,32(a5)
    2630:	00100613          	li	a2,1
    2634:	fe010113          	addi	sp,sp,-32
    2638:	40e607b3          	sub	a5,a2,a4
    263c:	00112e23          	sw	ra,28(sp)
    2640:	00a787b3          	add	a5,a5,a0
    2644:	00f87663          	bgeu	a6,a5,2650 <fatfs_fat_writeback+0x5c>
    2648:	01070733          	add	a4,a4,a6
    264c:	40a70633          	sub	a2,a4,a0
    2650:	00b12623          	sw	a1,12(sp)
    2654:	000680e7          	jalr	a3
    2658:	fa0504e3          	beqz	a0,2600 <fatfs_fat_writeback+0xc>
    265c:	00c12583          	lw	a1,12(sp)
    2660:	00100513          	li	a0,1
    2664:	2005a223          	sw	zero,516(a1)
    2668:	f9dff06f          	j	2604 <fatfs_fat_writeback+0x10>
    266c:	2005a223          	sw	zero,516(a1)
    2670:	00100513          	li	a0,1
    2674:	00008067          	ret

00002678 <fatfs_fat_read_sector>:
    2678:	fe010113          	addi	sp,sp,-32
    267c:	01212823          	sw	s2,16(sp)
    2680:	25452903          	lw	s2,596(a0)
    2684:	00812c23          	sw	s0,24(sp)
    2688:	00112e23          	sw	ra,28(sp)
    268c:	00912a23          	sw	s1,20(sp)
    2690:	01312623          	sw	s3,12(sp)
    2694:	00000413          	li	s0,0
    2698:	04091463          	bnez	s2,26e0 <fatfs_fat_read_sector+0x68>
    269c:	25452783          	lw	a5,596(a0)
    26a0:	00058493          	mv	s1,a1
    26a4:	00050993          	mv	s3,a0
    26a8:	20f42623          	sw	a5,524(s0)
    26ac:	20442783          	lw	a5,516(s0)
    26b0:	24852a23          	sw	s0,596(a0)
    26b4:	08079863          	bnez	a5,2744 <fatfs_fat_read_sector+0xcc>
    26b8:	0349a783          	lw	a5,52(s3)
    26bc:	20942023          	sw	s1,512(s0)
    26c0:	00100613          	li	a2,1
    26c4:	00040593          	mv	a1,s0
    26c8:	00048513          	mv	a0,s1
    26cc:	000780e7          	jalr	a5
    26d0:	08051463          	bnez	a0,2758 <fatfs_fat_read_sector+0xe0>
    26d4:	fff00793          	li	a5,-1
    26d8:	20f42023          	sw	a5,512(s0)
    26dc:	0480006f          	j	2724 <fatfs_fat_read_sector+0xac>
    26e0:	20092783          	lw	a5,512(s2)
    26e4:	00f5e663          	bltu	a1,a5,26f0 <fatfs_fat_read_sector+0x78>
    26e8:	00178713          	addi	a4,a5,1
    26ec:	02e5e463          	bltu	a1,a4,2714 <fatfs_fat_read_sector+0x9c>
    26f0:	20c92783          	lw	a5,524(s2)
    26f4:	00079663          	bnez	a5,2700 <fatfs_fat_read_sector+0x88>
    26f8:	00040a63          	beqz	s0,270c <fatfs_fat_read_sector+0x94>
    26fc:	20042623          	sw	zero,524(s0)
    2700:	00090413          	mv	s0,s2
    2704:	20c92903          	lw	s2,524(s2)
    2708:	f91ff06f          	j	2698 <fatfs_fat_read_sector+0x20>
    270c:	24052a23          	sw	zero,596(a0)
    2710:	ff1ff06f          	j	2700 <fatfs_fat_read_sector+0x88>
    2714:	40f585b3          	sub	a1,a1,a5
    2718:	00959593          	slli	a1,a1,0x9
    271c:	00b905b3          	add	a1,s2,a1
    2720:	20b92423          	sw	a1,520(s2)
    2724:	01c12083          	lw	ra,28(sp)
    2728:	01812403          	lw	s0,24(sp)
    272c:	01412483          	lw	s1,20(sp)
    2730:	00c12983          	lw	s3,12(sp)
    2734:	00090513          	mv	a0,s2
    2738:	01012903          	lw	s2,16(sp)
    273c:	02010113          	addi	sp,sp,32
    2740:	00008067          	ret
    2744:	00040593          	mv	a1,s0
    2748:	00000097          	auipc	ra,0x0
    274c:	eac080e7          	jalr	-340(ra) # 25f4 <fatfs_fat_writeback>
    2750:	f60514e3          	bnez	a0,26b8 <fatfs_fat_read_sector+0x40>
    2754:	fd1ff06f          	j	2724 <fatfs_fat_read_sector+0xac>
    2758:	20842423          	sw	s0,520(s0)
    275c:	00040913          	mv	s2,s0
    2760:	fc5ff06f          	j	2724 <fatfs_fat_read_sector+0xac>

00002764 <_allocate_file>:
    2764:	000067b7          	lui	a5,0x6
    2768:	f0078793          	addi	a5,a5,-256 # 5f00 <_free_file_list>
    276c:	0007a583          	lw	a1,0(a5)
    2770:	06058263          	beqz	a1,27d4 <_allocate_file+0x70>
    2774:	0005a703          	lw	a4,0(a1)
    2778:	fe010113          	addi	sp,sp,-32
    277c:	00112e23          	sw	ra,28(sp)
    2780:	0045a683          	lw	a3,4(a1)
    2784:	04071063          	bnez	a4,27c4 <_allocate_file+0x60>
    2788:	00d7a023          	sw	a3,0(a5)
    278c:	0045a683          	lw	a3,4(a1)
    2790:	02069e63          	bnez	a3,27cc <_allocate_file+0x68>
    2794:	00e7a223          	sw	a4,4(a5)
    2798:	00006537          	lui	a0,0x6
    279c:	f0850513          	addi	a0,a0,-248 # 5f08 <_open_file_list>
    27a0:	00b12623          	sw	a1,12(sp)
    27a4:	00000097          	auipc	ra,0x0
    27a8:	d48080e7          	jalr	-696(ra) # 24ec <fat_list_insert_last>
    27ac:	00c12583          	lw	a1,12(sp)
    27b0:	01c12083          	lw	ra,28(sp)
    27b4:	bc458593          	addi	a1,a1,-1084
    27b8:	00058513          	mv	a0,a1
    27bc:	02010113          	addi	sp,sp,32
    27c0:	00008067          	ret
    27c4:	00d72223          	sw	a3,4(a4)
    27c8:	fc5ff06f          	j	278c <_allocate_file+0x28>
    27cc:	00e6a023          	sw	a4,0(a3)
    27d0:	fc9ff06f          	j	2798 <_allocate_file+0x34>
    27d4:	00058513          	mv	a0,a1
    27d8:	00008067          	ret

000027dc <_free_file>:
    27dc:	43c52783          	lw	a5,1084(a0)
    27e0:	44052703          	lw	a4,1088(a0)
    27e4:	43c50593          	addi	a1,a0,1084
    27e8:	02079663          	bnez	a5,2814 <_free_file+0x38>
    27ec:	000066b7          	lui	a3,0x6
    27f0:	f0e6a423          	sw	a4,-248(a3) # 5f08 <_open_file_list>
    27f4:	44052703          	lw	a4,1088(a0)
    27f8:	02071263          	bnez	a4,281c <_free_file+0x40>
    27fc:	00006737          	lui	a4,0x6
    2800:	f0f72623          	sw	a5,-244(a4) # 5f0c <_open_file_list+0x4>
    2804:	00006537          	lui	a0,0x6
    2808:	f0050513          	addi	a0,a0,-256 # 5f00 <_free_file_list>
    280c:	00000317          	auipc	t1,0x0
    2810:	ce030067          	jr	-800(t1) # 24ec <fat_list_insert_last>
    2814:	00e7a223          	sw	a4,4(a5)
    2818:	fddff06f          	j	27f4 <_free_file+0x18>
    281c:	00f72023          	sw	a5,0(a4)
    2820:	fe5ff06f          	j	2804 <_free_file+0x28>

00002824 <fatfs_lba_of_cluster>:
    2824:	ff010113          	addi	sp,sp,-16
    2828:	00812423          	sw	s0,8(sp)
    282c:	00112623          	sw	ra,12(sp)
    2830:	00050413          	mv	s0,a0
    2834:	ffe58513          	addi	a0,a1,-2
    2838:	00044583          	lbu	a1,0(s0)
    283c:	00000097          	auipc	ra,0x0
    2840:	c84080e7          	jalr	-892(ra) # 24c0 <__mulsi3>
    2844:	00442783          	lw	a5,4(s0)
    2848:	00f50533          	add	a0,a0,a5
    284c:	03042783          	lw	a5,48(s0)
    2850:	00079863          	bnez	a5,2860 <fatfs_lba_of_cluster+0x3c>
    2854:	02845783          	lhu	a5,40(s0)
    2858:	4047d793          	srai	a5,a5,0x4
    285c:	00f50533          	add	a0,a0,a5
    2860:	00c12083          	lw	ra,12(sp)
    2864:	00812403          	lw	s0,8(sp)
    2868:	01010113          	addi	sp,sp,16
    286c:	00008067          	ret

00002870 <fatfs_sector_read>:
    2870:	03452783          	lw	a5,52(a0)
    2874:	00058713          	mv	a4,a1
    2878:	00070513          	mv	a0,a4
    287c:	00060593          	mv	a1,a2
    2880:	00068613          	mv	a2,a3
    2884:	00078067          	jr	a5

00002888 <fatfs_sector_write>:
    2888:	03852783          	lw	a5,56(a0)
    288c:	00058713          	mv	a4,a1
    2890:	00070513          	mv	a0,a4
    2894:	00060593          	mv	a1,a2
    2898:	00068613          	mv	a2,a3
    289c:	00078067          	jr	a5

000028a0 <fatfs_write_sector>:
    28a0:	03852703          	lw	a4,56(a0)
    28a4:	0a070463          	beqz	a4,294c <fatfs_write_sector+0xac>
    28a8:	03052883          	lw	a7,48(a0)
    28ac:	00050793          	mv	a5,a0
    28b0:	0115e833          	or	a6,a1,a7
    28b4:	02081e63          	bnez	a6,28f0 <fatfs_write_sector+0x50>
    28b8:	01052583          	lw	a1,16(a0)
    28bc:	08b67863          	bgeu	a2,a1,294c <fatfs_write_sector+0xac>
    28c0:	01c52503          	lw	a0,28(a0)
    28c4:	00c7a583          	lw	a1,12(a5)
    28c8:	00b50533          	add	a0,a0,a1
    28cc:	00c50533          	add	a0,a0,a2
    28d0:	00068863          	beqz	a3,28e0 <fatfs_write_sector+0x40>
    28d4:	00100613          	li	a2,1
    28d8:	00068593          	mv	a1,a3
    28dc:	00070067          	jr	a4
    28e0:	24a7a223          	sw	a0,580(a5)
    28e4:	00100613          	li	a2,1
    28e8:	04478593          	addi	a1,a5,68
    28ec:	ff1ff06f          	j	28dc <fatfs_write_sector+0x3c>
    28f0:	fe010113          	addi	sp,sp,-32
    28f4:	00e12623          	sw	a4,12(sp)
    28f8:	00d12423          	sw	a3,8(sp)
    28fc:	00c12223          	sw	a2,4(sp)
    2900:	00112e23          	sw	ra,28(sp)
    2904:	00a12023          	sw	a0,0(sp)
    2908:	00000097          	auipc	ra,0x0
    290c:	f1c080e7          	jalr	-228(ra) # 2824 <fatfs_lba_of_cluster>
    2910:	00412603          	lw	a2,4(sp)
    2914:	00812683          	lw	a3,8(sp)
    2918:	00012783          	lw	a5,0(sp)
    291c:	00c12703          	lw	a4,12(sp)
    2920:	00a60533          	add	a0,a2,a0
    2924:	00068c63          	beqz	a3,293c <fatfs_write_sector+0x9c>
    2928:	00100613          	li	a2,1
    292c:	00068593          	mv	a1,a3
    2930:	01c12083          	lw	ra,28(sp)
    2934:	02010113          	addi	sp,sp,32
    2938:	fa5ff06f          	j	28dc <fatfs_write_sector+0x3c>
    293c:	24a7a223          	sw	a0,580(a5)
    2940:	00100613          	li	a2,1
    2944:	04478593          	addi	a1,a5,68
    2948:	fe9ff06f          	j	2930 <fatfs_write_sector+0x90>
    294c:	00000513          	li	a0,0
    2950:	00008067          	ret

00002954 <fl_init>:
    2954:	ff010113          	addi	sp,sp,-16
    2958:	00006537          	lui	a0,0x6
    295c:	000067b7          	lui	a5,0x6
    2960:	000085b7          	lui	a1,0x8
    2964:	00112623          	sw	ra,12(sp)
    2968:	f0050513          	addi	a0,a0,-256 # 5f00 <_free_file_list>
    296c:	f0878793          	addi	a5,a5,-248 # 5f08 <_open_file_list>
    2970:	3d858593          	addi	a1,a1,984 # 83d8 <_files+0x43c>
    2974:	00052223          	sw	zero,4(a0)
    2978:	00052023          	sw	zero,0(a0)
    297c:	0007a223          	sw	zero,4(a5)
    2980:	0007a023          	sw	zero,0(a5)
    2984:	00000097          	auipc	ra,0x0
    2988:	b68080e7          	jalr	-1176(ra) # 24ec <fat_list_insert_last>
    298c:	000067b7          	lui	a5,0x6
    2990:	000095b7          	lui	a1,0x9
    2994:	f0078513          	addi	a0,a5,-256 # 5f00 <_free_file_list>
    2998:	81c58593          	addi	a1,a1,-2020 # 881c <_files+0x880>
    299c:	00000097          	auipc	ra,0x0
    29a0:	b50080e7          	jalr	-1200(ra) # 24ec <fat_list_insert_last>
    29a4:	00c12083          	lw	ra,12(sp)
    29a8:	000067b7          	lui	a5,0x6
    29ac:	00100713          	li	a4,1
    29b0:	f0e7aa23          	sw	a4,-236(a5) # 5f14 <_filelib_init>
    29b4:	01010113          	addi	sp,sp,16
    29b8:	00008067          	ret

000029bc <fl_fseek>:
    29bc:	000067b7          	lui	a5,0x6
    29c0:	f147a783          	lw	a5,-236(a5) # 5f14 <_filelib_init>
    29c4:	fd010113          	addi	sp,sp,-48
    29c8:	02812423          	sw	s0,40(sp)
    29cc:	02912223          	sw	s1,36(sp)
    29d0:	01312e23          	sw	s3,28(sp)
    29d4:	02112623          	sw	ra,44(sp)
    29d8:	03212023          	sw	s2,32(sp)
    29dc:	00050413          	mv	s0,a0
    29e0:	00058493          	mv	s1,a1
    29e4:	00060993          	mv	s3,a2
    29e8:	00079663          	bnez	a5,29f4 <fl_fseek+0x38>
    29ec:	00000097          	auipc	ra,0x0
    29f0:	f68080e7          	jalr	-152(ra) # 2954 <fl_init>
    29f4:	fff00513          	li	a0,-1
    29f8:	08040263          	beqz	s0,2a7c <fl_fseek+0xc0>
    29fc:	00048663          	beqz	s1,2a08 <fl_fseek+0x4c>
    2a00:	ffe98793          	addi	a5,s3,-2
    2a04:	06078c63          	beqz	a5,2a7c <fl_fseek+0xc0>
    2a08:	00008937          	lui	s2,0x8
    2a0c:	b3490913          	addi	s2,s2,-1228 # 7b34 <_fs>
    2a10:	03c92783          	lw	a5,60(s2)
    2a14:	00078463          	beqz	a5,2a1c <fl_fseek+0x60>
    2a18:	000780e7          	jalr	a5
    2a1c:	fff00513          	li	a0,-1
    2a20:	42a42823          	sw	a0,1072(s0)
    2a24:	42042a23          	sw	zero,1076(s0)
    2a28:	00099c63          	bnez	s3,2a40 <fl_fseek+0x84>
    2a2c:	00c42783          	lw	a5,12(s0)
    2a30:	00942423          	sw	s1,8(s0)
    2a34:	0297f863          	bgeu	a5,s1,2a64 <fl_fseek+0xa8>
    2a38:	00f42423          	sw	a5,8(s0)
    2a3c:	0280006f          	j	2a64 <fl_fseek+0xa8>
    2a40:	00100793          	li	a5,1
    2a44:	06f99063          	bne	s3,a5,2aa4 <fl_fseek+0xe8>
    2a48:	00842783          	lw	a5,8(s0)
    2a4c:	0004c663          	bltz	s1,2a58 <fl_fseek+0x9c>
    2a50:	00f484b3          	add	s1,s1,a5
    2a54:	fd9ff06f          	j	2a2c <fl_fseek+0x70>
    2a58:	40900733          	neg	a4,s1
    2a5c:	02e7fe63          	bgeu	a5,a4,2a98 <fl_fseek+0xdc>
    2a60:	00042423          	sw	zero,8(s0)
    2a64:	00000513          	li	a0,0
    2a68:	04092783          	lw	a5,64(s2)
    2a6c:	00078863          	beqz	a5,2a7c <fl_fseek+0xc0>
    2a70:	00a12623          	sw	a0,12(sp)
    2a74:	000780e7          	jalr	a5
    2a78:	00c12503          	lw	a0,12(sp)
    2a7c:	02c12083          	lw	ra,44(sp)
    2a80:	02812403          	lw	s0,40(sp)
    2a84:	02412483          	lw	s1,36(sp)
    2a88:	02012903          	lw	s2,32(sp)
    2a8c:	01c12983          	lw	s3,28(sp)
    2a90:	03010113          	addi	sp,sp,48
    2a94:	00008067          	ret
    2a98:	00f484b3          	add	s1,s1,a5
    2a9c:	00942423          	sw	s1,8(s0)
    2aa0:	fc5ff06f          	j	2a64 <fl_fseek+0xa8>
    2aa4:	00200793          	li	a5,2
    2aa8:	fcf990e3          	bne	s3,a5,2a68 <fl_fseek+0xac>
    2aac:	00c42783          	lw	a5,12(s0)
    2ab0:	f89ff06f          	j	2a38 <fl_fseek+0x7c>

00002ab4 <fl_closedir>:
    2ab4:	00000513          	li	a0,0
    2ab8:	00008067          	ret

00002abc <fatfs_lfn_cache_entry>:
    2abc:	0005c783          	lbu	a5,0(a1)
    2ac0:	01300693          	li	a3,19
    2ac4:	01f7f793          	andi	a5,a5,31
    2ac8:	fff78713          	addi	a4,a5,-1
    2acc:	0ff77613          	zext.b	a2,a4
    2ad0:	0ac6ea63          	bltu	a3,a2,2b84 <fatfs_lfn_cache_entry+0xc8>
    2ad4:	10554683          	lbu	a3,261(a0)
    2ad8:	00069463          	bnez	a3,2ae0 <fatfs_lfn_cache_entry+0x24>
    2adc:	10f502a3          	sb	a5,261(a0)
    2ae0:	00171793          	slli	a5,a4,0x1
    2ae4:	00e787b3          	add	a5,a5,a4
    2ae8:	0015c683          	lbu	a3,1(a1)
    2aec:	00279793          	slli	a5,a5,0x2
    2af0:	00e787b3          	add	a5,a5,a4
    2af4:	00f50533          	add	a0,a0,a5
    2af8:	00d50023          	sb	a3,0(a0)
    2afc:	0035c783          	lbu	a5,3(a1)
    2b00:	0ff00713          	li	a4,255
    2b04:	02000693          	li	a3,32
    2b08:	00f500a3          	sb	a5,1(a0)
    2b0c:	0055c783          	lbu	a5,5(a1)
    2b10:	00f50123          	sb	a5,2(a0)
    2b14:	0075c783          	lbu	a5,7(a1)
    2b18:	00f501a3          	sb	a5,3(a0)
    2b1c:	0095c783          	lbu	a5,9(a1)
    2b20:	00f50223          	sb	a5,4(a0)
    2b24:	00e5c783          	lbu	a5,14(a1)
    2b28:	00f502a3          	sb	a5,5(a0)
    2b2c:	0105c783          	lbu	a5,16(a1)
    2b30:	00f50323          	sb	a5,6(a0)
    2b34:	0125c783          	lbu	a5,18(a1)
    2b38:	00f503a3          	sb	a5,7(a0)
    2b3c:	0145c783          	lbu	a5,20(a1)
    2b40:	00f50423          	sb	a5,8(a0)
    2b44:	0165c783          	lbu	a5,22(a1)
    2b48:	00f504a3          	sb	a5,9(a0)
    2b4c:	0185c783          	lbu	a5,24(a1)
    2b50:	00f50523          	sb	a5,10(a0)
    2b54:	01c5c783          	lbu	a5,28(a1)
    2b58:	00f505a3          	sb	a5,11(a0)
    2b5c:	01e5c783          	lbu	a5,30(a1)
    2b60:	00f50623          	sb	a5,12(a0)
    2b64:	00d00793          	li	a5,13
    2b68:	00054603          	lbu	a2,0(a0)
    2b6c:	00e61463          	bne	a2,a4,2b74 <fatfs_lfn_cache_entry+0xb8>
    2b70:	00d50023          	sb	a3,0(a0)
    2b74:	fff78793          	addi	a5,a5,-1
    2b78:	0ff7f793          	zext.b	a5,a5
    2b7c:	00150513          	addi	a0,a0,1
    2b80:	fe0794e3          	bnez	a5,2b68 <fatfs_lfn_cache_entry+0xac>
    2b84:	00008067          	ret

00002b88 <fatfs_lfn_cache_get>:
    2b88:	10554703          	lbu	a4,261(a0)
    2b8c:	01400793          	li	a5,20
    2b90:	00f71663          	bne	a4,a5,2b9c <fatfs_lfn_cache_get+0x14>
    2b94:	10050223          	sb	zero,260(a0)
    2b98:	00008067          	ret
    2b9c:	02070063          	beqz	a4,2bbc <fatfs_lfn_cache_get+0x34>
    2ba0:	00171793          	slli	a5,a4,0x1
    2ba4:	00e787b3          	add	a5,a5,a4
    2ba8:	00279793          	slli	a5,a5,0x2
    2bac:	00e787b3          	add	a5,a5,a4
    2bb0:	00f507b3          	add	a5,a0,a5
    2bb4:	00078023          	sb	zero,0(a5)
    2bb8:	00008067          	ret
    2bbc:	00050023          	sb	zero,0(a0)
    2bc0:	00008067          	ret

00002bc4 <fatfs_entry_lfn_text>:
    2bc4:	00b54503          	lbu	a0,11(a0)
    2bc8:	00f57513          	andi	a0,a0,15
    2bcc:	ff150513          	addi	a0,a0,-15
    2bd0:	00153513          	seqz	a0,a0
    2bd4:	00008067          	ret

00002bd8 <fatfs_entry_lfn_invalid>:
    2bd8:	00054783          	lbu	a5,0(a0)
    2bdc:	f1b78713          	addi	a4,a5,-229
    2be0:	02070263          	beqz	a4,2c04 <fatfs_entry_lfn_invalid+0x2c>
    2be4:	02078063          	beqz	a5,2c04 <fatfs_entry_lfn_invalid+0x2c>
    2be8:	00b54783          	lbu	a5,11(a0)
    2bec:	00800713          	li	a4,8
    2bf0:	00100513          	li	a0,1
    2bf4:	00e78a63          	beq	a5,a4,2c08 <fatfs_entry_lfn_invalid+0x30>
    2bf8:	0067f793          	andi	a5,a5,6
    2bfc:	00f03533          	snez	a0,a5
    2c00:	00008067          	ret
    2c04:	00100513          	li	a0,1
    2c08:	00008067          	ret

00002c0c <fatfs_entry_lfn_exists>:
    2c0c:	00b5c783          	lbu	a5,11(a1)
    2c10:	00f00713          	li	a4,15
    2c14:	04e78063          	beq	a5,a4,2c54 <fatfs_entry_lfn_exists+0x48>
    2c18:	0005c683          	lbu	a3,0(a1)
    2c1c:	f1b68713          	addi	a4,a3,-229
    2c20:	00e03733          	snez	a4,a4
    2c24:	00d036b3          	snez	a3,a3
    2c28:	00d77733          	and	a4,a4,a3
    2c2c:	02070463          	beqz	a4,2c54 <fatfs_entry_lfn_exists+0x48>
    2c30:	ff878713          	addi	a4,a5,-8
    2c34:	02070063          	beqz	a4,2c54 <fatfs_entry_lfn_exists+0x48>
    2c38:	0067f713          	andi	a4,a5,6
    2c3c:	00000793          	li	a5,0
    2c40:	00071663          	bnez	a4,2c4c <fatfs_entry_lfn_exists+0x40>
    2c44:	10554783          	lbu	a5,261(a0)
    2c48:	00f037b3          	snez	a5,a5
    2c4c:	00078513          	mv	a0,a5
    2c50:	00008067          	ret
    2c54:	00000793          	li	a5,0
    2c58:	ff5ff06f          	j	2c4c <fatfs_entry_lfn_exists+0x40>

00002c5c <fatfs_entry_sfn_only>:
    2c5c:	00b54783          	lbu	a5,11(a0)
    2c60:	00f00713          	li	a4,15
    2c64:	02e78863          	beq	a5,a4,2c94 <fatfs_entry_sfn_only+0x38>
    2c68:	00054683          	lbu	a3,0(a0)
    2c6c:	f1b68713          	addi	a4,a3,-229
    2c70:	00e03733          	snez	a4,a4
    2c74:	00d036b3          	snez	a3,a3
    2c78:	00d77733          	and	a4,a4,a3
    2c7c:	00070c63          	beqz	a4,2c94 <fatfs_entry_sfn_only+0x38>
    2c80:	ff878713          	addi	a4,a5,-8
    2c84:	00070863          	beqz	a4,2c94 <fatfs_entry_sfn_only+0x38>
    2c88:	0067f513          	andi	a0,a5,6
    2c8c:	00153513          	seqz	a0,a0
    2c90:	00008067          	ret
    2c94:	00000513          	li	a0,0
    2c98:	00008067          	ret

00002c9c <fatfs_entry_is_dir>:
    2c9c:	00b54503          	lbu	a0,11(a0)
    2ca0:	00455513          	srli	a0,a0,0x4
    2ca4:	00157513          	andi	a0,a0,1
    2ca8:	00008067          	ret

00002cac <fatfs_lfn_entries_required>:
    2cac:	ff010113          	addi	sp,sp,-16
    2cb0:	00112623          	sw	ra,12(sp)
    2cb4:	fffff097          	auipc	ra,0xfffff
    2cb8:	0dc080e7          	jalr	220(ra) # 1d90 <strlen>
    2cbc:	00050a63          	beqz	a0,2cd0 <fatfs_lfn_entries_required+0x24>
    2cc0:	00d00593          	li	a1,13
    2cc4:	00c50513          	addi	a0,a0,12
    2cc8:	fffff097          	auipc	ra,0xfffff
    2ccc:	fd4080e7          	jalr	-44(ra) # 1c9c <__divsi3>
    2cd0:	00c12083          	lw	ra,12(sp)
    2cd4:	01010113          	addi	sp,sp,16
    2cd8:	00008067          	ret

00002cdc <fatfs_filename_to_lfn>:
    2cdc:	f9010113          	addi	sp,sp,-112
    2ce0:	06812423          	sw	s0,104(sp)
    2ce4:	00058413          	mv	s0,a1
    2ce8:	000065b7          	lui	a1,0x6
    2cec:	cc058593          	addi	a1,a1,-832 # 5cc0 <font+0x1e0>
    2cf0:	06912223          	sw	s1,100(sp)
    2cf4:	05312e23          	sw	s3,92(sp)
    2cf8:	00060493          	mv	s1,a2
    2cfc:	00050993          	mv	s3,a0
    2d00:	03400613          	li	a2,52
    2d04:	01c10513          	addi	a0,sp,28
    2d08:	00d12623          	sw	a3,12(sp)
    2d0c:	06112623          	sw	ra,108(sp)
    2d10:	07212023          	sw	s2,96(sp)
    2d14:	05412c23          	sw	s4,88(sp)
    2d18:	fffff097          	auipc	ra,0xfffff
    2d1c:	054080e7          	jalr	84(ra) # 1d6c <memcpy>
    2d20:	00098513          	mv	a0,s3
    2d24:	fffff097          	auipc	ra,0xfffff
    2d28:	06c080e7          	jalr	108(ra) # 1d90 <strlen>
    2d2c:	00050913          	mv	s2,a0
    2d30:	00098513          	mv	a0,s3
    2d34:	00000097          	auipc	ra,0x0
    2d38:	f78080e7          	jalr	-136(ra) # 2cac <fatfs_lfn_entries_required>
    2d3c:	00050a13          	mv	s4,a0
    2d40:	02000613          	li	a2,32
    2d44:	00000593          	li	a1,0
    2d48:	00040513          	mv	a0,s0
    2d4c:	fffff097          	auipc	ra,0xfffff
    2d50:	004080e7          	jalr	4(ra) # 1d50 <memset>
    2d54:	fffa0713          	addi	a4,s4,-1
    2d58:	00c12683          	lw	a3,12(sp)
    2d5c:	00148793          	addi	a5,s1,1
    2d60:	00971463          	bne	a4,s1,2d68 <fatfs_filename_to_lfn+0x8c>
    2d64:	0407e793          	ori	a5,a5,64
    2d68:	00149613          	slli	a2,s1,0x1
    2d6c:	00960633          	add	a2,a2,s1
    2d70:	00f40023          	sb	a5,0(s0)
    2d74:	00261613          	slli	a2,a2,0x2
    2d78:	00f00793          	li	a5,15
    2d7c:	00f405a3          	sb	a5,11(s0)
    2d80:	00d406a3          	sb	a3,13(s0)
    2d84:	01c10793          	addi	a5,sp,28
    2d88:	00960633          	add	a2,a2,s1
    2d8c:	fff00693          	li	a3,-1
    2d90:	0007a703          	lw	a4,0(a5)
    2d94:	00e40733          	add	a4,s0,a4
    2d98:	05265063          	bge	a2,s2,2dd8 <fatfs_filename_to_lfn+0xfc>
    2d9c:	00c985b3          	add	a1,s3,a2
    2da0:	0005c583          	lbu	a1,0(a1)
    2da4:	00b70023          	sb	a1,0(a4)
    2da8:	00478793          	addi	a5,a5,4
    2dac:	05010713          	addi	a4,sp,80
    2db0:	00160613          	addi	a2,a2,1
    2db4:	fce79ee3          	bne	a5,a4,2d90 <fatfs_filename_to_lfn+0xb4>
    2db8:	06c12083          	lw	ra,108(sp)
    2dbc:	06812403          	lw	s0,104(sp)
    2dc0:	06412483          	lw	s1,100(sp)
    2dc4:	06012903          	lw	s2,96(sp)
    2dc8:	05c12983          	lw	s3,92(sp)
    2dcc:	05812a03          	lw	s4,88(sp)
    2dd0:	07010113          	addi	sp,sp,112
    2dd4:	00008067          	ret
    2dd8:	01261663          	bne	a2,s2,2de4 <fatfs_filename_to_lfn+0x108>
    2ddc:	00070023          	sb	zero,0(a4)
    2de0:	fc9ff06f          	j	2da8 <fatfs_filename_to_lfn+0xcc>
    2de4:	00d70023          	sb	a3,0(a4)
    2de8:	00d700a3          	sb	a3,1(a4)
    2dec:	fbdff06f          	j	2da8 <fatfs_filename_to_lfn+0xcc>

00002df0 <fatfs_sfn_create_entry>:
    2df0:	00000793          	li	a5,0
    2df4:	00b00813          	li	a6,11
    2df8:	00f508b3          	add	a7,a0,a5
    2dfc:	0008c303          	lbu	t1,0(a7)
    2e00:	00f688b3          	add	a7,a3,a5
    2e04:	00178793          	addi	a5,a5,1
    2e08:	00688023          	sb	t1,0(a7)
    2e0c:	ff0796e3          	bne	a5,a6,2df8 <fatfs_sfn_create_entry+0x8>
    2e10:	00e03733          	snez	a4,a4
    2e14:	40e00733          	neg	a4,a4
    2e18:	02000793          	li	a5,32
    2e1c:	ff077713          	andi	a4,a4,-16
    2e20:	00f70733          	add	a4,a4,a5
    2e24:	00f68823          	sb	a5,16(a3)
    2e28:	00f68923          	sb	a5,18(a3)
    2e2c:	00f68c23          	sb	a5,24(a3)
    2e30:	01065793          	srli	a5,a2,0x10
    2e34:	00f68a23          	sb	a5,20(a3)
    2e38:	01865793          	srli	a5,a2,0x18
    2e3c:	00f68aa3          	sb	a5,21(a3)
    2e40:	0085d793          	srli	a5,a1,0x8
    2e44:	00c68d23          	sb	a2,26(a3)
    2e48:	00b68e23          	sb	a1,28(a3)
    2e4c:	00865613          	srli	a2,a2,0x8
    2e50:	00f68ea3          	sb	a5,29(a3)
    2e54:	0105d793          	srli	a5,a1,0x10
    2e58:	0185d593          	srli	a1,a1,0x18
    2e5c:	000686a3          	sb	zero,13(a3)
    2e60:	00068723          	sb	zero,14(a3)
    2e64:	000687a3          	sb	zero,15(a3)
    2e68:	000688a3          	sb	zero,17(a3)
    2e6c:	000689a3          	sb	zero,19(a3)
    2e70:	00068b23          	sb	zero,22(a3)
    2e74:	00068ba3          	sb	zero,23(a3)
    2e78:	00068ca3          	sb	zero,25(a3)
    2e7c:	00e685a3          	sb	a4,11(a3)
    2e80:	00068623          	sb	zero,12(a3)
    2e84:	00c68da3          	sb	a2,27(a3)
    2e88:	00f68f23          	sb	a5,30(a3)
    2e8c:	00b68fa3          	sb	a1,31(a3)
    2e90:	00008067          	ret

00002e94 <fatfs_lfn_create_sfn>:
    2e94:	fd010113          	addi	sp,sp,-48
    2e98:	02912223          	sw	s1,36(sp)
    2e9c:	00050493          	mv	s1,a0
    2ea0:	00058513          	mv	a0,a1
    2ea4:	02812423          	sw	s0,40(sp)
    2ea8:	01312e23          	sw	s3,28(sp)
    2eac:	00058413          	mv	s0,a1
    2eb0:	02112623          	sw	ra,44(sp)
    2eb4:	03212023          	sw	s2,32(sp)
    2eb8:	fffff097          	auipc	ra,0xfffff
    2ebc:	ed8080e7          	jalr	-296(ra) # 1d90 <strlen>
    2ec0:	00044783          	lbu	a5,0(s0)
    2ec4:	02e00993          	li	s3,46
    2ec8:	15378063          	beq	a5,s3,3008 <fatfs_lfn_create_sfn+0x174>
    2ecc:	00b00613          	li	a2,11
    2ed0:	02000593          	li	a1,32
    2ed4:	00050913          	mv	s2,a0
    2ed8:	00048513          	mv	a0,s1
    2edc:	fffff097          	auipc	ra,0xfffff
    2ee0:	e74080e7          	jalr	-396(ra) # 1d50 <memset>
    2ee4:	00300613          	li	a2,3
    2ee8:	02000593          	li	a1,32
    2eec:	00c10513          	addi	a0,sp,12
    2ef0:	fffff097          	auipc	ra,0xfffff
    2ef4:	e60080e7          	jalr	-416(ra) # 1d50 <memset>
    2ef8:	fff00793          	li	a5,-1
    2efc:	00000713          	li	a4,0
    2f00:	0d274263          	blt	a4,s2,2fc4 <fatfs_lfn_create_sfn+0x130>
    2f04:	fff00713          	li	a4,-1
    2f08:	0ee78863          	beq	a5,a4,2ff8 <fatfs_lfn_create_sfn+0x164>
    2f0c:	00178713          	addi	a4,a5,1
    2f10:	00c10693          	addi	a3,sp,12
    2f14:	00478613          	addi	a2,a5,4
    2f18:	0ce61263          	bne	a2,a4,2fdc <fatfs_lfn_create_sfn+0x148>
    2f1c:	00000613          	li	a2,0
    2f20:	00000693          	li	a3,0
    2f24:	01900813          	li	a6,25
    2f28:	00800893          	li	a7,8
    2f2c:	02f6de63          	bge	a3,a5,2f68 <fatfs_lfn_create_sfn+0xd4>
    2f30:	00d40733          	add	a4,s0,a3
    2f34:	00074703          	lbu	a4,0(a4)
    2f38:	fe070513          	addi	a0,a4,-32
    2f3c:	0c050263          	beqz	a0,3000 <fatfs_lfn_create_sfn+0x16c>
    2f40:	fd270593          	addi	a1,a4,-46
    2f44:	0a058e63          	beqz	a1,3000 <fatfs_lfn_create_sfn+0x16c>
    2f48:	f9f70593          	addi	a1,a4,-97
    2f4c:	0ff5f593          	zext.b	a1,a1
    2f50:	00c48333          	add	t1,s1,a2
    2f54:	00160613          	addi	a2,a2,1
    2f58:	00b86463          	bltu	a6,a1,2f60 <fatfs_lfn_create_sfn+0xcc>
    2f5c:	0ff57713          	zext.b	a4,a0
    2f60:	00e30023          	sb	a4,0(t1)
    2f64:	09161e63          	bne	a2,a7,3000 <fatfs_lfn_create_sfn+0x16c>
    2f68:	00c10793          	addi	a5,sp,12
    2f6c:	00800693          	li	a3,8
    2f70:	01900513          	li	a0,25
    2f74:	00b00593          	li	a1,11
    2f78:	0007c703          	lbu	a4,0(a5)
    2f7c:	f9f70613          	addi	a2,a4,-97
    2f80:	0ff67613          	zext.b	a2,a2
    2f84:	00c56663          	bltu	a0,a2,2f90 <fatfs_lfn_create_sfn+0xfc>
    2f88:	fe070713          	addi	a4,a4,-32
    2f8c:	0ff77713          	zext.b	a4,a4
    2f90:	00d48633          	add	a2,s1,a3
    2f94:	00e60023          	sb	a4,0(a2)
    2f98:	00168693          	addi	a3,a3,1
    2f9c:	00178793          	addi	a5,a5,1
    2fa0:	fcb69ce3          	bne	a3,a1,2f78 <fatfs_lfn_create_sfn+0xe4>
    2fa4:	00100513          	li	a0,1
    2fa8:	02c12083          	lw	ra,44(sp)
    2fac:	02812403          	lw	s0,40(sp)
    2fb0:	02412483          	lw	s1,36(sp)
    2fb4:	02012903          	lw	s2,32(sp)
    2fb8:	01c12983          	lw	s3,28(sp)
    2fbc:	03010113          	addi	sp,sp,48
    2fc0:	00008067          	ret
    2fc4:	00e406b3          	add	a3,s0,a4
    2fc8:	0006c683          	lbu	a3,0(a3)
    2fcc:	01369463          	bne	a3,s3,2fd4 <fatfs_lfn_create_sfn+0x140>
    2fd0:	00070793          	mv	a5,a4
    2fd4:	00170713          	addi	a4,a4,1
    2fd8:	f29ff06f          	j	2f00 <fatfs_lfn_create_sfn+0x6c>
    2fdc:	01275863          	bge	a4,s2,2fec <fatfs_lfn_create_sfn+0x158>
    2fe0:	00e405b3          	add	a1,s0,a4
    2fe4:	0005c583          	lbu	a1,0(a1)
    2fe8:	00b68023          	sb	a1,0(a3)
    2fec:	00170713          	addi	a4,a4,1
    2ff0:	00168693          	addi	a3,a3,1
    2ff4:	f25ff06f          	j	2f18 <fatfs_lfn_create_sfn+0x84>
    2ff8:	00090793          	mv	a5,s2
    2ffc:	f21ff06f          	j	2f1c <fatfs_lfn_create_sfn+0x88>
    3000:	00168693          	addi	a3,a3,1
    3004:	f29ff06f          	j	2f2c <fatfs_lfn_create_sfn+0x98>
    3008:	00000513          	li	a0,0
    300c:	f9dff06f          	j	2fa8 <fatfs_lfn_create_sfn+0x114>

00003010 <fatfs_lfn_generate_tail>:
    3010:	000187b7          	lui	a5,0x18
    3014:	69f78793          	addi	a5,a5,1695 # 1869f <__stacktop+0x869f>
    3018:	16c7e463          	bltu	a5,a2,3180 <fatfs_lfn_generate_tail+0x170>
    301c:	fa010113          	addi	sp,sp,-96
    3020:	04812c23          	sw	s0,88(sp)
    3024:	04912a23          	sw	s1,84(sp)
    3028:	03712e23          	sw	s7,60(sp)
    302c:	00060413          	mv	s0,a2
    3030:	00058b93          	mv	s7,a1
    3034:	00c00613          	li	a2,12
    3038:	00000593          	li	a1,0
    303c:	00050493          	mv	s1,a0
    3040:	00410513          	addi	a0,sp,4
    3044:	04112e23          	sw	ra,92(sp)
    3048:	05312623          	sw	s3,76(sp)
    304c:	05412423          	sw	s4,72(sp)
    3050:	05612023          	sw	s6,64(sp)
    3054:	05212823          	sw	s2,80(sp)
    3058:	05512223          	sw	s5,68(sp)
    305c:	fffff097          	auipc	ra,0xfffff
    3060:	cf4080e7          	jalr	-780(ra) # 1d50 <memset>
    3064:	000065b7          	lui	a1,0x6
    3068:	07e00793          	li	a5,126
    306c:	01100613          	li	a2,17
    3070:	a9858593          	addi	a1,a1,-1384 # 5a98 <LEDS+0x144>
    3074:	01c10513          	addi	a0,sp,28
    3078:	01010993          	addi	s3,sp,16
    307c:	00f10223          	sb	a5,4(sp)
    3080:	00098a13          	mv	s4,s3
    3084:	fffff097          	auipc	ra,0xfffff
    3088:	ce8080e7          	jalr	-792(ra) # 1d6c <memcpy>
    308c:	00900b13          	li	s6,9
    3090:	00a00593          	li	a1,10
    3094:	00040513          	mv	a0,s0
    3098:	fffff097          	auipc	ra,0xfffff
    309c:	c54080e7          	jalr	-940(ra) # 1cec <__umodsi3>
    30a0:	03050793          	addi	a5,a0,48
    30a4:	00278533          	add	a0,a5,sp
    30a8:	fec54783          	lbu	a5,-20(a0)
    30ac:	00098913          	mv	s2,s3
    30b0:	00040513          	mv	a0,s0
    30b4:	00a00593          	li	a1,10
    30b8:	00f98023          	sb	a5,0(s3)
    30bc:	00040a93          	mv	s5,s0
    30c0:	fffff097          	auipc	ra,0xfffff
    30c4:	be4080e7          	jalr	-1052(ra) # 1ca4 <__udivsi3>
    30c8:	00198993          	addi	s3,s3,1
    30cc:	00050413          	mv	s0,a0
    30d0:	fd5b60e3          	bltu	s6,s5,3090 <fatfs_lfn_generate_tail+0x80>
    30d4:	00098023          	sb	zero,0(s3)
    30d8:	00410713          	addi	a4,sp,4
    30dc:	00090793          	mv	a5,s2
    30e0:	0947f663          	bgeu	a5,s4,316c <fatfs_lfn_generate_tail+0x15c>
    30e4:	00f10713          	addi	a4,sp,15
    30e8:	00000793          	li	a5,0
    30ec:	00e96663          	bltu	s2,a4,30f8 <fatfs_lfn_generate_tail+0xe8>
    30f0:	41490933          	sub	s2,s2,s4
    30f4:	00190793          	addi	a5,s2,1
    30f8:	03078793          	addi	a5,a5,48
    30fc:	002787b3          	add	a5,a5,sp
    3100:	000b8593          	mv	a1,s7
    3104:	fc078aa3          	sb	zero,-43(a5)
    3108:	00b00613          	li	a2,11
    310c:	00048513          	mv	a0,s1
    3110:	fffff097          	auipc	ra,0xfffff
    3114:	c5c080e7          	jalr	-932(ra) # 1d6c <memcpy>
    3118:	00410513          	addi	a0,sp,4
    311c:	fffff097          	auipc	ra,0xfffff
    3120:	c74080e7          	jalr	-908(ra) # 1d90 <strlen>
    3124:	40a484b3          	sub	s1,s1,a0
    3128:	00050613          	mv	a2,a0
    312c:	00410593          	addi	a1,sp,4
    3130:	00848513          	addi	a0,s1,8
    3134:	fffff097          	auipc	ra,0xfffff
    3138:	c38080e7          	jalr	-968(ra) # 1d6c <memcpy>
    313c:	05c12083          	lw	ra,92(sp)
    3140:	05812403          	lw	s0,88(sp)
    3144:	05412483          	lw	s1,84(sp)
    3148:	05012903          	lw	s2,80(sp)
    314c:	04c12983          	lw	s3,76(sp)
    3150:	04812a03          	lw	s4,72(sp)
    3154:	04412a83          	lw	s5,68(sp)
    3158:	04012b03          	lw	s6,64(sp)
    315c:	03c12b83          	lw	s7,60(sp)
    3160:	00100513          	li	a0,1
    3164:	06010113          	addi	sp,sp,96
    3168:	00008067          	ret
    316c:	0007c683          	lbu	a3,0(a5)
    3170:	00170713          	addi	a4,a4,1
    3174:	fff78793          	addi	a5,a5,-1
    3178:	00d70023          	sb	a3,0(a4)
    317c:	f65ff06f          	j	30e0 <fatfs_lfn_generate_tail+0xd0>
    3180:	00000513          	li	a0,0
    3184:	00008067          	ret

00003188 <fatfs_total_path_levels>:
    3188:	fff00793          	li	a5,-1
    318c:	06050263          	beqz	a0,31f0 <fatfs_total_path_levels+0x68>
    3190:	00054703          	lbu	a4,0(a0)
    3194:	02f00793          	li	a5,47
    3198:	00f71863          	bne	a4,a5,31a8 <fatfs_total_path_levels+0x20>
    319c:	00150513          	addi	a0,a0,1
    31a0:	00000793          	li	a5,0
    31a4:	0400006f          	j	31e4 <fatfs_total_path_levels+0x5c>
    31a8:	00154703          	lbu	a4,1(a0)
    31ac:	03a00793          	li	a5,58
    31b0:	00f70a63          	beq	a4,a5,31c4 <fatfs_total_path_levels+0x3c>
    31b4:	00254683          	lbu	a3,2(a0)
    31b8:	05c00713          	li	a4,92
    31bc:	fff00793          	li	a5,-1
    31c0:	02e69863          	bne	a3,a4,31f0 <fatfs_total_path_levels+0x68>
    31c4:	00350513          	addi	a0,a0,3
    31c8:	05c00713          	li	a4,92
    31cc:	fd5ff06f          	j	31a0 <fatfs_total_path_levels+0x18>
    31d0:	00150513          	addi	a0,a0,1
    31d4:	00e68663          	beq	a3,a4,31e0 <fatfs_total_path_levels+0x58>
    31d8:	00054683          	lbu	a3,0(a0)
    31dc:	fe069ae3          	bnez	a3,31d0 <fatfs_total_path_levels+0x48>
    31e0:	00178793          	addi	a5,a5,1
    31e4:	00054683          	lbu	a3,0(a0)
    31e8:	fe0698e3          	bnez	a3,31d8 <fatfs_total_path_levels+0x50>
    31ec:	fff78793          	addi	a5,a5,-1
    31f0:	00078513          	mv	a0,a5
    31f4:	00008067          	ret

000031f8 <fatfs_get_substring>:
    31f8:	0cd05e63          	blez	a3,32d4 <fatfs_get_substring+0xdc>
    31fc:	0c050c63          	beqz	a0,32d4 <fatfs_get_substring+0xdc>
    3200:	fe010113          	addi	sp,sp,-32
    3204:	00812c23          	sw	s0,24(sp)
    3208:	00112e23          	sw	ra,28(sp)
    320c:	00912a23          	sw	s1,20(sp)
    3210:	00054483          	lbu	s1,0(a0)
    3214:	02f00793          	li	a5,47
    3218:	00150413          	addi	s0,a0,1
    321c:	02f48463          	beq	s1,a5,3244 <fatfs_get_substring+0x4c>
    3220:	00154703          	lbu	a4,1(a0)
    3224:	03a00793          	li	a5,58
    3228:	00f70a63          	beq	a4,a5,323c <fatfs_get_substring+0x44>
    322c:	00254803          	lbu	a6,2(a0)
    3230:	05c00713          	li	a4,92
    3234:	fff00793          	li	a5,-1
    3238:	04e81c63          	bne	a6,a4,3290 <fatfs_get_substring+0x98>
    323c:	00350413          	addi	s0,a0,3
    3240:	05c00493          	li	s1,92
    3244:	00040513          	mv	a0,s0
    3248:	00d12623          	sw	a3,12(sp)
    324c:	00c12423          	sw	a2,8(sp)
    3250:	00b12223          	sw	a1,4(sp)
    3254:	fffff097          	auipc	ra,0xfffff
    3258:	b3c080e7          	jalr	-1220(ra) # 1d90 <strlen>
    325c:	00c12683          	lw	a3,12(sp)
    3260:	00412583          	lw	a1,4(sp)
    3264:	00812603          	lw	a2,8(sp)
    3268:	00000713          	li	a4,0
    326c:	00000813          	li	a6,0
    3270:	00000793          	li	a5,0
    3274:	fff68693          	addi	a3,a3,-1
    3278:	00e608b3          	add	a7,a2,a4
    327c:	02a7c663          	blt	a5,a0,32a8 <fatfs_get_substring+0xb0>
    3280:	00088023          	sb	zero,0(a7)
    3284:	00064783          	lbu	a5,0(a2)
    3288:	0017b793          	seqz	a5,a5
    328c:	40f007b3          	neg	a5,a5
    3290:	01c12083          	lw	ra,28(sp)
    3294:	01812403          	lw	s0,24(sp)
    3298:	01412483          	lw	s1,20(sp)
    329c:	00078513          	mv	a0,a5
    32a0:	02010113          	addi	sp,sp,32
    32a4:	00008067          	ret
    32a8:	00f40333          	add	t1,s0,a5
    32ac:	00034303          	lbu	t1,0(t1)
    32b0:	00931863          	bne	t1,s1,32c0 <fatfs_get_substring+0xc8>
    32b4:	00180813          	addi	a6,a6,1
    32b8:	00178793          	addi	a5,a5,1
    32bc:	fbdff06f          	j	3278 <fatfs_get_substring+0x80>
    32c0:	feb81ce3          	bne	a6,a1,32b8 <fatfs_get_substring+0xc0>
    32c4:	fed75ae3          	bge	a4,a3,32b8 <fatfs_get_substring+0xc0>
    32c8:	00170713          	addi	a4,a4,1
    32cc:	00688023          	sb	t1,0(a7)
    32d0:	fe9ff06f          	j	32b8 <fatfs_get_substring+0xc0>
    32d4:	fff00793          	li	a5,-1
    32d8:	00078513          	mv	a0,a5
    32dc:	00008067          	ret

000032e0 <fatfs_split_path>:
    32e0:	fd010113          	addi	sp,sp,-48
    32e4:	02912223          	sw	s1,36(sp)
    32e8:	03212023          	sw	s2,32(sp)
    32ec:	01312e23          	sw	s3,28(sp)
    32f0:	01412c23          	sw	s4,24(sp)
    32f4:	02112623          	sw	ra,44(sp)
    32f8:	02812423          	sw	s0,40(sp)
    32fc:	01512a23          	sw	s5,20(sp)
    3300:	00050993          	mv	s3,a0
    3304:	00058493          	mv	s1,a1
    3308:	00060913          	mv	s2,a2
    330c:	00068a13          	mv	s4,a3
    3310:	00e12623          	sw	a4,12(sp)
    3314:	00000097          	auipc	ra,0x0
    3318:	e74080e7          	jalr	-396(ra) # 3188 <fatfs_total_path_levels>
    331c:	fff00793          	li	a5,-1
    3320:	02f51863          	bne	a0,a5,3350 <fatfs_split_path+0x70>
    3324:	fff00413          	li	s0,-1
    3328:	02c12083          	lw	ra,44(sp)
    332c:	00040513          	mv	a0,s0
    3330:	02812403          	lw	s0,40(sp)
    3334:	02412483          	lw	s1,36(sp)
    3338:	02012903          	lw	s2,32(sp)
    333c:	01c12983          	lw	s3,28(sp)
    3340:	01812a03          	lw	s4,24(sp)
    3344:	01412a83          	lw	s5,20(sp)
    3348:	03010113          	addi	sp,sp,48
    334c:	00008067          	ret
    3350:	00c12683          	lw	a3,12(sp)
    3354:	00050593          	mv	a1,a0
    3358:	00a12623          	sw	a0,12(sp)
    335c:	000a0613          	mv	a2,s4
    3360:	00098513          	mv	a0,s3
    3364:	00000097          	auipc	ra,0x0
    3368:	e94080e7          	jalr	-364(ra) # 31f8 <fatfs_get_substring>
    336c:	00050413          	mv	s0,a0
    3370:	fa051ae3          	bnez	a0,3324 <fatfs_split_path+0x44>
    3374:	00c12583          	lw	a1,12(sp)
    3378:	00059663          	bnez	a1,3384 <fatfs_split_path+0xa4>
    337c:	00048023          	sb	zero,0(s1)
    3380:	fa9ff06f          	j	3328 <fatfs_split_path+0x48>
    3384:	00098513          	mv	a0,s3
    3388:	fffff097          	auipc	ra,0xfffff
    338c:	a08080e7          	jalr	-1528(ra) # 1d90 <strlen>
    3390:	00050a93          	mv	s5,a0
    3394:	000a0513          	mv	a0,s4
    3398:	fffff097          	auipc	ra,0xfffff
    339c:	9f8080e7          	jalr	-1544(ra) # 1d90 <strlen>
    33a0:	40aa8633          	sub	a2,s5,a0
    33a4:	00c95463          	bge	s2,a2,33ac <fatfs_split_path+0xcc>
    33a8:	00090613          	mv	a2,s2
    33ac:	00048513          	mv	a0,s1
    33b0:	00098593          	mv	a1,s3
    33b4:	00c12623          	sw	a2,12(sp)
    33b8:	fffff097          	auipc	ra,0xfffff
    33bc:	9b4080e7          	jalr	-1612(ra) # 1d6c <memcpy>
    33c0:	00c12603          	lw	a2,12(sp)
    33c4:	00c484b3          	add	s1,s1,a2
    33c8:	fe048fa3          	sb	zero,-1(s1)
    33cc:	f5dff06f          	j	3328 <fatfs_split_path+0x48>

000033d0 <fatfs_compare_names>:
    33d0:	fd010113          	addi	sp,sp,-48
    33d4:	02112623          	sw	ra,44(sp)
    33d8:	03212023          	sw	s2,32(sp)
    33dc:	01312e23          	sw	s3,28(sp)
    33e0:	01412c23          	sw	s4,24(sp)
    33e4:	01512a23          	sw	s5,20(sp)
    33e8:	00058a13          	mv	s4,a1
    33ec:	02812423          	sw	s0,40(sp)
    33f0:	02912223          	sw	s1,36(sp)
    33f4:	01612823          	sw	s6,16(sp)
    33f8:	01712623          	sw	s7,12(sp)
    33fc:	01812423          	sw	s8,8(sp)
    3400:	00050a93          	mv	s5,a0
    3404:	fffff097          	auipc	ra,0xfffff
    3408:	1c4080e7          	jalr	452(ra) # 25c8 <FileString_GetExtension>
    340c:	00050993          	mv	s3,a0
    3410:	000a0513          	mv	a0,s4
    3414:	fffff097          	auipc	ra,0xfffff
    3418:	1b4080e7          	jalr	436(ra) # 25c8 <FileString_GetExtension>
    341c:	fff00793          	li	a5,-1
    3420:	00050913          	mv	s2,a0
    3424:	02f99e63          	bne	s3,a5,3460 <fatfs_compare_names+0x90>
    3428:	0f350063          	beq	a0,s3,3508 <fatfs_compare_names+0x138>
    342c:	00000513          	li	a0,0
    3430:	02c12083          	lw	ra,44(sp)
    3434:	02812403          	lw	s0,40(sp)
    3438:	02412483          	lw	s1,36(sp)
    343c:	02012903          	lw	s2,32(sp)
    3440:	01c12983          	lw	s3,28(sp)
    3444:	01812a03          	lw	s4,24(sp)
    3448:	01412a83          	lw	s5,20(sp)
    344c:	01012b03          	lw	s6,16(sp)
    3450:	00c12b83          	lw	s7,12(sp)
    3454:	00812c03          	lw	s8,8(sp)
    3458:	03010113          	addi	sp,sp,48
    345c:	00008067          	ret
    3460:	fcf506e3          	beq	a0,a5,342c <fatfs_compare_names+0x5c>
    3464:	00198793          	addi	a5,s3,1
    3468:	00fa8b33          	add	s6,s5,a5
    346c:	00050413          	mv	s0,a0
    3470:	00150793          	addi	a5,a0,1
    3474:	000b0513          	mv	a0,s6
    3478:	00fa0bb3          	add	s7,s4,a5
    347c:	fffff097          	auipc	ra,0xfffff
    3480:	914080e7          	jalr	-1772(ra) # 1d90 <strlen>
    3484:	00050c13          	mv	s8,a0
    3488:	000b8513          	mv	a0,s7
    348c:	00098493          	mv	s1,s3
    3490:	fffff097          	auipc	ra,0xfffff
    3494:	900080e7          	jalr	-1792(ra) # 1d90 <strlen>
    3498:	f8ac1ae3          	bne	s8,a0,342c <fatfs_compare_names+0x5c>
    349c:	000b0513          	mv	a0,s6
    34a0:	fffff097          	auipc	ra,0xfffff
    34a4:	8f0080e7          	jalr	-1808(ra) # 1d90 <strlen>
    34a8:	00050613          	mv	a2,a0
    34ac:	000b8593          	mv	a1,s7
    34b0:	000b0513          	mv	a0,s6
    34b4:	fffff097          	auipc	ra,0xfffff
    34b8:	0a4080e7          	jalr	164(ra) # 2558 <FileString_StrCmpNoCase>
    34bc:	f60518e3          	bnez	a0,342c <fatfs_compare_names+0x5c>
    34c0:	fff48793          	addi	a5,s1,-1
    34c4:	00fa87b3          	add	a5,s5,a5
    34c8:	41378733          	sub	a4,a5,s3
    34cc:	02000693          	li	a3,32
    34d0:	06e79263          	bne	a5,a4,3534 <fatfs_compare_names+0x164>
    34d4:	fff40793          	addi	a5,s0,-1
    34d8:	00fa07b3          	add	a5,s4,a5
    34dc:	41278733          	sub	a4,a5,s2
    34e0:	02000693          	li	a3,32
    34e4:	06e79263          	bne	a5,a4,3548 <fatfs_compare_names+0x178>
    34e8:	f53912e3          	bne	s2,s3,342c <fatfs_compare_names+0x5c>
    34ec:	00090613          	mv	a2,s2
    34f0:	000a0593          	mv	a1,s4
    34f4:	000a8513          	mv	a0,s5
    34f8:	fffff097          	auipc	ra,0xfffff
    34fc:	060080e7          	jalr	96(ra) # 2558 <FileString_StrCmpNoCase>
    3500:	00153513          	seqz	a0,a0
    3504:	f2dff06f          	j	3430 <fatfs_compare_names+0x60>
    3508:	000a8513          	mv	a0,s5
    350c:	fffff097          	auipc	ra,0xfffff
    3510:	884080e7          	jalr	-1916(ra) # 1d90 <strlen>
    3514:	00050493          	mv	s1,a0
    3518:	00050993          	mv	s3,a0
    351c:	000a0513          	mv	a0,s4
    3520:	fffff097          	auipc	ra,0xfffff
    3524:	870080e7          	jalr	-1936(ra) # 1d90 <strlen>
    3528:	00050413          	mv	s0,a0
    352c:	00050913          	mv	s2,a0
    3530:	f91ff06f          	j	34c0 <fatfs_compare_names+0xf0>
    3534:	0007c603          	lbu	a2,0(a5)
    3538:	f8d61ee3          	bne	a2,a3,34d4 <fatfs_compare_names+0x104>
    353c:	415789b3          	sub	s3,a5,s5
    3540:	fff78793          	addi	a5,a5,-1
    3544:	f8dff06f          	j	34d0 <fatfs_compare_names+0x100>
    3548:	0007c603          	lbu	a2,0(a5)
    354c:	f8d61ee3          	bne	a2,a3,34e8 <fatfs_compare_names+0x118>
    3550:	41478933          	sub	s2,a5,s4
    3554:	fff78793          	addi	a5,a5,-1
    3558:	f8dff06f          	j	34e4 <fatfs_compare_names+0x114>

0000355c <_check_file_open>:
    355c:	fe010113          	addi	sp,sp,-32
    3560:	000067b7          	lui	a5,0x6
    3564:	00812c23          	sw	s0,24(sp)
    3568:	f087a403          	lw	s0,-248(a5) # 5f08 <_open_file_list>
    356c:	00912a23          	sw	s1,20(sp)
    3570:	00112e23          	sw	ra,28(sp)
    3574:	01212823          	sw	s2,16(sp)
    3578:	01312623          	sw	s3,12(sp)
    357c:	00050493          	mv	s1,a0
    3580:	00041663          	bnez	s0,358c <_check_file_open+0x30>
    3584:	00000513          	li	a0,0
    3588:	03c0006f          	j	35c4 <_check_file_open+0x68>
    358c:	bc440793          	addi	a5,s0,-1084
    3590:	00f49663          	bne	s1,a5,359c <_check_file_open+0x40>
    3594:	00442403          	lw	s0,4(s0)
    3598:	fe9ff06f          	j	3580 <_check_file_open+0x24>
    359c:	01448593          	addi	a1,s1,20
    35a0:	bd840513          	addi	a0,s0,-1064
    35a4:	00000097          	auipc	ra,0x0
    35a8:	e2c080e7          	jalr	-468(ra) # 33d0 <fatfs_compare_names>
    35ac:	fe0504e3          	beqz	a0,3594 <_check_file_open+0x38>
    35b0:	11848593          	addi	a1,s1,280
    35b4:	cdc40513          	addi	a0,s0,-804
    35b8:	00000097          	auipc	ra,0x0
    35bc:	e18080e7          	jalr	-488(ra) # 33d0 <fatfs_compare_names>
    35c0:	fc050ae3          	beqz	a0,3594 <_check_file_open+0x38>
    35c4:	01c12083          	lw	ra,28(sp)
    35c8:	01812403          	lw	s0,24(sp)
    35cc:	01412483          	lw	s1,20(sp)
    35d0:	01012903          	lw	s2,16(sp)
    35d4:	00c12983          	lw	s3,12(sp)
    35d8:	02010113          	addi	sp,sp,32
    35dc:	00008067          	ret

000035e0 <fatfs_get_sfn_display_name>:
    35e0:	00000713          	li	a4,0
    35e4:	02000613          	li	a2,32
    35e8:	01900813          	li	a6,25
    35ec:	0005c783          	lbu	a5,0(a1)
    35f0:	00078663          	beqz	a5,35fc <fatfs_get_sfn_display_name+0x1c>
    35f4:	ff470693          	addi	a3,a4,-12
    35f8:	00069863          	bnez	a3,3608 <fatfs_get_sfn_display_name+0x28>
    35fc:	00050023          	sb	zero,0(a0)
    3600:	00100513          	li	a0,1
    3604:	00008067          	ret
    3608:	00158593          	addi	a1,a1,1
    360c:	fec780e3          	beq	a5,a2,35ec <fatfs_get_sfn_display_name+0xc>
    3610:	fbf78693          	addi	a3,a5,-65
    3614:	0ff6f693          	zext.b	a3,a3
    3618:	00d86663          	bltu	a6,a3,3624 <fatfs_get_sfn_display_name+0x44>
    361c:	02078793          	addi	a5,a5,32
    3620:	0ff7f793          	zext.b	a5,a5
    3624:	00f50023          	sb	a5,0(a0)
    3628:	00170713          	addi	a4,a4,1
    362c:	00150513          	addi	a0,a0,1
    3630:	fbdff06f          	j	35ec <fatfs_get_sfn_display_name+0xc>

00003634 <fatfs_fat_init>:
    3634:	ff010113          	addi	sp,sp,-16
    3638:	00812423          	sw	s0,8(sp)
    363c:	00912223          	sw	s1,4(sp)
    3640:	00112623          	sw	ra,12(sp)
    3644:	fff00793          	li	a5,-1
    3648:	25850493          	addi	s1,a0,600
    364c:	00050413          	mv	s0,a0
    3650:	44f52c23          	sw	a5,1112(a0)
    3654:	24052a23          	sw	zero,596(a0)
    3658:	44052e23          	sw	zero,1116(a0)
    365c:	20000613          	li	a2,512
    3660:	00048513          	mv	a0,s1
    3664:	00000593          	li	a1,0
    3668:	ffffe097          	auipc	ra,0xffffe
    366c:	6e8080e7          	jalr	1768(ra) # 1d50 <memset>
    3670:	25442783          	lw	a5,596(s0)
    3674:	00c12083          	lw	ra,12(sp)
    3678:	24942a23          	sw	s1,596(s0)
    367c:	46042023          	sw	zero,1120(s0)
    3680:	46f42223          	sw	a5,1124(s0)
    3684:	00812403          	lw	s0,8(sp)
    3688:	00412483          	lw	s1,4(sp)
    368c:	01010113          	addi	sp,sp,16
    3690:	00008067          	ret

00003694 <fatfs_init>:
    3694:	fd010113          	addi	sp,sp,-48
    3698:	02812423          	sw	s0,40(sp)
    369c:	02112623          	sw	ra,44(sp)
    36a0:	02912223          	sw	s1,36(sp)
    36a4:	03212023          	sw	s2,32(sp)
    36a8:	01312e23          	sw	s3,28(sp)
    36ac:	fff00793          	li	a5,-1
    36b0:	24f52223          	sw	a5,580(a0)
    36b4:	24052423          	sw	zero,584(a0)
    36b8:	02052223          	sw	zero,36(a0)
    36bc:	00050413          	mv	s0,a0
    36c0:	00000097          	auipc	ra,0x0
    36c4:	f74080e7          	jalr	-140(ra) # 3634 <fatfs_fat_init>
    36c8:	03442783          	lw	a5,52(s0)
    36cc:	02079463          	bnez	a5,36f4 <fatfs_init+0x60>
    36d0:	fff00713          	li	a4,-1
    36d4:	02c12083          	lw	ra,44(sp)
    36d8:	02812403          	lw	s0,40(sp)
    36dc:	02412483          	lw	s1,36(sp)
    36e0:	02012903          	lw	s2,32(sp)
    36e4:	01c12983          	lw	s3,28(sp)
    36e8:	00070513          	mv	a0,a4
    36ec:	03010113          	addi	sp,sp,48
    36f0:	00008067          	ret
    36f4:	04440593          	addi	a1,s0,68
    36f8:	00100613          	li	a2,1
    36fc:	00000513          	li	a0,0
    3700:	00b12623          	sw	a1,12(sp)
    3704:	000780e7          	jalr	a5
    3708:	fc0504e3          	beqz	a0,36d0 <fatfs_init+0x3c>
    370c:	24244703          	lbu	a4,578(s0)
    3710:	05500793          	li	a5,85
    3714:	00c12583          	lw	a1,12(sp)
    3718:	00f70663          	beq	a4,a5,3724 <fatfs_init+0x90>
    371c:	ffd00713          	li	a4,-3
    3720:	fb5ff06f          	j	36d4 <fatfs_init+0x40>
    3724:	24344703          	lbu	a4,579(s0)
    3728:	0aa00793          	li	a5,170
    372c:	fef718e3          	bne	a4,a5,371c <fatfs_init+0x88>
    3730:	20644783          	lbu	a5,518(s0)
    3734:	00600713          	li	a4,6
    3738:	02f76463          	bltu	a4,a5,3760 <fatfs_init+0xcc>
    373c:	00400713          	li	a4,4
    3740:	00f76663          	bltu	a4,a5,374c <fatfs_init+0xb8>
    3744:	00000513          	li	a0,0
    3748:	02078663          	beqz	a5,3774 <fatfs_init+0xe0>
    374c:	20c45503          	lhu	a0,524(s0)
    3750:	20a45783          	lhu	a5,522(s0)
    3754:	01051513          	slli	a0,a0,0x10
    3758:	00f56533          	or	a0,a0,a5
    375c:	0180006f          	j	3774 <fatfs_init+0xe0>
    3760:	00c00713          	li	a4,12
    3764:	12f76663          	bltu	a4,a5,3890 <fatfs_init+0x1fc>
    3768:	00a00713          	li	a4,10
    376c:	00000513          	li	a0,0
    3770:	fcf76ee3          	bltu	a4,a5,374c <fatfs_init+0xb8>
    3774:	03442783          	lw	a5,52(s0)
    3778:	00a42e23          	sw	a0,28(s0)
    377c:	00100613          	li	a2,1
    3780:	000780e7          	jalr	a5
    3784:	f40506e3          	beqz	a0,36d0 <fatfs_init+0x3c>
    3788:	05044783          	lbu	a5,80(s0)
    378c:	04f44703          	lbu	a4,79(s0)
    3790:	20000693          	li	a3,512
    3794:	00879793          	slli	a5,a5,0x8
    3798:	00e7e7b3          	or	a5,a5,a4
    379c:	ffe00713          	li	a4,-2
    37a0:	f2d79ae3          	bne	a5,a3,36d4 <fatfs_init+0x40>
    37a4:	05644483          	lbu	s1,86(s0)
    37a8:	05544783          	lbu	a5,85(s0)
    37ac:	05144983          	lbu	s3,81(s0)
    37b0:	00849493          	slli	s1,s1,0x8
    37b4:	05a45583          	lhu	a1,90(s0)
    37b8:	00f4e4b3          	or	s1,s1,a5
    37bc:	01340023          	sb	s3,0(s0)
    37c0:	02941423          	sh	s1,40(s0)
    37c4:	05245903          	lhu	s2,82(s0)
    37c8:	05444503          	lbu	a0,84(s0)
    37cc:	00059463          	bnez	a1,37d4 <fatfs_init+0x140>
    37d0:	06842583          	lw	a1,104(s0)
    37d4:	07042783          	lw	a5,112(s0)
    37d8:	02b42023          	sw	a1,32(s0)
    37dc:	00549493          	slli	s1,s1,0x5
    37e0:	00f42423          	sw	a5,8(s0)
    37e4:	07445783          	lhu	a5,116(s0)
    37e8:	1ff48493          	addi	s1,s1,511
    37ec:	4094d493          	srai	s1,s1,0x9
    37f0:	00f41c23          	sh	a5,24(s0)
    37f4:	fffff097          	auipc	ra,0xfffff
    37f8:	ccc080e7          	jalr	-820(ra) # 24c0 <__mulsi3>
    37fc:	00a907b3          	add	a5,s2,a0
    3800:	00f42623          	sw	a5,12(s0)
    3804:	01c42783          	lw	a5,28(s0)
    3808:	24245703          	lhu	a4,578(s0)
    380c:	00942823          	sw	s1,16(s0)
    3810:	00f907b3          	add	a5,s2,a5
    3814:	00f42a23          	sw	a5,20(s0)
    3818:	00f507b3          	add	a5,a0,a5
    381c:	00f42223          	sw	a5,4(s0)
    3820:	0000b7b7          	lui	a5,0xb
    3824:	a5578793          	addi	a5,a5,-1451 # aa55 <_files+0x2ab9>
    3828:	eef71ae3          	bne	a4,a5,371c <fatfs_init+0x88>
    382c:	05844783          	lbu	a5,88(s0)
    3830:	05744703          	lbu	a4,87(s0)
    3834:	00879793          	slli	a5,a5,0x8
    3838:	00e7e7b3          	or	a5,a5,a4
    383c:	00079463          	bnez	a5,3844 <fatfs_init+0x1b0>
    3840:	06442783          	lw	a5,100(s0)
    3844:	ffb00713          	li	a4,-5
    3848:	e80986e3          	beqz	s3,36d4 <fatfs_init+0x40>
    384c:	00990933          	add	s2,s2,s1
    3850:	00a90533          	add	a0,s2,a0
    3854:	40a78533          	sub	a0,a5,a0
    3858:	00098593          	mv	a1,s3
    385c:	ffffe097          	auipc	ra,0xffffe
    3860:	448080e7          	jalr	1096(ra) # 1ca4 <__udivsi3>
    3864:	000017b7          	lui	a5,0x1
    3868:	ff478793          	addi	a5,a5,-12 # ff4 <music_player+0x130>
    386c:	ffb00713          	li	a4,-5
    3870:	e6a7f2e3          	bgeu	a5,a0,36d4 <fatfs_init+0x40>
    3874:	000107b7          	lui	a5,0x10
    3878:	ff478793          	addi	a5,a5,-12 # fff4 <_files+0x8058>
    387c:	02a7e663          	bltu	a5,a0,38a8 <fatfs_init+0x214>
    3880:	00042423          	sw	zero,8(s0)
    3884:	02042823          	sw	zero,48(s0)
    3888:	00000713          	li	a4,0
    388c:	e49ff06f          	j	36d4 <fatfs_init+0x40>
    3890:	ff278793          	addi	a5,a5,-14
    3894:	0ff7f793          	zext.b	a5,a5
    3898:	00100713          	li	a4,1
    389c:	00000513          	li	a0,0
    38a0:	eaf776e3          	bgeu	a4,a5,374c <fatfs_init+0xb8>
    38a4:	ed1ff06f          	j	3774 <fatfs_init+0xe0>
    38a8:	00100793          	li	a5,1
    38ac:	02f42823          	sw	a5,48(s0)
    38b0:	fd9ff06f          	j	3888 <fatfs_init+0x1f4>

000038b4 <fl_attach_media>:
    38b4:	000067b7          	lui	a5,0x6
    38b8:	f147a783          	lw	a5,-236(a5) # 5f14 <_filelib_init>
    38bc:	fe010113          	addi	sp,sp,-32
    38c0:	00812c23          	sw	s0,24(sp)
    38c4:	00112e23          	sw	ra,28(sp)
    38c8:	00050413          	mv	s0,a0
    38cc:	00079a63          	bnez	a5,38e0 <fl_attach_media+0x2c>
    38d0:	00b12623          	sw	a1,12(sp)
    38d4:	fffff097          	auipc	ra,0xfffff
    38d8:	080080e7          	jalr	128(ra) # 2954 <fl_init>
    38dc:	00c12583          	lw	a1,12(sp)
    38e0:	000087b7          	lui	a5,0x8
    38e4:	b3478513          	addi	a0,a5,-1228 # 7b34 <_fs>
    38e8:	02b52c23          	sw	a1,56(a0)
    38ec:	02852a23          	sw	s0,52(a0)
    38f0:	00000097          	auipc	ra,0x0
    38f4:	da4080e7          	jalr	-604(ra) # 3694 <fatfs_init>
    38f8:	00050593          	mv	a1,a0
    38fc:	02050863          	beqz	a0,392c <fl_attach_media+0x78>
    3900:	00a12623          	sw	a0,12(sp)
    3904:	00006537          	lui	a0,0x6
    3908:	aac50513          	addi	a0,a0,-1364 # 5aac <LEDS+0x158>
    390c:	fffff097          	auipc	ra,0xfffff
    3910:	a78080e7          	jalr	-1416(ra) # 2384 <printf>
    3914:	00c12583          	lw	a1,12(sp)
    3918:	01c12083          	lw	ra,28(sp)
    391c:	01812403          	lw	s0,24(sp)
    3920:	00058513          	mv	a0,a1
    3924:	02010113          	addi	sp,sp,32
    3928:	00008067          	ret
    392c:	000067b7          	lui	a5,0x6
    3930:	00100713          	li	a4,1
    3934:	f0e7a823          	sw	a4,-240(a5) # 5f10 <_filelib_valid>
    3938:	fe1ff06f          	j	3918 <fl_attach_media+0x64>

0000393c <fatfs_fat_purge>:
    393c:	25452583          	lw	a1,596(a0)
    3940:	fe010113          	addi	sp,sp,-32
    3944:	00812c23          	sw	s0,24(sp)
    3948:	00112e23          	sw	ra,28(sp)
    394c:	00050413          	mv	s0,a0
    3950:	00059663          	bnez	a1,395c <fatfs_fat_purge+0x20>
    3954:	00100513          	li	a0,1
    3958:	02c0006f          	j	3984 <fatfs_fat_purge+0x48>
    395c:	2045a783          	lw	a5,516(a1)
    3960:	00079663          	bnez	a5,396c <fatfs_fat_purge+0x30>
    3964:	20c5a583          	lw	a1,524(a1)
    3968:	fe9ff06f          	j	3950 <fatfs_fat_purge+0x14>
    396c:	00040513          	mv	a0,s0
    3970:	00b12623          	sw	a1,12(sp)
    3974:	fffff097          	auipc	ra,0xfffff
    3978:	c80080e7          	jalr	-896(ra) # 25f4 <fatfs_fat_writeback>
    397c:	00c12583          	lw	a1,12(sp)
    3980:	fe0512e3          	bnez	a0,3964 <fatfs_fat_purge+0x28>
    3984:	01c12083          	lw	ra,28(sp)
    3988:	01812403          	lw	s0,24(sp)
    398c:	02010113          	addi	sp,sp,32
    3990:	00008067          	ret

00003994 <fatfs_find_next_cluster>:
    3994:	ff010113          	addi	sp,sp,-16
    3998:	00812423          	sw	s0,8(sp)
    399c:	01212023          	sw	s2,0(sp)
    39a0:	00112623          	sw	ra,12(sp)
    39a4:	00912223          	sw	s1,4(sp)
    39a8:	00050913          	mv	s2,a0
    39ac:	00200413          	li	s0,2
    39b0:	00058463          	beqz	a1,39b8 <fatfs_find_next_cluster+0x24>
    39b4:	00058413          	mv	s0,a1
    39b8:	03092783          	lw	a5,48(s2)
    39bc:	00745493          	srli	s1,s0,0x7
    39c0:	00079463          	bnez	a5,39c8 <fatfs_find_next_cluster+0x34>
    39c4:	00845493          	srli	s1,s0,0x8
    39c8:	01492583          	lw	a1,20(s2)
    39cc:	00090513          	mv	a0,s2
    39d0:	00b485b3          	add	a1,s1,a1
    39d4:	fffff097          	auipc	ra,0xfffff
    39d8:	ca4080e7          	jalr	-860(ra) # 2678 <fatfs_fat_read_sector>
    39dc:	00050793          	mv	a5,a0
    39e0:	fff00513          	li	a0,-1
    39e4:	04078863          	beqz	a5,3a34 <fatfs_find_next_cluster+0xa0>
    39e8:	03092703          	lw	a4,48(s2)
    39ec:	2087a783          	lw	a5,520(a5)
    39f0:	04071e63          	bnez	a4,3a4c <fatfs_find_next_cluster+0xb8>
    39f4:	00849493          	slli	s1,s1,0x8
    39f8:	40940433          	sub	s0,s0,s1
    39fc:	00141413          	slli	s0,s0,0x1
    3a00:	01041413          	slli	s0,s0,0x10
    3a04:	01045413          	srli	s0,s0,0x10
    3a08:	008787b3          	add	a5,a5,s0
    3a0c:	0017c503          	lbu	a0,1(a5)
    3a10:	0007c783          	lbu	a5,0(a5)
    3a14:	00851513          	slli	a0,a0,0x8
    3a18:	00f50533          	add	a0,a0,a5
    3a1c:	ffff07b7          	lui	a5,0xffff0
    3a20:	00878793          	addi	a5,a5,8 # ffff0008 <__stacktop+0xfffe0008>
    3a24:	00f507b3          	add	a5,a0,a5
    3a28:	00700713          	li	a4,7
    3a2c:	00f76463          	bltu	a4,a5,3a34 <fatfs_find_next_cluster+0xa0>
    3a30:	fff00513          	li	a0,-1
    3a34:	00c12083          	lw	ra,12(sp)
    3a38:	00812403          	lw	s0,8(sp)
    3a3c:	00412483          	lw	s1,4(sp)
    3a40:	00012903          	lw	s2,0(sp)
    3a44:	01010113          	addi	sp,sp,16
    3a48:	00008067          	ret
    3a4c:	00749493          	slli	s1,s1,0x7
    3a50:	40940433          	sub	s0,s0,s1
    3a54:	00241413          	slli	s0,s0,0x2
    3a58:	01041413          	slli	s0,s0,0x10
    3a5c:	01045413          	srli	s0,s0,0x10
    3a60:	008787b3          	add	a5,a5,s0
    3a64:	0037c503          	lbu	a0,3(a5)
    3a68:	0027c703          	lbu	a4,2(a5)
    3a6c:	01851513          	slli	a0,a0,0x18
    3a70:	01071713          	slli	a4,a4,0x10
    3a74:	00e50533          	add	a0,a0,a4
    3a78:	0007c703          	lbu	a4,0(a5)
    3a7c:	0017c783          	lbu	a5,1(a5)
    3a80:	00e50533          	add	a0,a0,a4
    3a84:	00879793          	slli	a5,a5,0x8
    3a88:	00f50533          	add	a0,a0,a5
    3a8c:	00451513          	slli	a0,a0,0x4
    3a90:	00455513          	srli	a0,a0,0x4
    3a94:	f00007b7          	lui	a5,0xf0000
    3a98:	f89ff06f          	j	3a20 <fatfs_find_next_cluster+0x8c>

00003a9c <fatfs_sector_reader>:
    3a9c:	03052783          	lw	a5,48(a0)
    3aa0:	fe010113          	addi	sp,sp,-32
    3aa4:	00812c23          	sw	s0,24(sp)
    3aa8:	01212823          	sw	s2,16(sp)
    3aac:	01512223          	sw	s5,4(sp)
    3ab0:	00112e23          	sw	ra,28(sp)
    3ab4:	00912a23          	sw	s1,20(sp)
    3ab8:	01312623          	sw	s3,12(sp)
    3abc:	01412423          	sw	s4,8(sp)
    3ac0:	01612023          	sw	s6,0(sp)
    3ac4:	00f5e7b3          	or	a5,a1,a5
    3ac8:	00050413          	mv	s0,a0
    3acc:	00060913          	mv	s2,a2
    3ad0:	00068a93          	mv	s5,a3
    3ad4:	08079063          	bnez	a5,3b54 <fatfs_sector_reader+0xb8>
    3ad8:	01052783          	lw	a5,16(a0)
    3adc:	02f66863          	bltu	a2,a5,3b0c <fatfs_sector_reader+0x70>
    3ae0:	00000513          	li	a0,0
    3ae4:	01c12083          	lw	ra,28(sp)
    3ae8:	01812403          	lw	s0,24(sp)
    3aec:	01412483          	lw	s1,20(sp)
    3af0:	01012903          	lw	s2,16(sp)
    3af4:	00c12983          	lw	s3,12(sp)
    3af8:	00812a03          	lw	s4,8(sp)
    3afc:	00412a83          	lw	s5,4(sp)
    3b00:	00012b03          	lw	s6,0(sp)
    3b04:	02010113          	addi	sp,sp,32
    3b08:	00008067          	ret
    3b0c:	01c52503          	lw	a0,28(a0)
    3b10:	00c42783          	lw	a5,12(s0)
    3b14:	00f50533          	add	a0,a0,a5
    3b18:	01250533          	add	a0,a0,s2
    3b1c:	0a0a8663          	beqz	s5,3bc8 <fatfs_sector_reader+0x12c>
    3b20:	03442783          	lw	a5,52(s0)
    3b24:	00100613          	li	a2,1
    3b28:	000a8593          	mv	a1,s5
    3b2c:	01812403          	lw	s0,24(sp)
    3b30:	01c12083          	lw	ra,28(sp)
    3b34:	01412483          	lw	s1,20(sp)
    3b38:	01012903          	lw	s2,16(sp)
    3b3c:	00c12983          	lw	s3,12(sp)
    3b40:	00812a03          	lw	s4,8(sp)
    3b44:	00412a83          	lw	s5,4(sp)
    3b48:	00012b03          	lw	s6,0(sp)
    3b4c:	02010113          	addi	sp,sp,32
    3b50:	00078067          	jr	a5 # f0000000 <__stacktop+0xefff0000>
    3b54:	00054783          	lbu	a5,0(a0)
    3b58:	00058493          	mv	s1,a1
    3b5c:	00060513          	mv	a0,a2
    3b60:	00078593          	mv	a1,a5
    3b64:	00078a13          	mv	s4,a5
    3b68:	ffffe097          	auipc	ra,0xffffe
    3b6c:	13c080e7          	jalr	316(ra) # 1ca4 <__udivsi3>
    3b70:	00050b13          	mv	s6,a0
    3b74:	00000993          	li	s3,0
    3b78:	03699a63          	bne	s3,s6,3bac <fatfs_sector_reader+0x110>
    3b7c:	fff00793          	li	a5,-1
    3b80:	f6f480e3          	beq	s1,a5,3ae0 <fatfs_sector_reader+0x44>
    3b84:	000a0593          	mv	a1,s4
    3b88:	00090513          	mv	a0,s2
    3b8c:	ffffe097          	auipc	ra,0xffffe
    3b90:	160080e7          	jalr	352(ra) # 1cec <__umodsi3>
    3b94:	00050913          	mv	s2,a0
    3b98:	00048593          	mv	a1,s1
    3b9c:	00040513          	mv	a0,s0
    3ba0:	fffff097          	auipc	ra,0xfffff
    3ba4:	c84080e7          	jalr	-892(ra) # 2824 <fatfs_lba_of_cluster>
    3ba8:	f71ff06f          	j	3b18 <fatfs_sector_reader+0x7c>
    3bac:	00048593          	mv	a1,s1
    3bb0:	00040513          	mv	a0,s0
    3bb4:	00000097          	auipc	ra,0x0
    3bb8:	de0080e7          	jalr	-544(ra) # 3994 <fatfs_find_next_cluster>
    3bbc:	00050493          	mv	s1,a0
    3bc0:	00198993          	addi	s3,s3,1
    3bc4:	fb5ff06f          	j	3b78 <fatfs_sector_reader+0xdc>
    3bc8:	24442783          	lw	a5,580(s0)
    3bcc:	00a78c63          	beq	a5,a0,3be4 <fatfs_sector_reader+0x148>
    3bd0:	03442783          	lw	a5,52(s0)
    3bd4:	24a42223          	sw	a0,580(s0)
    3bd8:	00100613          	li	a2,1
    3bdc:	04440593          	addi	a1,s0,68
    3be0:	f4dff06f          	j	3b2c <fatfs_sector_reader+0x90>
    3be4:	00100513          	li	a0,1
    3be8:	efdff06f          	j	3ae4 <fatfs_sector_reader+0x48>

00003bec <fatfs_get_file_entry>:
    3bec:	eb010113          	addi	sp,sp,-336
    3bf0:	14812423          	sw	s0,328(sp)
    3bf4:	14912223          	sw	s1,324(sp)
    3bf8:	13312e23          	sw	s3,316(sp)
    3bfc:	13712623          	sw	s7,300(sp)
    3c00:	13812423          	sw	s8,296(sp)
    3c04:	13912223          	sw	s9,292(sp)
    3c08:	14112623          	sw	ra,332(sp)
    3c0c:	15212023          	sw	s2,320(sp)
    3c10:	13412c23          	sw	s4,312(sp)
    3c14:	13512a23          	sw	s5,308(sp)
    3c18:	13612823          	sw	s6,304(sp)
    3c1c:	00050993          	mv	s3,a0
    3c20:	00058c93          	mv	s9,a1
    3c24:	00060b93          	mv	s7,a2
    3c28:	00068c13          	mv	s8,a3
    3c2c:	10010ea3          	sb	zero,285(sp)
    3c30:	01810413          	addi	s0,sp,24
    3c34:	11c10493          	addi	s1,sp,284
    3c38:	00040513          	mv	a0,s0
    3c3c:	00d00613          	li	a2,13
    3c40:	00000593          	li	a1,0
    3c44:	00d40413          	addi	s0,s0,13
    3c48:	ffffe097          	auipc	ra,0xffffe
    3c4c:	108080e7          	jalr	264(ra) # 1d50 <memset>
    3c50:	fe9414e3          	bne	s0,s1,3c38 <fatfs_get_file_entry+0x4c>
    3c54:	00000493          	li	s1,0
    3c58:	24498a13          	addi	s4,s3,580
    3c5c:	00810913          	addi	s2,sp,8
    3c60:	00800a93          	li	s5,8
    3c64:	02e00b13          	li	s6,46
    3c68:	00000693          	li	a3,0
    3c6c:	00048613          	mv	a2,s1
    3c70:	000c8593          	mv	a1,s9
    3c74:	00098513          	mv	a0,s3
    3c78:	00000097          	auipc	ra,0x0
    3c7c:	e24080e7          	jalr	-476(ra) # 3a9c <fatfs_sector_reader>
    3c80:	08050c63          	beqz	a0,3d18 <fatfs_get_file_entry+0x12c>
    3c84:	00148493          	addi	s1,s1,1
    3c88:	04498413          	addi	s0,s3,68
    3c8c:	00040513          	mv	a0,s0
    3c90:	fffff097          	auipc	ra,0xfffff
    3c94:	f34080e7          	jalr	-204(ra) # 2bc4 <fatfs_entry_lfn_text>
    3c98:	02050063          	beqz	a0,3cb8 <fatfs_get_file_entry+0xcc>
    3c9c:	00040593          	mv	a1,s0
    3ca0:	01810513          	addi	a0,sp,24
    3ca4:	fffff097          	auipc	ra,0xfffff
    3ca8:	e18080e7          	jalr	-488(ra) # 2abc <fatfs_lfn_cache_entry>
    3cac:	02040413          	addi	s0,s0,32
    3cb0:	fd441ee3          	bne	s0,s4,3c8c <fatfs_get_file_entry+0xa0>
    3cb4:	fb5ff06f          	j	3c68 <fatfs_get_file_entry+0x7c>
    3cb8:	00040513          	mv	a0,s0
    3cbc:	fffff097          	auipc	ra,0xfffff
    3cc0:	f1c080e7          	jalr	-228(ra) # 2bd8 <fatfs_entry_lfn_invalid>
    3cc4:	00050663          	beqz	a0,3cd0 <fatfs_get_file_entry+0xe4>
    3cc8:	10010ea3          	sb	zero,285(sp)
    3ccc:	fe1ff06f          	j	3cac <fatfs_get_file_entry+0xc0>
    3cd0:	00040593          	mv	a1,s0
    3cd4:	01810513          	addi	a0,sp,24
    3cd8:	fffff097          	auipc	ra,0xfffff
    3cdc:	f34080e7          	jalr	-204(ra) # 2c0c <fatfs_entry_lfn_exists>
    3ce0:	06050663          	beqz	a0,3d4c <fatfs_get_file_entry+0x160>
    3ce4:	01810513          	addi	a0,sp,24
    3ce8:	fffff097          	auipc	ra,0xfffff
    3cec:	ea0080e7          	jalr	-352(ra) # 2b88 <fatfs_lfn_cache_get>
    3cf0:	000b8593          	mv	a1,s7
    3cf4:	fffff097          	auipc	ra,0xfffff
    3cf8:	6dc080e7          	jalr	1756(ra) # 33d0 <fatfs_compare_names>
    3cfc:	fc0506e3          	beqz	a0,3cc8 <fatfs_get_file_entry+0xdc>
    3d00:	02000613          	li	a2,32
    3d04:	00040593          	mv	a1,s0
    3d08:	000c0513          	mv	a0,s8
    3d0c:	ffffe097          	auipc	ra,0xffffe
    3d10:	060080e7          	jalr	96(ra) # 1d6c <memcpy>
    3d14:	00100513          	li	a0,1
    3d18:	14c12083          	lw	ra,332(sp)
    3d1c:	14812403          	lw	s0,328(sp)
    3d20:	14412483          	lw	s1,324(sp)
    3d24:	14012903          	lw	s2,320(sp)
    3d28:	13c12983          	lw	s3,316(sp)
    3d2c:	13812a03          	lw	s4,312(sp)
    3d30:	13412a83          	lw	s5,308(sp)
    3d34:	13012b03          	lw	s6,304(sp)
    3d38:	12c12b83          	lw	s7,300(sp)
    3d3c:	12812c03          	lw	s8,296(sp)
    3d40:	12412c83          	lw	s9,292(sp)
    3d44:	15010113          	addi	sp,sp,336
    3d48:	00008067          	ret
    3d4c:	00040513          	mv	a0,s0
    3d50:	fffff097          	auipc	ra,0xfffff
    3d54:	f0c080e7          	jalr	-244(ra) # 2c5c <fatfs_entry_sfn_only>
    3d58:	f4050ae3          	beqz	a0,3cac <fatfs_get_file_entry+0xc0>
    3d5c:	00d00613          	li	a2,13
    3d60:	00000593          	li	a1,0
    3d64:	00090513          	mv	a0,s2
    3d68:	ffffe097          	auipc	ra,0xffffe
    3d6c:	fe8080e7          	jalr	-24(ra) # 1d50 <memset>
    3d70:	00000793          	li	a5,0
    3d74:	00f406b3          	add	a3,s0,a5
    3d78:	0006c683          	lbu	a3,0(a3)
    3d7c:	00f90733          	add	a4,s2,a5
    3d80:	00178793          	addi	a5,a5,1
    3d84:	00d70023          	sb	a3,0(a4)
    3d88:	ff5796e3          	bne	a5,s5,3d74 <fatfs_get_file_entry+0x188>
    3d8c:	00844703          	lbu	a4,8(s0)
    3d90:	00944783          	lbu	a5,9(s0)
    3d94:	00a44683          	lbu	a3,10(s0)
    3d98:	00e108a3          	sb	a4,17(sp)
    3d9c:	00f10923          	sb	a5,18(sp)
    3da0:	fe070713          	addi	a4,a4,-32
    3da4:	fe078793          	addi	a5,a5,-32
    3da8:	00f037b3          	snez	a5,a5
    3dac:	00e03733          	snez	a4,a4
    3db0:	00d109a3          	sb	a3,19(sp)
    3db4:	00e7e7b3          	or	a5,a5,a4
    3db8:	00079863          	bnez	a5,3dc8 <fatfs_get_file_entry+0x1dc>
    3dbc:	fe068693          	addi	a3,a3,-32
    3dc0:	02000793          	li	a5,32
    3dc4:	00068a63          	beqz	a3,3dd8 <fatfs_get_file_entry+0x1ec>
    3dc8:	00814703          	lbu	a4,8(sp)
    3dcc:	02e00793          	li	a5,46
    3dd0:	01671463          	bne	a4,s6,3dd8 <fatfs_get_file_entry+0x1ec>
    3dd4:	02000793          	li	a5,32
    3dd8:	00f10823          	sb	a5,16(sp)
    3ddc:	000b8593          	mv	a1,s7
    3de0:	00090513          	mv	a0,s2
    3de4:	f11ff06f          	j	3cf4 <fatfs_get_file_entry+0x108>

00003de8 <_open_directory>:
    3de8:	eb010113          	addi	sp,sp,-336
    3dec:	15212023          	sw	s2,320(sp)
    3df0:	00008937          	lui	s2,0x8
    3df4:	b3490913          	addi	s2,s2,-1228 # 7b34 <_fs>
    3df8:	14812423          	sw	s0,328(sp)
    3dfc:	00892403          	lw	s0,8(s2)
    3e00:	14912223          	sw	s1,324(sp)
    3e04:	13312e23          	sw	s3,316(sp)
    3e08:	13412c23          	sw	s4,312(sp)
    3e0c:	13512a23          	sw	s5,308(sp)
    3e10:	13612823          	sw	s6,304(sp)
    3e14:	14112623          	sw	ra,332(sp)
    3e18:	00050a13          	mv	s4,a0
    3e1c:	00058a93          	mv	s5,a1
    3e20:	fffff097          	auipc	ra,0xfffff
    3e24:	368080e7          	jalr	872(ra) # 3188 <fatfs_total_path_levels>
    3e28:	00050b13          	mv	s6,a0
    3e2c:	00000493          	li	s1,0
    3e30:	fff00993          	li	s3,-1
    3e34:	009b5863          	bge	s6,s1,3e44 <_open_directory+0x5c>
    3e38:	008aa023          	sw	s0,0(s5)
    3e3c:	00100513          	li	a0,1
    3e40:	0240006f          	j	3e64 <_open_directory+0x7c>
    3e44:	10400693          	li	a3,260
    3e48:	02c10613          	addi	a2,sp,44
    3e4c:	00048593          	mv	a1,s1
    3e50:	000a0513          	mv	a0,s4
    3e54:	fffff097          	auipc	ra,0xfffff
    3e58:	3a4080e7          	jalr	932(ra) # 31f8 <fatfs_get_substring>
    3e5c:	03351863          	bne	a0,s3,3e8c <_open_directory+0xa4>
    3e60:	00000513          	li	a0,0
    3e64:	14c12083          	lw	ra,332(sp)
    3e68:	14812403          	lw	s0,328(sp)
    3e6c:	14412483          	lw	s1,324(sp)
    3e70:	14012903          	lw	s2,320(sp)
    3e74:	13c12983          	lw	s3,316(sp)
    3e78:	13812a03          	lw	s4,312(sp)
    3e7c:	13412a83          	lw	s5,308(sp)
    3e80:	13012b03          	lw	s6,304(sp)
    3e84:	15010113          	addi	sp,sp,336
    3e88:	00008067          	ret
    3e8c:	00c10693          	addi	a3,sp,12
    3e90:	02c10613          	addi	a2,sp,44
    3e94:	00040593          	mv	a1,s0
    3e98:	00090513          	mv	a0,s2
    3e9c:	00000097          	auipc	ra,0x0
    3ea0:	d50080e7          	jalr	-688(ra) # 3bec <fatfs_get_file_entry>
    3ea4:	fa050ee3          	beqz	a0,3e60 <_open_directory+0x78>
    3ea8:	01714783          	lbu	a5,23(sp)
    3eac:	0107f793          	andi	a5,a5,16
    3eb0:	fa0788e3          	beqz	a5,3e60 <_open_directory+0x78>
    3eb4:	02015403          	lhu	s0,32(sp)
    3eb8:	02615783          	lhu	a5,38(sp)
    3ebc:	00148493          	addi	s1,s1,1
    3ec0:	01041413          	slli	s0,s0,0x10
    3ec4:	00f40433          	add	s0,s0,a5
    3ec8:	f6dff06f          	j	3e34 <_open_directory+0x4c>

00003ecc <fl_opendir>:
    3ecc:	fe010113          	addi	sp,sp,-32
    3ed0:	fff00793          	li	a5,-1
    3ed4:	00f12623          	sw	a5,12(sp)
    3ed8:	000067b7          	lui	a5,0x6
    3edc:	f147a783          	lw	a5,-236(a5) # 5f14 <_filelib_init>
    3ee0:	00812c23          	sw	s0,24(sp)
    3ee4:	01212823          	sw	s2,16(sp)
    3ee8:	00112e23          	sw	ra,28(sp)
    3eec:	00912a23          	sw	s1,20(sp)
    3ef0:	00050913          	mv	s2,a0
    3ef4:	00058413          	mv	s0,a1
    3ef8:	00079663          	bnez	a5,3f04 <fl_opendir+0x38>
    3efc:	fffff097          	auipc	ra,0xfffff
    3f00:	a58080e7          	jalr	-1448(ra) # 2954 <fl_init>
    3f04:	000084b7          	lui	s1,0x8
    3f08:	b3448493          	addi	s1,s1,-1228 # 7b34 <_fs>
    3f0c:	03c4a783          	lw	a5,60(s1)
    3f10:	00078463          	beqz	a5,3f18 <fl_opendir+0x4c>
    3f14:	000780e7          	jalr	a5
    3f18:	00090513          	mv	a0,s2
    3f1c:	fffff097          	auipc	ra,0xfffff
    3f20:	26c080e7          	jalr	620(ra) # 3188 <fatfs_total_path_levels>
    3f24:	fff00793          	li	a5,-1
    3f28:	02f51063          	bne	a0,a5,3f48 <fl_opendir+0x7c>
    3f2c:	0084a783          	lw	a5,8(s1)
    3f30:	00f12623          	sw	a5,12(sp)
    3f34:	00c12783          	lw	a5,12(sp)
    3f38:	00042023          	sw	zero,0(s0)
    3f3c:	00040423          	sb	zero,8(s0)
    3f40:	00f42223          	sw	a5,4(s0)
    3f44:	0180006f          	j	3f5c <fl_opendir+0x90>
    3f48:	00c10593          	addi	a1,sp,12
    3f4c:	00090513          	mv	a0,s2
    3f50:	00000097          	auipc	ra,0x0
    3f54:	e98080e7          	jalr	-360(ra) # 3de8 <_open_directory>
    3f58:	fc051ee3          	bnez	a0,3f34 <fl_opendir+0x68>
    3f5c:	0404a783          	lw	a5,64(s1)
    3f60:	00078463          	beqz	a5,3f68 <fl_opendir+0x9c>
    3f64:	000780e7          	jalr	a5
    3f68:	00c12703          	lw	a4,12(sp)
    3f6c:	fff00793          	li	a5,-1
    3f70:	00f71463          	bne	a4,a5,3f78 <fl_opendir+0xac>
    3f74:	00000413          	li	s0,0
    3f78:	01c12083          	lw	ra,28(sp)
    3f7c:	00040513          	mv	a0,s0
    3f80:	01812403          	lw	s0,24(sp)
    3f84:	01412483          	lw	s1,20(sp)
    3f88:	01012903          	lw	s2,16(sp)
    3f8c:	02010113          	addi	sp,sp,32
    3f90:	00008067          	ret

00003f94 <_open_file>:
    3f94:	fc010113          	addi	sp,sp,-64
    3f98:	03312623          	sw	s3,44(sp)
    3f9c:	02112e23          	sw	ra,60(sp)
    3fa0:	02812c23          	sw	s0,56(sp)
    3fa4:	02912a23          	sw	s1,52(sp)
    3fa8:	03212823          	sw	s2,48(sp)
    3fac:	00050993          	mv	s3,a0
    3fb0:	ffffe097          	auipc	ra,0xffffe
    3fb4:	7b4080e7          	jalr	1972(ra) # 2764 <_allocate_file>
    3fb8:	06050463          	beqz	a0,4020 <_open_file+0x8c>
    3fbc:	01450913          	addi	s2,a0,20
    3fc0:	00050413          	mv	s0,a0
    3fc4:	10400613          	li	a2,260
    3fc8:	00000593          	li	a1,0
    3fcc:	00090513          	mv	a0,s2
    3fd0:	ffffe097          	auipc	ra,0xffffe
    3fd4:	d80080e7          	jalr	-640(ra) # 1d50 <memset>
    3fd8:	11840493          	addi	s1,s0,280
    3fdc:	10400613          	li	a2,260
    3fe0:	00000593          	li	a1,0
    3fe4:	00048513          	mv	a0,s1
    3fe8:	ffffe097          	auipc	ra,0xffffe
    3fec:	d68080e7          	jalr	-664(ra) # 1d50 <memset>
    3ff0:	10400713          	li	a4,260
    3ff4:	00048693          	mv	a3,s1
    3ff8:	00070613          	mv	a2,a4
    3ffc:	00090593          	mv	a1,s2
    4000:	00098513          	mv	a0,s3
    4004:	fffff097          	auipc	ra,0xfffff
    4008:	2dc080e7          	jalr	732(ra) # 32e0 <fatfs_split_path>
    400c:	fff00793          	li	a5,-1
    4010:	02f51a63          	bne	a0,a5,4044 <_open_file+0xb0>
    4014:	00040513          	mv	a0,s0
    4018:	ffffe097          	auipc	ra,0xffffe
    401c:	7c4080e7          	jalr	1988(ra) # 27dc <_free_file>
    4020:	00000413          	li	s0,0
    4024:	03c12083          	lw	ra,60(sp)
    4028:	00040513          	mv	a0,s0
    402c:	03812403          	lw	s0,56(sp)
    4030:	03412483          	lw	s1,52(sp)
    4034:	03012903          	lw	s2,48(sp)
    4038:	02c12983          	lw	s3,44(sp)
    403c:	04010113          	addi	sp,sp,64
    4040:	00008067          	ret
    4044:	00040513          	mv	a0,s0
    4048:	fffff097          	auipc	ra,0xfffff
    404c:	514080e7          	jalr	1300(ra) # 355c <_check_file_open>
    4050:	fc0512e3          	bnez	a0,4014 <_open_file+0x80>
    4054:	01444783          	lbu	a5,20(s0)
    4058:	08079c63          	bnez	a5,40f0 <_open_file+0x15c>
    405c:	000087b7          	lui	a5,0x8
    4060:	b3c7a783          	lw	a5,-1220(a5) # 7b3c <_fs+0x8>
    4064:	00f42023          	sw	a5,0(s0)
    4068:	00042583          	lw	a1,0(s0)
    406c:	00048613          	mv	a2,s1
    4070:	000084b7          	lui	s1,0x8
    4074:	00010693          	mv	a3,sp
    4078:	b3448513          	addi	a0,s1,-1228 # 7b34 <_fs>
    407c:	00000097          	auipc	ra,0x0
    4080:	b70080e7          	jalr	-1168(ra) # 3bec <fatfs_get_file_entry>
    4084:	f80508e3          	beqz	a0,4014 <_open_file+0x80>
    4088:	00b14783          	lbu	a5,11(sp)
    408c:	0207f793          	andi	a5,a5,32
    4090:	f80782e3          	beqz	a5,4014 <_open_file+0x80>
    4094:	00b00613          	li	a2,11
    4098:	00010593          	mv	a1,sp
    409c:	21c40513          	addi	a0,s0,540
    40a0:	ffffe097          	auipc	ra,0xffffe
    40a4:	ccc080e7          	jalr	-820(ra) # 1d6c <memcpy>
    40a8:	01c12783          	lw	a5,28(sp)
    40ac:	01a15703          	lhu	a4,26(sp)
    40b0:	00042423          	sw	zero,8(s0)
    40b4:	00f42623          	sw	a5,12(s0)
    40b8:	01415783          	lhu	a5,20(sp)
    40bc:	42042a23          	sw	zero,1076(s0)
    40c0:	00042823          	sw	zero,16(s0)
    40c4:	01079793          	slli	a5,a5,0x10
    40c8:	00e787b3          	add	a5,a5,a4
    40cc:	00f42223          	sw	a5,4(s0)
    40d0:	fff00793          	li	a5,-1
    40d4:	42f42823          	sw	a5,1072(s0)
    40d8:	22f42423          	sw	a5,552(s0)
    40dc:	22f42623          	sw	a5,556(s0)
    40e0:	b3448513          	addi	a0,s1,-1228
    40e4:	00000097          	auipc	ra,0x0
    40e8:	858080e7          	jalr	-1960(ra) # 393c <fatfs_fat_purge>
    40ec:	f39ff06f          	j	4024 <_open_file+0x90>
    40f0:	00040593          	mv	a1,s0
    40f4:	00090513          	mv	a0,s2
    40f8:	00000097          	auipc	ra,0x0
    40fc:	cf0080e7          	jalr	-784(ra) # 3de8 <_open_directory>
    4100:	f60514e3          	bnez	a0,4068 <_open_file+0xd4>
    4104:	f11ff06f          	j	4014 <_open_file+0x80>

00004108 <fatfs_sfn_exists>:
    4108:	fe010113          	addi	sp,sp,-32
    410c:	01212823          	sw	s2,16(sp)
    4110:	01312623          	sw	s3,12(sp)
    4114:	01412423          	sw	s4,8(sp)
    4118:	01512223          	sw	s5,4(sp)
    411c:	01612023          	sw	s6,0(sp)
    4120:	00112e23          	sw	ra,28(sp)
    4124:	00812c23          	sw	s0,24(sp)
    4128:	00912a23          	sw	s1,20(sp)
    412c:	00050993          	mv	s3,a0
    4130:	00058a93          	mv	s5,a1
    4134:	00060b13          	mv	s6,a2
    4138:	00000913          	li	s2,0
    413c:	24450a13          	addi	s4,a0,580
    4140:	00000693          	li	a3,0
    4144:	00090613          	mv	a2,s2
    4148:	000a8593          	mv	a1,s5
    414c:	00098513          	mv	a0,s3
    4150:	00000097          	auipc	ra,0x0
    4154:	94c080e7          	jalr	-1716(ra) # 3a9c <fatfs_sector_reader>
    4158:	00050413          	mv	s0,a0
    415c:	06050263          	beqz	a0,41c0 <fatfs_sfn_exists+0xb8>
    4160:	00190913          	addi	s2,s2,1
    4164:	04498493          	addi	s1,s3,68
    4168:	00048513          	mv	a0,s1
    416c:	fffff097          	auipc	ra,0xfffff
    4170:	a58080e7          	jalr	-1448(ra) # 2bc4 <fatfs_entry_lfn_text>
    4174:	00050863          	beqz	a0,4184 <fatfs_sfn_exists+0x7c>
    4178:	02048493          	addi	s1,s1,32
    417c:	ff4496e3          	bne	s1,s4,4168 <fatfs_sfn_exists+0x60>
    4180:	fc1ff06f          	j	4140 <fatfs_sfn_exists+0x38>
    4184:	00048513          	mv	a0,s1
    4188:	fffff097          	auipc	ra,0xfffff
    418c:	a50080e7          	jalr	-1456(ra) # 2bd8 <fatfs_entry_lfn_invalid>
    4190:	fe0514e3          	bnez	a0,4178 <fatfs_sfn_exists+0x70>
    4194:	00048513          	mv	a0,s1
    4198:	fffff097          	auipc	ra,0xfffff
    419c:	ac4080e7          	jalr	-1340(ra) # 2c5c <fatfs_entry_sfn_only>
    41a0:	00050413          	mv	s0,a0
    41a4:	fc050ae3          	beqz	a0,4178 <fatfs_sfn_exists+0x70>
    41a8:	00b00613          	li	a2,11
    41ac:	000b0593          	mv	a1,s6
    41b0:	00048513          	mv	a0,s1
    41b4:	ffffe097          	auipc	ra,0xffffe
    41b8:	bfc080e7          	jalr	-1028(ra) # 1db0 <strncmp>
    41bc:	fa051ee3          	bnez	a0,4178 <fatfs_sfn_exists+0x70>
    41c0:	01c12083          	lw	ra,28(sp)
    41c4:	00040513          	mv	a0,s0
    41c8:	01812403          	lw	s0,24(sp)
    41cc:	01412483          	lw	s1,20(sp)
    41d0:	01012903          	lw	s2,16(sp)
    41d4:	00c12983          	lw	s3,12(sp)
    41d8:	00812a03          	lw	s4,8(sp)
    41dc:	00412a83          	lw	s5,4(sp)
    41e0:	00012b03          	lw	s6,0(sp)
    41e4:	02010113          	addi	sp,sp,32
    41e8:	00008067          	ret

000041ec <fatfs_update_file_length>:
    41ec:	03852783          	lw	a5,56(a0)
    41f0:	14078e63          	beqz	a5,434c <fatfs_update_file_length+0x160>
    41f4:	fd010113          	addi	sp,sp,-48
    41f8:	02912223          	sw	s1,36(sp)
    41fc:	03212023          	sw	s2,32(sp)
    4200:	01312e23          	sw	s3,28(sp)
    4204:	01412c23          	sw	s4,24(sp)
    4208:	01612823          	sw	s6,16(sp)
    420c:	01712623          	sw	s7,12(sp)
    4210:	02112623          	sw	ra,44(sp)
    4214:	02812423          	sw	s0,40(sp)
    4218:	01512a23          	sw	s5,20(sp)
    421c:	00068913          	mv	s2,a3
    4220:	00060b93          	mv	s7,a2
    4224:	00058b13          	mv	s6,a1
    4228:	00050493          	mv	s1,a0
    422c:	00000993          	li	s3,0
    4230:	24450a13          	addi	s4,a0,580
    4234:	00000693          	li	a3,0
    4238:	00098613          	mv	a2,s3
    423c:	000b0593          	mv	a1,s6
    4240:	00048513          	mv	a0,s1
    4244:	00000097          	auipc	ra,0x0
    4248:	858080e7          	jalr	-1960(ra) # 3a9c <fatfs_sector_reader>
    424c:	0c050863          	beqz	a0,431c <fatfs_update_file_length+0x130>
    4250:	04448413          	addi	s0,s1,68
    4254:	00198993          	addi	s3,s3,1
    4258:	00040a93          	mv	s5,s0
    425c:	00040513          	mv	a0,s0
    4260:	fffff097          	auipc	ra,0xfffff
    4264:	964080e7          	jalr	-1692(ra) # 2bc4 <fatfs_entry_lfn_text>
    4268:	0a051463          	bnez	a0,4310 <fatfs_update_file_length+0x124>
    426c:	00040513          	mv	a0,s0
    4270:	fffff097          	auipc	ra,0xfffff
    4274:	968080e7          	jalr	-1688(ra) # 2bd8 <fatfs_entry_lfn_invalid>
    4278:	08051c63          	bnez	a0,4310 <fatfs_update_file_length+0x124>
    427c:	00040513          	mv	a0,s0
    4280:	fffff097          	auipc	ra,0xfffff
    4284:	9dc080e7          	jalr	-1572(ra) # 2c5c <fatfs_entry_sfn_only>
    4288:	08050463          	beqz	a0,4310 <fatfs_update_file_length+0x124>
    428c:	00b00613          	li	a2,11
    4290:	000b8593          	mv	a1,s7
    4294:	00040513          	mv	a0,s0
    4298:	ffffe097          	auipc	ra,0xffffe
    429c:	b18080e7          	jalr	-1256(ra) # 1db0 <strncmp>
    42a0:	06051863          	bnez	a0,4310 <fatfs_update_file_length+0x124>
    42a4:	00895793          	srli	a5,s2,0x8
    42a8:	01240e23          	sb	s2,28(s0)
    42ac:	00f40ea3          	sb	a5,29(s0)
    42b0:	01095793          	srli	a5,s2,0x10
    42b4:	01895913          	srli	s2,s2,0x18
    42b8:	00f40f23          	sb	a5,30(s0)
    42bc:	01240fa3          	sb	s2,31(s0)
    42c0:	00040593          	mv	a1,s0
    42c4:	02000613          	li	a2,32
    42c8:	00040513          	mv	a0,s0
    42cc:	ffffe097          	auipc	ra,0xffffe
    42d0:	aa0080e7          	jalr	-1376(ra) # 1d6c <memcpy>
    42d4:	02812403          	lw	s0,40(sp)
    42d8:	0384a783          	lw	a5,56(s1)
    42dc:	2444a503          	lw	a0,580(s1)
    42e0:	02c12083          	lw	ra,44(sp)
    42e4:	02412483          	lw	s1,36(sp)
    42e8:	02012903          	lw	s2,32(sp)
    42ec:	01c12983          	lw	s3,28(sp)
    42f0:	01812a03          	lw	s4,24(sp)
    42f4:	01012b03          	lw	s6,16(sp)
    42f8:	00c12b83          	lw	s7,12(sp)
    42fc:	000a8593          	mv	a1,s5
    4300:	01412a83          	lw	s5,20(sp)
    4304:	00100613          	li	a2,1
    4308:	03010113          	addi	sp,sp,48
    430c:	00078067          	jr	a5
    4310:	02040413          	addi	s0,s0,32
    4314:	f54414e3          	bne	s0,s4,425c <fatfs_update_file_length+0x70>
    4318:	f1dff06f          	j	4234 <fatfs_update_file_length+0x48>
    431c:	02c12083          	lw	ra,44(sp)
    4320:	02812403          	lw	s0,40(sp)
    4324:	02412483          	lw	s1,36(sp)
    4328:	02012903          	lw	s2,32(sp)
    432c:	01c12983          	lw	s3,28(sp)
    4330:	01812a03          	lw	s4,24(sp)
    4334:	01412a83          	lw	s5,20(sp)
    4338:	01012b03          	lw	s6,16(sp)
    433c:	00c12b83          	lw	s7,12(sp)
    4340:	00000513          	li	a0,0
    4344:	03010113          	addi	sp,sp,48
    4348:	00008067          	ret
    434c:	00000513          	li	a0,0
    4350:	00008067          	ret

00004354 <fatfs_list_directory_next>:
    4354:	ec010113          	addi	sp,sp,-320
    4358:	13212823          	sw	s2,304(sp)
    435c:	13312623          	sw	s3,300(sp)
    4360:	13412423          	sw	s4,296(sp)
    4364:	13512223          	sw	s5,292(sp)
    4368:	13612023          	sw	s6,288(sp)
    436c:	12112e23          	sw	ra,316(sp)
    4370:	12812c23          	sw	s0,312(sp)
    4374:	12912a23          	sw	s1,308(sp)
    4378:	00050a13          	mv	s4,a0
    437c:	00058913          	mv	s2,a1
    4380:	00060993          	mv	s3,a2
    4384:	10010ea3          	sb	zero,285(sp)
    4388:	04450a93          	addi	s5,a0,68
    438c:	00f00b13          	li	s6,15
    4390:	00092603          	lw	a2,0(s2)
    4394:	00492583          	lw	a1,4(s2)
    4398:	00000693          	li	a3,0
    439c:	000a0513          	mv	a0,s4
    43a0:	fffff097          	auipc	ra,0xfffff
    43a4:	6fc080e7          	jalr	1788(ra) # 3a9c <fatfs_sector_reader>
    43a8:	10050c63          	beqz	a0,44c0 <fatfs_list_directory_next+0x16c>
    43ac:	00894483          	lbu	s1,8(s2)
    43b0:	00549413          	slli	s0,s1,0x5
    43b4:	008a8433          	add	s0,s5,s0
    43b8:	009b7c63          	bgeu	s6,s1,43d0 <fatfs_list_directory_next+0x7c>
    43bc:	00092783          	lw	a5,0(s2)
    43c0:	00090423          	sb	zero,8(s2)
    43c4:	00178793          	addi	a5,a5,1
    43c8:	00f92023          	sw	a5,0(s2)
    43cc:	fc5ff06f          	j	4390 <fatfs_list_directory_next+0x3c>
    43d0:	00040513          	mv	a0,s0
    43d4:	ffffe097          	auipc	ra,0xffffe
    43d8:	7f0080e7          	jalr	2032(ra) # 2bc4 <fatfs_entry_lfn_text>
    43dc:	02050263          	beqz	a0,4400 <fatfs_list_directory_next+0xac>
    43e0:	00040593          	mv	a1,s0
    43e4:	01810513          	addi	a0,sp,24
    43e8:	ffffe097          	auipc	ra,0xffffe
    43ec:	6d4080e7          	jalr	1748(ra) # 2abc <fatfs_lfn_cache_entry>
    43f0:	00148493          	addi	s1,s1,1
    43f4:	0ff4f493          	zext.b	s1,s1
    43f8:	02040413          	addi	s0,s0,32
    43fc:	fbdff06f          	j	43b8 <fatfs_list_directory_next+0x64>
    4400:	00040513          	mv	a0,s0
    4404:	ffffe097          	auipc	ra,0xffffe
    4408:	7d4080e7          	jalr	2004(ra) # 2bd8 <fatfs_entry_lfn_invalid>
    440c:	00050663          	beqz	a0,4418 <fatfs_list_directory_next+0xc4>
    4410:	10010ea3          	sb	zero,285(sp)
    4414:	fddff06f          	j	43f0 <fatfs_list_directory_next+0x9c>
    4418:	00040593          	mv	a1,s0
    441c:	01810513          	addi	a0,sp,24
    4420:	ffffe097          	auipc	ra,0xffffe
    4424:	7ec080e7          	jalr	2028(ra) # 2c0c <fatfs_entry_lfn_exists>
    4428:	0c050063          	beqz	a0,44e8 <fatfs_list_directory_next+0x194>
    442c:	01810513          	addi	a0,sp,24
    4430:	ffffe097          	auipc	ra,0xffffe
    4434:	758080e7          	jalr	1880(ra) # 2b88 <fatfs_lfn_cache_get>
    4438:	00050593          	mv	a1,a0
    443c:	10300613          	li	a2,259
    4440:	00098513          	mv	a0,s3
    4444:	ffffe097          	auipc	ra,0xffffe
    4448:	9ac080e7          	jalr	-1620(ra) # 1df0 <strncpy>
    444c:	00040513          	mv	a0,s0
    4450:	fffff097          	auipc	ra,0xfffff
    4454:	84c080e7          	jalr	-1972(ra) # 2c9c <fatfs_entry_is_dir>
    4458:	10a98223          	sb	a0,260(s3)
    445c:	01d44783          	lbu	a5,29(s0)
    4460:	01c44703          	lbu	a4,28(s0)
    4464:	00148493          	addi	s1,s1,1
    4468:	00879793          	slli	a5,a5,0x8
    446c:	00e7e7b3          	or	a5,a5,a4
    4470:	01e44703          	lbu	a4,30(s0)
    4474:	00100513          	li	a0,1
    4478:	01071713          	slli	a4,a4,0x10
    447c:	00f76733          	or	a4,a4,a5
    4480:	01f44783          	lbu	a5,31(s0)
    4484:	01879793          	slli	a5,a5,0x18
    4488:	00e7e7b3          	or	a5,a5,a4
    448c:	10f9a623          	sw	a5,268(s3)
    4490:	01544783          	lbu	a5,21(s0)
    4494:	01444703          	lbu	a4,20(s0)
    4498:	01a44683          	lbu	a3,26(s0)
    449c:	00879793          	slli	a5,a5,0x8
    44a0:	00e7e7b3          	or	a5,a5,a4
    44a4:	01b44703          	lbu	a4,27(s0)
    44a8:	01079793          	slli	a5,a5,0x10
    44ac:	00871713          	slli	a4,a4,0x8
    44b0:	00d76733          	or	a4,a4,a3
    44b4:	00e7e7b3          	or	a5,a5,a4
    44b8:	10f9a423          	sw	a5,264(s3)
    44bc:	00990423          	sb	s1,8(s2)
    44c0:	13c12083          	lw	ra,316(sp)
    44c4:	13812403          	lw	s0,312(sp)
    44c8:	13412483          	lw	s1,308(sp)
    44cc:	13012903          	lw	s2,304(sp)
    44d0:	12c12983          	lw	s3,300(sp)
    44d4:	12812a03          	lw	s4,296(sp)
    44d8:	12412a83          	lw	s5,292(sp)
    44dc:	12012b03          	lw	s6,288(sp)
    44e0:	14010113          	addi	sp,sp,320
    44e4:	00008067          	ret
    44e8:	00040513          	mv	a0,s0
    44ec:	ffffe097          	auipc	ra,0xffffe
    44f0:	770080e7          	jalr	1904(ra) # 2c5c <fatfs_entry_sfn_only>
    44f4:	ee050ee3          	beqz	a0,43f0 <fatfs_list_directory_next+0x9c>
    44f8:	00810a13          	addi	s4,sp,8
    44fc:	00d00613          	li	a2,13
    4500:	00000593          	li	a1,0
    4504:	000a0513          	mv	a0,s4
    4508:	10010ea3          	sb	zero,285(sp)
    450c:	ffffe097          	auipc	ra,0xffffe
    4510:	844080e7          	jalr	-1980(ra) # 1d50 <memset>
    4514:	00000793          	li	a5,0
    4518:	00800713          	li	a4,8
    451c:	00f40633          	add	a2,s0,a5
    4520:	00064603          	lbu	a2,0(a2)
    4524:	00fa06b3          	add	a3,s4,a5
    4528:	00178793          	addi	a5,a5,1
    452c:	00c68023          	sb	a2,0(a3)
    4530:	fee796e3          	bne	a5,a4,451c <fatfs_list_directory_next+0x1c8>
    4534:	00844783          	lbu	a5,8(s0)
    4538:	00944703          	lbu	a4,9(s0)
    453c:	00a44683          	lbu	a3,10(s0)
    4540:	00f108a3          	sb	a5,17(sp)
    4544:	00e10923          	sb	a4,18(sp)
    4548:	fe078793          	addi	a5,a5,-32
    454c:	fe070713          	addi	a4,a4,-32
    4550:	00f037b3          	snez	a5,a5
    4554:	00e03733          	snez	a4,a4
    4558:	00d109a3          	sb	a3,19(sp)
    455c:	00e7e7b3          	or	a5,a5,a4
    4560:	00079863          	bnez	a5,4570 <fatfs_list_directory_next+0x21c>
    4564:	fe068693          	addi	a3,a3,-32
    4568:	02000793          	li	a5,32
    456c:	00068a63          	beqz	a3,4580 <fatfs_list_directory_next+0x22c>
    4570:	00814703          	lbu	a4,8(sp)
    4574:	02e00793          	li	a5,46
    4578:	00f71463          	bne	a4,a5,4580 <fatfs_list_directory_next+0x22c>
    457c:	02000793          	li	a5,32
    4580:	000a0593          	mv	a1,s4
    4584:	00098513          	mv	a0,s3
    4588:	00f10823          	sb	a5,16(sp)
    458c:	fffff097          	auipc	ra,0xfffff
    4590:	054080e7          	jalr	84(ra) # 35e0 <fatfs_get_sfn_display_name>
    4594:	eb9ff06f          	j	444c <fatfs_list_directory_next+0xf8>

00004598 <fl_readdir>:
    4598:	000067b7          	lui	a5,0x6
    459c:	f147a783          	lw	a5,-236(a5) # 5f14 <_filelib_init>
    45a0:	fd010113          	addi	sp,sp,-48
    45a4:	03212023          	sw	s2,32(sp)
    45a8:	01312e23          	sw	s3,28(sp)
    45ac:	02112623          	sw	ra,44(sp)
    45b0:	02812423          	sw	s0,40(sp)
    45b4:	02912223          	sw	s1,36(sp)
    45b8:	00050913          	mv	s2,a0
    45bc:	00058993          	mv	s3,a1
    45c0:	00079663          	bnez	a5,45cc <fl_readdir+0x34>
    45c4:	ffffe097          	auipc	ra,0xffffe
    45c8:	390080e7          	jalr	912(ra) # 2954 <fl_init>
    45cc:	000084b7          	lui	s1,0x8
    45d0:	b3448413          	addi	s0,s1,-1228 # 7b34 <_fs>
    45d4:	03c42783          	lw	a5,60(s0)
    45d8:	00078463          	beqz	a5,45e0 <fl_readdir+0x48>
    45dc:	000780e7          	jalr	a5
    45e0:	00098613          	mv	a2,s3
    45e4:	00090593          	mv	a1,s2
    45e8:	b3448513          	addi	a0,s1,-1228
    45ec:	00000097          	auipc	ra,0x0
    45f0:	d68080e7          	jalr	-664(ra) # 4354 <fatfs_list_directory_next>
    45f4:	04042783          	lw	a5,64(s0)
    45f8:	00078863          	beqz	a5,4608 <fl_readdir+0x70>
    45fc:	00a12623          	sw	a0,12(sp)
    4600:	000780e7          	jalr	a5
    4604:	00c12503          	lw	a0,12(sp)
    4608:	02c12083          	lw	ra,44(sp)
    460c:	02812403          	lw	s0,40(sp)
    4610:	00154513          	xori	a0,a0,1
    4614:	02412483          	lw	s1,36(sp)
    4618:	02012903          	lw	s2,32(sp)
    461c:	01c12983          	lw	s3,28(sp)
    4620:	40a00533          	neg	a0,a0
    4624:	03010113          	addi	sp,sp,48
    4628:	00008067          	ret

0000462c <_read_sectors>:
    462c:	fd010113          	addi	sp,sp,-48
    4630:	01512a23          	sw	s5,20(sp)
    4634:	00008ab7          	lui	s5,0x8
    4638:	01312e23          	sw	s3,28(sp)
    463c:	b34ac983          	lbu	s3,-1228(s5) # 7b34 <_fs>
    4640:	01612823          	sw	s6,16(sp)
    4644:	00058b13          	mv	s6,a1
    4648:	02912223          	sw	s1,36(sp)
    464c:	00098593          	mv	a1,s3
    4650:	00050493          	mv	s1,a0
    4654:	000b0513          	mv	a0,s6
    4658:	02112623          	sw	ra,44(sp)
    465c:	02812423          	sw	s0,40(sp)
    4660:	01412c23          	sw	s4,24(sp)
    4664:	00068413          	mv	s0,a3
    4668:	01712623          	sw	s7,12(sp)
    466c:	01812423          	sw	s8,8(sp)
    4670:	03212023          	sw	s2,32(sp)
    4674:	00060c13          	mv	s8,a2
    4678:	ffffd097          	auipc	ra,0xffffd
    467c:	62c080e7          	jalr	1580(ra) # 1ca4 <__udivsi3>
    4680:	00050a13          	mv	s4,a0
    4684:	00098593          	mv	a1,s3
    4688:	000b0513          	mv	a0,s6
    468c:	ffffd097          	auipc	ra,0xffffd
    4690:	660080e7          	jalr	1632(ra) # 1cec <__umodsi3>
    4694:	00a407b3          	add	a5,s0,a0
    4698:	00050b93          	mv	s7,a0
    469c:	00f9fe63          	bgeu	s3,a5,46b8 <_read_sectors+0x8c>
    46a0:	000a0593          	mv	a1,s4
    46a4:	00098513          	mv	a0,s3
    46a8:	ffffe097          	auipc	ra,0xffffe
    46ac:	e18080e7          	jalr	-488(ra) # 24c0 <__mulsi3>
    46b0:	416987b3          	sub	a5,s3,s6
    46b4:	00f50433          	add	s0,a0,a5
    46b8:	2284a903          	lw	s2,552(s1)
    46bc:	07491863          	bne	s2,s4,472c <_read_sectors+0x100>
    46c0:	22c4a583          	lw	a1,556(s1)
    46c4:	fff00793          	li	a5,-1
    46c8:	02f58663          	beq	a1,a5,46f4 <_read_sectors+0xc8>
    46cc:	b34a8513          	addi	a0,s5,-1228
    46d0:	ffffe097          	auipc	ra,0xffffe
    46d4:	154080e7          	jalr	340(ra) # 2824 <fatfs_lba_of_cluster>
    46d8:	017505b3          	add	a1,a0,s7
    46dc:	00040693          	mv	a3,s0
    46e0:	000c0613          	mv	a2,s8
    46e4:	b34a8513          	addi	a0,s5,-1228
    46e8:	ffffe097          	auipc	ra,0xffffe
    46ec:	188080e7          	jalr	392(ra) # 2870 <fatfs_sector_read>
    46f0:	00051463          	bnez	a0,46f8 <_read_sectors+0xcc>
    46f4:	00000413          	li	s0,0
    46f8:	02c12083          	lw	ra,44(sp)
    46fc:	00040513          	mv	a0,s0
    4700:	02812403          	lw	s0,40(sp)
    4704:	02412483          	lw	s1,36(sp)
    4708:	02012903          	lw	s2,32(sp)
    470c:	01c12983          	lw	s3,28(sp)
    4710:	01812a03          	lw	s4,24(sp)
    4714:	01412a83          	lw	s5,20(sp)
    4718:	01012b03          	lw	s6,16(sp)
    471c:	00c12b83          	lw	s7,12(sp)
    4720:	00812c03          	lw	s8,8(sp)
    4724:	03010113          	addi	sp,sp,48
    4728:	00008067          	ret
    472c:	033b6463          	bltu	s6,s3,4754 <_read_sectors+0x128>
    4730:	00190793          	addi	a5,s2,1
    4734:	03479063          	bne	a5,s4,4754 <_read_sectors+0x128>
    4738:	22c4a583          	lw	a1,556(s1)
    473c:	03496263          	bltu	s2,s4,4760 <_read_sectors+0x134>
    4740:	fff00793          	li	a5,-1
    4744:	faf588e3          	beq	a1,a5,46f4 <_read_sectors+0xc8>
    4748:	22b4a623          	sw	a1,556(s1)
    474c:	2344a423          	sw	s4,552(s1)
    4750:	f7dff06f          	j	46cc <_read_sectors+0xa0>
    4754:	0044a583          	lw	a1,4(s1)
    4758:	00000913          	li	s2,0
    475c:	fe1ff06f          	j	473c <_read_sectors+0x110>
    4760:	b34a8513          	addi	a0,s5,-1228
    4764:	fffff097          	auipc	ra,0xfffff
    4768:	230080e7          	jalr	560(ra) # 3994 <fatfs_find_next_cluster>
    476c:	00050593          	mv	a1,a0
    4770:	00190913          	addi	s2,s2,1
    4774:	fc9ff06f          	j	473c <_read_sectors+0x110>

00004778 <fatfs_set_fs_info_next_free_cluster>:
    4778:	03052783          	lw	a5,48(a0)
    477c:	0a078463          	beqz	a5,4824 <fatfs_set_fs_info_next_free_cluster+0xac>
    4780:	fe010113          	addi	sp,sp,-32
    4784:	01c52783          	lw	a5,28(a0)
    4788:	00912a23          	sw	s1,20(sp)
    478c:	00058493          	mv	s1,a1
    4790:	01855583          	lhu	a1,24(a0)
    4794:	00812c23          	sw	s0,24(sp)
    4798:	00112e23          	sw	ra,28(sp)
    479c:	00f585b3          	add	a1,a1,a5
    47a0:	00050413          	mv	s0,a0
    47a4:	ffffe097          	auipc	ra,0xffffe
    47a8:	ed4080e7          	jalr	-300(ra) # 2678 <fatfs_fat_read_sector>
    47ac:	00050593          	mv	a1,a0
    47b0:	06050063          	beqz	a0,4810 <fatfs_set_fs_info_next_free_cluster+0x98>
    47b4:	20852783          	lw	a5,520(a0)
    47b8:	0084d713          	srli	a4,s1,0x8
    47bc:	00100613          	li	a2,1
    47c0:	1e978623          	sb	s1,492(a5)
    47c4:	20852783          	lw	a5,520(a0)
    47c8:	1ee786a3          	sb	a4,493(a5)
    47cc:	20852783          	lw	a5,520(a0)
    47d0:	0104d713          	srli	a4,s1,0x10
    47d4:	1ee78723          	sb	a4,494(a5)
    47d8:	20852783          	lw	a5,520(a0)
    47dc:	0184d713          	srli	a4,s1,0x18
    47e0:	1ee787a3          	sb	a4,495(a5)
    47e4:	03842783          	lw	a5,56(s0)
    47e8:	20c52223          	sw	a2,516(a0)
    47ec:	02942223          	sw	s1,36(s0)
    47f0:	00078a63          	beqz	a5,4804 <fatfs_set_fs_info_next_free_cluster+0x8c>
    47f4:	20052503          	lw	a0,512(a0)
    47f8:	00b12623          	sw	a1,12(sp)
    47fc:	000780e7          	jalr	a5
    4800:	00c12583          	lw	a1,12(sp)
    4804:	fff00793          	li	a5,-1
    4808:	20f5a023          	sw	a5,512(a1)
    480c:	2005a223          	sw	zero,516(a1)
    4810:	01c12083          	lw	ra,28(sp)
    4814:	01812403          	lw	s0,24(sp)
    4818:	01412483          	lw	s1,20(sp)
    481c:	02010113          	addi	sp,sp,32
    4820:	00008067          	ret
    4824:	00008067          	ret

00004828 <fatfs_find_blank_cluster>:
    4828:	fd010113          	addi	sp,sp,-48
    482c:	01312e23          	sw	s3,28(sp)
    4830:	100009b7          	lui	s3,0x10000
    4834:	02912223          	sw	s1,36(sp)
    4838:	03212023          	sw	s2,32(sp)
    483c:	02112623          	sw	ra,44(sp)
    4840:	02812423          	sw	s0,40(sp)
    4844:	00050913          	mv	s2,a0
    4848:	00058493          	mv	s1,a1
    484c:	fff98993          	addi	s3,s3,-1 # fffffff <__stacktop+0xffeffff>
    4850:	03092783          	lw	a5,48(s2)
    4854:	0074d413          	srli	s0,s1,0x7
    4858:	00079463          	bnez	a5,4860 <fatfs_find_blank_cluster+0x38>
    485c:	0084d413          	srli	s0,s1,0x8
    4860:	02092783          	lw	a5,32(s2)
    4864:	0cf47863          	bgeu	s0,a5,4934 <fatfs_find_blank_cluster+0x10c>
    4868:	01492583          	lw	a1,20(s2)
    486c:	00090513          	mv	a0,s2
    4870:	00c12623          	sw	a2,12(sp)
    4874:	00b405b3          	add	a1,s0,a1
    4878:	ffffe097          	auipc	ra,0xffffe
    487c:	e00080e7          	jalr	-512(ra) # 2678 <fatfs_fat_read_sector>
    4880:	0a050a63          	beqz	a0,4934 <fatfs_find_blank_cluster+0x10c>
    4884:	03092783          	lw	a5,48(s2)
    4888:	20852703          	lw	a4,520(a0)
    488c:	00c12603          	lw	a2,12(sp)
    4890:	04079a63          	bnez	a5,48e4 <fatfs_find_blank_cluster+0xbc>
    4894:	00841413          	slli	s0,s0,0x8
    4898:	40848433          	sub	s0,s1,s0
    489c:	00141413          	slli	s0,s0,0x1
    48a0:	01041413          	slli	s0,s0,0x10
    48a4:	01045413          	srli	s0,s0,0x10
    48a8:	00870733          	add	a4,a4,s0
    48ac:	00174783          	lbu	a5,1(a4)
    48b0:	00074703          	lbu	a4,0(a4)
    48b4:	00879793          	slli	a5,a5,0x8
    48b8:	00e787b3          	add	a5,a5,a4
    48bc:	06079863          	bnez	a5,492c <fatfs_find_blank_cluster+0x104>
    48c0:	00962023          	sw	s1,0(a2)
    48c4:	00100513          	li	a0,1
    48c8:	02c12083          	lw	ra,44(sp)
    48cc:	02812403          	lw	s0,40(sp)
    48d0:	02412483          	lw	s1,36(sp)
    48d4:	02012903          	lw	s2,32(sp)
    48d8:	01c12983          	lw	s3,28(sp)
    48dc:	03010113          	addi	sp,sp,48
    48e0:	00008067          	ret
    48e4:	00741413          	slli	s0,s0,0x7
    48e8:	40848433          	sub	s0,s1,s0
    48ec:	00241413          	slli	s0,s0,0x2
    48f0:	01041413          	slli	s0,s0,0x10
    48f4:	01045413          	srli	s0,s0,0x10
    48f8:	00870733          	add	a4,a4,s0
    48fc:	00374783          	lbu	a5,3(a4)
    4900:	00274683          	lbu	a3,2(a4)
    4904:	01879793          	slli	a5,a5,0x18
    4908:	01069693          	slli	a3,a3,0x10
    490c:	00d787b3          	add	a5,a5,a3
    4910:	00074683          	lbu	a3,0(a4)
    4914:	00174703          	lbu	a4,1(a4)
    4918:	00d787b3          	add	a5,a5,a3
    491c:	00871713          	slli	a4,a4,0x8
    4920:	00e787b3          	add	a5,a5,a4
    4924:	0137f7b3          	and	a5,a5,s3
    4928:	f95ff06f          	j	48bc <fatfs_find_blank_cluster+0x94>
    492c:	00148493          	addi	s1,s1,1
    4930:	f21ff06f          	j	4850 <fatfs_find_blank_cluster+0x28>
    4934:	00000513          	li	a0,0
    4938:	f91ff06f          	j	48c8 <fatfs_find_blank_cluster+0xa0>

0000493c <fatfs_fat_set_cluster>:
    493c:	03052783          	lw	a5,48(a0)
    4940:	fe010113          	addi	sp,sp,-32
    4944:	00812c23          	sw	s0,24(sp)
    4948:	00912a23          	sw	s1,20(sp)
    494c:	01212823          	sw	s2,16(sp)
    4950:	00112e23          	sw	ra,28(sp)
    4954:	00050913          	mv	s2,a0
    4958:	00058413          	mv	s0,a1
    495c:	0085d493          	srli	s1,a1,0x8
    4960:	00078463          	beqz	a5,4968 <fatfs_fat_set_cluster+0x2c>
    4964:	0075d493          	srli	s1,a1,0x7
    4968:	01492583          	lw	a1,20(s2)
    496c:	00090513          	mv	a0,s2
    4970:	00c12623          	sw	a2,12(sp)
    4974:	00b485b3          	add	a1,s1,a1
    4978:	ffffe097          	auipc	ra,0xffffe
    497c:	d00080e7          	jalr	-768(ra) # 2678 <fatfs_fat_read_sector>
    4980:	00050793          	mv	a5,a0
    4984:	00000513          	li	a0,0
    4988:	04078663          	beqz	a5,49d4 <fatfs_fat_set_cluster+0x98>
    498c:	03092683          	lw	a3,48(s2)
    4990:	2087a703          	lw	a4,520(a5)
    4994:	00c12603          	lw	a2,12(sp)
    4998:	04069a63          	bnez	a3,49ec <fatfs_fat_set_cluster+0xb0>
    499c:	00849493          	slli	s1,s1,0x8
    49a0:	40940433          	sub	s0,s0,s1
    49a4:	00141413          	slli	s0,s0,0x1
    49a8:	01041413          	slli	s0,s0,0x10
    49ac:	01045413          	srli	s0,s0,0x10
    49b0:	00870733          	add	a4,a4,s0
    49b4:	00c70023          	sb	a2,0(a4)
    49b8:	2087a703          	lw	a4,520(a5)
    49bc:	00865613          	srli	a2,a2,0x8
    49c0:	00870733          	add	a4,a4,s0
    49c4:	00c700a3          	sb	a2,1(a4)
    49c8:	00100713          	li	a4,1
    49cc:	20e7a223          	sw	a4,516(a5)
    49d0:	00100513          	li	a0,1
    49d4:	01c12083          	lw	ra,28(sp)
    49d8:	01812403          	lw	s0,24(sp)
    49dc:	01412483          	lw	s1,20(sp)
    49e0:	01012903          	lw	s2,16(sp)
    49e4:	02010113          	addi	sp,sp,32
    49e8:	00008067          	ret
    49ec:	00749493          	slli	s1,s1,0x7
    49f0:	40940433          	sub	s0,s0,s1
    49f4:	00241413          	slli	s0,s0,0x2
    49f8:	01041413          	slli	s0,s0,0x10
    49fc:	01045413          	srli	s0,s0,0x10
    4a00:	00870733          	add	a4,a4,s0
    4a04:	00c70023          	sb	a2,0(a4)
    4a08:	2087a703          	lw	a4,520(a5)
    4a0c:	00865693          	srli	a3,a2,0x8
    4a10:	00870733          	add	a4,a4,s0
    4a14:	00d700a3          	sb	a3,1(a4)
    4a18:	2087a703          	lw	a4,520(a5)
    4a1c:	01065693          	srli	a3,a2,0x10
    4a20:	01865613          	srli	a2,a2,0x18
    4a24:	00870733          	add	a4,a4,s0
    4a28:	00d70123          	sb	a3,2(a4)
    4a2c:	2087a703          	lw	a4,520(a5)
    4a30:	00870733          	add	a4,a4,s0
    4a34:	00c701a3          	sb	a2,3(a4)
    4a38:	f91ff06f          	j	49c8 <fatfs_fat_set_cluster+0x8c>

00004a3c <fatfs_free_cluster_chain>:
    4a3c:	fe010113          	addi	sp,sp,-32
    4a40:	00812c23          	sw	s0,24(sp)
    4a44:	00912a23          	sw	s1,20(sp)
    4a48:	00112e23          	sw	ra,28(sp)
    4a4c:	01212823          	sw	s2,16(sp)
    4a50:	00050493          	mv	s1,a0
    4a54:	ffd00413          	li	s0,-3
    4a58:	fff58793          	addi	a5,a1,-1
    4a5c:	02f47063          	bgeu	s0,a5,4a7c <fatfs_free_cluster_chain+0x40>
    4a60:	01c12083          	lw	ra,28(sp)
    4a64:	01812403          	lw	s0,24(sp)
    4a68:	01412483          	lw	s1,20(sp)
    4a6c:	01012903          	lw	s2,16(sp)
    4a70:	00100513          	li	a0,1
    4a74:	02010113          	addi	sp,sp,32
    4a78:	00008067          	ret
    4a7c:	00048513          	mv	a0,s1
    4a80:	00b12623          	sw	a1,12(sp)
    4a84:	fffff097          	auipc	ra,0xfffff
    4a88:	f10080e7          	jalr	-240(ra) # 3994 <fatfs_find_next_cluster>
    4a8c:	00c12583          	lw	a1,12(sp)
    4a90:	00050913          	mv	s2,a0
    4a94:	00000613          	li	a2,0
    4a98:	00048513          	mv	a0,s1
    4a9c:	00000097          	auipc	ra,0x0
    4aa0:	ea0080e7          	jalr	-352(ra) # 493c <fatfs_fat_set_cluster>
    4aa4:	00090593          	mv	a1,s2
    4aa8:	fb1ff06f          	j	4a58 <fatfs_free_cluster_chain+0x1c>

00004aac <fatfs_fat_add_cluster_to_chain>:
    4aac:	fd010113          	addi	sp,sp,-48
    4ab0:	02912223          	sw	s1,36(sp)
    4ab4:	02112623          	sw	ra,44(sp)
    4ab8:	02812423          	sw	s0,40(sp)
    4abc:	03212023          	sw	s2,32(sp)
    4ac0:	01312e23          	sw	s3,28(sp)
    4ac4:	fff00493          	li	s1,-1
    4ac8:	02959263          	bne	a1,s1,4aec <fatfs_fat_add_cluster_to_chain+0x40>
    4acc:	00000513          	li	a0,0
    4ad0:	02c12083          	lw	ra,44(sp)
    4ad4:	02812403          	lw	s0,40(sp)
    4ad8:	02412483          	lw	s1,36(sp)
    4adc:	02012903          	lw	s2,32(sp)
    4ae0:	01c12983          	lw	s3,28(sp)
    4ae4:	03010113          	addi	sp,sp,48
    4ae8:	00008067          	ret
    4aec:	00050913          	mv	s2,a0
    4af0:	00058413          	mv	s0,a1
    4af4:	00060993          	mv	s3,a2
    4af8:	00040593          	mv	a1,s0
    4afc:	00090513          	mv	a0,s2
    4b00:	00812623          	sw	s0,12(sp)
    4b04:	fffff097          	auipc	ra,0xfffff
    4b08:	e90080e7          	jalr	-368(ra) # 3994 <fatfs_find_next_cluster>
    4b0c:	00050413          	mv	s0,a0
    4b10:	fa050ee3          	beqz	a0,4acc <fatfs_fat_add_cluster_to_chain+0x20>
    4b14:	00c12583          	lw	a1,12(sp)
    4b18:	fe9510e3          	bne	a0,s1,4af8 <fatfs_fat_add_cluster_to_chain+0x4c>
    4b1c:	00098613          	mv	a2,s3
    4b20:	00090513          	mv	a0,s2
    4b24:	00000097          	auipc	ra,0x0
    4b28:	e18080e7          	jalr	-488(ra) # 493c <fatfs_fat_set_cluster>
    4b2c:	00040613          	mv	a2,s0
    4b30:	00098593          	mv	a1,s3
    4b34:	00090513          	mv	a0,s2
    4b38:	00000097          	auipc	ra,0x0
    4b3c:	e04080e7          	jalr	-508(ra) # 493c <fatfs_fat_set_cluster>
    4b40:	00100513          	li	a0,1
    4b44:	f8dff06f          	j	4ad0 <fatfs_fat_add_cluster_to_chain+0x24>

00004b48 <fatfs_add_free_space>:
    4b48:	02452783          	lw	a5,36(a0)
    4b4c:	fd010113          	addi	sp,sp,-48
    4b50:	02812423          	sw	s0,40(sp)
    4b54:	01312e23          	sw	s3,28(sp)
    4b58:	01412c23          	sw	s4,24(sp)
    4b5c:	0005a983          	lw	s3,0(a1)
    4b60:	01512a23          	sw	s5,20(sp)
    4b64:	00058a13          	mv	s4,a1
    4b68:	02112623          	sw	ra,44(sp)
    4b6c:	02912223          	sw	s1,36(sp)
    4b70:	03212023          	sw	s2,32(sp)
    4b74:	fff00593          	li	a1,-1
    4b78:	00050413          	mv	s0,a0
    4b7c:	00060a93          	mv	s5,a2
    4b80:	00b78663          	beq	a5,a1,4b8c <fatfs_add_free_space+0x44>
    4b84:	00000097          	auipc	ra,0x0
    4b88:	bf4080e7          	jalr	-1036(ra) # 4778 <fatfs_set_fs_info_next_free_cluster>
    4b8c:	00000493          	li	s1,0
    4b90:	03549663          	bne	s1,s5,4bbc <fatfs_add_free_space+0x74>
    4b94:	00100513          	li	a0,1
    4b98:	02c12083          	lw	ra,44(sp)
    4b9c:	02812403          	lw	s0,40(sp)
    4ba0:	02412483          	lw	s1,36(sp)
    4ba4:	02012903          	lw	s2,32(sp)
    4ba8:	01c12983          	lw	s3,28(sp)
    4bac:	01812a03          	lw	s4,24(sp)
    4bb0:	01412a83          	lw	s5,20(sp)
    4bb4:	03010113          	addi	sp,sp,48
    4bb8:	00008067          	ret
    4bbc:	00842583          	lw	a1,8(s0)
    4bc0:	00c10613          	addi	a2,sp,12
    4bc4:	00040513          	mv	a0,s0
    4bc8:	00000097          	auipc	ra,0x0
    4bcc:	c60080e7          	jalr	-928(ra) # 4828 <fatfs_find_blank_cluster>
    4bd0:	fc0504e3          	beqz	a0,4b98 <fatfs_add_free_space+0x50>
    4bd4:	00c12903          	lw	s2,12(sp)
    4bd8:	00098593          	mv	a1,s3
    4bdc:	00040513          	mv	a0,s0
    4be0:	00090613          	mv	a2,s2
    4be4:	00000097          	auipc	ra,0x0
    4be8:	d58080e7          	jalr	-680(ra) # 493c <fatfs_fat_set_cluster>
    4bec:	fff00613          	li	a2,-1
    4bf0:	00090593          	mv	a1,s2
    4bf4:	00040513          	mv	a0,s0
    4bf8:	00000097          	auipc	ra,0x0
    4bfc:	d44080e7          	jalr	-700(ra) # 493c <fatfs_fat_set_cluster>
    4c00:	00049463          	bnez	s1,4c08 <fatfs_add_free_space+0xc0>
    4c04:	012a2023          	sw	s2,0(s4)
    4c08:	00148493          	addi	s1,s1,1
    4c0c:	00090993          	mv	s3,s2
    4c10:	f81ff06f          	j	4b90 <fatfs_add_free_space+0x48>

00004c14 <_write_sectors>:
    4c14:	fb010113          	addi	sp,sp,-80
    4c18:	03512a23          	sw	s5,52(sp)
    4c1c:	00008ab7          	lui	s5,0x8
    4c20:	04112623          	sw	ra,76(sp)
    4c24:	04812423          	sw	s0,72(sp)
    4c28:	04912223          	sw	s1,68(sp)
    4c2c:	03412c23          	sw	s4,56(sp)
    4c30:	03612823          	sw	s6,48(sp)
    4c34:	03712623          	sw	s7,44(sp)
    4c38:	03812423          	sw	s8,40(sp)
    4c3c:	03912223          	sw	s9,36(sp)
    4c40:	03a12023          	sw	s10,32(sp)
    4c44:	05212023          	sw	s2,64(sp)
    4c48:	03312e23          	sw	s3,60(sp)
    4c4c:	b34a8b93          	addi	s7,s5,-1228 # 7b34 <_fs>
    4c50:	000bc983          	lbu	s3,0(s7)
    4c54:	00058b13          	mv	s6,a1
    4c58:	fff00793          	li	a5,-1
    4c5c:	00098593          	mv	a1,s3
    4c60:	00050493          	mv	s1,a0
    4c64:	000b0513          	mv	a0,s6
    4c68:	00068c13          	mv	s8,a3
    4c6c:	00f12e23          	sw	a5,28(sp)
    4c70:	00060d13          	mv	s10,a2
    4c74:	ffffd097          	auipc	ra,0xffffd
    4c78:	030080e7          	jalr	48(ra) # 1ca4 <__udivsi3>
    4c7c:	00050a13          	mv	s4,a0
    4c80:	00098593          	mv	a1,s3
    4c84:	000b0513          	mv	a0,s6
    4c88:	ffffd097          	auipc	ra,0xffffd
    4c8c:	064080e7          	jalr	100(ra) # 1cec <__umodsi3>
    4c90:	00ac07b3          	add	a5,s8,a0
    4c94:	00050c93          	mv	s9,a0
    4c98:	000c0413          	mv	s0,s8
    4c9c:	00f9fe63          	bgeu	s3,a5,4cb8 <_write_sectors+0xa4>
    4ca0:	000a0593          	mv	a1,s4
    4ca4:	00098513          	mv	a0,s3
    4ca8:	ffffe097          	auipc	ra,0xffffe
    4cac:	818080e7          	jalr	-2024(ra) # 24c0 <__mulsi3>
    4cb0:	416987b3          	sub	a5,s3,s6
    4cb4:	00f50433          	add	s0,a0,a5
    4cb8:	2284a903          	lw	s2,552(s1)
    4cbc:	03491a63          	bne	s2,s4,4cf0 <_write_sectors+0xdc>
    4cc0:	22c4a583          	lw	a1,556(s1)
    4cc4:	b34a8513          	addi	a0,s5,-1228
    4cc8:	ffffe097          	auipc	ra,0xffffe
    4ccc:	b5c080e7          	jalr	-1188(ra) # 2824 <fatfs_lba_of_cluster>
    4cd0:	019505b3          	add	a1,a0,s9
    4cd4:	00040693          	mv	a3,s0
    4cd8:	000d0613          	mv	a2,s10
    4cdc:	b34a8513          	addi	a0,s5,-1228
    4ce0:	ffffe097          	auipc	ra,0xffffe
    4ce4:	ba8080e7          	jalr	-1112(ra) # 2888 <fatfs_sector_write>
    4ce8:	04050a63          	beqz	a0,4d3c <_write_sectors+0x128>
    4cec:	0540006f          	j	4d40 <_write_sectors+0x12c>
    4cf0:	093b6663          	bltu	s6,s3,4d7c <_write_sectors+0x168>
    4cf4:	00190793          	addi	a5,s2,1
    4cf8:	09479263          	bne	a5,s4,4d7c <_write_sectors+0x168>
    4cfc:	22c4a583          	lw	a1,556(s1)
    4d00:	fff00b13          	li	s6,-1
    4d04:	09496263          	bltu	s2,s4,4d88 <_write_sectors+0x174>
    4d08:	fff00793          	li	a5,-1
    4d0c:	0af59463          	bne	a1,a5,4db4 <_write_sectors+0x1a0>
    4d10:	000bc583          	lbu	a1,0(s7)
    4d14:	fff58513          	addi	a0,a1,-1
    4d18:	01850533          	add	a0,a0,s8
    4d1c:	ffffd097          	auipc	ra,0xffffd
    4d20:	f88080e7          	jalr	-120(ra) # 1ca4 <__udivsi3>
    4d24:	00050613          	mv	a2,a0
    4d28:	01c10593          	addi	a1,sp,28
    4d2c:	000b8513          	mv	a0,s7
    4d30:	00000097          	auipc	ra,0x0
    4d34:	e18080e7          	jalr	-488(ra) # 4b48 <fatfs_add_free_space>
    4d38:	06051c63          	bnez	a0,4db0 <_write_sectors+0x19c>
    4d3c:	00000413          	li	s0,0
    4d40:	04c12083          	lw	ra,76(sp)
    4d44:	00040513          	mv	a0,s0
    4d48:	04812403          	lw	s0,72(sp)
    4d4c:	04412483          	lw	s1,68(sp)
    4d50:	04012903          	lw	s2,64(sp)
    4d54:	03c12983          	lw	s3,60(sp)
    4d58:	03812a03          	lw	s4,56(sp)
    4d5c:	03412a83          	lw	s5,52(sp)
    4d60:	03012b03          	lw	s6,48(sp)
    4d64:	02c12b83          	lw	s7,44(sp)
    4d68:	02812c03          	lw	s8,40(sp)
    4d6c:	02412c83          	lw	s9,36(sp)
    4d70:	02012d03          	lw	s10,32(sp)
    4d74:	05010113          	addi	sp,sp,80
    4d78:	00008067          	ret
    4d7c:	0044a583          	lw	a1,4(s1)
    4d80:	00000913          	li	s2,0
    4d84:	f7dff06f          	j	4d00 <_write_sectors+0xec>
    4d88:	b34a8513          	addi	a0,s5,-1228
    4d8c:	00b12623          	sw	a1,12(sp)
    4d90:	fffff097          	auipc	ra,0xfffff
    4d94:	c04080e7          	jalr	-1020(ra) # 3994 <fatfs_find_next_cluster>
    4d98:	00c12583          	lw	a1,12(sp)
    4d9c:	00b12e23          	sw	a1,28(sp)
    4da0:	f76508e3          	beq	a0,s6,4d10 <_write_sectors+0xfc>
    4da4:	00190913          	addi	s2,s2,1
    4da8:	00050593          	mv	a1,a0
    4dac:	f59ff06f          	j	4d04 <_write_sectors+0xf0>
    4db0:	01c12583          	lw	a1,28(sp)
    4db4:	22b4a623          	sw	a1,556(s1)
    4db8:	2344a423          	sw	s4,552(s1)
    4dbc:	f09ff06f          	j	4cc4 <_write_sectors+0xb0>

00004dc0 <fl_fflush>:
    4dc0:	000067b7          	lui	a5,0x6
    4dc4:	f147a783          	lw	a5,-236(a5) # 5f14 <_filelib_init>
    4dc8:	ff010113          	addi	sp,sp,-16
    4dcc:	00812423          	sw	s0,8(sp)
    4dd0:	00112623          	sw	ra,12(sp)
    4dd4:	00912223          	sw	s1,4(sp)
    4dd8:	00050413          	mv	s0,a0
    4ddc:	00079663          	bnez	a5,4de8 <fl_fflush+0x28>
    4de0:	ffffe097          	auipc	ra,0xffffe
    4de4:	b74080e7          	jalr	-1164(ra) # 2954 <fl_init>
    4de8:	04040663          	beqz	s0,4e34 <fl_fflush+0x74>
    4dec:	000084b7          	lui	s1,0x8
    4df0:	b3448493          	addi	s1,s1,-1228 # 7b34 <_fs>
    4df4:	03c4a783          	lw	a5,60(s1)
    4df8:	00078463          	beqz	a5,4e00 <fl_fflush+0x40>
    4dfc:	000780e7          	jalr	a5
    4e00:	43442783          	lw	a5,1076(s0)
    4e04:	02078263          	beqz	a5,4e28 <fl_fflush+0x68>
    4e08:	43042583          	lw	a1,1072(s0)
    4e0c:	00100693          	li	a3,1
    4e10:	23040613          	addi	a2,s0,560
    4e14:	00040513          	mv	a0,s0
    4e18:	00000097          	auipc	ra,0x0
    4e1c:	dfc080e7          	jalr	-516(ra) # 4c14 <_write_sectors>
    4e20:	00050463          	beqz	a0,4e28 <fl_fflush+0x68>
    4e24:	42042a23          	sw	zero,1076(s0)
    4e28:	0404a783          	lw	a5,64(s1)
    4e2c:	00078463          	beqz	a5,4e34 <fl_fflush+0x74>
    4e30:	000780e7          	jalr	a5
    4e34:	00c12083          	lw	ra,12(sp)
    4e38:	00812403          	lw	s0,8(sp)
    4e3c:	00412483          	lw	s1,4(sp)
    4e40:	00000513          	li	a0,0
    4e44:	01010113          	addi	sp,sp,16
    4e48:	00008067          	ret

00004e4c <fl_fclose>:
    4e4c:	000067b7          	lui	a5,0x6
    4e50:	f147a783          	lw	a5,-236(a5) # 5f14 <_filelib_init>
    4e54:	ff010113          	addi	sp,sp,-16
    4e58:	00812423          	sw	s0,8(sp)
    4e5c:	00112623          	sw	ra,12(sp)
    4e60:	00912223          	sw	s1,4(sp)
    4e64:	01212023          	sw	s2,0(sp)
    4e68:	00050413          	mv	s0,a0
    4e6c:	00079663          	bnez	a5,4e78 <fl_fclose+0x2c>
    4e70:	ffffe097          	auipc	ra,0xffffe
    4e74:	ae4080e7          	jalr	-1308(ra) # 2954 <fl_init>
    4e78:	08040c63          	beqz	s0,4f10 <fl_fclose+0xc4>
    4e7c:	000084b7          	lui	s1,0x8
    4e80:	b3448913          	addi	s2,s1,-1228 # 7b34 <_fs>
    4e84:	03c92783          	lw	a5,60(s2)
    4e88:	00078463          	beqz	a5,4e90 <fl_fclose+0x44>
    4e8c:	000780e7          	jalr	a5
    4e90:	00040513          	mv	a0,s0
    4e94:	00000097          	auipc	ra,0x0
    4e98:	f2c080e7          	jalr	-212(ra) # 4dc0 <fl_fflush>
    4e9c:	01042783          	lw	a5,16(s0)
    4ea0:	00078e63          	beqz	a5,4ebc <fl_fclose+0x70>
    4ea4:	00c42683          	lw	a3,12(s0)
    4ea8:	00042583          	lw	a1,0(s0)
    4eac:	21c40613          	addi	a2,s0,540
    4eb0:	b3448513          	addi	a0,s1,-1228
    4eb4:	fffff097          	auipc	ra,0xfffff
    4eb8:	338080e7          	jalr	824(ra) # 41ec <fatfs_update_file_length>
    4ebc:	fff00793          	li	a5,-1
    4ec0:	42f42823          	sw	a5,1072(s0)
    4ec4:	00040513          	mv	a0,s0
    4ec8:	00042423          	sw	zero,8(s0)
    4ecc:	00042623          	sw	zero,12(s0)
    4ed0:	00042223          	sw	zero,4(s0)
    4ed4:	42042a23          	sw	zero,1076(s0)
    4ed8:	00042823          	sw	zero,16(s0)
    4edc:	ffffe097          	auipc	ra,0xffffe
    4ee0:	900080e7          	jalr	-1792(ra) # 27dc <_free_file>
    4ee4:	b3448513          	addi	a0,s1,-1228
    4ee8:	fffff097          	auipc	ra,0xfffff
    4eec:	a54080e7          	jalr	-1452(ra) # 393c <fatfs_fat_purge>
    4ef0:	04092783          	lw	a5,64(s2)
    4ef4:	00078e63          	beqz	a5,4f10 <fl_fclose+0xc4>
    4ef8:	00812403          	lw	s0,8(sp)
    4efc:	00c12083          	lw	ra,12(sp)
    4f00:	00412483          	lw	s1,4(sp)
    4f04:	00012903          	lw	s2,0(sp)
    4f08:	01010113          	addi	sp,sp,16
    4f0c:	00078067          	jr	a5
    4f10:	00c12083          	lw	ra,12(sp)
    4f14:	00812403          	lw	s0,8(sp)
    4f18:	00412483          	lw	s1,4(sp)
    4f1c:	00012903          	lw	s2,0(sp)
    4f20:	01010113          	addi	sp,sp,16
    4f24:	00008067          	ret

00004f28 <fl_fread>:
    4f28:	000067b7          	lui	a5,0x6
    4f2c:	f147a783          	lw	a5,-236(a5) # 5f14 <_filelib_init>
    4f30:	fc010113          	addi	sp,sp,-64
    4f34:	02812c23          	sw	s0,56(sp)
    4f38:	03512223          	sw	s5,36(sp)
    4f3c:	02112e23          	sw	ra,60(sp)
    4f40:	02912a23          	sw	s1,52(sp)
    4f44:	03212823          	sw	s2,48(sp)
    4f48:	03312623          	sw	s3,44(sp)
    4f4c:	03412423          	sw	s4,40(sp)
    4f50:	03612023          	sw	s6,32(sp)
    4f54:	01712e23          	sw	s7,28(sp)
    4f58:	01812c23          	sw	s8,24(sp)
    4f5c:	01912a23          	sw	s9,20(sp)
    4f60:	00050a93          	mv	s5,a0
    4f64:	00068413          	mv	s0,a3
    4f68:	00058513          	mv	a0,a1
    4f6c:	00079e63          	bnez	a5,4f88 <fl_fread+0x60>
    4f70:	00c12623          	sw	a2,12(sp)
    4f74:	00b12423          	sw	a1,8(sp)
    4f78:	ffffe097          	auipc	ra,0xffffe
    4f7c:	9dc080e7          	jalr	-1572(ra) # 2954 <fl_init>
    4f80:	00c12603          	lw	a2,12(sp)
    4f84:	00812503          	lw	a0,8(sp)
    4f88:	14040e63          	beqz	s0,50e4 <fl_fread+0x1bc>
    4f8c:	140a8c63          	beqz	s5,50e4 <fl_fread+0x1bc>
    4f90:	43844783          	lbu	a5,1080(s0)
    4f94:	fff00493          	li	s1,-1
    4f98:	0017f793          	andi	a5,a5,1
    4f9c:	04078863          	beqz	a5,4fec <fl_fread+0xc4>
    4fa0:	00060593          	mv	a1,a2
    4fa4:	ffffd097          	auipc	ra,0xffffd
    4fa8:	51c080e7          	jalr	1308(ra) # 24c0 <__mulsi3>
    4fac:	00050493          	mv	s1,a0
    4fb0:	02050e63          	beqz	a0,4fec <fl_fread+0xc4>
    4fb4:	00842583          	lw	a1,8(s0)
    4fb8:	00c42783          	lw	a5,12(s0)
    4fbc:	12f5f463          	bgeu	a1,a5,50e4 <fl_fread+0x1bc>
    4fc0:	00b50733          	add	a4,a0,a1
    4fc4:	00e7f463          	bgeu	a5,a4,4fcc <fl_fread+0xa4>
    4fc8:	40b784b3          	sub	s1,a5,a1
    4fcc:	0095da13          	srli	s4,a1,0x9
    4fd0:	1ff5f913          	andi	s2,a1,511
    4fd4:	00000993          	li	s3,0
    4fd8:	23040b13          	addi	s6,s0,560
    4fdc:	20000b93          	li	s7,512
    4fe0:	1ff00c13          	li	s8,511
    4fe4:	0499c063          	blt	s3,s1,5024 <fl_fread+0xfc>
    4fe8:	00098493          	mv	s1,s3
    4fec:	03c12083          	lw	ra,60(sp)
    4ff0:	03812403          	lw	s0,56(sp)
    4ff4:	03012903          	lw	s2,48(sp)
    4ff8:	02c12983          	lw	s3,44(sp)
    4ffc:	02812a03          	lw	s4,40(sp)
    5000:	02412a83          	lw	s5,36(sp)
    5004:	02012b03          	lw	s6,32(sp)
    5008:	01c12b83          	lw	s7,28(sp)
    500c:	01812c03          	lw	s8,24(sp)
    5010:	01412c83          	lw	s9,20(sp)
    5014:	00048513          	mv	a0,s1
    5018:	03412483          	lw	s1,52(sp)
    501c:	04010113          	addi	sp,sp,64
    5020:	00008067          	ret
    5024:	04091663          	bnez	s2,5070 <fl_fread+0x148>
    5028:	413486b3          	sub	a3,s1,s3
    502c:	04dc5263          	bge	s8,a3,5070 <fl_fread+0x148>
    5030:	4096d693          	srai	a3,a3,0x9
    5034:	013a8633          	add	a2,s5,s3
    5038:	000a0593          	mv	a1,s4
    503c:	00040513          	mv	a0,s0
    5040:	fffff097          	auipc	ra,0xfffff
    5044:	5ec080e7          	jalr	1516(ra) # 462c <_read_sectors>
    5048:	fa0500e3          	beqz	a0,4fe8 <fl_fread+0xc0>
    504c:	00951c93          	slli	s9,a0,0x9
    5050:	000c8613          	mv	a2,s9
    5054:	00aa0a33          	add	s4,s4,a0
    5058:	00842783          	lw	a5,8(s0)
    505c:	00c989b3          	add	s3,s3,a2
    5060:	00000913          	li	s2,0
    5064:	019787b3          	add	a5,a5,s9
    5068:	00f42423          	sw	a5,8(s0)
    506c:	f79ff06f          	j	4fe4 <fl_fread+0xbc>
    5070:	43042783          	lw	a5,1072(s0)
    5074:	03478e63          	beq	a5,s4,50b0 <fl_fread+0x188>
    5078:	43442783          	lw	a5,1076(s0)
    507c:	00078863          	beqz	a5,508c <fl_fread+0x164>
    5080:	00040513          	mv	a0,s0
    5084:	00000097          	auipc	ra,0x0
    5088:	d3c080e7          	jalr	-708(ra) # 4dc0 <fl_fflush>
    508c:	00100693          	li	a3,1
    5090:	000b0613          	mv	a2,s6
    5094:	000a0593          	mv	a1,s4
    5098:	00040513          	mv	a0,s0
    509c:	fffff097          	auipc	ra,0xfffff
    50a0:	590080e7          	jalr	1424(ra) # 462c <_read_sectors>
    50a4:	f40502e3          	beqz	a0,4fe8 <fl_fread+0xc0>
    50a8:	43442823          	sw	s4,1072(s0)
    50ac:	42042a23          	sw	zero,1076(s0)
    50b0:	412b87b3          	sub	a5,s7,s2
    50b4:	41348633          	sub	a2,s1,s3
    50b8:	00c7d463          	bge	a5,a2,50c0 <fl_fread+0x198>
    50bc:	00078613          	mv	a2,a5
    50c0:	012b05b3          	add	a1,s6,s2
    50c4:	013a8533          	add	a0,s5,s3
    50c8:	00060c93          	mv	s9,a2
    50cc:	00c12423          	sw	a2,8(sp)
    50d0:	ffffd097          	auipc	ra,0xffffd
    50d4:	c9c080e7          	jalr	-868(ra) # 1d6c <memcpy>
    50d8:	00812603          	lw	a2,8(sp)
    50dc:	001a0a13          	addi	s4,s4,1
    50e0:	f79ff06f          	j	5058 <fl_fread+0x130>
    50e4:	fff00493          	li	s1,-1
    50e8:	f05ff06f          	j	4fec <fl_fread+0xc4>

000050ec <fatfs_allocate_free_space>:
    50ec:	fd010113          	addi	sp,sp,-48
    50f0:	02112623          	sw	ra,44(sp)
    50f4:	02812423          	sw	s0,40(sp)
    50f8:	02912223          	sw	s1,36(sp)
    50fc:	03212023          	sw	s2,32(sp)
    5100:	01312e23          	sw	s3,28(sp)
    5104:	01412c23          	sw	s4,24(sp)
    5108:	01512a23          	sw	s5,20(sp)
    510c:	02069863          	bnez	a3,513c <fatfs_allocate_free_space+0x50>
    5110:	00000413          	li	s0,0
    5114:	02c12083          	lw	ra,44(sp)
    5118:	00040513          	mv	a0,s0
    511c:	02812403          	lw	s0,40(sp)
    5120:	02412483          	lw	s1,36(sp)
    5124:	02012903          	lw	s2,32(sp)
    5128:	01c12983          	lw	s3,28(sp)
    512c:	01812a03          	lw	s4,24(sp)
    5130:	01412a83          	lw	s5,20(sp)
    5134:	03010113          	addi	sp,sp,48
    5138:	00008067          	ret
    513c:	02452783          	lw	a5,36(a0)
    5140:	00058a13          	mv	s4,a1
    5144:	fff00593          	li	a1,-1
    5148:	00050493          	mv	s1,a0
    514c:	00068913          	mv	s2,a3
    5150:	00060993          	mv	s3,a2
    5154:	00b78663          	beq	a5,a1,5160 <fatfs_allocate_free_space+0x74>
    5158:	fffff097          	auipc	ra,0xfffff
    515c:	620080e7          	jalr	1568(ra) # 4778 <fatfs_set_fs_info_next_free_cluster>
    5160:	0004c783          	lbu	a5,0(s1)
    5164:	00090513          	mv	a0,s2
    5168:	00979a93          	slli	s5,a5,0x9
    516c:	000a8593          	mv	a1,s5
    5170:	ffffd097          	auipc	ra,0xffffd
    5174:	b34080e7          	jalr	-1228(ra) # 1ca4 <__udivsi3>
    5178:	00050413          	mv	s0,a0
    517c:	00050593          	mv	a1,a0
    5180:	000a8513          	mv	a0,s5
    5184:	ffffd097          	auipc	ra,0xffffd
    5188:	33c080e7          	jalr	828(ra) # 24c0 <__mulsi3>
    518c:	41250533          	sub	a0,a0,s2
    5190:	00a03533          	snez	a0,a0
    5194:	00a40933          	add	s2,s0,a0
    5198:	040a0463          	beqz	s4,51e0 <fatfs_allocate_free_space+0xf4>
    519c:	0084a583          	lw	a1,8(s1)
    51a0:	00c10613          	addi	a2,sp,12
    51a4:	00048513          	mv	a0,s1
    51a8:	fffff097          	auipc	ra,0xfffff
    51ac:	680080e7          	jalr	1664(ra) # 4828 <fatfs_find_blank_cluster>
    51b0:	00050413          	mv	s0,a0
    51b4:	f4050ee3          	beqz	a0,5110 <fatfs_allocate_free_space+0x24>
    51b8:	00100793          	li	a5,1
    51bc:	02f91663          	bne	s2,a5,51e8 <fatfs_allocate_free_space+0xfc>
    51c0:	00c12903          	lw	s2,12(sp)
    51c4:	fff00613          	li	a2,-1
    51c8:	00048513          	mv	a0,s1
    51cc:	00090593          	mv	a1,s2
    51d0:	fffff097          	auipc	ra,0xfffff
    51d4:	76c080e7          	jalr	1900(ra) # 493c <fatfs_fat_set_cluster>
    51d8:	0129a023          	sw	s2,0(s3)
    51dc:	f39ff06f          	j	5114 <fatfs_allocate_free_space+0x28>
    51e0:	0009a783          	lw	a5,0(s3)
    51e4:	00f12623          	sw	a5,12(sp)
    51e8:	00090613          	mv	a2,s2
    51ec:	00c10593          	addi	a1,sp,12
    51f0:	00048513          	mv	a0,s1
    51f4:	00000097          	auipc	ra,0x0
    51f8:	954080e7          	jalr	-1708(ra) # 4b48 <fatfs_add_free_space>
    51fc:	00050413          	mv	s0,a0
    5200:	f15ff06f          	j	5114 <fatfs_allocate_free_space+0x28>

00005204 <fatfs_add_file_entry>:
    5204:	03852883          	lw	a7,56(a0)
    5208:	30088e63          	beqz	a7,5524 <fatfs_add_file_entry+0x320>
    520c:	f8010113          	addi	sp,sp,-128
    5210:	06812c23          	sw	s0,120(sp)
    5214:	00050413          	mv	s0,a0
    5218:	00060513          	mv	a0,a2
    521c:	06912a23          	sw	s1,116(sp)
    5220:	07512223          	sw	s5,100(sp)
    5224:	00f12c23          	sw	a5,24(sp)
    5228:	00e12a23          	sw	a4,20(sp)
    522c:	06112e23          	sw	ra,124(sp)
    5230:	07212823          	sw	s2,112(sp)
    5234:	07312623          	sw	s3,108(sp)
    5238:	07412423          	sw	s4,104(sp)
    523c:	07612023          	sw	s6,96(sp)
    5240:	05712e23          	sw	s7,92(sp)
    5244:	05812c23          	sw	s8,88(sp)
    5248:	05912a23          	sw	s9,84(sp)
    524c:	05a12823          	sw	s10,80(sp)
    5250:	05b12623          	sw	s11,76(sp)
    5254:	01012e23          	sw	a6,28(sp)
    5258:	00068a93          	mv	s5,a3
    525c:	00c12823          	sw	a2,16(sp)
    5260:	00b12423          	sw	a1,8(sp)
    5264:	ffffe097          	auipc	ra,0xffffe
    5268:	a48080e7          	jalr	-1464(ra) # 2cac <fatfs_lfn_entries_required>
    526c:	00150713          	addi	a4,a0,1
    5270:	00100793          	li	a5,1
    5274:	00050493          	mv	s1,a0
    5278:	2ae7f263          	bgeu	a5,a4,551c <fatfs_add_file_entry+0x318>
    527c:	00000a13          	li	s4,0
    5280:	00000993          	li	s3,0
    5284:	00000913          	li	s2,0
    5288:	00000c93          	li	s9,0
    528c:	00000b13          	li	s6,0
    5290:	01000c13          	li	s8,16
    5294:	00812583          	lw	a1,8(sp)
    5298:	00000693          	li	a3,0
    529c:	000b0613          	mv	a2,s6
    52a0:	00040513          	mv	a0,s0
    52a4:	000b0b93          	mv	s7,s6
    52a8:	ffffe097          	auipc	ra,0xffffe
    52ac:	7f4080e7          	jalr	2036(ra) # 3a9c <fatfs_sector_reader>
    52b0:	18050463          	beqz	a0,5438 <fatfs_add_file_entry+0x234>
    52b4:	001b0b13          	addi	s6,s6,1
    52b8:	04440793          	addi	a5,s0,68
    52bc:	000c8d13          	mv	s10,s9
    52c0:	00000d93          	li	s11,0
    52c4:	00078513          	mv	a0,a5
    52c8:	00f12623          	sw	a5,12(sp)
    52cc:	ffffe097          	auipc	ra,0xffffe
    52d0:	8f8080e7          	jalr	-1800(ra) # 2bc4 <fatfs_entry_lfn_text>
    52d4:	00c12783          	lw	a5,12(sp)
    52d8:	00050c93          	mv	s9,a0
    52dc:	02050c63          	beqz	a0,5314 <fatfs_add_file_entry+0x110>
    52e0:	020d0463          	beqz	s10,5308 <fatfs_add_file_entry+0x104>
    52e4:	00090c93          	mv	s9,s2
    52e8:	000c8913          	mv	s2,s9
    52ec:	001d0c93          	addi	s9,s10,1
    52f0:	001d8d93          	addi	s11,s11,1
    52f4:	0ffdfd93          	zext.b	s11,s11
    52f8:	02078793          	addi	a5,a5,32
    52fc:	f98d8ce3          	beq	s11,s8,5294 <fatfs_add_file_entry+0x90>
    5300:	000c8d13          	mv	s10,s9
    5304:	fc1ff06f          	j	52c4 <fatfs_add_file_entry+0xc0>
    5308:	000d8a13          	mv	s4,s11
    530c:	000b8993          	mv	s3,s7
    5310:	fd9ff06f          	j	52e8 <fatfs_add_file_entry+0xe4>
    5314:	0007c683          	lbu	a3,0(a5)
    5318:	0e500713          	li	a4,229
    531c:	10e69863          	bne	a3,a4,542c <fatfs_add_file_entry+0x228>
    5320:	000d1863          	bnez	s10,5330 <fatfs_add_file_entry+0x12c>
    5324:	000d8a13          	mv	s4,s11
    5328:	000b8993          	mv	s3,s7
    532c:	00100913          	li	s2,1
    5330:	fa9d4ee3          	blt	s10,s1,52ec <fatfs_add_file_entry+0xe8>
    5334:	00ba8693          	addi	a3,s5,11
    5338:	000a8713          	mv	a4,s5
    533c:	00000913          	li	s2,0
    5340:	00074603          	lbu	a2,0(a4)
    5344:	00195793          	srli	a5,s2,0x1
    5348:	00791913          	slli	s2,s2,0x7
    534c:	012787b3          	add	a5,a5,s2
    5350:	00170713          	addi	a4,a4,1
    5354:	00c787b3          	add	a5,a5,a2
    5358:	0ff7f913          	zext.b	s2,a5
    535c:	fed712e3          	bne	a4,a3,5340 <fatfs_add_file_entry+0x13c>
    5360:	00098b13          	mv	s6,s3
    5364:	00000d13          	li	s10,0
    5368:	01000b93          	li	s7,16
    536c:	00812583          	lw	a1,8(sp)
    5370:	00000693          	li	a3,0
    5374:	000b0613          	mv	a2,s6
    5378:	00040513          	mv	a0,s0
    537c:	ffffe097          	auipc	ra,0xffffe
    5380:	720080e7          	jalr	1824(ra) # 3a9c <fatfs_sector_reader>
    5384:	18050c63          	beqz	a0,551c <fatfs_add_file_entry+0x318>
    5388:	04440c93          	addi	s9,s0,68
    538c:	413b0db3          	sub	s11,s6,s3
    5390:	00000793          	li	a5,0
    5394:	00000c13          	li	s8,0
    5398:	01912623          	sw	s9,12(sp)
    539c:	000d1663          	bnez	s10,53a8 <fatfs_add_file_entry+0x1a4>
    53a0:	154c1863          	bne	s8,s4,54f0 <fatfs_add_file_entry+0x2ec>
    53a4:	140d9663          	bnez	s11,54f0 <fatfs_add_file_entry+0x2ec>
    53a8:	12049263          	bnez	s1,54cc <fatfs_add_file_entry+0x2c8>
    53ac:	01c12703          	lw	a4,28(sp)
    53b0:	01412603          	lw	a2,20(sp)
    53b4:	01812583          	lw	a1,24(sp)
    53b8:	02010693          	addi	a3,sp,32
    53bc:	000a8513          	mv	a0,s5
    53c0:	ffffe097          	auipc	ra,0xffffe
    53c4:	a30080e7          	jalr	-1488(ra) # 2df0 <fatfs_sfn_create_entry>
    53c8:	02000613          	li	a2,32
    53cc:	00c105b3          	add	a1,sp,a2
    53d0:	000c8513          	mv	a0,s9
    53d4:	ffffd097          	auipc	ra,0xffffd
    53d8:	998080e7          	jalr	-1640(ra) # 1d6c <memcpy>
    53dc:	03842783          	lw	a5,56(s0)
    53e0:	00c12583          	lw	a1,12(sp)
    53e4:	24442503          	lw	a0,580(s0)
    53e8:	00100613          	li	a2,1
    53ec:	000780e7          	jalr	a5
    53f0:	07c12083          	lw	ra,124(sp)
    53f4:	07812403          	lw	s0,120(sp)
    53f8:	07412483          	lw	s1,116(sp)
    53fc:	07012903          	lw	s2,112(sp)
    5400:	06c12983          	lw	s3,108(sp)
    5404:	06812a03          	lw	s4,104(sp)
    5408:	06412a83          	lw	s5,100(sp)
    540c:	06012b03          	lw	s6,96(sp)
    5410:	05c12b83          	lw	s7,92(sp)
    5414:	05812c03          	lw	s8,88(sp)
    5418:	05412c83          	lw	s9,84(sp)
    541c:	05012d03          	lw	s10,80(sp)
    5420:	04c12d83          	lw	s11,76(sp)
    5424:	08010113          	addi	sp,sp,128
    5428:	00008067          	ret
    542c:	ee068ae3          	beqz	a3,5320 <fatfs_add_file_entry+0x11c>
    5430:	00000913          	li	s2,0
    5434:	ebdff06f          	j	52f0 <fatfs_add_file_entry+0xec>
    5438:	00842583          	lw	a1,8(s0)
    543c:	02010613          	addi	a2,sp,32
    5440:	00040513          	mv	a0,s0
    5444:	fffff097          	auipc	ra,0xfffff
    5448:	3e4080e7          	jalr	996(ra) # 4828 <fatfs_find_blank_cluster>
    544c:	0c050863          	beqz	a0,551c <fatfs_add_file_entry+0x318>
    5450:	02012b83          	lw	s7,32(sp)
    5454:	00812583          	lw	a1,8(sp)
    5458:	00040513          	mv	a0,s0
    545c:	000b8613          	mv	a2,s7
    5460:	fffff097          	auipc	ra,0xfffff
    5464:	64c080e7          	jalr	1612(ra) # 4aac <fatfs_fat_add_cluster_to_chain>
    5468:	0a050a63          	beqz	a0,551c <fatfs_add_file_entry+0x318>
    546c:	20000613          	li	a2,512
    5470:	00000593          	li	a1,0
    5474:	04440513          	addi	a0,s0,68
    5478:	ffffd097          	auipc	ra,0xffffd
    547c:	8d8080e7          	jalr	-1832(ra) # 1d50 <memset>
    5480:	00000c13          	li	s8,0
    5484:	00044783          	lbu	a5,0(s0)
    5488:	00fc6a63          	bltu	s8,a5,549c <fatfs_add_file_entry+0x298>
    548c:	ea0914e3          	bnez	s2,5334 <fatfs_add_file_entry+0x130>
    5490:	000b0993          	mv	s3,s6
    5494:	00000a13          	li	s4,0
    5498:	e9dff06f          	j	5334 <fatfs_add_file_entry+0x130>
    549c:	00000693          	li	a3,0
    54a0:	000c0613          	mv	a2,s8
    54a4:	000b8593          	mv	a1,s7
    54a8:	00040513          	mv	a0,s0
    54ac:	ffffd097          	auipc	ra,0xffffd
    54b0:	3f4080e7          	jalr	1012(ra) # 28a0 <fatfs_write_sector>
    54b4:	06050463          	beqz	a0,551c <fatfs_add_file_entry+0x318>
    54b8:	001c0c13          	addi	s8,s8,1
    54bc:	0ffc7c13          	zext.b	s8,s8
    54c0:	fc5ff06f          	j	5484 <fatfs_add_file_entry+0x280>
    54c4:	001b0b13          	addi	s6,s6,1
    54c8:	ea5ff06f          	j	536c <fatfs_add_file_entry+0x168>
    54cc:	01012503          	lw	a0,16(sp)
    54d0:	fff48493          	addi	s1,s1,-1
    54d4:	00090693          	mv	a3,s2
    54d8:	00048613          	mv	a2,s1
    54dc:	000c8593          	mv	a1,s9
    54e0:	ffffd097          	auipc	ra,0xffffd
    54e4:	7fc080e7          	jalr	2044(ra) # 2cdc <fatfs_filename_to_lfn>
    54e8:	00100d13          	li	s10,1
    54ec:	000d0793          	mv	a5,s10
    54f0:	001c0c13          	addi	s8,s8,1
    54f4:	0ffc7c13          	zext.b	s8,s8
    54f8:	020c8c93          	addi	s9,s9,32
    54fc:	eb7c10e3          	bne	s8,s7,539c <fatfs_add_file_entry+0x198>
    5500:	fc0782e3          	beqz	a5,54c4 <fatfs_add_file_entry+0x2c0>
    5504:	03842783          	lw	a5,56(s0)
    5508:	00c12583          	lw	a1,12(sp)
    550c:	24442503          	lw	a0,580(s0)
    5510:	00100613          	li	a2,1
    5514:	000780e7          	jalr	a5
    5518:	fa0516e3          	bnez	a0,54c4 <fatfs_add_file_entry+0x2c0>
    551c:	00000513          	li	a0,0
    5520:	ed1ff06f          	j	53f0 <fatfs_add_file_entry+0x1ec>
    5524:	00000513          	li	a0,0
    5528:	00008067          	ret

0000552c <fl_fopen>:
    552c:	000067b7          	lui	a5,0x6
    5530:	f147a783          	lw	a5,-236(a5) # 5f14 <_filelib_init>
    5534:	fa010113          	addi	sp,sp,-96
    5538:	05212823          	sw	s2,80(sp)
    553c:	03a12823          	sw	s10,48(sp)
    5540:	04112e23          	sw	ra,92(sp)
    5544:	04812c23          	sw	s0,88(sp)
    5548:	04912a23          	sw	s1,84(sp)
    554c:	05312623          	sw	s3,76(sp)
    5550:	05412423          	sw	s4,72(sp)
    5554:	05512223          	sw	s5,68(sp)
    5558:	05612023          	sw	s6,64(sp)
    555c:	03712e23          	sw	s7,60(sp)
    5560:	03812c23          	sw	s8,56(sp)
    5564:	03912a23          	sw	s9,52(sp)
    5568:	00050d13          	mv	s10,a0
    556c:	00058913          	mv	s2,a1
    5570:	00079663          	bnez	a5,557c <fl_fopen+0x50>
    5574:	ffffd097          	auipc	ra,0xffffd
    5578:	3e0080e7          	jalr	992(ra) # 2954 <fl_init>
    557c:	000067b7          	lui	a5,0x6
    5580:	f107a783          	lw	a5,-240(a5) # 5f10 <_filelib_valid>
    5584:	00193713          	seqz	a4,s2
    5588:	0017b793          	seqz	a5,a5
    558c:	00e7e7b3          	or	a5,a5,a4
    5590:	36079e63          	bnez	a5,590c <fl_fopen+0x3e0>
    5594:	360d0c63          	beqz	s10,590c <fl_fopen+0x3e0>
    5598:	00000493          	li	s1,0
    559c:	00000413          	li	s0,0
    55a0:	05700993          	li	s3,87
    55a4:	07200a13          	li	s4,114
    55a8:	07700b13          	li	s6,119
    55ac:	06100b93          	li	s7,97
    55b0:	06200c13          	li	s8,98
    55b4:	04100a93          	li	s5,65
    55b8:	04200c93          	li	s9,66
    55bc:	00090513          	mv	a0,s2
    55c0:	ffffc097          	auipc	ra,0xffffc
    55c4:	7d0080e7          	jalr	2000(ra) # 1d90 <strlen>
    55c8:	10a44a63          	blt	s0,a0,56dc <fl_fopen+0x1b0>
    55cc:	000089b7          	lui	s3,0x8
    55d0:	b3498a13          	addi	s4,s3,-1228 # 7b34 <_fs>
    55d4:	038a2783          	lw	a5,56(s4)
    55d8:	00079463          	bnez	a5,55e0 <fl_fopen+0xb4>
    55dc:	fd94f493          	andi	s1,s1,-39
    55e0:	03ca2783          	lw	a5,60(s4)
    55e4:	00078463          	beqz	a5,55ec <fl_fopen+0xc0>
    55e8:	000780e7          	jalr	a5
    55ec:	0014f793          	andi	a5,s1,1
    55f0:	18079263          	bnez	a5,5774 <fl_fopen+0x248>
    55f4:	0204f793          	andi	a5,s1,32
    55f8:	08078c63          	beqz	a5,5690 <fl_fopen+0x164>
    55fc:	038a2783          	lw	a5,56(s4)
    5600:	06078a63          	beqz	a5,5674 <fl_fopen+0x148>
    5604:	ffffd097          	auipc	ra,0xffffd
    5608:	160080e7          	jalr	352(ra) # 2764 <_allocate_file>
    560c:	00050413          	mv	s0,a0
    5610:	06050263          	beqz	a0,5674 <fl_fopen+0x148>
    5614:	01450a93          	addi	s5,a0,20
    5618:	10400613          	li	a2,260
    561c:	00000593          	li	a1,0
    5620:	000a8513          	mv	a0,s5
    5624:	ffffc097          	auipc	ra,0xffffc
    5628:	72c080e7          	jalr	1836(ra) # 1d50 <memset>
    562c:	11840b13          	addi	s6,s0,280
    5630:	10400613          	li	a2,260
    5634:	00000593          	li	a1,0
    5638:	000b0513          	mv	a0,s6
    563c:	ffffc097          	auipc	ra,0xffffc
    5640:	714080e7          	jalr	1812(ra) # 1d50 <memset>
    5644:	10400713          	li	a4,260
    5648:	000b0693          	mv	a3,s6
    564c:	00070613          	mv	a2,a4
    5650:	000a8593          	mv	a1,s5
    5654:	000d0513          	mv	a0,s10
    5658:	ffffe097          	auipc	ra,0xffffe
    565c:	c88080e7          	jalr	-888(ra) # 32e0 <fatfs_split_path>
    5660:	fff00793          	li	a5,-1
    5664:	12f51663          	bne	a0,a5,5790 <fl_fopen+0x264>
    5668:	00040513          	mv	a0,s0
    566c:	ffffd097          	auipc	ra,0xffffd
    5670:	170080e7          	jalr	368(ra) # 27dc <_free_file>
    5674:	00000413          	li	s0,0
    5678:	0214f793          	andi	a5,s1,33
    567c:	02000713          	li	a4,32
    5680:	28e79263          	bne	a5,a4,5904 <fl_fopen+0x3d8>
    5684:	10041263          	bnez	s0,5788 <fl_fopen+0x25c>
    5688:	0064f793          	andi	a5,s1,6
    568c:	26079463          	bnez	a5,58f4 <fl_fopen+0x3c8>
    5690:	00000413          	li	s0,0
    5694:	040a2783          	lw	a5,64(s4)
    5698:	00078463          	beqz	a5,56a0 <fl_fopen+0x174>
    569c:	000780e7          	jalr	a5
    56a0:	05c12083          	lw	ra,92(sp)
    56a4:	00040513          	mv	a0,s0
    56a8:	05812403          	lw	s0,88(sp)
    56ac:	05412483          	lw	s1,84(sp)
    56b0:	05012903          	lw	s2,80(sp)
    56b4:	04c12983          	lw	s3,76(sp)
    56b8:	04812a03          	lw	s4,72(sp)
    56bc:	04412a83          	lw	s5,68(sp)
    56c0:	04012b03          	lw	s6,64(sp)
    56c4:	03c12b83          	lw	s7,60(sp)
    56c8:	03812c03          	lw	s8,56(sp)
    56cc:	03412c83          	lw	s9,52(sp)
    56d0:	03012d03          	lw	s10,48(sp)
    56d4:	06010113          	addi	sp,sp,96
    56d8:	00008067          	ret
    56dc:	008907b3          	add	a5,s2,s0
    56e0:	0007c783          	lbu	a5,0(a5)
    56e4:	05378863          	beq	a5,s3,5734 <fl_fopen+0x208>
    56e8:	02f9e863          	bltu	s3,a5,5718 <fl_fopen+0x1ec>
    56ec:	05578863          	beq	a5,s5,573c <fl_fopen+0x210>
    56f0:	00faea63          	bltu	s5,a5,5704 <fl_fopen+0x1d8>
    56f4:	02b00713          	li	a4,43
    56f8:	04e78663          	beq	a5,a4,5744 <fl_fopen+0x218>
    56fc:	00140413          	addi	s0,s0,1
    5700:	ebdff06f          	j	55bc <fl_fopen+0x90>
    5704:	03978263          	beq	a5,s9,5728 <fl_fopen+0x1fc>
    5708:	05200713          	li	a4,82
    570c:	fee798e3          	bne	a5,a4,56fc <fl_fopen+0x1d0>
    5710:	0014e493          	ori	s1,s1,1
    5714:	fe9ff06f          	j	56fc <fl_fopen+0x1d0>
    5718:	ff478ce3          	beq	a5,s4,5710 <fl_fopen+0x1e4>
    571c:	00fa6a63          	bltu	s4,a5,5730 <fl_fopen+0x204>
    5720:	01778e63          	beq	a5,s7,573c <fl_fopen+0x210>
    5724:	fd879ce3          	bne	a5,s8,56fc <fl_fopen+0x1d0>
    5728:	0084e493          	ori	s1,s1,8
    572c:	fd1ff06f          	j	56fc <fl_fopen+0x1d0>
    5730:	fd6796e3          	bne	a5,s6,56fc <fl_fopen+0x1d0>
    5734:	0324e493          	ori	s1,s1,50
    5738:	fc5ff06f          	j	56fc <fl_fopen+0x1d0>
    573c:	0264e493          	ori	s1,s1,38
    5740:	fbdff06f          	j	56fc <fl_fopen+0x1d0>
    5744:	0014f793          	andi	a5,s1,1
    5748:	00078663          	beqz	a5,5754 <fl_fopen+0x228>
    574c:	0024e493          	ori	s1,s1,2
    5750:	fadff06f          	j	56fc <fl_fopen+0x1d0>
    5754:	0024f793          	andi	a5,s1,2
    5758:	00078663          	beqz	a5,5764 <fl_fopen+0x238>
    575c:	0314e493          	ori	s1,s1,49
    5760:	f9dff06f          	j	56fc <fl_fopen+0x1d0>
    5764:	0044f793          	andi	a5,s1,4
    5768:	f8078ae3          	beqz	a5,56fc <fl_fopen+0x1d0>
    576c:	0274e493          	ori	s1,s1,39
    5770:	f8dff06f          	j	56fc <fl_fopen+0x1d0>
    5774:	000d0513          	mv	a0,s10
    5778:	fffff097          	auipc	ra,0xfffff
    577c:	81c080e7          	jalr	-2020(ra) # 3f94 <_open_file>
    5780:	00050413          	mv	s0,a0
    5784:	e60508e3          	beqz	a0,55f4 <fl_fopen+0xc8>
    5788:	42940c23          	sb	s1,1080(s0)
    578c:	f09ff06f          	j	5694 <fl_fopen+0x168>
    5790:	00040513          	mv	a0,s0
    5794:	ffffe097          	auipc	ra,0xffffe
    5798:	dc8080e7          	jalr	-568(ra) # 355c <_check_file_open>
    579c:	00050913          	mv	s2,a0
    57a0:	ec0514e3          	bnez	a0,5668 <fl_fopen+0x13c>
    57a4:	01444783          	lbu	a5,20(s0)
    57a8:	0e079663          	bnez	a5,5894 <fl_fopen+0x368>
    57ac:	008a2783          	lw	a5,8(s4)
    57b0:	00f42023          	sw	a5,0(s0)
    57b4:	00042583          	lw	a1,0(s0)
    57b8:	01010693          	addi	a3,sp,16
    57bc:	000b0613          	mv	a2,s6
    57c0:	b3498513          	addi	a0,s3,-1228
    57c4:	ffffe097          	auipc	ra,0xffffe
    57c8:	428080e7          	jalr	1064(ra) # 3bec <fatfs_get_file_entry>
    57cc:	00100693          	li	a3,1
    57d0:	e8d50ce3          	beq	a0,a3,5668 <fl_fopen+0x13c>
    57d4:	00042223          	sw	zero,4(s0)
    57d8:	00440613          	addi	a2,s0,4
    57dc:	00068593          	mv	a1,a3
    57e0:	b3498513          	addi	a0,s3,-1228
    57e4:	00000097          	auipc	ra,0x0
    57e8:	908080e7          	jalr	-1784(ra) # 50ec <fatfs_allocate_free_space>
    57ec:	e6050ee3          	beqz	a0,5668 <fl_fopen+0x13c>
    57f0:	00002ab7          	lui	s5,0x2
    57f4:	21c40b93          	addi	s7,s0,540
    57f8:	b3498c13          	addi	s8,s3,-1228
    57fc:	70fa8a93          	addi	s5,s5,1807 # 270f <fatfs_fat_read_sector+0x97>
    5800:	000b0593          	mv	a1,s6
    5804:	00410513          	addi	a0,sp,4
    5808:	ffffd097          	auipc	ra,0xffffd
    580c:	68c080e7          	jalr	1676(ra) # 2e94 <fatfs_lfn_create_sfn>
    5810:	08090e63          	beqz	s2,58ac <fl_fopen+0x380>
    5814:	00090613          	mv	a2,s2
    5818:	00410593          	addi	a1,sp,4
    581c:	000b8513          	mv	a0,s7
    5820:	ffffd097          	auipc	ra,0xffffd
    5824:	7f0080e7          	jalr	2032(ra) # 3010 <fatfs_lfn_generate_tail>
    5828:	00042583          	lw	a1,0(s0)
    582c:	000b8613          	mv	a2,s7
    5830:	000c0513          	mv	a0,s8
    5834:	fffff097          	auipc	ra,0xfffff
    5838:	8d4080e7          	jalr	-1836(ra) # 4108 <fatfs_sfn_exists>
    583c:	00050663          	beqz	a0,5848 <fl_fopen+0x31c>
    5840:	00190913          	addi	s2,s2,1
    5844:	fb591ee3          	bne	s2,s5,5800 <fl_fopen+0x2d4>
    5848:	00442703          	lw	a4,4(s0)
    584c:	000027b7          	lui	a5,0x2
    5850:	70f78793          	addi	a5,a5,1807 # 270f <fatfs_fat_read_sector+0x97>
    5854:	00070593          	mv	a1,a4
    5858:	02f90663          	beq	s2,a5,5884 <fl_fopen+0x358>
    585c:	00042583          	lw	a1,0(s0)
    5860:	00000813          	li	a6,0
    5864:	00000793          	li	a5,0
    5868:	000b8693          	mv	a3,s7
    586c:	000b0613          	mv	a2,s6
    5870:	b3498513          	addi	a0,s3,-1228
    5874:	00000097          	auipc	ra,0x0
    5878:	990080e7          	jalr	-1648(ra) # 5204 <fatfs_add_file_entry>
    587c:	04051463          	bnez	a0,58c4 <fl_fopen+0x398>
    5880:	00442583          	lw	a1,4(s0)
    5884:	b3498513          	addi	a0,s3,-1228
    5888:	fffff097          	auipc	ra,0xfffff
    588c:	1b4080e7          	jalr	436(ra) # 4a3c <fatfs_free_cluster_chain>
    5890:	dd9ff06f          	j	5668 <fl_fopen+0x13c>
    5894:	00040593          	mv	a1,s0
    5898:	000a8513          	mv	a0,s5
    589c:	ffffe097          	auipc	ra,0xffffe
    58a0:	54c080e7          	jalr	1356(ra) # 3de8 <_open_directory>
    58a4:	f00518e3          	bnez	a0,57b4 <fl_fopen+0x288>
    58a8:	dc1ff06f          	j	5668 <fl_fopen+0x13c>
    58ac:	00b00613          	li	a2,11
    58b0:	00410593          	addi	a1,sp,4
    58b4:	000b8513          	mv	a0,s7
    58b8:	ffffc097          	auipc	ra,0xffffc
    58bc:	4b4080e7          	jalr	1204(ra) # 1d6c <memcpy>
    58c0:	f69ff06f          	j	5828 <fl_fopen+0x2fc>
    58c4:	fff00793          	li	a5,-1
    58c8:	00042623          	sw	zero,12(s0)
    58cc:	00042423          	sw	zero,8(s0)
    58d0:	42f42823          	sw	a5,1072(s0)
    58d4:	42042a23          	sw	zero,1076(s0)
    58d8:	00042823          	sw	zero,16(s0)
    58dc:	22f42423          	sw	a5,552(s0)
    58e0:	22f42623          	sw	a5,556(s0)
    58e4:	b3498513          	addi	a0,s3,-1228
    58e8:	ffffe097          	auipc	ra,0xffffe
    58ec:	054080e7          	jalr	84(ra) # 393c <fatfs_fat_purge>
    58f0:	d89ff06f          	j	5678 <fl_fopen+0x14c>
    58f4:	000d0513          	mv	a0,s10
    58f8:	ffffe097          	auipc	ra,0xffffe
    58fc:	69c080e7          	jalr	1692(ra) # 3f94 <_open_file>
    5900:	00050413          	mv	s0,a0
    5904:	e80412e3          	bnez	s0,5788 <fl_fopen+0x25c>
    5908:	d89ff06f          	j	5690 <fl_fopen+0x164>
    590c:	00000413          	li	s0,0
    5910:	d91ff06f          	j	56a0 <fl_fopen+0x174>

00005914 <cmd16>:
    5914:	02000050 00001500                       P.......

0000591c <acmd41>:
    591c:	00004069 00000100                       i@......

00005924 <cmd55>:
    5924:	00000077 00000100                       w.......

0000592c <cmd8>:
    592c:	01000048 000087aa                       H.......

00005934 <cmd0>:
    5934:	00000040 00009500                       @.......

0000593c <AUDIO>:
    593c:	00018000                                ....

00005940 <DISPLAY>:
    5940:	00014000                                .@..

00005944 <BUTTONS>:
    5944:	00010100                                ....

00005948 <SDCARD>:
    5948:	00010080                                ....

0000594c <OLED_RST>:
    594c:	00010010                                ....

00005950 <OLED>:
    5950:	00010008                                ....

00005954 <LEDS>:
    5954:	00010004 00006272 00000000 696c632f     ....rb....../cli
    5964:	722e6b63 00007761 3a727245 0a732520     ck.raw..Err: %s.
    5974:	00000000 79616c50 3a676e69 20732520     ....Playing: %s 
    5984:	20202020 20202020 000a2020 676d692f               ../img
    5994:	00002f73 4e202020 6f43206f 20726576     s/..   No Cover 
    59a4:	0a747241 00000000 00002e2e 0000002e     Art.............
    59b4:	0000002f 4c494620 203a5345 00000000     /... FILES: ....
    59c4:	74706d45 000a2179 5d64255b 00000020     Empty!..[%d] ...
    59d4:	203e6425 00000000 20202020 20202020     %d> ....        
    59e4:	20202020 20202020 20202020 00000a20                  ...
    59f4:	626c612f 2f736d75 00000000 53554d20     /albums/.... MUS
    5a04:	203a4349 00000000 25202020 00000a73     IC: ....   %s...
    5a14:	6f432020 676e696d 6f6f5320 000a216e       Coming Soon!..
    5a24:	656c6946 70784520 65726f6c 00000072     File Explorer...
    5a34:	79616c50 6e6f5320 00007367 4d204a44     Play Songs..DJ M
    5a44:	0065646f 203d3d3d 4e49414d 4e454d20     ode.=== MAIN MEN
    5a54:	3d3d2055 000a0a3d 2e642520 20732520     U ===... %d. %s 
    5a64:	20202020 000a2020 0000000a 656c6553           ......Sele
    5a74:	26207463 65725020 42207373 00006e74     ct & Press Btn..
    5a84:	74696e49 20445320 64726163 0a2e2e2e     Init SD card....
    5a94:	00000000 33323130 37363534 42413938     ....0123456789AB
    5aa4:	46454443 00000000 5f544146 203a5346     CDEF....FAT_FS: 
    5ab4:	6f727245 6f632072 20646c75 20746f6e     Error could not 
    5ac4:	64616f6c 54414620 74656420 736c6961     load FAT details
    5ad4:	64252820 0a0d2129 00000000               (%d)!......

00005ae0 <font>:
    5ae0:	00000000 00002f00 00030000 14000003     ...../..........
    5af0:	143e143e 3a2b6a2e 08122600 171c3224     >.>..j+:.&..$2..
    5b00:	03003415 00000000 0000211e 001e2100     .4.......!...!..
    5b10:	08220000 0822081c 0000081c 00002040     .."...".....@ ..
    5b20:	00080800 00200000 20000000 02040810     ...... .... ....
    5b30:	3f21213f 003f0100 253d0000 25002725     ?!!?..?...=%%'.%
    5b40:	003f2525 3f040407 25252700 253f003d     %%?....?.'%%=.?%
    5b50:	01003d25 00030539 3f25253f 25252700     %=..9...?%%?.'%%
    5b60:	0028003f 40000000 00000028 00110a04     ?.(....@(.......
    5b70:	00141400 0a110000 01000004 0007052d     ............-...
    5b80:	253d213f 09093f1f 253f003f 3f003c27     ?!=%.?..?.?%'<.?
    5b90:	00212121 1e21213f 25253f00 053f0025     !!!.?!!..?%%%.?.
    5ba0:	3f000505 003d2521 3f04043f 213f2100     ...?!%=.?..?.!?!
    5bb0:	20380000 3f013f21 003b0404 2020203f     ..8 !?.?..;.?   
    5bc0:	3f013f00 023f3f01 3f003f04 003f2121     .?.?.??..?.?!!?.
    5bd0:	0f09093f 31213f00 093f003f 27002f39     ?....?!1?.?.9/.'
    5be0:	003d2525 013f0101 20203f01 100f003f     %%=...?..?  ?...
    5bf0:	3f001f30 3f203f20 3b04043b 38080f00     0..? ? ?;..;...8
    5c00:	2931000f 3f002325 00000021 04081020     ..1)%#.?!... ...
    5c10:	003f2102 01020000 20000201 00000020     .!?........  ...
    5c20:	00000201 24243800 243f003c 3c003c24     .....8$$<.?$$<.<
    5c30:	00242424 3f24243c 2c2c3c00 3f04002c     $$$.<$$?.<,,,..?
    5c40:	bc000005 00fca4a4 3c04043f 00003d00     ........?..<.=..
    5c50:	fd800000 3f000000 00340808 0000003f     .......?..4.?...
    5c60:	3c043c00 043c3c04 3c003c04 003c2424     .<.<.<<..<.<$$<.
    5c70:	3c2424fc 24243c00 083c00fc 2c000004     .$$<.<$$..<....,
    5c80:	003c2c2c 00243f04 20203c00 100c003c     ,,<..?$..<  <...
    5c90:	3c001c30 3c203c20 34080834 a0a0bc00     0..< < <4..4....
    5ca0:	342400fc 0400242c 0000213f 0000003f     ..$4,$..?!..?...
    5cb0:	043f2100 02010000 00000102 00000000     .!?.............
    5cc0:	00000001 00000003 00000005 00000007     ................
    5cd0:	00000009 0000000e 00000010 00000012     ................
    5ce0:	00000014 00000016 00000018 0000001c     ................
    5cf0:	0000001e                                ....

00005cf4 <current_path>:
    5cf4:	0000002f 00000000 00000000 00000000     /...............
	...

00005ee8 <n_items>:
    5ee8:	00000000                                ....

00005eec <sdcard_while_loading_callback>:
    5eec:	00000000                                ....

00005ef0 <back_color>:
	...

00005ef1 <front_color>:
    5ef1:	                                         ...

00005ef4 <cursor_y>:
    5ef4:	00000000                                ....

00005ef8 <cursor_x>:
    5ef8:	00000000                                ....

00005efc <f_putchar>:
    5efc:	00000000                                ....

00005f00 <_free_file_list>:
	...

00005f08 <_open_file_list>:
	...

00005f10 <_filelib_valid>:
    5f10:	00000000                                ....

00005f14 <_filelib_init>:
    5f14:	00000000                                ....
