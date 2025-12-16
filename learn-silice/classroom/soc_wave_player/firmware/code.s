
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
      64:	fe010113          	addi	sp,sp,-32 # ffe0 <_files+0x8c30>
      68:	000057b7          	lui	a5,0x5
      6c:	00812c23          	sw	s0,24(sp)
      70:	df87a403          	lw	s0,-520(a5) # 4df8 <AUDIO>
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
      ec:	e1458593          	addi	a1,a1,-492 # 4e14 <LEDS+0x4>
      f0:	e1850513          	addi	a0,a0,-488 # 4e18 <LEDS+0x8>
      f4:	00112e23          	sw	ra,28(sp)
      f8:	00812c23          	sw	s0,24(sp)
      fc:	00912a23          	sw	s1,20(sp)
     100:	01212823          	sw	s2,16(sp)
     104:	01312623          	sw	s3,12(sp)
     108:	01412423          	sw	s4,8(sp)
     10c:	01512223          	sw	s5,4(sp)
     110:	00005097          	auipc	ra,0x5
     114:	8d8080e7          	jalr	-1832(ra) # 49e8 <fl_fopen>
     118:	0a050263          	beqz	a0,1bc <play_click_noise+0xdc>
     11c:	000015b7          	lui	a1,0x1
     120:	00000613          	li	a2,0
     124:	fa058593          	addi	a1,a1,-96 # fa0 <sdcard_read_sector+0x38>
     128:	00050a13          	mv	s4,a0
     12c:	00002097          	auipc	ra,0x2
     130:	d4c080e7          	jalr	-692(ra) # 1e78 <fl_fseek>
     134:	000057b7          	lui	a5,0x5
     138:	df87aa83          	lw	s5,-520(a5) # 4df8 <AUDIO>
     13c:	20000993          	li	s3,512
     140:	1ff00913          	li	s2,511
     144:	000aa483          	lw	s1,0(s5)
     148:	000a0693          	mv	a3,s4
     14c:	20000613          	li	a2,512
     150:	00100593          	li	a1,1
     154:	00048513          	mv	a0,s1
     158:	00004097          	auipc	ra,0x4
     15c:	28c080e7          	jalr	652(ra) # 43e4 <fl_fread>
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
     190:	17c080e7          	jalr	380(ra) # 4308 <fl_fclose>
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
     1e8:	e1458593          	addi	a1,a1,-492 # 4e14 <LEDS+0x4>
     1ec:	00112623          	sw	ra,12(sp)
     1f0:	00812423          	sw	s0,8(sp)
     1f4:	00004097          	auipc	ra,0x4
     1f8:	7f4080e7          	jalr	2036(ra) # 49e8 <fl_fopen>
     1fc:	08050663          	beqz	a0,288 <view_image_file+0xa8>
     200:	00050413          	mv	s0,a0
     204:	00001097          	auipc	ra,0x1
     208:	354080e7          	jalr	852(ra) # 1558 <display_framebuffer>
     20c:	00040693          	mv	a3,s0
     210:	00004637          	lui	a2,0x4
     214:	00100593          	li	a1,1
     218:	00004097          	auipc	ra,0x4
     21c:	1cc080e7          	jalr	460(ra) # 43e4 <fl_fread>
     220:	00040513          	mv	a0,s0
     224:	00004097          	auipc	ra,0x4
     228:	0e4080e7          	jalr	228(ra) # 4308 <fl_fclose>
     22c:	00001097          	auipc	ra,0x1
     230:	4a8080e7          	jalr	1192(ra) # 16d4 <display_refresh>
     234:	000057b7          	lui	a5,0x5
     238:	e007a683          	lw	a3,-512(a5) # 4e00 <BUTTONS>
     23c:	0006a703          	lw	a4,0(a3)
     240:	fff74793          	not	a5,a4
     244:	0006a703          	lw	a4,0(a3)
     248:	00e7f7b3          	and	a5,a5,a4
     24c:	0027f793          	andi	a5,a5,2
     250:	fe0788e3          	beqz	a5,240 <view_image_file+0x60>
     254:	00000097          	auipc	ra,0x0
     258:	e8c080e7          	jalr	-372(ra) # e0 <play_click_noise>
     25c:	00001097          	auipc	ra,0x1
     260:	2fc080e7          	jalr	764(ra) # 1558 <display_framebuffer>
     264:	00004637          	lui	a2,0x4
     268:	00000593          	li	a1,0
     26c:	00001097          	auipc	ra,0x1
     270:	048080e7          	jalr	72(ra) # 12b4 <memset>
     274:	00812403          	lw	s0,8(sp)
     278:	00c12083          	lw	ra,12(sp)
     27c:	01010113          	addi	sp,sp,16
     280:	00001317          	auipc	t1,0x1
     284:	45430067          	jr	1108(t1) # 16d4 <display_refresh>
     288:	00c12083          	lw	ra,12(sp)
     28c:	00812403          	lw	s0,8(sp)
     290:	01010113          	addi	sp,sp,16
     294:	00008067          	ret

00000298 <play_music_file>:
     298:	000055b7          	lui	a1,0x5
     29c:	fc010113          	addi	sp,sp,-64
     2a0:	e1458593          	addi	a1,a1,-492 # 4e14 <LEDS+0x4>
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
     2e0:	70c080e7          	jalr	1804(ra) # 49e8 <fl_fopen>
     2e4:	08051063          	bnez	a0,364 <play_music_file+0xcc>
     2e8:	00000593          	li	a1,0
     2ec:	0ff00513          	li	a0,255
     2f0:	00001097          	auipc	ra,0x1
     2f4:	288080e7          	jalr	648(ra) # 1578 <display_set_front_back_color>
     2f8:	00005537          	lui	a0,0x5
     2fc:	00040593          	mv	a1,s0
     300:	e2450513          	addi	a0,a0,-476 # 4e24 <LEDS+0x14>
     304:	00001097          	auipc	ra,0x1
     308:	53c080e7          	jalr	1340(ra) # 1840 <printf>
     30c:	00001097          	auipc	ra,0x1
     310:	3c8080e7          	jalr	968(ra) # 16d4 <display_refresh>
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
     374:	1f4080e7          	jalr	500(ra) # 1564 <display_set_cursor>
     378:	00000593          	li	a1,0
     37c:	0ff00513          	li	a0,255
     380:	00001097          	auipc	ra,0x1
     384:	1f8080e7          	jalr	504(ra) # 1578 <display_set_front_back_color>
     388:	00005537          	lui	a0,0x5
     38c:	00040593          	mv	a1,s0
     390:	e3050513          	addi	a0,a0,-464 # 4e30 <LEDS+0x20>
     394:	00001097          	auipc	ra,0x1
     398:	4ac080e7          	jalr	1196(ra) # 1840 <printf>
     39c:	00001097          	auipc	ra,0x1
     3a0:	338080e7          	jalr	824(ra) # 16d4 <display_refresh>
     3a4:	000057b7          	lui	a5,0x5
     3a8:	e007a783          	lw	a5,-512(a5) # 4e00 <BUTTONS>
     3ac:	00000b13          	li	s6,0
     3b0:	00100413          	li	s0,1
     3b4:	0007a483          	lw	s1,0(a5)
     3b8:	00078c93          	mv	s9,a5
     3bc:	000057b7          	lui	a5,0x5
     3c0:	df87ad03          	lw	s10,-520(a5) # 4df8 <AUDIO>
     3c4:	20000a13          	li	s4,512
     3c8:	1ff00993          	li	s3,511
     3cc:	00005937          	lui	s2,0x5
     3d0:	000d2b83          	lw	s7,0(s10)
     3d4:	000c0693          	mv	a3,s8
     3d8:	20000613          	li	a2,512
     3dc:	00100593          	li	a1,1
     3e0:	000b8513          	mv	a0,s7
     3e4:	00004097          	auipc	ra,0x4
     3e8:	000080e7          	jalr	ra # 43e4 <fl_fread>
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
     434:	e1092783          	lw	a5,-496(s2) # 4e10 <LEDS>
     438:	fff4c493          	not	s1,s1
     43c:	0087a023          	sw	s0,0(a5)
     440:	000ca783          	lw	a5,0(s9)
     444:	00f4f4b3          	and	s1,s1,a5
     448:	08048063          	beqz	s1,4c8 <play_music_file+0x230>
     44c:	00000097          	auipc	ra,0x0
     450:	c94080e7          	jalr	-876(ra) # e0 <play_click_noise>
     454:	000c0513          	mv	a0,s8
     458:	00004097          	auipc	ra,0x4
     45c:	eb0080e7          	jalr	-336(ra) # 4308 <fl_fclose>
     460:	00000097          	auipc	ra,0x0
     464:	c04080e7          	jalr	-1020(ra) # 64 <clear_audio>
     468:	e1092783          	lw	a5,-496(s2)
     46c:	0007a023          	sw	zero,0(a5)
     470:	00001097          	auipc	ra,0x1
     474:	0e8080e7          	jalr	232(ra) # 1558 <display_framebuffer>
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
     4c4:	21430067          	jr	532(t1) # 16d4 <display_refresh>
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
     4f0:	e4858593          	addi	a1,a1,-440 # 4e48 <LEDS+0x38>
     4f4:	00005437          	lui	s0,0x5
     4f8:	10848513          	addi	a0,s1,264 # 5108 <current_path>
     4fc:	02112623          	sw	ra,44(sp)
     500:	03212023          	sw	s2,32(sp)
     504:	01312e23          	sw	s3,28(sp)
     508:	01412c23          	sw	s4,24(sp)
     50c:	01512a23          	sw	s5,20(sp)
     510:	01612823          	sw	s6,16(sp)
     514:	01712623          	sw	s7,12(sp)
     518:	2e042e23          	sw	zero,764(s0) # 52fc <n_items>
     51c:	00000097          	auipc	ra,0x0
     520:	b00080e7          	jalr	-1280(ra) # 1c <strcmp>
     524:	06050e63          	beqz	a0,5a0 <scan_files+0xc4>
     528:	00005937          	lui	s2,0x5
     52c:	06400613          	li	a2,100
     530:	00000593          	li	a1,0
     534:	44890513          	addi	a0,s2,1096 # 5448 <files>
     538:	00001097          	auipc	ra,0x1
     53c:	d7c080e7          	jalr	-644(ra) # 12b4 <memset>
     540:	2fc42783          	lw	a5,764(s0)
     544:	44890913          	addi	s2,s2,1096
     548:	000055b7          	lui	a1,0x5
     54c:	00379513          	slli	a0,a5,0x3
     550:	40f50533          	sub	a0,a0,a5
     554:	00251513          	slli	a0,a0,0x2
     558:	40f50533          	sub	a0,a0,a5
     55c:	00251513          	slli	a0,a0,0x2
     560:	00a90533          	add	a0,s2,a0
     564:	e4c58593          	addi	a1,a1,-436 # 4e4c <LEDS+0x3c>
     568:	00001097          	auipc	ra,0x1
     56c:	e10080e7          	jalr	-496(ra) # 1378 <strcpy>
     570:	2fc42703          	lw	a4,764(s0)
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
     59c:	2ee42e23          	sw	a4,764(s0)
     5a0:	000059b7          	lui	s3,0x5
     5a4:	43c98593          	addi	a1,s3,1084 # 543c <dirstat.1>
     5a8:	10848513          	addi	a0,s1,264
     5ac:	00003097          	auipc	ra,0x3
     5b0:	ddc080e7          	jalr	-548(ra) # 3388 <fl_opendir>
     5b4:	14050063          	beqz	a0,6f4 <scan_files+0x218>
     5b8:	00005937          	lui	s2,0x5
     5bc:	000057b7          	lui	a5,0x5
     5c0:	000054b7          	lui	s1,0x5
     5c4:	e5078b93          	addi	s7,a5,-432 # 4e50 <LEDS+0x40>
     5c8:	44848493          	addi	s1,s1,1096 # 5448 <files>
     5cc:	32c90a13          	addi	s4,s2,812 # 532c <dirent.0>
     5d0:	32c90593          	addi	a1,s2,812
     5d4:	43c98513          	addi	a0,s3,1084
     5d8:	00003097          	auipc	ra,0x3
     5dc:	47c080e7          	jalr	1148(ra) # 3a54 <fl_readdir>
     5e0:	00050a93          	mv	s5,a0
     5e4:	00051863          	bnez	a0,5f4 <scan_files+0x118>
     5e8:	2fc42b03          	lw	s6,764(s0)
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
     614:	43c98513          	addi	a0,s3,1084
     618:	01c12983          	lw	s3,28(sp)
     61c:	03010113          	addi	sp,sp,48
     620:	00002317          	auipc	t1,0x2
     624:	95030067          	jr	-1712(t1) # 1f70 <fl_closedir>
     628:	000b8593          	mv	a1,s7
     62c:	32c90513          	addi	a0,s2,812
     630:	00000097          	auipc	ra,0x0
     634:	9ec080e7          	jalr	-1556(ra) # 1c <strcmp>
     638:	f8050ce3          	beqz	a0,5d0 <scan_files+0xf4>
     63c:	000055b7          	lui	a1,0x5
     640:	e4c58593          	addi	a1,a1,-436 # 4e4c <LEDS+0x3c>
     644:	32c90513          	addi	a0,s2,812
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
     67c:	2fc42703          	lw	a4,764(s0)
     680:	06300513          	li	a0,99
     684:	00371793          	slli	a5,a4,0x3
     688:	40e786b3          	sub	a3,a5,a4
     68c:	00269693          	slli	a3,a3,0x2
     690:	40e686b3          	sub	a3,a3,a4
     694:	00269693          	slli	a3,a3,0x2
     698:	014a8633          	add	a2,s5,s4
     69c:	00064583          	lbu	a1,0(a2) # 4000 <fatfs_fat_add_cluster_to_chain+0x98>
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
     6d8:	2ee42e23          	sw	a4,764(s0)
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
     724:	e107a783          	lw	a5,-496(a5) # 4e10 <LEDS>
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
     768:	58c78793          	addi	a5,a5,1420 # 158c <display_putchar>
     76c:	00005b37          	lui	s6,0x5
     770:	30fb2823          	sw	a5,784(s6) # 5310 <f_putchar>
     774:	00001097          	auipc	ra,0x1
     778:	d40080e7          	jalr	-704(ra) # 14b4 <oled_init>
     77c:	00001097          	auipc	ra,0x1
     780:	d44080e7          	jalr	-700(ra) # 14c0 <oled_fullscreen>
     784:	00001097          	auipc	ra,0x1
     788:	dd4080e7          	jalr	-556(ra) # 1558 <display_framebuffer>
     78c:	00004637          	lui	a2,0x4
     790:	00000593          	li	a1,0
     794:	00001097          	auipc	ra,0x1
     798:	b20080e7          	jalr	-1248(ra) # 12b4 <memset>
     79c:	00001097          	auipc	ra,0x1
     7a0:	f38080e7          	jalr	-200(ra) # 16d4 <display_refresh>
     7a4:	00001097          	auipc	ra,0x1
     7a8:	8b0080e7          	jalr	-1872(ra) # 1054 <sdcard_init>
     7ac:	00001097          	auipc	ra,0x1
     7b0:	664080e7          	jalr	1636(ra) # 1e10 <fl_init>
     7b4:	00000593          	li	a1,0
     7b8:	00000513          	li	a0,0
     7bc:	00001097          	auipc	ra,0x1
     7c0:	da8080e7          	jalr	-600(ra) # 1564 <display_set_cursor>
     7c4:	00000593          	li	a1,0
     7c8:	0ff00513          	li	a0,255
     7cc:	00001097          	auipc	ra,0x1
     7d0:	dac080e7          	jalr	-596(ra) # 1578 <display_set_front_back_color>
     7d4:	00005537          	lui	a0,0x5
     7d8:	e5450513          	addi	a0,a0,-428 # 4e54 <LEDS+0x44>
     7dc:	00001097          	auipc	ra,0x1
     7e0:	064080e7          	jalr	100(ra) # 1840 <printf>
     7e4:	000014b7          	lui	s1,0x1
     7e8:	00001437          	lui	s0,0x1
     7ec:	00001097          	auipc	ra,0x1
     7f0:	ee8080e7          	jalr	-280(ra) # 16d4 <display_refresh>
     7f4:	1f848493          	addi	s1,s1,504 # 11f8 <sdcard_writesector>
     7f8:	1a440413          	addi	s0,s0,420 # 11a4 <sdcard_readsector>
     7fc:	00048593          	mv	a1,s1
     800:	00040513          	mv	a0,s0
     804:	00002097          	auipc	ra,0x2
     808:	56c080e7          	jalr	1388(ra) # 2d70 <fl_attach_media>
     80c:	fe0518e3          	bnez	a0,7fc <main+0xdc>
     810:	00000097          	auipc	ra,0x0
     814:	ccc080e7          	jalr	-820(ra) # 4dc <scan_files>
     818:	000057b7          	lui	a5,0x5
     81c:	e6878793          	addi	a5,a5,-408 # 4e68 <LEDS+0x58>
     820:	00f12423          	sw	a5,8(sp)
     824:	000057b7          	lui	a5,0x5
     828:	e007a783          	lw	a5,-512(a5) # 4e00 <BUTTONS>
     82c:	00005ab7          	lui	s5,0x5
     830:	00000913          	li	s2,0
     834:	00000993          	li	s3,0
     838:	00000c13          	li	s8,0
     83c:	00000413          	li	s0,0
     840:	108a8a93          	addi	s5,s5,264 # 5108 <current_path>
     844:	00f12623          	sw	a5,12(sp)
     848:	00000593          	li	a1,0
     84c:	00000513          	li	a0,0
     850:	00001097          	auipc	ra,0x1
     854:	d14080e7          	jalr	-748(ra) # 1564 <display_set_cursor>
     858:	0ffc7593          	zext.b	a1,s8
     85c:	07f58513          	addi	a0,a1,127
     860:	0ff57513          	zext.b	a0,a0
     864:	00001097          	auipc	ra,0x1
     868:	d14080e7          	jalr	-748(ra) # 1578 <display_set_front_back_color>
     86c:	00812503          	lw	a0,8(sp)
     870:	00000493          	li	s1,0
     874:	00f00a13          	li	s4,15
     878:	00001097          	auipc	ra,0x1
     87c:	fc8080e7          	jalr	-56(ra) # 1840 <printf>
     880:	015487b3          	add	a5,s1,s5
     884:	0007c503          	lbu	a0,0(a5)
     888:	00050a63          	beqz	a0,89c <main+0x17c>
     88c:	310b2783          	lw	a5,784(s6)
     890:	00148493          	addi	s1,s1,1
     894:	000780e7          	jalr	a5
     898:	ff4494e3          	bne	s1,s4,880 <main+0x160>
     89c:	310b2783          	lw	a5,784(s6)
     8a0:	00a00513          	li	a0,10
     8a4:	00005d37          	lui	s10,0x5
     8a8:	000780e7          	jalr	a5
     8ac:	00000593          	li	a1,0
     8b0:	0ff00513          	li	a0,255
     8b4:	00001097          	auipc	ra,0x1
     8b8:	cc4080e7          	jalr	-828(ra) # 1578 <display_set_front_back_color>
     8bc:	2fcd2a03          	lw	s4,764(s10) # 52fc <n_items>
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
     8e8:	44878793          	addi	a5,a5,1096 # 5448 <files>
     8ec:	00249493          	slli	s1,s1,0x2
     8f0:	00f484b3          	add	s1,s1,a5
     8f4:	000057b7          	lui	a5,0x5
     8f8:	e8c78793          	addi	a5,a5,-372 # 4e8c <LEDS+0x7c>
     8fc:	00f12023          	sw	a5,0(sp)
     900:	000057b7          	lui	a5,0x5
     904:	e8478793          	addi	a5,a5,-380 # 4e84 <LEDS+0x74>
     908:	00000b93          	li	s7,0
     90c:	00f12223          	sw	a5,4(sp)
     910:	01200d93          	li	s11,18
     914:	194bc063          	blt	s7,s4,a94 <main+0x374>
     918:	00000593          	li	a1,0
     91c:	00000513          	li	a0,0
     920:	000054b7          	lui	s1,0x5
     924:	00001097          	auipc	ra,0x1
     928:	c54080e7          	jalr	-940(ra) # 1578 <display_set_front_back_color>
     92c:	00c00b93          	li	s7,12
     930:	e9448493          	addi	s1,s1,-364 # 4e94 <LEDS+0x84>
     934:	057a0263          	beq	s4,s7,978 <main+0x258>
     938:	00048513          	mv	a0,s1
     93c:	00001097          	auipc	ra,0x1
     940:	f04080e7          	jalr	-252(ra) # 1840 <printf>
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
     96c:	e7050513          	addi	a0,a0,-400 # 4e70 <LEDS+0x60>
     970:	00001097          	auipc	ra,0x1
     974:	ed0080e7          	jalr	-304(ra) # 1840 <printf>
     978:	00001097          	auipc	ra,0x1
     97c:	d5c080e7          	jalr	-676(ra) # 16d4 <display_refresh>
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
     9d8:	448b8b93          	addi	s7,s7,1096 # 5448 <files>
     9dc:	fffff097          	auipc	ra,0xfffff
     9e0:	704080e7          	jalr	1796(ra) # e0 <play_click_noise>
     9e4:	017484b3          	add	s1,s1,s7
     9e8:	0684a783          	lw	a5,104(s1)
     9ec:	1a078863          	beqz	a5,b9c <main+0x47c>
     9f0:	000055b7          	lui	a1,0x5
     9f4:	e4c58593          	addi	a1,a1,-436 # 4e4c <LEDS+0x3c>
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
     a48:	b14080e7          	jalr	-1260(ra) # 1558 <display_framebuffer>
     a4c:	00004637          	lui	a2,0x4
     a50:	00000593          	li	a1,0
     a54:	00001097          	auipc	ra,0x1
     a58:	860080e7          	jalr	-1952(ra) # 12b4 <memset>
     a5c:	00001097          	auipc	ra,0x1
     a60:	c78080e7          	jalr	-904(ra) # 16d4 <display_refresh>
     a64:	00000913          	li	s2,0
     a68:	00000413          	li	s0,0
     a6c:	2fcd2783          	lw	a5,764(s10)
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
     aa8:	ad4080e7          	jalr	-1324(ra) # 1578 <display_set_front_back_color>
     aac:	0684a783          	lw	a5,104(s1)
     ab0:	000c8593          	mv	a1,s9
     ab4:	04078c63          	beqz	a5,b0c <main+0x3ec>
     ab8:	00412503          	lw	a0,4(sp)
     abc:	00001097          	auipc	ra,0x1
     ac0:	d84080e7          	jalr	-636(ra) # 1840 <printf>
     ac4:	00000c93          	li	s9,0
     ac8:	019487b3          	add	a5,s1,s9
     acc:	0007c503          	lbu	a0,0(a5)
     ad0:	00050a63          	beqz	a0,ae4 <main+0x3c4>
     ad4:	310b2783          	lw	a5,784(s6)
     ad8:	001c8c93          	addi	s9,s9,1
     adc:	000780e7          	jalr	a5
     ae0:	ffbc94e3          	bne	s9,s11,ac8 <main+0x3a8>
     ae4:	310b2783          	lw	a5,784(s6)
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
     b30:	e4858593          	addi	a1,a1,-440 # 4e48 <LEDS+0x38>
     b34:	000a8513          	mv	a0,s5
     b38:	00001097          	auipc	ra,0x1
     b3c:	840080e7          	jalr	-1984(ra) # 1378 <strcpy>
     b40:	efdff06f          	j	a3c <main+0x31c>
     b44:	00170713          	addi	a4,a4,1
     b48:	00ea87b3          	add	a5,s5,a4
     b4c:	0007c683          	lbu	a3,0(a5)
     b50:	fe069ae3          	bnez	a3,b44 <main+0x424>
     b54:	00d48633          	add	a2,s1,a3
     b58:	00064603          	lbu	a2,0(a2) # 4000 <fatfs_fat_add_cluster_to_chain+0x98>
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
     bf4:	00178793          	addi	a5,a5,1 # 4001 <fatfs_fat_add_cluster_to_chain+0x99>
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
     c44:	e047a783          	lw	a5,-508(a5) # 4e04 <SDCARD>
     c48:	00200713          	li	a4,2
     c4c:	00e7a023          	sw	a4,0(a5)
     c50:	00008067          	ret

00000c54 <sdcard_ponder>:
     c54:	000056b7          	lui	a3,0x5
     c58:	e046a683          	lw	a3,-508(a3) # 4e04 <SDCARD>
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
     c84:	e047a783          	lw	a5,-508(a5) # 4e04 <SDCARD>
     c88:	00600713          	li	a4,6
     c8c:	00e7a023          	sw	a4,0(a5)
     c90:	00008067          	ret

00000c94 <sdcard_send>:
     c94:	000057b7          	lui	a5,0x5
     c98:	e047a783          	lw	a5,-508(a5) # 4e04 <SDCARD>
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
     d44:	3007a783          	lw	a5,768(a5) # 5300 <sdcard_while_loading_callback>
     d48:	00078067          	jr	a5

00000d4c <sdcard_read>:
     d4c:	fd010113          	addi	sp,sp,-48
     d50:	fff50793          	addi	a5,a0,-1
     d54:	03212023          	sw	s2,32(sp)
     d58:	00100913          	li	s2,1
     d5c:	00f91933          	sll	s2,s2,a5
     d60:	000057b7          	lui	a5,0x5
     d64:	01312e23          	sw	s3,28(sp)
     d68:	e047a983          	lw	s3,-508(a5) # 4e04 <SDCARD>
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
     dec:	300b2783          	lw	a5,768(s6) # 5300 <sdcard_while_loading_callback>
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
    1000:	e047a403          	lw	s0,-508(a5) # 4e04 <SDCARD>
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
    1064:	30f72023          	sw	a5,768(a4) # 5300 <sdcard_while_loading_callback>
    1068:	000057b7          	lui	a5,0x5
    106c:	00812c23          	sw	s0,24(sp)
    1070:	00912a23          	sw	s1,20(sp)
    1074:	00112e23          	sw	ra,28(sp)
    1078:	df078493          	addi	s1,a5,-528 # 4df0 <cmd0>
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
    10d0:	de850513          	addi	a0,a0,-536 # 4de8 <cmd8>
    10d4:	00000097          	auipc	ra,0x0
    10d8:	dac080e7          	jalr	-596(ra) # e80 <sdcard_cmd>
    10dc:	00100593          	li	a1,1
    10e0:	02800513          	li	a0,40
    10e4:	00000097          	auipc	ra,0x0
    10e8:	d24080e7          	jalr	-732(ra) # e08 <sdcard_get>
    10ec:	00000097          	auipc	ra,0x0
    10f0:	b68080e7          	jalr	-1176(ra) # c54 <sdcard_ponder>
    10f4:	000057b7          	lui	a5,0x5
    10f8:	de078413          	addi	s0,a5,-544 # 4de0 <cmd55>
    10fc:	000057b7          	lui	a5,0x5
    1100:	dd878493          	addi	s1,a5,-552 # 4dd8 <acmd41>
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
    1170:	dd050513          	addi	a0,a0,-560 # 4dd0 <cmd16>
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
    13bc:	e087a703          	lw	a4,-504(a5) # 4e08 <OLED_RST>
    13c0:	fe010113          	addi	sp,sp,-32
    13c4:	00112e23          	sw	ra,28(sp)
    13c8:	00812c23          	sw	s0,24(sp)
    13cc:	00072023          	sw	zero,0(a4)
    13d0:	00040737          	lui	a4,0x40
    13d4:	00000013          	nop
    13d8:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
    13dc:	fe071ce3          	bnez	a4,13d4 <oled_init_mode+0x1c>
    13e0:	e087a703          	lw	a4,-504(a5)
    13e4:	00100693          	li	a3,1
    13e8:	00d72023          	sw	a3,0(a4)
    13ec:	00040737          	lui	a4,0x40
    13f0:	00000013          	nop
    13f4:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
    13f8:	fe071ce3          	bnez	a4,13f0 <oled_init_mode+0x38>
    13fc:	e087a783          	lw	a5,-504(a5)
    1400:	0007a023          	sw	zero,0(a5)
    1404:	000407b7          	lui	a5,0x40
    1408:	00000013          	nop
    140c:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
    1410:	fe079ce3          	bnez	a5,1408 <oled_init_mode+0x50>
    1414:	00005737          	lui	a4,0x5
    1418:	e0c72783          	lw	a5,-500(a4) # 4e0c <OLED>
    141c:	2af00693          	li	a3,687
    1420:	00d7a023          	sw	a3,0(a5)
    1424:	000407b7          	lui	a5,0x40
    1428:	00000013          	nop
    142c:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
    1430:	fe079ce3          	bnez	a5,1428 <oled_init_mode+0x70>
    1434:	e0c72403          	lw	s0,-500(a4)
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
    14cc:	e0c7a403          	lw	s0,-500(a5) # 4e0c <OLED>
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

00001558 <display_framebuffer>:
    1558:	000057b7          	lui	a5,0x5
    155c:	dfc7a503          	lw	a0,-516(a5) # 4dfc <DISPLAY>
    1560:	00008067          	ret

00001564 <display_set_cursor>:
    1564:	000057b7          	lui	a5,0x5
    1568:	30a7a623          	sw	a0,780(a5) # 530c <cursor_x>
    156c:	000057b7          	lui	a5,0x5
    1570:	30b7a423          	sw	a1,776(a5) # 5308 <cursor_y>
    1574:	00008067          	ret

00001578 <display_set_front_back_color>:
    1578:	000057b7          	lui	a5,0x5
    157c:	30a782a3          	sb	a0,773(a5) # 5305 <front_color>
    1580:	000057b7          	lui	a5,0x5
    1584:	30b78223          	sb	a1,772(a5) # 5304 <back_color>
    1588:	00008067          	ret

0000158c <display_putchar>:
    158c:	00a00793          	li	a5,10
    1590:	00005737          	lui	a4,0x5
    1594:	02f51663          	bne	a0,a5,15c0 <display_putchar+0x34>
    1598:	30072623          	sw	zero,780(a4) # 530c <cursor_x>
    159c:	00005737          	lui	a4,0x5
    15a0:	30872783          	lw	a5,776(a4) # 5308 <cursor_y>
    15a4:	00878793          	addi	a5,a5,8
    15a8:	30f72423          	sw	a5,776(a4)
    15ac:	07f00713          	li	a4,127
    15b0:	00f75663          	bge	a4,a5,15bc <display_putchar+0x30>
    15b4:	000057b7          	lui	a5,0x5
    15b8:	3007a423          	sw	zero,776(a5) # 5308 <cursor_y>
    15bc:	00008067          	ret
    15c0:	ff010113          	addi	sp,sp,-16
    15c4:	00812623          	sw	s0,12(sp)
    15c8:	01f00793          	li	a5,31
    15cc:	0ca7d263          	bge	a5,a0,1690 <display_putchar+0x104>
    15d0:	00005e37          	lui	t3,0x5
    15d4:	308e2783          	lw	a5,776(t3) # 5308 <cursor_y>
    15d8:	07800693          	li	a3,120
    15dc:	00800593          	li	a1,8
    15e0:	00f6d663          	bge	a3,a5,15ec <display_putchar+0x60>
    15e4:	08000593          	li	a1,128
    15e8:	40f585b3          	sub	a1,a1,a5
    15ec:	30c72783          	lw	a5,780(a4)
    15f0:	07b00693          	li	a3,123
    15f4:	00500813          	li	a6,5
    15f8:	00f6d663          	bge	a3,a5,1604 <display_putchar+0x78>
    15fc:	08000813          	li	a6,128
    1600:	40f80833          	sub	a6,a6,a5
    1604:	000057b7          	lui	a5,0x5
    1608:	dfc7a283          	lw	t0,-516(a5) # 4dfc <DISPLAY>
    160c:	000056b7          	lui	a3,0x5
    1610:	00251793          	slli	a5,a0,0x2
    1614:	ef468693          	addi	a3,a3,-268 # 4ef4 <font>
    1618:	00a787b3          	add	a5,a5,a0
    161c:	00d78533          	add	a0,a5,a3
    1620:	00100f93          	li	t6,1
    1624:	00000693          	li	a3,0
    1628:	000053b7          	lui	t2,0x5
    162c:	00005437          	lui	s0,0x5
    1630:	06b6d063          	bge	a3,a1,1690 <display_putchar+0x104>
    1634:	00df9f33          	sll	t5,t6,a3
    1638:	00050893          	mv	a7,a0
    163c:	00000613          	li	a2,0
    1640:	03c0006f          	j	167c <display_putchar+0xf0>
    1644:	f608c783          	lbu	a5,-160(a7)
    1648:	01e7f7b3          	and	a5,a5,t5
    164c:	02078e63          	beqz	a5,1688 <display_putchar+0xfc>
    1650:	30544e83          	lbu	t4,773(s0) # 5305 <front_color>
    1654:	30c72783          	lw	a5,780(a4)
    1658:	308e2303          	lw	t1,776(t3)
    165c:	00188893          	addi	a7,a7,1
    1660:	00f607b3          	add	a5,a2,a5
    1664:	00779793          	slli	a5,a5,0x7
    1668:	00668333          	add	t1,a3,t1
    166c:	006787b3          	add	a5,a5,t1
    1670:	00f287b3          	add	a5,t0,a5
    1674:	01d78023          	sb	t4,0(a5)
    1678:	00160613          	addi	a2,a2,1
    167c:	fd0644e3          	blt	a2,a6,1644 <display_putchar+0xb8>
    1680:	00168693          	addi	a3,a3,1
    1684:	fadff06f          	j	1630 <display_putchar+0xa4>
    1688:	3043ce83          	lbu	t4,772(t2) # 5304 <back_color>
    168c:	fc9ff06f          	j	1654 <display_putchar+0xc8>
    1690:	30c72783          	lw	a5,780(a4)
    1694:	07f00693          	li	a3,127
    1698:	00578793          	addi	a5,a5,5
    169c:	00f6c663          	blt	a3,a5,16a8 <display_putchar+0x11c>
    16a0:	30f72623          	sw	a5,780(a4)
    16a4:	0240006f          	j	16c8 <display_putchar+0x13c>
    16a8:	30072623          	sw	zero,780(a4)
    16ac:	00005737          	lui	a4,0x5
    16b0:	30872783          	lw	a5,776(a4) # 5308 <cursor_y>
    16b4:	00878793          	addi	a5,a5,8
    16b8:	30f72423          	sw	a5,776(a4)
    16bc:	00f6d663          	bge	a3,a5,16c8 <display_putchar+0x13c>
    16c0:	000057b7          	lui	a5,0x5
    16c4:	3007a423          	sw	zero,776(a5) # 5308 <cursor_y>
    16c8:	00c12403          	lw	s0,12(sp)
    16cc:	01010113          	addi	sp,sp,16
    16d0:	00008067          	ret

