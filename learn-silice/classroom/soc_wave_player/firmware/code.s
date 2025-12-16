
code.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00010137          	lui	sp,0x10
       4:	00000097          	auipc	ra,0x0
       8:	620080e7          	jalr	1568(ra) # 624 <main>
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

00000064 <scan_files>:
      64:	fd010113          	addi	sp,sp,-48 # ffd0 <_files+0x4bf4>
      68:	02912223          	sw	s1,36(sp)
      6c:	000055b7          	lui	a1,0x5
      70:	000054b7          	lui	s1,0x5
      74:	02812423          	sw	s0,40(sp)
      78:	e3458593          	addi	a1,a1,-460 # 4e34 <LEDS+0x4>
      7c:	00005437          	lui	s0,0x5
      80:	13448513          	addi	a0,s1,308 # 5134 <current_path>
      84:	02112623          	sw	ra,44(sp)
      88:	03212023          	sw	s2,32(sp)
      8c:	01312e23          	sw	s3,28(sp)
      90:	01412c23          	sw	s4,24(sp)
      94:	01512a23          	sw	s5,20(sp)
      98:	01612823          	sw	s6,16(sp)
      9c:	01712623          	sw	s7,12(sp)
      a0:	32042423          	sw	zero,808(s0) # 5328 <n_items>
      a4:	00000097          	auipc	ra,0x0
      a8:	f78080e7          	jalr	-136(ra) # 1c <strcmp>
      ac:	06050e63          	beqz	a0,128 <scan_files+0xc4>
      b0:	00005937          	lui	s2,0x5
      b4:	06400613          	li	a2,100
      b8:	00000593          	li	a1,0
      bc:	47490513          	addi	a0,s2,1140 # 5474 <files>
      c0:	00001097          	auipc	ra,0x1
      c4:	0ec080e7          	jalr	236(ra) # 11ac <memset>
      c8:	32842783          	lw	a5,808(s0)
      cc:	47490913          	addi	s2,s2,1140
      d0:	000055b7          	lui	a1,0x5
      d4:	00379513          	slli	a0,a5,0x3
      d8:	40f50533          	sub	a0,a0,a5
      dc:	00251513          	slli	a0,a0,0x2
      e0:	40f50533          	sub	a0,a0,a5
      e4:	00251513          	slli	a0,a0,0x2
      e8:	00a90533          	add	a0,s2,a0
      ec:	e3858593          	addi	a1,a1,-456 # 4e38 <LEDS+0x8>
      f0:	00001097          	auipc	ra,0x1
      f4:	180080e7          	jalr	384(ra) # 1270 <strcpy>
      f8:	32842703          	lw	a4,808(s0)
      fc:	00371793          	slli	a5,a4,0x3
     100:	40e787b3          	sub	a5,a5,a4
     104:	00279793          	slli	a5,a5,0x2
     108:	40e787b3          	sub	a5,a5,a4
     10c:	00279793          	slli	a5,a5,0x2
     110:	00f90933          	add	s2,s2,a5
     114:	00100793          	li	a5,1
     118:	00f70733          	add	a4,a4,a5
     11c:	06092223          	sw	zero,100(s2)
     120:	06f92423          	sw	a5,104(s2)
     124:	32e42423          	sw	a4,808(s0)
     128:	000059b7          	lui	s3,0x5
     12c:	46898593          	addi	a1,s3,1128 # 5468 <dirstat.1>
     130:	13448513          	addi	a0,s1,308
     134:	00003097          	auipc	ra,0x3
     138:	278080e7          	jalr	632(ra) # 33ac <fl_opendir>
     13c:	14050063          	beqz	a0,27c <scan_files+0x218>
     140:	00005937          	lui	s2,0x5
     144:	000057b7          	lui	a5,0x5
     148:	000054b7          	lui	s1,0x5
     14c:	e3c78b93          	addi	s7,a5,-452 # 4e3c <LEDS+0xc>
     150:	47448493          	addi	s1,s1,1140 # 5474 <files>
     154:	35890a13          	addi	s4,s2,856 # 5358 <dirent.0>
     158:	35890593          	addi	a1,s2,856
     15c:	46898513          	addi	a0,s3,1128
     160:	00004097          	auipc	ra,0x4
     164:	918080e7          	jalr	-1768(ra) # 3a78 <fl_readdir>
     168:	00050a93          	mv	s5,a0
     16c:	00051863          	bnez	a0,17c <scan_files+0x118>
     170:	32842b03          	lw	s6,808(s0)
     174:	03f00793          	li	a5,63
     178:	0367dc63          	bge	a5,s6,1b0 <scan_files+0x14c>
     17c:	02812403          	lw	s0,40(sp)
     180:	02c12083          	lw	ra,44(sp)
     184:	02412483          	lw	s1,36(sp)
     188:	02012903          	lw	s2,32(sp)
     18c:	01812a03          	lw	s4,24(sp)
     190:	01412a83          	lw	s5,20(sp)
     194:	01012b03          	lw	s6,16(sp)
     198:	00c12b83          	lw	s7,12(sp)
     19c:	46898513          	addi	a0,s3,1128
     1a0:	01c12983          	lw	s3,28(sp)
     1a4:	03010113          	addi	sp,sp,48
     1a8:	00002317          	auipc	t1,0x2
     1ac:	dec30067          	jr	-532(t1) # 1f94 <fl_closedir>
     1b0:	000b8593          	mv	a1,s7
     1b4:	35890513          	addi	a0,s2,856
     1b8:	00000097          	auipc	ra,0x0
     1bc:	e64080e7          	jalr	-412(ra) # 1c <strcmp>
     1c0:	f8050ce3          	beqz	a0,158 <scan_files+0xf4>
     1c4:	000055b7          	lui	a1,0x5
     1c8:	e3858593          	addi	a1,a1,-456 # 4e38 <LEDS+0x8>
     1cc:	35890513          	addi	a0,s2,856
     1d0:	00000097          	auipc	ra,0x0
     1d4:	e4c080e7          	jalr	-436(ra) # 1c <strcmp>
     1d8:	f80500e3          	beqz	a0,158 <scan_files+0xf4>
     1dc:	003b1513          	slli	a0,s6,0x3
     1e0:	41650533          	sub	a0,a0,s6
     1e4:	00251513          	slli	a0,a0,0x2
     1e8:	41650533          	sub	a0,a0,s6
     1ec:	00251513          	slli	a0,a0,0x2
     1f0:	06400613          	li	a2,100
     1f4:	00000593          	li	a1,0
     1f8:	00a48533          	add	a0,s1,a0
     1fc:	00001097          	auipc	ra,0x1
     200:	fb0080e7          	jalr	-80(ra) # 11ac <memset>
     204:	32842703          	lw	a4,808(s0)
     208:	06300513          	li	a0,99
     20c:	00371793          	slli	a5,a4,0x3
     210:	40e786b3          	sub	a3,a5,a4
     214:	00269693          	slli	a3,a3,0x2
     218:	40e686b3          	sub	a3,a3,a4
     21c:	00269693          	slli	a3,a3,0x2
     220:	014a8633          	add	a2,s5,s4
     224:	00064583          	lbu	a1,0(a2)
     228:	00058463          	beqz	a1,230 <scan_files+0x1cc>
     22c:	02aa9e63          	bne	s5,a0,268 <scan_files+0x204>
     230:	40e787b3          	sub	a5,a5,a4
     234:	00279793          	slli	a5,a5,0x2
     238:	10ca2683          	lw	a3,268(s4)
     23c:	40e787b3          	sub	a5,a5,a4
     240:	00279793          	slli	a5,a5,0x2
     244:	00f487b3          	add	a5,s1,a5
     248:	06d7a223          	sw	a3,100(a5)
     24c:	104a4683          	lbu	a3,260(s4)
     250:	01578ab3          	add	s5,a5,s5
     254:	00170713          	addi	a4,a4,1
     258:	000a8023          	sb	zero,0(s5)
     25c:	06d7a423          	sw	a3,104(a5)
     260:	32e42423          	sw	a4,808(s0)
     264:	ef5ff06f          	j	158 <scan_files+0xf4>
     268:	00da8633          	add	a2,s5,a3
     26c:	00c48633          	add	a2,s1,a2
     270:	00b60023          	sb	a1,0(a2)
     274:	001a8a93          	addi	s5,s5,1
     278:	fa9ff06f          	j	220 <scan_files+0x1bc>
     27c:	02c12083          	lw	ra,44(sp)
     280:	02812403          	lw	s0,40(sp)
     284:	02412483          	lw	s1,36(sp)
     288:	02012903          	lw	s2,32(sp)
     28c:	01c12983          	lw	s3,28(sp)
     290:	01812a03          	lw	s4,24(sp)
     294:	01412a83          	lw	s5,20(sp)
     298:	01012b03          	lw	s6,16(sp)
     29c:	00c12b83          	lw	s7,12(sp)
     2a0:	03010113          	addi	sp,sp,48
     2a4:	00008067          	ret

000002a8 <clear_audio>:
     2a8:	fe010113          	addi	sp,sp,-32
     2ac:	000057b7          	lui	a5,0x5
     2b0:	00812c23          	sw	s0,24(sp)
     2b4:	e1c7a403          	lw	s0,-484(a5) # 4e1c <AUDIO>
     2b8:	00112e23          	sw	ra,28(sp)
     2bc:	00912a23          	sw	s1,20(sp)
     2c0:	00042703          	lw	a4,0(s0)
     2c4:	01212823          	sw	s2,16(sp)
     2c8:	01312623          	sw	s3,12(sp)
     2cc:	00042783          	lw	a5,0(s0)
     2d0:	fef70ee3          	beq	a4,a5,2cc <clear_audio+0x24>
     2d4:	00200493          	li	s1,2
     2d8:	00100993          	li	s3,1
     2dc:	00042903          	lw	s2,0(s0)
     2e0:	20000613          	li	a2,512
     2e4:	00000593          	li	a1,0
     2e8:	00090513          	mv	a0,s2
     2ec:	00001097          	auipc	ra,0x1
     2f0:	ec0080e7          	jalr	-320(ra) # 11ac <memset>
     2f4:	00042783          	lw	a5,0(s0)
     2f8:	fef90ee3          	beq	s2,a5,2f4 <clear_audio+0x4c>
     2fc:	03349063          	bne	s1,s3,31c <clear_audio+0x74>
     300:	01c12083          	lw	ra,28(sp)
     304:	01812403          	lw	s0,24(sp)
     308:	01412483          	lw	s1,20(sp)
     30c:	01012903          	lw	s2,16(sp)
     310:	00c12983          	lw	s3,12(sp)
     314:	02010113          	addi	sp,sp,32
     318:	00008067          	ret
     31c:	00100493          	li	s1,1
     320:	fbdff06f          	j	2dc <clear_audio+0x34>

00000324 <play_click_noise>:
     324:	000055b7          	lui	a1,0x5
     328:	00005537          	lui	a0,0x5
     32c:	fe010113          	addi	sp,sp,-32
     330:	e4058593          	addi	a1,a1,-448 # 4e40 <LEDS+0x10>
     334:	e4450513          	addi	a0,a0,-444 # 4e44 <LEDS+0x14>
     338:	00112e23          	sw	ra,28(sp)
     33c:	00812c23          	sw	s0,24(sp)
     340:	00912a23          	sw	s1,20(sp)
     344:	01212823          	sw	s2,16(sp)
     348:	01312623          	sw	s3,12(sp)
     34c:	01412423          	sw	s4,8(sp)
     350:	01512223          	sw	s5,4(sp)
     354:	00004097          	auipc	ra,0x4
     358:	6b8080e7          	jalr	1720(ra) # 4a0c <fl_fopen>
     35c:	0a050263          	beqz	a0,400 <play_click_noise+0xdc>
     360:	000015b7          	lui	a1,0x1
     364:	00000613          	li	a2,0
     368:	fa058593          	addi	a1,a1,-96 # fa0 <sdcard_init+0x54>
     36c:	00050a13          	mv	s4,a0
     370:	00002097          	auipc	ra,0x2
     374:	b2c080e7          	jalr	-1236(ra) # 1e9c <fl_fseek>
     378:	000057b7          	lui	a5,0x5
     37c:	e1c7aa83          	lw	s5,-484(a5) # 4e1c <AUDIO>
     380:	20000993          	li	s3,512
     384:	1ff00913          	li	s2,511
     388:	000aa483          	lw	s1,0(s5)
     38c:	000a0693          	mv	a3,s4
     390:	20000613          	li	a2,512
     394:	00100593          	li	a1,1
     398:	00048513          	mv	a0,s1
     39c:	00004097          	auipc	ra,0x4
     3a0:	06c080e7          	jalr	108(ra) # 4408 <fl_fread>
     3a4:	00050413          	mv	s0,a0
     3a8:	00a94c63          	blt	s2,a0,3c0 <play_click_noise+0x9c>
     3ac:	40a98633          	sub	a2,s3,a0
     3b0:	00000593          	li	a1,0
     3b4:	00a48533          	add	a0,s1,a0
     3b8:	00001097          	auipc	ra,0x1
     3bc:	df4080e7          	jalr	-524(ra) # 11ac <memset>
     3c0:	000aa783          	lw	a5,0(s5)
     3c4:	fef48ee3          	beq	s1,a5,3c0 <play_click_noise+0x9c>
     3c8:	fc8940e3          	blt	s2,s0,388 <play_click_noise+0x64>
     3cc:	000a0513          	mv	a0,s4
     3d0:	00004097          	auipc	ra,0x4
     3d4:	f5c080e7          	jalr	-164(ra) # 432c <fl_fclose>
     3d8:	01812403          	lw	s0,24(sp)
     3dc:	01c12083          	lw	ra,28(sp)
     3e0:	01412483          	lw	s1,20(sp)
     3e4:	01012903          	lw	s2,16(sp)
     3e8:	00c12983          	lw	s3,12(sp)
     3ec:	00812a03          	lw	s4,8(sp)
     3f0:	00412a83          	lw	s5,4(sp)
     3f4:	02010113          	addi	sp,sp,32
     3f8:	00000317          	auipc	t1,0x0
     3fc:	eb030067          	jr	-336(t1) # 2a8 <clear_audio>
     400:	01c12083          	lw	ra,28(sp)
     404:	01812403          	lw	s0,24(sp)
     408:	01412483          	lw	s1,20(sp)
     40c:	01012903          	lw	s2,16(sp)
     410:	00c12983          	lw	s3,12(sp)
     414:	00812a03          	lw	s4,8(sp)
     418:	00412a83          	lw	s5,4(sp)
     41c:	02010113          	addi	sp,sp,32
     420:	00008067          	ret

00000424 <play_music_file>:
     424:	000055b7          	lui	a1,0x5
     428:	fc010113          	addi	sp,sp,-64
     42c:	e4058593          	addi	a1,a1,-448 # 4e40 <LEDS+0x10>
     430:	02812c23          	sw	s0,56(sp)
     434:	02112e23          	sw	ra,60(sp)
     438:	02912a23          	sw	s1,52(sp)
     43c:	03212823          	sw	s2,48(sp)
     440:	03312623          	sw	s3,44(sp)
     444:	03412423          	sw	s4,40(sp)
     448:	03512223          	sw	s5,36(sp)
     44c:	03612023          	sw	s6,32(sp)
     450:	01712e23          	sw	s7,28(sp)
     454:	01812c23          	sw	s8,24(sp)
     458:	01912a23          	sw	s9,20(sp)
     45c:	01a12823          	sw	s10,16(sp)
     460:	01b12623          	sw	s11,12(sp)
     464:	00050413          	mv	s0,a0
     468:	00004097          	auipc	ra,0x4
     46c:	5a4080e7          	jalr	1444(ra) # 4a0c <fl_fopen>
     470:	04051c63          	bnez	a0,4c8 <play_music_file+0xa4>
     474:	00005537          	lui	a0,0x5
     478:	00040593          	mv	a1,s0
     47c:	e5050513          	addi	a0,a0,-432 # 4e50 <LEDS+0x20>
     480:	00001097          	auipc	ra,0x1
     484:	3e4080e7          	jalr	996(ra) # 1864 <printf>
     488:	03812403          	lw	s0,56(sp)
     48c:	03c12083          	lw	ra,60(sp)
     490:	03412483          	lw	s1,52(sp)
     494:	03012903          	lw	s2,48(sp)
     498:	02c12983          	lw	s3,44(sp)
     49c:	02812a03          	lw	s4,40(sp)
     4a0:	02412a83          	lw	s5,36(sp)
     4a4:	02012b03          	lw	s6,32(sp)
     4a8:	01c12b83          	lw	s7,28(sp)
     4ac:	01812c03          	lw	s8,24(sp)
     4b0:	01412c83          	lw	s9,20(sp)
     4b4:	01012d03          	lw	s10,16(sp)
     4b8:	00c12d83          	lw	s11,12(sp)
     4bc:	04010113          	addi	sp,sp,64
     4c0:	00001317          	auipc	t1,0x1
     4c4:	1ac30067          	jr	428(t1) # 166c <display_refresh>
     4c8:	00000593          	li	a1,0
     4cc:	00050c13          	mv	s8,a0
     4d0:	00000513          	li	a0,0
     4d4:	00001097          	auipc	ra,0x1
     4d8:	044080e7          	jalr	68(ra) # 1518 <display_set_cursor>
     4dc:	00000593          	li	a1,0
     4e0:	0ff00513          	li	a0,255
     4e4:	00001097          	auipc	ra,0x1
     4e8:	048080e7          	jalr	72(ra) # 152c <display_set_front_back_color>
     4ec:	00005537          	lui	a0,0x5
     4f0:	00040593          	mv	a1,s0
     4f4:	e6850513          	addi	a0,a0,-408 # 4e68 <LEDS+0x38>
     4f8:	00001097          	auipc	ra,0x1
     4fc:	36c080e7          	jalr	876(ra) # 1864 <printf>
     500:	00001097          	auipc	ra,0x1
     504:	16c080e7          	jalr	364(ra) # 166c <display_refresh>
     508:	000057b7          	lui	a5,0x5
     50c:	e207a783          	lw	a5,-480(a5) # 4e20 <BUTTONS>
     510:	00000b13          	li	s6,0
     514:	00100413          	li	s0,1
     518:	0007a483          	lw	s1,0(a5)
     51c:	00078c93          	mv	s9,a5
     520:	000057b7          	lui	a5,0x5
     524:	e1c7ad03          	lw	s10,-484(a5) # 4e1c <AUDIO>
     528:	20000a13          	li	s4,512
     52c:	1ff00993          	li	s3,511
     530:	00005937          	lui	s2,0x5
     534:	000d2b83          	lw	s7,0(s10)
     538:	000c0693          	mv	a3,s8
     53c:	20000613          	li	a2,512
     540:	00100593          	li	a1,1
     544:	000b8513          	mv	a0,s7
     548:	00004097          	auipc	ra,0x4
     54c:	ec0080e7          	jalr	-320(ra) # 4408 <fl_fread>
     550:	00050a93          	mv	s5,a0
     554:	00a9cc63          	blt	s3,a0,56c <play_music_file+0x148>
     558:	40aa0633          	sub	a2,s4,a0
     55c:	00000593          	li	a1,0
     560:	00ab8533          	add	a0,s7,a0
     564:	00001097          	auipc	ra,0x1
     568:	c48080e7          	jalr	-952(ra) # 11ac <memset>
     56c:	000d2783          	lw	a5,0(s10)
     570:	fefb8ee3          	beq	s7,a5,56c <play_music_file+0x148>
     574:	0559d263          	bge	s3,s5,5b8 <play_music_file+0x194>
     578:	fff40793          	addi	a5,s0,-1
     57c:	f8040713          	addi	a4,s0,-128
     580:	00173713          	seqz	a4,a4
     584:	0017b793          	seqz	a5,a5
     588:	00e7e7b3          	or	a5,a5,a4
     58c:	00fb4733          	xor	a4,s6,a5
     590:	08fb0663          	beq	s6,a5,61c <play_music_file+0x1f8>
     594:	00141413          	slli	s0,s0,0x1
     598:	e3092783          	lw	a5,-464(s2) # 4e30 <LEDS>
     59c:	fff4c493          	not	s1,s1
     5a0:	0087a023          	sw	s0,0(a5)
     5a4:	000ca783          	lw	a5,0(s9)
     5a8:	00f4f4b3          	and	s1,s1,a5
     5ac:	06048263          	beqz	s1,610 <play_music_file+0x1ec>
     5b0:	00000097          	auipc	ra,0x0
     5b4:	d74080e7          	jalr	-652(ra) # 324 <play_click_noise>
     5b8:	000c0513          	mv	a0,s8
     5bc:	00004097          	auipc	ra,0x4
     5c0:	d70080e7          	jalr	-656(ra) # 432c <fl_fclose>
     5c4:	00000097          	auipc	ra,0x0
     5c8:	ce4080e7          	jalr	-796(ra) # 2a8 <clear_audio>
     5cc:	e3092783          	lw	a5,-464(s2)
     5d0:	03c12083          	lw	ra,60(sp)
     5d4:	03812403          	lw	s0,56(sp)
     5d8:	0007a023          	sw	zero,0(a5)
     5dc:	03412483          	lw	s1,52(sp)
     5e0:	03012903          	lw	s2,48(sp)
     5e4:	02c12983          	lw	s3,44(sp)
     5e8:	02812a03          	lw	s4,40(sp)
     5ec:	02412a83          	lw	s5,36(sp)
     5f0:	02012b03          	lw	s6,32(sp)
     5f4:	01c12b83          	lw	s7,28(sp)
     5f8:	01812c03          	lw	s8,24(sp)
     5fc:	01412c83          	lw	s9,20(sp)
     600:	01012d03          	lw	s10,16(sp)
     604:	00c12d83          	lw	s11,12(sp)
     608:	04010113          	addi	sp,sp,64
     60c:	00008067          	ret
     610:	00070b13          	mv	s6,a4
     614:	00078493          	mv	s1,a5
     618:	f1dff06f          	j	534 <play_music_file+0x110>
     61c:	40145413          	srai	s0,s0,0x1
     620:	f79ff06f          	j	598 <play_music_file+0x174>

00000624 <main>:
     624:	000057b7          	lui	a5,0x5
     628:	e307a783          	lw	a5,-464(a5) # 4e30 <LEDS>
     62c:	db010113          	addi	sp,sp,-592
     630:	24112623          	sw	ra,588(sp)
     634:	24812423          	sw	s0,584(sp)
     638:	24912223          	sw	s1,580(sp)
     63c:	23612823          	sw	s6,560(sp)
     640:	25212023          	sw	s2,576(sp)
     644:	23312e23          	sw	s3,572(sp)
     648:	23412c23          	sw	s4,568(sp)
     64c:	23512a23          	sw	s5,564(sp)
     650:	23712623          	sw	s7,556(sp)
     654:	23812423          	sw	s8,552(sp)
     658:	23912223          	sw	s9,548(sp)
     65c:	23a12023          	sw	s10,544(sp)
     660:	21b12e23          	sw	s11,540(sp)
     664:	0007a023          	sw	zero,0(a5)
     668:	000017b7          	lui	a5,0x1
     66c:	54078793          	addi	a5,a5,1344 # 1540 <display_putchar>
     670:	00005b37          	lui	s6,0x5
     674:	32fb2e23          	sw	a5,828(s6) # 533c <f_putchar>
     678:	00001097          	auipc	ra,0x1
     67c:	d60080e7          	jalr	-672(ra) # 13d8 <oled_init>
     680:	00001097          	auipc	ra,0x1
     684:	d64080e7          	jalr	-668(ra) # 13e4 <oled_fullscreen>
     688:	00000513          	li	a0,0
     68c:	00001097          	auipc	ra,0x1
     690:	df0080e7          	jalr	-528(ra) # 147c <oled_clear>
     694:	00001097          	auipc	ra,0x1
     698:	8b8080e7          	jalr	-1864(ra) # f4c <sdcard_init>
     69c:	00001097          	auipc	ra,0x1
     6a0:	798080e7          	jalr	1944(ra) # 1e34 <fl_init>
     6a4:	00000593          	li	a1,0
     6a8:	00000513          	li	a0,0
     6ac:	00001097          	auipc	ra,0x1
     6b0:	e6c080e7          	jalr	-404(ra) # 1518 <display_set_cursor>
     6b4:	00000593          	li	a1,0
     6b8:	0ff00513          	li	a0,255
     6bc:	00001097          	auipc	ra,0x1
     6c0:	e70080e7          	jalr	-400(ra) # 152c <display_set_front_back_color>
     6c4:	00005537          	lui	a0,0x5
     6c8:	e8050513          	addi	a0,a0,-384 # 4e80 <LEDS+0x50>
     6cc:	00001097          	auipc	ra,0x1
     6d0:	198080e7          	jalr	408(ra) # 1864 <printf>
     6d4:	000014b7          	lui	s1,0x1
     6d8:	00001437          	lui	s0,0x1
     6dc:	00001097          	auipc	ra,0x1
     6e0:	f90080e7          	jalr	-112(ra) # 166c <display_refresh>
     6e4:	0f048493          	addi	s1,s1,240 # 10f0 <sdcard_writesector>
     6e8:	09c40413          	addi	s0,s0,156 # 109c <sdcard_readsector>
     6ec:	00048593          	mv	a1,s1
     6f0:	00040513          	mv	a0,s0
     6f4:	00002097          	auipc	ra,0x2
     6f8:	6a0080e7          	jalr	1696(ra) # 2d94 <fl_attach_media>
     6fc:	fe0518e3          	bnez	a0,6ec <main+0xc8>
     700:	00000097          	auipc	ra,0x0
     704:	964080e7          	jalr	-1692(ra) # 64 <scan_files>
     708:	000057b7          	lui	a5,0x5
     70c:	e9478793          	addi	a5,a5,-364 # 4e94 <LEDS+0x64>
     710:	00f12423          	sw	a5,8(sp)
     714:	000057b7          	lui	a5,0x5
     718:	e207a783          	lw	a5,-480(a5) # 4e20 <BUTTONS>
     71c:	00005bb7          	lui	s7,0x5
     720:	00000913          	li	s2,0
     724:	00000993          	li	s3,0
     728:	00000c93          	li	s9,0
     72c:	00000413          	li	s0,0
     730:	134b8a93          	addi	s5,s7,308 # 5134 <current_path>
     734:	00f12623          	sw	a5,12(sp)
     738:	00000593          	li	a1,0
     73c:	00000513          	li	a0,0
     740:	00001097          	auipc	ra,0x1
     744:	dd8080e7          	jalr	-552(ra) # 1518 <display_set_cursor>
     748:	0ffcf593          	zext.b	a1,s9
     74c:	07f58513          	addi	a0,a1,127
     750:	0ff57513          	zext.b	a0,a0
     754:	00001097          	auipc	ra,0x1
     758:	dd8080e7          	jalr	-552(ra) # 152c <display_set_front_back_color>
     75c:	00812503          	lw	a0,8(sp)
     760:	00000493          	li	s1,0
     764:	00f00a13          	li	s4,15
     768:	00001097          	auipc	ra,0x1
     76c:	0fc080e7          	jalr	252(ra) # 1864 <printf>
     770:	015487b3          	add	a5,s1,s5
     774:	0007c503          	lbu	a0,0(a5)
     778:	00050a63          	beqz	a0,78c <main+0x168>
     77c:	33cb2783          	lw	a5,828(s6)
     780:	00148493          	addi	s1,s1,1
     784:	000780e7          	jalr	a5
     788:	ff4494e3          	bne	s1,s4,770 <main+0x14c>
     78c:	33cb2783          	lw	a5,828(s6)
     790:	00a00513          	li	a0,10
     794:	000780e7          	jalr	a5
     798:	00000593          	li	a1,0
     79c:	0ff00513          	li	a0,255
     7a0:	00001097          	auipc	ra,0x1
     7a4:	d8c080e7          	jalr	-628(ra) # 152c <display_set_front_back_color>
     7a8:	000057b7          	lui	a5,0x5
     7ac:	3287aa03          	lw	s4,808(a5) # 5328 <n_items>
     7b0:	0a0a0063          	beqz	s4,850 <main+0x22c>
     7b4:	412a0a33          	sub	s4,s4,s2
     7b8:	00c00793          	li	a5,12
     7bc:	0147d463          	bge	a5,s4,7c4 <main+0x1a0>
     7c0:	00078a13          	mv	s4,a5
     7c4:	00391493          	slli	s1,s2,0x3
     7c8:	412484b3          	sub	s1,s1,s2
     7cc:	00249493          	slli	s1,s1,0x2
     7d0:	412484b3          	sub	s1,s1,s2
     7d4:	000057b7          	lui	a5,0x5
     7d8:	47478793          	addi	a5,a5,1140 # 5474 <files>
     7dc:	00249493          	slli	s1,s1,0x2
     7e0:	00f484b3          	add	s1,s1,a5
     7e4:	000057b7          	lui	a5,0x5
     7e8:	eb878793          	addi	a5,a5,-328 # 4eb8 <LEDS+0x88>
     7ec:	00f12023          	sw	a5,0(sp)
     7f0:	000057b7          	lui	a5,0x5
     7f4:	eb078793          	addi	a5,a5,-336 # 4eb0 <LEDS+0x80>
     7f8:	00000c13          	li	s8,0
     7fc:	00f12223          	sw	a5,4(sp)
     800:	01200d93          	li	s11,18
     804:	194c4063          	blt	s8,s4,984 <main+0x360>
     808:	00000593          	li	a1,0
     80c:	00000513          	li	a0,0
     810:	000054b7          	lui	s1,0x5
     814:	00001097          	auipc	ra,0x1
     818:	d18080e7          	jalr	-744(ra) # 152c <display_set_front_back_color>
     81c:	00c00c13          	li	s8,12
     820:	ec048493          	addi	s1,s1,-320 # 4ec0 <LEDS+0x90>
     824:	038a0e63          	beq	s4,s8,860 <main+0x23c>
     828:	00048513          	mv	a0,s1
     82c:	00001097          	auipc	ra,0x1
     830:	038080e7          	jalr	56(ra) # 1864 <printf>
     834:	001a0a13          	addi	s4,s4,1
     838:	fedff06f          	j	824 <main+0x200>
     83c:	00000913          	li	s2,0
     840:	00000413          	li	s0,0
     844:	007c8c93          	addi	s9,s9,7
     848:	000a0993          	mv	s3,s4
     84c:	eedff06f          	j	738 <main+0x114>
     850:	00005537          	lui	a0,0x5
     854:	e9c50513          	addi	a0,a0,-356 # 4e9c <LEDS+0x6c>
     858:	00001097          	auipc	ra,0x1
     85c:	00c080e7          	jalr	12(ra) # 1864 <printf>
     860:	00001097          	auipc	ra,0x1
     864:	e0c080e7          	jalr	-500(ra) # 166c <display_refresh>
     868:	00c12783          	lw	a5,12(sp)
     86c:	fff9c993          	not	s3,s3
     870:	0007aa03          	lw	s4,0(a5)
     874:	0149f9b3          	and	s3,s3,s4
     878:	0109f793          	andi	a5,s3,16
     87c:	00078863          	beqz	a5,88c <main+0x268>
     880:	00140413          	addi	s0,s0,1
     884:	00000097          	auipc	ra,0x0
     888:	aa0080e7          	jalr	-1376(ra) # 324 <play_click_noise>
     88c:	0089f793          	andi	a5,s3,8
     890:	00078863          	beqz	a5,8a0 <main+0x27c>
     894:	fff40413          	addi	s0,s0,-1
     898:	00000097          	auipc	ra,0x0
     89c:	a8c080e7          	jalr	-1396(ra) # 324 <play_click_noise>
     8a0:	0049f993          	andi	s3,s3,4
     8a4:	08098e63          	beqz	s3,940 <main+0x31c>
     8a8:	00000097          	auipc	ra,0x0
     8ac:	a7c080e7          	jalr	-1412(ra) # 324 <play_click_noise>
     8b0:	000054b7          	lui	s1,0x5
     8b4:	00341793          	slli	a5,s0,0x3
     8b8:	47448713          	addi	a4,s1,1140 # 5474 <files>
     8bc:	408784b3          	sub	s1,a5,s0
     8c0:	00249493          	slli	s1,s1,0x2
     8c4:	408484b3          	sub	s1,s1,s0
     8c8:	00249493          	slli	s1,s1,0x2
     8cc:	009704b3          	add	s1,a4,s1
     8d0:	0684a603          	lw	a2,104(s1)
     8d4:	22060263          	beqz	a2,af8 <main+0x4d4>
     8d8:	000055b7          	lui	a1,0x5
     8dc:	e3858593          	addi	a1,a1,-456 # 4e38 <LEDS+0x8>
     8e0:	00048513          	mv	a0,s1
     8e4:	fffff097          	auipc	ra,0xfffff
     8e8:	738080e7          	jalr	1848(ra) # 1c <strcmp>
     8ec:	00000793          	li	a5,0
     8f0:	14051463          	bnez	a0,a38 <main+0x414>
     8f4:	00aa87b3          	add	a5,s5,a0
     8f8:	0007c703          	lbu	a4,0(a5)
     8fc:	10071c63          	bnez	a4,a14 <main+0x3f0>
     900:	00100713          	li	a4,1
     904:	02a75063          	bge	a4,a0,924 <main+0x300>
     908:	02f00593          	li	a1,47
     90c:	000a8513          	mv	a0,s5
     910:	fe078fa3          	sb	zero,-1(a5)
     914:	fffff097          	auipc	ra,0xfffff
     918:	72c080e7          	jalr	1836(ra) # 40 <strrchr>
     91c:	10050063          	beqz	a0,a1c <main+0x3f8>
     920:	000500a3          	sb	zero,1(a0)
     924:	fffff097          	auipc	ra,0xfffff
     928:	740080e7          	jalr	1856(ra) # 64 <scan_files>
     92c:	00000513          	li	a0,0
     930:	00001097          	auipc	ra,0x1
     934:	b4c080e7          	jalr	-1204(ra) # 147c <oled_clear>
     938:	00000913          	li	s2,0
     93c:	00000413          	li	s0,0
     940:	000057b7          	lui	a5,0x5
     944:	3287a783          	lw	a5,808(a5) # 5328 <n_items>
     948:	eef05ae3          	blez	a5,83c <main+0x218>
     94c:	fff00713          	li	a4,-1
     950:	1ae41c63          	bne	s0,a4,b08 <main+0x4e4>
     954:	00878433          	add	s0,a5,s0
     958:	1d244063          	blt	s0,s2,b18 <main+0x4f4>
     95c:	00b90713          	addi	a4,s2,11
     960:	00875463          	bge	a4,s0,968 <main+0x344>
     964:	ff540913          	addi	s2,s0,-11
     968:	00c00713          	li	a4,12
     96c:	00e7d463          	bge	a5,a4,974 <main+0x350>
     970:	00070793          	mv	a5,a4
     974:	ff478793          	addi	a5,a5,-12
     978:	ed27d6e3          	bge	a5,s2,844 <main+0x220>
     97c:	00078913          	mv	s2,a5
     980:	ec5ff06f          	j	844 <main+0x220>
     984:	012c0d33          	add	s10,s8,s2
     988:	07a41463          	bne	s0,s10,9f0 <main+0x3cc>
     98c:	0ff00593          	li	a1,255
     990:	00000513          	li	a0,0
     994:	00001097          	auipc	ra,0x1
     998:	b98080e7          	jalr	-1128(ra) # 152c <display_set_front_back_color>
     99c:	0684a783          	lw	a5,104(s1)
     9a0:	000d0593          	mv	a1,s10
     9a4:	04078c63          	beqz	a5,9fc <main+0x3d8>
     9a8:	00412503          	lw	a0,4(sp)
     9ac:	00001097          	auipc	ra,0x1
     9b0:	eb8080e7          	jalr	-328(ra) # 1864 <printf>
     9b4:	00000d13          	li	s10,0
     9b8:	01a487b3          	add	a5,s1,s10
     9bc:	0007c503          	lbu	a0,0(a5)
     9c0:	00050a63          	beqz	a0,9d4 <main+0x3b0>
     9c4:	33cb2783          	lw	a5,828(s6)
     9c8:	001d0d13          	addi	s10,s10,1
     9cc:	000780e7          	jalr	a5
     9d0:	ffbd14e3          	bne	s10,s11,9b8 <main+0x394>
     9d4:	33cb2783          	lw	a5,828(s6)
     9d8:	03bd1663          	bne	s10,s11,a04 <main+0x3e0>
     9dc:	00a00513          	li	a0,10
     9e0:	000780e7          	jalr	a5
     9e4:	001c0c13          	addi	s8,s8,1
     9e8:	06c48493          	addi	s1,s1,108
     9ec:	e19ff06f          	j	804 <main+0x1e0>
     9f0:	00000593          	li	a1,0
     9f4:	0ff00513          	li	a0,255
     9f8:	f9dff06f          	j	994 <main+0x370>
     9fc:	00012503          	lw	a0,0(sp)
     a00:	fadff06f          	j	9ac <main+0x388>
     a04:	02000513          	li	a0,32
     a08:	000780e7          	jalr	a5
     a0c:	001d0d13          	addi	s10,s10,1
     a10:	fc5ff06f          	j	9d4 <main+0x3b0>
     a14:	00150513          	addi	a0,a0,1
     a18:	eddff06f          	j	8f4 <main+0x2d0>
     a1c:	000055b7          	lui	a1,0x5
     a20:	e3458593          	addi	a1,a1,-460 # 4e34 <LEDS+0x4>
     a24:	000a8513          	mv	a0,s5
     a28:	00001097          	auipc	ra,0x1
     a2c:	848080e7          	jalr	-1976(ra) # 1270 <strcpy>
     a30:	ef5ff06f          	j	924 <main+0x300>
     a34:	00178793          	addi	a5,a5,1
     a38:	00fa8733          	add	a4,s5,a5
     a3c:	00074703          	lbu	a4,0(a4)
     a40:	fe071ae3          	bnez	a4,a34 <main+0x410>
     a44:	00e486b3          	add	a3,s1,a4
     a48:	0006c683          	lbu	a3,0(a3)
     a4c:	02069c63          	bnez	a3,a84 <main+0x460>
     a50:	00e787b3          	add	a5,a5,a4
     a54:	1f100713          	li	a4,497
     a58:	ecf746e3          	blt	a4,a5,924 <main+0x300>
     a5c:	00048593          	mv	a1,s1
     a60:	134b8513          	addi	a0,s7,308
     a64:	00001097          	auipc	ra,0x1
     a68:	82c080e7          	jalr	-2004(ra) # 1290 <strcat>
     a6c:	000055b7          	lui	a1,0x5
     a70:	e3458593          	addi	a1,a1,-460 # 4e34 <LEDS+0x4>
     a74:	134b8513          	addi	a0,s7,308
     a78:	00001097          	auipc	ra,0x1
     a7c:	818080e7          	jalr	-2024(ra) # 1290 <strcat>
     a80:	ea5ff06f          	j	924 <main+0x300>
     a84:	00170713          	addi	a4,a4,1
     a88:	fbdff06f          	j	a44 <main+0x420>
     a8c:	00168693          	addi	a3,a3,1
     a90:	00da85b3          	add	a1,s5,a3
     a94:	0005c583          	lbu	a1,0(a1)
     a98:	fe059ae3          	bnez	a1,a8c <main+0x468>
     a9c:	408787b3          	sub	a5,a5,s0
     aa0:	00279793          	slli	a5,a5,0x2
     aa4:	408787b3          	sub	a5,a5,s0
     aa8:	00279793          	slli	a5,a5,0x2
     aac:	00f704b3          	add	s1,a4,a5
     ab0:	00c487b3          	add	a5,s1,a2
     ab4:	0007c783          	lbu	a5,0(a5)
     ab8:	04079463          	bnez	a5,b00 <main+0x4dc>
     abc:	00c686b3          	add	a3,a3,a2
     ac0:	1f300793          	li	a5,499
     ac4:	e6d7cee3          	blt	a5,a3,940 <main+0x31c>
     ac8:	134b8593          	addi	a1,s7,308
     acc:	01c10513          	addi	a0,sp,28
     ad0:	00000097          	auipc	ra,0x0
     ad4:	7a0080e7          	jalr	1952(ra) # 1270 <strcpy>
     ad8:	00048593          	mv	a1,s1
     adc:	01c10513          	addi	a0,sp,28
     ae0:	00000097          	auipc	ra,0x0
     ae4:	7b0080e7          	jalr	1968(ra) # 1290 <strcat>
     ae8:	01c10513          	addi	a0,sp,28
     aec:	00000097          	auipc	ra,0x0
     af0:	938080e7          	jalr	-1736(ra) # 424 <play_music_file>
     af4:	e4dff06f          	j	940 <main+0x31c>
     af8:	00000693          	li	a3,0
     afc:	f95ff06f          	j	a90 <main+0x46c>
     b00:	00160613          	addi	a2,a2,1
     b04:	fadff06f          	j	ab0 <main+0x48c>
     b08:	00f42733          	slt	a4,s0,a5
     b0c:	40e00733          	neg	a4,a4
     b10:	00e47433          	and	s0,s0,a4
     b14:	e45ff06f          	j	958 <main+0x334>
     b18:	00040913          	mv	s2,s0
     b1c:	e4dff06f          	j	968 <main+0x344>

