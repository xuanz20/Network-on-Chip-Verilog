/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_2(char*, char *);
extern void execute_3(char*, char *);
extern void execute_4(char*, char *);
extern void execute_8842(char*, char *);
extern void execute_8843(char*, char *);
extern void execute_8826(char*, char *);
extern void execute_8827(char*, char *);
extern void execute_8828(char*, char *);
extern void execute_8829(char*, char *);
extern void execute_8830(char*, char *);
extern void execute_8831(char*, char *);
extern void execute_8832(char*, char *);
extern void execute_8833(char*, char *);
extern void execute_8834(char*, char *);
extern void execute_8835(char*, char *);
extern void execute_8836(char*, char *);
extern void execute_8837(char*, char *);
extern void execute_8838(char*, char *);
extern void execute_8839(char*, char *);
extern void execute_8840(char*, char *);
extern void execute_8841(char*, char *);
extern void execute_8(char*, char *);
extern void execute_44(char*, char *);
extern void execute_45(char*, char *);
extern void execute_46(char*, char *);
extern void execute_47(char*, char *);
extern void execute_48(char*, char *);
extern void execute_2154(char*, char *);
extern void execute_2155(char*, char *);
extern void execute_2156(char*, char *);
extern void execute_2157(char*, char *);
extern void execute_2158(char*, char *);
extern void execute_2159(char*, char *);
extern void execute_2160(char*, char *);
extern void execute_2161(char*, char *);
extern void execute_2162(char*, char *);
extern void execute_2163(char*, char *);
extern void execute_2196(char*, char *);
extern void execute_2197(char*, char *);
extern void execute_2198(char*, char *);
extern void execute_2199(char*, char *);
extern void execute_2200(char*, char *);
extern void execute_2201(char*, char *);
extern void execute_2202(char*, char *);
extern void execute_2203(char*, char *);
extern void execute_2204(char*, char *);
extern void execute_2205(char*, char *);
extern void execute_2206(char*, char *);
extern void execute_2207(char*, char *);
extern void execute_2208(char*, char *);
extern void execute_2209(char*, char *);
extern void execute_2210(char*, char *);
extern void execute_2211(char*, char *);
extern void execute_2212(char*, char *);
extern void execute_2213(char*, char *);
extern void execute_2214(char*, char *);
extern void execute_2215(char*, char *);
extern void execute_2216(char*, char *);
extern void execute_2217(char*, char *);
extern void execute_2218(char*, char *);
extern void execute_2219(char*, char *);
extern void execute_2220(char*, char *);
extern void execute_2221(char*, char *);
extern void execute_2222(char*, char *);
extern void execute_2223(char*, char *);
extern void execute_2224(char*, char *);
extern void execute_2225(char*, char *);
extern void execute_2226(char*, char *);
extern void execute_2227(char*, char *);
extern void execute_2228(char*, char *);
extern void execute_2229(char*, char *);
extern void execute_2230(char*, char *);
extern void execute_2231(char*, char *);
extern void execute_2232(char*, char *);
extern void execute_2233(char*, char *);
extern void execute_2234(char*, char *);
extern void execute_2235(char*, char *);
extern void execute_2236(char*, char *);
extern void execute_2237(char*, char *);
extern void execute_2238(char*, char *);
extern void execute_2239(char*, char *);
extern void execute_2240(char*, char *);
extern void execute_2241(char*, char *);
extern void execute_10(char*, char *);
extern void execute_11(char*, char *);
extern void vlog_simple_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_2165(char*, char *);
extern void execute_2166(char*, char *);
extern void execute_25(char*, char *);
extern void execute_26(char*, char *);
extern void execute_27(char*, char *);
extern void execute_2179(char*, char *);
extern void execute_50(char*, char *);
extern void execute_51(char*, char *);
extern void execute_52(char*, char *);
extern void execute_53(char*, char *);
extern void execute_54(char*, char *);
extern void execute_56(char*, char *);
extern void execute_57(char*, char *);
extern void execute_58(char*, char *);
extern void execute_2184(char*, char *);
extern void execute_2185(char*, char *);
extern void execute_2186(char*, char *);
extern void execute_2187(char*, char *);
extern void execute_2188(char*, char *);
extern void execute_2189(char*, char *);
extern void execute_2190(char*, char *);
extern void execute_2191(char*, char *);
extern void execute_2192(char*, char *);
extern void execute_2193(char*, char *);
extern void execute_60(char*, char *);
extern void execute_61(char*, char *);
extern void execute_62(char*, char *);
extern void execute_63(char*, char *);
extern void execute_64(char*, char *);
extern void execute_2194(char*, char *);
extern void execute_66(char*, char *);
extern void execute_67(char*, char *);
extern void execute_68(char*, char *);
extern void execute_69(char*, char *);
extern void execute_70(char*, char *);
extern void execute_2195(char*, char *);
extern void execute_72(char*, char *);
extern void execute_2242(char*, char *);
extern void execute_2570(char*, char *);
extern void execute_74(char*, char *);
extern void execute_75(char*, char *);
extern void execute_2404(char*, char *);
extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_2406(char*, char *);
extern void execute_2374(char*, char *);
extern void execute_2375(char*, char *);
extern void execute_2384(char*, char *);
extern void execute_2385(char*, char *);
extern void execute_2386(char*, char *);
extern void execute_2387(char*, char *);
extern void execute_2388(char*, char *);
extern void execute_2390(char*, char *);
extern void execute_2395(char*, char *);
extern void execute_2396(char*, char *);
extern void execute_2397(char*, char *);
extern void execute_2398(char*, char *);
extern void execute_2399(char*, char *);
extern void execute_78(char*, char *);
extern void execute_106(char*, char *);
extern void execute_2359(char*, char *);
extern void execute_2360(char*, char *);
extern void execute_2361(char*, char *);
extern void execute_2362(char*, char *);
extern void execute_2363(char*, char *);
extern void execute_2364(char*, char *);
extern void execute_2365(char*, char *);
extern void execute_87(char*, char *);
extern void execute_88(char*, char *);
extern void execute_89(char*, char *);
extern void execute_103(char*, char *);
extern void execute_104(char*, char *);
extern void execute_105(char*, char *);
extern void execute_2291(char*, char *);
extern void execute_2292(char*, char *);
extern void execute_2293(char*, char *);
extern void execute_2294(char*, char *);
extern void execute_2295(char*, char *);
extern void execute_2296(char*, char *);
extern void execute_2297(char*, char *);
extern void execute_2299(char*, char *);
extern void execute_2300(char*, char *);
extern void execute_2301(char*, char *);
extern void execute_2302(char*, char *);
extern void execute_2306(char*, char *);
extern void execute_2310(char*, char *);
extern void execute_2311(char*, char *);
extern void execute_2312(char*, char *);
extern void execute_2313(char*, char *);
extern void execute_2314(char*, char *);
extern void execute_2315(char*, char *);
extern void execute_2318(char*, char *);
extern void execute_2320(char*, char *);
extern void execute_2321(char*, char *);
extern void execute_2322(char*, char *);
extern void execute_2323(char*, char *);
extern void execute_2324(char*, char *);
extern void execute_2325(char*, char *);
extern void execute_2326(char*, char *);
extern void execute_2327(char*, char *);
extern void execute_2328(char*, char *);
extern void execute_2329(char*, char *);
extern void execute_2330(char*, char *);
extern void execute_2331(char*, char *);
extern void execute_2332(char*, char *);
extern void execute_2333(char*, char *);
extern void execute_91(char*, char *);
extern void execute_92(char*, char *);
extern void execute_93(char*, char *);
extern void execute_94(char*, char *);
extern void execute_2303(char*, char *);
extern void execute_2304(char*, char *);
extern void execute_2305(char*, char *);
extern void execute_101(char*, char *);
extern void execute_102(char*, char *);
extern void execute_108(char*, char *);
extern void execute_2407(char*, char *);
extern void execute_2569(char*, char *);
extern void execute_2539(char*, char *);
extern void execute_2540(char*, char *);
extern void execute_2549(char*, char *);
extern void execute_2550(char*, char *);
extern void execute_2551(char*, char *);
extern void execute_2552(char*, char *);
extern void execute_2553(char*, char *);
extern void execute_2555(char*, char *);
extern void execute_2560(char*, char *);
extern void execute_2561(char*, char *);
extern void execute_2562(char*, char *);
extern void execute_2563(char*, char *);
extern void execute_2564(char*, char *);
extern void execute_111(char*, char *);
extern void execute_139(char*, char *);
extern void execute_2524(char*, char *);
extern void execute_2525(char*, char *);
extern void execute_2526(char*, char *);
extern void execute_2527(char*, char *);
extern void execute_2528(char*, char *);
extern void execute_2529(char*, char *);
extern void execute_2530(char*, char *);
extern void execute_120(char*, char *);
extern void execute_121(char*, char *);
extern void execute_122(char*, char *);
extern void execute_136(char*, char *);
extern void execute_137(char*, char *);
extern void execute_138(char*, char *);
extern void execute_2456(char*, char *);
extern void execute_2457(char*, char *);
extern void execute_2458(char*, char *);
extern void execute_2459(char*, char *);
extern void execute_2460(char*, char *);
extern void execute_2461(char*, char *);
extern void execute_2462(char*, char *);
extern void execute_2464(char*, char *);
extern void execute_2465(char*, char *);
extern void execute_2466(char*, char *);
extern void execute_2467(char*, char *);
extern void execute_2471(char*, char *);
extern void execute_2475(char*, char *);
extern void execute_2476(char*, char *);
extern void execute_2477(char*, char *);
extern void execute_2478(char*, char *);
extern void execute_2479(char*, char *);
extern void execute_2480(char*, char *);
extern void execute_2483(char*, char *);
extern void execute_2485(char*, char *);
extern void execute_2486(char*, char *);
extern void execute_2487(char*, char *);
extern void execute_2488(char*, char *);
extern void execute_2489(char*, char *);
extern void execute_2490(char*, char *);
extern void execute_2491(char*, char *);
extern void execute_2492(char*, char *);
extern void execute_2493(char*, char *);
extern void execute_2494(char*, char *);
extern void execute_2495(char*, char *);
extern void execute_2496(char*, char *);
extern void execute_2497(char*, char *);
extern void execute_2498(char*, char *);
extern void execute_2151(char*, char *);
extern void execute_2152(char*, char *);
extern void execute_2153(char*, char *);
extern void execute_8844(char*, char *);
extern void execute_8845(char*, char *);
extern void execute_8846(char*, char *);
extern void execute_8847(char*, char *);
extern void execute_8848(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[273] = {(funcp)execute_2, (funcp)execute_3, (funcp)execute_4, (funcp)execute_8842, (funcp)execute_8843, (funcp)execute_8826, (funcp)execute_8827, (funcp)execute_8828, (funcp)execute_8829, (funcp)execute_8830, (funcp)execute_8831, (funcp)execute_8832, (funcp)execute_8833, (funcp)execute_8834, (funcp)execute_8835, (funcp)execute_8836, (funcp)execute_8837, (funcp)execute_8838, (funcp)execute_8839, (funcp)execute_8840, (funcp)execute_8841, (funcp)execute_8, (funcp)execute_44, (funcp)execute_45, (funcp)execute_46, (funcp)execute_47, (funcp)execute_48, (funcp)execute_2154, (funcp)execute_2155, (funcp)execute_2156, (funcp)execute_2157, (funcp)execute_2158, (funcp)execute_2159, (funcp)execute_2160, (funcp)execute_2161, (funcp)execute_2162, (funcp)execute_2163, (funcp)execute_2196, (funcp)execute_2197, (funcp)execute_2198, (funcp)execute_2199, (funcp)execute_2200, (funcp)execute_2201, (funcp)execute_2202, (funcp)execute_2203, (funcp)execute_2204, (funcp)execute_2205, (funcp)execute_2206, (funcp)execute_2207, (funcp)execute_2208, (funcp)execute_2209, (funcp)execute_2210, (funcp)execute_2211, (funcp)execute_2212, (funcp)execute_2213, (funcp)execute_2214, (funcp)execute_2215, (funcp)execute_2216, (funcp)execute_2217, (funcp)execute_2218, (funcp)execute_2219, (funcp)execute_2220, (funcp)execute_2221, (funcp)execute_2222, (funcp)execute_2223, (funcp)execute_2224, (funcp)execute_2225, (funcp)execute_2226, (funcp)execute_2227, (funcp)execute_2228, (funcp)execute_2229, (funcp)execute_2230, (funcp)execute_2231, (funcp)execute_2232, (funcp)execute_2233, (funcp)execute_2234, (funcp)execute_2235, (funcp)execute_2236, (funcp)execute_2237, (funcp)execute_2238, (funcp)execute_2239, (funcp)execute_2240, (funcp)execute_2241, (funcp)execute_10, (funcp)execute_11, (funcp)vlog_simple_process_execute_0_fast_no_reg_no_agg, (funcp)execute_2165, (funcp)execute_2166, (funcp)execute_25, (funcp)execute_26, (funcp)execute_27, (funcp)execute_2179, (funcp)execute_50, (funcp)execute_51, (funcp)execute_52, (funcp)execute_53, (funcp)execute_54, (funcp)execute_56, (funcp)execute_57, (funcp)execute_58, (funcp)execute_2184, (funcp)execute_2185, (funcp)execute_2186, (funcp)execute_2187, (funcp)execute_2188, (funcp)execute_2189, (funcp)execute_2190, (funcp)execute_2191, (funcp)execute_2192, (funcp)execute_2193, (funcp)execute_60, (funcp)execute_61, (funcp)execute_62, (funcp)execute_63, (funcp)execute_64, (funcp)execute_2194, (funcp)execute_66, (funcp)execute_67, (funcp)execute_68, (funcp)execute_69, (funcp)execute_70, (funcp)execute_2195, (funcp)execute_72, (funcp)execute_2242, (funcp)execute_2570, (funcp)execute_74, (funcp)execute_75, (funcp)execute_2404, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_2406, (funcp)execute_2374, (funcp)execute_2375, (funcp)execute_2384, (funcp)execute_2385, (funcp)execute_2386, (funcp)execute_2387, (funcp)execute_2388, (funcp)execute_2390, (funcp)execute_2395, (funcp)execute_2396, (funcp)execute_2397, (funcp)execute_2398, (funcp)execute_2399, (funcp)execute_78, (funcp)execute_106, (funcp)execute_2359, (funcp)execute_2360, (funcp)execute_2361, (funcp)execute_2362, (funcp)execute_2363, (funcp)execute_2364, (funcp)execute_2365, (funcp)execute_87, (funcp)execute_88, (funcp)execute_89, (funcp)execute_103, (funcp)execute_104, (funcp)execute_105, (funcp)execute_2291, (funcp)execute_2292, (funcp)execute_2293, (funcp)execute_2294, (funcp)execute_2295, (funcp)execute_2296, (funcp)execute_2297, (funcp)execute_2299, (funcp)execute_2300, (funcp)execute_2301, (funcp)execute_2302, (funcp)execute_2306, (funcp)execute_2310, (funcp)execute_2311, (funcp)execute_2312, (funcp)execute_2313, (funcp)execute_2314, (funcp)execute_2315, (funcp)execute_2318, (funcp)execute_2320, (funcp)execute_2321, (funcp)execute_2322, (funcp)execute_2323, (funcp)execute_2324, (funcp)execute_2325, (funcp)execute_2326, (funcp)execute_2327, (funcp)execute_2328, (funcp)execute_2329, (funcp)execute_2330, (funcp)execute_2331, (funcp)execute_2332, (funcp)execute_2333, (funcp)execute_91, (funcp)execute_92, (funcp)execute_93, (funcp)execute_94, (funcp)execute_2303, (funcp)execute_2304, (funcp)execute_2305, (funcp)execute_101, (funcp)execute_102, (funcp)execute_108, (funcp)execute_2407, (funcp)execute_2569, (funcp)execute_2539, (funcp)execute_2540, (funcp)execute_2549, (funcp)execute_2550, (funcp)execute_2551, (funcp)execute_2552, (funcp)execute_2553, (funcp)execute_2555, (funcp)execute_2560, (funcp)execute_2561, (funcp)execute_2562, (funcp)execute_2563, (funcp)execute_2564, (funcp)execute_111, (funcp)execute_139, (funcp)execute_2524, (funcp)execute_2525, (funcp)execute_2526, (funcp)execute_2527, (funcp)execute_2528, (funcp)execute_2529, (funcp)execute_2530, (funcp)execute_120, (funcp)execute_121, (funcp)execute_122, (funcp)execute_136, (funcp)execute_137, (funcp)execute_138, (funcp)execute_2456, (funcp)execute_2457, (funcp)execute_2458, (funcp)execute_2459, (funcp)execute_2460, (funcp)execute_2461, (funcp)execute_2462, (funcp)execute_2464, (funcp)execute_2465, (funcp)execute_2466, (funcp)execute_2467, (funcp)execute_2471, (funcp)execute_2475, (funcp)execute_2476, (funcp)execute_2477, (funcp)execute_2478, (funcp)execute_2479, (funcp)execute_2480, (funcp)execute_2483, (funcp)execute_2485, (funcp)execute_2486, (funcp)execute_2487, (funcp)execute_2488, (funcp)execute_2489, (funcp)execute_2490, (funcp)execute_2491, (funcp)execute_2492, (funcp)execute_2493, (funcp)execute_2494, (funcp)execute_2495, (funcp)execute_2496, (funcp)execute_2497, (funcp)execute_2498, (funcp)execute_2151, (funcp)execute_2152, (funcp)execute_2153, (funcp)execute_8844, (funcp)execute_8845, (funcp)execute_8846, (funcp)execute_8847, (funcp)execute_8848, (funcp)vlog_transfunc_eventcallback};
const int NumRelocateId= 273;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/Network_tb_behav/xsim.reloc",  (void **)funcTab, 273);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/Network_tb_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void wrapper_func_0(char *dp)

{

}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/Network_tb_behav/xsim.reloc");
	wrapper_func_0(dp);

	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/Network_tb_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/Network_tb_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/Network_tb_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