000016d4 <display_refresh>:
    16d4:	00008067          	ret

000016d8 <print_string>:
    16d8:	ff010113          	addi	sp,sp,-16
    16dc:	00812423          	sw	s0,8(sp)
    16e0:	00912223          	sw	s1,4(sp)
    16e4:	00112623          	sw	ra,12(sp)
    16e8:	00050413          	mv	s0,a0
    16ec:	000054b7          	lui	s1,0x5
    16f0:	00044503          	lbu	a0,0(s0)
    16f4:	00051c63          	bnez	a0,170c <print_string+0x34>
    16f8:	00c12083          	lw	ra,12(sp)
    16fc:	00812403          	lw	s0,8(sp)
    1700:	00412483          	lw	s1,4(sp)
    1704:	01010113          	addi	sp,sp,16
    1708:	00008067          	ret
    170c:	3104a783          	lw	a5,784(s1) # 5310 <f_putchar>
    1710:	00140413          	addi	s0,s0,1
    1714:	000780e7          	jalr	a5
    1718:	fd9ff06f          	j	16f0 <print_string+0x18>

0000171c <print_dec>:
    171c:	ef010113          	addi	sp,sp,-272
    1720:	10812423          	sw	s0,264(sp)
    1724:	10912223          	sw	s1,260(sp)
    1728:	10112623          	sw	ra,268(sp)
    172c:	11212023          	sw	s2,256(sp)
    1730:	00050413          	mv	s0,a0
    1734:	000054b7          	lui	s1,0x5
    1738:	08045063          	bgez	s0,17b8 <print_dec+0x9c>
    173c:	3104a783          	lw	a5,784(s1) # 5310 <f_putchar>
    1740:	02d00513          	li	a0,45
    1744:	40800433          	neg	s0,s0
    1748:	000780e7          	jalr	a5
    174c:	fedff06f          	j	1738 <print_dec+0x1c>
    1750:	00040513          	mv	a0,s0
    1754:	00a00593          	li	a1,10
    1758:	00000097          	auipc	ra,0x0
    175c:	aa8080e7          	jalr	-1368(ra) # 1200 <__divsi3>
    1760:	00251793          	slli	a5,a0,0x2
    1764:	00f507b3          	add	a5,a0,a5
    1768:	00179793          	slli	a5,a5,0x1
    176c:	40f40433          	sub	s0,s0,a5
    1770:	00148493          	addi	s1,s1,1
    1774:	fe848fa3          	sb	s0,-1(s1)
    1778:	00050413          	mv	s0,a0
    177c:	fc041ae3          	bnez	s0,1750 <print_dec+0x34>
    1780:	fd2488e3          	beq	s1,s2,1750 <print_dec+0x34>
    1784:	00005437          	lui	s0,0x5
    1788:	fff4c503          	lbu	a0,-1(s1)
    178c:	31042783          	lw	a5,784(s0) # 5310 <f_putchar>
    1790:	fff48493          	addi	s1,s1,-1
    1794:	03050513          	addi	a0,a0,48
    1798:	000780e7          	jalr	a5
    179c:	ff2496e3          	bne	s1,s2,1788 <print_dec+0x6c>
    17a0:	10c12083          	lw	ra,268(sp)
    17a4:	10812403          	lw	s0,264(sp)
    17a8:	10412483          	lw	s1,260(sp)
    17ac:	10012903          	lw	s2,256(sp)
    17b0:	11010113          	addi	sp,sp,272
    17b4:	00008067          	ret
    17b8:	00010493          	mv	s1,sp
    17bc:	00010913          	mv	s2,sp
    17c0:	fbdff06f          	j	177c <print_dec+0x60>

000017c4 <print_hex_digits>:
    17c4:	fe010113          	addi	sp,sp,-32
    17c8:	00812c23          	sw	s0,24(sp)
    17cc:	00912a23          	sw	s1,20(sp)
    17d0:	fff58413          	addi	s0,a1,-1
    17d4:	000054b7          	lui	s1,0x5
    17d8:	01212823          	sw	s2,16(sp)
    17dc:	01312623          	sw	s3,12(sp)
    17e0:	00112e23          	sw	ra,28(sp)
    17e4:	00050993          	mv	s3,a0
    17e8:	00241413          	slli	s0,s0,0x2
    17ec:	eac48493          	addi	s1,s1,-340 # 4eac <LEDS+0x9c>
    17f0:	00005937          	lui	s2,0x5
    17f4:	02045063          	bgez	s0,1814 <print_hex_digits+0x50>
    17f8:	01c12083          	lw	ra,28(sp)
    17fc:	01812403          	lw	s0,24(sp)
    1800:	01412483          	lw	s1,20(sp)
    1804:	01012903          	lw	s2,16(sp)
    1808:	00c12983          	lw	s3,12(sp)
    180c:	02010113          	addi	sp,sp,32
    1810:	00008067          	ret
    1814:	0089d7b3          	srl	a5,s3,s0
    1818:	00f7f793          	andi	a5,a5,15
    181c:	00f487b3          	add	a5,s1,a5
    1820:	31092703          	lw	a4,784(s2) # 5310 <f_putchar>
    1824:	0007c503          	lbu	a0,0(a5)
    1828:	ffc40413          	addi	s0,s0,-4
    182c:	000700e7          	jalr	a4
    1830:	fc5ff06f          	j	17f4 <print_hex_digits+0x30>

00001834 <print_hex>:
    1834:	00800593          	li	a1,8
    1838:	00000317          	auipc	t1,0x0
    183c:	f8c30067          	jr	-116(t1) # 17c4 <print_hex_digits>

00001840 <printf>:
    1840:	fa010113          	addi	sp,sp,-96
    1844:	04f12a23          	sw	a5,84(sp)
    1848:	04410793          	addi	a5,sp,68
    184c:	02812c23          	sw	s0,56(sp)
    1850:	02912a23          	sw	s1,52(sp)
    1854:	03212823          	sw	s2,48(sp)
    1858:	03312623          	sw	s3,44(sp)
    185c:	03412423          	sw	s4,40(sp)
    1860:	03512223          	sw	s5,36(sp)
    1864:	03612023          	sw	s6,32(sp)
    1868:	02112e23          	sw	ra,60(sp)
    186c:	01712e23          	sw	s7,28(sp)
    1870:	00050413          	mv	s0,a0
    1874:	04b12223          	sw	a1,68(sp)
    1878:	04c12423          	sw	a2,72(sp)
    187c:	04d12623          	sw	a3,76(sp)
    1880:	04e12823          	sw	a4,80(sp)
    1884:	05012c23          	sw	a6,88(sp)
    1888:	05112e23          	sw	a7,92(sp)
    188c:	00f12623          	sw	a5,12(sp)
    1890:	02500913          	li	s2,37
    1894:	000054b7          	lui	s1,0x5
    1898:	07300993          	li	s3,115
    189c:	07800a13          	li	s4,120
    18a0:	06400a93          	li	s5,100
    18a4:	06300b13          	li	s6,99
    18a8:	00044503          	lbu	a0,0(s0)
    18ac:	02051863          	bnez	a0,18dc <printf+0x9c>
    18b0:	03c12083          	lw	ra,60(sp)
    18b4:	03812403          	lw	s0,56(sp)
    18b8:	03412483          	lw	s1,52(sp)
    18bc:	03012903          	lw	s2,48(sp)
    18c0:	02c12983          	lw	s3,44(sp)
    18c4:	02812a03          	lw	s4,40(sp)
    18c8:	02412a83          	lw	s5,36(sp)
    18cc:	02012b03          	lw	s6,32(sp)
    18d0:	01c12b83          	lw	s7,28(sp)
    18d4:	06010113          	addi	sp,sp,96
    18d8:	00008067          	ret
    18dc:	09251a63          	bne	a0,s2,1970 <printf+0x130>
    18e0:	00144503          	lbu	a0,1(s0)
    18e4:	00140b93          	addi	s7,s0,1
    18e8:	03351463          	bne	a0,s3,1910 <printf+0xd0>
    18ec:	00c12783          	lw	a5,12(sp)
    18f0:	0007a503          	lw	a0,0(a5)
    18f4:	00478713          	addi	a4,a5,4
    18f8:	00e12623          	sw	a4,12(sp)
    18fc:	00000097          	auipc	ra,0x0
    1900:	ddc080e7          	jalr	-548(ra) # 16d8 <print_string>
    1904:	000b8413          	mv	s0,s7
    1908:	00140413          	addi	s0,s0,1
    190c:	f9dff06f          	j	18a8 <printf+0x68>
    1910:	03451063          	bne	a0,s4,1930 <printf+0xf0>
    1914:	00c12783          	lw	a5,12(sp)
    1918:	0007a503          	lw	a0,0(a5)
    191c:	00478713          	addi	a4,a5,4
    1920:	00e12623          	sw	a4,12(sp)
    1924:	00000097          	auipc	ra,0x0
    1928:	f10080e7          	jalr	-240(ra) # 1834 <print_hex>
    192c:	fd9ff06f          	j	1904 <printf+0xc4>
    1930:	03551063          	bne	a0,s5,1950 <printf+0x110>
    1934:	00c12783          	lw	a5,12(sp)
    1938:	0007a503          	lw	a0,0(a5)
    193c:	00478713          	addi	a4,a5,4
    1940:	00e12623          	sw	a4,12(sp)
    1944:	00000097          	auipc	ra,0x0
    1948:	dd8080e7          	jalr	-552(ra) # 171c <print_dec>
    194c:	fb9ff06f          	j	1904 <printf+0xc4>
    1950:	3104a783          	lw	a5,784(s1) # 5310 <f_putchar>
    1954:	01651a63          	bne	a0,s6,1968 <printf+0x128>
    1958:	00c12703          	lw	a4,12(sp)
    195c:	00072503          	lw	a0,0(a4)
    1960:	00470693          	addi	a3,a4,4
    1964:	00d12623          	sw	a3,12(sp)
    1968:	000780e7          	jalr	a5
    196c:	f99ff06f          	j	1904 <printf+0xc4>
    1970:	3104a783          	lw	a5,784(s1)
    1974:	000780e7          	jalr	a5
    1978:	f91ff06f          	j	1908 <printf+0xc8>

0000197c <__mulsi3>:
    197c:	00050793          	mv	a5,a0
    1980:	00000513          	li	a0,0
    1984:	00079463          	bnez	a5,198c <__mulsi3+0x10>
    1988:	00008067          	ret
    198c:	01f79693          	slli	a3,a5,0x1f
    1990:	41f6d713          	srai	a4,a3,0x1f
    1994:	00b77733          	and	a4,a4,a1
    1998:	00e50533          	add	a0,a0,a4
    199c:	0017d793          	srli	a5,a5,0x1
    19a0:	00159593          	slli	a1,a1,0x1
    19a4:	fe1ff06f          	j	1984 <__mulsi3+0x8>

000019a8 <fat_list_insert_last>:
    19a8:	00452783          	lw	a5,4(a0)
    19ac:	04079263          	bnez	a5,19f0 <fat_list_insert_last+0x48>
    19b0:	00052783          	lw	a5,0(a0)
    19b4:	00079c63          	bnez	a5,19cc <fat_list_insert_last+0x24>
    19b8:	00b52023          	sw	a1,0(a0)
    19bc:	00b52223          	sw	a1,4(a0)
    19c0:	0005a023          	sw	zero,0(a1)
    19c4:	0005a223          	sw	zero,4(a1)
    19c8:	00008067          	ret
    19cc:	0007a703          	lw	a4,0(a5)
    19d0:	00f5a223          	sw	a5,4(a1)
    19d4:	00e5a023          	sw	a4,0(a1)
    19d8:	00071863          	bnez	a4,19e8 <fat_list_insert_last+0x40>
    19dc:	00b52023          	sw	a1,0(a0)
    19e0:	00b7a023          	sw	a1,0(a5)
    19e4:	00008067          	ret
    19e8:	00b72223          	sw	a1,4(a4)
    19ec:	ff5ff06f          	j	19e0 <fat_list_insert_last+0x38>
    19f0:	0047a703          	lw	a4,4(a5)
    19f4:	00f5a023          	sw	a5,0(a1)
    19f8:	00e5a223          	sw	a4,4(a1)
    19fc:	00071863          	bnez	a4,1a0c <fat_list_insert_last+0x64>
    1a00:	00b52223          	sw	a1,4(a0)
    1a04:	00b7a223          	sw	a1,4(a5)
    1a08:	00008067          	ret
    1a0c:	00b72023          	sw	a1,0(a4)
    1a10:	ff5ff06f          	j	1a04 <fat_list_insert_last+0x5c>

00001a14 <FileString_StrCmpNoCase>:
    1a14:	00050e93          	mv	t4,a0
    1a18:	00000793          	li	a5,0
    1a1c:	01900e13          	li	t3,25
    1a20:	00c79663          	bne	a5,a2,1a2c <FileString_StrCmpNoCase+0x18>
    1a24:	00000513          	li	a0,0
    1a28:	00008067          	ret
    1a2c:	00fe8733          	add	a4,t4,a5
    1a30:	00074803          	lbu	a6,0(a4)
    1a34:	00f58733          	add	a4,a1,a5
    1a38:	00074883          	lbu	a7,0(a4)
    1a3c:	fbf80713          	addi	a4,a6,-65
    1a40:	0ff77713          	zext.b	a4,a4
    1a44:	00080693          	mv	a3,a6
    1a48:	00ee6663          	bltu	t3,a4,1a54 <FileString_StrCmpNoCase+0x40>
    1a4c:	02080693          	addi	a3,a6,32
    1a50:	0ff6f693          	zext.b	a3,a3
    1a54:	fbf88313          	addi	t1,a7,-65
    1a58:	0ff37313          	zext.b	t1,t1
    1a5c:	00088713          	mv	a4,a7
    1a60:	006e6663          	bltu	t3,t1,1a6c <FileString_StrCmpNoCase+0x58>
    1a64:	02088713          	addi	a4,a7,32
    1a68:	0ff77713          	zext.b	a4,a4
    1a6c:	40e68533          	sub	a0,a3,a4
    1a70:	00e69863          	bne	a3,a4,1a80 <FileString_StrCmpNoCase+0x6c>
    1a74:	00178793          	addi	a5,a5,1
    1a78:	00088463          	beqz	a7,1a80 <FileString_StrCmpNoCase+0x6c>
    1a7c:	fa0812e3          	bnez	a6,1a20 <FileString_StrCmpNoCase+0xc>
    1a80:	00008067          	ret

00001a84 <FileString_GetExtension>:
    1a84:	00050793          	mv	a5,a0
    1a88:	fff00713          	li	a4,-1
    1a8c:	02e00613          	li	a2,46
    1a90:	0007c683          	lbu	a3,0(a5)
    1a94:	00069663          	bnez	a3,1aa0 <FileString_GetExtension+0x1c>
    1a98:	00070513          	mv	a0,a4
    1a9c:	00008067          	ret
    1aa0:	00c69463          	bne	a3,a2,1aa8 <FileString_GetExtension+0x24>
    1aa4:	40a78733          	sub	a4,a5,a0
    1aa8:	00178793          	addi	a5,a5,1
    1aac:	fe5ff06f          	j	1a90 <FileString_GetExtension+0xc>

00001ab0 <fatfs_fat_writeback>:
    1ab0:	00059e63          	bnez	a1,1acc <fatfs_fat_writeback+0x1c>
    1ab4:	00000513          	li	a0,0
    1ab8:	00008067          	ret
    1abc:	00000513          	li	a0,0
    1ac0:	01c12083          	lw	ra,28(sp)
    1ac4:	02010113          	addi	sp,sp,32
    1ac8:	00008067          	ret
    1acc:	2045a783          	lw	a5,516(a1)
    1ad0:	04078e63          	beqz	a5,1b2c <fatfs_fat_writeback+0x7c>
    1ad4:	03852683          	lw	a3,56(a0)
    1ad8:	00050793          	mv	a5,a0
    1adc:	04068663          	beqz	a3,1b28 <fatfs_fat_writeback+0x78>
    1ae0:	0147a703          	lw	a4,20(a5)
    1ae4:	2005a503          	lw	a0,512(a1)
    1ae8:	0207a803          	lw	a6,32(a5)
    1aec:	00100613          	li	a2,1
    1af0:	fe010113          	addi	sp,sp,-32
    1af4:	40e607b3          	sub	a5,a2,a4
    1af8:	00112e23          	sw	ra,28(sp)
    1afc:	00a787b3          	add	a5,a5,a0
    1b00:	00f87663          	bgeu	a6,a5,1b0c <fatfs_fat_writeback+0x5c>
    1b04:	01070733          	add	a4,a4,a6
    1b08:	40a70633          	sub	a2,a4,a0
    1b0c:	00b12623          	sw	a1,12(sp)
    1b10:	000680e7          	jalr	a3
    1b14:	fa0504e3          	beqz	a0,1abc <fatfs_fat_writeback+0xc>
    1b18:	00c12583          	lw	a1,12(sp)
    1b1c:	00100513          	li	a0,1
    1b20:	2005a223          	sw	zero,516(a1)
    1b24:	f9dff06f          	j	1ac0 <fatfs_fat_writeback+0x10>
    1b28:	2005a223          	sw	zero,516(a1)
    1b2c:	00100513          	li	a0,1
    1b30:	00008067          	ret

00001b34 <fatfs_fat_read_sector>:
    1b34:	fe010113          	addi	sp,sp,-32
    1b38:	01212823          	sw	s2,16(sp)
    1b3c:	25452903          	lw	s2,596(a0)
    1b40:	00812c23          	sw	s0,24(sp)
    1b44:	00112e23          	sw	ra,28(sp)
    1b48:	00912a23          	sw	s1,20(sp)
    1b4c:	01312623          	sw	s3,12(sp)
    1b50:	00000413          	li	s0,0
    1b54:	04091463          	bnez	s2,1b9c <fatfs_fat_read_sector+0x68>
    1b58:	25452783          	lw	a5,596(a0)
    1b5c:	00058493          	mv	s1,a1
    1b60:	00050993          	mv	s3,a0
    1b64:	20f42623          	sw	a5,524(s0)
    1b68:	20442783          	lw	a5,516(s0)
    1b6c:	24852a23          	sw	s0,596(a0)
    1b70:	08079863          	bnez	a5,1c00 <fatfs_fat_read_sector+0xcc>
    1b74:	0349a783          	lw	a5,52(s3)
    1b78:	20942023          	sw	s1,512(s0)
    1b7c:	00100613          	li	a2,1
    1b80:	00040593          	mv	a1,s0
    1b84:	00048513          	mv	a0,s1
    1b88:	000780e7          	jalr	a5
    1b8c:	08051463          	bnez	a0,1c14 <fatfs_fat_read_sector+0xe0>
    1b90:	fff00793          	li	a5,-1
    1b94:	20f42023          	sw	a5,512(s0)
    1b98:	0480006f          	j	1be0 <fatfs_fat_read_sector+0xac>
    1b9c:	20092783          	lw	a5,512(s2)
    1ba0:	00f5e663          	bltu	a1,a5,1bac <fatfs_fat_read_sector+0x78>
    1ba4:	00178713          	addi	a4,a5,1
    1ba8:	02e5e463          	bltu	a1,a4,1bd0 <fatfs_fat_read_sector+0x9c>
    1bac:	20c92783          	lw	a5,524(s2)
    1bb0:	00079663          	bnez	a5,1bbc <fatfs_fat_read_sector+0x88>
    1bb4:	00040a63          	beqz	s0,1bc8 <fatfs_fat_read_sector+0x94>
    1bb8:	20042623          	sw	zero,524(s0)
    1bbc:	00090413          	mv	s0,s2
    1bc0:	20c92903          	lw	s2,524(s2)
    1bc4:	f91ff06f          	j	1b54 <fatfs_fat_read_sector+0x20>
    1bc8:	24052a23          	sw	zero,596(a0)
    1bcc:	ff1ff06f          	j	1bbc <fatfs_fat_read_sector+0x88>
    1bd0:	40f585b3          	sub	a1,a1,a5
    1bd4:	00959593          	slli	a1,a1,0x9
    1bd8:	00b905b3          	add	a1,s2,a1
    1bdc:	20b92423          	sw	a1,520(s2)
    1be0:	01c12083          	lw	ra,28(sp)
    1be4:	01812403          	lw	s0,24(sp)
    1be8:	01412483          	lw	s1,20(sp)
    1bec:	00c12983          	lw	s3,12(sp)
    1bf0:	00090513          	mv	a0,s2
    1bf4:	01012903          	lw	s2,16(sp)
    1bf8:	02010113          	addi	sp,sp,32
    1bfc:	00008067          	ret
    1c00:	00040593          	mv	a1,s0
    1c04:	00000097          	auipc	ra,0x0
    1c08:	eac080e7          	jalr	-340(ra) # 1ab0 <fatfs_fat_writeback>
    1c0c:	f60514e3          	bnez	a0,1b74 <fatfs_fat_read_sector+0x40>
    1c10:	fd1ff06f          	j	1be0 <fatfs_fat_read_sector+0xac>
    1c14:	20842423          	sw	s0,520(s0)
    1c18:	00040913          	mv	s2,s0
    1c1c:	fc5ff06f          	j	1be0 <fatfs_fat_read_sector+0xac>

00001c20 <_allocate_file>:
    1c20:	000057b7          	lui	a5,0x5
    1c24:	31478793          	addi	a5,a5,788 # 5314 <_free_file_list>
    1c28:	0007a583          	lw	a1,0(a5)
    1c2c:	06058263          	beqz	a1,1c90 <_allocate_file+0x70>
    1c30:	0005a703          	lw	a4,0(a1)
    1c34:	fe010113          	addi	sp,sp,-32
    1c38:	00112e23          	sw	ra,28(sp)
    1c3c:	0045a683          	lw	a3,4(a1)
    1c40:	04071063          	bnez	a4,1c80 <_allocate_file+0x60>
    1c44:	00d7a023          	sw	a3,0(a5)
    1c48:	0045a683          	lw	a3,4(a1)
    1c4c:	02069e63          	bnez	a3,1c88 <_allocate_file+0x68>
    1c50:	00e7a223          	sw	a4,4(a5)
    1c54:	00005537          	lui	a0,0x5
    1c58:	31c50513          	addi	a0,a0,796 # 531c <_open_file_list>
    1c5c:	00b12623          	sw	a1,12(sp)
    1c60:	00000097          	auipc	ra,0x0
    1c64:	d48080e7          	jalr	-696(ra) # 19a8 <fat_list_insert_last>
    1c68:	00c12583          	lw	a1,12(sp)
    1c6c:	01c12083          	lw	ra,28(sp)
    1c70:	bc458593          	addi	a1,a1,-1084
    1c74:	00058513          	mv	a0,a1
    1c78:	02010113          	addi	sp,sp,32
    1c7c:	00008067          	ret
    1c80:	00d72223          	sw	a3,4(a4)
    1c84:	fc5ff06f          	j	1c48 <_allocate_file+0x28>
    1c88:	00e6a023          	sw	a4,0(a3)
    1c8c:	fc9ff06f          	j	1c54 <_allocate_file+0x34>
    1c90:	00058513          	mv	a0,a1
    1c94:	00008067          	ret

00001c98 <_free_file>:
    1c98:	43c52783          	lw	a5,1084(a0)
    1c9c:	44052703          	lw	a4,1088(a0)
    1ca0:	43c50593          	addi	a1,a0,1084
    1ca4:	02079663          	bnez	a5,1cd0 <_free_file+0x38>
    1ca8:	000056b7          	lui	a3,0x5
    1cac:	30e6ae23          	sw	a4,796(a3) # 531c <_open_file_list>
    1cb0:	44052703          	lw	a4,1088(a0)
    1cb4:	02071263          	bnez	a4,1cd8 <_free_file+0x40>
    1cb8:	00005737          	lui	a4,0x5
    1cbc:	32f72023          	sw	a5,800(a4) # 5320 <_open_file_list+0x4>
    1cc0:	00005537          	lui	a0,0x5
    1cc4:	31450513          	addi	a0,a0,788 # 5314 <_free_file_list>
    1cc8:	00000317          	auipc	t1,0x0
    1ccc:	ce030067          	jr	-800(t1) # 19a8 <fat_list_insert_last>
    1cd0:	00e7a223          	sw	a4,4(a5)
    1cd4:	fddff06f          	j	1cb0 <_free_file+0x18>
    1cd8:	00f72023          	sw	a5,0(a4)
    1cdc:	fe5ff06f          	j	1cc0 <_free_file+0x28>

00001ce0 <fatfs_lba_of_cluster>:
    1ce0:	ff010113          	addi	sp,sp,-16
    1ce4:	00812423          	sw	s0,8(sp)
    1ce8:	00112623          	sw	ra,12(sp)
    1cec:	00050413          	mv	s0,a0
    1cf0:	ffe58513          	addi	a0,a1,-2
    1cf4:	00044583          	lbu	a1,0(s0)
    1cf8:	00000097          	auipc	ra,0x0
    1cfc:	c84080e7          	jalr	-892(ra) # 197c <__mulsi3>
    1d00:	00442783          	lw	a5,4(s0)
    1d04:	00f50533          	add	a0,a0,a5
    1d08:	03042783          	lw	a5,48(s0)
    1d0c:	00079863          	bnez	a5,1d1c <fatfs_lba_of_cluster+0x3c>
    1d10:	02845783          	lhu	a5,40(s0)
    1d14:	4047d793          	srai	a5,a5,0x4
    1d18:	00f50533          	add	a0,a0,a5
    1d1c:	00c12083          	lw	ra,12(sp)
    1d20:	00812403          	lw	s0,8(sp)
    1d24:	01010113          	addi	sp,sp,16
    1d28:	00008067          	ret

00001d2c <fatfs_sector_read>:
    1d2c:	03452783          	lw	a5,52(a0)
    1d30:	00058713          	mv	a4,a1
    1d34:	00070513          	mv	a0,a4
    1d38:	00060593          	mv	a1,a2
    1d3c:	00068613          	mv	a2,a3
    1d40:	00078067          	jr	a5

00001d44 <fatfs_sector_write>:
    1d44:	03852783          	lw	a5,56(a0)
    1d48:	00058713          	mv	a4,a1
    1d4c:	00070513          	mv	a0,a4
    1d50:	00060593          	mv	a1,a2
    1d54:	00068613          	mv	a2,a3
    1d58:	00078067          	jr	a5

00001d5c <fatfs_write_sector>:
    1d5c:	03852703          	lw	a4,56(a0)
    1d60:	0a070463          	beqz	a4,1e08 <fatfs_write_sector+0xac>
    1d64:	03052883          	lw	a7,48(a0)
    1d68:	00050793          	mv	a5,a0
    1d6c:	0115e833          	or	a6,a1,a7
    1d70:	02081e63          	bnez	a6,1dac <fatfs_write_sector+0x50>
    1d74:	01052583          	lw	a1,16(a0)
    1d78:	08b67863          	bgeu	a2,a1,1e08 <fatfs_write_sector+0xac>
    1d7c:	01c52503          	lw	a0,28(a0)
    1d80:	00c7a583          	lw	a1,12(a5)
    1d84:	00b50533          	add	a0,a0,a1
    1d88:	00c50533          	add	a0,a0,a2
    1d8c:	00068863          	beqz	a3,1d9c <fatfs_write_sector+0x40>
    1d90:	00100613          	li	a2,1
    1d94:	00068593          	mv	a1,a3
    1d98:	00070067          	jr	a4
    1d9c:	24a7a223          	sw	a0,580(a5)
    1da0:	00100613          	li	a2,1
    1da4:	04478593          	addi	a1,a5,68
    1da8:	ff1ff06f          	j	1d98 <fatfs_write_sector+0x3c>
    1dac:	fe010113          	addi	sp,sp,-32
    1db0:	00e12623          	sw	a4,12(sp)
    1db4:	00d12423          	sw	a3,8(sp)
    1db8:	00c12223          	sw	a2,4(sp)
    1dbc:	00112e23          	sw	ra,28(sp)
    1dc0:	00a12023          	sw	a0,0(sp)
    1dc4:	00000097          	auipc	ra,0x0
    1dc8:	f1c080e7          	jalr	-228(ra) # 1ce0 <fatfs_lba_of_cluster>
    1dcc:	00412603          	lw	a2,4(sp)
    1dd0:	00812683          	lw	a3,8(sp)
    1dd4:	00012783          	lw	a5,0(sp)
    1dd8:	00c12703          	lw	a4,12(sp)
    1ddc:	00a60533          	add	a0,a2,a0
    1de0:	00068c63          	beqz	a3,1df8 <fatfs_write_sector+0x9c>
    1de4:	00100613          	li	a2,1
    1de8:	00068593          	mv	a1,a3
    1dec:	01c12083          	lw	ra,28(sp)
    1df0:	02010113          	addi	sp,sp,32
    1df4:	fa5ff06f          	j	1d98 <fatfs_write_sector+0x3c>
    1df8:	24a7a223          	sw	a0,580(a5)
    1dfc:	00100613          	li	a2,1
    1e00:	04478593          	addi	a1,a5,68
    1e04:	fe9ff06f          	j	1dec <fatfs_write_sector+0x90>
    1e08:	00000513          	li	a0,0
    1e0c:	00008067          	ret

00001e10 <fl_init>:
    1e10:	ff010113          	addi	sp,sp,-16
    1e14:	00005537          	lui	a0,0x5
    1e18:	000057b7          	lui	a5,0x5
    1e1c:	000075b7          	lui	a1,0x7
    1e20:	00112623          	sw	ra,12(sp)
    1e24:	31450513          	addi	a0,a0,788 # 5314 <_free_file_list>
    1e28:	31c78793          	addi	a5,a5,796 # 531c <_open_file_list>
    1e2c:	7ec58593          	addi	a1,a1,2028 # 77ec <_files+0x43c>
    1e30:	00052223          	sw	zero,4(a0)
    1e34:	00052023          	sw	zero,0(a0)
    1e38:	0007a223          	sw	zero,4(a5)
    1e3c:	0007a023          	sw	zero,0(a5)
    1e40:	00000097          	auipc	ra,0x0
    1e44:	b68080e7          	jalr	-1176(ra) # 19a8 <fat_list_insert_last>
    1e48:	000057b7          	lui	a5,0x5
    1e4c:	000085b7          	lui	a1,0x8
    1e50:	31478513          	addi	a0,a5,788 # 5314 <_free_file_list>
    1e54:	c3058593          	addi	a1,a1,-976 # 7c30 <_files+0x880>
    1e58:	00000097          	auipc	ra,0x0
    1e5c:	b50080e7          	jalr	-1200(ra) # 19a8 <fat_list_insert_last>
    1e60:	00c12083          	lw	ra,12(sp)
    1e64:	000057b7          	lui	a5,0x5
    1e68:	00100713          	li	a4,1
    1e6c:	32e7a423          	sw	a4,808(a5) # 5328 <_filelib_init>
    1e70:	01010113          	addi	sp,sp,16
    1e74:	00008067          	ret