00000b20 <pause>:
     b20:	c0002773          	rdcycle	a4
     b24:	c00027f3          	rdcycle	a5
     b28:	40e787b3          	sub	a5,a5,a4
     b2c:	fea7ece3          	bltu	a5,a0,b24 <pause+0x4>
     b30:	00008067          	ret

00000b34 <sdcard_idle>:
     b34:	00008067          	ret

00000b38 <sdcard_select>:
     b38:	000057b7          	lui	a5,0x5
     b3c:	e247a783          	lw	a5,-476(a5) # 4e24 <SDCARD>
     b40:	00200713          	li	a4,2
     b44:	00e7a023          	sw	a4,0(a5)
     b48:	00008067          	ret

00000b4c <sdcard_ponder>:
     b4c:	000056b7          	lui	a3,0x5
     b50:	e246a683          	lw	a3,-476(a3) # 4e24 <SDCARD>
     b54:	01000793          	li	a5,16
     b58:	00000713          	li	a4,0
     b5c:	00676613          	ori	a2,a4,6
     b60:	00c6a023          	sw	a2,0(a3)
     b64:	00174713          	xori	a4,a4,1
     b68:	00000013          	nop
     b6c:	fff78793          	addi	a5,a5,-1
     b70:	fe0796e3          	bnez	a5,b5c <sdcard_ponder+0x10>
     b74:	00008067          	ret

00000b78 <sdcard_unselect>:
     b78:	000057b7          	lui	a5,0x5
     b7c:	e247a783          	lw	a5,-476(a5) # 4e24 <SDCARD>
     b80:	00600713          	li	a4,6
     b84:	00e7a023          	sw	a4,0(a5)
     b88:	00008067          	ret

00000b8c <sdcard_send>:
     b8c:	000057b7          	lui	a5,0x5
     b90:	e247a783          	lw	a5,-476(a5) # 4e24 <SDCARD>
     b94:	00655713          	srli	a4,a0,0x6
     b98:	00277713          	andi	a4,a4,2
     b9c:	00e7a023          	sw	a4,0(a5)
     ba0:	00176713          	ori	a4,a4,1
     ba4:	00e7a023          	sw	a4,0(a5)
     ba8:	00555713          	srli	a4,a0,0x5
     bac:	00277713          	andi	a4,a4,2
     bb0:	00e7a023          	sw	a4,0(a5)
     bb4:	00176713          	ori	a4,a4,1
     bb8:	00e7a023          	sw	a4,0(a5)
     bbc:	00455713          	srli	a4,a0,0x4
     bc0:	00277713          	andi	a4,a4,2
     bc4:	00e7a023          	sw	a4,0(a5)
     bc8:	00176713          	ori	a4,a4,1
     bcc:	00e7a023          	sw	a4,0(a5)
     bd0:	00355713          	srli	a4,a0,0x3
     bd4:	00277713          	andi	a4,a4,2
     bd8:	00e7a023          	sw	a4,0(a5)
     bdc:	00176713          	ori	a4,a4,1
     be0:	00e7a023          	sw	a4,0(a5)
     be4:	00255713          	srli	a4,a0,0x2
     be8:	00277713          	andi	a4,a4,2
     bec:	00e7a023          	sw	a4,0(a5)
     bf0:	00176713          	ori	a4,a4,1
     bf4:	00e7a023          	sw	a4,0(a5)
     bf8:	00155713          	srli	a4,a0,0x1
     bfc:	00277713          	andi	a4,a4,2
     c00:	00e7a023          	sw	a4,0(a5)
     c04:	00176713          	ori	a4,a4,1
     c08:	00e7a023          	sw	a4,0(a5)
     c0c:	00257713          	andi	a4,a0,2
     c10:	00e7a023          	sw	a4,0(a5)
     c14:	00151513          	slli	a0,a0,0x1
     c18:	00176713          	ori	a4,a4,1
     c1c:	00e7a023          	sw	a4,0(a5)
     c20:	00257513          	andi	a0,a0,2
     c24:	00a7a023          	sw	a0,0(a5)
     c28:	00156513          	ori	a0,a0,1
     c2c:	00a7a023          	sw	a0,0(a5)
     c30:	00200713          	li	a4,2
     c34:	00e7a023          	sw	a4,0(a5)
     c38:	000057b7          	lui	a5,0x5
     c3c:	32c7a783          	lw	a5,812(a5) # 532c <sdcard_while_loading_callback>
     c40:	00078067          	jr	a5

00000c44 <sdcard_read>:
     c44:	fd010113          	addi	sp,sp,-48
     c48:	fff50793          	addi	a5,a0,-1
     c4c:	03212023          	sw	s2,32(sp)
     c50:	00100913          	li	s2,1
     c54:	00f91933          	sll	s2,s2,a5
     c58:	000057b7          	lui	a5,0x5
     c5c:	01312e23          	sw	s3,28(sp)
     c60:	e247a983          	lw	s3,-476(a5) # 4e24 <SDCARD>
     c64:	02812423          	sw	s0,40(sp)
     c68:	02912223          	sw	s1,36(sp)
     c6c:	01412c23          	sw	s4,24(sp)
     c70:	01512a23          	sw	s5,20(sp)
     c74:	01612823          	sw	s6,16(sp)
     c78:	02112623          	sw	ra,44(sp)
     c7c:	0ff00413          	li	s0,255
     c80:	00000493          	li	s1,0
     c84:	00300a13          	li	s4,3
     c88:	00200a93          	li	s5,2
     c8c:	00005b37          	lui	s6,0x5
     c90:	02058c63          	beqz	a1,cc8 <sdcard_read+0x84>
     c94:	012477b3          	and	a5,s0,s2
     c98:	02079a63          	bnez	a5,ccc <sdcard_read+0x88>
     c9c:	02c12083          	lw	ra,44(sp)
     ca0:	0ff47513          	zext.b	a0,s0
     ca4:	02812403          	lw	s0,40(sp)
     ca8:	02412483          	lw	s1,36(sp)
     cac:	02012903          	lw	s2,32(sp)
     cb0:	01c12983          	lw	s3,28(sp)
     cb4:	01812a03          	lw	s4,24(sp)
     cb8:	01412a83          	lw	s5,20(sp)
     cbc:	01012b03          	lw	s6,16(sp)
     cc0:	03010113          	addi	sp,sp,48
     cc4:	00008067          	ret
     cc8:	fca4dae3          	bge	s1,a0,c9c <sdcard_read+0x58>
     ccc:	0149a023          	sw	s4,0(s3)
     cd0:	0159a023          	sw	s5,0(s3)
     cd4:	0009a783          	lw	a5,0(s3)
     cd8:	00141413          	slli	s0,s0,0x1
     cdc:	00b12623          	sw	a1,12(sp)
     ce0:	00f46433          	or	s0,s0,a5
     ce4:	32cb2783          	lw	a5,812(s6) # 532c <sdcard_while_loading_callback>
     ce8:	00a12423          	sw	a0,8(sp)
     cec:	00148493          	addi	s1,s1,1
     cf0:	000780e7          	jalr	a5
     cf4:	00c12583          	lw	a1,12(sp)
     cf8:	00812503          	lw	a0,8(sp)
     cfc:	f95ff06f          	j	c90 <sdcard_read+0x4c>

00000d00 <sdcard_get>:
     d00:	fe010113          	addi	sp,sp,-32
     d04:	00112e23          	sw	ra,28(sp)
     d08:	00812c23          	sw	s0,24(sp)
     d0c:	00912a23          	sw	s1,20(sp)
     d10:	00050413          	mv	s0,a0
     d14:	00b12623          	sw	a1,12(sp)
     d18:	00000097          	auipc	ra,0x0
     d1c:	e20080e7          	jalr	-480(ra) # b38 <sdcard_select>
     d20:	00c12583          	lw	a1,12(sp)
     d24:	00040513          	mv	a0,s0
     d28:	00100493          	li	s1,1
     d2c:	00000097          	auipc	ra,0x0
     d30:	f18080e7          	jalr	-232(ra) # c44 <sdcard_read>
     d34:	00345413          	srli	s0,s0,0x3
     d38:	0284c463          	blt	s1,s0,d60 <sdcard_get+0x60>
     d3c:	00a12623          	sw	a0,12(sp)
     d40:	00000097          	auipc	ra,0x0
     d44:	e38080e7          	jalr	-456(ra) # b78 <sdcard_unselect>
     d48:	01c12083          	lw	ra,28(sp)
     d4c:	01812403          	lw	s0,24(sp)
     d50:	00c12503          	lw	a0,12(sp)
     d54:	01412483          	lw	s1,20(sp)
     d58:	02010113          	addi	sp,sp,32
     d5c:	00008067          	ret
     d60:	00000593          	li	a1,0
     d64:	00800513          	li	a0,8
     d68:	00000097          	auipc	ra,0x0
     d6c:	edc080e7          	jalr	-292(ra) # c44 <sdcard_read>
     d70:	00148493          	addi	s1,s1,1
     d74:	fc5ff06f          	j	d38 <sdcard_get+0x38>

00000d78 <sdcard_cmd>:
     d78:	ff010113          	addi	sp,sp,-16
     d7c:	00812423          	sw	s0,8(sp)
     d80:	00912223          	sw	s1,4(sp)
     d84:	01212023          	sw	s2,0(sp)
     d88:	00112623          	sw	ra,12(sp)
     d8c:	00050913          	mv	s2,a0
     d90:	00000413          	li	s0,0
     d94:	00000097          	auipc	ra,0x0
     d98:	da4080e7          	jalr	-604(ra) # b38 <sdcard_select>
     d9c:	00600493          	li	s1,6
     da0:	008907b3          	add	a5,s2,s0
     da4:	0007c503          	lbu	a0,0(a5)
     da8:	00140413          	addi	s0,s0,1
     dac:	00000097          	auipc	ra,0x0
     db0:	de0080e7          	jalr	-544(ra) # b8c <sdcard_send>
     db4:	fe9416e3          	bne	s0,s1,da0 <sdcard_cmd+0x28>
     db8:	00812403          	lw	s0,8(sp)
     dbc:	00c12083          	lw	ra,12(sp)
     dc0:	00412483          	lw	s1,4(sp)
     dc4:	00012903          	lw	s2,0(sp)
     dc8:	01010113          	addi	sp,sp,16
     dcc:	00000317          	auipc	t1,0x0
     dd0:	dac30067          	jr	-596(t1) # b78 <sdcard_unselect>

00000dd4 <sdcard_start_sector>:
     dd4:	ff010113          	addi	sp,sp,-16
     dd8:	00112623          	sw	ra,12(sp)
     ddc:	00812423          	sw	s0,8(sp)
     de0:	00050413          	mv	s0,a0
     de4:	00000097          	auipc	ra,0x0
     de8:	d54080e7          	jalr	-684(ra) # b38 <sdcard_select>
     dec:	05100513          	li	a0,81
     df0:	00000097          	auipc	ra,0x0
     df4:	d9c080e7          	jalr	-612(ra) # b8c <sdcard_send>
     df8:	01845513          	srli	a0,s0,0x18
     dfc:	00000097          	auipc	ra,0x0
     e00:	d90080e7          	jalr	-624(ra) # b8c <sdcard_send>
     e04:	41045513          	srai	a0,s0,0x10
     e08:	0ff57513          	zext.b	a0,a0
     e0c:	00000097          	auipc	ra,0x0
     e10:	d80080e7          	jalr	-640(ra) # b8c <sdcard_send>
     e14:	40845513          	srai	a0,s0,0x8
     e18:	0ff57513          	zext.b	a0,a0
     e1c:	00000097          	auipc	ra,0x0
     e20:	d70080e7          	jalr	-656(ra) # b8c <sdcard_send>
     e24:	0ff47513          	zext.b	a0,s0
     e28:	00000097          	auipc	ra,0x0
     e2c:	d64080e7          	jalr	-668(ra) # b8c <sdcard_send>
     e30:	05500513          	li	a0,85
     e34:	00000097          	auipc	ra,0x0
     e38:	d58080e7          	jalr	-680(ra) # b8c <sdcard_send>
     e3c:	00000097          	auipc	ra,0x0
     e40:	d3c080e7          	jalr	-708(ra) # b78 <sdcard_unselect>
     e44:	00812403          	lw	s0,8(sp)
     e48:	00c12083          	lw	ra,12(sp)
     e4c:	00100593          	li	a1,1
     e50:	00800513          	li	a0,8
     e54:	01010113          	addi	sp,sp,16
     e58:	00000317          	auipc	t1,0x0
     e5c:	ea830067          	jr	-344(t1) # d00 <sdcard_get>

00000e60 <sdcard_read_sector>:
     e60:	ff010113          	addi	sp,sp,-16
     e64:	00812423          	sw	s0,8(sp)
     e68:	00112623          	sw	ra,12(sp)
     e6c:	00912223          	sw	s1,4(sp)
     e70:	01212023          	sw	s2,0(sp)
     e74:	00058413          	mv	s0,a1
     e78:	00000097          	auipc	ra,0x0
     e7c:	f5c080e7          	jalr	-164(ra) # dd4 <sdcard_start_sector>
     e80:	04051863          	bnez	a0,ed0 <sdcard_read_sector+0x70>
     e84:	00100593          	li	a1,1
     e88:	00058513          	mv	a0,a1
     e8c:	00000097          	auipc	ra,0x0
     e90:	e74080e7          	jalr	-396(ra) # d00 <sdcard_get>
     e94:	00000493          	li	s1,0
     e98:	20000913          	li	s2,512
     e9c:	00000593          	li	a1,0
     ea0:	00800513          	li	a0,8
     ea4:	00000097          	auipc	ra,0x0
     ea8:	e5c080e7          	jalr	-420(ra) # d00 <sdcard_get>
     eac:	009407b3          	add	a5,s0,s1
     eb0:	00a78023          	sb	a0,0(a5)
     eb4:	00148493          	addi	s1,s1,1
     eb8:	ff2492e3          	bne	s1,s2,e9c <sdcard_read_sector+0x3c>
     ebc:	00100593          	li	a1,1
     ec0:	01000513          	li	a0,16
     ec4:	20040413          	addi	s0,s0,512
     ec8:	00000097          	auipc	ra,0x0
     ecc:	e38080e7          	jalr	-456(ra) # d00 <sdcard_get>
     ed0:	00c12083          	lw	ra,12(sp)
     ed4:	00040513          	mv	a0,s0
     ed8:	00812403          	lw	s0,8(sp)
     edc:	00412483          	lw	s1,4(sp)
     ee0:	00012903          	lw	s2,0(sp)
     ee4:	01010113          	addi	sp,sp,16
     ee8:	00008067          	ret

00000eec <sdcard_preinit>:
     eec:	ff010113          	addi	sp,sp,-16
     ef0:	000057b7          	lui	a5,0x5
     ef4:	00812423          	sw	s0,8(sp)
     ef8:	e247a403          	lw	s0,-476(a5) # 4e24 <SDCARD>
     efc:	00112623          	sw	ra,12(sp)
     f00:	00600793          	li	a5,6
     f04:	01313537          	lui	a0,0x1313
     f08:	00f42023          	sw	a5,0(s0)
     f0c:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
     f10:	00000097          	auipc	ra,0x0
     f14:	c10080e7          	jalr	-1008(ra) # b20 <pause>
     f18:	0a000793          	li	a5,160
     f1c:	00000713          	li	a4,0
     f20:	00676693          	ori	a3,a4,6
     f24:	00d42023          	sw	a3,0(s0)
     f28:	fff78793          	addi	a5,a5,-1
     f2c:	00174713          	xori	a4,a4,1
     f30:	fe0798e3          	bnez	a5,f20 <sdcard_preinit+0x34>
     f34:	00600793          	li	a5,6
     f38:	00c12083          	lw	ra,12(sp)
     f3c:	00f42023          	sw	a5,0(s0)
     f40:	00812403          	lw	s0,8(sp)
     f44:	01010113          	addi	sp,sp,16
     f48:	00008067          	ret

00000f4c <sdcard_init>:
     f4c:	000017b7          	lui	a5,0x1
     f50:	b3478793          	addi	a5,a5,-1228 # b34 <sdcard_idle>
     f54:	00005737          	lui	a4,0x5
     f58:	fe010113          	addi	sp,sp,-32
     f5c:	32f72623          	sw	a5,812(a4) # 532c <sdcard_while_loading_callback>
     f60:	000057b7          	lui	a5,0x5
     f64:	00812c23          	sw	s0,24(sp)
     f68:	00912a23          	sw	s1,20(sp)
     f6c:	00112e23          	sw	ra,28(sp)
     f70:	e1478493          	addi	s1,a5,-492 # 4e14 <cmd0>
     f74:	0ff00413          	li	s0,255
     f78:	00000097          	auipc	ra,0x0
     f7c:	f74080e7          	jalr	-140(ra) # eec <sdcard_preinit>
     f80:	00048513          	mv	a0,s1
     f84:	00000097          	auipc	ra,0x0
     f88:	df4080e7          	jalr	-524(ra) # d78 <sdcard_cmd>
     f8c:	00100593          	li	a1,1
     f90:	00800513          	li	a0,8
     f94:	00000097          	auipc	ra,0x0
     f98:	d6c080e7          	jalr	-660(ra) # d00 <sdcard_get>
     f9c:	00a12623          	sw	a0,12(sp)
     fa0:	00000097          	auipc	ra,0x0
     fa4:	bac080e7          	jalr	-1108(ra) # b4c <sdcard_ponder>
     fa8:	00c12503          	lw	a0,12(sp)
     fac:	00851c63          	bne	a0,s0,fc4 <sdcard_init+0x78>
     fb0:	01313537          	lui	a0,0x1313
     fb4:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
     fb8:	00000097          	auipc	ra,0x0
     fbc:	b68080e7          	jalr	-1176(ra) # b20 <pause>
     fc0:	fb9ff06f          	j	f78 <sdcard_init+0x2c>
     fc4:	00005537          	lui	a0,0x5
     fc8:	e0c50513          	addi	a0,a0,-500 # 4e0c <cmd8>
     fcc:	00000097          	auipc	ra,0x0
     fd0:	dac080e7          	jalr	-596(ra) # d78 <sdcard_cmd>
     fd4:	00100593          	li	a1,1
     fd8:	02800513          	li	a0,40
     fdc:	00000097          	auipc	ra,0x0
     fe0:	d24080e7          	jalr	-732(ra) # d00 <sdcard_get>
     fe4:	00000097          	auipc	ra,0x0
     fe8:	b68080e7          	jalr	-1176(ra) # b4c <sdcard_ponder>
     fec:	000057b7          	lui	a5,0x5
     ff0:	e0478413          	addi	s0,a5,-508 # 4e04 <cmd55>
     ff4:	000057b7          	lui	a5,0x5
     ff8:	dfc78493          	addi	s1,a5,-516 # 4dfc <acmd41>
     ffc:	00040513          	mv	a0,s0
    1000:	00000097          	auipc	ra,0x0
    1004:	d78080e7          	jalr	-648(ra) # d78 <sdcard_cmd>
    1008:	00100593          	li	a1,1
    100c:	00800513          	li	a0,8
    1010:	00000097          	auipc	ra,0x0
    1014:	cf0080e7          	jalr	-784(ra) # d00 <sdcard_get>
    1018:	00000097          	auipc	ra,0x0
    101c:	b34080e7          	jalr	-1228(ra) # b4c <sdcard_ponder>
    1020:	00048513          	mv	a0,s1
    1024:	00000097          	auipc	ra,0x0
    1028:	d54080e7          	jalr	-684(ra) # d78 <sdcard_cmd>
    102c:	00100593          	li	a1,1
    1030:	00800513          	li	a0,8
    1034:	00000097          	auipc	ra,0x0
    1038:	ccc080e7          	jalr	-820(ra) # d00 <sdcard_get>
    103c:	00a12623          	sw	a0,12(sp)
    1040:	00000097          	auipc	ra,0x0
    1044:	b0c080e7          	jalr	-1268(ra) # b4c <sdcard_ponder>
    1048:	00c12503          	lw	a0,12(sp)
    104c:	00050c63          	beqz	a0,1064 <sdcard_init+0x118>
    1050:	001e8537          	lui	a0,0x1e8
    1054:	48050513          	addi	a0,a0,1152 # 1e8480 <__stacktop+0x1d8480>
    1058:	00000097          	auipc	ra,0x0
    105c:	ac8080e7          	jalr	-1336(ra) # b20 <pause>
    1060:	f9dff06f          	j	ffc <sdcard_init+0xb0>
    1064:	00005537          	lui	a0,0x5
    1068:	df450513          	addi	a0,a0,-524 # 4df4 <cmd16>
    106c:	00000097          	auipc	ra,0x0
    1070:	d0c080e7          	jalr	-756(ra) # d78 <sdcard_cmd>
    1074:	00100593          	li	a1,1
    1078:	00800513          	li	a0,8
    107c:	00000097          	auipc	ra,0x0
    1080:	c84080e7          	jalr	-892(ra) # d00 <sdcard_get>
    1084:	01812403          	lw	s0,24(sp)
    1088:	01c12083          	lw	ra,28(sp)
    108c:	01412483          	lw	s1,20(sp)
    1090:	02010113          	addi	sp,sp,32
    1094:	00000317          	auipc	t1,0x0
    1098:	ab830067          	jr	-1352(t1) # b4c <sdcard_ponder>

0000109c <sdcard_readsector>:
    109c:	04060663          	beqz	a2,10e8 <sdcard_readsector+0x4c>
    10a0:	ff010113          	addi	sp,sp,-16
    10a4:	00812423          	sw	s0,8(sp)
    10a8:	00912223          	sw	s1,4(sp)
    10ac:	00112623          	sw	ra,12(sp)
    10b0:	00050413          	mv	s0,a0
    10b4:	00a604b3          	add	s1,a2,a0
    10b8:	00040513          	mv	a0,s0
    10bc:	00000097          	auipc	ra,0x0
    10c0:	da4080e7          	jalr	-604(ra) # e60 <sdcard_read_sector>
    10c4:	00140413          	addi	s0,s0,1
    10c8:	00050593          	mv	a1,a0
    10cc:	fe9416e3          	bne	s0,s1,10b8 <sdcard_readsector+0x1c>
    10d0:	00c12083          	lw	ra,12(sp)
    10d4:	00812403          	lw	s0,8(sp)
    10d8:	00412483          	lw	s1,4(sp)
    10dc:	00100513          	li	a0,1
    10e0:	01010113          	addi	sp,sp,16
    10e4:	00008067          	ret
    10e8:	00000513          	li	a0,0
    10ec:	00008067          	ret

000010f0 <sdcard_writesector>:
    10f0:	00000513          	li	a0,0
    10f4:	00008067          	ret

000010f8 <__divsi3>:
    10f8:	06054063          	bltz	a0,1158 <__umodsi3+0x10>
    10fc:	0605c663          	bltz	a1,1168 <__umodsi3+0x20>

00001100 <__udivsi3>:
    1100:	00058613          	mv	a2,a1
    1104:	00050593          	mv	a1,a0
    1108:	fff00513          	li	a0,-1
    110c:	02060c63          	beqz	a2,1144 <__udivsi3+0x44>
    1110:	00100693          	li	a3,1
    1114:	00b67a63          	bgeu	a2,a1,1128 <__udivsi3+0x28>
    1118:	00c05863          	blez	a2,1128 <__udivsi3+0x28>
    111c:	00161613          	slli	a2,a2,0x1
    1120:	00169693          	slli	a3,a3,0x1
    1124:	feb66ae3          	bltu	a2,a1,1118 <__udivsi3+0x18>
    1128:	00000513          	li	a0,0
    112c:	00c5e663          	bltu	a1,a2,1138 <__udivsi3+0x38>
    1130:	40c585b3          	sub	a1,a1,a2
    1134:	00d56533          	or	a0,a0,a3
    1138:	0016d693          	srli	a3,a3,0x1
    113c:	00165613          	srli	a2,a2,0x1
    1140:	fe0696e3          	bnez	a3,112c <__udivsi3+0x2c>
    1144:	00008067          	ret

00001148 <__umodsi3>:
    1148:	00008293          	mv	t0,ra
    114c:	fb5ff0ef          	jal	1100 <__udivsi3>
    1150:	00058513          	mv	a0,a1
    1154:	00028067          	jr	t0
    1158:	40a00533          	neg	a0,a0
    115c:	0005d863          	bgez	a1,116c <__umodsi3+0x24>
    1160:	40b005b3          	neg	a1,a1
    1164:	f95ff06f          	j	10f8 <__divsi3>
    1168:	40b005b3          	neg	a1,a1
    116c:	00008293          	mv	t0,ra
    1170:	f89ff0ef          	jal	10f8 <__divsi3>
    1174:	40a00533          	neg	a0,a0
    1178:	00028067          	jr	t0

0000117c <__modsi3>:
    117c:	00008293          	mv	t0,ra
    1180:	0005ca63          	bltz	a1,1194 <__modsi3+0x18>
    1184:	00054c63          	bltz	a0,119c <__modsi3+0x20>
    1188:	f79ff0ef          	jal	1100 <__udivsi3>
    118c:	00058513          	mv	a0,a1
    1190:	00028067          	jr	t0
    1194:	40b005b3          	neg	a1,a1
    1198:	fe0558e3          	bgez	a0,1188 <__modsi3+0xc>
    119c:	40a00533          	neg	a0,a0
    11a0:	f61ff0ef          	jal	1100 <__udivsi3>
    11a4:	40b00533          	neg	a0,a1
    11a8:	00028067          	jr	t0

000011ac <memset>:
    11ac:	00c50633          	add	a2,a0,a2
    11b0:	00050793          	mv	a5,a0
    11b4:	00c79463          	bne	a5,a2,11bc <memset+0x10>
    11b8:	00008067          	ret
    11bc:	00178793          	addi	a5,a5,1
    11c0:	feb78fa3          	sb	a1,-1(a5)
    11c4:	ff1ff06f          	j	11b4 <memset+0x8>

000011c8 <memcpy>:
    11c8:	00000793          	li	a5,0
    11cc:	00c79463          	bne	a5,a2,11d4 <memcpy+0xc>
    11d0:	00008067          	ret
    11d4:	00f58733          	add	a4,a1,a5
    11d8:	00074683          	lbu	a3,0(a4)
    11dc:	00f50733          	add	a4,a0,a5
    11e0:	00178793          	addi	a5,a5,1
    11e4:	00d70023          	sb	a3,0(a4)
    11e8:	fe5ff06f          	j	11cc <memcpy+0x4>

000011ec <strlen>:
    11ec:	00000793          	li	a5,0
    11f0:	00f50733          	add	a4,a0,a5
    11f4:	00074703          	lbu	a4,0(a4)
    11f8:	00071663          	bnez	a4,1204 <strlen+0x18>
    11fc:	00078513          	mv	a0,a5
    1200:	00008067          	ret
    1204:	00178793          	addi	a5,a5,1
    1208:	fe9ff06f          	j	11f0 <strlen+0x4>

0000120c <strncmp>:
    120c:	00000793          	li	a5,0
    1210:	00c79663          	bne	a5,a2,121c <strncmp+0x10>
    1214:	00000513          	li	a0,0
    1218:	00008067          	ret
    121c:	00f50733          	add	a4,a0,a5
    1220:	00074683          	lbu	a3,0(a4)
    1224:	00f58733          	add	a4,a1,a5
    1228:	00074703          	lbu	a4,0(a4)
    122c:	00e6e863          	bltu	a3,a4,123c <strncmp+0x30>
    1230:	00d76a63          	bltu	a4,a3,1244 <strncmp+0x38>
    1234:	00178793          	addi	a5,a5,1
    1238:	fd9ff06f          	j	1210 <strncmp+0x4>
    123c:	fff00513          	li	a0,-1
    1240:	00008067          	ret
    1244:	00100513          	li	a0,1
    1248:	00008067          	ret

0000124c <strncpy>:
    124c:	00000793          	li	a5,0
    1250:	00c79463          	bne	a5,a2,1258 <strncpy+0xc>
    1254:	00008067          	ret
    1258:	00f58733          	add	a4,a1,a5
    125c:	00074683          	lbu	a3,0(a4)
    1260:	00f50733          	add	a4,a0,a5
    1264:	00178793          	addi	a5,a5,1
    1268:	00d70023          	sb	a3,0(a4)
    126c:	fe5ff06f          	j	1250 <strncpy+0x4>

00001270 <strcpy>:
    1270:	0005c783          	lbu	a5,0(a1)
    1274:	00079663          	bnez	a5,1280 <strcpy+0x10>
    1278:	00050023          	sb	zero,0(a0)
    127c:	00008067          	ret
    1280:	00150513          	addi	a0,a0,1
    1284:	00158593          	addi	a1,a1,1
    1288:	fef50fa3          	sb	a5,-1(a0)
    128c:	fe5ff06f          	j	1270 <strcpy>

00001290 <strcat>:
    1290:	00050793          	mv	a5,a0
    1294:	0007c683          	lbu	a3,0(a5)
    1298:	00078713          	mv	a4,a5
    129c:	00178793          	addi	a5,a5,1
    12a0:	fe069ae3          	bnez	a3,1294 <strcat+0x4>
    12a4:	0005c783          	lbu	a5,0(a1)
    12a8:	00158593          	addi	a1,a1,1
    12ac:	00170713          	addi	a4,a4,1
    12b0:	fef70fa3          	sb	a5,-1(a4)
    12b4:	fe0798e3          	bnez	a5,12a4 <strcat+0x14>
    12b8:	00008067          	ret

000012bc <oled_wait>:
    12bc:	00000013          	nop
    12c0:	00000013          	nop
    12c4:	00000013          	nop
    12c8:	00000013          	nop
    12cc:	00000013          	nop
    12d0:	00000013          	nop
    12d4:	00000013          	nop
    12d8:	00008067          	ret

000012dc <oled_init_mode>:
    12dc:	000057b7          	lui	a5,0x5
    12e0:	e287a703          	lw	a4,-472(a5) # 4e28 <OLED_RST>
    12e4:	fe010113          	addi	sp,sp,-32
    12e8:	00112e23          	sw	ra,28(sp)
    12ec:	00812c23          	sw	s0,24(sp)
    12f0:	00072023          	sw	zero,0(a4)
    12f4:	00040737          	lui	a4,0x40
    12f8:	00000013          	nop
    12fc:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
    1300:	fe071ce3          	bnez	a4,12f8 <oled_init_mode+0x1c>
    1304:	e287a703          	lw	a4,-472(a5)
    1308:	00100693          	li	a3,1
    130c:	00d72023          	sw	a3,0(a4)
    1310:	00040737          	lui	a4,0x40
    1314:	00000013          	nop
    1318:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
    131c:	fe071ce3          	bnez	a4,1314 <oled_init_mode+0x38>
    1320:	e287a783          	lw	a5,-472(a5)
    1324:	0007a023          	sw	zero,0(a5)
    1328:	000407b7          	lui	a5,0x40
    132c:	00000013          	nop
    1330:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
    1334:	fe079ce3          	bnez	a5,132c <oled_init_mode+0x50>
    1338:	00005737          	lui	a4,0x5
    133c:	e2c72783          	lw	a5,-468(a4) # 4e2c <OLED>
    1340:	2af00693          	li	a3,687
    1344:	00d7a023          	sw	a3,0(a5)
    1348:	000407b7          	lui	a5,0x40
    134c:	00000013          	nop
    1350:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
    1354:	fe079ce3          	bnez	a5,134c <oled_init_mode+0x70>
    1358:	e2c72403          	lw	s0,-468(a4)
    135c:	2a000793          	li	a5,672
    1360:	00a12623          	sw	a0,12(sp)
    1364:	00f42023          	sw	a5,0(s0)
    1368:	00000097          	auipc	ra,0x0
    136c:	f54080e7          	jalr	-172(ra) # 12bc <oled_wait>
    1370:	00c12503          	lw	a0,12(sp)
    1374:	4a000793          	li	a5,1184
    1378:	00050463          	beqz	a0,1380 <oled_init_mode+0xa4>
    137c:	42000793          	li	a5,1056
    1380:	00f42023          	sw	a5,0(s0)
    1384:	00000097          	auipc	ra,0x0
    1388:	f38080e7          	jalr	-200(ra) # 12bc <oled_wait>
    138c:	2fd00793          	li	a5,765
    1390:	00f42023          	sw	a5,0(s0)
    1394:	00000097          	auipc	ra,0x0
    1398:	f28080e7          	jalr	-216(ra) # 12bc <oled_wait>
    139c:	4b100793          	li	a5,1201
    13a0:	00f42023          	sw	a5,0(s0)
    13a4:	00000097          	auipc	ra,0x0
    13a8:	f18080e7          	jalr	-232(ra) # 12bc <oled_wait>
    13ac:	2a200793          	li	a5,674
    13b0:	00f42023          	sw	a5,0(s0)
    13b4:	00000097          	auipc	ra,0x0
    13b8:	f08080e7          	jalr	-248(ra) # 12bc <oled_wait>
    13bc:	40000793          	li	a5,1024
    13c0:	00f42023          	sw	a5,0(s0)
    13c4:	01812403          	lw	s0,24(sp)
    13c8:	01c12083          	lw	ra,28(sp)
    13cc:	02010113          	addi	sp,sp,32
    13d0:	00000317          	auipc	t1,0x0
    13d4:	eec30067          	jr	-276(t1) # 12bc <oled_wait>

000013d8 <oled_init>:
    13d8:	00000513          	li	a0,0
    13dc:	00000317          	auipc	t1,0x0
    13e0:	f0030067          	jr	-256(t1) # 12dc <oled_init_mode>

000013e4 <oled_fullscreen>:
    13e4:	ff010113          	addi	sp,sp,-16
    13e8:	000057b7          	lui	a5,0x5
    13ec:	00812423          	sw	s0,8(sp)
    13f0:	e2c7a403          	lw	s0,-468(a5) # 4e2c <OLED>
    13f4:	00112623          	sw	ra,12(sp)
    13f8:	00912223          	sw	s1,4(sp)
    13fc:	01212023          	sw	s2,0(sp)
    1400:	21500793          	li	a5,533
    1404:	00f42023          	sw	a5,0(s0)
    1408:	40000913          	li	s2,1024
    140c:	00000097          	auipc	ra,0x0
    1410:	eb0080e7          	jalr	-336(ra) # 12bc <oled_wait>
    1414:	47f00493          	li	s1,1151
    1418:	01242023          	sw	s2,0(s0)
    141c:	00000097          	auipc	ra,0x0
    1420:	ea0080e7          	jalr	-352(ra) # 12bc <oled_wait>
    1424:	00942023          	sw	s1,0(s0)
    1428:	00000097          	auipc	ra,0x0
    142c:	e94080e7          	jalr	-364(ra) # 12bc <oled_wait>
    1430:	27500793          	li	a5,629
    1434:	00f42023          	sw	a5,0(s0)
    1438:	00000097          	auipc	ra,0x0
    143c:	e84080e7          	jalr	-380(ra) # 12bc <oled_wait>
    1440:	01242023          	sw	s2,0(s0)
    1444:	00000097          	auipc	ra,0x0
    1448:	e78080e7          	jalr	-392(ra) # 12bc <oled_wait>
    144c:	00942023          	sw	s1,0(s0)
    1450:	00000097          	auipc	ra,0x0
    1454:	e6c080e7          	jalr	-404(ra) # 12bc <oled_wait>
    1458:	25c00793          	li	a5,604
    145c:	00f42023          	sw	a5,0(s0)
    1460:	00812403          	lw	s0,8(sp)
    1464:	00c12083          	lw	ra,12(sp)
    1468:	00412483          	lw	s1,4(sp)
    146c:	00012903          	lw	s2,0(sp)
    1470:	01010113          	addi	sp,sp,16
    1474:	00000317          	auipc	t1,0x0
    1478:	e4830067          	jr	-440(t1) # 12bc <oled_wait>

0000147c <oled_clear>:
    147c:	fe010113          	addi	sp,sp,-32
    1480:	000057b7          	lui	a5,0x5
    1484:	01312623          	sw	s3,12(sp)
    1488:	e2c7a983          	lw	s3,-468(a5) # 4e2c <OLED>
    148c:	00812c23          	sw	s0,24(sp)
    1490:	01212823          	sw	s2,16(sp)
    1494:	00112e23          	sw	ra,28(sp)
    1498:	00912a23          	sw	s1,20(sp)
    149c:	08000913          	li	s2,128
    14a0:	40056413          	ori	s0,a0,1024
    14a4:	08000493          	li	s1,128
    14a8:	0089a023          	sw	s0,0(s3)
    14ac:	00000097          	auipc	ra,0x0
    14b0:	e10080e7          	jalr	-496(ra) # 12bc <oled_wait>
    14b4:	0089a023          	sw	s0,0(s3)
    14b8:	00000097          	auipc	ra,0x0
    14bc:	e04080e7          	jalr	-508(ra) # 12bc <oled_wait>
    14c0:	fff48493          	addi	s1,s1,-1
    14c4:	0089a023          	sw	s0,0(s3)
    14c8:	00000097          	auipc	ra,0x0
    14cc:	df4080e7          	jalr	-524(ra) # 12bc <oled_wait>
    14d0:	fc049ce3          	bnez	s1,14a8 <oled_clear+0x2c>
    14d4:	fff90913          	addi	s2,s2,-1
    14d8:	fc0916e3          	bnez	s2,14a4 <oled_clear+0x28>
    14dc:	01c12083          	lw	ra,28(sp)
    14e0:	01812403          	lw	s0,24(sp)
    14e4:	01412483          	lw	s1,20(sp)
    14e8:	01012903          	lw	s2,16(sp)
    14ec:	00c12983          	lw	s3,12(sp)
    14f0:	02010113          	addi	sp,sp,32
    14f4:	00008067          	ret

