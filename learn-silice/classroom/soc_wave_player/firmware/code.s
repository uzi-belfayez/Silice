
code.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00010137          	lui	sp,0x10
       4:	00000097          	auipc	ra,0x0
       8:	71c080e7          	jalr	1820(ra) # 720 <main>
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
      64:	fe010113          	addi	sp,sp,-32 # ffe0 <_files+0x4ba4>
      68:	000057b7          	lui	a5,0x5
      6c:	00812c23          	sw	s0,24(sp)
      70:	e887a403          	lw	s0,-376(a5) # 4e88 <AUDIO>
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
      ac:	20c080e7          	jalr	524(ra) # 12b4 <memset>
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
      ec:	ea058593          	addi	a1,a1,-352 # 4ea0 <LEDS+0x4>
      f0:	ea450513          	addi	a0,a0,-348 # 4ea4 <LEDS+0x8>
      f4:	00112e23          	sw	ra,28(sp)
      f8:	00812c23          	sw	s0,24(sp)
      fc:	00912a23          	sw	s1,20(sp)
     100:	01212823          	sw	s2,16(sp)
     104:	01312623          	sw	s3,12(sp)
     108:	01412423          	sw	s4,8(sp)
     10c:	01512223          	sw	s5,4(sp)
     110:	00005097          	auipc	ra,0x5
     114:	968080e7          	jalr	-1688(ra) # 4a78 <fl_fopen>
     118:	0a050263          	beqz	a0,1bc <play_click_noise+0xdc>
     11c:	000015b7          	lui	a1,0x1
     120:	00000613          	li	a2,0
     124:	fa058593          	addi	a1,a1,-96 # fa0 <sdcard_read_sector+0x38>
     128:	00050a13          	mv	s4,a0
     12c:	00002097          	auipc	ra,0x2
     130:	ddc080e7          	jalr	-548(ra) # 1f08 <fl_fseek>
     134:	000057b7          	lui	a5,0x5
     138:	e887aa83          	lw	s5,-376(a5) # 4e88 <AUDIO>
     13c:	20000993          	li	s3,512
     140:	1ff00913          	li	s2,511
     144:	000aa483          	lw	s1,0(s5)
     148:	000a0693          	mv	a3,s4
     14c:	20000613          	li	a2,512
     150:	00100593          	li	a1,1
     154:	00048513          	mv	a0,s1
     158:	00004097          	auipc	ra,0x4
     15c:	31c080e7          	jalr	796(ra) # 4474 <fl_fread>
     160:	00050413          	mv	s0,a0
     164:	00a94c63          	blt	s2,a0,17c <play_click_noise+0x9c>
     168:	40a98633          	sub	a2,s3,a0
     16c:	00000593          	li	a1,0
     170:	00a48533          	add	a0,s1,a0
     174:	00001097          	auipc	ra,0x1
     178:	140080e7          	jalr	320(ra) # 12b4 <memset>
     17c:	000aa783          	lw	a5,0(s5)
     180:	fef48ee3          	beq	s1,a5,17c <play_click_noise+0x9c>
     184:	fc8940e3          	blt	s2,s0,144 <play_click_noise+0x64>
     188:	000a0513          	mv	a0,s4
     18c:	00004097          	auipc	ra,0x4
     190:	20c080e7          	jalr	524(ra) # 4398 <fl_fclose>
     194:	01812403          	lw	s0,24(sp)
     198:	01c12083          	lw	ra,28(sp)
     19c:	01412483          	lw	s1,20(sp)
     1a0:	01012903          	lw	s2,16(sp)
     1a4:	00c12983          	lw	s3,12(sp)
     1a8:	00812a03          	lw	s4,8(sp)
     1ac:	00412a83          	lw	s5,4(sp)
     1b0:	02010113          	addi	sp,sp,32
     1b4:	00000317          	auipc	t1,0x0
     1b8:	eb030067          	jr	-336(t1) # 64 <clear_audio>
     1bc:	01c12083          	lw	ra,28(sp)
     1c0:	01812403          	lw	s0,24(sp)
     1c4:	01412483          	lw	s1,20(sp)
     1c8:	01012903          	lw	s2,16(sp)
     1cc:	00c12983          	lw	s3,12(sp)
     1d0:	00812a03          	lw	s4,8(sp)
     1d4:	00412a83          	lw	s5,4(sp)
     1d8:	02010113          	addi	sp,sp,32
     1dc:	00008067          	ret

000001e0 <view_image_file>:
     1e0:	000055b7          	lui	a1,0x5
     1e4:	ff010113          	addi	sp,sp,-16
     1e8:	ea058593          	addi	a1,a1,-352 # 4ea0 <LEDS+0x4>
     1ec:	00112623          	sw	ra,12(sp)
     1f0:	00812423          	sw	s0,8(sp)
     1f4:	00005097          	auipc	ra,0x5
     1f8:	884080e7          	jalr	-1916(ra) # 4a78 <fl_fopen>
     1fc:	08050663          	beqz	a0,288 <view_image_file+0xa8>
     200:	00050413          	mv	s0,a0
     204:	00001097          	auipc	ra,0x1
     208:	374080e7          	jalr	884(ra) # 1578 <display_framebuffer>
     20c:	00040693          	mv	a3,s0
     210:	00004637          	lui	a2,0x4
     214:	00100593          	li	a1,1
     218:	00004097          	auipc	ra,0x4
     21c:	25c080e7          	jalr	604(ra) # 4474 <fl_fread>
     220:	00040513          	mv	a0,s0
     224:	00004097          	auipc	ra,0x4
     228:	174080e7          	jalr	372(ra) # 4398 <fl_fclose>
     22c:	00001097          	auipc	ra,0x1
     230:	4ac080e7          	jalr	1196(ra) # 16d8 <display_refresh>
     234:	000057b7          	lui	a5,0x5
     238:	e8c7a683          	lw	a3,-372(a5) # 4e8c <BUTTONS>
     23c:	0006a703          	lw	a4,0(a3)
     240:	fff74793          	not	a5,a4
     244:	0006a703          	lw	a4,0(a3)
     248:	00e7f7b3          	and	a5,a5,a4
     24c:	0067f793          	andi	a5,a5,6
     250:	fe0788e3          	beqz	a5,240 <view_image_file+0x60>
     254:	00000097          	auipc	ra,0x0
     258:	e8c080e7          	jalr	-372(ra) # e0 <play_click_noise>
     25c:	00001097          	auipc	ra,0x1
     260:	31c080e7          	jalr	796(ra) # 1578 <display_framebuffer>
     264:	00004637          	lui	a2,0x4
     268:	00000593          	li	a1,0
     26c:	00001097          	auipc	ra,0x1
     270:	048080e7          	jalr	72(ra) # 12b4 <memset>
     274:	00812403          	lw	s0,8(sp)
     278:	00c12083          	lw	ra,12(sp)
     27c:	01010113          	addi	sp,sp,16
     280:	00001317          	auipc	t1,0x1
     284:	45830067          	jr	1112(t1) # 16d8 <display_refresh>
     288:	00c12083          	lw	ra,12(sp)
     28c:	00812403          	lw	s0,8(sp)
     290:	01010113          	addi	sp,sp,16
     294:	00008067          	ret

00000298 <play_music_file>:
     298:	000055b7          	lui	a1,0x5
     29c:	fc010113          	addi	sp,sp,-64
     2a0:	ea058593          	addi	a1,a1,-352 # 4ea0 <LEDS+0x4>
     2a4:	02812c23          	sw	s0,56(sp)
     2a8:	02112e23          	sw	ra,60(sp)
     2ac:	02912a23          	sw	s1,52(sp)
     2b0:	03212823          	sw	s2,48(sp)
     2b4:	03312623          	sw	s3,44(sp)
     2b8:	03412423          	sw	s4,40(sp)
     2bc:	03512223          	sw	s5,36(sp)
     2c0:	03612023          	sw	s6,32(sp)
     2c4:	01712e23          	sw	s7,28(sp)
     2c8:	01812c23          	sw	s8,24(sp)
     2cc:	01912a23          	sw	s9,20(sp)
     2d0:	01a12823          	sw	s10,16(sp)
     2d4:	01b12623          	sw	s11,12(sp)
     2d8:	00050413          	mv	s0,a0
     2dc:	00004097          	auipc	ra,0x4
     2e0:	79c080e7          	jalr	1948(ra) # 4a78 <fl_fopen>
     2e4:	08051063          	bnez	a0,364 <play_music_file+0xcc>
     2e8:	00000593          	li	a1,0
     2ec:	0ff00513          	li	a0,255
     2f0:	00001097          	auipc	ra,0x1
     2f4:	2a8080e7          	jalr	680(ra) # 1598 <display_set_front_back_color>
     2f8:	00005537          	lui	a0,0x5
     2fc:	00040593          	mv	a1,s0
     300:	eb050513          	addi	a0,a0,-336 # 4eb0 <LEDS+0x14>
     304:	00001097          	auipc	ra,0x1
     308:	5cc080e7          	jalr	1484(ra) # 18d0 <printf>
     30c:	00001097          	auipc	ra,0x1
     310:	3cc080e7          	jalr	972(ra) # 16d8 <display_refresh>
     314:	000317b7          	lui	a5,0x31
     318:	d4078793          	addi	a5,a5,-704 # 30d40 <__stacktop+0x20d40>
     31c:	00000013          	nop
     320:	fff78793          	addi	a5,a5,-1
     324:	fe079ce3          	bnez	a5,31c <play_music_file+0x84>
     328:	03c12083          	lw	ra,60(sp)
     32c:	03812403          	lw	s0,56(sp)
     330:	03412483          	lw	s1,52(sp)
     334:	03012903          	lw	s2,48(sp)
     338:	02c12983          	lw	s3,44(sp)
     33c:	02812a03          	lw	s4,40(sp)
     340:	02412a83          	lw	s5,36(sp)
     344:	02012b03          	lw	s6,32(sp)
     348:	01c12b83          	lw	s7,28(sp)
     34c:	01812c03          	lw	s8,24(sp)
     350:	01412c83          	lw	s9,20(sp)
     354:	01012d03          	lw	s10,16(sp)
     358:	00c12d83          	lw	s11,12(sp)
     35c:	04010113          	addi	sp,sp,64
     360:	00008067          	ret
     364:	00000593          	li	a1,0
     368:	00050c13          	mv	s8,a0
     36c:	00000513          	li	a0,0
     370:	00001097          	auipc	ra,0x1
     374:	214080e7          	jalr	532(ra) # 1584 <display_set_cursor>
     378:	00000593          	li	a1,0
     37c:	0ff00513          	li	a0,255
     380:	00001097          	auipc	ra,0x1
     384:	218080e7          	jalr	536(ra) # 1598 <display_set_front_back_color>
     388:	00005537          	lui	a0,0x5
     38c:	00040593          	mv	a1,s0
     390:	ebc50513          	addi	a0,a0,-324 # 4ebc <LEDS+0x20>
     394:	00001097          	auipc	ra,0x1
     398:	53c080e7          	jalr	1340(ra) # 18d0 <printf>
     39c:	00001097          	auipc	ra,0x1
     3a0:	33c080e7          	jalr	828(ra) # 16d8 <display_refresh>
     3a4:	000057b7          	lui	a5,0x5
     3a8:	e8c7a783          	lw	a5,-372(a5) # 4e8c <BUTTONS>
     3ac:	00000b13          	li	s6,0
     3b0:	00100413          	li	s0,1
     3b4:	0007a483          	lw	s1,0(a5)
     3b8:	00078c93          	mv	s9,a5
     3bc:	000057b7          	lui	a5,0x5
     3c0:	e887ad03          	lw	s10,-376(a5) # 4e88 <AUDIO>
     3c4:	20000a13          	li	s4,512
     3c8:	1ff00993          	li	s3,511
     3cc:	00005937          	lui	s2,0x5
     3d0:	000d2b83          	lw	s7,0(s10)
     3d4:	000c0693          	mv	a3,s8
     3d8:	20000613          	li	a2,512
     3dc:	00100593          	li	a1,1
     3e0:	000b8513          	mv	a0,s7
     3e4:	00004097          	auipc	ra,0x4
     3e8:	090080e7          	jalr	144(ra) # 4474 <fl_fread>
     3ec:	00050a93          	mv	s5,a0
     3f0:	00a9cc63          	blt	s3,a0,408 <play_music_file+0x170>
     3f4:	40aa0633          	sub	a2,s4,a0
     3f8:	00000593          	li	a1,0
     3fc:	00ab8533          	add	a0,s7,a0
     400:	00001097          	auipc	ra,0x1
     404:	eb4080e7          	jalr	-332(ra) # 12b4 <memset>
     408:	000d2783          	lw	a5,0(s10)
     40c:	fefb8ee3          	beq	s7,a5,408 <play_music_file+0x170>
     410:	0559d263          	bge	s3,s5,454 <play_music_file+0x1bc>
     414:	fff40793          	addi	a5,s0,-1
     418:	f8040713          	addi	a4,s0,-128
     41c:	00173713          	seqz	a4,a4
     420:	0017b793          	seqz	a5,a5
     424:	00e7e7b3          	or	a5,a5,a4
     428:	00fb4733          	xor	a4,s6,a5
     42c:	0afb0463          	beq	s6,a5,4d4 <play_music_file+0x23c>
     430:	00141413          	slli	s0,s0,0x1
     434:	e9c92783          	lw	a5,-356(s2) # 4e9c <LEDS>
     438:	fff4c493          	not	s1,s1
     43c:	0087a023          	sw	s0,0(a5)
     440:	000ca783          	lw	a5,0(s9)
     444:	00f4f4b3          	and	s1,s1,a5
     448:	08048063          	beqz	s1,4c8 <play_music_file+0x230>
     44c:	00000097          	auipc	ra,0x0
     450:	c94080e7          	jalr	-876(ra) # e0 <play_click_noise>
     454:	000c0513          	mv	a0,s8
     458:	00004097          	auipc	ra,0x4
     45c:	f40080e7          	jalr	-192(ra) # 4398 <fl_fclose>
     460:	00000097          	auipc	ra,0x0
     464:	c04080e7          	jalr	-1020(ra) # 64 <clear_audio>
     468:	e9c92783          	lw	a5,-356(s2)
     46c:	0007a023          	sw	zero,0(a5)
     470:	00001097          	auipc	ra,0x1
     474:	108080e7          	jalr	264(ra) # 1578 <display_framebuffer>
     478:	00004637          	lui	a2,0x4
     47c:	00000593          	li	a1,0
     480:	00001097          	auipc	ra,0x1
     484:	e34080e7          	jalr	-460(ra) # 12b4 <memset>
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
     4c4:	21830067          	jr	536(t1) # 16d8 <display_refresh>
     4c8:	00070b13          	mv	s6,a4
     4cc:	00078493          	mv	s1,a5
     4d0:	f01ff06f          	j	3d0 <play_music_file+0x138>
     4d4:	40145413          	srai	s0,s0,0x1
     4d8:	f5dff06f          	j	434 <play_music_file+0x19c>

000004dc <scan_files>:
     4dc:	fd010113          	addi	sp,sp,-48
     4e0:	02912223          	sw	s1,36(sp)
     4e4:	000055b7          	lui	a1,0x5
     4e8:	000054b7          	lui	s1,0x5
     4ec:	02812423          	sw	s0,40(sp)
     4f0:	ed458593          	addi	a1,a1,-300 # 4ed4 <LEDS+0x38>
     4f4:	00005437          	lui	s0,0x5
     4f8:	19448513          	addi	a0,s1,404 # 5194 <current_path>
     4fc:	02112623          	sw	ra,44(sp)
     500:	03212023          	sw	s2,32(sp)
     504:	01312e23          	sw	s3,28(sp)
     508:	01412c23          	sw	s4,24(sp)
     50c:	01512a23          	sw	s5,20(sp)
     510:	01612823          	sw	s6,16(sp)
     514:	01712623          	sw	s7,12(sp)
     518:	38042423          	sw	zero,904(s0) # 5388 <n_items>
     51c:	00000097          	auipc	ra,0x0
     520:	b00080e7          	jalr	-1280(ra) # 1c <strcmp>
     524:	06050e63          	beqz	a0,5a0 <scan_files+0xc4>
     528:	00005937          	lui	s2,0x5
     52c:	06400613          	li	a2,100
     530:	00000593          	li	a1,0
     534:	4d490513          	addi	a0,s2,1236 # 54d4 <files>
     538:	00001097          	auipc	ra,0x1
     53c:	d7c080e7          	jalr	-644(ra) # 12b4 <memset>
     540:	38842783          	lw	a5,904(s0)
     544:	4d490913          	addi	s2,s2,1236
     548:	000055b7          	lui	a1,0x5
     54c:	00379513          	slli	a0,a5,0x3
     550:	40f50533          	sub	a0,a0,a5
     554:	00251513          	slli	a0,a0,0x2
     558:	40f50533          	sub	a0,a0,a5
     55c:	00251513          	slli	a0,a0,0x2
     560:	00a90533          	add	a0,s2,a0
     564:	ed858593          	addi	a1,a1,-296 # 4ed8 <LEDS+0x3c>
     568:	00001097          	auipc	ra,0x1
     56c:	e10080e7          	jalr	-496(ra) # 1378 <strcpy>
     570:	38842703          	lw	a4,904(s0)
     574:	00371793          	slli	a5,a4,0x3
     578:	40e787b3          	sub	a5,a5,a4
     57c:	00279793          	slli	a5,a5,0x2
     580:	40e787b3          	sub	a5,a5,a4
     584:	00279793          	slli	a5,a5,0x2
     588:	00f90933          	add	s2,s2,a5
     58c:	00100793          	li	a5,1
     590:	00f70733          	add	a4,a4,a5
     594:	06092223          	sw	zero,100(s2)
     598:	06f92423          	sw	a5,104(s2)
     59c:	38e42423          	sw	a4,904(s0)
     5a0:	000059b7          	lui	s3,0x5
     5a4:	4c898593          	addi	a1,s3,1224 # 54c8 <dirstat.1>
     5a8:	19448513          	addi	a0,s1,404
     5ac:	00003097          	auipc	ra,0x3
     5b0:	e6c080e7          	jalr	-404(ra) # 3418 <fl_opendir>
     5b4:	14050063          	beqz	a0,6f4 <scan_files+0x218>
     5b8:	00005937          	lui	s2,0x5
     5bc:	000057b7          	lui	a5,0x5
     5c0:	000054b7          	lui	s1,0x5
     5c4:	edc78b93          	addi	s7,a5,-292 # 4edc <LEDS+0x40>
     5c8:	4d448493          	addi	s1,s1,1236 # 54d4 <files>
     5cc:	3b890a13          	addi	s4,s2,952 # 53b8 <dirent.0>
     5d0:	3b890593          	addi	a1,s2,952
     5d4:	4c898513          	addi	a0,s3,1224
     5d8:	00003097          	auipc	ra,0x3
     5dc:	50c080e7          	jalr	1292(ra) # 3ae4 <fl_readdir>
     5e0:	00050a93          	mv	s5,a0
     5e4:	00051863          	bnez	a0,5f4 <scan_files+0x118>
     5e8:	38842b03          	lw	s6,904(s0)
     5ec:	03f00793          	li	a5,63
     5f0:	0367dc63          	bge	a5,s6,628 <scan_files+0x14c>
     5f4:	02812403          	lw	s0,40(sp)
     5f8:	02c12083          	lw	ra,44(sp)
     5fc:	02412483          	lw	s1,36(sp)
     600:	02012903          	lw	s2,32(sp)
     604:	01812a03          	lw	s4,24(sp)
     608:	01412a83          	lw	s5,20(sp)
     60c:	01012b03          	lw	s6,16(sp)
     610:	00c12b83          	lw	s7,12(sp)
     614:	4c898513          	addi	a0,s3,1224
     618:	01c12983          	lw	s3,28(sp)
     61c:	03010113          	addi	sp,sp,48
     620:	00002317          	auipc	t1,0x2
     624:	9e030067          	jr	-1568(t1) # 2000 <fl_closedir>
     628:	000b8593          	mv	a1,s7
     62c:	3b890513          	addi	a0,s2,952
     630:	00000097          	auipc	ra,0x0
     634:	9ec080e7          	jalr	-1556(ra) # 1c <strcmp>
     638:	f8050ce3          	beqz	a0,5d0 <scan_files+0xf4>
     63c:	000055b7          	lui	a1,0x5
     640:	ed858593          	addi	a1,a1,-296 # 4ed8 <LEDS+0x3c>
     644:	3b890513          	addi	a0,s2,952
     648:	00000097          	auipc	ra,0x0
     64c:	9d4080e7          	jalr	-1580(ra) # 1c <strcmp>
     650:	f80500e3          	beqz	a0,5d0 <scan_files+0xf4>
     654:	003b1513          	slli	a0,s6,0x3
     658:	41650533          	sub	a0,a0,s6
     65c:	00251513          	slli	a0,a0,0x2
     660:	41650533          	sub	a0,a0,s6
     664:	00251513          	slli	a0,a0,0x2
     668:	06400613          	li	a2,100
     66c:	00000593          	li	a1,0
     670:	00a48533          	add	a0,s1,a0
     674:	00001097          	auipc	ra,0x1
     678:	c40080e7          	jalr	-960(ra) # 12b4 <memset>
     67c:	38842703          	lw	a4,904(s0)
     680:	06300513          	li	a0,99
     684:	00371793          	slli	a5,a4,0x3
     688:	40e786b3          	sub	a3,a5,a4
     68c:	00269693          	slli	a3,a3,0x2
     690:	40e686b3          	sub	a3,a3,a4
     694:	00269693          	slli	a3,a3,0x2
     698:	014a8633          	add	a2,s5,s4
     69c:	00064583          	lbu	a1,0(a2) # 4000 <fatfs_fat_add_cluster_to_chain+0x8>
     6a0:	00058463          	beqz	a1,6a8 <scan_files+0x1cc>
     6a4:	02aa9e63          	bne	s5,a0,6e0 <scan_files+0x204>
     6a8:	40e787b3          	sub	a5,a5,a4
     6ac:	00279793          	slli	a5,a5,0x2
     6b0:	10ca2683          	lw	a3,268(s4)
     6b4:	40e787b3          	sub	a5,a5,a4
     6b8:	00279793          	slli	a5,a5,0x2
     6bc:	00f487b3          	add	a5,s1,a5
     6c0:	06d7a223          	sw	a3,100(a5)
     6c4:	104a4683          	lbu	a3,260(s4)
     6c8:	01578ab3          	add	s5,a5,s5
     6cc:	00170713          	addi	a4,a4,1
     6d0:	000a8023          	sb	zero,0(s5)
     6d4:	06d7a423          	sw	a3,104(a5)
     6d8:	38e42423          	sw	a4,904(s0)
     6dc:	ef5ff06f          	j	5d0 <scan_files+0xf4>
     6e0:	00da8633          	add	a2,s5,a3
     6e4:	00c48633          	add	a2,s1,a2
     6e8:	00b60023          	sb	a1,0(a2)
     6ec:	001a8a93          	addi	s5,s5,1
     6f0:	fa9ff06f          	j	698 <scan_files+0x1bc>
     6f4:	02c12083          	lw	ra,44(sp)
     6f8:	02812403          	lw	s0,40(sp)
     6fc:	02412483          	lw	s1,36(sp)
     700:	02012903          	lw	s2,32(sp)
     704:	01c12983          	lw	s3,28(sp)
     708:	01812a03          	lw	s4,24(sp)
     70c:	01412a83          	lw	s5,20(sp)
     710:	01012b03          	lw	s6,16(sp)
     714:	00c12b83          	lw	s7,12(sp)
     718:	03010113          	addi	sp,sp,48
     71c:	00008067          	ret

00000720 <main>:
     720:	000057b7          	lui	a5,0x5
     724:	e9c7a783          	lw	a5,-356(a5) # 4e9c <LEDS>
     728:	db010113          	addi	sp,sp,-592
     72c:	24112623          	sw	ra,588(sp)
     730:	24812423          	sw	s0,584(sp)
     734:	24912223          	sw	s1,580(sp)
     738:	23612823          	sw	s6,560(sp)
     73c:	25212023          	sw	s2,576(sp)
     740:	23312e23          	sw	s3,572(sp)
     744:	23412c23          	sw	s4,568(sp)
     748:	23512a23          	sw	s5,564(sp)
     74c:	23712623          	sw	s7,556(sp)
     750:	23812423          	sw	s8,552(sp)
     754:	23912223          	sw	s9,548(sp)
     758:	23a12023          	sw	s10,544(sp)
     75c:	21b12e23          	sw	s11,540(sp)
     760:	0007a023          	sw	zero,0(a5)
     764:	000017b7          	lui	a5,0x1
     768:	5ac78793          	addi	a5,a5,1452 # 15ac <display_putchar>
     76c:	00005b37          	lui	s6,0x5
     770:	38fb2e23          	sw	a5,924(s6) # 539c <f_putchar>
     774:	00001097          	auipc	ra,0x1
     778:	d40080e7          	jalr	-704(ra) # 14b4 <oled_init>
     77c:	00001097          	auipc	ra,0x1
     780:	d44080e7          	jalr	-700(ra) # 14c0 <oled_fullscreen>
     784:	00001097          	auipc	ra,0x1
     788:	df4080e7          	jalr	-524(ra) # 1578 <display_framebuffer>
     78c:	00004637          	lui	a2,0x4
     790:	00000593          	li	a1,0
     794:	00001097          	auipc	ra,0x1
     798:	b20080e7          	jalr	-1248(ra) # 12b4 <memset>
     79c:	00001097          	auipc	ra,0x1
     7a0:	f3c080e7          	jalr	-196(ra) # 16d8 <display_refresh>
     7a4:	00001097          	auipc	ra,0x1
     7a8:	8b0080e7          	jalr	-1872(ra) # 1054 <sdcard_init>
     7ac:	00001097          	auipc	ra,0x1
     7b0:	6f4080e7          	jalr	1780(ra) # 1ea0 <fl_init>
     7b4:	00000593          	li	a1,0
     7b8:	00000513          	li	a0,0
     7bc:	00001097          	auipc	ra,0x1
     7c0:	dc8080e7          	jalr	-568(ra) # 1584 <display_set_cursor>
     7c4:	00000593          	li	a1,0
     7c8:	0ff00513          	li	a0,255
     7cc:	00001097          	auipc	ra,0x1
     7d0:	dcc080e7          	jalr	-564(ra) # 1598 <display_set_front_back_color>
     7d4:	00005537          	lui	a0,0x5
     7d8:	ee050513          	addi	a0,a0,-288 # 4ee0 <LEDS+0x44>
     7dc:	00001097          	auipc	ra,0x1
     7e0:	0f4080e7          	jalr	244(ra) # 18d0 <printf>
     7e4:	000014b7          	lui	s1,0x1
     7e8:	00001437          	lui	s0,0x1
     7ec:	00001097          	auipc	ra,0x1
     7f0:	eec080e7          	jalr	-276(ra) # 16d8 <display_refresh>
     7f4:	1f848493          	addi	s1,s1,504 # 11f8 <sdcard_writesector>
     7f8:	1a440413          	addi	s0,s0,420 # 11a4 <sdcard_readsector>
     7fc:	00048593          	mv	a1,s1
     800:	00040513          	mv	a0,s0
     804:	00002097          	auipc	ra,0x2
     808:	5fc080e7          	jalr	1532(ra) # 2e00 <fl_attach_media>
     80c:	fe0518e3          	bnez	a0,7fc <main+0xdc>
     810:	00000097          	auipc	ra,0x0
     814:	ccc080e7          	jalr	-820(ra) # 4dc <scan_files>
     818:	000057b7          	lui	a5,0x5
     81c:	ef478793          	addi	a5,a5,-268 # 4ef4 <LEDS+0x58>
     820:	00f12423          	sw	a5,8(sp)
     824:	000057b7          	lui	a5,0x5
     828:	e8c7a783          	lw	a5,-372(a5) # 4e8c <BUTTONS>
     82c:	00005ab7          	lui	s5,0x5
     830:	00000913          	li	s2,0
     834:	00000993          	li	s3,0
     838:	00000c13          	li	s8,0
     83c:	00000413          	li	s0,0
     840:	194a8a93          	addi	s5,s5,404 # 5194 <current_path>
     844:	00f12623          	sw	a5,12(sp)
     848:	00000593          	li	a1,0
     84c:	00000513          	li	a0,0
     850:	00001097          	auipc	ra,0x1
     854:	d34080e7          	jalr	-716(ra) # 1584 <display_set_cursor>
     858:	0ffc7593          	zext.b	a1,s8
     85c:	07f58513          	addi	a0,a1,127
     860:	0ff57513          	zext.b	a0,a0
     864:	00001097          	auipc	ra,0x1
     868:	d34080e7          	jalr	-716(ra) # 1598 <display_set_front_back_color>
     86c:	00812503          	lw	a0,8(sp)
     870:	00000493          	li	s1,0
     874:	00f00a13          	li	s4,15
     878:	00001097          	auipc	ra,0x1
     87c:	058080e7          	jalr	88(ra) # 18d0 <printf>
     880:	015487b3          	add	a5,s1,s5
     884:	0007c503          	lbu	a0,0(a5)
     888:	00050a63          	beqz	a0,89c <main+0x17c>
     88c:	39cb2783          	lw	a5,924(s6)
     890:	00148493          	addi	s1,s1,1
     894:	000780e7          	jalr	a5
     898:	ff4494e3          	bne	s1,s4,880 <main+0x160>
     89c:	39cb2783          	lw	a5,924(s6)
     8a0:	00a00513          	li	a0,10
     8a4:	00005d37          	lui	s10,0x5
     8a8:	000780e7          	jalr	a5
     8ac:	00000593          	li	a1,0
     8b0:	0ff00513          	li	a0,255
     8b4:	00001097          	auipc	ra,0x1
     8b8:	ce4080e7          	jalr	-796(ra) # 1598 <display_set_front_back_color>
     8bc:	388d2a03          	lw	s4,904(s10) # 5388 <n_items>
     8c0:	0a0a0463          	beqz	s4,968 <main+0x248>
     8c4:	412a0a33          	sub	s4,s4,s2
     8c8:	00c00793          	li	a5,12
     8cc:	0147d463          	bge	a5,s4,8d4 <main+0x1b4>
     8d0:	00078a13          	mv	s4,a5
     8d4:	00391493          	slli	s1,s2,0x3
     8d8:	412484b3          	sub	s1,s1,s2
     8dc:	00249493          	slli	s1,s1,0x2
     8e0:	412484b3          	sub	s1,s1,s2
     8e4:	000057b7          	lui	a5,0x5
     8e8:	4d478793          	addi	a5,a5,1236 # 54d4 <files>
     8ec:	00249493          	slli	s1,s1,0x2
     8f0:	00f484b3          	add	s1,s1,a5
     8f4:	000057b7          	lui	a5,0x5
     8f8:	f1878793          	addi	a5,a5,-232 # 4f18 <LEDS+0x7c>
     8fc:	00f12023          	sw	a5,0(sp)
     900:	000057b7          	lui	a5,0x5
     904:	f1078793          	addi	a5,a5,-240 # 4f10 <LEDS+0x74>
     908:	00000b93          	li	s7,0
     90c:	00f12223          	sw	a5,4(sp)
     910:	01200d93          	li	s11,18
     914:	194bc063          	blt	s7,s4,a94 <main+0x374>
     918:	00000593          	li	a1,0
     91c:	00000513          	li	a0,0
     920:	000054b7          	lui	s1,0x5
     924:	00001097          	auipc	ra,0x1
     928:	c74080e7          	jalr	-908(ra) # 1598 <display_set_front_back_color>
     92c:	00c00b93          	li	s7,12
     930:	f2048493          	addi	s1,s1,-224 # 4f20 <LEDS+0x84>
     934:	057a0263          	beq	s4,s7,978 <main+0x258>
     938:	00048513          	mv	a0,s1
     93c:	00001097          	auipc	ra,0x1
     940:	f94080e7          	jalr	-108(ra) # 18d0 <printf>
     944:	001a0a13          	addi	s4,s4,1
     948:	fedff06f          	j	934 <main+0x214>
     94c:	00000913          	li	s2,0
     950:	00000413          	li	s0,0
     954:	007c0c13          	addi	s8,s8,7
     958:	000a0993          	mv	s3,s4
     95c:	eedff06f          	j	848 <main+0x128>
     960:	00040913          	mv	s2,s0
     964:	ff1ff06f          	j	954 <main+0x234>
     968:	00005537          	lui	a0,0x5
     96c:	efc50513          	addi	a0,a0,-260 # 4efc <LEDS+0x60>
     970:	00001097          	auipc	ra,0x1
     974:	f60080e7          	jalr	-160(ra) # 18d0 <printf>
     978:	00001097          	auipc	ra,0x1
     97c:	d60080e7          	jalr	-672(ra) # 16d8 <display_refresh>
     980:	00c12783          	lw	a5,12(sp)
     984:	fff9c993          	not	s3,s3
     988:	0007aa03          	lw	s4,0(a5)
     98c:	0149f9b3          	and	s3,s3,s4
     990:	0109f793          	andi	a5,s3,16
     994:	00078863          	beqz	a5,9a4 <main+0x284>
     998:	00140413          	addi	s0,s0,1
     99c:	fffff097          	auipc	ra,0xfffff
     9a0:	744080e7          	jalr	1860(ra) # e0 <play_click_noise>
     9a4:	0089f793          	andi	a5,s3,8
     9a8:	00078863          	beqz	a5,9b8 <main+0x298>
     9ac:	fff40413          	addi	s0,s0,-1
     9b0:	fffff097          	auipc	ra,0xfffff
     9b4:	730080e7          	jalr	1840(ra) # e0 <play_click_noise>
     9b8:	0049f993          	andi	s3,s3,4
     9bc:	0a098863          	beqz	s3,a6c <main+0x34c>
     9c0:	00341993          	slli	s3,s0,0x3
     9c4:	408984b3          	sub	s1,s3,s0
     9c8:	00249493          	slli	s1,s1,0x2
     9cc:	408484b3          	sub	s1,s1,s0
     9d0:	00005bb7          	lui	s7,0x5
     9d4:	00249493          	slli	s1,s1,0x2
     9d8:	4d4b8b93          	addi	s7,s7,1236 # 54d4 <files>
     9dc:	fffff097          	auipc	ra,0xfffff
     9e0:	704080e7          	jalr	1796(ra) # e0 <play_click_noise>
     9e4:	017484b3          	add	s1,s1,s7
     9e8:	0684a783          	lw	a5,104(s1)
     9ec:	1a078863          	beqz	a5,b9c <main+0x47c>
     9f0:	000055b7          	lui	a1,0x5
     9f4:	ed858593          	addi	a1,a1,-296 # 4ed8 <LEDS+0x3c>
     9f8:	00048513          	mv	a0,s1
     9fc:	fffff097          	auipc	ra,0xfffff
     a00:	620080e7          	jalr	1568(ra) # 1c <strcmp>
     a04:	00000713          	li	a4,0
     a08:	14051063          	bnez	a0,b48 <main+0x428>
     a0c:	00aa87b3          	add	a5,s5,a0
     a10:	0007c703          	lbu	a4,0(a5)
     a14:	10071863          	bnez	a4,b24 <main+0x404>
     a18:	00100713          	li	a4,1
     a1c:	02a75063          	bge	a4,a0,a3c <main+0x31c>
     a20:	02f00593          	li	a1,47
     a24:	000a8513          	mv	a0,s5
     a28:	fe078fa3          	sb	zero,-1(a5)
     a2c:	fffff097          	auipc	ra,0xfffff
     a30:	614080e7          	jalr	1556(ra) # 40 <strrchr>
     a34:	0e050c63          	beqz	a0,b2c <main+0x40c>
     a38:	000500a3          	sb	zero,1(a0)
     a3c:	00000097          	auipc	ra,0x0
     a40:	aa0080e7          	jalr	-1376(ra) # 4dc <scan_files>
     a44:	00001097          	auipc	ra,0x1
     a48:	b34080e7          	jalr	-1228(ra) # 1578 <display_framebuffer>
     a4c:	00004637          	lui	a2,0x4
     a50:	00000593          	li	a1,0
     a54:	00001097          	auipc	ra,0x1
     a58:	860080e7          	jalr	-1952(ra) # 12b4 <memset>
     a5c:	00001097          	auipc	ra,0x1
     a60:	c7c080e7          	jalr	-900(ra) # 16d8 <display_refresh>
     a64:	00000913          	li	s2,0
     a68:	00000413          	li	s0,0
     a6c:	388d2783          	lw	a5,904(s10)
     a70:	ecf05ee3          	blez	a5,94c <main+0x22c>
     a74:	fff00713          	li	a4,-1
     a78:	1ae41063          	bne	s0,a4,c18 <main+0x4f8>
     a7c:	00878433          	add	s0,a5,s0
     a80:	ef2440e3          	blt	s0,s2,960 <main+0x240>
     a84:	00b90793          	addi	a5,s2,11
     a88:	ec87d6e3          	bge	a5,s0,954 <main+0x234>
     a8c:	ff540913          	addi	s2,s0,-11
     a90:	ec5ff06f          	j	954 <main+0x234>
     a94:	012b8cb3          	add	s9,s7,s2
     a98:	07941463          	bne	s0,s9,b00 <main+0x3e0>
     a9c:	0ff00593          	li	a1,255
     aa0:	00000513          	li	a0,0
     aa4:	00001097          	auipc	ra,0x1
     aa8:	af4080e7          	jalr	-1292(ra) # 1598 <display_set_front_back_color>
     aac:	0684a783          	lw	a5,104(s1)
     ab0:	000c8593          	mv	a1,s9
     ab4:	04078c63          	beqz	a5,b0c <main+0x3ec>
     ab8:	00412503          	lw	a0,4(sp)
     abc:	00001097          	auipc	ra,0x1
     ac0:	e14080e7          	jalr	-492(ra) # 18d0 <printf>
     ac4:	00000c93          	li	s9,0
     ac8:	019487b3          	add	a5,s1,s9
     acc:	0007c503          	lbu	a0,0(a5)
     ad0:	00050a63          	beqz	a0,ae4 <main+0x3c4>
     ad4:	39cb2783          	lw	a5,924(s6)
     ad8:	001c8c93          	addi	s9,s9,1
     adc:	000780e7          	jalr	a5
     ae0:	ffbc94e3          	bne	s9,s11,ac8 <main+0x3a8>
     ae4:	39cb2783          	lw	a5,924(s6)
     ae8:	03bc9663          	bne	s9,s11,b14 <main+0x3f4>
     aec:	00a00513          	li	a0,10
     af0:	000780e7          	jalr	a5
     af4:	001b8b93          	addi	s7,s7,1
     af8:	06c48493          	addi	s1,s1,108
     afc:	e19ff06f          	j	914 <main+0x1f4>
     b00:	00000593          	li	a1,0
     b04:	0ff00513          	li	a0,255
     b08:	f9dff06f          	j	aa4 <main+0x384>
     b0c:	00012503          	lw	a0,0(sp)
     b10:	fadff06f          	j	abc <main+0x39c>
     b14:	02000513          	li	a0,32
     b18:	000780e7          	jalr	a5
     b1c:	001c8c93          	addi	s9,s9,1
     b20:	fc5ff06f          	j	ae4 <main+0x3c4>
     b24:	00150513          	addi	a0,a0,1
     b28:	ee5ff06f          	j	a0c <main+0x2ec>
     b2c:	000055b7          	lui	a1,0x5
     b30:	ed458593          	addi	a1,a1,-300 # 4ed4 <LEDS+0x38>
     b34:	000a8513          	mv	a0,s5
     b38:	00001097          	auipc	ra,0x1
     b3c:	840080e7          	jalr	-1984(ra) # 1378 <strcpy>
     b40:	efdff06f          	j	a3c <main+0x31c>
     b44:	00170713          	addi	a4,a4,1
     b48:	00ea87b3          	add	a5,s5,a4
     b4c:	0007c683          	lbu	a3,0(a5)
     b50:	fe069ae3          	bnez	a3,b44 <main+0x424>
     b54:	00d48633          	add	a2,s1,a3
     b58:	00064603          	lbu	a2,0(a2) # 4000 <fatfs_fat_add_cluster_to_chain+0x8>
     b5c:	02061463          	bnez	a2,b84 <main+0x464>
     b60:	00d70733          	add	a4,a4,a3
     b64:	1f100693          	li	a3,497
     b68:	ece6cae3          	blt	a3,a4,a3c <main+0x31c>
     b6c:	0004c703          	lbu	a4,0(s1)
     b70:	00071e63          	bnez	a4,b8c <main+0x46c>
     b74:	02f00713          	li	a4,47
     b78:	00e78023          	sb	a4,0(a5)
     b7c:	000780a3          	sb	zero,1(a5)
     b80:	ebdff06f          	j	a3c <main+0x31c>
     b84:	00168693          	addi	a3,a3,1
     b88:	fcdff06f          	j	b54 <main+0x434>
     b8c:	00178793          	addi	a5,a5,1
     b90:	00148493          	addi	s1,s1,1
     b94:	fee78fa3          	sb	a4,-1(a5)
     b98:	fd5ff06f          	j	b6c <main+0x44c>
     b9c:	000a8593          	mv	a1,s5
     ba0:	01c10513          	addi	a0,sp,28
     ba4:	00000097          	auipc	ra,0x0
     ba8:	7d4080e7          	jalr	2004(ra) # 1378 <strcpy>
     bac:	01c10793          	addi	a5,sp,28
     bb0:	0007c703          	lbu	a4,0(a5)
     bb4:	04071063          	bnez	a4,bf4 <main+0x4d4>
     bb8:	0004c703          	lbu	a4,0(s1)
     bbc:	04071063          	bnez	a4,bfc <main+0x4dc>
     bc0:	408989b3          	sub	s3,s3,s0
     bc4:	00299993          	slli	s3,s3,0x2
     bc8:	408989b3          	sub	s3,s3,s0
     bcc:	00299993          	slli	s3,s3,0x2
     bd0:	013b8bb3          	add	s7,s7,s3
     bd4:	064ba703          	lw	a4,100(s7)
     bd8:	00078023          	sb	zero,0(a5)
     bdc:	000047b7          	lui	a5,0x4
     be0:	01c10513          	addi	a0,sp,28
     be4:	02f71463          	bne	a4,a5,c0c <main+0x4ec>
     be8:	fffff097          	auipc	ra,0xfffff
     bec:	5f8080e7          	jalr	1528(ra) # 1e0 <view_image_file>
     bf0:	e7dff06f          	j	a6c <main+0x34c>
     bf4:	00178793          	addi	a5,a5,1 # 4001 <fatfs_fat_add_cluster_to_chain+0x9>
     bf8:	fb9ff06f          	j	bb0 <main+0x490>
     bfc:	00178793          	addi	a5,a5,1
     c00:	00148493          	addi	s1,s1,1
     c04:	fee78fa3          	sb	a4,-1(a5)
     c08:	fb1ff06f          	j	bb8 <main+0x498>
     c0c:	fffff097          	auipc	ra,0xfffff
     c10:	68c080e7          	jalr	1676(ra) # 298 <play_music_file>
     c14:	e59ff06f          	j	a6c <main+0x34c>
     c18:	00f427b3          	slt	a5,s0,a5
     c1c:	40f007b3          	neg	a5,a5
     c20:	00f47433          	and	s0,s0,a5
     c24:	e5dff06f          	j	a80 <main+0x360>

