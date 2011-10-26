require(library xia_two_port_four_port_router.click); 


// host instantiation
host0 :: EndHost (RE AD0 HID0, HID0, fake0,172.0.0.2,172.0.0.1,11:11:11:11:11:11,0);
//router1 :: Router4PortDummyCache(RE AD1 RHID1, AD1, RHID1); // if router does not understand CID pricipal

c0 :: Classifier(12/9999);

todevice0 :: ToDevice(eth5);

FromDevice(eth5) -> c0;
c0[0] -> Strip(14) -> MarkXIAHeader() -> [0]host0; // XIA packet 


host0[0]
//-> XIAPrint() 
-> EtherEncap(0x9999, 00:1B:21:3A:D5:75, 00:24:e8:30:2d:96) -> todevice0;


//Script(write gen.active true);  // the packet source should be activated after all other scripts are executed


//Script(write host0/n/proc/rt_HID/rt.add HID0 4);  
//Script(write host0/n/proc/rt_HID/rt.add - 0);    

//Script(write host0/n/proc/rt_AD/rt.add AD0 4);    
//Script(write host0/n/proc/rt_AD/rt.add - 0);   

//Script(write host0/n/proc/rt_SID/rt.add - 5);     // no default route for SID; consider other path
//Script(write host0/n/proc/rt_CID/rt.add - 5);     // no default route for CID; consider other path