000014f8 <oled_wait>:
    14f8:	00000013          	nop
    14fc:	00000013          	nop
    1500:	00000013          	nop
    1504:	00000013          	nop
    1508:	00000013          	nop
    150c:	00000013          	nop
    1510:	00000013          	nop
    1514:	00008067          	ret

00001518 <display_set_cursor>:
    1518:	000057b7          	lui	a5,0x5
    151c:	32a7ac23          	sw	a0,824(a5) # 5338 <cursor_x>
    1520:	000057b7          	lui	a5,0x5
    1524:	32b7aa23          	sw	a1,820(a5) # 5334 <cursor_y>
    1528:	00008067          	ret

0000152c <display_set_front_back_color>:
    152c:	000057b7          	lui	a5,0x5
    1530:	32a788a3          	sb	a0,817(a5) # 5331 <front_color>
    1534:	000057b7          	lui	a5,0x5
    1538:	32b78823          	sb	a1,816(a5) # 5330 <back_color>
    153c:	00008067          	ret

00001540 <display_putchar>:
    1540:	00a00793          	li	a5,10
    1544:	00005737          	lui	a4,0x5
    1548:	02f51663          	bne	a0,a5,1574 <display_putchar+0x34>
    154c:	32072c23          	sw	zero,824(a4) # 5338 <cursor_x>
    1550:	00005737          	lui	a4,0x5
    1554:	33472783          	lw	a5,820(a4) # 5334 <cursor_y>
    1558:	00878793          	addi	a5,a5,8
    155c:	32f72a23          	sw	a5,820(a4)
    1560:	07f00713          	li	a4,127
    1564:	10f75263          	bge	a4,a5,1668 <display_putchar+0x128>
    1568:	000057b7          	lui	a5,0x5
    156c:	3207aa23          	sw	zero,820(a5) # 5334 <cursor_y>
    1570:	00008067          	ret
    1574:	01f00793          	li	a5,31
    1578:	0ca7d063          	bge	a5,a0,1638 <display_putchar+0xf8>
    157c:	000057b7          	lui	a5,0x5
    1580:	3347a783          	lw	a5,820(a5) # 5334 <cursor_y>
    1584:	07800693          	li	a3,120
    1588:	00800593          	li	a1,8
    158c:	00f6d663          	bge	a3,a5,1598 <display_putchar+0x58>
    1590:	08000593          	li	a1,128
    1594:	40f585b3          	sub	a1,a1,a5
    1598:	33872683          	lw	a3,824(a4)
    159c:	07b00613          	li	a2,123
    15a0:	00500813          	li	a6,5
    15a4:	00d65663          	bge	a2,a3,15b0 <display_putchar+0x70>
    15a8:	08000813          	li	a6,128
    15ac:	40d80833          	sub	a6,a6,a3
    15b0:	00005637          	lui	a2,0x5
    15b4:	33064283          	lbu	t0,816(a2) # 5330 <back_color>
    15b8:	00005637          	lui	a2,0x5
    15bc:	33164383          	lbu	t2,817(a2) # 5331 <front_color>
    15c0:	00007637          	lui	a2,0x7
    15c4:	f7460613          	addi	a2,a2,-140 # 6f74 <framebuffer>
    15c8:	00c787b3          	add	a5,a5,a2
    15cc:	00769693          	slli	a3,a3,0x7
    15d0:	00d787b3          	add	a5,a5,a3
    15d4:	00005637          	lui	a2,0x5
    15d8:	00251693          	slli	a3,a0,0x2
    15dc:	f2060613          	addi	a2,a2,-224 # 4f20 <font>
    15e0:	00a686b3          	add	a3,a3,a0
    15e4:	00c686b3          	add	a3,a3,a2
    15e8:	00100f93          	li	t6,1
    15ec:	00000613          	li	a2,0
    15f0:	04b65463          	bge	a2,a1,1638 <display_putchar+0xf8>
    15f4:	00cf9f33          	sll	t5,t6,a2
    15f8:	00f60333          	add	t1,a2,a5
    15fc:	00068893          	mv	a7,a3
    1600:	00000513          	li	a0,0
    1604:	0280006f          	j	162c <display_putchar+0xec>
    1608:	f608ce03          	lbu	t3,-160(a7)
    160c:	00038e93          	mv	t4,t2
    1610:	01ee7e33          	and	t3,t3,t5
    1614:	000e1463          	bnez	t3,161c <display_putchar+0xdc>
    1618:	00028e93          	mv	t4,t0
    161c:	01d30023          	sb	t4,0(t1)
    1620:	00150513          	addi	a0,a0,1
    1624:	08030313          	addi	t1,t1,128
    1628:	00188893          	addi	a7,a7,1
    162c:	fd054ee3          	blt	a0,a6,1608 <display_putchar+0xc8>
    1630:	00160613          	addi	a2,a2,1
    1634:	fbdff06f          	j	15f0 <display_putchar+0xb0>
    1638:	33872783          	lw	a5,824(a4)
    163c:	07f00693          	li	a3,127
    1640:	00578793          	addi	a5,a5,5
    1644:	00f6c663          	blt	a3,a5,1650 <display_putchar+0x110>
    1648:	32f72c23          	sw	a5,824(a4)
    164c:	00008067          	ret
    1650:	32072c23          	sw	zero,824(a4)
    1654:	00005737          	lui	a4,0x5
    1658:	33472783          	lw	a5,820(a4) # 5334 <cursor_y>
    165c:	00878793          	addi	a5,a5,8
    1660:	32f72a23          	sw	a5,820(a4)
    1664:	f0f6c2e3          	blt	a3,a5,1568 <display_putchar+0x28>
    1668:	00008067          	ret

0000166c <display_refresh>:
    166c:	fe010113          	addi	sp,sp,-32
    1670:	000057b7          	lui	a5,0x5
    1674:	01212823          	sw	s2,16(sp)
    1678:	e2c7a903          	lw	s2,-468(a5) # 4e2c <OLED>
    167c:	01312623          	sw	s3,12(sp)
    1680:	000079b7          	lui	s3,0x7
    1684:	00912a23          	sw	s1,20(sp)
    1688:	01412423          	sw	s4,8(sp)
    168c:	00112e23          	sw	ra,28(sp)
    1690:	00812c23          	sw	s0,24(sp)
    1694:	00000493          	li	s1,0
    1698:	f7498993          	addi	s3,s3,-140 # 6f74 <framebuffer>
    169c:	00004a37          	lui	s4,0x4
    16a0:	013487b3          	add	a5,s1,s3
    16a4:	0007c403          	lbu	s0,0(a5)
    16a8:	00148493          	addi	s1,s1,1
    16ac:	00245413          	srli	s0,s0,0x2
    16b0:	40046413          	ori	s0,s0,1024
    16b4:	00892023          	sw	s0,0(s2)
    16b8:	00000097          	auipc	ra,0x0
    16bc:	e40080e7          	jalr	-448(ra) # 14f8 <oled_wait>
    16c0:	00892023          	sw	s0,0(s2)
    16c4:	00000097          	auipc	ra,0x0
    16c8:	e34080e7          	jalr	-460(ra) # 14f8 <oled_wait>
    16cc:	00892023          	sw	s0,0(s2)
    16d0:	00000097          	auipc	ra,0x0
    16d4:	e28080e7          	jalr	-472(ra) # 14f8 <oled_wait>
    16d8:	fd4494e3          	bne	s1,s4,16a0 <display_refresh+0x34>
    16dc:	01c12083          	lw	ra,28(sp)
    16e0:	01812403          	lw	s0,24(sp)
    16e4:	01412483          	lw	s1,20(sp)
    16e8:	01012903          	lw	s2,16(sp)
    16ec:	00c12983          	lw	s3,12(sp)
    16f0:	00812a03          	lw	s4,8(sp)
    16f4:	02010113          	addi	sp,sp,32
    16f8:	00008067          	ret

000016fc <print_string>:
    16fc:	ff010113          	addi	sp,sp,-16
    1700:	00812423          	sw	s0,8(sp)
    1704:	00912223          	sw	s1,4(sp)
    1708:	00112623          	sw	ra,12(sp)
    170c:	00050413          	mv	s0,a0
    1710:	000054b7          	lui	s1,0x5
    1714:	00044503          	lbu	a0,0(s0)
    1718:	00051c63          	bnez	a0,1730 <print_string+0x34>
    171c:	00c12083          	lw	ra,12(sp)
    1720:	00812403          	lw	s0,8(sp)
    1724:	00412483          	lw	s1,4(sp)
    1728:	01010113          	addi	sp,sp,16
    172c:	00008067          	ret
    1730:	33c4a783          	lw	a5,828(s1) # 533c <f_putchar>
    1734:	00140413          	addi	s0,s0,1
    1738:	000780e7          	jalr	a5
    173c:	fd9ff06f          	j	1714 <print_string+0x18>

00001740 <print_dec>:
    1740:	ef010113          	addi	sp,sp,-272
    1744:	10812423          	sw	s0,264(sp)
    1748:	10912223          	sw	s1,260(sp)
    174c:	10112623          	sw	ra,268(sp)
    1750:	11212023          	sw	s2,256(sp)
    1754:	00050413          	mv	s0,a0
    1758:	000054b7          	lui	s1,0x5
    175c:	08045063          	bgez	s0,17dc <print_dec+0x9c>
    1760:	33c4a783          	lw	a5,828(s1) # 533c <f_putchar>
    1764:	02d00513          	li	a0,45
    1768:	40800433          	neg	s0,s0
    176c:	000780e7          	jalr	a5
    1770:	fedff06f          	j	175c <print_dec+0x1c>
    1774:	00040513          	mv	a0,s0
    1778:	00a00593          	li	a1,10
    177c:	00000097          	auipc	ra,0x0
    1780:	97c080e7          	jalr	-1668(ra) # 10f8 <__divsi3>
    1784:	00251793          	slli	a5,a0,0x2
    1788:	00f507b3          	add	a5,a0,a5
    178c:	00179793          	slli	a5,a5,0x1
    1790:	40f40433          	sub	s0,s0,a5
    1794:	00148493          	addi	s1,s1,1
    1798:	fe848fa3          	sb	s0,-1(s1)
    179c:	00050413          	mv	s0,a0
    17a0:	fc041ae3          	bnez	s0,1774 <print_dec+0x34>
    17a4:	fd2488e3          	beq	s1,s2,1774 <print_dec+0x34>
    17a8:	00005437          	lui	s0,0x5
    17ac:	fff4c503          	lbu	a0,-1(s1)
    17b0:	33c42783          	lw	a5,828(s0) # 533c <f_putchar>
    17b4:	fff48493          	addi	s1,s1,-1
    17b8:	03050513          	addi	a0,a0,48
    17bc:	000780e7          	jalr	a5
    17c0:	ff2496e3          	bne	s1,s2,17ac <print_dec+0x6c>
    17c4:	10c12083          	lw	ra,268(sp)
    17c8:	10812403          	lw	s0,264(sp)
    17cc:	10412483          	lw	s1,260(sp)
    17d0:	10012903          	lw	s2,256(sp)
    17d4:	11010113          	addi	sp,sp,272
    17d8:	00008067          	ret
    17dc:	00010493          	mv	s1,sp
    17e0:	00010913          	mv	s2,sp
    17e4:	fbdff06f          	j	17a0 <print_dec+0x60>

000017e8 <print_hex_digits>:
    17e8:	fe010113          	addi	sp,sp,-32
    17ec:	00812c23          	sw	s0,24(sp)
    17f0:	00912a23          	sw	s1,20(sp)
    17f4:	fff58413          	addi	s0,a1,-1
    17f8:	000054b7          	lui	s1,0x5
    17fc:	01212823          	sw	s2,16(sp)
    1800:	01312623          	sw	s3,12(sp)
    1804:	00112e23          	sw	ra,28(sp)
    1808:	00050993          	mv	s3,a0
    180c:	00241413          	slli	s0,s0,0x2
    1810:	ed848493          	addi	s1,s1,-296 # 4ed8 <LEDS+0xa8>
    1814:	00005937          	lui	s2,0x5
    1818:	02045063          	bgez	s0,1838 <print_hex_digits+0x50>
    181c:	01c12083          	lw	ra,28(sp)
    1820:	01812403          	lw	s0,24(sp)
    1824:	01412483          	lw	s1,20(sp)
    1828:	01012903          	lw	s2,16(sp)
    182c:	00c12983          	lw	s3,12(sp)
    1830:	02010113          	addi	sp,sp,32
    1834:	00008067          	ret
    1838:	0089d7b3          	srl	a5,s3,s0
    183c:	00f7f793          	andi	a5,a5,15
    1840:	00f487b3          	add	a5,s1,a5
    1844:	33c92703          	lw	a4,828(s2) # 533c <f_putchar>
    1848:	0007c503          	lbu	a0,0(a5)
    184c:	ffc40413          	addi	s0,s0,-4
    1850:	000700e7          	jalr	a4
    1854:	fc5ff06f          	j	1818 <print_hex_digits+0x30>

00001858 <print_hex>:
    1858:	00800593          	li	a1,8
    185c:	00000317          	auipc	t1,0x0
    1860:	f8c30067          	jr	-116(t1) # 17e8 <print_hex_digits>

00001864 <printf>:
    1864:	fa010113          	addi	sp,sp,-96
    1868:	04f12a23          	sw	a5,84(sp)
    186c:	04410793          	addi	a5,sp,68
    1870:	02812c23          	sw	s0,56(sp)
    1874:	02912a23          	sw	s1,52(sp)
    1878:	03212823          	sw	s2,48(sp)
    187c:	03312623          	sw	s3,44(sp)
    1880:	03412423          	sw	s4,40(sp)
    1884:	03512223          	sw	s5,36(sp)
    1888:	03612023          	sw	s6,32(sp)
    188c:	02112e23          	sw	ra,60(sp)
    1890:	01712e23          	sw	s7,28(sp)
    1894:	00050413          	mv	s0,a0
    1898:	04b12223          	sw	a1,68(sp)
    189c:	04c12423          	sw	a2,72(sp)
    18a0:	04d12623          	sw	a3,76(sp)
    18a4:	04e12823          	sw	a4,80(sp)
    18a8:	05012c23          	sw	a6,88(sp)
    18ac:	05112e23          	sw	a7,92(sp)
    18b0:	00f12623          	sw	a5,12(sp)
    18b4:	02500913          	li	s2,37
    18b8:	000054b7          	lui	s1,0x5
    18bc:	07300993          	li	s3,115
    18c0:	07800a13          	li	s4,120
    18c4:	06400a93          	li	s5,100
    18c8:	06300b13          	li	s6,99
    18cc:	00044503          	lbu	a0,0(s0)
    18d0:	02051863          	bnez	a0,1900 <printf+0x9c>
    18d4:	03c12083          	lw	ra,60(sp)
    18d8:	03812403          	lw	s0,56(sp)
    18dc:	03412483          	lw	s1,52(sp)
    18e0:	03012903          	lw	s2,48(sp)
    18e4:	02c12983          	lw	s3,44(sp)
    18e8:	02812a03          	lw	s4,40(sp)
    18ec:	02412a83          	lw	s5,36(sp)
    18f0:	02012b03          	lw	s6,32(sp)
    18f4:	01c12b83          	lw	s7,28(sp)
    18f8:	06010113          	addi	sp,sp,96
    18fc:	00008067          	ret
    1900:	09251a63          	bne	a0,s2,1994 <printf+0x130>
    1904:	00144503          	lbu	a0,1(s0)
    1908:	00140b93          	addi	s7,s0,1
    190c:	03351463          	bne	a0,s3,1934 <printf+0xd0>
    1910:	00c12783          	lw	a5,12(sp)
    1914:	0007a503          	lw	a0,0(a5)
    1918:	00478713          	addi	a4,a5,4
    191c:	00e12623          	sw	a4,12(sp)
    1920:	00000097          	auipc	ra,0x0
    1924:	ddc080e7          	jalr	-548(ra) # 16fc <print_string>
    1928:	000b8413          	mv	s0,s7
    192c:	00140413          	addi	s0,s0,1
    1930:	f9dff06f          	j	18cc <printf+0x68>
    1934:	03451063          	bne	a0,s4,1954 <printf+0xf0>
    1938:	00c12783          	lw	a5,12(sp)
    193c:	0007a503          	lw	a0,0(a5)
    1940:	00478713          	addi	a4,a5,4
    1944:	00e12623          	sw	a4,12(sp)
    1948:	00000097          	auipc	ra,0x0
    194c:	f10080e7          	jalr	-240(ra) # 1858 <print_hex>
    1950:	fd9ff06f          	j	1928 <printf+0xc4>
    1954:	03551063          	bne	a0,s5,1974 <printf+0x110>
    1958:	00c12783          	lw	a5,12(sp)
    195c:	0007a503          	lw	a0,0(a5)
    1960:	00478713          	addi	a4,a5,4
    1964:	00e12623          	sw	a4,12(sp)
    1968:	00000097          	auipc	ra,0x0
    196c:	dd8080e7          	jalr	-552(ra) # 1740 <print_dec>
    1970:	fb9ff06f          	j	1928 <printf+0xc4>
    1974:	33c4a783          	lw	a5,828(s1) # 533c <f_putchar>
    1978:	01651a63          	bne	a0,s6,198c <printf+0x128>
    197c:	00c12703          	lw	a4,12(sp)
    1980:	00072503          	lw	a0,0(a4)
    1984:	00470693          	addi	a3,a4,4
    1988:	00d12623          	sw	a3,12(sp)
    198c:	000780e7          	jalr	a5
    1990:	f99ff06f          	j	1928 <printf+0xc4>
    1994:	33c4a783          	lw	a5,828(s1)
    1998:	000780e7          	jalr	a5
    199c:	f91ff06f          	j	192c <printf+0xc8>

000019a0 <__mulsi3>:
    19a0:	00050793          	mv	a5,a0
    19a4:	00000513          	li	a0,0
    19a8:	00079463          	bnez	a5,19b0 <__mulsi3+0x10>
    19ac:	00008067          	ret
    19b0:	01f79693          	slli	a3,a5,0x1f
    19b4:	41f6d713          	srai	a4,a3,0x1f
    19b8:	00b77733          	and	a4,a4,a1
    19bc:	00e50533          	add	a0,a0,a4
    19c0:	0017d793          	srli	a5,a5,0x1
    19c4:	00159593          	slli	a1,a1,0x1
    19c8:	fe1ff06f          	j	19a8 <__mulsi3+0x8>

000019cc <fat_list_insert_last>:
    19cc:	00452783          	lw	a5,4(a0)
    19d0:	04079263          	bnez	a5,1a14 <fat_list_insert_last+0x48>
    19d4:	00052783          	lw	a5,0(a0)
    19d8:	00079c63          	bnez	a5,19f0 <fat_list_insert_last+0x24>
    19dc:	00b52023          	sw	a1,0(a0)
    19e0:	00b52223          	sw	a1,4(a0)
    19e4:	0005a023          	sw	zero,0(a1)
    19e8:	0005a223          	sw	zero,4(a1)
    19ec:	00008067          	ret
    19f0:	0007a703          	lw	a4,0(a5)
    19f4:	00f5a223          	sw	a5,4(a1)
    19f8:	00e5a023          	sw	a4,0(a1)
    19fc:	00071863          	bnez	a4,1a0c <fat_list_insert_last+0x40>
    1a00:	00b52023          	sw	a1,0(a0)
    1a04:	00b7a023          	sw	a1,0(a5)
    1a08:	00008067          	ret
    1a0c:	00b72223          	sw	a1,4(a4)
    1a10:	ff5ff06f          	j	1a04 <fat_list_insert_last+0x38>
    1a14:	0047a703          	lw	a4,4(a5)
    1a18:	00f5a023          	sw	a5,0(a1)
    1a1c:	00e5a223          	sw	a4,4(a1)
    1a20:	00071863          	bnez	a4,1a30 <fat_list_insert_last+0x64>
    1a24:	00b52223          	sw	a1,4(a0)
    1a28:	00b7a223          	sw	a1,4(a5)
    1a2c:	00008067          	ret
    1a30:	00b72023          	sw	a1,0(a4)
    1a34:	ff5ff06f          	j	1a28 <fat_list_insert_last+0x5c>

00001a38 <FileString_StrCmpNoCase>:
    1a38:	00050e93          	mv	t4,a0
    1a3c:	00000793          	li	a5,0
    1a40:	01900e13          	li	t3,25
    1a44:	00c79663          	bne	a5,a2,1a50 <FileString_StrCmpNoCase+0x18>
    1a48:	00000513          	li	a0,0
    1a4c:	00008067          	ret
    1a50:	00fe8733          	add	a4,t4,a5
    1a54:	00074803          	lbu	a6,0(a4)
    1a58:	00f58733          	add	a4,a1,a5
    1a5c:	00074883          	lbu	a7,0(a4)
    1a60:	fbf80713          	addi	a4,a6,-65
    1a64:	0ff77713          	zext.b	a4,a4
    1a68:	00080693          	mv	a3,a6
    1a6c:	00ee6663          	bltu	t3,a4,1a78 <FileString_StrCmpNoCase+0x40>
    1a70:	02080693          	addi	a3,a6,32
    1a74:	0ff6f693          	zext.b	a3,a3
    1a78:	fbf88313          	addi	t1,a7,-65
    1a7c:	0ff37313          	zext.b	t1,t1
    1a80:	00088713          	mv	a4,a7
    1a84:	006e6663          	bltu	t3,t1,1a90 <FileString_StrCmpNoCase+0x58>
    1a88:	02088713          	addi	a4,a7,32
    1a8c:	0ff77713          	zext.b	a4,a4
    1a90:	40e68533          	sub	a0,a3,a4
    1a94:	00e69863          	bne	a3,a4,1aa4 <FileString_StrCmpNoCase+0x6c>
    1a98:	00178793          	addi	a5,a5,1
    1a9c:	00088463          	beqz	a7,1aa4 <FileString_StrCmpNoCase+0x6c>
    1aa0:	fa0812e3          	bnez	a6,1a44 <FileString_StrCmpNoCase+0xc>
    1aa4:	00008067          	ret

00001aa8 <FileString_GetExtension>:
    1aa8:	00050793          	mv	a5,a0
    1aac:	fff00713          	li	a4,-1
    1ab0:	02e00613          	li	a2,46
    1ab4:	0007c683          	lbu	a3,0(a5)
    1ab8:	00069663          	bnez	a3,1ac4 <FileString_GetExtension+0x1c>
    1abc:	00070513          	mv	a0,a4
    1ac0:	00008067          	ret
    1ac4:	00c69463          	bne	a3,a2,1acc <FileString_GetExtension+0x24>
    1ac8:	40a78733          	sub	a4,a5,a0
    1acc:	00178793          	addi	a5,a5,1
    1ad0:	fe5ff06f          	j	1ab4 <FileString_GetExtension+0xc>

00001ad4 <fatfs_fat_writeback>:
    1ad4:	00059e63          	bnez	a1,1af0 <fatfs_fat_writeback+0x1c>
    1ad8:	00000513          	li	a0,0
    1adc:	00008067          	ret
    1ae0:	00000513          	li	a0,0
    1ae4:	01c12083          	lw	ra,28(sp)
    1ae8:	02010113          	addi	sp,sp,32
    1aec:	00008067          	ret
    1af0:	2045a783          	lw	a5,516(a1)
    1af4:	04078e63          	beqz	a5,1b50 <fatfs_fat_writeback+0x7c>
    1af8:	03852683          	lw	a3,56(a0)
    1afc:	00050793          	mv	a5,a0
    1b00:	04068663          	beqz	a3,1b4c <fatfs_fat_writeback+0x78>
    1b04:	0147a703          	lw	a4,20(a5)
    1b08:	2005a503          	lw	a0,512(a1)
    1b0c:	0207a803          	lw	a6,32(a5)
    1b10:	00100613          	li	a2,1
    1b14:	fe010113          	addi	sp,sp,-32
    1b18:	40e607b3          	sub	a5,a2,a4
    1b1c:	00112e23          	sw	ra,28(sp)
    1b20:	00a787b3          	add	a5,a5,a0
    1b24:	00f87663          	bgeu	a6,a5,1b30 <fatfs_fat_writeback+0x5c>
    1b28:	01070733          	add	a4,a4,a6
    1b2c:	40a70633          	sub	a2,a4,a0
    1b30:	00b12623          	sw	a1,12(sp)
    1b34:	000680e7          	jalr	a3
    1b38:	fa0504e3          	beqz	a0,1ae0 <fatfs_fat_writeback+0xc>
    1b3c:	00c12583          	lw	a1,12(sp)
    1b40:	00100513          	li	a0,1
    1b44:	2005a223          	sw	zero,516(a1)
    1b48:	f9dff06f          	j	1ae4 <fatfs_fat_writeback+0x10>
    1b4c:	2005a223          	sw	zero,516(a1)
    1b50:	00100513          	li	a0,1
    1b54:	00008067          	ret

00001b58 <fatfs_fat_read_sector>:
    1b58:	fe010113          	addi	sp,sp,-32
    1b5c:	01212823          	sw	s2,16(sp)
    1b60:	25452903          	lw	s2,596(a0)
    1b64:	00812c23          	sw	s0,24(sp)
    1b68:	00112e23          	sw	ra,28(sp)
    1b6c:	00912a23          	sw	s1,20(sp)
    1b70:	01312623          	sw	s3,12(sp)
    1b74:	00000413          	li	s0,0
    1b78:	04091463          	bnez	s2,1bc0 <fatfs_fat_read_sector+0x68>
    1b7c:	25452783          	lw	a5,596(a0)
    1b80:	00058493          	mv	s1,a1
    1b84:	00050993          	mv	s3,a0
    1b88:	20f42623          	sw	a5,524(s0)
    1b8c:	20442783          	lw	a5,516(s0)
    1b90:	24852a23          	sw	s0,596(a0)
    1b94:	08079863          	bnez	a5,1c24 <fatfs_fat_read_sector+0xcc>
    1b98:	0349a783          	lw	a5,52(s3)
    1b9c:	20942023          	sw	s1,512(s0)
    1ba0:	00100613          	li	a2,1
    1ba4:	00040593          	mv	a1,s0
    1ba8:	00048513          	mv	a0,s1
    1bac:	000780e7          	jalr	a5
    1bb0:	08051463          	bnez	a0,1c38 <fatfs_fat_read_sector+0xe0>
    1bb4:	fff00793          	li	a5,-1
    1bb8:	20f42023          	sw	a5,512(s0)
    1bbc:	0480006f          	j	1c04 <fatfs_fat_read_sector+0xac>
    1bc0:	20092783          	lw	a5,512(s2)
    1bc4:	00f5e663          	bltu	a1,a5,1bd0 <fatfs_fat_read_sector+0x78>
    1bc8:	00178713          	addi	a4,a5,1
    1bcc:	02e5e463          	bltu	a1,a4,1bf4 <fatfs_fat_read_sector+0x9c>
    1bd0:	20c92783          	lw	a5,524(s2)
    1bd4:	00079663          	bnez	a5,1be0 <fatfs_fat_read_sector+0x88>
    1bd8:	00040a63          	beqz	s0,1bec <fatfs_fat_read_sector+0x94>
    1bdc:	20042623          	sw	zero,524(s0)
    1be0:	00090413          	mv	s0,s2
    1be4:	20c92903          	lw	s2,524(s2)
    1be8:	f91ff06f          	j	1b78 <fatfs_fat_read_sector+0x20>
    1bec:	24052a23          	sw	zero,596(a0)
    1bf0:	ff1ff06f          	j	1be0 <fatfs_fat_read_sector+0x88>
    1bf4:	40f585b3          	sub	a1,a1,a5
    1bf8:	00959593          	slli	a1,a1,0x9
    1bfc:	00b905b3          	add	a1,s2,a1
    1c00:	20b92423          	sw	a1,520(s2)
    1c04:	01c12083          	lw	ra,28(sp)
    1c08:	01812403          	lw	s0,24(sp)
    1c0c:	01412483          	lw	s1,20(sp)
    1c10:	00c12983          	lw	s3,12(sp)
    1c14:	00090513          	mv	a0,s2
    1c18:	01012903          	lw	s2,16(sp)
    1c1c:	02010113          	addi	sp,sp,32
    1c20:	00008067          	ret
    1c24:	00040593          	mv	a1,s0
    1c28:	00000097          	auipc	ra,0x0
    1c2c:	eac080e7          	jalr	-340(ra) # 1ad4 <fatfs_fat_writeback>
    1c30:	f60514e3          	bnez	a0,1b98 <fatfs_fat_read_sector+0x40>
    1c34:	fd1ff06f          	j	1c04 <fatfs_fat_read_sector+0xac>
    1c38:	20842423          	sw	s0,520(s0)
    1c3c:	00040913          	mv	s2,s0
    1c40:	fc5ff06f          	j	1c04 <fatfs_fat_read_sector+0xac>

00001c44 <_allocate_file>:
    1c44:	000057b7          	lui	a5,0x5
    1c48:	34078793          	addi	a5,a5,832 # 5340 <_free_file_list>
    1c4c:	0007a583          	lw	a1,0(a5)
    1c50:	06058263          	beqz	a1,1cb4 <_allocate_file+0x70>
    1c54:	0005a703          	lw	a4,0(a1)
    1c58:	fe010113          	addi	sp,sp,-32
    1c5c:	00112e23          	sw	ra,28(sp)
    1c60:	0045a683          	lw	a3,4(a1)
    1c64:	04071063          	bnez	a4,1ca4 <_allocate_file+0x60>
    1c68:	00d7a023          	sw	a3,0(a5)
    1c6c:	0045a683          	lw	a3,4(a1)
    1c70:	02069e63          	bnez	a3,1cac <_allocate_file+0x68>
    1c74:	00e7a223          	sw	a4,4(a5)
    1c78:	00005537          	lui	a0,0x5
    1c7c:	34850513          	addi	a0,a0,840 # 5348 <_open_file_list>
    1c80:	00b12623          	sw	a1,12(sp)
    1c84:	00000097          	auipc	ra,0x0
    1c88:	d48080e7          	jalr	-696(ra) # 19cc <fat_list_insert_last>
    1c8c:	00c12583          	lw	a1,12(sp)
    1c90:	01c12083          	lw	ra,28(sp)
    1c94:	bc458593          	addi	a1,a1,-1084
    1c98:	00058513          	mv	a0,a1
    1c9c:	02010113          	addi	sp,sp,32
    1ca0:	00008067          	ret
    1ca4:	00d72223          	sw	a3,4(a4)
    1ca8:	fc5ff06f          	j	1c6c <_allocate_file+0x28>
    1cac:	00e6a023          	sw	a4,0(a3)
    1cb0:	fc9ff06f          	j	1c78 <_allocate_file+0x34>
    1cb4:	00058513          	mv	a0,a1
    1cb8:	00008067          	ret

00001cbc <_free_file>:
    1cbc:	43c52783          	lw	a5,1084(a0)
    1cc0:	44052703          	lw	a4,1088(a0)
    1cc4:	43c50593          	addi	a1,a0,1084
    1cc8:	02079663          	bnez	a5,1cf4 <_free_file+0x38>
    1ccc:	000056b7          	lui	a3,0x5
    1cd0:	34e6a423          	sw	a4,840(a3) # 5348 <_open_file_list>
    1cd4:	44052703          	lw	a4,1088(a0)
    1cd8:	02071263          	bnez	a4,1cfc <_free_file+0x40>
    1cdc:	00005737          	lui	a4,0x5
    1ce0:	34f72623          	sw	a5,844(a4) # 534c <_open_file_list+0x4>
    1ce4:	00005537          	lui	a0,0x5
    1ce8:	34050513          	addi	a0,a0,832 # 5340 <_free_file_list>
    1cec:	00000317          	auipc	t1,0x0
    1cf0:	ce030067          	jr	-800(t1) # 19cc <fat_list_insert_last>
    1cf4:	00e7a223          	sw	a4,4(a5)
    1cf8:	fddff06f          	j	1cd4 <_free_file+0x18>
    1cfc:	00f72023          	sw	a5,0(a4)
    1d00:	fe5ff06f          	j	1ce4 <_free_file+0x28>

00001d04 <fatfs_lba_of_cluster>:
    1d04:	ff010113          	addi	sp,sp,-16
    1d08:	00812423          	sw	s0,8(sp)
    1d0c:	00112623          	sw	ra,12(sp)
    1d10:	00050413          	mv	s0,a0
    1d14:	ffe58513          	addi	a0,a1,-2
    1d18:	00044583          	lbu	a1,0(s0)
    1d1c:	00000097          	auipc	ra,0x0
    1d20:	c84080e7          	jalr	-892(ra) # 19a0 <__mulsi3>
    1d24:	00442783          	lw	a5,4(s0)
    1d28:	00f50533          	add	a0,a0,a5
    1d2c:	03042783          	lw	a5,48(s0)
    1d30:	00079863          	bnez	a5,1d40 <fatfs_lba_of_cluster+0x3c>
    1d34:	02845783          	lhu	a5,40(s0)
    1d38:	4047d793          	srai	a5,a5,0x4
    1d3c:	00f50533          	add	a0,a0,a5
    1d40:	00c12083          	lw	ra,12(sp)
    1d44:	00812403          	lw	s0,8(sp)
    1d48:	01010113          	addi	sp,sp,16
    1d4c:	00008067          	ret

00001d50 <fatfs_sector_read>:
    1d50:	03452783          	lw	a5,52(a0)
    1d54:	00058713          	mv	a4,a1
    1d58:	00070513          	mv	a0,a4
    1d5c:	00060593          	mv	a1,a2
    1d60:	00068613          	mv	a2,a3
    1d64:	00078067          	jr	a5

00001d68 <fatfs_sector_write>:
    1d68:	03852783          	lw	a5,56(a0)
    1d6c:	00058713          	mv	a4,a1
    1d70:	00070513          	mv	a0,a4
    1d74:	00060593          	mv	a1,a2
    1d78:	00068613          	mv	a2,a3
    1d7c:	00078067          	jr	a5

00001d80 <fatfs_write_sector>:
    1d80:	03852703          	lw	a4,56(a0)
    1d84:	0a070463          	beqz	a4,1e2c <fatfs_write_sector+0xac>
    1d88:	03052883          	lw	a7,48(a0)
    1d8c:	00050793          	mv	a5,a0
    1d90:	0115e833          	or	a6,a1,a7
    1d94:	02081e63          	bnez	a6,1dd0 <fatfs_write_sector+0x50>
    1d98:	01052583          	lw	a1,16(a0)
    1d9c:	08b67863          	bgeu	a2,a1,1e2c <fatfs_write_sector+0xac>
    1da0:	01c52503          	lw	a0,28(a0)
    1da4:	00c7a583          	lw	a1,12(a5)
    1da8:	00b50533          	add	a0,a0,a1
    1dac:	00c50533          	add	a0,a0,a2
    1db0:	00068863          	beqz	a3,1dc0 <fatfs_write_sector+0x40>
    1db4:	00100613          	li	a2,1
    1db8:	00068593          	mv	a1,a3
    1dbc:	00070067          	jr	a4
    1dc0:	24a7a223          	sw	a0,580(a5)
    1dc4:	00100613          	li	a2,1
    1dc8:	04478593          	addi	a1,a5,68
    1dcc:	ff1ff06f          	j	1dbc <fatfs_write_sector+0x3c>
    1dd0:	fe010113          	addi	sp,sp,-32
    1dd4:	00e12623          	sw	a4,12(sp)
    1dd8:	00d12423          	sw	a3,8(sp)
    1ddc:	00c12223          	sw	a2,4(sp)
    1de0:	00112e23          	sw	ra,28(sp)
    1de4:	00a12023          	sw	a0,0(sp)
    1de8:	00000097          	auipc	ra,0x0
    1dec:	f1c080e7          	jalr	-228(ra) # 1d04 <fatfs_lba_of_cluster>
    1df0:	00412603          	lw	a2,4(sp)
    1df4:	00812683          	lw	a3,8(sp)
    1df8:	00012783          	lw	a5,0(sp)
    1dfc:	00c12703          	lw	a4,12(sp)
    1e00:	00a60533          	add	a0,a2,a0
    1e04:	00068c63          	beqz	a3,1e1c <fatfs_write_sector+0x9c>
    1e08:	00100613          	li	a2,1
    1e0c:	00068593          	mv	a1,a3
    1e10:	01c12083          	lw	ra,28(sp)
    1e14:	02010113          	addi	sp,sp,32
    1e18:	fa5ff06f          	j	1dbc <fatfs_write_sector+0x3c>
    1e1c:	24a7a223          	sw	a0,580(a5)
    1e20:	00100613          	li	a2,1
    1e24:	04478593          	addi	a1,a5,68
    1e28:	fe9ff06f          	j	1e10 <fatfs_write_sector+0x90>
    1e2c:	00000513          	li	a0,0
    1e30:	00008067          	ret

00001e34 <fl_init>:
    1e34:	ff010113          	addi	sp,sp,-16
    1e38:	00005537          	lui	a0,0x5
    1e3c:	000057b7          	lui	a5,0x5
    1e40:	0000c5b7          	lui	a1,0xc
    1e44:	00112623          	sw	ra,12(sp)
    1e48:	34050513          	addi	a0,a0,832 # 5340 <_free_file_list>
    1e4c:	34878793          	addi	a5,a5,840 # 5348 <_open_file_list>
    1e50:	81858593          	addi	a1,a1,-2024 # b818 <_files+0x43c>
    1e54:	00052223          	sw	zero,4(a0)
    1e58:	00052023          	sw	zero,0(a0)
    1e5c:	0007a223          	sw	zero,4(a5)
    1e60:	0007a023          	sw	zero,0(a5)
    1e64:	00000097          	auipc	ra,0x0
    1e68:	b68080e7          	jalr	-1176(ra) # 19cc <fat_list_insert_last>
    1e6c:	000057b7          	lui	a5,0x5
    1e70:	0000c5b7          	lui	a1,0xc
    1e74:	34078513          	addi	a0,a5,832 # 5340 <_free_file_list>
    1e78:	c5c58593          	addi	a1,a1,-932 # bc5c <_files+0x880>
    1e7c:	00000097          	auipc	ra,0x0
    1e80:	b50080e7          	jalr	-1200(ra) # 19cc <fat_list_insert_last>
    1e84:	00c12083          	lw	ra,12(sp)
    1e88:	000057b7          	lui	a5,0x5
    1e8c:	00100713          	li	a4,1
    1e90:	34e7aa23          	sw	a4,852(a5) # 5354 <_filelib_init>
    1e94:	01010113          	addi	sp,sp,16
    1e98:	00008067          	ret

