define($COUNT 50000000);
define($PAYLOAD_SIZE 1300);
define($HEADROOM_SIZE 148);
define($OUTDEVICE eth2);

// aliases for XIDs
XIAXIDInfo(
    HID0 HID:0000000000000000000000000000000000000000,
    HID1 HID:0000000000000000000000000000000000000001,
    AD0 AD:1000000000000000000000000000000000000000,
    AD1 AD:1000000000000000000000000000000000000001,
    RHID0 HID:0000000000000000000000000000000000000002,
    RHID1 HID:0000000000000000000000000000000000000003,
    CID0 CID:2000000000000000000000000000000000000001,
);


gen :: InfiniteSource(LENGTH $PAYLOAD_SIZE, ACTIVE false, HEADROOM $HEADROOM_SIZE)
-> Script(TYPE PACKET, write gen.active false)       // stop source after exactly 1 packet
-> Unqueue()
-> XIAEncap(
    DST RE  HID1,
    SRC RE  HID0)
-> EtherEncap(0xc0de, 00:1a:92:9b:4a:77 ,00:15:17:51:d3:d4)
-> Clone($COUNT)
-> ToDevice($OUTDEVICE);

Script(write gen.active true);