00001e78 <fl_fseek>:
    1e78:	000057b7          	lui	a5,0x5
    1e7c:	3287a783          	lw	a5,808(a5) # 5328 <_filelib_init>
    1e80:	fd010113          	addi	sp,sp,-48
    1e84:	02812423          	sw	s0,40(sp)
    1e88:	02912223          	sw	s1,36(sp)
    1e8c:	01312e23          	sw	s3,28(sp)
    1e90:	02112623          	sw	ra,44(sp)
    1e94:	03212023          	sw	s2,32(sp)
    1e98:	00050413          	mv	s0,a0
    1e9c:	00058493          	mv	s1,a1
    1ea0:	00060993          	mv	s3,a2
    1ea4:	00079663          	bnez	a5,1eb0 <fl_fseek+0x38>
    1ea8:	00000097          	auipc	ra,0x0
    1eac:	f68080e7          	jalr	-152(ra) # 1e10 <fl_init>
    1eb0:	fff00513          	li	a0,-1
    1eb4:	08040263          	beqz	s0,1f38 <fl_fseek+0xc0>
    1eb8:	00048663          	beqz	s1,1ec4 <fl_fseek+0x4c>
    1ebc:	ffe98793          	addi	a5,s3,-2
    1ec0:	06078c63          	beqz	a5,1f38 <fl_fseek+0xc0>
    1ec4:	00007937          	lui	s2,0x7
    1ec8:	f4890913          	addi	s2,s2,-184 # 6f48 <_fs>
    1ecc:	03c92783          	lw	a5,60(s2)
    1ed0:	00078463          	beqz	a5,1ed8 <fl_fseek+0x60>
    1ed4:	000780e7          	jalr	a5
    1ed8:	fff00513          	li	a0,-1
    1edc:	42a42823          	sw	a0,1072(s0)
    1ee0:	42042a23          	sw	zero,1076(s0)
    1ee4:	00099c63          	bnez	s3,1efc <fl_fseek+0x84>
    1ee8:	00c42783          	lw	a5,12(s0)
    1eec:	00942423          	sw	s1,8(s0)
    1ef0:	0297f863          	bgeu	a5,s1,1f20 <fl_fseek+0xa8>
    1ef4:	00f42423          	sw	a5,8(s0)
    1ef8:	0280006f          	j	1f20 <fl_fseek+0xa8>
    1efc:	00100793          	li	a5,1
    1f00:	06f99063          	bne	s3,a5,1f60 <fl_fseek+0xe8>
    1f04:	00842783          	lw	a5,8(s0)
    1f08:	0004c663          	bltz	s1,1f14 <fl_fseek+0x9c>
    1f0c:	00f484b3          	add	s1,s1,a5
    1f10:	fd9ff06f          	j	1ee8 <fl_fseek+0x70>
    1f14:	40900733          	neg	a4,s1
    1f18:	02e7fe63          	bgeu	a5,a4,1f54 <fl_fseek+0xdc>
    1f1c:	00042423          	sw	zero,8(s0)
    1f20:	00000513          	li	a0,0
    1f24:	04092783          	lw	a5,64(s2)
    1f28:	00078863          	beqz	a5,1f38 <fl_fseek+0xc0>
    1f2c:	00a12623          	sw	a0,12(sp)
    1f30:	000780e7          	jalr	a5
    1f34:	00c12503          	lw	a0,12(sp)
    1f38:	02c12083          	lw	ra,44(sp)
    1f3c:	02812403          	lw	s0,40(sp)
    1f40:	02412483          	lw	s1,36(sp)
    1f44:	02012903          	lw	s2,32(sp)
    1f48:	01c12983          	lw	s3,28(sp)
    1f4c:	03010113          	addi	sp,sp,48
    1f50:	00008067          	ret
    1f54:	00f484b3          	add	s1,s1,a5
    1f58:	00942423          	sw	s1,8(s0)
    1f5c:	fc5ff06f          	j	1f20 <fl_fseek+0xa8>
    1f60:	00200793          	li	a5,2
    1f64:	fcf990e3          	bne	s3,a5,1f24 <fl_fseek+0xac>
    1f68:	00c42783          	lw	a5,12(s0)
    1f6c:	f89ff06f          	j	1ef4 <fl_fseek+0x7c>

00001f70 <fl_closedir>:
    1f70:	00000513          	li	a0,0
    1f74:	00008067          	ret

00001f78 <fatfs_lfn_cache_entry>:
    1f78:	0005c783          	lbu	a5,0(a1)
    1f7c:	01300693          	li	a3,19
    1f80:	01f7f793          	andi	a5,a5,31
    1f84:	fff78713          	addi	a4,a5,-1
    1f88:	0ff77613          	zext.b	a2,a4
    1f8c:	0ac6ea63          	bltu	a3,a2,2040 <fatfs_lfn_cache_entry+0xc8>
    1f90:	10554683          	lbu	a3,261(a0)
    1f94:	00069463          	bnez	a3,1f9c <fatfs_lfn_cache_entry+0x24>
    1f98:	10f502a3          	sb	a5,261(a0)
    1f9c:	00171793          	slli	a5,a4,0x1
    1fa0:	00e787b3          	add	a5,a5,a4
    1fa4:	0015c683          	lbu	a3,1(a1)
    1fa8:	00279793          	slli	a5,a5,0x2
    1fac:	00e787b3          	add	a5,a5,a4
    1fb0:	00f50533          	add	a0,a0,a5
    1fb4:	00d50023          	sb	a3,0(a0)
    1fb8:	0035c783          	lbu	a5,3(a1)
    1fbc:	0ff00713          	li	a4,255
    1fc0:	02000693          	li	a3,32
    1fc4:	00f500a3          	sb	a5,1(a0)
    1fc8:	0055c783          	lbu	a5,5(a1)
    1fcc:	00f50123          	sb	a5,2(a0)
    1fd0:	0075c783          	lbu	a5,7(a1)
    1fd4:	00f501a3          	sb	a5,3(a0)
    1fd8:	0095c783          	lbu	a5,9(a1)
    1fdc:	00f50223          	sb	a5,4(a0)
    1fe0:	00e5c783          	lbu	a5,14(a1)
    1fe4:	00f502a3          	sb	a5,5(a0)
    1fe8:	0105c783          	lbu	a5,16(a1)
    1fec:	00f50323          	sb	a5,6(a0)
    1ff0:	0125c783          	lbu	a5,18(a1)
    1ff4:	00f503a3          	sb	a5,7(a0)
    1ff8:	0145c783          	lbu	a5,20(a1)
    1ffc:	00f50423          	sb	a5,8(a0)
    2000:	0165c783          	lbu	a5,22(a1)
    2004:	00f504a3          	sb	a5,9(a0)
    2008:	0185c783          	lbu	a5,24(a1)
    200c:	00f50523          	sb	a5,10(a0)
    2010:	01c5c783          	lbu	a5,28(a1)
    2014:	00f505a3          	sb	a5,11(a0)
    2018:	01e5c783          	lbu	a5,30(a1)
    201c:	00f50623          	sb	a5,12(a0)
    2020:	00d00793          	li	a5,13
    2024:	00054603          	lbu	a2,0(a0)
    2028:	00e61463          	bne	a2,a4,2030 <fatfs_lfn_cache_entry+0xb8>
    202c:	00d50023          	sb	a3,0(a0)
    2030:	fff78793          	addi	a5,a5,-1
    2034:	0ff7f793          	zext.b	a5,a5
    2038:	00150513          	addi	a0,a0,1
    203c:	fe0794e3          	bnez	a5,2024 <fatfs_lfn_cache_entry+0xac>
    2040:	00008067          	ret

00002044 <fatfs_lfn_cache_get>:
    2044:	10554703          	lbu	a4,261(a0)
    2048:	01400793          	li	a5,20
    204c:	00f71663          	bne	a4,a5,2058 <fatfs_lfn_cache_get+0x14>
    2050:	10050223          	sb	zero,260(a0)
    2054:	00008067          	ret
    2058:	02070063          	beqz	a4,2078 <fatfs_lfn_cache_get+0x34>
    205c:	00171793          	slli	a5,a4,0x1
    2060:	00e787b3          	add	a5,a5,a4
    2064:	00279793          	slli	a5,a5,0x2
    2068:	00e787b3          	add	a5,a5,a4
    206c:	00f507b3          	add	a5,a0,a5
    2070:	00078023          	sb	zero,0(a5)
    2074:	00008067          	ret
    2078:	00050023          	sb	zero,0(a0)
    207c:	00008067          	ret

00002080 <fatfs_entry_lfn_text>:
    2080:	00b54503          	lbu	a0,11(a0)
    2084:	00f57513          	andi	a0,a0,15
    2088:	ff150513          	addi	a0,a0,-15
    208c:	00153513          	seqz	a0,a0
    2090:	00008067          	ret

00002094 <fatfs_entry_lfn_invalid>:
    2094:	00054783          	lbu	a5,0(a0)
    2098:	f1b78713          	addi	a4,a5,-229
    209c:	02070263          	beqz	a4,20c0 <fatfs_entry_lfn_invalid+0x2c>
    20a0:	02078063          	beqz	a5,20c0 <fatfs_entry_lfn_invalid+0x2c>
    20a4:	00b54783          	lbu	a5,11(a0)
    20a8:	00800713          	li	a4,8
    20ac:	00100513          	li	a0,1
    20b0:	00e78a63          	beq	a5,a4,20c4 <fatfs_entry_lfn_invalid+0x30>
    20b4:	0067f793          	andi	a5,a5,6
    20b8:	00f03533          	snez	a0,a5
    20bc:	00008067          	ret
    20c0:	00100513          	li	a0,1
    20c4:	00008067          	ret

000020c8 <fatfs_entry_lfn_exists>:
    20c8:	00b5c783          	lbu	a5,11(a1)
    20cc:	00f00713          	li	a4,15
    20d0:	04e78063          	beq	a5,a4,2110 <fatfs_entry_lfn_exists+0x48>
    20d4:	0005c683          	lbu	a3,0(a1)
    20d8:	f1b68713          	addi	a4,a3,-229
    20dc:	00e03733          	snez	a4,a4
    20e0:	00d036b3          	snez	a3,a3
    20e4:	00d77733          	and	a4,a4,a3
    20e8:	02070463          	beqz	a4,2110 <fatfs_entry_lfn_exists+0x48>
    20ec:	ff878713          	addi	a4,a5,-8
    20f0:	02070063          	beqz	a4,2110 <fatfs_entry_lfn_exists+0x48>
    20f4:	0067f713          	andi	a4,a5,6
    20f8:	00000793          	li	a5,0
    20fc:	00071663          	bnez	a4,2108 <fatfs_entry_lfn_exists+0x40>
    2100:	10554783          	lbu	a5,261(a0)
    2104:	00f037b3          	snez	a5,a5
    2108:	00078513          	mv	a0,a5
    210c:	00008067          	ret
    2110:	00000793          	li	a5,0
    2114:	ff5ff06f          	j	2108 <fatfs_entry_lfn_exists+0x40>

00002118 <fatfs_entry_sfn_only>:
    2118:	00b54783          	lbu	a5,11(a0)
    211c:	00f00713          	li	a4,15
    2120:	02e78863          	beq	a5,a4,2150 <fatfs_entry_sfn_only+0x38>
    2124:	00054683          	lbu	a3,0(a0)
    2128:	f1b68713          	addi	a4,a3,-229
    212c:	00e03733          	snez	a4,a4
    2130:	00d036b3          	snez	a3,a3
    2134:	00d77733          	and	a4,a4,a3
    2138:	00070c63          	beqz	a4,2150 <fatfs_entry_sfn_only+0x38>
    213c:	ff878713          	addi	a4,a5,-8
    2140:	00070863          	beqz	a4,2150 <fatfs_entry_sfn_only+0x38>
    2144:	0067f513          	andi	a0,a5,6
    2148:	00153513          	seqz	a0,a0
    214c:	00008067          	ret
    2150:	00000513          	li	a0,0
    2154:	00008067          	ret

00002158 <fatfs_entry_is_dir>:
    2158:	00b54503          	lbu	a0,11(a0)
    215c:	00455513          	srli	a0,a0,0x4
    2160:	00157513          	andi	a0,a0,1
    2164:	00008067          	ret

00002168 <fatfs_lfn_entries_required>:
    2168:	ff010113          	addi	sp,sp,-16
    216c:	00112623          	sw	ra,12(sp)
    2170:	fffff097          	auipc	ra,0xfffff
    2174:	184080e7          	jalr	388(ra) # 12f4 <strlen>
    2178:	00050a63          	beqz	a0,218c <fatfs_lfn_entries_required+0x24>
    217c:	00d00593          	li	a1,13
    2180:	00c50513          	addi	a0,a0,12
    2184:	fffff097          	auipc	ra,0xfffff
    2188:	07c080e7          	jalr	124(ra) # 1200 <__divsi3>
    218c:	00c12083          	lw	ra,12(sp)
    2190:	01010113          	addi	sp,sp,16
    2194:	00008067          	ret

00002198 <fatfs_filename_to_lfn>:
    2198:	f9010113          	addi	sp,sp,-112
    219c:	06812423          	sw	s0,104(sp)
    21a0:	00058413          	mv	s0,a1
    21a4:	000055b7          	lui	a1,0x5
    21a8:	0d458593          	addi	a1,a1,212 # 50d4 <font+0x1e0>
    21ac:	06912223          	sw	s1,100(sp)
    21b0:	05312e23          	sw	s3,92(sp)
    21b4:	00060493          	mv	s1,a2
    21b8:	00050993          	mv	s3,a0
    21bc:	03400613          	li	a2,52
    21c0:	01c10513          	addi	a0,sp,28
    21c4:	00d12623          	sw	a3,12(sp)
    21c8:	06112623          	sw	ra,108(sp)
    21cc:	07212023          	sw	s2,96(sp)
    21d0:	05412c23          	sw	s4,88(sp)
    21d4:	fffff097          	auipc	ra,0xfffff
    21d8:	0fc080e7          	jalr	252(ra) # 12d0 <memcpy>
    21dc:	00098513          	mv	a0,s3
    21e0:	fffff097          	auipc	ra,0xfffff
    21e4:	114080e7          	jalr	276(ra) # 12f4 <strlen>
    21e8:	00050913          	mv	s2,a0
    21ec:	00098513          	mv	a0,s3
    21f0:	00000097          	auipc	ra,0x0
    21f4:	f78080e7          	jalr	-136(ra) # 2168 <fatfs_lfn_entries_required>
    21f8:	00050a13          	mv	s4,a0
    21fc:	02000613          	li	a2,32
    2200:	00000593          	li	a1,0
    2204:	00040513          	mv	a0,s0
    2208:	fffff097          	auipc	ra,0xfffff
    220c:	0ac080e7          	jalr	172(ra) # 12b4 <memset>
    2210:	fffa0713          	addi	a4,s4,-1
    2214:	00c12683          	lw	a3,12(sp)
    2218:	00148793          	addi	a5,s1,1
    221c:	00971463          	bne	a4,s1,2224 <fatfs_filename_to_lfn+0x8c>
    2220:	0407e793          	ori	a5,a5,64
    2224:	00149613          	slli	a2,s1,0x1
    2228:	00960633          	add	a2,a2,s1
    222c:	00f40023          	sb	a5,0(s0)
    2230:	00261613          	slli	a2,a2,0x2
    2234:	00f00793          	li	a5,15
    2238:	00f405a3          	sb	a5,11(s0)
    223c:	00d406a3          	sb	a3,13(s0)
    2240:	01c10793          	addi	a5,sp,28
    2244:	00960633          	add	a2,a2,s1
    2248:	fff00693          	li	a3,-1
    224c:	0007a703          	lw	a4,0(a5)
    2250:	00e40733          	add	a4,s0,a4
    2254:	05265063          	bge	a2,s2,2294 <fatfs_filename_to_lfn+0xfc>
    2258:	00c985b3          	add	a1,s3,a2
    225c:	0005c583          	lbu	a1,0(a1)
    2260:	00b70023          	sb	a1,0(a4)
    2264:	00478793          	addi	a5,a5,4
    2268:	05010713          	addi	a4,sp,80
    226c:	00160613          	addi	a2,a2,1
    2270:	fce79ee3          	bne	a5,a4,224c <fatfs_filename_to_lfn+0xb4>
    2274:	06c12083          	lw	ra,108(sp)
    2278:	06812403          	lw	s0,104(sp)
    227c:	06412483          	lw	s1,100(sp)
    2280:	06012903          	lw	s2,96(sp)
    2284:	05c12983          	lw	s3,92(sp)
    2288:	05812a03          	lw	s4,88(sp)
    228c:	07010113          	addi	sp,sp,112
    2290:	00008067          	ret
    2294:	01261663          	bne	a2,s2,22a0 <fatfs_filename_to_lfn+0x108>
    2298:	00070023          	sb	zero,0(a4)
    229c:	fc9ff06f          	j	2264 <fatfs_filename_to_lfn+0xcc>
    22a0:	00d70023          	sb	a3,0(a4)
    22a4:	00d700a3          	sb	a3,1(a4)
    22a8:	fbdff06f          	j	2264 <fatfs_filename_to_lfn+0xcc>

000022ac <fatfs_sfn_create_entry>:
    22ac:	00000793          	li	a5,0
    22b0:	00b00813          	li	a6,11
    22b4:	00f508b3          	add	a7,a0,a5
    22b8:	0008c303          	lbu	t1,0(a7)
    22bc:	00f688b3          	add	a7,a3,a5
    22c0:	00178793          	addi	a5,a5,1
    22c4:	00688023          	sb	t1,0(a7)
    22c8:	ff0796e3          	bne	a5,a6,22b4 <fatfs_sfn_create_entry+0x8>
    22cc:	00e03733          	snez	a4,a4
    22d0:	40e00733          	neg	a4,a4
    22d4:	02000793          	li	a5,32
    22d8:	ff077713          	andi	a4,a4,-16
    22dc:	00f70733          	add	a4,a4,a5
    22e0:	00f68823          	sb	a5,16(a3)
    22e4:	00f68923          	sb	a5,18(a3)
    22e8:	00f68c23          	sb	a5,24(a3)
    22ec:	01065793          	srli	a5,a2,0x10
    22f0:	00f68a23          	sb	a5,20(a3)
    22f4:	01865793          	srli	a5,a2,0x18
    22f8:	00f68aa3          	sb	a5,21(a3)
    22fc:	0085d793          	srli	a5,a1,0x8
    2300:	00c68d23          	sb	a2,26(a3)
    2304:	00b68e23          	sb	a1,28(a3)
    2308:	00865613          	srli	a2,a2,0x8
    230c:	00f68ea3          	sb	a5,29(a3)
    2310:	0105d793          	srli	a5,a1,0x10
    2314:	0185d593          	srli	a1,a1,0x18
    2318:	000686a3          	sb	zero,13(a3)
    231c:	00068723          	sb	zero,14(a3)
    2320:	000687a3          	sb	zero,15(a3)
    2324:	000688a3          	sb	zero,17(a3)
    2328:	000689a3          	sb	zero,19(a3)
    232c:	00068b23          	sb	zero,22(a3)
    2330:	00068ba3          	sb	zero,23(a3)
    2334:	00068ca3          	sb	zero,25(a3)
    2338:	00e685a3          	sb	a4,11(a3)
    233c:	00068623          	sb	zero,12(a3)
    2340:	00c68da3          	sb	a2,27(a3)
    2344:	00f68f23          	sb	a5,30(a3)
    2348:	00b68fa3          	sb	a1,31(a3)
    234c:	00008067          	ret

00002350 <fatfs_lfn_create_sfn>:
    2350:	fd010113          	addi	sp,sp,-48
    2354:	02912223          	sw	s1,36(sp)
    2358:	00050493          	mv	s1,a0
    235c:	00058513          	mv	a0,a1
    2360:	02812423          	sw	s0,40(sp)
    2364:	01312e23          	sw	s3,28(sp)
    2368:	00058413          	mv	s0,a1
    236c:	02112623          	sw	ra,44(sp)
    2370:	03212023          	sw	s2,32(sp)
    2374:	fffff097          	auipc	ra,0xfffff
    2378:	f80080e7          	jalr	-128(ra) # 12f4 <strlen>
    237c:	00044783          	lbu	a5,0(s0)
    2380:	02e00993          	li	s3,46
    2384:	15378063          	beq	a5,s3,24c4 <fatfs_lfn_create_sfn+0x174>
    2388:	00b00613          	li	a2,11
    238c:	02000593          	li	a1,32
    2390:	00050913          	mv	s2,a0
    2394:	00048513          	mv	a0,s1
    2398:	fffff097          	auipc	ra,0xfffff
    239c:	f1c080e7          	jalr	-228(ra) # 12b4 <memset>
    23a0:	00300613          	li	a2,3
    23a4:	02000593          	li	a1,32
    23a8:	00c10513          	addi	a0,sp,12
    23ac:	fffff097          	auipc	ra,0xfffff
    23b0:	f08080e7          	jalr	-248(ra) # 12b4 <memset>
    23b4:	fff00793          	li	a5,-1
    23b8:	00000713          	li	a4,0
    23bc:	0d274263          	blt	a4,s2,2480 <fatfs_lfn_create_sfn+0x130>
    23c0:	fff00713          	li	a4,-1
    23c4:	0ee78863          	beq	a5,a4,24b4 <fatfs_lfn_create_sfn+0x164>
    23c8:	00178713          	addi	a4,a5,1
    23cc:	00c10693          	addi	a3,sp,12
    23d0:	00478613          	addi	a2,a5,4
    23d4:	0ce61263          	bne	a2,a4,2498 <fatfs_lfn_create_sfn+0x148>
    23d8:	00000613          	li	a2,0
    23dc:	00000693          	li	a3,0
    23e0:	01900813          	li	a6,25
    23e4:	00800893          	li	a7,8
    23e8:	02f6de63          	bge	a3,a5,2424 <fatfs_lfn_create_sfn+0xd4>
    23ec:	00d40733          	add	a4,s0,a3
    23f0:	00074703          	lbu	a4,0(a4)
    23f4:	fe070513          	addi	a0,a4,-32
    23f8:	0c050263          	beqz	a0,24bc <fatfs_lfn_create_sfn+0x16c>
    23fc:	fd270593          	addi	a1,a4,-46
    2400:	0a058e63          	beqz	a1,24bc <fatfs_lfn_create_sfn+0x16c>
    2404:	f9f70593          	addi	a1,a4,-97
    2408:	0ff5f593          	zext.b	a1,a1
    240c:	00c48333          	add	t1,s1,a2
    2410:	00160613          	addi	a2,a2,1
    2414:	00b86463          	bltu	a6,a1,241c <fatfs_lfn_create_sfn+0xcc>
    2418:	0ff57713          	zext.b	a4,a0
    241c:	00e30023          	sb	a4,0(t1)
    2420:	09161e63          	bne	a2,a7,24bc <fatfs_lfn_create_sfn+0x16c>
    2424:	00c10793          	addi	a5,sp,12
    2428:	00800693          	li	a3,8
    242c:	01900513          	li	a0,25
    2430:	00b00593          	li	a1,11
    2434:	0007c703          	lbu	a4,0(a5)
    2438:	f9f70613          	addi	a2,a4,-97
    243c:	0ff67613          	zext.b	a2,a2
    2440:	00c56663          	bltu	a0,a2,244c <fatfs_lfn_create_sfn+0xfc>
    2444:	fe070713          	addi	a4,a4,-32
    2448:	0ff77713          	zext.b	a4,a4
    244c:	00d48633          	add	a2,s1,a3
    2450:	00e60023          	sb	a4,0(a2)
    2454:	00168693          	addi	a3,a3,1
    2458:	00178793          	addi	a5,a5,1
    245c:	fcb69ce3          	bne	a3,a1,2434 <fatfs_lfn_create_sfn+0xe4>
    2460:	00100513          	li	a0,1
    2464:	02c12083          	lw	ra,44(sp)
    2468:	02812403          	lw	s0,40(sp)
    246c:	02412483          	lw	s1,36(sp)
    2470:	02012903          	lw	s2,32(sp)
    2474:	01c12983          	lw	s3,28(sp)
    2478:	03010113          	addi	sp,sp,48
    247c:	00008067          	ret
    2480:	00e406b3          	add	a3,s0,a4
    2484:	0006c683          	lbu	a3,0(a3)
    2488:	01369463          	bne	a3,s3,2490 <fatfs_lfn_create_sfn+0x140>
    248c:	00070793          	mv	a5,a4
    2490:	00170713          	addi	a4,a4,1
    2494:	f29ff06f          	j	23bc <fatfs_lfn_create_sfn+0x6c>
    2498:	01275863          	bge	a4,s2,24a8 <fatfs_lfn_create_sfn+0x158>
    249c:	00e405b3          	add	a1,s0,a4
    24a0:	0005c583          	lbu	a1,0(a1)
    24a4:	00b68023          	sb	a1,0(a3)
    24a8:	00170713          	addi	a4,a4,1
    24ac:	00168693          	addi	a3,a3,1
    24b0:	f25ff06f          	j	23d4 <fatfs_lfn_create_sfn+0x84>
    24b4:	00090793          	mv	a5,s2
    24b8:	f21ff06f          	j	23d8 <fatfs_lfn_create_sfn+0x88>
    24bc:	00168693          	addi	a3,a3,1
    24c0:	f29ff06f          	j	23e8 <fatfs_lfn_create_sfn+0x98>
    24c4:	00000513          	li	a0,0
    24c8:	f9dff06f          	j	2464 <fatfs_lfn_create_sfn+0x114>

000024cc <fatfs_lfn_generate_tail>:
    24cc:	000187b7          	lui	a5,0x18
    24d0:	69f78793          	addi	a5,a5,1695 # 1869f <__stacktop+0x869f>
    24d4:	16c7e463          	bltu	a5,a2,263c <fatfs_lfn_generate_tail+0x170>
    24d8:	fa010113          	addi	sp,sp,-96
    24dc:	04812c23          	sw	s0,88(sp)
    24e0:	04912a23          	sw	s1,84(sp)
    24e4:	03712e23          	sw	s7,60(sp)
    24e8:	00060413          	mv	s0,a2
    24ec:	00058b93          	mv	s7,a1
    24f0:	00c00613          	li	a2,12
    24f4:	00000593          	li	a1,0
    24f8:	00050493          	mv	s1,a0
    24fc:	00410513          	addi	a0,sp,4
    2500:	04112e23          	sw	ra,92(sp)
    2504:	05312623          	sw	s3,76(sp)
    2508:	05412423          	sw	s4,72(sp)
    250c:	05612023          	sw	s6,64(sp)
    2510:	05212823          	sw	s2,80(sp)
    2514:	05512223          	sw	s5,68(sp)
    2518:	fffff097          	auipc	ra,0xfffff
    251c:	d9c080e7          	jalr	-612(ra) # 12b4 <memset>
    2520:	000055b7          	lui	a1,0x5
    2524:	07e00793          	li	a5,126
    2528:	01100613          	li	a2,17
    252c:	eac58593          	addi	a1,a1,-340 # 4eac <LEDS+0x9c>
    2530:	01c10513          	addi	a0,sp,28
    2534:	01010993          	addi	s3,sp,16
    2538:	00f10223          	sb	a5,4(sp)
    253c:	00098a13          	mv	s4,s3
    2540:	fffff097          	auipc	ra,0xfffff
    2544:	d90080e7          	jalr	-624(ra) # 12d0 <memcpy>
    2548:	00900b13          	li	s6,9
    254c:	00a00593          	li	a1,10
    2550:	00040513          	mv	a0,s0
    2554:	fffff097          	auipc	ra,0xfffff
    2558:	cfc080e7          	jalr	-772(ra) # 1250 <__umodsi3>
    255c:	03050793          	addi	a5,a0,48
    2560:	00278533          	add	a0,a5,sp
    2564:	fec54783          	lbu	a5,-20(a0)
    2568:	00098913          	mv	s2,s3
    256c:	00040513          	mv	a0,s0
    2570:	00a00593          	li	a1,10
    2574:	00f98023          	sb	a5,0(s3)
    2578:	00040a93          	mv	s5,s0
    257c:	fffff097          	auipc	ra,0xfffff
    2580:	c8c080e7          	jalr	-884(ra) # 1208 <__udivsi3>
    2584:	00198993          	addi	s3,s3,1
    2588:	00050413          	mv	s0,a0
    258c:	fd5b60e3          	bltu	s6,s5,254c <fatfs_lfn_generate_tail+0x80>
    2590:	00098023          	sb	zero,0(s3)
    2594:	00410713          	addi	a4,sp,4
    2598:	00090793          	mv	a5,s2
    259c:	0947f663          	bgeu	a5,s4,2628 <fatfs_lfn_generate_tail+0x15c>
    25a0:	00f10713          	addi	a4,sp,15
    25a4:	00000793          	li	a5,0
    25a8:	00e96663          	bltu	s2,a4,25b4 <fatfs_lfn_generate_tail+0xe8>
    25ac:	41490933          	sub	s2,s2,s4
    25b0:	00190793          	addi	a5,s2,1
    25b4:	03078793          	addi	a5,a5,48
    25b8:	002787b3          	add	a5,a5,sp
    25bc:	000b8593          	mv	a1,s7
    25c0:	fc078aa3          	sb	zero,-43(a5)
    25c4:	00b00613          	li	a2,11
    25c8:	00048513          	mv	a0,s1
    25cc:	fffff097          	auipc	ra,0xfffff
    25d0:	d04080e7          	jalr	-764(ra) # 12d0 <memcpy>
    25d4:	00410513          	addi	a0,sp,4
    25d8:	fffff097          	auipc	ra,0xfffff
    25dc:	d1c080e7          	jalr	-740(ra) # 12f4 <strlen>
    25e0:	40a484b3          	sub	s1,s1,a0
    25e4:	00050613          	mv	a2,a0
    25e8:	00410593          	addi	a1,sp,4
    25ec:	00848513          	addi	a0,s1,8
    25f0:	fffff097          	auipc	ra,0xfffff
    25f4:	ce0080e7          	jalr	-800(ra) # 12d0 <memcpy>
    25f8:	05c12083          	lw	ra,92(sp)
    25fc:	05812403          	lw	s0,88(sp)
    2600:	05412483          	lw	s1,84(sp)
    2604:	05012903          	lw	s2,80(sp)
    2608:	04c12983          	lw	s3,76(sp)
    260c:	04812a03          	lw	s4,72(sp)
    2610:	04412a83          	lw	s5,68(sp)
    2614:	04012b03          	lw	s6,64(sp)
    2618:	03c12b83          	lw	s7,60(sp)
    261c:	00100513          	li	a0,1
    2620:	06010113          	addi	sp,sp,96
    2624:	00008067          	ret
    2628:	0007c683          	lbu	a3,0(a5)
    262c:	00170713          	addi	a4,a4,1
    2630:	fff78793          	addi	a5,a5,-1
    2634:	00d70023          	sb	a3,0(a4)
    2638:	f65ff06f          	j	259c <fatfs_lfn_generate_tail+0xd0>
    263c:	00000513          	li	a0,0
    2640:	00008067          	ret

00002644 <fatfs_total_path_levels>:
    2644:	fff00793          	li	a5,-1
    2648:	06050263          	beqz	a0,26ac <fatfs_total_path_levels+0x68>
    264c:	00054703          	lbu	a4,0(a0)
    2650:	02f00793          	li	a5,47
    2654:	00f71863          	bne	a4,a5,2664 <fatfs_total_path_levels+0x20>
    2658:	00150513          	addi	a0,a0,1
    265c:	00000793          	li	a5,0
    2660:	0400006f          	j	26a0 <fatfs_total_path_levels+0x5c>
    2664:	00154703          	lbu	a4,1(a0)
    2668:	03a00793          	li	a5,58
    266c:	00f70a63          	beq	a4,a5,2680 <fatfs_total_path_levels+0x3c>
    2670:	00254683          	lbu	a3,2(a0)
    2674:	05c00713          	li	a4,92
    2678:	fff00793          	li	a5,-1
    267c:	02e69863          	bne	a3,a4,26ac <fatfs_total_path_levels+0x68>
    2680:	00350513          	addi	a0,a0,3
    2684:	05c00713          	li	a4,92
    2688:	fd5ff06f          	j	265c <fatfs_total_path_levels+0x18>
    268c:	00150513          	addi	a0,a0,1
    2690:	00e68663          	beq	a3,a4,269c <fatfs_total_path_levels+0x58>
    2694:	00054683          	lbu	a3,0(a0)
    2698:	fe069ae3          	bnez	a3,268c <fatfs_total_path_levels+0x48>
    269c:	00178793          	addi	a5,a5,1
    26a0:	00054683          	lbu	a3,0(a0)
    26a4:	fe0698e3          	bnez	a3,2694 <fatfs_total_path_levels+0x50>
    26a8:	fff78793          	addi	a5,a5,-1
    26ac:	00078513          	mv	a0,a5
    26b0:	00008067          	ret