00001e9c <fl_fseek>:
    1e9c:	000057b7          	lui	a5,0x5
    1ea0:	3547a783          	lw	a5,852(a5) # 5354 <_filelib_init>
    1ea4:	fd010113          	addi	sp,sp,-48
    1ea8:	02812423          	sw	s0,40(sp)
    1eac:	02912223          	sw	s1,36(sp)
    1eb0:	01312e23          	sw	s3,28(sp)
    1eb4:	02112623          	sw	ra,44(sp)
    1eb8:	03212023          	sw	s2,32(sp)
    1ebc:	00050413          	mv	s0,a0
    1ec0:	00058493          	mv	s1,a1
    1ec4:	00060993          	mv	s3,a2
    1ec8:	00079663          	bnez	a5,1ed4 <fl_fseek+0x38>
    1ecc:	00000097          	auipc	ra,0x0
    1ed0:	f68080e7          	jalr	-152(ra) # 1e34 <fl_init>
    1ed4:	fff00513          	li	a0,-1
    1ed8:	08040263          	beqz	s0,1f5c <fl_fseek+0xc0>
    1edc:	00048663          	beqz	s1,1ee8 <fl_fseek+0x4c>
    1ee0:	ffe98793          	addi	a5,s3,-2
    1ee4:	06078c63          	beqz	a5,1f5c <fl_fseek+0xc0>
    1ee8:	0000b937          	lui	s2,0xb
    1eec:	f7490913          	addi	s2,s2,-140 # af74 <_fs>
    1ef0:	03c92783          	lw	a5,60(s2)
    1ef4:	00078463          	beqz	a5,1efc <fl_fseek+0x60>
    1ef8:	000780e7          	jalr	a5
    1efc:	fff00513          	li	a0,-1
    1f00:	42a42823          	sw	a0,1072(s0)
    1f04:	42042a23          	sw	zero,1076(s0)
    1f08:	00099c63          	bnez	s3,1f20 <fl_fseek+0x84>
    1f0c:	00c42783          	lw	a5,12(s0)
    1f10:	00942423          	sw	s1,8(s0)
    1f14:	0297f863          	bgeu	a5,s1,1f44 <fl_fseek+0xa8>
    1f18:	00f42423          	sw	a5,8(s0)
    1f1c:	0280006f          	j	1f44 <fl_fseek+0xa8>
    1f20:	00100793          	li	a5,1
    1f24:	06f99063          	bne	s3,a5,1f84 <fl_fseek+0xe8>
    1f28:	00842783          	lw	a5,8(s0)
    1f2c:	0004c663          	bltz	s1,1f38 <fl_fseek+0x9c>
    1f30:	00f484b3          	add	s1,s1,a5
    1f34:	fd9ff06f          	j	1f0c <fl_fseek+0x70>
    1f38:	40900733          	neg	a4,s1
    1f3c:	02e7fe63          	bgeu	a5,a4,1f78 <fl_fseek+0xdc>
    1f40:	00042423          	sw	zero,8(s0)
    1f44:	00000513          	li	a0,0
    1f48:	04092783          	lw	a5,64(s2)
    1f4c:	00078863          	beqz	a5,1f5c <fl_fseek+0xc0>
    1f50:	00a12623          	sw	a0,12(sp)
    1f54:	000780e7          	jalr	a5
    1f58:	00c12503          	lw	a0,12(sp)
    1f5c:	02c12083          	lw	ra,44(sp)
    1f60:	02812403          	lw	s0,40(sp)
    1f64:	02412483          	lw	s1,36(sp)
    1f68:	02012903          	lw	s2,32(sp)
    1f6c:	01c12983          	lw	s3,28(sp)
    1f70:	03010113          	addi	sp,sp,48
    1f74:	00008067          	ret
    1f78:	00f484b3          	add	s1,s1,a5
    1f7c:	00942423          	sw	s1,8(s0)
    1f80:	fc5ff06f          	j	1f44 <fl_fseek+0xa8>
    1f84:	00200793          	li	a5,2
    1f88:	fcf990e3          	bne	s3,a5,1f48 <fl_fseek+0xac>
    1f8c:	00c42783          	lw	a5,12(s0)
    1f90:	f89ff06f          	j	1f18 <fl_fseek+0x7c>

00001f94 <fl_closedir>:
    1f94:	00000513          	li	a0,0
    1f98:	00008067          	ret

00001f9c <fatfs_lfn_cache_entry>:
    1f9c:	0005c783          	lbu	a5,0(a1)
    1fa0:	01300693          	li	a3,19
    1fa4:	01f7f793          	andi	a5,a5,31
    1fa8:	fff78713          	addi	a4,a5,-1
    1fac:	0ff77613          	zext.b	a2,a4
    1fb0:	0ac6ea63          	bltu	a3,a2,2064 <fatfs_lfn_cache_entry+0xc8>
    1fb4:	10554683          	lbu	a3,261(a0)
    1fb8:	00069463          	bnez	a3,1fc0 <fatfs_lfn_cache_entry+0x24>
    1fbc:	10f502a3          	sb	a5,261(a0)
    1fc0:	00171793          	slli	a5,a4,0x1
    1fc4:	00e787b3          	add	a5,a5,a4
    1fc8:	0015c683          	lbu	a3,1(a1)
    1fcc:	00279793          	slli	a5,a5,0x2
    1fd0:	00e787b3          	add	a5,a5,a4
    1fd4:	00f50533          	add	a0,a0,a5
    1fd8:	00d50023          	sb	a3,0(a0)
    1fdc:	0035c783          	lbu	a5,3(a1)
    1fe0:	0ff00713          	li	a4,255
    1fe4:	02000693          	li	a3,32
    1fe8:	00f500a3          	sb	a5,1(a0)
    1fec:	0055c783          	lbu	a5,5(a1)
    1ff0:	00f50123          	sb	a5,2(a0)
    1ff4:	0075c783          	lbu	a5,7(a1)
    1ff8:	00f501a3          	sb	a5,3(a0)
    1ffc:	0095c783          	lbu	a5,9(a1)
    2000:	00f50223          	sb	a5,4(a0)
    2004:	00e5c783          	lbu	a5,14(a1)
    2008:	00f502a3          	sb	a5,5(a0)
    200c:	0105c783          	lbu	a5,16(a1)
    2010:	00f50323          	sb	a5,6(a0)
    2014:	0125c783          	lbu	a5,18(a1)
    2018:	00f503a3          	sb	a5,7(a0)
    201c:	0145c783          	lbu	a5,20(a1)
    2020:	00f50423          	sb	a5,8(a0)
    2024:	0165c783          	lbu	a5,22(a1)
    2028:	00f504a3          	sb	a5,9(a0)
    202c:	0185c783          	lbu	a5,24(a1)
    2030:	00f50523          	sb	a5,10(a0)
    2034:	01c5c783          	lbu	a5,28(a1)
    2038:	00f505a3          	sb	a5,11(a0)
    203c:	01e5c783          	lbu	a5,30(a1)
    2040:	00f50623          	sb	a5,12(a0)
    2044:	00d00793          	li	a5,13
    2048:	00054603          	lbu	a2,0(a0)
    204c:	00e61463          	bne	a2,a4,2054 <fatfs_lfn_cache_entry+0xb8>
    2050:	00d50023          	sb	a3,0(a0)
    2054:	fff78793          	addi	a5,a5,-1
    2058:	0ff7f793          	zext.b	a5,a5
    205c:	00150513          	addi	a0,a0,1
    2060:	fe0794e3          	bnez	a5,2048 <fatfs_lfn_cache_entry+0xac>
    2064:	00008067          	ret

00002068 <fatfs_lfn_cache_get>:
    2068:	10554703          	lbu	a4,261(a0)
    206c:	01400793          	li	a5,20
    2070:	00f71663          	bne	a4,a5,207c <fatfs_lfn_cache_get+0x14>
    2074:	10050223          	sb	zero,260(a0)
    2078:	00008067          	ret
    207c:	02070063          	beqz	a4,209c <fatfs_lfn_cache_get+0x34>
    2080:	00171793          	slli	a5,a4,0x1
    2084:	00e787b3          	add	a5,a5,a4
    2088:	00279793          	slli	a5,a5,0x2
    208c:	00e787b3          	add	a5,a5,a4
    2090:	00f507b3          	add	a5,a0,a5
    2094:	00078023          	sb	zero,0(a5)
    2098:	00008067          	ret
    209c:	00050023          	sb	zero,0(a0)
    20a0:	00008067          	ret

000020a4 <fatfs_entry_lfn_text>:
    20a4:	00b54503          	lbu	a0,11(a0)
    20a8:	00f57513          	andi	a0,a0,15
    20ac:	ff150513          	addi	a0,a0,-15
    20b0:	00153513          	seqz	a0,a0
    20b4:	00008067          	ret

000020b8 <fatfs_entry_lfn_invalid>:
    20b8:	00054783          	lbu	a5,0(a0)
    20bc:	f1b78713          	addi	a4,a5,-229
    20c0:	02070263          	beqz	a4,20e4 <fatfs_entry_lfn_invalid+0x2c>
    20c4:	02078063          	beqz	a5,20e4 <fatfs_entry_lfn_invalid+0x2c>
    20c8:	00b54783          	lbu	a5,11(a0)
    20cc:	00800713          	li	a4,8
    20d0:	00100513          	li	a0,1
    20d4:	00e78a63          	beq	a5,a4,20e8 <fatfs_entry_lfn_invalid+0x30>
    20d8:	0067f793          	andi	a5,a5,6
    20dc:	00f03533          	snez	a0,a5
    20e0:	00008067          	ret
    20e4:	00100513          	li	a0,1
    20e8:	00008067          	ret

000020ec <fatfs_entry_lfn_exists>:
    20ec:	00b5c783          	lbu	a5,11(a1)
    20f0:	00f00713          	li	a4,15
    20f4:	04e78063          	beq	a5,a4,2134 <fatfs_entry_lfn_exists+0x48>
    20f8:	0005c683          	lbu	a3,0(a1)
    20fc:	f1b68713          	addi	a4,a3,-229
    2100:	00e03733          	snez	a4,a4
    2104:	00d036b3          	snez	a3,a3
    2108:	00d77733          	and	a4,a4,a3
    210c:	02070463          	beqz	a4,2134 <fatfs_entry_lfn_exists+0x48>
    2110:	ff878713          	addi	a4,a5,-8
    2114:	02070063          	beqz	a4,2134 <fatfs_entry_lfn_exists+0x48>
    2118:	0067f713          	andi	a4,a5,6
    211c:	00000793          	li	a5,0
    2120:	00071663          	bnez	a4,212c <fatfs_entry_lfn_exists+0x40>
    2124:	10554783          	lbu	a5,261(a0)
    2128:	00f037b3          	snez	a5,a5
    212c:	00078513          	mv	a0,a5
    2130:	00008067          	ret
    2134:	00000793          	li	a5,0
    2138:	ff5ff06f          	j	212c <fatfs_entry_lfn_exists+0x40>

0000213c <fatfs_entry_sfn_only>:
    213c:	00b54783          	lbu	a5,11(a0)
    2140:	00f00713          	li	a4,15
    2144:	02e78863          	beq	a5,a4,2174 <fatfs_entry_sfn_only+0x38>
    2148:	00054683          	lbu	a3,0(a0)
    214c:	f1b68713          	addi	a4,a3,-229
    2150:	00e03733          	snez	a4,a4
    2154:	00d036b3          	snez	a3,a3
    2158:	00d77733          	and	a4,a4,a3
    215c:	00070c63          	beqz	a4,2174 <fatfs_entry_sfn_only+0x38>
    2160:	ff878713          	addi	a4,a5,-8
    2164:	00070863          	beqz	a4,2174 <fatfs_entry_sfn_only+0x38>
    2168:	0067f513          	andi	a0,a5,6
    216c:	00153513          	seqz	a0,a0
    2170:	00008067          	ret
    2174:	00000513          	li	a0,0
    2178:	00008067          	ret

0000217c <fatfs_entry_is_dir>:
    217c:	00b54503          	lbu	a0,11(a0)
    2180:	00455513          	srli	a0,a0,0x4
    2184:	00157513          	andi	a0,a0,1
    2188:	00008067          	ret

0000218c <fatfs_lfn_entries_required>:
    218c:	ff010113          	addi	sp,sp,-16
    2190:	00112623          	sw	ra,12(sp)
    2194:	fffff097          	auipc	ra,0xfffff
    2198:	058080e7          	jalr	88(ra) # 11ec <strlen>
    219c:	00050a63          	beqz	a0,21b0 <fatfs_lfn_entries_required+0x24>
    21a0:	00d00593          	li	a1,13
    21a4:	00c50513          	addi	a0,a0,12
    21a8:	fffff097          	auipc	ra,0xfffff
    21ac:	f50080e7          	jalr	-176(ra) # 10f8 <__divsi3>
    21b0:	00c12083          	lw	ra,12(sp)
    21b4:	01010113          	addi	sp,sp,16
    21b8:	00008067          	ret

000021bc <fatfs_filename_to_lfn>:
    21bc:	f9010113          	addi	sp,sp,-112
    21c0:	06812423          	sw	s0,104(sp)
    21c4:	00058413          	mv	s0,a1
    21c8:	000055b7          	lui	a1,0x5
    21cc:	10058593          	addi	a1,a1,256 # 5100 <font+0x1e0>
    21d0:	06912223          	sw	s1,100(sp)
    21d4:	05312e23          	sw	s3,92(sp)
    21d8:	00060493          	mv	s1,a2
    21dc:	00050993          	mv	s3,a0
    21e0:	03400613          	li	a2,52
    21e4:	01c10513          	addi	a0,sp,28
    21e8:	00d12623          	sw	a3,12(sp)
    21ec:	06112623          	sw	ra,108(sp)
    21f0:	07212023          	sw	s2,96(sp)
    21f4:	05412c23          	sw	s4,88(sp)
    21f8:	fffff097          	auipc	ra,0xfffff
    21fc:	fd0080e7          	jalr	-48(ra) # 11c8 <memcpy>
    2200:	00098513          	mv	a0,s3
    2204:	fffff097          	auipc	ra,0xfffff
    2208:	fe8080e7          	jalr	-24(ra) # 11ec <strlen>
    220c:	00050913          	mv	s2,a0
    2210:	00098513          	mv	a0,s3
    2214:	00000097          	auipc	ra,0x0
    2218:	f78080e7          	jalr	-136(ra) # 218c <fatfs_lfn_entries_required>
    221c:	00050a13          	mv	s4,a0
    2220:	02000613          	li	a2,32
    2224:	00000593          	li	a1,0
    2228:	00040513          	mv	a0,s0
    222c:	fffff097          	auipc	ra,0xfffff
    2230:	f80080e7          	jalr	-128(ra) # 11ac <memset>
    2234:	fffa0713          	addi	a4,s4,-1 # 3fff <fatfs_fat_add_cluster_to_chain+0x73>
    2238:	00c12683          	lw	a3,12(sp)
    223c:	00148793          	addi	a5,s1,1
    2240:	00971463          	bne	a4,s1,2248 <fatfs_filename_to_lfn+0x8c>
    2244:	0407e793          	ori	a5,a5,64
    2248:	00149613          	slli	a2,s1,0x1
    224c:	00960633          	add	a2,a2,s1
    2250:	00f40023          	sb	a5,0(s0)
    2254:	00261613          	slli	a2,a2,0x2
    2258:	00f00793          	li	a5,15
    225c:	00f405a3          	sb	a5,11(s0)
    2260:	00d406a3          	sb	a3,13(s0)
    2264:	01c10793          	addi	a5,sp,28
    2268:	00960633          	add	a2,a2,s1
    226c:	fff00693          	li	a3,-1
    2270:	0007a703          	lw	a4,0(a5)
    2274:	00e40733          	add	a4,s0,a4
    2278:	05265063          	bge	a2,s2,22b8 <fatfs_filename_to_lfn+0xfc>
    227c:	00c985b3          	add	a1,s3,a2
    2280:	0005c583          	lbu	a1,0(a1)
    2284:	00b70023          	sb	a1,0(a4)
    2288:	00478793          	addi	a5,a5,4
    228c:	05010713          	addi	a4,sp,80
    2290:	00160613          	addi	a2,a2,1
    2294:	fce79ee3          	bne	a5,a4,2270 <fatfs_filename_to_lfn+0xb4>
    2298:	06c12083          	lw	ra,108(sp)
    229c:	06812403          	lw	s0,104(sp)
    22a0:	06412483          	lw	s1,100(sp)
    22a4:	06012903          	lw	s2,96(sp)
    22a8:	05c12983          	lw	s3,92(sp)
    22ac:	05812a03          	lw	s4,88(sp)
    22b0:	07010113          	addi	sp,sp,112
    22b4:	00008067          	ret
    22b8:	01261663          	bne	a2,s2,22c4 <fatfs_filename_to_lfn+0x108>
    22bc:	00070023          	sb	zero,0(a4)
    22c0:	fc9ff06f          	j	2288 <fatfs_filename_to_lfn+0xcc>
    22c4:	00d70023          	sb	a3,0(a4)
    22c8:	00d700a3          	sb	a3,1(a4)
    22cc:	fbdff06f          	j	2288 <fatfs_filename_to_lfn+0xcc>

000022d0 <fatfs_sfn_create_entry>:
    22d0:	00000793          	li	a5,0
    22d4:	00b00813          	li	a6,11
    22d8:	00f508b3          	add	a7,a0,a5
    22dc:	0008c303          	lbu	t1,0(a7)
    22e0:	00f688b3          	add	a7,a3,a5
    22e4:	00178793          	addi	a5,a5,1
    22e8:	00688023          	sb	t1,0(a7)
    22ec:	ff0796e3          	bne	a5,a6,22d8 <fatfs_sfn_create_entry+0x8>
    22f0:	00e03733          	snez	a4,a4
    22f4:	40e00733          	neg	a4,a4
    22f8:	02000793          	li	a5,32
    22fc:	ff077713          	andi	a4,a4,-16
    2300:	00f70733          	add	a4,a4,a5
    2304:	00f68823          	sb	a5,16(a3)
    2308:	00f68923          	sb	a5,18(a3)
    230c:	00f68c23          	sb	a5,24(a3)
    2310:	01065793          	srli	a5,a2,0x10
    2314:	00f68a23          	sb	a5,20(a3)
    2318:	01865793          	srli	a5,a2,0x18
    231c:	00f68aa3          	sb	a5,21(a3)
    2320:	0085d793          	srli	a5,a1,0x8
    2324:	00c68d23          	sb	a2,26(a3)
    2328:	00b68e23          	sb	a1,28(a3)
    232c:	00865613          	srli	a2,a2,0x8
    2330:	00f68ea3          	sb	a5,29(a3)
    2334:	0105d793          	srli	a5,a1,0x10
    2338:	0185d593          	srli	a1,a1,0x18
    233c:	000686a3          	sb	zero,13(a3)
    2340:	00068723          	sb	zero,14(a3)
    2344:	000687a3          	sb	zero,15(a3)
    2348:	000688a3          	sb	zero,17(a3)
    234c:	000689a3          	sb	zero,19(a3)
    2350:	00068b23          	sb	zero,22(a3)
    2354:	00068ba3          	sb	zero,23(a3)
    2358:	00068ca3          	sb	zero,25(a3)
    235c:	00e685a3          	sb	a4,11(a3)
    2360:	00068623          	sb	zero,12(a3)
    2364:	00c68da3          	sb	a2,27(a3)
    2368:	00f68f23          	sb	a5,30(a3)
    236c:	00b68fa3          	sb	a1,31(a3)
    2370:	00008067          	ret

00002374 <fatfs_lfn_create_sfn>:
    2374:	fd010113          	addi	sp,sp,-48
    2378:	02912223          	sw	s1,36(sp)
    237c:	00050493          	mv	s1,a0
    2380:	00058513          	mv	a0,a1
    2384:	02812423          	sw	s0,40(sp)
    2388:	01312e23          	sw	s3,28(sp)
    238c:	00058413          	mv	s0,a1
    2390:	02112623          	sw	ra,44(sp)
    2394:	03212023          	sw	s2,32(sp)
    2398:	fffff097          	auipc	ra,0xfffff
    239c:	e54080e7          	jalr	-428(ra) # 11ec <strlen>
    23a0:	00044783          	lbu	a5,0(s0)
    23a4:	02e00993          	li	s3,46
    23a8:	15378063          	beq	a5,s3,24e8 <fatfs_lfn_create_sfn+0x174>
    23ac:	00b00613          	li	a2,11
    23b0:	02000593          	li	a1,32
    23b4:	00050913          	mv	s2,a0
    23b8:	00048513          	mv	a0,s1
    23bc:	fffff097          	auipc	ra,0xfffff
    23c0:	df0080e7          	jalr	-528(ra) # 11ac <memset>
    23c4:	00300613          	li	a2,3
    23c8:	02000593          	li	a1,32
    23cc:	00c10513          	addi	a0,sp,12
    23d0:	fffff097          	auipc	ra,0xfffff
    23d4:	ddc080e7          	jalr	-548(ra) # 11ac <memset>
    23d8:	fff00793          	li	a5,-1
    23dc:	00000713          	li	a4,0
    23e0:	0d274263          	blt	a4,s2,24a4 <fatfs_lfn_create_sfn+0x130>
    23e4:	fff00713          	li	a4,-1
    23e8:	0ee78863          	beq	a5,a4,24d8 <fatfs_lfn_create_sfn+0x164>
    23ec:	00178713          	addi	a4,a5,1
    23f0:	00c10693          	addi	a3,sp,12
    23f4:	00478613          	addi	a2,a5,4
    23f8:	0ce61263          	bne	a2,a4,24bc <fatfs_lfn_create_sfn+0x148>
    23fc:	00000613          	li	a2,0
    2400:	00000693          	li	a3,0
    2404:	01900813          	li	a6,25
    2408:	00800893          	li	a7,8
    240c:	02f6de63          	bge	a3,a5,2448 <fatfs_lfn_create_sfn+0xd4>
    2410:	00d40733          	add	a4,s0,a3
    2414:	00074703          	lbu	a4,0(a4)
    2418:	fe070513          	addi	a0,a4,-32
    241c:	0c050263          	beqz	a0,24e0 <fatfs_lfn_create_sfn+0x16c>
    2420:	fd270593          	addi	a1,a4,-46
    2424:	0a058e63          	beqz	a1,24e0 <fatfs_lfn_create_sfn+0x16c>
    2428:	f9f70593          	addi	a1,a4,-97
    242c:	0ff5f593          	zext.b	a1,a1
    2430:	00c48333          	add	t1,s1,a2
    2434:	00160613          	addi	a2,a2,1
    2438:	00b86463          	bltu	a6,a1,2440 <fatfs_lfn_create_sfn+0xcc>
    243c:	0ff57713          	zext.b	a4,a0
    2440:	00e30023          	sb	a4,0(t1)
    2444:	09161e63          	bne	a2,a7,24e0 <fatfs_lfn_create_sfn+0x16c>
    2448:	00c10793          	addi	a5,sp,12
    244c:	00800693          	li	a3,8
    2450:	01900513          	li	a0,25
    2454:	00b00593          	li	a1,11
    2458:	0007c703          	lbu	a4,0(a5)
    245c:	f9f70613          	addi	a2,a4,-97
    2460:	0ff67613          	zext.b	a2,a2
    2464:	00c56663          	bltu	a0,a2,2470 <fatfs_lfn_create_sfn+0xfc>
    2468:	fe070713          	addi	a4,a4,-32
    246c:	0ff77713          	zext.b	a4,a4
    2470:	00d48633          	add	a2,s1,a3
    2474:	00e60023          	sb	a4,0(a2)
    2478:	00168693          	addi	a3,a3,1
    247c:	00178793          	addi	a5,a5,1
    2480:	fcb69ce3          	bne	a3,a1,2458 <fatfs_lfn_create_sfn+0xe4>
    2484:	00100513          	li	a0,1
    2488:	02c12083          	lw	ra,44(sp)
    248c:	02812403          	lw	s0,40(sp)
    2490:	02412483          	lw	s1,36(sp)
    2494:	02012903          	lw	s2,32(sp)
    2498:	01c12983          	lw	s3,28(sp)
    249c:	03010113          	addi	sp,sp,48
    24a0:	00008067          	ret
    24a4:	00e406b3          	add	a3,s0,a4
    24a8:	0006c683          	lbu	a3,0(a3)
    24ac:	01369463          	bne	a3,s3,24b4 <fatfs_lfn_create_sfn+0x140>
    24b0:	00070793          	mv	a5,a4
    24b4:	00170713          	addi	a4,a4,1
    24b8:	f29ff06f          	j	23e0 <fatfs_lfn_create_sfn+0x6c>
    24bc:	01275863          	bge	a4,s2,24cc <fatfs_lfn_create_sfn+0x158>
    24c0:	00e405b3          	add	a1,s0,a4
    24c4:	0005c583          	lbu	a1,0(a1)
    24c8:	00b68023          	sb	a1,0(a3)
    24cc:	00170713          	addi	a4,a4,1
    24d0:	00168693          	addi	a3,a3,1
    24d4:	f25ff06f          	j	23f8 <fatfs_lfn_create_sfn+0x84>
    24d8:	00090793          	mv	a5,s2
    24dc:	f21ff06f          	j	23fc <fatfs_lfn_create_sfn+0x88>
    24e0:	00168693          	addi	a3,a3,1
    24e4:	f29ff06f          	j	240c <fatfs_lfn_create_sfn+0x98>
    24e8:	00000513          	li	a0,0
    24ec:	f9dff06f          	j	2488 <fatfs_lfn_create_sfn+0x114>

000024f0 <fatfs_lfn_generate_tail>:
    24f0:	000187b7          	lui	a5,0x18
    24f4:	69f78793          	addi	a5,a5,1695 # 1869f <__stacktop+0x869f>
    24f8:	16c7e463          	bltu	a5,a2,2660 <fatfs_lfn_generate_tail+0x170>
    24fc:	fa010113          	addi	sp,sp,-96
    2500:	04812c23          	sw	s0,88(sp)
    2504:	04912a23          	sw	s1,84(sp)
    2508:	03712e23          	sw	s7,60(sp)
    250c:	00060413          	mv	s0,a2
    2510:	00058b93          	mv	s7,a1
    2514:	00c00613          	li	a2,12
    2518:	00000593          	li	a1,0
    251c:	00050493          	mv	s1,a0
    2520:	00410513          	addi	a0,sp,4
    2524:	04112e23          	sw	ra,92(sp)
    2528:	05312623          	sw	s3,76(sp)
    252c:	05412423          	sw	s4,72(sp)
    2530:	05612023          	sw	s6,64(sp)
    2534:	05212823          	sw	s2,80(sp)
    2538:	05512223          	sw	s5,68(sp)
    253c:	fffff097          	auipc	ra,0xfffff
    2540:	c70080e7          	jalr	-912(ra) # 11ac <memset>
    2544:	000055b7          	lui	a1,0x5
    2548:	07e00793          	li	a5,126
    254c:	01100613          	li	a2,17
    2550:	ed858593          	addi	a1,a1,-296 # 4ed8 <LEDS+0xa8>
    2554:	01c10513          	addi	a0,sp,28
    2558:	01010993          	addi	s3,sp,16
    255c:	00f10223          	sb	a5,4(sp)
    2560:	00098a13          	mv	s4,s3
    2564:	fffff097          	auipc	ra,0xfffff
    2568:	c64080e7          	jalr	-924(ra) # 11c8 <memcpy>
    256c:	00900b13          	li	s6,9
    2570:	00a00593          	li	a1,10
    2574:	00040513          	mv	a0,s0
    2578:	fffff097          	auipc	ra,0xfffff
    257c:	bd0080e7          	jalr	-1072(ra) # 1148 <__umodsi3>
    2580:	03050793          	addi	a5,a0,48
    2584:	00278533          	add	a0,a5,sp
    2588:	fec54783          	lbu	a5,-20(a0)
    258c:	00098913          	mv	s2,s3
    2590:	00040513          	mv	a0,s0
    2594:	00a00593          	li	a1,10
    2598:	00f98023          	sb	a5,0(s3)
    259c:	00040a93          	mv	s5,s0
    25a0:	fffff097          	auipc	ra,0xfffff
    25a4:	b60080e7          	jalr	-1184(ra) # 1100 <__udivsi3>
    25a8:	00198993          	addi	s3,s3,1
    25ac:	00050413          	mv	s0,a0
    25b0:	fd5b60e3          	bltu	s6,s5,2570 <fatfs_lfn_generate_tail+0x80>
    25b4:	00098023          	sb	zero,0(s3)
    25b8:	00410713          	addi	a4,sp,4
    25bc:	00090793          	mv	a5,s2
    25c0:	0947f663          	bgeu	a5,s4,264c <fatfs_lfn_generate_tail+0x15c>
    25c4:	00f10713          	addi	a4,sp,15
    25c8:	00000793          	li	a5,0
    25cc:	00e96663          	bltu	s2,a4,25d8 <fatfs_lfn_generate_tail+0xe8>
    25d0:	41490933          	sub	s2,s2,s4
    25d4:	00190793          	addi	a5,s2,1
    25d8:	03078793          	addi	a5,a5,48
    25dc:	002787b3          	add	a5,a5,sp
    25e0:	000b8593          	mv	a1,s7
    25e4:	fc078aa3          	sb	zero,-43(a5)
    25e8:	00b00613          	li	a2,11
    25ec:	00048513          	mv	a0,s1
    25f0:	fffff097          	auipc	ra,0xfffff
    25f4:	bd8080e7          	jalr	-1064(ra) # 11c8 <memcpy>
    25f8:	00410513          	addi	a0,sp,4
    25fc:	fffff097          	auipc	ra,0xfffff
    2600:	bf0080e7          	jalr	-1040(ra) # 11ec <strlen>
    2604:	40a484b3          	sub	s1,s1,a0
    2608:	00050613          	mv	a2,a0
    260c:	00410593          	addi	a1,sp,4
    2610:	00848513          	addi	a0,s1,8
    2614:	fffff097          	auipc	ra,0xfffff
    2618:	bb4080e7          	jalr	-1100(ra) # 11c8 <memcpy>
    261c:	05c12083          	lw	ra,92(sp)
    2620:	05812403          	lw	s0,88(sp)
    2624:	05412483          	lw	s1,84(sp)
    2628:	05012903          	lw	s2,80(sp)
    262c:	04c12983          	lw	s3,76(sp)
    2630:	04812a03          	lw	s4,72(sp)
    2634:	04412a83          	lw	s5,68(sp)
    2638:	04012b03          	lw	s6,64(sp)
    263c:	03c12b83          	lw	s7,60(sp)
    2640:	00100513          	li	a0,1
    2644:	06010113          	addi	sp,sp,96
    2648:	00008067          	ret
    264c:	0007c683          	lbu	a3,0(a5)
    2650:	00170713          	addi	a4,a4,1
    2654:	fff78793          	addi	a5,a5,-1
    2658:	00d70023          	sb	a3,0(a4)
    265c:	f65ff06f          	j	25c0 <fatfs_lfn_generate_tail+0xd0>
    2660:	00000513          	li	a0,0
    2664:	00008067          	ret

00002668 <fatfs_total_path_levels>:
    2668:	fff00793          	li	a5,-1
    266c:	06050263          	beqz	a0,26d0 <fatfs_total_path_levels+0x68>
    2670:	00054703          	lbu	a4,0(a0)
    2674:	02f00793          	li	a5,47
    2678:	00f71863          	bne	a4,a5,2688 <fatfs_total_path_levels+0x20>
    267c:	00150513          	addi	a0,a0,1
    2680:	00000793          	li	a5,0
    2684:	0400006f          	j	26c4 <fatfs_total_path_levels+0x5c>
    2688:	00154703          	lbu	a4,1(a0)
    268c:	03a00793          	li	a5,58
    2690:	00f70a63          	beq	a4,a5,26a4 <fatfs_total_path_levels+0x3c>
    2694:	00254683          	lbu	a3,2(a0)
    2698:	05c00713          	li	a4,92
    269c:	fff00793          	li	a5,-1
    26a0:	02e69863          	bne	a3,a4,26d0 <fatfs_total_path_levels+0x68>
    26a4:	00350513          	addi	a0,a0,3
    26a8:	05c00713          	li	a4,92
    26ac:	fd5ff06f          	j	2680 <fatfs_total_path_levels+0x18>
    26b0:	00150513          	addi	a0,a0,1
    26b4:	00e68663          	beq	a3,a4,26c0 <fatfs_total_path_levels+0x58>
    26b8:	00054683          	lbu	a3,0(a0)
    26bc:	fe069ae3          	bnez	a3,26b0 <fatfs_total_path_levels+0x48>
    26c0:	00178793          	addi	a5,a5,1
    26c4:	00054683          	lbu	a3,0(a0)
    26c8:	fe0698e3          	bnez	a3,26b8 <fatfs_total_path_levels+0x50>
    26cc:	fff78793          	addi	a5,a5,-1
    26d0:	00078513          	mv	a0,a5
    26d4:	00008067          	ret

000026d8 <fatfs_get_substring>:
    26d8:	0cd05e63          	blez	a3,27b4 <fatfs_get_substring+0xdc>
    26dc:	0c050c63          	beqz	a0,27b4 <fatfs_get_substring+0xdc>
    26e0:	fe010113          	addi	sp,sp,-32
    26e4:	00812c23          	sw	s0,24(sp)
    26e8:	00112e23          	sw	ra,28(sp)
    26ec:	00912a23          	sw	s1,20(sp)
    26f0:	00054483          	lbu	s1,0(a0)
    26f4:	02f00793          	li	a5,47
    26f8:	00150413          	addi	s0,a0,1
    26fc:	02f48463          	beq	s1,a5,2724 <fatfs_get_substring+0x4c>
    2700:	00154703          	lbu	a4,1(a0)
    2704:	03a00793          	li	a5,58
    2708:	00f70a63          	beq	a4,a5,271c <fatfs_get_substring+0x44>
    270c:	00254803          	lbu	a6,2(a0)
    2710:	05c00713          	li	a4,92
    2714:	fff00793          	li	a5,-1
    2718:	04e81c63          	bne	a6,a4,2770 <fatfs_get_substring+0x98>
    271c:	00350413          	addi	s0,a0,3
    2720:	05c00493          	li	s1,92
    2724:	00040513          	mv	a0,s0
    2728:	00d12623          	sw	a3,12(sp)
    272c:	00c12423          	sw	a2,8(sp)
    2730:	00b12223          	sw	a1,4(sp)
    2734:	fffff097          	auipc	ra,0xfffff
    2738:	ab8080e7          	jalr	-1352(ra) # 11ec <strlen>
    273c:	00c12683          	lw	a3,12(sp)
    2740:	00412583          	lw	a1,4(sp)
    2744:	00812603          	lw	a2,8(sp)
    2748:	00000713          	li	a4,0
    274c:	00000813          	li	a6,0
    2750:	00000793          	li	a5,0
    2754:	fff68693          	addi	a3,a3,-1
    2758:	00e608b3          	add	a7,a2,a4
    275c:	02a7c663          	blt	a5,a0,2788 <fatfs_get_substring+0xb0>
    2760:	00088023          	sb	zero,0(a7)
    2764:	00064783          	lbu	a5,0(a2)
    2768:	0017b793          	seqz	a5,a5
    276c:	40f007b3          	neg	a5,a5
    2770:	01c12083          	lw	ra,28(sp)
    2774:	01812403          	lw	s0,24(sp)
    2778:	01412483          	lw	s1,20(sp)
    277c:	00078513          	mv	a0,a5
    2780:	02010113          	addi	sp,sp,32
    2784:	00008067          	ret
    2788:	00f40333          	add	t1,s0,a5
    278c:	00034303          	lbu	t1,0(t1)
    2790:	00931863          	bne	t1,s1,27a0 <fatfs_get_substring+0xc8>
    2794:	00180813          	addi	a6,a6,1
    2798:	00178793          	addi	a5,a5,1
    279c:	fbdff06f          	j	2758 <fatfs_get_substring+0x80>
    27a0:	feb81ce3          	bne	a6,a1,2798 <fatfs_get_substring+0xc0>
    27a4:	fed75ae3          	bge	a4,a3,2798 <fatfs_get_substring+0xc0>
    27a8:	00170713          	addi	a4,a4,1
    27ac:	00688023          	sb	t1,0(a7)
    27b0:	fe9ff06f          	j	2798 <fatfs_get_substring+0xc0>
    27b4:	fff00793          	li	a5,-1
    27b8:	00078513          	mv	a0,a5
    27bc:	00008067          	ret

000027c0 <fatfs_split_path>:
    27c0:	fd010113          	addi	sp,sp,-48
    27c4:	02912223          	sw	s1,36(sp)
    27c8:	03212023          	sw	s2,32(sp)
    27cc:	01312e23          	sw	s3,28(sp)
    27d0:	01412c23          	sw	s4,24(sp)
    27d4:	02112623          	sw	ra,44(sp)
    27d8:	02812423          	sw	s0,40(sp)
    27dc:	01512a23          	sw	s5,20(sp)
    27e0:	00050993          	mv	s3,a0
    27e4:	00058493          	mv	s1,a1
    27e8:	00060913          	mv	s2,a2
    27ec:	00068a13          	mv	s4,a3
    27f0:	00e12623          	sw	a4,12(sp)
    27f4:	00000097          	auipc	ra,0x0
    27f8:	e74080e7          	jalr	-396(ra) # 2668 <fatfs_total_path_levels>
    27fc:	fff00793          	li	a5,-1
    2800:	02f51863          	bne	a0,a5,2830 <fatfs_split_path+0x70>
    2804:	fff00413          	li	s0,-1
    2808:	02c12083          	lw	ra,44(sp)
    280c:	00040513          	mv	a0,s0
    2810:	02812403          	lw	s0,40(sp)
    2814:	02412483          	lw	s1,36(sp)
    2818:	02012903          	lw	s2,32(sp)
    281c:	01c12983          	lw	s3,28(sp)
    2820:	01812a03          	lw	s4,24(sp)
    2824:	01412a83          	lw	s5,20(sp)
    2828:	03010113          	addi	sp,sp,48
    282c:	00008067          	ret
    2830:	00c12683          	lw	a3,12(sp)
    2834:	00050593          	mv	a1,a0
    2838:	00a12623          	sw	a0,12(sp)
    283c:	000a0613          	mv	a2,s4
    2840:	00098513          	mv	a0,s3
    2844:	00000097          	auipc	ra,0x0
    2848:	e94080e7          	jalr	-364(ra) # 26d8 <fatfs_get_substring>
    284c:	00050413          	mv	s0,a0
    2850:	fa051ae3          	bnez	a0,2804 <fatfs_split_path+0x44>
    2854:	00c12583          	lw	a1,12(sp)
    2858:	00059663          	bnez	a1,2864 <fatfs_split_path+0xa4>
    285c:	00048023          	sb	zero,0(s1)
    2860:	fa9ff06f          	j	2808 <fatfs_split_path+0x48>
    2864:	00098513          	mv	a0,s3
    2868:	fffff097          	auipc	ra,0xfffff
    286c:	984080e7          	jalr	-1660(ra) # 11ec <strlen>
    2870:	00050a93          	mv	s5,a0
    2874:	000a0513          	mv	a0,s4
    2878:	fffff097          	auipc	ra,0xfffff
    287c:	974080e7          	jalr	-1676(ra) # 11ec <strlen>
    2880:	40aa8633          	sub	a2,s5,a0
    2884:	00c95463          	bge	s2,a2,288c <fatfs_split_path+0xcc>
    2888:	00090613          	mv	a2,s2
    288c:	00048513          	mv	a0,s1
    2890:	00098593          	mv	a1,s3
    2894:	00c12623          	sw	a2,12(sp)
    2898:	fffff097          	auipc	ra,0xfffff
    289c:	930080e7          	jalr	-1744(ra) # 11c8 <memcpy>
    28a0:	00c12603          	lw	a2,12(sp)
    28a4:	00c484b3          	add	s1,s1,a2
    28a8:	fe048fa3          	sb	zero,-1(s1)
    28ac:	f5dff06f          	j	2808 <fatfs_split_path+0x48>