00000c28 <pause>:
     c28:	c0002773          	rdcycle	a4
     c2c:	c00027f3          	rdcycle	a5
     c30:	40e787b3          	sub	a5,a5,a4
     c34:	fea7ece3          	bltu	a5,a0,c2c <pause+0x4>
     c38:	00008067          	ret

00000c3c <sdcard_idle>:
     c3c:	00008067          	ret

00000c40 <sdcard_select>:
     c40:	000057b7          	lui	a5,0x5
     c44:	e907a783          	lw	a5,-368(a5) # 4e90 <SDCARD>
     c48:	00200713          	li	a4,2
     c4c:	00e7a023          	sw	a4,0(a5)
     c50:	00008067          	ret

00000c54 <sdcard_ponder>:
     c54:	000056b7          	lui	a3,0x5
     c58:	e906a683          	lw	a3,-368(a3) # 4e90 <SDCARD>
     c5c:	01000793          	li	a5,16
     c60:	00000713          	li	a4,0
     c64:	00676613          	ori	a2,a4,6
     c68:	00c6a023          	sw	a2,0(a3)
     c6c:	00174713          	xori	a4,a4,1
     c70:	00000013          	nop
     c74:	fff78793          	addi	a5,a5,-1
     c78:	fe0796e3          	bnez	a5,c64 <sdcard_ponder+0x10>
     c7c:	00008067          	ret

00000c80 <sdcard_unselect>:
     c80:	000057b7          	lui	a5,0x5
     c84:	e907a783          	lw	a5,-368(a5) # 4e90 <SDCARD>
     c88:	00600713          	li	a4,6
     c8c:	00e7a023          	sw	a4,0(a5)
     c90:	00008067          	ret

00000c94 <sdcard_send>:
     c94:	000057b7          	lui	a5,0x5
     c98:	e907a783          	lw	a5,-368(a5) # 4e90 <SDCARD>
     c9c:	00655713          	srli	a4,a0,0x6
     ca0:	00277713          	andi	a4,a4,2
     ca4:	00e7a023          	sw	a4,0(a5)
     ca8:	00176713          	ori	a4,a4,1
     cac:	00e7a023          	sw	a4,0(a5)
     cb0:	00555713          	srli	a4,a0,0x5
     cb4:	00277713          	andi	a4,a4,2
     cb8:	00e7a023          	sw	a4,0(a5)
     cbc:	00176713          	ori	a4,a4,1
     cc0:	00e7a023          	sw	a4,0(a5)
     cc4:	00455713          	srli	a4,a0,0x4
     cc8:	00277713          	andi	a4,a4,2
     ccc:	00e7a023          	sw	a4,0(a5)
     cd0:	00176713          	ori	a4,a4,1
     cd4:	00e7a023          	sw	a4,0(a5)
     cd8:	00355713          	srli	a4,a0,0x3
     cdc:	00277713          	andi	a4,a4,2
     ce0:	00e7a023          	sw	a4,0(a5)
     ce4:	00176713          	ori	a4,a4,1
     ce8:	00e7a023          	sw	a4,0(a5)
     cec:	00255713          	srli	a4,a0,0x2
     cf0:	00277713          	andi	a4,a4,2
     cf4:	00e7a023          	sw	a4,0(a5)
     cf8:	00176713          	ori	a4,a4,1
     cfc:	00e7a023          	sw	a4,0(a5)
     d00:	00155713          	srli	a4,a0,0x1
     d04:	00277713          	andi	a4,a4,2
     d08:	00e7a023          	sw	a4,0(a5)
     d0c:	00176713          	ori	a4,a4,1
     d10:	00e7a023          	sw	a4,0(a5)
     d14:	00257713          	andi	a4,a0,2
     d18:	00e7a023          	sw	a4,0(a5)
     d1c:	00151513          	slli	a0,a0,0x1
     d20:	00176713          	ori	a4,a4,1
     d24:	00e7a023          	sw	a4,0(a5)
     d28:	00257513          	andi	a0,a0,2
     d2c:	00a7a023          	sw	a0,0(a5)
     d30:	00156513          	ori	a0,a0,1
     d34:	00a7a023          	sw	a0,0(a5)
     d38:	00200713          	li	a4,2
     d3c:	00e7a023          	sw	a4,0(a5)
     d40:	000057b7          	lui	a5,0x5
     d44:	38c7a783          	lw	a5,908(a5) # 538c <sdcard_while_loading_callback>
     d48:	00078067          	jr	a5

00000d4c <sdcard_read>:
     d4c:	fd010113          	addi	sp,sp,-48
     d50:	fff50793          	addi	a5,a0,-1
     d54:	03212023          	sw	s2,32(sp)
     d58:	00100913          	li	s2,1
     d5c:	00f91933          	sll	s2,s2,a5
     d60:	000057b7          	lui	a5,0x5
     d64:	01312e23          	sw	s3,28(sp)
     d68:	e907a983          	lw	s3,-368(a5) # 4e90 <SDCARD>
     d6c:	02812423          	sw	s0,40(sp)
     d70:	02912223          	sw	s1,36(sp)
     d74:	01412c23          	sw	s4,24(sp)
     d78:	01512a23          	sw	s5,20(sp)
     d7c:	01612823          	sw	s6,16(sp)
     d80:	02112623          	sw	ra,44(sp)
     d84:	0ff00413          	li	s0,255
     d88:	00000493          	li	s1,0
     d8c:	00300a13          	li	s4,3
     d90:	00200a93          	li	s5,2
     d94:	00005b37          	lui	s6,0x5
     d98:	02058c63          	beqz	a1,dd0 <sdcard_read+0x84>
     d9c:	012477b3          	and	a5,s0,s2
     da0:	02079a63          	bnez	a5,dd4 <sdcard_read+0x88>
     da4:	02c12083          	lw	ra,44(sp)
     da8:	0ff47513          	zext.b	a0,s0
     dac:	02812403          	lw	s0,40(sp)
     db0:	02412483          	lw	s1,36(sp)
     db4:	02012903          	lw	s2,32(sp)
     db8:	01c12983          	lw	s3,28(sp)
     dbc:	01812a03          	lw	s4,24(sp)
     dc0:	01412a83          	lw	s5,20(sp)
     dc4:	01012b03          	lw	s6,16(sp)
     dc8:	03010113          	addi	sp,sp,48
     dcc:	00008067          	ret
     dd0:	fca4dae3          	bge	s1,a0,da4 <sdcard_read+0x58>
     dd4:	0149a023          	sw	s4,0(s3)
     dd8:	0159a023          	sw	s5,0(s3)
     ddc:	0009a783          	lw	a5,0(s3)
     de0:	00141413          	slli	s0,s0,0x1
     de4:	00b12623          	sw	a1,12(sp)
     de8:	00f46433          	or	s0,s0,a5
     dec:	38cb2783          	lw	a5,908(s6) # 538c <sdcard_while_loading_callback>
     df0:	00a12423          	sw	a0,8(sp)
     df4:	00148493          	addi	s1,s1,1
     df8:	000780e7          	jalr	a5
     dfc:	00c12583          	lw	a1,12(sp)
     e00:	00812503          	lw	a0,8(sp)
     e04:	f95ff06f          	j	d98 <sdcard_read+0x4c>

00000e08 <sdcard_get>:
     e08:	fe010113          	addi	sp,sp,-32
     e0c:	00112e23          	sw	ra,28(sp)
     e10:	00812c23          	sw	s0,24(sp)
     e14:	00912a23          	sw	s1,20(sp)
     e18:	00050413          	mv	s0,a0
     e1c:	00b12623          	sw	a1,12(sp)
     e20:	00000097          	auipc	ra,0x0
     e24:	e20080e7          	jalr	-480(ra) # c40 <sdcard_select>
     e28:	00c12583          	lw	a1,12(sp)
     e2c:	00040513          	mv	a0,s0
     e30:	00100493          	li	s1,1
     e34:	00000097          	auipc	ra,0x0
     e38:	f18080e7          	jalr	-232(ra) # d4c <sdcard_read>
     e3c:	00345413          	srli	s0,s0,0x3
     e40:	0284c463          	blt	s1,s0,e68 <sdcard_get+0x60>
     e44:	00a12623          	sw	a0,12(sp)
     e48:	00000097          	auipc	ra,0x0
     e4c:	e38080e7          	jalr	-456(ra) # c80 <sdcard_unselect>
     e50:	01c12083          	lw	ra,28(sp)
     e54:	01812403          	lw	s0,24(sp)
     e58:	00c12503          	lw	a0,12(sp)
     e5c:	01412483          	lw	s1,20(sp)
     e60:	02010113          	addi	sp,sp,32
     e64:	00008067          	ret
     e68:	00000593          	li	a1,0
     e6c:	00800513          	li	a0,8
     e70:	00000097          	auipc	ra,0x0
     e74:	edc080e7          	jalr	-292(ra) # d4c <sdcard_read>
     e78:	00148493          	addi	s1,s1,1
     e7c:	fc5ff06f          	j	e40 <sdcard_get+0x38>

00000e80 <sdcard_cmd>:
     e80:	ff010113          	addi	sp,sp,-16
     e84:	00812423          	sw	s0,8(sp)
     e88:	00912223          	sw	s1,4(sp)
     e8c:	01212023          	sw	s2,0(sp)
     e90:	00112623          	sw	ra,12(sp)
     e94:	00050913          	mv	s2,a0
     e98:	00000413          	li	s0,0
     e9c:	00000097          	auipc	ra,0x0
     ea0:	da4080e7          	jalr	-604(ra) # c40 <sdcard_select>
     ea4:	00600493          	li	s1,6
     ea8:	008907b3          	add	a5,s2,s0
     eac:	0007c503          	lbu	a0,0(a5)
     eb0:	00140413          	addi	s0,s0,1
     eb4:	00000097          	auipc	ra,0x0
     eb8:	de0080e7          	jalr	-544(ra) # c94 <sdcard_send>
     ebc:	fe9416e3          	bne	s0,s1,ea8 <sdcard_cmd+0x28>
     ec0:	00812403          	lw	s0,8(sp)
     ec4:	00c12083          	lw	ra,12(sp)
     ec8:	00412483          	lw	s1,4(sp)
     ecc:	00012903          	lw	s2,0(sp)
     ed0:	01010113          	addi	sp,sp,16
     ed4:	00000317          	auipc	t1,0x0
     ed8:	dac30067          	jr	-596(t1) # c80 <sdcard_unselect>

00000edc <sdcard_start_sector>:
     edc:	ff010113          	addi	sp,sp,-16
     ee0:	00112623          	sw	ra,12(sp)
     ee4:	00812423          	sw	s0,8(sp)
     ee8:	00050413          	mv	s0,a0
     eec:	00000097          	auipc	ra,0x0
     ef0:	d54080e7          	jalr	-684(ra) # c40 <sdcard_select>
     ef4:	05100513          	li	a0,81
     ef8:	00000097          	auipc	ra,0x0
     efc:	d9c080e7          	jalr	-612(ra) # c94 <sdcard_send>
     f00:	01845513          	srli	a0,s0,0x18
     f04:	00000097          	auipc	ra,0x0
     f08:	d90080e7          	jalr	-624(ra) # c94 <sdcard_send>
     f0c:	41045513          	srai	a0,s0,0x10
     f10:	0ff57513          	zext.b	a0,a0
     f14:	00000097          	auipc	ra,0x0
     f18:	d80080e7          	jalr	-640(ra) # c94 <sdcard_send>
     f1c:	40845513          	srai	a0,s0,0x8
     f20:	0ff57513          	zext.b	a0,a0
     f24:	00000097          	auipc	ra,0x0
     f28:	d70080e7          	jalr	-656(ra) # c94 <sdcard_send>
     f2c:	0ff47513          	zext.b	a0,s0
     f30:	00000097          	auipc	ra,0x0
     f34:	d64080e7          	jalr	-668(ra) # c94 <sdcard_send>
     f38:	05500513          	li	a0,85
     f3c:	00000097          	auipc	ra,0x0
     f40:	d58080e7          	jalr	-680(ra) # c94 <sdcard_send>
     f44:	00000097          	auipc	ra,0x0
     f48:	d3c080e7          	jalr	-708(ra) # c80 <sdcard_unselect>
     f4c:	00812403          	lw	s0,8(sp)
     f50:	00c12083          	lw	ra,12(sp)
     f54:	00100593          	li	a1,1
     f58:	00800513          	li	a0,8
     f5c:	01010113          	addi	sp,sp,16
     f60:	00000317          	auipc	t1,0x0
     f64:	ea830067          	jr	-344(t1) # e08 <sdcard_get>

00000f68 <sdcard_read_sector>:
     f68:	ff010113          	addi	sp,sp,-16
     f6c:	00812423          	sw	s0,8(sp)
     f70:	00112623          	sw	ra,12(sp)
     f74:	00912223          	sw	s1,4(sp)
     f78:	01212023          	sw	s2,0(sp)
     f7c:	00058413          	mv	s0,a1
     f80:	00000097          	auipc	ra,0x0
     f84:	f5c080e7          	jalr	-164(ra) # edc <sdcard_start_sector>
     f88:	04051863          	bnez	a0,fd8 <sdcard_read_sector+0x70>
     f8c:	00100593          	li	a1,1
     f90:	00058513          	mv	a0,a1
     f94:	00000097          	auipc	ra,0x0
     f98:	e74080e7          	jalr	-396(ra) # e08 <sdcard_get>
     f9c:	00000493          	li	s1,0
     fa0:	20000913          	li	s2,512
     fa4:	00000593          	li	a1,0
     fa8:	00800513          	li	a0,8
     fac:	00000097          	auipc	ra,0x0
     fb0:	e5c080e7          	jalr	-420(ra) # e08 <sdcard_get>
     fb4:	009407b3          	add	a5,s0,s1
     fb8:	00a78023          	sb	a0,0(a5)
     fbc:	00148493          	addi	s1,s1,1
     fc0:	ff2492e3          	bne	s1,s2,fa4 <sdcard_read_sector+0x3c>
     fc4:	00100593          	li	a1,1
     fc8:	01000513          	li	a0,16
     fcc:	20040413          	addi	s0,s0,512
     fd0:	00000097          	auipc	ra,0x0
     fd4:	e38080e7          	jalr	-456(ra) # e08 <sdcard_get>
     fd8:	00c12083          	lw	ra,12(sp)
     fdc:	00040513          	mv	a0,s0
     fe0:	00812403          	lw	s0,8(sp)
     fe4:	00412483          	lw	s1,4(sp)
     fe8:	00012903          	lw	s2,0(sp)
     fec:	01010113          	addi	sp,sp,16
     ff0:	00008067          	ret

00000ff4 <sdcard_preinit>:
     ff4:	ff010113          	addi	sp,sp,-16
     ff8:	000057b7          	lui	a5,0x5
     ffc:	00812423          	sw	s0,8(sp)
    1000:	e907a403          	lw	s0,-368(a5) # 4e90 <SDCARD>
    1004:	00112623          	sw	ra,12(sp)
    1008:	00600793          	li	a5,6
    100c:	01313537          	lui	a0,0x1313
    1010:	00f42023          	sw	a5,0(s0)
    1014:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
    1018:	00000097          	auipc	ra,0x0
    101c:	c10080e7          	jalr	-1008(ra) # c28 <pause>
    1020:	0a000793          	li	a5,160
    1024:	00000713          	li	a4,0
    1028:	00676693          	ori	a3,a4,6
    102c:	00d42023          	sw	a3,0(s0)
    1030:	fff78793          	addi	a5,a5,-1
    1034:	00174713          	xori	a4,a4,1
    1038:	fe0798e3          	bnez	a5,1028 <sdcard_preinit+0x34>
    103c:	00600793          	li	a5,6
    1040:	00c12083          	lw	ra,12(sp)
    1044:	00f42023          	sw	a5,0(s0)
    1048:	00812403          	lw	s0,8(sp)
    104c:	01010113          	addi	sp,sp,16
    1050:	00008067          	ret

00001054 <sdcard_init>:
    1054:	000017b7          	lui	a5,0x1
    1058:	c3c78793          	addi	a5,a5,-964 # c3c <sdcard_idle>
    105c:	00005737          	lui	a4,0x5
    1060:	fe010113          	addi	sp,sp,-32
    1064:	38f72623          	sw	a5,908(a4) # 538c <sdcard_while_loading_callback>
    1068:	000057b7          	lui	a5,0x5
    106c:	00812c23          	sw	s0,24(sp)
    1070:	00912a23          	sw	s1,20(sp)
    1074:	00112e23          	sw	ra,28(sp)
    1078:	e8078493          	addi	s1,a5,-384 # 4e80 <cmd0>
    107c:	0ff00413          	li	s0,255
    1080:	00000097          	auipc	ra,0x0
    1084:	f74080e7          	jalr	-140(ra) # ff4 <sdcard_preinit>
    1088:	00048513          	mv	a0,s1
    108c:	00000097          	auipc	ra,0x0
    1090:	df4080e7          	jalr	-524(ra) # e80 <sdcard_cmd>
    1094:	00100593          	li	a1,1
    1098:	00800513          	li	a0,8
    109c:	00000097          	auipc	ra,0x0
    10a0:	d6c080e7          	jalr	-660(ra) # e08 <sdcard_get>
    10a4:	00a12623          	sw	a0,12(sp)
    10a8:	00000097          	auipc	ra,0x0
    10ac:	bac080e7          	jalr	-1108(ra) # c54 <sdcard_ponder>
    10b0:	00c12503          	lw	a0,12(sp)
    10b4:	00851c63          	bne	a0,s0,10cc <sdcard_init+0x78>
    10b8:	01313537          	lui	a0,0x1313
    10bc:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
    10c0:	00000097          	auipc	ra,0x0
    10c4:	b68080e7          	jalr	-1176(ra) # c28 <pause>
    10c8:	fb9ff06f          	j	1080 <sdcard_init+0x2c>
    10cc:	00005537          	lui	a0,0x5
    10d0:	e7850513          	addi	a0,a0,-392 # 4e78 <cmd8>
    10d4:	00000097          	auipc	ra,0x0
    10d8:	dac080e7          	jalr	-596(ra) # e80 <sdcard_cmd>
    10dc:	00100593          	li	a1,1
    10e0:	02800513          	li	a0,40
    10e4:	00000097          	auipc	ra,0x0
    10e8:	d24080e7          	jalr	-732(ra) # e08 <sdcard_get>
    10ec:	00000097          	auipc	ra,0x0
    10f0:	b68080e7          	jalr	-1176(ra) # c54 <sdcard_ponder>
    10f4:	000057b7          	lui	a5,0x5
    10f8:	e7078413          	addi	s0,a5,-400 # 4e70 <cmd55>
    10fc:	000057b7          	lui	a5,0x5
    1100:	e6878493          	addi	s1,a5,-408 # 4e68 <acmd41>
    1104:	00040513          	mv	a0,s0
    1108:	00000097          	auipc	ra,0x0
    110c:	d78080e7          	jalr	-648(ra) # e80 <sdcard_cmd>
    1110:	00100593          	li	a1,1
    1114:	00800513          	li	a0,8
    1118:	00000097          	auipc	ra,0x0
    111c:	cf0080e7          	jalr	-784(ra) # e08 <sdcard_get>
    1120:	00000097          	auipc	ra,0x0
    1124:	b34080e7          	jalr	-1228(ra) # c54 <sdcard_ponder>
    1128:	00048513          	mv	a0,s1
    112c:	00000097          	auipc	ra,0x0
    1130:	d54080e7          	jalr	-684(ra) # e80 <sdcard_cmd>
    1134:	00100593          	li	a1,1
    1138:	00800513          	li	a0,8
    113c:	00000097          	auipc	ra,0x0
    1140:	ccc080e7          	jalr	-820(ra) # e08 <sdcard_get>
    1144:	00a12623          	sw	a0,12(sp)
    1148:	00000097          	auipc	ra,0x0
    114c:	b0c080e7          	jalr	-1268(ra) # c54 <sdcard_ponder>
    1150:	00c12503          	lw	a0,12(sp)
    1154:	00050c63          	beqz	a0,116c <sdcard_init+0x118>
    1158:	001e8537          	lui	a0,0x1e8
    115c:	48050513          	addi	a0,a0,1152 # 1e8480 <__stacktop+0x1d8480>
    1160:	00000097          	auipc	ra,0x0
    1164:	ac8080e7          	jalr	-1336(ra) # c28 <pause>
    1168:	f9dff06f          	j	1104 <sdcard_init+0xb0>
    116c:	00005537          	lui	a0,0x5
    1170:	e6050513          	addi	a0,a0,-416 # 4e60 <cmd16>
    1174:	00000097          	auipc	ra,0x0
    1178:	d0c080e7          	jalr	-756(ra) # e80 <sdcard_cmd>
    117c:	00100593          	li	a1,1
    1180:	00800513          	li	a0,8
    1184:	00000097          	auipc	ra,0x0
    1188:	c84080e7          	jalr	-892(ra) # e08 <sdcard_get>
    118c:	01812403          	lw	s0,24(sp)
    1190:	01c12083          	lw	ra,28(sp)
    1194:	01412483          	lw	s1,20(sp)
    1198:	02010113          	addi	sp,sp,32
    119c:	00000317          	auipc	t1,0x0
    11a0:	ab830067          	jr	-1352(t1) # c54 <sdcard_ponder>

000011a4 <sdcard_readsector>:
    11a4:	04060663          	beqz	a2,11f0 <sdcard_readsector+0x4c>
    11a8:	ff010113          	addi	sp,sp,-16
    11ac:	00812423          	sw	s0,8(sp)
    11b0:	00912223          	sw	s1,4(sp)
    11b4:	00112623          	sw	ra,12(sp)
    11b8:	00050413          	mv	s0,a0
    11bc:	00a604b3          	add	s1,a2,a0
    11c0:	00040513          	mv	a0,s0
    11c4:	00000097          	auipc	ra,0x0
    11c8:	da4080e7          	jalr	-604(ra) # f68 <sdcard_read_sector>
    11cc:	00140413          	addi	s0,s0,1
    11d0:	00050593          	mv	a1,a0
    11d4:	fe9416e3          	bne	s0,s1,11c0 <sdcard_readsector+0x1c>
    11d8:	00c12083          	lw	ra,12(sp)
    11dc:	00812403          	lw	s0,8(sp)
    11e0:	00412483          	lw	s1,4(sp)
    11e4:	00100513          	li	a0,1
    11e8:	01010113          	addi	sp,sp,16
    11ec:	00008067          	ret
    11f0:	00000513          	li	a0,0
    11f4:	00008067          	ret

000011f8 <sdcard_writesector>:
    11f8:	00000513          	li	a0,0
    11fc:	00008067          	ret

00001200 <__divsi3>:
    1200:	06054063          	bltz	a0,1260 <__umodsi3+0x10>
    1204:	0605c663          	bltz	a1,1270 <__umodsi3+0x20>

00001208 <__udivsi3>:
    1208:	00058613          	mv	a2,a1
    120c:	00050593          	mv	a1,a0
    1210:	fff00513          	li	a0,-1
    1214:	02060c63          	beqz	a2,124c <__udivsi3+0x44>
    1218:	00100693          	li	a3,1
    121c:	00b67a63          	bgeu	a2,a1,1230 <__udivsi3+0x28>
    1220:	00c05863          	blez	a2,1230 <__udivsi3+0x28>
    1224:	00161613          	slli	a2,a2,0x1
    1228:	00169693          	slli	a3,a3,0x1
    122c:	feb66ae3          	bltu	a2,a1,1220 <__udivsi3+0x18>
    1230:	00000513          	li	a0,0
    1234:	00c5e663          	bltu	a1,a2,1240 <__udivsi3+0x38>
    1238:	40c585b3          	sub	a1,a1,a2
    123c:	00d56533          	or	a0,a0,a3
    1240:	0016d693          	srli	a3,a3,0x1
    1244:	00165613          	srli	a2,a2,0x1
    1248:	fe0696e3          	bnez	a3,1234 <__udivsi3+0x2c>
    124c:	00008067          	ret

00001250 <__umodsi3>:
    1250:	00008293          	mv	t0,ra
    1254:	fb5ff0ef          	jal	1208 <__udivsi3>
    1258:	00058513          	mv	a0,a1
    125c:	00028067          	jr	t0
    1260:	40a00533          	neg	a0,a0
    1264:	0005d863          	bgez	a1,1274 <__umodsi3+0x24>
    1268:	40b005b3          	neg	a1,a1
    126c:	f95ff06f          	j	1200 <__divsi3>
    1270:	40b005b3          	neg	a1,a1
    1274:	00008293          	mv	t0,ra
    1278:	f89ff0ef          	jal	1200 <__divsi3>
    127c:	40a00533          	neg	a0,a0
    1280:	00028067          	jr	t0

00001284 <__modsi3>:
    1284:	00008293          	mv	t0,ra
    1288:	0005ca63          	bltz	a1,129c <__modsi3+0x18>
    128c:	00054c63          	bltz	a0,12a4 <__modsi3+0x20>
    1290:	f79ff0ef          	jal	1208 <__udivsi3>
    1294:	00058513          	mv	a0,a1
    1298:	00028067          	jr	t0
    129c:	40b005b3          	neg	a1,a1
    12a0:	fe0558e3          	bgez	a0,1290 <__modsi3+0xc>
    12a4:	40a00533          	neg	a0,a0
    12a8:	f61ff0ef          	jal	1208 <__udivsi3>
    12ac:	40b00533          	neg	a0,a1
    12b0:	00028067          	jr	t0

000012b4 <memset>:
    12b4:	00c50633          	add	a2,a0,a2
    12b8:	00050793          	mv	a5,a0
    12bc:	00c79463          	bne	a5,a2,12c4 <memset+0x10>
    12c0:	00008067          	ret
    12c4:	00178793          	addi	a5,a5,1
    12c8:	feb78fa3          	sb	a1,-1(a5)
    12cc:	ff1ff06f          	j	12bc <memset+0x8>

000012d0 <memcpy>:
    12d0:	00000793          	li	a5,0
    12d4:	00c79463          	bne	a5,a2,12dc <memcpy+0xc>
    12d8:	00008067          	ret
    12dc:	00f58733          	add	a4,a1,a5
    12e0:	00074683          	lbu	a3,0(a4)
    12e4:	00f50733          	add	a4,a0,a5
    12e8:	00178793          	addi	a5,a5,1
    12ec:	00d70023          	sb	a3,0(a4)
    12f0:	fe5ff06f          	j	12d4 <memcpy+0x4>

000012f4 <strlen>:
    12f4:	00000793          	li	a5,0
    12f8:	00f50733          	add	a4,a0,a5
    12fc:	00074703          	lbu	a4,0(a4)
    1300:	00071663          	bnez	a4,130c <strlen+0x18>
    1304:	00078513          	mv	a0,a5
    1308:	00008067          	ret
    130c:	00178793          	addi	a5,a5,1
    1310:	fe9ff06f          	j	12f8 <strlen+0x4>

00001314 <strncmp>:
    1314:	00000793          	li	a5,0
    1318:	00c79663          	bne	a5,a2,1324 <strncmp+0x10>
    131c:	00000513          	li	a0,0
    1320:	00008067          	ret
    1324:	00f50733          	add	a4,a0,a5
    1328:	00074683          	lbu	a3,0(a4)
    132c:	00f58733          	add	a4,a1,a5
    1330:	00074703          	lbu	a4,0(a4)
    1334:	00e6e863          	bltu	a3,a4,1344 <strncmp+0x30>
    1338:	00d76a63          	bltu	a4,a3,134c <strncmp+0x38>
    133c:	00178793          	addi	a5,a5,1
    1340:	fd9ff06f          	j	1318 <strncmp+0x4>
    1344:	fff00513          	li	a0,-1
    1348:	00008067          	ret
    134c:	00100513          	li	a0,1
    1350:	00008067          	ret

00001354 <strncpy>:
    1354:	00000793          	li	a5,0
    1358:	00c79463          	bne	a5,a2,1360 <strncpy+0xc>
    135c:	00008067          	ret
    1360:	00f58733          	add	a4,a1,a5
    1364:	00074683          	lbu	a3,0(a4)
    1368:	00f50733          	add	a4,a0,a5
    136c:	00178793          	addi	a5,a5,1
    1370:	00d70023          	sb	a3,0(a4)
    1374:	fe5ff06f          	j	1358 <strncpy+0x4>

00001378 <strcpy>:
    1378:	0005c783          	lbu	a5,0(a1)
    137c:	00079663          	bnez	a5,1388 <strcpy+0x10>
    1380:	00050023          	sb	zero,0(a0)
    1384:	00008067          	ret
    1388:	00150513          	addi	a0,a0,1
    138c:	00158593          	addi	a1,a1,1
    1390:	fef50fa3          	sb	a5,-1(a0)
    1394:	fe5ff06f          	j	1378 <strcpy>

00001398 <oled_wait>:
    1398:	00000013          	nop
    139c:	00000013          	nop
    13a0:	00000013          	nop
    13a4:	00000013          	nop
    13a8:	00000013          	nop
    13ac:	00000013          	nop
    13b0:	00000013          	nop
    13b4:	00008067          	ret

000013b8 <oled_init_mode>:
    13b8:	000057b7          	lui	a5,0x5
    13bc:	e947a703          	lw	a4,-364(a5) # 4e94 <OLED_RST>
    13c0:	fe010113          	addi	sp,sp,-32
    13c4:	00112e23          	sw	ra,28(sp)
    13c8:	00812c23          	sw	s0,24(sp)
    13cc:	00072023          	sw	zero,0(a4)
    13d0:	00040737          	lui	a4,0x40
    13d4:	00000013          	nop
    13d8:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
    13dc:	fe071ce3          	bnez	a4,13d4 <oled_init_mode+0x1c>
    13e0:	e947a703          	lw	a4,-364(a5)
    13e4:	00100693          	li	a3,1
    13e8:	00d72023          	sw	a3,0(a4)
    13ec:	00040737          	lui	a4,0x40
    13f0:	00000013          	nop
    13f4:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
    13f8:	fe071ce3          	bnez	a4,13f0 <oled_init_mode+0x38>
    13fc:	e947a783          	lw	a5,-364(a5)
    1400:	0007a023          	sw	zero,0(a5)
    1404:	000407b7          	lui	a5,0x40
    1408:	00000013          	nop
    140c:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
    1410:	fe079ce3          	bnez	a5,1408 <oled_init_mode+0x50>
    1414:	00005737          	lui	a4,0x5
    1418:	e9872783          	lw	a5,-360(a4) # 4e98 <OLED>
    141c:	2af00693          	li	a3,687
    1420:	00d7a023          	sw	a3,0(a5)
    1424:	000407b7          	lui	a5,0x40
    1428:	00000013          	nop
    142c:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
    1430:	fe079ce3          	bnez	a5,1428 <oled_init_mode+0x70>
    1434:	e9872403          	lw	s0,-360(a4)
    1438:	2a000793          	li	a5,672
    143c:	00a12623          	sw	a0,12(sp)
    1440:	00f42023          	sw	a5,0(s0)
    1444:	00000097          	auipc	ra,0x0
    1448:	f54080e7          	jalr	-172(ra) # 1398 <oled_wait>
    144c:	00c12503          	lw	a0,12(sp)
    1450:	4a000793          	li	a5,1184
    1454:	00050463          	beqz	a0,145c <oled_init_mode+0xa4>
    1458:	42000793          	li	a5,1056
    145c:	00f42023          	sw	a5,0(s0)
    1460:	00000097          	auipc	ra,0x0
    1464:	f38080e7          	jalr	-200(ra) # 1398 <oled_wait>
    1468:	2fd00793          	li	a5,765
    146c:	00f42023          	sw	a5,0(s0)
    1470:	00000097          	auipc	ra,0x0
    1474:	f28080e7          	jalr	-216(ra) # 1398 <oled_wait>
    1478:	4b100793          	li	a5,1201
    147c:	00f42023          	sw	a5,0(s0)
    1480:	00000097          	auipc	ra,0x0
    1484:	f18080e7          	jalr	-232(ra) # 1398 <oled_wait>
    1488:	2a200793          	li	a5,674
    148c:	00f42023          	sw	a5,0(s0)
    1490:	00000097          	auipc	ra,0x0
    1494:	f08080e7          	jalr	-248(ra) # 1398 <oled_wait>
    1498:	40000793          	li	a5,1024
    149c:	00f42023          	sw	a5,0(s0)
    14a0:	01812403          	lw	s0,24(sp)
    14a4:	01c12083          	lw	ra,28(sp)
    14a8:	02010113          	addi	sp,sp,32
    14ac:	00000317          	auipc	t1,0x0
    14b0:	eec30067          	jr	-276(t1) # 1398 <oled_wait>

000014b4 <oled_init>:
    14b4:	00000513          	li	a0,0
    14b8:	00000317          	auipc	t1,0x0
    14bc:	f0030067          	jr	-256(t1) # 13b8 <oled_init_mode>

000014c0 <oled_fullscreen>:
    14c0:	ff010113          	addi	sp,sp,-16
    14c4:	000057b7          	lui	a5,0x5
    14c8:	00812423          	sw	s0,8(sp)
    14cc:	e987a403          	lw	s0,-360(a5) # 4e98 <OLED>
    14d0:	00112623          	sw	ra,12(sp)
    14d4:	00912223          	sw	s1,4(sp)
    14d8:	01212023          	sw	s2,0(sp)
    14dc:	21500793          	li	a5,533
    14e0:	00f42023          	sw	a5,0(s0)
    14e4:	40000913          	li	s2,1024
    14e8:	00000097          	auipc	ra,0x0
    14ec:	eb0080e7          	jalr	-336(ra) # 1398 <oled_wait>
    14f0:	47f00493          	li	s1,1151
    14f4:	01242023          	sw	s2,0(s0)
    14f8:	00000097          	auipc	ra,0x0
    14fc:	ea0080e7          	jalr	-352(ra) # 1398 <oled_wait>
    1500:	00942023          	sw	s1,0(s0)
    1504:	00000097          	auipc	ra,0x0
    1508:	e94080e7          	jalr	-364(ra) # 1398 <oled_wait>
    150c:	27500793          	li	a5,629
    1510:	00f42023          	sw	a5,0(s0)
    1514:	00000097          	auipc	ra,0x0
    1518:	e84080e7          	jalr	-380(ra) # 1398 <oled_wait>
    151c:	01242023          	sw	s2,0(s0)
    1520:	00000097          	auipc	ra,0x0
    1524:	e78080e7          	jalr	-392(ra) # 1398 <oled_wait>
    1528:	00942023          	sw	s1,0(s0)
    152c:	00000097          	auipc	ra,0x0
    1530:	e6c080e7          	jalr	-404(ra) # 1398 <oled_wait>
    1534:	25c00793          	li	a5,604
    1538:	00f42023          	sw	a5,0(s0)
    153c:	00812403          	lw	s0,8(sp)
    1540:	00c12083          	lw	ra,12(sp)
    1544:	00412483          	lw	s1,4(sp)
    1548:	00012903          	lw	s2,0(sp)
    154c:	01010113          	addi	sp,sp,16
    1550:	00000317          	auipc	t1,0x0
    1554:	e4830067          	jr	-440(t1) # 1398 <oled_wait>