000026b4 <fatfs_get_substring>:
    26b4:	0cd05e63          	blez	a3,2790 <fatfs_get_substring+0xdc>
    26b8:	0c050c63          	beqz	a0,2790 <fatfs_get_substring+0xdc>
    26bc:	fe010113          	addi	sp,sp,-32
    26c0:	00812c23          	sw	s0,24(sp)
    26c4:	00112e23          	sw	ra,28(sp)
    26c8:	00912a23          	sw	s1,20(sp)
    26cc:	00054483          	lbu	s1,0(a0)
    26d0:	02f00793          	li	a5,47
    26d4:	00150413          	addi	s0,a0,1
    26d8:	02f48463          	beq	s1,a5,2700 <fatfs_get_substring+0x4c>
    26dc:	00154703          	lbu	a4,1(a0)
    26e0:	03a00793          	li	a5,58
    26e4:	00f70a63          	beq	a4,a5,26f8 <fatfs_get_substring+0x44>
    26e8:	00254803          	lbu	a6,2(a0)
    26ec:	05c00713          	li	a4,92
    26f0:	fff00793          	li	a5,-1
    26f4:	04e81c63          	bne	a6,a4,274c <fatfs_get_substring+0x98>
    26f8:	00350413          	addi	s0,a0,3
    26fc:	05c00493          	li	s1,92
    2700:	00040513          	mv	a0,s0
    2704:	00d12623          	sw	a3,12(sp)
    2708:	00c12423          	sw	a2,8(sp)
    270c:	00b12223          	sw	a1,4(sp)
    2710:	fffff097          	auipc	ra,0xfffff
    2714:	be4080e7          	jalr	-1052(ra) # 12f4 <strlen>
    2718:	00c12683          	lw	a3,12(sp)
    271c:	00412583          	lw	a1,4(sp)
    2720:	00812603          	lw	a2,8(sp)
    2724:	00000713          	li	a4,0
    2728:	00000813          	li	a6,0
    272c:	00000793          	li	a5,0
    2730:	fff68693          	addi	a3,a3,-1
    2734:	00e608b3          	add	a7,a2,a4
    2738:	02a7c663          	blt	a5,a0,2764 <fatfs_get_substring+0xb0>
    273c:	00088023          	sb	zero,0(a7)
    2740:	00064783          	lbu	a5,0(a2)
    2744:	0017b793          	seqz	a5,a5
    2748:	40f007b3          	neg	a5,a5
    274c:	01c12083          	lw	ra,28(sp)
    2750:	01812403          	lw	s0,24(sp)
    2754:	01412483          	lw	s1,20(sp)
    2758:	00078513          	mv	a0,a5
    275c:	02010113          	addi	sp,sp,32
    2760:	00008067          	ret
    2764:	00f40333          	add	t1,s0,a5
    2768:	00034303          	lbu	t1,0(t1)
    276c:	00931863          	bne	t1,s1,277c <fatfs_get_substring+0xc8>
    2770:	00180813          	addi	a6,a6,1
    2774:	00178793          	addi	a5,a5,1
    2778:	fbdff06f          	j	2734 <fatfs_get_substring+0x80>
    277c:	feb81ce3          	bne	a6,a1,2774 <fatfs_get_substring+0xc0>
    2780:	fed75ae3          	bge	a4,a3,2774 <fatfs_get_substring+0xc0>
    2784:	00170713          	addi	a4,a4,1
    2788:	00688023          	sb	t1,0(a7)
    278c:	fe9ff06f          	j	2774 <fatfs_get_substring+0xc0>
    2790:	fff00793          	li	a5,-1
    2794:	00078513          	mv	a0,a5
    2798:	00008067          	ret

0000279c <fatfs_split_path>:
    279c:	fd010113          	addi	sp,sp,-48
    27a0:	02912223          	sw	s1,36(sp)
    27a4:	03212023          	sw	s2,32(sp)
    27a8:	01312e23          	sw	s3,28(sp)
    27ac:	01412c23          	sw	s4,24(sp)
    27b0:	02112623          	sw	ra,44(sp)
    27b4:	02812423          	sw	s0,40(sp)
    27b8:	01512a23          	sw	s5,20(sp)
    27bc:	00050993          	mv	s3,a0
    27c0:	00058493          	mv	s1,a1
    27c4:	00060913          	mv	s2,a2
    27c8:	00068a13          	mv	s4,a3
    27cc:	00e12623          	sw	a4,12(sp)
    27d0:	00000097          	auipc	ra,0x0
    27d4:	e74080e7          	jalr	-396(ra) # 2644 <fatfs_total_path_levels>
    27d8:	fff00793          	li	a5,-1
    27dc:	02f51863          	bne	a0,a5,280c <fatfs_split_path+0x70>
    27e0:	fff00413          	li	s0,-1
    27e4:	02c12083          	lw	ra,44(sp)
    27e8:	00040513          	mv	a0,s0
    27ec:	02812403          	lw	s0,40(sp)
    27f0:	02412483          	lw	s1,36(sp)
    27f4:	02012903          	lw	s2,32(sp)
    27f8:	01c12983          	lw	s3,28(sp)
    27fc:	01812a03          	lw	s4,24(sp)
    2800:	01412a83          	lw	s5,20(sp)
    2804:	03010113          	addi	sp,sp,48
    2808:	00008067          	ret
    280c:	00c12683          	lw	a3,12(sp)
    2810:	00050593          	mv	a1,a0
    2814:	00a12623          	sw	a0,12(sp)
    2818:	000a0613          	mv	a2,s4
    281c:	00098513          	mv	a0,s3
    2820:	00000097          	auipc	ra,0x0
    2824:	e94080e7          	jalr	-364(ra) # 26b4 <fatfs_get_substring>
    2828:	00050413          	mv	s0,a0
    282c:	fa051ae3          	bnez	a0,27e0 <fatfs_split_path+0x44>
    2830:	00c12583          	lw	a1,12(sp)
    2834:	00059663          	bnez	a1,2840 <fatfs_split_path+0xa4>
    2838:	00048023          	sb	zero,0(s1)
    283c:	fa9ff06f          	j	27e4 <fatfs_split_path+0x48>
    2840:	00098513          	mv	a0,s3
    2844:	fffff097          	auipc	ra,0xfffff
    2848:	ab0080e7          	jalr	-1360(ra) # 12f4 <strlen>
    284c:	00050a93          	mv	s5,a0
    2850:	000a0513          	mv	a0,s4
    2854:	fffff097          	auipc	ra,0xfffff
    2858:	aa0080e7          	jalr	-1376(ra) # 12f4 <strlen>
    285c:	40aa8633          	sub	a2,s5,a0
    2860:	00c95463          	bge	s2,a2,2868 <fatfs_split_path+0xcc>
    2864:	00090613          	mv	a2,s2
    2868:	00048513          	mv	a0,s1
    286c:	00098593          	mv	a1,s3
    2870:	00c12623          	sw	a2,12(sp)
    2874:	fffff097          	auipc	ra,0xfffff
    2878:	a5c080e7          	jalr	-1444(ra) # 12d0 <memcpy>
    287c:	00c12603          	lw	a2,12(sp)
    2880:	00c484b3          	add	s1,s1,a2
    2884:	fe048fa3          	sb	zero,-1(s1)
    2888:	f5dff06f          	j	27e4 <fatfs_split_path+0x48>

0000288c <fatfs_compare_names>:
    288c:	fd010113          	addi	sp,sp,-48
    2890:	02112623          	sw	ra,44(sp)
    2894:	03212023          	sw	s2,32(sp)
    2898:	01312e23          	sw	s3,28(sp)
    289c:	01412c23          	sw	s4,24(sp)
    28a0:	01512a23          	sw	s5,20(sp)
    28a4:	00058a13          	mv	s4,a1
    28a8:	02812423          	sw	s0,40(sp)
    28ac:	02912223          	sw	s1,36(sp)
    28b0:	01612823          	sw	s6,16(sp)
    28b4:	01712623          	sw	s7,12(sp)
    28b8:	01812423          	sw	s8,8(sp)
    28bc:	00050a93          	mv	s5,a0
    28c0:	fffff097          	auipc	ra,0xfffff
    28c4:	1c4080e7          	jalr	452(ra) # 1a84 <FileString_GetExtension>
    28c8:	00050993          	mv	s3,a0
    28cc:	000a0513          	mv	a0,s4
    28d0:	fffff097          	auipc	ra,0xfffff
    28d4:	1b4080e7          	jalr	436(ra) # 1a84 <FileString_GetExtension>
    28d8:	fff00793          	li	a5,-1
    28dc:	00050913          	mv	s2,a0
    28e0:	02f99e63          	bne	s3,a5,291c <fatfs_compare_names+0x90>
    28e4:	0f350063          	beq	a0,s3,29c4 <fatfs_compare_names+0x138>
    28e8:	00000513          	li	a0,0
    28ec:	02c12083          	lw	ra,44(sp)
    28f0:	02812403          	lw	s0,40(sp)
    28f4:	02412483          	lw	s1,36(sp)
    28f8:	02012903          	lw	s2,32(sp)
    28fc:	01c12983          	lw	s3,28(sp)
    2900:	01812a03          	lw	s4,24(sp)
    2904:	01412a83          	lw	s5,20(sp)
    2908:	01012b03          	lw	s6,16(sp)
    290c:	00c12b83          	lw	s7,12(sp)
    2910:	00812c03          	lw	s8,8(sp)
    2914:	03010113          	addi	sp,sp,48
    2918:	00008067          	ret
    291c:	fcf506e3          	beq	a0,a5,28e8 <fatfs_compare_names+0x5c>
    2920:	00198793          	addi	a5,s3,1
    2924:	00fa8b33          	add	s6,s5,a5
    2928:	00050413          	mv	s0,a0
    292c:	00150793          	addi	a5,a0,1
    2930:	000b0513          	mv	a0,s6
    2934:	00fa0bb3          	add	s7,s4,a5
    2938:	fffff097          	auipc	ra,0xfffff
    293c:	9bc080e7          	jalr	-1604(ra) # 12f4 <strlen>
    2940:	00050c13          	mv	s8,a0
    2944:	000b8513          	mv	a0,s7
    2948:	00098493          	mv	s1,s3
    294c:	fffff097          	auipc	ra,0xfffff
    2950:	9a8080e7          	jalr	-1624(ra) # 12f4 <strlen>
    2954:	f8ac1ae3          	bne	s8,a0,28e8 <fatfs_compare_names+0x5c>
    2958:	000b0513          	mv	a0,s6
    295c:	fffff097          	auipc	ra,0xfffff
    2960:	998080e7          	jalr	-1640(ra) # 12f4 <strlen>
    2964:	00050613          	mv	a2,a0
    2968:	000b8593          	mv	a1,s7
    296c:	000b0513          	mv	a0,s6
    2970:	fffff097          	auipc	ra,0xfffff
    2974:	0a4080e7          	jalr	164(ra) # 1a14 <FileString_StrCmpNoCase>
    2978:	f60518e3          	bnez	a0,28e8 <fatfs_compare_names+0x5c>
    297c:	fff48793          	addi	a5,s1,-1
    2980:	00fa87b3          	add	a5,s5,a5
    2984:	41378733          	sub	a4,a5,s3
    2988:	02000693          	li	a3,32
    298c:	06e79263          	bne	a5,a4,29f0 <fatfs_compare_names+0x164>
    2990:	fff40793          	addi	a5,s0,-1
    2994:	00fa07b3          	add	a5,s4,a5
    2998:	41278733          	sub	a4,a5,s2
    299c:	02000693          	li	a3,32
    29a0:	06e79263          	bne	a5,a4,2a04 <fatfs_compare_names+0x178>
    29a4:	f53912e3          	bne	s2,s3,28e8 <fatfs_compare_names+0x5c>
    29a8:	00090613          	mv	a2,s2
    29ac:	000a0593          	mv	a1,s4
    29b0:	000a8513          	mv	a0,s5
    29b4:	fffff097          	auipc	ra,0xfffff
    29b8:	060080e7          	jalr	96(ra) # 1a14 <FileString_StrCmpNoCase>
    29bc:	00153513          	seqz	a0,a0
    29c0:	f2dff06f          	j	28ec <fatfs_compare_names+0x60>
    29c4:	000a8513          	mv	a0,s5
    29c8:	fffff097          	auipc	ra,0xfffff
    29cc:	92c080e7          	jalr	-1748(ra) # 12f4 <strlen>
    29d0:	00050493          	mv	s1,a0
    29d4:	00050993          	mv	s3,a0
    29d8:	000a0513          	mv	a0,s4
    29dc:	fffff097          	auipc	ra,0xfffff
    29e0:	918080e7          	jalr	-1768(ra) # 12f4 <strlen>
    29e4:	00050413          	mv	s0,a0
    29e8:	00050913          	mv	s2,a0
    29ec:	f91ff06f          	j	297c <fatfs_compare_names+0xf0>
    29f0:	0007c603          	lbu	a2,0(a5)
    29f4:	f8d61ee3          	bne	a2,a3,2990 <fatfs_compare_names+0x104>
    29f8:	415789b3          	sub	s3,a5,s5
    29fc:	fff78793          	addi	a5,a5,-1
    2a00:	f8dff06f          	j	298c <fatfs_compare_names+0x100>
    2a04:	0007c603          	lbu	a2,0(a5)
    2a08:	f8d61ee3          	bne	a2,a3,29a4 <fatfs_compare_names+0x118>
    2a0c:	41478933          	sub	s2,a5,s4
    2a10:	fff78793          	addi	a5,a5,-1
    2a14:	f8dff06f          	j	29a0 <fatfs_compare_names+0x114>

00002a18 <_check_file_open>:
    2a18:	fe010113          	addi	sp,sp,-32
    2a1c:	000057b7          	lui	a5,0x5
    2a20:	00812c23          	sw	s0,24(sp)
    2a24:	31c7a403          	lw	s0,796(a5) # 531c <_open_file_list>
    2a28:	00912a23          	sw	s1,20(sp)
    2a2c:	00112e23          	sw	ra,28(sp)
    2a30:	01212823          	sw	s2,16(sp)
    2a34:	01312623          	sw	s3,12(sp)
    2a38:	00050493          	mv	s1,a0
    2a3c:	00041663          	bnez	s0,2a48 <_check_file_open+0x30>
    2a40:	00000513          	li	a0,0
    2a44:	03c0006f          	j	2a80 <_check_file_open+0x68>
    2a48:	bc440793          	addi	a5,s0,-1084
    2a4c:	00f49663          	bne	s1,a5,2a58 <_check_file_open+0x40>
    2a50:	00442403          	lw	s0,4(s0)
    2a54:	fe9ff06f          	j	2a3c <_check_file_open+0x24>
    2a58:	01448593          	addi	a1,s1,20
    2a5c:	bd840513          	addi	a0,s0,-1064
    2a60:	00000097          	auipc	ra,0x0
    2a64:	e2c080e7          	jalr	-468(ra) # 288c <fatfs_compare_names>
    2a68:	fe0504e3          	beqz	a0,2a50 <_check_file_open+0x38>
    2a6c:	11848593          	addi	a1,s1,280
    2a70:	cdc40513          	addi	a0,s0,-804
    2a74:	00000097          	auipc	ra,0x0
    2a78:	e18080e7          	jalr	-488(ra) # 288c <fatfs_compare_names>
    2a7c:	fc050ae3          	beqz	a0,2a50 <_check_file_open+0x38>
    2a80:	01c12083          	lw	ra,28(sp)
    2a84:	01812403          	lw	s0,24(sp)
    2a88:	01412483          	lw	s1,20(sp)
    2a8c:	01012903          	lw	s2,16(sp)
    2a90:	00c12983          	lw	s3,12(sp)
    2a94:	02010113          	addi	sp,sp,32
    2a98:	00008067          	ret

00002a9c <fatfs_get_sfn_display_name>:
    2a9c:	00000713          	li	a4,0
    2aa0:	02000613          	li	a2,32
    2aa4:	01900813          	li	a6,25
    2aa8:	0005c783          	lbu	a5,0(a1)
    2aac:	00078663          	beqz	a5,2ab8 <fatfs_get_sfn_display_name+0x1c>
    2ab0:	ff470693          	addi	a3,a4,-12
    2ab4:	00069863          	bnez	a3,2ac4 <fatfs_get_sfn_display_name+0x28>
    2ab8:	00050023          	sb	zero,0(a0)
    2abc:	00100513          	li	a0,1
    2ac0:	00008067          	ret
    2ac4:	00158593          	addi	a1,a1,1
    2ac8:	fec780e3          	beq	a5,a2,2aa8 <fatfs_get_sfn_display_name+0xc>
    2acc:	fbf78693          	addi	a3,a5,-65
    2ad0:	0ff6f693          	zext.b	a3,a3
    2ad4:	00d86663          	bltu	a6,a3,2ae0 <fatfs_get_sfn_display_name+0x44>
    2ad8:	02078793          	addi	a5,a5,32
    2adc:	0ff7f793          	zext.b	a5,a5
    2ae0:	00f50023          	sb	a5,0(a0)
    2ae4:	00170713          	addi	a4,a4,1
    2ae8:	00150513          	addi	a0,a0,1
    2aec:	fbdff06f          	j	2aa8 <fatfs_get_sfn_display_name+0xc>

00002af0 <fatfs_fat_init>:
    2af0:	ff010113          	addi	sp,sp,-16
    2af4:	00812423          	sw	s0,8(sp)
    2af8:	00912223          	sw	s1,4(sp)
    2afc:	00112623          	sw	ra,12(sp)
    2b00:	fff00793          	li	a5,-1
    2b04:	25850493          	addi	s1,a0,600
    2b08:	00050413          	mv	s0,a0
    2b0c:	44f52c23          	sw	a5,1112(a0)
    2b10:	24052a23          	sw	zero,596(a0)
    2b14:	44052e23          	sw	zero,1116(a0)
    2b18:	20000613          	li	a2,512
    2b1c:	00048513          	mv	a0,s1
    2b20:	00000593          	li	a1,0
    2b24:	ffffe097          	auipc	ra,0xffffe
    2b28:	790080e7          	jalr	1936(ra) # 12b4 <memset>
    2b2c:	25442783          	lw	a5,596(s0)
    2b30:	00c12083          	lw	ra,12(sp)
    2b34:	24942a23          	sw	s1,596(s0)
    2b38:	46042023          	sw	zero,1120(s0)
    2b3c:	46f42223          	sw	a5,1124(s0)
    2b40:	00812403          	lw	s0,8(sp)
    2b44:	00412483          	lw	s1,4(sp)
    2b48:	01010113          	addi	sp,sp,16
    2b4c:	00008067          	ret

00002b50 <fatfs_init>:
    2b50:	fd010113          	addi	sp,sp,-48
    2b54:	02812423          	sw	s0,40(sp)
    2b58:	02112623          	sw	ra,44(sp)
    2b5c:	02912223          	sw	s1,36(sp)
    2b60:	03212023          	sw	s2,32(sp)
    2b64:	01312e23          	sw	s3,28(sp)
    2b68:	fff00793          	li	a5,-1
    2b6c:	24f52223          	sw	a5,580(a0)
    2b70:	24052423          	sw	zero,584(a0)
    2b74:	02052223          	sw	zero,36(a0)
    2b78:	00050413          	mv	s0,a0
    2b7c:	00000097          	auipc	ra,0x0
    2b80:	f74080e7          	jalr	-140(ra) # 2af0 <fatfs_fat_init>
    2b84:	03442783          	lw	a5,52(s0)
    2b88:	02079463          	bnez	a5,2bb0 <fatfs_init+0x60>
    2b8c:	fff00713          	li	a4,-1
    2b90:	02c12083          	lw	ra,44(sp)
    2b94:	02812403          	lw	s0,40(sp)
    2b98:	02412483          	lw	s1,36(sp)
    2b9c:	02012903          	lw	s2,32(sp)
    2ba0:	01c12983          	lw	s3,28(sp)
    2ba4:	00070513          	mv	a0,a4
    2ba8:	03010113          	addi	sp,sp,48
    2bac:	00008067          	ret
    2bb0:	04440593          	addi	a1,s0,68
    2bb4:	00100613          	li	a2,1
    2bb8:	00000513          	li	a0,0
    2bbc:	00b12623          	sw	a1,12(sp)
    2bc0:	000780e7          	jalr	a5
    2bc4:	fc0504e3          	beqz	a0,2b8c <fatfs_init+0x3c>
    2bc8:	24244703          	lbu	a4,578(s0)
    2bcc:	05500793          	li	a5,85
    2bd0:	00c12583          	lw	a1,12(sp)
    2bd4:	00f70663          	beq	a4,a5,2be0 <fatfs_init+0x90>
    2bd8:	ffd00713          	li	a4,-3
    2bdc:	fb5ff06f          	j	2b90 <fatfs_init+0x40>
    2be0:	24344703          	lbu	a4,579(s0)
    2be4:	0aa00793          	li	a5,170
    2be8:	fef718e3          	bne	a4,a5,2bd8 <fatfs_init+0x88>
    2bec:	20644783          	lbu	a5,518(s0)
    2bf0:	00600713          	li	a4,6
    2bf4:	02f76463          	bltu	a4,a5,2c1c <fatfs_init+0xcc>
    2bf8:	00400713          	li	a4,4
    2bfc:	00f76663          	bltu	a4,a5,2c08 <fatfs_init+0xb8>
    2c00:	00000513          	li	a0,0
    2c04:	02078663          	beqz	a5,2c30 <fatfs_init+0xe0>
    2c08:	20c45503          	lhu	a0,524(s0)
    2c0c:	20a45783          	lhu	a5,522(s0)
    2c10:	01051513          	slli	a0,a0,0x10
    2c14:	00f56533          	or	a0,a0,a5
    2c18:	0180006f          	j	2c30 <fatfs_init+0xe0>
    2c1c:	00c00713          	li	a4,12
    2c20:	12f76663          	bltu	a4,a5,2d4c <fatfs_init+0x1fc>
    2c24:	00a00713          	li	a4,10
    2c28:	00000513          	li	a0,0
    2c2c:	fcf76ee3          	bltu	a4,a5,2c08 <fatfs_init+0xb8>
    2c30:	03442783          	lw	a5,52(s0)
    2c34:	00a42e23          	sw	a0,28(s0)
    2c38:	00100613          	li	a2,1
    2c3c:	000780e7          	jalr	a5
    2c40:	f40506e3          	beqz	a0,2b8c <fatfs_init+0x3c>
    2c44:	05044783          	lbu	a5,80(s0)
    2c48:	04f44703          	lbu	a4,79(s0)
    2c4c:	20000693          	li	a3,512
    2c50:	00879793          	slli	a5,a5,0x8
    2c54:	00e7e7b3          	or	a5,a5,a4
    2c58:	ffe00713          	li	a4,-2
    2c5c:	f2d79ae3          	bne	a5,a3,2b90 <fatfs_init+0x40>
    2c60:	05644483          	lbu	s1,86(s0)
    2c64:	05544783          	lbu	a5,85(s0)
    2c68:	05144983          	lbu	s3,81(s0)
    2c6c:	00849493          	slli	s1,s1,0x8
    2c70:	05a45583          	lhu	a1,90(s0)
    2c74:	00f4e4b3          	or	s1,s1,a5
    2c78:	01340023          	sb	s3,0(s0)
    2c7c:	02941423          	sh	s1,40(s0)
    2c80:	05245903          	lhu	s2,82(s0)
    2c84:	05444503          	lbu	a0,84(s0)
    2c88:	00059463          	bnez	a1,2c90 <fatfs_init+0x140>
    2c8c:	06842583          	lw	a1,104(s0)
    2c90:	07042783          	lw	a5,112(s0)
    2c94:	02b42023          	sw	a1,32(s0)
    2c98:	00549493          	slli	s1,s1,0x5
    2c9c:	00f42423          	sw	a5,8(s0)
    2ca0:	07445783          	lhu	a5,116(s0)
    2ca4:	1ff48493          	addi	s1,s1,511
    2ca8:	4094d493          	srai	s1,s1,0x9
    2cac:	00f41c23          	sh	a5,24(s0)
    2cb0:	fffff097          	auipc	ra,0xfffff
    2cb4:	ccc080e7          	jalr	-820(ra) # 197c <__mulsi3>
    2cb8:	00a907b3          	add	a5,s2,a0
    2cbc:	00f42623          	sw	a5,12(s0)
    2cc0:	01c42783          	lw	a5,28(s0)
    2cc4:	24245703          	lhu	a4,578(s0)
    2cc8:	00942823          	sw	s1,16(s0)
    2ccc:	00f907b3          	add	a5,s2,a5
    2cd0:	00f42a23          	sw	a5,20(s0)
    2cd4:	00f507b3          	add	a5,a0,a5
    2cd8:	00f42223          	sw	a5,4(s0)
    2cdc:	0000b7b7          	lui	a5,0xb
    2ce0:	a5578793          	addi	a5,a5,-1451 # aa55 <_files+0x36a5>
    2ce4:	eef71ae3          	bne	a4,a5,2bd8 <fatfs_init+0x88>
    2ce8:	05844783          	lbu	a5,88(s0)
    2cec:	05744703          	lbu	a4,87(s0)
    2cf0:	00879793          	slli	a5,a5,0x8
    2cf4:	00e7e7b3          	or	a5,a5,a4
    2cf8:	00079463          	bnez	a5,2d00 <fatfs_init+0x1b0>
    2cfc:	06442783          	lw	a5,100(s0)
    2d00:	ffb00713          	li	a4,-5
    2d04:	e80986e3          	beqz	s3,2b90 <fatfs_init+0x40>
    2d08:	00990933          	add	s2,s2,s1
    2d0c:	00a90533          	add	a0,s2,a0
    2d10:	40a78533          	sub	a0,a5,a0
    2d14:	00098593          	mv	a1,s3
    2d18:	ffffe097          	auipc	ra,0xffffe
    2d1c:	4f0080e7          	jalr	1264(ra) # 1208 <__udivsi3>
    2d20:	000017b7          	lui	a5,0x1
    2d24:	ff478793          	addi	a5,a5,-12 # ff4 <sdcard_preinit>
    2d28:	ffb00713          	li	a4,-5
    2d2c:	e6a7f2e3          	bgeu	a5,a0,2b90 <fatfs_init+0x40>
    2d30:	000107b7          	lui	a5,0x10
    2d34:	ff478793          	addi	a5,a5,-12 # fff4 <_files+0x8c44>
    2d38:	02a7e663          	bltu	a5,a0,2d64 <fatfs_init+0x214>
    2d3c:	00042423          	sw	zero,8(s0)
    2d40:	02042823          	sw	zero,48(s0)
    2d44:	00000713          	li	a4,0
    2d48:	e49ff06f          	j	2b90 <fatfs_init+0x40>
    2d4c:	ff278793          	addi	a5,a5,-14
    2d50:	0ff7f793          	zext.b	a5,a5
    2d54:	00100713          	li	a4,1
    2d58:	00000513          	li	a0,0
    2d5c:	eaf776e3          	bgeu	a4,a5,2c08 <fatfs_init+0xb8>
    2d60:	ed1ff06f          	j	2c30 <fatfs_init+0xe0>
    2d64:	00100793          	li	a5,1
    2d68:	02f42823          	sw	a5,48(s0)
    2d6c:	fd9ff06f          	j	2d44 <fatfs_init+0x1f4>

00002d70 <fl_attach_media>:
    2d70:	000057b7          	lui	a5,0x5
    2d74:	3287a783          	lw	a5,808(a5) # 5328 <_filelib_init>
    2d78:	fe010113          	addi	sp,sp,-32
    2d7c:	00812c23          	sw	s0,24(sp)
    2d80:	00112e23          	sw	ra,28(sp)
    2d84:	00050413          	mv	s0,a0
    2d88:	00079a63          	bnez	a5,2d9c <fl_attach_media+0x2c>
    2d8c:	00b12623          	sw	a1,12(sp)
    2d90:	fffff097          	auipc	ra,0xfffff
    2d94:	080080e7          	jalr	128(ra) # 1e10 <fl_init>
    2d98:	00c12583          	lw	a1,12(sp)
    2d9c:	000077b7          	lui	a5,0x7
    2da0:	f4878513          	addi	a0,a5,-184 # 6f48 <_fs>
    2da4:	02b52c23          	sw	a1,56(a0)
    2da8:	02852a23          	sw	s0,52(a0)
    2dac:	00000097          	auipc	ra,0x0
    2db0:	da4080e7          	jalr	-604(ra) # 2b50 <fatfs_init>
    2db4:	00050593          	mv	a1,a0
    2db8:	02050863          	beqz	a0,2de8 <fl_attach_media+0x78>
    2dbc:	00a12623          	sw	a0,12(sp)
    2dc0:	00005537          	lui	a0,0x5
    2dc4:	ec050513          	addi	a0,a0,-320 # 4ec0 <LEDS+0xb0>
    2dc8:	fffff097          	auipc	ra,0xfffff
    2dcc:	a78080e7          	jalr	-1416(ra) # 1840 <printf>
    2dd0:	00c12583          	lw	a1,12(sp)
    2dd4:	01c12083          	lw	ra,28(sp)
    2dd8:	01812403          	lw	s0,24(sp)
    2ddc:	00058513          	mv	a0,a1
    2de0:	02010113          	addi	sp,sp,32
    2de4:	00008067          	ret
    2de8:	000057b7          	lui	a5,0x5
    2dec:	00100713          	li	a4,1
    2df0:	32e7a223          	sw	a4,804(a5) # 5324 <_filelib_valid>
    2df4:	fe1ff06f          	j	2dd4 <fl_attach_media+0x64>

00002df8 <fatfs_fat_purge>:
    2df8:	25452583          	lw	a1,596(a0)
    2dfc:	fe010113          	addi	sp,sp,-32
    2e00:	00812c23          	sw	s0,24(sp)
    2e04:	00112e23          	sw	ra,28(sp)
    2e08:	00050413          	mv	s0,a0
    2e0c:	00059663          	bnez	a1,2e18 <fatfs_fat_purge+0x20>
    2e10:	00100513          	li	a0,1
    2e14:	02c0006f          	j	2e40 <fatfs_fat_purge+0x48>
    2e18:	2045a783          	lw	a5,516(a1)
    2e1c:	00079663          	bnez	a5,2e28 <fatfs_fat_purge+0x30>
    2e20:	20c5a583          	lw	a1,524(a1)
    2e24:	fe9ff06f          	j	2e0c <fatfs_fat_purge+0x14>
    2e28:	00040513          	mv	a0,s0
    2e2c:	00b12623          	sw	a1,12(sp)
    2e30:	fffff097          	auipc	ra,0xfffff
    2e34:	c80080e7          	jalr	-896(ra) # 1ab0 <fatfs_fat_writeback>
    2e38:	00c12583          	lw	a1,12(sp)
    2e3c:	fe0512e3          	bnez	a0,2e20 <fatfs_fat_purge+0x28>
    2e40:	01c12083          	lw	ra,28(sp)
    2e44:	01812403          	lw	s0,24(sp)
    2e48:	02010113          	addi	sp,sp,32
    2e4c:	00008067          	ret