000028b0 <fatfs_compare_names>:
    28b0:	fd010113          	addi	sp,sp,-48
    28b4:	02112623          	sw	ra,44(sp)
    28b8:	03212023          	sw	s2,32(sp)
    28bc:	01312e23          	sw	s3,28(sp)
    28c0:	01412c23          	sw	s4,24(sp)
    28c4:	01512a23          	sw	s5,20(sp)
    28c8:	00058a13          	mv	s4,a1
    28cc:	02812423          	sw	s0,40(sp)
    28d0:	02912223          	sw	s1,36(sp)
    28d4:	01612823          	sw	s6,16(sp)
    28d8:	01712623          	sw	s7,12(sp)
    28dc:	01812423          	sw	s8,8(sp)
    28e0:	00050a93          	mv	s5,a0
    28e4:	fffff097          	auipc	ra,0xfffff
    28e8:	1c4080e7          	jalr	452(ra) # 1aa8 <FileString_GetExtension>
    28ec:	00050993          	mv	s3,a0
    28f0:	000a0513          	mv	a0,s4
    28f4:	fffff097          	auipc	ra,0xfffff
    28f8:	1b4080e7          	jalr	436(ra) # 1aa8 <FileString_GetExtension>
    28fc:	fff00793          	li	a5,-1
    2900:	00050913          	mv	s2,a0
    2904:	02f99e63          	bne	s3,a5,2940 <fatfs_compare_names+0x90>
    2908:	0f350063          	beq	a0,s3,29e8 <fatfs_compare_names+0x138>
    290c:	00000513          	li	a0,0
    2910:	02c12083          	lw	ra,44(sp)
    2914:	02812403          	lw	s0,40(sp)
    2918:	02412483          	lw	s1,36(sp)
    291c:	02012903          	lw	s2,32(sp)
    2920:	01c12983          	lw	s3,28(sp)
    2924:	01812a03          	lw	s4,24(sp)
    2928:	01412a83          	lw	s5,20(sp)
    292c:	01012b03          	lw	s6,16(sp)
    2930:	00c12b83          	lw	s7,12(sp)
    2934:	00812c03          	lw	s8,8(sp)
    2938:	03010113          	addi	sp,sp,48
    293c:	00008067          	ret
    2940:	fcf506e3          	beq	a0,a5,290c <fatfs_compare_names+0x5c>
    2944:	00198793          	addi	a5,s3,1
    2948:	00fa8b33          	add	s6,s5,a5
    294c:	00050413          	mv	s0,a0
    2950:	00150793          	addi	a5,a0,1
    2954:	000b0513          	mv	a0,s6
    2958:	00fa0bb3          	add	s7,s4,a5
    295c:	fffff097          	auipc	ra,0xfffff
    2960:	890080e7          	jalr	-1904(ra) # 11ec <strlen>
    2964:	00050c13          	mv	s8,a0
    2968:	000b8513          	mv	a0,s7
    296c:	00098493          	mv	s1,s3
    2970:	fffff097          	auipc	ra,0xfffff
    2974:	87c080e7          	jalr	-1924(ra) # 11ec <strlen>
    2978:	f8ac1ae3          	bne	s8,a0,290c <fatfs_compare_names+0x5c>
    297c:	000b0513          	mv	a0,s6
    2980:	fffff097          	auipc	ra,0xfffff
    2984:	86c080e7          	jalr	-1940(ra) # 11ec <strlen>
    2988:	00050613          	mv	a2,a0
    298c:	000b8593          	mv	a1,s7
    2990:	000b0513          	mv	a0,s6
    2994:	fffff097          	auipc	ra,0xfffff
    2998:	0a4080e7          	jalr	164(ra) # 1a38 <FileString_StrCmpNoCase>
    299c:	f60518e3          	bnez	a0,290c <fatfs_compare_names+0x5c>
    29a0:	fff48793          	addi	a5,s1,-1
    29a4:	00fa87b3          	add	a5,s5,a5
    29a8:	41378733          	sub	a4,a5,s3
    29ac:	02000693          	li	a3,32
    29b0:	06e79263          	bne	a5,a4,2a14 <fatfs_compare_names+0x164>
    29b4:	fff40793          	addi	a5,s0,-1
    29b8:	00fa07b3          	add	a5,s4,a5
    29bc:	41278733          	sub	a4,a5,s2
    29c0:	02000693          	li	a3,32
    29c4:	06e79263          	bne	a5,a4,2a28 <fatfs_compare_names+0x178>
    29c8:	f53912e3          	bne	s2,s3,290c <fatfs_compare_names+0x5c>
    29cc:	00090613          	mv	a2,s2
    29d0:	000a0593          	mv	a1,s4
    29d4:	000a8513          	mv	a0,s5
    29d8:	fffff097          	auipc	ra,0xfffff
    29dc:	060080e7          	jalr	96(ra) # 1a38 <FileString_StrCmpNoCase>
    29e0:	00153513          	seqz	a0,a0
    29e4:	f2dff06f          	j	2910 <fatfs_compare_names+0x60>
    29e8:	000a8513          	mv	a0,s5
    29ec:	fffff097          	auipc	ra,0xfffff
    29f0:	800080e7          	jalr	-2048(ra) # 11ec <strlen>
    29f4:	00050493          	mv	s1,a0
    29f8:	00050993          	mv	s3,a0
    29fc:	000a0513          	mv	a0,s4
    2a00:	ffffe097          	auipc	ra,0xffffe
    2a04:	7ec080e7          	jalr	2028(ra) # 11ec <strlen>
    2a08:	00050413          	mv	s0,a0
    2a0c:	00050913          	mv	s2,a0
    2a10:	f91ff06f          	j	29a0 <fatfs_compare_names+0xf0>
    2a14:	0007c603          	lbu	a2,0(a5)
    2a18:	f8d61ee3          	bne	a2,a3,29b4 <fatfs_compare_names+0x104>
    2a1c:	415789b3          	sub	s3,a5,s5
    2a20:	fff78793          	addi	a5,a5,-1
    2a24:	f8dff06f          	j	29b0 <fatfs_compare_names+0x100>
    2a28:	0007c603          	lbu	a2,0(a5)
    2a2c:	f8d61ee3          	bne	a2,a3,29c8 <fatfs_compare_names+0x118>
    2a30:	41478933          	sub	s2,a5,s4
    2a34:	fff78793          	addi	a5,a5,-1
    2a38:	f8dff06f          	j	29c4 <fatfs_compare_names+0x114>

00002a3c <_check_file_open>:
    2a3c:	fe010113          	addi	sp,sp,-32
    2a40:	000057b7          	lui	a5,0x5
    2a44:	00812c23          	sw	s0,24(sp)
    2a48:	3487a403          	lw	s0,840(a5) # 5348 <_open_file_list>
    2a4c:	00912a23          	sw	s1,20(sp)
    2a50:	00112e23          	sw	ra,28(sp)
    2a54:	01212823          	sw	s2,16(sp)
    2a58:	01312623          	sw	s3,12(sp)
    2a5c:	00050493          	mv	s1,a0
    2a60:	00041663          	bnez	s0,2a6c <_check_file_open+0x30>
    2a64:	00000513          	li	a0,0
    2a68:	03c0006f          	j	2aa4 <_check_file_open+0x68>
    2a6c:	bc440793          	addi	a5,s0,-1084
    2a70:	00f49663          	bne	s1,a5,2a7c <_check_file_open+0x40>
    2a74:	00442403          	lw	s0,4(s0)
    2a78:	fe9ff06f          	j	2a60 <_check_file_open+0x24>
    2a7c:	01448593          	addi	a1,s1,20
    2a80:	bd840513          	addi	a0,s0,-1064
    2a84:	00000097          	auipc	ra,0x0
    2a88:	e2c080e7          	jalr	-468(ra) # 28b0 <fatfs_compare_names>
    2a8c:	fe0504e3          	beqz	a0,2a74 <_check_file_open+0x38>
    2a90:	11848593          	addi	a1,s1,280
    2a94:	cdc40513          	addi	a0,s0,-804
    2a98:	00000097          	auipc	ra,0x0
    2a9c:	e18080e7          	jalr	-488(ra) # 28b0 <fatfs_compare_names>
    2aa0:	fc050ae3          	beqz	a0,2a74 <_check_file_open+0x38>
    2aa4:	01c12083          	lw	ra,28(sp)
    2aa8:	01812403          	lw	s0,24(sp)
    2aac:	01412483          	lw	s1,20(sp)
    2ab0:	01012903          	lw	s2,16(sp)
    2ab4:	00c12983          	lw	s3,12(sp)
    2ab8:	02010113          	addi	sp,sp,32
    2abc:	00008067          	ret

00002ac0 <fatfs_get_sfn_display_name>:
    2ac0:	00000713          	li	a4,0
    2ac4:	02000613          	li	a2,32
    2ac8:	01900813          	li	a6,25
    2acc:	0005c783          	lbu	a5,0(a1)
    2ad0:	00078663          	beqz	a5,2adc <fatfs_get_sfn_display_name+0x1c>
    2ad4:	ff470693          	addi	a3,a4,-12
    2ad8:	00069863          	bnez	a3,2ae8 <fatfs_get_sfn_display_name+0x28>
    2adc:	00050023          	sb	zero,0(a0)
    2ae0:	00100513          	li	a0,1
    2ae4:	00008067          	ret
    2ae8:	00158593          	addi	a1,a1,1
    2aec:	fec780e3          	beq	a5,a2,2acc <fatfs_get_sfn_display_name+0xc>
    2af0:	fbf78693          	addi	a3,a5,-65
    2af4:	0ff6f693          	zext.b	a3,a3
    2af8:	00d86663          	bltu	a6,a3,2b04 <fatfs_get_sfn_display_name+0x44>
    2afc:	02078793          	addi	a5,a5,32
    2b00:	0ff7f793          	zext.b	a5,a5
    2b04:	00f50023          	sb	a5,0(a0)
    2b08:	00170713          	addi	a4,a4,1
    2b0c:	00150513          	addi	a0,a0,1
    2b10:	fbdff06f          	j	2acc <fatfs_get_sfn_display_name+0xc>

00002b14 <fatfs_fat_init>:
    2b14:	ff010113          	addi	sp,sp,-16
    2b18:	00812423          	sw	s0,8(sp)
    2b1c:	00912223          	sw	s1,4(sp)
    2b20:	00112623          	sw	ra,12(sp)
    2b24:	fff00793          	li	a5,-1
    2b28:	25850493          	addi	s1,a0,600
    2b2c:	00050413          	mv	s0,a0
    2b30:	44f52c23          	sw	a5,1112(a0)
    2b34:	24052a23          	sw	zero,596(a0)
    2b38:	44052e23          	sw	zero,1116(a0)
    2b3c:	20000613          	li	a2,512
    2b40:	00048513          	mv	a0,s1
    2b44:	00000593          	li	a1,0
    2b48:	ffffe097          	auipc	ra,0xffffe
    2b4c:	664080e7          	jalr	1636(ra) # 11ac <memset>
    2b50:	25442783          	lw	a5,596(s0)
    2b54:	00c12083          	lw	ra,12(sp)
    2b58:	24942a23          	sw	s1,596(s0)
    2b5c:	46042023          	sw	zero,1120(s0)
    2b60:	46f42223          	sw	a5,1124(s0)
    2b64:	00812403          	lw	s0,8(sp)
    2b68:	00412483          	lw	s1,4(sp)
    2b6c:	01010113          	addi	sp,sp,16
    2b70:	00008067          	ret

00002b74 <fatfs_init>:
    2b74:	fd010113          	addi	sp,sp,-48
    2b78:	02812423          	sw	s0,40(sp)
    2b7c:	02112623          	sw	ra,44(sp)
    2b80:	02912223          	sw	s1,36(sp)
    2b84:	03212023          	sw	s2,32(sp)
    2b88:	01312e23          	sw	s3,28(sp)
    2b8c:	fff00793          	li	a5,-1
    2b90:	24f52223          	sw	a5,580(a0)
    2b94:	24052423          	sw	zero,584(a0)
    2b98:	02052223          	sw	zero,36(a0)
    2b9c:	00050413          	mv	s0,a0
    2ba0:	00000097          	auipc	ra,0x0
    2ba4:	f74080e7          	jalr	-140(ra) # 2b14 <fatfs_fat_init>
    2ba8:	03442783          	lw	a5,52(s0)
    2bac:	02079463          	bnez	a5,2bd4 <fatfs_init+0x60>
    2bb0:	fff00713          	li	a4,-1
    2bb4:	02c12083          	lw	ra,44(sp)
    2bb8:	02812403          	lw	s0,40(sp)
    2bbc:	02412483          	lw	s1,36(sp)
    2bc0:	02012903          	lw	s2,32(sp)
    2bc4:	01c12983          	lw	s3,28(sp)
    2bc8:	00070513          	mv	a0,a4
    2bcc:	03010113          	addi	sp,sp,48
    2bd0:	00008067          	ret
    2bd4:	04440593          	addi	a1,s0,68
    2bd8:	00100613          	li	a2,1
    2bdc:	00000513          	li	a0,0
    2be0:	00b12623          	sw	a1,12(sp)
    2be4:	000780e7          	jalr	a5
    2be8:	fc0504e3          	beqz	a0,2bb0 <fatfs_init+0x3c>
    2bec:	24244703          	lbu	a4,578(s0)
    2bf0:	05500793          	li	a5,85
    2bf4:	00c12583          	lw	a1,12(sp)
    2bf8:	00f70663          	beq	a4,a5,2c04 <fatfs_init+0x90>
    2bfc:	ffd00713          	li	a4,-3
    2c00:	fb5ff06f          	j	2bb4 <fatfs_init+0x40>
    2c04:	24344703          	lbu	a4,579(s0)
    2c08:	0aa00793          	li	a5,170
    2c0c:	fef718e3          	bne	a4,a5,2bfc <fatfs_init+0x88>
    2c10:	20644783          	lbu	a5,518(s0)
    2c14:	00600713          	li	a4,6
    2c18:	02f76463          	bltu	a4,a5,2c40 <fatfs_init+0xcc>
    2c1c:	00400713          	li	a4,4
    2c20:	00f76663          	bltu	a4,a5,2c2c <fatfs_init+0xb8>
    2c24:	00000513          	li	a0,0
    2c28:	02078663          	beqz	a5,2c54 <fatfs_init+0xe0>
    2c2c:	20c45503          	lhu	a0,524(s0)
    2c30:	20a45783          	lhu	a5,522(s0)
    2c34:	01051513          	slli	a0,a0,0x10
    2c38:	00f56533          	or	a0,a0,a5
    2c3c:	0180006f          	j	2c54 <fatfs_init+0xe0>
    2c40:	00c00713          	li	a4,12
    2c44:	12f76663          	bltu	a4,a5,2d70 <fatfs_init+0x1fc>
    2c48:	00a00713          	li	a4,10
    2c4c:	00000513          	li	a0,0
    2c50:	fcf76ee3          	bltu	a4,a5,2c2c <fatfs_init+0xb8>
    2c54:	03442783          	lw	a5,52(s0)
    2c58:	00a42e23          	sw	a0,28(s0)
    2c5c:	00100613          	li	a2,1
    2c60:	000780e7          	jalr	a5
    2c64:	f40506e3          	beqz	a0,2bb0 <fatfs_init+0x3c>
    2c68:	05044783          	lbu	a5,80(s0)
    2c6c:	04f44703          	lbu	a4,79(s0)
    2c70:	20000693          	li	a3,512
    2c74:	00879793          	slli	a5,a5,0x8
    2c78:	00e7e7b3          	or	a5,a5,a4
    2c7c:	ffe00713          	li	a4,-2
    2c80:	f2d79ae3          	bne	a5,a3,2bb4 <fatfs_init+0x40>
    2c84:	05644483          	lbu	s1,86(s0)
    2c88:	05544783          	lbu	a5,85(s0)
    2c8c:	05144983          	lbu	s3,81(s0)
    2c90:	00849493          	slli	s1,s1,0x8
    2c94:	05a45583          	lhu	a1,90(s0)
    2c98:	00f4e4b3          	or	s1,s1,a5
    2c9c:	01340023          	sb	s3,0(s0)
    2ca0:	02941423          	sh	s1,40(s0)
    2ca4:	05245903          	lhu	s2,82(s0)
    2ca8:	05444503          	lbu	a0,84(s0)
    2cac:	00059463          	bnez	a1,2cb4 <fatfs_init+0x140>
    2cb0:	06842583          	lw	a1,104(s0)
    2cb4:	07042783          	lw	a5,112(s0)
    2cb8:	02b42023          	sw	a1,32(s0)
    2cbc:	00549493          	slli	s1,s1,0x5
    2cc0:	00f42423          	sw	a5,8(s0)
    2cc4:	07445783          	lhu	a5,116(s0)
    2cc8:	1ff48493          	addi	s1,s1,511
    2ccc:	4094d493          	srai	s1,s1,0x9
    2cd0:	00f41c23          	sh	a5,24(s0)
    2cd4:	fffff097          	auipc	ra,0xfffff
    2cd8:	ccc080e7          	jalr	-820(ra) # 19a0 <__mulsi3>
    2cdc:	00a907b3          	add	a5,s2,a0
    2ce0:	00f42623          	sw	a5,12(s0)
    2ce4:	01c42783          	lw	a5,28(s0)
    2ce8:	24245703          	lhu	a4,578(s0)
    2cec:	00942823          	sw	s1,16(s0)
    2cf0:	00f907b3          	add	a5,s2,a5
    2cf4:	00f42a23          	sw	a5,20(s0)
    2cf8:	00f507b3          	add	a5,a0,a5
    2cfc:	00f42223          	sw	a5,4(s0)
    2d00:	0000b7b7          	lui	a5,0xb
    2d04:	a5578793          	addi	a5,a5,-1451 # aa55 <framebuffer+0x3ae1>
    2d08:	eef71ae3          	bne	a4,a5,2bfc <fatfs_init+0x88>
    2d0c:	05844783          	lbu	a5,88(s0)
    2d10:	05744703          	lbu	a4,87(s0)
    2d14:	00879793          	slli	a5,a5,0x8
    2d18:	00e7e7b3          	or	a5,a5,a4
    2d1c:	00079463          	bnez	a5,2d24 <fatfs_init+0x1b0>
    2d20:	06442783          	lw	a5,100(s0)
    2d24:	ffb00713          	li	a4,-5
    2d28:	e80986e3          	beqz	s3,2bb4 <fatfs_init+0x40>
    2d2c:	00990933          	add	s2,s2,s1
    2d30:	00a90533          	add	a0,s2,a0
    2d34:	40a78533          	sub	a0,a5,a0
    2d38:	00098593          	mv	a1,s3
    2d3c:	ffffe097          	auipc	ra,0xffffe
    2d40:	3c4080e7          	jalr	964(ra) # 1100 <__udivsi3>
    2d44:	000017b7          	lui	a5,0x1
    2d48:	ff478793          	addi	a5,a5,-12 # ff4 <sdcard_init+0xa8>
    2d4c:	ffb00713          	li	a4,-5
    2d50:	e6a7f2e3          	bgeu	a5,a0,2bb4 <fatfs_init+0x40>
    2d54:	000107b7          	lui	a5,0x10
    2d58:	ff478793          	addi	a5,a5,-12 # fff4 <_files+0x4c18>
    2d5c:	02a7e663          	bltu	a5,a0,2d88 <fatfs_init+0x214>
    2d60:	00042423          	sw	zero,8(s0)
    2d64:	02042823          	sw	zero,48(s0)
    2d68:	00000713          	li	a4,0
    2d6c:	e49ff06f          	j	2bb4 <fatfs_init+0x40>
    2d70:	ff278793          	addi	a5,a5,-14
    2d74:	0ff7f793          	zext.b	a5,a5
    2d78:	00100713          	li	a4,1
    2d7c:	00000513          	li	a0,0
    2d80:	eaf776e3          	bgeu	a4,a5,2c2c <fatfs_init+0xb8>
    2d84:	ed1ff06f          	j	2c54 <fatfs_init+0xe0>
    2d88:	00100793          	li	a5,1
    2d8c:	02f42823          	sw	a5,48(s0)
    2d90:	fd9ff06f          	j	2d68 <fatfs_init+0x1f4>

00002d94 <fl_attach_media>:
    2d94:	000057b7          	lui	a5,0x5
    2d98:	3547a783          	lw	a5,852(a5) # 5354 <_filelib_init>
    2d9c:	fe010113          	addi	sp,sp,-32
    2da0:	00812c23          	sw	s0,24(sp)
    2da4:	00112e23          	sw	ra,28(sp)
    2da8:	00050413          	mv	s0,a0
    2dac:	00079a63          	bnez	a5,2dc0 <fl_attach_media+0x2c>
    2db0:	00b12623          	sw	a1,12(sp)
    2db4:	fffff097          	auipc	ra,0xfffff
    2db8:	080080e7          	jalr	128(ra) # 1e34 <fl_init>
    2dbc:	00c12583          	lw	a1,12(sp)
    2dc0:	0000b7b7          	lui	a5,0xb
    2dc4:	f7478513          	addi	a0,a5,-140 # af74 <_fs>
    2dc8:	02b52c23          	sw	a1,56(a0)
    2dcc:	02852a23          	sw	s0,52(a0)
    2dd0:	00000097          	auipc	ra,0x0
    2dd4:	da4080e7          	jalr	-604(ra) # 2b74 <fatfs_init>
    2dd8:	00050593          	mv	a1,a0
    2ddc:	02050863          	beqz	a0,2e0c <fl_attach_media+0x78>
    2de0:	00a12623          	sw	a0,12(sp)
    2de4:	00005537          	lui	a0,0x5
    2de8:	eec50513          	addi	a0,a0,-276 # 4eec <LEDS+0xbc>
    2dec:	fffff097          	auipc	ra,0xfffff
    2df0:	a78080e7          	jalr	-1416(ra) # 1864 <printf>
    2df4:	00c12583          	lw	a1,12(sp)
    2df8:	01c12083          	lw	ra,28(sp)
    2dfc:	01812403          	lw	s0,24(sp)
    2e00:	00058513          	mv	a0,a1
    2e04:	02010113          	addi	sp,sp,32
    2e08:	00008067          	ret
    2e0c:	000057b7          	lui	a5,0x5
    2e10:	00100713          	li	a4,1
    2e14:	34e7a823          	sw	a4,848(a5) # 5350 <_filelib_valid>
    2e18:	fe1ff06f          	j	2df8 <fl_attach_media+0x64>

00002e1c <fatfs_fat_purge>:
    2e1c:	25452583          	lw	a1,596(a0)
    2e20:	fe010113          	addi	sp,sp,-32
    2e24:	00812c23          	sw	s0,24(sp)
    2e28:	00112e23          	sw	ra,28(sp)
    2e2c:	00050413          	mv	s0,a0
    2e30:	00059663          	bnez	a1,2e3c <fatfs_fat_purge+0x20>
    2e34:	00100513          	li	a0,1
    2e38:	02c0006f          	j	2e64 <fatfs_fat_purge+0x48>
    2e3c:	2045a783          	lw	a5,516(a1)
    2e40:	00079663          	bnez	a5,2e4c <fatfs_fat_purge+0x30>
    2e44:	20c5a583          	lw	a1,524(a1)
    2e48:	fe9ff06f          	j	2e30 <fatfs_fat_purge+0x14>
    2e4c:	00040513          	mv	a0,s0
    2e50:	00b12623          	sw	a1,12(sp)
    2e54:	fffff097          	auipc	ra,0xfffff
    2e58:	c80080e7          	jalr	-896(ra) # 1ad4 <fatfs_fat_writeback>
    2e5c:	00c12583          	lw	a1,12(sp)
    2e60:	fe0512e3          	bnez	a0,2e44 <fatfs_fat_purge+0x28>
    2e64:	01c12083          	lw	ra,28(sp)
    2e68:	01812403          	lw	s0,24(sp)
    2e6c:	02010113          	addi	sp,sp,32
    2e70:	00008067          	ret

00002e74 <fatfs_find_next_cluster>:
    2e74:	ff010113          	addi	sp,sp,-16
    2e78:	00812423          	sw	s0,8(sp)
    2e7c:	01212023          	sw	s2,0(sp)
    2e80:	00112623          	sw	ra,12(sp)
    2e84:	00912223          	sw	s1,4(sp)
    2e88:	00050913          	mv	s2,a0
    2e8c:	00200413          	li	s0,2
    2e90:	00058463          	beqz	a1,2e98 <fatfs_find_next_cluster+0x24>
    2e94:	00058413          	mv	s0,a1
    2e98:	03092783          	lw	a5,48(s2)
    2e9c:	00745493          	srli	s1,s0,0x7
    2ea0:	00079463          	bnez	a5,2ea8 <fatfs_find_next_cluster+0x34>
    2ea4:	00845493          	srli	s1,s0,0x8
    2ea8:	01492583          	lw	a1,20(s2)
    2eac:	00090513          	mv	a0,s2
    2eb0:	00b485b3          	add	a1,s1,a1
    2eb4:	fffff097          	auipc	ra,0xfffff
    2eb8:	ca4080e7          	jalr	-860(ra) # 1b58 <fatfs_fat_read_sector>
    2ebc:	00050793          	mv	a5,a0
    2ec0:	fff00513          	li	a0,-1
    2ec4:	04078863          	beqz	a5,2f14 <fatfs_find_next_cluster+0xa0>
    2ec8:	03092703          	lw	a4,48(s2)
    2ecc:	2087a783          	lw	a5,520(a5)
    2ed0:	04071e63          	bnez	a4,2f2c <fatfs_find_next_cluster+0xb8>
    2ed4:	00849493          	slli	s1,s1,0x8
    2ed8:	40940433          	sub	s0,s0,s1
    2edc:	00141413          	slli	s0,s0,0x1
    2ee0:	01041413          	slli	s0,s0,0x10
    2ee4:	01045413          	srli	s0,s0,0x10
    2ee8:	008787b3          	add	a5,a5,s0
    2eec:	0017c503          	lbu	a0,1(a5)
    2ef0:	0007c783          	lbu	a5,0(a5)
    2ef4:	00851513          	slli	a0,a0,0x8
    2ef8:	00f50533          	add	a0,a0,a5
    2efc:	ffff07b7          	lui	a5,0xffff0
    2f00:	00878793          	addi	a5,a5,8 # ffff0008 <__stacktop+0xfffe0008>
    2f04:	00f507b3          	add	a5,a0,a5
    2f08:	00700713          	li	a4,7
    2f0c:	00f76463          	bltu	a4,a5,2f14 <fatfs_find_next_cluster+0xa0>
    2f10:	fff00513          	li	a0,-1
    2f14:	00c12083          	lw	ra,12(sp)
    2f18:	00812403          	lw	s0,8(sp)
    2f1c:	00412483          	lw	s1,4(sp)
    2f20:	00012903          	lw	s2,0(sp)
    2f24:	01010113          	addi	sp,sp,16
    2f28:	00008067          	ret
    2f2c:	00749493          	slli	s1,s1,0x7
    2f30:	40940433          	sub	s0,s0,s1
    2f34:	00241413          	slli	s0,s0,0x2
    2f38:	01041413          	slli	s0,s0,0x10
    2f3c:	01045413          	srli	s0,s0,0x10
    2f40:	008787b3          	add	a5,a5,s0
    2f44:	0037c503          	lbu	a0,3(a5)
    2f48:	0027c703          	lbu	a4,2(a5)
    2f4c:	01851513          	slli	a0,a0,0x18
    2f50:	01071713          	slli	a4,a4,0x10
    2f54:	00e50533          	add	a0,a0,a4
    2f58:	0007c703          	lbu	a4,0(a5)
    2f5c:	0017c783          	lbu	a5,1(a5)
    2f60:	00e50533          	add	a0,a0,a4
    2f64:	00879793          	slli	a5,a5,0x8
    2f68:	00f50533          	add	a0,a0,a5
    2f6c:	00451513          	slli	a0,a0,0x4
    2f70:	00455513          	srli	a0,a0,0x4
    2f74:	f00007b7          	lui	a5,0xf0000
    2f78:	f89ff06f          	j	2f00 <fatfs_find_next_cluster+0x8c>

00002f7c <fatfs_sector_reader>:
    2f7c:	03052783          	lw	a5,48(a0)
    2f80:	fe010113          	addi	sp,sp,-32
    2f84:	00812c23          	sw	s0,24(sp)
    2f88:	01212823          	sw	s2,16(sp)
    2f8c:	01512223          	sw	s5,4(sp)
    2f90:	00112e23          	sw	ra,28(sp)
    2f94:	00912a23          	sw	s1,20(sp)
    2f98:	01312623          	sw	s3,12(sp)
    2f9c:	01412423          	sw	s4,8(sp)
    2fa0:	01612023          	sw	s6,0(sp)
    2fa4:	00f5e7b3          	or	a5,a1,a5
    2fa8:	00050413          	mv	s0,a0
    2fac:	00060913          	mv	s2,a2
    2fb0:	00068a93          	mv	s5,a3
    2fb4:	08079063          	bnez	a5,3034 <fatfs_sector_reader+0xb8>
    2fb8:	01052783          	lw	a5,16(a0)
    2fbc:	02f66863          	bltu	a2,a5,2fec <fatfs_sector_reader+0x70>
    2fc0:	00000513          	li	a0,0
    2fc4:	01c12083          	lw	ra,28(sp)
    2fc8:	01812403          	lw	s0,24(sp)
    2fcc:	01412483          	lw	s1,20(sp)
    2fd0:	01012903          	lw	s2,16(sp)
    2fd4:	00c12983          	lw	s3,12(sp)
    2fd8:	00812a03          	lw	s4,8(sp)
    2fdc:	00412a83          	lw	s5,4(sp)
    2fe0:	00012b03          	lw	s6,0(sp)
    2fe4:	02010113          	addi	sp,sp,32
    2fe8:	00008067          	ret
    2fec:	01c52503          	lw	a0,28(a0)
    2ff0:	00c42783          	lw	a5,12(s0)
    2ff4:	00f50533          	add	a0,a0,a5
    2ff8:	01250533          	add	a0,a0,s2
    2ffc:	0a0a8663          	beqz	s5,30a8 <fatfs_sector_reader+0x12c>
    3000:	03442783          	lw	a5,52(s0)
    3004:	00100613          	li	a2,1
    3008:	000a8593          	mv	a1,s5
    300c:	01812403          	lw	s0,24(sp)
    3010:	01c12083          	lw	ra,28(sp)
    3014:	01412483          	lw	s1,20(sp)
    3018:	01012903          	lw	s2,16(sp)
    301c:	00c12983          	lw	s3,12(sp)
    3020:	00812a03          	lw	s4,8(sp)
    3024:	00412a83          	lw	s5,4(sp)
    3028:	00012b03          	lw	s6,0(sp)
    302c:	02010113          	addi	sp,sp,32
    3030:	00078067          	jr	a5 # f0000000 <__stacktop+0xefff0000>
    3034:	00054783          	lbu	a5,0(a0)
    3038:	00058493          	mv	s1,a1
    303c:	00060513          	mv	a0,a2
    3040:	00078593          	mv	a1,a5
    3044:	00078a13          	mv	s4,a5
    3048:	ffffe097          	auipc	ra,0xffffe
    304c:	0b8080e7          	jalr	184(ra) # 1100 <__udivsi3>
    3050:	00050b13          	mv	s6,a0
    3054:	00000993          	li	s3,0
    3058:	03699a63          	bne	s3,s6,308c <fatfs_sector_reader+0x110>
    305c:	fff00793          	li	a5,-1
    3060:	f6f480e3          	beq	s1,a5,2fc0 <fatfs_sector_reader+0x44>
    3064:	000a0593          	mv	a1,s4
    3068:	00090513          	mv	a0,s2
    306c:	ffffe097          	auipc	ra,0xffffe
    3070:	0dc080e7          	jalr	220(ra) # 1148 <__umodsi3>
    3074:	00050913          	mv	s2,a0
    3078:	00048593          	mv	a1,s1
    307c:	00040513          	mv	a0,s0
    3080:	fffff097          	auipc	ra,0xfffff
    3084:	c84080e7          	jalr	-892(ra) # 1d04 <fatfs_lba_of_cluster>
    3088:	f71ff06f          	j	2ff8 <fatfs_sector_reader+0x7c>
    308c:	00048593          	mv	a1,s1
    3090:	00040513          	mv	a0,s0
    3094:	00000097          	auipc	ra,0x0
    3098:	de0080e7          	jalr	-544(ra) # 2e74 <fatfs_find_next_cluster>
    309c:	00050493          	mv	s1,a0
    30a0:	00198993          	addi	s3,s3,1
    30a4:	fb5ff06f          	j	3058 <fatfs_sector_reader+0xdc>
    30a8:	24442783          	lw	a5,580(s0)
    30ac:	00a78c63          	beq	a5,a0,30c4 <fatfs_sector_reader+0x148>
    30b0:	03442783          	lw	a5,52(s0)
    30b4:	24a42223          	sw	a0,580(s0)
    30b8:	00100613          	li	a2,1
    30bc:	04440593          	addi	a1,s0,68
    30c0:	f4dff06f          	j	300c <fatfs_sector_reader+0x90>
    30c4:	00100513          	li	a0,1
    30c8:	efdff06f          	j	2fc4 <fatfs_sector_reader+0x48>

000030cc <fatfs_get_file_entry>:
    30cc:	eb010113          	addi	sp,sp,-336
    30d0:	14812423          	sw	s0,328(sp)
    30d4:	14912223          	sw	s1,324(sp)
    30d8:	13312e23          	sw	s3,316(sp)
    30dc:	13712623          	sw	s7,300(sp)
    30e0:	13812423          	sw	s8,296(sp)
    30e4:	13912223          	sw	s9,292(sp)
    30e8:	14112623          	sw	ra,332(sp)
    30ec:	15212023          	sw	s2,320(sp)
    30f0:	13412c23          	sw	s4,312(sp)
    30f4:	13512a23          	sw	s5,308(sp)
    30f8:	13612823          	sw	s6,304(sp)
    30fc:	00050993          	mv	s3,a0
    3100:	00058c93          	mv	s9,a1
    3104:	00060b93          	mv	s7,a2
    3108:	00068c13          	mv	s8,a3
    310c:	10010ea3          	sb	zero,285(sp)
    3110:	01810413          	addi	s0,sp,24
    3114:	11c10493          	addi	s1,sp,284
    3118:	00040513          	mv	a0,s0
    311c:	00d00613          	li	a2,13
    3120:	00000593          	li	a1,0
    3124:	00d40413          	addi	s0,s0,13
    3128:	ffffe097          	auipc	ra,0xffffe
    312c:	084080e7          	jalr	132(ra) # 11ac <memset>
    3130:	fe9414e3          	bne	s0,s1,3118 <fatfs_get_file_entry+0x4c>
    3134:	00000493          	li	s1,0
    3138:	24498a13          	addi	s4,s3,580
    313c:	00810913          	addi	s2,sp,8
    3140:	00800a93          	li	s5,8
    3144:	02e00b13          	li	s6,46
    3148:	00000693          	li	a3,0
    314c:	00048613          	mv	a2,s1
    3150:	000c8593          	mv	a1,s9
    3154:	00098513          	mv	a0,s3
    3158:	00000097          	auipc	ra,0x0
    315c:	e24080e7          	jalr	-476(ra) # 2f7c <fatfs_sector_reader>
    3160:	08050c63          	beqz	a0,31f8 <fatfs_get_file_entry+0x12c>
    3164:	00148493          	addi	s1,s1,1
    3168:	04498413          	addi	s0,s3,68
    316c:	00040513          	mv	a0,s0
    3170:	fffff097          	auipc	ra,0xfffff
    3174:	f34080e7          	jalr	-204(ra) # 20a4 <fatfs_entry_lfn_text>
    3178:	02050063          	beqz	a0,3198 <fatfs_get_file_entry+0xcc>
    317c:	00040593          	mv	a1,s0
    3180:	01810513          	addi	a0,sp,24
    3184:	fffff097          	auipc	ra,0xfffff
    3188:	e18080e7          	jalr	-488(ra) # 1f9c <fatfs_lfn_cache_entry>
    318c:	02040413          	addi	s0,s0,32
    3190:	fd441ee3          	bne	s0,s4,316c <fatfs_get_file_entry+0xa0>
    3194:	fb5ff06f          	j	3148 <fatfs_get_file_entry+0x7c>
    3198:	00040513          	mv	a0,s0
    319c:	fffff097          	auipc	ra,0xfffff
    31a0:	f1c080e7          	jalr	-228(ra) # 20b8 <fatfs_entry_lfn_invalid>
    31a4:	00050663          	beqz	a0,31b0 <fatfs_get_file_entry+0xe4>
    31a8:	10010ea3          	sb	zero,285(sp)
    31ac:	fe1ff06f          	j	318c <fatfs_get_file_entry+0xc0>
    31b0:	00040593          	mv	a1,s0
    31b4:	01810513          	addi	a0,sp,24
    31b8:	fffff097          	auipc	ra,0xfffff
    31bc:	f34080e7          	jalr	-204(ra) # 20ec <fatfs_entry_lfn_exists>
    31c0:	06050663          	beqz	a0,322c <fatfs_get_file_entry+0x160>
    31c4:	01810513          	addi	a0,sp,24
    31c8:	fffff097          	auipc	ra,0xfffff
    31cc:	ea0080e7          	jalr	-352(ra) # 2068 <fatfs_lfn_cache_get>
    31d0:	000b8593          	mv	a1,s7
    31d4:	fffff097          	auipc	ra,0xfffff
    31d8:	6dc080e7          	jalr	1756(ra) # 28b0 <fatfs_compare_names>
    31dc:	fc0506e3          	beqz	a0,31a8 <fatfs_get_file_entry+0xdc>
    31e0:	02000613          	li	a2,32
    31e4:	00040593          	mv	a1,s0
    31e8:	000c0513          	mv	a0,s8
    31ec:	ffffe097          	auipc	ra,0xffffe
    31f0:	fdc080e7          	jalr	-36(ra) # 11c8 <memcpy>
    31f4:	00100513          	li	a0,1
    31f8:	14c12083          	lw	ra,332(sp)
    31fc:	14812403          	lw	s0,328(sp)
    3200:	14412483          	lw	s1,324(sp)
    3204:	14012903          	lw	s2,320(sp)
    3208:	13c12983          	lw	s3,316(sp)
    320c:	13812a03          	lw	s4,312(sp)
    3210:	13412a83          	lw	s5,308(sp)
    3214:	13012b03          	lw	s6,304(sp)
    3218:	12c12b83          	lw	s7,300(sp)
    321c:	12812c03          	lw	s8,296(sp)
    3220:	12412c83          	lw	s9,292(sp)
    3224:	15010113          	addi	sp,sp,336
    3228:	00008067          	ret
    322c:	00040513          	mv	a0,s0
    3230:	fffff097          	auipc	ra,0xfffff
    3234:	f0c080e7          	jalr	-244(ra) # 213c <fatfs_entry_sfn_only>
    3238:	f4050ae3          	beqz	a0,318c <fatfs_get_file_entry+0xc0>
    323c:	00d00613          	li	a2,13
    3240:	00000593          	li	a1,0
    3244:	00090513          	mv	a0,s2
    3248:	ffffe097          	auipc	ra,0xffffe
    324c:	f64080e7          	jalr	-156(ra) # 11ac <memset>
    3250:	00000793          	li	a5,0
    3254:	00f406b3          	add	a3,s0,a5
    3258:	0006c683          	lbu	a3,0(a3)
    325c:	00f90733          	add	a4,s2,a5
    3260:	00178793          	addi	a5,a5,1
    3264:	00d70023          	sb	a3,0(a4)
    3268:	ff5796e3          	bne	a5,s5,3254 <fatfs_get_file_entry+0x188>
    326c:	00844703          	lbu	a4,8(s0)
    3270:	00944783          	lbu	a5,9(s0)
    3274:	00a44683          	lbu	a3,10(s0)
    3278:	00e108a3          	sb	a4,17(sp)
    327c:	00f10923          	sb	a5,18(sp)
    3280:	fe070713          	addi	a4,a4,-32
    3284:	fe078793          	addi	a5,a5,-32
    3288:	00f037b3          	snez	a5,a5
    328c:	00e03733          	snez	a4,a4
    3290:	00d109a3          	sb	a3,19(sp)
    3294:	00e7e7b3          	or	a5,a5,a4
    3298:	00079863          	bnez	a5,32a8 <fatfs_get_file_entry+0x1dc>
    329c:	fe068693          	addi	a3,a3,-32
    32a0:	02000793          	li	a5,32
    32a4:	00068a63          	beqz	a3,32b8 <fatfs_get_file_entry+0x1ec>
    32a8:	00814703          	lbu	a4,8(sp)
    32ac:	02e00793          	li	a5,46
    32b0:	01671463          	bne	a4,s6,32b8 <fatfs_get_file_entry+0x1ec>
    32b4:	02000793          	li	a5,32
    32b8:	00f10823          	sb	a5,16(sp)
    32bc:	000b8593          	mv	a1,s7
    32c0:	00090513          	mv	a0,s2
    32c4:	f11ff06f          	j	31d4 <fatfs_get_file_entry+0x108>