00001558 <oled_wait>:
    1558:	00000013          	nop
    155c:	00000013          	nop
    1560:	00000013          	nop
    1564:	00000013          	nop
    1568:	00000013          	nop
    156c:	00000013          	nop
    1570:	00000013          	nop
    1574:	00008067          	ret

00001578 <display_framebuffer>:
    1578:	00007537          	lui	a0,0x7
    157c:	fd450513          	addi	a0,a0,-44 # 6fd4 <framebuffer>
    1580:	00008067          	ret

00001584 <display_set_cursor>:
    1584:	000057b7          	lui	a5,0x5
    1588:	38a7ac23          	sw	a0,920(a5) # 5398 <cursor_x>
    158c:	000057b7          	lui	a5,0x5
    1590:	38b7aa23          	sw	a1,916(a5) # 5394 <cursor_y>
    1594:	00008067          	ret

00001598 <display_set_front_back_color>:
    1598:	000057b7          	lui	a5,0x5
    159c:	38a788a3          	sb	a0,913(a5) # 5391 <front_color>
    15a0:	000057b7          	lui	a5,0x5
    15a4:	38b78823          	sb	a1,912(a5) # 5390 <back_color>
    15a8:	00008067          	ret

000015ac <display_putchar>:
    15ac:	00a00793          	li	a5,10
    15b0:	00005737          	lui	a4,0x5
    15b4:	02f51663          	bne	a0,a5,15e0 <display_putchar+0x34>
    15b8:	38072c23          	sw	zero,920(a4) # 5398 <cursor_x>
    15bc:	00005737          	lui	a4,0x5
    15c0:	39472783          	lw	a5,916(a4) # 5394 <cursor_y>
    15c4:	00878793          	addi	a5,a5,8
    15c8:	38f72a23          	sw	a5,916(a4)
    15cc:	07f00713          	li	a4,127
    15d0:	10f75263          	bge	a4,a5,16d4 <display_putchar+0x128>
    15d4:	000057b7          	lui	a5,0x5
    15d8:	3807aa23          	sw	zero,916(a5) # 5394 <cursor_y>
    15dc:	00008067          	ret
    15e0:	01f00793          	li	a5,31
    15e4:	0ca7d063          	bge	a5,a0,16a4 <display_putchar+0xf8>
    15e8:	000057b7          	lui	a5,0x5
    15ec:	3947a783          	lw	a5,916(a5) # 5394 <cursor_y>
    15f0:	07800693          	li	a3,120
    15f4:	00800593          	li	a1,8
    15f8:	00f6d663          	bge	a3,a5,1604 <display_putchar+0x58>
    15fc:	08000593          	li	a1,128
    1600:	40f585b3          	sub	a1,a1,a5
    1604:	39872683          	lw	a3,920(a4)
    1608:	07b00613          	li	a2,123
    160c:	00500813          	li	a6,5
    1610:	00d65663          	bge	a2,a3,161c <display_putchar+0x70>
    1614:	08000813          	li	a6,128
    1618:	40d80833          	sub	a6,a6,a3
    161c:	00005637          	lui	a2,0x5
    1620:	39064283          	lbu	t0,912(a2) # 5390 <back_color>
    1624:	00005637          	lui	a2,0x5
    1628:	39164383          	lbu	t2,913(a2) # 5391 <front_color>
    162c:	00007637          	lui	a2,0x7
    1630:	fd460613          	addi	a2,a2,-44 # 6fd4 <framebuffer>
    1634:	00c787b3          	add	a5,a5,a2
    1638:	00769693          	slli	a3,a3,0x7
    163c:	00d787b3          	add	a5,a5,a3
    1640:	00005637          	lui	a2,0x5
    1644:	00251693          	slli	a3,a0,0x2
    1648:	f8060613          	addi	a2,a2,-128 # 4f80 <font>
    164c:	00a686b3          	add	a3,a3,a0
    1650:	00c686b3          	add	a3,a3,a2
    1654:	00100f93          	li	t6,1
    1658:	00000613          	li	a2,0
    165c:	04b65463          	bge	a2,a1,16a4 <display_putchar+0xf8>
    1660:	00cf9f33          	sll	t5,t6,a2
    1664:	00f60333          	add	t1,a2,a5
    1668:	00068893          	mv	a7,a3
    166c:	00000513          	li	a0,0
    1670:	0280006f          	j	1698 <display_putchar+0xec>
    1674:	f608ce03          	lbu	t3,-160(a7)
    1678:	00038e93          	mv	t4,t2
    167c:	01ee7e33          	and	t3,t3,t5
    1680:	000e1463          	bnez	t3,1688 <display_putchar+0xdc>
    1684:	00028e93          	mv	t4,t0
    1688:	01d30023          	sb	t4,0(t1)
    168c:	00150513          	addi	a0,a0,1
    1690:	08030313          	addi	t1,t1,128
    1694:	00188893          	addi	a7,a7,1
    1698:	fd054ee3          	blt	a0,a6,1674 <display_putchar+0xc8>
    169c:	00160613          	addi	a2,a2,1
    16a0:	fbdff06f          	j	165c <display_putchar+0xb0>
    16a4:	39872783          	lw	a5,920(a4)
    16a8:	07f00693          	li	a3,127
    16ac:	00578793          	addi	a5,a5,5
    16b0:	00f6c663          	blt	a3,a5,16bc <display_putchar+0x110>
    16b4:	38f72c23          	sw	a5,920(a4)
    16b8:	00008067          	ret
    16bc:	38072c23          	sw	zero,920(a4)
    16c0:	00005737          	lui	a4,0x5
    16c4:	39472783          	lw	a5,916(a4) # 5394 <cursor_y>
    16c8:	00878793          	addi	a5,a5,8
    16cc:	38f72a23          	sw	a5,916(a4)
    16d0:	f0f6c2e3          	blt	a3,a5,15d4 <display_putchar+0x28>
    16d4:	00008067          	ret

000016d8 <display_refresh>:
    16d8:	fe010113          	addi	sp,sp,-32
    16dc:	000057b7          	lui	a5,0x5
    16e0:	01212823          	sw	s2,16(sp)
    16e4:	e987a903          	lw	s2,-360(a5) # 4e98 <OLED>
    16e8:	01312623          	sw	s3,12(sp)
    16ec:	000079b7          	lui	s3,0x7
    16f0:	00912a23          	sw	s1,20(sp)
    16f4:	01412423          	sw	s4,8(sp)
    16f8:	00112e23          	sw	ra,28(sp)
    16fc:	00812c23          	sw	s0,24(sp)
    1700:	00000493          	li	s1,0
    1704:	fd498993          	addi	s3,s3,-44 # 6fd4 <framebuffer>
    1708:	00004a37          	lui	s4,0x4
    170c:	013487b3          	add	a5,s1,s3
    1710:	0007c403          	lbu	s0,0(a5)
    1714:	00148493          	addi	s1,s1,1
    1718:	00245413          	srli	s0,s0,0x2
    171c:	40046413          	ori	s0,s0,1024
    1720:	00892023          	sw	s0,0(s2)
    1724:	00000097          	auipc	ra,0x0
    1728:	e34080e7          	jalr	-460(ra) # 1558 <oled_wait>
    172c:	00892023          	sw	s0,0(s2)
    1730:	00000097          	auipc	ra,0x0
    1734:	e28080e7          	jalr	-472(ra) # 1558 <oled_wait>
    1738:	00892023          	sw	s0,0(s2)
    173c:	00000097          	auipc	ra,0x0
    1740:	e1c080e7          	jalr	-484(ra) # 1558 <oled_wait>
    1744:	fd4494e3          	bne	s1,s4,170c <display_refresh+0x34>
    1748:	01c12083          	lw	ra,28(sp)
    174c:	01812403          	lw	s0,24(sp)
    1750:	01412483          	lw	s1,20(sp)
    1754:	01012903          	lw	s2,16(sp)
    1758:	00c12983          	lw	s3,12(sp)
    175c:	00812a03          	lw	s4,8(sp)
    1760:	02010113          	addi	sp,sp,32
    1764:	00008067          	ret

00001768 <print_string>:
    1768:	ff010113          	addi	sp,sp,-16
    176c:	00812423          	sw	s0,8(sp)
    1770:	00912223          	sw	s1,4(sp)
    1774:	00112623          	sw	ra,12(sp)
    1778:	00050413          	mv	s0,a0
    177c:	000054b7          	lui	s1,0x5
    1780:	00044503          	lbu	a0,0(s0)
    1784:	00051c63          	bnez	a0,179c <print_string+0x34>
    1788:	00c12083          	lw	ra,12(sp)
    178c:	00812403          	lw	s0,8(sp)
    1790:	00412483          	lw	s1,4(sp)
    1794:	01010113          	addi	sp,sp,16
    1798:	00008067          	ret
    179c:	39c4a783          	lw	a5,924(s1) # 539c <f_putchar>
    17a0:	00140413          	addi	s0,s0,1
    17a4:	000780e7          	jalr	a5
    17a8:	fd9ff06f          	j	1780 <print_string+0x18>

000017ac <print_dec>:
    17ac:	ef010113          	addi	sp,sp,-272
    17b0:	10812423          	sw	s0,264(sp)
    17b4:	10912223          	sw	s1,260(sp)
    17b8:	10112623          	sw	ra,268(sp)
    17bc:	11212023          	sw	s2,256(sp)
    17c0:	00050413          	mv	s0,a0
    17c4:	000054b7          	lui	s1,0x5
    17c8:	08045063          	bgez	s0,1848 <print_dec+0x9c>
    17cc:	39c4a783          	lw	a5,924(s1) # 539c <f_putchar>
    17d0:	02d00513          	li	a0,45
    17d4:	40800433          	neg	s0,s0
    17d8:	000780e7          	jalr	a5
    17dc:	fedff06f          	j	17c8 <print_dec+0x1c>
    17e0:	00040513          	mv	a0,s0
    17e4:	00a00593          	li	a1,10
    17e8:	00000097          	auipc	ra,0x0
    17ec:	a18080e7          	jalr	-1512(ra) # 1200 <__divsi3>
    17f0:	00251793          	slli	a5,a0,0x2
    17f4:	00f507b3          	add	a5,a0,a5
    17f8:	00179793          	slli	a5,a5,0x1
    17fc:	40f40433          	sub	s0,s0,a5
    1800:	00148493          	addi	s1,s1,1
    1804:	fe848fa3          	sb	s0,-1(s1)
    1808:	00050413          	mv	s0,a0
    180c:	fc041ae3          	bnez	s0,17e0 <print_dec+0x34>
    1810:	fd2488e3          	beq	s1,s2,17e0 <print_dec+0x34>
    1814:	00005437          	lui	s0,0x5
    1818:	fff4c503          	lbu	a0,-1(s1)
    181c:	39c42783          	lw	a5,924(s0) # 539c <f_putchar>
    1820:	fff48493          	addi	s1,s1,-1
    1824:	03050513          	addi	a0,a0,48
    1828:	000780e7          	jalr	a5
    182c:	ff2496e3          	bne	s1,s2,1818 <print_dec+0x6c>
    1830:	10c12083          	lw	ra,268(sp)
    1834:	10812403          	lw	s0,264(sp)
    1838:	10412483          	lw	s1,260(sp)
    183c:	10012903          	lw	s2,256(sp)
    1840:	11010113          	addi	sp,sp,272
    1844:	00008067          	ret
    1848:	00010493          	mv	s1,sp
    184c:	00010913          	mv	s2,sp
    1850:	fbdff06f          	j	180c <print_dec+0x60>

00001854 <print_hex_digits>:
    1854:	fe010113          	addi	sp,sp,-32
    1858:	00812c23          	sw	s0,24(sp)
    185c:	00912a23          	sw	s1,20(sp)
    1860:	fff58413          	addi	s0,a1,-1
    1864:	000054b7          	lui	s1,0x5
    1868:	01212823          	sw	s2,16(sp)
    186c:	01312623          	sw	s3,12(sp)
    1870:	00112e23          	sw	ra,28(sp)
    1874:	00050993          	mv	s3,a0
    1878:	00241413          	slli	s0,s0,0x2
    187c:	f3848493          	addi	s1,s1,-200 # 4f38 <LEDS+0x9c>
    1880:	00005937          	lui	s2,0x5
    1884:	02045063          	bgez	s0,18a4 <print_hex_digits+0x50>
    1888:	01c12083          	lw	ra,28(sp)
    188c:	01812403          	lw	s0,24(sp)
    1890:	01412483          	lw	s1,20(sp)
    1894:	01012903          	lw	s2,16(sp)
    1898:	00c12983          	lw	s3,12(sp)
    189c:	02010113          	addi	sp,sp,32
    18a0:	00008067          	ret
    18a4:	0089d7b3          	srl	a5,s3,s0
    18a8:	00f7f793          	andi	a5,a5,15
    18ac:	00f487b3          	add	a5,s1,a5
    18b0:	39c92703          	lw	a4,924(s2) # 539c <f_putchar>
    18b4:	0007c503          	lbu	a0,0(a5)
    18b8:	ffc40413          	addi	s0,s0,-4
    18bc:	000700e7          	jalr	a4
    18c0:	fc5ff06f          	j	1884 <print_hex_digits+0x30>

000018c4 <print_hex>:
    18c4:	00800593          	li	a1,8
    18c8:	00000317          	auipc	t1,0x0
    18cc:	f8c30067          	jr	-116(t1) # 1854 <print_hex_digits>

000018d0 <printf>:
    18d0:	fa010113          	addi	sp,sp,-96
    18d4:	04f12a23          	sw	a5,84(sp)
    18d8:	04410793          	addi	a5,sp,68
    18dc:	02812c23          	sw	s0,56(sp)
    18e0:	02912a23          	sw	s1,52(sp)
    18e4:	03212823          	sw	s2,48(sp)
    18e8:	03312623          	sw	s3,44(sp)
    18ec:	03412423          	sw	s4,40(sp)
    18f0:	03512223          	sw	s5,36(sp)
    18f4:	03612023          	sw	s6,32(sp)
    18f8:	02112e23          	sw	ra,60(sp)
    18fc:	01712e23          	sw	s7,28(sp)
    1900:	00050413          	mv	s0,a0
    1904:	04b12223          	sw	a1,68(sp)
    1908:	04c12423          	sw	a2,72(sp)
    190c:	04d12623          	sw	a3,76(sp)
    1910:	04e12823          	sw	a4,80(sp)
    1914:	05012c23          	sw	a6,88(sp)
    1918:	05112e23          	sw	a7,92(sp)
    191c:	00f12623          	sw	a5,12(sp)
    1920:	02500913          	li	s2,37
    1924:	000054b7          	lui	s1,0x5
    1928:	07300993          	li	s3,115
    192c:	07800a13          	li	s4,120
    1930:	06400a93          	li	s5,100
    1934:	06300b13          	li	s6,99
    1938:	00044503          	lbu	a0,0(s0)
    193c:	02051863          	bnez	a0,196c <printf+0x9c>
    1940:	03c12083          	lw	ra,60(sp)
    1944:	03812403          	lw	s0,56(sp)
    1948:	03412483          	lw	s1,52(sp)
    194c:	03012903          	lw	s2,48(sp)
    1950:	02c12983          	lw	s3,44(sp)
    1954:	02812a03          	lw	s4,40(sp)
    1958:	02412a83          	lw	s5,36(sp)
    195c:	02012b03          	lw	s6,32(sp)
    1960:	01c12b83          	lw	s7,28(sp)
    1964:	06010113          	addi	sp,sp,96
    1968:	00008067          	ret
    196c:	09251a63          	bne	a0,s2,1a00 <printf+0x130>
    1970:	00144503          	lbu	a0,1(s0)
    1974:	00140b93          	addi	s7,s0,1
    1978:	03351463          	bne	a0,s3,19a0 <printf+0xd0>
    197c:	00c12783          	lw	a5,12(sp)
    1980:	0007a503          	lw	a0,0(a5)
    1984:	00478713          	addi	a4,a5,4
    1988:	00e12623          	sw	a4,12(sp)
    198c:	00000097          	auipc	ra,0x0
    1990:	ddc080e7          	jalr	-548(ra) # 1768 <print_string>
    1994:	000b8413          	mv	s0,s7
    1998:	00140413          	addi	s0,s0,1
    199c:	f9dff06f          	j	1938 <printf+0x68>
    19a0:	03451063          	bne	a0,s4,19c0 <printf+0xf0>
    19a4:	00c12783          	lw	a5,12(sp)
    19a8:	0007a503          	lw	a0,0(a5)
    19ac:	00478713          	addi	a4,a5,4
    19b0:	00e12623          	sw	a4,12(sp)
    19b4:	00000097          	auipc	ra,0x0
    19b8:	f10080e7          	jalr	-240(ra) # 18c4 <print_hex>
    19bc:	fd9ff06f          	j	1994 <printf+0xc4>
    19c0:	03551063          	bne	a0,s5,19e0 <printf+0x110>
    19c4:	00c12783          	lw	a5,12(sp)
    19c8:	0007a503          	lw	a0,0(a5)
    19cc:	00478713          	addi	a4,a5,4
    19d0:	00e12623          	sw	a4,12(sp)
    19d4:	00000097          	auipc	ra,0x0
    19d8:	dd8080e7          	jalr	-552(ra) # 17ac <print_dec>
    19dc:	fb9ff06f          	j	1994 <printf+0xc4>
    19e0:	39c4a783          	lw	a5,924(s1) # 539c <f_putchar>
    19e4:	01651a63          	bne	a0,s6,19f8 <printf+0x128>
    19e8:	00c12703          	lw	a4,12(sp)
    19ec:	00072503          	lw	a0,0(a4)
    19f0:	00470693          	addi	a3,a4,4
    19f4:	00d12623          	sw	a3,12(sp)
    19f8:	000780e7          	jalr	a5
    19fc:	f99ff06f          	j	1994 <printf+0xc4>
    1a00:	39c4a783          	lw	a5,924(s1)
    1a04:	000780e7          	jalr	a5
    1a08:	f91ff06f          	j	1998 <printf+0xc8>

00001a0c <__mulsi3>:
    1a0c:	00050793          	mv	a5,a0
    1a10:	00000513          	li	a0,0
    1a14:	00079463          	bnez	a5,1a1c <__mulsi3+0x10>
    1a18:	00008067          	ret
    1a1c:	01f79693          	slli	a3,a5,0x1f
    1a20:	41f6d713          	srai	a4,a3,0x1f
    1a24:	00b77733          	and	a4,a4,a1
    1a28:	00e50533          	add	a0,a0,a4
    1a2c:	0017d793          	srli	a5,a5,0x1
    1a30:	00159593          	slli	a1,a1,0x1
    1a34:	fe1ff06f          	j	1a14 <__mulsi3+0x8>

00001a38 <fat_list_insert_last>:
    1a38:	00452783          	lw	a5,4(a0)
    1a3c:	04079263          	bnez	a5,1a80 <fat_list_insert_last+0x48>
    1a40:	00052783          	lw	a5,0(a0)
    1a44:	00079c63          	bnez	a5,1a5c <fat_list_insert_last+0x24>
    1a48:	00b52023          	sw	a1,0(a0)
    1a4c:	00b52223          	sw	a1,4(a0)
    1a50:	0005a023          	sw	zero,0(a1)
    1a54:	0005a223          	sw	zero,4(a1)
    1a58:	00008067          	ret
    1a5c:	0007a703          	lw	a4,0(a5)
    1a60:	00f5a223          	sw	a5,4(a1)
    1a64:	00e5a023          	sw	a4,0(a1)
    1a68:	00071863          	bnez	a4,1a78 <fat_list_insert_last+0x40>
    1a6c:	00b52023          	sw	a1,0(a0)
    1a70:	00b7a023          	sw	a1,0(a5)
    1a74:	00008067          	ret
    1a78:	00b72223          	sw	a1,4(a4)
    1a7c:	ff5ff06f          	j	1a70 <fat_list_insert_last+0x38>
    1a80:	0047a703          	lw	a4,4(a5)
    1a84:	00f5a023          	sw	a5,0(a1)
    1a88:	00e5a223          	sw	a4,4(a1)
    1a8c:	00071863          	bnez	a4,1a9c <fat_list_insert_last+0x64>
    1a90:	00b52223          	sw	a1,4(a0)
    1a94:	00b7a223          	sw	a1,4(a5)
    1a98:	00008067          	ret
    1a9c:	00b72023          	sw	a1,0(a4)
    1aa0:	ff5ff06f          	j	1a94 <fat_list_insert_last+0x5c>

00001aa4 <FileString_StrCmpNoCase>:
    1aa4:	00050e93          	mv	t4,a0
    1aa8:	00000793          	li	a5,0
    1aac:	01900e13          	li	t3,25
    1ab0:	00c79663          	bne	a5,a2,1abc <FileString_StrCmpNoCase+0x18>
    1ab4:	00000513          	li	a0,0
    1ab8:	00008067          	ret
    1abc:	00fe8733          	add	a4,t4,a5
    1ac0:	00074803          	lbu	a6,0(a4)
    1ac4:	00f58733          	add	a4,a1,a5
    1ac8:	00074883          	lbu	a7,0(a4)
    1acc:	fbf80713          	addi	a4,a6,-65
    1ad0:	0ff77713          	zext.b	a4,a4
    1ad4:	00080693          	mv	a3,a6
    1ad8:	00ee6663          	bltu	t3,a4,1ae4 <FileString_StrCmpNoCase+0x40>
    1adc:	02080693          	addi	a3,a6,32
    1ae0:	0ff6f693          	zext.b	a3,a3
    1ae4:	fbf88313          	addi	t1,a7,-65
    1ae8:	0ff37313          	zext.b	t1,t1
    1aec:	00088713          	mv	a4,a7
    1af0:	006e6663          	bltu	t3,t1,1afc <FileString_StrCmpNoCase+0x58>
    1af4:	02088713          	addi	a4,a7,32
    1af8:	0ff77713          	zext.b	a4,a4
    1afc:	40e68533          	sub	a0,a3,a4
    1b00:	00e69863          	bne	a3,a4,1b10 <FileString_StrCmpNoCase+0x6c>
    1b04:	00178793          	addi	a5,a5,1
    1b08:	00088463          	beqz	a7,1b10 <FileString_StrCmpNoCase+0x6c>
    1b0c:	fa0812e3          	bnez	a6,1ab0 <FileString_StrCmpNoCase+0xc>
    1b10:	00008067          	ret

00001b14 <FileString_GetExtension>:
    1b14:	00050793          	mv	a5,a0
    1b18:	fff00713          	li	a4,-1
    1b1c:	02e00613          	li	a2,46
    1b20:	0007c683          	lbu	a3,0(a5)
    1b24:	00069663          	bnez	a3,1b30 <FileString_GetExtension+0x1c>
    1b28:	00070513          	mv	a0,a4
    1b2c:	00008067          	ret
    1b30:	00c69463          	bne	a3,a2,1b38 <FileString_GetExtension+0x24>
    1b34:	40a78733          	sub	a4,a5,a0
    1b38:	00178793          	addi	a5,a5,1
    1b3c:	fe5ff06f          	j	1b20 <FileString_GetExtension+0xc>

00001b40 <fatfs_fat_writeback>:
    1b40:	00059e63          	bnez	a1,1b5c <fatfs_fat_writeback+0x1c>
    1b44:	00000513          	li	a0,0
    1b48:	00008067          	ret
    1b4c:	00000513          	li	a0,0
    1b50:	01c12083          	lw	ra,28(sp)
    1b54:	02010113          	addi	sp,sp,32
    1b58:	00008067          	ret
    1b5c:	2045a783          	lw	a5,516(a1)
    1b60:	04078e63          	beqz	a5,1bbc <fatfs_fat_writeback+0x7c>
    1b64:	03852683          	lw	a3,56(a0)
    1b68:	00050793          	mv	a5,a0
    1b6c:	04068663          	beqz	a3,1bb8 <fatfs_fat_writeback+0x78>
    1b70:	0147a703          	lw	a4,20(a5)
    1b74:	2005a503          	lw	a0,512(a1)
    1b78:	0207a803          	lw	a6,32(a5)
    1b7c:	00100613          	li	a2,1
    1b80:	fe010113          	addi	sp,sp,-32
    1b84:	40e607b3          	sub	a5,a2,a4
    1b88:	00112e23          	sw	ra,28(sp)
    1b8c:	00a787b3          	add	a5,a5,a0
    1b90:	00f87663          	bgeu	a6,a5,1b9c <fatfs_fat_writeback+0x5c>
    1b94:	01070733          	add	a4,a4,a6
    1b98:	40a70633          	sub	a2,a4,a0
    1b9c:	00b12623          	sw	a1,12(sp)
    1ba0:	000680e7          	jalr	a3
    1ba4:	fa0504e3          	beqz	a0,1b4c <fatfs_fat_writeback+0xc>
    1ba8:	00c12583          	lw	a1,12(sp)
    1bac:	00100513          	li	a0,1
    1bb0:	2005a223          	sw	zero,516(a1)
    1bb4:	f9dff06f          	j	1b50 <fatfs_fat_writeback+0x10>
    1bb8:	2005a223          	sw	zero,516(a1)
    1bbc:	00100513          	li	a0,1
    1bc0:	00008067          	ret

00001bc4 <fatfs_fat_read_sector>:
    1bc4:	fe010113          	addi	sp,sp,-32
    1bc8:	01212823          	sw	s2,16(sp)
    1bcc:	25452903          	lw	s2,596(a0)
    1bd0:	00812c23          	sw	s0,24(sp)
    1bd4:	00112e23          	sw	ra,28(sp)
    1bd8:	00912a23          	sw	s1,20(sp)
    1bdc:	01312623          	sw	s3,12(sp)
    1be0:	00000413          	li	s0,0
    1be4:	04091463          	bnez	s2,1c2c <fatfs_fat_read_sector+0x68>
    1be8:	25452783          	lw	a5,596(a0)
    1bec:	00058493          	mv	s1,a1
    1bf0:	00050993          	mv	s3,a0
    1bf4:	20f42623          	sw	a5,524(s0)
    1bf8:	20442783          	lw	a5,516(s0)
    1bfc:	24852a23          	sw	s0,596(a0)
    1c00:	08079863          	bnez	a5,1c90 <fatfs_fat_read_sector+0xcc>
    1c04:	0349a783          	lw	a5,52(s3)
    1c08:	20942023          	sw	s1,512(s0)
    1c0c:	00100613          	li	a2,1
    1c10:	00040593          	mv	a1,s0
    1c14:	00048513          	mv	a0,s1
    1c18:	000780e7          	jalr	a5
    1c1c:	08051463          	bnez	a0,1ca4 <fatfs_fat_read_sector+0xe0>
    1c20:	fff00793          	li	a5,-1
    1c24:	20f42023          	sw	a5,512(s0)
    1c28:	0480006f          	j	1c70 <fatfs_fat_read_sector+0xac>
    1c2c:	20092783          	lw	a5,512(s2)
    1c30:	00f5e663          	bltu	a1,a5,1c3c <fatfs_fat_read_sector+0x78>
    1c34:	00178713          	addi	a4,a5,1
    1c38:	02e5e463          	bltu	a1,a4,1c60 <fatfs_fat_read_sector+0x9c>
    1c3c:	20c92783          	lw	a5,524(s2)
    1c40:	00079663          	bnez	a5,1c4c <fatfs_fat_read_sector+0x88>
    1c44:	00040a63          	beqz	s0,1c58 <fatfs_fat_read_sector+0x94>
    1c48:	20042623          	sw	zero,524(s0)
    1c4c:	00090413          	mv	s0,s2
    1c50:	20c92903          	lw	s2,524(s2)
    1c54:	f91ff06f          	j	1be4 <fatfs_fat_read_sector+0x20>
    1c58:	24052a23          	sw	zero,596(a0)
    1c5c:	ff1ff06f          	j	1c4c <fatfs_fat_read_sector+0x88>
    1c60:	40f585b3          	sub	a1,a1,a5
    1c64:	00959593          	slli	a1,a1,0x9
    1c68:	00b905b3          	add	a1,s2,a1
    1c6c:	20b92423          	sw	a1,520(s2)
    1c70:	01c12083          	lw	ra,28(sp)
    1c74:	01812403          	lw	s0,24(sp)
    1c78:	01412483          	lw	s1,20(sp)
    1c7c:	00c12983          	lw	s3,12(sp)
    1c80:	00090513          	mv	a0,s2
    1c84:	01012903          	lw	s2,16(sp)
    1c88:	02010113          	addi	sp,sp,32
    1c8c:	00008067          	ret
    1c90:	00040593          	mv	a1,s0
    1c94:	00000097          	auipc	ra,0x0
    1c98:	eac080e7          	jalr	-340(ra) # 1b40 <fatfs_fat_writeback>
    1c9c:	f60514e3          	bnez	a0,1c04 <fatfs_fat_read_sector+0x40>
    1ca0:	fd1ff06f          	j	1c70 <fatfs_fat_read_sector+0xac>
    1ca4:	20842423          	sw	s0,520(s0)
    1ca8:	00040913          	mv	s2,s0
    1cac:	fc5ff06f          	j	1c70 <fatfs_fat_read_sector+0xac>

00001cb0 <_allocate_file>:
    1cb0:	000057b7          	lui	a5,0x5
    1cb4:	3a078793          	addi	a5,a5,928 # 53a0 <_free_file_list>
    1cb8:	0007a583          	lw	a1,0(a5)
    1cbc:	06058263          	beqz	a1,1d20 <_allocate_file+0x70>
    1cc0:	0005a703          	lw	a4,0(a1)
    1cc4:	fe010113          	addi	sp,sp,-32
    1cc8:	00112e23          	sw	ra,28(sp)
    1ccc:	0045a683          	lw	a3,4(a1)
    1cd0:	04071063          	bnez	a4,1d10 <_allocate_file+0x60>
    1cd4:	00d7a023          	sw	a3,0(a5)
    1cd8:	0045a683          	lw	a3,4(a1)
    1cdc:	02069e63          	bnez	a3,1d18 <_allocate_file+0x68>
    1ce0:	00e7a223          	sw	a4,4(a5)
    1ce4:	00005537          	lui	a0,0x5
    1ce8:	3a850513          	addi	a0,a0,936 # 53a8 <_open_file_list>
    1cec:	00b12623          	sw	a1,12(sp)
    1cf0:	00000097          	auipc	ra,0x0
    1cf4:	d48080e7          	jalr	-696(ra) # 1a38 <fat_list_insert_last>
    1cf8:	00c12583          	lw	a1,12(sp)
    1cfc:	01c12083          	lw	ra,28(sp)
    1d00:	bc458593          	addi	a1,a1,-1084
    1d04:	00058513          	mv	a0,a1
    1d08:	02010113          	addi	sp,sp,32
    1d0c:	00008067          	ret
    1d10:	00d72223          	sw	a3,4(a4)
    1d14:	fc5ff06f          	j	1cd8 <_allocate_file+0x28>
    1d18:	00e6a023          	sw	a4,0(a3)
    1d1c:	fc9ff06f          	j	1ce4 <_allocate_file+0x34>
    1d20:	00058513          	mv	a0,a1
    1d24:	00008067          	ret

00001d28 <_free_file>:
    1d28:	43c52783          	lw	a5,1084(a0)
    1d2c:	44052703          	lw	a4,1088(a0)
    1d30:	43c50593          	addi	a1,a0,1084
    1d34:	02079663          	bnez	a5,1d60 <_free_file+0x38>
    1d38:	000056b7          	lui	a3,0x5
    1d3c:	3ae6a423          	sw	a4,936(a3) # 53a8 <_open_file_list>
    1d40:	44052703          	lw	a4,1088(a0)
    1d44:	02071263          	bnez	a4,1d68 <_free_file+0x40>
    1d48:	00005737          	lui	a4,0x5
    1d4c:	3af72623          	sw	a5,940(a4) # 53ac <_open_file_list+0x4>
    1d50:	00005537          	lui	a0,0x5
    1d54:	3a050513          	addi	a0,a0,928 # 53a0 <_free_file_list>
    1d58:	00000317          	auipc	t1,0x0
    1d5c:	ce030067          	jr	-800(t1) # 1a38 <fat_list_insert_last>
    1d60:	00e7a223          	sw	a4,4(a5)
    1d64:	fddff06f          	j	1d40 <_free_file+0x18>
    1d68:	00f72023          	sw	a5,0(a4)
    1d6c:	fe5ff06f          	j	1d50 <_free_file+0x28>

00001d70 <fatfs_lba_of_cluster>:
    1d70:	ff010113          	addi	sp,sp,-16
    1d74:	00812423          	sw	s0,8(sp)
    1d78:	00112623          	sw	ra,12(sp)
    1d7c:	00050413          	mv	s0,a0
    1d80:	ffe58513          	addi	a0,a1,-2
    1d84:	00044583          	lbu	a1,0(s0)
    1d88:	00000097          	auipc	ra,0x0
    1d8c:	c84080e7          	jalr	-892(ra) # 1a0c <__mulsi3>
    1d90:	00442783          	lw	a5,4(s0)
    1d94:	00f50533          	add	a0,a0,a5
    1d98:	03042783          	lw	a5,48(s0)
    1d9c:	00079863          	bnez	a5,1dac <fatfs_lba_of_cluster+0x3c>
    1da0:	02845783          	lhu	a5,40(s0)
    1da4:	4047d793          	srai	a5,a5,0x4
    1da8:	00f50533          	add	a0,a0,a5
    1dac:	00c12083          	lw	ra,12(sp)
    1db0:	00812403          	lw	s0,8(sp)
    1db4:	01010113          	addi	sp,sp,16
    1db8:	00008067          	ret

00001dbc <fatfs_sector_read>:
    1dbc:	03452783          	lw	a5,52(a0)
    1dc0:	00058713          	mv	a4,a1
    1dc4:	00070513          	mv	a0,a4
    1dc8:	00060593          	mv	a1,a2
    1dcc:	00068613          	mv	a2,a3
    1dd0:	00078067          	jr	a5

00001dd4 <fatfs_sector_write>:
    1dd4:	03852783          	lw	a5,56(a0)
    1dd8:	00058713          	mv	a4,a1
    1ddc:	00070513          	mv	a0,a4
    1de0:	00060593          	mv	a1,a2
    1de4:	00068613          	mv	a2,a3
    1de8:	00078067          	jr	a5

00001dec <fatfs_write_sector>:
    1dec:	03852703          	lw	a4,56(a0)
    1df0:	0a070463          	beqz	a4,1e98 <fatfs_write_sector+0xac>
    1df4:	03052883          	lw	a7,48(a0)
    1df8:	00050793          	mv	a5,a0
    1dfc:	0115e833          	or	a6,a1,a7
    1e00:	02081e63          	bnez	a6,1e3c <fatfs_write_sector+0x50>
    1e04:	01052583          	lw	a1,16(a0)
    1e08:	08b67863          	bgeu	a2,a1,1e98 <fatfs_write_sector+0xac>
    1e0c:	01c52503          	lw	a0,28(a0)
    1e10:	00c7a583          	lw	a1,12(a5)
    1e14:	00b50533          	add	a0,a0,a1
    1e18:	00c50533          	add	a0,a0,a2
    1e1c:	00068863          	beqz	a3,1e2c <fatfs_write_sector+0x40>
    1e20:	00100613          	li	a2,1
    1e24:	00068593          	mv	a1,a3
    1e28:	00070067          	jr	a4
    1e2c:	24a7a223          	sw	a0,580(a5)
    1e30:	00100613          	li	a2,1
    1e34:	04478593          	addi	a1,a5,68
    1e38:	ff1ff06f          	j	1e28 <fatfs_write_sector+0x3c>
    1e3c:	fe010113          	addi	sp,sp,-32
    1e40:	00e12623          	sw	a4,12(sp)
    1e44:	00d12423          	sw	a3,8(sp)
    1e48:	00c12223          	sw	a2,4(sp)
    1e4c:	00112e23          	sw	ra,28(sp)
    1e50:	00a12023          	sw	a0,0(sp)
    1e54:	00000097          	auipc	ra,0x0
    1e58:	f1c080e7          	jalr	-228(ra) # 1d70 <fatfs_lba_of_cluster>
    1e5c:	00412603          	lw	a2,4(sp)
    1e60:	00812683          	lw	a3,8(sp)
    1e64:	00012783          	lw	a5,0(sp)
    1e68:	00c12703          	lw	a4,12(sp)
    1e6c:	00a60533          	add	a0,a2,a0
    1e70:	00068c63          	beqz	a3,1e88 <fatfs_write_sector+0x9c>
    1e74:	00100613          	li	a2,1
    1e78:	00068593          	mv	a1,a3
    1e7c:	01c12083          	lw	ra,28(sp)
    1e80:	02010113          	addi	sp,sp,32
    1e84:	fa5ff06f          	j	1e28 <fatfs_write_sector+0x3c>
    1e88:	24a7a223          	sw	a0,580(a5)
    1e8c:	00100613          	li	a2,1
    1e90:	04478593          	addi	a1,a5,68
    1e94:	fe9ff06f          	j	1e7c <fatfs_write_sector+0x90>
    1e98:	00000513          	li	a0,0
    1e9c:	00008067          	ret

00001ea0 <fl_init>:
    1ea0:	ff010113          	addi	sp,sp,-16
    1ea4:	00005537          	lui	a0,0x5
    1ea8:	000057b7          	lui	a5,0x5
    1eac:	0000c5b7          	lui	a1,0xc
    1eb0:	00112623          	sw	ra,12(sp)
    1eb4:	3a050513          	addi	a0,a0,928 # 53a0 <_free_file_list>
    1eb8:	3a878793          	addi	a5,a5,936 # 53a8 <_open_file_list>
    1ebc:	87858593          	addi	a1,a1,-1928 # b878 <_files+0x43c>
    1ec0:	00052223          	sw	zero,4(a0)
    1ec4:	00052023          	sw	zero,0(a0)
    1ec8:	0007a223          	sw	zero,4(a5)
    1ecc:	0007a023          	sw	zero,0(a5)
    1ed0:	00000097          	auipc	ra,0x0
    1ed4:	b68080e7          	jalr	-1176(ra) # 1a38 <fat_list_insert_last>
    1ed8:	000057b7          	lui	a5,0x5
    1edc:	0000c5b7          	lui	a1,0xc
    1ee0:	3a078513          	addi	a0,a5,928 # 53a0 <_free_file_list>
    1ee4:	cbc58593          	addi	a1,a1,-836 # bcbc <_files+0x880>
    1ee8:	00000097          	auipc	ra,0x0
    1eec:	b50080e7          	jalr	-1200(ra) # 1a38 <fat_list_insert_last>
    1ef0:	00c12083          	lw	ra,12(sp)
    1ef4:	000057b7          	lui	a5,0x5
    1ef8:	00100713          	li	a4,1
    1efc:	3ae7aa23          	sw	a4,948(a5) # 53b4 <_filelib_init>
    1f00:	01010113          	addi	sp,sp,16
    1f04:	00008067          	ret