00002e50 <fatfs_find_next_cluster>:
    2e50:	ff010113          	addi	sp,sp,-16
    2e54:	00812423          	sw	s0,8(sp)
    2e58:	01212023          	sw	s2,0(sp)
    2e5c:	00112623          	sw	ra,12(sp)
    2e60:	00912223          	sw	s1,4(sp)
    2e64:	00050913          	mv	s2,a0
    2e68:	00200413          	li	s0,2
    2e6c:	00058463          	beqz	a1,2e74 <fatfs_find_next_cluster+0x24>
    2e70:	00058413          	mv	s0,a1
    2e74:	03092783          	lw	a5,48(s2)
    2e78:	00745493          	srli	s1,s0,0x7
    2e7c:	00079463          	bnez	a5,2e84 <fatfs_find_next_cluster+0x34>
    2e80:	00845493          	srli	s1,s0,0x8
    2e84:	01492583          	lw	a1,20(s2)
    2e88:	00090513          	mv	a0,s2
    2e8c:	00b485b3          	add	a1,s1,a1
    2e90:	fffff097          	auipc	ra,0xfffff
    2e94:	ca4080e7          	jalr	-860(ra) # 1b34 <fatfs_fat_read_sector>
    2e98:	00050793          	mv	a5,a0
    2e9c:	fff00513          	li	a0,-1
    2ea0:	04078863          	beqz	a5,2ef0 <fatfs_find_next_cluster+0xa0>
    2ea4:	03092703          	lw	a4,48(s2)
    2ea8:	2087a783          	lw	a5,520(a5)
    2eac:	04071e63          	bnez	a4,2f08 <fatfs_find_next_cluster+0xb8>
    2eb0:	00849493          	slli	s1,s1,0x8
    2eb4:	40940433          	sub	s0,s0,s1
    2eb8:	00141413          	slli	s0,s0,0x1
    2ebc:	01041413          	slli	s0,s0,0x10
    2ec0:	01045413          	srli	s0,s0,0x10
    2ec4:	008787b3          	add	a5,a5,s0
    2ec8:	0017c503          	lbu	a0,1(a5)
    2ecc:	0007c783          	lbu	a5,0(a5)
    2ed0:	00851513          	slli	a0,a0,0x8
    2ed4:	00f50533          	add	a0,a0,a5
    2ed8:	ffff07b7          	lui	a5,0xffff0
    2edc:	00878793          	addi	a5,a5,8 # ffff0008 <__stacktop+0xfffe0008>
    2ee0:	00f507b3          	add	a5,a0,a5
    2ee4:	00700713          	li	a4,7
    2ee8:	00f76463          	bltu	a4,a5,2ef0 <fatfs_find_next_cluster+0xa0>
    2eec:	fff00513          	li	a0,-1
    2ef0:	00c12083          	lw	ra,12(sp)
    2ef4:	00812403          	lw	s0,8(sp)
    2ef8:	00412483          	lw	s1,4(sp)
    2efc:	00012903          	lw	s2,0(sp)
    2f00:	01010113          	addi	sp,sp,16
    2f04:	00008067          	ret
    2f08:	00749493          	slli	s1,s1,0x7
    2f0c:	40940433          	sub	s0,s0,s1
    2f10:	00241413          	slli	s0,s0,0x2
    2f14:	01041413          	slli	s0,s0,0x10
    2f18:	01045413          	srli	s0,s0,0x10
    2f1c:	008787b3          	add	a5,a5,s0
    2f20:	0037c503          	lbu	a0,3(a5)
    2f24:	0027c703          	lbu	a4,2(a5)
    2f28:	01851513          	slli	a0,a0,0x18
    2f2c:	01071713          	slli	a4,a4,0x10
    2f30:	00e50533          	add	a0,a0,a4
    2f34:	0007c703          	lbu	a4,0(a5)
    2f38:	0017c783          	lbu	a5,1(a5)
    2f3c:	00e50533          	add	a0,a0,a4
    2f40:	00879793          	slli	a5,a5,0x8
    2f44:	00f50533          	add	a0,a0,a5
    2f48:	00451513          	slli	a0,a0,0x4
    2f4c:	00455513          	srli	a0,a0,0x4
    2f50:	f00007b7          	lui	a5,0xf0000
    2f54:	f89ff06f          	j	2edc <fatfs_find_next_cluster+0x8c>

00002f58 <fatfs_sector_reader>:
    2f58:	03052783          	lw	a5,48(a0)
    2f5c:	fe010113          	addi	sp,sp,-32
    2f60:	00812c23          	sw	s0,24(sp)
    2f64:	01212823          	sw	s2,16(sp)
    2f68:	01512223          	sw	s5,4(sp)
    2f6c:	00112e23          	sw	ra,28(sp)
    2f70:	00912a23          	sw	s1,20(sp)
    2f74:	01312623          	sw	s3,12(sp)
    2f78:	01412423          	sw	s4,8(sp)
    2f7c:	01612023          	sw	s6,0(sp)
    2f80:	00f5e7b3          	or	a5,a1,a5
    2f84:	00050413          	mv	s0,a0
    2f88:	00060913          	mv	s2,a2
    2f8c:	00068a93          	mv	s5,a3
    2f90:	08079063          	bnez	a5,3010 <fatfs_sector_reader+0xb8>
    2f94:	01052783          	lw	a5,16(a0)
    2f98:	02f66863          	bltu	a2,a5,2fc8 <fatfs_sector_reader+0x70>
    2f9c:	00000513          	li	a0,0
    2fa0:	01c12083          	lw	ra,28(sp)
    2fa4:	01812403          	lw	s0,24(sp)
    2fa8:	01412483          	lw	s1,20(sp)
    2fac:	01012903          	lw	s2,16(sp)
    2fb0:	00c12983          	lw	s3,12(sp)
    2fb4:	00812a03          	lw	s4,8(sp)
    2fb8:	00412a83          	lw	s5,4(sp)
    2fbc:	00012b03          	lw	s6,0(sp)
    2fc0:	02010113          	addi	sp,sp,32
    2fc4:	00008067          	ret
    2fc8:	01c52503          	lw	a0,28(a0)
    2fcc:	00c42783          	lw	a5,12(s0)
    2fd0:	00f50533          	add	a0,a0,a5
    2fd4:	01250533          	add	a0,a0,s2
    2fd8:	0a0a8663          	beqz	s5,3084 <fatfs_sector_reader+0x12c>
    2fdc:	03442783          	lw	a5,52(s0)
    2fe0:	00100613          	li	a2,1
    2fe4:	000a8593          	mv	a1,s5
    2fe8:	01812403          	lw	s0,24(sp)
    2fec:	01c12083          	lw	ra,28(sp)
    2ff0:	01412483          	lw	s1,20(sp)
    2ff4:	01012903          	lw	s2,16(sp)
    2ff8:	00c12983          	lw	s3,12(sp)
    2ffc:	00812a03          	lw	s4,8(sp)
    3000:	00412a83          	lw	s5,4(sp)
    3004:	00012b03          	lw	s6,0(sp)
    3008:	02010113          	addi	sp,sp,32
    300c:	00078067          	jr	a5 # f0000000 <__stacktop+0xefff0000>
    3010:	00054783          	lbu	a5,0(a0)
    3014:	00058493          	mv	s1,a1
    3018:	00060513          	mv	a0,a2
    301c:	00078593          	mv	a1,a5
    3020:	00078a13          	mv	s4,a5
    3024:	ffffe097          	auipc	ra,0xffffe
    3028:	1e4080e7          	jalr	484(ra) # 1208 <__udivsi3>
    302c:	00050b13          	mv	s6,a0
    3030:	00000993          	li	s3,0
    3034:	03699a63          	bne	s3,s6,3068 <fatfs_sector_reader+0x110>
    3038:	fff00793          	li	a5,-1
    303c:	f6f480e3          	beq	s1,a5,2f9c <fatfs_sector_reader+0x44>
    3040:	000a0593          	mv	a1,s4
    3044:	00090513          	mv	a0,s2
    3048:	ffffe097          	auipc	ra,0xffffe
    304c:	208080e7          	jalr	520(ra) # 1250 <__umodsi3>
    3050:	00050913          	mv	s2,a0
    3054:	00048593          	mv	a1,s1
    3058:	00040513          	mv	a0,s0
    305c:	fffff097          	auipc	ra,0xfffff
    3060:	c84080e7          	jalr	-892(ra) # 1ce0 <fatfs_lba_of_cluster>
    3064:	f71ff06f          	j	2fd4 <fatfs_sector_reader+0x7c>
    3068:	00048593          	mv	a1,s1
    306c:	00040513          	mv	a0,s0
    3070:	00000097          	auipc	ra,0x0
    3074:	de0080e7          	jalr	-544(ra) # 2e50 <fatfs_find_next_cluster>
    3078:	00050493          	mv	s1,a0
    307c:	00198993          	addi	s3,s3,1
    3080:	fb5ff06f          	j	3034 <fatfs_sector_reader+0xdc>
    3084:	24442783          	lw	a5,580(s0)
    3088:	00a78c63          	beq	a5,a0,30a0 <fatfs_sector_reader+0x148>
    308c:	03442783          	lw	a5,52(s0)
    3090:	24a42223          	sw	a0,580(s0)
    3094:	00100613          	li	a2,1
    3098:	04440593          	addi	a1,s0,68
    309c:	f4dff06f          	j	2fe8 <fatfs_sector_reader+0x90>
    30a0:	00100513          	li	a0,1
    30a4:	efdff06f          	j	2fa0 <fatfs_sector_reader+0x48>

000030a8 <fatfs_get_file_entry>:
    30a8:	eb010113          	addi	sp,sp,-336
    30ac:	14812423          	sw	s0,328(sp)
    30b0:	14912223          	sw	s1,324(sp)
    30b4:	13312e23          	sw	s3,316(sp)
    30b8:	13712623          	sw	s7,300(sp)
    30bc:	13812423          	sw	s8,296(sp)
    30c0:	13912223          	sw	s9,292(sp)
    30c4:	14112623          	sw	ra,332(sp)
    30c8:	15212023          	sw	s2,320(sp)
    30cc:	13412c23          	sw	s4,312(sp)
    30d0:	13512a23          	sw	s5,308(sp)
    30d4:	13612823          	sw	s6,304(sp)
    30d8:	00050993          	mv	s3,a0
    30dc:	00058c93          	mv	s9,a1
    30e0:	00060b93          	mv	s7,a2
    30e4:	00068c13          	mv	s8,a3
    30e8:	10010ea3          	sb	zero,285(sp)
    30ec:	01810413          	addi	s0,sp,24
    30f0:	11c10493          	addi	s1,sp,284
    30f4:	00040513          	mv	a0,s0
    30f8:	00d00613          	li	a2,13
    30fc:	00000593          	li	a1,0
    3100:	00d40413          	addi	s0,s0,13
    3104:	ffffe097          	auipc	ra,0xffffe
    3108:	1b0080e7          	jalr	432(ra) # 12b4 <memset>
    310c:	fe9414e3          	bne	s0,s1,30f4 <fatfs_get_file_entry+0x4c>
    3110:	00000493          	li	s1,0
    3114:	24498a13          	addi	s4,s3,580
    3118:	00810913          	addi	s2,sp,8
    311c:	00800a93          	li	s5,8
    3120:	02e00b13          	li	s6,46
    3124:	00000693          	li	a3,0
    3128:	00048613          	mv	a2,s1
    312c:	000c8593          	mv	a1,s9
    3130:	00098513          	mv	a0,s3
    3134:	00000097          	auipc	ra,0x0
    3138:	e24080e7          	jalr	-476(ra) # 2f58 <fatfs_sector_reader>
    313c:	08050c63          	beqz	a0,31d4 <fatfs_get_file_entry+0x12c>
    3140:	00148493          	addi	s1,s1,1
    3144:	04498413          	addi	s0,s3,68
    3148:	00040513          	mv	a0,s0
    314c:	fffff097          	auipc	ra,0xfffff
    3150:	f34080e7          	jalr	-204(ra) # 2080 <fatfs_entry_lfn_text>
    3154:	02050063          	beqz	a0,3174 <fatfs_get_file_entry+0xcc>
    3158:	00040593          	mv	a1,s0
    315c:	01810513          	addi	a0,sp,24
    3160:	fffff097          	auipc	ra,0xfffff
    3164:	e18080e7          	jalr	-488(ra) # 1f78 <fatfs_lfn_cache_entry>
    3168:	02040413          	addi	s0,s0,32
    316c:	fd441ee3          	bne	s0,s4,3148 <fatfs_get_file_entry+0xa0>
    3170:	fb5ff06f          	j	3124 <fatfs_get_file_entry+0x7c>
    3174:	00040513          	mv	a0,s0
    3178:	fffff097          	auipc	ra,0xfffff
    317c:	f1c080e7          	jalr	-228(ra) # 2094 <fatfs_entry_lfn_invalid>
    3180:	00050663          	beqz	a0,318c <fatfs_get_file_entry+0xe4>
    3184:	10010ea3          	sb	zero,285(sp)
    3188:	fe1ff06f          	j	3168 <fatfs_get_file_entry+0xc0>
    318c:	00040593          	mv	a1,s0
    3190:	01810513          	addi	a0,sp,24
    3194:	fffff097          	auipc	ra,0xfffff
    3198:	f34080e7          	jalr	-204(ra) # 20c8 <fatfs_entry_lfn_exists>
    319c:	06050663          	beqz	a0,3208 <fatfs_get_file_entry+0x160>
    31a0:	01810513          	addi	a0,sp,24
    31a4:	fffff097          	auipc	ra,0xfffff
    31a8:	ea0080e7          	jalr	-352(ra) # 2044 <fatfs_lfn_cache_get>
    31ac:	000b8593          	mv	a1,s7
    31b0:	fffff097          	auipc	ra,0xfffff
    31b4:	6dc080e7          	jalr	1756(ra) # 288c <fatfs_compare_names>
    31b8:	fc0506e3          	beqz	a0,3184 <fatfs_get_file_entry+0xdc>
    31bc:	02000613          	li	a2,32
    31c0:	00040593          	mv	a1,s0
    31c4:	000c0513          	mv	a0,s8
    31c8:	ffffe097          	auipc	ra,0xffffe
    31cc:	108080e7          	jalr	264(ra) # 12d0 <memcpy>
    31d0:	00100513          	li	a0,1
    31d4:	14c12083          	lw	ra,332(sp)
    31d8:	14812403          	lw	s0,328(sp)
    31dc:	14412483          	lw	s1,324(sp)
    31e0:	14012903          	lw	s2,320(sp)
    31e4:	13c12983          	lw	s3,316(sp)
    31e8:	13812a03          	lw	s4,312(sp)
    31ec:	13412a83          	lw	s5,308(sp)
    31f0:	13012b03          	lw	s6,304(sp)
    31f4:	12c12b83          	lw	s7,300(sp)
    31f8:	12812c03          	lw	s8,296(sp)
    31fc:	12412c83          	lw	s9,292(sp)
    3200:	15010113          	addi	sp,sp,336
    3204:	00008067          	ret
    3208:	00040513          	mv	a0,s0
    320c:	fffff097          	auipc	ra,0xfffff
    3210:	f0c080e7          	jalr	-244(ra) # 2118 <fatfs_entry_sfn_only>
    3214:	f4050ae3          	beqz	a0,3168 <fatfs_get_file_entry+0xc0>
    3218:	00d00613          	li	a2,13
    321c:	00000593          	li	a1,0
    3220:	00090513          	mv	a0,s2
    3224:	ffffe097          	auipc	ra,0xffffe
    3228:	090080e7          	jalr	144(ra) # 12b4 <memset>
    322c:	00000793          	li	a5,0
    3230:	00f406b3          	add	a3,s0,a5
    3234:	0006c683          	lbu	a3,0(a3)
    3238:	00f90733          	add	a4,s2,a5
    323c:	00178793          	addi	a5,a5,1
    3240:	00d70023          	sb	a3,0(a4)
    3244:	ff5796e3          	bne	a5,s5,3230 <fatfs_get_file_entry+0x188>
    3248:	00844703          	lbu	a4,8(s0)
    324c:	00944783          	lbu	a5,9(s0)
    3250:	00a44683          	lbu	a3,10(s0)
    3254:	00e108a3          	sb	a4,17(sp)
    3258:	00f10923          	sb	a5,18(sp)
    325c:	fe070713          	addi	a4,a4,-32
    3260:	fe078793          	addi	a5,a5,-32
    3264:	00f037b3          	snez	a5,a5
    3268:	00e03733          	snez	a4,a4
    326c:	00d109a3          	sb	a3,19(sp)
    3270:	00e7e7b3          	or	a5,a5,a4
    3274:	00079863          	bnez	a5,3284 <fatfs_get_file_entry+0x1dc>
    3278:	fe068693          	addi	a3,a3,-32
    327c:	02000793          	li	a5,32
    3280:	00068a63          	beqz	a3,3294 <fatfs_get_file_entry+0x1ec>
    3284:	00814703          	lbu	a4,8(sp)
    3288:	02e00793          	li	a5,46
    328c:	01671463          	bne	a4,s6,3294 <fatfs_get_file_entry+0x1ec>
    3290:	02000793          	li	a5,32
    3294:	00f10823          	sb	a5,16(sp)
    3298:	000b8593          	mv	a1,s7
    329c:	00090513          	mv	a0,s2
    32a0:	f11ff06f          	j	31b0 <fatfs_get_file_entry+0x108>

000032a4 <_open_directory>:
    32a4:	eb010113          	addi	sp,sp,-336
    32a8:	15212023          	sw	s2,320(sp)
    32ac:	00007937          	lui	s2,0x7
    32b0:	f4890913          	addi	s2,s2,-184 # 6f48 <_fs>
    32b4:	14812423          	sw	s0,328(sp)
    32b8:	00892403          	lw	s0,8(s2)
    32bc:	14912223          	sw	s1,324(sp)
    32c0:	13312e23          	sw	s3,316(sp)
    32c4:	13412c23          	sw	s4,312(sp)
    32c8:	13512a23          	sw	s5,308(sp)
    32cc:	13612823          	sw	s6,304(sp)
    32d0:	14112623          	sw	ra,332(sp)
    32d4:	00050a13          	mv	s4,a0
    32d8:	00058a93          	mv	s5,a1
    32dc:	fffff097          	auipc	ra,0xfffff
    32e0:	368080e7          	jalr	872(ra) # 2644 <fatfs_total_path_levels>
    32e4:	00050b13          	mv	s6,a0
    32e8:	00000493          	li	s1,0
    32ec:	fff00993          	li	s3,-1
    32f0:	009b5863          	bge	s6,s1,3300 <_open_directory+0x5c>
    32f4:	008aa023          	sw	s0,0(s5)
    32f8:	00100513          	li	a0,1
    32fc:	0240006f          	j	3320 <_open_directory+0x7c>
    3300:	10400693          	li	a3,260
    3304:	02c10613          	addi	a2,sp,44
    3308:	00048593          	mv	a1,s1
    330c:	000a0513          	mv	a0,s4
    3310:	fffff097          	auipc	ra,0xfffff
    3314:	3a4080e7          	jalr	932(ra) # 26b4 <fatfs_get_substring>
    3318:	03351863          	bne	a0,s3,3348 <_open_directory+0xa4>
    331c:	00000513          	li	a0,0
    3320:	14c12083          	lw	ra,332(sp)
    3324:	14812403          	lw	s0,328(sp)
    3328:	14412483          	lw	s1,324(sp)
    332c:	14012903          	lw	s2,320(sp)
    3330:	13c12983          	lw	s3,316(sp)
    3334:	13812a03          	lw	s4,312(sp)
    3338:	13412a83          	lw	s5,308(sp)
    333c:	13012b03          	lw	s6,304(sp)
    3340:	15010113          	addi	sp,sp,336
    3344:	00008067          	ret
    3348:	00c10693          	addi	a3,sp,12
    334c:	02c10613          	addi	a2,sp,44
    3350:	00040593          	mv	a1,s0
    3354:	00090513          	mv	a0,s2
    3358:	00000097          	auipc	ra,0x0
    335c:	d50080e7          	jalr	-688(ra) # 30a8 <fatfs_get_file_entry>
    3360:	fa050ee3          	beqz	a0,331c <_open_directory+0x78>
    3364:	01714783          	lbu	a5,23(sp)
    3368:	0107f793          	andi	a5,a5,16
    336c:	fa0788e3          	beqz	a5,331c <_open_directory+0x78>
    3370:	02015403          	lhu	s0,32(sp)
    3374:	02615783          	lhu	a5,38(sp)
    3378:	00148493          	addi	s1,s1,1
    337c:	01041413          	slli	s0,s0,0x10
    3380:	00f40433          	add	s0,s0,a5
    3384:	f6dff06f          	j	32f0 <_open_directory+0x4c>

00003388 <fl_opendir>:
    3388:	fe010113          	addi	sp,sp,-32
    338c:	fff00793          	li	a5,-1
    3390:	00f12623          	sw	a5,12(sp)
    3394:	000057b7          	lui	a5,0x5
    3398:	3287a783          	lw	a5,808(a5) # 5328 <_filelib_init>
    339c:	00812c23          	sw	s0,24(sp)
    33a0:	01212823          	sw	s2,16(sp)
    33a4:	00112e23          	sw	ra,28(sp)
    33a8:	00912a23          	sw	s1,20(sp)
    33ac:	00050913          	mv	s2,a0
    33b0:	00058413          	mv	s0,a1
    33b4:	00079663          	bnez	a5,33c0 <fl_opendir+0x38>
    33b8:	fffff097          	auipc	ra,0xfffff
    33bc:	a58080e7          	jalr	-1448(ra) # 1e10 <fl_init>
    33c0:	000074b7          	lui	s1,0x7
    33c4:	f4848493          	addi	s1,s1,-184 # 6f48 <_fs>
    33c8:	03c4a783          	lw	a5,60(s1)
    33cc:	00078463          	beqz	a5,33d4 <fl_opendir+0x4c>
    33d0:	000780e7          	jalr	a5
    33d4:	00090513          	mv	a0,s2
    33d8:	fffff097          	auipc	ra,0xfffff
    33dc:	26c080e7          	jalr	620(ra) # 2644 <fatfs_total_path_levels>
    33e0:	fff00793          	li	a5,-1
    33e4:	02f51063          	bne	a0,a5,3404 <fl_opendir+0x7c>
    33e8:	0084a783          	lw	a5,8(s1)
    33ec:	00f12623          	sw	a5,12(sp)
    33f0:	00c12783          	lw	a5,12(sp)
    33f4:	00042023          	sw	zero,0(s0)
    33f8:	00040423          	sb	zero,8(s0)
    33fc:	00f42223          	sw	a5,4(s0)
    3400:	0180006f          	j	3418 <fl_opendir+0x90>
    3404:	00c10593          	addi	a1,sp,12
    3408:	00090513          	mv	a0,s2
    340c:	00000097          	auipc	ra,0x0
    3410:	e98080e7          	jalr	-360(ra) # 32a4 <_open_directory>
    3414:	fc051ee3          	bnez	a0,33f0 <fl_opendir+0x68>
    3418:	0404a783          	lw	a5,64(s1)
    341c:	00078463          	beqz	a5,3424 <fl_opendir+0x9c>
    3420:	000780e7          	jalr	a5
    3424:	00c12703          	lw	a4,12(sp)
    3428:	fff00793          	li	a5,-1
    342c:	00f71463          	bne	a4,a5,3434 <fl_opendir+0xac>
    3430:	00000413          	li	s0,0
    3434:	01c12083          	lw	ra,28(sp)
    3438:	00040513          	mv	a0,s0
    343c:	01812403          	lw	s0,24(sp)
    3440:	01412483          	lw	s1,20(sp)
    3444:	01012903          	lw	s2,16(sp)
    3448:	02010113          	addi	sp,sp,32
    344c:	00008067          	ret

00003450 <_open_file>:
    3450:	fc010113          	addi	sp,sp,-64
    3454:	03312623          	sw	s3,44(sp)
    3458:	02112e23          	sw	ra,60(sp)
    345c:	02812c23          	sw	s0,56(sp)
    3460:	02912a23          	sw	s1,52(sp)
    3464:	03212823          	sw	s2,48(sp)
    3468:	00050993          	mv	s3,a0
    346c:	ffffe097          	auipc	ra,0xffffe
    3470:	7b4080e7          	jalr	1972(ra) # 1c20 <_allocate_file>
    3474:	06050463          	beqz	a0,34dc <_open_file+0x8c>
    3478:	01450913          	addi	s2,a0,20
    347c:	00050413          	mv	s0,a0
    3480:	10400613          	li	a2,260
    3484:	00000593          	li	a1,0
    3488:	00090513          	mv	a0,s2
    348c:	ffffe097          	auipc	ra,0xffffe
    3490:	e28080e7          	jalr	-472(ra) # 12b4 <memset>
    3494:	11840493          	addi	s1,s0,280
    3498:	10400613          	li	a2,260
    349c:	00000593          	li	a1,0
    34a0:	00048513          	mv	a0,s1
    34a4:	ffffe097          	auipc	ra,0xffffe
    34a8:	e10080e7          	jalr	-496(ra) # 12b4 <memset>
    34ac:	10400713          	li	a4,260
    34b0:	00048693          	mv	a3,s1
    34b4:	00070613          	mv	a2,a4
    34b8:	00090593          	mv	a1,s2
    34bc:	00098513          	mv	a0,s3
    34c0:	fffff097          	auipc	ra,0xfffff
    34c4:	2dc080e7          	jalr	732(ra) # 279c <fatfs_split_path>
    34c8:	fff00793          	li	a5,-1
    34cc:	02f51a63          	bne	a0,a5,3500 <_open_file+0xb0>
    34d0:	00040513          	mv	a0,s0
    34d4:	ffffe097          	auipc	ra,0xffffe
    34d8:	7c4080e7          	jalr	1988(ra) # 1c98 <_free_file>
    34dc:	00000413          	li	s0,0
    34e0:	03c12083          	lw	ra,60(sp)
    34e4:	00040513          	mv	a0,s0
    34e8:	03812403          	lw	s0,56(sp)
    34ec:	03412483          	lw	s1,52(sp)
    34f0:	03012903          	lw	s2,48(sp)
    34f4:	02c12983          	lw	s3,44(sp)
    34f8:	04010113          	addi	sp,sp,64
    34fc:	00008067          	ret
    3500:	00040513          	mv	a0,s0
    3504:	fffff097          	auipc	ra,0xfffff
    3508:	514080e7          	jalr	1300(ra) # 2a18 <_check_file_open>
    350c:	fc0512e3          	bnez	a0,34d0 <_open_file+0x80>
    3510:	01444783          	lbu	a5,20(s0)
    3514:	08079c63          	bnez	a5,35ac <_open_file+0x15c>
    3518:	000077b7          	lui	a5,0x7
    351c:	f507a783          	lw	a5,-176(a5) # 6f50 <_fs+0x8>
    3520:	00f42023          	sw	a5,0(s0)
    3524:	00042583          	lw	a1,0(s0)
    3528:	00048613          	mv	a2,s1
    352c:	000074b7          	lui	s1,0x7
    3530:	00010693          	mv	a3,sp
    3534:	f4848513          	addi	a0,s1,-184 # 6f48 <_fs>
    3538:	00000097          	auipc	ra,0x0
    353c:	b70080e7          	jalr	-1168(ra) # 30a8 <fatfs_get_file_entry>
    3540:	f80508e3          	beqz	a0,34d0 <_open_file+0x80>
    3544:	00b14783          	lbu	a5,11(sp)
    3548:	0207f793          	andi	a5,a5,32
    354c:	f80782e3          	beqz	a5,34d0 <_open_file+0x80>
    3550:	00b00613          	li	a2,11
    3554:	00010593          	mv	a1,sp
    3558:	21c40513          	addi	a0,s0,540
    355c:	ffffe097          	auipc	ra,0xffffe
    3560:	d74080e7          	jalr	-652(ra) # 12d0 <memcpy>
    3564:	01c12783          	lw	a5,28(sp)
    3568:	01a15703          	lhu	a4,26(sp)
    356c:	00042423          	sw	zero,8(s0)
    3570:	00f42623          	sw	a5,12(s0)
    3574:	01415783          	lhu	a5,20(sp)
    3578:	42042a23          	sw	zero,1076(s0)
    357c:	00042823          	sw	zero,16(s0)
    3580:	01079793          	slli	a5,a5,0x10
    3584:	00e787b3          	add	a5,a5,a4
    3588:	00f42223          	sw	a5,4(s0)
    358c:	fff00793          	li	a5,-1
    3590:	42f42823          	sw	a5,1072(s0)
    3594:	22f42423          	sw	a5,552(s0)
    3598:	22f42623          	sw	a5,556(s0)
    359c:	f4848513          	addi	a0,s1,-184
    35a0:	00000097          	auipc	ra,0x0
    35a4:	858080e7          	jalr	-1960(ra) # 2df8 <fatfs_fat_purge>
    35a8:	f39ff06f          	j	34e0 <_open_file+0x90>
    35ac:	00040593          	mv	a1,s0
    35b0:	00090513          	mv	a0,s2
    35b4:	00000097          	auipc	ra,0x0
    35b8:	cf0080e7          	jalr	-784(ra) # 32a4 <_open_directory>
    35bc:	f60514e3          	bnez	a0,3524 <_open_file+0xd4>
    35c0:	f11ff06f          	j	34d0 <_open_file+0x80>

000035c4 <fatfs_sfn_exists>:
    35c4:	fe010113          	addi	sp,sp,-32
    35c8:	01212823          	sw	s2,16(sp)
    35cc:	01312623          	sw	s3,12(sp)
    35d0:	01412423          	sw	s4,8(sp)
    35d4:	01512223          	sw	s5,4(sp)
    35d8:	01612023          	sw	s6,0(sp)
    35dc:	00112e23          	sw	ra,28(sp)
    35e0:	00812c23          	sw	s0,24(sp)
    35e4:	00912a23          	sw	s1,20(sp)
    35e8:	00050993          	mv	s3,a0
    35ec:	00058a93          	mv	s5,a1
    35f0:	00060b13          	mv	s6,a2
    35f4:	00000913          	li	s2,0
    35f8:	24450a13          	addi	s4,a0,580
    35fc:	00000693          	li	a3,0
    3600:	00090613          	mv	a2,s2
    3604:	000a8593          	mv	a1,s5
    3608:	00098513          	mv	a0,s3
    360c:	00000097          	auipc	ra,0x0
    3610:	94c080e7          	jalr	-1716(ra) # 2f58 <fatfs_sector_reader>
    3614:	00050413          	mv	s0,a0
    3618:	06050263          	beqz	a0,367c <fatfs_sfn_exists+0xb8>
    361c:	00190913          	addi	s2,s2,1
    3620:	04498493          	addi	s1,s3,68
    3624:	00048513          	mv	a0,s1
    3628:	fffff097          	auipc	ra,0xfffff
    362c:	a58080e7          	jalr	-1448(ra) # 2080 <fatfs_entry_lfn_text>
    3630:	00050863          	beqz	a0,3640 <fatfs_sfn_exists+0x7c>
    3634:	02048493          	addi	s1,s1,32
    3638:	ff4496e3          	bne	s1,s4,3624 <fatfs_sfn_exists+0x60>
    363c:	fc1ff06f          	j	35fc <fatfs_sfn_exists+0x38>
    3640:	00048513          	mv	a0,s1
    3644:	fffff097          	auipc	ra,0xfffff
    3648:	a50080e7          	jalr	-1456(ra) # 2094 <fatfs_entry_lfn_invalid>
    364c:	fe0514e3          	bnez	a0,3634 <fatfs_sfn_exists+0x70>
    3650:	00048513          	mv	a0,s1
    3654:	fffff097          	auipc	ra,0xfffff
    3658:	ac4080e7          	jalr	-1340(ra) # 2118 <fatfs_entry_sfn_only>
    365c:	00050413          	mv	s0,a0
    3660:	fc050ae3          	beqz	a0,3634 <fatfs_sfn_exists+0x70>
    3664:	00b00613          	li	a2,11
    3668:	000b0593          	mv	a1,s6
    366c:	00048513          	mv	a0,s1
    3670:	ffffe097          	auipc	ra,0xffffe
    3674:	ca4080e7          	jalr	-860(ra) # 1314 <strncmp>
    3678:	fa051ee3          	bnez	a0,3634 <fatfs_sfn_exists+0x70>
    367c:	01c12083          	lw	ra,28(sp)
    3680:	00040513          	mv	a0,s0
    3684:	01812403          	lw	s0,24(sp)
    3688:	01412483          	lw	s1,20(sp)
    368c:	01012903          	lw	s2,16(sp)
    3690:	00c12983          	lw	s3,12(sp)
    3694:	00812a03          	lw	s4,8(sp)
    3698:	00412a83          	lw	s5,4(sp)
    369c:	00012b03          	lw	s6,0(sp)
    36a0:	02010113          	addi	sp,sp,32
    36a4:	00008067          	ret