000032c8 <_open_directory>:
    32c8:	eb010113          	addi	sp,sp,-336
    32cc:	15212023          	sw	s2,320(sp)
    32d0:	0000b937          	lui	s2,0xb
    32d4:	f7490913          	addi	s2,s2,-140 # af74 <_fs>
    32d8:	14812423          	sw	s0,328(sp)
    32dc:	00892403          	lw	s0,8(s2)
    32e0:	14912223          	sw	s1,324(sp)
    32e4:	13312e23          	sw	s3,316(sp)
    32e8:	13412c23          	sw	s4,312(sp)
    32ec:	13512a23          	sw	s5,308(sp)
    32f0:	13612823          	sw	s6,304(sp)
    32f4:	14112623          	sw	ra,332(sp)
    32f8:	00050a13          	mv	s4,a0
    32fc:	00058a93          	mv	s5,a1
    3300:	fffff097          	auipc	ra,0xfffff
    3304:	368080e7          	jalr	872(ra) # 2668 <fatfs_total_path_levels>
    3308:	00050b13          	mv	s6,a0
    330c:	00000493          	li	s1,0
    3310:	fff00993          	li	s3,-1
    3314:	009b5863          	bge	s6,s1,3324 <_open_directory+0x5c>
    3318:	008aa023          	sw	s0,0(s5)
    331c:	00100513          	li	a0,1
    3320:	0240006f          	j	3344 <_open_directory+0x7c>
    3324:	10400693          	li	a3,260
    3328:	02c10613          	addi	a2,sp,44
    332c:	00048593          	mv	a1,s1
    3330:	000a0513          	mv	a0,s4
    3334:	fffff097          	auipc	ra,0xfffff
    3338:	3a4080e7          	jalr	932(ra) # 26d8 <fatfs_get_substring>
    333c:	03351863          	bne	a0,s3,336c <_open_directory+0xa4>
    3340:	00000513          	li	a0,0
    3344:	14c12083          	lw	ra,332(sp)
    3348:	14812403          	lw	s0,328(sp)
    334c:	14412483          	lw	s1,324(sp)
    3350:	14012903          	lw	s2,320(sp)
    3354:	13c12983          	lw	s3,316(sp)
    3358:	13812a03          	lw	s4,312(sp)
    335c:	13412a83          	lw	s5,308(sp)
    3360:	13012b03          	lw	s6,304(sp)
    3364:	15010113          	addi	sp,sp,336
    3368:	00008067          	ret
    336c:	00c10693          	addi	a3,sp,12
    3370:	02c10613          	addi	a2,sp,44
    3374:	00040593          	mv	a1,s0
    3378:	00090513          	mv	a0,s2
    337c:	00000097          	auipc	ra,0x0
    3380:	d50080e7          	jalr	-688(ra) # 30cc <fatfs_get_file_entry>
    3384:	fa050ee3          	beqz	a0,3340 <_open_directory+0x78>
    3388:	01714783          	lbu	a5,23(sp)
    338c:	0107f793          	andi	a5,a5,16
    3390:	fa0788e3          	beqz	a5,3340 <_open_directory+0x78>
    3394:	02015403          	lhu	s0,32(sp)
    3398:	02615783          	lhu	a5,38(sp)
    339c:	00148493          	addi	s1,s1,1
    33a0:	01041413          	slli	s0,s0,0x10
    33a4:	00f40433          	add	s0,s0,a5
    33a8:	f6dff06f          	j	3314 <_open_directory+0x4c>

000033ac <fl_opendir>:
    33ac:	fe010113          	addi	sp,sp,-32
    33b0:	fff00793          	li	a5,-1
    33b4:	00f12623          	sw	a5,12(sp)
    33b8:	000057b7          	lui	a5,0x5
    33bc:	3547a783          	lw	a5,852(a5) # 5354 <_filelib_init>
    33c0:	00812c23          	sw	s0,24(sp)
    33c4:	01212823          	sw	s2,16(sp)
    33c8:	00112e23          	sw	ra,28(sp)
    33cc:	00912a23          	sw	s1,20(sp)
    33d0:	00050913          	mv	s2,a0
    33d4:	00058413          	mv	s0,a1
    33d8:	00079663          	bnez	a5,33e4 <fl_opendir+0x38>
    33dc:	fffff097          	auipc	ra,0xfffff
    33e0:	a58080e7          	jalr	-1448(ra) # 1e34 <fl_init>
    33e4:	0000b4b7          	lui	s1,0xb
    33e8:	f7448493          	addi	s1,s1,-140 # af74 <_fs>
    33ec:	03c4a783          	lw	a5,60(s1)
    33f0:	00078463          	beqz	a5,33f8 <fl_opendir+0x4c>
    33f4:	000780e7          	jalr	a5
    33f8:	00090513          	mv	a0,s2
    33fc:	fffff097          	auipc	ra,0xfffff
    3400:	26c080e7          	jalr	620(ra) # 2668 <fatfs_total_path_levels>
    3404:	fff00793          	li	a5,-1
    3408:	02f51063          	bne	a0,a5,3428 <fl_opendir+0x7c>
    340c:	0084a783          	lw	a5,8(s1)
    3410:	00f12623          	sw	a5,12(sp)
    3414:	00c12783          	lw	a5,12(sp)
    3418:	00042023          	sw	zero,0(s0)
    341c:	00040423          	sb	zero,8(s0)
    3420:	00f42223          	sw	a5,4(s0)
    3424:	0180006f          	j	343c <fl_opendir+0x90>
    3428:	00c10593          	addi	a1,sp,12
    342c:	00090513          	mv	a0,s2
    3430:	00000097          	auipc	ra,0x0
    3434:	e98080e7          	jalr	-360(ra) # 32c8 <_open_directory>
    3438:	fc051ee3          	bnez	a0,3414 <fl_opendir+0x68>
    343c:	0404a783          	lw	a5,64(s1)
    3440:	00078463          	beqz	a5,3448 <fl_opendir+0x9c>
    3444:	000780e7          	jalr	a5
    3448:	00c12703          	lw	a4,12(sp)
    344c:	fff00793          	li	a5,-1
    3450:	00f71463          	bne	a4,a5,3458 <fl_opendir+0xac>
    3454:	00000413          	li	s0,0
    3458:	01c12083          	lw	ra,28(sp)
    345c:	00040513          	mv	a0,s0
    3460:	01812403          	lw	s0,24(sp)
    3464:	01412483          	lw	s1,20(sp)
    3468:	01012903          	lw	s2,16(sp)
    346c:	02010113          	addi	sp,sp,32
    3470:	00008067          	ret

00003474 <_open_file>:
    3474:	fc010113          	addi	sp,sp,-64
    3478:	03312623          	sw	s3,44(sp)
    347c:	02112e23          	sw	ra,60(sp)
    3480:	02812c23          	sw	s0,56(sp)
    3484:	02912a23          	sw	s1,52(sp)
    3488:	03212823          	sw	s2,48(sp)
    348c:	00050993          	mv	s3,a0
    3490:	ffffe097          	auipc	ra,0xffffe
    3494:	7b4080e7          	jalr	1972(ra) # 1c44 <_allocate_file>
    3498:	06050463          	beqz	a0,3500 <_open_file+0x8c>
    349c:	01450913          	addi	s2,a0,20
    34a0:	00050413          	mv	s0,a0
    34a4:	10400613          	li	a2,260
    34a8:	00000593          	li	a1,0
    34ac:	00090513          	mv	a0,s2
    34b0:	ffffe097          	auipc	ra,0xffffe
    34b4:	cfc080e7          	jalr	-772(ra) # 11ac <memset>
    34b8:	11840493          	addi	s1,s0,280
    34bc:	10400613          	li	a2,260
    34c0:	00000593          	li	a1,0
    34c4:	00048513          	mv	a0,s1
    34c8:	ffffe097          	auipc	ra,0xffffe
    34cc:	ce4080e7          	jalr	-796(ra) # 11ac <memset>
    34d0:	10400713          	li	a4,260
    34d4:	00048693          	mv	a3,s1
    34d8:	00070613          	mv	a2,a4
    34dc:	00090593          	mv	a1,s2
    34e0:	00098513          	mv	a0,s3
    34e4:	fffff097          	auipc	ra,0xfffff
    34e8:	2dc080e7          	jalr	732(ra) # 27c0 <fatfs_split_path>
    34ec:	fff00793          	li	a5,-1
    34f0:	02f51a63          	bne	a0,a5,3524 <_open_file+0xb0>
    34f4:	00040513          	mv	a0,s0
    34f8:	ffffe097          	auipc	ra,0xffffe
    34fc:	7c4080e7          	jalr	1988(ra) # 1cbc <_free_file>
    3500:	00000413          	li	s0,0
    3504:	03c12083          	lw	ra,60(sp)
    3508:	00040513          	mv	a0,s0
    350c:	03812403          	lw	s0,56(sp)
    3510:	03412483          	lw	s1,52(sp)
    3514:	03012903          	lw	s2,48(sp)
    3518:	02c12983          	lw	s3,44(sp)
    351c:	04010113          	addi	sp,sp,64
    3520:	00008067          	ret
    3524:	00040513          	mv	a0,s0
    3528:	fffff097          	auipc	ra,0xfffff
    352c:	514080e7          	jalr	1300(ra) # 2a3c <_check_file_open>
    3530:	fc0512e3          	bnez	a0,34f4 <_open_file+0x80>
    3534:	01444783          	lbu	a5,20(s0)
    3538:	08079c63          	bnez	a5,35d0 <_open_file+0x15c>
    353c:	0000b7b7          	lui	a5,0xb
    3540:	f7c7a783          	lw	a5,-132(a5) # af7c <_fs+0x8>
    3544:	00f42023          	sw	a5,0(s0)
    3548:	00042583          	lw	a1,0(s0)
    354c:	00048613          	mv	a2,s1
    3550:	0000b4b7          	lui	s1,0xb
    3554:	00010693          	mv	a3,sp
    3558:	f7448513          	addi	a0,s1,-140 # af74 <_fs>
    355c:	00000097          	auipc	ra,0x0
    3560:	b70080e7          	jalr	-1168(ra) # 30cc <fatfs_get_file_entry>
    3564:	f80508e3          	beqz	a0,34f4 <_open_file+0x80>
    3568:	00b14783          	lbu	a5,11(sp)
    356c:	0207f793          	andi	a5,a5,32
    3570:	f80782e3          	beqz	a5,34f4 <_open_file+0x80>
    3574:	00b00613          	li	a2,11
    3578:	00010593          	mv	a1,sp
    357c:	21c40513          	addi	a0,s0,540
    3580:	ffffe097          	auipc	ra,0xffffe
    3584:	c48080e7          	jalr	-952(ra) # 11c8 <memcpy>
    3588:	01c12783          	lw	a5,28(sp)
    358c:	01a15703          	lhu	a4,26(sp)
    3590:	00042423          	sw	zero,8(s0)
    3594:	00f42623          	sw	a5,12(s0)
    3598:	01415783          	lhu	a5,20(sp)
    359c:	42042a23          	sw	zero,1076(s0)
    35a0:	00042823          	sw	zero,16(s0)
    35a4:	01079793          	slli	a5,a5,0x10
    35a8:	00e787b3          	add	a5,a5,a4
    35ac:	00f42223          	sw	a5,4(s0)
    35b0:	fff00793          	li	a5,-1
    35b4:	42f42823          	sw	a5,1072(s0)
    35b8:	22f42423          	sw	a5,552(s0)
    35bc:	22f42623          	sw	a5,556(s0)
    35c0:	f7448513          	addi	a0,s1,-140
    35c4:	00000097          	auipc	ra,0x0
    35c8:	858080e7          	jalr	-1960(ra) # 2e1c <fatfs_fat_purge>
    35cc:	f39ff06f          	j	3504 <_open_file+0x90>
    35d0:	00040593          	mv	a1,s0
    35d4:	00090513          	mv	a0,s2
    35d8:	00000097          	auipc	ra,0x0
    35dc:	cf0080e7          	jalr	-784(ra) # 32c8 <_open_directory>
    35e0:	f60514e3          	bnez	a0,3548 <_open_file+0xd4>
    35e4:	f11ff06f          	j	34f4 <_open_file+0x80>

000035e8 <fatfs_sfn_exists>:
    35e8:	fe010113          	addi	sp,sp,-32
    35ec:	01212823          	sw	s2,16(sp)
    35f0:	01312623          	sw	s3,12(sp)
    35f4:	01412423          	sw	s4,8(sp)
    35f8:	01512223          	sw	s5,4(sp)
    35fc:	01612023          	sw	s6,0(sp)
    3600:	00112e23          	sw	ra,28(sp)
    3604:	00812c23          	sw	s0,24(sp)
    3608:	00912a23          	sw	s1,20(sp)
    360c:	00050993          	mv	s3,a0
    3610:	00058a93          	mv	s5,a1
    3614:	00060b13          	mv	s6,a2
    3618:	00000913          	li	s2,0
    361c:	24450a13          	addi	s4,a0,580
    3620:	00000693          	li	a3,0
    3624:	00090613          	mv	a2,s2
    3628:	000a8593          	mv	a1,s5
    362c:	00098513          	mv	a0,s3
    3630:	00000097          	auipc	ra,0x0
    3634:	94c080e7          	jalr	-1716(ra) # 2f7c <fatfs_sector_reader>
    3638:	00050413          	mv	s0,a0
    363c:	06050263          	beqz	a0,36a0 <fatfs_sfn_exists+0xb8>
    3640:	00190913          	addi	s2,s2,1
    3644:	04498493          	addi	s1,s3,68
    3648:	00048513          	mv	a0,s1
    364c:	fffff097          	auipc	ra,0xfffff
    3650:	a58080e7          	jalr	-1448(ra) # 20a4 <fatfs_entry_lfn_text>
    3654:	00050863          	beqz	a0,3664 <fatfs_sfn_exists+0x7c>
    3658:	02048493          	addi	s1,s1,32
    365c:	ff4496e3          	bne	s1,s4,3648 <fatfs_sfn_exists+0x60>
    3660:	fc1ff06f          	j	3620 <fatfs_sfn_exists+0x38>
    3664:	00048513          	mv	a0,s1
    3668:	fffff097          	auipc	ra,0xfffff
    366c:	a50080e7          	jalr	-1456(ra) # 20b8 <fatfs_entry_lfn_invalid>
    3670:	fe0514e3          	bnez	a0,3658 <fatfs_sfn_exists+0x70>
    3674:	00048513          	mv	a0,s1
    3678:	fffff097          	auipc	ra,0xfffff
    367c:	ac4080e7          	jalr	-1340(ra) # 213c <fatfs_entry_sfn_only>
    3680:	00050413          	mv	s0,a0
    3684:	fc050ae3          	beqz	a0,3658 <fatfs_sfn_exists+0x70>
    3688:	00b00613          	li	a2,11
    368c:	000b0593          	mv	a1,s6
    3690:	00048513          	mv	a0,s1
    3694:	ffffe097          	auipc	ra,0xffffe
    3698:	b78080e7          	jalr	-1160(ra) # 120c <strncmp>
    369c:	fa051ee3          	bnez	a0,3658 <fatfs_sfn_exists+0x70>
    36a0:	01c12083          	lw	ra,28(sp)
    36a4:	00040513          	mv	a0,s0
    36a8:	01812403          	lw	s0,24(sp)
    36ac:	01412483          	lw	s1,20(sp)
    36b0:	01012903          	lw	s2,16(sp)
    36b4:	00c12983          	lw	s3,12(sp)
    36b8:	00812a03          	lw	s4,8(sp)
    36bc:	00412a83          	lw	s5,4(sp)
    36c0:	00012b03          	lw	s6,0(sp)
    36c4:	02010113          	addi	sp,sp,32
    36c8:	00008067          	ret

000036cc <fatfs_update_file_length>:
    36cc:	03852783          	lw	a5,56(a0)
    36d0:	14078e63          	beqz	a5,382c <fatfs_update_file_length+0x160>
    36d4:	fd010113          	addi	sp,sp,-48
    36d8:	02912223          	sw	s1,36(sp)
    36dc:	03212023          	sw	s2,32(sp)
    36e0:	01312e23          	sw	s3,28(sp)
    36e4:	01412c23          	sw	s4,24(sp)
    36e8:	01612823          	sw	s6,16(sp)
    36ec:	01712623          	sw	s7,12(sp)
    36f0:	02112623          	sw	ra,44(sp)
    36f4:	02812423          	sw	s0,40(sp)
    36f8:	01512a23          	sw	s5,20(sp)
    36fc:	00068913          	mv	s2,a3
    3700:	00060b93          	mv	s7,a2
    3704:	00058b13          	mv	s6,a1
    3708:	00050493          	mv	s1,a0
    370c:	00000993          	li	s3,0
    3710:	24450a13          	addi	s4,a0,580
    3714:	00000693          	li	a3,0
    3718:	00098613          	mv	a2,s3
    371c:	000b0593          	mv	a1,s6
    3720:	00048513          	mv	a0,s1
    3724:	00000097          	auipc	ra,0x0
    3728:	858080e7          	jalr	-1960(ra) # 2f7c <fatfs_sector_reader>
    372c:	0c050863          	beqz	a0,37fc <fatfs_update_file_length+0x130>
    3730:	04448413          	addi	s0,s1,68
    3734:	00198993          	addi	s3,s3,1
    3738:	00040a93          	mv	s5,s0
    373c:	00040513          	mv	a0,s0
    3740:	fffff097          	auipc	ra,0xfffff
    3744:	964080e7          	jalr	-1692(ra) # 20a4 <fatfs_entry_lfn_text>
    3748:	0a051463          	bnez	a0,37f0 <fatfs_update_file_length+0x124>
    374c:	00040513          	mv	a0,s0
    3750:	fffff097          	auipc	ra,0xfffff
    3754:	968080e7          	jalr	-1688(ra) # 20b8 <fatfs_entry_lfn_invalid>
    3758:	08051c63          	bnez	a0,37f0 <fatfs_update_file_length+0x124>
    375c:	00040513          	mv	a0,s0
    3760:	fffff097          	auipc	ra,0xfffff
    3764:	9dc080e7          	jalr	-1572(ra) # 213c <fatfs_entry_sfn_only>
    3768:	08050463          	beqz	a0,37f0 <fatfs_update_file_length+0x124>
    376c:	00b00613          	li	a2,11
    3770:	000b8593          	mv	a1,s7
    3774:	00040513          	mv	a0,s0
    3778:	ffffe097          	auipc	ra,0xffffe
    377c:	a94080e7          	jalr	-1388(ra) # 120c <strncmp>
    3780:	06051863          	bnez	a0,37f0 <fatfs_update_file_length+0x124>
    3784:	00895793          	srli	a5,s2,0x8
    3788:	01240e23          	sb	s2,28(s0)
    378c:	00f40ea3          	sb	a5,29(s0)
    3790:	01095793          	srli	a5,s2,0x10
    3794:	01895913          	srli	s2,s2,0x18
    3798:	00f40f23          	sb	a5,30(s0)
    379c:	01240fa3          	sb	s2,31(s0)
    37a0:	00040593          	mv	a1,s0
    37a4:	02000613          	li	a2,32
    37a8:	00040513          	mv	a0,s0
    37ac:	ffffe097          	auipc	ra,0xffffe
    37b0:	a1c080e7          	jalr	-1508(ra) # 11c8 <memcpy>
    37b4:	02812403          	lw	s0,40(sp)
    37b8:	0384a783          	lw	a5,56(s1)
    37bc:	2444a503          	lw	a0,580(s1)
    37c0:	02c12083          	lw	ra,44(sp)
    37c4:	02412483          	lw	s1,36(sp)
    37c8:	02012903          	lw	s2,32(sp)
    37cc:	01c12983          	lw	s3,28(sp)
    37d0:	01812a03          	lw	s4,24(sp)
    37d4:	01012b03          	lw	s6,16(sp)
    37d8:	00c12b83          	lw	s7,12(sp)
    37dc:	000a8593          	mv	a1,s5
    37e0:	01412a83          	lw	s5,20(sp)
    37e4:	00100613          	li	a2,1
    37e8:	03010113          	addi	sp,sp,48
    37ec:	00078067          	jr	a5
    37f0:	02040413          	addi	s0,s0,32
    37f4:	f54414e3          	bne	s0,s4,373c <fatfs_update_file_length+0x70>
    37f8:	f1dff06f          	j	3714 <fatfs_update_file_length+0x48>
    37fc:	02c12083          	lw	ra,44(sp)
    3800:	02812403          	lw	s0,40(sp)
    3804:	02412483          	lw	s1,36(sp)
    3808:	02012903          	lw	s2,32(sp)
    380c:	01c12983          	lw	s3,28(sp)
    3810:	01812a03          	lw	s4,24(sp)
    3814:	01412a83          	lw	s5,20(sp)
    3818:	01012b03          	lw	s6,16(sp)
    381c:	00c12b83          	lw	s7,12(sp)
    3820:	00000513          	li	a0,0
    3824:	03010113          	addi	sp,sp,48
    3828:	00008067          	ret
    382c:	00000513          	li	a0,0
    3830:	00008067          	ret

00003834 <fatfs_list_directory_next>:
    3834:	ec010113          	addi	sp,sp,-320
    3838:	13212823          	sw	s2,304(sp)
    383c:	13312623          	sw	s3,300(sp)
    3840:	13412423          	sw	s4,296(sp)
    3844:	13512223          	sw	s5,292(sp)
    3848:	13612023          	sw	s6,288(sp)
    384c:	12112e23          	sw	ra,316(sp)
    3850:	12812c23          	sw	s0,312(sp)
    3854:	12912a23          	sw	s1,308(sp)
    3858:	00050a13          	mv	s4,a0
    385c:	00058913          	mv	s2,a1
    3860:	00060993          	mv	s3,a2
    3864:	10010ea3          	sb	zero,285(sp)
    3868:	04450a93          	addi	s5,a0,68
    386c:	00f00b13          	li	s6,15
    3870:	00092603          	lw	a2,0(s2)
    3874:	00492583          	lw	a1,4(s2)
    3878:	00000693          	li	a3,0
    387c:	000a0513          	mv	a0,s4
    3880:	fffff097          	auipc	ra,0xfffff
    3884:	6fc080e7          	jalr	1788(ra) # 2f7c <fatfs_sector_reader>
    3888:	10050c63          	beqz	a0,39a0 <fatfs_list_directory_next+0x16c>
    388c:	00894483          	lbu	s1,8(s2)
    3890:	00549413          	slli	s0,s1,0x5
    3894:	008a8433          	add	s0,s5,s0
    3898:	009b7c63          	bgeu	s6,s1,38b0 <fatfs_list_directory_next+0x7c>
    389c:	00092783          	lw	a5,0(s2)
    38a0:	00090423          	sb	zero,8(s2)
    38a4:	00178793          	addi	a5,a5,1
    38a8:	00f92023          	sw	a5,0(s2)
    38ac:	fc5ff06f          	j	3870 <fatfs_list_directory_next+0x3c>
    38b0:	00040513          	mv	a0,s0
    38b4:	ffffe097          	auipc	ra,0xffffe
    38b8:	7f0080e7          	jalr	2032(ra) # 20a4 <fatfs_entry_lfn_text>
    38bc:	02050263          	beqz	a0,38e0 <fatfs_list_directory_next+0xac>
    38c0:	00040593          	mv	a1,s0
    38c4:	01810513          	addi	a0,sp,24
    38c8:	ffffe097          	auipc	ra,0xffffe
    38cc:	6d4080e7          	jalr	1748(ra) # 1f9c <fatfs_lfn_cache_entry>
    38d0:	00148493          	addi	s1,s1,1
    38d4:	0ff4f493          	zext.b	s1,s1
    38d8:	02040413          	addi	s0,s0,32
    38dc:	fbdff06f          	j	3898 <fatfs_list_directory_next+0x64>
    38e0:	00040513          	mv	a0,s0
    38e4:	ffffe097          	auipc	ra,0xffffe
    38e8:	7d4080e7          	jalr	2004(ra) # 20b8 <fatfs_entry_lfn_invalid>
    38ec:	00050663          	beqz	a0,38f8 <fatfs_list_directory_next+0xc4>
    38f0:	10010ea3          	sb	zero,285(sp)
    38f4:	fddff06f          	j	38d0 <fatfs_list_directory_next+0x9c>
    38f8:	00040593          	mv	a1,s0
    38fc:	01810513          	addi	a0,sp,24
    3900:	ffffe097          	auipc	ra,0xffffe
    3904:	7ec080e7          	jalr	2028(ra) # 20ec <fatfs_entry_lfn_exists>
    3908:	0c050063          	beqz	a0,39c8 <fatfs_list_directory_next+0x194>
    390c:	01810513          	addi	a0,sp,24
    3910:	ffffe097          	auipc	ra,0xffffe
    3914:	758080e7          	jalr	1880(ra) # 2068 <fatfs_lfn_cache_get>
    3918:	00050593          	mv	a1,a0
    391c:	10300613          	li	a2,259
    3920:	00098513          	mv	a0,s3
    3924:	ffffe097          	auipc	ra,0xffffe
    3928:	928080e7          	jalr	-1752(ra) # 124c <strncpy>
    392c:	00040513          	mv	a0,s0
    3930:	fffff097          	auipc	ra,0xfffff
    3934:	84c080e7          	jalr	-1972(ra) # 217c <fatfs_entry_is_dir>
    3938:	10a98223          	sb	a0,260(s3)
    393c:	01d44783          	lbu	a5,29(s0)
    3940:	01c44703          	lbu	a4,28(s0)
    3944:	00148493          	addi	s1,s1,1
    3948:	00879793          	slli	a5,a5,0x8
    394c:	00e7e7b3          	or	a5,a5,a4
    3950:	01e44703          	lbu	a4,30(s0)
    3954:	00100513          	li	a0,1
    3958:	01071713          	slli	a4,a4,0x10
    395c:	00f76733          	or	a4,a4,a5
    3960:	01f44783          	lbu	a5,31(s0)
    3964:	01879793          	slli	a5,a5,0x18
    3968:	00e7e7b3          	or	a5,a5,a4
    396c:	10f9a623          	sw	a5,268(s3)
    3970:	01544783          	lbu	a5,21(s0)
    3974:	01444703          	lbu	a4,20(s0)
    3978:	01a44683          	lbu	a3,26(s0)
    397c:	00879793          	slli	a5,a5,0x8
    3980:	00e7e7b3          	or	a5,a5,a4
    3984:	01b44703          	lbu	a4,27(s0)
    3988:	01079793          	slli	a5,a5,0x10
    398c:	00871713          	slli	a4,a4,0x8
    3990:	00d76733          	or	a4,a4,a3
    3994:	00e7e7b3          	or	a5,a5,a4
    3998:	10f9a423          	sw	a5,264(s3)
    399c:	00990423          	sb	s1,8(s2)
    39a0:	13c12083          	lw	ra,316(sp)
    39a4:	13812403          	lw	s0,312(sp)
    39a8:	13412483          	lw	s1,308(sp)
    39ac:	13012903          	lw	s2,304(sp)
    39b0:	12c12983          	lw	s3,300(sp)
    39b4:	12812a03          	lw	s4,296(sp)
    39b8:	12412a83          	lw	s5,292(sp)
    39bc:	12012b03          	lw	s6,288(sp)
    39c0:	14010113          	addi	sp,sp,320
    39c4:	00008067          	ret
    39c8:	00040513          	mv	a0,s0
    39cc:	ffffe097          	auipc	ra,0xffffe
    39d0:	770080e7          	jalr	1904(ra) # 213c <fatfs_entry_sfn_only>
    39d4:	ee050ee3          	beqz	a0,38d0 <fatfs_list_directory_next+0x9c>
    39d8:	00810a13          	addi	s4,sp,8
    39dc:	00d00613          	li	a2,13
    39e0:	00000593          	li	a1,0
    39e4:	000a0513          	mv	a0,s4
    39e8:	10010ea3          	sb	zero,285(sp)
    39ec:	ffffd097          	auipc	ra,0xffffd
    39f0:	7c0080e7          	jalr	1984(ra) # 11ac <memset>
    39f4:	00000793          	li	a5,0
    39f8:	00800713          	li	a4,8
    39fc:	00f40633          	add	a2,s0,a5
    3a00:	00064603          	lbu	a2,0(a2)
    3a04:	00fa06b3          	add	a3,s4,a5
    3a08:	00178793          	addi	a5,a5,1
    3a0c:	00c68023          	sb	a2,0(a3)
    3a10:	fee796e3          	bne	a5,a4,39fc <fatfs_list_directory_next+0x1c8>
    3a14:	00844783          	lbu	a5,8(s0)
    3a18:	00944703          	lbu	a4,9(s0)
    3a1c:	00a44683          	lbu	a3,10(s0)
    3a20:	00f108a3          	sb	a5,17(sp)
    3a24:	00e10923          	sb	a4,18(sp)
    3a28:	fe078793          	addi	a5,a5,-32
    3a2c:	fe070713          	addi	a4,a4,-32
    3a30:	00f037b3          	snez	a5,a5
    3a34:	00e03733          	snez	a4,a4
    3a38:	00d109a3          	sb	a3,19(sp)
    3a3c:	00e7e7b3          	or	a5,a5,a4
    3a40:	00079863          	bnez	a5,3a50 <fatfs_list_directory_next+0x21c>
    3a44:	fe068693          	addi	a3,a3,-32
    3a48:	02000793          	li	a5,32
    3a4c:	00068a63          	beqz	a3,3a60 <fatfs_list_directory_next+0x22c>
    3a50:	00814703          	lbu	a4,8(sp)
    3a54:	02e00793          	li	a5,46
    3a58:	00f71463          	bne	a4,a5,3a60 <fatfs_list_directory_next+0x22c>
    3a5c:	02000793          	li	a5,32
    3a60:	000a0593          	mv	a1,s4
    3a64:	00098513          	mv	a0,s3
    3a68:	00f10823          	sb	a5,16(sp)
    3a6c:	fffff097          	auipc	ra,0xfffff
    3a70:	054080e7          	jalr	84(ra) # 2ac0 <fatfs_get_sfn_display_name>
    3a74:	eb9ff06f          	j	392c <fatfs_list_directory_next+0xf8>

00003a78 <fl_readdir>:
    3a78:	000057b7          	lui	a5,0x5
    3a7c:	3547a783          	lw	a5,852(a5) # 5354 <_filelib_init>
    3a80:	fd010113          	addi	sp,sp,-48
    3a84:	03212023          	sw	s2,32(sp)
    3a88:	01312e23          	sw	s3,28(sp)
    3a8c:	02112623          	sw	ra,44(sp)
    3a90:	02812423          	sw	s0,40(sp)
    3a94:	02912223          	sw	s1,36(sp)
    3a98:	00050913          	mv	s2,a0
    3a9c:	00058993          	mv	s3,a1
    3aa0:	00079663          	bnez	a5,3aac <fl_readdir+0x34>
    3aa4:	ffffe097          	auipc	ra,0xffffe
    3aa8:	390080e7          	jalr	912(ra) # 1e34 <fl_init>
    3aac:	0000b4b7          	lui	s1,0xb
    3ab0:	f7448413          	addi	s0,s1,-140 # af74 <_fs>
    3ab4:	03c42783          	lw	a5,60(s0)
    3ab8:	00078463          	beqz	a5,3ac0 <fl_readdir+0x48>
    3abc:	000780e7          	jalr	a5
    3ac0:	00098613          	mv	a2,s3
    3ac4:	00090593          	mv	a1,s2
    3ac8:	f7448513          	addi	a0,s1,-140
    3acc:	00000097          	auipc	ra,0x0
    3ad0:	d68080e7          	jalr	-664(ra) # 3834 <fatfs_list_directory_next>
    3ad4:	04042783          	lw	a5,64(s0)
    3ad8:	00078863          	beqz	a5,3ae8 <fl_readdir+0x70>
    3adc:	00a12623          	sw	a0,12(sp)
    3ae0:	000780e7          	jalr	a5
    3ae4:	00c12503          	lw	a0,12(sp)
    3ae8:	02c12083          	lw	ra,44(sp)
    3aec:	02812403          	lw	s0,40(sp)
    3af0:	00154513          	xori	a0,a0,1
    3af4:	02412483          	lw	s1,36(sp)
    3af8:	02012903          	lw	s2,32(sp)
    3afc:	01c12983          	lw	s3,28(sp)
    3b00:	40a00533          	neg	a0,a0
    3b04:	03010113          	addi	sp,sp,48
    3b08:	00008067          	ret

00003b0c <_read_sectors>:
    3b0c:	fd010113          	addi	sp,sp,-48
    3b10:	01512a23          	sw	s5,20(sp)
    3b14:	0000bab7          	lui	s5,0xb
    3b18:	01312e23          	sw	s3,28(sp)
    3b1c:	f74ac983          	lbu	s3,-140(s5) # af74 <_fs>
    3b20:	01612823          	sw	s6,16(sp)
    3b24:	00058b13          	mv	s6,a1
    3b28:	02912223          	sw	s1,36(sp)
    3b2c:	00098593          	mv	a1,s3
    3b30:	00050493          	mv	s1,a0
    3b34:	000b0513          	mv	a0,s6
    3b38:	02112623          	sw	ra,44(sp)
    3b3c:	02812423          	sw	s0,40(sp)
    3b40:	01412c23          	sw	s4,24(sp)
    3b44:	00068413          	mv	s0,a3
    3b48:	01712623          	sw	s7,12(sp)
    3b4c:	01812423          	sw	s8,8(sp)
    3b50:	03212023          	sw	s2,32(sp)
    3b54:	00060c13          	mv	s8,a2
    3b58:	ffffd097          	auipc	ra,0xffffd
    3b5c:	5a8080e7          	jalr	1448(ra) # 1100 <__udivsi3>
    3b60:	00050a13          	mv	s4,a0
    3b64:	00098593          	mv	a1,s3
    3b68:	000b0513          	mv	a0,s6
    3b6c:	ffffd097          	auipc	ra,0xffffd
    3b70:	5dc080e7          	jalr	1500(ra) # 1148 <__umodsi3>
    3b74:	00a407b3          	add	a5,s0,a0
    3b78:	00050b93          	mv	s7,a0
    3b7c:	00f9fe63          	bgeu	s3,a5,3b98 <_read_sectors+0x8c>
    3b80:	000a0593          	mv	a1,s4
    3b84:	00098513          	mv	a0,s3
    3b88:	ffffe097          	auipc	ra,0xffffe
    3b8c:	e18080e7          	jalr	-488(ra) # 19a0 <__mulsi3>
    3b90:	416987b3          	sub	a5,s3,s6
    3b94:	00f50433          	add	s0,a0,a5
    3b98:	2284a903          	lw	s2,552(s1)
    3b9c:	07491863          	bne	s2,s4,3c0c <_read_sectors+0x100>
    3ba0:	22c4a583          	lw	a1,556(s1)
    3ba4:	fff00793          	li	a5,-1
    3ba8:	02f58663          	beq	a1,a5,3bd4 <_read_sectors+0xc8>
    3bac:	f74a8513          	addi	a0,s5,-140
    3bb0:	ffffe097          	auipc	ra,0xffffe
    3bb4:	154080e7          	jalr	340(ra) # 1d04 <fatfs_lba_of_cluster>
    3bb8:	017505b3          	add	a1,a0,s7
    3bbc:	00040693          	mv	a3,s0
    3bc0:	000c0613          	mv	a2,s8
    3bc4:	f74a8513          	addi	a0,s5,-140
    3bc8:	ffffe097          	auipc	ra,0xffffe
    3bcc:	188080e7          	jalr	392(ra) # 1d50 <fatfs_sector_read>
    3bd0:	00051463          	bnez	a0,3bd8 <_read_sectors+0xcc>
    3bd4:	00000413          	li	s0,0
    3bd8:	02c12083          	lw	ra,44(sp)
    3bdc:	00040513          	mv	a0,s0
    3be0:	02812403          	lw	s0,40(sp)
    3be4:	02412483          	lw	s1,36(sp)
    3be8:	02012903          	lw	s2,32(sp)
    3bec:	01c12983          	lw	s3,28(sp)
    3bf0:	01812a03          	lw	s4,24(sp)
    3bf4:	01412a83          	lw	s5,20(sp)
    3bf8:	01012b03          	lw	s6,16(sp)
    3bfc:	00c12b83          	lw	s7,12(sp)
    3c00:	00812c03          	lw	s8,8(sp)
    3c04:	03010113          	addi	sp,sp,48
    3c08:	00008067          	ret
    3c0c:	033b6463          	bltu	s6,s3,3c34 <_read_sectors+0x128>
    3c10:	00190793          	addi	a5,s2,1
    3c14:	03479063          	bne	a5,s4,3c34 <_read_sectors+0x128>
    3c18:	22c4a583          	lw	a1,556(s1)
    3c1c:	03496263          	bltu	s2,s4,3c40 <_read_sectors+0x134>
    3c20:	fff00793          	li	a5,-1
    3c24:	faf588e3          	beq	a1,a5,3bd4 <_read_sectors+0xc8>
    3c28:	22b4a623          	sw	a1,556(s1)
    3c2c:	2344a423          	sw	s4,552(s1)
    3c30:	f7dff06f          	j	3bac <_read_sectors+0xa0>
    3c34:	0044a583          	lw	a1,4(s1)
    3c38:	00000913          	li	s2,0
    3c3c:	fe1ff06f          	j	3c1c <_read_sectors+0x110>
    3c40:	f74a8513          	addi	a0,s5,-140
    3c44:	fffff097          	auipc	ra,0xfffff
    3c48:	230080e7          	jalr	560(ra) # 2e74 <fatfs_find_next_cluster>
    3c4c:	00050593          	mv	a1,a0
    3c50:	00190913          	addi	s2,s2,1
    3c54:	fc9ff06f          	j	3c1c <_read_sectors+0x110>