00001f08 <fl_fseek>:
    1f08:	000057b7          	lui	a5,0x5
    1f0c:	3b47a783          	lw	a5,948(a5) # 53b4 <_filelib_init>
    1f10:	fd010113          	addi	sp,sp,-48
    1f14:	02812423          	sw	s0,40(sp)
    1f18:	02912223          	sw	s1,36(sp)
    1f1c:	01312e23          	sw	s3,28(sp)
    1f20:	02112623          	sw	ra,44(sp)
    1f24:	03212023          	sw	s2,32(sp)
    1f28:	00050413          	mv	s0,a0
    1f2c:	00058493          	mv	s1,a1
    1f30:	00060993          	mv	s3,a2
    1f34:	00079663          	bnez	a5,1f40 <fl_fseek+0x38>
    1f38:	00000097          	auipc	ra,0x0
    1f3c:	f68080e7          	jalr	-152(ra) # 1ea0 <fl_init>
    1f40:	fff00513          	li	a0,-1
    1f44:	08040263          	beqz	s0,1fc8 <fl_fseek+0xc0>
    1f48:	00048663          	beqz	s1,1f54 <fl_fseek+0x4c>
    1f4c:	ffe98793          	addi	a5,s3,-2
    1f50:	06078c63          	beqz	a5,1fc8 <fl_fseek+0xc0>
    1f54:	0000b937          	lui	s2,0xb
    1f58:	fd490913          	addi	s2,s2,-44 # afd4 <_fs>
    1f5c:	03c92783          	lw	a5,60(s2)
    1f60:	00078463          	beqz	a5,1f68 <fl_fseek+0x60>
    1f64:	000780e7          	jalr	a5
    1f68:	fff00513          	li	a0,-1
    1f6c:	42a42823          	sw	a0,1072(s0)
    1f70:	42042a23          	sw	zero,1076(s0)
    1f74:	00099c63          	bnez	s3,1f8c <fl_fseek+0x84>
    1f78:	00c42783          	lw	a5,12(s0)
    1f7c:	00942423          	sw	s1,8(s0)
    1f80:	0297f863          	bgeu	a5,s1,1fb0 <fl_fseek+0xa8>
    1f84:	00f42423          	sw	a5,8(s0)
    1f88:	0280006f          	j	1fb0 <fl_fseek+0xa8>
    1f8c:	00100793          	li	a5,1
    1f90:	06f99063          	bne	s3,a5,1ff0 <fl_fseek+0xe8>
    1f94:	00842783          	lw	a5,8(s0)
    1f98:	0004c663          	bltz	s1,1fa4 <fl_fseek+0x9c>
    1f9c:	00f484b3          	add	s1,s1,a5
    1fa0:	fd9ff06f          	j	1f78 <fl_fseek+0x70>
    1fa4:	40900733          	neg	a4,s1
    1fa8:	02e7fe63          	bgeu	a5,a4,1fe4 <fl_fseek+0xdc>
    1fac:	00042423          	sw	zero,8(s0)
    1fb0:	00000513          	li	a0,0
    1fb4:	04092783          	lw	a5,64(s2)
    1fb8:	00078863          	beqz	a5,1fc8 <fl_fseek+0xc0>
    1fbc:	00a12623          	sw	a0,12(sp)
    1fc0:	000780e7          	jalr	a5
    1fc4:	00c12503          	lw	a0,12(sp)
    1fc8:	02c12083          	lw	ra,44(sp)
    1fcc:	02812403          	lw	s0,40(sp)
    1fd0:	02412483          	lw	s1,36(sp)
    1fd4:	02012903          	lw	s2,32(sp)
    1fd8:	01c12983          	lw	s3,28(sp)
    1fdc:	03010113          	addi	sp,sp,48
    1fe0:	00008067          	ret
    1fe4:	00f484b3          	add	s1,s1,a5
    1fe8:	00942423          	sw	s1,8(s0)
    1fec:	fc5ff06f          	j	1fb0 <fl_fseek+0xa8>
    1ff0:	00200793          	li	a5,2
    1ff4:	fcf990e3          	bne	s3,a5,1fb4 <fl_fseek+0xac>
    1ff8:	00c42783          	lw	a5,12(s0)
    1ffc:	f89ff06f          	j	1f84 <fl_fseek+0x7c>

00002000 <fl_closedir>:
    2000:	00000513          	li	a0,0
    2004:	00008067          	ret

00002008 <fatfs_lfn_cache_entry>:
    2008:	0005c783          	lbu	a5,0(a1)
    200c:	01300693          	li	a3,19
    2010:	01f7f793          	andi	a5,a5,31
    2014:	fff78713          	addi	a4,a5,-1
    2018:	0ff77613          	zext.b	a2,a4
    201c:	0ac6ea63          	bltu	a3,a2,20d0 <fatfs_lfn_cache_entry+0xc8>
    2020:	10554683          	lbu	a3,261(a0)
    2024:	00069463          	bnez	a3,202c <fatfs_lfn_cache_entry+0x24>
    2028:	10f502a3          	sb	a5,261(a0)
    202c:	00171793          	slli	a5,a4,0x1
    2030:	00e787b3          	add	a5,a5,a4
    2034:	0015c683          	lbu	a3,1(a1)
    2038:	00279793          	slli	a5,a5,0x2
    203c:	00e787b3          	add	a5,a5,a4
    2040:	00f50533          	add	a0,a0,a5
    2044:	00d50023          	sb	a3,0(a0)
    2048:	0035c783          	lbu	a5,3(a1)
    204c:	0ff00713          	li	a4,255
    2050:	02000693          	li	a3,32
    2054:	00f500a3          	sb	a5,1(a0)
    2058:	0055c783          	lbu	a5,5(a1)
    205c:	00f50123          	sb	a5,2(a0)
    2060:	0075c783          	lbu	a5,7(a1)
    2064:	00f501a3          	sb	a5,3(a0)
    2068:	0095c783          	lbu	a5,9(a1)
    206c:	00f50223          	sb	a5,4(a0)
    2070:	00e5c783          	lbu	a5,14(a1)
    2074:	00f502a3          	sb	a5,5(a0)
    2078:	0105c783          	lbu	a5,16(a1)
    207c:	00f50323          	sb	a5,6(a0)
    2080:	0125c783          	lbu	a5,18(a1)
    2084:	00f503a3          	sb	a5,7(a0)
    2088:	0145c783          	lbu	a5,20(a1)
    208c:	00f50423          	sb	a5,8(a0)
    2090:	0165c783          	lbu	a5,22(a1)
    2094:	00f504a3          	sb	a5,9(a0)
    2098:	0185c783          	lbu	a5,24(a1)
    209c:	00f50523          	sb	a5,10(a0)
    20a0:	01c5c783          	lbu	a5,28(a1)
    20a4:	00f505a3          	sb	a5,11(a0)
    20a8:	01e5c783          	lbu	a5,30(a1)
    20ac:	00f50623          	sb	a5,12(a0)
    20b0:	00d00793          	li	a5,13
    20b4:	00054603          	lbu	a2,0(a0)
    20b8:	00e61463          	bne	a2,a4,20c0 <fatfs_lfn_cache_entry+0xb8>
    20bc:	00d50023          	sb	a3,0(a0)
    20c0:	fff78793          	addi	a5,a5,-1
    20c4:	0ff7f793          	zext.b	a5,a5
    20c8:	00150513          	addi	a0,a0,1
    20cc:	fe0794e3          	bnez	a5,20b4 <fatfs_lfn_cache_entry+0xac>
    20d0:	00008067          	ret

000020d4 <fatfs_lfn_cache_get>:
    20d4:	10554703          	lbu	a4,261(a0)
    20d8:	01400793          	li	a5,20
    20dc:	00f71663          	bne	a4,a5,20e8 <fatfs_lfn_cache_get+0x14>
    20e0:	10050223          	sb	zero,260(a0)
    20e4:	00008067          	ret
    20e8:	02070063          	beqz	a4,2108 <fatfs_lfn_cache_get+0x34>
    20ec:	00171793          	slli	a5,a4,0x1
    20f0:	00e787b3          	add	a5,a5,a4
    20f4:	00279793          	slli	a5,a5,0x2
    20f8:	00e787b3          	add	a5,a5,a4
    20fc:	00f507b3          	add	a5,a0,a5
    2100:	00078023          	sb	zero,0(a5)
    2104:	00008067          	ret
    2108:	00050023          	sb	zero,0(a0)
    210c:	00008067          	ret

00002110 <fatfs_entry_lfn_text>:
    2110:	00b54503          	lbu	a0,11(a0)
    2114:	00f57513          	andi	a0,a0,15
    2118:	ff150513          	addi	a0,a0,-15
    211c:	00153513          	seqz	a0,a0
    2120:	00008067          	ret

00002124 <fatfs_entry_lfn_invalid>:
    2124:	00054783          	lbu	a5,0(a0)
    2128:	f1b78713          	addi	a4,a5,-229
    212c:	02070263          	beqz	a4,2150 <fatfs_entry_lfn_invalid+0x2c>
    2130:	02078063          	beqz	a5,2150 <fatfs_entry_lfn_invalid+0x2c>
    2134:	00b54783          	lbu	a5,11(a0)
    2138:	00800713          	li	a4,8
    213c:	00100513          	li	a0,1
    2140:	00e78a63          	beq	a5,a4,2154 <fatfs_entry_lfn_invalid+0x30>
    2144:	0067f793          	andi	a5,a5,6
    2148:	00f03533          	snez	a0,a5
    214c:	00008067          	ret
    2150:	00100513          	li	a0,1
    2154:	00008067          	ret

00002158 <fatfs_entry_lfn_exists>:
    2158:	00b5c783          	lbu	a5,11(a1)
    215c:	00f00713          	li	a4,15
    2160:	04e78063          	beq	a5,a4,21a0 <fatfs_entry_lfn_exists+0x48>
    2164:	0005c683          	lbu	a3,0(a1)
    2168:	f1b68713          	addi	a4,a3,-229
    216c:	00e03733          	snez	a4,a4
    2170:	00d036b3          	snez	a3,a3
    2174:	00d77733          	and	a4,a4,a3
    2178:	02070463          	beqz	a4,21a0 <fatfs_entry_lfn_exists+0x48>
    217c:	ff878713          	addi	a4,a5,-8
    2180:	02070063          	beqz	a4,21a0 <fatfs_entry_lfn_exists+0x48>
    2184:	0067f713          	andi	a4,a5,6
    2188:	00000793          	li	a5,0
    218c:	00071663          	bnez	a4,2198 <fatfs_entry_lfn_exists+0x40>
    2190:	10554783          	lbu	a5,261(a0)
    2194:	00f037b3          	snez	a5,a5
    2198:	00078513          	mv	a0,a5
    219c:	00008067          	ret
    21a0:	00000793          	li	a5,0
    21a4:	ff5ff06f          	j	2198 <fatfs_entry_lfn_exists+0x40>

000021a8 <fatfs_entry_sfn_only>:
    21a8:	00b54783          	lbu	a5,11(a0)
    21ac:	00f00713          	li	a4,15
    21b0:	02e78863          	beq	a5,a4,21e0 <fatfs_entry_sfn_only+0x38>
    21b4:	00054683          	lbu	a3,0(a0)
    21b8:	f1b68713          	addi	a4,a3,-229
    21bc:	00e03733          	snez	a4,a4
    21c0:	00d036b3          	snez	a3,a3
    21c4:	00d77733          	and	a4,a4,a3
    21c8:	00070c63          	beqz	a4,21e0 <fatfs_entry_sfn_only+0x38>
    21cc:	ff878713          	addi	a4,a5,-8
    21d0:	00070863          	beqz	a4,21e0 <fatfs_entry_sfn_only+0x38>
    21d4:	0067f513          	andi	a0,a5,6
    21d8:	00153513          	seqz	a0,a0
    21dc:	00008067          	ret
    21e0:	00000513          	li	a0,0
    21e4:	00008067          	ret

000021e8 <fatfs_entry_is_dir>:
    21e8:	00b54503          	lbu	a0,11(a0)
    21ec:	00455513          	srli	a0,a0,0x4
    21f0:	00157513          	andi	a0,a0,1
    21f4:	00008067          	ret

000021f8 <fatfs_lfn_entries_required>:
    21f8:	ff010113          	addi	sp,sp,-16
    21fc:	00112623          	sw	ra,12(sp)
    2200:	fffff097          	auipc	ra,0xfffff
    2204:	0f4080e7          	jalr	244(ra) # 12f4 <strlen>
    2208:	00050a63          	beqz	a0,221c <fatfs_lfn_entries_required+0x24>
    220c:	00d00593          	li	a1,13
    2210:	00c50513          	addi	a0,a0,12
    2214:	fffff097          	auipc	ra,0xfffff
    2218:	fec080e7          	jalr	-20(ra) # 1200 <__divsi3>
    221c:	00c12083          	lw	ra,12(sp)
    2220:	01010113          	addi	sp,sp,16
    2224:	00008067          	ret

00002228 <fatfs_filename_to_lfn>:
    2228:	f9010113          	addi	sp,sp,-112
    222c:	06812423          	sw	s0,104(sp)
    2230:	00058413          	mv	s0,a1
    2234:	000055b7          	lui	a1,0x5
    2238:	16058593          	addi	a1,a1,352 # 5160 <font+0x1e0>
    223c:	06912223          	sw	s1,100(sp)
    2240:	05312e23          	sw	s3,92(sp)
    2244:	00060493          	mv	s1,a2
    2248:	00050993          	mv	s3,a0
    224c:	03400613          	li	a2,52
    2250:	01c10513          	addi	a0,sp,28
    2254:	00d12623          	sw	a3,12(sp)
    2258:	06112623          	sw	ra,108(sp)
    225c:	07212023          	sw	s2,96(sp)
    2260:	05412c23          	sw	s4,88(sp)
    2264:	fffff097          	auipc	ra,0xfffff
    2268:	06c080e7          	jalr	108(ra) # 12d0 <memcpy>
    226c:	00098513          	mv	a0,s3
    2270:	fffff097          	auipc	ra,0xfffff
    2274:	084080e7          	jalr	132(ra) # 12f4 <strlen>
    2278:	00050913          	mv	s2,a0
    227c:	00098513          	mv	a0,s3
    2280:	00000097          	auipc	ra,0x0
    2284:	f78080e7          	jalr	-136(ra) # 21f8 <fatfs_lfn_entries_required>
    2288:	00050a13          	mv	s4,a0
    228c:	02000613          	li	a2,32
    2290:	00000593          	li	a1,0
    2294:	00040513          	mv	a0,s0
    2298:	fffff097          	auipc	ra,0xfffff
    229c:	01c080e7          	jalr	28(ra) # 12b4 <memset>
    22a0:	fffa0713          	addi	a4,s4,-1 # 3fff <fatfs_fat_add_cluster_to_chain+0x7>
    22a4:	00c12683          	lw	a3,12(sp)
    22a8:	00148793          	addi	a5,s1,1
    22ac:	00971463          	bne	a4,s1,22b4 <fatfs_filename_to_lfn+0x8c>
    22b0:	0407e793          	ori	a5,a5,64
    22b4:	00149613          	slli	a2,s1,0x1
    22b8:	00960633          	add	a2,a2,s1
    22bc:	00f40023          	sb	a5,0(s0)
    22c0:	00261613          	slli	a2,a2,0x2
    22c4:	00f00793          	li	a5,15
    22c8:	00f405a3          	sb	a5,11(s0)
    22cc:	00d406a3          	sb	a3,13(s0)
    22d0:	01c10793          	addi	a5,sp,28
    22d4:	00960633          	add	a2,a2,s1
    22d8:	fff00693          	li	a3,-1
    22dc:	0007a703          	lw	a4,0(a5)
    22e0:	00e40733          	add	a4,s0,a4
    22e4:	05265063          	bge	a2,s2,2324 <fatfs_filename_to_lfn+0xfc>
    22e8:	00c985b3          	add	a1,s3,a2
    22ec:	0005c583          	lbu	a1,0(a1)
    22f0:	00b70023          	sb	a1,0(a4)
    22f4:	00478793          	addi	a5,a5,4
    22f8:	05010713          	addi	a4,sp,80
    22fc:	00160613          	addi	a2,a2,1
    2300:	fce79ee3          	bne	a5,a4,22dc <fatfs_filename_to_lfn+0xb4>
    2304:	06c12083          	lw	ra,108(sp)
    2308:	06812403          	lw	s0,104(sp)
    230c:	06412483          	lw	s1,100(sp)
    2310:	06012903          	lw	s2,96(sp)
    2314:	05c12983          	lw	s3,92(sp)
    2318:	05812a03          	lw	s4,88(sp)
    231c:	07010113          	addi	sp,sp,112
    2320:	00008067          	ret
    2324:	01261663          	bne	a2,s2,2330 <fatfs_filename_to_lfn+0x108>
    2328:	00070023          	sb	zero,0(a4)
    232c:	fc9ff06f          	j	22f4 <fatfs_filename_to_lfn+0xcc>
    2330:	00d70023          	sb	a3,0(a4)
    2334:	00d700a3          	sb	a3,1(a4)
    2338:	fbdff06f          	j	22f4 <fatfs_filename_to_lfn+0xcc>

0000233c <fatfs_sfn_create_entry>:
    233c:	00000793          	li	a5,0
    2340:	00b00813          	li	a6,11
    2344:	00f508b3          	add	a7,a0,a5
    2348:	0008c303          	lbu	t1,0(a7)
    234c:	00f688b3          	add	a7,a3,a5
    2350:	00178793          	addi	a5,a5,1
    2354:	00688023          	sb	t1,0(a7)
    2358:	ff0796e3          	bne	a5,a6,2344 <fatfs_sfn_create_entry+0x8>
    235c:	00e03733          	snez	a4,a4
    2360:	40e00733          	neg	a4,a4
    2364:	02000793          	li	a5,32
    2368:	ff077713          	andi	a4,a4,-16
    236c:	00f70733          	add	a4,a4,a5
    2370:	00f68823          	sb	a5,16(a3)
    2374:	00f68923          	sb	a5,18(a3)
    2378:	00f68c23          	sb	a5,24(a3)
    237c:	01065793          	srli	a5,a2,0x10
    2380:	00f68a23          	sb	a5,20(a3)
    2384:	01865793          	srli	a5,a2,0x18
    2388:	00f68aa3          	sb	a5,21(a3)
    238c:	0085d793          	srli	a5,a1,0x8
    2390:	00c68d23          	sb	a2,26(a3)
    2394:	00b68e23          	sb	a1,28(a3)
    2398:	00865613          	srli	a2,a2,0x8
    239c:	00f68ea3          	sb	a5,29(a3)
    23a0:	0105d793          	srli	a5,a1,0x10
    23a4:	0185d593          	srli	a1,a1,0x18
    23a8:	000686a3          	sb	zero,13(a3)
    23ac:	00068723          	sb	zero,14(a3)
    23b0:	000687a3          	sb	zero,15(a3)
    23b4:	000688a3          	sb	zero,17(a3)
    23b8:	000689a3          	sb	zero,19(a3)
    23bc:	00068b23          	sb	zero,22(a3)
    23c0:	00068ba3          	sb	zero,23(a3)
    23c4:	00068ca3          	sb	zero,25(a3)
    23c8:	00e685a3          	sb	a4,11(a3)
    23cc:	00068623          	sb	zero,12(a3)
    23d0:	00c68da3          	sb	a2,27(a3)
    23d4:	00f68f23          	sb	a5,30(a3)
    23d8:	00b68fa3          	sb	a1,31(a3)
    23dc:	00008067          	ret

000023e0 <fatfs_lfn_create_sfn>:
    23e0:	fd010113          	addi	sp,sp,-48
    23e4:	02912223          	sw	s1,36(sp)
    23e8:	00050493          	mv	s1,a0
    23ec:	00058513          	mv	a0,a1
    23f0:	02812423          	sw	s0,40(sp)
    23f4:	01312e23          	sw	s3,28(sp)
    23f8:	00058413          	mv	s0,a1
    23fc:	02112623          	sw	ra,44(sp)
    2400:	03212023          	sw	s2,32(sp)
    2404:	fffff097          	auipc	ra,0xfffff
    2408:	ef0080e7          	jalr	-272(ra) # 12f4 <strlen>
    240c:	00044783          	lbu	a5,0(s0)
    2410:	02e00993          	li	s3,46
    2414:	15378063          	beq	a5,s3,2554 <fatfs_lfn_create_sfn+0x174>
    2418:	00b00613          	li	a2,11
    241c:	02000593          	li	a1,32
    2420:	00050913          	mv	s2,a0
    2424:	00048513          	mv	a0,s1
    2428:	fffff097          	auipc	ra,0xfffff
    242c:	e8c080e7          	jalr	-372(ra) # 12b4 <memset>
    2430:	00300613          	li	a2,3
    2434:	02000593          	li	a1,32
    2438:	00c10513          	addi	a0,sp,12
    243c:	fffff097          	auipc	ra,0xfffff
    2440:	e78080e7          	jalr	-392(ra) # 12b4 <memset>
    2444:	fff00793          	li	a5,-1
    2448:	00000713          	li	a4,0
    244c:	0d274263          	blt	a4,s2,2510 <fatfs_lfn_create_sfn+0x130>
    2450:	fff00713          	li	a4,-1
    2454:	0ee78863          	beq	a5,a4,2544 <fatfs_lfn_create_sfn+0x164>
    2458:	00178713          	addi	a4,a5,1
    245c:	00c10693          	addi	a3,sp,12
    2460:	00478613          	addi	a2,a5,4
    2464:	0ce61263          	bne	a2,a4,2528 <fatfs_lfn_create_sfn+0x148>
    2468:	00000613          	li	a2,0
    246c:	00000693          	li	a3,0
    2470:	01900813          	li	a6,25
    2474:	00800893          	li	a7,8
    2478:	02f6de63          	bge	a3,a5,24b4 <fatfs_lfn_create_sfn+0xd4>
    247c:	00d40733          	add	a4,s0,a3
    2480:	00074703          	lbu	a4,0(a4)
    2484:	fe070513          	addi	a0,a4,-32
    2488:	0c050263          	beqz	a0,254c <fatfs_lfn_create_sfn+0x16c>
    248c:	fd270593          	addi	a1,a4,-46
    2490:	0a058e63          	beqz	a1,254c <fatfs_lfn_create_sfn+0x16c>
    2494:	f9f70593          	addi	a1,a4,-97
    2498:	0ff5f593          	zext.b	a1,a1
    249c:	00c48333          	add	t1,s1,a2
    24a0:	00160613          	addi	a2,a2,1
    24a4:	00b86463          	bltu	a6,a1,24ac <fatfs_lfn_create_sfn+0xcc>
    24a8:	0ff57713          	zext.b	a4,a0
    24ac:	00e30023          	sb	a4,0(t1)
    24b0:	09161e63          	bne	a2,a7,254c <fatfs_lfn_create_sfn+0x16c>
    24b4:	00c10793          	addi	a5,sp,12
    24b8:	00800693          	li	a3,8
    24bc:	01900513          	li	a0,25
    24c0:	00b00593          	li	a1,11
    24c4:	0007c703          	lbu	a4,0(a5)
    24c8:	f9f70613          	addi	a2,a4,-97
    24cc:	0ff67613          	zext.b	a2,a2
    24d0:	00c56663          	bltu	a0,a2,24dc <fatfs_lfn_create_sfn+0xfc>
    24d4:	fe070713          	addi	a4,a4,-32
    24d8:	0ff77713          	zext.b	a4,a4
    24dc:	00d48633          	add	a2,s1,a3
    24e0:	00e60023          	sb	a4,0(a2)
    24e4:	00168693          	addi	a3,a3,1
    24e8:	00178793          	addi	a5,a5,1
    24ec:	fcb69ce3          	bne	a3,a1,24c4 <fatfs_lfn_create_sfn+0xe4>
    24f0:	00100513          	li	a0,1
    24f4:	02c12083          	lw	ra,44(sp)
    24f8:	02812403          	lw	s0,40(sp)
    24fc:	02412483          	lw	s1,36(sp)
    2500:	02012903          	lw	s2,32(sp)
    2504:	01c12983          	lw	s3,28(sp)
    2508:	03010113          	addi	sp,sp,48
    250c:	00008067          	ret
    2510:	00e406b3          	add	a3,s0,a4
    2514:	0006c683          	lbu	a3,0(a3)
    2518:	01369463          	bne	a3,s3,2520 <fatfs_lfn_create_sfn+0x140>
    251c:	00070793          	mv	a5,a4
    2520:	00170713          	addi	a4,a4,1
    2524:	f29ff06f          	j	244c <fatfs_lfn_create_sfn+0x6c>
    2528:	01275863          	bge	a4,s2,2538 <fatfs_lfn_create_sfn+0x158>
    252c:	00e405b3          	add	a1,s0,a4
    2530:	0005c583          	lbu	a1,0(a1)
    2534:	00b68023          	sb	a1,0(a3)
    2538:	00170713          	addi	a4,a4,1
    253c:	00168693          	addi	a3,a3,1
    2540:	f25ff06f          	j	2464 <fatfs_lfn_create_sfn+0x84>
    2544:	00090793          	mv	a5,s2
    2548:	f21ff06f          	j	2468 <fatfs_lfn_create_sfn+0x88>
    254c:	00168693          	addi	a3,a3,1
    2550:	f29ff06f          	j	2478 <fatfs_lfn_create_sfn+0x98>
    2554:	00000513          	li	a0,0
    2558:	f9dff06f          	j	24f4 <fatfs_lfn_create_sfn+0x114>

0000255c <fatfs_lfn_generate_tail>:
    255c:	000187b7          	lui	a5,0x18
    2560:	69f78793          	addi	a5,a5,1695 # 1869f <__stacktop+0x869f>
    2564:	16c7e463          	bltu	a5,a2,26cc <fatfs_lfn_generate_tail+0x170>
    2568:	fa010113          	addi	sp,sp,-96
    256c:	04812c23          	sw	s0,88(sp)
    2570:	04912a23          	sw	s1,84(sp)
    2574:	03712e23          	sw	s7,60(sp)
    2578:	00060413          	mv	s0,a2
    257c:	00058b93          	mv	s7,a1
    2580:	00c00613          	li	a2,12
    2584:	00000593          	li	a1,0
    2588:	00050493          	mv	s1,a0
    258c:	00410513          	addi	a0,sp,4
    2590:	04112e23          	sw	ra,92(sp)
    2594:	05312623          	sw	s3,76(sp)
    2598:	05412423          	sw	s4,72(sp)
    259c:	05612023          	sw	s6,64(sp)
    25a0:	05212823          	sw	s2,80(sp)
    25a4:	05512223          	sw	s5,68(sp)
    25a8:	fffff097          	auipc	ra,0xfffff
    25ac:	d0c080e7          	jalr	-756(ra) # 12b4 <memset>
    25b0:	000055b7          	lui	a1,0x5
    25b4:	07e00793          	li	a5,126
    25b8:	01100613          	li	a2,17
    25bc:	f3858593          	addi	a1,a1,-200 # 4f38 <LEDS+0x9c>
    25c0:	01c10513          	addi	a0,sp,28
    25c4:	01010993          	addi	s3,sp,16
    25c8:	00f10223          	sb	a5,4(sp)
    25cc:	00098a13          	mv	s4,s3
    25d0:	fffff097          	auipc	ra,0xfffff
    25d4:	d00080e7          	jalr	-768(ra) # 12d0 <memcpy>
    25d8:	00900b13          	li	s6,9
    25dc:	00a00593          	li	a1,10
    25e0:	00040513          	mv	a0,s0
    25e4:	fffff097          	auipc	ra,0xfffff
    25e8:	c6c080e7          	jalr	-916(ra) # 1250 <__umodsi3>
    25ec:	03050793          	addi	a5,a0,48
    25f0:	00278533          	add	a0,a5,sp
    25f4:	fec54783          	lbu	a5,-20(a0)
    25f8:	00098913          	mv	s2,s3
    25fc:	00040513          	mv	a0,s0
    2600:	00a00593          	li	a1,10
    2604:	00f98023          	sb	a5,0(s3)
    2608:	00040a93          	mv	s5,s0
    260c:	fffff097          	auipc	ra,0xfffff
    2610:	bfc080e7          	jalr	-1028(ra) # 1208 <__udivsi3>
    2614:	00198993          	addi	s3,s3,1
    2618:	00050413          	mv	s0,a0
    261c:	fd5b60e3          	bltu	s6,s5,25dc <fatfs_lfn_generate_tail+0x80>
    2620:	00098023          	sb	zero,0(s3)
    2624:	00410713          	addi	a4,sp,4
    2628:	00090793          	mv	a5,s2
    262c:	0947f663          	bgeu	a5,s4,26b8 <fatfs_lfn_generate_tail+0x15c>
    2630:	00f10713          	addi	a4,sp,15
    2634:	00000793          	li	a5,0
    2638:	00e96663          	bltu	s2,a4,2644 <fatfs_lfn_generate_tail+0xe8>
    263c:	41490933          	sub	s2,s2,s4
    2640:	00190793          	addi	a5,s2,1
    2644:	03078793          	addi	a5,a5,48
    2648:	002787b3          	add	a5,a5,sp
    264c:	000b8593          	mv	a1,s7
    2650:	fc078aa3          	sb	zero,-43(a5)
    2654:	00b00613          	li	a2,11
    2658:	00048513          	mv	a0,s1
    265c:	fffff097          	auipc	ra,0xfffff
    2660:	c74080e7          	jalr	-908(ra) # 12d0 <memcpy>
    2664:	00410513          	addi	a0,sp,4
    2668:	fffff097          	auipc	ra,0xfffff
    266c:	c8c080e7          	jalr	-884(ra) # 12f4 <strlen>
    2670:	40a484b3          	sub	s1,s1,a0
    2674:	00050613          	mv	a2,a0
    2678:	00410593          	addi	a1,sp,4
    267c:	00848513          	addi	a0,s1,8
    2680:	fffff097          	auipc	ra,0xfffff
    2684:	c50080e7          	jalr	-944(ra) # 12d0 <memcpy>
    2688:	05c12083          	lw	ra,92(sp)
    268c:	05812403          	lw	s0,88(sp)
    2690:	05412483          	lw	s1,84(sp)
    2694:	05012903          	lw	s2,80(sp)
    2698:	04c12983          	lw	s3,76(sp)
    269c:	04812a03          	lw	s4,72(sp)
    26a0:	04412a83          	lw	s5,68(sp)
    26a4:	04012b03          	lw	s6,64(sp)
    26a8:	03c12b83          	lw	s7,60(sp)
    26ac:	00100513          	li	a0,1
    26b0:	06010113          	addi	sp,sp,96
    26b4:	00008067          	ret
    26b8:	0007c683          	lbu	a3,0(a5)
    26bc:	00170713          	addi	a4,a4,1
    26c0:	fff78793          	addi	a5,a5,-1
    26c4:	00d70023          	sb	a3,0(a4)
    26c8:	f65ff06f          	j	262c <fatfs_lfn_generate_tail+0xd0>
    26cc:	00000513          	li	a0,0
    26d0:	00008067          	ret

000026d4 <fatfs_total_path_levels>:
    26d4:	fff00793          	li	a5,-1
    26d8:	06050263          	beqz	a0,273c <fatfs_total_path_levels+0x68>
    26dc:	00054703          	lbu	a4,0(a0)
    26e0:	02f00793          	li	a5,47
    26e4:	00f71863          	bne	a4,a5,26f4 <fatfs_total_path_levels+0x20>
    26e8:	00150513          	addi	a0,a0,1
    26ec:	00000793          	li	a5,0
    26f0:	0400006f          	j	2730 <fatfs_total_path_levels+0x5c>
    26f4:	00154703          	lbu	a4,1(a0)
    26f8:	03a00793          	li	a5,58
    26fc:	00f70a63          	beq	a4,a5,2710 <fatfs_total_path_levels+0x3c>
    2700:	00254683          	lbu	a3,2(a0)
    2704:	05c00713          	li	a4,92
    2708:	fff00793          	li	a5,-1
    270c:	02e69863          	bne	a3,a4,273c <fatfs_total_path_levels+0x68>
    2710:	00350513          	addi	a0,a0,3
    2714:	05c00713          	li	a4,92
    2718:	fd5ff06f          	j	26ec <fatfs_total_path_levels+0x18>
    271c:	00150513          	addi	a0,a0,1
    2720:	00e68663          	beq	a3,a4,272c <fatfs_total_path_levels+0x58>
    2724:	00054683          	lbu	a3,0(a0)
    2728:	fe069ae3          	bnez	a3,271c <fatfs_total_path_levels+0x48>
    272c:	00178793          	addi	a5,a5,1
    2730:	00054683          	lbu	a3,0(a0)
    2734:	fe0698e3          	bnez	a3,2724 <fatfs_total_path_levels+0x50>
    2738:	fff78793          	addi	a5,a5,-1
    273c:	00078513          	mv	a0,a5
    2740:	00008067          	ret

00002744 <fatfs_get_substring>:
    2744:	0cd05e63          	blez	a3,2820 <fatfs_get_substring+0xdc>
    2748:	0c050c63          	beqz	a0,2820 <fatfs_get_substring+0xdc>
    274c:	fe010113          	addi	sp,sp,-32
    2750:	00812c23          	sw	s0,24(sp)
    2754:	00112e23          	sw	ra,28(sp)
    2758:	00912a23          	sw	s1,20(sp)
    275c:	00054483          	lbu	s1,0(a0)
    2760:	02f00793          	li	a5,47
    2764:	00150413          	addi	s0,a0,1
    2768:	02f48463          	beq	s1,a5,2790 <fatfs_get_substring+0x4c>
    276c:	00154703          	lbu	a4,1(a0)
    2770:	03a00793          	li	a5,58
    2774:	00f70a63          	beq	a4,a5,2788 <fatfs_get_substring+0x44>
    2778:	00254803          	lbu	a6,2(a0)
    277c:	05c00713          	li	a4,92
    2780:	fff00793          	li	a5,-1
    2784:	04e81c63          	bne	a6,a4,27dc <fatfs_get_substring+0x98>
    2788:	00350413          	addi	s0,a0,3
    278c:	05c00493          	li	s1,92
    2790:	00040513          	mv	a0,s0
    2794:	00d12623          	sw	a3,12(sp)
    2798:	00c12423          	sw	a2,8(sp)
    279c:	00b12223          	sw	a1,4(sp)
    27a0:	fffff097          	auipc	ra,0xfffff
    27a4:	b54080e7          	jalr	-1196(ra) # 12f4 <strlen>
    27a8:	00c12683          	lw	a3,12(sp)
    27ac:	00412583          	lw	a1,4(sp)
    27b0:	00812603          	lw	a2,8(sp)
    27b4:	00000713          	li	a4,0
    27b8:	00000813          	li	a6,0
    27bc:	00000793          	li	a5,0
    27c0:	fff68693          	addi	a3,a3,-1
    27c4:	00e608b3          	add	a7,a2,a4
    27c8:	02a7c663          	blt	a5,a0,27f4 <fatfs_get_substring+0xb0>
    27cc:	00088023          	sb	zero,0(a7)
    27d0:	00064783          	lbu	a5,0(a2)
    27d4:	0017b793          	seqz	a5,a5
    27d8:	40f007b3          	neg	a5,a5
    27dc:	01c12083          	lw	ra,28(sp)
    27e0:	01812403          	lw	s0,24(sp)
    27e4:	01412483          	lw	s1,20(sp)
    27e8:	00078513          	mv	a0,a5
    27ec:	02010113          	addi	sp,sp,32
    27f0:	00008067          	ret
    27f4:	00f40333          	add	t1,s0,a5
    27f8:	00034303          	lbu	t1,0(t1)
    27fc:	00931863          	bne	t1,s1,280c <fatfs_get_substring+0xc8>
    2800:	00180813          	addi	a6,a6,1
    2804:	00178793          	addi	a5,a5,1
    2808:	fbdff06f          	j	27c4 <fatfs_get_substring+0x80>
    280c:	feb81ce3          	bne	a6,a1,2804 <fatfs_get_substring+0xc0>
    2810:	fed75ae3          	bge	a4,a3,2804 <fatfs_get_substring+0xc0>
    2814:	00170713          	addi	a4,a4,1
    2818:	00688023          	sb	t1,0(a7)
    281c:	fe9ff06f          	j	2804 <fatfs_get_substring+0xc0>
    2820:	fff00793          	li	a5,-1
    2824:	00078513          	mv	a0,a5
    2828:	00008067          	ret

0000282c <fatfs_split_path>:
    282c:	fd010113          	addi	sp,sp,-48
    2830:	02912223          	sw	s1,36(sp)
    2834:	03212023          	sw	s2,32(sp)
    2838:	01312e23          	sw	s3,28(sp)
    283c:	01412c23          	sw	s4,24(sp)
    2840:	02112623          	sw	ra,44(sp)
    2844:	02812423          	sw	s0,40(sp)
    2848:	01512a23          	sw	s5,20(sp)
    284c:	00050993          	mv	s3,a0
    2850:	00058493          	mv	s1,a1
    2854:	00060913          	mv	s2,a2
    2858:	00068a13          	mv	s4,a3
    285c:	00e12623          	sw	a4,12(sp)
    2860:	00000097          	auipc	ra,0x0
    2864:	e74080e7          	jalr	-396(ra) # 26d4 <fatfs_total_path_levels>
    2868:	fff00793          	li	a5,-1
    286c:	02f51863          	bne	a0,a5,289c <fatfs_split_path+0x70>
    2870:	fff00413          	li	s0,-1
    2874:	02c12083          	lw	ra,44(sp)
    2878:	00040513          	mv	a0,s0
    287c:	02812403          	lw	s0,40(sp)
    2880:	02412483          	lw	s1,36(sp)
    2884:	02012903          	lw	s2,32(sp)
    2888:	01c12983          	lw	s3,28(sp)
    288c:	01812a03          	lw	s4,24(sp)
    2890:	01412a83          	lw	s5,20(sp)
    2894:	03010113          	addi	sp,sp,48
    2898:	00008067          	ret
    289c:	00c12683          	lw	a3,12(sp)
    28a0:	00050593          	mv	a1,a0
    28a4:	00a12623          	sw	a0,12(sp)
    28a8:	000a0613          	mv	a2,s4
    28ac:	00098513          	mv	a0,s3
    28b0:	00000097          	auipc	ra,0x0
    28b4:	e94080e7          	jalr	-364(ra) # 2744 <fatfs_get_substring>
    28b8:	00050413          	mv	s0,a0
    28bc:	fa051ae3          	bnez	a0,2870 <fatfs_split_path+0x44>
    28c0:	00c12583          	lw	a1,12(sp)
    28c4:	00059663          	bnez	a1,28d0 <fatfs_split_path+0xa4>
    28c8:	00048023          	sb	zero,0(s1)
    28cc:	fa9ff06f          	j	2874 <fatfs_split_path+0x48>
    28d0:	00098513          	mv	a0,s3
    28d4:	fffff097          	auipc	ra,0xfffff
    28d8:	a20080e7          	jalr	-1504(ra) # 12f4 <strlen>
    28dc:	00050a93          	mv	s5,a0
    28e0:	000a0513          	mv	a0,s4
    28e4:	fffff097          	auipc	ra,0xfffff
    28e8:	a10080e7          	jalr	-1520(ra) # 12f4 <strlen>
    28ec:	40aa8633          	sub	a2,s5,a0
    28f0:	00c95463          	bge	s2,a2,28f8 <fatfs_split_path+0xcc>
    28f4:	00090613          	mv	a2,s2
    28f8:	00048513          	mv	a0,s1
    28fc:	00098593          	mv	a1,s3
    2900:	00c12623          	sw	a2,12(sp)
    2904:	fffff097          	auipc	ra,0xfffff
    2908:	9cc080e7          	jalr	-1588(ra) # 12d0 <memcpy>
    290c:	00c12603          	lw	a2,12(sp)
    2910:	00c484b3          	add	s1,s1,a2
    2914:	fe048fa3          	sb	zero,-1(s1)
    2918:	f5dff06f          	j	2874 <fatfs_split_path+0x48>