000036a8 <fatfs_update_file_length>:
    36a8:	03852783          	lw	a5,56(a0)
    36ac:	14078e63          	beqz	a5,3808 <fatfs_update_file_length+0x160>
    36b0:	fd010113          	addi	sp,sp,-48
    36b4:	02912223          	sw	s1,36(sp)
    36b8:	03212023          	sw	s2,32(sp)
    36bc:	01312e23          	sw	s3,28(sp)
    36c0:	01412c23          	sw	s4,24(sp)
    36c4:	01612823          	sw	s6,16(sp)
    36c8:	01712623          	sw	s7,12(sp)
    36cc:	02112623          	sw	ra,44(sp)
    36d0:	02812423          	sw	s0,40(sp)
    36d4:	01512a23          	sw	s5,20(sp)
    36d8:	00068913          	mv	s2,a3
    36dc:	00060b93          	mv	s7,a2
    36e0:	00058b13          	mv	s6,a1
    36e4:	00050493          	mv	s1,a0
    36e8:	00000993          	li	s3,0
    36ec:	24450a13          	addi	s4,a0,580
    36f0:	00000693          	li	a3,0
    36f4:	00098613          	mv	a2,s3
    36f8:	000b0593          	mv	a1,s6
    36fc:	00048513          	mv	a0,s1
    3700:	00000097          	auipc	ra,0x0
    3704:	858080e7          	jalr	-1960(ra) # 2f58 <fatfs_sector_reader>
    3708:	0c050863          	beqz	a0,37d8 <fatfs_update_file_length+0x130>
    370c:	04448413          	addi	s0,s1,68
    3710:	00198993          	addi	s3,s3,1
    3714:	00040a93          	mv	s5,s0
    3718:	00040513          	mv	a0,s0
    371c:	fffff097          	auipc	ra,0xfffff
    3720:	964080e7          	jalr	-1692(ra) # 2080 <fatfs_entry_lfn_text>
    3724:	0a051463          	bnez	a0,37cc <fatfs_update_file_length+0x124>
    3728:	00040513          	mv	a0,s0
    372c:	fffff097          	auipc	ra,0xfffff
    3730:	968080e7          	jalr	-1688(ra) # 2094 <fatfs_entry_lfn_invalid>
    3734:	08051c63          	bnez	a0,37cc <fatfs_update_file_length+0x124>
    3738:	00040513          	mv	a0,s0
    373c:	fffff097          	auipc	ra,0xfffff
    3740:	9dc080e7          	jalr	-1572(ra) # 2118 <fatfs_entry_sfn_only>
    3744:	08050463          	beqz	a0,37cc <fatfs_update_file_length+0x124>
    3748:	00b00613          	li	a2,11
    374c:	000b8593          	mv	a1,s7
    3750:	00040513          	mv	a0,s0
    3754:	ffffe097          	auipc	ra,0xffffe
    3758:	bc0080e7          	jalr	-1088(ra) # 1314 <strncmp>
    375c:	06051863          	bnez	a0,37cc <fatfs_update_file_length+0x124>
    3760:	00895793          	srli	a5,s2,0x8
    3764:	01240e23          	sb	s2,28(s0)
    3768:	00f40ea3          	sb	a5,29(s0)
    376c:	01095793          	srli	a5,s2,0x10
    3770:	01895913          	srli	s2,s2,0x18
    3774:	00f40f23          	sb	a5,30(s0)
    3778:	01240fa3          	sb	s2,31(s0)
    377c:	00040593          	mv	a1,s0
    3780:	02000613          	li	a2,32
    3784:	00040513          	mv	a0,s0
    3788:	ffffe097          	auipc	ra,0xffffe
    378c:	b48080e7          	jalr	-1208(ra) # 12d0 <memcpy>
    3790:	02812403          	lw	s0,40(sp)
    3794:	0384a783          	lw	a5,56(s1)
    3798:	2444a503          	lw	a0,580(s1)
    379c:	02c12083          	lw	ra,44(sp)
    37a0:	02412483          	lw	s1,36(sp)
    37a4:	02012903          	lw	s2,32(sp)
    37a8:	01c12983          	lw	s3,28(sp)
    37ac:	01812a03          	lw	s4,24(sp)
    37b0:	01012b03          	lw	s6,16(sp)
    37b4:	00c12b83          	lw	s7,12(sp)
    37b8:	000a8593          	mv	a1,s5
    37bc:	01412a83          	lw	s5,20(sp)
    37c0:	00100613          	li	a2,1
    37c4:	03010113          	addi	sp,sp,48
    37c8:	00078067          	jr	a5
    37cc:	02040413          	addi	s0,s0,32
    37d0:	f54414e3          	bne	s0,s4,3718 <fatfs_update_file_length+0x70>
    37d4:	f1dff06f          	j	36f0 <fatfs_update_file_length+0x48>
    37d8:	02c12083          	lw	ra,44(sp)
    37dc:	02812403          	lw	s0,40(sp)
    37e0:	02412483          	lw	s1,36(sp)
    37e4:	02012903          	lw	s2,32(sp)
    37e8:	01c12983          	lw	s3,28(sp)
    37ec:	01812a03          	lw	s4,24(sp)
    37f0:	01412a83          	lw	s5,20(sp)
    37f4:	01012b03          	lw	s6,16(sp)
    37f8:	00c12b83          	lw	s7,12(sp)
    37fc:	00000513          	li	a0,0
    3800:	03010113          	addi	sp,sp,48
    3804:	00008067          	ret
    3808:	00000513          	li	a0,0
    380c:	00008067          	ret

00003810 <fatfs_list_directory_next>:
    3810:	ec010113          	addi	sp,sp,-320
    3814:	13212823          	sw	s2,304(sp)
    3818:	13312623          	sw	s3,300(sp)
    381c:	13412423          	sw	s4,296(sp)
    3820:	13512223          	sw	s5,292(sp)
    3824:	13612023          	sw	s6,288(sp)
    3828:	12112e23          	sw	ra,316(sp)
    382c:	12812c23          	sw	s0,312(sp)
    3830:	12912a23          	sw	s1,308(sp)
    3834:	00050a13          	mv	s4,a0
    3838:	00058913          	mv	s2,a1
    383c:	00060993          	mv	s3,a2
    3840:	10010ea3          	sb	zero,285(sp)
    3844:	04450a93          	addi	s5,a0,68
    3848:	00f00b13          	li	s6,15
    384c:	00092603          	lw	a2,0(s2)
    3850:	00492583          	lw	a1,4(s2)
    3854:	00000693          	li	a3,0
    3858:	000a0513          	mv	a0,s4
    385c:	fffff097          	auipc	ra,0xfffff
    3860:	6fc080e7          	jalr	1788(ra) # 2f58 <fatfs_sector_reader>
    3864:	10050c63          	beqz	a0,397c <fatfs_list_directory_next+0x16c>
    3868:	00894483          	lbu	s1,8(s2)
    386c:	00549413          	slli	s0,s1,0x5
    3870:	008a8433          	add	s0,s5,s0
    3874:	009b7c63          	bgeu	s6,s1,388c <fatfs_list_directory_next+0x7c>
    3878:	00092783          	lw	a5,0(s2)
    387c:	00090423          	sb	zero,8(s2)
    3880:	00178793          	addi	a5,a5,1
    3884:	00f92023          	sw	a5,0(s2)
    3888:	fc5ff06f          	j	384c <fatfs_list_directory_next+0x3c>
    388c:	00040513          	mv	a0,s0
    3890:	ffffe097          	auipc	ra,0xffffe
    3894:	7f0080e7          	jalr	2032(ra) # 2080 <fatfs_entry_lfn_text>
    3898:	02050263          	beqz	a0,38bc <fatfs_list_directory_next+0xac>
    389c:	00040593          	mv	a1,s0
    38a0:	01810513          	addi	a0,sp,24
    38a4:	ffffe097          	auipc	ra,0xffffe
    38a8:	6d4080e7          	jalr	1748(ra) # 1f78 <fatfs_lfn_cache_entry>
    38ac:	00148493          	addi	s1,s1,1
    38b0:	0ff4f493          	zext.b	s1,s1
    38b4:	02040413          	addi	s0,s0,32
    38b8:	fbdff06f          	j	3874 <fatfs_list_directory_next+0x64>
    38bc:	00040513          	mv	a0,s0
    38c0:	ffffe097          	auipc	ra,0xffffe
    38c4:	7d4080e7          	jalr	2004(ra) # 2094 <fatfs_entry_lfn_invalid>
    38c8:	00050663          	beqz	a0,38d4 <fatfs_list_directory_next+0xc4>
    38cc:	10010ea3          	sb	zero,285(sp)
    38d0:	fddff06f          	j	38ac <fatfs_list_directory_next+0x9c>
    38d4:	00040593          	mv	a1,s0
    38d8:	01810513          	addi	a0,sp,24
    38dc:	ffffe097          	auipc	ra,0xffffe
    38e0:	7ec080e7          	jalr	2028(ra) # 20c8 <fatfs_entry_lfn_exists>
    38e4:	0c050063          	beqz	a0,39a4 <fatfs_list_directory_next+0x194>
    38e8:	01810513          	addi	a0,sp,24
    38ec:	ffffe097          	auipc	ra,0xffffe
    38f0:	758080e7          	jalr	1880(ra) # 2044 <fatfs_lfn_cache_get>
    38f4:	00050593          	mv	a1,a0
    38f8:	10300613          	li	a2,259
    38fc:	00098513          	mv	a0,s3
    3900:	ffffe097          	auipc	ra,0xffffe
    3904:	a54080e7          	jalr	-1452(ra) # 1354 <strncpy>
    3908:	00040513          	mv	a0,s0
    390c:	fffff097          	auipc	ra,0xfffff
    3910:	84c080e7          	jalr	-1972(ra) # 2158 <fatfs_entry_is_dir>
    3914:	10a98223          	sb	a0,260(s3)
    3918:	01d44783          	lbu	a5,29(s0)
    391c:	01c44703          	lbu	a4,28(s0)
    3920:	00148493          	addi	s1,s1,1
    3924:	00879793          	slli	a5,a5,0x8
    3928:	00e7e7b3          	or	a5,a5,a4
    392c:	01e44703          	lbu	a4,30(s0)
    3930:	00100513          	li	a0,1
    3934:	01071713          	slli	a4,a4,0x10
    3938:	00f76733          	or	a4,a4,a5
    393c:	01f44783          	lbu	a5,31(s0)
    3940:	01879793          	slli	a5,a5,0x18
    3944:	00e7e7b3          	or	a5,a5,a4
    3948:	10f9a623          	sw	a5,268(s3)
    394c:	01544783          	lbu	a5,21(s0)
    3950:	01444703          	lbu	a4,20(s0)
    3954:	01a44683          	lbu	a3,26(s0)
    3958:	00879793          	slli	a5,a5,0x8
    395c:	00e7e7b3          	or	a5,a5,a4
    3960:	01b44703          	lbu	a4,27(s0)
    3964:	01079793          	slli	a5,a5,0x10
    3968:	00871713          	slli	a4,a4,0x8
    396c:	00d76733          	or	a4,a4,a3
    3970:	00e7e7b3          	or	a5,a5,a4
    3974:	10f9a423          	sw	a5,264(s3)
    3978:	00990423          	sb	s1,8(s2)
    397c:	13c12083          	lw	ra,316(sp)
    3980:	13812403          	lw	s0,312(sp)
    3984:	13412483          	lw	s1,308(sp)
    3988:	13012903          	lw	s2,304(sp)
    398c:	12c12983          	lw	s3,300(sp)
    3990:	12812a03          	lw	s4,296(sp)
    3994:	12412a83          	lw	s5,292(sp)
    3998:	12012b03          	lw	s6,288(sp)
    399c:	14010113          	addi	sp,sp,320
    39a0:	00008067          	ret
    39a4:	00040513          	mv	a0,s0
    39a8:	ffffe097          	auipc	ra,0xffffe
    39ac:	770080e7          	jalr	1904(ra) # 2118 <fatfs_entry_sfn_only>
    39b0:	ee050ee3          	beqz	a0,38ac <fatfs_list_directory_next+0x9c>
    39b4:	00810a13          	addi	s4,sp,8
    39b8:	00d00613          	li	a2,13
    39bc:	00000593          	li	a1,0
    39c0:	000a0513          	mv	a0,s4
    39c4:	10010ea3          	sb	zero,285(sp)
    39c8:	ffffe097          	auipc	ra,0xffffe
    39cc:	8ec080e7          	jalr	-1812(ra) # 12b4 <memset>
    39d0:	00000793          	li	a5,0
    39d4:	00800713          	li	a4,8
    39d8:	00f40633          	add	a2,s0,a5
    39dc:	00064603          	lbu	a2,0(a2)
    39e0:	00fa06b3          	add	a3,s4,a5
    39e4:	00178793          	addi	a5,a5,1
    39e8:	00c68023          	sb	a2,0(a3)
    39ec:	fee796e3          	bne	a5,a4,39d8 <fatfs_list_directory_next+0x1c8>
    39f0:	00844783          	lbu	a5,8(s0)
    39f4:	00944703          	lbu	a4,9(s0)
    39f8:	00a44683          	lbu	a3,10(s0)
    39fc:	00f108a3          	sb	a5,17(sp)
    3a00:	00e10923          	sb	a4,18(sp)
    3a04:	fe078793          	addi	a5,a5,-32
    3a08:	fe070713          	addi	a4,a4,-32
    3a0c:	00f037b3          	snez	a5,a5
    3a10:	00e03733          	snez	a4,a4
    3a14:	00d109a3          	sb	a3,19(sp)
    3a18:	00e7e7b3          	or	a5,a5,a4
    3a1c:	00079863          	bnez	a5,3a2c <fatfs_list_directory_next+0x21c>
    3a20:	fe068693          	addi	a3,a3,-32
    3a24:	02000793          	li	a5,32
    3a28:	00068a63          	beqz	a3,3a3c <fatfs_list_directory_next+0x22c>
    3a2c:	00814703          	lbu	a4,8(sp)
    3a30:	02e00793          	li	a5,46
    3a34:	00f71463          	bne	a4,a5,3a3c <fatfs_list_directory_next+0x22c>
    3a38:	02000793          	li	a5,32
    3a3c:	000a0593          	mv	a1,s4
    3a40:	00098513          	mv	a0,s3
    3a44:	00f10823          	sb	a5,16(sp)
    3a48:	fffff097          	auipc	ra,0xfffff
    3a4c:	054080e7          	jalr	84(ra) # 2a9c <fatfs_get_sfn_display_name>
    3a50:	eb9ff06f          	j	3908 <fatfs_list_directory_next+0xf8>

00003a54 <fl_readdir>:
    3a54:	000057b7          	lui	a5,0x5
    3a58:	3287a783          	lw	a5,808(a5) # 5328 <_filelib_init>
    3a5c:	fd010113          	addi	sp,sp,-48
    3a60:	03212023          	sw	s2,32(sp)
    3a64:	01312e23          	sw	s3,28(sp)
    3a68:	02112623          	sw	ra,44(sp)
    3a6c:	02812423          	sw	s0,40(sp)
    3a70:	02912223          	sw	s1,36(sp)
    3a74:	00050913          	mv	s2,a0
    3a78:	00058993          	mv	s3,a1
    3a7c:	00079663          	bnez	a5,3a88 <fl_readdir+0x34>
    3a80:	ffffe097          	auipc	ra,0xffffe
    3a84:	390080e7          	jalr	912(ra) # 1e10 <fl_init>
    3a88:	000074b7          	lui	s1,0x7
    3a8c:	f4848413          	addi	s0,s1,-184 # 6f48 <_fs>
    3a90:	03c42783          	lw	a5,60(s0)
    3a94:	00078463          	beqz	a5,3a9c <fl_readdir+0x48>
    3a98:	000780e7          	jalr	a5
    3a9c:	00098613          	mv	a2,s3
    3aa0:	00090593          	mv	a1,s2
    3aa4:	f4848513          	addi	a0,s1,-184
    3aa8:	00000097          	auipc	ra,0x0
    3aac:	d68080e7          	jalr	-664(ra) # 3810 <fatfs_list_directory_next>
    3ab0:	04042783          	lw	a5,64(s0)
    3ab4:	00078863          	beqz	a5,3ac4 <fl_readdir+0x70>
    3ab8:	00a12623          	sw	a0,12(sp)
    3abc:	000780e7          	jalr	a5
    3ac0:	00c12503          	lw	a0,12(sp)
    3ac4:	02c12083          	lw	ra,44(sp)
    3ac8:	02812403          	lw	s0,40(sp)
    3acc:	00154513          	xori	a0,a0,1
    3ad0:	02412483          	lw	s1,36(sp)
    3ad4:	02012903          	lw	s2,32(sp)
    3ad8:	01c12983          	lw	s3,28(sp)
    3adc:	40a00533          	neg	a0,a0
    3ae0:	03010113          	addi	sp,sp,48
    3ae4:	00008067          	ret

00003ae8 <_read_sectors>:
    3ae8:	fd010113          	addi	sp,sp,-48
    3aec:	01512a23          	sw	s5,20(sp)
    3af0:	00007ab7          	lui	s5,0x7
    3af4:	01312e23          	sw	s3,28(sp)
    3af8:	f48ac983          	lbu	s3,-184(s5) # 6f48 <_fs>
    3afc:	01612823          	sw	s6,16(sp)
    3b00:	00058b13          	mv	s6,a1
    3b04:	02912223          	sw	s1,36(sp)
    3b08:	00098593          	mv	a1,s3
    3b0c:	00050493          	mv	s1,a0
    3b10:	000b0513          	mv	a0,s6
    3b14:	02112623          	sw	ra,44(sp)
    3b18:	02812423          	sw	s0,40(sp)
    3b1c:	01412c23          	sw	s4,24(sp)
    3b20:	00068413          	mv	s0,a3
    3b24:	01712623          	sw	s7,12(sp)
    3b28:	01812423          	sw	s8,8(sp)
    3b2c:	03212023          	sw	s2,32(sp)
    3b30:	00060c13          	mv	s8,a2
    3b34:	ffffd097          	auipc	ra,0xffffd
    3b38:	6d4080e7          	jalr	1748(ra) # 1208 <__udivsi3>
    3b3c:	00050a13          	mv	s4,a0
    3b40:	00098593          	mv	a1,s3
    3b44:	000b0513          	mv	a0,s6
    3b48:	ffffd097          	auipc	ra,0xffffd
    3b4c:	708080e7          	jalr	1800(ra) # 1250 <__umodsi3>
    3b50:	00a407b3          	add	a5,s0,a0
    3b54:	00050b93          	mv	s7,a0
    3b58:	00f9fe63          	bgeu	s3,a5,3b74 <_read_sectors+0x8c>
    3b5c:	000a0593          	mv	a1,s4
    3b60:	00098513          	mv	a0,s3
    3b64:	ffffe097          	auipc	ra,0xffffe
    3b68:	e18080e7          	jalr	-488(ra) # 197c <__mulsi3>
    3b6c:	416987b3          	sub	a5,s3,s6
    3b70:	00f50433          	add	s0,a0,a5
    3b74:	2284a903          	lw	s2,552(s1)
    3b78:	07491863          	bne	s2,s4,3be8 <_read_sectors+0x100>
    3b7c:	22c4a583          	lw	a1,556(s1)
    3b80:	fff00793          	li	a5,-1
    3b84:	02f58663          	beq	a1,a5,3bb0 <_read_sectors+0xc8>
    3b88:	f48a8513          	addi	a0,s5,-184
    3b8c:	ffffe097          	auipc	ra,0xffffe
    3b90:	154080e7          	jalr	340(ra) # 1ce0 <fatfs_lba_of_cluster>
    3b94:	017505b3          	add	a1,a0,s7
    3b98:	00040693          	mv	a3,s0
    3b9c:	000c0613          	mv	a2,s8
    3ba0:	f48a8513          	addi	a0,s5,-184
    3ba4:	ffffe097          	auipc	ra,0xffffe
    3ba8:	188080e7          	jalr	392(ra) # 1d2c <fatfs_sector_read>
    3bac:	00051463          	bnez	a0,3bb4 <_read_sectors+0xcc>
    3bb0:	00000413          	li	s0,0
    3bb4:	02c12083          	lw	ra,44(sp)
    3bb8:	00040513          	mv	a0,s0
    3bbc:	02812403          	lw	s0,40(sp)
    3bc0:	02412483          	lw	s1,36(sp)
    3bc4:	02012903          	lw	s2,32(sp)
    3bc8:	01c12983          	lw	s3,28(sp)
    3bcc:	01812a03          	lw	s4,24(sp)
    3bd0:	01412a83          	lw	s5,20(sp)
    3bd4:	01012b03          	lw	s6,16(sp)
    3bd8:	00c12b83          	lw	s7,12(sp)
    3bdc:	00812c03          	lw	s8,8(sp)
    3be0:	03010113          	addi	sp,sp,48
    3be4:	00008067          	ret
    3be8:	033b6463          	bltu	s6,s3,3c10 <_read_sectors+0x128>
    3bec:	00190793          	addi	a5,s2,1
    3bf0:	03479063          	bne	a5,s4,3c10 <_read_sectors+0x128>
    3bf4:	22c4a583          	lw	a1,556(s1)
    3bf8:	03496263          	bltu	s2,s4,3c1c <_read_sectors+0x134>
    3bfc:	fff00793          	li	a5,-1
    3c00:	faf588e3          	beq	a1,a5,3bb0 <_read_sectors+0xc8>
    3c04:	22b4a623          	sw	a1,556(s1)
    3c08:	2344a423          	sw	s4,552(s1)
    3c0c:	f7dff06f          	j	3b88 <_read_sectors+0xa0>
    3c10:	0044a583          	lw	a1,4(s1)
    3c14:	00000913          	li	s2,0
    3c18:	fe1ff06f          	j	3bf8 <_read_sectors+0x110>
    3c1c:	f48a8513          	addi	a0,s5,-184
    3c20:	fffff097          	auipc	ra,0xfffff
    3c24:	230080e7          	jalr	560(ra) # 2e50 <fatfs_find_next_cluster>
    3c28:	00050593          	mv	a1,a0
    3c2c:	00190913          	addi	s2,s2,1
    3c30:	fc9ff06f          	j	3bf8 <_read_sectors+0x110>

00003c34 <fatfs_set_fs_info_next_free_cluster>:
    3c34:	03052783          	lw	a5,48(a0)
    3c38:	0a078463          	beqz	a5,3ce0 <fatfs_set_fs_info_next_free_cluster+0xac>
    3c3c:	fe010113          	addi	sp,sp,-32
    3c40:	01c52783          	lw	a5,28(a0)
    3c44:	00912a23          	sw	s1,20(sp)
    3c48:	00058493          	mv	s1,a1
    3c4c:	01855583          	lhu	a1,24(a0)
    3c50:	00812c23          	sw	s0,24(sp)
    3c54:	00112e23          	sw	ra,28(sp)
    3c58:	00f585b3          	add	a1,a1,a5
    3c5c:	00050413          	mv	s0,a0
    3c60:	ffffe097          	auipc	ra,0xffffe
    3c64:	ed4080e7          	jalr	-300(ra) # 1b34 <fatfs_fat_read_sector>
    3c68:	00050593          	mv	a1,a0
    3c6c:	06050063          	beqz	a0,3ccc <fatfs_set_fs_info_next_free_cluster+0x98>
    3c70:	20852783          	lw	a5,520(a0)
    3c74:	0084d713          	srli	a4,s1,0x8
    3c78:	00100613          	li	a2,1
    3c7c:	1e978623          	sb	s1,492(a5)
    3c80:	20852783          	lw	a5,520(a0)
    3c84:	1ee786a3          	sb	a4,493(a5)
    3c88:	20852783          	lw	a5,520(a0)
    3c8c:	0104d713          	srli	a4,s1,0x10
    3c90:	1ee78723          	sb	a4,494(a5)
    3c94:	20852783          	lw	a5,520(a0)
    3c98:	0184d713          	srli	a4,s1,0x18
    3c9c:	1ee787a3          	sb	a4,495(a5)
    3ca0:	03842783          	lw	a5,56(s0)
    3ca4:	20c52223          	sw	a2,516(a0)
    3ca8:	02942223          	sw	s1,36(s0)
    3cac:	00078a63          	beqz	a5,3cc0 <fatfs_set_fs_info_next_free_cluster+0x8c>
    3cb0:	20052503          	lw	a0,512(a0)
    3cb4:	00b12623          	sw	a1,12(sp)
    3cb8:	000780e7          	jalr	a5
    3cbc:	00c12583          	lw	a1,12(sp)
    3cc0:	fff00793          	li	a5,-1
    3cc4:	20f5a023          	sw	a5,512(a1)
    3cc8:	2005a223          	sw	zero,516(a1)
    3ccc:	01c12083          	lw	ra,28(sp)
    3cd0:	01812403          	lw	s0,24(sp)
    3cd4:	01412483          	lw	s1,20(sp)
    3cd8:	02010113          	addi	sp,sp,32
    3cdc:	00008067          	ret
    3ce0:	00008067          	ret

00003ce4 <fatfs_find_blank_cluster>:
    3ce4:	fd010113          	addi	sp,sp,-48
    3ce8:	01312e23          	sw	s3,28(sp)
    3cec:	100009b7          	lui	s3,0x10000
    3cf0:	02912223          	sw	s1,36(sp)
    3cf4:	03212023          	sw	s2,32(sp)
    3cf8:	02112623          	sw	ra,44(sp)
    3cfc:	02812423          	sw	s0,40(sp)
    3d00:	00050913          	mv	s2,a0
    3d04:	00058493          	mv	s1,a1
    3d08:	fff98993          	addi	s3,s3,-1 # fffffff <__stacktop+0xffeffff>
    3d0c:	03092783          	lw	a5,48(s2)
    3d10:	0074d413          	srli	s0,s1,0x7
    3d14:	00079463          	bnez	a5,3d1c <fatfs_find_blank_cluster+0x38>
    3d18:	0084d413          	srli	s0,s1,0x8
    3d1c:	02092783          	lw	a5,32(s2)
    3d20:	0cf47863          	bgeu	s0,a5,3df0 <fatfs_find_blank_cluster+0x10c>
    3d24:	01492583          	lw	a1,20(s2)
    3d28:	00090513          	mv	a0,s2
    3d2c:	00c12623          	sw	a2,12(sp)
    3d30:	00b405b3          	add	a1,s0,a1
    3d34:	ffffe097          	auipc	ra,0xffffe
    3d38:	e00080e7          	jalr	-512(ra) # 1b34 <fatfs_fat_read_sector>
    3d3c:	0a050a63          	beqz	a0,3df0 <fatfs_find_blank_cluster+0x10c>
    3d40:	03092783          	lw	a5,48(s2)
    3d44:	20852703          	lw	a4,520(a0)
    3d48:	00c12603          	lw	a2,12(sp)
    3d4c:	04079a63          	bnez	a5,3da0 <fatfs_find_blank_cluster+0xbc>
    3d50:	00841413          	slli	s0,s0,0x8
    3d54:	40848433          	sub	s0,s1,s0
    3d58:	00141413          	slli	s0,s0,0x1
    3d5c:	01041413          	slli	s0,s0,0x10
    3d60:	01045413          	srli	s0,s0,0x10
    3d64:	00870733          	add	a4,a4,s0
    3d68:	00174783          	lbu	a5,1(a4)
    3d6c:	00074703          	lbu	a4,0(a4)
    3d70:	00879793          	slli	a5,a5,0x8
    3d74:	00e787b3          	add	a5,a5,a4
    3d78:	06079863          	bnez	a5,3de8 <fatfs_find_blank_cluster+0x104>
    3d7c:	00962023          	sw	s1,0(a2)
    3d80:	00100513          	li	a0,1
    3d84:	02c12083          	lw	ra,44(sp)
    3d88:	02812403          	lw	s0,40(sp)
    3d8c:	02412483          	lw	s1,36(sp)
    3d90:	02012903          	lw	s2,32(sp)
    3d94:	01c12983          	lw	s3,28(sp)
    3d98:	03010113          	addi	sp,sp,48
    3d9c:	00008067          	ret
    3da0:	00741413          	slli	s0,s0,0x7
    3da4:	40848433          	sub	s0,s1,s0
    3da8:	00241413          	slli	s0,s0,0x2
    3dac:	01041413          	slli	s0,s0,0x10
    3db0:	01045413          	srli	s0,s0,0x10
    3db4:	00870733          	add	a4,a4,s0
    3db8:	00374783          	lbu	a5,3(a4)
    3dbc:	00274683          	lbu	a3,2(a4)
    3dc0:	01879793          	slli	a5,a5,0x18
    3dc4:	01069693          	slli	a3,a3,0x10
    3dc8:	00d787b3          	add	a5,a5,a3
    3dcc:	00074683          	lbu	a3,0(a4)
    3dd0:	00174703          	lbu	a4,1(a4)
    3dd4:	00d787b3          	add	a5,a5,a3
    3dd8:	00871713          	slli	a4,a4,0x8
    3ddc:	00e787b3          	add	a5,a5,a4
    3de0:	0137f7b3          	and	a5,a5,s3
    3de4:	f95ff06f          	j	3d78 <fatfs_find_blank_cluster+0x94>
    3de8:	00148493          	addi	s1,s1,1
    3dec:	f21ff06f          	j	3d0c <fatfs_find_blank_cluster+0x28>
    3df0:	00000513          	li	a0,0
    3df4:	f91ff06f          	j	3d84 <fatfs_find_blank_cluster+0xa0>

00003df8 <fatfs_fat_set_cluster>:
    3df8:	03052783          	lw	a5,48(a0)
    3dfc:	fe010113          	addi	sp,sp,-32
    3e00:	00812c23          	sw	s0,24(sp)
    3e04:	00912a23          	sw	s1,20(sp)
    3e08:	01212823          	sw	s2,16(sp)
    3e0c:	00112e23          	sw	ra,28(sp)
    3e10:	00050913          	mv	s2,a0
    3e14:	00058413          	mv	s0,a1
    3e18:	0085d493          	srli	s1,a1,0x8
    3e1c:	00078463          	beqz	a5,3e24 <fatfs_fat_set_cluster+0x2c>
    3e20:	0075d493          	srli	s1,a1,0x7
    3e24:	01492583          	lw	a1,20(s2)
    3e28:	00090513          	mv	a0,s2
    3e2c:	00c12623          	sw	a2,12(sp)
    3e30:	00b485b3          	add	a1,s1,a1
    3e34:	ffffe097          	auipc	ra,0xffffe
    3e38:	d00080e7          	jalr	-768(ra) # 1b34 <fatfs_fat_read_sector>
    3e3c:	00050793          	mv	a5,a0
    3e40:	00000513          	li	a0,0
    3e44:	04078663          	beqz	a5,3e90 <fatfs_fat_set_cluster+0x98>
    3e48:	03092683          	lw	a3,48(s2)
    3e4c:	2087a703          	lw	a4,520(a5)
    3e50:	00c12603          	lw	a2,12(sp)
    3e54:	04069a63          	bnez	a3,3ea8 <fatfs_fat_set_cluster+0xb0>
    3e58:	00849493          	slli	s1,s1,0x8
    3e5c:	40940433          	sub	s0,s0,s1
    3e60:	00141413          	slli	s0,s0,0x1
    3e64:	01041413          	slli	s0,s0,0x10
    3e68:	01045413          	srli	s0,s0,0x10
    3e6c:	00870733          	add	a4,a4,s0
    3e70:	00c70023          	sb	a2,0(a4)
    3e74:	2087a703          	lw	a4,520(a5)
    3e78:	00865613          	srli	a2,a2,0x8
    3e7c:	00870733          	add	a4,a4,s0
    3e80:	00c700a3          	sb	a2,1(a4)
    3e84:	00100713          	li	a4,1
    3e88:	20e7a223          	sw	a4,516(a5)
    3e8c:	00100513          	li	a0,1
    3e90:	01c12083          	lw	ra,28(sp)
    3e94:	01812403          	lw	s0,24(sp)
    3e98:	01412483          	lw	s1,20(sp)
    3e9c:	01012903          	lw	s2,16(sp)
    3ea0:	02010113          	addi	sp,sp,32
    3ea4:	00008067          	ret
    3ea8:	00749493          	slli	s1,s1,0x7
    3eac:	40940433          	sub	s0,s0,s1
    3eb0:	00241413          	slli	s0,s0,0x2
    3eb4:	01041413          	slli	s0,s0,0x10
    3eb8:	01045413          	srli	s0,s0,0x10
    3ebc:	00870733          	add	a4,a4,s0
    3ec0:	00c70023          	sb	a2,0(a4)
    3ec4:	2087a703          	lw	a4,520(a5)
    3ec8:	00865693          	srli	a3,a2,0x8
    3ecc:	00870733          	add	a4,a4,s0
    3ed0:	00d700a3          	sb	a3,1(a4)
    3ed4:	2087a703          	lw	a4,520(a5)
    3ed8:	01065693          	srli	a3,a2,0x10
    3edc:	01865613          	srli	a2,a2,0x18
    3ee0:	00870733          	add	a4,a4,s0
    3ee4:	00d70123          	sb	a3,2(a4)
    3ee8:	2087a703          	lw	a4,520(a5)
    3eec:	00870733          	add	a4,a4,s0
    3ef0:	00c701a3          	sb	a2,3(a4)
    3ef4:	f91ff06f          	j	3e84 <fatfs_fat_set_cluster+0x8c>