00003c58 <fatfs_set_fs_info_next_free_cluster>:
    3c58:	03052783          	lw	a5,48(a0)
    3c5c:	0a078463          	beqz	a5,3d04 <fatfs_set_fs_info_next_free_cluster+0xac>
    3c60:	fe010113          	addi	sp,sp,-32
    3c64:	01c52783          	lw	a5,28(a0)
    3c68:	00912a23          	sw	s1,20(sp)
    3c6c:	00058493          	mv	s1,a1
    3c70:	01855583          	lhu	a1,24(a0)
    3c74:	00812c23          	sw	s0,24(sp)
    3c78:	00112e23          	sw	ra,28(sp)
    3c7c:	00f585b3          	add	a1,a1,a5
    3c80:	00050413          	mv	s0,a0
    3c84:	ffffe097          	auipc	ra,0xffffe
    3c88:	ed4080e7          	jalr	-300(ra) # 1b58 <fatfs_fat_read_sector>
    3c8c:	00050593          	mv	a1,a0
    3c90:	06050063          	beqz	a0,3cf0 <fatfs_set_fs_info_next_free_cluster+0x98>
    3c94:	20852783          	lw	a5,520(a0)
    3c98:	0084d713          	srli	a4,s1,0x8
    3c9c:	00100613          	li	a2,1
    3ca0:	1e978623          	sb	s1,492(a5)
    3ca4:	20852783          	lw	a5,520(a0)
    3ca8:	1ee786a3          	sb	a4,493(a5)
    3cac:	20852783          	lw	a5,520(a0)
    3cb0:	0104d713          	srli	a4,s1,0x10
    3cb4:	1ee78723          	sb	a4,494(a5)
    3cb8:	20852783          	lw	a5,520(a0)
    3cbc:	0184d713          	srli	a4,s1,0x18
    3cc0:	1ee787a3          	sb	a4,495(a5)
    3cc4:	03842783          	lw	a5,56(s0)
    3cc8:	20c52223          	sw	a2,516(a0)
    3ccc:	02942223          	sw	s1,36(s0)
    3cd0:	00078a63          	beqz	a5,3ce4 <fatfs_set_fs_info_next_free_cluster+0x8c>
    3cd4:	20052503          	lw	a0,512(a0)
    3cd8:	00b12623          	sw	a1,12(sp)
    3cdc:	000780e7          	jalr	a5
    3ce0:	00c12583          	lw	a1,12(sp)
    3ce4:	fff00793          	li	a5,-1
    3ce8:	20f5a023          	sw	a5,512(a1)
    3cec:	2005a223          	sw	zero,516(a1)
    3cf0:	01c12083          	lw	ra,28(sp)
    3cf4:	01812403          	lw	s0,24(sp)
    3cf8:	01412483          	lw	s1,20(sp)
    3cfc:	02010113          	addi	sp,sp,32
    3d00:	00008067          	ret
    3d04:	00008067          	ret

00003d08 <fatfs_find_blank_cluster>:
    3d08:	fd010113          	addi	sp,sp,-48
    3d0c:	01312e23          	sw	s3,28(sp)
    3d10:	100009b7          	lui	s3,0x10000
    3d14:	02912223          	sw	s1,36(sp)
    3d18:	03212023          	sw	s2,32(sp)
    3d1c:	02112623          	sw	ra,44(sp)
    3d20:	02812423          	sw	s0,40(sp)
    3d24:	00050913          	mv	s2,a0
    3d28:	00058493          	mv	s1,a1
    3d2c:	fff98993          	addi	s3,s3,-1 # fffffff <__stacktop+0xffeffff>
    3d30:	03092783          	lw	a5,48(s2)
    3d34:	0074d413          	srli	s0,s1,0x7
    3d38:	00079463          	bnez	a5,3d40 <fatfs_find_blank_cluster+0x38>
    3d3c:	0084d413          	srli	s0,s1,0x8
    3d40:	02092783          	lw	a5,32(s2)
    3d44:	0cf47863          	bgeu	s0,a5,3e14 <fatfs_find_blank_cluster+0x10c>
    3d48:	01492583          	lw	a1,20(s2)
    3d4c:	00090513          	mv	a0,s2
    3d50:	00c12623          	sw	a2,12(sp)
    3d54:	00b405b3          	add	a1,s0,a1
    3d58:	ffffe097          	auipc	ra,0xffffe
    3d5c:	e00080e7          	jalr	-512(ra) # 1b58 <fatfs_fat_read_sector>
    3d60:	0a050a63          	beqz	a0,3e14 <fatfs_find_blank_cluster+0x10c>
    3d64:	03092783          	lw	a5,48(s2)
    3d68:	20852703          	lw	a4,520(a0)
    3d6c:	00c12603          	lw	a2,12(sp)
    3d70:	04079a63          	bnez	a5,3dc4 <fatfs_find_blank_cluster+0xbc>
    3d74:	00841413          	slli	s0,s0,0x8
    3d78:	40848433          	sub	s0,s1,s0
    3d7c:	00141413          	slli	s0,s0,0x1
    3d80:	01041413          	slli	s0,s0,0x10
    3d84:	01045413          	srli	s0,s0,0x10
    3d88:	00870733          	add	a4,a4,s0
    3d8c:	00174783          	lbu	a5,1(a4)
    3d90:	00074703          	lbu	a4,0(a4)
    3d94:	00879793          	slli	a5,a5,0x8
    3d98:	00e787b3          	add	a5,a5,a4
    3d9c:	06079863          	bnez	a5,3e0c <fatfs_find_blank_cluster+0x104>
    3da0:	00962023          	sw	s1,0(a2)
    3da4:	00100513          	li	a0,1
    3da8:	02c12083          	lw	ra,44(sp)
    3dac:	02812403          	lw	s0,40(sp)
    3db0:	02412483          	lw	s1,36(sp)
    3db4:	02012903          	lw	s2,32(sp)
    3db8:	01c12983          	lw	s3,28(sp)
    3dbc:	03010113          	addi	sp,sp,48
    3dc0:	00008067          	ret
    3dc4:	00741413          	slli	s0,s0,0x7
    3dc8:	40848433          	sub	s0,s1,s0
    3dcc:	00241413          	slli	s0,s0,0x2
    3dd0:	01041413          	slli	s0,s0,0x10
    3dd4:	01045413          	srli	s0,s0,0x10
    3dd8:	00870733          	add	a4,a4,s0
    3ddc:	00374783          	lbu	a5,3(a4)
    3de0:	00274683          	lbu	a3,2(a4)
    3de4:	01879793          	slli	a5,a5,0x18
    3de8:	01069693          	slli	a3,a3,0x10
    3dec:	00d787b3          	add	a5,a5,a3
    3df0:	00074683          	lbu	a3,0(a4)
    3df4:	00174703          	lbu	a4,1(a4)
    3df8:	00d787b3          	add	a5,a5,a3
    3dfc:	00871713          	slli	a4,a4,0x8
    3e00:	00e787b3          	add	a5,a5,a4
    3e04:	0137f7b3          	and	a5,a5,s3
    3e08:	f95ff06f          	j	3d9c <fatfs_find_blank_cluster+0x94>
    3e0c:	00148493          	addi	s1,s1,1
    3e10:	f21ff06f          	j	3d30 <fatfs_find_blank_cluster+0x28>
    3e14:	00000513          	li	a0,0
    3e18:	f91ff06f          	j	3da8 <fatfs_find_blank_cluster+0xa0>

00003e1c <fatfs_fat_set_cluster>:
    3e1c:	03052783          	lw	a5,48(a0)
    3e20:	fe010113          	addi	sp,sp,-32
    3e24:	00812c23          	sw	s0,24(sp)
    3e28:	00912a23          	sw	s1,20(sp)
    3e2c:	01212823          	sw	s2,16(sp)
    3e30:	00112e23          	sw	ra,28(sp)
    3e34:	00050913          	mv	s2,a0
    3e38:	00058413          	mv	s0,a1
    3e3c:	0085d493          	srli	s1,a1,0x8
    3e40:	00078463          	beqz	a5,3e48 <fatfs_fat_set_cluster+0x2c>
    3e44:	0075d493          	srli	s1,a1,0x7
    3e48:	01492583          	lw	a1,20(s2)
    3e4c:	00090513          	mv	a0,s2
    3e50:	00c12623          	sw	a2,12(sp)
    3e54:	00b485b3          	add	a1,s1,a1
    3e58:	ffffe097          	auipc	ra,0xffffe
    3e5c:	d00080e7          	jalr	-768(ra) # 1b58 <fatfs_fat_read_sector>
    3e60:	00050793          	mv	a5,a0
    3e64:	00000513          	li	a0,0
    3e68:	04078663          	beqz	a5,3eb4 <fatfs_fat_set_cluster+0x98>
    3e6c:	03092683          	lw	a3,48(s2)
    3e70:	2087a703          	lw	a4,520(a5)
    3e74:	00c12603          	lw	a2,12(sp)
    3e78:	04069a63          	bnez	a3,3ecc <fatfs_fat_set_cluster+0xb0>
    3e7c:	00849493          	slli	s1,s1,0x8
    3e80:	40940433          	sub	s0,s0,s1
    3e84:	00141413          	slli	s0,s0,0x1
    3e88:	01041413          	slli	s0,s0,0x10
    3e8c:	01045413          	srli	s0,s0,0x10
    3e90:	00870733          	add	a4,a4,s0
    3e94:	00c70023          	sb	a2,0(a4)
    3e98:	2087a703          	lw	a4,520(a5)
    3e9c:	00865613          	srli	a2,a2,0x8
    3ea0:	00870733          	add	a4,a4,s0
    3ea4:	00c700a3          	sb	a2,1(a4)
    3ea8:	00100713          	li	a4,1
    3eac:	20e7a223          	sw	a4,516(a5)
    3eb0:	00100513          	li	a0,1
    3eb4:	01c12083          	lw	ra,28(sp)
    3eb8:	01812403          	lw	s0,24(sp)
    3ebc:	01412483          	lw	s1,20(sp)
    3ec0:	01012903          	lw	s2,16(sp)
    3ec4:	02010113          	addi	sp,sp,32
    3ec8:	00008067          	ret
    3ecc:	00749493          	slli	s1,s1,0x7
    3ed0:	40940433          	sub	s0,s0,s1
    3ed4:	00241413          	slli	s0,s0,0x2
    3ed8:	01041413          	slli	s0,s0,0x10
    3edc:	01045413          	srli	s0,s0,0x10
    3ee0:	00870733          	add	a4,a4,s0
    3ee4:	00c70023          	sb	a2,0(a4)
    3ee8:	2087a703          	lw	a4,520(a5)
    3eec:	00865693          	srli	a3,a2,0x8
    3ef0:	00870733          	add	a4,a4,s0
    3ef4:	00d700a3          	sb	a3,1(a4)
    3ef8:	2087a703          	lw	a4,520(a5)
    3efc:	01065693          	srli	a3,a2,0x10
    3f00:	01865613          	srli	a2,a2,0x18
    3f04:	00870733          	add	a4,a4,s0
    3f08:	00d70123          	sb	a3,2(a4)
    3f0c:	2087a703          	lw	a4,520(a5)
    3f10:	00870733          	add	a4,a4,s0
    3f14:	00c701a3          	sb	a2,3(a4)
    3f18:	f91ff06f          	j	3ea8 <fatfs_fat_set_cluster+0x8c>

00003f1c <fatfs_free_cluster_chain>:
    3f1c:	fe010113          	addi	sp,sp,-32
    3f20:	00812c23          	sw	s0,24(sp)
    3f24:	00912a23          	sw	s1,20(sp)
    3f28:	00112e23          	sw	ra,28(sp)
    3f2c:	01212823          	sw	s2,16(sp)
    3f30:	00050493          	mv	s1,a0
    3f34:	ffd00413          	li	s0,-3
    3f38:	fff58793          	addi	a5,a1,-1
    3f3c:	02f47063          	bgeu	s0,a5,3f5c <fatfs_free_cluster_chain+0x40>
    3f40:	01c12083          	lw	ra,28(sp)
    3f44:	01812403          	lw	s0,24(sp)
    3f48:	01412483          	lw	s1,20(sp)
    3f4c:	01012903          	lw	s2,16(sp)
    3f50:	00100513          	li	a0,1
    3f54:	02010113          	addi	sp,sp,32
    3f58:	00008067          	ret
    3f5c:	00048513          	mv	a0,s1
    3f60:	00b12623          	sw	a1,12(sp)
    3f64:	fffff097          	auipc	ra,0xfffff
    3f68:	f10080e7          	jalr	-240(ra) # 2e74 <fatfs_find_next_cluster>
    3f6c:	00c12583          	lw	a1,12(sp)
    3f70:	00050913          	mv	s2,a0
    3f74:	00000613          	li	a2,0
    3f78:	00048513          	mv	a0,s1
    3f7c:	00000097          	auipc	ra,0x0
    3f80:	ea0080e7          	jalr	-352(ra) # 3e1c <fatfs_fat_set_cluster>
    3f84:	00090593          	mv	a1,s2
    3f88:	fb1ff06f          	j	3f38 <fatfs_free_cluster_chain+0x1c>

00003f8c <fatfs_fat_add_cluster_to_chain>:
    3f8c:	fd010113          	addi	sp,sp,-48
    3f90:	02912223          	sw	s1,36(sp)
    3f94:	02112623          	sw	ra,44(sp)
    3f98:	02812423          	sw	s0,40(sp)
    3f9c:	03212023          	sw	s2,32(sp)
    3fa0:	01312e23          	sw	s3,28(sp)
    3fa4:	fff00493          	li	s1,-1
    3fa8:	02959263          	bne	a1,s1,3fcc <fatfs_fat_add_cluster_to_chain+0x40>
    3fac:	00000513          	li	a0,0
    3fb0:	02c12083          	lw	ra,44(sp)
    3fb4:	02812403          	lw	s0,40(sp)
    3fb8:	02412483          	lw	s1,36(sp)
    3fbc:	02012903          	lw	s2,32(sp)
    3fc0:	01c12983          	lw	s3,28(sp)
    3fc4:	03010113          	addi	sp,sp,48
    3fc8:	00008067          	ret
    3fcc:	00050913          	mv	s2,a0
    3fd0:	00058413          	mv	s0,a1
    3fd4:	00060993          	mv	s3,a2
    3fd8:	00040593          	mv	a1,s0
    3fdc:	00090513          	mv	a0,s2
    3fe0:	00812623          	sw	s0,12(sp)
    3fe4:	fffff097          	auipc	ra,0xfffff
    3fe8:	e90080e7          	jalr	-368(ra) # 2e74 <fatfs_find_next_cluster>
    3fec:	00050413          	mv	s0,a0
    3ff0:	fa050ee3          	beqz	a0,3fac <fatfs_fat_add_cluster_to_chain+0x20>
    3ff4:	00c12583          	lw	a1,12(sp)
    3ff8:	fe9510e3          	bne	a0,s1,3fd8 <fatfs_fat_add_cluster_to_chain+0x4c>
    3ffc:	00098613          	mv	a2,s3
    4000:	00090513          	mv	a0,s2
    4004:	00000097          	auipc	ra,0x0
    4008:	e18080e7          	jalr	-488(ra) # 3e1c <fatfs_fat_set_cluster>
    400c:	00040613          	mv	a2,s0
    4010:	00098593          	mv	a1,s3
    4014:	00090513          	mv	a0,s2
    4018:	00000097          	auipc	ra,0x0
    401c:	e04080e7          	jalr	-508(ra) # 3e1c <fatfs_fat_set_cluster>
    4020:	00100513          	li	a0,1
    4024:	f8dff06f          	j	3fb0 <fatfs_fat_add_cluster_to_chain+0x24>

00004028 <fatfs_add_free_space>:
    4028:	02452783          	lw	a5,36(a0)
    402c:	fd010113          	addi	sp,sp,-48
    4030:	02812423          	sw	s0,40(sp)
    4034:	01312e23          	sw	s3,28(sp)
    4038:	01412c23          	sw	s4,24(sp)
    403c:	0005a983          	lw	s3,0(a1)
    4040:	01512a23          	sw	s5,20(sp)
    4044:	00058a13          	mv	s4,a1
    4048:	02112623          	sw	ra,44(sp)
    404c:	02912223          	sw	s1,36(sp)
    4050:	03212023          	sw	s2,32(sp)
    4054:	fff00593          	li	a1,-1
    4058:	00050413          	mv	s0,a0
    405c:	00060a93          	mv	s5,a2
    4060:	00b78663          	beq	a5,a1,406c <fatfs_add_free_space+0x44>
    4064:	00000097          	auipc	ra,0x0
    4068:	bf4080e7          	jalr	-1036(ra) # 3c58 <fatfs_set_fs_info_next_free_cluster>
    406c:	00000493          	li	s1,0
    4070:	03549663          	bne	s1,s5,409c <fatfs_add_free_space+0x74>
    4074:	00100513          	li	a0,1
    4078:	02c12083          	lw	ra,44(sp)
    407c:	02812403          	lw	s0,40(sp)
    4080:	02412483          	lw	s1,36(sp)
    4084:	02012903          	lw	s2,32(sp)
    4088:	01c12983          	lw	s3,28(sp)
    408c:	01812a03          	lw	s4,24(sp)
    4090:	01412a83          	lw	s5,20(sp)
    4094:	03010113          	addi	sp,sp,48
    4098:	00008067          	ret
    409c:	00842583          	lw	a1,8(s0)
    40a0:	00c10613          	addi	a2,sp,12
    40a4:	00040513          	mv	a0,s0
    40a8:	00000097          	auipc	ra,0x0
    40ac:	c60080e7          	jalr	-928(ra) # 3d08 <fatfs_find_blank_cluster>
    40b0:	fc0504e3          	beqz	a0,4078 <fatfs_add_free_space+0x50>
    40b4:	00c12903          	lw	s2,12(sp)
    40b8:	00098593          	mv	a1,s3
    40bc:	00040513          	mv	a0,s0
    40c0:	00090613          	mv	a2,s2
    40c4:	00000097          	auipc	ra,0x0
    40c8:	d58080e7          	jalr	-680(ra) # 3e1c <fatfs_fat_set_cluster>
    40cc:	fff00613          	li	a2,-1
    40d0:	00090593          	mv	a1,s2
    40d4:	00040513          	mv	a0,s0
    40d8:	00000097          	auipc	ra,0x0
    40dc:	d44080e7          	jalr	-700(ra) # 3e1c <fatfs_fat_set_cluster>
    40e0:	00049463          	bnez	s1,40e8 <fatfs_add_free_space+0xc0>
    40e4:	012a2023          	sw	s2,0(s4)
    40e8:	00148493          	addi	s1,s1,1
    40ec:	00090993          	mv	s3,s2
    40f0:	f81ff06f          	j	4070 <fatfs_add_free_space+0x48>

000040f4 <_write_sectors>:
    40f4:	fb010113          	addi	sp,sp,-80
    40f8:	03512a23          	sw	s5,52(sp)
    40fc:	0000bab7          	lui	s5,0xb
    4100:	04112623          	sw	ra,76(sp)
    4104:	04812423          	sw	s0,72(sp)
    4108:	04912223          	sw	s1,68(sp)
    410c:	03412c23          	sw	s4,56(sp)
    4110:	03612823          	sw	s6,48(sp)
    4114:	03712623          	sw	s7,44(sp)
    4118:	03812423          	sw	s8,40(sp)
    411c:	03912223          	sw	s9,36(sp)
    4120:	03a12023          	sw	s10,32(sp)
    4124:	05212023          	sw	s2,64(sp)
    4128:	03312e23          	sw	s3,60(sp)
    412c:	f74a8b93          	addi	s7,s5,-140 # af74 <_fs>
    4130:	000bc983          	lbu	s3,0(s7)
    4134:	00058b13          	mv	s6,a1
    4138:	fff00793          	li	a5,-1
    413c:	00098593          	mv	a1,s3
    4140:	00050493          	mv	s1,a0
    4144:	000b0513          	mv	a0,s6
    4148:	00068c13          	mv	s8,a3
    414c:	00f12e23          	sw	a5,28(sp)
    4150:	00060d13          	mv	s10,a2
    4154:	ffffd097          	auipc	ra,0xffffd
    4158:	fac080e7          	jalr	-84(ra) # 1100 <__udivsi3>
    415c:	00050a13          	mv	s4,a0
    4160:	00098593          	mv	a1,s3
    4164:	000b0513          	mv	a0,s6
    4168:	ffffd097          	auipc	ra,0xffffd
    416c:	fe0080e7          	jalr	-32(ra) # 1148 <__umodsi3>
    4170:	00ac07b3          	add	a5,s8,a0
    4174:	00050c93          	mv	s9,a0
    4178:	000c0413          	mv	s0,s8
    417c:	00f9fe63          	bgeu	s3,a5,4198 <_write_sectors+0xa4>
    4180:	000a0593          	mv	a1,s4
    4184:	00098513          	mv	a0,s3
    4188:	ffffe097          	auipc	ra,0xffffe
    418c:	818080e7          	jalr	-2024(ra) # 19a0 <__mulsi3>
    4190:	416987b3          	sub	a5,s3,s6
    4194:	00f50433          	add	s0,a0,a5
    4198:	2284a903          	lw	s2,552(s1)
    419c:	03491a63          	bne	s2,s4,41d0 <_write_sectors+0xdc>
    41a0:	22c4a583          	lw	a1,556(s1)
    41a4:	f74a8513          	addi	a0,s5,-140
    41a8:	ffffe097          	auipc	ra,0xffffe
    41ac:	b5c080e7          	jalr	-1188(ra) # 1d04 <fatfs_lba_of_cluster>
    41b0:	019505b3          	add	a1,a0,s9
    41b4:	00040693          	mv	a3,s0
    41b8:	000d0613          	mv	a2,s10
    41bc:	f74a8513          	addi	a0,s5,-140
    41c0:	ffffe097          	auipc	ra,0xffffe
    41c4:	ba8080e7          	jalr	-1112(ra) # 1d68 <fatfs_sector_write>
    41c8:	04050a63          	beqz	a0,421c <_write_sectors+0x128>
    41cc:	0540006f          	j	4220 <_write_sectors+0x12c>
    41d0:	093b6663          	bltu	s6,s3,425c <_write_sectors+0x168>
    41d4:	00190793          	addi	a5,s2,1
    41d8:	09479263          	bne	a5,s4,425c <_write_sectors+0x168>
    41dc:	22c4a583          	lw	a1,556(s1)
    41e0:	fff00b13          	li	s6,-1
    41e4:	09496263          	bltu	s2,s4,4268 <_write_sectors+0x174>
    41e8:	fff00793          	li	a5,-1
    41ec:	0af59463          	bne	a1,a5,4294 <_write_sectors+0x1a0>
    41f0:	000bc583          	lbu	a1,0(s7)
    41f4:	fff58513          	addi	a0,a1,-1
    41f8:	01850533          	add	a0,a0,s8
    41fc:	ffffd097          	auipc	ra,0xffffd
    4200:	f04080e7          	jalr	-252(ra) # 1100 <__udivsi3>
    4204:	00050613          	mv	a2,a0
    4208:	01c10593          	addi	a1,sp,28
    420c:	000b8513          	mv	a0,s7
    4210:	00000097          	auipc	ra,0x0
    4214:	e18080e7          	jalr	-488(ra) # 4028 <fatfs_add_free_space>
    4218:	06051c63          	bnez	a0,4290 <_write_sectors+0x19c>
    421c:	00000413          	li	s0,0
    4220:	04c12083          	lw	ra,76(sp)
    4224:	00040513          	mv	a0,s0
    4228:	04812403          	lw	s0,72(sp)
    422c:	04412483          	lw	s1,68(sp)
    4230:	04012903          	lw	s2,64(sp)
    4234:	03c12983          	lw	s3,60(sp)
    4238:	03812a03          	lw	s4,56(sp)
    423c:	03412a83          	lw	s5,52(sp)
    4240:	03012b03          	lw	s6,48(sp)
    4244:	02c12b83          	lw	s7,44(sp)
    4248:	02812c03          	lw	s8,40(sp)
    424c:	02412c83          	lw	s9,36(sp)
    4250:	02012d03          	lw	s10,32(sp)
    4254:	05010113          	addi	sp,sp,80
    4258:	00008067          	ret
    425c:	0044a583          	lw	a1,4(s1)
    4260:	00000913          	li	s2,0
    4264:	f7dff06f          	j	41e0 <_write_sectors+0xec>
    4268:	f74a8513          	addi	a0,s5,-140
    426c:	00b12623          	sw	a1,12(sp)
    4270:	fffff097          	auipc	ra,0xfffff
    4274:	c04080e7          	jalr	-1020(ra) # 2e74 <fatfs_find_next_cluster>
    4278:	00c12583          	lw	a1,12(sp)
    427c:	00b12e23          	sw	a1,28(sp)
    4280:	f76508e3          	beq	a0,s6,41f0 <_write_sectors+0xfc>
    4284:	00190913          	addi	s2,s2,1
    4288:	00050593          	mv	a1,a0
    428c:	f59ff06f          	j	41e4 <_write_sectors+0xf0>
    4290:	01c12583          	lw	a1,28(sp)
    4294:	22b4a623          	sw	a1,556(s1)
    4298:	2344a423          	sw	s4,552(s1)
    429c:	f09ff06f          	j	41a4 <_write_sectors+0xb0>

000042a0 <fl_fflush>:
    42a0:	000057b7          	lui	a5,0x5
    42a4:	3547a783          	lw	a5,852(a5) # 5354 <_filelib_init>
    42a8:	ff010113          	addi	sp,sp,-16
    42ac:	00812423          	sw	s0,8(sp)
    42b0:	00112623          	sw	ra,12(sp)
    42b4:	00912223          	sw	s1,4(sp)
    42b8:	00050413          	mv	s0,a0
    42bc:	00079663          	bnez	a5,42c8 <fl_fflush+0x28>
    42c0:	ffffe097          	auipc	ra,0xffffe
    42c4:	b74080e7          	jalr	-1164(ra) # 1e34 <fl_init>
    42c8:	04040663          	beqz	s0,4314 <fl_fflush+0x74>
    42cc:	0000b4b7          	lui	s1,0xb
    42d0:	f7448493          	addi	s1,s1,-140 # af74 <_fs>
    42d4:	03c4a783          	lw	a5,60(s1)
    42d8:	00078463          	beqz	a5,42e0 <fl_fflush+0x40>
    42dc:	000780e7          	jalr	a5
    42e0:	43442783          	lw	a5,1076(s0)
    42e4:	02078263          	beqz	a5,4308 <fl_fflush+0x68>
    42e8:	43042583          	lw	a1,1072(s0)
    42ec:	00100693          	li	a3,1
    42f0:	23040613          	addi	a2,s0,560
    42f4:	00040513          	mv	a0,s0
    42f8:	00000097          	auipc	ra,0x0
    42fc:	dfc080e7          	jalr	-516(ra) # 40f4 <_write_sectors>
    4300:	00050463          	beqz	a0,4308 <fl_fflush+0x68>
    4304:	42042a23          	sw	zero,1076(s0)
    4308:	0404a783          	lw	a5,64(s1)
    430c:	00078463          	beqz	a5,4314 <fl_fflush+0x74>
    4310:	000780e7          	jalr	a5
    4314:	00c12083          	lw	ra,12(sp)
    4318:	00812403          	lw	s0,8(sp)
    431c:	00412483          	lw	s1,4(sp)
    4320:	00000513          	li	a0,0
    4324:	01010113          	addi	sp,sp,16
    4328:	00008067          	ret

0000432c <fl_fclose>:
    432c:	000057b7          	lui	a5,0x5
    4330:	3547a783          	lw	a5,852(a5) # 5354 <_filelib_init>
    4334:	ff010113          	addi	sp,sp,-16
    4338:	00812423          	sw	s0,8(sp)
    433c:	00112623          	sw	ra,12(sp)
    4340:	00912223          	sw	s1,4(sp)
    4344:	01212023          	sw	s2,0(sp)
    4348:	00050413          	mv	s0,a0
    434c:	00079663          	bnez	a5,4358 <fl_fclose+0x2c>
    4350:	ffffe097          	auipc	ra,0xffffe
    4354:	ae4080e7          	jalr	-1308(ra) # 1e34 <fl_init>
    4358:	08040c63          	beqz	s0,43f0 <fl_fclose+0xc4>
    435c:	0000b4b7          	lui	s1,0xb
    4360:	f7448913          	addi	s2,s1,-140 # af74 <_fs>
    4364:	03c92783          	lw	a5,60(s2)
    4368:	00078463          	beqz	a5,4370 <fl_fclose+0x44>
    436c:	000780e7          	jalr	a5
    4370:	00040513          	mv	a0,s0
    4374:	00000097          	auipc	ra,0x0
    4378:	f2c080e7          	jalr	-212(ra) # 42a0 <fl_fflush>
    437c:	01042783          	lw	a5,16(s0)
    4380:	00078e63          	beqz	a5,439c <fl_fclose+0x70>
    4384:	00c42683          	lw	a3,12(s0)
    4388:	00042583          	lw	a1,0(s0)
    438c:	21c40613          	addi	a2,s0,540
    4390:	f7448513          	addi	a0,s1,-140
    4394:	fffff097          	auipc	ra,0xfffff
    4398:	338080e7          	jalr	824(ra) # 36cc <fatfs_update_file_length>
    439c:	fff00793          	li	a5,-1
    43a0:	42f42823          	sw	a5,1072(s0)
    43a4:	00040513          	mv	a0,s0
    43a8:	00042423          	sw	zero,8(s0)
    43ac:	00042623          	sw	zero,12(s0)
    43b0:	00042223          	sw	zero,4(s0)
    43b4:	42042a23          	sw	zero,1076(s0)
    43b8:	00042823          	sw	zero,16(s0)
    43bc:	ffffe097          	auipc	ra,0xffffe
    43c0:	900080e7          	jalr	-1792(ra) # 1cbc <_free_file>
    43c4:	f7448513          	addi	a0,s1,-140
    43c8:	fffff097          	auipc	ra,0xfffff
    43cc:	a54080e7          	jalr	-1452(ra) # 2e1c <fatfs_fat_purge>
    43d0:	04092783          	lw	a5,64(s2)
    43d4:	00078e63          	beqz	a5,43f0 <fl_fclose+0xc4>
    43d8:	00812403          	lw	s0,8(sp)
    43dc:	00c12083          	lw	ra,12(sp)
    43e0:	00412483          	lw	s1,4(sp)
    43e4:	00012903          	lw	s2,0(sp)
    43e8:	01010113          	addi	sp,sp,16
    43ec:	00078067          	jr	a5
    43f0:	00c12083          	lw	ra,12(sp)
    43f4:	00812403          	lw	s0,8(sp)
    43f8:	00412483          	lw	s1,4(sp)
    43fc:	00012903          	lw	s2,0(sp)
    4400:	01010113          	addi	sp,sp,16
    4404:	00008067          	ret

00004408 <fl_fread>:
    4408:	000057b7          	lui	a5,0x5
    440c:	3547a783          	lw	a5,852(a5) # 5354 <_filelib_init>
    4410:	fc010113          	addi	sp,sp,-64
    4414:	02812c23          	sw	s0,56(sp)
    4418:	03512223          	sw	s5,36(sp)
    441c:	02112e23          	sw	ra,60(sp)
    4420:	02912a23          	sw	s1,52(sp)
    4424:	03212823          	sw	s2,48(sp)
    4428:	03312623          	sw	s3,44(sp)
    442c:	03412423          	sw	s4,40(sp)
    4430:	03612023          	sw	s6,32(sp)
    4434:	01712e23          	sw	s7,28(sp)
    4438:	01812c23          	sw	s8,24(sp)
    443c:	01912a23          	sw	s9,20(sp)
    4440:	00050a93          	mv	s5,a0
    4444:	00068413          	mv	s0,a3
    4448:	00058513          	mv	a0,a1
    444c:	00079e63          	bnez	a5,4468 <fl_fread+0x60>
    4450:	00c12623          	sw	a2,12(sp)
    4454:	00b12423          	sw	a1,8(sp)
    4458:	ffffe097          	auipc	ra,0xffffe
    445c:	9dc080e7          	jalr	-1572(ra) # 1e34 <fl_init>
    4460:	00c12603          	lw	a2,12(sp)
    4464:	00812503          	lw	a0,8(sp)
    4468:	14040e63          	beqz	s0,45c4 <fl_fread+0x1bc>
    446c:	140a8c63          	beqz	s5,45c4 <fl_fread+0x1bc>
    4470:	43844783          	lbu	a5,1080(s0)
    4474:	fff00493          	li	s1,-1
    4478:	0017f793          	andi	a5,a5,1
    447c:	04078863          	beqz	a5,44cc <fl_fread+0xc4>
    4480:	00060593          	mv	a1,a2
    4484:	ffffd097          	auipc	ra,0xffffd
    4488:	51c080e7          	jalr	1308(ra) # 19a0 <__mulsi3>
    448c:	00050493          	mv	s1,a0
    4490:	02050e63          	beqz	a0,44cc <fl_fread+0xc4>
    4494:	00842583          	lw	a1,8(s0)
    4498:	00c42783          	lw	a5,12(s0)
    449c:	12f5f463          	bgeu	a1,a5,45c4 <fl_fread+0x1bc>
    44a0:	00b50733          	add	a4,a0,a1
    44a4:	00e7f463          	bgeu	a5,a4,44ac <fl_fread+0xa4>
    44a8:	40b784b3          	sub	s1,a5,a1
    44ac:	0095da13          	srli	s4,a1,0x9
    44b0:	1ff5f913          	andi	s2,a1,511
    44b4:	00000993          	li	s3,0
    44b8:	23040b13          	addi	s6,s0,560
    44bc:	20000b93          	li	s7,512
    44c0:	1ff00c13          	li	s8,511
    44c4:	0499c063          	blt	s3,s1,4504 <fl_fread+0xfc>
    44c8:	00098493          	mv	s1,s3
    44cc:	03c12083          	lw	ra,60(sp)
    44d0:	03812403          	lw	s0,56(sp)
    44d4:	03012903          	lw	s2,48(sp)
    44d8:	02c12983          	lw	s3,44(sp)
    44dc:	02812a03          	lw	s4,40(sp)
    44e0:	02412a83          	lw	s5,36(sp)
    44e4:	02012b03          	lw	s6,32(sp)
    44e8:	01c12b83          	lw	s7,28(sp)
    44ec:	01812c03          	lw	s8,24(sp)
    44f0:	01412c83          	lw	s9,20(sp)
    44f4:	00048513          	mv	a0,s1
    44f8:	03412483          	lw	s1,52(sp)
    44fc:	04010113          	addi	sp,sp,64
    4500:	00008067          	ret
    4504:	04091663          	bnez	s2,4550 <fl_fread+0x148>
    4508:	413486b3          	sub	a3,s1,s3
    450c:	04dc5263          	bge	s8,a3,4550 <fl_fread+0x148>
    4510:	4096d693          	srai	a3,a3,0x9
    4514:	013a8633          	add	a2,s5,s3
    4518:	000a0593          	mv	a1,s4
    451c:	00040513          	mv	a0,s0
    4520:	fffff097          	auipc	ra,0xfffff
    4524:	5ec080e7          	jalr	1516(ra) # 3b0c <_read_sectors>
    4528:	fa0500e3          	beqz	a0,44c8 <fl_fread+0xc0>
    452c:	00951c93          	slli	s9,a0,0x9
    4530:	000c8613          	mv	a2,s9
    4534:	00aa0a33          	add	s4,s4,a0
    4538:	00842783          	lw	a5,8(s0)
    453c:	00c989b3          	add	s3,s3,a2
    4540:	00000913          	li	s2,0
    4544:	019787b3          	add	a5,a5,s9
    4548:	00f42423          	sw	a5,8(s0)
    454c:	f79ff06f          	j	44c4 <fl_fread+0xbc>
    4550:	43042783          	lw	a5,1072(s0)
    4554:	03478e63          	beq	a5,s4,4590 <fl_fread+0x188>
    4558:	43442783          	lw	a5,1076(s0)
    455c:	00078863          	beqz	a5,456c <fl_fread+0x164>
    4560:	00040513          	mv	a0,s0
    4564:	00000097          	auipc	ra,0x0
    4568:	d3c080e7          	jalr	-708(ra) # 42a0 <fl_fflush>
    456c:	00100693          	li	a3,1
    4570:	000b0613          	mv	a2,s6
    4574:	000a0593          	mv	a1,s4
    4578:	00040513          	mv	a0,s0
    457c:	fffff097          	auipc	ra,0xfffff
    4580:	590080e7          	jalr	1424(ra) # 3b0c <_read_sectors>
    4584:	f40502e3          	beqz	a0,44c8 <fl_fread+0xc0>
    4588:	43442823          	sw	s4,1072(s0)
    458c:	42042a23          	sw	zero,1076(s0)
    4590:	412b87b3          	sub	a5,s7,s2
    4594:	41348633          	sub	a2,s1,s3
    4598:	00c7d463          	bge	a5,a2,45a0 <fl_fread+0x198>
    459c:	00078613          	mv	a2,a5
    45a0:	012b05b3          	add	a1,s6,s2
    45a4:	013a8533          	add	a0,s5,s3
    45a8:	00060c93          	mv	s9,a2
    45ac:	00c12423          	sw	a2,8(sp)
    45b0:	ffffd097          	auipc	ra,0xffffd
    45b4:	c18080e7          	jalr	-1000(ra) # 11c8 <memcpy>
    45b8:	00812603          	lw	a2,8(sp)
    45bc:	001a0a13          	addi	s4,s4,1
    45c0:	f79ff06f          	j	4538 <fl_fread+0x130>
    45c4:	fff00493          	li	s1,-1
    45c8:	f05ff06f          	j	44cc <fl_fread+0xc4>