0000291c <fatfs_compare_names>:
    291c:	fd010113          	addi	sp,sp,-48
    2920:	02112623          	sw	ra,44(sp)
    2924:	03212023          	sw	s2,32(sp)
    2928:	01312e23          	sw	s3,28(sp)
    292c:	01412c23          	sw	s4,24(sp)
    2930:	01512a23          	sw	s5,20(sp)
    2934:	00058a13          	mv	s4,a1
    2938:	02812423          	sw	s0,40(sp)
    293c:	02912223          	sw	s1,36(sp)
    2940:	01612823          	sw	s6,16(sp)
    2944:	01712623          	sw	s7,12(sp)
    2948:	01812423          	sw	s8,8(sp)
    294c:	00050a93          	mv	s5,a0
    2950:	fffff097          	auipc	ra,0xfffff
    2954:	1c4080e7          	jalr	452(ra) # 1b14 <FileString_GetExtension>
    2958:	00050993          	mv	s3,a0
    295c:	000a0513          	mv	a0,s4
    2960:	fffff097          	auipc	ra,0xfffff
    2964:	1b4080e7          	jalr	436(ra) # 1b14 <FileString_GetExtension>
    2968:	fff00793          	li	a5,-1
    296c:	00050913          	mv	s2,a0
    2970:	02f99e63          	bne	s3,a5,29ac <fatfs_compare_names+0x90>
    2974:	0f350063          	beq	a0,s3,2a54 <fatfs_compare_names+0x138>
    2978:	00000513          	li	a0,0
    297c:	02c12083          	lw	ra,44(sp)
    2980:	02812403          	lw	s0,40(sp)
    2984:	02412483          	lw	s1,36(sp)
    2988:	02012903          	lw	s2,32(sp)
    298c:	01c12983          	lw	s3,28(sp)
    2990:	01812a03          	lw	s4,24(sp)
    2994:	01412a83          	lw	s5,20(sp)
    2998:	01012b03          	lw	s6,16(sp)
    299c:	00c12b83          	lw	s7,12(sp)
    29a0:	00812c03          	lw	s8,8(sp)
    29a4:	03010113          	addi	sp,sp,48
    29a8:	00008067          	ret
    29ac:	fcf506e3          	beq	a0,a5,2978 <fatfs_compare_names+0x5c>
    29b0:	00198793          	addi	a5,s3,1
    29b4:	00fa8b33          	add	s6,s5,a5
    29b8:	00050413          	mv	s0,a0
    29bc:	00150793          	addi	a5,a0,1
    29c0:	000b0513          	mv	a0,s6
    29c4:	00fa0bb3          	add	s7,s4,a5
    29c8:	fffff097          	auipc	ra,0xfffff
    29cc:	92c080e7          	jalr	-1748(ra) # 12f4 <strlen>
    29d0:	00050c13          	mv	s8,a0
    29d4:	000b8513          	mv	a0,s7
    29d8:	00098493          	mv	s1,s3
    29dc:	fffff097          	auipc	ra,0xfffff
    29e0:	918080e7          	jalr	-1768(ra) # 12f4 <strlen>
    29e4:	f8ac1ae3          	bne	s8,a0,2978 <fatfs_compare_names+0x5c>
    29e8:	000b0513          	mv	a0,s6
    29ec:	fffff097          	auipc	ra,0xfffff
    29f0:	908080e7          	jalr	-1784(ra) # 12f4 <strlen>
    29f4:	00050613          	mv	a2,a0
    29f8:	000b8593          	mv	a1,s7
    29fc:	000b0513          	mv	a0,s6
    2a00:	fffff097          	auipc	ra,0xfffff
    2a04:	0a4080e7          	jalr	164(ra) # 1aa4 <FileString_StrCmpNoCase>
    2a08:	f60518e3          	bnez	a0,2978 <fatfs_compare_names+0x5c>
    2a0c:	fff48793          	addi	a5,s1,-1
    2a10:	00fa87b3          	add	a5,s5,a5
    2a14:	41378733          	sub	a4,a5,s3
    2a18:	02000693          	li	a3,32
    2a1c:	06e79263          	bne	a5,a4,2a80 <fatfs_compare_names+0x164>
    2a20:	fff40793          	addi	a5,s0,-1
    2a24:	00fa07b3          	add	a5,s4,a5
    2a28:	41278733          	sub	a4,a5,s2
    2a2c:	02000693          	li	a3,32
    2a30:	06e79263          	bne	a5,a4,2a94 <fatfs_compare_names+0x178>
    2a34:	f53912e3          	bne	s2,s3,2978 <fatfs_compare_names+0x5c>
    2a38:	00090613          	mv	a2,s2
    2a3c:	000a0593          	mv	a1,s4
    2a40:	000a8513          	mv	a0,s5
    2a44:	fffff097          	auipc	ra,0xfffff
    2a48:	060080e7          	jalr	96(ra) # 1aa4 <FileString_StrCmpNoCase>
    2a4c:	00153513          	seqz	a0,a0
    2a50:	f2dff06f          	j	297c <fatfs_compare_names+0x60>
    2a54:	000a8513          	mv	a0,s5
    2a58:	fffff097          	auipc	ra,0xfffff
    2a5c:	89c080e7          	jalr	-1892(ra) # 12f4 <strlen>
    2a60:	00050493          	mv	s1,a0
    2a64:	00050993          	mv	s3,a0
    2a68:	000a0513          	mv	a0,s4
    2a6c:	fffff097          	auipc	ra,0xfffff
    2a70:	888080e7          	jalr	-1912(ra) # 12f4 <strlen>
    2a74:	00050413          	mv	s0,a0
    2a78:	00050913          	mv	s2,a0
    2a7c:	f91ff06f          	j	2a0c <fatfs_compare_names+0xf0>
    2a80:	0007c603          	lbu	a2,0(a5)
    2a84:	f8d61ee3          	bne	a2,a3,2a20 <fatfs_compare_names+0x104>
    2a88:	415789b3          	sub	s3,a5,s5
    2a8c:	fff78793          	addi	a5,a5,-1
    2a90:	f8dff06f          	j	2a1c <fatfs_compare_names+0x100>
    2a94:	0007c603          	lbu	a2,0(a5)
    2a98:	f8d61ee3          	bne	a2,a3,2a34 <fatfs_compare_names+0x118>
    2a9c:	41478933          	sub	s2,a5,s4
    2aa0:	fff78793          	addi	a5,a5,-1
    2aa4:	f8dff06f          	j	2a30 <fatfs_compare_names+0x114>

00002aa8 <_check_file_open>:
    2aa8:	fe010113          	addi	sp,sp,-32
    2aac:	000057b7          	lui	a5,0x5
    2ab0:	00812c23          	sw	s0,24(sp)
    2ab4:	3a87a403          	lw	s0,936(a5) # 53a8 <_open_file_list>
    2ab8:	00912a23          	sw	s1,20(sp)
    2abc:	00112e23          	sw	ra,28(sp)
    2ac0:	01212823          	sw	s2,16(sp)
    2ac4:	01312623          	sw	s3,12(sp)
    2ac8:	00050493          	mv	s1,a0
    2acc:	00041663          	bnez	s0,2ad8 <_check_file_open+0x30>
    2ad0:	00000513          	li	a0,0
    2ad4:	03c0006f          	j	2b10 <_check_file_open+0x68>
    2ad8:	bc440793          	addi	a5,s0,-1084
    2adc:	00f49663          	bne	s1,a5,2ae8 <_check_file_open+0x40>
    2ae0:	00442403          	lw	s0,4(s0)
    2ae4:	fe9ff06f          	j	2acc <_check_file_open+0x24>
    2ae8:	01448593          	addi	a1,s1,20
    2aec:	bd840513          	addi	a0,s0,-1064
    2af0:	00000097          	auipc	ra,0x0
    2af4:	e2c080e7          	jalr	-468(ra) # 291c <fatfs_compare_names>
    2af8:	fe0504e3          	beqz	a0,2ae0 <_check_file_open+0x38>
    2afc:	11848593          	addi	a1,s1,280
    2b00:	cdc40513          	addi	a0,s0,-804
    2b04:	00000097          	auipc	ra,0x0
    2b08:	e18080e7          	jalr	-488(ra) # 291c <fatfs_compare_names>
    2b0c:	fc050ae3          	beqz	a0,2ae0 <_check_file_open+0x38>
    2b10:	01c12083          	lw	ra,28(sp)
    2b14:	01812403          	lw	s0,24(sp)
    2b18:	01412483          	lw	s1,20(sp)
    2b1c:	01012903          	lw	s2,16(sp)
    2b20:	00c12983          	lw	s3,12(sp)
    2b24:	02010113          	addi	sp,sp,32
    2b28:	00008067          	ret

00002b2c <fatfs_get_sfn_display_name>:
    2b2c:	00000713          	li	a4,0
    2b30:	02000613          	li	a2,32
    2b34:	01900813          	li	a6,25
    2b38:	0005c783          	lbu	a5,0(a1)
    2b3c:	00078663          	beqz	a5,2b48 <fatfs_get_sfn_display_name+0x1c>
    2b40:	ff470693          	addi	a3,a4,-12
    2b44:	00069863          	bnez	a3,2b54 <fatfs_get_sfn_display_name+0x28>
    2b48:	00050023          	sb	zero,0(a0)
    2b4c:	00100513          	li	a0,1
    2b50:	00008067          	ret
    2b54:	00158593          	addi	a1,a1,1
    2b58:	fec780e3          	beq	a5,a2,2b38 <fatfs_get_sfn_display_name+0xc>
    2b5c:	fbf78693          	addi	a3,a5,-65
    2b60:	0ff6f693          	zext.b	a3,a3
    2b64:	00d86663          	bltu	a6,a3,2b70 <fatfs_get_sfn_display_name+0x44>
    2b68:	02078793          	addi	a5,a5,32
    2b6c:	0ff7f793          	zext.b	a5,a5
    2b70:	00f50023          	sb	a5,0(a0)
    2b74:	00170713          	addi	a4,a4,1
    2b78:	00150513          	addi	a0,a0,1
    2b7c:	fbdff06f          	j	2b38 <fatfs_get_sfn_display_name+0xc>

00002b80 <fatfs_fat_init>:
    2b80:	ff010113          	addi	sp,sp,-16
    2b84:	00812423          	sw	s0,8(sp)
    2b88:	00912223          	sw	s1,4(sp)
    2b8c:	00112623          	sw	ra,12(sp)
    2b90:	fff00793          	li	a5,-1
    2b94:	25850493          	addi	s1,a0,600
    2b98:	00050413          	mv	s0,a0
    2b9c:	44f52c23          	sw	a5,1112(a0)
    2ba0:	24052a23          	sw	zero,596(a0)
    2ba4:	44052e23          	sw	zero,1116(a0)
    2ba8:	20000613          	li	a2,512
    2bac:	00048513          	mv	a0,s1
    2bb0:	00000593          	li	a1,0
    2bb4:	ffffe097          	auipc	ra,0xffffe
    2bb8:	700080e7          	jalr	1792(ra) # 12b4 <memset>
    2bbc:	25442783          	lw	a5,596(s0)
    2bc0:	00c12083          	lw	ra,12(sp)
    2bc4:	24942a23          	sw	s1,596(s0)
    2bc8:	46042023          	sw	zero,1120(s0)
    2bcc:	46f42223          	sw	a5,1124(s0)
    2bd0:	00812403          	lw	s0,8(sp)
    2bd4:	00412483          	lw	s1,4(sp)
    2bd8:	01010113          	addi	sp,sp,16
    2bdc:	00008067          	ret

00002be0 <fatfs_init>:
    2be0:	fd010113          	addi	sp,sp,-48
    2be4:	02812423          	sw	s0,40(sp)
    2be8:	02112623          	sw	ra,44(sp)
    2bec:	02912223          	sw	s1,36(sp)
    2bf0:	03212023          	sw	s2,32(sp)
    2bf4:	01312e23          	sw	s3,28(sp)
    2bf8:	fff00793          	li	a5,-1
    2bfc:	24f52223          	sw	a5,580(a0)
    2c00:	24052423          	sw	zero,584(a0)
    2c04:	02052223          	sw	zero,36(a0)
    2c08:	00050413          	mv	s0,a0
    2c0c:	00000097          	auipc	ra,0x0
    2c10:	f74080e7          	jalr	-140(ra) # 2b80 <fatfs_fat_init>
    2c14:	03442783          	lw	a5,52(s0)
    2c18:	02079463          	bnez	a5,2c40 <fatfs_init+0x60>
    2c1c:	fff00713          	li	a4,-1
    2c20:	02c12083          	lw	ra,44(sp)
    2c24:	02812403          	lw	s0,40(sp)
    2c28:	02412483          	lw	s1,36(sp)
    2c2c:	02012903          	lw	s2,32(sp)
    2c30:	01c12983          	lw	s3,28(sp)
    2c34:	00070513          	mv	a0,a4
    2c38:	03010113          	addi	sp,sp,48
    2c3c:	00008067          	ret
    2c40:	04440593          	addi	a1,s0,68
    2c44:	00100613          	li	a2,1
    2c48:	00000513          	li	a0,0
    2c4c:	00b12623          	sw	a1,12(sp)
    2c50:	000780e7          	jalr	a5
    2c54:	fc0504e3          	beqz	a0,2c1c <fatfs_init+0x3c>
    2c58:	24244703          	lbu	a4,578(s0)
    2c5c:	05500793          	li	a5,85
    2c60:	00c12583          	lw	a1,12(sp)
    2c64:	00f70663          	beq	a4,a5,2c70 <fatfs_init+0x90>
    2c68:	ffd00713          	li	a4,-3
    2c6c:	fb5ff06f          	j	2c20 <fatfs_init+0x40>
    2c70:	24344703          	lbu	a4,579(s0)
    2c74:	0aa00793          	li	a5,170
    2c78:	fef718e3          	bne	a4,a5,2c68 <fatfs_init+0x88>
    2c7c:	20644783          	lbu	a5,518(s0)
    2c80:	00600713          	li	a4,6
    2c84:	02f76463          	bltu	a4,a5,2cac <fatfs_init+0xcc>
    2c88:	00400713          	li	a4,4
    2c8c:	00f76663          	bltu	a4,a5,2c98 <fatfs_init+0xb8>
    2c90:	00000513          	li	a0,0
    2c94:	02078663          	beqz	a5,2cc0 <fatfs_init+0xe0>
    2c98:	20c45503          	lhu	a0,524(s0)
    2c9c:	20a45783          	lhu	a5,522(s0)
    2ca0:	01051513          	slli	a0,a0,0x10
    2ca4:	00f56533          	or	a0,a0,a5
    2ca8:	0180006f          	j	2cc0 <fatfs_init+0xe0>
    2cac:	00c00713          	li	a4,12
    2cb0:	12f76663          	bltu	a4,a5,2ddc <fatfs_init+0x1fc>
    2cb4:	00a00713          	li	a4,10
    2cb8:	00000513          	li	a0,0
    2cbc:	fcf76ee3          	bltu	a4,a5,2c98 <fatfs_init+0xb8>
    2cc0:	03442783          	lw	a5,52(s0)
    2cc4:	00a42e23          	sw	a0,28(s0)
    2cc8:	00100613          	li	a2,1
    2ccc:	000780e7          	jalr	a5
    2cd0:	f40506e3          	beqz	a0,2c1c <fatfs_init+0x3c>
    2cd4:	05044783          	lbu	a5,80(s0)
    2cd8:	04f44703          	lbu	a4,79(s0)
    2cdc:	20000693          	li	a3,512
    2ce0:	00879793          	slli	a5,a5,0x8
    2ce4:	00e7e7b3          	or	a5,a5,a4
    2ce8:	ffe00713          	li	a4,-2
    2cec:	f2d79ae3          	bne	a5,a3,2c20 <fatfs_init+0x40>
    2cf0:	05644483          	lbu	s1,86(s0)
    2cf4:	05544783          	lbu	a5,85(s0)
    2cf8:	05144983          	lbu	s3,81(s0)
    2cfc:	00849493          	slli	s1,s1,0x8
    2d00:	05a45583          	lhu	a1,90(s0)
    2d04:	00f4e4b3          	or	s1,s1,a5
    2d08:	01340023          	sb	s3,0(s0)
    2d0c:	02941423          	sh	s1,40(s0)
    2d10:	05245903          	lhu	s2,82(s0)
    2d14:	05444503          	lbu	a0,84(s0)
    2d18:	00059463          	bnez	a1,2d20 <fatfs_init+0x140>
    2d1c:	06842583          	lw	a1,104(s0)
    2d20:	07042783          	lw	a5,112(s0)
    2d24:	02b42023          	sw	a1,32(s0)
    2d28:	00549493          	slli	s1,s1,0x5
    2d2c:	00f42423          	sw	a5,8(s0)
    2d30:	07445783          	lhu	a5,116(s0)
    2d34:	1ff48493          	addi	s1,s1,511
    2d38:	4094d493          	srai	s1,s1,0x9
    2d3c:	00f41c23          	sh	a5,24(s0)
    2d40:	fffff097          	auipc	ra,0xfffff
    2d44:	ccc080e7          	jalr	-820(ra) # 1a0c <__mulsi3>
    2d48:	00a907b3          	add	a5,s2,a0
    2d4c:	00f42623          	sw	a5,12(s0)
    2d50:	01c42783          	lw	a5,28(s0)
    2d54:	24245703          	lhu	a4,578(s0)
    2d58:	00942823          	sw	s1,16(s0)
    2d5c:	00f907b3          	add	a5,s2,a5
    2d60:	00f42a23          	sw	a5,20(s0)
    2d64:	00f507b3          	add	a5,a0,a5
    2d68:	00f42223          	sw	a5,4(s0)
    2d6c:	0000b7b7          	lui	a5,0xb
    2d70:	a5578793          	addi	a5,a5,-1451 # aa55 <framebuffer+0x3a81>
    2d74:	eef71ae3          	bne	a4,a5,2c68 <fatfs_init+0x88>
    2d78:	05844783          	lbu	a5,88(s0)
    2d7c:	05744703          	lbu	a4,87(s0)
    2d80:	00879793          	slli	a5,a5,0x8
    2d84:	00e7e7b3          	or	a5,a5,a4
    2d88:	00079463          	bnez	a5,2d90 <fatfs_init+0x1b0>
    2d8c:	06442783          	lw	a5,100(s0)
    2d90:	ffb00713          	li	a4,-5
    2d94:	e80986e3          	beqz	s3,2c20 <fatfs_init+0x40>
    2d98:	00990933          	add	s2,s2,s1
    2d9c:	00a90533          	add	a0,s2,a0
    2da0:	40a78533          	sub	a0,a5,a0
    2da4:	00098593          	mv	a1,s3
    2da8:	ffffe097          	auipc	ra,0xffffe
    2dac:	460080e7          	jalr	1120(ra) # 1208 <__udivsi3>
    2db0:	000017b7          	lui	a5,0x1
    2db4:	ff478793          	addi	a5,a5,-12 # ff4 <sdcard_preinit>
    2db8:	ffb00713          	li	a4,-5
    2dbc:	e6a7f2e3          	bgeu	a5,a0,2c20 <fatfs_init+0x40>
    2dc0:	000107b7          	lui	a5,0x10
    2dc4:	ff478793          	addi	a5,a5,-12 # fff4 <_files+0x4bb8>
    2dc8:	02a7e663          	bltu	a5,a0,2df4 <fatfs_init+0x214>
    2dcc:	00042423          	sw	zero,8(s0)
    2dd0:	02042823          	sw	zero,48(s0)
    2dd4:	00000713          	li	a4,0
    2dd8:	e49ff06f          	j	2c20 <fatfs_init+0x40>
    2ddc:	ff278793          	addi	a5,a5,-14
    2de0:	0ff7f793          	zext.b	a5,a5
    2de4:	00100713          	li	a4,1
    2de8:	00000513          	li	a0,0
    2dec:	eaf776e3          	bgeu	a4,a5,2c98 <fatfs_init+0xb8>
    2df0:	ed1ff06f          	j	2cc0 <fatfs_init+0xe0>
    2df4:	00100793          	li	a5,1
    2df8:	02f42823          	sw	a5,48(s0)
    2dfc:	fd9ff06f          	j	2dd4 <fatfs_init+0x1f4>

00002e00 <fl_attach_media>:
    2e00:	000057b7          	lui	a5,0x5
    2e04:	3b47a783          	lw	a5,948(a5) # 53b4 <_filelib_init>
    2e08:	fe010113          	addi	sp,sp,-32
    2e0c:	00812c23          	sw	s0,24(sp)
    2e10:	00112e23          	sw	ra,28(sp)
    2e14:	00050413          	mv	s0,a0
    2e18:	00079a63          	bnez	a5,2e2c <fl_attach_media+0x2c>
    2e1c:	00b12623          	sw	a1,12(sp)
    2e20:	fffff097          	auipc	ra,0xfffff
    2e24:	080080e7          	jalr	128(ra) # 1ea0 <fl_init>
    2e28:	00c12583          	lw	a1,12(sp)
    2e2c:	0000b7b7          	lui	a5,0xb
    2e30:	fd478513          	addi	a0,a5,-44 # afd4 <_fs>
    2e34:	02b52c23          	sw	a1,56(a0)
    2e38:	02852a23          	sw	s0,52(a0)
    2e3c:	00000097          	auipc	ra,0x0
    2e40:	da4080e7          	jalr	-604(ra) # 2be0 <fatfs_init>
    2e44:	00050593          	mv	a1,a0
    2e48:	02050863          	beqz	a0,2e78 <fl_attach_media+0x78>
    2e4c:	00a12623          	sw	a0,12(sp)
    2e50:	00005537          	lui	a0,0x5
    2e54:	f4c50513          	addi	a0,a0,-180 # 4f4c <LEDS+0xb0>
    2e58:	fffff097          	auipc	ra,0xfffff
    2e5c:	a78080e7          	jalr	-1416(ra) # 18d0 <printf>
    2e60:	00c12583          	lw	a1,12(sp)
    2e64:	01c12083          	lw	ra,28(sp)
    2e68:	01812403          	lw	s0,24(sp)
    2e6c:	00058513          	mv	a0,a1
    2e70:	02010113          	addi	sp,sp,32
    2e74:	00008067          	ret
    2e78:	000057b7          	lui	a5,0x5
    2e7c:	00100713          	li	a4,1
    2e80:	3ae7a823          	sw	a4,944(a5) # 53b0 <_filelib_valid>
    2e84:	fe1ff06f          	j	2e64 <fl_attach_media+0x64>

00002e88 <fatfs_fat_purge>:
    2e88:	25452583          	lw	a1,596(a0)
    2e8c:	fe010113          	addi	sp,sp,-32
    2e90:	00812c23          	sw	s0,24(sp)
    2e94:	00112e23          	sw	ra,28(sp)
    2e98:	00050413          	mv	s0,a0
    2e9c:	00059663          	bnez	a1,2ea8 <fatfs_fat_purge+0x20>
    2ea0:	00100513          	li	a0,1
    2ea4:	02c0006f          	j	2ed0 <fatfs_fat_purge+0x48>
    2ea8:	2045a783          	lw	a5,516(a1)
    2eac:	00079663          	bnez	a5,2eb8 <fatfs_fat_purge+0x30>
    2eb0:	20c5a583          	lw	a1,524(a1)
    2eb4:	fe9ff06f          	j	2e9c <fatfs_fat_purge+0x14>
    2eb8:	00040513          	mv	a0,s0
    2ebc:	00b12623          	sw	a1,12(sp)
    2ec0:	fffff097          	auipc	ra,0xfffff
    2ec4:	c80080e7          	jalr	-896(ra) # 1b40 <fatfs_fat_writeback>
    2ec8:	00c12583          	lw	a1,12(sp)
    2ecc:	fe0512e3          	bnez	a0,2eb0 <fatfs_fat_purge+0x28>
    2ed0:	01c12083          	lw	ra,28(sp)
    2ed4:	01812403          	lw	s0,24(sp)
    2ed8:	02010113          	addi	sp,sp,32
    2edc:	00008067          	ret

00002ee0 <fatfs_find_next_cluster>:
    2ee0:	ff010113          	addi	sp,sp,-16
    2ee4:	00812423          	sw	s0,8(sp)
    2ee8:	01212023          	sw	s2,0(sp)
    2eec:	00112623          	sw	ra,12(sp)
    2ef0:	00912223          	sw	s1,4(sp)
    2ef4:	00050913          	mv	s2,a0
    2ef8:	00200413          	li	s0,2
    2efc:	00058463          	beqz	a1,2f04 <fatfs_find_next_cluster+0x24>
    2f00:	00058413          	mv	s0,a1
    2f04:	03092783          	lw	a5,48(s2)
    2f08:	00745493          	srli	s1,s0,0x7
    2f0c:	00079463          	bnez	a5,2f14 <fatfs_find_next_cluster+0x34>
    2f10:	00845493          	srli	s1,s0,0x8
    2f14:	01492583          	lw	a1,20(s2)
    2f18:	00090513          	mv	a0,s2
    2f1c:	00b485b3          	add	a1,s1,a1
    2f20:	fffff097          	auipc	ra,0xfffff
    2f24:	ca4080e7          	jalr	-860(ra) # 1bc4 <fatfs_fat_read_sector>
    2f28:	00050793          	mv	a5,a0
    2f2c:	fff00513          	li	a0,-1
    2f30:	04078863          	beqz	a5,2f80 <fatfs_find_next_cluster+0xa0>
    2f34:	03092703          	lw	a4,48(s2)
    2f38:	2087a783          	lw	a5,520(a5)
    2f3c:	04071e63          	bnez	a4,2f98 <fatfs_find_next_cluster+0xb8>
    2f40:	00849493          	slli	s1,s1,0x8
    2f44:	40940433          	sub	s0,s0,s1
    2f48:	00141413          	slli	s0,s0,0x1
    2f4c:	01041413          	slli	s0,s0,0x10
    2f50:	01045413          	srli	s0,s0,0x10
    2f54:	008787b3          	add	a5,a5,s0
    2f58:	0017c503          	lbu	a0,1(a5)
    2f5c:	0007c783          	lbu	a5,0(a5)
    2f60:	00851513          	slli	a0,a0,0x8
    2f64:	00f50533          	add	a0,a0,a5
    2f68:	ffff07b7          	lui	a5,0xffff0
    2f6c:	00878793          	addi	a5,a5,8 # ffff0008 <__stacktop+0xfffe0008>
    2f70:	00f507b3          	add	a5,a0,a5
    2f74:	00700713          	li	a4,7
    2f78:	00f76463          	bltu	a4,a5,2f80 <fatfs_find_next_cluster+0xa0>
    2f7c:	fff00513          	li	a0,-1
    2f80:	00c12083          	lw	ra,12(sp)
    2f84:	00812403          	lw	s0,8(sp)
    2f88:	00412483          	lw	s1,4(sp)
    2f8c:	00012903          	lw	s2,0(sp)
    2f90:	01010113          	addi	sp,sp,16
    2f94:	00008067          	ret
    2f98:	00749493          	slli	s1,s1,0x7
    2f9c:	40940433          	sub	s0,s0,s1
    2fa0:	00241413          	slli	s0,s0,0x2
    2fa4:	01041413          	slli	s0,s0,0x10
    2fa8:	01045413          	srli	s0,s0,0x10
    2fac:	008787b3          	add	a5,a5,s0
    2fb0:	0037c503          	lbu	a0,3(a5)
    2fb4:	0027c703          	lbu	a4,2(a5)
    2fb8:	01851513          	slli	a0,a0,0x18
    2fbc:	01071713          	slli	a4,a4,0x10
    2fc0:	00e50533          	add	a0,a0,a4
    2fc4:	0007c703          	lbu	a4,0(a5)
    2fc8:	0017c783          	lbu	a5,1(a5)
    2fcc:	00e50533          	add	a0,a0,a4
    2fd0:	00879793          	slli	a5,a5,0x8
    2fd4:	00f50533          	add	a0,a0,a5
    2fd8:	00451513          	slli	a0,a0,0x4
    2fdc:	00455513          	srli	a0,a0,0x4
    2fe0:	f00007b7          	lui	a5,0xf0000
    2fe4:	f89ff06f          	j	2f6c <fatfs_find_next_cluster+0x8c>

00002fe8 <fatfs_sector_reader>:
    2fe8:	03052783          	lw	a5,48(a0)
    2fec:	fe010113          	addi	sp,sp,-32
    2ff0:	00812c23          	sw	s0,24(sp)
    2ff4:	01212823          	sw	s2,16(sp)
    2ff8:	01512223          	sw	s5,4(sp)
    2ffc:	00112e23          	sw	ra,28(sp)
    3000:	00912a23          	sw	s1,20(sp)
    3004:	01312623          	sw	s3,12(sp)
    3008:	01412423          	sw	s4,8(sp)
    300c:	01612023          	sw	s6,0(sp)
    3010:	00f5e7b3          	or	a5,a1,a5
    3014:	00050413          	mv	s0,a0
    3018:	00060913          	mv	s2,a2
    301c:	00068a93          	mv	s5,a3
    3020:	08079063          	bnez	a5,30a0 <fatfs_sector_reader+0xb8>
    3024:	01052783          	lw	a5,16(a0)
    3028:	02f66863          	bltu	a2,a5,3058 <fatfs_sector_reader+0x70>
    302c:	00000513          	li	a0,0
    3030:	01c12083          	lw	ra,28(sp)
    3034:	01812403          	lw	s0,24(sp)
    3038:	01412483          	lw	s1,20(sp)
    303c:	01012903          	lw	s2,16(sp)
    3040:	00c12983          	lw	s3,12(sp)
    3044:	00812a03          	lw	s4,8(sp)
    3048:	00412a83          	lw	s5,4(sp)
    304c:	00012b03          	lw	s6,0(sp)
    3050:	02010113          	addi	sp,sp,32
    3054:	00008067          	ret
    3058:	01c52503          	lw	a0,28(a0)
    305c:	00c42783          	lw	a5,12(s0)
    3060:	00f50533          	add	a0,a0,a5
    3064:	01250533          	add	a0,a0,s2
    3068:	0a0a8663          	beqz	s5,3114 <fatfs_sector_reader+0x12c>
    306c:	03442783          	lw	a5,52(s0)
    3070:	00100613          	li	a2,1
    3074:	000a8593          	mv	a1,s5
    3078:	01812403          	lw	s0,24(sp)
    307c:	01c12083          	lw	ra,28(sp)
    3080:	01412483          	lw	s1,20(sp)
    3084:	01012903          	lw	s2,16(sp)
    3088:	00c12983          	lw	s3,12(sp)
    308c:	00812a03          	lw	s4,8(sp)
    3090:	00412a83          	lw	s5,4(sp)
    3094:	00012b03          	lw	s6,0(sp)
    3098:	02010113          	addi	sp,sp,32
    309c:	00078067          	jr	a5 # f0000000 <__stacktop+0xefff0000>
    30a0:	00054783          	lbu	a5,0(a0)
    30a4:	00058493          	mv	s1,a1
    30a8:	00060513          	mv	a0,a2
    30ac:	00078593          	mv	a1,a5
    30b0:	00078a13          	mv	s4,a5
    30b4:	ffffe097          	auipc	ra,0xffffe
    30b8:	154080e7          	jalr	340(ra) # 1208 <__udivsi3>
    30bc:	00050b13          	mv	s6,a0
    30c0:	00000993          	li	s3,0
    30c4:	03699a63          	bne	s3,s6,30f8 <fatfs_sector_reader+0x110>
    30c8:	fff00793          	li	a5,-1
    30cc:	f6f480e3          	beq	s1,a5,302c <fatfs_sector_reader+0x44>
    30d0:	000a0593          	mv	a1,s4
    30d4:	00090513          	mv	a0,s2
    30d8:	ffffe097          	auipc	ra,0xffffe
    30dc:	178080e7          	jalr	376(ra) # 1250 <__umodsi3>
    30e0:	00050913          	mv	s2,a0
    30e4:	00048593          	mv	a1,s1
    30e8:	00040513          	mv	a0,s0
    30ec:	fffff097          	auipc	ra,0xfffff
    30f0:	c84080e7          	jalr	-892(ra) # 1d70 <fatfs_lba_of_cluster>
    30f4:	f71ff06f          	j	3064 <fatfs_sector_reader+0x7c>
    30f8:	00048593          	mv	a1,s1
    30fc:	00040513          	mv	a0,s0
    3100:	00000097          	auipc	ra,0x0
    3104:	de0080e7          	jalr	-544(ra) # 2ee0 <fatfs_find_next_cluster>
    3108:	00050493          	mv	s1,a0
    310c:	00198993          	addi	s3,s3,1
    3110:	fb5ff06f          	j	30c4 <fatfs_sector_reader+0xdc>
    3114:	24442783          	lw	a5,580(s0)
    3118:	00a78c63          	beq	a5,a0,3130 <fatfs_sector_reader+0x148>
    311c:	03442783          	lw	a5,52(s0)
    3120:	24a42223          	sw	a0,580(s0)
    3124:	00100613          	li	a2,1
    3128:	04440593          	addi	a1,s0,68
    312c:	f4dff06f          	j	3078 <fatfs_sector_reader+0x90>
    3130:	00100513          	li	a0,1
    3134:	efdff06f          	j	3030 <fatfs_sector_reader+0x48>

00003138 <fatfs_get_file_entry>:
    3138:	eb010113          	addi	sp,sp,-336
    313c:	14812423          	sw	s0,328(sp)
    3140:	14912223          	sw	s1,324(sp)
    3144:	13312e23          	sw	s3,316(sp)
    3148:	13712623          	sw	s7,300(sp)
    314c:	13812423          	sw	s8,296(sp)
    3150:	13912223          	sw	s9,292(sp)
    3154:	14112623          	sw	ra,332(sp)
    3158:	15212023          	sw	s2,320(sp)
    315c:	13412c23          	sw	s4,312(sp)
    3160:	13512a23          	sw	s5,308(sp)
    3164:	13612823          	sw	s6,304(sp)
    3168:	00050993          	mv	s3,a0
    316c:	00058c93          	mv	s9,a1
    3170:	00060b93          	mv	s7,a2
    3174:	00068c13          	mv	s8,a3
    3178:	10010ea3          	sb	zero,285(sp)
    317c:	01810413          	addi	s0,sp,24
    3180:	11c10493          	addi	s1,sp,284
    3184:	00040513          	mv	a0,s0
    3188:	00d00613          	li	a2,13
    318c:	00000593          	li	a1,0
    3190:	00d40413          	addi	s0,s0,13
    3194:	ffffe097          	auipc	ra,0xffffe
    3198:	120080e7          	jalr	288(ra) # 12b4 <memset>
    319c:	fe9414e3          	bne	s0,s1,3184 <fatfs_get_file_entry+0x4c>
    31a0:	00000493          	li	s1,0
    31a4:	24498a13          	addi	s4,s3,580
    31a8:	00810913          	addi	s2,sp,8
    31ac:	00800a93          	li	s5,8
    31b0:	02e00b13          	li	s6,46
    31b4:	00000693          	li	a3,0
    31b8:	00048613          	mv	a2,s1
    31bc:	000c8593          	mv	a1,s9
    31c0:	00098513          	mv	a0,s3
    31c4:	00000097          	auipc	ra,0x0
    31c8:	e24080e7          	jalr	-476(ra) # 2fe8 <fatfs_sector_reader>
    31cc:	08050c63          	beqz	a0,3264 <fatfs_get_file_entry+0x12c>
    31d0:	00148493          	addi	s1,s1,1
    31d4:	04498413          	addi	s0,s3,68
    31d8:	00040513          	mv	a0,s0
    31dc:	fffff097          	auipc	ra,0xfffff
    31e0:	f34080e7          	jalr	-204(ra) # 2110 <fatfs_entry_lfn_text>
    31e4:	02050063          	beqz	a0,3204 <fatfs_get_file_entry+0xcc>
    31e8:	00040593          	mv	a1,s0
    31ec:	01810513          	addi	a0,sp,24
    31f0:	fffff097          	auipc	ra,0xfffff
    31f4:	e18080e7          	jalr	-488(ra) # 2008 <fatfs_lfn_cache_entry>
    31f8:	02040413          	addi	s0,s0,32
    31fc:	fd441ee3          	bne	s0,s4,31d8 <fatfs_get_file_entry+0xa0>
    3200:	fb5ff06f          	j	31b4 <fatfs_get_file_entry+0x7c>
    3204:	00040513          	mv	a0,s0
    3208:	fffff097          	auipc	ra,0xfffff
    320c:	f1c080e7          	jalr	-228(ra) # 2124 <fatfs_entry_lfn_invalid>
    3210:	00050663          	beqz	a0,321c <fatfs_get_file_entry+0xe4>
    3214:	10010ea3          	sb	zero,285(sp)
    3218:	fe1ff06f          	j	31f8 <fatfs_get_file_entry+0xc0>
    321c:	00040593          	mv	a1,s0
    3220:	01810513          	addi	a0,sp,24
    3224:	fffff097          	auipc	ra,0xfffff
    3228:	f34080e7          	jalr	-204(ra) # 2158 <fatfs_entry_lfn_exists>
    322c:	06050663          	beqz	a0,3298 <fatfs_get_file_entry+0x160>
    3230:	01810513          	addi	a0,sp,24
    3234:	fffff097          	auipc	ra,0xfffff
    3238:	ea0080e7          	jalr	-352(ra) # 20d4 <fatfs_lfn_cache_get>
    323c:	000b8593          	mv	a1,s7
    3240:	fffff097          	auipc	ra,0xfffff
    3244:	6dc080e7          	jalr	1756(ra) # 291c <fatfs_compare_names>
    3248:	fc0506e3          	beqz	a0,3214 <fatfs_get_file_entry+0xdc>
    324c:	02000613          	li	a2,32
    3250:	00040593          	mv	a1,s0
    3254:	000c0513          	mv	a0,s8
    3258:	ffffe097          	auipc	ra,0xffffe
    325c:	078080e7          	jalr	120(ra) # 12d0 <memcpy>
    3260:	00100513          	li	a0,1
    3264:	14c12083          	lw	ra,332(sp)
    3268:	14812403          	lw	s0,328(sp)
    326c:	14412483          	lw	s1,324(sp)
    3270:	14012903          	lw	s2,320(sp)
    3274:	13c12983          	lw	s3,316(sp)
    3278:	13812a03          	lw	s4,312(sp)
    327c:	13412a83          	lw	s5,308(sp)
    3280:	13012b03          	lw	s6,304(sp)
    3284:	12c12b83          	lw	s7,300(sp)
    3288:	12812c03          	lw	s8,296(sp)
    328c:	12412c83          	lw	s9,292(sp)
    3290:	15010113          	addi	sp,sp,336
    3294:	00008067          	ret
    3298:	00040513          	mv	a0,s0
    329c:	fffff097          	auipc	ra,0xfffff
    32a0:	f0c080e7          	jalr	-244(ra) # 21a8 <fatfs_entry_sfn_only>
    32a4:	f4050ae3          	beqz	a0,31f8 <fatfs_get_file_entry+0xc0>
    32a8:	00d00613          	li	a2,13
    32ac:	00000593          	li	a1,0
    32b0:	00090513          	mv	a0,s2
    32b4:	ffffe097          	auipc	ra,0xffffe
    32b8:	000080e7          	jalr	ra # 12b4 <memset>
    32bc:	00000793          	li	a5,0
    32c0:	00f406b3          	add	a3,s0,a5
    32c4:	0006c683          	lbu	a3,0(a3)
    32c8:	00f90733          	add	a4,s2,a5
    32cc:	00178793          	addi	a5,a5,1
    32d0:	00d70023          	sb	a3,0(a4)
    32d4:	ff5796e3          	bne	a5,s5,32c0 <fatfs_get_file_entry+0x188>
    32d8:	00844703          	lbu	a4,8(s0)
    32dc:	00944783          	lbu	a5,9(s0)
    32e0:	00a44683          	lbu	a3,10(s0)
    32e4:	00e108a3          	sb	a4,17(sp)
    32e8:	00f10923          	sb	a5,18(sp)
    32ec:	fe070713          	addi	a4,a4,-32
    32f0:	fe078793          	addi	a5,a5,-32
    32f4:	00f037b3          	snez	a5,a5
    32f8:	00e03733          	snez	a4,a4
    32fc:	00d109a3          	sb	a3,19(sp)
    3300:	00e7e7b3          	or	a5,a5,a4
    3304:	00079863          	bnez	a5,3314 <fatfs_get_file_entry+0x1dc>
    3308:	fe068693          	addi	a3,a3,-32
    330c:	02000793          	li	a5,32
    3310:	00068a63          	beqz	a3,3324 <fatfs_get_file_entry+0x1ec>
    3314:	00814703          	lbu	a4,8(sp)
    3318:	02e00793          	li	a5,46
    331c:	01671463          	bne	a4,s6,3324 <fatfs_get_file_entry+0x1ec>
    3320:	02000793          	li	a5,32
    3324:	00f10823          	sb	a5,16(sp)
    3328:	000b8593          	mv	a1,s7
    332c:	00090513          	mv	a0,s2
    3330:	f11ff06f          	j	3240 <fatfs_get_file_entry+0x108>