00003ef8 <fatfs_free_cluster_chain>:
    3ef8:	fe010113          	addi	sp,sp,-32
    3efc:	00812c23          	sw	s0,24(sp)
    3f00:	00912a23          	sw	s1,20(sp)
    3f04:	00112e23          	sw	ra,28(sp)
    3f08:	01212823          	sw	s2,16(sp)
    3f0c:	00050493          	mv	s1,a0
    3f10:	ffd00413          	li	s0,-3
    3f14:	fff58793          	addi	a5,a1,-1
    3f18:	02f47063          	bgeu	s0,a5,3f38 <fatfs_free_cluster_chain+0x40>
    3f1c:	01c12083          	lw	ra,28(sp)
    3f20:	01812403          	lw	s0,24(sp)
    3f24:	01412483          	lw	s1,20(sp)
    3f28:	01012903          	lw	s2,16(sp)
    3f2c:	00100513          	li	a0,1
    3f30:	02010113          	addi	sp,sp,32
    3f34:	00008067          	ret
    3f38:	00048513          	mv	a0,s1
    3f3c:	00b12623          	sw	a1,12(sp)
    3f40:	fffff097          	auipc	ra,0xfffff
    3f44:	f10080e7          	jalr	-240(ra) # 2e50 <fatfs_find_next_cluster>
    3f48:	00c12583          	lw	a1,12(sp)
    3f4c:	00050913          	mv	s2,a0
    3f50:	00000613          	li	a2,0
    3f54:	00048513          	mv	a0,s1
    3f58:	00000097          	auipc	ra,0x0
    3f5c:	ea0080e7          	jalr	-352(ra) # 3df8 <fatfs_fat_set_cluster>
    3f60:	00090593          	mv	a1,s2
    3f64:	fb1ff06f          	j	3f14 <fatfs_free_cluster_chain+0x1c>

00003f68 <fatfs_fat_add_cluster_to_chain>:
    3f68:	fd010113          	addi	sp,sp,-48
    3f6c:	02912223          	sw	s1,36(sp)
    3f70:	02112623          	sw	ra,44(sp)
    3f74:	02812423          	sw	s0,40(sp)
    3f78:	03212023          	sw	s2,32(sp)
    3f7c:	01312e23          	sw	s3,28(sp)
    3f80:	fff00493          	li	s1,-1
    3f84:	02959263          	bne	a1,s1,3fa8 <fatfs_fat_add_cluster_to_chain+0x40>
    3f88:	00000513          	li	a0,0
    3f8c:	02c12083          	lw	ra,44(sp)
    3f90:	02812403          	lw	s0,40(sp)
    3f94:	02412483          	lw	s1,36(sp)
    3f98:	02012903          	lw	s2,32(sp)
    3f9c:	01c12983          	lw	s3,28(sp)
    3fa0:	03010113          	addi	sp,sp,48
    3fa4:	00008067          	ret
    3fa8:	00050913          	mv	s2,a0
    3fac:	00058413          	mv	s0,a1
    3fb0:	00060993          	mv	s3,a2
    3fb4:	00040593          	mv	a1,s0
    3fb8:	00090513          	mv	a0,s2
    3fbc:	00812623          	sw	s0,12(sp)
    3fc0:	fffff097          	auipc	ra,0xfffff
    3fc4:	e90080e7          	jalr	-368(ra) # 2e50 <fatfs_find_next_cluster>
    3fc8:	00050413          	mv	s0,a0
    3fcc:	fa050ee3          	beqz	a0,3f88 <fatfs_fat_add_cluster_to_chain+0x20>
    3fd0:	00c12583          	lw	a1,12(sp)
    3fd4:	fe9510e3          	bne	a0,s1,3fb4 <fatfs_fat_add_cluster_to_chain+0x4c>
    3fd8:	00098613          	mv	a2,s3
    3fdc:	00090513          	mv	a0,s2
    3fe0:	00000097          	auipc	ra,0x0
    3fe4:	e18080e7          	jalr	-488(ra) # 3df8 <fatfs_fat_set_cluster>
    3fe8:	00040613          	mv	a2,s0
    3fec:	00098593          	mv	a1,s3
    3ff0:	00090513          	mv	a0,s2
    3ff4:	00000097          	auipc	ra,0x0
    3ff8:	e04080e7          	jalr	-508(ra) # 3df8 <fatfs_fat_set_cluster>
    3ffc:	00100513          	li	a0,1
    4000:	f8dff06f          	j	3f8c <fatfs_fat_add_cluster_to_chain+0x24>

00004004 <fatfs_add_free_space>:
    4004:	02452783          	lw	a5,36(a0)
    4008:	fd010113          	addi	sp,sp,-48
    400c:	02812423          	sw	s0,40(sp)
    4010:	01312e23          	sw	s3,28(sp)
    4014:	01412c23          	sw	s4,24(sp)
    4018:	0005a983          	lw	s3,0(a1)
    401c:	01512a23          	sw	s5,20(sp)
    4020:	00058a13          	mv	s4,a1
    4024:	02112623          	sw	ra,44(sp)
    4028:	02912223          	sw	s1,36(sp)
    402c:	03212023          	sw	s2,32(sp)
    4030:	fff00593          	li	a1,-1
    4034:	00050413          	mv	s0,a0
    4038:	00060a93          	mv	s5,a2
    403c:	00b78663          	beq	a5,a1,4048 <fatfs_add_free_space+0x44>
    4040:	00000097          	auipc	ra,0x0
    4044:	bf4080e7          	jalr	-1036(ra) # 3c34 <fatfs_set_fs_info_next_free_cluster>
    4048:	00000493          	li	s1,0
    404c:	03549663          	bne	s1,s5,4078 <fatfs_add_free_space+0x74>
    4050:	00100513          	li	a0,1
    4054:	02c12083          	lw	ra,44(sp)
    4058:	02812403          	lw	s0,40(sp)
    405c:	02412483          	lw	s1,36(sp)
    4060:	02012903          	lw	s2,32(sp)
    4064:	01c12983          	lw	s3,28(sp)
    4068:	01812a03          	lw	s4,24(sp)
    406c:	01412a83          	lw	s5,20(sp)
    4070:	03010113          	addi	sp,sp,48
    4074:	00008067          	ret
    4078:	00842583          	lw	a1,8(s0)
    407c:	00c10613          	addi	a2,sp,12
    4080:	00040513          	mv	a0,s0
    4084:	00000097          	auipc	ra,0x0
    4088:	c60080e7          	jalr	-928(ra) # 3ce4 <fatfs_find_blank_cluster>
    408c:	fc0504e3          	beqz	a0,4054 <fatfs_add_free_space+0x50>
    4090:	00c12903          	lw	s2,12(sp)
    4094:	00098593          	mv	a1,s3
    4098:	00040513          	mv	a0,s0
    409c:	00090613          	mv	a2,s2
    40a0:	00000097          	auipc	ra,0x0
    40a4:	d58080e7          	jalr	-680(ra) # 3df8 <fatfs_fat_set_cluster>
    40a8:	fff00613          	li	a2,-1
    40ac:	00090593          	mv	a1,s2
    40b0:	00040513          	mv	a0,s0
    40b4:	00000097          	auipc	ra,0x0
    40b8:	d44080e7          	jalr	-700(ra) # 3df8 <fatfs_fat_set_cluster>
    40bc:	00049463          	bnez	s1,40c4 <fatfs_add_free_space+0xc0>
    40c0:	012a2023          	sw	s2,0(s4)
    40c4:	00148493          	addi	s1,s1,1
    40c8:	00090993          	mv	s3,s2
    40cc:	f81ff06f          	j	404c <fatfs_add_free_space+0x48>

000040d0 <_write_sectors>:
    40d0:	fb010113          	addi	sp,sp,-80
    40d4:	03512a23          	sw	s5,52(sp)
    40d8:	00007ab7          	lui	s5,0x7
    40dc:	04112623          	sw	ra,76(sp)
    40e0:	04812423          	sw	s0,72(sp)
    40e4:	04912223          	sw	s1,68(sp)
    40e8:	03412c23          	sw	s4,56(sp)
    40ec:	03612823          	sw	s6,48(sp)
    40f0:	03712623          	sw	s7,44(sp)
    40f4:	03812423          	sw	s8,40(sp)
    40f8:	03912223          	sw	s9,36(sp)
    40fc:	03a12023          	sw	s10,32(sp)
    4100:	05212023          	sw	s2,64(sp)
    4104:	03312e23          	sw	s3,60(sp)
    4108:	f48a8b93          	addi	s7,s5,-184 # 6f48 <_fs>
    410c:	000bc983          	lbu	s3,0(s7)
    4110:	00058b13          	mv	s6,a1
    4114:	fff00793          	li	a5,-1
    4118:	00098593          	mv	a1,s3
    411c:	00050493          	mv	s1,a0
    4120:	000b0513          	mv	a0,s6
    4124:	00068c13          	mv	s8,a3
    4128:	00f12e23          	sw	a5,28(sp)
    412c:	00060d13          	mv	s10,a2
    4130:	ffffd097          	auipc	ra,0xffffd
    4134:	0d8080e7          	jalr	216(ra) # 1208 <__udivsi3>
    4138:	00050a13          	mv	s4,a0
    413c:	00098593          	mv	a1,s3
    4140:	000b0513          	mv	a0,s6
    4144:	ffffd097          	auipc	ra,0xffffd
    4148:	10c080e7          	jalr	268(ra) # 1250 <__umodsi3>
    414c:	00ac07b3          	add	a5,s8,a0
    4150:	00050c93          	mv	s9,a0
    4154:	000c0413          	mv	s0,s8
    4158:	00f9fe63          	bgeu	s3,a5,4174 <_write_sectors+0xa4>
    415c:	000a0593          	mv	a1,s4
    4160:	00098513          	mv	a0,s3
    4164:	ffffe097          	auipc	ra,0xffffe
    4168:	818080e7          	jalr	-2024(ra) # 197c <__mulsi3>
    416c:	416987b3          	sub	a5,s3,s6
    4170:	00f50433          	add	s0,a0,a5
    4174:	2284a903          	lw	s2,552(s1)
    4178:	03491a63          	bne	s2,s4,41ac <_write_sectors+0xdc>
    417c:	22c4a583          	lw	a1,556(s1)
    4180:	f48a8513          	addi	a0,s5,-184
    4184:	ffffe097          	auipc	ra,0xffffe
    4188:	b5c080e7          	jalr	-1188(ra) # 1ce0 <fatfs_lba_of_cluster>
    418c:	019505b3          	add	a1,a0,s9
    4190:	00040693          	mv	a3,s0
    4194:	000d0613          	mv	a2,s10
    4198:	f48a8513          	addi	a0,s5,-184
    419c:	ffffe097          	auipc	ra,0xffffe
    41a0:	ba8080e7          	jalr	-1112(ra) # 1d44 <fatfs_sector_write>
    41a4:	04050a63          	beqz	a0,41f8 <_write_sectors+0x128>
    41a8:	0540006f          	j	41fc <_write_sectors+0x12c>
    41ac:	093b6663          	bltu	s6,s3,4238 <_write_sectors+0x168>
    41b0:	00190793          	addi	a5,s2,1
    41b4:	09479263          	bne	a5,s4,4238 <_write_sectors+0x168>
    41b8:	22c4a583          	lw	a1,556(s1)
    41bc:	fff00b13          	li	s6,-1
    41c0:	09496263          	bltu	s2,s4,4244 <_write_sectors+0x174>
    41c4:	fff00793          	li	a5,-1
    41c8:	0af59463          	bne	a1,a5,4270 <_write_sectors+0x1a0>
    41cc:	000bc583          	lbu	a1,0(s7)
    41d0:	fff58513          	addi	a0,a1,-1
    41d4:	01850533          	add	a0,a0,s8
    41d8:	ffffd097          	auipc	ra,0xffffd
    41dc:	030080e7          	jalr	48(ra) # 1208 <__udivsi3>
    41e0:	00050613          	mv	a2,a0
    41e4:	01c10593          	addi	a1,sp,28
    41e8:	000b8513          	mv	a0,s7
    41ec:	00000097          	auipc	ra,0x0
    41f0:	e18080e7          	jalr	-488(ra) # 4004 <fatfs_add_free_space>
    41f4:	06051c63          	bnez	a0,426c <_write_sectors+0x19c>
    41f8:	00000413          	li	s0,0
    41fc:	04c12083          	lw	ra,76(sp)
    4200:	00040513          	mv	a0,s0
    4204:	04812403          	lw	s0,72(sp)
    4208:	04412483          	lw	s1,68(sp)
    420c:	04012903          	lw	s2,64(sp)
    4210:	03c12983          	lw	s3,60(sp)
    4214:	03812a03          	lw	s4,56(sp)
    4218:	03412a83          	lw	s5,52(sp)
    421c:	03012b03          	lw	s6,48(sp)
    4220:	02c12b83          	lw	s7,44(sp)
    4224:	02812c03          	lw	s8,40(sp)
    4228:	02412c83          	lw	s9,36(sp)
    422c:	02012d03          	lw	s10,32(sp)
    4230:	05010113          	addi	sp,sp,80
    4234:	00008067          	ret
    4238:	0044a583          	lw	a1,4(s1)
    423c:	00000913          	li	s2,0
    4240:	f7dff06f          	j	41bc <_write_sectors+0xec>
    4244:	f48a8513          	addi	a0,s5,-184
    4248:	00b12623          	sw	a1,12(sp)
    424c:	fffff097          	auipc	ra,0xfffff
    4250:	c04080e7          	jalr	-1020(ra) # 2e50 <fatfs_find_next_cluster>
    4254:	00c12583          	lw	a1,12(sp)
    4258:	00b12e23          	sw	a1,28(sp)
    425c:	f76508e3          	beq	a0,s6,41cc <_write_sectors+0xfc>
    4260:	00190913          	addi	s2,s2,1
    4264:	00050593          	mv	a1,a0
    4268:	f59ff06f          	j	41c0 <_write_sectors+0xf0>
    426c:	01c12583          	lw	a1,28(sp)
    4270:	22b4a623          	sw	a1,556(s1)
    4274:	2344a423          	sw	s4,552(s1)
    4278:	f09ff06f          	j	4180 <_write_sectors+0xb0>

0000427c <fl_fflush>:
    427c:	000057b7          	lui	a5,0x5
    4280:	3287a783          	lw	a5,808(a5) # 5328 <_filelib_init>
    4284:	ff010113          	addi	sp,sp,-16
    4288:	00812423          	sw	s0,8(sp)
    428c:	00112623          	sw	ra,12(sp)
    4290:	00912223          	sw	s1,4(sp)
    4294:	00050413          	mv	s0,a0
    4298:	00079663          	bnez	a5,42a4 <fl_fflush+0x28>
    429c:	ffffe097          	auipc	ra,0xffffe
    42a0:	b74080e7          	jalr	-1164(ra) # 1e10 <fl_init>
    42a4:	04040663          	beqz	s0,42f0 <fl_fflush+0x74>
    42a8:	000074b7          	lui	s1,0x7
    42ac:	f4848493          	addi	s1,s1,-184 # 6f48 <_fs>
    42b0:	03c4a783          	lw	a5,60(s1)
    42b4:	00078463          	beqz	a5,42bc <fl_fflush+0x40>
    42b8:	000780e7          	jalr	a5
    42bc:	43442783          	lw	a5,1076(s0)
    42c0:	02078263          	beqz	a5,42e4 <fl_fflush+0x68>
    42c4:	43042583          	lw	a1,1072(s0)
    42c8:	00100693          	li	a3,1
    42cc:	23040613          	addi	a2,s0,560
    42d0:	00040513          	mv	a0,s0
    42d4:	00000097          	auipc	ra,0x0
    42d8:	dfc080e7          	jalr	-516(ra) # 40d0 <_write_sectors>
    42dc:	00050463          	beqz	a0,42e4 <fl_fflush+0x68>
    42e0:	42042a23          	sw	zero,1076(s0)
    42e4:	0404a783          	lw	a5,64(s1)
    42e8:	00078463          	beqz	a5,42f0 <fl_fflush+0x74>
    42ec:	000780e7          	jalr	a5
    42f0:	00c12083          	lw	ra,12(sp)
    42f4:	00812403          	lw	s0,8(sp)
    42f8:	00412483          	lw	s1,4(sp)
    42fc:	00000513          	li	a0,0
    4300:	01010113          	addi	sp,sp,16
    4304:	00008067          	ret

00004308 <fl_fclose>:
    4308:	000057b7          	lui	a5,0x5
    430c:	3287a783          	lw	a5,808(a5) # 5328 <_filelib_init>
    4310:	ff010113          	addi	sp,sp,-16
    4314:	00812423          	sw	s0,8(sp)
    4318:	00112623          	sw	ra,12(sp)
    431c:	00912223          	sw	s1,4(sp)
    4320:	01212023          	sw	s2,0(sp)
    4324:	00050413          	mv	s0,a0
    4328:	00079663          	bnez	a5,4334 <fl_fclose+0x2c>
    432c:	ffffe097          	auipc	ra,0xffffe
    4330:	ae4080e7          	jalr	-1308(ra) # 1e10 <fl_init>
    4334:	08040c63          	beqz	s0,43cc <fl_fclose+0xc4>
    4338:	000074b7          	lui	s1,0x7
    433c:	f4848913          	addi	s2,s1,-184 # 6f48 <_fs>
    4340:	03c92783          	lw	a5,60(s2)
    4344:	00078463          	beqz	a5,434c <fl_fclose+0x44>
    4348:	000780e7          	jalr	a5
    434c:	00040513          	mv	a0,s0
    4350:	00000097          	auipc	ra,0x0
    4354:	f2c080e7          	jalr	-212(ra) # 427c <fl_fflush>
    4358:	01042783          	lw	a5,16(s0)
    435c:	00078e63          	beqz	a5,4378 <fl_fclose+0x70>
    4360:	00c42683          	lw	a3,12(s0)
    4364:	00042583          	lw	a1,0(s0)
    4368:	21c40613          	addi	a2,s0,540
    436c:	f4848513          	addi	a0,s1,-184
    4370:	fffff097          	auipc	ra,0xfffff
    4374:	338080e7          	jalr	824(ra) # 36a8 <fatfs_update_file_length>
    4378:	fff00793          	li	a5,-1
    437c:	42f42823          	sw	a5,1072(s0)
    4380:	00040513          	mv	a0,s0
    4384:	00042423          	sw	zero,8(s0)
    4388:	00042623          	sw	zero,12(s0)
    438c:	00042223          	sw	zero,4(s0)
    4390:	42042a23          	sw	zero,1076(s0)
    4394:	00042823          	sw	zero,16(s0)
    4398:	ffffe097          	auipc	ra,0xffffe
    439c:	900080e7          	jalr	-1792(ra) # 1c98 <_free_file>
    43a0:	f4848513          	addi	a0,s1,-184
    43a4:	fffff097          	auipc	ra,0xfffff
    43a8:	a54080e7          	jalr	-1452(ra) # 2df8 <fatfs_fat_purge>
    43ac:	04092783          	lw	a5,64(s2)
    43b0:	00078e63          	beqz	a5,43cc <fl_fclose+0xc4>
    43b4:	00812403          	lw	s0,8(sp)
    43b8:	00c12083          	lw	ra,12(sp)
    43bc:	00412483          	lw	s1,4(sp)
    43c0:	00012903          	lw	s2,0(sp)
    43c4:	01010113          	addi	sp,sp,16
    43c8:	00078067          	jr	a5
    43cc:	00c12083          	lw	ra,12(sp)
    43d0:	00812403          	lw	s0,8(sp)
    43d4:	00412483          	lw	s1,4(sp)
    43d8:	00012903          	lw	s2,0(sp)
    43dc:	01010113          	addi	sp,sp,16
    43e0:	00008067          	ret

000043e4 <fl_fread>:
    43e4:	000057b7          	lui	a5,0x5
    43e8:	3287a783          	lw	a5,808(a5) # 5328 <_filelib_init>
    43ec:	fc010113          	addi	sp,sp,-64
    43f0:	02812c23          	sw	s0,56(sp)
    43f4:	03512223          	sw	s5,36(sp)
    43f8:	02112e23          	sw	ra,60(sp)
    43fc:	02912a23          	sw	s1,52(sp)
    4400:	03212823          	sw	s2,48(sp)
    4404:	03312623          	sw	s3,44(sp)
    4408:	03412423          	sw	s4,40(sp)
    440c:	03612023          	sw	s6,32(sp)
    4410:	01712e23          	sw	s7,28(sp)
    4414:	01812c23          	sw	s8,24(sp)
    4418:	01912a23          	sw	s9,20(sp)
    441c:	00050a93          	mv	s5,a0
    4420:	00068413          	mv	s0,a3
    4424:	00058513          	mv	a0,a1
    4428:	00079e63          	bnez	a5,4444 <fl_fread+0x60>
    442c:	00c12623          	sw	a2,12(sp)
    4430:	00b12423          	sw	a1,8(sp)
    4434:	ffffe097          	auipc	ra,0xffffe
    4438:	9dc080e7          	jalr	-1572(ra) # 1e10 <fl_init>
    443c:	00c12603          	lw	a2,12(sp)
    4440:	00812503          	lw	a0,8(sp)
    4444:	14040e63          	beqz	s0,45a0 <fl_fread+0x1bc>
    4448:	140a8c63          	beqz	s5,45a0 <fl_fread+0x1bc>
    444c:	43844783          	lbu	a5,1080(s0)
    4450:	fff00493          	li	s1,-1
    4454:	0017f793          	andi	a5,a5,1
    4458:	04078863          	beqz	a5,44a8 <fl_fread+0xc4>
    445c:	00060593          	mv	a1,a2
    4460:	ffffd097          	auipc	ra,0xffffd
    4464:	51c080e7          	jalr	1308(ra) # 197c <__mulsi3>
    4468:	00050493          	mv	s1,a0
    446c:	02050e63          	beqz	a0,44a8 <fl_fread+0xc4>
    4470:	00842583          	lw	a1,8(s0)
    4474:	00c42783          	lw	a5,12(s0)
    4478:	12f5f463          	bgeu	a1,a5,45a0 <fl_fread+0x1bc>
    447c:	00b50733          	add	a4,a0,a1
    4480:	00e7f463          	bgeu	a5,a4,4488 <fl_fread+0xa4>
    4484:	40b784b3          	sub	s1,a5,a1
    4488:	0095da13          	srli	s4,a1,0x9
    448c:	1ff5f913          	andi	s2,a1,511
    4490:	00000993          	li	s3,0
    4494:	23040b13          	addi	s6,s0,560
    4498:	20000b93          	li	s7,512
    449c:	1ff00c13          	li	s8,511
    44a0:	0499c063          	blt	s3,s1,44e0 <fl_fread+0xfc>
    44a4:	00098493          	mv	s1,s3
    44a8:	03c12083          	lw	ra,60(sp)
    44ac:	03812403          	lw	s0,56(sp)
    44b0:	03012903          	lw	s2,48(sp)
    44b4:	02c12983          	lw	s3,44(sp)
    44b8:	02812a03          	lw	s4,40(sp)
    44bc:	02412a83          	lw	s5,36(sp)
    44c0:	02012b03          	lw	s6,32(sp)
    44c4:	01c12b83          	lw	s7,28(sp)
    44c8:	01812c03          	lw	s8,24(sp)
    44cc:	01412c83          	lw	s9,20(sp)
    44d0:	00048513          	mv	a0,s1
    44d4:	03412483          	lw	s1,52(sp)
    44d8:	04010113          	addi	sp,sp,64
    44dc:	00008067          	ret
    44e0:	04091663          	bnez	s2,452c <fl_fread+0x148>
    44e4:	413486b3          	sub	a3,s1,s3
    44e8:	04dc5263          	bge	s8,a3,452c <fl_fread+0x148>
    44ec:	4096d693          	srai	a3,a3,0x9
    44f0:	013a8633          	add	a2,s5,s3
    44f4:	000a0593          	mv	a1,s4
    44f8:	00040513          	mv	a0,s0
    44fc:	fffff097          	auipc	ra,0xfffff
    4500:	5ec080e7          	jalr	1516(ra) # 3ae8 <_read_sectors>
    4504:	fa0500e3          	beqz	a0,44a4 <fl_fread+0xc0>
    4508:	00951c93          	slli	s9,a0,0x9
    450c:	000c8613          	mv	a2,s9
    4510:	00aa0a33          	add	s4,s4,a0
    4514:	00842783          	lw	a5,8(s0)
    4518:	00c989b3          	add	s3,s3,a2
    451c:	00000913          	li	s2,0
    4520:	019787b3          	add	a5,a5,s9
    4524:	00f42423          	sw	a5,8(s0)
    4528:	f79ff06f          	j	44a0 <fl_fread+0xbc>
    452c:	43042783          	lw	a5,1072(s0)
    4530:	03478e63          	beq	a5,s4,456c <fl_fread+0x188>
    4534:	43442783          	lw	a5,1076(s0)
    4538:	00078863          	beqz	a5,4548 <fl_fread+0x164>
    453c:	00040513          	mv	a0,s0
    4540:	00000097          	auipc	ra,0x0
    4544:	d3c080e7          	jalr	-708(ra) # 427c <fl_fflush>
    4548:	00100693          	li	a3,1
    454c:	000b0613          	mv	a2,s6
    4550:	000a0593          	mv	a1,s4
    4554:	00040513          	mv	a0,s0
    4558:	fffff097          	auipc	ra,0xfffff
    455c:	590080e7          	jalr	1424(ra) # 3ae8 <_read_sectors>
    4560:	f40502e3          	beqz	a0,44a4 <fl_fread+0xc0>
    4564:	43442823          	sw	s4,1072(s0)
    4568:	42042a23          	sw	zero,1076(s0)
    456c:	412b87b3          	sub	a5,s7,s2
    4570:	41348633          	sub	a2,s1,s3
    4574:	00c7d463          	bge	a5,a2,457c <fl_fread+0x198>
    4578:	00078613          	mv	a2,a5
    457c:	012b05b3          	add	a1,s6,s2
    4580:	013a8533          	add	a0,s5,s3
    4584:	00060c93          	mv	s9,a2
    4588:	00c12423          	sw	a2,8(sp)
    458c:	ffffd097          	auipc	ra,0xffffd
    4590:	d44080e7          	jalr	-700(ra) # 12d0 <memcpy>
    4594:	00812603          	lw	a2,8(sp)
    4598:	001a0a13          	addi	s4,s4,1
    459c:	f79ff06f          	j	4514 <fl_fread+0x130>
    45a0:	fff00493          	li	s1,-1
    45a4:	f05ff06f          	j	44a8 <fl_fread+0xc4>

000045a8 <fatfs_allocate_free_space>:
    45a8:	fd010113          	addi	sp,sp,-48
    45ac:	02112623          	sw	ra,44(sp)
    45b0:	02812423          	sw	s0,40(sp)
    45b4:	02912223          	sw	s1,36(sp)
    45b8:	03212023          	sw	s2,32(sp)
    45bc:	01312e23          	sw	s3,28(sp)
    45c0:	01412c23          	sw	s4,24(sp)
    45c4:	01512a23          	sw	s5,20(sp)
    45c8:	02069863          	bnez	a3,45f8 <fatfs_allocate_free_space+0x50>
    45cc:	00000413          	li	s0,0
    45d0:	02c12083          	lw	ra,44(sp)
    45d4:	00040513          	mv	a0,s0
    45d8:	02812403          	lw	s0,40(sp)
    45dc:	02412483          	lw	s1,36(sp)
    45e0:	02012903          	lw	s2,32(sp)
    45e4:	01c12983          	lw	s3,28(sp)
    45e8:	01812a03          	lw	s4,24(sp)
    45ec:	01412a83          	lw	s5,20(sp)
    45f0:	03010113          	addi	sp,sp,48
    45f4:	00008067          	ret
    45f8:	02452783          	lw	a5,36(a0)
    45fc:	00058a13          	mv	s4,a1
    4600:	fff00593          	li	a1,-1
    4604:	00050493          	mv	s1,a0
    4608:	00068913          	mv	s2,a3
    460c:	00060993          	mv	s3,a2
    4610:	00b78663          	beq	a5,a1,461c <fatfs_allocate_free_space+0x74>
    4614:	fffff097          	auipc	ra,0xfffff
    4618:	620080e7          	jalr	1568(ra) # 3c34 <fatfs_set_fs_info_next_free_cluster>
    461c:	0004c783          	lbu	a5,0(s1)
    4620:	00090513          	mv	a0,s2
    4624:	00979a93          	slli	s5,a5,0x9
    4628:	000a8593          	mv	a1,s5
    462c:	ffffd097          	auipc	ra,0xffffd
    4630:	bdc080e7          	jalr	-1060(ra) # 1208 <__udivsi3>
    4634:	00050413          	mv	s0,a0
    4638:	00050593          	mv	a1,a0
    463c:	000a8513          	mv	a0,s5
    4640:	ffffd097          	auipc	ra,0xffffd
    4644:	33c080e7          	jalr	828(ra) # 197c <__mulsi3>
    4648:	41250533          	sub	a0,a0,s2
    464c:	00a03533          	snez	a0,a0
    4650:	00a40933          	add	s2,s0,a0
    4654:	040a0463          	beqz	s4,469c <fatfs_allocate_free_space+0xf4>
    4658:	0084a583          	lw	a1,8(s1)
    465c:	00c10613          	addi	a2,sp,12
    4660:	00048513          	mv	a0,s1
    4664:	fffff097          	auipc	ra,0xfffff
    4668:	680080e7          	jalr	1664(ra) # 3ce4 <fatfs_find_blank_cluster>
    466c:	00050413          	mv	s0,a0
    4670:	f4050ee3          	beqz	a0,45cc <fatfs_allocate_free_space+0x24>
    4674:	00100793          	li	a5,1
    4678:	02f91663          	bne	s2,a5,46a4 <fatfs_allocate_free_space+0xfc>
    467c:	00c12903          	lw	s2,12(sp)
    4680:	fff00613          	li	a2,-1
    4684:	00048513          	mv	a0,s1
    4688:	00090593          	mv	a1,s2
    468c:	fffff097          	auipc	ra,0xfffff
    4690:	76c080e7          	jalr	1900(ra) # 3df8 <fatfs_fat_set_cluster>
    4694:	0129a023          	sw	s2,0(s3)
    4698:	f39ff06f          	j	45d0 <fatfs_allocate_free_space+0x28>
    469c:	0009a783          	lw	a5,0(s3)
    46a0:	00f12623          	sw	a5,12(sp)
    46a4:	00090613          	mv	a2,s2
    46a8:	00c10593          	addi	a1,sp,12
    46ac:	00048513          	mv	a0,s1
    46b0:	00000097          	auipc	ra,0x0
    46b4:	954080e7          	jalr	-1708(ra) # 4004 <fatfs_add_free_space>
    46b8:	00050413          	mv	s0,a0
    46bc:	f15ff06f          	j	45d0 <fatfs_allocate_free_space+0x28>

