
code.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00010137          	lui	sp,0x10
       4:	00001097          	auipc	ra,0x1
       8:	e8c080e7          	jalr	-372(ra) # e90 <main>
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
      64:	fe010113          	addi	sp,sp,-32 # ffe0 <_files+0x8808>
      68:	000057b7          	lui	a5,0x5
      6c:	00812c23          	sw	s0,24(sp)
      70:	1ac7a403          	lw	s0,428(a5) # 51ac <AUDIO>
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
      ac:	544080e7          	jalr	1348(ra) # 15ec <memset>
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
      ec:	1c858593          	addi	a1,a1,456 # 51c8 <LEDS+0x4>
      f0:	1d050513          	addi	a0,a0,464 # 51d0 <LEDS+0xc>
      f4:	00112e23          	sw	ra,28(sp)
      f8:	00812c23          	sw	s0,24(sp)
      fc:	00912a23          	sw	s1,20(sp)
     100:	01212823          	sw	s2,16(sp)
     104:	01312623          	sw	s3,12(sp)
     108:	01412423          	sw	s4,8(sp)
     10c:	01512223          	sw	s5,4(sp)
     110:	00005097          	auipc	ra,0x5
     114:	c8c080e7          	jalr	-884(ra) # 4d9c <fl_fopen>
     118:	0a050063          	beqz	a0,1b8 <play_click_noise+0xd8>
     11c:	00000613          	li	a2,0
     120:	32000593          	li	a1,800
     124:	00050a13          	mv	s4,a0
     128:	00002097          	auipc	ra,0x2
     12c:	104080e7          	jalr	260(ra) # 222c <fl_fseek>
     130:	000057b7          	lui	a5,0x5
     134:	1ac7aa83          	lw	s5,428(a5) # 51ac <AUDIO>
     138:	20000993          	li	s3,512
     13c:	1ff00913          	li	s2,511
     140:	000aa483          	lw	s1,0(s5)
     144:	000a0693          	mv	a3,s4
     148:	20000613          	li	a2,512
     14c:	00100593          	li	a1,1
     150:	00048513          	mv	a0,s1
     154:	00004097          	auipc	ra,0x4
     158:	644080e7          	jalr	1604(ra) # 4798 <fl_fread>
     15c:	00050413          	mv	s0,a0
     160:	00a94c63          	blt	s2,a0,178 <play_click_noise+0x98>
     164:	40a98633          	sub	a2,s3,a0
     168:	00000593          	li	a1,0
     16c:	00a48533          	add	a0,s1,a0
     170:	00001097          	auipc	ra,0x1
     174:	47c080e7          	jalr	1148(ra) # 15ec <memset>
     178:	000aa783          	lw	a5,0(s5)
     17c:	fef48ee3          	beq	s1,a5,178 <play_click_noise+0x98>
     180:	fc8940e3          	blt	s2,s0,140 <play_click_noise+0x60>
     184:	000a0513          	mv	a0,s4
     188:	00004097          	auipc	ra,0x4
     18c:	534080e7          	jalr	1332(ra) # 46bc <fl_fclose>
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
     1e4:	1c858593          	addi	a1,a1,456 # 51c8 <LEDS+0x4>
     1e8:	00112623          	sw	ra,12(sp)
     1ec:	00812423          	sw	s0,8(sp)
     1f0:	00005097          	auipc	ra,0x5
     1f4:	bac080e7          	jalr	-1108(ra) # 4d9c <fl_fopen>
     1f8:	08050663          	beqz	a0,284 <view_image_file+0xa8>
     1fc:	00050413          	mv	s0,a0
     200:	00001097          	auipc	ra,0x1
     204:	70c080e7          	jalr	1804(ra) # 190c <display_framebuffer>
     208:	00040693          	mv	a3,s0
     20c:	00004637          	lui	a2,0x4
     210:	00100593          	li	a1,1
     214:	00004097          	auipc	ra,0x4
     218:	584080e7          	jalr	1412(ra) # 4798 <fl_fread>
     21c:	00040513          	mv	a0,s0
     220:	00004097          	auipc	ra,0x4
     224:	49c080e7          	jalr	1180(ra) # 46bc <fl_fclose>
     228:	00002097          	auipc	ra,0x2
     22c:	860080e7          	jalr	-1952(ra) # 1a88 <display_refresh>
     230:	000057b7          	lui	a5,0x5
     234:	1b47a683          	lw	a3,436(a5) # 51b4 <BUTTONS>
     238:	0006a703          	lw	a4,0(a3)
     23c:	fff74793          	not	a5,a4
     240:	0006a703          	lw	a4,0(a3)
     244:	00e7f7b3          	and	a5,a5,a4
     248:	0067f793          	andi	a5,a5,6
     24c:	fe0788e3          	beqz	a5,23c <view_image_file+0x60>
     250:	00000097          	auipc	ra,0x0
     254:	e90080e7          	jalr	-368(ra) # e0 <play_click_noise>
     258:	00001097          	auipc	ra,0x1
     25c:	6b4080e7          	jalr	1716(ra) # 190c <display_framebuffer>
     260:	00004637          	lui	a2,0x4
     264:	00000593          	li	a1,0
     268:	00001097          	auipc	ra,0x1
     26c:	384080e7          	jalr	900(ra) # 15ec <memset>
     270:	00812403          	lw	s0,8(sp)
     274:	00c12083          	lw	ra,12(sp)
     278:	01010113          	addi	sp,sp,16
     27c:	00002317          	auipc	t1,0x2
     280:	80c30067          	jr	-2036(t1) # 1a88 <display_refresh>
     284:	00c12083          	lw	ra,12(sp)
     288:	00812403          	lw	s0,8(sp)
     28c:	01010113          	addi	sp,sp,16
     290:	00008067          	ret

00000294 <play_music_file>:
     294:	000055b7          	lui	a1,0x5
     298:	fc010113          	addi	sp,sp,-64
     29c:	1c858593          	addi	a1,a1,456 # 51c8 <LEDS+0x4>
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
     2dc:	ac4080e7          	jalr	-1340(ra) # 4d9c <fl_fopen>
     2e0:	08051063          	bnez	a0,360 <play_music_file+0xcc>
     2e4:	00000593          	li	a1,0
     2e8:	0ff00513          	li	a0,255
     2ec:	00001097          	auipc	ra,0x1
     2f0:	640080e7          	jalr	1600(ra) # 192c <display_set_front_back_color>
     2f4:	00005537          	lui	a0,0x5
     2f8:	00040593          	mv	a1,s0
     2fc:	1dc50513          	addi	a0,a0,476 # 51dc <LEDS+0x18>
     300:	00002097          	auipc	ra,0x2
     304:	8f4080e7          	jalr	-1804(ra) # 1bf4 <printf>
     308:	00001097          	auipc	ra,0x1
     30c:	780080e7          	jalr	1920(ra) # 1a88 <display_refresh>
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
     36c:	00001097          	auipc	ra,0x1
     370:	5ac080e7          	jalr	1452(ra) # 1918 <display_set_cursor>
     374:	00000593          	li	a1,0
     378:	0ff00513          	li	a0,255
     37c:	00001097          	auipc	ra,0x1
     380:	5b0080e7          	jalr	1456(ra) # 192c <display_set_front_back_color>
     384:	00005537          	lui	a0,0x5
     388:	00040593          	mv	a1,s0
     38c:	1e850513          	addi	a0,a0,488 # 51e8 <LEDS+0x24>
     390:	00002097          	auipc	ra,0x2
     394:	864080e7          	jalr	-1948(ra) # 1bf4 <printf>
     398:	00001097          	auipc	ra,0x1
     39c:	6f0080e7          	jalr	1776(ra) # 1a88 <display_refresh>
     3a0:	000057b7          	lui	a5,0x5
     3a4:	1b47a783          	lw	a5,436(a5) # 51b4 <BUTTONS>
     3a8:	00000b13          	li	s6,0
     3ac:	00100413          	li	s0,1
     3b0:	0007a483          	lw	s1,0(a5)
     3b4:	00078c93          	mv	s9,a5
     3b8:	000057b7          	lui	a5,0x5
     3bc:	1ac7ad03          	lw	s10,428(a5) # 51ac <AUDIO>
     3c0:	20000a13          	li	s4,512
     3c4:	1ff00993          	li	s3,511
     3c8:	00005937          	lui	s2,0x5
     3cc:	000d2b83          	lw	s7,0(s10)
     3d0:	000c0693          	mv	a3,s8
     3d4:	20000613          	li	a2,512
     3d8:	00100593          	li	a1,1
     3dc:	000b8513          	mv	a0,s7
     3e0:	00004097          	auipc	ra,0x4
     3e4:	3b8080e7          	jalr	952(ra) # 4798 <fl_fread>
     3e8:	00050a93          	mv	s5,a0
     3ec:	00a9cc63          	blt	s3,a0,404 <play_music_file+0x170>
     3f0:	40aa0633          	sub	a2,s4,a0
     3f4:	00000593          	li	a1,0
     3f8:	00ab8533          	add	a0,s7,a0
     3fc:	00001097          	auipc	ra,0x1
     400:	1f0080e7          	jalr	496(ra) # 15ec <memset>
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
     430:	1c492783          	lw	a5,452(s2) # 51c4 <LEDS>
     434:	fff4c493          	not	s1,s1
     438:	0087a023          	sw	s0,0(a5)
     43c:	000ca783          	lw	a5,0(s9)
     440:	00f4f4b3          	and	s1,s1,a5
     444:	08048063          	beqz	s1,4c4 <play_music_file+0x230>
     448:	00000097          	auipc	ra,0x0
     44c:	c98080e7          	jalr	-872(ra) # e0 <play_click_noise>
     450:	000c0513          	mv	a0,s8
     454:	00004097          	auipc	ra,0x4
     458:	268080e7          	jalr	616(ra) # 46bc <fl_fclose>
     45c:	00000097          	auipc	ra,0x0
     460:	c08080e7          	jalr	-1016(ra) # 64 <clear_audio>
     464:	1c492783          	lw	a5,452(s2)
     468:	0007a023          	sw	zero,0(a5)
     46c:	00001097          	auipc	ra,0x1
     470:	4a0080e7          	jalr	1184(ra) # 190c <display_framebuffer>
     474:	00004637          	lui	a2,0x4
     478:	00000593          	li	a1,0
     47c:	00001097          	auipc	ra,0x1
     480:	170080e7          	jalr	368(ra) # 15ec <memset>
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
     4bc:	00001317          	auipc	t1,0x1
     4c0:	5cc30067          	jr	1484(t1) # 1a88 <display_refresh>
     4c4:	00070b13          	mv	s6,a4
     4c8:	00078493          	mv	s1,a5
     4cc:	f01ff06f          	j	3cc <play_music_file+0x138>
     4d0:	40145413          	srai	s0,s0,0x1
     4d4:	f5dff06f          	j	430 <play_music_file+0x19c>

000004d8 <scan_files>:
     4d8:	fd010113          	addi	sp,sp,-48
     4dc:	02912223          	sw	s1,36(sp)
     4e0:	000055b7          	lui	a1,0x5
     4e4:	000054b7          	lui	s1,0x5
     4e8:	02812423          	sw	s0,40(sp)
     4ec:	20058593          	addi	a1,a1,512 # 5200 <LEDS+0x3c>
     4f0:	00005437          	lui	s0,0x5
     4f4:	53048513          	addi	a0,s1,1328 # 5530 <current_path>
     4f8:	02112623          	sw	ra,44(sp)
     4fc:	03212023          	sw	s2,32(sp)
     500:	01312e23          	sw	s3,28(sp)
     504:	01412c23          	sw	s4,24(sp)
     508:	01512a23          	sw	s5,20(sp)
     50c:	01612823          	sw	s6,16(sp)
     510:	01712623          	sw	s7,12(sp)
     514:	72042223          	sw	zero,1828(s0) # 5724 <n_items>
     518:	00000097          	auipc	ra,0x0
     51c:	b04080e7          	jalr	-1276(ra) # 1c <strcmp>
     520:	06050e63          	beqz	a0,59c <scan_files+0xc4>
     524:	00006937          	lui	s2,0x6
     528:	06400613          	li	a2,100
     52c:	00000593          	li	a1,0
     530:	87090513          	addi	a0,s2,-1936 # 5870 <files>
     534:	00001097          	auipc	ra,0x1
     538:	0b8080e7          	jalr	184(ra) # 15ec <memset>
     53c:	72442783          	lw	a5,1828(s0)
     540:	87090913          	addi	s2,s2,-1936
     544:	000055b7          	lui	a1,0x5
     548:	00379513          	slli	a0,a5,0x3
     54c:	40f50533          	sub	a0,a0,a5
     550:	00251513          	slli	a0,a0,0x2
     554:	40f50533          	sub	a0,a0,a5
     558:	00251513          	slli	a0,a0,0x2
     55c:	00a90533          	add	a0,s2,a0
     560:	20458593          	addi	a1,a1,516 # 5204 <LEDS+0x40>
     564:	00001097          	auipc	ra,0x1
     568:	14c080e7          	jalr	332(ra) # 16b0 <strcpy>
     56c:	72442703          	lw	a4,1828(s0)
     570:	00371793          	slli	a5,a4,0x3
     574:	40e787b3          	sub	a5,a5,a4
     578:	00279793          	slli	a5,a5,0x2
     57c:	40e787b3          	sub	a5,a5,a4
     580:	00279793          	slli	a5,a5,0x2
     584:	00f90933          	add	s2,s2,a5
     588:	00100793          	li	a5,1
     58c:	00f70733          	add	a4,a4,a5
     590:	06092223          	sw	zero,100(s2)
     594:	06f92423          	sw	a5,104(s2)
     598:	72e42223          	sw	a4,1828(s0)
     59c:	000069b7          	lui	s3,0x6
     5a0:	86498593          	addi	a1,s3,-1948 # 5864 <dirstat.1>
     5a4:	53048513          	addi	a0,s1,1328
     5a8:	00003097          	auipc	ra,0x3
     5ac:	194080e7          	jalr	404(ra) # 373c <fl_opendir>
     5b0:	14050063          	beqz	a0,6f0 <scan_files+0x218>
     5b4:	00005937          	lui	s2,0x5
     5b8:	000057b7          	lui	a5,0x5
     5bc:	000064b7          	lui	s1,0x6
     5c0:	20878b93          	addi	s7,a5,520 # 5208 <LEDS+0x44>
     5c4:	87048493          	addi	s1,s1,-1936 # 5870 <files>
     5c8:	75490a13          	addi	s4,s2,1876 # 5754 <dirent.0>
     5cc:	75490593          	addi	a1,s2,1876
     5d0:	86498513          	addi	a0,s3,-1948
     5d4:	00004097          	auipc	ra,0x4
     5d8:	834080e7          	jalr	-1996(ra) # 3e08 <fl_readdir>
     5dc:	00050a93          	mv	s5,a0
     5e0:	00051863          	bnez	a0,5f0 <scan_files+0x118>
     5e4:	72442b03          	lw	s6,1828(s0)
     5e8:	03f00793          	li	a5,63
     5ec:	0367dc63          	bge	a5,s6,624 <scan_files+0x14c>
     5f0:	02812403          	lw	s0,40(sp)
     5f4:	02c12083          	lw	ra,44(sp)
     5f8:	02412483          	lw	s1,36(sp)
     5fc:	02012903          	lw	s2,32(sp)
     600:	01812a03          	lw	s4,24(sp)
     604:	01412a83          	lw	s5,20(sp)
     608:	01012b03          	lw	s6,16(sp)
     60c:	00c12b83          	lw	s7,12(sp)
     610:	86498513          	addi	a0,s3,-1948
     614:	01c12983          	lw	s3,28(sp)
     618:	03010113          	addi	sp,sp,48
     61c:	00002317          	auipc	t1,0x2
     620:	d0830067          	jr	-760(t1) # 2324 <fl_closedir>
     624:	000b8593          	mv	a1,s7
     628:	75490513          	addi	a0,s2,1876
     62c:	00000097          	auipc	ra,0x0
     630:	9f0080e7          	jalr	-1552(ra) # 1c <strcmp>
     634:	f8050ce3          	beqz	a0,5cc <scan_files+0xf4>
     638:	000055b7          	lui	a1,0x5
     63c:	20458593          	addi	a1,a1,516 # 5204 <LEDS+0x40>
     640:	75490513          	addi	a0,s2,1876
     644:	00000097          	auipc	ra,0x0
     648:	9d8080e7          	jalr	-1576(ra) # 1c <strcmp>
     64c:	f80500e3          	beqz	a0,5cc <scan_files+0xf4>
     650:	003b1513          	slli	a0,s6,0x3
     654:	41650533          	sub	a0,a0,s6
     658:	00251513          	slli	a0,a0,0x2
     65c:	41650533          	sub	a0,a0,s6
     660:	00251513          	slli	a0,a0,0x2
     664:	06400613          	li	a2,100
     668:	00000593          	li	a1,0
     66c:	00a48533          	add	a0,s1,a0
     670:	00001097          	auipc	ra,0x1
     674:	f7c080e7          	jalr	-132(ra) # 15ec <memset>
     678:	72442703          	lw	a4,1828(s0)
     67c:	06300513          	li	a0,99
     680:	00371793          	slli	a5,a4,0x3
     684:	40e786b3          	sub	a3,a5,a4
     688:	00269693          	slli	a3,a3,0x2
     68c:	40e686b3          	sub	a3,a3,a4
     690:	00269693          	slli	a3,a3,0x2
     694:	014a8633          	add	a2,s5,s4
     698:	00064583          	lbu	a1,0(a2) # 4000 <fatfs_set_fs_info_next_free_cluster+0x18>
     69c:	00058463          	beqz	a1,6a4 <scan_files+0x1cc>
     6a0:	02aa9e63          	bne	s5,a0,6dc <scan_files+0x204>
     6a4:	40e787b3          	sub	a5,a5,a4
     6a8:	00279793          	slli	a5,a5,0x2
     6ac:	10ca2683          	lw	a3,268(s4)
     6b0:	40e787b3          	sub	a5,a5,a4
     6b4:	00279793          	slli	a5,a5,0x2
     6b8:	00f487b3          	add	a5,s1,a5
     6bc:	06d7a223          	sw	a3,100(a5)
     6c0:	104a4683          	lbu	a3,260(s4)
     6c4:	01578ab3          	add	s5,a5,s5
     6c8:	00170713          	addi	a4,a4,1
     6cc:	000a8023          	sb	zero,0(s5)
     6d0:	06d7a423          	sw	a3,104(a5)
     6d4:	72e42223          	sw	a4,1828(s0)
     6d8:	ef5ff06f          	j	5cc <scan_files+0xf4>
     6dc:	00da8633          	add	a2,s5,a3
     6e0:	00c48633          	add	a2,s1,a2
     6e4:	00b60023          	sb	a1,0(a2)
     6e8:	001a8a93          	addi	s5,s5,1
     6ec:	fa9ff06f          	j	694 <scan_files+0x1bc>
     6f0:	02c12083          	lw	ra,44(sp)
     6f4:	02812403          	lw	s0,40(sp)
     6f8:	02412483          	lw	s1,36(sp)
     6fc:	02012903          	lw	s2,32(sp)
     700:	01c12983          	lw	s3,28(sp)
     704:	01812a03          	lw	s4,24(sp)
     708:	01412a83          	lw	s5,20(sp)
     70c:	01012b03          	lw	s6,16(sp)
     710:	00c12b83          	lw	s7,12(sp)
     714:	03010113          	addi	sp,sp,48
     718:	00008067          	ret

0000071c <go_up_directory>:
     71c:	ff010113          	addi	sp,sp,-16
     720:	00812423          	sw	s0,8(sp)
     724:	00005437          	lui	s0,0x5
     728:	00112623          	sw	ra,12(sp)
     72c:	00000793          	li	a5,0
     730:	53040413          	addi	s0,s0,1328 # 5530 <current_path>
     734:	00878733          	add	a4,a5,s0
     738:	00074683          	lbu	a3,0(a4)
     73c:	02069c63          	bnez	a3,774 <go_up_directory+0x58>
     740:	00100693          	li	a3,1
     744:	02f6d063          	bge	a3,a5,764 <go_up_directory+0x48>
     748:	02f00593          	li	a1,47
     74c:	00040513          	mv	a0,s0
     750:	fe070fa3          	sb	zero,-1(a4)
     754:	00000097          	auipc	ra,0x0
     758:	8ec080e7          	jalr	-1812(ra) # 40 <strrchr>
     75c:	02050063          	beqz	a0,77c <go_up_directory+0x60>
     760:	000500a3          	sb	zero,1(a0)
     764:	00c12083          	lw	ra,12(sp)
     768:	00812403          	lw	s0,8(sp)
     76c:	01010113          	addi	sp,sp,16
     770:	00008067          	ret
     774:	00178793          	addi	a5,a5,1
     778:	fbdff06f          	j	734 <go_up_directory+0x18>
     77c:	00040513          	mv	a0,s0
     780:	00812403          	lw	s0,8(sp)
     784:	00c12083          	lw	ra,12(sp)
     788:	000055b7          	lui	a1,0x5
     78c:	20058593          	addi	a1,a1,512 # 5200 <LEDS+0x3c>
     790:	01010113          	addi	sp,sp,16
     794:	00001317          	auipc	t1,0x1
     798:	f1c30067          	jr	-228(t1) # 16b0 <strcpy>

0000079c <file_explorer>:
     79c:	db010113          	addi	sp,sp,-592
     7a0:	24812423          	sw	s0,584(sp)
     7a4:	25212023          	sw	s2,576(sp)
     7a8:	23312e23          	sw	s3,572(sp)
     7ac:	23512a23          	sw	s5,564(sp)
     7b0:	23712623          	sw	s7,556(sp)
     7b4:	23812423          	sw	s8,552(sp)
     7b8:	24112623          	sw	ra,588(sp)
     7bc:	24912223          	sw	s1,580(sp)
     7c0:	23412c23          	sw	s4,568(sp)
     7c4:	23612823          	sw	s6,560(sp)
     7c8:	23912223          	sw	s9,548(sp)
     7cc:	23a12023          	sw	s10,544(sp)
     7d0:	21b12e23          	sw	s11,540(sp)
     7d4:	00000097          	auipc	ra,0x0
     7d8:	d04080e7          	jalr	-764(ra) # 4d8 <scan_files>
     7dc:	000057b7          	lui	a5,0x5
     7e0:	20c78793          	addi	a5,a5,524 # 520c <LEDS+0x48>
     7e4:	00f12423          	sw	a5,8(sp)
     7e8:	000057b7          	lui	a5,0x5
     7ec:	1b47a783          	lw	a5,436(a5) # 51b4 <BUTTONS>
     7f0:	00000b93          	li	s7,0
     7f4:	00000993          	li	s3,0
     7f8:	00000913          	li	s2,0
     7fc:	00000413          	li	s0,0
     800:	00005c37          	lui	s8,0x5
     804:	00005ab7          	lui	s5,0x5
     808:	00f12623          	sw	a5,12(sp)
     80c:	00000593          	li	a1,0
     810:	00000513          	li	a0,0
     814:	00001097          	auipc	ra,0x1
     818:	104080e7          	jalr	260(ra) # 1918 <display_set_cursor>
     81c:	0ffbf593          	zext.b	a1,s7
     820:	07f58513          	addi	a0,a1,127
     824:	0ff57513          	zext.b	a0,a0
     828:	00001097          	auipc	ra,0x1
     82c:	104080e7          	jalr	260(ra) # 192c <display_set_front_back_color>
     830:	00812503          	lw	a0,8(sp)
     834:	00000493          	li	s1,0
     838:	00c00a13          	li	s4,12
     83c:	00001097          	auipc	ra,0x1
     840:	3b8080e7          	jalr	952(ra) # 1bf4 <printf>
     844:	000057b7          	lui	a5,0x5
     848:	53078793          	addi	a5,a5,1328 # 5530 <current_path>
     84c:	00f487b3          	add	a5,s1,a5
     850:	0007c503          	lbu	a0,0(a5)
     854:	00050a63          	beqz	a0,868 <file_explorer+0xcc>
     858:	738aa783          	lw	a5,1848(s5) # 5738 <f_putchar>
     85c:	00148493          	addi	s1,s1,1
     860:	000780e7          	jalr	a5
     864:	ff4490e3          	bne	s1,s4,844 <file_explorer+0xa8>
     868:	738aa783          	lw	a5,1848(s5)
     86c:	00a00513          	li	a0,10
     870:	00005d37          	lui	s10,0x5
     874:	000780e7          	jalr	a5
     878:	00000593          	li	a1,0
     87c:	0ff00513          	li	a0,255
     880:	00001097          	auipc	ra,0x1
     884:	0ac080e7          	jalr	172(ra) # 192c <display_set_front_back_color>
     888:	724d2a03          	lw	s4,1828(s10) # 5724 <n_items>
     88c:	080a0663          	beqz	s4,918 <file_explorer+0x17c>
     890:	412a0a33          	sub	s4,s4,s2
     894:	00c00793          	li	a5,12
     898:	0147d463          	bge	a5,s4,8a0 <file_explorer+0x104>
     89c:	00078a13          	mv	s4,a5
     8a0:	00391493          	slli	s1,s2,0x3
     8a4:	412484b3          	sub	s1,s1,s2
     8a8:	00249493          	slli	s1,s1,0x2
     8ac:	412484b3          	sub	s1,s1,s2
     8b0:	000067b7          	lui	a5,0x6
     8b4:	87078793          	addi	a5,a5,-1936 # 5870 <files>
     8b8:	00249493          	slli	s1,s1,0x2
     8bc:	00f484b3          	add	s1,s1,a5
     8c0:	000057b7          	lui	a5,0x5
     8c4:	22878793          	addi	a5,a5,552 # 5228 <LEDS+0x64>
     8c8:	00f12023          	sw	a5,0(sp)
     8cc:	000057b7          	lui	a5,0x5
     8d0:	22078793          	addi	a5,a5,544 # 5220 <LEDS+0x5c>
     8d4:	00000b13          	li	s6,0
     8d8:	00f12223          	sw	a5,4(sp)
     8dc:	01200d93          	li	s11,18
     8e0:	194b4663          	blt	s6,s4,a6c <file_explorer+0x2d0>
     8e4:	00000593          	li	a1,0
     8e8:	00000513          	li	a0,0
     8ec:	000054b7          	lui	s1,0x5
     8f0:	00001097          	auipc	ra,0x1
     8f4:	03c080e7          	jalr	60(ra) # 192c <display_set_front_back_color>
     8f8:	00c00b13          	li	s6,12
     8fc:	23048493          	addi	s1,s1,560 # 5230 <LEDS+0x6c>
     900:	036a0463          	beq	s4,s6,928 <file_explorer+0x18c>
     904:	00048513          	mv	a0,s1
     908:	00001097          	auipc	ra,0x1
     90c:	2ec080e7          	jalr	748(ra) # 1bf4 <printf>
     910:	001a0a13          	addi	s4,s4,1
     914:	fedff06f          	j	900 <file_explorer+0x164>
     918:	00005537          	lui	a0,0x5
     91c:	21850513          	addi	a0,a0,536 # 5218 <LEDS+0x54>
     920:	00001097          	auipc	ra,0x1
     924:	2d4080e7          	jalr	724(ra) # 1bf4 <printf>
     928:	00001097          	auipc	ra,0x1
     92c:	160080e7          	jalr	352(ra) # 1a88 <display_refresh>
     930:	00c12783          	lw	a5,12(sp)
     934:	fff9c993          	not	s3,s3
     938:	0007aa03          	lw	s4,0(a5)
     93c:	0149f9b3          	and	s3,s3,s4
     940:	0109f793          	andi	a5,s3,16
     944:	00078863          	beqz	a5,954 <file_explorer+0x1b8>
     948:	00140413          	addi	s0,s0,1
     94c:	fffff097          	auipc	ra,0xfffff
     950:	794080e7          	jalr	1940(ra) # e0 <play_click_noise>
     954:	0089f793          	andi	a5,s3,8
     958:	00078863          	beqz	a5,968 <file_explorer+0x1cc>
     95c:	fff40413          	addi	s0,s0,-1
     960:	fffff097          	auipc	ra,0xfffff
     964:	780080e7          	jalr	1920(ra) # e0 <play_click_noise>
     968:	0029f793          	andi	a5,s3,2
     96c:	04078a63          	beqz	a5,9c0 <file_explorer+0x224>
     970:	fffff097          	auipc	ra,0xfffff
     974:	770080e7          	jalr	1904(ra) # e0 <play_click_noise>
     978:	000055b7          	lui	a1,0x5
     97c:	20058593          	addi	a1,a1,512 # 5200 <LEDS+0x3c>
     980:	530c0513          	addi	a0,s8,1328 # 5530 <current_path>
     984:	fffff097          	auipc	ra,0xfffff
     988:	698080e7          	jalr	1688(ra) # 1c <strcmp>
     98c:	24050263          	beqz	a0,bd0 <file_explorer+0x434>
     990:	00000097          	auipc	ra,0x0
     994:	d8c080e7          	jalr	-628(ra) # 71c <go_up_directory>
     998:	00000097          	auipc	ra,0x0
     99c:	b40080e7          	jalr	-1216(ra) # 4d8 <scan_files>
     9a0:	00001097          	auipc	ra,0x1
     9a4:	f6c080e7          	jalr	-148(ra) # 190c <display_framebuffer>
     9a8:	00004637          	lui	a2,0x4
     9ac:	00000593          	li	a1,0
     9b0:	00001097          	auipc	ra,0x1
     9b4:	c3c080e7          	jalr	-964(ra) # 15ec <memset>
     9b8:	00000913          	li	s2,0
     9bc:	00000413          	li	s0,0
     9c0:	0049f993          	andi	s3,s3,4
     9c4:	007b8b93          	addi	s7,s7,7
     9c8:	06098e63          	beqz	s3,a44 <file_explorer+0x2a8>
     9cc:	00341993          	slli	s3,s0,0x3
     9d0:	408984b3          	sub	s1,s3,s0
     9d4:	00249493          	slli	s1,s1,0x2
     9d8:	408484b3          	sub	s1,s1,s0
     9dc:	00006b37          	lui	s6,0x6
     9e0:	00249493          	slli	s1,s1,0x2
     9e4:	870b0b13          	addi	s6,s6,-1936 # 5870 <files>
     9e8:	fffff097          	auipc	ra,0xfffff
     9ec:	6f8080e7          	jalr	1784(ra) # e0 <play_click_noise>
     9f0:	016484b3          	add	s1,s1,s6
     9f4:	0684a783          	lw	a5,104(s1)
     9f8:	14078263          	beqz	a5,b3c <file_explorer+0x3a0>
     9fc:	000055b7          	lui	a1,0x5
     a00:	20458593          	addi	a1,a1,516 # 5204 <LEDS+0x40>
     a04:	00048513          	mv	a0,s1
     a08:	fffff097          	auipc	ra,0xfffff
     a0c:	614080e7          	jalr	1556(ra) # 1c <strcmp>
     a10:	10051863          	bnez	a0,b20 <file_explorer+0x384>
     a14:	00000097          	auipc	ra,0x0
     a18:	d08080e7          	jalr	-760(ra) # 71c <go_up_directory>
     a1c:	00000097          	auipc	ra,0x0
     a20:	abc080e7          	jalr	-1348(ra) # 4d8 <scan_files>
     a24:	00001097          	auipc	ra,0x1
     a28:	ee8080e7          	jalr	-280(ra) # 190c <display_framebuffer>
     a2c:	00004637          	lui	a2,0x4
     a30:	00000593          	li	a1,0
     a34:	00001097          	auipc	ra,0x1
     a38:	bb8080e7          	jalr	-1096(ra) # 15ec <memset>
     a3c:	00000913          	li	s2,0
     a40:	00000413          	li	s0,0
     a44:	724d2783          	lw	a5,1828(s10)
     a48:	00f05e63          	blez	a5,a64 <file_explorer+0x2c8>
     a4c:	16045663          	bgez	s0,bb8 <file_explorer+0x41c>
     a50:	fff78413          	addi	s0,a5,-1
     a54:	17244a63          	blt	s0,s2,bc8 <file_explorer+0x42c>
     a58:	00b90793          	addi	a5,s2,11
     a5c:	0087d463          	bge	a5,s0,a64 <file_explorer+0x2c8>
     a60:	ff540913          	addi	s2,s0,-11
     a64:	000a0993          	mv	s3,s4
     a68:	da5ff06f          	j	80c <file_explorer+0x70>
     a6c:	012b0cb3          	add	s9,s6,s2
     a70:	07941463          	bne	s0,s9,ad8 <file_explorer+0x33c>
     a74:	0ff00593          	li	a1,255
     a78:	00000513          	li	a0,0
     a7c:	00001097          	auipc	ra,0x1
     a80:	eb0080e7          	jalr	-336(ra) # 192c <display_set_front_back_color>
     a84:	0684a783          	lw	a5,104(s1)
     a88:	000c8593          	mv	a1,s9
     a8c:	04078c63          	beqz	a5,ae4 <file_explorer+0x348>
     a90:	00412503          	lw	a0,4(sp)
     a94:	00001097          	auipc	ra,0x1
     a98:	160080e7          	jalr	352(ra) # 1bf4 <printf>
     a9c:	00000c93          	li	s9,0
     aa0:	019487b3          	add	a5,s1,s9
     aa4:	0007c503          	lbu	a0,0(a5)
     aa8:	00050a63          	beqz	a0,abc <file_explorer+0x320>
     aac:	738aa783          	lw	a5,1848(s5)
     ab0:	001c8c93          	addi	s9,s9,1
     ab4:	000780e7          	jalr	a5
     ab8:	ffbc94e3          	bne	s9,s11,aa0 <file_explorer+0x304>
     abc:	738aa783          	lw	a5,1848(s5)
     ac0:	03bc9663          	bne	s9,s11,aec <file_explorer+0x350>
     ac4:	00a00513          	li	a0,10
     ac8:	000780e7          	jalr	a5
     acc:	001b0b13          	addi	s6,s6,1
     ad0:	06c48493          	addi	s1,s1,108
     ad4:	e0dff06f          	j	8e0 <file_explorer+0x144>
     ad8:	00000593          	li	a1,0
     adc:	0ff00513          	li	a0,255
     ae0:	f9dff06f          	j	a7c <file_explorer+0x2e0>
     ae4:	00012503          	lw	a0,0(sp)
     ae8:	fadff06f          	j	a94 <file_explorer+0x2f8>
     aec:	02000513          	li	a0,32
     af0:	000780e7          	jalr	a5
     af4:	001c8c93          	addi	s9,s9,1
     af8:	fc5ff06f          	j	abc <file_explorer+0x320>
     afc:	00178793          	addi	a5,a5,1
     b00:	0007c703          	lbu	a4,0(a5)
     b04:	fe071ce3          	bnez	a4,afc <file_explorer+0x360>
     b08:	0004c703          	lbu	a4,0(s1)
     b0c:	02071063          	bnez	a4,b2c <file_explorer+0x390>
     b10:	02f00713          	li	a4,47
     b14:	00e78023          	sb	a4,0(a5)
     b18:	000780a3          	sb	zero,1(a5)
     b1c:	f01ff06f          	j	a1c <file_explorer+0x280>
     b20:	000057b7          	lui	a5,0x5
     b24:	53078793          	addi	a5,a5,1328 # 5530 <current_path>
     b28:	fd9ff06f          	j	b00 <file_explorer+0x364>
     b2c:	00178793          	addi	a5,a5,1
     b30:	00148493          	addi	s1,s1,1
     b34:	fee78fa3          	sb	a4,-1(a5)
     b38:	fd1ff06f          	j	b08 <file_explorer+0x36c>
     b3c:	530c0593          	addi	a1,s8,1328
     b40:	01c10513          	addi	a0,sp,28
     b44:	00001097          	auipc	ra,0x1
     b48:	b6c080e7          	jalr	-1172(ra) # 16b0 <strcpy>
     b4c:	01c10793          	addi	a5,sp,28
     b50:	0007c703          	lbu	a4,0(a5)
     b54:	04071063          	bnez	a4,b94 <file_explorer+0x3f8>
     b58:	0004c703          	lbu	a4,0(s1)
     b5c:	04071063          	bnez	a4,b9c <file_explorer+0x400>
     b60:	408989b3          	sub	s3,s3,s0
     b64:	00299993          	slli	s3,s3,0x2
     b68:	408989b3          	sub	s3,s3,s0
     b6c:	00299993          	slli	s3,s3,0x2
     b70:	013b0b33          	add	s6,s6,s3
     b74:	064b2703          	lw	a4,100(s6)
     b78:	00078023          	sb	zero,0(a5)
     b7c:	000047b7          	lui	a5,0x4
     b80:	01c10513          	addi	a0,sp,28
     b84:	02f71463          	bne	a4,a5,bac <file_explorer+0x410>
     b88:	fffff097          	auipc	ra,0xfffff
     b8c:	654080e7          	jalr	1620(ra) # 1dc <view_image_file>
     b90:	eb5ff06f          	j	a44 <file_explorer+0x2a8>
     b94:	00178793          	addi	a5,a5,1 # 4001 <fatfs_set_fs_info_next_free_cluster+0x19>
     b98:	fb9ff06f          	j	b50 <file_explorer+0x3b4>
     b9c:	00178793          	addi	a5,a5,1
     ba0:	00148493          	addi	s1,s1,1
     ba4:	fee78fa3          	sb	a4,-1(a5)
     ba8:	fb1ff06f          	j	b58 <file_explorer+0x3bc>
     bac:	fffff097          	auipc	ra,0xfffff
     bb0:	6e8080e7          	jalr	1768(ra) # 294 <play_music_file>
     bb4:	e91ff06f          	j	a44 <file_explorer+0x2a8>
     bb8:	00f427b3          	slt	a5,s0,a5
     bbc:	40f007b3          	neg	a5,a5
     bc0:	00f47433          	and	s0,s0,a5
     bc4:	e91ff06f          	j	a54 <file_explorer+0x2b8>
     bc8:	00040913          	mv	s2,s0
     bcc:	e99ff06f          	j	a64 <file_explorer+0x2c8>
     bd0:	24c12083          	lw	ra,588(sp)
     bd4:	24812403          	lw	s0,584(sp)
     bd8:	24412483          	lw	s1,580(sp)
     bdc:	24012903          	lw	s2,576(sp)
     be0:	23c12983          	lw	s3,572(sp)
     be4:	23812a03          	lw	s4,568(sp)
     be8:	23412a83          	lw	s5,564(sp)
     bec:	23012b03          	lw	s6,560(sp)
     bf0:	22c12b83          	lw	s7,556(sp)
     bf4:	22812c03          	lw	s8,552(sp)
     bf8:	22412c83          	lw	s9,548(sp)
     bfc:	22012d03          	lw	s10,544(sp)
     c00:	21c12d83          	lw	s11,540(sp)
     c04:	25010113          	addi	sp,sp,592
     c08:	00008067          	ret

00000c0c <not_implemented>:
     c0c:	ff010113          	addi	sp,sp,-16
     c10:	00812423          	sw	s0,8(sp)
     c14:	00050413          	mv	s0,a0
     c18:	00000513          	li	a0,0
     c1c:	00112623          	sw	ra,12(sp)
     c20:	00001097          	auipc	ra,0x1
     c24:	c70080e7          	jalr	-912(ra) # 1890 <oled_clear>
     c28:	02800593          	li	a1,40
     c2c:	00000513          	li	a0,0
     c30:	00001097          	auipc	ra,0x1
     c34:	ce8080e7          	jalr	-792(ra) # 1918 <display_set_cursor>
     c38:	00005537          	lui	a0,0x5
     c3c:	00040593          	mv	a1,s0
     c40:	24850513          	addi	a0,a0,584 # 5248 <LEDS+0x84>
     c44:	00001097          	auipc	ra,0x1
     c48:	fb0080e7          	jalr	-80(ra) # 1bf4 <printf>
     c4c:	03c00593          	li	a1,60
     c50:	00000513          	li	a0,0
     c54:	00001097          	auipc	ra,0x1
     c58:	cc4080e7          	jalr	-828(ra) # 1918 <display_set_cursor>
     c5c:	00005537          	lui	a0,0x5
     c60:	25050513          	addi	a0,a0,592 # 5250 <LEDS+0x8c>
     c64:	00001097          	auipc	ra,0x1
     c68:	f90080e7          	jalr	-112(ra) # 1bf4 <printf>
     c6c:	00001097          	auipc	ra,0x1
     c70:	e1c080e7          	jalr	-484(ra) # 1a88 <display_refresh>
     c74:	000057b7          	lui	a5,0x5
     c78:	1b47a783          	lw	a5,436(a5) # 51b4 <BUTTONS>
     c7c:	0007a703          	lw	a4,0(a5)
     c80:	fe070ee3          	beqz	a4,c7c <not_implemented+0x70>
     c84:	0007a703          	lw	a4,0(a5)
     c88:	fe071ee3          	bnez	a4,c84 <not_implemented+0x78>
     c8c:	00812403          	lw	s0,8(sp)
     c90:	00c12083          	lw	ra,12(sp)
     c94:	01010113          	addi	sp,sp,16
     c98:	fffff317          	auipc	t1,0xfffff
     c9c:	44830067          	jr	1096(t1) # e0 <play_click_noise>

00000ca0 <main_menu>:
     ca0:	fb010113          	addi	sp,sp,-80
     ca4:	000057b7          	lui	a5,0x5
     ca8:	26078793          	addi	a5,a5,608 # 5260 <LEDS+0x9c>
     cac:	03312e23          	sw	s3,60(sp)
     cb0:	000059b7          	lui	s3,0x5
     cb4:	03412c23          	sw	s4,56(sp)
     cb8:	00f12223          	sw	a5,4(sp)
     cbc:	00005a37          	lui	s4,0x5
     cc0:	27098793          	addi	a5,s3,624 # 5270 <LEDS+0xac>
     cc4:	00f12423          	sw	a5,8(sp)
     cc8:	27ca0793          	addi	a5,s4,636 # 527c <LEDS+0xb8>
     ccc:	00f12623          	sw	a5,12(sp)
     cd0:	000057b7          	lui	a5,0x5
     cd4:	03a12023          	sw	s10,32(sp)
     cd8:	28478d13          	addi	s10,a5,644 # 5284 <LEDS+0xc0>
     cdc:	000057b7          	lui	a5,0x5
     ce0:	03812423          	sw	s8,40(sp)
     ce4:	29878c13          	addi	s8,a5,664 # 5298 <LEDS+0xd4>
     ce8:	000057b7          	lui	a5,0x5
     cec:	03912223          	sw	s9,36(sp)
     cf0:	2a878c93          	addi	s9,a5,680 # 52a8 <LEDS+0xe4>
     cf4:	000057b7          	lui	a5,0x5
     cf8:	01b12e23          	sw	s11,28(sp)
     cfc:	2ac78d93          	addi	s11,a5,684 # 52ac <LEDS+0xe8>
     d00:	000057b7          	lui	a5,0x5
     d04:	03712623          	sw	s7,44(sp)
     d08:	1b47ab83          	lw	s7,436(a5) # 51b4 <BUTTONS>
     d0c:	04812423          	sw	s0,72(sp)
     d10:	04912223          	sw	s1,68(sp)
     d14:	03512a23          	sw	s5,52(sp)
     d18:	04112623          	sw	ra,76(sp)
     d1c:	05212023          	sw	s2,64(sp)
     d20:	03612823          	sw	s6,48(sp)
     d24:	00000493          	li	s1,0
     d28:	00000413          	li	s0,0
     d2c:	00300a93          	li	s5,3
     d30:	00000593          	li	a1,0
     d34:	00000513          	li	a0,0
     d38:	00001097          	auipc	ra,0x1
     d3c:	be0080e7          	jalr	-1056(ra) # 1918 <display_set_cursor>
     d40:	00000593          	li	a1,0
     d44:	0ff00513          	li	a0,255
     d48:	00001097          	auipc	ra,0x1
     d4c:	be4080e7          	jalr	-1052(ra) # 192c <display_set_front_back_color>
     d50:	000d0513          	mv	a0,s10
     d54:	00001097          	auipc	ra,0x1
     d58:	ea0080e7          	jalr	-352(ra) # 1bf4 <printf>
     d5c:	00410b13          	addi	s6,sp,4
     d60:	00000913          	li	s2,0
     d64:	0f241e63          	bne	s0,s2,e60 <main_menu+0x1c0>
     d68:	0ff00593          	li	a1,255
     d6c:	00000513          	li	a0,0
     d70:	00001097          	auipc	ra,0x1
     d74:	bbc080e7          	jalr	-1092(ra) # 192c <display_set_front_back_color>
     d78:	000b2603          	lw	a2,0(s6)
     d7c:	00190913          	addi	s2,s2,1
     d80:	00090593          	mv	a1,s2
     d84:	000c0513          	mv	a0,s8
     d88:	00001097          	auipc	ra,0x1
     d8c:	e6c080e7          	jalr	-404(ra) # 1bf4 <printf>
     d90:	000c8513          	mv	a0,s9
     d94:	00001097          	auipc	ra,0x1
     d98:	e60080e7          	jalr	-416(ra) # 1bf4 <printf>
     d9c:	004b0b13          	addi	s6,s6,4
     da0:	fd5912e3          	bne	s2,s5,d64 <main_menu+0xc4>
     da4:	00000593          	li	a1,0
     da8:	0ff00513          	li	a0,255
     dac:	00001097          	auipc	ra,0x1
     db0:	b80080e7          	jalr	-1152(ra) # 192c <display_set_front_back_color>
     db4:	06e00593          	li	a1,110
     db8:	00000513          	li	a0,0
     dbc:	00001097          	auipc	ra,0x1
     dc0:	b5c080e7          	jalr	-1188(ra) # 1918 <display_set_cursor>
     dc4:	000d8513          	mv	a0,s11
     dc8:	00001097          	auipc	ra,0x1
     dcc:	e2c080e7          	jalr	-468(ra) # 1bf4 <printf>
     dd0:	00001097          	auipc	ra,0x1
     dd4:	cb8080e7          	jalr	-840(ra) # 1a88 <display_refresh>
     dd8:	000ba903          	lw	s2,0(s7)
     ddc:	fff4c493          	not	s1,s1
     de0:	0124f4b3          	and	s1,s1,s2
     de4:	0104f793          	andi	a5,s1,16
     de8:	00078863          	beqz	a5,df8 <main_menu+0x158>
     dec:	00140413          	addi	s0,s0,1
     df0:	fffff097          	auipc	ra,0xfffff
     df4:	2f0080e7          	jalr	752(ra) # e0 <play_click_noise>
     df8:	0084f793          	andi	a5,s1,8
     dfc:	00078863          	beqz	a5,e0c <main_menu+0x16c>
     e00:	fff40413          	addi	s0,s0,-1
     e04:	fffff097          	auipc	ra,0xfffff
     e08:	2dc080e7          	jalr	732(ra) # e0 <play_click_noise>
     e0c:	0044f493          	andi	s1,s1,4
     e10:	02048863          	beqz	s1,e40 <main_menu+0x1a0>
     e14:	fffff097          	auipc	ra,0xfffff
     e18:	2cc080e7          	jalr	716(ra) # e0 <play_click_noise>
     e1c:	04041863          	bnez	s0,e6c <main_menu+0x1cc>
     e20:	00000097          	auipc	ra,0x0
     e24:	97c080e7          	jalr	-1668(ra) # 79c <file_explorer>
     e28:	00001097          	auipc	ra,0x1
     e2c:	ae4080e7          	jalr	-1308(ra) # 190c <display_framebuffer>
     e30:	00004637          	lui	a2,0x4
     e34:	00000593          	li	a1,0
     e38:	00000097          	auipc	ra,0x0
     e3c:	7b4080e7          	jalr	1972(ra) # 15ec <memset>
     e40:	fff00793          	li	a5,-1
     e44:	00f40863          	beq	s0,a5,e54 <main_menu+0x1b4>
     e48:	01541863          	bne	s0,s5,e58 <main_menu+0x1b8>
     e4c:	00000413          	li	s0,0
     e50:	0080006f          	j	e58 <main_menu+0x1b8>
     e54:	00200413          	li	s0,2
     e58:	00090493          	mv	s1,s2
     e5c:	ed5ff06f          	j	d30 <main_menu+0x90>
     e60:	00000593          	li	a1,0
     e64:	0ff00513          	li	a0,255
     e68:	f09ff06f          	j	d70 <main_menu+0xd0>
     e6c:	00100793          	li	a5,1
     e70:	27098513          	addi	a0,s3,624
     e74:	00f40863          	beq	s0,a5,e84 <main_menu+0x1e4>
     e78:	00200793          	li	a5,2
     e7c:	faf416e3          	bne	s0,a5,e28 <main_menu+0x188>
     e80:	27ca0513          	addi	a0,s4,636
     e84:	00000097          	auipc	ra,0x0
     e88:	d88080e7          	jalr	-632(ra) # c0c <not_implemented>
     e8c:	f9dff06f          	j	e28 <main_menu+0x188>

00000e90 <main>:
     e90:	000057b7          	lui	a5,0x5
     e94:	1c47a783          	lw	a5,452(a5) # 51c4 <LEDS>
     e98:	ff010113          	addi	sp,sp,-16
     e9c:	00112623          	sw	ra,12(sp)
     ea0:	00812423          	sw	s0,8(sp)
     ea4:	0007a023          	sw	zero,0(a5)
     ea8:	000027b7          	lui	a5,0x2
     eac:	94078793          	addi	a5,a5,-1728 # 1940 <display_putchar>
     eb0:	00005737          	lui	a4,0x5
     eb4:	72f72c23          	sw	a5,1848(a4) # 5738 <f_putchar>
     eb8:	00001097          	auipc	ra,0x1
     ebc:	934080e7          	jalr	-1740(ra) # 17ec <oled_init>
     ec0:	00001097          	auipc	ra,0x1
     ec4:	938080e7          	jalr	-1736(ra) # 17f8 <oled_fullscreen>
     ec8:	00001097          	auipc	ra,0x1
     ecc:	a44080e7          	jalr	-1468(ra) # 190c <display_framebuffer>
     ed0:	00004637          	lui	a2,0x4
     ed4:	00000593          	li	a1,0
     ed8:	00000097          	auipc	ra,0x0
     edc:	714080e7          	jalr	1812(ra) # 15ec <memset>
     ee0:	00001097          	auipc	ra,0x1
     ee4:	ba8080e7          	jalr	-1112(ra) # 1a88 <display_refresh>
     ee8:	00000097          	auipc	ra,0x0
     eec:	4a4080e7          	jalr	1188(ra) # 138c <sdcard_init>
     ef0:	00001097          	auipc	ra,0x1
     ef4:	2d4080e7          	jalr	724(ra) # 21c4 <fl_init>
     ef8:	00000593          	li	a1,0
     efc:	00000513          	li	a0,0
     f00:	00001097          	auipc	ra,0x1
     f04:	a18080e7          	jalr	-1512(ra) # 1918 <display_set_cursor>
     f08:	00000593          	li	a1,0
     f0c:	0ff00513          	li	a0,255
     f10:	00001097          	auipc	ra,0x1
     f14:	a1c080e7          	jalr	-1508(ra) # 192c <display_set_front_back_color>
     f18:	00005537          	lui	a0,0x5
     f1c:	2c050513          	addi	a0,a0,704 # 52c0 <LEDS+0xfc>
     f20:	00001097          	auipc	ra,0x1
     f24:	cd4080e7          	jalr	-812(ra) # 1bf4 <printf>
     f28:	00001097          	auipc	ra,0x1
     f2c:	b60080e7          	jalr	-1184(ra) # 1a88 <display_refresh>
     f30:	000015b7          	lui	a1,0x1
     f34:	000017b7          	lui	a5,0x1
     f38:	53058593          	addi	a1,a1,1328 # 1530 <sdcard_writesector>
     f3c:	4dc78413          	addi	s0,a5,1244 # 14dc <sdcard_readsector>
     f40:	00040513          	mv	a0,s0
     f44:	00002097          	auipc	ra,0x2
     f48:	1e0080e7          	jalr	480(ra) # 3124 <fl_attach_media>
     f4c:	000017b7          	lui	a5,0x1
     f50:	53078593          	addi	a1,a5,1328 # 1530 <sdcard_writesector>
     f54:	fe0516e3          	bnez	a0,f40 <main+0xb0>
     f58:	00000097          	auipc	ra,0x0
     f5c:	d48080e7          	jalr	-696(ra) # ca0 <main_menu>

00000f60 <pause>:
     f60:	c0002773          	rdcycle	a4
     f64:	c00027f3          	rdcycle	a5
     f68:	40e787b3          	sub	a5,a5,a4
     f6c:	fea7ece3          	bltu	a5,a0,f64 <pause+0x4>
     f70:	00008067          	ret

00000f74 <sdcard_idle>:
     f74:	00008067          	ret

00000f78 <sdcard_select>:
     f78:	000057b7          	lui	a5,0x5
     f7c:	1b87a783          	lw	a5,440(a5) # 51b8 <SDCARD>
     f80:	00200713          	li	a4,2
     f84:	00e7a023          	sw	a4,0(a5)
     f88:	00008067          	ret

00000f8c <sdcard_ponder>:
     f8c:	000056b7          	lui	a3,0x5
     f90:	1b86a683          	lw	a3,440(a3) # 51b8 <SDCARD>
     f94:	01000793          	li	a5,16
     f98:	00000713          	li	a4,0
     f9c:	00676613          	ori	a2,a4,6
     fa0:	00c6a023          	sw	a2,0(a3)
     fa4:	00174713          	xori	a4,a4,1
     fa8:	00000013          	nop
     fac:	fff78793          	addi	a5,a5,-1
     fb0:	fe0796e3          	bnez	a5,f9c <sdcard_ponder+0x10>
     fb4:	00008067          	ret

00000fb8 <sdcard_unselect>:
     fb8:	000057b7          	lui	a5,0x5
     fbc:	1b87a783          	lw	a5,440(a5) # 51b8 <SDCARD>
     fc0:	00600713          	li	a4,6
     fc4:	00e7a023          	sw	a4,0(a5)
     fc8:	00008067          	ret

00000fcc <sdcard_send>:
     fcc:	000057b7          	lui	a5,0x5
     fd0:	1b87a783          	lw	a5,440(a5) # 51b8 <SDCARD>
     fd4:	00655713          	srli	a4,a0,0x6
     fd8:	00277713          	andi	a4,a4,2
     fdc:	00e7a023          	sw	a4,0(a5)
     fe0:	00176713          	ori	a4,a4,1
     fe4:	00e7a023          	sw	a4,0(a5)
     fe8:	00555713          	srli	a4,a0,0x5
     fec:	00277713          	andi	a4,a4,2
     ff0:	00e7a023          	sw	a4,0(a5)
     ff4:	00176713          	ori	a4,a4,1
     ff8:	00e7a023          	sw	a4,0(a5)
     ffc:	00455713          	srli	a4,a0,0x4
    1000:	00277713          	andi	a4,a4,2
    1004:	00e7a023          	sw	a4,0(a5)
    1008:	00176713          	ori	a4,a4,1
    100c:	00e7a023          	sw	a4,0(a5)
    1010:	00355713          	srli	a4,a0,0x3
    1014:	00277713          	andi	a4,a4,2
    1018:	00e7a023          	sw	a4,0(a5)
    101c:	00176713          	ori	a4,a4,1
    1020:	00e7a023          	sw	a4,0(a5)
    1024:	00255713          	srli	a4,a0,0x2
    1028:	00277713          	andi	a4,a4,2
    102c:	00e7a023          	sw	a4,0(a5)
    1030:	00176713          	ori	a4,a4,1
    1034:	00e7a023          	sw	a4,0(a5)
    1038:	00155713          	srli	a4,a0,0x1
    103c:	00277713          	andi	a4,a4,2
    1040:	00e7a023          	sw	a4,0(a5)
    1044:	00176713          	ori	a4,a4,1
    1048:	00e7a023          	sw	a4,0(a5)
    104c:	00257713          	andi	a4,a0,2
    1050:	00e7a023          	sw	a4,0(a5)
    1054:	00151513          	slli	a0,a0,0x1
    1058:	00176713          	ori	a4,a4,1
    105c:	00e7a023          	sw	a4,0(a5)
    1060:	00257513          	andi	a0,a0,2
    1064:	00a7a023          	sw	a0,0(a5)
    1068:	00156513          	ori	a0,a0,1
    106c:	00a7a023          	sw	a0,0(a5)
    1070:	00200713          	li	a4,2
    1074:	00e7a023          	sw	a4,0(a5)
    1078:	000057b7          	lui	a5,0x5
    107c:	7287a783          	lw	a5,1832(a5) # 5728 <sdcard_while_loading_callback>
    1080:	00078067          	jr	a5

00001084 <sdcard_read>:
    1084:	fd010113          	addi	sp,sp,-48
    1088:	fff50793          	addi	a5,a0,-1
    108c:	03212023          	sw	s2,32(sp)
    1090:	00100913          	li	s2,1
    1094:	00f91933          	sll	s2,s2,a5
    1098:	000057b7          	lui	a5,0x5
    109c:	01312e23          	sw	s3,28(sp)
    10a0:	1b87a983          	lw	s3,440(a5) # 51b8 <SDCARD>
    10a4:	02812423          	sw	s0,40(sp)
    10a8:	02912223          	sw	s1,36(sp)
    10ac:	01412c23          	sw	s4,24(sp)
    10b0:	01512a23          	sw	s5,20(sp)
    10b4:	01612823          	sw	s6,16(sp)
    10b8:	02112623          	sw	ra,44(sp)
    10bc:	0ff00413          	li	s0,255
    10c0:	00000493          	li	s1,0
    10c4:	00300a13          	li	s4,3
    10c8:	00200a93          	li	s5,2
    10cc:	00005b37          	lui	s6,0x5
    10d0:	02058c63          	beqz	a1,1108 <sdcard_read+0x84>
    10d4:	012477b3          	and	a5,s0,s2
    10d8:	02079a63          	bnez	a5,110c <sdcard_read+0x88>
    10dc:	02c12083          	lw	ra,44(sp)
    10e0:	0ff47513          	zext.b	a0,s0
    10e4:	02812403          	lw	s0,40(sp)
    10e8:	02412483          	lw	s1,36(sp)
    10ec:	02012903          	lw	s2,32(sp)
    10f0:	01c12983          	lw	s3,28(sp)
    10f4:	01812a03          	lw	s4,24(sp)
    10f8:	01412a83          	lw	s5,20(sp)
    10fc:	01012b03          	lw	s6,16(sp)
    1100:	03010113          	addi	sp,sp,48
    1104:	00008067          	ret
    1108:	fca4dae3          	bge	s1,a0,10dc <sdcard_read+0x58>
    110c:	0149a023          	sw	s4,0(s3)
    1110:	0159a023          	sw	s5,0(s3)
    1114:	0009a783          	lw	a5,0(s3)
    1118:	00141413          	slli	s0,s0,0x1
    111c:	00b12623          	sw	a1,12(sp)
    1120:	00f46433          	or	s0,s0,a5
    1124:	728b2783          	lw	a5,1832(s6) # 5728 <sdcard_while_loading_callback>
    1128:	00a12423          	sw	a0,8(sp)
    112c:	00148493          	addi	s1,s1,1
    1130:	000780e7          	jalr	a5
    1134:	00c12583          	lw	a1,12(sp)
    1138:	00812503          	lw	a0,8(sp)
    113c:	f95ff06f          	j	10d0 <sdcard_read+0x4c>

00001140 <sdcard_get>:
    1140:	fe010113          	addi	sp,sp,-32
    1144:	00112e23          	sw	ra,28(sp)
    1148:	00812c23          	sw	s0,24(sp)
    114c:	00912a23          	sw	s1,20(sp)
    1150:	00050413          	mv	s0,a0
    1154:	00b12623          	sw	a1,12(sp)
    1158:	00000097          	auipc	ra,0x0
    115c:	e20080e7          	jalr	-480(ra) # f78 <sdcard_select>
    1160:	00c12583          	lw	a1,12(sp)
    1164:	00040513          	mv	a0,s0
    1168:	00100493          	li	s1,1
    116c:	00000097          	auipc	ra,0x0
    1170:	f18080e7          	jalr	-232(ra) # 1084 <sdcard_read>
    1174:	00345413          	srli	s0,s0,0x3
    1178:	0284c463          	blt	s1,s0,11a0 <sdcard_get+0x60>
    117c:	00a12623          	sw	a0,12(sp)
    1180:	00000097          	auipc	ra,0x0
    1184:	e38080e7          	jalr	-456(ra) # fb8 <sdcard_unselect>
    1188:	01c12083          	lw	ra,28(sp)
    118c:	01812403          	lw	s0,24(sp)
    1190:	00c12503          	lw	a0,12(sp)
    1194:	01412483          	lw	s1,20(sp)
    1198:	02010113          	addi	sp,sp,32
    119c:	00008067          	ret
    11a0:	00000593          	li	a1,0
    11a4:	00800513          	li	a0,8
    11a8:	00000097          	auipc	ra,0x0
    11ac:	edc080e7          	jalr	-292(ra) # 1084 <sdcard_read>
    11b0:	00148493          	addi	s1,s1,1
    11b4:	fc5ff06f          	j	1178 <sdcard_get+0x38>

000011b8 <sdcard_cmd>:
    11b8:	ff010113          	addi	sp,sp,-16
    11bc:	00812423          	sw	s0,8(sp)
    11c0:	00912223          	sw	s1,4(sp)
    11c4:	01212023          	sw	s2,0(sp)
    11c8:	00112623          	sw	ra,12(sp)
    11cc:	00050913          	mv	s2,a0
    11d0:	00000413          	li	s0,0
    11d4:	00000097          	auipc	ra,0x0
    11d8:	da4080e7          	jalr	-604(ra) # f78 <sdcard_select>
    11dc:	00600493          	li	s1,6
    11e0:	008907b3          	add	a5,s2,s0
    11e4:	0007c503          	lbu	a0,0(a5)
    11e8:	00140413          	addi	s0,s0,1
    11ec:	00000097          	auipc	ra,0x0
    11f0:	de0080e7          	jalr	-544(ra) # fcc <sdcard_send>
    11f4:	fe9416e3          	bne	s0,s1,11e0 <sdcard_cmd+0x28>
    11f8:	00812403          	lw	s0,8(sp)
    11fc:	00c12083          	lw	ra,12(sp)
    1200:	00412483          	lw	s1,4(sp)
    1204:	00012903          	lw	s2,0(sp)
    1208:	01010113          	addi	sp,sp,16
    120c:	00000317          	auipc	t1,0x0
    1210:	dac30067          	jr	-596(t1) # fb8 <sdcard_unselect>

00001214 <sdcard_start_sector>:
    1214:	ff010113          	addi	sp,sp,-16
    1218:	00112623          	sw	ra,12(sp)
    121c:	00812423          	sw	s0,8(sp)
    1220:	00050413          	mv	s0,a0
    1224:	00000097          	auipc	ra,0x0
    1228:	d54080e7          	jalr	-684(ra) # f78 <sdcard_select>
    122c:	05100513          	li	a0,81
    1230:	00000097          	auipc	ra,0x0
    1234:	d9c080e7          	jalr	-612(ra) # fcc <sdcard_send>
    1238:	01845513          	srli	a0,s0,0x18
    123c:	00000097          	auipc	ra,0x0
    1240:	d90080e7          	jalr	-624(ra) # fcc <sdcard_send>
    1244:	41045513          	srai	a0,s0,0x10
    1248:	0ff57513          	zext.b	a0,a0
    124c:	00000097          	auipc	ra,0x0
    1250:	d80080e7          	jalr	-640(ra) # fcc <sdcard_send>
    1254:	40845513          	srai	a0,s0,0x8
    1258:	0ff57513          	zext.b	a0,a0
    125c:	00000097          	auipc	ra,0x0
    1260:	d70080e7          	jalr	-656(ra) # fcc <sdcard_send>
    1264:	0ff47513          	zext.b	a0,s0
    1268:	00000097          	auipc	ra,0x0
    126c:	d64080e7          	jalr	-668(ra) # fcc <sdcard_send>
    1270:	05500513          	li	a0,85
    1274:	00000097          	auipc	ra,0x0
    1278:	d58080e7          	jalr	-680(ra) # fcc <sdcard_send>
    127c:	00000097          	auipc	ra,0x0
    1280:	d3c080e7          	jalr	-708(ra) # fb8 <sdcard_unselect>
    1284:	00812403          	lw	s0,8(sp)
    1288:	00c12083          	lw	ra,12(sp)
    128c:	00100593          	li	a1,1
    1290:	00800513          	li	a0,8
    1294:	01010113          	addi	sp,sp,16
    1298:	00000317          	auipc	t1,0x0
    129c:	ea830067          	jr	-344(t1) # 1140 <sdcard_get>

000012a0 <sdcard_read_sector>:
    12a0:	ff010113          	addi	sp,sp,-16
    12a4:	00812423          	sw	s0,8(sp)
    12a8:	00112623          	sw	ra,12(sp)
    12ac:	00912223          	sw	s1,4(sp)
    12b0:	01212023          	sw	s2,0(sp)
    12b4:	00058413          	mv	s0,a1
    12b8:	00000097          	auipc	ra,0x0
    12bc:	f5c080e7          	jalr	-164(ra) # 1214 <sdcard_start_sector>
    12c0:	04051863          	bnez	a0,1310 <sdcard_read_sector+0x70>
    12c4:	00100593          	li	a1,1
    12c8:	00058513          	mv	a0,a1
    12cc:	00000097          	auipc	ra,0x0
    12d0:	e74080e7          	jalr	-396(ra) # 1140 <sdcard_get>
    12d4:	00000493          	li	s1,0
    12d8:	20000913          	li	s2,512
    12dc:	00000593          	li	a1,0
    12e0:	00800513          	li	a0,8
    12e4:	00000097          	auipc	ra,0x0
    12e8:	e5c080e7          	jalr	-420(ra) # 1140 <sdcard_get>
    12ec:	009407b3          	add	a5,s0,s1
    12f0:	00a78023          	sb	a0,0(a5)
    12f4:	00148493          	addi	s1,s1,1
    12f8:	ff2492e3          	bne	s1,s2,12dc <sdcard_read_sector+0x3c>
    12fc:	00100593          	li	a1,1
    1300:	01000513          	li	a0,16
    1304:	20040413          	addi	s0,s0,512
    1308:	00000097          	auipc	ra,0x0
    130c:	e38080e7          	jalr	-456(ra) # 1140 <sdcard_get>
    1310:	00c12083          	lw	ra,12(sp)
    1314:	00040513          	mv	a0,s0
    1318:	00812403          	lw	s0,8(sp)
    131c:	00412483          	lw	s1,4(sp)
    1320:	00012903          	lw	s2,0(sp)
    1324:	01010113          	addi	sp,sp,16
    1328:	00008067          	ret

0000132c <sdcard_preinit>:
    132c:	ff010113          	addi	sp,sp,-16
    1330:	000057b7          	lui	a5,0x5
    1334:	00812423          	sw	s0,8(sp)
    1338:	1b87a403          	lw	s0,440(a5) # 51b8 <SDCARD>
    133c:	00112623          	sw	ra,12(sp)
    1340:	00600793          	li	a5,6
    1344:	01313537          	lui	a0,0x1313
    1348:	00f42023          	sw	a5,0(s0)
    134c:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
    1350:	00000097          	auipc	ra,0x0
    1354:	c10080e7          	jalr	-1008(ra) # f60 <pause>
    1358:	0a000793          	li	a5,160
    135c:	00000713          	li	a4,0
    1360:	00676693          	ori	a3,a4,6
    1364:	00d42023          	sw	a3,0(s0)
    1368:	fff78793          	addi	a5,a5,-1
    136c:	00174713          	xori	a4,a4,1
    1370:	fe0798e3          	bnez	a5,1360 <sdcard_preinit+0x34>
    1374:	00600793          	li	a5,6
    1378:	00c12083          	lw	ra,12(sp)
    137c:	00f42023          	sw	a5,0(s0)
    1380:	00812403          	lw	s0,8(sp)
    1384:	01010113          	addi	sp,sp,16
    1388:	00008067          	ret

0000138c <sdcard_init>:
    138c:	000017b7          	lui	a5,0x1
    1390:	f7478793          	addi	a5,a5,-140 # f74 <sdcard_idle>
    1394:	00005737          	lui	a4,0x5
    1398:	fe010113          	addi	sp,sp,-32
    139c:	72f72423          	sw	a5,1832(a4) # 5728 <sdcard_while_loading_callback>
    13a0:	000057b7          	lui	a5,0x5
    13a4:	00812c23          	sw	s0,24(sp)
    13a8:	00912a23          	sw	s1,20(sp)
    13ac:	00112e23          	sw	ra,28(sp)
    13b0:	1a478493          	addi	s1,a5,420 # 51a4 <cmd0>
    13b4:	0ff00413          	li	s0,255
    13b8:	00000097          	auipc	ra,0x0
    13bc:	f74080e7          	jalr	-140(ra) # 132c <sdcard_preinit>
    13c0:	00048513          	mv	a0,s1
    13c4:	00000097          	auipc	ra,0x0
    13c8:	df4080e7          	jalr	-524(ra) # 11b8 <sdcard_cmd>
    13cc:	00100593          	li	a1,1
    13d0:	00800513          	li	a0,8
    13d4:	00000097          	auipc	ra,0x0
    13d8:	d6c080e7          	jalr	-660(ra) # 1140 <sdcard_get>
    13dc:	00a12623          	sw	a0,12(sp)
    13e0:	00000097          	auipc	ra,0x0
    13e4:	bac080e7          	jalr	-1108(ra) # f8c <sdcard_ponder>
    13e8:	00c12503          	lw	a0,12(sp)
    13ec:	00851c63          	bne	a0,s0,1404 <sdcard_init+0x78>
    13f0:	01313537          	lui	a0,0x1313
    13f4:	d0050513          	addi	a0,a0,-768 # 1312d00 <__stacktop+0x1302d00>
    13f8:	00000097          	auipc	ra,0x0
    13fc:	b68080e7          	jalr	-1176(ra) # f60 <pause>
    1400:	fb9ff06f          	j	13b8 <sdcard_init+0x2c>
    1404:	00005537          	lui	a0,0x5
    1408:	19c50513          	addi	a0,a0,412 # 519c <cmd8>
    140c:	00000097          	auipc	ra,0x0
    1410:	dac080e7          	jalr	-596(ra) # 11b8 <sdcard_cmd>
    1414:	00100593          	li	a1,1
    1418:	02800513          	li	a0,40
    141c:	00000097          	auipc	ra,0x0
    1420:	d24080e7          	jalr	-732(ra) # 1140 <sdcard_get>
    1424:	00000097          	auipc	ra,0x0
    1428:	b68080e7          	jalr	-1176(ra) # f8c <sdcard_ponder>
    142c:	000057b7          	lui	a5,0x5
    1430:	19478413          	addi	s0,a5,404 # 5194 <cmd55>
    1434:	000057b7          	lui	a5,0x5
    1438:	18c78493          	addi	s1,a5,396 # 518c <acmd41>
    143c:	00040513          	mv	a0,s0
    1440:	00000097          	auipc	ra,0x0
    1444:	d78080e7          	jalr	-648(ra) # 11b8 <sdcard_cmd>
    1448:	00100593          	li	a1,1
    144c:	00800513          	li	a0,8
    1450:	00000097          	auipc	ra,0x0
    1454:	cf0080e7          	jalr	-784(ra) # 1140 <sdcard_get>
    1458:	00000097          	auipc	ra,0x0
    145c:	b34080e7          	jalr	-1228(ra) # f8c <sdcard_ponder>
    1460:	00048513          	mv	a0,s1
    1464:	00000097          	auipc	ra,0x0
    1468:	d54080e7          	jalr	-684(ra) # 11b8 <sdcard_cmd>
    146c:	00100593          	li	a1,1
    1470:	00800513          	li	a0,8
    1474:	00000097          	auipc	ra,0x0
    1478:	ccc080e7          	jalr	-820(ra) # 1140 <sdcard_get>
    147c:	00a12623          	sw	a0,12(sp)
    1480:	00000097          	auipc	ra,0x0
    1484:	b0c080e7          	jalr	-1268(ra) # f8c <sdcard_ponder>
    1488:	00c12503          	lw	a0,12(sp)
    148c:	00050c63          	beqz	a0,14a4 <sdcard_init+0x118>
    1490:	001e8537          	lui	a0,0x1e8
    1494:	48050513          	addi	a0,a0,1152 # 1e8480 <__stacktop+0x1d8480>
    1498:	00000097          	auipc	ra,0x0
    149c:	ac8080e7          	jalr	-1336(ra) # f60 <pause>
    14a0:	f9dff06f          	j	143c <sdcard_init+0xb0>
    14a4:	00005537          	lui	a0,0x5
    14a8:	18450513          	addi	a0,a0,388 # 5184 <cmd16>
    14ac:	00000097          	auipc	ra,0x0
    14b0:	d0c080e7          	jalr	-756(ra) # 11b8 <sdcard_cmd>
    14b4:	00100593          	li	a1,1
    14b8:	00800513          	li	a0,8
    14bc:	00000097          	auipc	ra,0x0
    14c0:	c84080e7          	jalr	-892(ra) # 1140 <sdcard_get>
    14c4:	01812403          	lw	s0,24(sp)
    14c8:	01c12083          	lw	ra,28(sp)
    14cc:	01412483          	lw	s1,20(sp)
    14d0:	02010113          	addi	sp,sp,32
    14d4:	00000317          	auipc	t1,0x0
    14d8:	ab830067          	jr	-1352(t1) # f8c <sdcard_ponder>

000014dc <sdcard_readsector>:
    14dc:	04060663          	beqz	a2,1528 <sdcard_readsector+0x4c>
    14e0:	ff010113          	addi	sp,sp,-16
    14e4:	00812423          	sw	s0,8(sp)
    14e8:	00912223          	sw	s1,4(sp)
    14ec:	00112623          	sw	ra,12(sp)
    14f0:	00050413          	mv	s0,a0
    14f4:	00a604b3          	add	s1,a2,a0
    14f8:	00040513          	mv	a0,s0
    14fc:	00000097          	auipc	ra,0x0
    1500:	da4080e7          	jalr	-604(ra) # 12a0 <sdcard_read_sector>
    1504:	00140413          	addi	s0,s0,1
    1508:	00050593          	mv	a1,a0
    150c:	fe9416e3          	bne	s0,s1,14f8 <sdcard_readsector+0x1c>
    1510:	00c12083          	lw	ra,12(sp)
    1514:	00812403          	lw	s0,8(sp)
    1518:	00412483          	lw	s1,4(sp)
    151c:	00100513          	li	a0,1
    1520:	01010113          	addi	sp,sp,16
    1524:	00008067          	ret
    1528:	00000513          	li	a0,0
    152c:	00008067          	ret

00001530 <sdcard_writesector>:
    1530:	00000513          	li	a0,0
    1534:	00008067          	ret

00001538 <__divsi3>:
    1538:	06054063          	bltz	a0,1598 <__umodsi3+0x10>
    153c:	0605c663          	bltz	a1,15a8 <__umodsi3+0x20>

00001540 <__udivsi3>:
    1540:	00058613          	mv	a2,a1
    1544:	00050593          	mv	a1,a0
    1548:	fff00513          	li	a0,-1
    154c:	02060c63          	beqz	a2,1584 <__udivsi3+0x44>
    1550:	00100693          	li	a3,1
    1554:	00b67a63          	bgeu	a2,a1,1568 <__udivsi3+0x28>
    1558:	00c05863          	blez	a2,1568 <__udivsi3+0x28>
    155c:	00161613          	slli	a2,a2,0x1
    1560:	00169693          	slli	a3,a3,0x1
    1564:	feb66ae3          	bltu	a2,a1,1558 <__udivsi3+0x18>
    1568:	00000513          	li	a0,0
    156c:	00c5e663          	bltu	a1,a2,1578 <__udivsi3+0x38>
    1570:	40c585b3          	sub	a1,a1,a2
    1574:	00d56533          	or	a0,a0,a3
    1578:	0016d693          	srli	a3,a3,0x1
    157c:	00165613          	srli	a2,a2,0x1
    1580:	fe0696e3          	bnez	a3,156c <__udivsi3+0x2c>
    1584:	00008067          	ret

00001588 <__umodsi3>:
    1588:	00008293          	mv	t0,ra
    158c:	fb5ff0ef          	jal	1540 <__udivsi3>
    1590:	00058513          	mv	a0,a1
    1594:	00028067          	jr	t0
    1598:	40a00533          	neg	a0,a0
    159c:	0005d863          	bgez	a1,15ac <__umodsi3+0x24>
    15a0:	40b005b3          	neg	a1,a1
    15a4:	f95ff06f          	j	1538 <__divsi3>
    15a8:	40b005b3          	neg	a1,a1
    15ac:	00008293          	mv	t0,ra
    15b0:	f89ff0ef          	jal	1538 <__divsi3>
    15b4:	40a00533          	neg	a0,a0
    15b8:	00028067          	jr	t0

000015bc <__modsi3>:
    15bc:	00008293          	mv	t0,ra
    15c0:	0005ca63          	bltz	a1,15d4 <__modsi3+0x18>
    15c4:	00054c63          	bltz	a0,15dc <__modsi3+0x20>
    15c8:	f79ff0ef          	jal	1540 <__udivsi3>
    15cc:	00058513          	mv	a0,a1
    15d0:	00028067          	jr	t0
    15d4:	40b005b3          	neg	a1,a1
    15d8:	fe0558e3          	bgez	a0,15c8 <__modsi3+0xc>
    15dc:	40a00533          	neg	a0,a0
    15e0:	f61ff0ef          	jal	1540 <__udivsi3>
    15e4:	40b00533          	neg	a0,a1
    15e8:	00028067          	jr	t0

000015ec <memset>:
    15ec:	00c50633          	add	a2,a0,a2
    15f0:	00050793          	mv	a5,a0
    15f4:	00c79463          	bne	a5,a2,15fc <memset+0x10>
    15f8:	00008067          	ret
    15fc:	00178793          	addi	a5,a5,1
    1600:	feb78fa3          	sb	a1,-1(a5)
    1604:	ff1ff06f          	j	15f4 <memset+0x8>

00001608 <memcpy>:
    1608:	00000793          	li	a5,0
    160c:	00c79463          	bne	a5,a2,1614 <memcpy+0xc>
    1610:	00008067          	ret
    1614:	00f58733          	add	a4,a1,a5
    1618:	00074683          	lbu	a3,0(a4)
    161c:	00f50733          	add	a4,a0,a5
    1620:	00178793          	addi	a5,a5,1
    1624:	00d70023          	sb	a3,0(a4)
    1628:	fe5ff06f          	j	160c <memcpy+0x4>

0000162c <strlen>:
    162c:	00000793          	li	a5,0
    1630:	00f50733          	add	a4,a0,a5
    1634:	00074703          	lbu	a4,0(a4)
    1638:	00071663          	bnez	a4,1644 <strlen+0x18>
    163c:	00078513          	mv	a0,a5
    1640:	00008067          	ret
    1644:	00178793          	addi	a5,a5,1
    1648:	fe9ff06f          	j	1630 <strlen+0x4>

0000164c <strncmp>:
    164c:	00000793          	li	a5,0
    1650:	00c79663          	bne	a5,a2,165c <strncmp+0x10>
    1654:	00000513          	li	a0,0
    1658:	00008067          	ret
    165c:	00f50733          	add	a4,a0,a5
    1660:	00074683          	lbu	a3,0(a4)
    1664:	00f58733          	add	a4,a1,a5
    1668:	00074703          	lbu	a4,0(a4)
    166c:	00e6e863          	bltu	a3,a4,167c <strncmp+0x30>
    1670:	00d76a63          	bltu	a4,a3,1684 <strncmp+0x38>
    1674:	00178793          	addi	a5,a5,1
    1678:	fd9ff06f          	j	1650 <strncmp+0x4>
    167c:	fff00513          	li	a0,-1
    1680:	00008067          	ret
    1684:	00100513          	li	a0,1
    1688:	00008067          	ret

0000168c <strncpy>:
    168c:	00000793          	li	a5,0
    1690:	00c79463          	bne	a5,a2,1698 <strncpy+0xc>
    1694:	00008067          	ret
    1698:	00f58733          	add	a4,a1,a5
    169c:	00074683          	lbu	a3,0(a4)
    16a0:	00f50733          	add	a4,a0,a5
    16a4:	00178793          	addi	a5,a5,1
    16a8:	00d70023          	sb	a3,0(a4)
    16ac:	fe5ff06f          	j	1690 <strncpy+0x4>

000016b0 <strcpy>:
    16b0:	0005c783          	lbu	a5,0(a1)
    16b4:	00079663          	bnez	a5,16c0 <strcpy+0x10>
    16b8:	00050023          	sb	zero,0(a0)
    16bc:	00008067          	ret
    16c0:	00150513          	addi	a0,a0,1
    16c4:	00158593          	addi	a1,a1,1
    16c8:	fef50fa3          	sb	a5,-1(a0)
    16cc:	fe5ff06f          	j	16b0 <strcpy>

000016d0 <oled_wait>:
    16d0:	00000013          	nop
    16d4:	00000013          	nop
    16d8:	00000013          	nop
    16dc:	00000013          	nop
    16e0:	00000013          	nop
    16e4:	00000013          	nop
    16e8:	00000013          	nop
    16ec:	00008067          	ret

000016f0 <oled_init_mode>:
    16f0:	000057b7          	lui	a5,0x5
    16f4:	1bc7a703          	lw	a4,444(a5) # 51bc <OLED_RST>
    16f8:	fe010113          	addi	sp,sp,-32
    16fc:	00112e23          	sw	ra,28(sp)
    1700:	00812c23          	sw	s0,24(sp)
    1704:	00072023          	sw	zero,0(a4)
    1708:	00040737          	lui	a4,0x40
    170c:	00000013          	nop
    1710:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
    1714:	fe071ce3          	bnez	a4,170c <oled_init_mode+0x1c>
    1718:	1bc7a703          	lw	a4,444(a5)
    171c:	00100693          	li	a3,1
    1720:	00d72023          	sw	a3,0(a4)
    1724:	00040737          	lui	a4,0x40
    1728:	00000013          	nop
    172c:	fff70713          	addi	a4,a4,-1 # 3ffff <__stacktop+0x2ffff>
    1730:	fe071ce3          	bnez	a4,1728 <oled_init_mode+0x38>
    1734:	1bc7a783          	lw	a5,444(a5)
    1738:	0007a023          	sw	zero,0(a5)
    173c:	000407b7          	lui	a5,0x40
    1740:	00000013          	nop
    1744:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
    1748:	fe079ce3          	bnez	a5,1740 <oled_init_mode+0x50>
    174c:	00005737          	lui	a4,0x5
    1750:	1c072783          	lw	a5,448(a4) # 51c0 <OLED>
    1754:	2af00693          	li	a3,687
    1758:	00d7a023          	sw	a3,0(a5)
    175c:	000407b7          	lui	a5,0x40
    1760:	00000013          	nop
    1764:	fff78793          	addi	a5,a5,-1 # 3ffff <__stacktop+0x2ffff>
    1768:	fe079ce3          	bnez	a5,1760 <oled_init_mode+0x70>
    176c:	1c072403          	lw	s0,448(a4)
    1770:	2a000793          	li	a5,672
    1774:	00a12623          	sw	a0,12(sp)
    1778:	00f42023          	sw	a5,0(s0)
    177c:	00000097          	auipc	ra,0x0
    1780:	f54080e7          	jalr	-172(ra) # 16d0 <oled_wait>
    1784:	00c12503          	lw	a0,12(sp)
    1788:	4a000793          	li	a5,1184
    178c:	00050463          	beqz	a0,1794 <oled_init_mode+0xa4>
    1790:	42000793          	li	a5,1056
    1794:	00f42023          	sw	a5,0(s0)
    1798:	00000097          	auipc	ra,0x0
    179c:	f38080e7          	jalr	-200(ra) # 16d0 <oled_wait>
    17a0:	2fd00793          	li	a5,765
    17a4:	00f42023          	sw	a5,0(s0)
    17a8:	00000097          	auipc	ra,0x0
    17ac:	f28080e7          	jalr	-216(ra) # 16d0 <oled_wait>
    17b0:	4b100793          	li	a5,1201
    17b4:	00f42023          	sw	a5,0(s0)
    17b8:	00000097          	auipc	ra,0x0
    17bc:	f18080e7          	jalr	-232(ra) # 16d0 <oled_wait>
    17c0:	2a200793          	li	a5,674
    17c4:	00f42023          	sw	a5,0(s0)
    17c8:	00000097          	auipc	ra,0x0
    17cc:	f08080e7          	jalr	-248(ra) # 16d0 <oled_wait>
    17d0:	40000793          	li	a5,1024
    17d4:	00f42023          	sw	a5,0(s0)
    17d8:	01812403          	lw	s0,24(sp)
    17dc:	01c12083          	lw	ra,28(sp)
    17e0:	02010113          	addi	sp,sp,32
    17e4:	00000317          	auipc	t1,0x0
    17e8:	eec30067          	jr	-276(t1) # 16d0 <oled_wait>

000017ec <oled_init>:
    17ec:	00000513          	li	a0,0
    17f0:	00000317          	auipc	t1,0x0
    17f4:	f0030067          	jr	-256(t1) # 16f0 <oled_init_mode>

000017f8 <oled_fullscreen>:
    17f8:	ff010113          	addi	sp,sp,-16
    17fc:	000057b7          	lui	a5,0x5
    1800:	00812423          	sw	s0,8(sp)
    1804:	1c07a403          	lw	s0,448(a5) # 51c0 <OLED>
    1808:	00112623          	sw	ra,12(sp)
    180c:	00912223          	sw	s1,4(sp)
    1810:	01212023          	sw	s2,0(sp)
    1814:	21500793          	li	a5,533
    1818:	00f42023          	sw	a5,0(s0)
    181c:	40000913          	li	s2,1024
    1820:	00000097          	auipc	ra,0x0
    1824:	eb0080e7          	jalr	-336(ra) # 16d0 <oled_wait>
    1828:	47f00493          	li	s1,1151
    182c:	01242023          	sw	s2,0(s0)
    1830:	00000097          	auipc	ra,0x0
    1834:	ea0080e7          	jalr	-352(ra) # 16d0 <oled_wait>
    1838:	00942023          	sw	s1,0(s0)
    183c:	00000097          	auipc	ra,0x0
    1840:	e94080e7          	jalr	-364(ra) # 16d0 <oled_wait>
    1844:	27500793          	li	a5,629
    1848:	00f42023          	sw	a5,0(s0)
    184c:	00000097          	auipc	ra,0x0
    1850:	e84080e7          	jalr	-380(ra) # 16d0 <oled_wait>
    1854:	01242023          	sw	s2,0(s0)
    1858:	00000097          	auipc	ra,0x0
    185c:	e78080e7          	jalr	-392(ra) # 16d0 <oled_wait>
    1860:	00942023          	sw	s1,0(s0)
    1864:	00000097          	auipc	ra,0x0
    1868:	e6c080e7          	jalr	-404(ra) # 16d0 <oled_wait>
    186c:	25c00793          	li	a5,604
    1870:	00f42023          	sw	a5,0(s0)
    1874:	00812403          	lw	s0,8(sp)
    1878:	00c12083          	lw	ra,12(sp)
    187c:	00412483          	lw	s1,4(sp)
    1880:	00012903          	lw	s2,0(sp)
    1884:	01010113          	addi	sp,sp,16
    1888:	00000317          	auipc	t1,0x0
    188c:	e4830067          	jr	-440(t1) # 16d0 <oled_wait>

00001890 <oled_clear>:
    1890:	fe010113          	addi	sp,sp,-32
    1894:	000057b7          	lui	a5,0x5
    1898:	01312623          	sw	s3,12(sp)
    189c:	1c07a983          	lw	s3,448(a5) # 51c0 <OLED>
    18a0:	00812c23          	sw	s0,24(sp)
    18a4:	01212823          	sw	s2,16(sp)
    18a8:	00112e23          	sw	ra,28(sp)
    18ac:	00912a23          	sw	s1,20(sp)
    18b0:	08000913          	li	s2,128
    18b4:	40056413          	ori	s0,a0,1024
    18b8:	08000493          	li	s1,128
    18bc:	0089a023          	sw	s0,0(s3)
    18c0:	00000097          	auipc	ra,0x0
    18c4:	e10080e7          	jalr	-496(ra) # 16d0 <oled_wait>
    18c8:	0089a023          	sw	s0,0(s3)
    18cc:	00000097          	auipc	ra,0x0
    18d0:	e04080e7          	jalr	-508(ra) # 16d0 <oled_wait>
    18d4:	fff48493          	addi	s1,s1,-1
    18d8:	0089a023          	sw	s0,0(s3)
    18dc:	00000097          	auipc	ra,0x0
    18e0:	df4080e7          	jalr	-524(ra) # 16d0 <oled_wait>
    18e4:	fc049ce3          	bnez	s1,18bc <oled_clear+0x2c>
    18e8:	fff90913          	addi	s2,s2,-1
    18ec:	fc0916e3          	bnez	s2,18b8 <oled_clear+0x28>
    18f0:	01c12083          	lw	ra,28(sp)
    18f4:	01812403          	lw	s0,24(sp)
    18f8:	01412483          	lw	s1,20(sp)
    18fc:	01012903          	lw	s2,16(sp)
    1900:	00c12983          	lw	s3,12(sp)
    1904:	02010113          	addi	sp,sp,32
    1908:	00008067          	ret

0000190c <display_framebuffer>:
    190c:	000057b7          	lui	a5,0x5
    1910:	1b07a503          	lw	a0,432(a5) # 51b0 <DISPLAY>
    1914:	00008067          	ret

00001918 <display_set_cursor>:
    1918:	000057b7          	lui	a5,0x5
    191c:	72a7aa23          	sw	a0,1844(a5) # 5734 <cursor_x>
    1920:	000057b7          	lui	a5,0x5
    1924:	72b7a823          	sw	a1,1840(a5) # 5730 <cursor_y>
    1928:	00008067          	ret

0000192c <display_set_front_back_color>:
    192c:	000057b7          	lui	a5,0x5
    1930:	72a786a3          	sb	a0,1837(a5) # 572d <front_color>
    1934:	000057b7          	lui	a5,0x5
    1938:	72b78623          	sb	a1,1836(a5) # 572c <back_color>
    193c:	00008067          	ret

00001940 <display_putchar>:
    1940:	00a00793          	li	a5,10
    1944:	00005737          	lui	a4,0x5
    1948:	02f51663          	bne	a0,a5,1974 <display_putchar+0x34>
    194c:	72072a23          	sw	zero,1844(a4) # 5734 <cursor_x>
    1950:	00005737          	lui	a4,0x5
    1954:	73072783          	lw	a5,1840(a4) # 5730 <cursor_y>
    1958:	00878793          	addi	a5,a5,8
    195c:	72f72823          	sw	a5,1840(a4)
    1960:	07f00713          	li	a4,127
    1964:	00f75663          	bge	a4,a5,1970 <display_putchar+0x30>
    1968:	000057b7          	lui	a5,0x5
    196c:	7207a823          	sw	zero,1840(a5) # 5730 <cursor_y>
    1970:	00008067          	ret
    1974:	ff010113          	addi	sp,sp,-16
    1978:	00812623          	sw	s0,12(sp)
    197c:	01f00793          	li	a5,31
    1980:	0ca7d263          	bge	a5,a0,1a44 <display_putchar+0x104>
    1984:	00005e37          	lui	t3,0x5
    1988:	730e2783          	lw	a5,1840(t3) # 5730 <cursor_y>
    198c:	07800693          	li	a3,120
    1990:	00800593          	li	a1,8
    1994:	00f6d663          	bge	a3,a5,19a0 <display_putchar+0x60>
    1998:	08000593          	li	a1,128
    199c:	40f585b3          	sub	a1,a1,a5
    19a0:	73472783          	lw	a5,1844(a4)
    19a4:	07b00693          	li	a3,123
    19a8:	00500813          	li	a6,5
    19ac:	00f6d663          	bge	a3,a5,19b8 <display_putchar+0x78>
    19b0:	08000813          	li	a6,128
    19b4:	40f80833          	sub	a6,a6,a5
    19b8:	000057b7          	lui	a5,0x5
    19bc:	1b07a283          	lw	t0,432(a5) # 51b0 <DISPLAY>
    19c0:	000056b7          	lui	a3,0x5
    19c4:	00251793          	slli	a5,a0,0x2
    19c8:	31c68693          	addi	a3,a3,796 # 531c <font>
    19cc:	00a787b3          	add	a5,a5,a0
    19d0:	00d78533          	add	a0,a5,a3
    19d4:	00100f93          	li	t6,1
    19d8:	00000693          	li	a3,0
    19dc:	000053b7          	lui	t2,0x5
    19e0:	00005437          	lui	s0,0x5
    19e4:	06b6d063          	bge	a3,a1,1a44 <display_putchar+0x104>
    19e8:	00df9f33          	sll	t5,t6,a3
    19ec:	00050893          	mv	a7,a0
    19f0:	00000613          	li	a2,0
    19f4:	03c0006f          	j	1a30 <display_putchar+0xf0>
    19f8:	f608c783          	lbu	a5,-160(a7)
    19fc:	01e7f7b3          	and	a5,a5,t5
    1a00:	02078e63          	beqz	a5,1a3c <display_putchar+0xfc>
    1a04:	72d44e83          	lbu	t4,1837(s0) # 572d <front_color>
    1a08:	73472783          	lw	a5,1844(a4)
    1a0c:	730e2303          	lw	t1,1840(t3)
    1a10:	00188893          	addi	a7,a7,1
    1a14:	00f607b3          	add	a5,a2,a5
    1a18:	00779793          	slli	a5,a5,0x7
    1a1c:	00668333          	add	t1,a3,t1
    1a20:	006787b3          	add	a5,a5,t1
    1a24:	00f287b3          	add	a5,t0,a5
    1a28:	01d78023          	sb	t4,0(a5)
    1a2c:	00160613          	addi	a2,a2,1 # 4001 <fatfs_set_fs_info_next_free_cluster+0x19>
    1a30:	fd0644e3          	blt	a2,a6,19f8 <display_putchar+0xb8>
    1a34:	00168693          	addi	a3,a3,1
    1a38:	fadff06f          	j	19e4 <display_putchar+0xa4>
    1a3c:	72c3ce83          	lbu	t4,1836(t2) # 572c <back_color>
    1a40:	fc9ff06f          	j	1a08 <display_putchar+0xc8>
    1a44:	73472783          	lw	a5,1844(a4)
    1a48:	07f00693          	li	a3,127
    1a4c:	00578793          	addi	a5,a5,5
    1a50:	00f6c663          	blt	a3,a5,1a5c <display_putchar+0x11c>
    1a54:	72f72a23          	sw	a5,1844(a4)
    1a58:	0240006f          	j	1a7c <display_putchar+0x13c>
    1a5c:	72072a23          	sw	zero,1844(a4)
    1a60:	00005737          	lui	a4,0x5
    1a64:	73072783          	lw	a5,1840(a4) # 5730 <cursor_y>
    1a68:	00878793          	addi	a5,a5,8
    1a6c:	72f72823          	sw	a5,1840(a4)
    1a70:	00f6d663          	bge	a3,a5,1a7c <display_putchar+0x13c>
    1a74:	000057b7          	lui	a5,0x5
    1a78:	7207a823          	sw	zero,1840(a5) # 5730 <cursor_y>
    1a7c:	00c12403          	lw	s0,12(sp)
    1a80:	01010113          	addi	sp,sp,16
    1a84:	00008067          	ret

00001a88 <display_refresh>:
    1a88:	00008067          	ret

00001a8c <print_string>:
    1a8c:	ff010113          	addi	sp,sp,-16
    1a90:	00812423          	sw	s0,8(sp)
    1a94:	00912223          	sw	s1,4(sp)
    1a98:	00112623          	sw	ra,12(sp)
    1a9c:	00050413          	mv	s0,a0
    1aa0:	000054b7          	lui	s1,0x5
    1aa4:	00044503          	lbu	a0,0(s0)
    1aa8:	00051c63          	bnez	a0,1ac0 <print_string+0x34>
    1aac:	00c12083          	lw	ra,12(sp)
    1ab0:	00812403          	lw	s0,8(sp)
    1ab4:	00412483          	lw	s1,4(sp)
    1ab8:	01010113          	addi	sp,sp,16
    1abc:	00008067          	ret
    1ac0:	7384a783          	lw	a5,1848(s1) # 5738 <f_putchar>
    1ac4:	00140413          	addi	s0,s0,1
    1ac8:	000780e7          	jalr	a5
    1acc:	fd9ff06f          	j	1aa4 <print_string+0x18>

00001ad0 <print_dec>:
    1ad0:	ef010113          	addi	sp,sp,-272
    1ad4:	10812423          	sw	s0,264(sp)
    1ad8:	10912223          	sw	s1,260(sp)
    1adc:	10112623          	sw	ra,268(sp)
    1ae0:	11212023          	sw	s2,256(sp)
    1ae4:	00050413          	mv	s0,a0
    1ae8:	000054b7          	lui	s1,0x5
    1aec:	08045063          	bgez	s0,1b6c <print_dec+0x9c>
    1af0:	7384a783          	lw	a5,1848(s1) # 5738 <f_putchar>
    1af4:	02d00513          	li	a0,45
    1af8:	40800433          	neg	s0,s0
    1afc:	000780e7          	jalr	a5
    1b00:	fedff06f          	j	1aec <print_dec+0x1c>
    1b04:	00040513          	mv	a0,s0
    1b08:	00a00593          	li	a1,10
    1b0c:	00000097          	auipc	ra,0x0
    1b10:	a2c080e7          	jalr	-1492(ra) # 1538 <__divsi3>
    1b14:	00251793          	slli	a5,a0,0x2
    1b18:	00f507b3          	add	a5,a0,a5
    1b1c:	00179793          	slli	a5,a5,0x1
    1b20:	40f40433          	sub	s0,s0,a5
    1b24:	00148493          	addi	s1,s1,1
    1b28:	fe848fa3          	sb	s0,-1(s1)
    1b2c:	00050413          	mv	s0,a0
    1b30:	fc041ae3          	bnez	s0,1b04 <print_dec+0x34>
    1b34:	fd2488e3          	beq	s1,s2,1b04 <print_dec+0x34>
    1b38:	00005437          	lui	s0,0x5
    1b3c:	fff4c503          	lbu	a0,-1(s1)
    1b40:	73842783          	lw	a5,1848(s0) # 5738 <f_putchar>
    1b44:	fff48493          	addi	s1,s1,-1
    1b48:	03050513          	addi	a0,a0,48
    1b4c:	000780e7          	jalr	a5
    1b50:	ff2496e3          	bne	s1,s2,1b3c <print_dec+0x6c>
    1b54:	10c12083          	lw	ra,268(sp)
    1b58:	10812403          	lw	s0,264(sp)
    1b5c:	10412483          	lw	s1,260(sp)
    1b60:	10012903          	lw	s2,256(sp)
    1b64:	11010113          	addi	sp,sp,272
    1b68:	00008067          	ret
    1b6c:	00010493          	mv	s1,sp
    1b70:	00010913          	mv	s2,sp
    1b74:	fbdff06f          	j	1b30 <print_dec+0x60>

00001b78 <print_hex_digits>:
    1b78:	fe010113          	addi	sp,sp,-32
    1b7c:	00812c23          	sw	s0,24(sp)
    1b80:	00912a23          	sw	s1,20(sp)
    1b84:	fff58413          	addi	s0,a1,-1
    1b88:	000054b7          	lui	s1,0x5
    1b8c:	01212823          	sw	s2,16(sp)
    1b90:	01312623          	sw	s3,12(sp)
    1b94:	00112e23          	sw	ra,28(sp)
    1b98:	00050993          	mv	s3,a0
    1b9c:	00241413          	slli	s0,s0,0x2
    1ba0:	2d448493          	addi	s1,s1,724 # 52d4 <LEDS+0x110>
    1ba4:	00005937          	lui	s2,0x5
    1ba8:	02045063          	bgez	s0,1bc8 <print_hex_digits+0x50>
    1bac:	01c12083          	lw	ra,28(sp)
    1bb0:	01812403          	lw	s0,24(sp)
    1bb4:	01412483          	lw	s1,20(sp)
    1bb8:	01012903          	lw	s2,16(sp)
    1bbc:	00c12983          	lw	s3,12(sp)
    1bc0:	02010113          	addi	sp,sp,32
    1bc4:	00008067          	ret
    1bc8:	0089d7b3          	srl	a5,s3,s0
    1bcc:	00f7f793          	andi	a5,a5,15
    1bd0:	00f487b3          	add	a5,s1,a5
    1bd4:	73892703          	lw	a4,1848(s2) # 5738 <f_putchar>
    1bd8:	0007c503          	lbu	a0,0(a5)
    1bdc:	ffc40413          	addi	s0,s0,-4
    1be0:	000700e7          	jalr	a4
    1be4:	fc5ff06f          	j	1ba8 <print_hex_digits+0x30>

00001be8 <print_hex>:
    1be8:	00800593          	li	a1,8
    1bec:	00000317          	auipc	t1,0x0
    1bf0:	f8c30067          	jr	-116(t1) # 1b78 <print_hex_digits>

00001bf4 <printf>:
    1bf4:	fa010113          	addi	sp,sp,-96
    1bf8:	04f12a23          	sw	a5,84(sp)
    1bfc:	04410793          	addi	a5,sp,68
    1c00:	02812c23          	sw	s0,56(sp)
    1c04:	02912a23          	sw	s1,52(sp)
    1c08:	03212823          	sw	s2,48(sp)
    1c0c:	03312623          	sw	s3,44(sp)
    1c10:	03412423          	sw	s4,40(sp)
    1c14:	03512223          	sw	s5,36(sp)
    1c18:	03612023          	sw	s6,32(sp)
    1c1c:	02112e23          	sw	ra,60(sp)
    1c20:	01712e23          	sw	s7,28(sp)
    1c24:	00050413          	mv	s0,a0
    1c28:	04b12223          	sw	a1,68(sp)
    1c2c:	04c12423          	sw	a2,72(sp)
    1c30:	04d12623          	sw	a3,76(sp)
    1c34:	04e12823          	sw	a4,80(sp)
    1c38:	05012c23          	sw	a6,88(sp)
    1c3c:	05112e23          	sw	a7,92(sp)
    1c40:	00f12623          	sw	a5,12(sp)
    1c44:	02500913          	li	s2,37
    1c48:	000054b7          	lui	s1,0x5
    1c4c:	07300993          	li	s3,115
    1c50:	07800a13          	li	s4,120
    1c54:	06400a93          	li	s5,100
    1c58:	06300b13          	li	s6,99
    1c5c:	00044503          	lbu	a0,0(s0)
    1c60:	02051863          	bnez	a0,1c90 <printf+0x9c>
    1c64:	03c12083          	lw	ra,60(sp)
    1c68:	03812403          	lw	s0,56(sp)
    1c6c:	03412483          	lw	s1,52(sp)
    1c70:	03012903          	lw	s2,48(sp)
    1c74:	02c12983          	lw	s3,44(sp)
    1c78:	02812a03          	lw	s4,40(sp)
    1c7c:	02412a83          	lw	s5,36(sp)
    1c80:	02012b03          	lw	s6,32(sp)
    1c84:	01c12b83          	lw	s7,28(sp)
    1c88:	06010113          	addi	sp,sp,96
    1c8c:	00008067          	ret
    1c90:	09251a63          	bne	a0,s2,1d24 <printf+0x130>
    1c94:	00144503          	lbu	a0,1(s0)
    1c98:	00140b93          	addi	s7,s0,1
    1c9c:	03351463          	bne	a0,s3,1cc4 <printf+0xd0>
    1ca0:	00c12783          	lw	a5,12(sp)
    1ca4:	0007a503          	lw	a0,0(a5)
    1ca8:	00478713          	addi	a4,a5,4
    1cac:	00e12623          	sw	a4,12(sp)
    1cb0:	00000097          	auipc	ra,0x0
    1cb4:	ddc080e7          	jalr	-548(ra) # 1a8c <print_string>
    1cb8:	000b8413          	mv	s0,s7
    1cbc:	00140413          	addi	s0,s0,1
    1cc0:	f9dff06f          	j	1c5c <printf+0x68>
    1cc4:	03451063          	bne	a0,s4,1ce4 <printf+0xf0>
    1cc8:	00c12783          	lw	a5,12(sp)
    1ccc:	0007a503          	lw	a0,0(a5)
    1cd0:	00478713          	addi	a4,a5,4
    1cd4:	00e12623          	sw	a4,12(sp)
    1cd8:	00000097          	auipc	ra,0x0
    1cdc:	f10080e7          	jalr	-240(ra) # 1be8 <print_hex>
    1ce0:	fd9ff06f          	j	1cb8 <printf+0xc4>
    1ce4:	03551063          	bne	a0,s5,1d04 <printf+0x110>
    1ce8:	00c12783          	lw	a5,12(sp)
    1cec:	0007a503          	lw	a0,0(a5)
    1cf0:	00478713          	addi	a4,a5,4
    1cf4:	00e12623          	sw	a4,12(sp)
    1cf8:	00000097          	auipc	ra,0x0
    1cfc:	dd8080e7          	jalr	-552(ra) # 1ad0 <print_dec>
    1d00:	fb9ff06f          	j	1cb8 <printf+0xc4>
    1d04:	7384a783          	lw	a5,1848(s1) # 5738 <f_putchar>
    1d08:	01651a63          	bne	a0,s6,1d1c <printf+0x128>
    1d0c:	00c12703          	lw	a4,12(sp)
    1d10:	00072503          	lw	a0,0(a4)
    1d14:	00470693          	addi	a3,a4,4
    1d18:	00d12623          	sw	a3,12(sp)
    1d1c:	000780e7          	jalr	a5
    1d20:	f99ff06f          	j	1cb8 <printf+0xc4>
    1d24:	7384a783          	lw	a5,1848(s1)
    1d28:	000780e7          	jalr	a5
    1d2c:	f91ff06f          	j	1cbc <printf+0xc8>

00001d30 <__mulsi3>:
    1d30:	00050793          	mv	a5,a0
    1d34:	00000513          	li	a0,0
    1d38:	00079463          	bnez	a5,1d40 <__mulsi3+0x10>
    1d3c:	00008067          	ret
    1d40:	01f79693          	slli	a3,a5,0x1f
    1d44:	41f6d713          	srai	a4,a3,0x1f
    1d48:	00b77733          	and	a4,a4,a1
    1d4c:	00e50533          	add	a0,a0,a4
    1d50:	0017d793          	srli	a5,a5,0x1
    1d54:	00159593          	slli	a1,a1,0x1
    1d58:	fe1ff06f          	j	1d38 <__mulsi3+0x8>

00001d5c <fat_list_insert_last>:
    1d5c:	00452783          	lw	a5,4(a0)
    1d60:	04079263          	bnez	a5,1da4 <fat_list_insert_last+0x48>
    1d64:	00052783          	lw	a5,0(a0)
    1d68:	00079c63          	bnez	a5,1d80 <fat_list_insert_last+0x24>
    1d6c:	00b52023          	sw	a1,0(a0)
    1d70:	00b52223          	sw	a1,4(a0)
    1d74:	0005a023          	sw	zero,0(a1)
    1d78:	0005a223          	sw	zero,4(a1)
    1d7c:	00008067          	ret
    1d80:	0007a703          	lw	a4,0(a5)
    1d84:	00f5a223          	sw	a5,4(a1)
    1d88:	00e5a023          	sw	a4,0(a1)
    1d8c:	00071863          	bnez	a4,1d9c <fat_list_insert_last+0x40>
    1d90:	00b52023          	sw	a1,0(a0)
    1d94:	00b7a023          	sw	a1,0(a5)
    1d98:	00008067          	ret
    1d9c:	00b72223          	sw	a1,4(a4)
    1da0:	ff5ff06f          	j	1d94 <fat_list_insert_last+0x38>
    1da4:	0047a703          	lw	a4,4(a5)
    1da8:	00f5a023          	sw	a5,0(a1)
    1dac:	00e5a223          	sw	a4,4(a1)
    1db0:	00071863          	bnez	a4,1dc0 <fat_list_insert_last+0x64>
    1db4:	00b52223          	sw	a1,4(a0)
    1db8:	00b7a223          	sw	a1,4(a5)
    1dbc:	00008067          	ret
    1dc0:	00b72023          	sw	a1,0(a4)
    1dc4:	ff5ff06f          	j	1db8 <fat_list_insert_last+0x5c>

00001dc8 <FileString_StrCmpNoCase>:
    1dc8:	00050e93          	mv	t4,a0
    1dcc:	00000793          	li	a5,0
    1dd0:	01900e13          	li	t3,25
    1dd4:	00c79663          	bne	a5,a2,1de0 <FileString_StrCmpNoCase+0x18>
    1dd8:	00000513          	li	a0,0
    1ddc:	00008067          	ret
    1de0:	00fe8733          	add	a4,t4,a5
    1de4:	00074803          	lbu	a6,0(a4)
    1de8:	00f58733          	add	a4,a1,a5
    1dec:	00074883          	lbu	a7,0(a4)
    1df0:	fbf80713          	addi	a4,a6,-65
    1df4:	0ff77713          	zext.b	a4,a4
    1df8:	00080693          	mv	a3,a6
    1dfc:	00ee6663          	bltu	t3,a4,1e08 <FileString_StrCmpNoCase+0x40>
    1e00:	02080693          	addi	a3,a6,32
    1e04:	0ff6f693          	zext.b	a3,a3
    1e08:	fbf88313          	addi	t1,a7,-65
    1e0c:	0ff37313          	zext.b	t1,t1
    1e10:	00088713          	mv	a4,a7
    1e14:	006e6663          	bltu	t3,t1,1e20 <FileString_StrCmpNoCase+0x58>
    1e18:	02088713          	addi	a4,a7,32
    1e1c:	0ff77713          	zext.b	a4,a4
    1e20:	40e68533          	sub	a0,a3,a4
    1e24:	00e69863          	bne	a3,a4,1e34 <FileString_StrCmpNoCase+0x6c>
    1e28:	00178793          	addi	a5,a5,1
    1e2c:	00088463          	beqz	a7,1e34 <FileString_StrCmpNoCase+0x6c>
    1e30:	fa0812e3          	bnez	a6,1dd4 <FileString_StrCmpNoCase+0xc>
    1e34:	00008067          	ret

00001e38 <FileString_GetExtension>:
    1e38:	00050793          	mv	a5,a0
    1e3c:	fff00713          	li	a4,-1
    1e40:	02e00613          	li	a2,46
    1e44:	0007c683          	lbu	a3,0(a5)
    1e48:	00069663          	bnez	a3,1e54 <FileString_GetExtension+0x1c>
    1e4c:	00070513          	mv	a0,a4
    1e50:	00008067          	ret
    1e54:	00c69463          	bne	a3,a2,1e5c <FileString_GetExtension+0x24>
    1e58:	40a78733          	sub	a4,a5,a0
    1e5c:	00178793          	addi	a5,a5,1
    1e60:	fe5ff06f          	j	1e44 <FileString_GetExtension+0xc>

00001e64 <fatfs_fat_writeback>:
    1e64:	00059e63          	bnez	a1,1e80 <fatfs_fat_writeback+0x1c>
    1e68:	00000513          	li	a0,0
    1e6c:	00008067          	ret
    1e70:	00000513          	li	a0,0
    1e74:	01c12083          	lw	ra,28(sp)
    1e78:	02010113          	addi	sp,sp,32
    1e7c:	00008067          	ret
    1e80:	2045a783          	lw	a5,516(a1)
    1e84:	04078e63          	beqz	a5,1ee0 <fatfs_fat_writeback+0x7c>
    1e88:	03852683          	lw	a3,56(a0)
    1e8c:	00050793          	mv	a5,a0
    1e90:	04068663          	beqz	a3,1edc <fatfs_fat_writeback+0x78>
    1e94:	0147a703          	lw	a4,20(a5)
    1e98:	2005a503          	lw	a0,512(a1)
    1e9c:	0207a803          	lw	a6,32(a5)
    1ea0:	00100613          	li	a2,1
    1ea4:	fe010113          	addi	sp,sp,-32
    1ea8:	40e607b3          	sub	a5,a2,a4
    1eac:	00112e23          	sw	ra,28(sp)
    1eb0:	00a787b3          	add	a5,a5,a0
    1eb4:	00f87663          	bgeu	a6,a5,1ec0 <fatfs_fat_writeback+0x5c>
    1eb8:	01070733          	add	a4,a4,a6
    1ebc:	40a70633          	sub	a2,a4,a0
    1ec0:	00b12623          	sw	a1,12(sp)
    1ec4:	000680e7          	jalr	a3
    1ec8:	fa0504e3          	beqz	a0,1e70 <fatfs_fat_writeback+0xc>
    1ecc:	00c12583          	lw	a1,12(sp)
    1ed0:	00100513          	li	a0,1
    1ed4:	2005a223          	sw	zero,516(a1)
    1ed8:	f9dff06f          	j	1e74 <fatfs_fat_writeback+0x10>
    1edc:	2005a223          	sw	zero,516(a1)
    1ee0:	00100513          	li	a0,1
    1ee4:	00008067          	ret

00001ee8 <fatfs_fat_read_sector>:
    1ee8:	fe010113          	addi	sp,sp,-32
    1eec:	01212823          	sw	s2,16(sp)
    1ef0:	25452903          	lw	s2,596(a0)
    1ef4:	00812c23          	sw	s0,24(sp)
    1ef8:	00112e23          	sw	ra,28(sp)
    1efc:	00912a23          	sw	s1,20(sp)
    1f00:	01312623          	sw	s3,12(sp)
    1f04:	00000413          	li	s0,0
    1f08:	04091463          	bnez	s2,1f50 <fatfs_fat_read_sector+0x68>
    1f0c:	25452783          	lw	a5,596(a0)
    1f10:	00058493          	mv	s1,a1
    1f14:	00050993          	mv	s3,a0
    1f18:	20f42623          	sw	a5,524(s0)
    1f1c:	20442783          	lw	a5,516(s0)
    1f20:	24852a23          	sw	s0,596(a0)
    1f24:	08079863          	bnez	a5,1fb4 <fatfs_fat_read_sector+0xcc>
    1f28:	0349a783          	lw	a5,52(s3)
    1f2c:	20942023          	sw	s1,512(s0)
    1f30:	00100613          	li	a2,1
    1f34:	00040593          	mv	a1,s0
    1f38:	00048513          	mv	a0,s1
    1f3c:	000780e7          	jalr	a5
    1f40:	08051463          	bnez	a0,1fc8 <fatfs_fat_read_sector+0xe0>
    1f44:	fff00793          	li	a5,-1
    1f48:	20f42023          	sw	a5,512(s0)
    1f4c:	0480006f          	j	1f94 <fatfs_fat_read_sector+0xac>
    1f50:	20092783          	lw	a5,512(s2)
    1f54:	00f5e663          	bltu	a1,a5,1f60 <fatfs_fat_read_sector+0x78>
    1f58:	00178713          	addi	a4,a5,1
    1f5c:	02e5e463          	bltu	a1,a4,1f84 <fatfs_fat_read_sector+0x9c>
    1f60:	20c92783          	lw	a5,524(s2)
    1f64:	00079663          	bnez	a5,1f70 <fatfs_fat_read_sector+0x88>
    1f68:	00040a63          	beqz	s0,1f7c <fatfs_fat_read_sector+0x94>
    1f6c:	20042623          	sw	zero,524(s0)
    1f70:	00090413          	mv	s0,s2
    1f74:	20c92903          	lw	s2,524(s2)
    1f78:	f91ff06f          	j	1f08 <fatfs_fat_read_sector+0x20>
    1f7c:	24052a23          	sw	zero,596(a0)
    1f80:	ff1ff06f          	j	1f70 <fatfs_fat_read_sector+0x88>
    1f84:	40f585b3          	sub	a1,a1,a5
    1f88:	00959593          	slli	a1,a1,0x9
    1f8c:	00b905b3          	add	a1,s2,a1
    1f90:	20b92423          	sw	a1,520(s2)
    1f94:	01c12083          	lw	ra,28(sp)
    1f98:	01812403          	lw	s0,24(sp)
    1f9c:	01412483          	lw	s1,20(sp)
    1fa0:	00c12983          	lw	s3,12(sp)
    1fa4:	00090513          	mv	a0,s2
    1fa8:	01012903          	lw	s2,16(sp)
    1fac:	02010113          	addi	sp,sp,32
    1fb0:	00008067          	ret
    1fb4:	00040593          	mv	a1,s0
    1fb8:	00000097          	auipc	ra,0x0
    1fbc:	eac080e7          	jalr	-340(ra) # 1e64 <fatfs_fat_writeback>
    1fc0:	f60514e3          	bnez	a0,1f28 <fatfs_fat_read_sector+0x40>
    1fc4:	fd1ff06f          	j	1f94 <fatfs_fat_read_sector+0xac>
    1fc8:	20842423          	sw	s0,520(s0)
    1fcc:	00040913          	mv	s2,s0
    1fd0:	fc5ff06f          	j	1f94 <fatfs_fat_read_sector+0xac>

00001fd4 <_allocate_file>:
    1fd4:	000057b7          	lui	a5,0x5
    1fd8:	73c78793          	addi	a5,a5,1852 # 573c <_free_file_list>
    1fdc:	0007a583          	lw	a1,0(a5)
    1fe0:	06058263          	beqz	a1,2044 <_allocate_file+0x70>
    1fe4:	0005a703          	lw	a4,0(a1)
    1fe8:	fe010113          	addi	sp,sp,-32
    1fec:	00112e23          	sw	ra,28(sp)
    1ff0:	0045a683          	lw	a3,4(a1)
    1ff4:	04071063          	bnez	a4,2034 <_allocate_file+0x60>
    1ff8:	00d7a023          	sw	a3,0(a5)
    1ffc:	0045a683          	lw	a3,4(a1)
    2000:	02069e63          	bnez	a3,203c <_allocate_file+0x68>
    2004:	00e7a223          	sw	a4,4(a5)
    2008:	00005537          	lui	a0,0x5
    200c:	74450513          	addi	a0,a0,1860 # 5744 <_open_file_list>
    2010:	00b12623          	sw	a1,12(sp)
    2014:	00000097          	auipc	ra,0x0
    2018:	d48080e7          	jalr	-696(ra) # 1d5c <fat_list_insert_last>
    201c:	00c12583          	lw	a1,12(sp)
    2020:	01c12083          	lw	ra,28(sp)
    2024:	bc458593          	addi	a1,a1,-1084
    2028:	00058513          	mv	a0,a1
    202c:	02010113          	addi	sp,sp,32
    2030:	00008067          	ret
    2034:	00d72223          	sw	a3,4(a4)
    2038:	fc5ff06f          	j	1ffc <_allocate_file+0x28>
    203c:	00e6a023          	sw	a4,0(a3)
    2040:	fc9ff06f          	j	2008 <_allocate_file+0x34>
    2044:	00058513          	mv	a0,a1
    2048:	00008067          	ret

0000204c <_free_file>:
    204c:	43c52783          	lw	a5,1084(a0)
    2050:	44052703          	lw	a4,1088(a0)
    2054:	43c50593          	addi	a1,a0,1084
    2058:	02079663          	bnez	a5,2084 <_free_file+0x38>
    205c:	000056b7          	lui	a3,0x5
    2060:	74e6a223          	sw	a4,1860(a3) # 5744 <_open_file_list>
    2064:	44052703          	lw	a4,1088(a0)
    2068:	02071263          	bnez	a4,208c <_free_file+0x40>
    206c:	00005737          	lui	a4,0x5
    2070:	74f72423          	sw	a5,1864(a4) # 5748 <_open_file_list+0x4>
    2074:	00005537          	lui	a0,0x5
    2078:	73c50513          	addi	a0,a0,1852 # 573c <_free_file_list>
    207c:	00000317          	auipc	t1,0x0
    2080:	ce030067          	jr	-800(t1) # 1d5c <fat_list_insert_last>
    2084:	00e7a223          	sw	a4,4(a5)
    2088:	fddff06f          	j	2064 <_free_file+0x18>
    208c:	00f72023          	sw	a5,0(a4)
    2090:	fe5ff06f          	j	2074 <_free_file+0x28>

00002094 <fatfs_lba_of_cluster>:
    2094:	ff010113          	addi	sp,sp,-16
    2098:	00812423          	sw	s0,8(sp)
    209c:	00112623          	sw	ra,12(sp)
    20a0:	00050413          	mv	s0,a0
    20a4:	ffe58513          	addi	a0,a1,-2
    20a8:	00044583          	lbu	a1,0(s0)
    20ac:	00000097          	auipc	ra,0x0
    20b0:	c84080e7          	jalr	-892(ra) # 1d30 <__mulsi3>
    20b4:	00442783          	lw	a5,4(s0)
    20b8:	00f50533          	add	a0,a0,a5
    20bc:	03042783          	lw	a5,48(s0)
    20c0:	00079863          	bnez	a5,20d0 <fatfs_lba_of_cluster+0x3c>
    20c4:	02845783          	lhu	a5,40(s0)
    20c8:	4047d793          	srai	a5,a5,0x4
    20cc:	00f50533          	add	a0,a0,a5
    20d0:	00c12083          	lw	ra,12(sp)
    20d4:	00812403          	lw	s0,8(sp)
    20d8:	01010113          	addi	sp,sp,16
    20dc:	00008067          	ret

000020e0 <fatfs_sector_read>:
    20e0:	03452783          	lw	a5,52(a0)
    20e4:	00058713          	mv	a4,a1
    20e8:	00070513          	mv	a0,a4
    20ec:	00060593          	mv	a1,a2
    20f0:	00068613          	mv	a2,a3
    20f4:	00078067          	jr	a5

000020f8 <fatfs_sector_write>:
    20f8:	03852783          	lw	a5,56(a0)
    20fc:	00058713          	mv	a4,a1
    2100:	00070513          	mv	a0,a4
    2104:	00060593          	mv	a1,a2
    2108:	00068613          	mv	a2,a3
    210c:	00078067          	jr	a5

00002110 <fatfs_write_sector>:
    2110:	03852703          	lw	a4,56(a0)
    2114:	0a070463          	beqz	a4,21bc <fatfs_write_sector+0xac>
    2118:	03052883          	lw	a7,48(a0)
    211c:	00050793          	mv	a5,a0
    2120:	0115e833          	or	a6,a1,a7
    2124:	02081e63          	bnez	a6,2160 <fatfs_write_sector+0x50>
    2128:	01052583          	lw	a1,16(a0)
    212c:	08b67863          	bgeu	a2,a1,21bc <fatfs_write_sector+0xac>
    2130:	01c52503          	lw	a0,28(a0)
    2134:	00c7a583          	lw	a1,12(a5)
    2138:	00b50533          	add	a0,a0,a1
    213c:	00c50533          	add	a0,a0,a2
    2140:	00068863          	beqz	a3,2150 <fatfs_write_sector+0x40>
    2144:	00100613          	li	a2,1
    2148:	00068593          	mv	a1,a3
    214c:	00070067          	jr	a4
    2150:	24a7a223          	sw	a0,580(a5)
    2154:	00100613          	li	a2,1
    2158:	04478593          	addi	a1,a5,68
    215c:	ff1ff06f          	j	214c <fatfs_write_sector+0x3c>
    2160:	fe010113          	addi	sp,sp,-32
    2164:	00e12623          	sw	a4,12(sp)
    2168:	00d12423          	sw	a3,8(sp)
    216c:	00c12223          	sw	a2,4(sp)
    2170:	00112e23          	sw	ra,28(sp)
    2174:	00a12023          	sw	a0,0(sp)
    2178:	00000097          	auipc	ra,0x0
    217c:	f1c080e7          	jalr	-228(ra) # 2094 <fatfs_lba_of_cluster>
    2180:	00412603          	lw	a2,4(sp)
    2184:	00812683          	lw	a3,8(sp)
    2188:	00012783          	lw	a5,0(sp)
    218c:	00c12703          	lw	a4,12(sp)
    2190:	00a60533          	add	a0,a2,a0
    2194:	00068c63          	beqz	a3,21ac <fatfs_write_sector+0x9c>
    2198:	00100613          	li	a2,1
    219c:	00068593          	mv	a1,a3
    21a0:	01c12083          	lw	ra,28(sp)
    21a4:	02010113          	addi	sp,sp,32
    21a8:	fa5ff06f          	j	214c <fatfs_write_sector+0x3c>
    21ac:	24a7a223          	sw	a0,580(a5)
    21b0:	00100613          	li	a2,1
    21b4:	04478593          	addi	a1,a5,68
    21b8:	fe9ff06f          	j	21a0 <fatfs_write_sector+0x90>
    21bc:	00000513          	li	a0,0
    21c0:	00008067          	ret

000021c4 <fl_init>:
    21c4:	ff010113          	addi	sp,sp,-16
    21c8:	00005537          	lui	a0,0x5
    21cc:	000057b7          	lui	a5,0x5
    21d0:	000085b7          	lui	a1,0x8
    21d4:	00112623          	sw	ra,12(sp)
    21d8:	73c50513          	addi	a0,a0,1852 # 573c <_free_file_list>
    21dc:	74478793          	addi	a5,a5,1860 # 5744 <_open_file_list>
    21e0:	c1458593          	addi	a1,a1,-1004 # 7c14 <_files+0x43c>
    21e4:	00052223          	sw	zero,4(a0)
    21e8:	00052023          	sw	zero,0(a0)
    21ec:	0007a223          	sw	zero,4(a5)
    21f0:	0007a023          	sw	zero,0(a5)
    21f4:	00000097          	auipc	ra,0x0
    21f8:	b68080e7          	jalr	-1176(ra) # 1d5c <fat_list_insert_last>
    21fc:	000057b7          	lui	a5,0x5
    2200:	000085b7          	lui	a1,0x8
    2204:	73c78513          	addi	a0,a5,1852 # 573c <_free_file_list>
    2208:	05858593          	addi	a1,a1,88 # 8058 <_files+0x880>
    220c:	00000097          	auipc	ra,0x0
    2210:	b50080e7          	jalr	-1200(ra) # 1d5c <fat_list_insert_last>
    2214:	00c12083          	lw	ra,12(sp)
    2218:	000057b7          	lui	a5,0x5
    221c:	00100713          	li	a4,1
    2220:	74e7a823          	sw	a4,1872(a5) # 5750 <_filelib_init>
    2224:	01010113          	addi	sp,sp,16
    2228:	00008067          	ret

0000222c <fl_fseek>:
    222c:	000057b7          	lui	a5,0x5
    2230:	7507a783          	lw	a5,1872(a5) # 5750 <_filelib_init>
    2234:	fd010113          	addi	sp,sp,-48
    2238:	02812423          	sw	s0,40(sp)
    223c:	02912223          	sw	s1,36(sp)
    2240:	01312e23          	sw	s3,28(sp)
    2244:	02112623          	sw	ra,44(sp)
    2248:	03212023          	sw	s2,32(sp)
    224c:	00050413          	mv	s0,a0
    2250:	00058493          	mv	s1,a1
    2254:	00060993          	mv	s3,a2
    2258:	00079663          	bnez	a5,2264 <fl_fseek+0x38>
    225c:	00000097          	auipc	ra,0x0
    2260:	f68080e7          	jalr	-152(ra) # 21c4 <fl_init>
    2264:	fff00513          	li	a0,-1
    2268:	08040263          	beqz	s0,22ec <fl_fseek+0xc0>
    226c:	00048663          	beqz	s1,2278 <fl_fseek+0x4c>
    2270:	ffe98793          	addi	a5,s3,-2
    2274:	06078c63          	beqz	a5,22ec <fl_fseek+0xc0>
    2278:	00007937          	lui	s2,0x7
    227c:	37090913          	addi	s2,s2,880 # 7370 <_fs>
    2280:	03c92783          	lw	a5,60(s2)
    2284:	00078463          	beqz	a5,228c <fl_fseek+0x60>
    2288:	000780e7          	jalr	a5
    228c:	fff00513          	li	a0,-1
    2290:	42a42823          	sw	a0,1072(s0)
    2294:	42042a23          	sw	zero,1076(s0)
    2298:	00099c63          	bnez	s3,22b0 <fl_fseek+0x84>
    229c:	00c42783          	lw	a5,12(s0)
    22a0:	00942423          	sw	s1,8(s0)
    22a4:	0297f863          	bgeu	a5,s1,22d4 <fl_fseek+0xa8>
    22a8:	00f42423          	sw	a5,8(s0)
    22ac:	0280006f          	j	22d4 <fl_fseek+0xa8>
    22b0:	00100793          	li	a5,1
    22b4:	06f99063          	bne	s3,a5,2314 <fl_fseek+0xe8>
    22b8:	00842783          	lw	a5,8(s0)
    22bc:	0004c663          	bltz	s1,22c8 <fl_fseek+0x9c>
    22c0:	00f484b3          	add	s1,s1,a5
    22c4:	fd9ff06f          	j	229c <fl_fseek+0x70>
    22c8:	40900733          	neg	a4,s1
    22cc:	02e7fe63          	bgeu	a5,a4,2308 <fl_fseek+0xdc>
    22d0:	00042423          	sw	zero,8(s0)
    22d4:	00000513          	li	a0,0
    22d8:	04092783          	lw	a5,64(s2)
    22dc:	00078863          	beqz	a5,22ec <fl_fseek+0xc0>
    22e0:	00a12623          	sw	a0,12(sp)
    22e4:	000780e7          	jalr	a5
    22e8:	00c12503          	lw	a0,12(sp)
    22ec:	02c12083          	lw	ra,44(sp)
    22f0:	02812403          	lw	s0,40(sp)
    22f4:	02412483          	lw	s1,36(sp)
    22f8:	02012903          	lw	s2,32(sp)
    22fc:	01c12983          	lw	s3,28(sp)
    2300:	03010113          	addi	sp,sp,48
    2304:	00008067          	ret
    2308:	00f484b3          	add	s1,s1,a5
    230c:	00942423          	sw	s1,8(s0)
    2310:	fc5ff06f          	j	22d4 <fl_fseek+0xa8>
    2314:	00200793          	li	a5,2
    2318:	fcf990e3          	bne	s3,a5,22d8 <fl_fseek+0xac>
    231c:	00c42783          	lw	a5,12(s0)
    2320:	f89ff06f          	j	22a8 <fl_fseek+0x7c>

00002324 <fl_closedir>:
    2324:	00000513          	li	a0,0
    2328:	00008067          	ret

0000232c <fatfs_lfn_cache_entry>:
    232c:	0005c783          	lbu	a5,0(a1)
    2330:	01300693          	li	a3,19
    2334:	01f7f793          	andi	a5,a5,31
    2338:	fff78713          	addi	a4,a5,-1
    233c:	0ff77613          	zext.b	a2,a4
    2340:	0ac6ea63          	bltu	a3,a2,23f4 <fatfs_lfn_cache_entry+0xc8>
    2344:	10554683          	lbu	a3,261(a0)
    2348:	00069463          	bnez	a3,2350 <fatfs_lfn_cache_entry+0x24>
    234c:	10f502a3          	sb	a5,261(a0)
    2350:	00171793          	slli	a5,a4,0x1
    2354:	00e787b3          	add	a5,a5,a4
    2358:	0015c683          	lbu	a3,1(a1)
    235c:	00279793          	slli	a5,a5,0x2
    2360:	00e787b3          	add	a5,a5,a4
    2364:	00f50533          	add	a0,a0,a5
    2368:	00d50023          	sb	a3,0(a0)
    236c:	0035c783          	lbu	a5,3(a1)
    2370:	0ff00713          	li	a4,255
    2374:	02000693          	li	a3,32
    2378:	00f500a3          	sb	a5,1(a0)
    237c:	0055c783          	lbu	a5,5(a1)
    2380:	00f50123          	sb	a5,2(a0)
    2384:	0075c783          	lbu	a5,7(a1)
    2388:	00f501a3          	sb	a5,3(a0)
    238c:	0095c783          	lbu	a5,9(a1)
    2390:	00f50223          	sb	a5,4(a0)
    2394:	00e5c783          	lbu	a5,14(a1)
    2398:	00f502a3          	sb	a5,5(a0)
    239c:	0105c783          	lbu	a5,16(a1)
    23a0:	00f50323          	sb	a5,6(a0)
    23a4:	0125c783          	lbu	a5,18(a1)
    23a8:	00f503a3          	sb	a5,7(a0)
    23ac:	0145c783          	lbu	a5,20(a1)
    23b0:	00f50423          	sb	a5,8(a0)
    23b4:	0165c783          	lbu	a5,22(a1)
    23b8:	00f504a3          	sb	a5,9(a0)
    23bc:	0185c783          	lbu	a5,24(a1)
    23c0:	00f50523          	sb	a5,10(a0)
    23c4:	01c5c783          	lbu	a5,28(a1)
    23c8:	00f505a3          	sb	a5,11(a0)
    23cc:	01e5c783          	lbu	a5,30(a1)
    23d0:	00f50623          	sb	a5,12(a0)
    23d4:	00d00793          	li	a5,13
    23d8:	00054603          	lbu	a2,0(a0)
    23dc:	00e61463          	bne	a2,a4,23e4 <fatfs_lfn_cache_entry+0xb8>
    23e0:	00d50023          	sb	a3,0(a0)
    23e4:	fff78793          	addi	a5,a5,-1
    23e8:	0ff7f793          	zext.b	a5,a5
    23ec:	00150513          	addi	a0,a0,1
    23f0:	fe0794e3          	bnez	a5,23d8 <fatfs_lfn_cache_entry+0xac>
    23f4:	00008067          	ret

000023f8 <fatfs_lfn_cache_get>:
    23f8:	10554703          	lbu	a4,261(a0)
    23fc:	01400793          	li	a5,20
    2400:	00f71663          	bne	a4,a5,240c <fatfs_lfn_cache_get+0x14>
    2404:	10050223          	sb	zero,260(a0)
    2408:	00008067          	ret
    240c:	02070063          	beqz	a4,242c <fatfs_lfn_cache_get+0x34>
    2410:	00171793          	slli	a5,a4,0x1
    2414:	00e787b3          	add	a5,a5,a4
    2418:	00279793          	slli	a5,a5,0x2
    241c:	00e787b3          	add	a5,a5,a4
    2420:	00f507b3          	add	a5,a0,a5
    2424:	00078023          	sb	zero,0(a5)
    2428:	00008067          	ret
    242c:	00050023          	sb	zero,0(a0)
    2430:	00008067          	ret

00002434 <fatfs_entry_lfn_text>:
    2434:	00b54503          	lbu	a0,11(a0)
    2438:	00f57513          	andi	a0,a0,15
    243c:	ff150513          	addi	a0,a0,-15
    2440:	00153513          	seqz	a0,a0
    2444:	00008067          	ret

00002448 <fatfs_entry_lfn_invalid>:
    2448:	00054783          	lbu	a5,0(a0)
    244c:	f1b78713          	addi	a4,a5,-229
    2450:	02070263          	beqz	a4,2474 <fatfs_entry_lfn_invalid+0x2c>
    2454:	02078063          	beqz	a5,2474 <fatfs_entry_lfn_invalid+0x2c>
    2458:	00b54783          	lbu	a5,11(a0)
    245c:	00800713          	li	a4,8
    2460:	00100513          	li	a0,1
    2464:	00e78a63          	beq	a5,a4,2478 <fatfs_entry_lfn_invalid+0x30>
    2468:	0067f793          	andi	a5,a5,6
    246c:	00f03533          	snez	a0,a5
    2470:	00008067          	ret
    2474:	00100513          	li	a0,1
    2478:	00008067          	ret

0000247c <fatfs_entry_lfn_exists>:
    247c:	00b5c783          	lbu	a5,11(a1)
    2480:	00f00713          	li	a4,15
    2484:	04e78063          	beq	a5,a4,24c4 <fatfs_entry_lfn_exists+0x48>
    2488:	0005c683          	lbu	a3,0(a1)
    248c:	f1b68713          	addi	a4,a3,-229
    2490:	00e03733          	snez	a4,a4
    2494:	00d036b3          	snez	a3,a3
    2498:	00d77733          	and	a4,a4,a3
    249c:	02070463          	beqz	a4,24c4 <fatfs_entry_lfn_exists+0x48>
    24a0:	ff878713          	addi	a4,a5,-8
    24a4:	02070063          	beqz	a4,24c4 <fatfs_entry_lfn_exists+0x48>
    24a8:	0067f713          	andi	a4,a5,6
    24ac:	00000793          	li	a5,0
    24b0:	00071663          	bnez	a4,24bc <fatfs_entry_lfn_exists+0x40>
    24b4:	10554783          	lbu	a5,261(a0)
    24b8:	00f037b3          	snez	a5,a5
    24bc:	00078513          	mv	a0,a5
    24c0:	00008067          	ret
    24c4:	00000793          	li	a5,0
    24c8:	ff5ff06f          	j	24bc <fatfs_entry_lfn_exists+0x40>

000024cc <fatfs_entry_sfn_only>:
    24cc:	00b54783          	lbu	a5,11(a0)
    24d0:	00f00713          	li	a4,15
    24d4:	02e78863          	beq	a5,a4,2504 <fatfs_entry_sfn_only+0x38>
    24d8:	00054683          	lbu	a3,0(a0)
    24dc:	f1b68713          	addi	a4,a3,-229
    24e0:	00e03733          	snez	a4,a4
    24e4:	00d036b3          	snez	a3,a3
    24e8:	00d77733          	and	a4,a4,a3
    24ec:	00070c63          	beqz	a4,2504 <fatfs_entry_sfn_only+0x38>
    24f0:	ff878713          	addi	a4,a5,-8
    24f4:	00070863          	beqz	a4,2504 <fatfs_entry_sfn_only+0x38>
    24f8:	0067f513          	andi	a0,a5,6
    24fc:	00153513          	seqz	a0,a0
    2500:	00008067          	ret
    2504:	00000513          	li	a0,0
    2508:	00008067          	ret

0000250c <fatfs_entry_is_dir>:
    250c:	00b54503          	lbu	a0,11(a0)
    2510:	00455513          	srli	a0,a0,0x4
    2514:	00157513          	andi	a0,a0,1
    2518:	00008067          	ret

0000251c <fatfs_lfn_entries_required>:
    251c:	ff010113          	addi	sp,sp,-16
    2520:	00112623          	sw	ra,12(sp)
    2524:	fffff097          	auipc	ra,0xfffff
    2528:	108080e7          	jalr	264(ra) # 162c <strlen>
    252c:	00050a63          	beqz	a0,2540 <fatfs_lfn_entries_required+0x24>
    2530:	00d00593          	li	a1,13
    2534:	00c50513          	addi	a0,a0,12
    2538:	fffff097          	auipc	ra,0xfffff
    253c:	000080e7          	jalr	ra # 1538 <__divsi3>
    2540:	00c12083          	lw	ra,12(sp)
    2544:	01010113          	addi	sp,sp,16
    2548:	00008067          	ret

0000254c <fatfs_filename_to_lfn>:
    254c:	f9010113          	addi	sp,sp,-112
    2550:	06812423          	sw	s0,104(sp)
    2554:	00058413          	mv	s0,a1
    2558:	000055b7          	lui	a1,0x5
    255c:	4fc58593          	addi	a1,a1,1276 # 54fc <font+0x1e0>
    2560:	06912223          	sw	s1,100(sp)
    2564:	05312e23          	sw	s3,92(sp)
    2568:	00060493          	mv	s1,a2
    256c:	00050993          	mv	s3,a0
    2570:	03400613          	li	a2,52
    2574:	01c10513          	addi	a0,sp,28
    2578:	00d12623          	sw	a3,12(sp)
    257c:	06112623          	sw	ra,108(sp)
    2580:	07212023          	sw	s2,96(sp)
    2584:	05412c23          	sw	s4,88(sp)
    2588:	fffff097          	auipc	ra,0xfffff
    258c:	080080e7          	jalr	128(ra) # 1608 <memcpy>
    2590:	00098513          	mv	a0,s3
    2594:	fffff097          	auipc	ra,0xfffff
    2598:	098080e7          	jalr	152(ra) # 162c <strlen>
    259c:	00050913          	mv	s2,a0
    25a0:	00098513          	mv	a0,s3
    25a4:	00000097          	auipc	ra,0x0
    25a8:	f78080e7          	jalr	-136(ra) # 251c <fatfs_lfn_entries_required>
    25ac:	00050a13          	mv	s4,a0
    25b0:	02000613          	li	a2,32
    25b4:	00000593          	li	a1,0
    25b8:	00040513          	mv	a0,s0
    25bc:	fffff097          	auipc	ra,0xfffff
    25c0:	030080e7          	jalr	48(ra) # 15ec <memset>
    25c4:	fffa0713          	addi	a4,s4,-1
    25c8:	00c12683          	lw	a3,12(sp)
    25cc:	00148793          	addi	a5,s1,1
    25d0:	00971463          	bne	a4,s1,25d8 <fatfs_filename_to_lfn+0x8c>
    25d4:	0407e793          	ori	a5,a5,64
    25d8:	00149613          	slli	a2,s1,0x1
    25dc:	00960633          	add	a2,a2,s1
    25e0:	00f40023          	sb	a5,0(s0)
    25e4:	00261613          	slli	a2,a2,0x2
    25e8:	00f00793          	li	a5,15
    25ec:	00f405a3          	sb	a5,11(s0)
    25f0:	00d406a3          	sb	a3,13(s0)
    25f4:	01c10793          	addi	a5,sp,28
    25f8:	00960633          	add	a2,a2,s1
    25fc:	fff00693          	li	a3,-1
    2600:	0007a703          	lw	a4,0(a5)
    2604:	00e40733          	add	a4,s0,a4
    2608:	05265063          	bge	a2,s2,2648 <fatfs_filename_to_lfn+0xfc>
    260c:	00c985b3          	add	a1,s3,a2
    2610:	0005c583          	lbu	a1,0(a1)
    2614:	00b70023          	sb	a1,0(a4)
    2618:	00478793          	addi	a5,a5,4
    261c:	05010713          	addi	a4,sp,80
    2620:	00160613          	addi	a2,a2,1
    2624:	fce79ee3          	bne	a5,a4,2600 <fatfs_filename_to_lfn+0xb4>
    2628:	06c12083          	lw	ra,108(sp)
    262c:	06812403          	lw	s0,104(sp)
    2630:	06412483          	lw	s1,100(sp)
    2634:	06012903          	lw	s2,96(sp)
    2638:	05c12983          	lw	s3,92(sp)
    263c:	05812a03          	lw	s4,88(sp)
    2640:	07010113          	addi	sp,sp,112
    2644:	00008067          	ret
    2648:	01261663          	bne	a2,s2,2654 <fatfs_filename_to_lfn+0x108>
    264c:	00070023          	sb	zero,0(a4)
    2650:	fc9ff06f          	j	2618 <fatfs_filename_to_lfn+0xcc>
    2654:	00d70023          	sb	a3,0(a4)
    2658:	00d700a3          	sb	a3,1(a4)
    265c:	fbdff06f          	j	2618 <fatfs_filename_to_lfn+0xcc>

00002660 <fatfs_sfn_create_entry>:
    2660:	00000793          	li	a5,0
    2664:	00b00813          	li	a6,11
    2668:	00f508b3          	add	a7,a0,a5
    266c:	0008c303          	lbu	t1,0(a7)
    2670:	00f688b3          	add	a7,a3,a5
    2674:	00178793          	addi	a5,a5,1
    2678:	00688023          	sb	t1,0(a7)
    267c:	ff0796e3          	bne	a5,a6,2668 <fatfs_sfn_create_entry+0x8>
    2680:	00e03733          	snez	a4,a4
    2684:	40e00733          	neg	a4,a4
    2688:	02000793          	li	a5,32
    268c:	ff077713          	andi	a4,a4,-16
    2690:	00f70733          	add	a4,a4,a5
    2694:	00f68823          	sb	a5,16(a3)
    2698:	00f68923          	sb	a5,18(a3)
    269c:	00f68c23          	sb	a5,24(a3)
    26a0:	01065793          	srli	a5,a2,0x10
    26a4:	00f68a23          	sb	a5,20(a3)
    26a8:	01865793          	srli	a5,a2,0x18
    26ac:	00f68aa3          	sb	a5,21(a3)
    26b0:	0085d793          	srli	a5,a1,0x8
    26b4:	00c68d23          	sb	a2,26(a3)
    26b8:	00b68e23          	sb	a1,28(a3)
    26bc:	00865613          	srli	a2,a2,0x8
    26c0:	00f68ea3          	sb	a5,29(a3)
    26c4:	0105d793          	srli	a5,a1,0x10
    26c8:	0185d593          	srli	a1,a1,0x18
    26cc:	000686a3          	sb	zero,13(a3)
    26d0:	00068723          	sb	zero,14(a3)
    26d4:	000687a3          	sb	zero,15(a3)
    26d8:	000688a3          	sb	zero,17(a3)
    26dc:	000689a3          	sb	zero,19(a3)
    26e0:	00068b23          	sb	zero,22(a3)
    26e4:	00068ba3          	sb	zero,23(a3)
    26e8:	00068ca3          	sb	zero,25(a3)
    26ec:	00e685a3          	sb	a4,11(a3)
    26f0:	00068623          	sb	zero,12(a3)
    26f4:	00c68da3          	sb	a2,27(a3)
    26f8:	00f68f23          	sb	a5,30(a3)
    26fc:	00b68fa3          	sb	a1,31(a3)
    2700:	00008067          	ret

00002704 <fatfs_lfn_create_sfn>:
    2704:	fd010113          	addi	sp,sp,-48
    2708:	02912223          	sw	s1,36(sp)
    270c:	00050493          	mv	s1,a0
    2710:	00058513          	mv	a0,a1
    2714:	02812423          	sw	s0,40(sp)
    2718:	01312e23          	sw	s3,28(sp)
    271c:	00058413          	mv	s0,a1
    2720:	02112623          	sw	ra,44(sp)
    2724:	03212023          	sw	s2,32(sp)
    2728:	fffff097          	auipc	ra,0xfffff
    272c:	f04080e7          	jalr	-252(ra) # 162c <strlen>
    2730:	00044783          	lbu	a5,0(s0)
    2734:	02e00993          	li	s3,46
    2738:	15378063          	beq	a5,s3,2878 <fatfs_lfn_create_sfn+0x174>
    273c:	00b00613          	li	a2,11
    2740:	02000593          	li	a1,32
    2744:	00050913          	mv	s2,a0
    2748:	00048513          	mv	a0,s1
    274c:	fffff097          	auipc	ra,0xfffff
    2750:	ea0080e7          	jalr	-352(ra) # 15ec <memset>
    2754:	00300613          	li	a2,3
    2758:	02000593          	li	a1,32
    275c:	00c10513          	addi	a0,sp,12
    2760:	fffff097          	auipc	ra,0xfffff
    2764:	e8c080e7          	jalr	-372(ra) # 15ec <memset>
    2768:	fff00793          	li	a5,-1
    276c:	00000713          	li	a4,0
    2770:	0d274263          	blt	a4,s2,2834 <fatfs_lfn_create_sfn+0x130>
    2774:	fff00713          	li	a4,-1
    2778:	0ee78863          	beq	a5,a4,2868 <fatfs_lfn_create_sfn+0x164>
    277c:	00178713          	addi	a4,a5,1
    2780:	00c10693          	addi	a3,sp,12
    2784:	00478613          	addi	a2,a5,4
    2788:	0ce61263          	bne	a2,a4,284c <fatfs_lfn_create_sfn+0x148>
    278c:	00000613          	li	a2,0
    2790:	00000693          	li	a3,0
    2794:	01900813          	li	a6,25
    2798:	00800893          	li	a7,8
    279c:	02f6de63          	bge	a3,a5,27d8 <fatfs_lfn_create_sfn+0xd4>
    27a0:	00d40733          	add	a4,s0,a3
    27a4:	00074703          	lbu	a4,0(a4)
    27a8:	fe070513          	addi	a0,a4,-32
    27ac:	0c050263          	beqz	a0,2870 <fatfs_lfn_create_sfn+0x16c>
    27b0:	fd270593          	addi	a1,a4,-46
    27b4:	0a058e63          	beqz	a1,2870 <fatfs_lfn_create_sfn+0x16c>
    27b8:	f9f70593          	addi	a1,a4,-97
    27bc:	0ff5f593          	zext.b	a1,a1
    27c0:	00c48333          	add	t1,s1,a2
    27c4:	00160613          	addi	a2,a2,1
    27c8:	00b86463          	bltu	a6,a1,27d0 <fatfs_lfn_create_sfn+0xcc>
    27cc:	0ff57713          	zext.b	a4,a0
    27d0:	00e30023          	sb	a4,0(t1)
    27d4:	09161e63          	bne	a2,a7,2870 <fatfs_lfn_create_sfn+0x16c>
    27d8:	00c10793          	addi	a5,sp,12
    27dc:	00800693          	li	a3,8
    27e0:	01900513          	li	a0,25
    27e4:	00b00593          	li	a1,11
    27e8:	0007c703          	lbu	a4,0(a5)
    27ec:	f9f70613          	addi	a2,a4,-97
    27f0:	0ff67613          	zext.b	a2,a2
    27f4:	00c56663          	bltu	a0,a2,2800 <fatfs_lfn_create_sfn+0xfc>
    27f8:	fe070713          	addi	a4,a4,-32
    27fc:	0ff77713          	zext.b	a4,a4
    2800:	00d48633          	add	a2,s1,a3
    2804:	00e60023          	sb	a4,0(a2)
    2808:	00168693          	addi	a3,a3,1
    280c:	00178793          	addi	a5,a5,1
    2810:	fcb69ce3          	bne	a3,a1,27e8 <fatfs_lfn_create_sfn+0xe4>
    2814:	00100513          	li	a0,1
    2818:	02c12083          	lw	ra,44(sp)
    281c:	02812403          	lw	s0,40(sp)
    2820:	02412483          	lw	s1,36(sp)
    2824:	02012903          	lw	s2,32(sp)
    2828:	01c12983          	lw	s3,28(sp)
    282c:	03010113          	addi	sp,sp,48
    2830:	00008067          	ret
    2834:	00e406b3          	add	a3,s0,a4
    2838:	0006c683          	lbu	a3,0(a3)
    283c:	01369463          	bne	a3,s3,2844 <fatfs_lfn_create_sfn+0x140>
    2840:	00070793          	mv	a5,a4
    2844:	00170713          	addi	a4,a4,1
    2848:	f29ff06f          	j	2770 <fatfs_lfn_create_sfn+0x6c>
    284c:	01275863          	bge	a4,s2,285c <fatfs_lfn_create_sfn+0x158>
    2850:	00e405b3          	add	a1,s0,a4
    2854:	0005c583          	lbu	a1,0(a1)
    2858:	00b68023          	sb	a1,0(a3)
    285c:	00170713          	addi	a4,a4,1
    2860:	00168693          	addi	a3,a3,1
    2864:	f25ff06f          	j	2788 <fatfs_lfn_create_sfn+0x84>
    2868:	00090793          	mv	a5,s2
    286c:	f21ff06f          	j	278c <fatfs_lfn_create_sfn+0x88>
    2870:	00168693          	addi	a3,a3,1
    2874:	f29ff06f          	j	279c <fatfs_lfn_create_sfn+0x98>
    2878:	00000513          	li	a0,0
    287c:	f9dff06f          	j	2818 <fatfs_lfn_create_sfn+0x114>

00002880 <fatfs_lfn_generate_tail>:
    2880:	000187b7          	lui	a5,0x18
    2884:	69f78793          	addi	a5,a5,1695 # 1869f <__stacktop+0x869f>
    2888:	16c7e463          	bltu	a5,a2,29f0 <fatfs_lfn_generate_tail+0x170>
    288c:	fa010113          	addi	sp,sp,-96
    2890:	04812c23          	sw	s0,88(sp)
    2894:	04912a23          	sw	s1,84(sp)
    2898:	03712e23          	sw	s7,60(sp)
    289c:	00060413          	mv	s0,a2
    28a0:	00058b93          	mv	s7,a1
    28a4:	00c00613          	li	a2,12
    28a8:	00000593          	li	a1,0
    28ac:	00050493          	mv	s1,a0
    28b0:	00410513          	addi	a0,sp,4
    28b4:	04112e23          	sw	ra,92(sp)
    28b8:	05312623          	sw	s3,76(sp)
    28bc:	05412423          	sw	s4,72(sp)
    28c0:	05612023          	sw	s6,64(sp)
    28c4:	05212823          	sw	s2,80(sp)
    28c8:	05512223          	sw	s5,68(sp)
    28cc:	fffff097          	auipc	ra,0xfffff
    28d0:	d20080e7          	jalr	-736(ra) # 15ec <memset>
    28d4:	000055b7          	lui	a1,0x5
    28d8:	07e00793          	li	a5,126
    28dc:	01100613          	li	a2,17
    28e0:	2d458593          	addi	a1,a1,724 # 52d4 <LEDS+0x110>
    28e4:	01c10513          	addi	a0,sp,28
    28e8:	01010993          	addi	s3,sp,16
    28ec:	00f10223          	sb	a5,4(sp)
    28f0:	00098a13          	mv	s4,s3
    28f4:	fffff097          	auipc	ra,0xfffff
    28f8:	d14080e7          	jalr	-748(ra) # 1608 <memcpy>
    28fc:	00900b13          	li	s6,9
    2900:	00a00593          	li	a1,10
    2904:	00040513          	mv	a0,s0
    2908:	fffff097          	auipc	ra,0xfffff
    290c:	c80080e7          	jalr	-896(ra) # 1588 <__umodsi3>
    2910:	03050793          	addi	a5,a0,48
    2914:	00278533          	add	a0,a5,sp
    2918:	fec54783          	lbu	a5,-20(a0)
    291c:	00098913          	mv	s2,s3
    2920:	00040513          	mv	a0,s0
    2924:	00a00593          	li	a1,10
    2928:	00f98023          	sb	a5,0(s3)
    292c:	00040a93          	mv	s5,s0
    2930:	fffff097          	auipc	ra,0xfffff
    2934:	c10080e7          	jalr	-1008(ra) # 1540 <__udivsi3>
    2938:	00198993          	addi	s3,s3,1
    293c:	00050413          	mv	s0,a0
    2940:	fd5b60e3          	bltu	s6,s5,2900 <fatfs_lfn_generate_tail+0x80>
    2944:	00098023          	sb	zero,0(s3)
    2948:	00410713          	addi	a4,sp,4
    294c:	00090793          	mv	a5,s2
    2950:	0947f663          	bgeu	a5,s4,29dc <fatfs_lfn_generate_tail+0x15c>
    2954:	00f10713          	addi	a4,sp,15
    2958:	00000793          	li	a5,0
    295c:	00e96663          	bltu	s2,a4,2968 <fatfs_lfn_generate_tail+0xe8>
    2960:	41490933          	sub	s2,s2,s4
    2964:	00190793          	addi	a5,s2,1
    2968:	03078793          	addi	a5,a5,48
    296c:	002787b3          	add	a5,a5,sp
    2970:	000b8593          	mv	a1,s7
    2974:	fc078aa3          	sb	zero,-43(a5)
    2978:	00b00613          	li	a2,11
    297c:	00048513          	mv	a0,s1
    2980:	fffff097          	auipc	ra,0xfffff
    2984:	c88080e7          	jalr	-888(ra) # 1608 <memcpy>
    2988:	00410513          	addi	a0,sp,4
    298c:	fffff097          	auipc	ra,0xfffff
    2990:	ca0080e7          	jalr	-864(ra) # 162c <strlen>
    2994:	40a484b3          	sub	s1,s1,a0
    2998:	00050613          	mv	a2,a0
    299c:	00410593          	addi	a1,sp,4
    29a0:	00848513          	addi	a0,s1,8
    29a4:	fffff097          	auipc	ra,0xfffff
    29a8:	c64080e7          	jalr	-924(ra) # 1608 <memcpy>
    29ac:	05c12083          	lw	ra,92(sp)
    29b0:	05812403          	lw	s0,88(sp)
    29b4:	05412483          	lw	s1,84(sp)
    29b8:	05012903          	lw	s2,80(sp)
    29bc:	04c12983          	lw	s3,76(sp)
    29c0:	04812a03          	lw	s4,72(sp)
    29c4:	04412a83          	lw	s5,68(sp)
    29c8:	04012b03          	lw	s6,64(sp)
    29cc:	03c12b83          	lw	s7,60(sp)
    29d0:	00100513          	li	a0,1
    29d4:	06010113          	addi	sp,sp,96
    29d8:	00008067          	ret
    29dc:	0007c683          	lbu	a3,0(a5)
    29e0:	00170713          	addi	a4,a4,1
    29e4:	fff78793          	addi	a5,a5,-1
    29e8:	00d70023          	sb	a3,0(a4)
    29ec:	f65ff06f          	j	2950 <fatfs_lfn_generate_tail+0xd0>
    29f0:	00000513          	li	a0,0
    29f4:	00008067          	ret

000029f8 <fatfs_total_path_levels>:
    29f8:	fff00793          	li	a5,-1
    29fc:	06050263          	beqz	a0,2a60 <fatfs_total_path_levels+0x68>
    2a00:	00054703          	lbu	a4,0(a0)
    2a04:	02f00793          	li	a5,47
    2a08:	00f71863          	bne	a4,a5,2a18 <fatfs_total_path_levels+0x20>
    2a0c:	00150513          	addi	a0,a0,1
    2a10:	00000793          	li	a5,0
    2a14:	0400006f          	j	2a54 <fatfs_total_path_levels+0x5c>
    2a18:	00154703          	lbu	a4,1(a0)
    2a1c:	03a00793          	li	a5,58
    2a20:	00f70a63          	beq	a4,a5,2a34 <fatfs_total_path_levels+0x3c>
    2a24:	00254683          	lbu	a3,2(a0)
    2a28:	05c00713          	li	a4,92
    2a2c:	fff00793          	li	a5,-1
    2a30:	02e69863          	bne	a3,a4,2a60 <fatfs_total_path_levels+0x68>
    2a34:	00350513          	addi	a0,a0,3
    2a38:	05c00713          	li	a4,92
    2a3c:	fd5ff06f          	j	2a10 <fatfs_total_path_levels+0x18>
    2a40:	00150513          	addi	a0,a0,1
    2a44:	00e68663          	beq	a3,a4,2a50 <fatfs_total_path_levels+0x58>
    2a48:	00054683          	lbu	a3,0(a0)
    2a4c:	fe069ae3          	bnez	a3,2a40 <fatfs_total_path_levels+0x48>
    2a50:	00178793          	addi	a5,a5,1
    2a54:	00054683          	lbu	a3,0(a0)
    2a58:	fe0698e3          	bnez	a3,2a48 <fatfs_total_path_levels+0x50>
    2a5c:	fff78793          	addi	a5,a5,-1
    2a60:	00078513          	mv	a0,a5
    2a64:	00008067          	ret

00002a68 <fatfs_get_substring>:
    2a68:	0cd05e63          	blez	a3,2b44 <fatfs_get_substring+0xdc>
    2a6c:	0c050c63          	beqz	a0,2b44 <fatfs_get_substring+0xdc>
    2a70:	fe010113          	addi	sp,sp,-32
    2a74:	00812c23          	sw	s0,24(sp)
    2a78:	00112e23          	sw	ra,28(sp)
    2a7c:	00912a23          	sw	s1,20(sp)
    2a80:	00054483          	lbu	s1,0(a0)
    2a84:	02f00793          	li	a5,47
    2a88:	00150413          	addi	s0,a0,1
    2a8c:	02f48463          	beq	s1,a5,2ab4 <fatfs_get_substring+0x4c>
    2a90:	00154703          	lbu	a4,1(a0)
    2a94:	03a00793          	li	a5,58
    2a98:	00f70a63          	beq	a4,a5,2aac <fatfs_get_substring+0x44>
    2a9c:	00254803          	lbu	a6,2(a0)
    2aa0:	05c00713          	li	a4,92
    2aa4:	fff00793          	li	a5,-1
    2aa8:	04e81c63          	bne	a6,a4,2b00 <fatfs_get_substring+0x98>
    2aac:	00350413          	addi	s0,a0,3
    2ab0:	05c00493          	li	s1,92
    2ab4:	00040513          	mv	a0,s0
    2ab8:	00d12623          	sw	a3,12(sp)
    2abc:	00c12423          	sw	a2,8(sp)
    2ac0:	00b12223          	sw	a1,4(sp)
    2ac4:	fffff097          	auipc	ra,0xfffff
    2ac8:	b68080e7          	jalr	-1176(ra) # 162c <strlen>
    2acc:	00c12683          	lw	a3,12(sp)
    2ad0:	00412583          	lw	a1,4(sp)
    2ad4:	00812603          	lw	a2,8(sp)
    2ad8:	00000713          	li	a4,0
    2adc:	00000813          	li	a6,0
    2ae0:	00000793          	li	a5,0
    2ae4:	fff68693          	addi	a3,a3,-1
    2ae8:	00e608b3          	add	a7,a2,a4
    2aec:	02a7c663          	blt	a5,a0,2b18 <fatfs_get_substring+0xb0>
    2af0:	00088023          	sb	zero,0(a7)
    2af4:	00064783          	lbu	a5,0(a2)
    2af8:	0017b793          	seqz	a5,a5
    2afc:	40f007b3          	neg	a5,a5
    2b00:	01c12083          	lw	ra,28(sp)
    2b04:	01812403          	lw	s0,24(sp)
    2b08:	01412483          	lw	s1,20(sp)
    2b0c:	00078513          	mv	a0,a5
    2b10:	02010113          	addi	sp,sp,32
    2b14:	00008067          	ret
    2b18:	00f40333          	add	t1,s0,a5
    2b1c:	00034303          	lbu	t1,0(t1)
    2b20:	00931863          	bne	t1,s1,2b30 <fatfs_get_substring+0xc8>
    2b24:	00180813          	addi	a6,a6,1
    2b28:	00178793          	addi	a5,a5,1
    2b2c:	fbdff06f          	j	2ae8 <fatfs_get_substring+0x80>
    2b30:	feb81ce3          	bne	a6,a1,2b28 <fatfs_get_substring+0xc0>
    2b34:	fed75ae3          	bge	a4,a3,2b28 <fatfs_get_substring+0xc0>
    2b38:	00170713          	addi	a4,a4,1
    2b3c:	00688023          	sb	t1,0(a7)
    2b40:	fe9ff06f          	j	2b28 <fatfs_get_substring+0xc0>
    2b44:	fff00793          	li	a5,-1
    2b48:	00078513          	mv	a0,a5
    2b4c:	00008067          	ret

00002b50 <fatfs_split_path>:
    2b50:	fd010113          	addi	sp,sp,-48
    2b54:	02912223          	sw	s1,36(sp)
    2b58:	03212023          	sw	s2,32(sp)
    2b5c:	01312e23          	sw	s3,28(sp)
    2b60:	01412c23          	sw	s4,24(sp)
    2b64:	02112623          	sw	ra,44(sp)
    2b68:	02812423          	sw	s0,40(sp)
    2b6c:	01512a23          	sw	s5,20(sp)
    2b70:	00050993          	mv	s3,a0
    2b74:	00058493          	mv	s1,a1
    2b78:	00060913          	mv	s2,a2
    2b7c:	00068a13          	mv	s4,a3
    2b80:	00e12623          	sw	a4,12(sp)
    2b84:	00000097          	auipc	ra,0x0
    2b88:	e74080e7          	jalr	-396(ra) # 29f8 <fatfs_total_path_levels>
    2b8c:	fff00793          	li	a5,-1
    2b90:	02f51863          	bne	a0,a5,2bc0 <fatfs_split_path+0x70>
    2b94:	fff00413          	li	s0,-1
    2b98:	02c12083          	lw	ra,44(sp)
    2b9c:	00040513          	mv	a0,s0
    2ba0:	02812403          	lw	s0,40(sp)
    2ba4:	02412483          	lw	s1,36(sp)
    2ba8:	02012903          	lw	s2,32(sp)
    2bac:	01c12983          	lw	s3,28(sp)
    2bb0:	01812a03          	lw	s4,24(sp)
    2bb4:	01412a83          	lw	s5,20(sp)
    2bb8:	03010113          	addi	sp,sp,48
    2bbc:	00008067          	ret
    2bc0:	00c12683          	lw	a3,12(sp)
    2bc4:	00050593          	mv	a1,a0
    2bc8:	00a12623          	sw	a0,12(sp)
    2bcc:	000a0613          	mv	a2,s4
    2bd0:	00098513          	mv	a0,s3
    2bd4:	00000097          	auipc	ra,0x0
    2bd8:	e94080e7          	jalr	-364(ra) # 2a68 <fatfs_get_substring>
    2bdc:	00050413          	mv	s0,a0
    2be0:	fa051ae3          	bnez	a0,2b94 <fatfs_split_path+0x44>
    2be4:	00c12583          	lw	a1,12(sp)
    2be8:	00059663          	bnez	a1,2bf4 <fatfs_split_path+0xa4>
    2bec:	00048023          	sb	zero,0(s1)
    2bf0:	fa9ff06f          	j	2b98 <fatfs_split_path+0x48>
    2bf4:	00098513          	mv	a0,s3
    2bf8:	fffff097          	auipc	ra,0xfffff
    2bfc:	a34080e7          	jalr	-1484(ra) # 162c <strlen>
    2c00:	00050a93          	mv	s5,a0
    2c04:	000a0513          	mv	a0,s4
    2c08:	fffff097          	auipc	ra,0xfffff
    2c0c:	a24080e7          	jalr	-1500(ra) # 162c <strlen>
    2c10:	40aa8633          	sub	a2,s5,a0
    2c14:	00c95463          	bge	s2,a2,2c1c <fatfs_split_path+0xcc>
    2c18:	00090613          	mv	a2,s2
    2c1c:	00048513          	mv	a0,s1
    2c20:	00098593          	mv	a1,s3
    2c24:	00c12623          	sw	a2,12(sp)
    2c28:	fffff097          	auipc	ra,0xfffff
    2c2c:	9e0080e7          	jalr	-1568(ra) # 1608 <memcpy>
    2c30:	00c12603          	lw	a2,12(sp)
    2c34:	00c484b3          	add	s1,s1,a2
    2c38:	fe048fa3          	sb	zero,-1(s1)
    2c3c:	f5dff06f          	j	2b98 <fatfs_split_path+0x48>

00002c40 <fatfs_compare_names>:
    2c40:	fd010113          	addi	sp,sp,-48
    2c44:	02112623          	sw	ra,44(sp)
    2c48:	03212023          	sw	s2,32(sp)
    2c4c:	01312e23          	sw	s3,28(sp)
    2c50:	01412c23          	sw	s4,24(sp)
    2c54:	01512a23          	sw	s5,20(sp)
    2c58:	00058a13          	mv	s4,a1
    2c5c:	02812423          	sw	s0,40(sp)
    2c60:	02912223          	sw	s1,36(sp)
    2c64:	01612823          	sw	s6,16(sp)
    2c68:	01712623          	sw	s7,12(sp)
    2c6c:	01812423          	sw	s8,8(sp)
    2c70:	00050a93          	mv	s5,a0
    2c74:	fffff097          	auipc	ra,0xfffff
    2c78:	1c4080e7          	jalr	452(ra) # 1e38 <FileString_GetExtension>
    2c7c:	00050993          	mv	s3,a0
    2c80:	000a0513          	mv	a0,s4
    2c84:	fffff097          	auipc	ra,0xfffff
    2c88:	1b4080e7          	jalr	436(ra) # 1e38 <FileString_GetExtension>
    2c8c:	fff00793          	li	a5,-1
    2c90:	00050913          	mv	s2,a0
    2c94:	02f99e63          	bne	s3,a5,2cd0 <fatfs_compare_names+0x90>
    2c98:	0f350063          	beq	a0,s3,2d78 <fatfs_compare_names+0x138>
    2c9c:	00000513          	li	a0,0
    2ca0:	02c12083          	lw	ra,44(sp)
    2ca4:	02812403          	lw	s0,40(sp)
    2ca8:	02412483          	lw	s1,36(sp)
    2cac:	02012903          	lw	s2,32(sp)
    2cb0:	01c12983          	lw	s3,28(sp)
    2cb4:	01812a03          	lw	s4,24(sp)
    2cb8:	01412a83          	lw	s5,20(sp)
    2cbc:	01012b03          	lw	s6,16(sp)
    2cc0:	00c12b83          	lw	s7,12(sp)
    2cc4:	00812c03          	lw	s8,8(sp)
    2cc8:	03010113          	addi	sp,sp,48
    2ccc:	00008067          	ret
    2cd0:	fcf506e3          	beq	a0,a5,2c9c <fatfs_compare_names+0x5c>
    2cd4:	00198793          	addi	a5,s3,1
    2cd8:	00fa8b33          	add	s6,s5,a5
    2cdc:	00050413          	mv	s0,a0
    2ce0:	00150793          	addi	a5,a0,1
    2ce4:	000b0513          	mv	a0,s6
    2ce8:	00fa0bb3          	add	s7,s4,a5
    2cec:	fffff097          	auipc	ra,0xfffff
    2cf0:	940080e7          	jalr	-1728(ra) # 162c <strlen>
    2cf4:	00050c13          	mv	s8,a0
    2cf8:	000b8513          	mv	a0,s7
    2cfc:	00098493          	mv	s1,s3
    2d00:	fffff097          	auipc	ra,0xfffff
    2d04:	92c080e7          	jalr	-1748(ra) # 162c <strlen>
    2d08:	f8ac1ae3          	bne	s8,a0,2c9c <fatfs_compare_names+0x5c>
    2d0c:	000b0513          	mv	a0,s6
    2d10:	fffff097          	auipc	ra,0xfffff
    2d14:	91c080e7          	jalr	-1764(ra) # 162c <strlen>
    2d18:	00050613          	mv	a2,a0
    2d1c:	000b8593          	mv	a1,s7
    2d20:	000b0513          	mv	a0,s6
    2d24:	fffff097          	auipc	ra,0xfffff
    2d28:	0a4080e7          	jalr	164(ra) # 1dc8 <FileString_StrCmpNoCase>
    2d2c:	f60518e3          	bnez	a0,2c9c <fatfs_compare_names+0x5c>
    2d30:	fff48793          	addi	a5,s1,-1
    2d34:	00fa87b3          	add	a5,s5,a5
    2d38:	41378733          	sub	a4,a5,s3
    2d3c:	02000693          	li	a3,32
    2d40:	06e79263          	bne	a5,a4,2da4 <fatfs_compare_names+0x164>
    2d44:	fff40793          	addi	a5,s0,-1
    2d48:	00fa07b3          	add	a5,s4,a5
    2d4c:	41278733          	sub	a4,a5,s2
    2d50:	02000693          	li	a3,32
    2d54:	06e79263          	bne	a5,a4,2db8 <fatfs_compare_names+0x178>
    2d58:	f53912e3          	bne	s2,s3,2c9c <fatfs_compare_names+0x5c>
    2d5c:	00090613          	mv	a2,s2
    2d60:	000a0593          	mv	a1,s4
    2d64:	000a8513          	mv	a0,s5
    2d68:	fffff097          	auipc	ra,0xfffff
    2d6c:	060080e7          	jalr	96(ra) # 1dc8 <FileString_StrCmpNoCase>
    2d70:	00153513          	seqz	a0,a0
    2d74:	f2dff06f          	j	2ca0 <fatfs_compare_names+0x60>
    2d78:	000a8513          	mv	a0,s5
    2d7c:	fffff097          	auipc	ra,0xfffff
    2d80:	8b0080e7          	jalr	-1872(ra) # 162c <strlen>
    2d84:	00050493          	mv	s1,a0
    2d88:	00050993          	mv	s3,a0
    2d8c:	000a0513          	mv	a0,s4
    2d90:	fffff097          	auipc	ra,0xfffff
    2d94:	89c080e7          	jalr	-1892(ra) # 162c <strlen>
    2d98:	00050413          	mv	s0,a0
    2d9c:	00050913          	mv	s2,a0
    2da0:	f91ff06f          	j	2d30 <fatfs_compare_names+0xf0>
    2da4:	0007c603          	lbu	a2,0(a5)
    2da8:	f8d61ee3          	bne	a2,a3,2d44 <fatfs_compare_names+0x104>
    2dac:	415789b3          	sub	s3,a5,s5
    2db0:	fff78793          	addi	a5,a5,-1
    2db4:	f8dff06f          	j	2d40 <fatfs_compare_names+0x100>
    2db8:	0007c603          	lbu	a2,0(a5)
    2dbc:	f8d61ee3          	bne	a2,a3,2d58 <fatfs_compare_names+0x118>
    2dc0:	41478933          	sub	s2,a5,s4
    2dc4:	fff78793          	addi	a5,a5,-1
    2dc8:	f8dff06f          	j	2d54 <fatfs_compare_names+0x114>

00002dcc <_check_file_open>:
    2dcc:	fe010113          	addi	sp,sp,-32
    2dd0:	000057b7          	lui	a5,0x5
    2dd4:	00812c23          	sw	s0,24(sp)
    2dd8:	7447a403          	lw	s0,1860(a5) # 5744 <_open_file_list>
    2ddc:	00912a23          	sw	s1,20(sp)
    2de0:	00112e23          	sw	ra,28(sp)
    2de4:	01212823          	sw	s2,16(sp)
    2de8:	01312623          	sw	s3,12(sp)
    2dec:	00050493          	mv	s1,a0
    2df0:	00041663          	bnez	s0,2dfc <_check_file_open+0x30>
    2df4:	00000513          	li	a0,0
    2df8:	03c0006f          	j	2e34 <_check_file_open+0x68>
    2dfc:	bc440793          	addi	a5,s0,-1084
    2e00:	00f49663          	bne	s1,a5,2e0c <_check_file_open+0x40>
    2e04:	00442403          	lw	s0,4(s0)
    2e08:	fe9ff06f          	j	2df0 <_check_file_open+0x24>
    2e0c:	01448593          	addi	a1,s1,20
    2e10:	bd840513          	addi	a0,s0,-1064
    2e14:	00000097          	auipc	ra,0x0
    2e18:	e2c080e7          	jalr	-468(ra) # 2c40 <fatfs_compare_names>
    2e1c:	fe0504e3          	beqz	a0,2e04 <_check_file_open+0x38>
    2e20:	11848593          	addi	a1,s1,280
    2e24:	cdc40513          	addi	a0,s0,-804
    2e28:	00000097          	auipc	ra,0x0
    2e2c:	e18080e7          	jalr	-488(ra) # 2c40 <fatfs_compare_names>
    2e30:	fc050ae3          	beqz	a0,2e04 <_check_file_open+0x38>
    2e34:	01c12083          	lw	ra,28(sp)
    2e38:	01812403          	lw	s0,24(sp)
    2e3c:	01412483          	lw	s1,20(sp)
    2e40:	01012903          	lw	s2,16(sp)
    2e44:	00c12983          	lw	s3,12(sp)
    2e48:	02010113          	addi	sp,sp,32
    2e4c:	00008067          	ret

00002e50 <fatfs_get_sfn_display_name>:
    2e50:	00000713          	li	a4,0
    2e54:	02000613          	li	a2,32
    2e58:	01900813          	li	a6,25
    2e5c:	0005c783          	lbu	a5,0(a1)
    2e60:	00078663          	beqz	a5,2e6c <fatfs_get_sfn_display_name+0x1c>
    2e64:	ff470693          	addi	a3,a4,-12
    2e68:	00069863          	bnez	a3,2e78 <fatfs_get_sfn_display_name+0x28>
    2e6c:	00050023          	sb	zero,0(a0)
    2e70:	00100513          	li	a0,1
    2e74:	00008067          	ret
    2e78:	00158593          	addi	a1,a1,1
    2e7c:	fec780e3          	beq	a5,a2,2e5c <fatfs_get_sfn_display_name+0xc>
    2e80:	fbf78693          	addi	a3,a5,-65
    2e84:	0ff6f693          	zext.b	a3,a3
    2e88:	00d86663          	bltu	a6,a3,2e94 <fatfs_get_sfn_display_name+0x44>
    2e8c:	02078793          	addi	a5,a5,32
    2e90:	0ff7f793          	zext.b	a5,a5
    2e94:	00f50023          	sb	a5,0(a0)
    2e98:	00170713          	addi	a4,a4,1
    2e9c:	00150513          	addi	a0,a0,1
    2ea0:	fbdff06f          	j	2e5c <fatfs_get_sfn_display_name+0xc>

00002ea4 <fatfs_fat_init>:
    2ea4:	ff010113          	addi	sp,sp,-16
    2ea8:	00812423          	sw	s0,8(sp)
    2eac:	00912223          	sw	s1,4(sp)
    2eb0:	00112623          	sw	ra,12(sp)
    2eb4:	fff00793          	li	a5,-1
    2eb8:	25850493          	addi	s1,a0,600
    2ebc:	00050413          	mv	s0,a0
    2ec0:	44f52c23          	sw	a5,1112(a0)
    2ec4:	24052a23          	sw	zero,596(a0)
    2ec8:	44052e23          	sw	zero,1116(a0)
    2ecc:	20000613          	li	a2,512
    2ed0:	00048513          	mv	a0,s1
    2ed4:	00000593          	li	a1,0
    2ed8:	ffffe097          	auipc	ra,0xffffe
    2edc:	714080e7          	jalr	1812(ra) # 15ec <memset>
    2ee0:	25442783          	lw	a5,596(s0)
    2ee4:	00c12083          	lw	ra,12(sp)
    2ee8:	24942a23          	sw	s1,596(s0)
    2eec:	46042023          	sw	zero,1120(s0)
    2ef0:	46f42223          	sw	a5,1124(s0)
    2ef4:	00812403          	lw	s0,8(sp)
    2ef8:	00412483          	lw	s1,4(sp)
    2efc:	01010113          	addi	sp,sp,16
    2f00:	00008067          	ret

00002f04 <fatfs_init>:
    2f04:	fd010113          	addi	sp,sp,-48
    2f08:	02812423          	sw	s0,40(sp)
    2f0c:	02112623          	sw	ra,44(sp)
    2f10:	02912223          	sw	s1,36(sp)
    2f14:	03212023          	sw	s2,32(sp)
    2f18:	01312e23          	sw	s3,28(sp)
    2f1c:	fff00793          	li	a5,-1
    2f20:	24f52223          	sw	a5,580(a0)
    2f24:	24052423          	sw	zero,584(a0)
    2f28:	02052223          	sw	zero,36(a0)
    2f2c:	00050413          	mv	s0,a0
    2f30:	00000097          	auipc	ra,0x0
    2f34:	f74080e7          	jalr	-140(ra) # 2ea4 <fatfs_fat_init>
    2f38:	03442783          	lw	a5,52(s0)
    2f3c:	02079463          	bnez	a5,2f64 <fatfs_init+0x60>
    2f40:	fff00713          	li	a4,-1
    2f44:	02c12083          	lw	ra,44(sp)
    2f48:	02812403          	lw	s0,40(sp)
    2f4c:	02412483          	lw	s1,36(sp)
    2f50:	02012903          	lw	s2,32(sp)
    2f54:	01c12983          	lw	s3,28(sp)
    2f58:	00070513          	mv	a0,a4
    2f5c:	03010113          	addi	sp,sp,48
    2f60:	00008067          	ret
    2f64:	04440593          	addi	a1,s0,68
    2f68:	00100613          	li	a2,1
    2f6c:	00000513          	li	a0,0
    2f70:	00b12623          	sw	a1,12(sp)
    2f74:	000780e7          	jalr	a5
    2f78:	fc0504e3          	beqz	a0,2f40 <fatfs_init+0x3c>
    2f7c:	24244703          	lbu	a4,578(s0)
    2f80:	05500793          	li	a5,85
    2f84:	00c12583          	lw	a1,12(sp)
    2f88:	00f70663          	beq	a4,a5,2f94 <fatfs_init+0x90>
    2f8c:	ffd00713          	li	a4,-3
    2f90:	fb5ff06f          	j	2f44 <fatfs_init+0x40>
    2f94:	24344703          	lbu	a4,579(s0)
    2f98:	0aa00793          	li	a5,170
    2f9c:	fef718e3          	bne	a4,a5,2f8c <fatfs_init+0x88>
    2fa0:	20644783          	lbu	a5,518(s0)
    2fa4:	00600713          	li	a4,6
    2fa8:	02f76463          	bltu	a4,a5,2fd0 <fatfs_init+0xcc>
    2fac:	00400713          	li	a4,4
    2fb0:	00f76663          	bltu	a4,a5,2fbc <fatfs_init+0xb8>
    2fb4:	00000513          	li	a0,0
    2fb8:	02078663          	beqz	a5,2fe4 <fatfs_init+0xe0>
    2fbc:	20c45503          	lhu	a0,524(s0)
    2fc0:	20a45783          	lhu	a5,522(s0)
    2fc4:	01051513          	slli	a0,a0,0x10
    2fc8:	00f56533          	or	a0,a0,a5
    2fcc:	0180006f          	j	2fe4 <fatfs_init+0xe0>
    2fd0:	00c00713          	li	a4,12
    2fd4:	12f76663          	bltu	a4,a5,3100 <fatfs_init+0x1fc>
    2fd8:	00a00713          	li	a4,10
    2fdc:	00000513          	li	a0,0
    2fe0:	fcf76ee3          	bltu	a4,a5,2fbc <fatfs_init+0xb8>
    2fe4:	03442783          	lw	a5,52(s0)
    2fe8:	00a42e23          	sw	a0,28(s0)
    2fec:	00100613          	li	a2,1
    2ff0:	000780e7          	jalr	a5
    2ff4:	f40506e3          	beqz	a0,2f40 <fatfs_init+0x3c>
    2ff8:	05044783          	lbu	a5,80(s0)
    2ffc:	04f44703          	lbu	a4,79(s0)
    3000:	20000693          	li	a3,512
    3004:	00879793          	slli	a5,a5,0x8
    3008:	00e7e7b3          	or	a5,a5,a4
    300c:	ffe00713          	li	a4,-2
    3010:	f2d79ae3          	bne	a5,a3,2f44 <fatfs_init+0x40>
    3014:	05644483          	lbu	s1,86(s0)
    3018:	05544783          	lbu	a5,85(s0)
    301c:	05144983          	lbu	s3,81(s0)
    3020:	00849493          	slli	s1,s1,0x8
    3024:	05a45583          	lhu	a1,90(s0)
    3028:	00f4e4b3          	or	s1,s1,a5
    302c:	01340023          	sb	s3,0(s0)
    3030:	02941423          	sh	s1,40(s0)
    3034:	05245903          	lhu	s2,82(s0)
    3038:	05444503          	lbu	a0,84(s0)
    303c:	00059463          	bnez	a1,3044 <fatfs_init+0x140>
    3040:	06842583          	lw	a1,104(s0)
    3044:	07042783          	lw	a5,112(s0)
    3048:	02b42023          	sw	a1,32(s0)
    304c:	00549493          	slli	s1,s1,0x5
    3050:	00f42423          	sw	a5,8(s0)
    3054:	07445783          	lhu	a5,116(s0)
    3058:	1ff48493          	addi	s1,s1,511
    305c:	4094d493          	srai	s1,s1,0x9
    3060:	00f41c23          	sh	a5,24(s0)
    3064:	fffff097          	auipc	ra,0xfffff
    3068:	ccc080e7          	jalr	-820(ra) # 1d30 <__mulsi3>
    306c:	00a907b3          	add	a5,s2,a0
    3070:	00f42623          	sw	a5,12(s0)
    3074:	01c42783          	lw	a5,28(s0)
    3078:	24245703          	lhu	a4,578(s0)
    307c:	00942823          	sw	s1,16(s0)
    3080:	00f907b3          	add	a5,s2,a5
    3084:	00f42a23          	sw	a5,20(s0)
    3088:	00f507b3          	add	a5,a0,a5
    308c:	00f42223          	sw	a5,4(s0)
    3090:	0000b7b7          	lui	a5,0xb
    3094:	a5578793          	addi	a5,a5,-1451 # aa55 <_files+0x327d>
    3098:	eef71ae3          	bne	a4,a5,2f8c <fatfs_init+0x88>
    309c:	05844783          	lbu	a5,88(s0)
    30a0:	05744703          	lbu	a4,87(s0)
    30a4:	00879793          	slli	a5,a5,0x8
    30a8:	00e7e7b3          	or	a5,a5,a4
    30ac:	00079463          	bnez	a5,30b4 <fatfs_init+0x1b0>
    30b0:	06442783          	lw	a5,100(s0)
    30b4:	ffb00713          	li	a4,-5
    30b8:	e80986e3          	beqz	s3,2f44 <fatfs_init+0x40>
    30bc:	00990933          	add	s2,s2,s1
    30c0:	00a90533          	add	a0,s2,a0
    30c4:	40a78533          	sub	a0,a5,a0
    30c8:	00098593          	mv	a1,s3
    30cc:	ffffe097          	auipc	ra,0xffffe
    30d0:	474080e7          	jalr	1140(ra) # 1540 <__udivsi3>
    30d4:	000017b7          	lui	a5,0x1
    30d8:	ff478793          	addi	a5,a5,-12 # ff4 <sdcard_send+0x28>
    30dc:	ffb00713          	li	a4,-5
    30e0:	e6a7f2e3          	bgeu	a5,a0,2f44 <fatfs_init+0x40>
    30e4:	000107b7          	lui	a5,0x10
    30e8:	ff478793          	addi	a5,a5,-12 # fff4 <_files+0x881c>
    30ec:	02a7e663          	bltu	a5,a0,3118 <fatfs_init+0x214>
    30f0:	00042423          	sw	zero,8(s0)
    30f4:	02042823          	sw	zero,48(s0)
    30f8:	00000713          	li	a4,0
    30fc:	e49ff06f          	j	2f44 <fatfs_init+0x40>
    3100:	ff278793          	addi	a5,a5,-14
    3104:	0ff7f793          	zext.b	a5,a5
    3108:	00100713          	li	a4,1
    310c:	00000513          	li	a0,0
    3110:	eaf776e3          	bgeu	a4,a5,2fbc <fatfs_init+0xb8>
    3114:	ed1ff06f          	j	2fe4 <fatfs_init+0xe0>
    3118:	00100793          	li	a5,1
    311c:	02f42823          	sw	a5,48(s0)
    3120:	fd9ff06f          	j	30f8 <fatfs_init+0x1f4>

00003124 <fl_attach_media>:
    3124:	000057b7          	lui	a5,0x5
    3128:	7507a783          	lw	a5,1872(a5) # 5750 <_filelib_init>
    312c:	fe010113          	addi	sp,sp,-32
    3130:	00812c23          	sw	s0,24(sp)
    3134:	00112e23          	sw	ra,28(sp)
    3138:	00050413          	mv	s0,a0
    313c:	00079a63          	bnez	a5,3150 <fl_attach_media+0x2c>
    3140:	00b12623          	sw	a1,12(sp)
    3144:	fffff097          	auipc	ra,0xfffff
    3148:	080080e7          	jalr	128(ra) # 21c4 <fl_init>
    314c:	00c12583          	lw	a1,12(sp)
    3150:	000077b7          	lui	a5,0x7
    3154:	37078513          	addi	a0,a5,880 # 7370 <_fs>
    3158:	02b52c23          	sw	a1,56(a0)
    315c:	02852a23          	sw	s0,52(a0)
    3160:	00000097          	auipc	ra,0x0
    3164:	da4080e7          	jalr	-604(ra) # 2f04 <fatfs_init>
    3168:	00050593          	mv	a1,a0
    316c:	02050863          	beqz	a0,319c <fl_attach_media+0x78>
    3170:	00a12623          	sw	a0,12(sp)
    3174:	00005537          	lui	a0,0x5
    3178:	2e850513          	addi	a0,a0,744 # 52e8 <LEDS+0x124>
    317c:	fffff097          	auipc	ra,0xfffff
    3180:	a78080e7          	jalr	-1416(ra) # 1bf4 <printf>
    3184:	00c12583          	lw	a1,12(sp)
    3188:	01c12083          	lw	ra,28(sp)
    318c:	01812403          	lw	s0,24(sp)
    3190:	00058513          	mv	a0,a1
    3194:	02010113          	addi	sp,sp,32
    3198:	00008067          	ret
    319c:	000057b7          	lui	a5,0x5
    31a0:	00100713          	li	a4,1
    31a4:	74e7a623          	sw	a4,1868(a5) # 574c <_filelib_valid>
    31a8:	fe1ff06f          	j	3188 <fl_attach_media+0x64>

000031ac <fatfs_fat_purge>:
    31ac:	25452583          	lw	a1,596(a0)
    31b0:	fe010113          	addi	sp,sp,-32
    31b4:	00812c23          	sw	s0,24(sp)
    31b8:	00112e23          	sw	ra,28(sp)
    31bc:	00050413          	mv	s0,a0
    31c0:	00059663          	bnez	a1,31cc <fatfs_fat_purge+0x20>
    31c4:	00100513          	li	a0,1
    31c8:	02c0006f          	j	31f4 <fatfs_fat_purge+0x48>
    31cc:	2045a783          	lw	a5,516(a1)
    31d0:	00079663          	bnez	a5,31dc <fatfs_fat_purge+0x30>
    31d4:	20c5a583          	lw	a1,524(a1)
    31d8:	fe9ff06f          	j	31c0 <fatfs_fat_purge+0x14>
    31dc:	00040513          	mv	a0,s0
    31e0:	00b12623          	sw	a1,12(sp)
    31e4:	fffff097          	auipc	ra,0xfffff
    31e8:	c80080e7          	jalr	-896(ra) # 1e64 <fatfs_fat_writeback>
    31ec:	00c12583          	lw	a1,12(sp)
    31f0:	fe0512e3          	bnez	a0,31d4 <fatfs_fat_purge+0x28>
    31f4:	01c12083          	lw	ra,28(sp)
    31f8:	01812403          	lw	s0,24(sp)
    31fc:	02010113          	addi	sp,sp,32
    3200:	00008067          	ret

00003204 <fatfs_find_next_cluster>:
    3204:	ff010113          	addi	sp,sp,-16
    3208:	00812423          	sw	s0,8(sp)
    320c:	01212023          	sw	s2,0(sp)
    3210:	00112623          	sw	ra,12(sp)
    3214:	00912223          	sw	s1,4(sp)
    3218:	00050913          	mv	s2,a0
    321c:	00200413          	li	s0,2
    3220:	00058463          	beqz	a1,3228 <fatfs_find_next_cluster+0x24>
    3224:	00058413          	mv	s0,a1
    3228:	03092783          	lw	a5,48(s2)
    322c:	00745493          	srli	s1,s0,0x7
    3230:	00079463          	bnez	a5,3238 <fatfs_find_next_cluster+0x34>
    3234:	00845493          	srli	s1,s0,0x8
    3238:	01492583          	lw	a1,20(s2)
    323c:	00090513          	mv	a0,s2
    3240:	00b485b3          	add	a1,s1,a1
    3244:	fffff097          	auipc	ra,0xfffff
    3248:	ca4080e7          	jalr	-860(ra) # 1ee8 <fatfs_fat_read_sector>
    324c:	00050793          	mv	a5,a0
    3250:	fff00513          	li	a0,-1
    3254:	04078863          	beqz	a5,32a4 <fatfs_find_next_cluster+0xa0>
    3258:	03092703          	lw	a4,48(s2)
    325c:	2087a783          	lw	a5,520(a5)
    3260:	04071e63          	bnez	a4,32bc <fatfs_find_next_cluster+0xb8>
    3264:	00849493          	slli	s1,s1,0x8
    3268:	40940433          	sub	s0,s0,s1
    326c:	00141413          	slli	s0,s0,0x1
    3270:	01041413          	slli	s0,s0,0x10
    3274:	01045413          	srli	s0,s0,0x10
    3278:	008787b3          	add	a5,a5,s0
    327c:	0017c503          	lbu	a0,1(a5)
    3280:	0007c783          	lbu	a5,0(a5)
    3284:	00851513          	slli	a0,a0,0x8
    3288:	00f50533          	add	a0,a0,a5
    328c:	ffff07b7          	lui	a5,0xffff0
    3290:	00878793          	addi	a5,a5,8 # ffff0008 <__stacktop+0xfffe0008>
    3294:	00f507b3          	add	a5,a0,a5
    3298:	00700713          	li	a4,7
    329c:	00f76463          	bltu	a4,a5,32a4 <fatfs_find_next_cluster+0xa0>
    32a0:	fff00513          	li	a0,-1
    32a4:	00c12083          	lw	ra,12(sp)
    32a8:	00812403          	lw	s0,8(sp)
    32ac:	00412483          	lw	s1,4(sp)
    32b0:	00012903          	lw	s2,0(sp)
    32b4:	01010113          	addi	sp,sp,16
    32b8:	00008067          	ret
    32bc:	00749493          	slli	s1,s1,0x7
    32c0:	40940433          	sub	s0,s0,s1
    32c4:	00241413          	slli	s0,s0,0x2
    32c8:	01041413          	slli	s0,s0,0x10
    32cc:	01045413          	srli	s0,s0,0x10
    32d0:	008787b3          	add	a5,a5,s0
    32d4:	0037c503          	lbu	a0,3(a5)
    32d8:	0027c703          	lbu	a4,2(a5)
    32dc:	01851513          	slli	a0,a0,0x18
    32e0:	01071713          	slli	a4,a4,0x10
    32e4:	00e50533          	add	a0,a0,a4
    32e8:	0007c703          	lbu	a4,0(a5)
    32ec:	0017c783          	lbu	a5,1(a5)
    32f0:	00e50533          	add	a0,a0,a4
    32f4:	00879793          	slli	a5,a5,0x8
    32f8:	00f50533          	add	a0,a0,a5
    32fc:	00451513          	slli	a0,a0,0x4
    3300:	00455513          	srli	a0,a0,0x4
    3304:	f00007b7          	lui	a5,0xf0000
    3308:	f89ff06f          	j	3290 <fatfs_find_next_cluster+0x8c>

0000330c <fatfs_sector_reader>:
    330c:	03052783          	lw	a5,48(a0)
    3310:	fe010113          	addi	sp,sp,-32
    3314:	00812c23          	sw	s0,24(sp)
    3318:	01212823          	sw	s2,16(sp)
    331c:	01512223          	sw	s5,4(sp)
    3320:	00112e23          	sw	ra,28(sp)
    3324:	00912a23          	sw	s1,20(sp)
    3328:	01312623          	sw	s3,12(sp)
    332c:	01412423          	sw	s4,8(sp)
    3330:	01612023          	sw	s6,0(sp)
    3334:	00f5e7b3          	or	a5,a1,a5
    3338:	00050413          	mv	s0,a0
    333c:	00060913          	mv	s2,a2
    3340:	00068a93          	mv	s5,a3
    3344:	08079063          	bnez	a5,33c4 <fatfs_sector_reader+0xb8>
    3348:	01052783          	lw	a5,16(a0)
    334c:	02f66863          	bltu	a2,a5,337c <fatfs_sector_reader+0x70>
    3350:	00000513          	li	a0,0
    3354:	01c12083          	lw	ra,28(sp)
    3358:	01812403          	lw	s0,24(sp)
    335c:	01412483          	lw	s1,20(sp)
    3360:	01012903          	lw	s2,16(sp)
    3364:	00c12983          	lw	s3,12(sp)
    3368:	00812a03          	lw	s4,8(sp)
    336c:	00412a83          	lw	s5,4(sp)
    3370:	00012b03          	lw	s6,0(sp)
    3374:	02010113          	addi	sp,sp,32
    3378:	00008067          	ret
    337c:	01c52503          	lw	a0,28(a0)
    3380:	00c42783          	lw	a5,12(s0)
    3384:	00f50533          	add	a0,a0,a5
    3388:	01250533          	add	a0,a0,s2
    338c:	0a0a8663          	beqz	s5,3438 <fatfs_sector_reader+0x12c>
    3390:	03442783          	lw	a5,52(s0)
    3394:	00100613          	li	a2,1
    3398:	000a8593          	mv	a1,s5
    339c:	01812403          	lw	s0,24(sp)
    33a0:	01c12083          	lw	ra,28(sp)
    33a4:	01412483          	lw	s1,20(sp)
    33a8:	01012903          	lw	s2,16(sp)
    33ac:	00c12983          	lw	s3,12(sp)
    33b0:	00812a03          	lw	s4,8(sp)
    33b4:	00412a83          	lw	s5,4(sp)
    33b8:	00012b03          	lw	s6,0(sp)
    33bc:	02010113          	addi	sp,sp,32
    33c0:	00078067          	jr	a5 # f0000000 <__stacktop+0xefff0000>
    33c4:	00054783          	lbu	a5,0(a0)
    33c8:	00058493          	mv	s1,a1
    33cc:	00060513          	mv	a0,a2
    33d0:	00078593          	mv	a1,a5
    33d4:	00078a13          	mv	s4,a5
    33d8:	ffffe097          	auipc	ra,0xffffe
    33dc:	168080e7          	jalr	360(ra) # 1540 <__udivsi3>
    33e0:	00050b13          	mv	s6,a0
    33e4:	00000993          	li	s3,0
    33e8:	03699a63          	bne	s3,s6,341c <fatfs_sector_reader+0x110>
    33ec:	fff00793          	li	a5,-1
    33f0:	f6f480e3          	beq	s1,a5,3350 <fatfs_sector_reader+0x44>
    33f4:	000a0593          	mv	a1,s4
    33f8:	00090513          	mv	a0,s2
    33fc:	ffffe097          	auipc	ra,0xffffe
    3400:	18c080e7          	jalr	396(ra) # 1588 <__umodsi3>
    3404:	00050913          	mv	s2,a0
    3408:	00048593          	mv	a1,s1
    340c:	00040513          	mv	a0,s0
    3410:	fffff097          	auipc	ra,0xfffff
    3414:	c84080e7          	jalr	-892(ra) # 2094 <fatfs_lba_of_cluster>
    3418:	f71ff06f          	j	3388 <fatfs_sector_reader+0x7c>
    341c:	00048593          	mv	a1,s1
    3420:	00040513          	mv	a0,s0
    3424:	00000097          	auipc	ra,0x0
    3428:	de0080e7          	jalr	-544(ra) # 3204 <fatfs_find_next_cluster>
    342c:	00050493          	mv	s1,a0
    3430:	00198993          	addi	s3,s3,1
    3434:	fb5ff06f          	j	33e8 <fatfs_sector_reader+0xdc>
    3438:	24442783          	lw	a5,580(s0)
    343c:	00a78c63          	beq	a5,a0,3454 <fatfs_sector_reader+0x148>
    3440:	03442783          	lw	a5,52(s0)
    3444:	24a42223          	sw	a0,580(s0)
    3448:	00100613          	li	a2,1
    344c:	04440593          	addi	a1,s0,68
    3450:	f4dff06f          	j	339c <fatfs_sector_reader+0x90>
    3454:	00100513          	li	a0,1
    3458:	efdff06f          	j	3354 <fatfs_sector_reader+0x48>

0000345c <fatfs_get_file_entry>:
    345c:	eb010113          	addi	sp,sp,-336
    3460:	14812423          	sw	s0,328(sp)
    3464:	14912223          	sw	s1,324(sp)
    3468:	13312e23          	sw	s3,316(sp)
    346c:	13712623          	sw	s7,300(sp)
    3470:	13812423          	sw	s8,296(sp)
    3474:	13912223          	sw	s9,292(sp)
    3478:	14112623          	sw	ra,332(sp)
    347c:	15212023          	sw	s2,320(sp)
    3480:	13412c23          	sw	s4,312(sp)
    3484:	13512a23          	sw	s5,308(sp)
    3488:	13612823          	sw	s6,304(sp)
    348c:	00050993          	mv	s3,a0
    3490:	00058c93          	mv	s9,a1
    3494:	00060b93          	mv	s7,a2
    3498:	00068c13          	mv	s8,a3
    349c:	10010ea3          	sb	zero,285(sp)
    34a0:	01810413          	addi	s0,sp,24
    34a4:	11c10493          	addi	s1,sp,284
    34a8:	00040513          	mv	a0,s0
    34ac:	00d00613          	li	a2,13
    34b0:	00000593          	li	a1,0
    34b4:	00d40413          	addi	s0,s0,13
    34b8:	ffffe097          	auipc	ra,0xffffe
    34bc:	134080e7          	jalr	308(ra) # 15ec <memset>
    34c0:	fe9414e3          	bne	s0,s1,34a8 <fatfs_get_file_entry+0x4c>
    34c4:	00000493          	li	s1,0
    34c8:	24498a13          	addi	s4,s3,580
    34cc:	00810913          	addi	s2,sp,8
    34d0:	00800a93          	li	s5,8
    34d4:	02e00b13          	li	s6,46
    34d8:	00000693          	li	a3,0
    34dc:	00048613          	mv	a2,s1
    34e0:	000c8593          	mv	a1,s9
    34e4:	00098513          	mv	a0,s3
    34e8:	00000097          	auipc	ra,0x0
    34ec:	e24080e7          	jalr	-476(ra) # 330c <fatfs_sector_reader>
    34f0:	08050c63          	beqz	a0,3588 <fatfs_get_file_entry+0x12c>
    34f4:	00148493          	addi	s1,s1,1
    34f8:	04498413          	addi	s0,s3,68
    34fc:	00040513          	mv	a0,s0
    3500:	fffff097          	auipc	ra,0xfffff
    3504:	f34080e7          	jalr	-204(ra) # 2434 <fatfs_entry_lfn_text>
    3508:	02050063          	beqz	a0,3528 <fatfs_get_file_entry+0xcc>
    350c:	00040593          	mv	a1,s0
    3510:	01810513          	addi	a0,sp,24
    3514:	fffff097          	auipc	ra,0xfffff
    3518:	e18080e7          	jalr	-488(ra) # 232c <fatfs_lfn_cache_entry>
    351c:	02040413          	addi	s0,s0,32
    3520:	fd441ee3          	bne	s0,s4,34fc <fatfs_get_file_entry+0xa0>
    3524:	fb5ff06f          	j	34d8 <fatfs_get_file_entry+0x7c>
    3528:	00040513          	mv	a0,s0
    352c:	fffff097          	auipc	ra,0xfffff
    3530:	f1c080e7          	jalr	-228(ra) # 2448 <fatfs_entry_lfn_invalid>
    3534:	00050663          	beqz	a0,3540 <fatfs_get_file_entry+0xe4>
    3538:	10010ea3          	sb	zero,285(sp)
    353c:	fe1ff06f          	j	351c <fatfs_get_file_entry+0xc0>
    3540:	00040593          	mv	a1,s0
    3544:	01810513          	addi	a0,sp,24
    3548:	fffff097          	auipc	ra,0xfffff
    354c:	f34080e7          	jalr	-204(ra) # 247c <fatfs_entry_lfn_exists>
    3550:	06050663          	beqz	a0,35bc <fatfs_get_file_entry+0x160>
    3554:	01810513          	addi	a0,sp,24
    3558:	fffff097          	auipc	ra,0xfffff
    355c:	ea0080e7          	jalr	-352(ra) # 23f8 <fatfs_lfn_cache_get>
    3560:	000b8593          	mv	a1,s7
    3564:	fffff097          	auipc	ra,0xfffff
    3568:	6dc080e7          	jalr	1756(ra) # 2c40 <fatfs_compare_names>
    356c:	fc0506e3          	beqz	a0,3538 <fatfs_get_file_entry+0xdc>
    3570:	02000613          	li	a2,32
    3574:	00040593          	mv	a1,s0
    3578:	000c0513          	mv	a0,s8
    357c:	ffffe097          	auipc	ra,0xffffe
    3580:	08c080e7          	jalr	140(ra) # 1608 <memcpy>
    3584:	00100513          	li	a0,1
    3588:	14c12083          	lw	ra,332(sp)
    358c:	14812403          	lw	s0,328(sp)
    3590:	14412483          	lw	s1,324(sp)
    3594:	14012903          	lw	s2,320(sp)
    3598:	13c12983          	lw	s3,316(sp)
    359c:	13812a03          	lw	s4,312(sp)
    35a0:	13412a83          	lw	s5,308(sp)
    35a4:	13012b03          	lw	s6,304(sp)
    35a8:	12c12b83          	lw	s7,300(sp)
    35ac:	12812c03          	lw	s8,296(sp)
    35b0:	12412c83          	lw	s9,292(sp)
    35b4:	15010113          	addi	sp,sp,336
    35b8:	00008067          	ret
    35bc:	00040513          	mv	a0,s0
    35c0:	fffff097          	auipc	ra,0xfffff
    35c4:	f0c080e7          	jalr	-244(ra) # 24cc <fatfs_entry_sfn_only>
    35c8:	f4050ae3          	beqz	a0,351c <fatfs_get_file_entry+0xc0>
    35cc:	00d00613          	li	a2,13
    35d0:	00000593          	li	a1,0
    35d4:	00090513          	mv	a0,s2
    35d8:	ffffe097          	auipc	ra,0xffffe
    35dc:	014080e7          	jalr	20(ra) # 15ec <memset>
    35e0:	00000793          	li	a5,0
    35e4:	00f406b3          	add	a3,s0,a5
    35e8:	0006c683          	lbu	a3,0(a3)
    35ec:	00f90733          	add	a4,s2,a5
    35f0:	00178793          	addi	a5,a5,1
    35f4:	00d70023          	sb	a3,0(a4)
    35f8:	ff5796e3          	bne	a5,s5,35e4 <fatfs_get_file_entry+0x188>
    35fc:	00844703          	lbu	a4,8(s0)
    3600:	00944783          	lbu	a5,9(s0)
    3604:	00a44683          	lbu	a3,10(s0)
    3608:	00e108a3          	sb	a4,17(sp)
    360c:	00f10923          	sb	a5,18(sp)
    3610:	fe070713          	addi	a4,a4,-32
    3614:	fe078793          	addi	a5,a5,-32
    3618:	00f037b3          	snez	a5,a5
    361c:	00e03733          	snez	a4,a4
    3620:	00d109a3          	sb	a3,19(sp)
    3624:	00e7e7b3          	or	a5,a5,a4
    3628:	00079863          	bnez	a5,3638 <fatfs_get_file_entry+0x1dc>
    362c:	fe068693          	addi	a3,a3,-32
    3630:	02000793          	li	a5,32
    3634:	00068a63          	beqz	a3,3648 <fatfs_get_file_entry+0x1ec>
    3638:	00814703          	lbu	a4,8(sp)
    363c:	02e00793          	li	a5,46
    3640:	01671463          	bne	a4,s6,3648 <fatfs_get_file_entry+0x1ec>
    3644:	02000793          	li	a5,32
    3648:	00f10823          	sb	a5,16(sp)
    364c:	000b8593          	mv	a1,s7
    3650:	00090513          	mv	a0,s2
    3654:	f11ff06f          	j	3564 <fatfs_get_file_entry+0x108>

00003658 <_open_directory>:
    3658:	eb010113          	addi	sp,sp,-336
    365c:	15212023          	sw	s2,320(sp)
    3660:	00007937          	lui	s2,0x7
    3664:	37090913          	addi	s2,s2,880 # 7370 <_fs>
    3668:	14812423          	sw	s0,328(sp)
    366c:	00892403          	lw	s0,8(s2)
    3670:	14912223          	sw	s1,324(sp)
    3674:	13312e23          	sw	s3,316(sp)
    3678:	13412c23          	sw	s4,312(sp)
    367c:	13512a23          	sw	s5,308(sp)
    3680:	13612823          	sw	s6,304(sp)
    3684:	14112623          	sw	ra,332(sp)
    3688:	00050a13          	mv	s4,a0
    368c:	00058a93          	mv	s5,a1
    3690:	fffff097          	auipc	ra,0xfffff
    3694:	368080e7          	jalr	872(ra) # 29f8 <fatfs_total_path_levels>
    3698:	00050b13          	mv	s6,a0
    369c:	00000493          	li	s1,0
    36a0:	fff00993          	li	s3,-1
    36a4:	009b5863          	bge	s6,s1,36b4 <_open_directory+0x5c>
    36a8:	008aa023          	sw	s0,0(s5)
    36ac:	00100513          	li	a0,1
    36b0:	0240006f          	j	36d4 <_open_directory+0x7c>
    36b4:	10400693          	li	a3,260
    36b8:	02c10613          	addi	a2,sp,44
    36bc:	00048593          	mv	a1,s1
    36c0:	000a0513          	mv	a0,s4
    36c4:	fffff097          	auipc	ra,0xfffff
    36c8:	3a4080e7          	jalr	932(ra) # 2a68 <fatfs_get_substring>
    36cc:	03351863          	bne	a0,s3,36fc <_open_directory+0xa4>
    36d0:	00000513          	li	a0,0
    36d4:	14c12083          	lw	ra,332(sp)
    36d8:	14812403          	lw	s0,328(sp)
    36dc:	14412483          	lw	s1,324(sp)
    36e0:	14012903          	lw	s2,320(sp)
    36e4:	13c12983          	lw	s3,316(sp)
    36e8:	13812a03          	lw	s4,312(sp)
    36ec:	13412a83          	lw	s5,308(sp)
    36f0:	13012b03          	lw	s6,304(sp)
    36f4:	15010113          	addi	sp,sp,336
    36f8:	00008067          	ret
    36fc:	00c10693          	addi	a3,sp,12
    3700:	02c10613          	addi	a2,sp,44
    3704:	00040593          	mv	a1,s0
    3708:	00090513          	mv	a0,s2
    370c:	00000097          	auipc	ra,0x0
    3710:	d50080e7          	jalr	-688(ra) # 345c <fatfs_get_file_entry>
    3714:	fa050ee3          	beqz	a0,36d0 <_open_directory+0x78>
    3718:	01714783          	lbu	a5,23(sp)
    371c:	0107f793          	andi	a5,a5,16
    3720:	fa0788e3          	beqz	a5,36d0 <_open_directory+0x78>
    3724:	02015403          	lhu	s0,32(sp)
    3728:	02615783          	lhu	a5,38(sp)
    372c:	00148493          	addi	s1,s1,1
    3730:	01041413          	slli	s0,s0,0x10
    3734:	00f40433          	add	s0,s0,a5
    3738:	f6dff06f          	j	36a4 <_open_directory+0x4c>

0000373c <fl_opendir>:
    373c:	fe010113          	addi	sp,sp,-32
    3740:	fff00793          	li	a5,-1
    3744:	00f12623          	sw	a5,12(sp)
    3748:	000057b7          	lui	a5,0x5
    374c:	7507a783          	lw	a5,1872(a5) # 5750 <_filelib_init>
    3750:	00812c23          	sw	s0,24(sp)
    3754:	01212823          	sw	s2,16(sp)
    3758:	00112e23          	sw	ra,28(sp)
    375c:	00912a23          	sw	s1,20(sp)
    3760:	00050913          	mv	s2,a0
    3764:	00058413          	mv	s0,a1
    3768:	00079663          	bnez	a5,3774 <fl_opendir+0x38>
    376c:	fffff097          	auipc	ra,0xfffff
    3770:	a58080e7          	jalr	-1448(ra) # 21c4 <fl_init>
    3774:	000074b7          	lui	s1,0x7
    3778:	37048493          	addi	s1,s1,880 # 7370 <_fs>
    377c:	03c4a783          	lw	a5,60(s1)
    3780:	00078463          	beqz	a5,3788 <fl_opendir+0x4c>
    3784:	000780e7          	jalr	a5
    3788:	00090513          	mv	a0,s2
    378c:	fffff097          	auipc	ra,0xfffff
    3790:	26c080e7          	jalr	620(ra) # 29f8 <fatfs_total_path_levels>
    3794:	fff00793          	li	a5,-1
    3798:	02f51063          	bne	a0,a5,37b8 <fl_opendir+0x7c>
    379c:	0084a783          	lw	a5,8(s1)
    37a0:	00f12623          	sw	a5,12(sp)
    37a4:	00c12783          	lw	a5,12(sp)
    37a8:	00042023          	sw	zero,0(s0)
    37ac:	00040423          	sb	zero,8(s0)
    37b0:	00f42223          	sw	a5,4(s0)
    37b4:	0180006f          	j	37cc <fl_opendir+0x90>
    37b8:	00c10593          	addi	a1,sp,12
    37bc:	00090513          	mv	a0,s2
    37c0:	00000097          	auipc	ra,0x0
    37c4:	e98080e7          	jalr	-360(ra) # 3658 <_open_directory>
    37c8:	fc051ee3          	bnez	a0,37a4 <fl_opendir+0x68>
    37cc:	0404a783          	lw	a5,64(s1)
    37d0:	00078463          	beqz	a5,37d8 <fl_opendir+0x9c>
    37d4:	000780e7          	jalr	a5
    37d8:	00c12703          	lw	a4,12(sp)
    37dc:	fff00793          	li	a5,-1
    37e0:	00f71463          	bne	a4,a5,37e8 <fl_opendir+0xac>
    37e4:	00000413          	li	s0,0
    37e8:	01c12083          	lw	ra,28(sp)
    37ec:	00040513          	mv	a0,s0
    37f0:	01812403          	lw	s0,24(sp)
    37f4:	01412483          	lw	s1,20(sp)
    37f8:	01012903          	lw	s2,16(sp)
    37fc:	02010113          	addi	sp,sp,32
    3800:	00008067          	ret

00003804 <_open_file>:
    3804:	fc010113          	addi	sp,sp,-64
    3808:	03312623          	sw	s3,44(sp)
    380c:	02112e23          	sw	ra,60(sp)
    3810:	02812c23          	sw	s0,56(sp)
    3814:	02912a23          	sw	s1,52(sp)
    3818:	03212823          	sw	s2,48(sp)
    381c:	00050993          	mv	s3,a0
    3820:	ffffe097          	auipc	ra,0xffffe
    3824:	7b4080e7          	jalr	1972(ra) # 1fd4 <_allocate_file>
    3828:	06050463          	beqz	a0,3890 <_open_file+0x8c>
    382c:	01450913          	addi	s2,a0,20
    3830:	00050413          	mv	s0,a0
    3834:	10400613          	li	a2,260
    3838:	00000593          	li	a1,0
    383c:	00090513          	mv	a0,s2
    3840:	ffffe097          	auipc	ra,0xffffe
    3844:	dac080e7          	jalr	-596(ra) # 15ec <memset>
    3848:	11840493          	addi	s1,s0,280
    384c:	10400613          	li	a2,260
    3850:	00000593          	li	a1,0
    3854:	00048513          	mv	a0,s1
    3858:	ffffe097          	auipc	ra,0xffffe
    385c:	d94080e7          	jalr	-620(ra) # 15ec <memset>
    3860:	10400713          	li	a4,260
    3864:	00048693          	mv	a3,s1
    3868:	00070613          	mv	a2,a4
    386c:	00090593          	mv	a1,s2
    3870:	00098513          	mv	a0,s3
    3874:	fffff097          	auipc	ra,0xfffff
    3878:	2dc080e7          	jalr	732(ra) # 2b50 <fatfs_split_path>
    387c:	fff00793          	li	a5,-1
    3880:	02f51a63          	bne	a0,a5,38b4 <_open_file+0xb0>
    3884:	00040513          	mv	a0,s0
    3888:	ffffe097          	auipc	ra,0xffffe
    388c:	7c4080e7          	jalr	1988(ra) # 204c <_free_file>
    3890:	00000413          	li	s0,0
    3894:	03c12083          	lw	ra,60(sp)
    3898:	00040513          	mv	a0,s0
    389c:	03812403          	lw	s0,56(sp)
    38a0:	03412483          	lw	s1,52(sp)
    38a4:	03012903          	lw	s2,48(sp)
    38a8:	02c12983          	lw	s3,44(sp)
    38ac:	04010113          	addi	sp,sp,64
    38b0:	00008067          	ret
    38b4:	00040513          	mv	a0,s0
    38b8:	fffff097          	auipc	ra,0xfffff
    38bc:	514080e7          	jalr	1300(ra) # 2dcc <_check_file_open>
    38c0:	fc0512e3          	bnez	a0,3884 <_open_file+0x80>
    38c4:	01444783          	lbu	a5,20(s0)
    38c8:	08079c63          	bnez	a5,3960 <_open_file+0x15c>
    38cc:	000077b7          	lui	a5,0x7
    38d0:	3787a783          	lw	a5,888(a5) # 7378 <_fs+0x8>
    38d4:	00f42023          	sw	a5,0(s0)
    38d8:	00042583          	lw	a1,0(s0)
    38dc:	00048613          	mv	a2,s1
    38e0:	000074b7          	lui	s1,0x7
    38e4:	00010693          	mv	a3,sp
    38e8:	37048513          	addi	a0,s1,880 # 7370 <_fs>
    38ec:	00000097          	auipc	ra,0x0
    38f0:	b70080e7          	jalr	-1168(ra) # 345c <fatfs_get_file_entry>
    38f4:	f80508e3          	beqz	a0,3884 <_open_file+0x80>
    38f8:	00b14783          	lbu	a5,11(sp)
    38fc:	0207f793          	andi	a5,a5,32
    3900:	f80782e3          	beqz	a5,3884 <_open_file+0x80>
    3904:	00b00613          	li	a2,11
    3908:	00010593          	mv	a1,sp
    390c:	21c40513          	addi	a0,s0,540
    3910:	ffffe097          	auipc	ra,0xffffe
    3914:	cf8080e7          	jalr	-776(ra) # 1608 <memcpy>
    3918:	01c12783          	lw	a5,28(sp)
    391c:	01a15703          	lhu	a4,26(sp)
    3920:	00042423          	sw	zero,8(s0)
    3924:	00f42623          	sw	a5,12(s0)
    3928:	01415783          	lhu	a5,20(sp)
    392c:	42042a23          	sw	zero,1076(s0)
    3930:	00042823          	sw	zero,16(s0)
    3934:	01079793          	slli	a5,a5,0x10
    3938:	00e787b3          	add	a5,a5,a4
    393c:	00f42223          	sw	a5,4(s0)
    3940:	fff00793          	li	a5,-1
    3944:	42f42823          	sw	a5,1072(s0)
    3948:	22f42423          	sw	a5,552(s0)
    394c:	22f42623          	sw	a5,556(s0)
    3950:	37048513          	addi	a0,s1,880
    3954:	00000097          	auipc	ra,0x0
    3958:	858080e7          	jalr	-1960(ra) # 31ac <fatfs_fat_purge>
    395c:	f39ff06f          	j	3894 <_open_file+0x90>
    3960:	00040593          	mv	a1,s0
    3964:	00090513          	mv	a0,s2
    3968:	00000097          	auipc	ra,0x0
    396c:	cf0080e7          	jalr	-784(ra) # 3658 <_open_directory>
    3970:	f60514e3          	bnez	a0,38d8 <_open_file+0xd4>
    3974:	f11ff06f          	j	3884 <_open_file+0x80>

00003978 <fatfs_sfn_exists>:
    3978:	fe010113          	addi	sp,sp,-32
    397c:	01212823          	sw	s2,16(sp)
    3980:	01312623          	sw	s3,12(sp)
    3984:	01412423          	sw	s4,8(sp)
    3988:	01512223          	sw	s5,4(sp)
    398c:	01612023          	sw	s6,0(sp)
    3990:	00112e23          	sw	ra,28(sp)
    3994:	00812c23          	sw	s0,24(sp)
    3998:	00912a23          	sw	s1,20(sp)
    399c:	00050993          	mv	s3,a0
    39a0:	00058a93          	mv	s5,a1
    39a4:	00060b13          	mv	s6,a2
    39a8:	00000913          	li	s2,0
    39ac:	24450a13          	addi	s4,a0,580
    39b0:	00000693          	li	a3,0
    39b4:	00090613          	mv	a2,s2
    39b8:	000a8593          	mv	a1,s5
    39bc:	00098513          	mv	a0,s3
    39c0:	00000097          	auipc	ra,0x0
    39c4:	94c080e7          	jalr	-1716(ra) # 330c <fatfs_sector_reader>
    39c8:	00050413          	mv	s0,a0
    39cc:	06050263          	beqz	a0,3a30 <fatfs_sfn_exists+0xb8>
    39d0:	00190913          	addi	s2,s2,1
    39d4:	04498493          	addi	s1,s3,68
    39d8:	00048513          	mv	a0,s1
    39dc:	fffff097          	auipc	ra,0xfffff
    39e0:	a58080e7          	jalr	-1448(ra) # 2434 <fatfs_entry_lfn_text>
    39e4:	00050863          	beqz	a0,39f4 <fatfs_sfn_exists+0x7c>
    39e8:	02048493          	addi	s1,s1,32
    39ec:	ff4496e3          	bne	s1,s4,39d8 <fatfs_sfn_exists+0x60>
    39f0:	fc1ff06f          	j	39b0 <fatfs_sfn_exists+0x38>
    39f4:	00048513          	mv	a0,s1
    39f8:	fffff097          	auipc	ra,0xfffff
    39fc:	a50080e7          	jalr	-1456(ra) # 2448 <fatfs_entry_lfn_invalid>
    3a00:	fe0514e3          	bnez	a0,39e8 <fatfs_sfn_exists+0x70>
    3a04:	00048513          	mv	a0,s1
    3a08:	fffff097          	auipc	ra,0xfffff
    3a0c:	ac4080e7          	jalr	-1340(ra) # 24cc <fatfs_entry_sfn_only>
    3a10:	00050413          	mv	s0,a0
    3a14:	fc050ae3          	beqz	a0,39e8 <fatfs_sfn_exists+0x70>
    3a18:	00b00613          	li	a2,11
    3a1c:	000b0593          	mv	a1,s6
    3a20:	00048513          	mv	a0,s1
    3a24:	ffffe097          	auipc	ra,0xffffe
    3a28:	c28080e7          	jalr	-984(ra) # 164c <strncmp>
    3a2c:	fa051ee3          	bnez	a0,39e8 <fatfs_sfn_exists+0x70>
    3a30:	01c12083          	lw	ra,28(sp)
    3a34:	00040513          	mv	a0,s0
    3a38:	01812403          	lw	s0,24(sp)
    3a3c:	01412483          	lw	s1,20(sp)
    3a40:	01012903          	lw	s2,16(sp)
    3a44:	00c12983          	lw	s3,12(sp)
    3a48:	00812a03          	lw	s4,8(sp)
    3a4c:	00412a83          	lw	s5,4(sp)
    3a50:	00012b03          	lw	s6,0(sp)
    3a54:	02010113          	addi	sp,sp,32
    3a58:	00008067          	ret

00003a5c <fatfs_update_file_length>:
    3a5c:	03852783          	lw	a5,56(a0)
    3a60:	14078e63          	beqz	a5,3bbc <fatfs_update_file_length+0x160>
    3a64:	fd010113          	addi	sp,sp,-48
    3a68:	02912223          	sw	s1,36(sp)
    3a6c:	03212023          	sw	s2,32(sp)
    3a70:	01312e23          	sw	s3,28(sp)
    3a74:	01412c23          	sw	s4,24(sp)
    3a78:	01612823          	sw	s6,16(sp)
    3a7c:	01712623          	sw	s7,12(sp)
    3a80:	02112623          	sw	ra,44(sp)
    3a84:	02812423          	sw	s0,40(sp)
    3a88:	01512a23          	sw	s5,20(sp)
    3a8c:	00068913          	mv	s2,a3
    3a90:	00060b93          	mv	s7,a2
    3a94:	00058b13          	mv	s6,a1
    3a98:	00050493          	mv	s1,a0
    3a9c:	00000993          	li	s3,0
    3aa0:	24450a13          	addi	s4,a0,580
    3aa4:	00000693          	li	a3,0
    3aa8:	00098613          	mv	a2,s3
    3aac:	000b0593          	mv	a1,s6
    3ab0:	00048513          	mv	a0,s1
    3ab4:	00000097          	auipc	ra,0x0
    3ab8:	858080e7          	jalr	-1960(ra) # 330c <fatfs_sector_reader>
    3abc:	0c050863          	beqz	a0,3b8c <fatfs_update_file_length+0x130>
    3ac0:	04448413          	addi	s0,s1,68
    3ac4:	00198993          	addi	s3,s3,1
    3ac8:	00040a93          	mv	s5,s0
    3acc:	00040513          	mv	a0,s0
    3ad0:	fffff097          	auipc	ra,0xfffff
    3ad4:	964080e7          	jalr	-1692(ra) # 2434 <fatfs_entry_lfn_text>
    3ad8:	0a051463          	bnez	a0,3b80 <fatfs_update_file_length+0x124>
    3adc:	00040513          	mv	a0,s0
    3ae0:	fffff097          	auipc	ra,0xfffff
    3ae4:	968080e7          	jalr	-1688(ra) # 2448 <fatfs_entry_lfn_invalid>
    3ae8:	08051c63          	bnez	a0,3b80 <fatfs_update_file_length+0x124>
    3aec:	00040513          	mv	a0,s0
    3af0:	fffff097          	auipc	ra,0xfffff
    3af4:	9dc080e7          	jalr	-1572(ra) # 24cc <fatfs_entry_sfn_only>
    3af8:	08050463          	beqz	a0,3b80 <fatfs_update_file_length+0x124>
    3afc:	00b00613          	li	a2,11
    3b00:	000b8593          	mv	a1,s7
    3b04:	00040513          	mv	a0,s0
    3b08:	ffffe097          	auipc	ra,0xffffe
    3b0c:	b44080e7          	jalr	-1212(ra) # 164c <strncmp>
    3b10:	06051863          	bnez	a0,3b80 <fatfs_update_file_length+0x124>
    3b14:	00895793          	srli	a5,s2,0x8
    3b18:	01240e23          	sb	s2,28(s0)
    3b1c:	00f40ea3          	sb	a5,29(s0)
    3b20:	01095793          	srli	a5,s2,0x10
    3b24:	01895913          	srli	s2,s2,0x18
    3b28:	00f40f23          	sb	a5,30(s0)
    3b2c:	01240fa3          	sb	s2,31(s0)
    3b30:	00040593          	mv	a1,s0
    3b34:	02000613          	li	a2,32
    3b38:	00040513          	mv	a0,s0
    3b3c:	ffffe097          	auipc	ra,0xffffe
    3b40:	acc080e7          	jalr	-1332(ra) # 1608 <memcpy>
    3b44:	02812403          	lw	s0,40(sp)
    3b48:	0384a783          	lw	a5,56(s1)
    3b4c:	2444a503          	lw	a0,580(s1)
    3b50:	02c12083          	lw	ra,44(sp)
    3b54:	02412483          	lw	s1,36(sp)
    3b58:	02012903          	lw	s2,32(sp)
    3b5c:	01c12983          	lw	s3,28(sp)
    3b60:	01812a03          	lw	s4,24(sp)
    3b64:	01012b03          	lw	s6,16(sp)
    3b68:	00c12b83          	lw	s7,12(sp)
    3b6c:	000a8593          	mv	a1,s5
    3b70:	01412a83          	lw	s5,20(sp)
    3b74:	00100613          	li	a2,1
    3b78:	03010113          	addi	sp,sp,48
    3b7c:	00078067          	jr	a5
    3b80:	02040413          	addi	s0,s0,32
    3b84:	f54414e3          	bne	s0,s4,3acc <fatfs_update_file_length+0x70>
    3b88:	f1dff06f          	j	3aa4 <fatfs_update_file_length+0x48>
    3b8c:	02c12083          	lw	ra,44(sp)
    3b90:	02812403          	lw	s0,40(sp)
    3b94:	02412483          	lw	s1,36(sp)
    3b98:	02012903          	lw	s2,32(sp)
    3b9c:	01c12983          	lw	s3,28(sp)
    3ba0:	01812a03          	lw	s4,24(sp)
    3ba4:	01412a83          	lw	s5,20(sp)
    3ba8:	01012b03          	lw	s6,16(sp)
    3bac:	00c12b83          	lw	s7,12(sp)
    3bb0:	00000513          	li	a0,0
    3bb4:	03010113          	addi	sp,sp,48
    3bb8:	00008067          	ret
    3bbc:	00000513          	li	a0,0
    3bc0:	00008067          	ret

00003bc4 <fatfs_list_directory_next>:
    3bc4:	ec010113          	addi	sp,sp,-320
    3bc8:	13212823          	sw	s2,304(sp)
    3bcc:	13312623          	sw	s3,300(sp)
    3bd0:	13412423          	sw	s4,296(sp)
    3bd4:	13512223          	sw	s5,292(sp)
    3bd8:	13612023          	sw	s6,288(sp)
    3bdc:	12112e23          	sw	ra,316(sp)
    3be0:	12812c23          	sw	s0,312(sp)
    3be4:	12912a23          	sw	s1,308(sp)
    3be8:	00050a13          	mv	s4,a0
    3bec:	00058913          	mv	s2,a1
    3bf0:	00060993          	mv	s3,a2
    3bf4:	10010ea3          	sb	zero,285(sp)
    3bf8:	04450a93          	addi	s5,a0,68
    3bfc:	00f00b13          	li	s6,15
    3c00:	00092603          	lw	a2,0(s2)
    3c04:	00492583          	lw	a1,4(s2)
    3c08:	00000693          	li	a3,0
    3c0c:	000a0513          	mv	a0,s4
    3c10:	fffff097          	auipc	ra,0xfffff
    3c14:	6fc080e7          	jalr	1788(ra) # 330c <fatfs_sector_reader>
    3c18:	10050c63          	beqz	a0,3d30 <fatfs_list_directory_next+0x16c>
    3c1c:	00894483          	lbu	s1,8(s2)
    3c20:	00549413          	slli	s0,s1,0x5
    3c24:	008a8433          	add	s0,s5,s0
    3c28:	009b7c63          	bgeu	s6,s1,3c40 <fatfs_list_directory_next+0x7c>
    3c2c:	00092783          	lw	a5,0(s2)
    3c30:	00090423          	sb	zero,8(s2)
    3c34:	00178793          	addi	a5,a5,1
    3c38:	00f92023          	sw	a5,0(s2)
    3c3c:	fc5ff06f          	j	3c00 <fatfs_list_directory_next+0x3c>
    3c40:	00040513          	mv	a0,s0
    3c44:	ffffe097          	auipc	ra,0xffffe
    3c48:	7f0080e7          	jalr	2032(ra) # 2434 <fatfs_entry_lfn_text>
    3c4c:	02050263          	beqz	a0,3c70 <fatfs_list_directory_next+0xac>
    3c50:	00040593          	mv	a1,s0
    3c54:	01810513          	addi	a0,sp,24
    3c58:	ffffe097          	auipc	ra,0xffffe
    3c5c:	6d4080e7          	jalr	1748(ra) # 232c <fatfs_lfn_cache_entry>
    3c60:	00148493          	addi	s1,s1,1
    3c64:	0ff4f493          	zext.b	s1,s1
    3c68:	02040413          	addi	s0,s0,32
    3c6c:	fbdff06f          	j	3c28 <fatfs_list_directory_next+0x64>
    3c70:	00040513          	mv	a0,s0
    3c74:	ffffe097          	auipc	ra,0xffffe
    3c78:	7d4080e7          	jalr	2004(ra) # 2448 <fatfs_entry_lfn_invalid>
    3c7c:	00050663          	beqz	a0,3c88 <fatfs_list_directory_next+0xc4>
    3c80:	10010ea3          	sb	zero,285(sp)
    3c84:	fddff06f          	j	3c60 <fatfs_list_directory_next+0x9c>
    3c88:	00040593          	mv	a1,s0
    3c8c:	01810513          	addi	a0,sp,24
    3c90:	ffffe097          	auipc	ra,0xffffe
    3c94:	7ec080e7          	jalr	2028(ra) # 247c <fatfs_entry_lfn_exists>
    3c98:	0c050063          	beqz	a0,3d58 <fatfs_list_directory_next+0x194>
    3c9c:	01810513          	addi	a0,sp,24
    3ca0:	ffffe097          	auipc	ra,0xffffe
    3ca4:	758080e7          	jalr	1880(ra) # 23f8 <fatfs_lfn_cache_get>
    3ca8:	00050593          	mv	a1,a0
    3cac:	10300613          	li	a2,259
    3cb0:	00098513          	mv	a0,s3
    3cb4:	ffffe097          	auipc	ra,0xffffe
    3cb8:	9d8080e7          	jalr	-1576(ra) # 168c <strncpy>
    3cbc:	00040513          	mv	a0,s0
    3cc0:	fffff097          	auipc	ra,0xfffff
    3cc4:	84c080e7          	jalr	-1972(ra) # 250c <fatfs_entry_is_dir>
    3cc8:	10a98223          	sb	a0,260(s3)
    3ccc:	01d44783          	lbu	a5,29(s0)
    3cd0:	01c44703          	lbu	a4,28(s0)
    3cd4:	00148493          	addi	s1,s1,1
    3cd8:	00879793          	slli	a5,a5,0x8
    3cdc:	00e7e7b3          	or	a5,a5,a4
    3ce0:	01e44703          	lbu	a4,30(s0)
    3ce4:	00100513          	li	a0,1
    3ce8:	01071713          	slli	a4,a4,0x10
    3cec:	00f76733          	or	a4,a4,a5
    3cf0:	01f44783          	lbu	a5,31(s0)
    3cf4:	01879793          	slli	a5,a5,0x18
    3cf8:	00e7e7b3          	or	a5,a5,a4
    3cfc:	10f9a623          	sw	a5,268(s3)
    3d00:	01544783          	lbu	a5,21(s0)
    3d04:	01444703          	lbu	a4,20(s0)
    3d08:	01a44683          	lbu	a3,26(s0)
    3d0c:	00879793          	slli	a5,a5,0x8
    3d10:	00e7e7b3          	or	a5,a5,a4
    3d14:	01b44703          	lbu	a4,27(s0)
    3d18:	01079793          	slli	a5,a5,0x10
    3d1c:	00871713          	slli	a4,a4,0x8
    3d20:	00d76733          	or	a4,a4,a3
    3d24:	00e7e7b3          	or	a5,a5,a4
    3d28:	10f9a423          	sw	a5,264(s3)
    3d2c:	00990423          	sb	s1,8(s2)
    3d30:	13c12083          	lw	ra,316(sp)
    3d34:	13812403          	lw	s0,312(sp)
    3d38:	13412483          	lw	s1,308(sp)
    3d3c:	13012903          	lw	s2,304(sp)
    3d40:	12c12983          	lw	s3,300(sp)
    3d44:	12812a03          	lw	s4,296(sp)
    3d48:	12412a83          	lw	s5,292(sp)
    3d4c:	12012b03          	lw	s6,288(sp)
    3d50:	14010113          	addi	sp,sp,320
    3d54:	00008067          	ret
    3d58:	00040513          	mv	a0,s0
    3d5c:	ffffe097          	auipc	ra,0xffffe
    3d60:	770080e7          	jalr	1904(ra) # 24cc <fatfs_entry_sfn_only>
    3d64:	ee050ee3          	beqz	a0,3c60 <fatfs_list_directory_next+0x9c>
    3d68:	00810a13          	addi	s4,sp,8
    3d6c:	00d00613          	li	a2,13
    3d70:	00000593          	li	a1,0
    3d74:	000a0513          	mv	a0,s4
    3d78:	10010ea3          	sb	zero,285(sp)
    3d7c:	ffffe097          	auipc	ra,0xffffe
    3d80:	870080e7          	jalr	-1936(ra) # 15ec <memset>
    3d84:	00000793          	li	a5,0
    3d88:	00800713          	li	a4,8
    3d8c:	00f40633          	add	a2,s0,a5
    3d90:	00064603          	lbu	a2,0(a2)
    3d94:	00fa06b3          	add	a3,s4,a5
    3d98:	00178793          	addi	a5,a5,1
    3d9c:	00c68023          	sb	a2,0(a3)
    3da0:	fee796e3          	bne	a5,a4,3d8c <fatfs_list_directory_next+0x1c8>
    3da4:	00844783          	lbu	a5,8(s0)
    3da8:	00944703          	lbu	a4,9(s0)
    3dac:	00a44683          	lbu	a3,10(s0)
    3db0:	00f108a3          	sb	a5,17(sp)
    3db4:	00e10923          	sb	a4,18(sp)
    3db8:	fe078793          	addi	a5,a5,-32
    3dbc:	fe070713          	addi	a4,a4,-32
    3dc0:	00f037b3          	snez	a5,a5
    3dc4:	00e03733          	snez	a4,a4
    3dc8:	00d109a3          	sb	a3,19(sp)
    3dcc:	00e7e7b3          	or	a5,a5,a4
    3dd0:	00079863          	bnez	a5,3de0 <fatfs_list_directory_next+0x21c>
    3dd4:	fe068693          	addi	a3,a3,-32
    3dd8:	02000793          	li	a5,32
    3ddc:	00068a63          	beqz	a3,3df0 <fatfs_list_directory_next+0x22c>
    3de0:	00814703          	lbu	a4,8(sp)
    3de4:	02e00793          	li	a5,46
    3de8:	00f71463          	bne	a4,a5,3df0 <fatfs_list_directory_next+0x22c>
    3dec:	02000793          	li	a5,32
    3df0:	000a0593          	mv	a1,s4
    3df4:	00098513          	mv	a0,s3
    3df8:	00f10823          	sb	a5,16(sp)
    3dfc:	fffff097          	auipc	ra,0xfffff
    3e00:	054080e7          	jalr	84(ra) # 2e50 <fatfs_get_sfn_display_name>
    3e04:	eb9ff06f          	j	3cbc <fatfs_list_directory_next+0xf8>

00003e08 <fl_readdir>:
    3e08:	000057b7          	lui	a5,0x5
    3e0c:	7507a783          	lw	a5,1872(a5) # 5750 <_filelib_init>
    3e10:	fd010113          	addi	sp,sp,-48
    3e14:	03212023          	sw	s2,32(sp)
    3e18:	01312e23          	sw	s3,28(sp)
    3e1c:	02112623          	sw	ra,44(sp)
    3e20:	02812423          	sw	s0,40(sp)
    3e24:	02912223          	sw	s1,36(sp)
    3e28:	00050913          	mv	s2,a0
    3e2c:	00058993          	mv	s3,a1
    3e30:	00079663          	bnez	a5,3e3c <fl_readdir+0x34>
    3e34:	ffffe097          	auipc	ra,0xffffe
    3e38:	390080e7          	jalr	912(ra) # 21c4 <fl_init>
    3e3c:	000074b7          	lui	s1,0x7
    3e40:	37048413          	addi	s0,s1,880 # 7370 <_fs>
    3e44:	03c42783          	lw	a5,60(s0)
    3e48:	00078463          	beqz	a5,3e50 <fl_readdir+0x48>
    3e4c:	000780e7          	jalr	a5
    3e50:	00098613          	mv	a2,s3
    3e54:	00090593          	mv	a1,s2
    3e58:	37048513          	addi	a0,s1,880
    3e5c:	00000097          	auipc	ra,0x0
    3e60:	d68080e7          	jalr	-664(ra) # 3bc4 <fatfs_list_directory_next>
    3e64:	04042783          	lw	a5,64(s0)
    3e68:	00078863          	beqz	a5,3e78 <fl_readdir+0x70>
    3e6c:	00a12623          	sw	a0,12(sp)
    3e70:	000780e7          	jalr	a5
    3e74:	00c12503          	lw	a0,12(sp)
    3e78:	02c12083          	lw	ra,44(sp)
    3e7c:	02812403          	lw	s0,40(sp)
    3e80:	00154513          	xori	a0,a0,1
    3e84:	02412483          	lw	s1,36(sp)
    3e88:	02012903          	lw	s2,32(sp)
    3e8c:	01c12983          	lw	s3,28(sp)
    3e90:	40a00533          	neg	a0,a0
    3e94:	03010113          	addi	sp,sp,48
    3e98:	00008067          	ret

00003e9c <_read_sectors>:
    3e9c:	fd010113          	addi	sp,sp,-48
    3ea0:	01512a23          	sw	s5,20(sp)
    3ea4:	00007ab7          	lui	s5,0x7
    3ea8:	01312e23          	sw	s3,28(sp)
    3eac:	370ac983          	lbu	s3,880(s5) # 7370 <_fs>
    3eb0:	01612823          	sw	s6,16(sp)
    3eb4:	00058b13          	mv	s6,a1
    3eb8:	02912223          	sw	s1,36(sp)
    3ebc:	00098593          	mv	a1,s3
    3ec0:	00050493          	mv	s1,a0
    3ec4:	000b0513          	mv	a0,s6
    3ec8:	02112623          	sw	ra,44(sp)
    3ecc:	02812423          	sw	s0,40(sp)
    3ed0:	01412c23          	sw	s4,24(sp)
    3ed4:	00068413          	mv	s0,a3
    3ed8:	01712623          	sw	s7,12(sp)
    3edc:	01812423          	sw	s8,8(sp)
    3ee0:	03212023          	sw	s2,32(sp)
    3ee4:	00060c13          	mv	s8,a2
    3ee8:	ffffd097          	auipc	ra,0xffffd
    3eec:	658080e7          	jalr	1624(ra) # 1540 <__udivsi3>
    3ef0:	00050a13          	mv	s4,a0
    3ef4:	00098593          	mv	a1,s3
    3ef8:	000b0513          	mv	a0,s6
    3efc:	ffffd097          	auipc	ra,0xffffd
    3f00:	68c080e7          	jalr	1676(ra) # 1588 <__umodsi3>
    3f04:	00a407b3          	add	a5,s0,a0
    3f08:	00050b93          	mv	s7,a0
    3f0c:	00f9fe63          	bgeu	s3,a5,3f28 <_read_sectors+0x8c>
    3f10:	000a0593          	mv	a1,s4
    3f14:	00098513          	mv	a0,s3
    3f18:	ffffe097          	auipc	ra,0xffffe
    3f1c:	e18080e7          	jalr	-488(ra) # 1d30 <__mulsi3>
    3f20:	416987b3          	sub	a5,s3,s6
    3f24:	00f50433          	add	s0,a0,a5
    3f28:	2284a903          	lw	s2,552(s1)
    3f2c:	07491863          	bne	s2,s4,3f9c <_read_sectors+0x100>
    3f30:	22c4a583          	lw	a1,556(s1)
    3f34:	fff00793          	li	a5,-1
    3f38:	02f58663          	beq	a1,a5,3f64 <_read_sectors+0xc8>
    3f3c:	370a8513          	addi	a0,s5,880
    3f40:	ffffe097          	auipc	ra,0xffffe
    3f44:	154080e7          	jalr	340(ra) # 2094 <fatfs_lba_of_cluster>
    3f48:	017505b3          	add	a1,a0,s7
    3f4c:	00040693          	mv	a3,s0
    3f50:	000c0613          	mv	a2,s8
    3f54:	370a8513          	addi	a0,s5,880
    3f58:	ffffe097          	auipc	ra,0xffffe
    3f5c:	188080e7          	jalr	392(ra) # 20e0 <fatfs_sector_read>
    3f60:	00051463          	bnez	a0,3f68 <_read_sectors+0xcc>
    3f64:	00000413          	li	s0,0
    3f68:	02c12083          	lw	ra,44(sp)
    3f6c:	00040513          	mv	a0,s0
    3f70:	02812403          	lw	s0,40(sp)
    3f74:	02412483          	lw	s1,36(sp)
    3f78:	02012903          	lw	s2,32(sp)
    3f7c:	01c12983          	lw	s3,28(sp)
    3f80:	01812a03          	lw	s4,24(sp)
    3f84:	01412a83          	lw	s5,20(sp)
    3f88:	01012b03          	lw	s6,16(sp)
    3f8c:	00c12b83          	lw	s7,12(sp)
    3f90:	00812c03          	lw	s8,8(sp)
    3f94:	03010113          	addi	sp,sp,48
    3f98:	00008067          	ret
    3f9c:	033b6463          	bltu	s6,s3,3fc4 <_read_sectors+0x128>
    3fa0:	00190793          	addi	a5,s2,1
    3fa4:	03479063          	bne	a5,s4,3fc4 <_read_sectors+0x128>
    3fa8:	22c4a583          	lw	a1,556(s1)
    3fac:	03496263          	bltu	s2,s4,3fd0 <_read_sectors+0x134>
    3fb0:	fff00793          	li	a5,-1
    3fb4:	faf588e3          	beq	a1,a5,3f64 <_read_sectors+0xc8>
    3fb8:	22b4a623          	sw	a1,556(s1)
    3fbc:	2344a423          	sw	s4,552(s1)
    3fc0:	f7dff06f          	j	3f3c <_read_sectors+0xa0>
    3fc4:	0044a583          	lw	a1,4(s1)
    3fc8:	00000913          	li	s2,0
    3fcc:	fe1ff06f          	j	3fac <_read_sectors+0x110>
    3fd0:	370a8513          	addi	a0,s5,880
    3fd4:	fffff097          	auipc	ra,0xfffff
    3fd8:	230080e7          	jalr	560(ra) # 3204 <fatfs_find_next_cluster>
    3fdc:	00050593          	mv	a1,a0
    3fe0:	00190913          	addi	s2,s2,1
    3fe4:	fc9ff06f          	j	3fac <_read_sectors+0x110>

00003fe8 <fatfs_set_fs_info_next_free_cluster>:
    3fe8:	03052783          	lw	a5,48(a0)
    3fec:	0a078463          	beqz	a5,4094 <fatfs_set_fs_info_next_free_cluster+0xac>
    3ff0:	fe010113          	addi	sp,sp,-32
    3ff4:	01c52783          	lw	a5,28(a0)
    3ff8:	00912a23          	sw	s1,20(sp)
    3ffc:	00058493          	mv	s1,a1
    4000:	01855583          	lhu	a1,24(a0)
    4004:	00812c23          	sw	s0,24(sp)
    4008:	00112e23          	sw	ra,28(sp)
    400c:	00f585b3          	add	a1,a1,a5
    4010:	00050413          	mv	s0,a0
    4014:	ffffe097          	auipc	ra,0xffffe
    4018:	ed4080e7          	jalr	-300(ra) # 1ee8 <fatfs_fat_read_sector>
    401c:	00050593          	mv	a1,a0
    4020:	06050063          	beqz	a0,4080 <fatfs_set_fs_info_next_free_cluster+0x98>
    4024:	20852783          	lw	a5,520(a0)
    4028:	0084d713          	srli	a4,s1,0x8
    402c:	00100613          	li	a2,1
    4030:	1e978623          	sb	s1,492(a5)
    4034:	20852783          	lw	a5,520(a0)
    4038:	1ee786a3          	sb	a4,493(a5)
    403c:	20852783          	lw	a5,520(a0)
    4040:	0104d713          	srli	a4,s1,0x10
    4044:	1ee78723          	sb	a4,494(a5)
    4048:	20852783          	lw	a5,520(a0)
    404c:	0184d713          	srli	a4,s1,0x18
    4050:	1ee787a3          	sb	a4,495(a5)
    4054:	03842783          	lw	a5,56(s0)
    4058:	20c52223          	sw	a2,516(a0)
    405c:	02942223          	sw	s1,36(s0)
    4060:	00078a63          	beqz	a5,4074 <fatfs_set_fs_info_next_free_cluster+0x8c>
    4064:	20052503          	lw	a0,512(a0)
    4068:	00b12623          	sw	a1,12(sp)
    406c:	000780e7          	jalr	a5
    4070:	00c12583          	lw	a1,12(sp)
    4074:	fff00793          	li	a5,-1
    4078:	20f5a023          	sw	a5,512(a1)
    407c:	2005a223          	sw	zero,516(a1)
    4080:	01c12083          	lw	ra,28(sp)
    4084:	01812403          	lw	s0,24(sp)
    4088:	01412483          	lw	s1,20(sp)
    408c:	02010113          	addi	sp,sp,32
    4090:	00008067          	ret
    4094:	00008067          	ret

00004098 <fatfs_find_blank_cluster>:
    4098:	fd010113          	addi	sp,sp,-48
    409c:	01312e23          	sw	s3,28(sp)
    40a0:	100009b7          	lui	s3,0x10000
    40a4:	02912223          	sw	s1,36(sp)
    40a8:	03212023          	sw	s2,32(sp)
    40ac:	02112623          	sw	ra,44(sp)
    40b0:	02812423          	sw	s0,40(sp)
    40b4:	00050913          	mv	s2,a0
    40b8:	00058493          	mv	s1,a1
    40bc:	fff98993          	addi	s3,s3,-1 # fffffff <__stacktop+0xffeffff>
    40c0:	03092783          	lw	a5,48(s2)
    40c4:	0074d413          	srli	s0,s1,0x7
    40c8:	00079463          	bnez	a5,40d0 <fatfs_find_blank_cluster+0x38>
    40cc:	0084d413          	srli	s0,s1,0x8
    40d0:	02092783          	lw	a5,32(s2)
    40d4:	0cf47863          	bgeu	s0,a5,41a4 <fatfs_find_blank_cluster+0x10c>
    40d8:	01492583          	lw	a1,20(s2)
    40dc:	00090513          	mv	a0,s2
    40e0:	00c12623          	sw	a2,12(sp)
    40e4:	00b405b3          	add	a1,s0,a1
    40e8:	ffffe097          	auipc	ra,0xffffe
    40ec:	e00080e7          	jalr	-512(ra) # 1ee8 <fatfs_fat_read_sector>
    40f0:	0a050a63          	beqz	a0,41a4 <fatfs_find_blank_cluster+0x10c>
    40f4:	03092783          	lw	a5,48(s2)
    40f8:	20852703          	lw	a4,520(a0)
    40fc:	00c12603          	lw	a2,12(sp)
    4100:	04079a63          	bnez	a5,4154 <fatfs_find_blank_cluster+0xbc>
    4104:	00841413          	slli	s0,s0,0x8
    4108:	40848433          	sub	s0,s1,s0
    410c:	00141413          	slli	s0,s0,0x1
    4110:	01041413          	slli	s0,s0,0x10
    4114:	01045413          	srli	s0,s0,0x10
    4118:	00870733          	add	a4,a4,s0
    411c:	00174783          	lbu	a5,1(a4)
    4120:	00074703          	lbu	a4,0(a4)
    4124:	00879793          	slli	a5,a5,0x8
    4128:	00e787b3          	add	a5,a5,a4
    412c:	06079863          	bnez	a5,419c <fatfs_find_blank_cluster+0x104>
    4130:	00962023          	sw	s1,0(a2)
    4134:	00100513          	li	a0,1
    4138:	02c12083          	lw	ra,44(sp)
    413c:	02812403          	lw	s0,40(sp)
    4140:	02412483          	lw	s1,36(sp)
    4144:	02012903          	lw	s2,32(sp)
    4148:	01c12983          	lw	s3,28(sp)
    414c:	03010113          	addi	sp,sp,48
    4150:	00008067          	ret
    4154:	00741413          	slli	s0,s0,0x7
    4158:	40848433          	sub	s0,s1,s0
    415c:	00241413          	slli	s0,s0,0x2
    4160:	01041413          	slli	s0,s0,0x10
    4164:	01045413          	srli	s0,s0,0x10
    4168:	00870733          	add	a4,a4,s0
    416c:	00374783          	lbu	a5,3(a4)
    4170:	00274683          	lbu	a3,2(a4)
    4174:	01879793          	slli	a5,a5,0x18
    4178:	01069693          	slli	a3,a3,0x10
    417c:	00d787b3          	add	a5,a5,a3
    4180:	00074683          	lbu	a3,0(a4)
    4184:	00174703          	lbu	a4,1(a4)
    4188:	00d787b3          	add	a5,a5,a3
    418c:	00871713          	slli	a4,a4,0x8
    4190:	00e787b3          	add	a5,a5,a4
    4194:	0137f7b3          	and	a5,a5,s3
    4198:	f95ff06f          	j	412c <fatfs_find_blank_cluster+0x94>
    419c:	00148493          	addi	s1,s1,1
    41a0:	f21ff06f          	j	40c0 <fatfs_find_blank_cluster+0x28>
    41a4:	00000513          	li	a0,0
    41a8:	f91ff06f          	j	4138 <fatfs_find_blank_cluster+0xa0>

000041ac <fatfs_fat_set_cluster>:
    41ac:	03052783          	lw	a5,48(a0)
    41b0:	fe010113          	addi	sp,sp,-32
    41b4:	00812c23          	sw	s0,24(sp)
    41b8:	00912a23          	sw	s1,20(sp)
    41bc:	01212823          	sw	s2,16(sp)
    41c0:	00112e23          	sw	ra,28(sp)
    41c4:	00050913          	mv	s2,a0
    41c8:	00058413          	mv	s0,a1
    41cc:	0085d493          	srli	s1,a1,0x8
    41d0:	00078463          	beqz	a5,41d8 <fatfs_fat_set_cluster+0x2c>
    41d4:	0075d493          	srli	s1,a1,0x7
    41d8:	01492583          	lw	a1,20(s2)
    41dc:	00090513          	mv	a0,s2
    41e0:	00c12623          	sw	a2,12(sp)
    41e4:	00b485b3          	add	a1,s1,a1
    41e8:	ffffe097          	auipc	ra,0xffffe
    41ec:	d00080e7          	jalr	-768(ra) # 1ee8 <fatfs_fat_read_sector>
    41f0:	00050793          	mv	a5,a0
    41f4:	00000513          	li	a0,0
    41f8:	04078663          	beqz	a5,4244 <fatfs_fat_set_cluster+0x98>
    41fc:	03092683          	lw	a3,48(s2)
    4200:	2087a703          	lw	a4,520(a5)
    4204:	00c12603          	lw	a2,12(sp)
    4208:	04069a63          	bnez	a3,425c <fatfs_fat_set_cluster+0xb0>
    420c:	00849493          	slli	s1,s1,0x8
    4210:	40940433          	sub	s0,s0,s1
    4214:	00141413          	slli	s0,s0,0x1
    4218:	01041413          	slli	s0,s0,0x10
    421c:	01045413          	srli	s0,s0,0x10
    4220:	00870733          	add	a4,a4,s0
    4224:	00c70023          	sb	a2,0(a4)
    4228:	2087a703          	lw	a4,520(a5)
    422c:	00865613          	srli	a2,a2,0x8
    4230:	00870733          	add	a4,a4,s0
    4234:	00c700a3          	sb	a2,1(a4)
    4238:	00100713          	li	a4,1
    423c:	20e7a223          	sw	a4,516(a5)
    4240:	00100513          	li	a0,1
    4244:	01c12083          	lw	ra,28(sp)
    4248:	01812403          	lw	s0,24(sp)
    424c:	01412483          	lw	s1,20(sp)
    4250:	01012903          	lw	s2,16(sp)
    4254:	02010113          	addi	sp,sp,32
    4258:	00008067          	ret
    425c:	00749493          	slli	s1,s1,0x7
    4260:	40940433          	sub	s0,s0,s1
    4264:	00241413          	slli	s0,s0,0x2
    4268:	01041413          	slli	s0,s0,0x10
    426c:	01045413          	srli	s0,s0,0x10
    4270:	00870733          	add	a4,a4,s0
    4274:	00c70023          	sb	a2,0(a4)
    4278:	2087a703          	lw	a4,520(a5)
    427c:	00865693          	srli	a3,a2,0x8
    4280:	00870733          	add	a4,a4,s0
    4284:	00d700a3          	sb	a3,1(a4)
    4288:	2087a703          	lw	a4,520(a5)
    428c:	01065693          	srli	a3,a2,0x10
    4290:	01865613          	srli	a2,a2,0x18
    4294:	00870733          	add	a4,a4,s0
    4298:	00d70123          	sb	a3,2(a4)
    429c:	2087a703          	lw	a4,520(a5)
    42a0:	00870733          	add	a4,a4,s0
    42a4:	00c701a3          	sb	a2,3(a4)
    42a8:	f91ff06f          	j	4238 <fatfs_fat_set_cluster+0x8c>

000042ac <fatfs_free_cluster_chain>:
    42ac:	fe010113          	addi	sp,sp,-32
    42b0:	00812c23          	sw	s0,24(sp)
    42b4:	00912a23          	sw	s1,20(sp)
    42b8:	00112e23          	sw	ra,28(sp)
    42bc:	01212823          	sw	s2,16(sp)
    42c0:	00050493          	mv	s1,a0
    42c4:	ffd00413          	li	s0,-3
    42c8:	fff58793          	addi	a5,a1,-1
    42cc:	02f47063          	bgeu	s0,a5,42ec <fatfs_free_cluster_chain+0x40>
    42d0:	01c12083          	lw	ra,28(sp)
    42d4:	01812403          	lw	s0,24(sp)
    42d8:	01412483          	lw	s1,20(sp)
    42dc:	01012903          	lw	s2,16(sp)
    42e0:	00100513          	li	a0,1
    42e4:	02010113          	addi	sp,sp,32
    42e8:	00008067          	ret
    42ec:	00048513          	mv	a0,s1
    42f0:	00b12623          	sw	a1,12(sp)
    42f4:	fffff097          	auipc	ra,0xfffff
    42f8:	f10080e7          	jalr	-240(ra) # 3204 <fatfs_find_next_cluster>
    42fc:	00c12583          	lw	a1,12(sp)
    4300:	00050913          	mv	s2,a0
    4304:	00000613          	li	a2,0
    4308:	00048513          	mv	a0,s1
    430c:	00000097          	auipc	ra,0x0
    4310:	ea0080e7          	jalr	-352(ra) # 41ac <fatfs_fat_set_cluster>
    4314:	00090593          	mv	a1,s2
    4318:	fb1ff06f          	j	42c8 <fatfs_free_cluster_chain+0x1c>

0000431c <fatfs_fat_add_cluster_to_chain>:
    431c:	fd010113          	addi	sp,sp,-48
    4320:	02912223          	sw	s1,36(sp)
    4324:	02112623          	sw	ra,44(sp)
    4328:	02812423          	sw	s0,40(sp)
    432c:	03212023          	sw	s2,32(sp)
    4330:	01312e23          	sw	s3,28(sp)
    4334:	fff00493          	li	s1,-1
    4338:	02959263          	bne	a1,s1,435c <fatfs_fat_add_cluster_to_chain+0x40>
    433c:	00000513          	li	a0,0
    4340:	02c12083          	lw	ra,44(sp)
    4344:	02812403          	lw	s0,40(sp)
    4348:	02412483          	lw	s1,36(sp)
    434c:	02012903          	lw	s2,32(sp)
    4350:	01c12983          	lw	s3,28(sp)
    4354:	03010113          	addi	sp,sp,48
    4358:	00008067          	ret
    435c:	00050913          	mv	s2,a0
    4360:	00058413          	mv	s0,a1
    4364:	00060993          	mv	s3,a2
    4368:	00040593          	mv	a1,s0
    436c:	00090513          	mv	a0,s2
    4370:	00812623          	sw	s0,12(sp)
    4374:	fffff097          	auipc	ra,0xfffff
    4378:	e90080e7          	jalr	-368(ra) # 3204 <fatfs_find_next_cluster>
    437c:	00050413          	mv	s0,a0
    4380:	fa050ee3          	beqz	a0,433c <fatfs_fat_add_cluster_to_chain+0x20>
    4384:	00c12583          	lw	a1,12(sp)
    4388:	fe9510e3          	bne	a0,s1,4368 <fatfs_fat_add_cluster_to_chain+0x4c>
    438c:	00098613          	mv	a2,s3
    4390:	00090513          	mv	a0,s2
    4394:	00000097          	auipc	ra,0x0
    4398:	e18080e7          	jalr	-488(ra) # 41ac <fatfs_fat_set_cluster>
    439c:	00040613          	mv	a2,s0
    43a0:	00098593          	mv	a1,s3
    43a4:	00090513          	mv	a0,s2
    43a8:	00000097          	auipc	ra,0x0
    43ac:	e04080e7          	jalr	-508(ra) # 41ac <fatfs_fat_set_cluster>
    43b0:	00100513          	li	a0,1
    43b4:	f8dff06f          	j	4340 <fatfs_fat_add_cluster_to_chain+0x24>

000043b8 <fatfs_add_free_space>:
    43b8:	02452783          	lw	a5,36(a0)
    43bc:	fd010113          	addi	sp,sp,-48
    43c0:	02812423          	sw	s0,40(sp)
    43c4:	01312e23          	sw	s3,28(sp)
    43c8:	01412c23          	sw	s4,24(sp)
    43cc:	0005a983          	lw	s3,0(a1)
    43d0:	01512a23          	sw	s5,20(sp)
    43d4:	00058a13          	mv	s4,a1
    43d8:	02112623          	sw	ra,44(sp)
    43dc:	02912223          	sw	s1,36(sp)
    43e0:	03212023          	sw	s2,32(sp)
    43e4:	fff00593          	li	a1,-1
    43e8:	00050413          	mv	s0,a0
    43ec:	00060a93          	mv	s5,a2
    43f0:	00b78663          	beq	a5,a1,43fc <fatfs_add_free_space+0x44>
    43f4:	00000097          	auipc	ra,0x0
    43f8:	bf4080e7          	jalr	-1036(ra) # 3fe8 <fatfs_set_fs_info_next_free_cluster>
    43fc:	00000493          	li	s1,0
    4400:	03549663          	bne	s1,s5,442c <fatfs_add_free_space+0x74>
    4404:	00100513          	li	a0,1
    4408:	02c12083          	lw	ra,44(sp)
    440c:	02812403          	lw	s0,40(sp)
    4410:	02412483          	lw	s1,36(sp)
    4414:	02012903          	lw	s2,32(sp)
    4418:	01c12983          	lw	s3,28(sp)
    441c:	01812a03          	lw	s4,24(sp)
    4420:	01412a83          	lw	s5,20(sp)
    4424:	03010113          	addi	sp,sp,48
    4428:	00008067          	ret
    442c:	00842583          	lw	a1,8(s0)
    4430:	00c10613          	addi	a2,sp,12
    4434:	00040513          	mv	a0,s0
    4438:	00000097          	auipc	ra,0x0
    443c:	c60080e7          	jalr	-928(ra) # 4098 <fatfs_find_blank_cluster>
    4440:	fc0504e3          	beqz	a0,4408 <fatfs_add_free_space+0x50>
    4444:	00c12903          	lw	s2,12(sp)
    4448:	00098593          	mv	a1,s3
    444c:	00040513          	mv	a0,s0
    4450:	00090613          	mv	a2,s2
    4454:	00000097          	auipc	ra,0x0
    4458:	d58080e7          	jalr	-680(ra) # 41ac <fatfs_fat_set_cluster>
    445c:	fff00613          	li	a2,-1
    4460:	00090593          	mv	a1,s2
    4464:	00040513          	mv	a0,s0
    4468:	00000097          	auipc	ra,0x0
    446c:	d44080e7          	jalr	-700(ra) # 41ac <fatfs_fat_set_cluster>
    4470:	00049463          	bnez	s1,4478 <fatfs_add_free_space+0xc0>
    4474:	012a2023          	sw	s2,0(s4)
    4478:	00148493          	addi	s1,s1,1
    447c:	00090993          	mv	s3,s2
    4480:	f81ff06f          	j	4400 <fatfs_add_free_space+0x48>

00004484 <_write_sectors>:
    4484:	fb010113          	addi	sp,sp,-80
    4488:	03512a23          	sw	s5,52(sp)
    448c:	00007ab7          	lui	s5,0x7
    4490:	04112623          	sw	ra,76(sp)
    4494:	04812423          	sw	s0,72(sp)
    4498:	04912223          	sw	s1,68(sp)
    449c:	03412c23          	sw	s4,56(sp)
    44a0:	03612823          	sw	s6,48(sp)
    44a4:	03712623          	sw	s7,44(sp)
    44a8:	03812423          	sw	s8,40(sp)
    44ac:	03912223          	sw	s9,36(sp)
    44b0:	03a12023          	sw	s10,32(sp)
    44b4:	05212023          	sw	s2,64(sp)
    44b8:	03312e23          	sw	s3,60(sp)
    44bc:	370a8b93          	addi	s7,s5,880 # 7370 <_fs>
    44c0:	000bc983          	lbu	s3,0(s7)
    44c4:	00058b13          	mv	s6,a1
    44c8:	fff00793          	li	a5,-1
    44cc:	00098593          	mv	a1,s3
    44d0:	00050493          	mv	s1,a0
    44d4:	000b0513          	mv	a0,s6
    44d8:	00068c13          	mv	s8,a3
    44dc:	00f12e23          	sw	a5,28(sp)
    44e0:	00060d13          	mv	s10,a2
    44e4:	ffffd097          	auipc	ra,0xffffd
    44e8:	05c080e7          	jalr	92(ra) # 1540 <__udivsi3>
    44ec:	00050a13          	mv	s4,a0
    44f0:	00098593          	mv	a1,s3
    44f4:	000b0513          	mv	a0,s6
    44f8:	ffffd097          	auipc	ra,0xffffd
    44fc:	090080e7          	jalr	144(ra) # 1588 <__umodsi3>
    4500:	00ac07b3          	add	a5,s8,a0
    4504:	00050c93          	mv	s9,a0
    4508:	000c0413          	mv	s0,s8
    450c:	00f9fe63          	bgeu	s3,a5,4528 <_write_sectors+0xa4>
    4510:	000a0593          	mv	a1,s4
    4514:	00098513          	mv	a0,s3
    4518:	ffffe097          	auipc	ra,0xffffe
    451c:	818080e7          	jalr	-2024(ra) # 1d30 <__mulsi3>
    4520:	416987b3          	sub	a5,s3,s6
    4524:	00f50433          	add	s0,a0,a5
    4528:	2284a903          	lw	s2,552(s1)
    452c:	03491a63          	bne	s2,s4,4560 <_write_sectors+0xdc>
    4530:	22c4a583          	lw	a1,556(s1)
    4534:	370a8513          	addi	a0,s5,880
    4538:	ffffe097          	auipc	ra,0xffffe
    453c:	b5c080e7          	jalr	-1188(ra) # 2094 <fatfs_lba_of_cluster>
    4540:	019505b3          	add	a1,a0,s9
    4544:	00040693          	mv	a3,s0
    4548:	000d0613          	mv	a2,s10
    454c:	370a8513          	addi	a0,s5,880
    4550:	ffffe097          	auipc	ra,0xffffe
    4554:	ba8080e7          	jalr	-1112(ra) # 20f8 <fatfs_sector_write>
    4558:	04050a63          	beqz	a0,45ac <_write_sectors+0x128>
    455c:	0540006f          	j	45b0 <_write_sectors+0x12c>
    4560:	093b6663          	bltu	s6,s3,45ec <_write_sectors+0x168>
    4564:	00190793          	addi	a5,s2,1
    4568:	09479263          	bne	a5,s4,45ec <_write_sectors+0x168>
    456c:	22c4a583          	lw	a1,556(s1)
    4570:	fff00b13          	li	s6,-1
    4574:	09496263          	bltu	s2,s4,45f8 <_write_sectors+0x174>
    4578:	fff00793          	li	a5,-1
    457c:	0af59463          	bne	a1,a5,4624 <_write_sectors+0x1a0>
    4580:	000bc583          	lbu	a1,0(s7)
    4584:	fff58513          	addi	a0,a1,-1
    4588:	01850533          	add	a0,a0,s8
    458c:	ffffd097          	auipc	ra,0xffffd
    4590:	fb4080e7          	jalr	-76(ra) # 1540 <__udivsi3>
    4594:	00050613          	mv	a2,a0
    4598:	01c10593          	addi	a1,sp,28
    459c:	000b8513          	mv	a0,s7
    45a0:	00000097          	auipc	ra,0x0
    45a4:	e18080e7          	jalr	-488(ra) # 43b8 <fatfs_add_free_space>
    45a8:	06051c63          	bnez	a0,4620 <_write_sectors+0x19c>
    45ac:	00000413          	li	s0,0
    45b0:	04c12083          	lw	ra,76(sp)
    45b4:	00040513          	mv	a0,s0
    45b8:	04812403          	lw	s0,72(sp)
    45bc:	04412483          	lw	s1,68(sp)
    45c0:	04012903          	lw	s2,64(sp)
    45c4:	03c12983          	lw	s3,60(sp)
    45c8:	03812a03          	lw	s4,56(sp)
    45cc:	03412a83          	lw	s5,52(sp)
    45d0:	03012b03          	lw	s6,48(sp)
    45d4:	02c12b83          	lw	s7,44(sp)
    45d8:	02812c03          	lw	s8,40(sp)
    45dc:	02412c83          	lw	s9,36(sp)
    45e0:	02012d03          	lw	s10,32(sp)
    45e4:	05010113          	addi	sp,sp,80
    45e8:	00008067          	ret
    45ec:	0044a583          	lw	a1,4(s1)
    45f0:	00000913          	li	s2,0
    45f4:	f7dff06f          	j	4570 <_write_sectors+0xec>
    45f8:	370a8513          	addi	a0,s5,880
    45fc:	00b12623          	sw	a1,12(sp)
    4600:	fffff097          	auipc	ra,0xfffff
    4604:	c04080e7          	jalr	-1020(ra) # 3204 <fatfs_find_next_cluster>
    4608:	00c12583          	lw	a1,12(sp)
    460c:	00b12e23          	sw	a1,28(sp)
    4610:	f76508e3          	beq	a0,s6,4580 <_write_sectors+0xfc>
    4614:	00190913          	addi	s2,s2,1
    4618:	00050593          	mv	a1,a0
    461c:	f59ff06f          	j	4574 <_write_sectors+0xf0>
    4620:	01c12583          	lw	a1,28(sp)
    4624:	22b4a623          	sw	a1,556(s1)
    4628:	2344a423          	sw	s4,552(s1)
    462c:	f09ff06f          	j	4534 <_write_sectors+0xb0>

00004630 <fl_fflush>:
    4630:	000057b7          	lui	a5,0x5
    4634:	7507a783          	lw	a5,1872(a5) # 5750 <_filelib_init>
    4638:	ff010113          	addi	sp,sp,-16
    463c:	00812423          	sw	s0,8(sp)
    4640:	00112623          	sw	ra,12(sp)
    4644:	00912223          	sw	s1,4(sp)
    4648:	00050413          	mv	s0,a0
    464c:	00079663          	bnez	a5,4658 <fl_fflush+0x28>
    4650:	ffffe097          	auipc	ra,0xffffe
    4654:	b74080e7          	jalr	-1164(ra) # 21c4 <fl_init>
    4658:	04040663          	beqz	s0,46a4 <fl_fflush+0x74>
    465c:	000074b7          	lui	s1,0x7
    4660:	37048493          	addi	s1,s1,880 # 7370 <_fs>
    4664:	03c4a783          	lw	a5,60(s1)
    4668:	00078463          	beqz	a5,4670 <fl_fflush+0x40>
    466c:	000780e7          	jalr	a5
    4670:	43442783          	lw	a5,1076(s0)
    4674:	02078263          	beqz	a5,4698 <fl_fflush+0x68>
    4678:	43042583          	lw	a1,1072(s0)
    467c:	00100693          	li	a3,1
    4680:	23040613          	addi	a2,s0,560
    4684:	00040513          	mv	a0,s0
    4688:	00000097          	auipc	ra,0x0
    468c:	dfc080e7          	jalr	-516(ra) # 4484 <_write_sectors>
    4690:	00050463          	beqz	a0,4698 <fl_fflush+0x68>
    4694:	42042a23          	sw	zero,1076(s0)
    4698:	0404a783          	lw	a5,64(s1)
    469c:	00078463          	beqz	a5,46a4 <fl_fflush+0x74>
    46a0:	000780e7          	jalr	a5
    46a4:	00c12083          	lw	ra,12(sp)
    46a8:	00812403          	lw	s0,8(sp)
    46ac:	00412483          	lw	s1,4(sp)
    46b0:	00000513          	li	a0,0
    46b4:	01010113          	addi	sp,sp,16
    46b8:	00008067          	ret

000046bc <fl_fclose>:
    46bc:	000057b7          	lui	a5,0x5
    46c0:	7507a783          	lw	a5,1872(a5) # 5750 <_filelib_init>
    46c4:	ff010113          	addi	sp,sp,-16
    46c8:	00812423          	sw	s0,8(sp)
    46cc:	00112623          	sw	ra,12(sp)
    46d0:	00912223          	sw	s1,4(sp)
    46d4:	01212023          	sw	s2,0(sp)
    46d8:	00050413          	mv	s0,a0
    46dc:	00079663          	bnez	a5,46e8 <fl_fclose+0x2c>
    46e0:	ffffe097          	auipc	ra,0xffffe
    46e4:	ae4080e7          	jalr	-1308(ra) # 21c4 <fl_init>
    46e8:	08040c63          	beqz	s0,4780 <fl_fclose+0xc4>
    46ec:	000074b7          	lui	s1,0x7
    46f0:	37048913          	addi	s2,s1,880 # 7370 <_fs>
    46f4:	03c92783          	lw	a5,60(s2)
    46f8:	00078463          	beqz	a5,4700 <fl_fclose+0x44>
    46fc:	000780e7          	jalr	a5
    4700:	00040513          	mv	a0,s0
    4704:	00000097          	auipc	ra,0x0
    4708:	f2c080e7          	jalr	-212(ra) # 4630 <fl_fflush>
    470c:	01042783          	lw	a5,16(s0)
    4710:	00078e63          	beqz	a5,472c <fl_fclose+0x70>
    4714:	00c42683          	lw	a3,12(s0)
    4718:	00042583          	lw	a1,0(s0)
    471c:	21c40613          	addi	a2,s0,540
    4720:	37048513          	addi	a0,s1,880
    4724:	fffff097          	auipc	ra,0xfffff
    4728:	338080e7          	jalr	824(ra) # 3a5c <fatfs_update_file_length>
    472c:	fff00793          	li	a5,-1
    4730:	42f42823          	sw	a5,1072(s0)
    4734:	00040513          	mv	a0,s0
    4738:	00042423          	sw	zero,8(s0)
    473c:	00042623          	sw	zero,12(s0)
    4740:	00042223          	sw	zero,4(s0)
    4744:	42042a23          	sw	zero,1076(s0)
    4748:	00042823          	sw	zero,16(s0)
    474c:	ffffe097          	auipc	ra,0xffffe
    4750:	900080e7          	jalr	-1792(ra) # 204c <_free_file>
    4754:	37048513          	addi	a0,s1,880
    4758:	fffff097          	auipc	ra,0xfffff
    475c:	a54080e7          	jalr	-1452(ra) # 31ac <fatfs_fat_purge>
    4760:	04092783          	lw	a5,64(s2)
    4764:	00078e63          	beqz	a5,4780 <fl_fclose+0xc4>
    4768:	00812403          	lw	s0,8(sp)
    476c:	00c12083          	lw	ra,12(sp)
    4770:	00412483          	lw	s1,4(sp)
    4774:	00012903          	lw	s2,0(sp)
    4778:	01010113          	addi	sp,sp,16
    477c:	00078067          	jr	a5
    4780:	00c12083          	lw	ra,12(sp)
    4784:	00812403          	lw	s0,8(sp)
    4788:	00412483          	lw	s1,4(sp)
    478c:	00012903          	lw	s2,0(sp)
    4790:	01010113          	addi	sp,sp,16
    4794:	00008067          	ret

00004798 <fl_fread>:
    4798:	000057b7          	lui	a5,0x5
    479c:	7507a783          	lw	a5,1872(a5) # 5750 <_filelib_init>
    47a0:	fc010113          	addi	sp,sp,-64
    47a4:	02812c23          	sw	s0,56(sp)
    47a8:	03512223          	sw	s5,36(sp)
    47ac:	02112e23          	sw	ra,60(sp)
    47b0:	02912a23          	sw	s1,52(sp)
    47b4:	03212823          	sw	s2,48(sp)
    47b8:	03312623          	sw	s3,44(sp)
    47bc:	03412423          	sw	s4,40(sp)
    47c0:	03612023          	sw	s6,32(sp)
    47c4:	01712e23          	sw	s7,28(sp)
    47c8:	01812c23          	sw	s8,24(sp)
    47cc:	01912a23          	sw	s9,20(sp)
    47d0:	00050a93          	mv	s5,a0
    47d4:	00068413          	mv	s0,a3
    47d8:	00058513          	mv	a0,a1
    47dc:	00079e63          	bnez	a5,47f8 <fl_fread+0x60>
    47e0:	00c12623          	sw	a2,12(sp)
    47e4:	00b12423          	sw	a1,8(sp)
    47e8:	ffffe097          	auipc	ra,0xffffe
    47ec:	9dc080e7          	jalr	-1572(ra) # 21c4 <fl_init>
    47f0:	00c12603          	lw	a2,12(sp)
    47f4:	00812503          	lw	a0,8(sp)
    47f8:	14040e63          	beqz	s0,4954 <fl_fread+0x1bc>
    47fc:	140a8c63          	beqz	s5,4954 <fl_fread+0x1bc>
    4800:	43844783          	lbu	a5,1080(s0)
    4804:	fff00493          	li	s1,-1
    4808:	0017f793          	andi	a5,a5,1
    480c:	04078863          	beqz	a5,485c <fl_fread+0xc4>
    4810:	00060593          	mv	a1,a2
    4814:	ffffd097          	auipc	ra,0xffffd
    4818:	51c080e7          	jalr	1308(ra) # 1d30 <__mulsi3>
    481c:	00050493          	mv	s1,a0
    4820:	02050e63          	beqz	a0,485c <fl_fread+0xc4>
    4824:	00842583          	lw	a1,8(s0)
    4828:	00c42783          	lw	a5,12(s0)
    482c:	12f5f463          	bgeu	a1,a5,4954 <fl_fread+0x1bc>
    4830:	00b50733          	add	a4,a0,a1
    4834:	00e7f463          	bgeu	a5,a4,483c <fl_fread+0xa4>
    4838:	40b784b3          	sub	s1,a5,a1
    483c:	0095da13          	srli	s4,a1,0x9
    4840:	1ff5f913          	andi	s2,a1,511
    4844:	00000993          	li	s3,0
    4848:	23040b13          	addi	s6,s0,560
    484c:	20000b93          	li	s7,512
    4850:	1ff00c13          	li	s8,511
    4854:	0499c063          	blt	s3,s1,4894 <fl_fread+0xfc>
    4858:	00098493          	mv	s1,s3
    485c:	03c12083          	lw	ra,60(sp)
    4860:	03812403          	lw	s0,56(sp)
    4864:	03012903          	lw	s2,48(sp)
    4868:	02c12983          	lw	s3,44(sp)
    486c:	02812a03          	lw	s4,40(sp)
    4870:	02412a83          	lw	s5,36(sp)
    4874:	02012b03          	lw	s6,32(sp)
    4878:	01c12b83          	lw	s7,28(sp)
    487c:	01812c03          	lw	s8,24(sp)
    4880:	01412c83          	lw	s9,20(sp)
    4884:	00048513          	mv	a0,s1
    4888:	03412483          	lw	s1,52(sp)
    488c:	04010113          	addi	sp,sp,64
    4890:	00008067          	ret
    4894:	04091663          	bnez	s2,48e0 <fl_fread+0x148>
    4898:	413486b3          	sub	a3,s1,s3
    489c:	04dc5263          	bge	s8,a3,48e0 <fl_fread+0x148>
    48a0:	4096d693          	srai	a3,a3,0x9
    48a4:	013a8633          	add	a2,s5,s3
    48a8:	000a0593          	mv	a1,s4
    48ac:	00040513          	mv	a0,s0
    48b0:	fffff097          	auipc	ra,0xfffff
    48b4:	5ec080e7          	jalr	1516(ra) # 3e9c <_read_sectors>
    48b8:	fa0500e3          	beqz	a0,4858 <fl_fread+0xc0>
    48bc:	00951c93          	slli	s9,a0,0x9
    48c0:	000c8613          	mv	a2,s9
    48c4:	00aa0a33          	add	s4,s4,a0
    48c8:	00842783          	lw	a5,8(s0)
    48cc:	00c989b3          	add	s3,s3,a2
    48d0:	00000913          	li	s2,0
    48d4:	019787b3          	add	a5,a5,s9
    48d8:	00f42423          	sw	a5,8(s0)
    48dc:	f79ff06f          	j	4854 <fl_fread+0xbc>
    48e0:	43042783          	lw	a5,1072(s0)
    48e4:	03478e63          	beq	a5,s4,4920 <fl_fread+0x188>
    48e8:	43442783          	lw	a5,1076(s0)
    48ec:	00078863          	beqz	a5,48fc <fl_fread+0x164>
    48f0:	00040513          	mv	a0,s0
    48f4:	00000097          	auipc	ra,0x0
    48f8:	d3c080e7          	jalr	-708(ra) # 4630 <fl_fflush>
    48fc:	00100693          	li	a3,1
    4900:	000b0613          	mv	a2,s6
    4904:	000a0593          	mv	a1,s4
    4908:	00040513          	mv	a0,s0
    490c:	fffff097          	auipc	ra,0xfffff
    4910:	590080e7          	jalr	1424(ra) # 3e9c <_read_sectors>
    4914:	f40502e3          	beqz	a0,4858 <fl_fread+0xc0>
    4918:	43442823          	sw	s4,1072(s0)
    491c:	42042a23          	sw	zero,1076(s0)
    4920:	412b87b3          	sub	a5,s7,s2
    4924:	41348633          	sub	a2,s1,s3
    4928:	00c7d463          	bge	a5,a2,4930 <fl_fread+0x198>
    492c:	00078613          	mv	a2,a5
    4930:	012b05b3          	add	a1,s6,s2
    4934:	013a8533          	add	a0,s5,s3
    4938:	00060c93          	mv	s9,a2
    493c:	00c12423          	sw	a2,8(sp)
    4940:	ffffd097          	auipc	ra,0xffffd
    4944:	cc8080e7          	jalr	-824(ra) # 1608 <memcpy>
    4948:	00812603          	lw	a2,8(sp)
    494c:	001a0a13          	addi	s4,s4,1
    4950:	f79ff06f          	j	48c8 <fl_fread+0x130>
    4954:	fff00493          	li	s1,-1
    4958:	f05ff06f          	j	485c <fl_fread+0xc4>

0000495c <fatfs_allocate_free_space>:
    495c:	fd010113          	addi	sp,sp,-48
    4960:	02112623          	sw	ra,44(sp)
    4964:	02812423          	sw	s0,40(sp)
    4968:	02912223          	sw	s1,36(sp)
    496c:	03212023          	sw	s2,32(sp)
    4970:	01312e23          	sw	s3,28(sp)
    4974:	01412c23          	sw	s4,24(sp)
    4978:	01512a23          	sw	s5,20(sp)
    497c:	02069863          	bnez	a3,49ac <fatfs_allocate_free_space+0x50>
    4980:	00000413          	li	s0,0
    4984:	02c12083          	lw	ra,44(sp)
    4988:	00040513          	mv	a0,s0
    498c:	02812403          	lw	s0,40(sp)
    4990:	02412483          	lw	s1,36(sp)
    4994:	02012903          	lw	s2,32(sp)
    4998:	01c12983          	lw	s3,28(sp)
    499c:	01812a03          	lw	s4,24(sp)
    49a0:	01412a83          	lw	s5,20(sp)
    49a4:	03010113          	addi	sp,sp,48
    49a8:	00008067          	ret
    49ac:	02452783          	lw	a5,36(a0)
    49b0:	00058a13          	mv	s4,a1
    49b4:	fff00593          	li	a1,-1
    49b8:	00050493          	mv	s1,a0
    49bc:	00068913          	mv	s2,a3
    49c0:	00060993          	mv	s3,a2
    49c4:	00b78663          	beq	a5,a1,49d0 <fatfs_allocate_free_space+0x74>
    49c8:	fffff097          	auipc	ra,0xfffff
    49cc:	620080e7          	jalr	1568(ra) # 3fe8 <fatfs_set_fs_info_next_free_cluster>
    49d0:	0004c783          	lbu	a5,0(s1)
    49d4:	00090513          	mv	a0,s2
    49d8:	00979a93          	slli	s5,a5,0x9
    49dc:	000a8593          	mv	a1,s5
    49e0:	ffffd097          	auipc	ra,0xffffd
    49e4:	b60080e7          	jalr	-1184(ra) # 1540 <__udivsi3>
    49e8:	00050413          	mv	s0,a0
    49ec:	00050593          	mv	a1,a0
    49f0:	000a8513          	mv	a0,s5
    49f4:	ffffd097          	auipc	ra,0xffffd
    49f8:	33c080e7          	jalr	828(ra) # 1d30 <__mulsi3>
    49fc:	41250533          	sub	a0,a0,s2
    4a00:	00a03533          	snez	a0,a0
    4a04:	00a40933          	add	s2,s0,a0
    4a08:	040a0463          	beqz	s4,4a50 <fatfs_allocate_free_space+0xf4>
    4a0c:	0084a583          	lw	a1,8(s1)
    4a10:	00c10613          	addi	a2,sp,12
    4a14:	00048513          	mv	a0,s1
    4a18:	fffff097          	auipc	ra,0xfffff
    4a1c:	680080e7          	jalr	1664(ra) # 4098 <fatfs_find_blank_cluster>
    4a20:	00050413          	mv	s0,a0
    4a24:	f4050ee3          	beqz	a0,4980 <fatfs_allocate_free_space+0x24>
    4a28:	00100793          	li	a5,1
    4a2c:	02f91663          	bne	s2,a5,4a58 <fatfs_allocate_free_space+0xfc>
    4a30:	00c12903          	lw	s2,12(sp)
    4a34:	fff00613          	li	a2,-1
    4a38:	00048513          	mv	a0,s1
    4a3c:	00090593          	mv	a1,s2
    4a40:	fffff097          	auipc	ra,0xfffff
    4a44:	76c080e7          	jalr	1900(ra) # 41ac <fatfs_fat_set_cluster>
    4a48:	0129a023          	sw	s2,0(s3)
    4a4c:	f39ff06f          	j	4984 <fatfs_allocate_free_space+0x28>
    4a50:	0009a783          	lw	a5,0(s3)
    4a54:	00f12623          	sw	a5,12(sp)
    4a58:	00090613          	mv	a2,s2
    4a5c:	00c10593          	addi	a1,sp,12
    4a60:	00048513          	mv	a0,s1
    4a64:	00000097          	auipc	ra,0x0
    4a68:	954080e7          	jalr	-1708(ra) # 43b8 <fatfs_add_free_space>
    4a6c:	00050413          	mv	s0,a0
    4a70:	f15ff06f          	j	4984 <fatfs_allocate_free_space+0x28>

00004a74 <fatfs_add_file_entry>:
    4a74:	03852883          	lw	a7,56(a0)
    4a78:	30088e63          	beqz	a7,4d94 <fatfs_add_file_entry+0x320>
    4a7c:	f8010113          	addi	sp,sp,-128
    4a80:	06812c23          	sw	s0,120(sp)
    4a84:	00050413          	mv	s0,a0
    4a88:	00060513          	mv	a0,a2
    4a8c:	06912a23          	sw	s1,116(sp)
    4a90:	07512223          	sw	s5,100(sp)
    4a94:	00f12c23          	sw	a5,24(sp)
    4a98:	00e12a23          	sw	a4,20(sp)
    4a9c:	06112e23          	sw	ra,124(sp)
    4aa0:	07212823          	sw	s2,112(sp)
    4aa4:	07312623          	sw	s3,108(sp)
    4aa8:	07412423          	sw	s4,104(sp)
    4aac:	07612023          	sw	s6,96(sp)
    4ab0:	05712e23          	sw	s7,92(sp)
    4ab4:	05812c23          	sw	s8,88(sp)
    4ab8:	05912a23          	sw	s9,84(sp)
    4abc:	05a12823          	sw	s10,80(sp)
    4ac0:	05b12623          	sw	s11,76(sp)
    4ac4:	01012e23          	sw	a6,28(sp)
    4ac8:	00068a93          	mv	s5,a3
    4acc:	00c12823          	sw	a2,16(sp)
    4ad0:	00b12423          	sw	a1,8(sp)
    4ad4:	ffffe097          	auipc	ra,0xffffe
    4ad8:	a48080e7          	jalr	-1464(ra) # 251c <fatfs_lfn_entries_required>
    4adc:	00150713          	addi	a4,a0,1
    4ae0:	00100793          	li	a5,1
    4ae4:	00050493          	mv	s1,a0
    4ae8:	2ae7f263          	bgeu	a5,a4,4d8c <fatfs_add_file_entry+0x318>
    4aec:	00000a13          	li	s4,0
    4af0:	00000993          	li	s3,0
    4af4:	00000913          	li	s2,0
    4af8:	00000c93          	li	s9,0
    4afc:	00000b13          	li	s6,0
    4b00:	01000c13          	li	s8,16
    4b04:	00812583          	lw	a1,8(sp)
    4b08:	00000693          	li	a3,0
    4b0c:	000b0613          	mv	a2,s6
    4b10:	00040513          	mv	a0,s0
    4b14:	000b0b93          	mv	s7,s6
    4b18:	ffffe097          	auipc	ra,0xffffe
    4b1c:	7f4080e7          	jalr	2036(ra) # 330c <fatfs_sector_reader>
    4b20:	18050463          	beqz	a0,4ca8 <fatfs_add_file_entry+0x234>
    4b24:	001b0b13          	addi	s6,s6,1
    4b28:	04440793          	addi	a5,s0,68
    4b2c:	000c8d13          	mv	s10,s9
    4b30:	00000d93          	li	s11,0
    4b34:	00078513          	mv	a0,a5
    4b38:	00f12623          	sw	a5,12(sp)
    4b3c:	ffffe097          	auipc	ra,0xffffe
    4b40:	8f8080e7          	jalr	-1800(ra) # 2434 <fatfs_entry_lfn_text>
    4b44:	00c12783          	lw	a5,12(sp)
    4b48:	00050c93          	mv	s9,a0
    4b4c:	02050c63          	beqz	a0,4b84 <fatfs_add_file_entry+0x110>
    4b50:	020d0463          	beqz	s10,4b78 <fatfs_add_file_entry+0x104>
    4b54:	00090c93          	mv	s9,s2
    4b58:	000c8913          	mv	s2,s9
    4b5c:	001d0c93          	addi	s9,s10,1
    4b60:	001d8d93          	addi	s11,s11,1
    4b64:	0ffdfd93          	zext.b	s11,s11
    4b68:	02078793          	addi	a5,a5,32
    4b6c:	f98d8ce3          	beq	s11,s8,4b04 <fatfs_add_file_entry+0x90>
    4b70:	000c8d13          	mv	s10,s9
    4b74:	fc1ff06f          	j	4b34 <fatfs_add_file_entry+0xc0>
    4b78:	000d8a13          	mv	s4,s11
    4b7c:	000b8993          	mv	s3,s7
    4b80:	fd9ff06f          	j	4b58 <fatfs_add_file_entry+0xe4>
    4b84:	0007c683          	lbu	a3,0(a5)
    4b88:	0e500713          	li	a4,229
    4b8c:	10e69863          	bne	a3,a4,4c9c <fatfs_add_file_entry+0x228>
    4b90:	000d1863          	bnez	s10,4ba0 <fatfs_add_file_entry+0x12c>
    4b94:	000d8a13          	mv	s4,s11
    4b98:	000b8993          	mv	s3,s7
    4b9c:	00100913          	li	s2,1
    4ba0:	fa9d4ee3          	blt	s10,s1,4b5c <fatfs_add_file_entry+0xe8>
    4ba4:	00ba8693          	addi	a3,s5,11
    4ba8:	000a8713          	mv	a4,s5
    4bac:	00000913          	li	s2,0
    4bb0:	00074603          	lbu	a2,0(a4)
    4bb4:	00195793          	srli	a5,s2,0x1
    4bb8:	00791913          	slli	s2,s2,0x7
    4bbc:	012787b3          	add	a5,a5,s2
    4bc0:	00170713          	addi	a4,a4,1
    4bc4:	00c787b3          	add	a5,a5,a2
    4bc8:	0ff7f913          	zext.b	s2,a5
    4bcc:	fed712e3          	bne	a4,a3,4bb0 <fatfs_add_file_entry+0x13c>
    4bd0:	00098b13          	mv	s6,s3
    4bd4:	00000d13          	li	s10,0
    4bd8:	01000b93          	li	s7,16
    4bdc:	00812583          	lw	a1,8(sp)
    4be0:	00000693          	li	a3,0
    4be4:	000b0613          	mv	a2,s6
    4be8:	00040513          	mv	a0,s0
    4bec:	ffffe097          	auipc	ra,0xffffe
    4bf0:	720080e7          	jalr	1824(ra) # 330c <fatfs_sector_reader>
    4bf4:	18050c63          	beqz	a0,4d8c <fatfs_add_file_entry+0x318>
    4bf8:	04440c93          	addi	s9,s0,68
    4bfc:	413b0db3          	sub	s11,s6,s3
    4c00:	00000793          	li	a5,0
    4c04:	00000c13          	li	s8,0
    4c08:	01912623          	sw	s9,12(sp)
    4c0c:	000d1663          	bnez	s10,4c18 <fatfs_add_file_entry+0x1a4>
    4c10:	154c1863          	bne	s8,s4,4d60 <fatfs_add_file_entry+0x2ec>
    4c14:	140d9663          	bnez	s11,4d60 <fatfs_add_file_entry+0x2ec>
    4c18:	12049263          	bnez	s1,4d3c <fatfs_add_file_entry+0x2c8>
    4c1c:	01c12703          	lw	a4,28(sp)
    4c20:	01412603          	lw	a2,20(sp)
    4c24:	01812583          	lw	a1,24(sp)
    4c28:	02010693          	addi	a3,sp,32
    4c2c:	000a8513          	mv	a0,s5
    4c30:	ffffe097          	auipc	ra,0xffffe
    4c34:	a30080e7          	jalr	-1488(ra) # 2660 <fatfs_sfn_create_entry>
    4c38:	02000613          	li	a2,32
    4c3c:	00c105b3          	add	a1,sp,a2
    4c40:	000c8513          	mv	a0,s9
    4c44:	ffffd097          	auipc	ra,0xffffd
    4c48:	9c4080e7          	jalr	-1596(ra) # 1608 <memcpy>
    4c4c:	03842783          	lw	a5,56(s0)
    4c50:	00c12583          	lw	a1,12(sp)
    4c54:	24442503          	lw	a0,580(s0)
    4c58:	00100613          	li	a2,1
    4c5c:	000780e7          	jalr	a5
    4c60:	07c12083          	lw	ra,124(sp)
    4c64:	07812403          	lw	s0,120(sp)
    4c68:	07412483          	lw	s1,116(sp)
    4c6c:	07012903          	lw	s2,112(sp)
    4c70:	06c12983          	lw	s3,108(sp)
    4c74:	06812a03          	lw	s4,104(sp)
    4c78:	06412a83          	lw	s5,100(sp)
    4c7c:	06012b03          	lw	s6,96(sp)
    4c80:	05c12b83          	lw	s7,92(sp)
    4c84:	05812c03          	lw	s8,88(sp)
    4c88:	05412c83          	lw	s9,84(sp)
    4c8c:	05012d03          	lw	s10,80(sp)
    4c90:	04c12d83          	lw	s11,76(sp)
    4c94:	08010113          	addi	sp,sp,128
    4c98:	00008067          	ret
    4c9c:	ee068ae3          	beqz	a3,4b90 <fatfs_add_file_entry+0x11c>
    4ca0:	00000913          	li	s2,0
    4ca4:	ebdff06f          	j	4b60 <fatfs_add_file_entry+0xec>
    4ca8:	00842583          	lw	a1,8(s0)
    4cac:	02010613          	addi	a2,sp,32
    4cb0:	00040513          	mv	a0,s0
    4cb4:	fffff097          	auipc	ra,0xfffff
    4cb8:	3e4080e7          	jalr	996(ra) # 4098 <fatfs_find_blank_cluster>
    4cbc:	0c050863          	beqz	a0,4d8c <fatfs_add_file_entry+0x318>
    4cc0:	02012b83          	lw	s7,32(sp)
    4cc4:	00812583          	lw	a1,8(sp)
    4cc8:	00040513          	mv	a0,s0
    4ccc:	000b8613          	mv	a2,s7
    4cd0:	fffff097          	auipc	ra,0xfffff
    4cd4:	64c080e7          	jalr	1612(ra) # 431c <fatfs_fat_add_cluster_to_chain>
    4cd8:	0a050a63          	beqz	a0,4d8c <fatfs_add_file_entry+0x318>
    4cdc:	20000613          	li	a2,512
    4ce0:	00000593          	li	a1,0
    4ce4:	04440513          	addi	a0,s0,68
    4ce8:	ffffd097          	auipc	ra,0xffffd
    4cec:	904080e7          	jalr	-1788(ra) # 15ec <memset>
    4cf0:	00000c13          	li	s8,0
    4cf4:	00044783          	lbu	a5,0(s0)
    4cf8:	00fc6a63          	bltu	s8,a5,4d0c <fatfs_add_file_entry+0x298>
    4cfc:	ea0914e3          	bnez	s2,4ba4 <fatfs_add_file_entry+0x130>
    4d00:	000b0993          	mv	s3,s6
    4d04:	00000a13          	li	s4,0
    4d08:	e9dff06f          	j	4ba4 <fatfs_add_file_entry+0x130>
    4d0c:	00000693          	li	a3,0
    4d10:	000c0613          	mv	a2,s8
    4d14:	000b8593          	mv	a1,s7
    4d18:	00040513          	mv	a0,s0
    4d1c:	ffffd097          	auipc	ra,0xffffd
    4d20:	3f4080e7          	jalr	1012(ra) # 2110 <fatfs_write_sector>
    4d24:	06050463          	beqz	a0,4d8c <fatfs_add_file_entry+0x318>
    4d28:	001c0c13          	addi	s8,s8,1
    4d2c:	0ffc7c13          	zext.b	s8,s8
    4d30:	fc5ff06f          	j	4cf4 <fatfs_add_file_entry+0x280>
    4d34:	001b0b13          	addi	s6,s6,1
    4d38:	ea5ff06f          	j	4bdc <fatfs_add_file_entry+0x168>
    4d3c:	01012503          	lw	a0,16(sp)
    4d40:	fff48493          	addi	s1,s1,-1
    4d44:	00090693          	mv	a3,s2
    4d48:	00048613          	mv	a2,s1
    4d4c:	000c8593          	mv	a1,s9
    4d50:	ffffd097          	auipc	ra,0xffffd
    4d54:	7fc080e7          	jalr	2044(ra) # 254c <fatfs_filename_to_lfn>
    4d58:	00100d13          	li	s10,1
    4d5c:	000d0793          	mv	a5,s10
    4d60:	001c0c13          	addi	s8,s8,1
    4d64:	0ffc7c13          	zext.b	s8,s8
    4d68:	020c8c93          	addi	s9,s9,32
    4d6c:	eb7c10e3          	bne	s8,s7,4c0c <fatfs_add_file_entry+0x198>
    4d70:	fc0782e3          	beqz	a5,4d34 <fatfs_add_file_entry+0x2c0>
    4d74:	03842783          	lw	a5,56(s0)
    4d78:	00c12583          	lw	a1,12(sp)
    4d7c:	24442503          	lw	a0,580(s0)
    4d80:	00100613          	li	a2,1
    4d84:	000780e7          	jalr	a5
    4d88:	fa0516e3          	bnez	a0,4d34 <fatfs_add_file_entry+0x2c0>
    4d8c:	00000513          	li	a0,0
    4d90:	ed1ff06f          	j	4c60 <fatfs_add_file_entry+0x1ec>
    4d94:	00000513          	li	a0,0
    4d98:	00008067          	ret

00004d9c <fl_fopen>:
    4d9c:	000057b7          	lui	a5,0x5
    4da0:	7507a783          	lw	a5,1872(a5) # 5750 <_filelib_init>
    4da4:	fa010113          	addi	sp,sp,-96
    4da8:	05212823          	sw	s2,80(sp)
    4dac:	03a12823          	sw	s10,48(sp)
    4db0:	04112e23          	sw	ra,92(sp)
    4db4:	04812c23          	sw	s0,88(sp)
    4db8:	04912a23          	sw	s1,84(sp)
    4dbc:	05312623          	sw	s3,76(sp)
    4dc0:	05412423          	sw	s4,72(sp)
    4dc4:	05512223          	sw	s5,68(sp)
    4dc8:	05612023          	sw	s6,64(sp)
    4dcc:	03712e23          	sw	s7,60(sp)
    4dd0:	03812c23          	sw	s8,56(sp)
    4dd4:	03912a23          	sw	s9,52(sp)
    4dd8:	00050d13          	mv	s10,a0
    4ddc:	00058913          	mv	s2,a1
    4de0:	00079663          	bnez	a5,4dec <fl_fopen+0x50>
    4de4:	ffffd097          	auipc	ra,0xffffd
    4de8:	3e0080e7          	jalr	992(ra) # 21c4 <fl_init>
    4dec:	000057b7          	lui	a5,0x5
    4df0:	74c7a783          	lw	a5,1868(a5) # 574c <_filelib_valid>
    4df4:	00193713          	seqz	a4,s2
    4df8:	0017b793          	seqz	a5,a5
    4dfc:	00e7e7b3          	or	a5,a5,a4
    4e00:	36079e63          	bnez	a5,517c <fl_fopen+0x3e0>
    4e04:	360d0c63          	beqz	s10,517c <fl_fopen+0x3e0>
    4e08:	00000493          	li	s1,0
    4e0c:	00000413          	li	s0,0
    4e10:	05700993          	li	s3,87
    4e14:	07200a13          	li	s4,114
    4e18:	07700b13          	li	s6,119
    4e1c:	06100b93          	li	s7,97
    4e20:	06200c13          	li	s8,98
    4e24:	04100a93          	li	s5,65
    4e28:	04200c93          	li	s9,66
    4e2c:	00090513          	mv	a0,s2
    4e30:	ffffc097          	auipc	ra,0xffffc
    4e34:	7fc080e7          	jalr	2044(ra) # 162c <strlen>
    4e38:	10a44a63          	blt	s0,a0,4f4c <fl_fopen+0x1b0>
    4e3c:	000079b7          	lui	s3,0x7
    4e40:	37098a13          	addi	s4,s3,880 # 7370 <_fs>
    4e44:	038a2783          	lw	a5,56(s4)
    4e48:	00079463          	bnez	a5,4e50 <fl_fopen+0xb4>
    4e4c:	fd94f493          	andi	s1,s1,-39
    4e50:	03ca2783          	lw	a5,60(s4)
    4e54:	00078463          	beqz	a5,4e5c <fl_fopen+0xc0>
    4e58:	000780e7          	jalr	a5
    4e5c:	0014f793          	andi	a5,s1,1
    4e60:	18079263          	bnez	a5,4fe4 <fl_fopen+0x248>
    4e64:	0204f793          	andi	a5,s1,32
    4e68:	08078c63          	beqz	a5,4f00 <fl_fopen+0x164>
    4e6c:	038a2783          	lw	a5,56(s4)
    4e70:	06078a63          	beqz	a5,4ee4 <fl_fopen+0x148>
    4e74:	ffffd097          	auipc	ra,0xffffd
    4e78:	160080e7          	jalr	352(ra) # 1fd4 <_allocate_file>
    4e7c:	00050413          	mv	s0,a0
    4e80:	06050263          	beqz	a0,4ee4 <fl_fopen+0x148>
    4e84:	01450a93          	addi	s5,a0,20
    4e88:	10400613          	li	a2,260
    4e8c:	00000593          	li	a1,0
    4e90:	000a8513          	mv	a0,s5
    4e94:	ffffc097          	auipc	ra,0xffffc
    4e98:	758080e7          	jalr	1880(ra) # 15ec <memset>
    4e9c:	11840b13          	addi	s6,s0,280
    4ea0:	10400613          	li	a2,260
    4ea4:	00000593          	li	a1,0
    4ea8:	000b0513          	mv	a0,s6
    4eac:	ffffc097          	auipc	ra,0xffffc
    4eb0:	740080e7          	jalr	1856(ra) # 15ec <memset>
    4eb4:	10400713          	li	a4,260
    4eb8:	000b0693          	mv	a3,s6
    4ebc:	00070613          	mv	a2,a4
    4ec0:	000a8593          	mv	a1,s5
    4ec4:	000d0513          	mv	a0,s10
    4ec8:	ffffe097          	auipc	ra,0xffffe
    4ecc:	c88080e7          	jalr	-888(ra) # 2b50 <fatfs_split_path>
    4ed0:	fff00793          	li	a5,-1
    4ed4:	12f51663          	bne	a0,a5,5000 <fl_fopen+0x264>
    4ed8:	00040513          	mv	a0,s0
    4edc:	ffffd097          	auipc	ra,0xffffd
    4ee0:	170080e7          	jalr	368(ra) # 204c <_free_file>
    4ee4:	00000413          	li	s0,0
    4ee8:	0214f793          	andi	a5,s1,33
    4eec:	02000713          	li	a4,32
    4ef0:	28e79263          	bne	a5,a4,5174 <fl_fopen+0x3d8>
    4ef4:	10041263          	bnez	s0,4ff8 <fl_fopen+0x25c>
    4ef8:	0064f793          	andi	a5,s1,6
    4efc:	26079463          	bnez	a5,5164 <fl_fopen+0x3c8>
    4f00:	00000413          	li	s0,0
    4f04:	040a2783          	lw	a5,64(s4)
    4f08:	00078463          	beqz	a5,4f10 <fl_fopen+0x174>
    4f0c:	000780e7          	jalr	a5
    4f10:	05c12083          	lw	ra,92(sp)
    4f14:	00040513          	mv	a0,s0
    4f18:	05812403          	lw	s0,88(sp)
    4f1c:	05412483          	lw	s1,84(sp)
    4f20:	05012903          	lw	s2,80(sp)
    4f24:	04c12983          	lw	s3,76(sp)
    4f28:	04812a03          	lw	s4,72(sp)
    4f2c:	04412a83          	lw	s5,68(sp)
    4f30:	04012b03          	lw	s6,64(sp)
    4f34:	03c12b83          	lw	s7,60(sp)
    4f38:	03812c03          	lw	s8,56(sp)
    4f3c:	03412c83          	lw	s9,52(sp)
    4f40:	03012d03          	lw	s10,48(sp)
    4f44:	06010113          	addi	sp,sp,96
    4f48:	00008067          	ret
    4f4c:	008907b3          	add	a5,s2,s0
    4f50:	0007c783          	lbu	a5,0(a5)
    4f54:	05378863          	beq	a5,s3,4fa4 <fl_fopen+0x208>
    4f58:	02f9e863          	bltu	s3,a5,4f88 <fl_fopen+0x1ec>
    4f5c:	05578863          	beq	a5,s5,4fac <fl_fopen+0x210>
    4f60:	00faea63          	bltu	s5,a5,4f74 <fl_fopen+0x1d8>
    4f64:	02b00713          	li	a4,43
    4f68:	04e78663          	beq	a5,a4,4fb4 <fl_fopen+0x218>
    4f6c:	00140413          	addi	s0,s0,1
    4f70:	ebdff06f          	j	4e2c <fl_fopen+0x90>
    4f74:	03978263          	beq	a5,s9,4f98 <fl_fopen+0x1fc>
    4f78:	05200713          	li	a4,82
    4f7c:	fee798e3          	bne	a5,a4,4f6c <fl_fopen+0x1d0>
    4f80:	0014e493          	ori	s1,s1,1
    4f84:	fe9ff06f          	j	4f6c <fl_fopen+0x1d0>
    4f88:	ff478ce3          	beq	a5,s4,4f80 <fl_fopen+0x1e4>
    4f8c:	00fa6a63          	bltu	s4,a5,4fa0 <fl_fopen+0x204>
    4f90:	01778e63          	beq	a5,s7,4fac <fl_fopen+0x210>
    4f94:	fd879ce3          	bne	a5,s8,4f6c <fl_fopen+0x1d0>
    4f98:	0084e493          	ori	s1,s1,8
    4f9c:	fd1ff06f          	j	4f6c <fl_fopen+0x1d0>
    4fa0:	fd6796e3          	bne	a5,s6,4f6c <fl_fopen+0x1d0>
    4fa4:	0324e493          	ori	s1,s1,50
    4fa8:	fc5ff06f          	j	4f6c <fl_fopen+0x1d0>
    4fac:	0264e493          	ori	s1,s1,38
    4fb0:	fbdff06f          	j	4f6c <fl_fopen+0x1d0>
    4fb4:	0014f793          	andi	a5,s1,1
    4fb8:	00078663          	beqz	a5,4fc4 <fl_fopen+0x228>
    4fbc:	0024e493          	ori	s1,s1,2
    4fc0:	fadff06f          	j	4f6c <fl_fopen+0x1d0>
    4fc4:	0024f793          	andi	a5,s1,2
    4fc8:	00078663          	beqz	a5,4fd4 <fl_fopen+0x238>
    4fcc:	0314e493          	ori	s1,s1,49
    4fd0:	f9dff06f          	j	4f6c <fl_fopen+0x1d0>
    4fd4:	0044f793          	andi	a5,s1,4
    4fd8:	f8078ae3          	beqz	a5,4f6c <fl_fopen+0x1d0>
    4fdc:	0274e493          	ori	s1,s1,39
    4fe0:	f8dff06f          	j	4f6c <fl_fopen+0x1d0>
    4fe4:	000d0513          	mv	a0,s10
    4fe8:	fffff097          	auipc	ra,0xfffff
    4fec:	81c080e7          	jalr	-2020(ra) # 3804 <_open_file>
    4ff0:	00050413          	mv	s0,a0
    4ff4:	e60508e3          	beqz	a0,4e64 <fl_fopen+0xc8>
    4ff8:	42940c23          	sb	s1,1080(s0)
    4ffc:	f09ff06f          	j	4f04 <fl_fopen+0x168>
    5000:	00040513          	mv	a0,s0
    5004:	ffffe097          	auipc	ra,0xffffe
    5008:	dc8080e7          	jalr	-568(ra) # 2dcc <_check_file_open>
    500c:	00050913          	mv	s2,a0
    5010:	ec0514e3          	bnez	a0,4ed8 <fl_fopen+0x13c>
    5014:	01444783          	lbu	a5,20(s0)
    5018:	0e079663          	bnez	a5,5104 <fl_fopen+0x368>
    501c:	008a2783          	lw	a5,8(s4)
    5020:	00f42023          	sw	a5,0(s0)
    5024:	00042583          	lw	a1,0(s0)
    5028:	01010693          	addi	a3,sp,16
    502c:	000b0613          	mv	a2,s6
    5030:	37098513          	addi	a0,s3,880
    5034:	ffffe097          	auipc	ra,0xffffe
    5038:	428080e7          	jalr	1064(ra) # 345c <fatfs_get_file_entry>
    503c:	00100693          	li	a3,1
    5040:	e8d50ce3          	beq	a0,a3,4ed8 <fl_fopen+0x13c>
    5044:	00042223          	sw	zero,4(s0)
    5048:	00440613          	addi	a2,s0,4
    504c:	00068593          	mv	a1,a3
    5050:	37098513          	addi	a0,s3,880
    5054:	00000097          	auipc	ra,0x0
    5058:	908080e7          	jalr	-1784(ra) # 495c <fatfs_allocate_free_space>
    505c:	e6050ee3          	beqz	a0,4ed8 <fl_fopen+0x13c>
    5060:	00002ab7          	lui	s5,0x2
    5064:	21c40b93          	addi	s7,s0,540
    5068:	37098c13          	addi	s8,s3,880
    506c:	70fa8a93          	addi	s5,s5,1807 # 270f <fatfs_lfn_create_sfn+0xb>
    5070:	000b0593          	mv	a1,s6
    5074:	00410513          	addi	a0,sp,4
    5078:	ffffd097          	auipc	ra,0xffffd
    507c:	68c080e7          	jalr	1676(ra) # 2704 <fatfs_lfn_create_sfn>
    5080:	08090e63          	beqz	s2,511c <fl_fopen+0x380>
    5084:	00090613          	mv	a2,s2
    5088:	00410593          	addi	a1,sp,4
    508c:	000b8513          	mv	a0,s7
    5090:	ffffd097          	auipc	ra,0xffffd
    5094:	7f0080e7          	jalr	2032(ra) # 2880 <fatfs_lfn_generate_tail>
    5098:	00042583          	lw	a1,0(s0)
    509c:	000b8613          	mv	a2,s7
    50a0:	000c0513          	mv	a0,s8
    50a4:	fffff097          	auipc	ra,0xfffff
    50a8:	8d4080e7          	jalr	-1836(ra) # 3978 <fatfs_sfn_exists>
    50ac:	00050663          	beqz	a0,50b8 <fl_fopen+0x31c>
    50b0:	00190913          	addi	s2,s2,1
    50b4:	fb591ee3          	bne	s2,s5,5070 <fl_fopen+0x2d4>
    50b8:	00442703          	lw	a4,4(s0)
    50bc:	000027b7          	lui	a5,0x2
    50c0:	70f78793          	addi	a5,a5,1807 # 270f <fatfs_lfn_create_sfn+0xb>
    50c4:	00070593          	mv	a1,a4
    50c8:	02f90663          	beq	s2,a5,50f4 <fl_fopen+0x358>
    50cc:	00042583          	lw	a1,0(s0)
    50d0:	00000813          	li	a6,0
    50d4:	00000793          	li	a5,0
    50d8:	000b8693          	mv	a3,s7
    50dc:	000b0613          	mv	a2,s6
    50e0:	37098513          	addi	a0,s3,880
    50e4:	00000097          	auipc	ra,0x0
    50e8:	990080e7          	jalr	-1648(ra) # 4a74 <fatfs_add_file_entry>
    50ec:	04051463          	bnez	a0,5134 <fl_fopen+0x398>
    50f0:	00442583          	lw	a1,4(s0)
    50f4:	37098513          	addi	a0,s3,880
    50f8:	fffff097          	auipc	ra,0xfffff
    50fc:	1b4080e7          	jalr	436(ra) # 42ac <fatfs_free_cluster_chain>
    5100:	dd9ff06f          	j	4ed8 <fl_fopen+0x13c>
    5104:	00040593          	mv	a1,s0
    5108:	000a8513          	mv	a0,s5
    510c:	ffffe097          	auipc	ra,0xffffe
    5110:	54c080e7          	jalr	1356(ra) # 3658 <_open_directory>
    5114:	f00518e3          	bnez	a0,5024 <fl_fopen+0x288>
    5118:	dc1ff06f          	j	4ed8 <fl_fopen+0x13c>
    511c:	00b00613          	li	a2,11
    5120:	00410593          	addi	a1,sp,4
    5124:	000b8513          	mv	a0,s7
    5128:	ffffc097          	auipc	ra,0xffffc
    512c:	4e0080e7          	jalr	1248(ra) # 1608 <memcpy>
    5130:	f69ff06f          	j	5098 <fl_fopen+0x2fc>
    5134:	fff00793          	li	a5,-1
    5138:	00042623          	sw	zero,12(s0)
    513c:	00042423          	sw	zero,8(s0)
    5140:	42f42823          	sw	a5,1072(s0)
    5144:	42042a23          	sw	zero,1076(s0)
    5148:	00042823          	sw	zero,16(s0)
    514c:	22f42423          	sw	a5,552(s0)
    5150:	22f42623          	sw	a5,556(s0)
    5154:	37098513          	addi	a0,s3,880
    5158:	ffffe097          	auipc	ra,0xffffe
    515c:	054080e7          	jalr	84(ra) # 31ac <fatfs_fat_purge>
    5160:	d89ff06f          	j	4ee8 <fl_fopen+0x14c>
    5164:	000d0513          	mv	a0,s10
    5168:	ffffe097          	auipc	ra,0xffffe
    516c:	69c080e7          	jalr	1692(ra) # 3804 <_open_file>
    5170:	00050413          	mv	s0,a0
    5174:	e80412e3          	bnez	s0,4ff8 <fl_fopen+0x25c>
    5178:	d89ff06f          	j	4f00 <fl_fopen+0x164>
    517c:	00000413          	li	s0,0
    5180:	d91ff06f          	j	4f10 <fl_fopen+0x174>

00005184 <cmd16>:
    5184:	02000050 00001500                       P.......

0000518c <acmd41>:
    518c:	00004069 00000100                       i@......

00005194 <cmd55>:
    5194:	00000077 00000100                       w.......

0000519c <cmd8>:
    519c:	01000048 000087aa                       H.......

000051a4 <cmd0>:
    51a4:	00000040 00009500                       @.......

000051ac <AUDIO>:
    51ac:	00018000                                ....

000051b0 <DISPLAY>:
    51b0:	00014000                                .@..

000051b4 <BUTTONS>:
    51b4:	00010100                                ....

000051b8 <SDCARD>:
    51b8:	00010080                                ....

000051bc <OLED_RST>:
    51bc:	00010010                                ....

000051c0 <OLED>:
    51c0:	00010008                                ....

000051c4 <LEDS>:
    51c4:	00010004 00006272 00000000 696c632f     ....rb....../cli
    51d4:	722e6b63 00007761 3a727245 0a732520     ck.raw..Err: %s.
    51e4:	00000000 79616c50 3a676e69 20732520     ....Playing: %s 
    51f4:	20202020 20202020 000a2020 0000002f               ../...
    5204:	00002e2e 0000002e 4c494620 203a5345     ........ FILES: 
    5214:	00000000 74706d45 000a2179 5d64255b     ....Empty!..[%d]
    5224:	00000020 203e6425 00000000 20202020      ...%d> ....    
    5234:	20202020 20202020 20202020 20202020                     
    5244:	00000a20 25202020 00000a73 6f432020      ...   %s...  Co
    5254:	676e696d 6f6f5320 000a216e 656c6946     ming Soon!..File
    5264:	70784520 65726f6c 00000072 79616c50      Explorer...Play
    5274:	6e6f5320 00007367 4d204a44 0065646f      Songs..DJ Mode.
    5284:	203d3d3d 4e49414d 4e454d20 3d3d2055     === MAIN MENU ==
    5294:	000a0a3d 2e642520 20732520 20202020     =... %d. %s     
    52a4:	000a2020 0000000a 656c6553 26207463       ......Select &
    52b4:	65725020 42207373 00006e74 74696e49      Press Btn..Init
    52c4:	20445320 64726163 0a2e2e2e 00000000      SD card........
    52d4:	33323130 37363534 42413938 46454443     0123456789ABCDEF
    52e4:	00000000 5f544146 203a5346 6f727245     ....FAT_FS: Erro
    52f4:	6f632072 20646c75 20746f6e 64616f6c     r could not load
    5304:	54414620 74656420 736c6961 64252820      FAT details (%d
    5314:	0a0d2129 00000000                       )!......

0000531c <font>:
    531c:	00000000 00002f00 00030000 14000003     ...../..........
    532c:	143e143e 3a2b6a2e 08122600 171c3224     >.>..j+:.&..$2..
    533c:	03003415 00000000 0000211e 001e2100     .4.......!...!..
    534c:	08220000 0822081c 0000081c 00002040     .."...".....@ ..
    535c:	00080800 00200000 20000000 02040810     ...... .... ....
    536c:	3f21213f 003f0100 253d0000 25002725     ?!!?..?...=%%'.%
    537c:	003f2525 3f040407 25252700 253f003d     %%?....?.'%%=.?%
    538c:	01003d25 00030539 3f25253f 25252700     %=..9...?%%?.'%%
    539c:	0028003f 40000000 00000028 00110a04     ?.(....@(.......
    53ac:	00141400 0a110000 01000004 0007052d     ............-...
    53bc:	253d213f 09093f1f 253f003f 3f003c27     ?!=%.?..?.?%'<.?
    53cc:	00212121 1e21213f 25253f00 053f0025     !!!.?!!..?%%%.?.
    53dc:	3f000505 003d2521 3f04043f 213f2100     ...?!%=.?..?.!?!
    53ec:	20380000 3f013f21 003b0404 2020203f     ..8 !?.?..;.?   
    53fc:	3f013f00 023f3f01 3f003f04 003f2121     .?.?.??..?.?!!?.
    540c:	0f09093f 31213f00 093f003f 27002f39     ?....?!1?.?.9/.'
    541c:	003d2525 013f0101 20203f01 100f003f     %%=...?..?  ?...
    542c:	3f001f30 3f203f20 3b04043b 38080f00     0..? ? ?;..;...8
    543c:	2931000f 3f002325 00000021 04081020     ..1)%#.?!... ...
    544c:	003f2102 01020000 20000201 00000020     .!?........  ...
    545c:	00000201 24243800 243f003c 3c003c24     .....8$$<.?$$<.<
    546c:	00242424 3f24243c 2c2c3c00 3f04002c     $$$.<$$?.<,,,..?
    547c:	bc000005 00fca4a4 3c04043f 00003d00     ........?..<.=..
    548c:	fd800000 3f000000 00340808 0000003f     .......?..4.?...
    549c:	3c043c00 043c3c04 3c003c04 003c2424     .<.<.<<..<.<$$<.
    54ac:	3c2424fc 24243c00 083c00fc 2c000004     .$$<.<$$..<....,
    54bc:	003c2c2c 00243f04 20203c00 100c003c     ,,<..?$..<  <...
    54cc:	3c001c30 3c203c20 34080834 a0a0bc00     0..< < <4..4....
    54dc:	342400fc 0400242c 0000213f 0000003f     ..$4,$..?!..?...
    54ec:	043f2100 02010000 00000102 00000000     .!?.............
    54fc:	00000001 00000003 00000005 00000007     ................
    550c:	00000009 0000000e 00000010 00000012     ................
    551c:	00000014 00000016 00000018 0000001c     ................
    552c:	0000001e                                ....

00005530 <current_path>:
    5530:	0000002f 00000000 00000000 00000000     /...............
	...

00005724 <n_items>:
    5724:	00000000                                ....

00005728 <sdcard_while_loading_callback>:
    5728:	00000000                                ....

0000572c <back_color>:
	...

0000572d <front_color>:
    572d:	                                         ...

00005730 <cursor_y>:
    5730:	00000000                                ....

00005734 <cursor_x>:
    5734:	00000000                                ....

00005738 <f_putchar>:
    5738:	00000000                                ....

0000573c <_free_file_list>:
	...

00005744 <_open_file_list>:
	...

0000574c <_filelib_valid>:
    574c:	00000000                                ....

00005750 <_filelib_init>:
    5750:	00000000                                ....
