SECTIONS
{
    __romPos = 0;
    header_ROM_START = __romPos;
    header_VRAM = ADDR(.header);
    .header : AT(header_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        header_DATA_START = .;
        build/asm/us/rev1/header.o(.data);
        header_DATA_END = .;
        header_DATA_SIZE = ABSOLUTE(header_DATA_END - header_DATA_START);
    }
    __romPos += SIZEOF(.header);
    header_ROM_END = __romPos;
    header_VRAM_END = .;

    boot_ROM_START = __romPos;
    boot_VRAM = ADDR(.boot);
    .boot : AT(boot_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        boot_DATA_START = .;
        build/bin/us/rev1/boot.o(.data);
        boot_DATA_END = .;
        boot_DATA_SIZE = ABSOLUTE(boot_DATA_END - boot_DATA_START);
    }
    __romPos += SIZEOF(.boot);
    boot_ROM_END = __romPos;
    boot_VRAM_END = .;

    audio_heap_bss_ROM_START = __romPos;
    audio_heap_bss_VRAM = ADDR(.audio_heap_bss);
    .audio_heap_bss 0x80001000 : AT(audio_heap_bss_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
    }
    audio_heap_bss_bss_VRAM = ADDR(.audio_heap_bss_bss);
    .audio_heap_bss_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        audio_heap_bss_BSS_START = .;
        build/asm/us/rev1/data/audio_heap_bss.bss.o(.bss);
        . = ALIGN(., 16);
        audio_heap_bss_BSS_END = .;
        audio_heap_bss_BSS_SIZE = ABSOLUTE(audio_heap_bss_BSS_END - audio_heap_bss_BSS_START);
    }
    __romPos += SIZEOF(.audio_heap_bss);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    audio_heap_bss_ROM_END = __romPos;
    audio_heap_bss_VRAM_END = .;

    audio_bss_ROM_START = __romPos;
    audio_bss_VRAM = ADDR(.audio_bss);
    .audio_bss 0x80038100 : AT(audio_bss_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
    }
    audio_bss_bss_VRAM = ADDR(.audio_bss_bss);
    .audio_bss_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        audio_bss_BSS_START = .;
        build/asm/us/rev1/data/audio_bss.bss.o(.bss);
        . = ALIGN(., 16);
        audio_bss_BSS_END = .;
        audio_bss_BSS_SIZE = ABSOLUTE(audio_bss_BSS_END - audio_bss_BSS_START);
    }
    __romPos += SIZEOF(.audio_bss);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    audio_bss_ROM_END = __romPos;
    audio_bss_VRAM_END = .;

    entry_ROM_START = __romPos;
    entry_VRAM = ADDR(.entry);
    .entry 0x80046800 : AT(entry_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        entry_TEXT_START = .;
        build/asm/us/rev1/entrypoint.o(.text);
        . = ALIGN(., 16);
        entry_TEXT_END = .;
        entry_TEXT_SIZE = ABSOLUTE(entry_TEXT_END - entry_TEXT_START);
        entry_DATA_START = .;
        build/asm/us/rev1/entrypoint.o(.data);
        . = ALIGN(., 16);
        entry_DATA_END = .;
        entry_DATA_SIZE = ABSOLUTE(entry_DATA_END - entry_DATA_START);
        entry_RODATA_START = .;
        build/asm/us/rev1/entrypoint.o(.rodata);
        . = ALIGN(., 16);
        entry_RODATA_END = .;
        entry_RODATA_SIZE = ABSOLUTE(entry_RODATA_END - entry_RODATA_START);
    }
    entry_bss_VRAM = ADDR(.entry_bss);
    .entry_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        entry_BSS_START = .;
        build/asm/us/rev1/entrypoint.o(.bss);
        . = ALIGN(., 16);
        entry_BSS_END = .;
        entry_BSS_SIZE = ABSOLUTE(entry_BSS_END - entry_BSS_START);
    }
    __romPos += SIZEOF(.entry);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    entry_ROM_END = __romPos;
    entry_VRAM_END = .;

    main_segment_ROM_START = __romPos;
    main_segment_VRAM = ADDR(.main_segment);
    .main_segment entry_VRAM_END : AT(main_segment_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        main_segment_TEXT_START = .;
        build/src/sys/sys_main.o(.text);
        build/src/game/main.o(.text);
        build/src/sys/sys_audio.o(.text);
        build/src/sys/sys_utils.o(.text);
        build/src/game/code_5480.o(.text);
        build/src/game/water_69D0.o(.text);
        build/src/game/code_BD30.o(.text);
        build/src/game/code_BF40.o(.text);
        build/src/game/code_C6C0.o(.text);
        build/src/game/code_24270.o(.text);
        build/src/game/code_24B00.o(.text);
        build/src/game/code_2C670.o(.text);
        build/src/game/code_2FB10.o(.text);
        build/src/game/wr64_unused_print.o(.text);
        build/src/game/core/wr64_save.o(.text);
        build/src/game/code_383C0.o(.text);
        build/src/game/code_39F00.o(.text);
        build/src/game/code_3A580.o(.text);
        build/src/game/code_3AC00.o(.text);
        build/src/game/code_42670.o(.text);
        build/src/game/code_43A60.o(.text);
        build/src/game/code_43DA0.o(.text);
        build/src/game/code_4C750.o(.text);
        build/src/game/code_4F850.o(.text);
        build/src/game/wr64_game_load.o(.text);
        build/src/game/code_52CD0.o(.text);
        build/src/game/code_68A10.o(.text);
        build/src/game/code_6EF50.o(.text);
        build/asm/us/rev1/mio0.o(.text);
        build/src/audio/audio_synthesis.o(.text);
        build/src/audio/audio_heap.o(.text);
        build/src/audio/audio_load.o(.text);
        build/src/audio/audio_playback.o(.text);
        build/src/audio/audio_effects.o(.text);
        build/src/audio/audio_seqplayer.o(.text);
        build/src/audio/audio_general.o(.text);
        build/src/audio/audio_thread.o(.text);
        build/src/libultra/os/virtualtophysical.o(.text);
        build/src/libultra/os/sendmesg.o(.text);
        build/src/libultra/os/gettime.o(.text);
        build/src/libultra/os/settime.o(.text);
        build/src/libultra/io/viswapbuf.o(.text);
        build/src/libultra/os/contreaddata.o(.text);
        build/src/libultra/os/recvmesg.o(.text);
        build/asm/us/rev1/libultra/os/dpgetstat.o(.text);
        build/src/libultra/io/visetmode.o(.text);
        build/src/libultra/io/visetspecial.o(.text);
        build/src/libultra/os/sptaskyield.o(.text);
        build/src/libultra/os/sptask.o(.text);
        build/src/libultra/os/dpsetstat.o(.text);
        build/src/libultra/os/createmesgqueue.o(.text);
        build/src/libultra/os/seteventmesg.o(.text);
        build/src/libultra/io/visetevent.o(.text);
        build/src/libultra/os/createthread.o(.text);
        build/src/libultra/os/startthread.o(.text);
        build/src/libultra/os/sptaskyielded.o(.text);
        build/asm/us/rev1/libultra/writebackdcacheall.o(.text);
        build/src/libultra/io/vimgr.o(.text);
        build/src/libultra/io/viblack.o(.text);
        build/src/libultra/io/vigetcurrframebuf.o(.text);
        build/src/libultra/io/pimgr.o(.text);
        build/src/libultra/os/setthreadpri.o(.text);
        build/src/libultra/os/initialize.o(.text);
        build/asm/us/rev1/libultra/sqrtf.o(.text);
        build/src/libultra/io/controller.o(.text);
        build/src/libultra/gu/ortho.o(.text);
        build/src/libultra/gu/translate.o(.text);
        build/src/libultra/gu/lookatref.o(.text);
        build/src/libultra/gu/lookathil.o(.text);
        build/src/libultra/os/osEepromLongRead.o(.text);
        build/src/libultra/io/conteeplongwrite.o(.text);
        build/src/libultra/io/conteepprobe.o(.text);
        build/src/libultra/io/pfsisplug.o(.text);
        build/src/libultra/io/pfsinit.o(.text);
        build/src/libultra/io/pfssearchfile.o(.text);
        build/src/libultra/io/pfsfreeblocks.o(.text);
        build/src/libultra/io/pfsreadwritefile.o(.text);
        build/src/libultra/io/pfsallocatefile.o(.text);
        build/src/libultra/io/pfsdeletefile.o(.text);
        build/src/libultra/os/osPhysicalToVirtual.o(.text);
        build/src/libultra/io/pfsnumfiles.o(.text);
        build/src/libultra/io/pfsfilestate.o(.text);
        build/src/libultra/libc/sprintf.o(.text);
        build/asm/us/rev1/libultra/invaldcache.o(.text);
        build/src/libultra/io/pidma.o(.text);
        build/asm/us/rev1/libultra/invalicache.o(.text);
        build/asm/us/rev1/libultra/bzero.o(.text);
        build/src/libultra/os/osAiSetFrequency.o(.text);
        build/src/libultra/audio/bnkf.o(.text);
        build/src/libultra/os/osAiGetLength.o(.text);
        build/src/libultra/os/osAiSetNextBuffer.o(.text);
        build/asm/us/rev1/libultra/probetlb.o(.text);
        build/asm/us/rev1/libultra/interrupt.o(.text);
        build/src/libultra/os/thread.o(.text);
        build/asm/us/rev1/libultra/exceptasm.o(.text);
        build/asm/us/rev1/libultra/osGetCount.o(.text);
        build/src/libultra/os/timerintr.o(.text);
        build/src/libultra/io/vi.o(.text);
        build/src/libultra/io/siacs.o(.text);
        build/src/libultra/io/sirawdma.o(.text);
        build/src/libultra/io/spsetstat.o(.text);
        build/asm/us/rev1/libultra/bcopy.o(.text);
        build/asm/us/rev1/libultra/writebackdcache.o(.text);
        build/src/libultra/io/spsetpc.o(.text);
        build/src/libultra/io/sprawdma.o(.text);
        build/src/libultra/os/__osSpDeviceBusy.o(.text);
        build/src/libultra/io/spgetstat.o(.text);
        build/src/libultra/os/getthreadpri.o(.text);
        build/src/libultra/io/vigetcurrcontext.o(.text);
        build/src/libultra/io/viswapcontext.o(.text);
        build/src/libultra/io/piacs.o(.text);
        build/src/libultra/os/osPiRawStartDma.o(.text);
        build/src/libultra/os/osDevMgrMain.o(.text);
        build/asm/us/rev1/libultra/__osSetSR.o(.text);
        build/asm/us/rev1/libultra/__osGetSR.o(.text);
        build/asm/us/rev1/libultra/setfpccsr.o(.text);
        build/src/libultra/io/sirawread.o(.text);
        build/src/libultra/io/sirawwrite.o(.text);
        build/asm/us/rev1/libultra/osMapTLBRdb.o(.text);
        build/src/libultra/io/pirawread.o(.text);
        build/src/libultra/libc/ll.o(.text);
        build/src/libultra/os/settimer.o(.text);
        build/src/libultra/gu/mtxutil.o(.text);
        build/src/libultra/io/conteepread.o(.text);
        build/src/libultra/io/conteepwrite.o(.text);
        build/src/libultra/io/pfs.o(.text);
        build/src/libultra/io/pfschecker.o(.text);
        build/src/libultra/io/contramread.o(.text);
        build/src/libultra/io/contramwrite.o(.text);
        build/src/libultra/libc/xprintf.o(.text);
        build/src/libultra/strchr.o(.text);
        build/src/libultra/os/osJamMesg.o(.text);
        build/src/libultra/os/osPiGetCmdQueue.o(.text);
        build/src/libultra/io/ai.o(.text);
        build/src/libultra/os/kdebugserver.o(.text);
        build/src/libultra/os/syncputchars.o(.text);
        build/asm/us/rev1/libultra/setinmask.o(.text);
        build/src/libultra/os/osDestroyThread.o(.text);
        build/asm/us/rev1/libultra/setcompare.o(.text);
        build/src/libultra/io/si.o(.text);
        build/src/libultra/io/crc.o(.text);
        build/src/libultra/libc/xlitob.o(.text);
        build/src/libultra/libc/xldtob.o(.text);
        build/asm/us/rev1/libultra/getcause.o(.text);
        build/src/libultra/os/atomic.o(.text);
        build/src/libultra/ldiv.o(.text);
        build/asm/us/rev1/data/rspboot.o(.text);
        build/asm/us/rev1/data/f3d.o(.text);
        build/asm/us/rev1/data/aspMain.o(.text);
        . = ALIGN(., 16);
        main_segment_TEXT_END = .;
        main_segment_TEXT_SIZE = ABSOLUTE(main_segment_TEXT_END - main_segment_TEXT_START);
        main_segment_DATA_START = .;
        build/src/sys/sys_main.o(.data);
        build/src/game/main.o(.data);
        build/asm/us/rev1/data/8EDD0.data.o(.data);
        build/asm/us/rev1/data/8EDF0.data.o(.data);
        build/src/sys/sys_audio.o(.data);
        build/src/sys/sys_utils.o(.data);
        build/src/game/code_5480.o(.data);
        build/src/game/water_69D0.o(.data);
        build/asm/us/rev1/data/8EE40.data.o(.data);
        build/src/game/code_BD30.o(.data);
        build/src/game/code_BF40.o(.data);
        build/src/game/code_C6C0.o(.data);
        build/src/game/code_24270.o(.data);
        build/src/game/code_24B00.o(.data);
        build/src/game/code_2C670.o(.data);
        build/src/game/code_2FB10.o(.data);
        build/src/game/wr64_unused_print.o(.data);
        build/src/game/core/wr64_save.o(.data);
        build/src/game/code_383C0.o(.data);
        build/src/game/code_39F00.o(.data);
        build/src/game/code_3A580.o(.data);
        build/src/game/code_3AC00.o(.data);
        build/src/game/code_42670.o(.data);
        build/src/game/code_43A60.o(.data);
        build/src/game/code_43DA0.o(.data);
        build/asm/us/rev1/data/8F000.data.o(.data);
        build/src/game/code_4C750.o(.data);
        build/src/game/code_4F850.o(.data);
        build/src/game/wr64_game_load.o(.data);
        build/src/game/code_52CD0.o(.data);
        build/src/game/code_68A10.o(.data);
        build/src/game/code_6EF50.o(.data);
        build/asm/us/rev1/mio0.o(.data);
        build/src/audio/audio_synthesis.o(.data);
        build/src/audio/audio_heap.o(.data);
        build/src/audio/audio_load.o(.data);
        build/src/audio/audio_playback.o(.data);
        build/src/audio/audio_effects.o(.data);
        build/src/audio/audio_seqplayer.o(.data);
        build/src/audio/audio_general.o(.data);
        build/asm/us/rev1/data/95310.data.o(.data);
        build/src/ovl_table.o(.data);
        build/asm/us/rev1/data/9F930.data.o(.data);
        build/src/audio/audio_thread.o(.data);
        build/src/libultra/os/virtualtophysical.o(.data);
        build/src/libultra/os/sendmesg.o(.data);
        build/src/libultra/os/gettime.o(.data);
        build/src/libultra/os/settime.o(.data);
        build/src/libultra/io/viswapbuf.o(.data);
        build/src/libultra/os/contreaddata.o(.data);
        build/src/libultra/os/recvmesg.o(.data);
        build/asm/us/rev1/libultra/os/dpgetstat.o(.data);
        build/src/libultra/io/visetmode.o(.data);
        build/src/libultra/io/visetspecial.o(.data);
        build/src/libultra/os/sptaskyield.o(.data);
        build/src/libultra/os/sptask.o(.data);
        build/src/libultra/os/dpsetstat.o(.data);
        build/src/libultra/os/createmesgqueue.o(.data);
        build/src/libultra/os/seteventmesg.o(.data);
        build/src/libultra/io/visetevent.o(.data);
        build/src/libultra/os/createthread.o(.data);
        build/src/libultra/os/startthread.o(.data);
        build/src/libultra/os/sptaskyielded.o(.data);
        build/asm/us/rev1/libultra/writebackdcacheall.o(.data);
        build/asm/us/rev1/data/A2F70.data.o(.data);
        build/src/libultra/io/vimgr.o(.data);
        build/src/libultra/io/viblack.o(.data);
        build/src/libultra/io/vigetcurrframebuf.o(.data);
        build/src/libultra/io/pimgr.o(.data);
        build/src/libultra/os/setthreadpri.o(.data);
        build/src/libultra/os/initialize.o(.data);
        build/asm/us/rev1/libultra/sqrtf.o(.data);
        build/src/libultra/io/controller.o(.data);
        build/src/libultra/gu/ortho.o(.data);
        build/src/libultra/gu/translate.o(.data);
        build/src/libultra/gu/lookatref.o(.data);
        build/src/libultra/gu/lookathil.o(.data);
        build/src/libultra/os/osEepromLongRead.o(.data);
        build/src/libultra/io/conteeplongwrite.o(.data);
        build/src/libultra/io/conteepprobe.o(.data);
        build/src/libultra/io/pfsisplug.o(.data);
        build/src/libultra/io/pfsinit.o(.data);
        build/src/libultra/io/pfssearchfile.o(.data);
        build/src/libultra/io/pfsfreeblocks.o(.data);
        build/src/libultra/io/pfsreadwritefile.o(.data);
        build/src/libultra/io/pfsallocatefile.o(.data);
        build/src/libultra/io/pfsdeletefile.o(.data);
        build/src/libultra/os/osPhysicalToVirtual.o(.data);
        build/src/libultra/io/pfsnumfiles.o(.data);
        build/src/libultra/io/pfsfilestate.o(.data);
        build/src/libultra/libc/sprintf.o(.data);
        build/asm/us/rev1/libultra/invaldcache.o(.data);
        build/src/libultra/io/pidma.o(.data);
        build/asm/us/rev1/libultra/invalicache.o(.data);
        build/asm/us/rev1/libultra/bzero.o(.data);
        build/src/libultra/os/osAiSetFrequency.o(.data);
        build/src/libultra/audio/bnkf.o(.data);
        build/src/libultra/os/osAiGetLength.o(.data);
        build/src/libultra/os/osAiSetNextBuffer.o(.data);
        build/asm/us/rev1/libultra/probetlb.o(.data);
        build/asm/us/rev1/libultra/interrupt.o(.data);
        build/src/libultra/os/thread.o(.data);
        build/asm/us/rev1/libultra/exceptasm.o(.data);
        build/asm/us/rev1/libultra/osGetCount.o(.data);
        build/asm/us/rev1/data/A3820.data.o(.data);
        build/src/libultra/os/timerintr.o(.data);
        build/src/libultra/io/vi.o(.data);
        build/src/libultra/io/siacs.o(.data);
        build/src/libultra/io/sirawdma.o(.data);
        build/src/libultra/io/spsetstat.o(.data);
        build/asm/us/rev1/libultra/bcopy.o(.data);
        build/asm/us/rev1/libultra/writebackdcache.o(.data);
        build/src/libultra/io/spsetpc.o(.data);
        build/src/libultra/io/sprawdma.o(.data);
        build/src/libultra/os/__osSpDeviceBusy.o(.data);
        build/src/libultra/io/spgetstat.o(.data);
        build/src/libultra/os/getthreadpri.o(.data);
        build/src/libultra/io/vigetcurrcontext.o(.data);
        build/src/libultra/io/viswapcontext.o(.data);
        build/src/libultra/io/piacs.o(.data);
        build/src/libultra/os/osPiRawStartDma.o(.data);
        build/src/libultra/os/osDevMgrMain.o(.data);
        build/asm/us/rev1/libultra/__osSetSR.o(.data);
        build/asm/us/rev1/libultra/__osGetSR.o(.data);
        build/asm/us/rev1/libultra/setfpccsr.o(.data);
        build/src/libultra/io/sirawread.o(.data);
        build/src/libultra/io/sirawwrite.o(.data);
        build/asm/us/rev1/libultra/osMapTLBRdb.o(.data);
        build/src/libultra/io/pirawread.o(.data);
        build/src/libultra/libc/ll.o(.data);
        build/src/libultra/os/settimer.o(.data);
        build/src/libultra/gu/mtxutil.o(.data);
        build/src/libultra/io/conteepread.o(.data);
        build/src/libultra/io/conteepwrite.o(.data);
        build/src/libultra/io/pfs.o(.data);
        build/src/libultra/io/pfschecker.o(.data);
        build/src/libultra/io/contramread.o(.data);
        build/src/libultra/io/contramwrite.o(.data);
        build/src/libultra/libc/xprintf.o(.data);
        build/src/libultra/strchr.o(.data);
        build/src/libultra/os/osJamMesg.o(.data);
        build/src/libultra/os/osPiGetCmdQueue.o(.data);
        build/src/libultra/io/ai.o(.data);
        build/src/libultra/os/kdebugserver.o(.data);
        build/src/libultra/os/syncputchars.o(.data);
        build/asm/us/rev1/libultra/setinmask.o(.data);
        build/src/libultra/os/osDestroyThread.o(.data);
        build/asm/us/rev1/libultra/setcompare.o(.data);
        build/src/libultra/io/si.o(.data);
        build/src/libultra/io/crc.o(.data);
        build/src/libultra/vimodes.o(.data);
        build/src/libultra/libc/xlitob.o(.data);
        build/src/libultra/libc/xldtob.o(.data);
        build/asm/us/rev1/libultra/getcause.o(.data);
        build/src/libultra/os/atomic.o(.data);
        build/src/libultra/ldiv.o(.data);
        build/asm/us/rev1/data/rspboot.o(.data);
        build/asm/us/rev1/data/f3d.o(.data);
        main_segment_RODATA_START = .;
        build/src/sys/sys_utils.o(.rodata);
        build/src/game/code_5480.o(.rodata);
        build/src/game/water_69D0.o(.rodata);
        build/src/game/code_BD30.o(.rodata);
        build/src/game/code_BF40.o(.rodata);
        build/src/game/code_C6C0.o(.rodata);
        build/src/game/code_24270.o(.rodata);
        build/asm/us/rev1/data/A4070.data.o(.data);
        build/asm/us/rev1/data/A40B0.data.o(.data);
        build/asm/us/rev1/data/A40F0.data.o(.data);
        build/asm/us/rev1/data/A4130.data.o(.data);
        build/asm/us/rev1/data/A4170.data.o(.data);
        build/asm/us/rev1/data/A41B0.data.o(.data);
        build/asm/us/rev1/data/A41F0.data.o(.data);
        build/asm/us/rev1/data/A4230.data.o(.data);
        build/asm/us/rev1/data/A4270.data.o(.data);
        build/asm/us/rev1/data/A42B0.data.o(.data);
        build/src/game/code_24B00.o(.rodata);
        build/src/game/code_2C670.o(.rodata);
        build/src/game/code_2FB10.o(.rodata);
        build/src/game/wr64_unused_print.o(.rodata);
        build/src/game/core/wr64_save.o(.rodata);
        build/src/game/code_383C0.o(.rodata);
        build/src/game/code_39F00.o(.rodata);
        build/src/game/code_3A580.o(.rodata);
        build/src/game/code_3AC00.o(.rodata);
        build/src/game/code_42670.o(.rodata);
        build/src/game/code_43A60.o(.rodata);
        build/src/game/code_43DA0.o(.rodata);
        build/src/game/code_4C750.o(.rodata);
        build/src/game/code_4F850.o(.rodata);
        build/src/game/wr64_game_load.o(.rodata);
        build/src/game/code_52CD0.o(.rodata);
        build/src/game/code_68A10.o(.rodata);
        build/src/game/code_6EF50.o(.rodata);
        build/asm/us/rev1/mio0.o(.rodata);
        build/src/audio/audio_synthesis.o(.rodata);
        build/src/audio/audio_heap.o(.rodata);
        build/src/audio/audio_load.o(.rodata);
        build/src/audio/audio_playback.o(.rodata);
        build/src/audio/audio_effects.o(.rodata);
        build/src/audio/audio_seqplayer.o(.rodata);
        build/src/audio/audio_general.o(.rodata);
        build/src/audio/audio_thread.o(.rodata);
        build/src/libultra/os/virtualtophysical.o(.rodata);
        build/src/libultra/os/sendmesg.o(.rodata);
        build/src/libultra/os/gettime.o(.rodata);
        build/src/libultra/os/settime.o(.rodata);
        build/src/libultra/io/viswapbuf.o(.rodata);
        build/src/libultra/os/contreaddata.o(.rodata);
        build/src/libultra/os/recvmesg.o(.rodata);
        build/asm/us/rev1/libultra/os/dpgetstat.o(.rodata);
        build/src/libultra/io/visetmode.o(.rodata);
        build/src/libultra/io/visetspecial.o(.rodata);
        build/src/libultra/os/sptaskyield.o(.rodata);
        build/src/libultra/os/sptask.o(.rodata);
        build/src/libultra/os/dpsetstat.o(.rodata);
        build/src/libultra/os/createmesgqueue.o(.rodata);
        build/src/libultra/os/seteventmesg.o(.rodata);
        build/src/libultra/io/visetevent.o(.rodata);
        build/src/libultra/os/createthread.o(.rodata);
        build/src/libultra/os/startthread.o(.rodata);
        build/src/libultra/os/sptaskyielded.o(.rodata);
        build/asm/us/rev1/libultra/writebackdcacheall.o(.rodata);
        build/src/libultra/io/vimgr.o(.rodata);
        build/src/libultra/io/viblack.o(.rodata);
        build/src/libultra/io/vigetcurrframebuf.o(.rodata);
        build/src/libultra/io/pimgr.o(.rodata);
        build/src/libultra/os/setthreadpri.o(.rodata);
        build/src/libultra/os/initialize.o(.rodata);
        build/asm/us/rev1/libultra/sqrtf.o(.rodata);
        build/src/libultra/io/controller.o(.rodata);
        build/src/libultra/gu/ortho.o(.rodata);
        build/src/libultra/gu/translate.o(.rodata);
        build/src/libultra/gu/lookatref.o(.rodata);
        build/src/libultra/gu/lookathil.o(.rodata);
        build/src/libultra/os/osEepromLongRead.o(.rodata);
        build/src/libultra/io/conteeplongwrite.o(.rodata);
        build/src/libultra/io/conteepprobe.o(.rodata);
        build/src/libultra/io/pfsisplug.o(.rodata);
        build/src/libultra/io/pfsinit.o(.rodata);
        build/src/libultra/io/pfssearchfile.o(.rodata);
        build/src/libultra/io/pfsfreeblocks.o(.rodata);
        build/src/libultra/io/pfsreadwritefile.o(.rodata);
        build/src/libultra/io/pfsallocatefile.o(.rodata);
        build/src/libultra/io/pfsdeletefile.o(.rodata);
        build/src/libultra/os/osPhysicalToVirtual.o(.rodata);
        build/src/libultra/io/pfsnumfiles.o(.rodata);
        build/src/libultra/io/pfsfilestate.o(.rodata);
        build/src/libultra/libc/sprintf.o(.rodata);
        build/asm/us/rev1/libultra/invaldcache.o(.rodata);
        build/src/libultra/io/pidma.o(.rodata);
        build/asm/us/rev1/libultra/invalicache.o(.rodata);
        build/asm/us/rev1/libultra/bzero.o(.rodata);
        build/src/libultra/os/osAiSetFrequency.o(.rodata);
        build/src/libultra/audio/bnkf.o(.rodata);
        build/src/libultra/os/osAiGetLength.o(.rodata);
        build/src/libultra/os/osAiSetNextBuffer.o(.rodata);
        build/asm/us/rev1/libultra/probetlb.o(.rodata);
        build/asm/us/rev1/libultra/interrupt.o(.rodata);
        build/src/libultra/os/thread.o(.rodata);
        build/asm/us/rev1/libultra/exceptasm.o(.rodata);
        build/asm/us/rev1/libultra/osGetCount.o(.rodata);
        build/src/libultra/os/timerintr.o(.rodata);
        build/src/libultra/io/vi.o(.rodata);
        build/src/libultra/io/siacs.o(.rodata);
        build/src/libultra/io/sirawdma.o(.rodata);
        build/src/libultra/io/spsetstat.o(.rodata);
        build/asm/us/rev1/libultra/bcopy.o(.rodata);
        build/asm/us/rev1/libultra/writebackdcache.o(.rodata);
        build/src/libultra/io/spsetpc.o(.rodata);
        build/src/libultra/io/sprawdma.o(.rodata);
        build/src/libultra/os/__osSpDeviceBusy.o(.rodata);
        build/src/libultra/io/spgetstat.o(.rodata);
        build/src/libultra/os/getthreadpri.o(.rodata);
        build/src/libultra/io/vigetcurrcontext.o(.rodata);
        build/src/libultra/io/viswapcontext.o(.rodata);
        build/src/libultra/io/piacs.o(.rodata);
        build/src/libultra/os/osPiRawStartDma.o(.rodata);
        build/src/libultra/os/osDevMgrMain.o(.rodata);
        build/asm/us/rev1/libultra/__osSetSR.o(.rodata);
        build/asm/us/rev1/libultra/__osGetSR.o(.rodata);
        build/asm/us/rev1/libultra/setfpccsr.o(.rodata);
        build/src/libultra/io/sirawread.o(.rodata);
        build/src/libultra/io/sirawwrite.o(.rodata);
        build/asm/us/rev1/libultra/osMapTLBRdb.o(.rodata);
        build/src/libultra/io/pirawread.o(.rodata);
        build/src/libultra/libc/ll.o(.rodata);
        build/src/libultra/os/settimer.o(.rodata);
        build/src/libultra/gu/mtxutil.o(.rodata);
        build/src/libultra/io/conteepread.o(.rodata);
        build/src/libultra/io/conteepwrite.o(.rodata);
        build/src/libultra/io/pfs.o(.rodata);
        build/src/libultra/io/pfschecker.o(.rodata);
        build/src/libultra/io/contramread.o(.rodata);
        build/src/libultra/io/contramwrite.o(.rodata);
        build/asm/us/rev1/data/A6E00.rodata.o(.rodata);
        build/src/libultra/libc/xprintf.o(.rodata);
        build/src/libultra/strchr.o(.rodata);
        build/src/libultra/os/osJamMesg.o(.rodata);
        build/src/libultra/os/osPiGetCmdQueue.o(.rodata);
        build/src/libultra/io/ai.o(.rodata);
        build/src/libultra/os/kdebugserver.o(.rodata);
        build/src/libultra/os/syncputchars.o(.rodata);
        build/asm/us/rev1/libultra/setinmask.o(.rodata);
        build/src/libultra/os/osDestroyThread.o(.rodata);
        build/asm/us/rev1/libultra/setcompare.o(.rodata);
        build/src/libultra/io/si.o(.rodata);
        build/src/libultra/io/crc.o(.rodata);
        build/src/libultra/libc/xlitob.o(.rodata);
        build/asm/us/rev1/data/A6F50.rodata.o(.rodata);
        build/src/libultra/libc/xldtob.o(.rodata);
        build/asm/us/rev1/libultra/getcause.o(.rodata);
        build/src/libultra/os/atomic.o(.rodata);
        build/src/libultra/ldiv.o(.rodata);
        build/asm/us/rev1/data/rspboot.o(.rodata);
        build/asm/us/rev1/data/f3d.o(.rodata);
        build/asm/us/rev1/data/aspMain.o(.rodata);
        build/asm/us/rev1/data/A7030.data.o(.data);
        build/asm/us/rev1/data/aspMain.data.o(.data);
        . = ALIGN(., 16);
        main_segment_DATA_END = .;
        main_segment_DATA_SIZE = ABSOLUTE(main_segment_DATA_END - main_segment_DATA_START);
        build/src/sys/sys_main.o(.rodata);
        build/src/game/main.o(.rodata);
        build/src/sys/sys_audio.o(.rodata);
        . = ALIGN(., 16);
        main_segment_RODATA_END = .;
        main_segment_RODATA_SIZE = ABSOLUTE(main_segment_RODATA_END - main_segment_RODATA_START);
    }
    main_segment_bss_VRAM = ADDR(.main_segment_bss);
    .main_segment_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        main_segment_BSS_START = .;
        build/src/sys/sys_main.o(.bss);
        build/src/game/main.o(.bss);
        build/src/sys/sys_audio.o(.bss);
        build/src/sys/sys_utils.o(.bss);
        build/src/game/code_5480.o(.bss);
        build/src/game/water_69D0.o(.bss);
        build/src/game/code_BD30.o(.bss);
        build/src/game/code_BF40.o(.bss);
        build/src/game/code_C6C0.o(.bss);
        build/src/game/code_24270.o(.bss);
        build/src/game/code_24B00.o(.bss);
        build/src/game/code_2C670.o(.bss);
        build/src/game/code_2FB10.o(.bss);
        build/src/game/wr64_unused_print.o(.bss);
        build/src/game/core/wr64_save.o(.bss);
        build/src/game/code_383C0.o(.bss);
        build/src/game/code_39F00.o(.bss);
        build/src/game/code_3A580.o(.bss);
        build/src/game/code_3AC00.o(.bss);
        build/src/game/code_42670.o(.bss);
        build/src/game/code_43A60.o(.bss);
        build/src/game/code_43DA0.o(.bss);
        build/src/game/code_4C750.o(.bss);
        build/src/game/code_4F850.o(.bss);
        build/src/game/wr64_game_load.o(.bss);
        build/src/game/code_52CD0.o(.bss);
        build/src/game/code_68A10.o(.bss);
        build/src/game/code_6EF50.o(.bss);
        build/asm/us/rev1/mio0.o(.bss);
        build/src/audio/audio_synthesis.o(.bss);
        build/src/audio/audio_heap.o(.bss);
        build/src/audio/audio_load.o(.bss);
        build/src/audio/audio_playback.o(.bss);
        build/src/audio/audio_effects.o(.bss);
        build/src/audio/audio_seqplayer.o(.bss);
        build/src/audio/audio_general.o(.bss);
        build/src/audio/audio_thread.o(.bss);
        build/src/libultra/os/virtualtophysical.o(.bss);
        build/src/libultra/os/sendmesg.o(.bss);
        build/src/libultra/os/gettime.o(.bss);
        build/src/libultra/os/settime.o(.bss);
        build/src/libultra/io/viswapbuf.o(.bss);
        build/src/libultra/os/contreaddata.o(.bss);
        build/src/libultra/os/recvmesg.o(.bss);
        build/asm/us/rev1/libultra/os/dpgetstat.o(.bss);
        build/src/libultra/io/visetmode.o(.bss);
        build/src/libultra/io/visetspecial.o(.bss);
        build/src/libultra/os/sptaskyield.o(.bss);
        build/asm/us/rev1/data/bss1.bss.o(.bss);
        build/src/libultra/os/sptask.o(.bss);
        build/src/libultra/os/dpsetstat.o(.bss);
        build/src/libultra/os/createmesgqueue.o(.bss);
        build/src/libultra/os/seteventmesg.o(.bss);
        build/src/libultra/io/visetevent.o(.bss);
        build/src/libultra/os/createthread.o(.bss);
        build/src/libultra/os/startthread.o(.bss);
        build/src/libultra/os/sptaskyielded.o(.bss);
        build/asm/us/rev1/libultra/writebackdcacheall.o(.bss);
        build/src/libultra/io/vimgr.o(.bss);
        build/src/libultra/io/viblack.o(.bss);
        build/src/libultra/io/vigetcurrframebuf.o(.bss);
        build/src/libultra/io/pimgr.o(.bss);
        build/src/libultra/os/setthreadpri.o(.bss);
        build/src/libultra/os/initialize.o(.bss);
        build/asm/us/rev1/libultra/sqrtf.o(.bss);
        build/src/libultra/libultra_bss.o(.bss);
        build/src/libultra/io/controller.o(.bss);
        build/src/libultra/gu/ortho.o(.bss);
        build/src/libultra/gu/translate.o(.bss);
        build/src/libultra/gu/lookatref.o(.bss);
        build/src/libultra/gu/lookathil.o(.bss);
        build/src/libultra/os/osEepromLongRead.o(.bss);
        build/src/libultra/io/conteeplongwrite.o(.bss);
        build/src/libultra/io/conteepprobe.o(.bss);
        build/src/libultra/io/pfsisplug.o(.bss);
        build/src/libultra/io/pfsinit.o(.bss);
        build/src/libultra/io/pfssearchfile.o(.bss);
        build/src/libultra/io/pfsfreeblocks.o(.bss);
        build/src/libultra/io/pfsreadwritefile.o(.bss);
        build/src/libultra/io/pfsallocatefile.o(.bss);
        build/src/libultra/io/pfsdeletefile.o(.bss);
        build/src/libultra/os/osPhysicalToVirtual.o(.bss);
        build/src/libultra/io/pfsnumfiles.o(.bss);
        build/src/libultra/io/pfsfilestate.o(.bss);
        build/src/libultra/libc/sprintf.o(.bss);
        build/asm/us/rev1/libultra/invaldcache.o(.bss);
        build/src/libultra/io/pidma.o(.bss);
        build/asm/us/rev1/libultra/invalicache.o(.bss);
        build/asm/us/rev1/libultra/bzero.o(.bss);
        build/src/libultra/os/osAiSetFrequency.o(.bss);
        build/src/libultra/audio/bnkf.o(.bss);
        build/src/libultra/os/osAiGetLength.o(.bss);
        build/src/libultra/os/osAiSetNextBuffer.o(.bss);
        build/asm/us/rev1/libultra/probetlb.o(.bss);
        build/asm/us/rev1/libultra/interrupt.o(.bss);
        build/src/libultra/os/thread.o(.bss);
        build/asm/us/rev1/libultra/exceptasm.o(.bss);
        build/asm/us/rev1/libultra/osGetCount.o(.bss);
        build/src/libultra/os/timerintr.o(.bss);
        build/src/libultra/io/vi.o(.bss);
        build/src/libultra/io/siacs.o(.bss);
        build/src/libultra/io/sirawdma.o(.bss);
        build/src/libultra/io/spsetstat.o(.bss);
        build/asm/us/rev1/libultra/bcopy.o(.bss);
        build/asm/us/rev1/libultra/writebackdcache.o(.bss);
        build/src/libultra/io/spsetpc.o(.bss);
        build/src/libultra/io/sprawdma.o(.bss);
        build/src/libultra/os/__osSpDeviceBusy.o(.bss);
        build/src/libultra/io/spgetstat.o(.bss);
        build/src/libultra/os/getthreadpri.o(.bss);
        build/src/libultra/io/vigetcurrcontext.o(.bss);
        build/src/libultra/io/viswapcontext.o(.bss);
        build/src/libultra/io/piacs.o(.bss);
        build/src/libultra/os/osPiRawStartDma.o(.bss);
        build/src/libultra/os/osDevMgrMain.o(.bss);
        build/asm/us/rev1/libultra/__osSetSR.o(.bss);
        build/asm/us/rev1/libultra/__osGetSR.o(.bss);
        build/asm/us/rev1/libultra/setfpccsr.o(.bss);
        build/src/libultra/io/sirawread.o(.bss);
        build/src/libultra/io/sirawwrite.o(.bss);
        build/asm/us/rev1/libultra/osMapTLBRdb.o(.bss);
        build/src/libultra/io/pirawread.o(.bss);
        build/src/libultra/libc/ll.o(.bss);
        build/src/libultra/os/settimer.o(.bss);
        build/src/libultra/gu/mtxutil.o(.bss);
        build/src/libultra/io/conteepread.o(.bss);
        build/src/libultra/io/conteepwrite.o(.bss);
        build/src/libultra/io/pfs.o(.bss);
        build/src/libultra/io/pfschecker.o(.bss);
        build/src/libultra/io/contramread.o(.bss);
        build/src/libultra/io/contramwrite.o(.bss);
        build/src/libultra/libc/xprintf.o(.bss);
        build/src/libultra/strchr.o(.bss);
        build/src/libultra/os/osJamMesg.o(.bss);
        build/src/libultra/os/osPiGetCmdQueue.o(.bss);
        build/src/libultra/io/ai.o(.bss);
        build/src/libultra/os/kdebugserver.o(.bss);
        build/src/libultra/os/syncputchars.o(.bss);
        build/asm/us/rev1/libultra/setinmask.o(.bss);
        build/src/libultra/os/osDestroyThread.o(.bss);
        build/asm/us/rev1/libultra/setcompare.o(.bss);
        build/src/libultra/io/si.o(.bss);
        build/src/libultra/io/crc.o(.bss);
        build/src/libultra/libc/xlitob.o(.bss);
        build/src/libultra/libc/xldtob.o(.bss);
        build/asm/us/rev1/libultra/getcause.o(.bss);
        build/src/libultra/os/atomic.o(.bss);
        build/src/libultra/ldiv.o(.bss);
        build/asm/us/rev1/data/rspboot.o(.bss);
        build/asm/us/rev1/data/f3d.o(.bss);
        build/asm/us/rev1/data/aspMain.o(.bss);
        . = ALIGN(., 16);
        main_segment_BSS_END = .;
        main_segment_BSS_SIZE = ABSOLUTE(main_segment_BSS_END - main_segment_BSS_START);
    }
    __romPos += SIZEOF(.main_segment);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    main_segment_ROM_END = __romPos;
    main_segment_VRAM_END = .;

    codeseg_ROM_START = __romPos;
    codeseg_VRAM = ADDR(.codeseg);
    .codeseg 0x801DAFA0 : AT(codeseg_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        codeseg_TEXT_START = .;
        build/src/codeseg/A95D0.o(.text);
        build/src/codeseg/AF8C0.o(.text);
        build/src/codeseg/B17D0.o(.text);
        build/src/codeseg/B2510.o(.text);
        build/src/codeseg/wr64_pause_menu.o(.text);
        build/src/codeseg/B3290.o(.text);
        build/src/codeseg/B3AA0.o(.text);
        build/src/codeseg/wr64_fade.o(.text);
        build/src/codeseg/B66E0.o(.text);
        build/src/codeseg/B97B0.o(.text);
        build/src/codeseg/C94E0.o(.text);
        . = ALIGN(., 16);
        codeseg_TEXT_END = .;
        codeseg_TEXT_SIZE = ABSOLUTE(codeseg_TEXT_END - codeseg_TEXT_START);
        codeseg_DATA_START = .;
        build/asm/us/rev1/data/CAE70.data.o(.data);
        build/asm/us/rev1/data/codeseg/A95D0.data.o(.data);
        codeseg_RODATA_START = .;
        build/src/codeseg/A95D0.o(.rodata);
        build/asm/us/rev1/data/codeseg/AF8C0.data.o(.data);
        build/src/codeseg/AF8C0.o(.rodata);
        build/asm/us/rev1/data/codeseg/B17D0.data.o(.data);
        build/src/codeseg/B17D0.o(.rodata);
        build/asm/us/rev1/data/codeseg/B2510.data.o(.data);
        build/src/codeseg/B2510.o(.rodata);
        build/src/codeseg/wr64_pause_menu.o(.data);
        build/src/codeseg/wr64_pause_menu.o(.rodata);
        build/asm/us/rev1/data/codeseg/B3290.data.o(.data);
        build/src/codeseg/B3290.o(.rodata);
        build/asm/us/rev1/data/codeseg/B3AA0.data.o(.data);
        build/src/codeseg/B3AA0.o(.rodata);
        build/asm/us/rev1/data/codeseg/wr64_fade.data.o(.data);
        build/src/codeseg/wr64_fade.o(.rodata);
        build/asm/us/rev1/data/codeseg/B66E0.data.o(.data);
        build/asm/us/rev1/data/F5470.data.o(.data);
        build/src/codeseg/B66E0.o(.rodata);
        build/asm/us/rev1/data/codeseg/B97B0.data.o(.data);
        build/src/codeseg/B97B0.o(.rodata);
        build/src/codeseg/C94E0.o(.rodata);
        . = ALIGN(., 16);
        codeseg_RODATA_END = .;
        codeseg_RODATA_SIZE = ABSOLUTE(codeseg_RODATA_END - codeseg_RODATA_START);
        build/asm/us/rev1/data/codeseg/C94E0.data.o(.data);
        build/asm/us/rev1/data/F6010.data.o(.data);
        . = ALIGN(., 16);
        codeseg_DATA_END = .;
        codeseg_DATA_SIZE = ABSOLUTE(codeseg_DATA_END - codeseg_DATA_START);
    }
    codeseg_bss_VRAM = ADDR(.codeseg_bss);
    .codeseg_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        codeseg_BSS_START = .;
        build/src/codeseg/A95D0.o(.bss);
        build/src/codeseg/AF8C0.o(.bss);
        build/src/codeseg/B17D0.o(.bss);
        build/src/codeseg/B2510.o(.bss);
        build/src/codeseg/wr64_pause_menu.o(.bss);
        build/src/codeseg/B3290.o(.bss);
        build/src/codeseg/B3AA0.o(.bss);
        build/src/codeseg/wr64_fade.o(.bss);
        build/src/codeseg/B66E0.o(.bss);
        build/src/codeseg/B97B0.o(.bss);
        build/src/codeseg/C94E0.o(.bss);
        . = ALIGN(., 16);
        codeseg_BSS_END = .;
        codeseg_BSS_SIZE = ABSOLUTE(codeseg_BSS_END - codeseg_BSS_START);
    }
    __romPos += SIZEOF(.codeseg);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    codeseg_ROM_END = __romPos;
    codeseg_VRAM_END = .;

    segment_F6090_ROM_START = __romPos;
    segment_F6090_VRAM = ADDR(.segment_F6090);
    .segment_F6090 : AT(segment_F6090_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        segment_F6090_DATA_START = .;
        build/bin/us/rev1/segment_F6090.o(.data);
        segment_F6090_DATA_END = .;
        segment_F6090_DATA_SIZE = ABSOLUTE(segment_F6090_DATA_END - segment_F6090_DATA_START);
    }
    __romPos += SIZEOF(.segment_F6090);
    segment_F6090_ROM_END = __romPos;
    segment_F6090_VRAM_END = .;

    assets_seg_ROM_START = __romPos;
    assets_seg_VRAM = ADDR(.assets_seg);
    .assets_seg : AT(assets_seg_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        assets_seg_DATA_START = .;
        build/bin/us/rev1/assets_seg.o(.data);
        assets_seg_DATA_END = .;
        assets_seg_DATA_SIZE = ABSOLUTE(assets_seg_DATA_END - assets_seg_DATA_START);
    }
    __romPos += SIZEOF(.assets_seg);
    assets_seg_ROM_END = __romPos;
    assets_seg_VRAM_END = .;

    MIO0_chunk_ROM_START = __romPos;
    MIO0_chunk_VRAM = ADDR(.MIO0_chunk);
    .MIO0_chunk : AT(MIO0_chunk_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        MIO0_chunk_DATA_START = .;
        build/bin/us/rev1/MIO0_chunk.o(.data);
        MIO0_chunk_DATA_END = .;
        MIO0_chunk_DATA_SIZE = ABSOLUTE(MIO0_chunk_DATA_END - MIO0_chunk_DATA_START);
    }
    __romPos += SIZEOF(.MIO0_chunk);
    MIO0_chunk_ROM_END = __romPos;
    MIO0_chunk_VRAM_END = .;

    segment_1B1FB0_ROM_START = __romPos;
    segment_1B1FB0_VRAM = ADDR(.segment_1B1FB0);
    .segment_1B1FB0 0x802C5800 : AT(segment_1B1FB0_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        segment_1B1FB0_TEXT_START = .;
        build/src/unused_code_1B1FB0.o(.text);
        . = ALIGN(., 16);
        segment_1B1FB0_TEXT_END = .;
        segment_1B1FB0_TEXT_SIZE = ABSOLUTE(segment_1B1FB0_TEXT_END - segment_1B1FB0_TEXT_START);
        segment_1B1FB0_DATA_START = .;
        build/asm/us/rev1/data/unused_code_1B1FB0.data.o(.data);
        . = ALIGN(., 16);
        segment_1B1FB0_DATA_END = .;
        segment_1B1FB0_DATA_SIZE = ABSOLUTE(segment_1B1FB0_DATA_END - segment_1B1FB0_DATA_START);
        segment_1B1FB0_RODATA_START = .;
        build/src/unused_code_1B1FB0.o(.rodata);
        . = ALIGN(., 16);
        segment_1B1FB0_RODATA_END = .;
        segment_1B1FB0_RODATA_SIZE = ABSOLUTE(segment_1B1FB0_RODATA_END - segment_1B1FB0_RODATA_START);
    }
    segment_1B1FB0_bss_VRAM = ADDR(.segment_1B1FB0_bss);
    .segment_1B1FB0_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        segment_1B1FB0_BSS_START = .;
        build/src/unused_code_1B1FB0.o(.bss);
        . = ALIGN(., 16);
        segment_1B1FB0_BSS_END = .;
        segment_1B1FB0_BSS_SIZE = ABSOLUTE(segment_1B1FB0_BSS_END - segment_1B1FB0_BSS_START);
    }
    __romPos += SIZEOF(.segment_1B1FB0);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    segment_1B1FB0_ROM_END = __romPos;
    segment_1B1FB0_VRAM_END = .;

    ovl_i0_ROM_START = __romPos;
    ovl_i0_VRAM = ADDR(.ovl_i0);
    .ovl_i0 0x802C5800 : AT(ovl_i0_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i0_TEXT_START = .;
        build/src/overlays/ovl_i0/ovl_1B3EC0.o(.text);
        . = ALIGN(., 16);
        ovl_i0_TEXT_END = .;
        ovl_i0_TEXT_SIZE = ABSOLUTE(ovl_i0_TEXT_END - ovl_i0_TEXT_START);
        ovl_i0_DATA_START = .;
        build/asm/us/rev1/data/overlays/ovl_i0/ovl_1B3EC0.data.o(.data);
        . = ALIGN(., 16);
        ovl_i0_DATA_END = .;
        ovl_i0_DATA_SIZE = ABSOLUTE(ovl_i0_DATA_END - ovl_i0_DATA_START);
        ovl_i0_RODATA_START = .;
        build/src/overlays/ovl_i0/ovl_1B3EC0.o(.rodata);
        . = ALIGN(., 16);
        ovl_i0_RODATA_END = .;
        ovl_i0_RODATA_SIZE = ABSOLUTE(ovl_i0_RODATA_END - ovl_i0_RODATA_START);
    }
    ovl_i0_bss_VRAM = ADDR(.ovl_i0_bss);
    .ovl_i0_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i0_BSS_START = .;
        build/src/overlays/ovl_i0/ovl_1B3EC0.o(.bss);
        . = ALIGN(., 16);
        ovl_i0_BSS_END = .;
        ovl_i0_BSS_SIZE = ABSOLUTE(ovl_i0_BSS_END - ovl_i0_BSS_START);
    }
    __romPos += SIZEOF(.ovl_i0);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    ovl_i0_ROM_END = __romPos;
    ovl_i0_VRAM_END = .;

    ovl_i1_ROM_START = __romPos;
    ovl_i1_VRAM = ADDR(.ovl_i1);
    .ovl_i1 0x802C5800 : AT(ovl_i1_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i1_TEXT_START = .;
        build/src/overlays/ovl_i1/ovl_1B55A0.o(.text);
        . = ALIGN(., 16);
        ovl_i1_TEXT_END = .;
        ovl_i1_TEXT_SIZE = ABSOLUTE(ovl_i1_TEXT_END - ovl_i1_TEXT_START);
        ovl_i1_DATA_START = .;
        build/asm/us/rev1/data/overlays/ovl_i1/ovl_1B55A0.data.o(.data);
        . = ALIGN(., 16);
        ovl_i1_DATA_END = .;
        ovl_i1_DATA_SIZE = ABSOLUTE(ovl_i1_DATA_END - ovl_i1_DATA_START);
        ovl_i1_RODATA_START = .;
        build/src/overlays/ovl_i1/ovl_1B55A0.o(.rodata);
        . = ALIGN(., 16);
        ovl_i1_RODATA_END = .;
        ovl_i1_RODATA_SIZE = ABSOLUTE(ovl_i1_RODATA_END - ovl_i1_RODATA_START);
    }
    ovl_i1_bss_VRAM = ADDR(.ovl_i1_bss);
    .ovl_i1_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i1_BSS_START = .;
        build/src/overlays/ovl_i1/ovl_1B55A0.o(.bss);
        . = ALIGN(., 16);
        ovl_i1_BSS_END = .;
        ovl_i1_BSS_SIZE = ABSOLUTE(ovl_i1_BSS_END - ovl_i1_BSS_START);
    }
    __romPos += SIZEOF(.ovl_i1);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    ovl_i1_ROM_END = __romPos;
    ovl_i1_VRAM_END = .;

    ovl_i2_ROM_START = __romPos;
    ovl_i2_VRAM = ADDR(.ovl_i2);
    .ovl_i2 0x802C5800 : AT(ovl_i2_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i2_TEXT_START = .;
        build/src/overlays/ovl_i2/ovl_1B9440.o(.text);
        . = ALIGN(., 16);
        ovl_i2_TEXT_END = .;
        ovl_i2_TEXT_SIZE = ABSOLUTE(ovl_i2_TEXT_END - ovl_i2_TEXT_START);
        ovl_i2_DATA_START = .;
        build/asm/us/rev1/data/overlays/ovl_i2/ovl_1B9440.data.o(.data);
        . = ALIGN(., 16);
        ovl_i2_DATA_END = .;
        ovl_i2_DATA_SIZE = ABSOLUTE(ovl_i2_DATA_END - ovl_i2_DATA_START);
        ovl_i2_RODATA_START = .;
        build/src/overlays/ovl_i2/ovl_1B9440.o(.rodata);
        . = ALIGN(., 16);
        ovl_i2_RODATA_END = .;
        ovl_i2_RODATA_SIZE = ABSOLUTE(ovl_i2_RODATA_END - ovl_i2_RODATA_START);
    }
    ovl_i2_bss_VRAM = ADDR(.ovl_i2_bss);
    .ovl_i2_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i2_BSS_START = .;
        build/src/overlays/ovl_i2/ovl_1B9440.o(.bss);
        . = ALIGN(., 16);
        ovl_i2_BSS_END = .;
        ovl_i2_BSS_SIZE = ABSOLUTE(ovl_i2_BSS_END - ovl_i2_BSS_START);
    }
    __romPos += SIZEOF(.ovl_i2);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    ovl_i2_ROM_END = __romPos;
    ovl_i2_VRAM_END = .;

    ovl_i3_ROM_START = __romPos;
    ovl_i3_VRAM = ADDR(.ovl_i3);
    .ovl_i3 0x802C5800 : AT(ovl_i3_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i3_TEXT_START = .;
        build/src/overlays/ovl_i3/ovl_1BC890.o(.text);
        . = ALIGN(., 16);
        ovl_i3_TEXT_END = .;
        ovl_i3_TEXT_SIZE = ABSOLUTE(ovl_i3_TEXT_END - ovl_i3_TEXT_START);
        ovl_i3_DATA_START = .;
        build/asm/us/rev1/data/overlays/ovl_i3/ovl_1BC890.data.o(.data);
        . = ALIGN(., 16);
        ovl_i3_DATA_END = .;
        ovl_i3_DATA_SIZE = ABSOLUTE(ovl_i3_DATA_END - ovl_i3_DATA_START);
        ovl_i3_RODATA_START = .;
        build/src/overlays/ovl_i3/ovl_1BC890.o(.rodata);
        . = ALIGN(., 16);
        ovl_i3_RODATA_END = .;
        ovl_i3_RODATA_SIZE = ABSOLUTE(ovl_i3_RODATA_END - ovl_i3_RODATA_START);
    }
    ovl_i3_bss_VRAM = ADDR(.ovl_i3_bss);
    .ovl_i3_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i3_BSS_START = .;
        build/src/overlays/ovl_i3/ovl_1BC890.o(.bss);
        . = ALIGN(., 16);
        ovl_i3_BSS_END = .;
        ovl_i3_BSS_SIZE = ABSOLUTE(ovl_i3_BSS_END - ovl_i3_BSS_START);
    }
    __romPos += SIZEOF(.ovl_i3);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    ovl_i3_ROM_END = __romPos;
    ovl_i3_VRAM_END = .;

    ovl_i4_ROM_START = __romPos;
    ovl_i4_VRAM = ADDR(.ovl_i4);
    .ovl_i4 0x802C5800 : AT(ovl_i4_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i4_TEXT_START = .;
        build/src/overlays/ovl_i4/ovl_1BE0B0.o(.text);
        . = ALIGN(., 16);
        ovl_i4_TEXT_END = .;
        ovl_i4_TEXT_SIZE = ABSOLUTE(ovl_i4_TEXT_END - ovl_i4_TEXT_START);
        ovl_i4_DATA_START = .;
        build/asm/us/rev1/data/overlays/ovl_i4/ovl_1BE0B0.data.o(.data);
        . = ALIGN(., 16);
        ovl_i4_DATA_END = .;
        ovl_i4_DATA_SIZE = ABSOLUTE(ovl_i4_DATA_END - ovl_i4_DATA_START);
        ovl_i4_RODATA_START = .;
        build/src/overlays/ovl_i4/ovl_1BE0B0.o(.rodata);
        . = ALIGN(., 16);
        ovl_i4_RODATA_END = .;
        ovl_i4_RODATA_SIZE = ABSOLUTE(ovl_i4_RODATA_END - ovl_i4_RODATA_START);
    }
    ovl_i4_bss_VRAM = ADDR(.ovl_i4_bss);
    .ovl_i4_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i4_BSS_START = .;
        build/src/overlays/ovl_i4/ovl_1BE0B0.o(.bss);
        . = ALIGN(., 16);
        ovl_i4_BSS_END = .;
        ovl_i4_BSS_SIZE = ABSOLUTE(ovl_i4_BSS_END - ovl_i4_BSS_START);
    }
    __romPos += SIZEOF(.ovl_i4);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    ovl_i4_ROM_END = __romPos;
    ovl_i4_VRAM_END = .;

    ovl_i5_ROM_START = __romPos;
    ovl_i5_VRAM = ADDR(.ovl_i5);
    .ovl_i5 0x802C5800 : AT(ovl_i5_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i5_TEXT_START = .;
        build/src/overlays/ovl_i5/ovl_1BFF50.o(.text);
        build/src/overlays/ovl_i5/ovl_1C17E0.o(.text);
        . = ALIGN(., 16);
        ovl_i5_TEXT_END = .;
        ovl_i5_TEXT_SIZE = ABSOLUTE(ovl_i5_TEXT_END - ovl_i5_TEXT_START);
        ovl_i5_DATA_START = .;
        build/asm/us/rev1/data/overlays/ovl_i5/ovl_1BFF50.data.o(.data);
        build/src/overlays/ovl_i5/ovl_1C17E0.o(.data);
        . = ALIGN(., 16);
        ovl_i5_DATA_END = .;
        ovl_i5_DATA_SIZE = ABSOLUTE(ovl_i5_DATA_END - ovl_i5_DATA_START);
        ovl_i5_RODATA_START = .;
        build/src/overlays/ovl_i5/ovl_1BFF50.o(.rodata);
        build/src/overlays/ovl_i5/ovl_1C17E0.o(.rodata);
        . = ALIGN(., 16);
        ovl_i5_RODATA_END = .;
        ovl_i5_RODATA_SIZE = ABSOLUTE(ovl_i5_RODATA_END - ovl_i5_RODATA_START);
    }
    ovl_i5_bss_VRAM = ADDR(.ovl_i5_bss);
    .ovl_i5_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i5_BSS_START = .;
        build/src/overlays/ovl_i5/ovl_1BFF50.o(.bss);
        build/src/overlays/ovl_i5/ovl_1C17E0.o(.bss);
        . = ALIGN(., 16);
        ovl_i5_BSS_END = .;
        ovl_i5_BSS_SIZE = ABSOLUTE(ovl_i5_BSS_END - ovl_i5_BSS_START);
    }
    __romPos += SIZEOF(.ovl_i5);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    ovl_i5_ROM_END = __romPos;
    ovl_i5_VRAM_END = .;

    ovl_i6_ROM_START = __romPos;
    ovl_i6_VRAM = ADDR(.ovl_i6);
    .ovl_i6 0x802C5800 : AT(ovl_i6_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i6_TEXT_START = .;
        build/src/overlays/ovl_i6/ovl_1C2250.o(.text);
        . = ALIGN(., 16);
        ovl_i6_TEXT_END = .;
        ovl_i6_TEXT_SIZE = ABSOLUTE(ovl_i6_TEXT_END - ovl_i6_TEXT_START);
        ovl_i6_DATA_START = .;
        build/asm/us/rev1/data/overlays/ovl_i6/ovl_1C2250.data.o(.data);
        . = ALIGN(., 16);
        ovl_i6_DATA_END = .;
        ovl_i6_DATA_SIZE = ABSOLUTE(ovl_i6_DATA_END - ovl_i6_DATA_START);
        ovl_i6_RODATA_START = .;
        build/src/overlays/ovl_i6/ovl_1C2250.o(.rodata);
        . = ALIGN(., 16);
        ovl_i6_RODATA_END = .;
        ovl_i6_RODATA_SIZE = ABSOLUTE(ovl_i6_RODATA_END - ovl_i6_RODATA_START);
    }
    ovl_i6_bss_VRAM = ADDR(.ovl_i6_bss);
    .ovl_i6_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i6_BSS_START = .;
        build/src/overlays/ovl_i6/ovl_1C2250.o(.bss);
        . = ALIGN(., 16);
        ovl_i6_BSS_END = .;
        ovl_i6_BSS_SIZE = ABSOLUTE(ovl_i6_BSS_END - ovl_i6_BSS_START);
    }
    __romPos += SIZEOF(.ovl_i6);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    ovl_i6_ROM_END = __romPos;
    ovl_i6_VRAM_END = .;

    seg_1C3780_ROM_START = __romPos;
    seg_1C3780_VRAM = ADDR(.seg_1C3780);
    .seg_1C3780 0x802C5800 : AT(seg_1C3780_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        seg_1C3780_TEXT_START = .;
        build/src/seg_1C3780.o(.text);
        . = ALIGN(., 16);
        seg_1C3780_TEXT_END = .;
        seg_1C3780_TEXT_SIZE = ABSOLUTE(seg_1C3780_TEXT_END - seg_1C3780_TEXT_START);
        seg_1C3780_DATA_START = .;
        build/asm/us/rev1/data/seg_1C3780.data.o(.data);
        . = ALIGN(., 16);
        seg_1C3780_DATA_END = .;
        seg_1C3780_DATA_SIZE = ABSOLUTE(seg_1C3780_DATA_END - seg_1C3780_DATA_START);
        seg_1C3780_RODATA_START = .;
        build/src/seg_1C3780.o(.rodata);
        . = ALIGN(., 16);
        seg_1C3780_RODATA_END = .;
        seg_1C3780_RODATA_SIZE = ABSOLUTE(seg_1C3780_RODATA_END - seg_1C3780_RODATA_START);
    }
    seg_1C3780_bss_VRAM = ADDR(.seg_1C3780_bss);
    .seg_1C3780_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        seg_1C3780_BSS_START = .;
        build/src/seg_1C3780.o(.bss);
        . = ALIGN(., 16);
        seg_1C3780_BSS_END = .;
        seg_1C3780_BSS_SIZE = ABSOLUTE(seg_1C3780_BSS_END - seg_1C3780_BSS_START);
    }
    __romPos += SIZEOF(.seg_1C3780);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    seg_1C3780_ROM_END = __romPos;
    seg_1C3780_VRAM_END = .;

    seg_1C3D00_ROM_START = __romPos;
    seg_1C3D00_VRAM = ADDR(.seg_1C3D00);
    .seg_1C3D00 0x802C5800 : AT(seg_1C3D00_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        seg_1C3D00_TEXT_START = .;
        build/src/seg_1C3D00.o(.text);
        . = ALIGN(., 16);
        seg_1C3D00_TEXT_END = .;
        seg_1C3D00_TEXT_SIZE = ABSOLUTE(seg_1C3D00_TEXT_END - seg_1C3D00_TEXT_START);
        seg_1C3D00_DATA_START = .;
        build/asm/us/rev1/data/seg_1C3D00.data.o(.data);
        . = ALIGN(., 16);
        seg_1C3D00_DATA_END = .;
        seg_1C3D00_DATA_SIZE = ABSOLUTE(seg_1C3D00_DATA_END - seg_1C3D00_DATA_START);
        seg_1C3D00_RODATA_START = .;
        build/src/seg_1C3D00.o(.rodata);
        . = ALIGN(., 16);
        seg_1C3D00_RODATA_END = .;
        seg_1C3D00_RODATA_SIZE = ABSOLUTE(seg_1C3D00_RODATA_END - seg_1C3D00_RODATA_START);
    }
    seg_1C3D00_bss_VRAM = ADDR(.seg_1C3D00_bss);
    .seg_1C3D00_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        seg_1C3D00_BSS_START = .;
        build/src/seg_1C3D00.o(.bss);
        . = ALIGN(., 16);
        seg_1C3D00_BSS_END = .;
        seg_1C3D00_BSS_SIZE = ABSOLUTE(seg_1C3D00_BSS_END - seg_1C3D00_BSS_START);
    }
    __romPos += SIZEOF(.seg_1C3D00);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    seg_1C3D00_ROM_END = __romPos;
    seg_1C3D00_VRAM_END = .;

    ovl_i7_ROM_START = __romPos;
    ovl_i7_VRAM = ADDR(.ovl_i7);
    .ovl_i7 0x802C5800 : AT(ovl_i7_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i7_TEXT_START = .;
        build/src/overlays/ovl_i7/ovl_1C43F0.o(.text);
        . = ALIGN(., 16);
        ovl_i7_TEXT_END = .;
        ovl_i7_TEXT_SIZE = ABSOLUTE(ovl_i7_TEXT_END - ovl_i7_TEXT_START);
        ovl_i7_DATA_START = .;
        build/asm/us/rev1/data/overlays/ovl_i7/ovl_1C43F0.data.o(.data);
        . = ALIGN(., 16);
        ovl_i7_DATA_END = .;
        ovl_i7_DATA_SIZE = ABSOLUTE(ovl_i7_DATA_END - ovl_i7_DATA_START);
        ovl_i7_RODATA_START = .;
        build/src/overlays/ovl_i7/ovl_1C43F0.o(.rodata);
        . = ALIGN(., 16);
        ovl_i7_RODATA_END = .;
        ovl_i7_RODATA_SIZE = ABSOLUTE(ovl_i7_RODATA_END - ovl_i7_RODATA_START);
    }
    ovl_i7_bss_VRAM = ADDR(.ovl_i7_bss);
    .ovl_i7_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i7_BSS_START = .;
        build/src/overlays/ovl_i7/ovl_1C43F0.o(.bss);
        . = ALIGN(., 16);
        ovl_i7_BSS_END = .;
        ovl_i7_BSS_SIZE = ABSOLUTE(ovl_i7_BSS_END - ovl_i7_BSS_START);
    }
    __romPos += SIZEOF(.ovl_i7);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    ovl_i7_ROM_END = __romPos;
    ovl_i7_VRAM_END = .;

    ovl_i8_ROM_START = __romPos;
    ovl_i8_VRAM = ADDR(.ovl_i8);
    .ovl_i8 0x802C5800 : AT(ovl_i8_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i8_TEXT_START = .;
        build/src/overlays/ovl_i8/ovl_1C49A0.o(.text);
        . = ALIGN(., 16);
        ovl_i8_TEXT_END = .;
        ovl_i8_TEXT_SIZE = ABSOLUTE(ovl_i8_TEXT_END - ovl_i8_TEXT_START);
        ovl_i8_DATA_START = .;
        build/asm/us/rev1/data/overlays/ovl_i8/ovl_1C49A0.data.o(.data);
        . = ALIGN(., 16);
        ovl_i8_DATA_END = .;
        ovl_i8_DATA_SIZE = ABSOLUTE(ovl_i8_DATA_END - ovl_i8_DATA_START);
        ovl_i8_RODATA_START = .;
        build/src/overlays/ovl_i8/ovl_1C49A0.o(.rodata);
        . = ALIGN(., 16);
        ovl_i8_RODATA_END = .;
        ovl_i8_RODATA_SIZE = ABSOLUTE(ovl_i8_RODATA_END - ovl_i8_RODATA_START);
    }
    ovl_i8_bss_VRAM = ADDR(.ovl_i8_bss);
    .ovl_i8_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i8_BSS_START = .;
        build/src/overlays/ovl_i8/ovl_1C49A0.o(.bss);
        . = ALIGN(., 16);
        ovl_i8_BSS_END = .;
        ovl_i8_BSS_SIZE = ABSOLUTE(ovl_i8_BSS_END - ovl_i8_BSS_START);
    }
    __romPos += SIZEOF(.ovl_i8);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    ovl_i8_ROM_END = __romPos;
    ovl_i8_VRAM_END = .;

    ovl_i9_ROM_START = __romPos;
    ovl_i9_VRAM = ADDR(.ovl_i9);
    .ovl_i9 0x802C5800 : AT(ovl_i9_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i9_TEXT_START = .;
        build/src/overlays/ovl_i9/ovl_1C66D0.o(.text);
        . = ALIGN(., 16);
        ovl_i9_TEXT_END = .;
        ovl_i9_TEXT_SIZE = ABSOLUTE(ovl_i9_TEXT_END - ovl_i9_TEXT_START);
        ovl_i9_DATA_START = .;
        build/asm/us/rev1/data/overlays/ovl_i9/ovl_1C66D0.data.o(.data);
        . = ALIGN(., 16);
        ovl_i9_DATA_END = .;
        ovl_i9_DATA_SIZE = ABSOLUTE(ovl_i9_DATA_END - ovl_i9_DATA_START);
        ovl_i9_RODATA_START = .;
        build/src/overlays/ovl_i9/ovl_1C66D0.o(.rodata);
        . = ALIGN(., 16);
        ovl_i9_RODATA_END = .;
        ovl_i9_RODATA_SIZE = ABSOLUTE(ovl_i9_RODATA_END - ovl_i9_RODATA_START);
    }
    ovl_i9_bss_VRAM = ADDR(.ovl_i9_bss);
    .ovl_i9_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i9_BSS_START = .;
        build/src/overlays/ovl_i9/ovl_1C66D0.o(.bss);
        . = ALIGN(., 16);
        ovl_i9_BSS_END = .;
        ovl_i9_BSS_SIZE = ABSOLUTE(ovl_i9_BSS_END - ovl_i9_BSS_START);
    }
    __romPos += SIZEOF(.ovl_i9);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    ovl_i9_ROM_END = __romPos;
    ovl_i9_VRAM_END = .;

    ovl_i10_ROM_START = __romPos;
    ovl_i10_VRAM = ADDR(.ovl_i10);
    .ovl_i10 0x802C5800 : AT(ovl_i10_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i10_TEXT_START = .;
        build/src/overlays/ovl_i10/ovl_1C9150.o(.text);
        . = ALIGN(., 16);
        ovl_i10_TEXT_END = .;
        ovl_i10_TEXT_SIZE = ABSOLUTE(ovl_i10_TEXT_END - ovl_i10_TEXT_START);
        ovl_i10_DATA_START = .;
        build/asm/us/rev1/data/overlays/ovl_i10/ovl_1C9150.data.o(.data);
        . = ALIGN(., 16);
        ovl_i10_DATA_END = .;
        ovl_i10_DATA_SIZE = ABSOLUTE(ovl_i10_DATA_END - ovl_i10_DATA_START);
        ovl_i10_RODATA_START = .;
        build/src/overlays/ovl_i10/ovl_1C9150.o(.rodata);
        . = ALIGN(., 16);
        ovl_i10_RODATA_END = .;
        ovl_i10_RODATA_SIZE = ABSOLUTE(ovl_i10_RODATA_END - ovl_i10_RODATA_START);
    }
    ovl_i10_bss_VRAM = ADDR(.ovl_i10_bss);
    .ovl_i10_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i10_BSS_START = .;
        build/src/overlays/ovl_i10/ovl_1C9150.o(.bss);
        . = ALIGN(., 16);
        ovl_i10_BSS_END = .;
        ovl_i10_BSS_SIZE = ABSOLUTE(ovl_i10_BSS_END - ovl_i10_BSS_START);
    }
    __romPos += SIZEOF(.ovl_i10);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    ovl_i10_ROM_END = __romPos;
    ovl_i10_VRAM_END = .;

    ovl_i11_ROM_START = __romPos;
    ovl_i11_VRAM = ADDR(.ovl_i11);
    .ovl_i11 0x802C5800 : AT(ovl_i11_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i11_TEXT_START = .;
        build/src/overlays/ovl_i11/ovl_1CA480.o(.text);
        . = ALIGN(., 16);
        ovl_i11_TEXT_END = .;
        ovl_i11_TEXT_SIZE = ABSOLUTE(ovl_i11_TEXT_END - ovl_i11_TEXT_START);
        ovl_i11_DATA_START = .;
        build/asm/us/rev1/data/overlays/ovl_i11/ovl_1CA480.data.o(.data);
        . = ALIGN(., 16);
        ovl_i11_DATA_END = .;
        ovl_i11_DATA_SIZE = ABSOLUTE(ovl_i11_DATA_END - ovl_i11_DATA_START);
        ovl_i11_RODATA_START = .;
        build/src/overlays/ovl_i11/ovl_1CA480.o(.rodata);
        . = ALIGN(., 16);
        ovl_i11_RODATA_END = .;
        ovl_i11_RODATA_SIZE = ABSOLUTE(ovl_i11_RODATA_END - ovl_i11_RODATA_START);
    }
    ovl_i11_bss_VRAM = ADDR(.ovl_i11_bss);
    .ovl_i11_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i11_BSS_START = .;
        build/src/overlays/ovl_i11/ovl_1CA480.o(.bss);
        . = ALIGN(., 16);
        ovl_i11_BSS_END = .;
        ovl_i11_BSS_SIZE = ABSOLUTE(ovl_i11_BSS_END - ovl_i11_BSS_START);
    }
    __romPos += SIZEOF(.ovl_i11);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    ovl_i11_ROM_END = __romPos;
    ovl_i11_VRAM_END = .;

    ovl_i12_ROM_START = __romPos;
    ovl_i12_VRAM = ADDR(.ovl_i12);
    .ovl_i12 0x802C5800 : AT(ovl_i12_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i12_TEXT_START = .;
        build/src/overlays/ovl_i12/ovl_1CAE40.o(.text);
        . = ALIGN(., 16);
        ovl_i12_TEXT_END = .;
        ovl_i12_TEXT_SIZE = ABSOLUTE(ovl_i12_TEXT_END - ovl_i12_TEXT_START);
        ovl_i12_DATA_START = .;
        build/asm/us/rev1/data/overlays/ovl_i12/ovl_1CAE40.data.o(.data);
        . = ALIGN(., 16);
        ovl_i12_DATA_END = .;
        ovl_i12_DATA_SIZE = ABSOLUTE(ovl_i12_DATA_END - ovl_i12_DATA_START);
        ovl_i12_RODATA_START = .;
        build/src/overlays/ovl_i12/ovl_1CAE40.o(.rodata);
        . = ALIGN(., 16);
        ovl_i12_RODATA_END = .;
        ovl_i12_RODATA_SIZE = ABSOLUTE(ovl_i12_RODATA_END - ovl_i12_RODATA_START);
    }
    ovl_i12_bss_VRAM = ADDR(.ovl_i12_bss);
    .ovl_i12_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i12_BSS_START = .;
        build/src/overlays/ovl_i12/ovl_1CAE40.o(.bss);
        . = ALIGN(., 16);
        ovl_i12_BSS_END = .;
        ovl_i12_BSS_SIZE = ABSOLUTE(ovl_i12_BSS_END - ovl_i12_BSS_START);
    }
    __romPos += SIZEOF(.ovl_i12);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    ovl_i12_ROM_END = __romPos;
    ovl_i12_VRAM_END = .;

    ovl_i13_ROM_START = __romPos;
    ovl_i13_VRAM = ADDR(.ovl_i13);
    .ovl_i13 0x802C5800 : AT(ovl_i13_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i13_TEXT_START = .;
        build/src/overlays/ovl_i13/ovl_1CBAF0.o(.text);
        . = ALIGN(., 16);
        ovl_i13_TEXT_END = .;
        ovl_i13_TEXT_SIZE = ABSOLUTE(ovl_i13_TEXT_END - ovl_i13_TEXT_START);
        ovl_i13_DATA_START = .;
        build/asm/us/rev1/data/overlays/ovl_i13/ovl_1CBAF0.data.o(.data);
        . = ALIGN(., 16);
        ovl_i13_DATA_END = .;
        ovl_i13_DATA_SIZE = ABSOLUTE(ovl_i13_DATA_END - ovl_i13_DATA_START);
        ovl_i13_RODATA_START = .;
        build/src/overlays/ovl_i13/ovl_1CBAF0.o(.rodata);
        . = ALIGN(., 16);
        ovl_i13_RODATA_END = .;
        ovl_i13_RODATA_SIZE = ABSOLUTE(ovl_i13_RODATA_END - ovl_i13_RODATA_START);
    }
    ovl_i13_bss_VRAM = ADDR(.ovl_i13_bss);
    .ovl_i13_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i13_BSS_START = .;
        build/src/overlays/ovl_i13/ovl_1CBAF0.o(.bss);
        . = ALIGN(., 16);
        ovl_i13_BSS_END = .;
        ovl_i13_BSS_SIZE = ABSOLUTE(ovl_i13_BSS_END - ovl_i13_BSS_START);
    }
    __romPos += SIZEOF(.ovl_i13);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    ovl_i13_ROM_END = __romPos;
    ovl_i13_VRAM_END = .;

    ovl_i14_ROM_START = __romPos;
    ovl_i14_VRAM = ADDR(.ovl_i14);
    .ovl_i14 0x802C5800 : AT(ovl_i14_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i14_TEXT_START = .;
        build/src/overlays/ovl_i14/ovl_1CF180.o(.text);
        . = ALIGN(., 16);
        ovl_i14_TEXT_END = .;
        ovl_i14_TEXT_SIZE = ABSOLUTE(ovl_i14_TEXT_END - ovl_i14_TEXT_START);
        ovl_i14_DATA_START = .;
        build/asm/us/rev1/data/overlays/ovl_i14/ovl_1CF180.data.o(.data);
        . = ALIGN(., 16);
        ovl_i14_DATA_END = .;
        ovl_i14_DATA_SIZE = ABSOLUTE(ovl_i14_DATA_END - ovl_i14_DATA_START);
        ovl_i14_RODATA_START = .;
        build/src/overlays/ovl_i14/ovl_1CF180.o(.rodata);
        . = ALIGN(., 16);
        ovl_i14_RODATA_END = .;
        ovl_i14_RODATA_SIZE = ABSOLUTE(ovl_i14_RODATA_END - ovl_i14_RODATA_START);
    }
    ovl_i14_bss_VRAM = ADDR(.ovl_i14_bss);
    .ovl_i14_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i14_BSS_START = .;
        build/src/overlays/ovl_i14/ovl_1CF180.o(.bss);
        . = ALIGN(., 16);
        ovl_i14_BSS_END = .;
        ovl_i14_BSS_SIZE = ABSOLUTE(ovl_i14_BSS_END - ovl_i14_BSS_START);
    }
    __romPos += SIZEOF(.ovl_i14);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    ovl_i14_ROM_END = __romPos;
    ovl_i14_VRAM_END = .;

    ovl_i15_ROM_START = __romPos;
    ovl_i15_VRAM = ADDR(.ovl_i15);
    .ovl_i15 0x802C5800 : AT(ovl_i15_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i15_TEXT_START = .;
        build/src/overlays/ovl_i15/ovl_1CFB60.o(.text);
        . = ALIGN(., 16);
        ovl_i15_TEXT_END = .;
        ovl_i15_TEXT_SIZE = ABSOLUTE(ovl_i15_TEXT_END - ovl_i15_TEXT_START);
        ovl_i15_DATA_START = .;
        build/asm/us/rev1/data/overlays/ovl_i15/ovl_1CFB60.data.o(.data);
        . = ALIGN(., 16);
        ovl_i15_DATA_END = .;
        ovl_i15_DATA_SIZE = ABSOLUTE(ovl_i15_DATA_END - ovl_i15_DATA_START);
        ovl_i15_RODATA_START = .;
        build/src/overlays/ovl_i15/ovl_1CFB60.o(.rodata);
        . = ALIGN(., 16);
        ovl_i15_RODATA_END = .;
        ovl_i15_RODATA_SIZE = ABSOLUTE(ovl_i15_RODATA_END - ovl_i15_RODATA_START);
    }
    ovl_i15_bss_VRAM = ADDR(.ovl_i15_bss);
    .ovl_i15_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        ovl_i15_BSS_START = .;
        build/src/overlays/ovl_i15/ovl_1CFB60.o(.bss);
        . = ALIGN(., 16);
        ovl_i15_BSS_END = .;
        ovl_i15_BSS_SIZE = ABSOLUTE(ovl_i15_BSS_END - ovl_i15_BSS_START);
    }
    __romPos += SIZEOF(.ovl_i15);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    ovl_i15_ROM_END = __romPos;
    ovl_i15_VRAM_END = .;

    LAST_MIO0_SEG_ROM_START = __romPos;
    LAST_MIO0_SEG_VRAM = ADDR(.LAST_MIO0_SEG);
    .LAST_MIO0_SEG 0x802A0000 : AT(LAST_MIO0_SEG_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        LAST_MIO0_SEG_DATA_START = .;
        build/bin/us/rev1/mio0_0.o(.data);
        build/bin/us/rev1/mio0_1.o(.data);
        build/bin/us/rev1/mio0_2.o(.data);
        build/bin/us/rev1/mio0_3.o(.data);
        build/bin/us/rev1/mio0_4.o(.data);
        build/bin/us/rev1/mio0_5.o(.data);
        build/bin/us/rev1/mio0_6.o(.data);
        build/bin/us/rev1/mio0_7.o(.data);
        build/bin/us/rev1/mio0_8.o(.data);
        build/bin/us/rev1/mio0_9.o(.data);
        build/bin/us/rev1/mio0_10.o(.data);
        build/bin/us/rev1/mio0_11.o(.data);
        build/bin/us/rev1/mio0_12.o(.data);
        build/bin/us/rev1/mio0_13.o(.data);
        build/bin/us/rev1/mio0_14.o(.data);
        build/bin/us/rev1/mio0_15.o(.data);
        build/bin/us/rev1/mio0_16.o(.data);
        build/bin/us/rev1/mio0_17.o(.data);
        build/bin/us/rev1/mio0_18.o(.data);
        build/bin/us/rev1/mio0_19.o(.data);
        build/bin/us/rev1/mio0_20.o(.data);
        build/bin/us/rev1/mio0_21.o(.data);
        build/bin/us/rev1/mio0_22.o(.data);
        build/bin/us/rev1/mio0_23.o(.data);
        build/bin/us/rev1/mio0_24.o(.data);
        build/bin/us/rev1/mio0_25.o(.data);
        build/bin/us/rev1/mio0_26.o(.data);
        build/bin/us/rev1/mio0_27.o(.data);
        build/bin/us/rev1/mio0_28.o(.data);
        build/bin/us/rev1/mio0_29.o(.data);
        build/bin/us/rev1/mio0_30.o(.data);
        build/bin/us/rev1/mio0_31.o(.data);
        build/bin/us/rev1/mio0_32.o(.data);
        build/bin/us/rev1/mio0_33.o(.data);
        build/bin/us/rev1/mio0_34.o(.data);
        build/bin/us/rev1/mio0_35.o(.data);
        build/bin/us/rev1/mio0_36.o(.data);
        build/bin/us/rev1/mio0_37.o(.data);
        build/bin/us/rev1/mio0_38.o(.data);
        build/bin/us/rev1/mio0_39.o(.data);
        build/bin/us/rev1/mio0_40.o(.data);
        build/bin/us/rev1/mio0_41.o(.data);
        build/bin/us/rev1/mio0_42.o(.data);
        build/bin/us/rev1/mio0_43.o(.data);
        build/bin/us/rev1/mio0_44.o(.data);
        build/bin/us/rev1/mio0_45.o(.data);
        build/bin/us/rev1/mio0_46.o(.data);
        build/bin/us/rev1/mio0_47.o(.data);
        build/bin/us/rev1/mio0_48.o(.data);
        build/bin/us/rev1/mio0_49.o(.data);
        build/bin/us/rev1/mio0_50.o(.data);
        build/bin/us/rev1/mio0_51.o(.data);
        build/bin/us/rev1/mio0_52.o(.data);
        build/bin/us/rev1/mio0_53.o(.data);
        build/bin/us/rev1/mio0_54.o(.data);
        build/bin/us/rev1/mio0_55.o(.data);
        build/bin/us/rev1/mio0_56.o(.data);
        build/bin/us/rev1/mio0_57.o(.data);
        build/bin/us/rev1/mio0_58.o(.data);
        build/bin/us/rev1/mio0_59.o(.data);
        build/bin/us/rev1/mio0_60.o(.data);
        build/bin/us/rev1/mio0_61.o(.data);
        build/bin/us/rev1/mio0_62.o(.data);
        build/bin/us/rev1/mio0_63.o(.data);
        build/bin/us/rev1/mio0_64.o(.data);
        build/bin/us/rev1/mio0_65.o(.data);
        build/bin/us/rev1/mio0_66.o(.data);
        build/bin/us/rev1/mio0_67.o(.data);
        build/bin/us/rev1/mio0_68.o(.data);
        build/bin/us/rev1/mio0_69.o(.data);
        build/bin/us/rev1/mio0_70.o(.data);
        build/bin/us/rev1/mio0_71.o(.data);
        build/bin/us/rev1/mio0_72.o(.data);
        build/bin/us/rev1/mio0_73.o(.data);
        build/bin/us/rev1/mio0_74.o(.data);
        build/bin/us/rev1/mio0_75.o(.data);
        build/bin/us/rev1/mio0_76.o(.data);
        build/bin/us/rev1/mio0_77.o(.data);
        build/bin/us/rev1/mio0_78.o(.data);
        build/bin/us/rev1/mio0_79.o(.data);
        build/bin/us/rev1/mio0_80.o(.data);
        build/bin/us/rev1/mio0_81.o(.data);
        build/bin/us/rev1/mio0_82.o(.data);
        build/bin/us/rev1/mio0_83.o(.data);
        build/bin/us/rev1/mio0_84.o(.data);
        build/bin/us/rev1/mio0_85.o(.data);
        build/bin/us/rev1/mio0_86.o(.data);
        build/bin/us/rev1/mio0_87.o(.data);
        build/bin/us/rev1/mio0_88.o(.data);
        build/bin/us/rev1/mio0_89.o(.data);
        build/bin/us/rev1/mio0_90.o(.data);
        build/bin/us/rev1/mio0_91.o(.data);
        build/bin/us/rev1/mio0_92.o(.data);
        build/bin/us/rev1/mio0_93.o(.data);
        build/bin/us/rev1/mio0_94.o(.data);
        build/bin/us/rev1/mio0_95.o(.data);
        build/bin/us/rev1/mio0_96.o(.data);
        build/bin/us/rev1/mio0_97.o(.data);
        build/bin/us/rev1/mio0_98.o(.data);
        build/bin/us/rev1/mio0_99.o(.data);
        build/bin/us/rev1/mio0_100.o(.data);
        build/bin/us/rev1/mio0_101.o(.data);
        build/bin/us/rev1/mio0_102.o(.data);
        build/bin/us/rev1/mio0_103.o(.data);
        build/bin/us/rev1/mio0_104.o(.data);
        build/bin/us/rev1/mio0_105.o(.data);
        build/bin/us/rev1/mio0_106.o(.data);
        build/bin/us/rev1/mio0_107.o(.data);
        build/bin/us/rev1/mio0_108.o(.data);
        build/bin/us/rev1/mio0_109.o(.data);
        build/bin/us/rev1/mio0_110.o(.data);
        build/bin/us/rev1/mio0_111.o(.data);
        build/bin/us/rev1/mio0_112.o(.data);
        build/bin/us/rev1/mio0_113.o(.data);
        build/bin/us/rev1/mio0_114.o(.data);
        build/bin/us/rev1/mio0_115.o(.data);
        build/bin/us/rev1/mio0_116.o(.data);
        build/bin/us/rev1/mio0_117.o(.data);
        build/bin/us/rev1/mio0_118.o(.data);
        build/bin/us/rev1/mio0_119.o(.data);
        build/bin/us/rev1/mio0_120.o(.data);
        build/bin/us/rev1/mio0_121.o(.data);
        build/bin/us/rev1/mio0_122.o(.data);
        build/bin/us/rev1/mio0_123.o(.data);
        build/bin/us/rev1/mio0_124.o(.data);
        build/bin/us/rev1/mio0_125.o(.data);
        build/bin/us/rev1/mio0_126.o(.data);
        build/bin/us/rev1/mio0_127.o(.data);
        build/bin/us/rev1/mio0_128.o(.data);
        . = ALIGN(., 16);
        LAST_MIO0_SEG_DATA_END = .;
        LAST_MIO0_SEG_DATA_SIZE = ABSOLUTE(LAST_MIO0_SEG_DATA_END - LAST_MIO0_SEG_DATA_START);
    }
    __romPos += SIZEOF(.LAST_MIO0_SEG);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    LAST_MIO0_SEG_ROM_END = __romPos;
    LAST_MIO0_SEG_VRAM_END = .;

    SoundDataADSR_ROM_START = __romPos;
    SoundDataADSR_VRAM = ADDR(.SoundDataADSR);
    .SoundDataADSR : AT(SoundDataADSR_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        SoundDataADSR_DATA_START = .;
        build/bin/us/rev1/SoundDataADSR.o(.data);
        SoundDataADSR_DATA_END = .;
        SoundDataADSR_DATA_SIZE = ABSOLUTE(SoundDataADSR_DATA_END - SoundDataADSR_DATA_START);
    }
    __romPos += SIZEOF(.SoundDataADSR);
    SoundDataADSR_ROM_END = __romPos;
    SoundDataADSR_VRAM_END = .;

    SoundDataRaw_ROM_START = __romPos;
    SoundDataRaw_VRAM = ADDR(.SoundDataRaw);
    .SoundDataRaw : AT(SoundDataRaw_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        SoundDataRaw_DATA_START = .;
        build/bin/us/rev1/SoundDataRaw.o(.data);
        SoundDataRaw_DATA_END = .;
        SoundDataRaw_DATA_SIZE = ABSOLUTE(SoundDataRaw_DATA_END - SoundDataRaw_DATA_START);
    }
    __romPos += SIZEOF(.SoundDataRaw);
    SoundDataRaw_ROM_END = __romPos;
    SoundDataRaw_VRAM_END = .;

    MusicData_ROM_START = __romPos;
    MusicData_VRAM = ADDR(.MusicData);
    .MusicData : AT(MusicData_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        MusicData_DATA_START = .;
        build/bin/us/rev1/MusicData.o(.data);
        MusicData_DATA_END = .;
        MusicData_DATA_SIZE = ABSOLUTE(MusicData_DATA_END - MusicData_DATA_START);
    }
    __romPos += SIZEOF(.MusicData);
    MusicData_ROM_END = __romPos;
    MusicData_VRAM_END = .;

    BankSetsData_ROM_START = __romPos;
    BankSetsData_VRAM = ADDR(.BankSetsData);
    .BankSetsData : AT(BankSetsData_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        BankSetsData_DATA_START = .;
        build/bin/us/rev1/BankSetsData.o(.data);
        BankSetsData_DATA_END = .;
        BankSetsData_DATA_SIZE = ABSOLUTE(BankSetsData_DATA_END - BankSetsData_DATA_START);
    }
    __romPos += SIZEOF(.BankSetsData);
    BankSetsData_ROM_END = __romPos;
    BankSetsData_VRAM_END = .;

    /DISCARD/ :
    {
        *(*);
    }
}