000046c0 <fatfs_add_file_entry>:
    46c0:	03852883          	lw	a7,56(a0)
    46c4:	30088e63          	beqz	a7,49e0 <fatfs_add_file_entry+0x320>
    46c8:	f8010113          	addi	sp,sp,-128
    46cc:	06812c23          	sw	s0,120(sp)
    46d0:	00050413          	mv	s0,a0
    46d4:	00060513          	mv	a0,a2
    46d8:	06912a23          	sw	s1,116(sp)
    46dc:	07512223          	sw	s5,100(sp)
    46e0:	00f12c23          	sw	a5,24(sp)
    46e4:	00e12a23          	sw	a4,20(sp)
    46e8:	06112e23          	sw	ra,124(sp)
    46ec:	07212823          	sw	s2,112(sp)
    46f0:	07312623          	sw	s3,108(sp)
    46f4:	07412423          	sw	s4,104(sp)
    46f8:	07612023          	sw	s6,96(sp)
    46fc:	05712e23          	sw	s7,92(sp)
    4700:	05812c23          	sw	s8,88(sp)
    4704:	05912a23          	sw	s9,84(sp)
    4708:	05a12823          	sw	s10,80(sp)
    470c:	05b12623          	sw	s11,76(sp)
    4710:	01012e23          	sw	a6,28(sp)
    4714:	00068a93          	mv	s5,a3
    4718:	00c12823          	sw	a2,16(sp)
    471c:	00b12423          	sw	a1,8(sp)
    4720:	ffffe097          	auipc	ra,0xffffe
    4724:	a48080e7          	jalr	-1464(ra) # 2168 <fatfs_lfn_entries_required>
    4728:	00150713          	addi	a4,a0,1
    472c:	00100793          	li	a5,1
    4730:	00050493          	mv	s1,a0
    4734:	2ae7f263          	bgeu	a5,a4,49d8 <fatfs_add_file_entry+0x318>
    4738:	00000a13          	li	s4,0
    473c:	00000993          	li	s3,0
    4740:	00000913          	li	s2,0
    4744:	00000c93          	li	s9,0
    4748:	00000b13          	li	s6,0
    474c:	01000c13          	li	s8,16
    4750:	00812583          	lw	a1,8(sp)
    4754:	00000693          	li	a3,0
    4758:	000b0613          	mv	a2,s6
    475c:	00040513          	mv	a0,s0
    4760:	000b0b93          	mv	s7,s6
    4764:	ffffe097          	auipc	ra,0xffffe
    4768:	7f4080e7          	jalr	2036(ra) # 2f58 <fatfs_sector_reader>
    476c:	18050463          	beqz	a0,48f4 <fatfs_add_file_entry+0x234>
    4770:	001b0b13          	addi	s6,s6,1
    4774:	04440793          	addi	a5,s0,68
    4778:	000c8d13          	mv	s10,s9
    477c:	00000d93          	li	s11,0
    4780:	00078513          	mv	a0,a5
    4784:	00f12623          	sw	a5,12(sp)
    4788:	ffffe097          	auipc	ra,0xffffe
    478c:	8f8080e7          	jalr	-1800(ra) # 2080 <fatfs_entry_lfn_text>
    4790:	00c12783          	lw	a5,12(sp)
    4794:	00050c93          	mv	s9,a0
    4798:	02050c63          	beqz	a0,47d0 <fatfs_add_file_entry+0x110>
    479c:	020d0463          	beqz	s10,47c4 <fatfs_add_file_entry+0x104>
    47a0:	00090c93          	mv	s9,s2
    47a4:	000c8913          	mv	s2,s9
    47a8:	001d0c93          	addi	s9,s10,1
    47ac:	001d8d93          	addi	s11,s11,1
    47b0:	0ffdfd93          	zext.b	s11,s11
    47b4:	02078793          	addi	a5,a5,32
    47b8:	f98d8ce3          	beq	s11,s8,4750 <fatfs_add_file_entry+0x90>
    47bc:	000c8d13          	mv	s10,s9
    47c0:	fc1ff06f          	j	4780 <fatfs_add_file_entry+0xc0>
    47c4:	000d8a13          	mv	s4,s11
    47c8:	000b8993          	mv	s3,s7
    47cc:	fd9ff06f          	j	47a4 <fatfs_add_file_entry+0xe4>
    47d0:	0007c683          	lbu	a3,0(a5)
    47d4:	0e500713          	li	a4,229
    47d8:	10e69863          	bne	a3,a4,48e8 <fatfs_add_file_entry+0x228>
    47dc:	000d1863          	bnez	s10,47ec <fatfs_add_file_entry+0x12c>
    47e0:	000d8a13          	mv	s4,s11
    47e4:	000b8993          	mv	s3,s7
    47e8:	00100913          	li	s2,1
    47ec:	fa9d4ee3          	blt	s10,s1,47a8 <fatfs_add_file_entry+0xe8>
    47f0:	00ba8693          	addi	a3,s5,11
    47f4:	000a8713          	mv	a4,s5
    47f8:	00000913          	li	s2,0
    47fc:	00074603          	lbu	a2,0(a4)
    4800:	00195793          	srli	a5,s2,0x1
    4804:	00791913          	slli	s2,s2,0x7
    4808:	012787b3          	add	a5,a5,s2
    480c:	00170713          	addi	a4,a4,1
    4810:	00c787b3          	add	a5,a5,a2
    4814:	0ff7f913          	zext.b	s2,a5
    4818:	fed712e3          	bne	a4,a3,47fc <fatfs_add_file_entry+0x13c>
    481c:	00098b13          	mv	s6,s3
    4820:	00000d13          	li	s10,0
    4824:	01000b93          	li	s7,16
    4828:	00812583          	lw	a1,8(sp)
    482c:	00000693          	li	a3,0
    4830:	000b0613          	mv	a2,s6
    4834:	00040513          	mv	a0,s0
    4838:	ffffe097          	auipc	ra,0xffffe
    483c:	720080e7          	jalr	1824(ra) # 2f58 <fatfs_sector_reader>
    4840:	18050c63          	beqz	a0,49d8 <fatfs_add_file_entry+0x318>
    4844:	04440c93          	addi	s9,s0,68
    4848:	413b0db3          	sub	s11,s6,s3
    484c:	00000793          	li	a5,0
    4850:	00000c13          	li	s8,0
    4854:	01912623          	sw	s9,12(sp)
    4858:	000d1663          	bnez	s10,4864 <fatfs_add_file_entry+0x1a4>
    485c:	154c1863          	bne	s8,s4,49ac <fatfs_add_file_entry+0x2ec>
    4860:	140d9663          	bnez	s11,49ac <fatfs_add_file_entry+0x2ec>
    4864:	12049263          	bnez	s1,4988 <fatfs_add_file_entry+0x2c8>
    4868:	01c12703          	lw	a4,28(sp)
    486c:	01412603          	lw	a2,20(sp)
    4870:	01812583          	lw	a1,24(sp)
    4874:	02010693          	addi	a3,sp,32
    4878:	000a8513          	mv	a0,s5
    487c:	ffffe097          	auipc	ra,0xffffe
    4880:	a30080e7          	jalr	-1488(ra) # 22ac <fatfs_sfn_create_entry>
    4884:	02000613          	li	a2,32
    4888:	00c105b3          	add	a1,sp,a2
    488c:	000c8513          	mv	a0,s9
    4890:	ffffd097          	auipc	ra,0xffffd
    4894:	a40080e7          	jalr	-1472(ra) # 12d0 <memcpy>
    4898:	03842783          	lw	a5,56(s0)
    489c:	00c12583          	lw	a1,12(sp)
    48a0:	24442503          	lw	a0,580(s0)
    48a4:	00100613          	li	a2,1
    48a8:	000780e7          	jalr	a5
    48ac:	07c12083          	lw	ra,124(sp)
    48b0:	07812403          	lw	s0,120(sp)
    48b4:	07412483          	lw	s1,116(sp)
    48b8:	07012903          	lw	s2,112(sp)
    48bc:	06c12983          	lw	s3,108(sp)
    48c0:	06812a03          	lw	s4,104(sp)
    48c4:	06412a83          	lw	s5,100(sp)
    48c8:	06012b03          	lw	s6,96(sp)
    48cc:	05c12b83          	lw	s7,92(sp)
    48d0:	05812c03          	lw	s8,88(sp)
    48d4:	05412c83          	lw	s9,84(sp)
    48d8:	05012d03          	lw	s10,80(sp)
    48dc:	04c12d83          	lw	s11,76(sp)
    48e0:	08010113          	addi	sp,sp,128
    48e4:	00008067          	ret
    48e8:	ee068ae3          	beqz	a3,47dc <fatfs_add_file_entry+0x11c>
    48ec:	00000913          	li	s2,0
    48f0:	ebdff06f          	j	47ac <fatfs_add_file_entry+0xec>
    48f4:	00842583          	lw	a1,8(s0)
    48f8:	02010613          	addi	a2,sp,32
    48fc:	00040513          	mv	a0,s0
    4900:	fffff097          	auipc	ra,0xfffff
    4904:	3e4080e7          	jalr	996(ra) # 3ce4 <fatfs_find_blank_cluster>
    4908:	0c050863          	beqz	a0,49d8 <fatfs_add_file_entry+0x318>
    490c:	02012b83          	lw	s7,32(sp)
    4910:	00812583          	lw	a1,8(sp)
    4914:	00040513          	mv	a0,s0
    4918:	000b8613          	mv	a2,s7
    491c:	fffff097          	auipc	ra,0xfffff
    4920:	64c080e7          	jalr	1612(ra) # 3f68 <fatfs_fat_add_cluster_to_chain>
    4924:	0a050a63          	beqz	a0,49d8 <fatfs_add_file_entry+0x318>
    4928:	20000613          	li	a2,512
    492c:	00000593          	li	a1,0
    4930:	04440513          	addi	a0,s0,68
    4934:	ffffd097          	auipc	ra,0xffffd
    4938:	980080e7          	jalr	-1664(ra) # 12b4 <memset>
    493c:	00000c13          	li	s8,0
    4940:	00044783          	lbu	a5,0(s0)
    4944:	00fc6a63          	bltu	s8,a5,4958 <fatfs_add_file_entry+0x298>
    4948:	ea0914e3          	bnez	s2,47f0 <fatfs_add_file_entry+0x130>
    494c:	000b0993          	mv	s3,s6
    4950:	00000a13          	li	s4,0
    4954:	e9dff06f          	j	47f0 <fatfs_add_file_entry+0x130>
    4958:	00000693          	li	a3,0
    495c:	000c0613          	mv	a2,s8
    4960:	000b8593          	mv	a1,s7
    4964:	00040513          	mv	a0,s0
    4968:	ffffd097          	auipc	ra,0xffffd
    496c:	3f4080e7          	jalr	1012(ra) # 1d5c <fatfs_write_sector>
    4970:	06050463          	beqz	a0,49d8 <fatfs_add_file_entry+0x318>
    4974:	001c0c13          	addi	s8,s8,1
    4978:	0ffc7c13          	zext.b	s8,s8
    497c:	fc5ff06f          	j	4940 <fatfs_add_file_entry+0x280>
    4980:	001b0b13          	addi	s6,s6,1
    4984:	ea5ff06f          	j	4828 <fatfs_add_file_entry+0x168>
    4988:	01012503          	lw	a0,16(sp)
    498c:	fff48493          	addi	s1,s1,-1
    4990:	00090693          	mv	a3,s2
    4994:	00048613          	mv	a2,s1
    4998:	000c8593          	mv	a1,s9
    499c:	ffffd097          	auipc	ra,0xffffd
    49a0:	7fc080e7          	jalr	2044(ra) # 2198 <fatfs_filename_to_lfn>
    49a4:	00100d13          	li	s10,1
    49a8:	000d0793          	mv	a5,s10
    49ac:	001c0c13          	addi	s8,s8,1
    49b0:	0ffc7c13          	zext.b	s8,s8
    49b4:	020c8c93          	addi	s9,s9,32
    49b8:	eb7c10e3          	bne	s8,s7,4858 <fatfs_add_file_entry+0x198>
    49bc:	fc0782e3          	beqz	a5,4980 <fatfs_add_file_entry+0x2c0>
    49c0:	03842783          	lw	a5,56(s0)
    49c4:	00c12583          	lw	a1,12(sp)
    49c8:	24442503          	lw	a0,580(s0)
    49cc:	00100613          	li	a2,1
    49d0:	000780e7          	jalr	a5
    49d4:	fa0516e3          	bnez	a0,4980 <fatfs_add_file_entry+0x2c0>
    49d8:	00000513          	li	a0,0
    49dc:	ed1ff06f          	j	48ac <fatfs_add_file_entry+0x1ec>
    49e0:	00000513          	li	a0,0
    49e4:	00008067          	ret

000049e8 <fl_fopen>:
    49e8:	000057b7          	lui	a5,0x5
    49ec:	3287a783          	lw	a5,808(a5) # 5328 <_filelib_init>
    49f0:	fa010113          	addi	sp,sp,-96
    49f4:	05212823          	sw	s2,80(sp)
    49f8:	03a12823          	sw	s10,48(sp)
    49fc:	04112e23          	sw	ra,92(sp)
    4a00:	04812c23          	sw	s0,88(sp)
    4a04:	04912a23          	sw	s1,84(sp)
    4a08:	05312623          	sw	s3,76(sp)
    4a0c:	05412423          	sw	s4,72(sp)
    4a10:	05512223          	sw	s5,68(sp)
    4a14:	05612023          	sw	s6,64(sp)
    4a18:	03712e23          	sw	s7,60(sp)
    4a1c:	03812c23          	sw	s8,56(sp)
    4a20:	03912a23          	sw	s9,52(sp)
    4a24:	00050d13          	mv	s10,a0
    4a28:	00058913          	mv	s2,a1
    4a2c:	00079663          	bnez	a5,4a38 <fl_fopen+0x50>
    4a30:	ffffd097          	auipc	ra,0xffffd
    4a34:	3e0080e7          	jalr	992(ra) # 1e10 <fl_init>
    4a38:	000057b7          	lui	a5,0x5
    4a3c:	3247a783          	lw	a5,804(a5) # 5324 <_filelib_valid>
    4a40:	00193713          	seqz	a4,s2
    4a44:	0017b793          	seqz	a5,a5
    4a48:	00e7e7b3          	or	a5,a5,a4
    4a4c:	36079e63          	bnez	a5,4dc8 <fl_fopen+0x3e0>
    4a50:	360d0c63          	beqz	s10,4dc8 <fl_fopen+0x3e0>
    4a54:	00000493          	li	s1,0
    4a58:	00000413          	li	s0,0
    4a5c:	05700993          	li	s3,87
    4a60:	07200a13          	li	s4,114
    4a64:	07700b13          	li	s6,119
    4a68:	06100b93          	li	s7,97
    4a6c:	06200c13          	li	s8,98
    4a70:	04100a93          	li	s5,65
    4a74:	04200c93          	li	s9,66
    4a78:	00090513          	mv	a0,s2
    4a7c:	ffffd097          	auipc	ra,0xffffd
    4a80:	878080e7          	jalr	-1928(ra) # 12f4 <strlen>
    4a84:	10a44a63          	blt	s0,a0,4b98 <fl_fopen+0x1b0>
    4a88:	000079b7          	lui	s3,0x7
    4a8c:	f4898a13          	addi	s4,s3,-184 # 6f48 <_fs>
    4a90:	038a2783          	lw	a5,56(s4)
    4a94:	00079463          	bnez	a5,4a9c <fl_fopen+0xb4>
    4a98:	fd94f493          	andi	s1,s1,-39
    4a9c:	03ca2783          	lw	a5,60(s4)
    4aa0:	00078463          	beqz	a5,4aa8 <fl_fopen+0xc0>
    4aa4:	000780e7          	jalr	a5
    4aa8:	0014f793          	andi	a5,s1,1
    4aac:	18079263          	bnez	a5,4c30 <fl_fopen+0x248>
    4ab0:	0204f793          	andi	a5,s1,32
    4ab4:	08078c63          	beqz	a5,4b4c <fl_fopen+0x164>
    4ab8:	038a2783          	lw	a5,56(s4)
    4abc:	06078a63          	beqz	a5,4b30 <fl_fopen+0x148>
    4ac0:	ffffd097          	auipc	ra,0xffffd
    4ac4:	160080e7          	jalr	352(ra) # 1c20 <_allocate_file>
    4ac8:	00050413          	mv	s0,a0
    4acc:	06050263          	beqz	a0,4b30 <fl_fopen+0x148>
    4ad0:	01450a93          	addi	s5,a0,20
    4ad4:	10400613          	li	a2,260
    4ad8:	00000593          	li	a1,0
    4adc:	000a8513          	mv	a0,s5
    4ae0:	ffffc097          	auipc	ra,0xffffc
    4ae4:	7d4080e7          	jalr	2004(ra) # 12b4 <memset>
    4ae8:	11840b13          	addi	s6,s0,280
    4aec:	10400613          	li	a2,260
    4af0:	00000593          	li	a1,0
    4af4:	000b0513          	mv	a0,s6
    4af8:	ffffc097          	auipc	ra,0xffffc
    4afc:	7bc080e7          	jalr	1980(ra) # 12b4 <memset>
    4b00:	10400713          	li	a4,260
    4b04:	000b0693          	mv	a3,s6
    4b08:	00070613          	mv	a2,a4
    4b0c:	000a8593          	mv	a1,s5
    4b10:	000d0513          	mv	a0,s10
    4b14:	ffffe097          	auipc	ra,0xffffe
    4b18:	c88080e7          	jalr	-888(ra) # 279c <fatfs_split_path>
    4b1c:	fff00793          	li	a5,-1
    4b20:	12f51663          	bne	a0,a5,4c4c <fl_fopen+0x264>
    4b24:	00040513          	mv	a0,s0
    4b28:	ffffd097          	auipc	ra,0xffffd
    4b2c:	170080e7          	jalr	368(ra) # 1c98 <_free_file>
    4b30:	00000413          	li	s0,0
    4b34:	0214f793          	andi	a5,s1,33
    4b38:	02000713          	li	a4,32
    4b3c:	28e79263          	bne	a5,a4,4dc0 <fl_fopen+0x3d8>
    4b40:	10041263          	bnez	s0,4c44 <fl_fopen+0x25c>
    4b44:	0064f793          	andi	a5,s1,6
    4b48:	26079463          	bnez	a5,4db0 <fl_fopen+0x3c8>
    4b4c:	00000413          	li	s0,0
    4b50:	040a2783          	lw	a5,64(s4)
    4b54:	00078463          	beqz	a5,4b5c <fl_fopen+0x174>
    4b58:	000780e7          	jalr	a5
    4b5c:	05c12083          	lw	ra,92(sp)
    4b60:	00040513          	mv	a0,s0
    4b64:	05812403          	lw	s0,88(sp)
    4b68:	05412483          	lw	s1,84(sp)
    4b6c:	05012903          	lw	s2,80(sp)
    4b70:	04c12983          	lw	s3,76(sp)
    4b74:	04812a03          	lw	s4,72(sp)
    4b78:	04412a83          	lw	s5,68(sp)
    4b7c:	04012b03          	lw	s6,64(sp)
    4b80:	03c12b83          	lw	s7,60(sp)
    4b84:	03812c03          	lw	s8,56(sp)
    4b88:	03412c83          	lw	s9,52(sp)
    4b8c:	03012d03          	lw	s10,48(sp)
    4b90:	06010113          	addi	sp,sp,96
    4b94:	00008067          	ret
    4b98:	008907b3          	add	a5,s2,s0
    4b9c:	0007c783          	lbu	a5,0(a5)
    4ba0:	05378863          	beq	a5,s3,4bf0 <fl_fopen+0x208>
    4ba4:	02f9e863          	bltu	s3,a5,4bd4 <fl_fopen+0x1ec>
    4ba8:	05578863          	beq	a5,s5,4bf8 <fl_fopen+0x210>
    4bac:	00faea63          	bltu	s5,a5,4bc0 <fl_fopen+0x1d8>
    4bb0:	02b00713          	li	a4,43
    4bb4:	04e78663          	beq	a5,a4,4c00 <fl_fopen+0x218>
    4bb8:	00140413          	addi	s0,s0,1
    4bbc:	ebdff06f          	j	4a78 <fl_fopen+0x90>
    4bc0:	03978263          	beq	a5,s9,4be4 <fl_fopen+0x1fc>
    4bc4:	05200713          	li	a4,82
    4bc8:	fee798e3          	bne	a5,a4,4bb8 <fl_fopen+0x1d0>
    4bcc:	0014e493          	ori	s1,s1,1
    4bd0:	fe9ff06f          	j	4bb8 <fl_fopen+0x1d0>
    4bd4:	ff478ce3          	beq	a5,s4,4bcc <fl_fopen+0x1e4>
    4bd8:	00fa6a63          	bltu	s4,a5,4bec <fl_fopen+0x204>
    4bdc:	01778e63          	beq	a5,s7,4bf8 <fl_fopen+0x210>
    4be0:	fd879ce3          	bne	a5,s8,4bb8 <fl_fopen+0x1d0>
    4be4:	0084e493          	ori	s1,s1,8
    4be8:	fd1ff06f          	j	4bb8 <fl_fopen+0x1d0>
    4bec:	fd6796e3          	bne	a5,s6,4bb8 <fl_fopen+0x1d0>
    4bf0:	0324e493          	ori	s1,s1,50
    4bf4:	fc5ff06f          	j	4bb8 <fl_fopen+0x1d0>
    4bf8:	0264e493          	ori	s1,s1,38
    4bfc:	fbdff06f          	j	4bb8 <fl_fopen+0x1d0>
    4c00:	0014f793          	andi	a5,s1,1
    4c04:	00078663          	beqz	a5,4c10 <fl_fopen+0x228>
    4c08:	0024e493          	ori	s1,s1,2
    4c0c:	fadff06f          	j	4bb8 <fl_fopen+0x1d0>
    4c10:	0024f793          	andi	a5,s1,2
    4c14:	00078663          	beqz	a5,4c20 <fl_fopen+0x238>
    4c18:	0314e493          	ori	s1,s1,49
    4c1c:	f9dff06f          	j	4bb8 <fl_fopen+0x1d0>
    4c20:	0044f793          	andi	a5,s1,4
    4c24:	f8078ae3          	beqz	a5,4bb8 <fl_fopen+0x1d0>
    4c28:	0274e493          	ori	s1,s1,39
    4c2c:	f8dff06f          	j	4bb8 <fl_fopen+0x1d0>
    4c30:	000d0513          	mv	a0,s10
    4c34:	fffff097          	auipc	ra,0xfffff
    4c38:	81c080e7          	jalr	-2020(ra) # 3450 <_open_file>
    4c3c:	00050413          	mv	s0,a0
    4c40:	e60508e3          	beqz	a0,4ab0 <fl_fopen+0xc8>
    4c44:	42940c23          	sb	s1,1080(s0)
    4c48:	f09ff06f          	j	4b50 <fl_fopen+0x168>
    4c4c:	00040513          	mv	a0,s0
    4c50:	ffffe097          	auipc	ra,0xffffe
    4c54:	dc8080e7          	jalr	-568(ra) # 2a18 <_check_file_open>
    4c58:	00050913          	mv	s2,a0
    4c5c:	ec0514e3          	bnez	a0,4b24 <fl_fopen+0x13c>
    4c60:	01444783          	lbu	a5,20(s0)
    4c64:	0e079663          	bnez	a5,4d50 <fl_fopen+0x368>
    4c68:	008a2783          	lw	a5,8(s4)
    4c6c:	00f42023          	sw	a5,0(s0)
    4c70:	00042583          	lw	a1,0(s0)
    4c74:	01010693          	addi	a3,sp,16
    4c78:	000b0613          	mv	a2,s6
    4c7c:	f4898513          	addi	a0,s3,-184
    4c80:	ffffe097          	auipc	ra,0xffffe
    4c84:	428080e7          	jalr	1064(ra) # 30a8 <fatfs_get_file_entry>
    4c88:	00100693          	li	a3,1
    4c8c:	e8d50ce3          	beq	a0,a3,4b24 <fl_fopen+0x13c>
    4c90:	00042223          	sw	zero,4(s0)
    4c94:	00440613          	addi	a2,s0,4
    4c98:	00068593          	mv	a1,a3
    4c9c:	f4898513          	addi	a0,s3,-184
    4ca0:	00000097          	auipc	ra,0x0
    4ca4:	908080e7          	jalr	-1784(ra) # 45a8 <fatfs_allocate_free_space>
    4ca8:	e6050ee3          	beqz	a0,4b24 <fl_fopen+0x13c>
    4cac:	00002ab7          	lui	s5,0x2
    4cb0:	21c40b93          	addi	s7,s0,540
    4cb4:	f4898c13          	addi	s8,s3,-184
    4cb8:	70fa8a93          	addi	s5,s5,1807 # 270f <fatfs_get_substring+0x5b>
    4cbc:	000b0593          	mv	a1,s6
    4cc0:	00410513          	addi	a0,sp,4
    4cc4:	ffffd097          	auipc	ra,0xffffd
    4cc8:	68c080e7          	jalr	1676(ra) # 2350 <fatfs_lfn_create_sfn>
    4ccc:	08090e63          	beqz	s2,4d68 <fl_fopen+0x380>
    4cd0:	00090613          	mv	a2,s2
    4cd4:	00410593          	addi	a1,sp,4
    4cd8:	000b8513          	mv	a0,s7
    4cdc:	ffffd097          	auipc	ra,0xffffd
    4ce0:	7f0080e7          	jalr	2032(ra) # 24cc <fatfs_lfn_generate_tail>
    4ce4:	00042583          	lw	a1,0(s0)
    4ce8:	000b8613          	mv	a2,s7
    4cec:	000c0513          	mv	a0,s8
    4cf0:	fffff097          	auipc	ra,0xfffff
    4cf4:	8d4080e7          	jalr	-1836(ra) # 35c4 <fatfs_sfn_exists>
    4cf8:	00050663          	beqz	a0,4d04 <fl_fopen+0x31c>
    4cfc:	00190913          	addi	s2,s2,1
    4d00:	fb591ee3          	bne	s2,s5,4cbc <fl_fopen+0x2d4>
    4d04:	00442703          	lw	a4,4(s0)
    4d08:	000027b7          	lui	a5,0x2
    4d0c:	70f78793          	addi	a5,a5,1807 # 270f <fatfs_get_substring+0x5b>
    4d10:	00070593          	mv	a1,a4
    4d14:	02f90663          	beq	s2,a5,4d40 <fl_fopen+0x358>
    4d18:	00042583          	lw	a1,0(s0)
    4d1c:	00000813          	li	a6,0
    4d20:	00000793          	li	a5,0
    4d24:	000b8693          	mv	a3,s7
    4d28:	000b0613          	mv	a2,s6
    4d2c:	f4898513          	addi	a0,s3,-184
    4d30:	00000097          	auipc	ra,0x0
    4d34:	990080e7          	jalr	-1648(ra) # 46c0 <fatfs_add_file_entry>
    4d38:	04051463          	bnez	a0,4d80 <fl_fopen+0x398>
    4d3c:	00442583          	lw	a1,4(s0)
    4d40:	f4898513          	addi	a0,s3,-184
    4d44:	fffff097          	auipc	ra,0xfffff
    4d48:	1b4080e7          	jalr	436(ra) # 3ef8 <fatfs_free_cluster_chain>
    4d4c:	dd9ff06f          	j	4b24 <fl_fopen+0x13c>
    4d50:	00040593          	mv	a1,s0
    4d54:	000a8513          	mv	a0,s5
    4d58:	ffffe097          	auipc	ra,0xffffe
    4d5c:	54c080e7          	jalr	1356(ra) # 32a4 <_open_directory>
    4d60:	f00518e3          	bnez	a0,4c70 <fl_fopen+0x288>
    4d64:	dc1ff06f          	j	4b24 <fl_fopen+0x13c>
    4d68:	00b00613          	li	a2,11
    4d6c:	00410593          	addi	a1,sp,4
    4d70:	000b8513          	mv	a0,s7
    4d74:	ffffc097          	auipc	ra,0xffffc
    4d78:	55c080e7          	jalr	1372(ra) # 12d0 <memcpy>
    4d7c:	f69ff06f          	j	4ce4 <fl_fopen+0x2fc>
    4d80:	fff00793          	li	a5,-1
    4d84:	00042623          	sw	zero,12(s0)
    4d88:	00042423          	sw	zero,8(s0)
    4d8c:	42f42823          	sw	a5,1072(s0)
    4d90:	42042a23          	sw	zero,1076(s0)
    4d94:	00042823          	sw	zero,16(s0)
    4d98:	22f42423          	sw	a5,552(s0)
    4d9c:	22f42623          	sw	a5,556(s0)
    4da0:	f4898513          	addi	a0,s3,-184
    4da4:	ffffe097          	auipc	ra,0xffffe
    4da8:	054080e7          	jalr	84(ra) # 2df8 <fatfs_fat_purge>
    4dac:	d89ff06f          	j	4b34 <fl_fopen+0x14c>
    4db0:	000d0513          	mv	a0,s10
    4db4:	ffffe097          	auipc	ra,0xffffe
    4db8:	69c080e7          	jalr	1692(ra) # 3450 <_open_file>
    4dbc:	00050413          	mv	s0,a0
    4dc0:	e80412e3          	bnez	s0,4c44 <fl_fopen+0x25c>
    4dc4:	d89ff06f          	j	4b4c <fl_fopen+0x164>
    4dc8:	00000413          	li	s0,0
    4dcc:	d91ff06f          	j	4b5c <fl_fopen+0x174>

00004dd0 <cmd16>:
    4dd0:	02000050 00001500                       P.......

00004dd8 <acmd41>:
    4dd8:	00004069 00000100                       i@......

00004de0 <cmd55>:
    4de0:	00000077 00000100                       w.......

00004de8 <cmd8>:
    4de8:	01000048 000087aa                       H.......

00004df0 <cmd0>:
    4df0:	00000040 00009500                       @.......

00004df8 <AUDIO>:
    4df8:	00018000                                ....

00004dfc <DISPLAY>:
    4dfc:	00014000                                .@..

00004e00 <BUTTONS>:
    4e00:	00010100                                ....

00004e04 <SDCARD>:
    4e04:	00010080                                ....

00004e08 <OLED_RST>:
    4e08:	00010010                                ....

00004e0c <OLED>:
    4e0c:	00010008                                ....

00004e10 <LEDS>:
    4e10:	00010004 00006272 696c632f 722e6b63     ....rb../click.r
    4e20:	00007761 3a727245 0a732520 00000000     aw..Err: %s.....
    4e30:	79616c50 3a676e69 20732520 20202020     Playing: %s     
    4e40:	20202020 000a2020 0000002f 00002e2e           ../.......
    4e50:	0000002e 74696e49 20445320 64726163     ....Init SD card
    4e60:	0a2e2e2e 00000000 52494420 0000203a     ........ DIR: ..
    4e70:	74706d45 69642079 74636572 2179726f     Empty directory!
    4e80:	0000000a 5d64255b 00000020 203e6425     ....[%d] ...%d> 
    4e90:	00000000 20202020 20202020 20202020     ....            
    4ea0:	20202020 20202020 00000a20 33323130              ...0123
    4eb0:	37363534 42413938 46454443 00000000     456789ABCDEF....
    4ec0:	5f544146 203a5346 6f727245 6f632072     FAT_FS: Error co
    4ed0:	20646c75 20746f6e 64616f6c 54414620     uld not load FAT
    4ee0:	74656420 736c6961 64252820 0a0d2129      details (%d)!..
    4ef0:	00000000                                ....

00004ef4 <font>:
    4ef4:	00000000 00002f00 00030000 14000003     ...../..........
    4f04:	143e143e 3a2b6a2e 08122600 171c3224     >.>..j+:.&..$2..
    4f14:	03003415 00000000 0000211e 001e2100     .4.......!...!..
    4f24:	08220000 0822081c 0000081c 00002040     .."...".....@ ..
    4f34:	00080800 00200000 20000000 02040810     ...... .... ....
    4f44:	3f21213f 003f0100 253d0000 25002725     ?!!?..?...=%%'.%
    4f54:	003f2525 3f040407 25252700 253f003d     %%?....?.'%%=.?%
    4f64:	01003d25 00030539 3f25253f 25252700     %=..9...?%%?.'%%
    4f74:	0028003f 40000000 00000028 00110a04     ?.(....@(.......
    4f84:	00141400 0a110000 01000004 0007052d     ............-...
    4f94:	253d213f 09093f1f 253f003f 3f003c27     ?!=%.?..?.?%'<.?
    4fa4:	00212121 1e21213f 25253f00 053f0025     !!!.?!!..?%%%.?.
    4fb4:	3f000505 003d2521 3f04043f 213f2100     ...?!%=.?..?.!?!
    4fc4:	20380000 3f013f21 003b0404 2020203f     ..8 !?.?..;.?   
    4fd4:	3f013f00 023f3f01 3f003f04 003f2121     .?.?.??..?.?!!?.
    4fe4:	0f09093f 31213f00 093f003f 27002f39     ?....?!1?.?.9/.'
    4ff4:	003d2525 013f0101 20203f01 100f003f     %%=...?..?  ?...
    5004:	3f001f30 3f203f20 3b04043b 38080f00     0..? ? ?;..;...8
    5014:	2931000f 3f002325 00000021 04081020     ..1)%#.?!... ...
    5024:	003f2102 01020000 20000201 00000020     .!?........  ...
    5034:	00000201 24243800 243f003c 3c003c24     .....8$$<.?$$<.<
    5044:	00242424 3f24243c 2c2c3c00 3f04002c     $$$.<$$?.<,,,..?
    5054:	bc000005 00fca4a4 3c04043f 00003d00     ........?..<.=..
    5064:	fd800000 3f000000 00340808 0000003f     .......?..4.?...
    5074:	3c043c00 043c3c04 3c003c04 003c2424     .<.<.<<..<.<$$<.
    5084:	3c2424fc 24243c00 083c00fc 2c000004     .$$<.<$$..<....,
    5094:	003c2c2c 00243f04 20203c00 100c003c     ,,<..?$..<  <...
    50a4:	3c001c30 3c203c20 34080834 a0a0bc00     0..< < <4..4....
    50b4:	342400fc 0400242c 0000213f 0000003f     ..$4,$..?!..?...
    50c4:	043f2100 02010000 00000102 00000000     .!?.............
    50d4:	00000001 00000003 00000005 00000007     ................
    50e4:	00000009 0000000e 00000010 00000012     ................
    50f4:	00000014 00000016 00000018 0000001c     ................
    5104:	0000001e                                ....

00005108 <current_path>:
    5108:	0000002f 00000000 00000000 00000000     /...............
	...

000052fc <n_items>:
    52fc:	00000000                                ....

00005300 <sdcard_while_loading_callback>:
    5300:	00000000                                ....

00005304 <back_color>:
	...

00005305 <front_color>:
    5305:	                                         ...

00005308 <cursor_y>:
    5308:	00000000                                ....

0000530c <cursor_x>:
    530c:	00000000                                ....

00005310 <f_putchar>:
    5310:	00000000                                ....

00005314 <_free_file_list>:
	...

0000531c <_open_file_list>:
	...

00005324 <_filelib_valid>:
    5324:	00000000                                ....

00005328 <_filelib_init>:
    5328:	00000000                                ....