00003334 <_open_directory>:
    3334:	eb010113          	addi	sp,sp,-336
    3338:	15212023          	sw	s2,320(sp)
    333c:	0000b937          	lui	s2,0xb
    3340:	fd490913          	addi	s2,s2,-44 # afd4 <_fs>
    3344:	14812423          	sw	s0,328(sp)
    3348:	00892403          	lw	s0,8(s2)
    334c:	14912223          	sw	s1,324(sp)
    3350:	13312e23          	sw	s3,316(sp)
    3354:	13412c23          	sw	s4,312(sp)
    3358:	13512a23          	sw	s5,308(sp)
    335c:	13612823          	sw	s6,304(sp)
    3360:	14112623          	sw	ra,332(sp)
    3364:	00050a13          	mv	s4,a0
    3368:	00058a93          	mv	s5,a1
    336c:	fffff097          	auipc	ra,0xfffff
    3370:	368080e7          	jalr	872(ra) # 26d4 <fatfs_total_path_levels>
    3374:	00050b13          	mv	s6,a0
    3378:	00000493          	li	s1,0
    337c:	fff00993          	li	s3,-1
    3380:	009b5863          	bge	s6,s1,3390 <_open_directory+0x5c>
    3384:	008aa023          	sw	s0,0(s5)
    3388:	00100513          	li	a0,1
    338c:	0240006f          	j	33b0 <_open_directory+0x7c>
    3390:	10400693          	li	a3,260
    3394:	02c10613          	addi	a2,sp,44
    3398:	00048593          	mv	a1,s1
    339c:	000a0513          	mv	a0,s4
    33a0:	fffff097          	auipc	ra,0xfffff
    33a4:	3a4080e7          	jalr	932(ra) # 2744 <fatfs_get_substring>
    33a8:	03351863          	bne	a0,s3,33d8 <_open_directory+0xa4>
    33ac:	00000513          	li	a0,0
    33b0:	14c12083          	lw	ra,332(sp)
    33b4:	14812403          	lw	s0,328(sp)
    33b8:	14412483          	lw	s1,324(sp)
    33bc:	14012903          	lw	s2,320(sp)
    33c0:	13c12983          	lw	s3,316(sp)
    33c4:	13812a03          	lw	s4,312(sp)
    33c8:	13412a83          	lw	s5,308(sp)
    33cc:	13012b03          	lw	s6,304(sp)
    33d0:	15010113          	addi	sp,sp,336
    33d4:	00008067          	ret
    33d8:	00c10693          	addi	a3,sp,12
    33dc:	02c10613          	addi	a2,sp,44
    33e0:	00040593          	mv	a1,s0
    33e4:	00090513          	mv	a0,s2
    33e8:	00000097          	auipc	ra,0x0
    33ec:	d50080e7          	jalr	-688(ra) # 3138 <fatfs_get_file_entry>
    33f0:	fa050ee3          	beqz	a0,33ac <_open_directory+0x78>
    33f4:	01714783          	lbu	a5,23(sp)
    33f8:	0107f793          	andi	a5,a5,16
    33fc:	fa0788e3          	beqz	a5,33ac <_open_directory+0x78>
    3400:	02015403          	lhu	s0,32(sp)
    3404:	02615783          	lhu	a5,38(sp)
    3408:	00148493          	addi	s1,s1,1
    340c:	01041413          	slli	s0,s0,0x10
    3410:	00f40433          	add	s0,s0,a5
    3414:	f6dff06f          	j	3380 <_open_directory+0x4c>

00003418 <fl_opendir>:
    3418:	fe010113          	addi	sp,sp,-32
    341c:	fff00793          	li	a5,-1
    3420:	00f12623          	sw	a5,12(sp)
    3424:	000057b7          	lui	a5,0x5
    3428:	3b47a783          	lw	a5,948(a5) # 53b4 <_filelib_init>
    342c:	00812c23          	sw	s0,24(sp)
    3430:	01212823          	sw	s2,16(sp)
    3434:	00112e23          	sw	ra,28(sp)
    3438:	00912a23          	sw	s1,20(sp)
    343c:	00050913          	mv	s2,a0
    3440:	00058413          	mv	s0,a1
    3444:	00079663          	bnez	a5,3450 <fl_opendir+0x38>
    3448:	fffff097          	auipc	ra,0xfffff
    344c:	a58080e7          	jalr	-1448(ra) # 1ea0 <fl_init>
    3450:	0000b4b7          	lui	s1,0xb
    3454:	fd448493          	addi	s1,s1,-44 # afd4 <_fs>
    3458:	03c4a783          	lw	a5,60(s1)
    345c:	00078463          	beqz	a5,3464 <fl_opendir+0x4c>
    3460:	000780e7          	jalr	a5
    3464:	00090513          	mv	a0,s2
    3468:	fffff097          	auipc	ra,0xfffff
    346c:	26c080e7          	jalr	620(ra) # 26d4 <fatfs_total_path_levels>
    3470:	fff00793          	li	a5,-1
    3474:	02f51063          	bne	a0,a5,3494 <fl_opendir+0x7c>
    3478:	0084a783          	lw	a5,8(s1)
    347c:	00f12623          	sw	a5,12(sp)
    3480:	00c12783          	lw	a5,12(sp)
    3484:	00042023          	sw	zero,0(s0)
    3488:	00040423          	sb	zero,8(s0)
    348c:	00f42223          	sw	a5,4(s0)
    3490:	0180006f          	j	34a8 <fl_opendir+0x90>
    3494:	00c10593          	addi	a1,sp,12
    3498:	00090513          	mv	a0,s2
    349c:	00000097          	auipc	ra,0x0
    34a0:	e98080e7          	jalr	-360(ra) # 3334 <_open_directory>
    34a4:	fc051ee3          	bnez	a0,3480 <fl_opendir+0x68>
    34a8:	0404a783          	lw	a5,64(s1)
    34ac:	00078463          	beqz	a5,34b4 <fl_opendir+0x9c>
    34b0:	000780e7          	jalr	a5
    34b4:	00c12703          	lw	a4,12(sp)
    34b8:	fff00793          	li	a5,-1
    34bc:	00f71463          	bne	a4,a5,34c4 <fl_opendir+0xac>
    34c0:	00000413          	li	s0,0
    34c4:	01c12083          	lw	ra,28(sp)
    34c8:	00040513          	mv	a0,s0
    34cc:	01812403          	lw	s0,24(sp)
    34d0:	01412483          	lw	s1,20(sp)
    34d4:	01012903          	lw	s2,16(sp)
    34d8:	02010113          	addi	sp,sp,32
    34dc:	00008067          	ret

000034e0 <_open_file>:
    34e0:	fc010113          	addi	sp,sp,-64
    34e4:	03312623          	sw	s3,44(sp)
    34e8:	02112e23          	sw	ra,60(sp)
    34ec:	02812c23          	sw	s0,56(sp)
    34f0:	02912a23          	sw	s1,52(sp)
    34f4:	03212823          	sw	s2,48(sp)
    34f8:	00050993          	mv	s3,a0
    34fc:	ffffe097          	auipc	ra,0xffffe
    3500:	7b4080e7          	jalr	1972(ra) # 1cb0 <_allocate_file>
    3504:	06050463          	beqz	a0,356c <_open_file+0x8c>
    3508:	01450913          	addi	s2,a0,20
    350c:	00050413          	mv	s0,a0
    3510:	10400613          	li	a2,260
    3514:	00000593          	li	a1,0
    3518:	00090513          	mv	a0,s2
    351c:	ffffe097          	auipc	ra,0xffffe
    3520:	d98080e7          	jalr	-616(ra) # 12b4 <memset>
    3524:	11840493          	addi	s1,s0,280
    3528:	10400613          	li	a2,260
    352c:	00000593          	li	a1,0
    3530:	00048513          	mv	a0,s1
    3534:	ffffe097          	auipc	ra,0xffffe
    3538:	d80080e7          	jalr	-640(ra) # 12b4 <memset>
    353c:	10400713          	li	a4,260
    3540:	00048693          	mv	a3,s1
    3544:	00070613          	mv	a2,a4
    3548:	00090593          	mv	a1,s2
    354c:	00098513          	mv	a0,s3
    3550:	fffff097          	auipc	ra,0xfffff
    3554:	2dc080e7          	jalr	732(ra) # 282c <fatfs_split_path>
    3558:	fff00793          	li	a5,-1
    355c:	02f51a63          	bne	a0,a5,3590 <_open_file+0xb0>
    3560:	00040513          	mv	a0,s0
    3564:	ffffe097          	auipc	ra,0xffffe
    3568:	7c4080e7          	jalr	1988(ra) # 1d28 <_free_file>
    356c:	00000413          	li	s0,0
    3570:	03c12083          	lw	ra,60(sp)
    3574:	00040513          	mv	a0,s0
    3578:	03812403          	lw	s0,56(sp)
    357c:	03412483          	lw	s1,52(sp)
    3580:	03012903          	lw	s2,48(sp)
    3584:	02c12983          	lw	s3,44(sp)
    3588:	04010113          	addi	sp,sp,64
    358c:	00008067          	ret
    3590:	00040513          	mv	a0,s0
    3594:	fffff097          	auipc	ra,0xfffff
    3598:	514080e7          	jalr	1300(ra) # 2aa8 <_check_file_open>
    359c:	fc0512e3          	bnez	a0,3560 <_open_file+0x80>
    35a0:	01444783          	lbu	a5,20(s0)
    35a4:	08079c63          	bnez	a5,363c <_open_file+0x15c>
    35a8:	0000b7b7          	lui	a5,0xb
    35ac:	fdc7a783          	lw	a5,-36(a5) # afdc <_fs+0x8>
    35b0:	00f42023          	sw	a5,0(s0)
    35b4:	00042583          	lw	a1,0(s0)
    35b8:	00048613          	mv	a2,s1
    35bc:	0000b4b7          	lui	s1,0xb
    35c0:	00010693          	mv	a3,sp
    35c4:	fd448513          	addi	a0,s1,-44 # afd4 <_fs>
    35c8:	00000097          	auipc	ra,0x0
    35cc:	b70080e7          	jalr	-1168(ra) # 3138 <fatfs_get_file_entry>
    35d0:	f80508e3          	beqz	a0,3560 <_open_file+0x80>
    35d4:	00b14783          	lbu	a5,11(sp)
    35d8:	0207f793          	andi	a5,a5,32
    35dc:	f80782e3          	beqz	a5,3560 <_open_file+0x80>
    35e0:	00b00613          	li	a2,11
    35e4:	00010593          	mv	a1,sp
    35e8:	21c40513          	addi	a0,s0,540
    35ec:	ffffe097          	auipc	ra,0xffffe
    35f0:	ce4080e7          	jalr	-796(ra) # 12d0 <memcpy>
    35f4:	01c12783          	lw	a5,28(sp)
    35f8:	01a15703          	lhu	a4,26(sp)
    35fc:	00042423          	sw	zero,8(s0)
    3600:	00f42623          	sw	a5,12(s0)
    3604:	01415783          	lhu	a5,20(sp)
    3608:	42042a23          	sw	zero,1076(s0)
    360c:	00042823          	sw	zero,16(s0)
    3610:	01079793          	slli	a5,a5,0x10
    3614:	00e787b3          	add	a5,a5,a4
    3618:	00f42223          	sw	a5,4(s0)
    361c:	fff00793          	li	a5,-1
    3620:	42f42823          	sw	a5,1072(s0)
    3624:	22f42423          	sw	a5,552(s0)
    3628:	22f42623          	sw	a5,556(s0)
    362c:	fd448513          	addi	a0,s1,-44
    3630:	00000097          	auipc	ra,0x0
    3634:	858080e7          	jalr	-1960(ra) # 2e88 <fatfs_fat_purge>
    3638:	f39ff06f          	j	3570 <_open_file+0x90>
    363c:	00040593          	mv	a1,s0
    3640:	00090513          	mv	a0,s2
    3644:	00000097          	auipc	ra,0x0
    3648:	cf0080e7          	jalr	-784(ra) # 3334 <_open_directory>
    364c:	f60514e3          	bnez	a0,35b4 <_open_file+0xd4>
    3650:	f11ff06f          	j	3560 <_open_file+0x80>

00003654 <fatfs_sfn_exists>:
    3654:	fe010113          	addi	sp,sp,-32
    3658:	01212823          	sw	s2,16(sp)
    365c:	01312623          	sw	s3,12(sp)
    3660:	01412423          	sw	s4,8(sp)
    3664:	01512223          	sw	s5,4(sp)
    3668:	01612023          	sw	s6,0(sp)
    366c:	00112e23          	sw	ra,28(sp)
    3670:	00812c23          	sw	s0,24(sp)
    3674:	00912a23          	sw	s1,20(sp)
    3678:	00050993          	mv	s3,a0
    367c:	00058a93          	mv	s5,a1
    3680:	00060b13          	mv	s6,a2
    3684:	00000913          	li	s2,0
    3688:	24450a13          	addi	s4,a0,580
    368c:	00000693          	li	a3,0
    3690:	00090613          	mv	a2,s2
    3694:	000a8593          	mv	a1,s5
    3698:	00098513          	mv	a0,s3
    369c:	00000097          	auipc	ra,0x0
    36a0:	94c080e7          	jalr	-1716(ra) # 2fe8 <fatfs_sector_reader>
    36a4:	00050413          	mv	s0,a0
    36a8:	06050263          	beqz	a0,370c <fatfs_sfn_exists+0xb8>
    36ac:	00190913          	addi	s2,s2,1
    36b0:	04498493          	addi	s1,s3,68
    36b4:	00048513          	mv	a0,s1
    36b8:	fffff097          	auipc	ra,0xfffff
    36bc:	a58080e7          	jalr	-1448(ra) # 2110 <fatfs_entry_lfn_text>
    36c0:	00050863          	beqz	a0,36d0 <fatfs_sfn_exists+0x7c>
    36c4:	02048493          	addi	s1,s1,32
    36c8:	ff4496e3          	bne	s1,s4,36b4 <fatfs_sfn_exists+0x60>
    36cc:	fc1ff06f          	j	368c <fatfs_sfn_exists+0x38>
    36d0:	00048513          	mv	a0,s1
    36d4:	fffff097          	auipc	ra,0xfffff
    36d8:	a50080e7          	jalr	-1456(ra) # 2124 <fatfs_entry_lfn_invalid>
    36dc:	fe0514e3          	bnez	a0,36c4 <fatfs_sfn_exists+0x70>
    36e0:	00048513          	mv	a0,s1
    36e4:	fffff097          	auipc	ra,0xfffff
    36e8:	ac4080e7          	jalr	-1340(ra) # 21a8 <fatfs_entry_sfn_only>
    36ec:	00050413          	mv	s0,a0
    36f0:	fc050ae3          	beqz	a0,36c4 <fatfs_sfn_exists+0x70>
    36f4:	00b00613          	li	a2,11
    36f8:	000b0593          	mv	a1,s6
    36fc:	00048513          	mv	a0,s1
    3700:	ffffe097          	auipc	ra,0xffffe
    3704:	c14080e7          	jalr	-1004(ra) # 1314 <strncmp>
    3708:	fa051ee3          	bnez	a0,36c4 <fatfs_sfn_exists+0x70>
    370c:	01c12083          	lw	ra,28(sp)
    3710:	00040513          	mv	a0,s0
    3714:	01812403          	lw	s0,24(sp)
    3718:	01412483          	lw	s1,20(sp)
    371c:	01012903          	lw	s2,16(sp)
    3720:	00c12983          	lw	s3,12(sp)
    3724:	00812a03          	lw	s4,8(sp)
    3728:	00412a83          	lw	s5,4(sp)
    372c:	00012b03          	lw	s6,0(sp)
    3730:	02010113          	addi	sp,sp,32
    3734:	00008067          	ret

00003738 <fatfs_update_file_length>:
    3738:	03852783          	lw	a5,56(a0)
    373c:	14078e63          	beqz	a5,3898 <fatfs_update_file_length+0x160>
    3740:	fd010113          	addi	sp,sp,-48
    3744:	02912223          	sw	s1,36(sp)
    3748:	03212023          	sw	s2,32(sp)
    374c:	01312e23          	sw	s3,28(sp)
    3750:	01412c23          	sw	s4,24(sp)
    3754:	01612823          	sw	s6,16(sp)
    3758:	01712623          	sw	s7,12(sp)
    375c:	02112623          	sw	ra,44(sp)
    3760:	02812423          	sw	s0,40(sp)
    3764:	01512a23          	sw	s5,20(sp)
    3768:	00068913          	mv	s2,a3
    376c:	00060b93          	mv	s7,a2
    3770:	00058b13          	mv	s6,a1
    3774:	00050493          	mv	s1,a0
    3778:	00000993          	li	s3,0
    377c:	24450a13          	addi	s4,a0,580
    3780:	00000693          	li	a3,0
    3784:	00098613          	mv	a2,s3
    3788:	000b0593          	mv	a1,s6
    378c:	00048513          	mv	a0,s1
    3790:	00000097          	auipc	ra,0x0
    3794:	858080e7          	jalr	-1960(ra) # 2fe8 <fatfs_sector_reader>
    3798:	0c050863          	beqz	a0,3868 <fatfs_update_file_length+0x130>
    379c:	04448413          	addi	s0,s1,68
    37a0:	00198993          	addi	s3,s3,1
    37a4:	00040a93          	mv	s5,s0
    37a8:	00040513          	mv	a0,s0
    37ac:	fffff097          	auipc	ra,0xfffff
    37b0:	964080e7          	jalr	-1692(ra) # 2110 <fatfs_entry_lfn_text>
    37b4:	0a051463          	bnez	a0,385c <fatfs_update_file_length+0x124>
    37b8:	00040513          	mv	a0,s0
    37bc:	fffff097          	auipc	ra,0xfffff
    37c0:	968080e7          	jalr	-1688(ra) # 2124 <fatfs_entry_lfn_invalid>
    37c4:	08051c63          	bnez	a0,385c <fatfs_update_file_length+0x124>
    37c8:	00040513          	mv	a0,s0
    37cc:	fffff097          	auipc	ra,0xfffff
    37d0:	9dc080e7          	jalr	-1572(ra) # 21a8 <fatfs_entry_sfn_only>
    37d4:	08050463          	beqz	a0,385c <fatfs_update_file_length+0x124>
    37d8:	00b00613          	li	a2,11
    37dc:	000b8593          	mv	a1,s7
    37e0:	00040513          	mv	a0,s0
    37e4:	ffffe097          	auipc	ra,0xffffe
    37e8:	b30080e7          	jalr	-1232(ra) # 1314 <strncmp>
    37ec:	06051863          	bnez	a0,385c <fatfs_update_file_length+0x124>
    37f0:	00895793          	srli	a5,s2,0x8
    37f4:	01240e23          	sb	s2,28(s0)
    37f8:	00f40ea3          	sb	a5,29(s0)
    37fc:	01095793          	srli	a5,s2,0x10
    3800:	01895913          	srli	s2,s2,0x18
    3804:	00f40f23          	sb	a5,30(s0)
    3808:	01240fa3          	sb	s2,31(s0)
    380c:	00040593          	mv	a1,s0
    3810:	02000613          	li	a2,32
    3814:	00040513          	mv	a0,s0
    3818:	ffffe097          	auipc	ra,0xffffe
    381c:	ab8080e7          	jalr	-1352(ra) # 12d0 <memcpy>
    3820:	02812403          	lw	s0,40(sp)
    3824:	0384a783          	lw	a5,56(s1)
    3828:	2444a503          	lw	a0,580(s1)
    382c:	02c12083          	lw	ra,44(sp)
    3830:	02412483          	lw	s1,36(sp)
    3834:	02012903          	lw	s2,32(sp)
    3838:	01c12983          	lw	s3,28(sp)
    383c:	01812a03          	lw	s4,24(sp)
    3840:	01012b03          	lw	s6,16(sp)
    3844:	00c12b83          	lw	s7,12(sp)
    3848:	000a8593          	mv	a1,s5
    384c:	01412a83          	lw	s5,20(sp)
    3850:	00100613          	li	a2,1
    3854:	03010113          	addi	sp,sp,48
    3858:	00078067          	jr	a5
    385c:	02040413          	addi	s0,s0,32
    3860:	f54414e3          	bne	s0,s4,37a8 <fatfs_update_file_length+0x70>
    3864:	f1dff06f          	j	3780 <fatfs_update_file_length+0x48>
    3868:	02c12083          	lw	ra,44(sp)
    386c:	02812403          	lw	s0,40(sp)
    3870:	02412483          	lw	s1,36(sp)
    3874:	02012903          	lw	s2,32(sp)
    3878:	01c12983          	lw	s3,28(sp)
    387c:	01812a03          	lw	s4,24(sp)
    3880:	01412a83          	lw	s5,20(sp)
    3884:	01012b03          	lw	s6,16(sp)
    3888:	00c12b83          	lw	s7,12(sp)
    388c:	00000513          	li	a0,0
    3890:	03010113          	addi	sp,sp,48
    3894:	00008067          	ret
    3898:	00000513          	li	a0,0
    389c:	00008067          	ret

000038a0 <fatfs_list_directory_next>:
    38a0:	ec010113          	addi	sp,sp,-320
    38a4:	13212823          	sw	s2,304(sp)
    38a8:	13312623          	sw	s3,300(sp)
    38ac:	13412423          	sw	s4,296(sp)
    38b0:	13512223          	sw	s5,292(sp)
    38b4:	13612023          	sw	s6,288(sp)
    38b8:	12112e23          	sw	ra,316(sp)
    38bc:	12812c23          	sw	s0,312(sp)
    38c0:	12912a23          	sw	s1,308(sp)
    38c4:	00050a13          	mv	s4,a0
    38c8:	00058913          	mv	s2,a1
    38cc:	00060993          	mv	s3,a2
    38d0:	10010ea3          	sb	zero,285(sp)
    38d4:	04450a93          	addi	s5,a0,68
    38d8:	00f00b13          	li	s6,15
    38dc:	00092603          	lw	a2,0(s2)
    38e0:	00492583          	lw	a1,4(s2)
    38e4:	00000693          	li	a3,0
    38e8:	000a0513          	mv	a0,s4
    38ec:	fffff097          	auipc	ra,0xfffff
    38f0:	6fc080e7          	jalr	1788(ra) # 2fe8 <fatfs_sector_reader>
    38f4:	10050c63          	beqz	a0,3a0c <fatfs_list_directory_next+0x16c>
    38f8:	00894483          	lbu	s1,8(s2)
    38fc:	00549413          	slli	s0,s1,0x5
    3900:	008a8433          	add	s0,s5,s0
    3904:	009b7c63          	bgeu	s6,s1,391c <fatfs_list_directory_next+0x7c>
    3908:	00092783          	lw	a5,0(s2)
    390c:	00090423          	sb	zero,8(s2)
    3910:	00178793          	addi	a5,a5,1
    3914:	00f92023          	sw	a5,0(s2)
    3918:	fc5ff06f          	j	38dc <fatfs_list_directory_next+0x3c>
    391c:	00040513          	mv	a0,s0
    3920:	ffffe097          	auipc	ra,0xffffe
    3924:	7f0080e7          	jalr	2032(ra) # 2110 <fatfs_entry_lfn_text>
    3928:	02050263          	beqz	a0,394c <fatfs_list_directory_next+0xac>
    392c:	00040593          	mv	a1,s0
    3930:	01810513          	addi	a0,sp,24
    3934:	ffffe097          	auipc	ra,0xffffe
    3938:	6d4080e7          	jalr	1748(ra) # 2008 <fatfs_lfn_cache_entry>
    393c:	00148493          	addi	s1,s1,1
    3940:	0ff4f493          	zext.b	s1,s1
    3944:	02040413          	addi	s0,s0,32
    3948:	fbdff06f          	j	3904 <fatfs_list_directory_next+0x64>
    394c:	00040513          	mv	a0,s0
    3950:	ffffe097          	auipc	ra,0xffffe
    3954:	7d4080e7          	jalr	2004(ra) # 2124 <fatfs_entry_lfn_invalid>
    3958:	00050663          	beqz	a0,3964 <fatfs_list_directory_next+0xc4>
    395c:	10010ea3          	sb	zero,285(sp)
    3960:	fddff06f          	j	393c <fatfs_list_directory_next+0x9c>
    3964:	00040593          	mv	a1,s0
    3968:	01810513          	addi	a0,sp,24
    396c:	ffffe097          	auipc	ra,0xffffe
    3970:	7ec080e7          	jalr	2028(ra) # 2158 <fatfs_entry_lfn_exists>
    3974:	0c050063          	beqz	a0,3a34 <fatfs_list_directory_next+0x194>
    3978:	01810513          	addi	a0,sp,24
    397c:	ffffe097          	auipc	ra,0xffffe
    3980:	758080e7          	jalr	1880(ra) # 20d4 <fatfs_lfn_cache_get>
    3984:	00050593          	mv	a1,a0
    3988:	10300613          	li	a2,259
    398c:	00098513          	mv	a0,s3
    3990:	ffffe097          	auipc	ra,0xffffe
    3994:	9c4080e7          	jalr	-1596(ra) # 1354 <strncpy>
    3998:	00040513          	mv	a0,s0
    399c:	fffff097          	auipc	ra,0xfffff
    39a0:	84c080e7          	jalr	-1972(ra) # 21e8 <fatfs_entry_is_dir>
    39a4:	10a98223          	sb	a0,260(s3)
    39a8:	01d44783          	lbu	a5,29(s0)
    39ac:	01c44703          	lbu	a4,28(s0)
    39b0:	00148493          	addi	s1,s1,1
    39b4:	00879793          	slli	a5,a5,0x8
    39b8:	00e7e7b3          	or	a5,a5,a4
    39bc:	01e44703          	lbu	a4,30(s0)
    39c0:	00100513          	li	a0,1
    39c4:	01071713          	slli	a4,a4,0x10
    39c8:	00f76733          	or	a4,a4,a5
    39cc:	01f44783          	lbu	a5,31(s0)
    39d0:	01879793          	slli	a5,a5,0x18
    39d4:	00e7e7b3          	or	a5,a5,a4
    39d8:	10f9a623          	sw	a5,268(s3)
    39dc:	01544783          	lbu	a5,21(s0)
    39e0:	01444703          	lbu	a4,20(s0)
    39e4:	01a44683          	lbu	a3,26(s0)
    39e8:	00879793          	slli	a5,a5,0x8
    39ec:	00e7e7b3          	or	a5,a5,a4
    39f0:	01b44703          	lbu	a4,27(s0)
    39f4:	01079793          	slli	a5,a5,0x10
    39f8:	00871713          	slli	a4,a4,0x8
    39fc:	00d76733          	or	a4,a4,a3
    3a00:	00e7e7b3          	or	a5,a5,a4
    3a04:	10f9a423          	sw	a5,264(s3)
    3a08:	00990423          	sb	s1,8(s2)
    3a0c:	13c12083          	lw	ra,316(sp)
    3a10:	13812403          	lw	s0,312(sp)
    3a14:	13412483          	lw	s1,308(sp)
    3a18:	13012903          	lw	s2,304(sp)
    3a1c:	12c12983          	lw	s3,300(sp)
    3a20:	12812a03          	lw	s4,296(sp)
    3a24:	12412a83          	lw	s5,292(sp)
    3a28:	12012b03          	lw	s6,288(sp)
    3a2c:	14010113          	addi	sp,sp,320
    3a30:	00008067          	ret
    3a34:	00040513          	mv	a0,s0
    3a38:	ffffe097          	auipc	ra,0xffffe
    3a3c:	770080e7          	jalr	1904(ra) # 21a8 <fatfs_entry_sfn_only>
    3a40:	ee050ee3          	beqz	a0,393c <fatfs_list_directory_next+0x9c>
    3a44:	00810a13          	addi	s4,sp,8
    3a48:	00d00613          	li	a2,13
    3a4c:	00000593          	li	a1,0
    3a50:	000a0513          	mv	a0,s4
    3a54:	10010ea3          	sb	zero,285(sp)
    3a58:	ffffe097          	auipc	ra,0xffffe
    3a5c:	85c080e7          	jalr	-1956(ra) # 12b4 <memset>
    3a60:	00000793          	li	a5,0
    3a64:	00800713          	li	a4,8
    3a68:	00f40633          	add	a2,s0,a5
    3a6c:	00064603          	lbu	a2,0(a2)
    3a70:	00fa06b3          	add	a3,s4,a5
    3a74:	00178793          	addi	a5,a5,1
    3a78:	00c68023          	sb	a2,0(a3)
    3a7c:	fee796e3          	bne	a5,a4,3a68 <fatfs_list_directory_next+0x1c8>
    3a80:	00844783          	lbu	a5,8(s0)
    3a84:	00944703          	lbu	a4,9(s0)
    3a88:	00a44683          	lbu	a3,10(s0)
    3a8c:	00f108a3          	sb	a5,17(sp)
    3a90:	00e10923          	sb	a4,18(sp)
    3a94:	fe078793          	addi	a5,a5,-32
    3a98:	fe070713          	addi	a4,a4,-32
    3a9c:	00f037b3          	snez	a5,a5
    3aa0:	00e03733          	snez	a4,a4
    3aa4:	00d109a3          	sb	a3,19(sp)
    3aa8:	00e7e7b3          	or	a5,a5,a4
    3aac:	00079863          	bnez	a5,3abc <fatfs_list_directory_next+0x21c>
    3ab0:	fe068693          	addi	a3,a3,-32
    3ab4:	02000793          	li	a5,32
    3ab8:	00068a63          	beqz	a3,3acc <fatfs_list_directory_next+0x22c>
    3abc:	00814703          	lbu	a4,8(sp)
    3ac0:	02e00793          	li	a5,46
    3ac4:	00f71463          	bne	a4,a5,3acc <fatfs_list_directory_next+0x22c>
    3ac8:	02000793          	li	a5,32
    3acc:	000a0593          	mv	a1,s4
    3ad0:	00098513          	mv	a0,s3
    3ad4:	00f10823          	sb	a5,16(sp)
    3ad8:	fffff097          	auipc	ra,0xfffff
    3adc:	054080e7          	jalr	84(ra) # 2b2c <fatfs_get_sfn_display_name>
    3ae0:	eb9ff06f          	j	3998 <fatfs_list_directory_next+0xf8>

00003ae4 <fl_readdir>:
    3ae4:	000057b7          	lui	a5,0x5
    3ae8:	3b47a783          	lw	a5,948(a5) # 53b4 <_filelib_init>
    3aec:	fd010113          	addi	sp,sp,-48
    3af0:	03212023          	sw	s2,32(sp)
    3af4:	01312e23          	sw	s3,28(sp)
    3af8:	02112623          	sw	ra,44(sp)
    3afc:	02812423          	sw	s0,40(sp)
    3b00:	02912223          	sw	s1,36(sp)
    3b04:	00050913          	mv	s2,a0
    3b08:	00058993          	mv	s3,a1
    3b0c:	00079663          	bnez	a5,3b18 <fl_readdir+0x34>
    3b10:	ffffe097          	auipc	ra,0xffffe
    3b14:	390080e7          	jalr	912(ra) # 1ea0 <fl_init>
    3b18:	0000b4b7          	lui	s1,0xb
    3b1c:	fd448413          	addi	s0,s1,-44 # afd4 <_fs>
    3b20:	03c42783          	lw	a5,60(s0)
    3b24:	00078463          	beqz	a5,3b2c <fl_readdir+0x48>
    3b28:	000780e7          	jalr	a5
    3b2c:	00098613          	mv	a2,s3
    3b30:	00090593          	mv	a1,s2
    3b34:	fd448513          	addi	a0,s1,-44
    3b38:	00000097          	auipc	ra,0x0
    3b3c:	d68080e7          	jalr	-664(ra) # 38a0 <fatfs_list_directory_next>
    3b40:	04042783          	lw	a5,64(s0)
    3b44:	00078863          	beqz	a5,3b54 <fl_readdir+0x70>
    3b48:	00a12623          	sw	a0,12(sp)
    3b4c:	000780e7          	jalr	a5
    3b50:	00c12503          	lw	a0,12(sp)
    3b54:	02c12083          	lw	ra,44(sp)
    3b58:	02812403          	lw	s0,40(sp)
    3b5c:	00154513          	xori	a0,a0,1
    3b60:	02412483          	lw	s1,36(sp)
    3b64:	02012903          	lw	s2,32(sp)
    3b68:	01c12983          	lw	s3,28(sp)
    3b6c:	40a00533          	neg	a0,a0
    3b70:	03010113          	addi	sp,sp,48
    3b74:	00008067          	ret

00003b78 <_read_sectors>:
    3b78:	fd010113          	addi	sp,sp,-48
    3b7c:	01512a23          	sw	s5,20(sp)
    3b80:	0000bab7          	lui	s5,0xb
    3b84:	01312e23          	sw	s3,28(sp)
    3b88:	fd4ac983          	lbu	s3,-44(s5) # afd4 <_fs>
    3b8c:	01612823          	sw	s6,16(sp)
    3b90:	00058b13          	mv	s6,a1
    3b94:	02912223          	sw	s1,36(sp)
    3b98:	00098593          	mv	a1,s3
    3b9c:	00050493          	mv	s1,a0
    3ba0:	000b0513          	mv	a0,s6
    3ba4:	02112623          	sw	ra,44(sp)
    3ba8:	02812423          	sw	s0,40(sp)
    3bac:	01412c23          	sw	s4,24(sp)
    3bb0:	00068413          	mv	s0,a3
    3bb4:	01712623          	sw	s7,12(sp)
    3bb8:	01812423          	sw	s8,8(sp)
    3bbc:	03212023          	sw	s2,32(sp)
    3bc0:	00060c13          	mv	s8,a2
    3bc4:	ffffd097          	auipc	ra,0xffffd
    3bc8:	644080e7          	jalr	1604(ra) # 1208 <__udivsi3>
    3bcc:	00050a13          	mv	s4,a0
    3bd0:	00098593          	mv	a1,s3
    3bd4:	000b0513          	mv	a0,s6
    3bd8:	ffffd097          	auipc	ra,0xffffd
    3bdc:	678080e7          	jalr	1656(ra) # 1250 <__umodsi3>
    3be0:	00a407b3          	add	a5,s0,a0
    3be4:	00050b93          	mv	s7,a0
    3be8:	00f9fe63          	bgeu	s3,a5,3c04 <_read_sectors+0x8c>
    3bec:	000a0593          	mv	a1,s4
    3bf0:	00098513          	mv	a0,s3
    3bf4:	ffffe097          	auipc	ra,0xffffe
    3bf8:	e18080e7          	jalr	-488(ra) # 1a0c <__mulsi3>
    3bfc:	416987b3          	sub	a5,s3,s6
    3c00:	00f50433          	add	s0,a0,a5
    3c04:	2284a903          	lw	s2,552(s1)
    3c08:	07491863          	bne	s2,s4,3c78 <_read_sectors+0x100>
    3c0c:	22c4a583          	lw	a1,556(s1)
    3c10:	fff00793          	li	a5,-1
    3c14:	02f58663          	beq	a1,a5,3c40 <_read_sectors+0xc8>
    3c18:	fd4a8513          	addi	a0,s5,-44
    3c1c:	ffffe097          	auipc	ra,0xffffe
    3c20:	154080e7          	jalr	340(ra) # 1d70 <fatfs_lba_of_cluster>
    3c24:	017505b3          	add	a1,a0,s7
    3c28:	00040693          	mv	a3,s0
    3c2c:	000c0613          	mv	a2,s8
    3c30:	fd4a8513          	addi	a0,s5,-44
    3c34:	ffffe097          	auipc	ra,0xffffe
    3c38:	188080e7          	jalr	392(ra) # 1dbc <fatfs_sector_read>
    3c3c:	00051463          	bnez	a0,3c44 <_read_sectors+0xcc>
    3c40:	00000413          	li	s0,0
    3c44:	02c12083          	lw	ra,44(sp)
    3c48:	00040513          	mv	a0,s0
    3c4c:	02812403          	lw	s0,40(sp)
    3c50:	02412483          	lw	s1,36(sp)
    3c54:	02012903          	lw	s2,32(sp)
    3c58:	01c12983          	lw	s3,28(sp)
    3c5c:	01812a03          	lw	s4,24(sp)
    3c60:	01412a83          	lw	s5,20(sp)
    3c64:	01012b03          	lw	s6,16(sp)
    3c68:	00c12b83          	lw	s7,12(sp)
    3c6c:	00812c03          	lw	s8,8(sp)
    3c70:	03010113          	addi	sp,sp,48
    3c74:	00008067          	ret
    3c78:	033b6463          	bltu	s6,s3,3ca0 <_read_sectors+0x128>
    3c7c:	00190793          	addi	a5,s2,1
    3c80:	03479063          	bne	a5,s4,3ca0 <_read_sectors+0x128>
    3c84:	22c4a583          	lw	a1,556(s1)
    3c88:	03496263          	bltu	s2,s4,3cac <_read_sectors+0x134>
    3c8c:	fff00793          	li	a5,-1
    3c90:	faf588e3          	beq	a1,a5,3c40 <_read_sectors+0xc8>
    3c94:	22b4a623          	sw	a1,556(s1)
    3c98:	2344a423          	sw	s4,552(s1)
    3c9c:	f7dff06f          	j	3c18 <_read_sectors+0xa0>
    3ca0:	0044a583          	lw	a1,4(s1)
    3ca4:	00000913          	li	s2,0
    3ca8:	fe1ff06f          	j	3c88 <_read_sectors+0x110>
    3cac:	fd4a8513          	addi	a0,s5,-44
    3cb0:	fffff097          	auipc	ra,0xfffff
    3cb4:	230080e7          	jalr	560(ra) # 2ee0 <fatfs_find_next_cluster>
    3cb8:	00050593          	mv	a1,a0
    3cbc:	00190913          	addi	s2,s2,1
    3cc0:	fc9ff06f          	j	3c88 <_read_sectors+0x110>