000045cc <fatfs_allocate_free_space>:
    45cc:	fd010113          	addi	sp,sp,-48
    45d0:	02112623          	sw	ra,44(sp)
    45d4:	02812423          	sw	s0,40(sp)
    45d8:	02912223          	sw	s1,36(sp)
    45dc:	03212023          	sw	s2,32(sp)
    45e0:	01312e23          	sw	s3,28(sp)
    45e4:	01412c23          	sw	s4,24(sp)
    45e8:	01512a23          	sw	s5,20(sp)
    45ec:	02069863          	bnez	a3,461c <fatfs_allocate_free_space+0x50>
    45f0:	00000413          	li	s0,0
    45f4:	02c12083          	lw	ra,44(sp)
    45f8:	00040513          	mv	a0,s0
    45fc:	02812403          	lw	s0,40(sp)
    4600:	02412483          	lw	s1,36(sp)
    4604:	02012903          	lw	s2,32(sp)
    4608:	01c12983          	lw	s3,28(sp)
    460c:	01812a03          	lw	s4,24(sp)
    4610:	01412a83          	lw	s5,20(sp)
    4614:	03010113          	addi	sp,sp,48
    4618:	00008067          	ret
    461c:	02452783          	lw	a5,36(a0)
    4620:	00058a13          	mv	s4,a1
    4624:	fff00593          	li	a1,-1
    4628:	00050493          	mv	s1,a0
    462c:	00068913          	mv	s2,a3
    4630:	00060993          	mv	s3,a2
    4634:	00b78663          	beq	a5,a1,4640 <fatfs_allocate_free_space+0x74>
    4638:	fffff097          	auipc	ra,0xfffff
    463c:	620080e7          	jalr	1568(ra) # 3c58 <fatfs_set_fs_info_next_free_cluster>
    4640:	0004c783          	lbu	a5,0(s1)
    4644:	00090513          	mv	a0,s2
    4648:	00979a93          	slli	s5,a5,0x9
    464c:	000a8593          	mv	a1,s5
    4650:	ffffd097          	auipc	ra,0xffffd
    4654:	ab0080e7          	jalr	-1360(ra) # 1100 <__udivsi3>
    4658:	00050413          	mv	s0,a0
    465c:	00050593          	mv	a1,a0
    4660:	000a8513          	mv	a0,s5
    4664:	ffffd097          	auipc	ra,0xffffd
    4668:	33c080e7          	jalr	828(ra) # 19a0 <__mulsi3>
    466c:	41250533          	sub	a0,a0,s2
    4670:	00a03533          	snez	a0,a0
    4674:	00a40933          	add	s2,s0,a0
    4678:	040a0463          	beqz	s4,46c0 <fatfs_allocate_free_space+0xf4>
    467c:	0084a583          	lw	a1,8(s1)
    4680:	00c10613          	addi	a2,sp,12
    4684:	00048513          	mv	a0,s1
    4688:	fffff097          	auipc	ra,0xfffff
    468c:	680080e7          	jalr	1664(ra) # 3d08 <fatfs_find_blank_cluster>
    4690:	00050413          	mv	s0,a0
    4694:	f4050ee3          	beqz	a0,45f0 <fatfs_allocate_free_space+0x24>
    4698:	00100793          	li	a5,1
    469c:	02f91663          	bne	s2,a5,46c8 <fatfs_allocate_free_space+0xfc>
    46a0:	00c12903          	lw	s2,12(sp)
    46a4:	fff00613          	li	a2,-1
    46a8:	00048513          	mv	a0,s1
    46ac:	00090593          	mv	a1,s2
    46b0:	fffff097          	auipc	ra,0xfffff
    46b4:	76c080e7          	jalr	1900(ra) # 3e1c <fatfs_fat_set_cluster>
    46b8:	0129a023          	sw	s2,0(s3)
    46bc:	f39ff06f          	j	45f4 <fatfs_allocate_free_space+0x28>
    46c0:	0009a783          	lw	a5,0(s3)
    46c4:	00f12623          	sw	a5,12(sp)
    46c8:	00090613          	mv	a2,s2
    46cc:	00c10593          	addi	a1,sp,12
    46d0:	00048513          	mv	a0,s1
    46d4:	00000097          	auipc	ra,0x0
    46d8:	954080e7          	jalr	-1708(ra) # 4028 <fatfs_add_free_space>
    46dc:	00050413          	mv	s0,a0
    46e0:	f15ff06f          	j	45f4 <fatfs_allocate_free_space+0x28>

000046e4 <fatfs_add_file_entry>:
    46e4:	03852883          	lw	a7,56(a0)
    46e8:	30088e63          	beqz	a7,4a04 <fatfs_add_file_entry+0x320>
    46ec:	f8010113          	addi	sp,sp,-128
    46f0:	06812c23          	sw	s0,120(sp)
    46f4:	00050413          	mv	s0,a0
    46f8:	00060513          	mv	a0,a2
    46fc:	06912a23          	sw	s1,116(sp)
    4700:	07512223          	sw	s5,100(sp)
    4704:	00f12c23          	sw	a5,24(sp)
    4708:	00e12a23          	sw	a4,20(sp)
    470c:	06112e23          	sw	ra,124(sp)
    4710:	07212823          	sw	s2,112(sp)
    4714:	07312623          	sw	s3,108(sp)
    4718:	07412423          	sw	s4,104(sp)
    471c:	07612023          	sw	s6,96(sp)
    4720:	05712e23          	sw	s7,92(sp)
    4724:	05812c23          	sw	s8,88(sp)
    4728:	05912a23          	sw	s9,84(sp)
    472c:	05a12823          	sw	s10,80(sp)
    4730:	05b12623          	sw	s11,76(sp)
    4734:	01012e23          	sw	a6,28(sp)
    4738:	00068a93          	mv	s5,a3
    473c:	00c12823          	sw	a2,16(sp)
    4740:	00b12423          	sw	a1,8(sp)
    4744:	ffffe097          	auipc	ra,0xffffe
    4748:	a48080e7          	jalr	-1464(ra) # 218c <fatfs_lfn_entries_required>
    474c:	00150713          	addi	a4,a0,1
    4750:	00100793          	li	a5,1
    4754:	00050493          	mv	s1,a0
    4758:	2ae7f263          	bgeu	a5,a4,49fc <fatfs_add_file_entry+0x318>
    475c:	00000a13          	li	s4,0
    4760:	00000993          	li	s3,0
    4764:	00000913          	li	s2,0
    4768:	00000c93          	li	s9,0
    476c:	00000b13          	li	s6,0
    4770:	01000c13          	li	s8,16
    4774:	00812583          	lw	a1,8(sp)
    4778:	00000693          	li	a3,0
    477c:	000b0613          	mv	a2,s6
    4780:	00040513          	mv	a0,s0
    4784:	000b0b93          	mv	s7,s6
    4788:	ffffe097          	auipc	ra,0xffffe
    478c:	7f4080e7          	jalr	2036(ra) # 2f7c <fatfs_sector_reader>
    4790:	18050463          	beqz	a0,4918 <fatfs_add_file_entry+0x234>
    4794:	001b0b13          	addi	s6,s6,1
    4798:	04440793          	addi	a5,s0,68
    479c:	000c8d13          	mv	s10,s9
    47a0:	00000d93          	li	s11,0
    47a4:	00078513          	mv	a0,a5
    47a8:	00f12623          	sw	a5,12(sp)
    47ac:	ffffe097          	auipc	ra,0xffffe
    47b0:	8f8080e7          	jalr	-1800(ra) # 20a4 <fatfs_entry_lfn_text>
    47b4:	00c12783          	lw	a5,12(sp)
    47b8:	00050c93          	mv	s9,a0
    47bc:	02050c63          	beqz	a0,47f4 <fatfs_add_file_entry+0x110>
    47c0:	020d0463          	beqz	s10,47e8 <fatfs_add_file_entry+0x104>
    47c4:	00090c93          	mv	s9,s2
    47c8:	000c8913          	mv	s2,s9
    47cc:	001d0c93          	addi	s9,s10,1
    47d0:	001d8d93          	addi	s11,s11,1
    47d4:	0ffdfd93          	zext.b	s11,s11
    47d8:	02078793          	addi	a5,a5,32
    47dc:	f98d8ce3          	beq	s11,s8,4774 <fatfs_add_file_entry+0x90>
    47e0:	000c8d13          	mv	s10,s9
    47e4:	fc1ff06f          	j	47a4 <fatfs_add_file_entry+0xc0>
    47e8:	000d8a13          	mv	s4,s11
    47ec:	000b8993          	mv	s3,s7
    47f0:	fd9ff06f          	j	47c8 <fatfs_add_file_entry+0xe4>
    47f4:	0007c683          	lbu	a3,0(a5)
    47f8:	0e500713          	li	a4,229
    47fc:	10e69863          	bne	a3,a4,490c <fatfs_add_file_entry+0x228>
    4800:	000d1863          	bnez	s10,4810 <fatfs_add_file_entry+0x12c>
    4804:	000d8a13          	mv	s4,s11
    4808:	000b8993          	mv	s3,s7
    480c:	00100913          	li	s2,1
    4810:	fa9d4ee3          	blt	s10,s1,47cc <fatfs_add_file_entry+0xe8>
    4814:	00ba8693          	addi	a3,s5,11
    4818:	000a8713          	mv	a4,s5
    481c:	00000913          	li	s2,0
    4820:	00074603          	lbu	a2,0(a4)
    4824:	00195793          	srli	a5,s2,0x1
    4828:	00791913          	slli	s2,s2,0x7
    482c:	012787b3          	add	a5,a5,s2
    4830:	00170713          	addi	a4,a4,1
    4834:	00c787b3          	add	a5,a5,a2
    4838:	0ff7f913          	zext.b	s2,a5
    483c:	fed712e3          	bne	a4,a3,4820 <fatfs_add_file_entry+0x13c>
    4840:	00098b13          	mv	s6,s3
    4844:	00000d13          	li	s10,0
    4848:	01000b93          	li	s7,16
    484c:	00812583          	lw	a1,8(sp)
    4850:	00000693          	li	a3,0
    4854:	000b0613          	mv	a2,s6
    4858:	00040513          	mv	a0,s0
    485c:	ffffe097          	auipc	ra,0xffffe
    4860:	720080e7          	jalr	1824(ra) # 2f7c <fatfs_sector_reader>
    4864:	18050c63          	beqz	a0,49fc <fatfs_add_file_entry+0x318>
    4868:	04440c93          	addi	s9,s0,68
    486c:	413b0db3          	sub	s11,s6,s3
    4870:	00000793          	li	a5,0
    4874:	00000c13          	li	s8,0
    4878:	01912623          	sw	s9,12(sp)
    487c:	000d1663          	bnez	s10,4888 <fatfs_add_file_entry+0x1a4>
    4880:	154c1863          	bne	s8,s4,49d0 <fatfs_add_file_entry+0x2ec>
    4884:	140d9663          	bnez	s11,49d0 <fatfs_add_file_entry+0x2ec>
    4888:	12049263          	bnez	s1,49ac <fatfs_add_file_entry+0x2c8>
    488c:	01c12703          	lw	a4,28(sp)
    4890:	01412603          	lw	a2,20(sp)
    4894:	01812583          	lw	a1,24(sp)
    4898:	02010693          	addi	a3,sp,32
    489c:	000a8513          	mv	a0,s5
    48a0:	ffffe097          	auipc	ra,0xffffe
    48a4:	a30080e7          	jalr	-1488(ra) # 22d0 <fatfs_sfn_create_entry>
    48a8:	02000613          	li	a2,32
    48ac:	00c105b3          	add	a1,sp,a2
    48b0:	000c8513          	mv	a0,s9
    48b4:	ffffd097          	auipc	ra,0xffffd
    48b8:	914080e7          	jalr	-1772(ra) # 11c8 <memcpy>
    48bc:	03842783          	lw	a5,56(s0)
    48c0:	00c12583          	lw	a1,12(sp)
    48c4:	24442503          	lw	a0,580(s0)
    48c8:	00100613          	li	a2,1
    48cc:	000780e7          	jalr	a5
    48d0:	07c12083          	lw	ra,124(sp)
    48d4:	07812403          	lw	s0,120(sp)
    48d8:	07412483          	lw	s1,116(sp)
    48dc:	07012903          	lw	s2,112(sp)
    48e0:	06c12983          	lw	s3,108(sp)
    48e4:	06812a03          	lw	s4,104(sp)
    48e8:	06412a83          	lw	s5,100(sp)
    48ec:	06012b03          	lw	s6,96(sp)
    48f0:	05c12b83          	lw	s7,92(sp)
    48f4:	05812c03          	lw	s8,88(sp)
    48f8:	05412c83          	lw	s9,84(sp)
    48fc:	05012d03          	lw	s10,80(sp)
    4900:	04c12d83          	lw	s11,76(sp)
    4904:	08010113          	addi	sp,sp,128
    4908:	00008067          	ret
    490c:	ee068ae3          	beqz	a3,4800 <fatfs_add_file_entry+0x11c>
    4910:	00000913          	li	s2,0
    4914:	ebdff06f          	j	47d0 <fatfs_add_file_entry+0xec>
    4918:	00842583          	lw	a1,8(s0)
    491c:	02010613          	addi	a2,sp,32
    4920:	00040513          	mv	a0,s0
    4924:	fffff097          	auipc	ra,0xfffff
    4928:	3e4080e7          	jalr	996(ra) # 3d08 <fatfs_find_blank_cluster>
    492c:	0c050863          	beqz	a0,49fc <fatfs_add_file_entry+0x318>
    4930:	02012b83          	lw	s7,32(sp)
    4934:	00812583          	lw	a1,8(sp)
    4938:	00040513          	mv	a0,s0
    493c:	000b8613          	mv	a2,s7
    4940:	fffff097          	auipc	ra,0xfffff
    4944:	64c080e7          	jalr	1612(ra) # 3f8c <fatfs_fat_add_cluster_to_chain>
    4948:	0a050a63          	beqz	a0,49fc <fatfs_add_file_entry+0x318>
    494c:	20000613          	li	a2,512
    4950:	00000593          	li	a1,0
    4954:	04440513          	addi	a0,s0,68
    4958:	ffffd097          	auipc	ra,0xffffd
    495c:	854080e7          	jalr	-1964(ra) # 11ac <memset>
    4960:	00000c13          	li	s8,0
    4964:	00044783          	lbu	a5,0(s0)
    4968:	00fc6a63          	bltu	s8,a5,497c <fatfs_add_file_entry+0x298>
    496c:	ea0914e3          	bnez	s2,4814 <fatfs_add_file_entry+0x130>
    4970:	000b0993          	mv	s3,s6
    4974:	00000a13          	li	s4,0
    4978:	e9dff06f          	j	4814 <fatfs_add_file_entry+0x130>
    497c:	00000693          	li	a3,0
    4980:	000c0613          	mv	a2,s8
    4984:	000b8593          	mv	a1,s7
    4988:	00040513          	mv	a0,s0
    498c:	ffffd097          	auipc	ra,0xffffd
    4990:	3f4080e7          	jalr	1012(ra) # 1d80 <fatfs_write_sector>
    4994:	06050463          	beqz	a0,49fc <fatfs_add_file_entry+0x318>
    4998:	001c0c13          	addi	s8,s8,1
    499c:	0ffc7c13          	zext.b	s8,s8
    49a0:	fc5ff06f          	j	4964 <fatfs_add_file_entry+0x280>
    49a4:	001b0b13          	addi	s6,s6,1
    49a8:	ea5ff06f          	j	484c <fatfs_add_file_entry+0x168>
    49ac:	01012503          	lw	a0,16(sp)
    49b0:	fff48493          	addi	s1,s1,-1
    49b4:	00090693          	mv	a3,s2
    49b8:	00048613          	mv	a2,s1
    49bc:	000c8593          	mv	a1,s9
    49c0:	ffffd097          	auipc	ra,0xffffd
    49c4:	7fc080e7          	jalr	2044(ra) # 21bc <fatfs_filename_to_lfn>
    49c8:	00100d13          	li	s10,1
    49cc:	000d0793          	mv	a5,s10
    49d0:	001c0c13          	addi	s8,s8,1
    49d4:	0ffc7c13          	zext.b	s8,s8
    49d8:	020c8c93          	addi	s9,s9,32
    49dc:	eb7c10e3          	bne	s8,s7,487c <fatfs_add_file_entry+0x198>
    49e0:	fc0782e3          	beqz	a5,49a4 <fatfs_add_file_entry+0x2c0>
    49e4:	03842783          	lw	a5,56(s0)
    49e8:	00c12583          	lw	a1,12(sp)
    49ec:	24442503          	lw	a0,580(s0)
    49f0:	00100613          	li	a2,1
    49f4:	000780e7          	jalr	a5
    49f8:	fa0516e3          	bnez	a0,49a4 <fatfs_add_file_entry+0x2c0>
    49fc:	00000513          	li	a0,0
    4a00:	ed1ff06f          	j	48d0 <fatfs_add_file_entry+0x1ec>
    4a04:	00000513          	li	a0,0
    4a08:	00008067          	ret

00004a0c <fl_fopen>:
    4a0c:	000057b7          	lui	a5,0x5
    4a10:	3547a783          	lw	a5,852(a5) # 5354 <_filelib_init>
    4a14:	fa010113          	addi	sp,sp,-96
    4a18:	05212823          	sw	s2,80(sp)
    4a1c:	03a12823          	sw	s10,48(sp)
    4a20:	04112e23          	sw	ra,92(sp)
    4a24:	04812c23          	sw	s0,88(sp)
    4a28:	04912a23          	sw	s1,84(sp)
    4a2c:	05312623          	sw	s3,76(sp)
    4a30:	05412423          	sw	s4,72(sp)
    4a34:	05512223          	sw	s5,68(sp)
    4a38:	05612023          	sw	s6,64(sp)
    4a3c:	03712e23          	sw	s7,60(sp)
    4a40:	03812c23          	sw	s8,56(sp)
    4a44:	03912a23          	sw	s9,52(sp)
    4a48:	00050d13          	mv	s10,a0
    4a4c:	00058913          	mv	s2,a1
    4a50:	00079663          	bnez	a5,4a5c <fl_fopen+0x50>
    4a54:	ffffd097          	auipc	ra,0xffffd
    4a58:	3e0080e7          	jalr	992(ra) # 1e34 <fl_init>
    4a5c:	000057b7          	lui	a5,0x5
    4a60:	3507a783          	lw	a5,848(a5) # 5350 <_filelib_valid>
    4a64:	00193713          	seqz	a4,s2
    4a68:	0017b793          	seqz	a5,a5
    4a6c:	00e7e7b3          	or	a5,a5,a4
    4a70:	36079e63          	bnez	a5,4dec <fl_fopen+0x3e0>
    4a74:	360d0c63          	beqz	s10,4dec <fl_fopen+0x3e0>
    4a78:	00000493          	li	s1,0
    4a7c:	00000413          	li	s0,0
    4a80:	05700993          	li	s3,87
    4a84:	07200a13          	li	s4,114
    4a88:	07700b13          	li	s6,119
    4a8c:	06100b93          	li	s7,97
    4a90:	06200c13          	li	s8,98
    4a94:	04100a93          	li	s5,65
    4a98:	04200c93          	li	s9,66
    4a9c:	00090513          	mv	a0,s2
    4aa0:	ffffc097          	auipc	ra,0xffffc
    4aa4:	74c080e7          	jalr	1868(ra) # 11ec <strlen>
    4aa8:	10a44a63          	blt	s0,a0,4bbc <fl_fopen+0x1b0>
    4aac:	0000b9b7          	lui	s3,0xb
    4ab0:	f7498a13          	addi	s4,s3,-140 # af74 <_fs>
    4ab4:	038a2783          	lw	a5,56(s4)
    4ab8:	00079463          	bnez	a5,4ac0 <fl_fopen+0xb4>
    4abc:	fd94f493          	andi	s1,s1,-39
    4ac0:	03ca2783          	lw	a5,60(s4)
    4ac4:	00078463          	beqz	a5,4acc <fl_fopen+0xc0>
    4ac8:	000780e7          	jalr	a5
    4acc:	0014f793          	andi	a5,s1,1
    4ad0:	18079263          	bnez	a5,4c54 <fl_fopen+0x248>
    4ad4:	0204f793          	andi	a5,s1,32
    4ad8:	08078c63          	beqz	a5,4b70 <fl_fopen+0x164>
    4adc:	038a2783          	lw	a5,56(s4)
    4ae0:	06078a63          	beqz	a5,4b54 <fl_fopen+0x148>
    4ae4:	ffffd097          	auipc	ra,0xffffd
    4ae8:	160080e7          	jalr	352(ra) # 1c44 <_allocate_file>
    4aec:	00050413          	mv	s0,a0
    4af0:	06050263          	beqz	a0,4b54 <fl_fopen+0x148>
    4af4:	01450a93          	addi	s5,a0,20
    4af8:	10400613          	li	a2,260
    4afc:	00000593          	li	a1,0
    4b00:	000a8513          	mv	a0,s5
    4b04:	ffffc097          	auipc	ra,0xffffc
    4b08:	6a8080e7          	jalr	1704(ra) # 11ac <memset>
    4b0c:	11840b13          	addi	s6,s0,280
    4b10:	10400613          	li	a2,260
    4b14:	00000593          	li	a1,0
    4b18:	000b0513          	mv	a0,s6
    4b1c:	ffffc097          	auipc	ra,0xffffc
    4b20:	690080e7          	jalr	1680(ra) # 11ac <memset>
    4b24:	10400713          	li	a4,260
    4b28:	000b0693          	mv	a3,s6
    4b2c:	00070613          	mv	a2,a4
    4b30:	000a8593          	mv	a1,s5
    4b34:	000d0513          	mv	a0,s10
    4b38:	ffffe097          	auipc	ra,0xffffe
    4b3c:	c88080e7          	jalr	-888(ra) # 27c0 <fatfs_split_path>
    4b40:	fff00793          	li	a5,-1
    4b44:	12f51663          	bne	a0,a5,4c70 <fl_fopen+0x264>
    4b48:	00040513          	mv	a0,s0
    4b4c:	ffffd097          	auipc	ra,0xffffd
    4b50:	170080e7          	jalr	368(ra) # 1cbc <_free_file>
    4b54:	00000413          	li	s0,0
    4b58:	0214f793          	andi	a5,s1,33
    4b5c:	02000713          	li	a4,32
    4b60:	28e79263          	bne	a5,a4,4de4 <fl_fopen+0x3d8>
    4b64:	10041263          	bnez	s0,4c68 <fl_fopen+0x25c>
    4b68:	0064f793          	andi	a5,s1,6
    4b6c:	26079463          	bnez	a5,4dd4 <fl_fopen+0x3c8>
    4b70:	00000413          	li	s0,0
    4b74:	040a2783          	lw	a5,64(s4)
    4b78:	00078463          	beqz	a5,4b80 <fl_fopen+0x174>
    4b7c:	000780e7          	jalr	a5
    4b80:	05c12083          	lw	ra,92(sp)
    4b84:	00040513          	mv	a0,s0
    4b88:	05812403          	lw	s0,88(sp)
    4b8c:	05412483          	lw	s1,84(sp)
    4b90:	05012903          	lw	s2,80(sp)
    4b94:	04c12983          	lw	s3,76(sp)
    4b98:	04812a03          	lw	s4,72(sp)
    4b9c:	04412a83          	lw	s5,68(sp)
    4ba0:	04012b03          	lw	s6,64(sp)
    4ba4:	03c12b83          	lw	s7,60(sp)
    4ba8:	03812c03          	lw	s8,56(sp)
    4bac:	03412c83          	lw	s9,52(sp)
    4bb0:	03012d03          	lw	s10,48(sp)
    4bb4:	06010113          	addi	sp,sp,96
    4bb8:	00008067          	ret
    4bbc:	008907b3          	add	a5,s2,s0
    4bc0:	0007c783          	lbu	a5,0(a5)
    4bc4:	05378863          	beq	a5,s3,4c14 <fl_fopen+0x208>
    4bc8:	02f9e863          	bltu	s3,a5,4bf8 <fl_fopen+0x1ec>
    4bcc:	05578863          	beq	a5,s5,4c1c <fl_fopen+0x210>
    4bd0:	00faea63          	bltu	s5,a5,4be4 <fl_fopen+0x1d8>
    4bd4:	02b00713          	li	a4,43
    4bd8:	04e78663          	beq	a5,a4,4c24 <fl_fopen+0x218>
    4bdc:	00140413          	addi	s0,s0,1
    4be0:	ebdff06f          	j	4a9c <fl_fopen+0x90>
    4be4:	03978263          	beq	a5,s9,4c08 <fl_fopen+0x1fc>
    4be8:	05200713          	li	a4,82
    4bec:	fee798e3          	bne	a5,a4,4bdc <fl_fopen+0x1d0>
    4bf0:	0014e493          	ori	s1,s1,1
    4bf4:	fe9ff06f          	j	4bdc <fl_fopen+0x1d0>
    4bf8:	ff478ce3          	beq	a5,s4,4bf0 <fl_fopen+0x1e4>
    4bfc:	00fa6a63          	bltu	s4,a5,4c10 <fl_fopen+0x204>
    4c00:	01778e63          	beq	a5,s7,4c1c <fl_fopen+0x210>
    4c04:	fd879ce3          	bne	a5,s8,4bdc <fl_fopen+0x1d0>
    4c08:	0084e493          	ori	s1,s1,8
    4c0c:	fd1ff06f          	j	4bdc <fl_fopen+0x1d0>
    4c10:	fd6796e3          	bne	a5,s6,4bdc <fl_fopen+0x1d0>
    4c14:	0324e493          	ori	s1,s1,50
    4c18:	fc5ff06f          	j	4bdc <fl_fopen+0x1d0>
    4c1c:	0264e493          	ori	s1,s1,38
    4c20:	fbdff06f          	j	4bdc <fl_fopen+0x1d0>
    4c24:	0014f793          	andi	a5,s1,1
    4c28:	00078663          	beqz	a5,4c34 <fl_fopen+0x228>
    4c2c:	0024e493          	ori	s1,s1,2
    4c30:	fadff06f          	j	4bdc <fl_fopen+0x1d0>
    4c34:	0024f793          	andi	a5,s1,2
    4c38:	00078663          	beqz	a5,4c44 <fl_fopen+0x238>
    4c3c:	0314e493          	ori	s1,s1,49
    4c40:	f9dff06f          	j	4bdc <fl_fopen+0x1d0>
    4c44:	0044f793          	andi	a5,s1,4
    4c48:	f8078ae3          	beqz	a5,4bdc <fl_fopen+0x1d0>
    4c4c:	0274e493          	ori	s1,s1,39
    4c50:	f8dff06f          	j	4bdc <fl_fopen+0x1d0>
    4c54:	000d0513          	mv	a0,s10
    4c58:	fffff097          	auipc	ra,0xfffff
    4c5c:	81c080e7          	jalr	-2020(ra) # 3474 <_open_file>
    4c60:	00050413          	mv	s0,a0
    4c64:	e60508e3          	beqz	a0,4ad4 <fl_fopen+0xc8>
    4c68:	42940c23          	sb	s1,1080(s0)
    4c6c:	f09ff06f          	j	4b74 <fl_fopen+0x168>
    4c70:	00040513          	mv	a0,s0
    4c74:	ffffe097          	auipc	ra,0xffffe
    4c78:	dc8080e7          	jalr	-568(ra) # 2a3c <_check_file_open>
    4c7c:	00050913          	mv	s2,a0
    4c80:	ec0514e3          	bnez	a0,4b48 <fl_fopen+0x13c>
    4c84:	01444783          	lbu	a5,20(s0)
    4c88:	0e079663          	bnez	a5,4d74 <fl_fopen+0x368>
    4c8c:	008a2783          	lw	a5,8(s4)
    4c90:	00f42023          	sw	a5,0(s0)
    4c94:	00042583          	lw	a1,0(s0)
    4c98:	01010693          	addi	a3,sp,16
    4c9c:	000b0613          	mv	a2,s6
    4ca0:	f7498513          	addi	a0,s3,-140
    4ca4:	ffffe097          	auipc	ra,0xffffe
    4ca8:	428080e7          	jalr	1064(ra) # 30cc <fatfs_get_file_entry>
    4cac:	00100693          	li	a3,1
    4cb0:	e8d50ce3          	beq	a0,a3,4b48 <fl_fopen+0x13c>
    4cb4:	00042223          	sw	zero,4(s0)
    4cb8:	00440613          	addi	a2,s0,4
    4cbc:	00068593          	mv	a1,a3
    4cc0:	f7498513          	addi	a0,s3,-140
    4cc4:	00000097          	auipc	ra,0x0
    4cc8:	908080e7          	jalr	-1784(ra) # 45cc <fatfs_allocate_free_space>
    4ccc:	e6050ee3          	beqz	a0,4b48 <fl_fopen+0x13c>
    4cd0:	00002ab7          	lui	s5,0x2
    4cd4:	21c40b93          	addi	s7,s0,540
    4cd8:	f7498c13          	addi	s8,s3,-140
    4cdc:	70fa8a93          	addi	s5,s5,1807 # 270f <fatfs_get_substring+0x37>
    4ce0:	000b0593          	mv	a1,s6
    4ce4:	00410513          	addi	a0,sp,4
    4ce8:	ffffd097          	auipc	ra,0xffffd
    4cec:	68c080e7          	jalr	1676(ra) # 2374 <fatfs_lfn_create_sfn>
    4cf0:	08090e63          	beqz	s2,4d8c <fl_fopen+0x380>
    4cf4:	00090613          	mv	a2,s2
    4cf8:	00410593          	addi	a1,sp,4
    4cfc:	000b8513          	mv	a0,s7
    4d00:	ffffd097          	auipc	ra,0xffffd
    4d04:	7f0080e7          	jalr	2032(ra) # 24f0 <fatfs_lfn_generate_tail>
    4d08:	00042583          	lw	a1,0(s0)
    4d0c:	000b8613          	mv	a2,s7
    4d10:	000c0513          	mv	a0,s8
    4d14:	fffff097          	auipc	ra,0xfffff
    4d18:	8d4080e7          	jalr	-1836(ra) # 35e8 <fatfs_sfn_exists>
    4d1c:	00050663          	beqz	a0,4d28 <fl_fopen+0x31c>
    4d20:	00190913          	addi	s2,s2,1
    4d24:	fb591ee3          	bne	s2,s5,4ce0 <fl_fopen+0x2d4>
    4d28:	00442703          	lw	a4,4(s0)
    4d2c:	000027b7          	lui	a5,0x2
    4d30:	70f78793          	addi	a5,a5,1807 # 270f <fatfs_get_substring+0x37>
    4d34:	00070593          	mv	a1,a4
    4d38:	02f90663          	beq	s2,a5,4d64 <fl_fopen+0x358>
    4d3c:	00042583          	lw	a1,0(s0)
    4d40:	00000813          	li	a6,0
    4d44:	00000793          	li	a5,0
    4d48:	000b8693          	mv	a3,s7
    4d4c:	000b0613          	mv	a2,s6
    4d50:	f7498513          	addi	a0,s3,-140
    4d54:	00000097          	auipc	ra,0x0
    4d58:	990080e7          	jalr	-1648(ra) # 46e4 <fatfs_add_file_entry>
    4d5c:	04051463          	bnez	a0,4da4 <fl_fopen+0x398>
    4d60:	00442583          	lw	a1,4(s0)
    4d64:	f7498513          	addi	a0,s3,-140
    4d68:	fffff097          	auipc	ra,0xfffff
    4d6c:	1b4080e7          	jalr	436(ra) # 3f1c <fatfs_free_cluster_chain>
    4d70:	dd9ff06f          	j	4b48 <fl_fopen+0x13c>
    4d74:	00040593          	mv	a1,s0
    4d78:	000a8513          	mv	a0,s5
    4d7c:	ffffe097          	auipc	ra,0xffffe
    4d80:	54c080e7          	jalr	1356(ra) # 32c8 <_open_directory>
    4d84:	f00518e3          	bnez	a0,4c94 <fl_fopen+0x288>
    4d88:	dc1ff06f          	j	4b48 <fl_fopen+0x13c>
    4d8c:	00b00613          	li	a2,11
    4d90:	00410593          	addi	a1,sp,4
    4d94:	000b8513          	mv	a0,s7
    4d98:	ffffc097          	auipc	ra,0xffffc
    4d9c:	430080e7          	jalr	1072(ra) # 11c8 <memcpy>
    4da0:	f69ff06f          	j	4d08 <fl_fopen+0x2fc>
    4da4:	fff00793          	li	a5,-1
    4da8:	00042623          	sw	zero,12(s0)
    4dac:	00042423          	sw	zero,8(s0)
    4db0:	42f42823          	sw	a5,1072(s0)
    4db4:	42042a23          	sw	zero,1076(s0)
    4db8:	00042823          	sw	zero,16(s0)
    4dbc:	22f42423          	sw	a5,552(s0)
    4dc0:	22f42623          	sw	a5,556(s0)
    4dc4:	f7498513          	addi	a0,s3,-140
    4dc8:	ffffe097          	auipc	ra,0xffffe
    4dcc:	054080e7          	jalr	84(ra) # 2e1c <fatfs_fat_purge>
    4dd0:	d89ff06f          	j	4b58 <fl_fopen+0x14c>
    4dd4:	000d0513          	mv	a0,s10
    4dd8:	ffffe097          	auipc	ra,0xffffe
    4ddc:	69c080e7          	jalr	1692(ra) # 3474 <_open_file>
    4de0:	00050413          	mv	s0,a0
    4de4:	e80412e3          	bnez	s0,4c68 <fl_fopen+0x25c>
    4de8:	d89ff06f          	j	4b70 <fl_fopen+0x164>
    4dec:	00000413          	li	s0,0
    4df0:	d91ff06f          	j	4b80 <fl_fopen+0x174>

00004df4 <cmd16>:
    4df4:	02000050 00001500                       P.......

00004dfc <acmd41>:
    4dfc:	00004069 00000100                       i@......

00004e04 <cmd55>:
    4e04:	00000077 00000100                       w.......

00004e0c <cmd8>:
    4e0c:	01000048 000087aa                       H.......

00004e14 <cmd0>:
    4e14:	00000040 00009500                       @.......

00004e1c <AUDIO>:
    4e1c:	00018000                                ....

00004e20 <BUTTONS>:
    4e20:	00010100                                ....

00004e24 <SDCARD>:
    4e24:	00010080                                ....

00004e28 <OLED_RST>:
    4e28:	00010010                                ....

00004e2c <OLED>:
    4e2c:	00010008                                ....

00004e30 <LEDS>:
    4e30:	00010004 0000002f 00002e2e 0000002e     ..../...........
    4e40:	00006272 696c632f 722e6b63 00007761     rb../click.raw..
    4e50:	6f727245 43203a72 6f6e6e61 706f2074     Error: Cannot op
    4e60:	25206e65 00000a73 79616c50 3a676e69     en %s...Playing:
    4e70:	20732520 20202020 20202020 000a2020      %s           ..
    4e80:	74696e49 20445320 64726163 0a2e2e2e     Init SD card....
    4e90:	00000000 52494420 0000203a 74706d45     .... DIR: ..Empt
    4ea0:	69642079 74636572 2179726f 0000000a     y directory!....
    4eb0:	5d64255b 00000020 203e6425 00000000     [%d] ...%d> ....
    4ec0:	20202020 20202020 20202020 20202020                     
    4ed0:	20202020 00000a20 33323130 37363534          ...01234567
    4ee0:	42413938 46454443 00000000 5f544146     89ABCDEF....FAT_
    4ef0:	203a5346 6f727245 6f632072 20646c75     FS: Error could 
    4f00:	20746f6e 64616f6c 54414620 74656420     not load FAT det
    4f10:	736c6961 64252820 0a0d2129 00000000     ails (%d)!......

00004f20 <font>:
    4f20:	00000000 00002f00 00030000 14000003     ...../..........
    4f30:	143e143e 3a2b6a2e 08122600 171c3224     >.>..j+:.&..$2..
    4f40:	03003415 00000000 0000211e 001e2100     .4.......!...!..
    4f50:	08220000 0822081c 0000081c 00002040     .."...".....@ ..
    4f60:	00080800 00200000 20000000 02040810     ...... .... ....
    4f70:	3f21213f 003f0100 253d0000 25002725     ?!!?..?...=%%'.%
    4f80:	003f2525 3f040407 25252700 253f003d     %%?....?.'%%=.?%
    4f90:	01003d25 00030539 3f25253f 25252700     %=..9...?%%?.'%%
    4fa0:	0028003f 40000000 00000028 00110a04     ?.(....@(.......
    4fb0:	00141400 0a110000 01000004 0007052d     ............-...
    4fc0:	253d213f 09093f1f 253f003f 3f003c27     ?!=%.?..?.?%'<.?
    4fd0:	00212121 1e21213f 25253f00 053f0025     !!!.?!!..?%%%.?.
    4fe0:	3f000505 003d2521 3f04043f 213f2100     ...?!%=.?..?.!?!
    4ff0:	20380000 3f013f21 003b0404 2020203f     ..8 !?.?..;.?   
    5000:	3f013f00 023f3f01 3f003f04 003f2121     .?.?.??..?.?!!?.
    5010:	0f09093f 31213f00 093f003f 27002f39     ?....?!1?.?.9/.'
    5020:	003d2525 013f0101 20203f01 100f003f     %%=...?..?  ?...
    5030:	3f001f30 3f203f20 3b04043b 38080f00     0..? ? ?;..;...8
    5040:	2931000f 3f002325 00000021 04081020     ..1)%#.?!... ...
    5050:	003f2102 01020000 20000201 00000020     .!?........  ...
    5060:	00000201 24243800 243f003c 3c003c24     .....8$$<.?$$<.<
    5070:	00242424 3f24243c 2c2c3c00 3f04002c     $$$.<$$?.<,,,..?
    5080:	bc000005 00fca4a4 3c04043f 00003d00     ........?..<.=..
    5090:	fd800000 3f000000 00340808 0000003f     .......?..4.?...
    50a0:	3c043c00 043c3c04 3c003c04 003c2424     .<.<.<<..<.<$$<.
    50b0:	3c2424fc 24243c00 083c00fc 2c000004     .$$<.<$$..<....,
    50c0:	003c2c2c 00243f04 20203c00 100c003c     ,,<..?$..<  <...
    50d0:	3c001c30 3c203c20 34080834 a0a0bc00     0..< < <4..4....
    50e0:	342400fc 0400242c 0000213f 0000003f     ..$4,$..?!..?...
    50f0:	043f2100 02010000 00000102 00000000     .!?.............
    5100:	00000001 00000003 00000005 00000007     ................
    5110:	00000009 0000000e 00000010 00000012     ................
    5120:	00000014 00000016 00000018 0000001c     ................
    5130:	0000001e                                ....

00005134 <current_path>:
    5134:	0000002f 00000000 00000000 00000000     /...............
	...

00005328 <n_items>:
    5328:	00000000                                ....

0000532c <sdcard_while_loading_callback>:
    532c:	00000000                                ....

00005330 <back_color>:
	...

00005331 <front_color>:
    5331:	                                         ...

00005334 <cursor_y>:
    5334:	00000000                                ....

00005338 <cursor_x>:
    5338:	00000000                                ....

0000533c <f_putchar>:
    533c:	00000000                                ....

00005340 <_free_file_list>:
	...

00005348 <_open_file_list>:
	...

00005350 <_filelib_valid>:
    5350:	00000000                                ....

00005354 <_filelib_init>:
    5354:	00000000                                ....