00003cc4 <fatfs_set_fs_info_next_free_cluster>:
    3cc4:	03052783          	lw	a5,48(a0)
    3cc8:	0a078463          	beqz	a5,3d70 <fatfs_set_fs_info_next_free_cluster+0xac>
    3ccc:	fe010113          	addi	sp,sp,-32
    3cd0:	01c52783          	lw	a5,28(a0)
    3cd4:	00912a23          	sw	s1,20(sp)
    3cd8:	00058493          	mv	s1,a1
    3cdc:	01855583          	lhu	a1,24(a0)
    3ce0:	00812c23          	sw	s0,24(sp)
    3ce4:	00112e23          	sw	ra,28(sp)
    3ce8:	00f585b3          	add	a1,a1,a5
    3cec:	00050413          	mv	s0,a0
    3cf0:	ffffe097          	auipc	ra,0xffffe
    3cf4:	ed4080e7          	jalr	-300(ra) # 1bc4 <fatfs_fat_read_sector>
    3cf8:	00050593          	mv	a1,a0
    3cfc:	06050063          	beqz	a0,3d5c <fatfs_set_fs_info_next_free_cluster+0x98>
    3d00:	20852783          	lw	a5,520(a0)
    3d04:	0084d713          	srli	a4,s1,0x8
    3d08:	00100613          	li	a2,1
    3d0c:	1e978623          	sb	s1,492(a5)
    3d10:	20852783          	lw	a5,520(a0)
    3d14:	1ee786a3          	sb	a4,493(a5)
    3d18:	20852783          	lw	a5,520(a0)
    3d1c:	0104d713          	srli	a4,s1,0x10
    3d20:	1ee78723          	sb	a4,494(a5)
    3d24:	20852783          	lw	a5,520(a0)
    3d28:	0184d713          	srli	a4,s1,0x18
    3d2c:	1ee787a3          	sb	a4,495(a5)
    3d30:	03842783          	lw	a5,56(s0)
    3d34:	20c52223          	sw	a2,516(a0)
    3d38:	02942223          	sw	s1,36(s0)
    3d3c:	00078a63          	beqz	a5,3d50 <fatfs_set_fs_info_next_free_cluster+0x8c>
    3d40:	20052503          	lw	a0,512(a0)
    3d44:	00b12623          	sw	a1,12(sp)
    3d48:	000780e7          	jalr	a5
    3d4c:	00c12583          	lw	a1,12(sp)
    3d50:	fff00793          	li	a5,-1
    3d54:	20f5a023          	sw	a5,512(a1)
    3d58:	2005a223          	sw	zero,516(a1)
    3d5c:	01c12083          	lw	ra,28(sp)
    3d60:	01812403          	lw	s0,24(sp)
    3d64:	01412483          	lw	s1,20(sp)
    3d68:	02010113          	addi	sp,sp,32
    3d6c:	00008067          	ret
    3d70:	00008067          	ret

00003d74 <fatfs_find_blank_cluster>:
    3d74:	fd010113          	addi	sp,sp,-48
    3d78:	01312e23          	sw	s3,28(sp)
    3d7c:	100009b7          	lui	s3,0x10000
    3d80:	02912223          	sw	s1,36(sp)
    3d84:	03212023          	sw	s2,32(sp)
    3d88:	02112623          	sw	ra,44(sp)
    3d8c:	02812423          	sw	s0,40(sp)
    3d90:	00050913          	mv	s2,a0
    3d94:	00058493          	mv	s1,a1
    3d98:	fff98993          	addi	s3,s3,-1 # fffffff <__stacktop+0xffeffff>
    3d9c:	03092783          	lw	a5,48(s2)
    3da0:	0074d413          	srli	s0,s1,0x7
    3da4:	00079463          	bnez	a5,3dac <fatfs_find_blank_cluster+0x38>
    3da8:	0084d413          	srli	s0,s1,0x8
    3dac:	02092783          	lw	a5,32(s2)
    3db0:	0cf47863          	bgeu	s0,a5,3e80 <fatfs_find_blank_cluster+0x10c>
    3db4:	01492583          	lw	a1,20(s2)
    3db8:	00090513          	mv	a0,s2
    3dbc:	00c12623          	sw	a2,12(sp)
    3dc0:	00b405b3          	add	a1,s0,a1
    3dc4:	ffffe097          	auipc	ra,0xffffe
    3dc8:	e00080e7          	jalr	-512(ra) # 1bc4 <fatfs_fat_read_sector>
    3dcc:	0a050a63          	beqz	a0,3e80 <fatfs_find_blank_cluster+0x10c>
    3dd0:	03092783          	lw	a5,48(s2)
    3dd4:	20852703          	lw	a4,520(a0)
    3dd8:	00c12603          	lw	a2,12(sp)
    3ddc:	04079a63          	bnez	a5,3e30 <fatfs_find_blank_cluster+0xbc>
    3de0:	00841413          	slli	s0,s0,0x8
    3de4:	40848433          	sub	s0,s1,s0
    3de8:	00141413          	slli	s0,s0,0x1
    3dec:	01041413          	slli	s0,s0,0x10
    3df0:	01045413          	srli	s0,s0,0x10
    3df4:	00870733          	add	a4,a4,s0
    3df8:	00174783          	lbu	a5,1(a4)
    3dfc:	00074703          	lbu	a4,0(a4)
    3e00:	00879793          	slli	a5,a5,0x8
    3e04:	00e787b3          	add	a5,a5,a4
    3e08:	06079863          	bnez	a5,3e78 <fatfs_find_blank_cluster+0x104>
    3e0c:	00962023          	sw	s1,0(a2)
    3e10:	00100513          	li	a0,1
    3e14:	02c12083          	lw	ra,44(sp)
    3e18:	02812403          	lw	s0,40(sp)
    3e1c:	02412483          	lw	s1,36(sp)
    3e20:	02012903          	lw	s2,32(sp)
    3e24:	01c12983          	lw	s3,28(sp)
    3e28:	03010113          	addi	sp,sp,48
    3e2c:	00008067          	ret
    3e30:	00741413          	slli	s0,s0,0x7
    3e34:	40848433          	sub	s0,s1,s0
    3e38:	00241413          	slli	s0,s0,0x2
    3e3c:	01041413          	slli	s0,s0,0x10
    3e40:	01045413          	srli	s0,s0,0x10
    3e44:	00870733          	add	a4,a4,s0
    3e48:	00374783          	lbu	a5,3(a4)
    3e4c:	00274683          	lbu	a3,2(a4)
    3e50:	01879793          	slli	a5,a5,0x18
    3e54:	01069693          	slli	a3,a3,0x10
    3e58:	00d787b3          	add	a5,a5,a3
    3e5c:	00074683          	lbu	a3,0(a4)
    3e60:	00174703          	lbu	a4,1(a4)
    3e64:	00d787b3          	add	a5,a5,a3
    3e68:	00871713          	slli	a4,a4,0x8
    3e6c:	00e787b3          	add	a5,a5,a4
    3e70:	0137f7b3          	and	a5,a5,s3
    3e74:	f95ff06f          	j	3e08 <fatfs_find_blank_cluster+0x94>
    3e78:	00148493          	addi	s1,s1,1
    3e7c:	f21ff06f          	j	3d9c <fatfs_find_blank_cluster+0x28>
    3e80:	00000513          	li	a0,0
    3e84:	f91ff06f          	j	3e14 <fatfs_find_blank_cluster+0xa0>

00003e88 <fatfs_fat_set_cluster>:
    3e88:	03052783          	lw	a5,48(a0)
    3e8c:	fe010113          	addi	sp,sp,-32
    3e90:	00812c23          	sw	s0,24(sp)
    3e94:	00912a23          	sw	s1,20(sp)
    3e98:	01212823          	sw	s2,16(sp)
    3e9c:	00112e23          	sw	ra,28(sp)
    3ea0:	00050913          	mv	s2,a0
    3ea4:	00058413          	mv	s0,a1
    3ea8:	0085d493          	srli	s1,a1,0x8
    3eac:	00078463          	beqz	a5,3eb4 <fatfs_fat_set_cluster+0x2c>
    3eb0:	0075d493          	srli	s1,a1,0x7
    3eb4:	01492583          	lw	a1,20(s2)
    3eb8:	00090513          	mv	a0,s2
    3ebc:	00c12623          	sw	a2,12(sp)
    3ec0:	00b485b3          	add	a1,s1,a1
    3ec4:	ffffe097          	auipc	ra,0xffffe
    3ec8:	d00080e7          	jalr	-768(ra) # 1bc4 <fatfs_fat_read_sector>
    3ecc:	00050793          	mv	a5,a0
    3ed0:	00000513          	li	a0,0
    3ed4:	04078663          	beqz	a5,3f20 <fatfs_fat_set_cluster+0x98>
    3ed8:	03092683          	lw	a3,48(s2)
    3edc:	2087a703          	lw	a4,520(a5)
    3ee0:	00c12603          	lw	a2,12(sp)
    3ee4:	04069a63          	bnez	a3,3f38 <fatfs_fat_set_cluster+0xb0>
    3ee8:	00849493          	slli	s1,s1,0x8
    3eec:	40940433          	sub	s0,s0,s1
    3ef0:	00141413          	slli	s0,s0,0x1
    3ef4:	01041413          	slli	s0,s0,0x10
    3ef8:	01045413          	srli	s0,s0,0x10
    3efc:	00870733          	add	a4,a4,s0
    3f00:	00c70023          	sb	a2,0(a4)
    3f04:	2087a703          	lw	a4,520(a5)
    3f08:	00865613          	srli	a2,a2,0x8
    3f0c:	00870733          	add	a4,a4,s0
    3f10:	00c700a3          	sb	a2,1(a4)
    3f14:	00100713          	li	a4,1
    3f18:	20e7a223          	sw	a4,516(a5)
    3f1c:	00100513          	li	a0,1
    3f20:	01c12083          	lw	ra,28(sp)
    3f24:	01812403          	lw	s0,24(sp)
    3f28:	01412483          	lw	s1,20(sp)
    3f2c:	01012903          	lw	s2,16(sp)
    3f30:	02010113          	addi	sp,sp,32
    3f34:	00008067          	ret
    3f38:	00749493          	slli	s1,s1,0x7
    3f3c:	40940433          	sub	s0,s0,s1
    3f40:	00241413          	slli	s0,s0,0x2
    3f44:	01041413          	slli	s0,s0,0x10
    3f48:	01045413          	srli	s0,s0,0x10
    3f4c:	00870733          	add	a4,a4,s0
    3f50:	00c70023          	sb	a2,0(a4)
    3f54:	2087a703          	lw	a4,520(a5)
    3f58:	00865693          	srli	a3,a2,0x8
    3f5c:	00870733          	add	a4,a4,s0
    3f60:	00d700a3          	sb	a3,1(a4)
    3f64:	2087a703          	lw	a4,520(a5)
    3f68:	01065693          	srli	a3,a2,0x10
    3f6c:	01865613          	srli	a2,a2,0x18
    3f70:	00870733          	add	a4,a4,s0
    3f74:	00d70123          	sb	a3,2(a4)
    3f78:	2087a703          	lw	a4,520(a5)
    3f7c:	00870733          	add	a4,a4,s0
    3f80:	00c701a3          	sb	a2,3(a4)
    3f84:	f91ff06f          	j	3f14 <fatfs_fat_set_cluster+0x8c>

00003f88 <fatfs_free_cluster_chain>:
    3f88:	fe010113          	addi	sp,sp,-32
    3f8c:	00812c23          	sw	s0,24(sp)
    3f90:	00912a23          	sw	s1,20(sp)
    3f94:	00112e23          	sw	ra,28(sp)
    3f98:	01212823          	sw	s2,16(sp)
    3f9c:	00050493          	mv	s1,a0
    3fa0:	ffd00413          	li	s0,-3
    3fa4:	fff58793          	addi	a5,a1,-1
    3fa8:	02f47063          	bgeu	s0,a5,3fc8 <fatfs_free_cluster_chain+0x40>
    3fac:	01c12083          	lw	ra,28(sp)
    3fb0:	01812403          	lw	s0,24(sp)
    3fb4:	01412483          	lw	s1,20(sp)
    3fb8:	01012903          	lw	s2,16(sp)
    3fbc:	00100513          	li	a0,1
    3fc0:	02010113          	addi	sp,sp,32
    3fc4:	00008067          	ret
    3fc8:	00048513          	mv	a0,s1
    3fcc:	00b12623          	sw	a1,12(sp)
    3fd0:	fffff097          	auipc	ra,0xfffff
    3fd4:	f10080e7          	jalr	-240(ra) # 2ee0 <fatfs_find_next_cluster>
    3fd8:	00c12583          	lw	a1,12(sp)
    3fdc:	00050913          	mv	s2,a0
    3fe0:	00000613          	li	a2,0
    3fe4:	00048513          	mv	a0,s1
    3fe8:	00000097          	auipc	ra,0x0
    3fec:	ea0080e7          	jalr	-352(ra) # 3e88 <fatfs_fat_set_cluster>
    3ff0:	00090593          	mv	a1,s2
    3ff4:	fb1ff06f          	j	3fa4 <fatfs_free_cluster_chain+0x1c>

00003ff8 <fatfs_fat_add_cluster_to_chain>:
    3ff8:	fd010113          	addi	sp,sp,-48
    3ffc:	02912223          	sw	s1,36(sp)
    4000:	02112623          	sw	ra,44(sp)
    4004:	02812423          	sw	s0,40(sp)
    4008:	03212023          	sw	s2,32(sp)
    400c:	01312e23          	sw	s3,28(sp)
    4010:	fff00493          	li	s1,-1
    4014:	02959263          	bne	a1,s1,4038 <fatfs_fat_add_cluster_to_chain+0x40>
    4018:	00000513          	li	a0,0
    401c:	02c12083          	lw	ra,44(sp)
    4020:	02812403          	lw	s0,40(sp)
    4024:	02412483          	lw	s1,36(sp)
    4028:	02012903          	lw	s2,32(sp)
    402c:	01c12983          	lw	s3,28(sp)
    4030:	03010113          	addi	sp,sp,48
    4034:	00008067          	ret
    4038:	00050913          	mv	s2,a0
    403c:	00058413          	mv	s0,a1
    4040:	00060993          	mv	s3,a2
    4044:	00040593          	mv	a1,s0
    4048:	00090513          	mv	a0,s2
    404c:	00812623          	sw	s0,12(sp)
    4050:	fffff097          	auipc	ra,0xfffff
    4054:	e90080e7          	jalr	-368(ra) # 2ee0 <fatfs_find_next_cluster>
    4058:	00050413          	mv	s0,a0
    405c:	fa050ee3          	beqz	a0,4018 <fatfs_fat_add_cluster_to_chain+0x20>
    4060:	00c12583          	lw	a1,12(sp)
    4064:	fe9510e3          	bne	a0,s1,4044 <fatfs_fat_add_cluster_to_chain+0x4c>
    4068:	00098613          	mv	a2,s3
    406c:	00090513          	mv	a0,s2
    4070:	00000097          	auipc	ra,0x0
    4074:	e18080e7          	jalr	-488(ra) # 3e88 <fatfs_fat_set_cluster>
    4078:	00040613          	mv	a2,s0
    407c:	00098593          	mv	a1,s3
    4080:	00090513          	mv	a0,s2
    4084:	00000097          	auipc	ra,0x0
    4088:	e04080e7          	jalr	-508(ra) # 3e88 <fatfs_fat_set_cluster>
    408c:	00100513          	li	a0,1
    4090:	f8dff06f          	j	401c <fatfs_fat_add_cluster_to_chain+0x24>

00004094 <fatfs_add_free_space>:
    4094:	02452783          	lw	a5,36(a0)
    4098:	fd010113          	addi	sp,sp,-48
    409c:	02812423          	sw	s0,40(sp)
    40a0:	01312e23          	sw	s3,28(sp)
    40a4:	01412c23          	sw	s4,24(sp)
    40a8:	0005a983          	lw	s3,0(a1)
    40ac:	01512a23          	sw	s5,20(sp)
    40b0:	00058a13          	mv	s4,a1
    40b4:	02112623          	sw	ra,44(sp)
    40b8:	02912223          	sw	s1,36(sp)
    40bc:	03212023          	sw	s2,32(sp)
    40c0:	fff00593          	li	a1,-1
    40c4:	00050413          	mv	s0,a0
    40c8:	00060a93          	mv	s5,a2
    40cc:	00b78663          	beq	a5,a1,40d8 <fatfs_add_free_space+0x44>
    40d0:	00000097          	auipc	ra,0x0
    40d4:	bf4080e7          	jalr	-1036(ra) # 3cc4 <fatfs_set_fs_info_next_free_cluster>
    40d8:	00000493          	li	s1,0
    40dc:	03549663          	bne	s1,s5,4108 <fatfs_add_free_space+0x74>
    40e0:	00100513          	li	a0,1
    40e4:	02c12083          	lw	ra,44(sp)
    40e8:	02812403          	lw	s0,40(sp)
    40ec:	02412483          	lw	s1,36(sp)
    40f0:	02012903          	lw	s2,32(sp)
    40f4:	01c12983          	lw	s3,28(sp)
    40f8:	01812a03          	lw	s4,24(sp)
    40fc:	01412a83          	lw	s5,20(sp)
    4100:	03010113          	addi	sp,sp,48
    4104:	00008067          	ret
    4108:	00842583          	lw	a1,8(s0)
    410c:	00c10613          	addi	a2,sp,12
    4110:	00040513          	mv	a0,s0
    4114:	00000097          	auipc	ra,0x0
    4118:	c60080e7          	jalr	-928(ra) # 3d74 <fatfs_find_blank_cluster>
    411c:	fc0504e3          	beqz	a0,40e4 <fatfs_add_free_space+0x50>
    4120:	00c12903          	lw	s2,12(sp)
    4124:	00098593          	mv	a1,s3
    4128:	00040513          	mv	a0,s0
    412c:	00090613          	mv	a2,s2
    4130:	00000097          	auipc	ra,0x0
    4134:	d58080e7          	jalr	-680(ra) # 3e88 <fatfs_fat_set_cluster>
    4138:	fff00613          	li	a2,-1
    413c:	00090593          	mv	a1,s2
    4140:	00040513          	mv	a0,s0
    4144:	00000097          	auipc	ra,0x0
    4148:	d44080e7          	jalr	-700(ra) # 3e88 <fatfs_fat_set_cluster>
    414c:	00049463          	bnez	s1,4154 <fatfs_add_free_space+0xc0>
    4150:	012a2023          	sw	s2,0(s4)
    4154:	00148493          	addi	s1,s1,1
    4158:	00090993          	mv	s3,s2
    415c:	f81ff06f          	j	40dc <fatfs_add_free_space+0x48>

00004160 <_write_sectors>:
    4160:	fb010113          	addi	sp,sp,-80
    4164:	03512a23          	sw	s5,52(sp)
    4168:	0000bab7          	lui	s5,0xb
    416c:	04112623          	sw	ra,76(sp)
    4170:	04812423          	sw	s0,72(sp)
    4174:	04912223          	sw	s1,68(sp)
    4178:	03412c23          	sw	s4,56(sp)
    417c:	03612823          	sw	s6,48(sp)
    4180:	03712623          	sw	s7,44(sp)
    4184:	03812423          	sw	s8,40(sp)
    4188:	03912223          	sw	s9,36(sp)
    418c:	03a12023          	sw	s10,32(sp)
    4190:	05212023          	sw	s2,64(sp)
    4194:	03312e23          	sw	s3,60(sp)
    4198:	fd4a8b93          	addi	s7,s5,-44 # afd4 <_fs>
    419c:	000bc983          	lbu	s3,0(s7)
    41a0:	00058b13          	mv	s6,a1
    41a4:	fff00793          	li	a5,-1
    41a8:	00098593          	mv	a1,s3
    41ac:	00050493          	mv	s1,a0
    41b0:	000b0513          	mv	a0,s6
    41b4:	00068c13          	mv	s8,a3
    41b8:	00f12e23          	sw	a5,28(sp)
    41bc:	00060d13          	mv	s10,a2
    41c0:	ffffd097          	auipc	ra,0xffffd
    41c4:	048080e7          	jalr	72(ra) # 1208 <__udivsi3>
    41c8:	00050a13          	mv	s4,a0
    41cc:	00098593          	mv	a1,s3
    41d0:	000b0513          	mv	a0,s6
    41d4:	ffffd097          	auipc	ra,0xffffd
    41d8:	07c080e7          	jalr	124(ra) # 1250 <__umodsi3>
    41dc:	00ac07b3          	add	a5,s8,a0
    41e0:	00050c93          	mv	s9,a0
    41e4:	000c0413          	mv	s0,s8
    41e8:	00f9fe63          	bgeu	s3,a5,4204 <_write_sectors+0xa4>
    41ec:	000a0593          	mv	a1,s4
    41f0:	00098513          	mv	a0,s3
    41f4:	ffffe097          	auipc	ra,0xffffe
    41f8:	818080e7          	jalr	-2024(ra) # 1a0c <__mulsi3>
    41fc:	416987b3          	sub	a5,s3,s6
    4200:	00f50433          	add	s0,a0,a5
    4204:	2284a903          	lw	s2,552(s1)
    4208:	03491a63          	bne	s2,s4,423c <_write_sectors+0xdc>
    420c:	22c4a583          	lw	a1,556(s1)
    4210:	fd4a8513          	addi	a0,s5,-44
    4214:	ffffe097          	auipc	ra,0xffffe
    4218:	b5c080e7          	jalr	-1188(ra) # 1d70 <fatfs_lba_of_cluster>
    421c:	019505b3          	add	a1,a0,s9
    4220:	00040693          	mv	a3,s0
    4224:	000d0613          	mv	a2,s10
    4228:	fd4a8513          	addi	a0,s5,-44
    422c:	ffffe097          	auipc	ra,0xffffe
    4230:	ba8080e7          	jalr	-1112(ra) # 1dd4 <fatfs_sector_write>
    4234:	04050a63          	beqz	a0,4288 <_write_sectors+0x128>
    4238:	0540006f          	j	428c <_write_sectors+0x12c>
    423c:	093b6663          	bltu	s6,s3,42c8 <_write_sectors+0x168>
    4240:	00190793          	addi	a5,s2,1
    4244:	09479263          	bne	a5,s4,42c8 <_write_sectors+0x168>
    4248:	22c4a583          	lw	a1,556(s1)
    424c:	fff00b13          	li	s6,-1
    4250:	09496263          	bltu	s2,s4,42d4 <_write_sectors+0x174>
    4254:	fff00793          	li	a5,-1
    4258:	0af59463          	bne	a1,a5,4300 <_write_sectors+0x1a0>
    425c:	000bc583          	lbu	a1,0(s7)
    4260:	fff58513          	addi	a0,a1,-1
    4264:	01850533          	add	a0,a0,s8
    4268:	ffffd097          	auipc	ra,0xffffd
    426c:	fa0080e7          	jalr	-96(ra) # 1208 <__udivsi3>
    4270:	00050613          	mv	a2,a0
    4274:	01c10593          	addi	a1,sp,28
    4278:	000b8513          	mv	a0,s7
    427c:	00000097          	auipc	ra,0x0
    4280:	e18080e7          	jalr	-488(ra) # 4094 <fatfs_add_free_space>
    4284:	06051c63          	bnez	a0,42fc <_write_sectors+0x19c>
    4288:	00000413          	li	s0,0
    428c:	04c12083          	lw	ra,76(sp)
    4290:	00040513          	mv	a0,s0
    4294:	04812403          	lw	s0,72(sp)
    4298:	04412483          	lw	s1,68(sp)
    429c:	04012903          	lw	s2,64(sp)
    42a0:	03c12983          	lw	s3,60(sp)
    42a4:	03812a03          	lw	s4,56(sp)
    42a8:	03412a83          	lw	s5,52(sp)
    42ac:	03012b03          	lw	s6,48(sp)
    42b0:	02c12b83          	lw	s7,44(sp)
    42b4:	02812c03          	lw	s8,40(sp)
    42b8:	02412c83          	lw	s9,36(sp)
    42bc:	02012d03          	lw	s10,32(sp)
    42c0:	05010113          	addi	sp,sp,80
    42c4:	00008067          	ret
    42c8:	0044a583          	lw	a1,4(s1)
    42cc:	00000913          	li	s2,0
    42d0:	f7dff06f          	j	424c <_write_sectors+0xec>
    42d4:	fd4a8513          	addi	a0,s5,-44
    42d8:	00b12623          	sw	a1,12(sp)
    42dc:	fffff097          	auipc	ra,0xfffff
    42e0:	c04080e7          	jalr	-1020(ra) # 2ee0 <fatfs_find_next_cluster>
    42e4:	00c12583          	lw	a1,12(sp)
    42e8:	00b12e23          	sw	a1,28(sp)
    42ec:	f76508e3          	beq	a0,s6,425c <_write_sectors+0xfc>
    42f0:	00190913          	addi	s2,s2,1
    42f4:	00050593          	mv	a1,a0
    42f8:	f59ff06f          	j	4250 <_write_sectors+0xf0>
    42fc:	01c12583          	lw	a1,28(sp)
    4300:	22b4a623          	sw	a1,556(s1)
    4304:	2344a423          	sw	s4,552(s1)
    4308:	f09ff06f          	j	4210 <_write_sectors+0xb0>

0000430c <fl_fflush>:
    430c:	000057b7          	lui	a5,0x5
    4310:	3b47a783          	lw	a5,948(a5) # 53b4 <_filelib_init>
    4314:	ff010113          	addi	sp,sp,-16
    4318:	00812423          	sw	s0,8(sp)
    431c:	00112623          	sw	ra,12(sp)
    4320:	00912223          	sw	s1,4(sp)
    4324:	00050413          	mv	s0,a0
    4328:	00079663          	bnez	a5,4334 <fl_fflush+0x28>
    432c:	ffffe097          	auipc	ra,0xffffe
    4330:	b74080e7          	jalr	-1164(ra) # 1ea0 <fl_init>
    4334:	04040663          	beqz	s0,4380 <fl_fflush+0x74>
    4338:	0000b4b7          	lui	s1,0xb
    433c:	fd448493          	addi	s1,s1,-44 # afd4 <_fs>
    4340:	03c4a783          	lw	a5,60(s1)
    4344:	00078463          	beqz	a5,434c <fl_fflush+0x40>
    4348:	000780e7          	jalr	a5
    434c:	43442783          	lw	a5,1076(s0)
    4350:	02078263          	beqz	a5,4374 <fl_fflush+0x68>
    4354:	43042583          	lw	a1,1072(s0)
    4358:	00100693          	li	a3,1
    435c:	23040613          	addi	a2,s0,560
    4360:	00040513          	mv	a0,s0
    4364:	00000097          	auipc	ra,0x0
    4368:	dfc080e7          	jalr	-516(ra) # 4160 <_write_sectors>
    436c:	00050463          	beqz	a0,4374 <fl_fflush+0x68>
    4370:	42042a23          	sw	zero,1076(s0)
    4374:	0404a783          	lw	a5,64(s1)
    4378:	00078463          	beqz	a5,4380 <fl_fflush+0x74>
    437c:	000780e7          	jalr	a5
    4380:	00c12083          	lw	ra,12(sp)
    4384:	00812403          	lw	s0,8(sp)
    4388:	00412483          	lw	s1,4(sp)
    438c:	00000513          	li	a0,0
    4390:	01010113          	addi	sp,sp,16
    4394:	00008067          	ret

00004398 <fl_fclose>:
    4398:	000057b7          	lui	a5,0x5
    439c:	3b47a783          	lw	a5,948(a5) # 53b4 <_filelib_init>
    43a0:	ff010113          	addi	sp,sp,-16
    43a4:	00812423          	sw	s0,8(sp)
    43a8:	00112623          	sw	ra,12(sp)
    43ac:	00912223          	sw	s1,4(sp)
    43b0:	01212023          	sw	s2,0(sp)
    43b4:	00050413          	mv	s0,a0
    43b8:	00079663          	bnez	a5,43c4 <fl_fclose+0x2c>
    43bc:	ffffe097          	auipc	ra,0xffffe
    43c0:	ae4080e7          	jalr	-1308(ra) # 1ea0 <fl_init>
    43c4:	08040c63          	beqz	s0,445c <fl_fclose+0xc4>
    43c8:	0000b4b7          	lui	s1,0xb
    43cc:	fd448913          	addi	s2,s1,-44 # afd4 <_fs>
    43d0:	03c92783          	lw	a5,60(s2)
    43d4:	00078463          	beqz	a5,43dc <fl_fclose+0x44>
    43d8:	000780e7          	jalr	a5
    43dc:	00040513          	mv	a0,s0
    43e0:	00000097          	auipc	ra,0x0
    43e4:	f2c080e7          	jalr	-212(ra) # 430c <fl_fflush>
    43e8:	01042783          	lw	a5,16(s0)
    43ec:	00078e63          	beqz	a5,4408 <fl_fclose+0x70>
    43f0:	00c42683          	lw	a3,12(s0)
    43f4:	00042583          	lw	a1,0(s0)
    43f8:	21c40613          	addi	a2,s0,540
    43fc:	fd448513          	addi	a0,s1,-44
    4400:	fffff097          	auipc	ra,0xfffff
    4404:	338080e7          	jalr	824(ra) # 3738 <fatfs_update_file_length>
    4408:	fff00793          	li	a5,-1
    440c:	42f42823          	sw	a5,1072(s0)
    4410:	00040513          	mv	a0,s0
    4414:	00042423          	sw	zero,8(s0)
    4418:	00042623          	sw	zero,12(s0)
    441c:	00042223          	sw	zero,4(s0)
    4420:	42042a23          	sw	zero,1076(s0)
    4424:	00042823          	sw	zero,16(s0)
    4428:	ffffe097          	auipc	ra,0xffffe
    442c:	900080e7          	jalr	-1792(ra) # 1d28 <_free_file>
    4430:	fd448513          	addi	a0,s1,-44
    4434:	fffff097          	auipc	ra,0xfffff
    4438:	a54080e7          	jalr	-1452(ra) # 2e88 <fatfs_fat_purge>
    443c:	04092783          	lw	a5,64(s2)
    4440:	00078e63          	beqz	a5,445c <fl_fclose+0xc4>
    4444:	00812403          	lw	s0,8(sp)
    4448:	00c12083          	lw	ra,12(sp)
    444c:	00412483          	lw	s1,4(sp)
    4450:	00012903          	lw	s2,0(sp)
    4454:	01010113          	addi	sp,sp,16
    4458:	00078067          	jr	a5
    445c:	00c12083          	lw	ra,12(sp)
    4460:	00812403          	lw	s0,8(sp)
    4464:	00412483          	lw	s1,4(sp)
    4468:	00012903          	lw	s2,0(sp)
    446c:	01010113          	addi	sp,sp,16
    4470:	00008067          	ret

00004474 <fl_fread>:
    4474:	000057b7          	lui	a5,0x5
    4478:	3b47a783          	lw	a5,948(a5) # 53b4 <_filelib_init>
    447c:	fc010113          	addi	sp,sp,-64
    4480:	02812c23          	sw	s0,56(sp)
    4484:	03512223          	sw	s5,36(sp)
    4488:	02112e23          	sw	ra,60(sp)
    448c:	02912a23          	sw	s1,52(sp)
    4490:	03212823          	sw	s2,48(sp)
    4494:	03312623          	sw	s3,44(sp)
    4498:	03412423          	sw	s4,40(sp)
    449c:	03612023          	sw	s6,32(sp)
    44a0:	01712e23          	sw	s7,28(sp)
    44a4:	01812c23          	sw	s8,24(sp)
    44a8:	01912a23          	sw	s9,20(sp)
    44ac:	00050a93          	mv	s5,a0
    44b0:	00068413          	mv	s0,a3
    44b4:	00058513          	mv	a0,a1
    44b8:	00079e63          	bnez	a5,44d4 <fl_fread+0x60>
    44bc:	00c12623          	sw	a2,12(sp)
    44c0:	00b12423          	sw	a1,8(sp)
    44c4:	ffffe097          	auipc	ra,0xffffe
    44c8:	9dc080e7          	jalr	-1572(ra) # 1ea0 <fl_init>
    44cc:	00c12603          	lw	a2,12(sp)
    44d0:	00812503          	lw	a0,8(sp)
    44d4:	14040e63          	beqz	s0,4630 <fl_fread+0x1bc>
    44d8:	140a8c63          	beqz	s5,4630 <fl_fread+0x1bc>
    44dc:	43844783          	lbu	a5,1080(s0)
    44e0:	fff00493          	li	s1,-1
    44e4:	0017f793          	andi	a5,a5,1
    44e8:	04078863          	beqz	a5,4538 <fl_fread+0xc4>
    44ec:	00060593          	mv	a1,a2
    44f0:	ffffd097          	auipc	ra,0xffffd
    44f4:	51c080e7          	jalr	1308(ra) # 1a0c <__mulsi3>
    44f8:	00050493          	mv	s1,a0
    44fc:	02050e63          	beqz	a0,4538 <fl_fread+0xc4>
    4500:	00842583          	lw	a1,8(s0)
    4504:	00c42783          	lw	a5,12(s0)
    4508:	12f5f463          	bgeu	a1,a5,4630 <fl_fread+0x1bc>
    450c:	00b50733          	add	a4,a0,a1
    4510:	00e7f463          	bgeu	a5,a4,4518 <fl_fread+0xa4>
    4514:	40b784b3          	sub	s1,a5,a1
    4518:	0095da13          	srli	s4,a1,0x9
    451c:	1ff5f913          	andi	s2,a1,511
    4520:	00000993          	li	s3,0
    4524:	23040b13          	addi	s6,s0,560
    4528:	20000b93          	li	s7,512
    452c:	1ff00c13          	li	s8,511
    4530:	0499c063          	blt	s3,s1,4570 <fl_fread+0xfc>
    4534:	00098493          	mv	s1,s3
    4538:	03c12083          	lw	ra,60(sp)
    453c:	03812403          	lw	s0,56(sp)
    4540:	03012903          	lw	s2,48(sp)
    4544:	02c12983          	lw	s3,44(sp)
    4548:	02812a03          	lw	s4,40(sp)
    454c:	02412a83          	lw	s5,36(sp)
    4550:	02012b03          	lw	s6,32(sp)
    4554:	01c12b83          	lw	s7,28(sp)
    4558:	01812c03          	lw	s8,24(sp)
    455c:	01412c83          	lw	s9,20(sp)
    4560:	00048513          	mv	a0,s1
    4564:	03412483          	lw	s1,52(sp)
    4568:	04010113          	addi	sp,sp,64
    456c:	00008067          	ret
    4570:	04091663          	bnez	s2,45bc <fl_fread+0x148>
    4574:	413486b3          	sub	a3,s1,s3
    4578:	04dc5263          	bge	s8,a3,45bc <fl_fread+0x148>
    457c:	4096d693          	srai	a3,a3,0x9
    4580:	013a8633          	add	a2,s5,s3
    4584:	000a0593          	mv	a1,s4
    4588:	00040513          	mv	a0,s0
    458c:	fffff097          	auipc	ra,0xfffff
    4590:	5ec080e7          	jalr	1516(ra) # 3b78 <_read_sectors>
    4594:	fa0500e3          	beqz	a0,4534 <fl_fread+0xc0>
    4598:	00951c93          	slli	s9,a0,0x9
    459c:	000c8613          	mv	a2,s9
    45a0:	00aa0a33          	add	s4,s4,a0
    45a4:	00842783          	lw	a5,8(s0)
    45a8:	00c989b3          	add	s3,s3,a2
    45ac:	00000913          	li	s2,0
    45b0:	019787b3          	add	a5,a5,s9
    45b4:	00f42423          	sw	a5,8(s0)
    45b8:	f79ff06f          	j	4530 <fl_fread+0xbc>
    45bc:	43042783          	lw	a5,1072(s0)
    45c0:	03478e63          	beq	a5,s4,45fc <fl_fread+0x188>
    45c4:	43442783          	lw	a5,1076(s0)
    45c8:	00078863          	beqz	a5,45d8 <fl_fread+0x164>
    45cc:	00040513          	mv	a0,s0
    45d0:	00000097          	auipc	ra,0x0
    45d4:	d3c080e7          	jalr	-708(ra) # 430c <fl_fflush>
    45d8:	00100693          	li	a3,1
    45dc:	000b0613          	mv	a2,s6
    45e0:	000a0593          	mv	a1,s4
    45e4:	00040513          	mv	a0,s0
    45e8:	fffff097          	auipc	ra,0xfffff
    45ec:	590080e7          	jalr	1424(ra) # 3b78 <_read_sectors>
    45f0:	f40502e3          	beqz	a0,4534 <fl_fread+0xc0>
    45f4:	43442823          	sw	s4,1072(s0)
    45f8:	42042a23          	sw	zero,1076(s0)
    45fc:	412b87b3          	sub	a5,s7,s2
    4600:	41348633          	sub	a2,s1,s3
    4604:	00c7d463          	bge	a5,a2,460c <fl_fread+0x198>
    4608:	00078613          	mv	a2,a5
    460c:	012b05b3          	add	a1,s6,s2
    4610:	013a8533          	add	a0,s5,s3
    4614:	00060c93          	mv	s9,a2
    4618:	00c12423          	sw	a2,8(sp)
    461c:	ffffd097          	auipc	ra,0xffffd
    4620:	cb4080e7          	jalr	-844(ra) # 12d0 <memcpy>
    4624:	00812603          	lw	a2,8(sp)
    4628:	001a0a13          	addi	s4,s4,1
    462c:	f79ff06f          	j	45a4 <fl_fread+0x130>
    4630:	fff00493          	li	s1,-1
    4634:	f05ff06f          	j	4538 <fl_fread+0xc4>

00004638 <fatfs_allocate_free_space>:
    4638:	fd010113          	addi	sp,sp,-48
    463c:	02112623          	sw	ra,44(sp)
    4640:	02812423          	sw	s0,40(sp)
    4644:	02912223          	sw	s1,36(sp)
    4648:	03212023          	sw	s2,32(sp)
    464c:	01312e23          	sw	s3,28(sp)
    4650:	01412c23          	sw	s4,24(sp)
    4654:	01512a23          	sw	s5,20(sp)
    4658:	02069863          	bnez	a3,4688 <fatfs_allocate_free_space+0x50>
    465c:	00000413          	li	s0,0
    4660:	02c12083          	lw	ra,44(sp)
    4664:	00040513          	mv	a0,s0
    4668:	02812403          	lw	s0,40(sp)
    466c:	02412483          	lw	s1,36(sp)
    4670:	02012903          	lw	s2,32(sp)
    4674:	01c12983          	lw	s3,28(sp)
    4678:	01812a03          	lw	s4,24(sp)
    467c:	01412a83          	lw	s5,20(sp)
    4680:	03010113          	addi	sp,sp,48
    4684:	00008067          	ret
    4688:	02452783          	lw	a5,36(a0)
    468c:	00058a13          	mv	s4,a1
    4690:	fff00593          	li	a1,-1
    4694:	00050493          	mv	s1,a0
    4698:	00068913          	mv	s2,a3
    469c:	00060993          	mv	s3,a2
    46a0:	00b78663          	beq	a5,a1,46ac <fatfs_allocate_free_space+0x74>
    46a4:	fffff097          	auipc	ra,0xfffff
    46a8:	620080e7          	jalr	1568(ra) # 3cc4 <fatfs_set_fs_info_next_free_cluster>
    46ac:	0004c783          	lbu	a5,0(s1)
    46b0:	00090513          	mv	a0,s2
    46b4:	00979a93          	slli	s5,a5,0x9
    46b8:	000a8593          	mv	a1,s5
    46bc:	ffffd097          	auipc	ra,0xffffd
    46c0:	b4c080e7          	jalr	-1204(ra) # 1208 <__udivsi3>
    46c4:	00050413          	mv	s0,a0
    46c8:	00050593          	mv	a1,a0
    46cc:	000a8513          	mv	a0,s5
    46d0:	ffffd097          	auipc	ra,0xffffd
    46d4:	33c080e7          	jalr	828(ra) # 1a0c <__mulsi3>
    46d8:	41250533          	sub	a0,a0,s2
    46dc:	00a03533          	snez	a0,a0
    46e0:	00a40933          	add	s2,s0,a0
    46e4:	040a0463          	beqz	s4,472c <fatfs_allocate_free_space+0xf4>
    46e8:	0084a583          	lw	a1,8(s1)
    46ec:	00c10613          	addi	a2,sp,12
    46f0:	00048513          	mv	a0,s1
    46f4:	fffff097          	auipc	ra,0xfffff
    46f8:	680080e7          	jalr	1664(ra) # 3d74 <fatfs_find_blank_cluster>
    46fc:	00050413          	mv	s0,a0
    4700:	f4050ee3          	beqz	a0,465c <fatfs_allocate_free_space+0x24>
    4704:	00100793          	li	a5,1
    4708:	02f91663          	bne	s2,a5,4734 <fatfs_allocate_free_space+0xfc>
    470c:	00c12903          	lw	s2,12(sp)
    4710:	fff00613          	li	a2,-1
    4714:	00048513          	mv	a0,s1
    4718:	00090593          	mv	a1,s2
    471c:	fffff097          	auipc	ra,0xfffff
    4720:	76c080e7          	jalr	1900(ra) # 3e88 <fatfs_fat_set_cluster>
    4724:	0129a023          	sw	s2,0(s3)
    4728:	f39ff06f          	j	4660 <fatfs_allocate_free_space+0x28>
    472c:	0009a783          	lw	a5,0(s3)
    4730:	00f12623          	sw	a5,12(sp)
    4734:	00090613          	mv	a2,s2
    4738:	00c10593          	addi	a1,sp,12
    473c:	00048513          	mv	a0,s1
    4740:	00000097          	auipc	ra,0x0
    4744:	954080e7          	jalr	-1708(ra) # 4094 <fatfs_add_free_space>
    4748:	00050413          	mv	s0,a0
    474c:	f15ff06f          	j	4660 <fatfs_allocate_free_space+0x28>

00004750 <fatfs_add_file_entry>:
    4750:	03852883          	lw	a7,56(a0)
    4754:	30088e63          	beqz	a7,4a70 <fatfs_add_file_entry+0x320>
    4758:	f8010113          	addi	sp,sp,-128
    475c:	06812c23          	sw	s0,120(sp)
    4760:	00050413          	mv	s0,a0
    4764:	00060513          	mv	a0,a2
    4768:	06912a23          	sw	s1,116(sp)
    476c:	07512223          	sw	s5,100(sp)
    4770:	00f12c23          	sw	a5,24(sp)
    4774:	00e12a23          	sw	a4,20(sp)
    4778:	06112e23          	sw	ra,124(sp)
    477c:	07212823          	sw	s2,112(sp)
    4780:	07312623          	sw	s3,108(sp)
    4784:	07412423          	sw	s4,104(sp)
    4788:	07612023          	sw	s6,96(sp)
    478c:	05712e23          	sw	s7,92(sp)
    4790:	05812c23          	sw	s8,88(sp)
    4794:	05912a23          	sw	s9,84(sp)
    4798:	05a12823          	sw	s10,80(sp)
    479c:	05b12623          	sw	s11,76(sp)
    47a0:	01012e23          	sw	a6,28(sp)
    47a4:	00068a93          	mv	s5,a3
    47a8:	00c12823          	sw	a2,16(sp)
    47ac:	00b12423          	sw	a1,8(sp)
    47b0:	ffffe097          	auipc	ra,0xffffe
    47b4:	a48080e7          	jalr	-1464(ra) # 21f8 <fatfs_lfn_entries_required>
    47b8:	00150713          	addi	a4,a0,1
    47bc:	00100793          	li	a5,1
    47c0:	00050493          	mv	s1,a0
    47c4:	2ae7f263          	bgeu	a5,a4,4a68 <fatfs_add_file_entry+0x318>
    47c8:	00000a13          	li	s4,0
    47cc:	00000993          	li	s3,0
    47d0:	00000913          	li	s2,0
    47d4:	00000c93          	li	s9,0
    47d8:	00000b13          	li	s6,0
    47dc:	01000c13          	li	s8,16
    47e0:	00812583          	lw	a1,8(sp)
    47e4:	00000693          	li	a3,0
    47e8:	000b0613          	mv	a2,s6
    47ec:	00040513          	mv	a0,s0
    47f0:	000b0b93          	mv	s7,s6
    47f4:	ffffe097          	auipc	ra,0xffffe
    47f8:	7f4080e7          	jalr	2036(ra) # 2fe8 <fatfs_sector_reader>
    47fc:	18050463          	beqz	a0,4984 <fatfs_add_file_entry+0x234>
    4800:	001b0b13          	addi	s6,s6,1
    4804:	04440793          	addi	a5,s0,68
    4808:	000c8d13          	mv	s10,s9
    480c:	00000d93          	li	s11,0
    4810:	00078513          	mv	a0,a5
    4814:	00f12623          	sw	a5,12(sp)
    4818:	ffffe097          	auipc	ra,0xffffe
    481c:	8f8080e7          	jalr	-1800(ra) # 2110 <fatfs_entry_lfn_text>
    4820:	00c12783          	lw	a5,12(sp)
    4824:	00050c93          	mv	s9,a0
    4828:	02050c63          	beqz	a0,4860 <fatfs_add_file_entry+0x110>
    482c:	020d0463          	beqz	s10,4854 <fatfs_add_file_entry+0x104>
    4830:	00090c93          	mv	s9,s2
    4834:	000c8913          	mv	s2,s9
    4838:	001d0c93          	addi	s9,s10,1
    483c:	001d8d93          	addi	s11,s11,1
    4840:	0ffdfd93          	zext.b	s11,s11
    4844:	02078793          	addi	a5,a5,32
    4848:	f98d8ce3          	beq	s11,s8,47e0 <fatfs_add_file_entry+0x90>
    484c:	000c8d13          	mv	s10,s9
    4850:	fc1ff06f          	j	4810 <fatfs_add_file_entry+0xc0>
    4854:	000d8a13          	mv	s4,s11
    4858:	000b8993          	mv	s3,s7
    485c:	fd9ff06f          	j	4834 <fatfs_add_file_entry+0xe4>
    4860:	0007c683          	lbu	a3,0(a5)
    4864:	0e500713          	li	a4,229
    4868:	10e69863          	bne	a3,a4,4978 <fatfs_add_file_entry+0x228>
    486c:	000d1863          	bnez	s10,487c <fatfs_add_file_entry+0x12c>
    4870:	000d8a13          	mv	s4,s11
    4874:	000b8993          	mv	s3,s7
    4878:	00100913          	li	s2,1
    487c:	fa9d4ee3          	blt	s10,s1,4838 <fatfs_add_file_entry+0xe8>
    4880:	00ba8693          	addi	a3,s5,11
    4884:	000a8713          	mv	a4,s5
    4888:	00000913          	li	s2,0
    488c:	00074603          	lbu	a2,0(a4)
    4890:	00195793          	srli	a5,s2,0x1
    4894:	00791913          	slli	s2,s2,0x7
    4898:	012787b3          	add	a5,a5,s2
    489c:	00170713          	addi	a4,a4,1
    48a0:	00c787b3          	add	a5,a5,a2
    48a4:	0ff7f913          	zext.b	s2,a5
    48a8:	fed712e3          	bne	a4,a3,488c <fatfs_add_file_entry+0x13c>
    48ac:	00098b13          	mv	s6,s3
    48b0:	00000d13          	li	s10,0
    48b4:	01000b93          	li	s7,16
    48b8:	00812583          	lw	a1,8(sp)
    48bc:	00000693          	li	a3,0
    48c0:	000b0613          	mv	a2,s6
    48c4:	00040513          	mv	a0,s0
    48c8:	ffffe097          	auipc	ra,0xffffe
    48cc:	720080e7          	jalr	1824(ra) # 2fe8 <fatfs_sector_reader>
    48d0:	18050c63          	beqz	a0,4a68 <fatfs_add_file_entry+0x318>
    48d4:	04440c93          	addi	s9,s0,68
    48d8:	413b0db3          	sub	s11,s6,s3
    48dc:	00000793          	li	a5,0
    48e0:	00000c13          	li	s8,0
    48e4:	01912623          	sw	s9,12(sp)
    48e8:	000d1663          	bnez	s10,48f4 <fatfs_add_file_entry+0x1a4>
    48ec:	154c1863          	bne	s8,s4,4a3c <fatfs_add_file_entry+0x2ec>
    48f0:	140d9663          	bnez	s11,4a3c <fatfs_add_file_entry+0x2ec>
    48f4:	12049263          	bnez	s1,4a18 <fatfs_add_file_entry+0x2c8>
    48f8:	01c12703          	lw	a4,28(sp)
    48fc:	01412603          	lw	a2,20(sp)
    4900:	01812583          	lw	a1,24(sp)
    4904:	02010693          	addi	a3,sp,32
    4908:	000a8513          	mv	a0,s5
    490c:	ffffe097          	auipc	ra,0xffffe
    4910:	a30080e7          	jalr	-1488(ra) # 233c <fatfs_sfn_create_entry>
    4914:	02000613          	li	a2,32
    4918:	00c105b3          	add	a1,sp,a2
    491c:	000c8513          	mv	a0,s9
    4920:	ffffd097          	auipc	ra,0xffffd
    4924:	9b0080e7          	jalr	-1616(ra) # 12d0 <memcpy>
    4928:	03842783          	lw	a5,56(s0)
    492c:	00c12583          	lw	a1,12(sp)
    4930:	24442503          	lw	a0,580(s0)
    4934:	00100613          	li	a2,1
    4938:	000780e7          	jalr	a5
    493c:	07c12083          	lw	ra,124(sp)
    4940:	07812403          	lw	s0,120(sp)
    4944:	07412483          	lw	s1,116(sp)
    4948:	07012903          	lw	s2,112(sp)
    494c:	06c12983          	lw	s3,108(sp)
    4950:	06812a03          	lw	s4,104(sp)
    4954:	06412a83          	lw	s5,100(sp)
    4958:	06012b03          	lw	s6,96(sp)
    495c:	05c12b83          	lw	s7,92(sp)
    4960:	05812c03          	lw	s8,88(sp)
    4964:	05412c83          	lw	s9,84(sp)
    4968:	05012d03          	lw	s10,80(sp)
    496c:	04c12d83          	lw	s11,76(sp)
    4970:	08010113          	addi	sp,sp,128
    4974:	00008067          	ret
    4978:	ee068ae3          	beqz	a3,486c <fatfs_add_file_entry+0x11c>
    497c:	00000913          	li	s2,0
    4980:	ebdff06f          	j	483c <fatfs_add_file_entry+0xec>
    4984:	00842583          	lw	a1,8(s0)
    4988:	02010613          	addi	a2,sp,32
    498c:	00040513          	mv	a0,s0
    4990:	fffff097          	auipc	ra,0xfffff
    4994:	3e4080e7          	jalr	996(ra) # 3d74 <fatfs_find_blank_cluster>
    4998:	0c050863          	beqz	a0,4a68 <fatfs_add_file_entry+0x318>
    499c:	02012b83          	lw	s7,32(sp)
    49a0:	00812583          	lw	a1,8(sp)
    49a4:	00040513          	mv	a0,s0
    49a8:	000b8613          	mv	a2,s7
    49ac:	fffff097          	auipc	ra,0xfffff
    49b0:	64c080e7          	jalr	1612(ra) # 3ff8 <fatfs_fat_add_cluster_to_chain>
    49b4:	0a050a63          	beqz	a0,4a68 <fatfs_add_file_entry+0x318>
    49b8:	20000613          	li	a2,512
    49bc:	00000593          	li	a1,0
    49c0:	04440513          	addi	a0,s0,68
    49c4:	ffffd097          	auipc	ra,0xffffd
    49c8:	8f0080e7          	jalr	-1808(ra) # 12b4 <memset>
    49cc:	00000c13          	li	s8,0
    49d0:	00044783          	lbu	a5,0(s0)
    49d4:	00fc6a63          	bltu	s8,a5,49e8 <fatfs_add_file_entry+0x298>
    49d8:	ea0914e3          	bnez	s2,4880 <fatfs_add_file_entry+0x130>
    49dc:	000b0993          	mv	s3,s6
    49e0:	00000a13          	li	s4,0
    49e4:	e9dff06f          	j	4880 <fatfs_add_file_entry+0x130>
    49e8:	00000693          	li	a3,0
    49ec:	000c0613          	mv	a2,s8
    49f0:	000b8593          	mv	a1,s7
    49f4:	00040513          	mv	a0,s0
    49f8:	ffffd097          	auipc	ra,0xffffd
    49fc:	3f4080e7          	jalr	1012(ra) # 1dec <fatfs_write_sector>
    4a00:	06050463          	beqz	a0,4a68 <fatfs_add_file_entry+0x318>
    4a04:	001c0c13          	addi	s8,s8,1
    4a08:	0ffc7c13          	zext.b	s8,s8
    4a0c:	fc5ff06f          	j	49d0 <fatfs_add_file_entry+0x280>
    4a10:	001b0b13          	addi	s6,s6,1
    4a14:	ea5ff06f          	j	48b8 <fatfs_add_file_entry+0x168>
    4a18:	01012503          	lw	a0,16(sp)
    4a1c:	fff48493          	addi	s1,s1,-1
    4a20:	00090693          	mv	a3,s2
    4a24:	00048613          	mv	a2,s1
    4a28:	000c8593          	mv	a1,s9
    4a2c:	ffffd097          	auipc	ra,0xffffd
    4a30:	7fc080e7          	jalr	2044(ra) # 2228 <fatfs_filename_to_lfn>
    4a34:	00100d13          	li	s10,1
    4a38:	000d0793          	mv	a5,s10
    4a3c:	001c0c13          	addi	s8,s8,1
    4a40:	0ffc7c13          	zext.b	s8,s8
    4a44:	020c8c93          	addi	s9,s9,32
    4a48:	eb7c10e3          	bne	s8,s7,48e8 <fatfs_add_file_entry+0x198>
    4a4c:	fc0782e3          	beqz	a5,4a10 <fatfs_add_file_entry+0x2c0>
    4a50:	03842783          	lw	a5,56(s0)
    4a54:	00c12583          	lw	a1,12(sp)
    4a58:	24442503          	lw	a0,580(s0)
    4a5c:	00100613          	li	a2,1
    4a60:	000780e7          	jalr	a5
    4a64:	fa0516e3          	bnez	a0,4a10 <fatfs_add_file_entry+0x2c0>
    4a68:	00000513          	li	a0,0
    4a6c:	ed1ff06f          	j	493c <fatfs_add_file_entry+0x1ec>
    4a70:	00000513          	li	a0,0
    4a74:	00008067          	ret

00004a78 <fl_fopen>:
    4a78:	000057b7          	lui	a5,0x5
    4a7c:	3b47a783          	lw	a5,948(a5) # 53b4 <_filelib_init>
    4a80:	fa010113          	addi	sp,sp,-96
    4a84:	05212823          	sw	s2,80(sp)
    4a88:	03a12823          	sw	s10,48(sp)
    4a8c:	04112e23          	sw	ra,92(sp)
    4a90:	04812c23          	sw	s0,88(sp)
    4a94:	04912a23          	sw	s1,84(sp)
    4a98:	05312623          	sw	s3,76(sp)
    4a9c:	05412423          	sw	s4,72(sp)
    4aa0:	05512223          	sw	s5,68(sp)
    4aa4:	05612023          	sw	s6,64(sp)
    4aa8:	03712e23          	sw	s7,60(sp)
    4aac:	03812c23          	sw	s8,56(sp)
    4ab0:	03912a23          	sw	s9,52(sp)
    4ab4:	00050d13          	mv	s10,a0
    4ab8:	00058913          	mv	s2,a1
    4abc:	00079663          	bnez	a5,4ac8 <fl_fopen+0x50>
    4ac0:	ffffd097          	auipc	ra,0xffffd
    4ac4:	3e0080e7          	jalr	992(ra) # 1ea0 <fl_init>
    4ac8:	000057b7          	lui	a5,0x5
    4acc:	3b07a783          	lw	a5,944(a5) # 53b0 <_filelib_valid>
    4ad0:	00193713          	seqz	a4,s2
    4ad4:	0017b793          	seqz	a5,a5
    4ad8:	00e7e7b3          	or	a5,a5,a4
    4adc:	36079e63          	bnez	a5,4e58 <fl_fopen+0x3e0>
    4ae0:	360d0c63          	beqz	s10,4e58 <fl_fopen+0x3e0>
    4ae4:	00000493          	li	s1,0
    4ae8:	00000413          	li	s0,0
    4aec:	05700993          	li	s3,87
    4af0:	07200a13          	li	s4,114
    4af4:	07700b13          	li	s6,119
    4af8:	06100b93          	li	s7,97
    4afc:	06200c13          	li	s8,98
    4b00:	04100a93          	li	s5,65
    4b04:	04200c93          	li	s9,66
    4b08:	00090513          	mv	a0,s2
    4b0c:	ffffc097          	auipc	ra,0xffffc
    4b10:	7e8080e7          	jalr	2024(ra) # 12f4 <strlen>
    4b14:	10a44a63          	blt	s0,a0,4c28 <fl_fopen+0x1b0>
    4b18:	0000b9b7          	lui	s3,0xb
    4b1c:	fd498a13          	addi	s4,s3,-44 # afd4 <_fs>
    4b20:	038a2783          	lw	a5,56(s4)
    4b24:	00079463          	bnez	a5,4b2c <fl_fopen+0xb4>
    4b28:	fd94f493          	andi	s1,s1,-39
    4b2c:	03ca2783          	lw	a5,60(s4)
    4b30:	00078463          	beqz	a5,4b38 <fl_fopen+0xc0>
    4b34:	000780e7          	jalr	a5
    4b38:	0014f793          	andi	a5,s1,1
    4b3c:	18079263          	bnez	a5,4cc0 <fl_fopen+0x248>
    4b40:	0204f793          	andi	a5,s1,32
    4b44:	08078c63          	beqz	a5,4bdc <fl_fopen+0x164>
    4b48:	038a2783          	lw	a5,56(s4)
    4b4c:	06078a63          	beqz	a5,4bc0 <fl_fopen+0x148>
    4b50:	ffffd097          	auipc	ra,0xffffd
    4b54:	160080e7          	jalr	352(ra) # 1cb0 <_allocate_file>
    4b58:	00050413          	mv	s0,a0
    4b5c:	06050263          	beqz	a0,4bc0 <fl_fopen+0x148>
    4b60:	01450a93          	addi	s5,a0,20
    4b64:	10400613          	li	a2,260
    4b68:	00000593          	li	a1,0
    4b6c:	000a8513          	mv	a0,s5
    4b70:	ffffc097          	auipc	ra,0xffffc
    4b74:	744080e7          	jalr	1860(ra) # 12b4 <memset>
    4b78:	11840b13          	addi	s6,s0,280
    4b7c:	10400613          	li	a2,260
    4b80:	00000593          	li	a1,0
    4b84:	000b0513          	mv	a0,s6
    4b88:	ffffc097          	auipc	ra,0xffffc
    4b8c:	72c080e7          	jalr	1836(ra) # 12b4 <memset>
    4b90:	10400713          	li	a4,260
    4b94:	000b0693          	mv	a3,s6
    4b98:	00070613          	mv	a2,a4
    4b9c:	000a8593          	mv	a1,s5
    4ba0:	000d0513          	mv	a0,s10
    4ba4:	ffffe097          	auipc	ra,0xffffe
    4ba8:	c88080e7          	jalr	-888(ra) # 282c <fatfs_split_path>
    4bac:	fff00793          	li	a5,-1
    4bb0:	12f51663          	bne	a0,a5,4cdc <fl_fopen+0x264>
    4bb4:	00040513          	mv	a0,s0
    4bb8:	ffffd097          	auipc	ra,0xffffd
    4bbc:	170080e7          	jalr	368(ra) # 1d28 <_free_file>
    4bc0:	00000413          	li	s0,0
    4bc4:	0214f793          	andi	a5,s1,33
    4bc8:	02000713          	li	a4,32
    4bcc:	28e79263          	bne	a5,a4,4e50 <fl_fopen+0x3d8>
    4bd0:	10041263          	bnez	s0,4cd4 <fl_fopen+0x25c>
    4bd4:	0064f793          	andi	a5,s1,6
    4bd8:	26079463          	bnez	a5,4e40 <fl_fopen+0x3c8>
    4bdc:	00000413          	li	s0,0
    4be0:	040a2783          	lw	a5,64(s4)
    4be4:	00078463          	beqz	a5,4bec <fl_fopen+0x174>
    4be8:	000780e7          	jalr	a5
    4bec:	05c12083          	lw	ra,92(sp)
    4bf0:	00040513          	mv	a0,s0
    4bf4:	05812403          	lw	s0,88(sp)
    4bf8:	05412483          	lw	s1,84(sp)
    4bfc:	05012903          	lw	s2,80(sp)
    4c00:	04c12983          	lw	s3,76(sp)
    4c04:	04812a03          	lw	s4,72(sp)
    4c08:	04412a83          	lw	s5,68(sp)
    4c0c:	04012b03          	lw	s6,64(sp)
    4c10:	03c12b83          	lw	s7,60(sp)
    4c14:	03812c03          	lw	s8,56(sp)
    4c18:	03412c83          	lw	s9,52(sp)
    4c1c:	03012d03          	lw	s10,48(sp)
    4c20:	06010113          	addi	sp,sp,96
    4c24:	00008067          	ret
    4c28:	008907b3          	add	a5,s2,s0
    4c2c:	0007c783          	lbu	a5,0(a5)
    4c30:	05378863          	beq	a5,s3,4c80 <fl_fopen+0x208>
    4c34:	02f9e863          	bltu	s3,a5,4c64 <fl_fopen+0x1ec>
    4c38:	05578863          	beq	a5,s5,4c88 <fl_fopen+0x210>
    4c3c:	00faea63          	bltu	s5,a5,4c50 <fl_fopen+0x1d8>
    4c40:	02b00713          	li	a4,43
    4c44:	04e78663          	beq	a5,a4,4c90 <fl_fopen+0x218>
    4c48:	00140413          	addi	s0,s0,1
    4c4c:	ebdff06f          	j	4b08 <fl_fopen+0x90>
    4c50:	03978263          	beq	a5,s9,4c74 <fl_fopen+0x1fc>
    4c54:	05200713          	li	a4,82
    4c58:	fee798e3          	bne	a5,a4,4c48 <fl_fopen+0x1d0>
    4c5c:	0014e493          	ori	s1,s1,1
    4c60:	fe9ff06f          	j	4c48 <fl_fopen+0x1d0>
    4c64:	ff478ce3          	beq	a5,s4,4c5c <fl_fopen+0x1e4>
    4c68:	00fa6a63          	bltu	s4,a5,4c7c <fl_fopen+0x204>
    4c6c:	01778e63          	beq	a5,s7,4c88 <fl_fopen+0x210>
    4c70:	fd879ce3          	bne	a5,s8,4c48 <fl_fopen+0x1d0>
    4c74:	0084e493          	ori	s1,s1,8
    4c78:	fd1ff06f          	j	4c48 <fl_fopen+0x1d0>
    4c7c:	fd6796e3          	bne	a5,s6,4c48 <fl_fopen+0x1d0>
    4c80:	0324e493          	ori	s1,s1,50
    4c84:	fc5ff06f          	j	4c48 <fl_fopen+0x1d0>
    4c88:	0264e493          	ori	s1,s1,38
    4c8c:	fbdff06f          	j	4c48 <fl_fopen+0x1d0>
    4c90:	0014f793          	andi	a5,s1,1
    4c94:	00078663          	beqz	a5,4ca0 <fl_fopen+0x228>
    4c98:	0024e493          	ori	s1,s1,2
    4c9c:	fadff06f          	j	4c48 <fl_fopen+0x1d0>
    4ca0:	0024f793          	andi	a5,s1,2
    4ca4:	00078663          	beqz	a5,4cb0 <fl_fopen+0x238>
    4ca8:	0314e493          	ori	s1,s1,49
    4cac:	f9dff06f          	j	4c48 <fl_fopen+0x1d0>
    4cb0:	0044f793          	andi	a5,s1,4
    4cb4:	f8078ae3          	beqz	a5,4c48 <fl_fopen+0x1d0>
    4cb8:	0274e493          	ori	s1,s1,39
    4cbc:	f8dff06f          	j	4c48 <fl_fopen+0x1d0>
    4cc0:	000d0513          	mv	a0,s10
    4cc4:	fffff097          	auipc	ra,0xfffff
    4cc8:	81c080e7          	jalr	-2020(ra) # 34e0 <_open_file>
    4ccc:	00050413          	mv	s0,a0
    4cd0:	e60508e3          	beqz	a0,4b40 <fl_fopen+0xc8>
    4cd4:	42940c23          	sb	s1,1080(s0)
    4cd8:	f09ff06f          	j	4be0 <fl_fopen+0x168>
    4cdc:	00040513          	mv	a0,s0
    4ce0:	ffffe097          	auipc	ra,0xffffe
    4ce4:	dc8080e7          	jalr	-568(ra) # 2aa8 <_check_file_open>
    4ce8:	00050913          	mv	s2,a0
    4cec:	ec0514e3          	bnez	a0,4bb4 <fl_fopen+0x13c>
    4cf0:	01444783          	lbu	a5,20(s0)
    4cf4:	0e079663          	bnez	a5,4de0 <fl_fopen+0x368>
    4cf8:	008a2783          	lw	a5,8(s4)
    4cfc:	00f42023          	sw	a5,0(s0)
    4d00:	00042583          	lw	a1,0(s0)
    4d04:	01010693          	addi	a3,sp,16
    4d08:	000b0613          	mv	a2,s6
    4d0c:	fd498513          	addi	a0,s3,-44
    4d10:	ffffe097          	auipc	ra,0xffffe
    4d14:	428080e7          	jalr	1064(ra) # 3138 <fatfs_get_file_entry>
    4d18:	00100693          	li	a3,1
    4d1c:	e8d50ce3          	beq	a0,a3,4bb4 <fl_fopen+0x13c>
    4d20:	00042223          	sw	zero,4(s0)
    4d24:	00440613          	addi	a2,s0,4
    4d28:	00068593          	mv	a1,a3
    4d2c:	fd498513          	addi	a0,s3,-44
    4d30:	00000097          	auipc	ra,0x0
    4d34:	908080e7          	jalr	-1784(ra) # 4638 <fatfs_allocate_free_space>
    4d38:	e6050ee3          	beqz	a0,4bb4 <fl_fopen+0x13c>
    4d3c:	00002ab7          	lui	s5,0x2
    4d40:	21c40b93          	addi	s7,s0,540
    4d44:	fd498c13          	addi	s8,s3,-44
    4d48:	70fa8a93          	addi	s5,s5,1807 # 270f <fatfs_total_path_levels+0x3b>
    4d4c:	000b0593          	mv	a1,s6
    4d50:	00410513          	addi	a0,sp,4
    4d54:	ffffd097          	auipc	ra,0xffffd
    4d58:	68c080e7          	jalr	1676(ra) # 23e0 <fatfs_lfn_create_sfn>
    4d5c:	08090e63          	beqz	s2,4df8 <fl_fopen+0x380>
    4d60:	00090613          	mv	a2,s2
    4d64:	00410593          	addi	a1,sp,4
    4d68:	000b8513          	mv	a0,s7
    4d6c:	ffffd097          	auipc	ra,0xffffd
    4d70:	7f0080e7          	jalr	2032(ra) # 255c <fatfs_lfn_generate_tail>
    4d74:	00042583          	lw	a1,0(s0)
    4d78:	000b8613          	mv	a2,s7
    4d7c:	000c0513          	mv	a0,s8
    4d80:	fffff097          	auipc	ra,0xfffff
    4d84:	8d4080e7          	jalr	-1836(ra) # 3654 <fatfs_sfn_exists>
    4d88:	00050663          	beqz	a0,4d94 <fl_fopen+0x31c>
    4d8c:	00190913          	addi	s2,s2,1
    4d90:	fb591ee3          	bne	s2,s5,4d4c <fl_fopen+0x2d4>
    4d94:	00442703          	lw	a4,4(s0)
    4d98:	000027b7          	lui	a5,0x2
    4d9c:	70f78793          	addi	a5,a5,1807 # 270f <fatfs_total_path_levels+0x3b>
    4da0:	00070593          	mv	a1,a4
    4da4:	02f90663          	beq	s2,a5,4dd0 <fl_fopen+0x358>
    4da8:	00042583          	lw	a1,0(s0)
    4dac:	00000813          	li	a6,0
    4db0:	00000793          	li	a5,0
    4db4:	000b8693          	mv	a3,s7
    4db8:	000b0613          	mv	a2,s6
    4dbc:	fd498513          	addi	a0,s3,-44
    4dc0:	00000097          	auipc	ra,0x0
    4dc4:	990080e7          	jalr	-1648(ra) # 4750 <fatfs_add_file_entry>
    4dc8:	04051463          	bnez	a0,4e10 <fl_fopen+0x398>
    4dcc:	00442583          	lw	a1,4(s0)
    4dd0:	fd498513          	addi	a0,s3,-44
    4dd4:	fffff097          	auipc	ra,0xfffff
    4dd8:	1b4080e7          	jalr	436(ra) # 3f88 <fatfs_free_cluster_chain>
    4ddc:	dd9ff06f          	j	4bb4 <fl_fopen+0x13c>
    4de0:	00040593          	mv	a1,s0
    4de4:	000a8513          	mv	a0,s5
    4de8:	ffffe097          	auipc	ra,0xffffe
    4dec:	54c080e7          	jalr	1356(ra) # 3334 <_open_directory>
    4df0:	f00518e3          	bnez	a0,4d00 <fl_fopen+0x288>
    4df4:	dc1ff06f          	j	4bb4 <fl_fopen+0x13c>
    4df8:	00b00613          	li	a2,11
    4dfc:	00410593          	addi	a1,sp,4
    4e00:	000b8513          	mv	a0,s7
    4e04:	ffffc097          	auipc	ra,0xffffc
    4e08:	4cc080e7          	jalr	1228(ra) # 12d0 <memcpy>
    4e0c:	f69ff06f          	j	4d74 <fl_fopen+0x2fc>
    4e10:	fff00793          	li	a5,-1
    4e14:	00042623          	sw	zero,12(s0)
    4e18:	00042423          	sw	zero,8(s0)
    4e1c:	42f42823          	sw	a5,1072(s0)
    4e20:	42042a23          	sw	zero,1076(s0)
    4e24:	00042823          	sw	zero,16(s0)
    4e28:	22f42423          	sw	a5,552(s0)
    4e2c:	22f42623          	sw	a5,556(s0)
    4e30:	fd498513          	addi	a0,s3,-44
    4e34:	ffffe097          	auipc	ra,0xffffe
    4e38:	054080e7          	jalr	84(ra) # 2e88 <fatfs_fat_purge>
    4e3c:	d89ff06f          	j	4bc4 <fl_fopen+0x14c>
    4e40:	000d0513          	mv	a0,s10
    4e44:	ffffe097          	auipc	ra,0xffffe
    4e48:	69c080e7          	jalr	1692(ra) # 34e0 <_open_file>
    4e4c:	00050413          	mv	s0,a0
    4e50:	e80412e3          	bnez	s0,4cd4 <fl_fopen+0x25c>
    4e54:	d89ff06f          	j	4bdc <fl_fopen+0x164>
    4e58:	00000413          	li	s0,0
    4e5c:	d91ff06f          	j	4bec <fl_fopen+0x174>

00004e60 <cmd16>:
    4e60:	02000050 00001500                       P.......

00004e68 <acmd41>:
    4e68:	00004069 00000100                       i@......

00004e70 <cmd55>:
    4e70:	00000077 00000100                       w.......

00004e78 <cmd8>:
    4e78:	01000048 000087aa                       H.......

00004e80 <cmd0>:
    4e80:	00000040 00009500                       @.......

00004e88 <AUDIO>:
    4e88:	00018000                                ....

00004e8c <BUTTONS>:
    4e8c:	00010100                                ....

00004e90 <SDCARD>:
    4e90:	00010080                                ....

00004e94 <OLED_RST>:
    4e94:	00010010                                ....

00004e98 <OLED>:
    4e98:	00010008                                ....

00004e9c <LEDS>:
    4e9c:	00010004 00006272 696c632f 722e6b63     ....rb../click.r
    4eac:	00007761 3a727245 0a732520 00000000     aw..Err: %s.....
    4ebc:	79616c50 3a676e69 20732520 20202020     Playing: %s     
    4ecc:	20202020 000a2020 0000002f 00002e2e           ../.......
    4edc:	0000002e 74696e49 20445320 64726163     ....Init SD card
    4eec:	0a2e2e2e 00000000 52494420 0000203a     ........ DIR: ..
    4efc:	74706d45 69642079 74636572 2179726f     Empty directory!
    4f0c:	0000000a 5d64255b 00000020 203e6425     ....[%d] ...%d> 
    4f1c:	00000000 20202020 20202020 20202020     ....            
    4f2c:	20202020 20202020 00000a20 33323130              ...0123
    4f3c:	37363534 42413938 46454443 00000000     456789ABCDEF....
    4f4c:	5f544146 203a5346 6f727245 6f632072     FAT_FS: Error co
    4f5c:	20646c75 20746f6e 64616f6c 54414620     uld not load FAT
    4f6c:	74656420 736c6961 64252820 0a0d2129      details (%d)!..
    4f7c:	00000000                                ....

00004f80 <font>:
    4f80:	00000000 00002f00 00030000 14000003     ...../..........
    4f90:	143e143e 3a2b6a2e 08122600 171c3224     >.>..j+:.&..$2..
    4fa0:	03003415 00000000 0000211e 001e2100     .4.......!...!..
    4fb0:	08220000 0822081c 0000081c 00002040     .."...".....@ ..
    4fc0:	00080800 00200000 20000000 02040810     ...... .... ....
    4fd0:	3f21213f 003f0100 253d0000 25002725     ?!!?..?...=%%'.%
    4fe0:	003f2525 3f040407 25252700 253f003d     %%?....?.'%%=.?%
    4ff0:	01003d25 00030539 3f25253f 25252700     %=..9...?%%?.'%%
    5000:	0028003f 40000000 00000028 00110a04     ?.(....@(.......
    5010:	00141400 0a110000 01000004 0007052d     ............-...
    5020:	253d213f 09093f1f 253f003f 3f003c27     ?!=%.?..?.?%'<.?
    5030:	00212121 1e21213f 25253f00 053f0025     !!!.?!!..?%%%.?.
    5040:	3f000505 003d2521 3f04043f 213f2100     ...?!%=.?..?.!?!
    5050:	20380000 3f013f21 003b0404 2020203f     ..8 !?.?..;.?   
    5060:	3f013f00 023f3f01 3f003f04 003f2121     .?.?.??..?.?!!?.
    5070:	0f09093f 31213f00 093f003f 27002f39     ?....?!1?.?.9/.'
    5080:	003d2525 013f0101 20203f01 100f003f     %%=...?..?  ?...
    5090:	3f001f30 3f203f20 3b04043b 38080f00     0..? ? ?;..;...8
    50a0:	2931000f 3f002325 00000021 04081020     ..1)%#.?!... ...
    50b0:	003f2102 01020000 20000201 00000020     .!?........  ...
    50c0:	00000201 24243800 243f003c 3c003c24     .....8$$<.?$$<.<
    50d0:	00242424 3f24243c 2c2c3c00 3f04002c     $$$.<$$?.<,,,..?
    50e0:	bc000005 00fca4a4 3c04043f 00003d00     ........?..<.=..
    50f0:	fd800000 3f000000 00340808 0000003f     .......?..4.?...
    5100:	3c043c00 043c3c04 3c003c04 003c2424     .<.<.<<..<.<$$<.
    5110:	3c2424fc 24243c00 083c00fc 2c000004     .$$<.<$$..<....,
    5120:	003c2c2c 00243f04 20203c00 100c003c     ,,<..?$..<  <...
    5130:	3c001c30 3c203c20 34080834 a0a0bc00     0..< < <4..4....
    5140:	342400fc 0400242c 0000213f 0000003f     ..$4,$..?!..?...
    5150:	043f2100 02010000 00000102 00000000     .!?.............
    5160:	00000001 00000003 00000005 00000007     ................
    5170:	00000009 0000000e 00000010 00000012     ................
    5180:	00000014 00000016 00000018 0000001c     ................
    5190:	0000001e                                ....

00005194 <current_path>:
    5194:	0000002f 00000000 00000000 00000000     /...............
	...

00005388 <n_items>:
    5388:	00000000                                ....

0000538c <sdcard_while_loading_callback>:
    538c:	00000000                                ....

00005390 <back_color>:
	...

00005391 <front_color>:
    5391:	                                         ...

00005394 <cursor_y>:
    5394:	00000000                                ....

00005398 <cursor_x>:
    5398:	00000000                                ....

0000539c <f_putchar>:
    539c:	00000000                                ....

000053a0 <_free_file_list>:
	...

000053a8 <_open_file_list>:
	...

000053b0 <_filelib_valid>:
    53b0:	00000000                                ....

000053b4 <_filelib_init>:
    53b4:	00000000                                ....
