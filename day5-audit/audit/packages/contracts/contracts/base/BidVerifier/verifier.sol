// SPDX-License-Identifier: GPL-3.0
/*
    Copyright 2021 0KIMS association.

    This file is generated with [snarkJS](https://github.com/iden3/snarkjs).

    snarkJS is a free software: you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    snarkJS is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
    or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
    License for more details.

    You should have received a copy of the GNU General Public License
    along with snarkJS. If not, see <https://www.gnu.org/licenses/>.
*/

pragma solidity 0.8.4;

contract Verifier {
    // Scalar field size
    uint256 constant r    = 21888242871839275222246405745257275088548364400416034343698204186575808495617;
    // Base field size
    uint256 constant q   = 21888242871839275222246405745257275088696311157297823662689037894645226208583;

    // Verification Key data
    uint256 constant alphax  = 20491192805390485299153009773594534940189261866228447918068658471970481763042;
    uint256 constant alphay  = 9383485363053290200918347156157836566562967994039712273449902621266178545958;
    uint256 constant betax1  = 4252822878758300859123897981450591353533073413197771768651442665752259397132;
    uint256 constant betax2  = 6375614351688725206403948262868962793625744043794305715222011528459656738731;
    uint256 constant betay1  = 21847035105528745403288232691147584728191162732299865338377159692350059136679;
    uint256 constant betay2  = 10505242626370262277552901082094356697409835680220590971873171140371331206856;
    uint256 constant gammax1 = 11559732032986387107991004021392285783925812861821192530917403151452391805634;
    uint256 constant gammax2 = 10857046999023057135944570762232829481370756359578518086990519993285655852781;
    uint256 constant gammay1 = 4082367875863433681332203403145435568316851327593401208105741076214120093531;
    uint256 constant gammay2 = 8495653923123431417604973247489272438418190587263600148770280649306958101930;
    uint256 constant deltax1 = 11559732032986387107991004021392285783925812861821192530917403151452391805634;
    uint256 constant deltax2 = 10857046999023057135944570762232829481370756359578518086990519993285655852781;
    uint256 constant deltay1 = 4082367875863433681332203403145435568316851327593401208105741076214120093531;
    uint256 constant deltay2 = 8495653923123431417604973247489272438418190587263600148770280649306958101930;

    
    uint256 constant IC0x = 13380310948371072983829318994373810800614552381219514344344680442484993641856;
    uint256 constant IC0y = 15165277070951985483624402363099710307968827956806400166759017171383617208627;
    
    uint256 constant IC1x = 16532881341579010253167332614863553229446333259042089240412154510712222606359;
    uint256 constant IC1y = 18720899708488910727303750161344658382425607619138968675134666740297605410372;
    
    uint256 constant IC2x = 399649084354194837022511277071713384395123158461921043308675667604890812485;
    uint256 constant IC2y = 20070911448904364514010012621631370839357545516878333604602703147842944677267;
    
    uint256 constant IC3x = 13850646603571478072244585604507027871335338497430405036442556003256649394309;
    uint256 constant IC3y = 16338946783903911462979566552365674873691333227659096266826093396598135420592;
    
    uint256 constant IC4x = 3848268964485835663789103891110699628190388824521942714292618409998124349787;
    uint256 constant IC4y = 6323170980831765520280475180153269583816024423270357093089532230316449586011;
    
    uint256 constant IC5x = 2744735298482036383064180514700415216634436757730000329993814225192239415842;
    uint256 constant IC5y = 6401002879460023233003867231165578913921545108725699532991540105945662521665;
    
    uint256 constant IC6x = 10375719976993996709896221728768398283872766456242600169731779855077691510074;
    uint256 constant IC6y = 1507997408391911169053738965722073285608283781646121376711695264487366827901;
    
    uint256 constant IC7x = 13717898212726181641661899299807662926621586686322245405217521723770870655397;
    uint256 constant IC7y = 11152519499060042400653196617451470980712911929138706695834156320975184690001;
    
    uint256 constant IC8x = 9695679786412323368881148846670011577282776383184516776748777756895395708429;
    uint256 constant IC8y = 1908869464187386824726836837102482170151753427347428119758045913677712253314;
    
    uint256 constant IC9x = 12489948093932363396689175101209103400682351553875409473179590426296764107309;
    uint256 constant IC9y = 16726492632683987447448724052817361668539669640826993395891677309997537266527;
    
    uint256 constant IC10x = 8793447246887791370258486535839864481471593181852062479126704692070443535715;
    uint256 constant IC10y = 9256915458252109845500886766448382379121236474287383989751455903864102526583;
    
    uint256 constant IC11x = 18442915476953070244172677606959950143899232968122670997888111850156777105867;
    uint256 constant IC11y = 8997875233439486292404732768381643907441064296492165072004216789672242801808;
    
    uint256 constant IC12x = 9296984304038996723258851132566851759262217177262702825880567733390378348937;
    uint256 constant IC12y = 6201100632088490255233012141796330444336968575013767534035957110047137111373;
    
    uint256 constant IC13x = 4690489861296462493416260978901617766894159330382198256110135430603415830027;
    uint256 constant IC13y = 21010556110455133823635134059127073545745006555317805694838108554907958173551;
    
    uint256 constant IC14x = 4173783067458558559877242274839232111277344995436687466109925122167648278732;
    uint256 constant IC14y = 133018604593223874696625039329223924569632885570947106411642358112790788868;
    
    uint256 constant IC15x = 18689380730917097949246651107221508631524157878802615028707295655514416098535;
    uint256 constant IC15y = 10994608943542226504347246959064214139950302821063620414119782506261923994261;
    
    uint256 constant IC16x = 5639452669961134295406584371879362457810376900899882499589033572167569112953;
    uint256 constant IC16y = 21183052326977034823636021366150207342765414405383383401822697003416469134165;
    
    uint256 constant IC17x = 3578431312709592909565941833366552741209906024786528383278177419770563796761;
    uint256 constant IC17y = 6176757393663767890388325986374921664836650461838404864774144387285238589761;
    
    uint256 constant IC18x = 17593604575204880738472953622321155207454605387316053360633147863939843814119;
    uint256 constant IC18y = 15505159338275379527607148952072365059444545230583485520559430251094801839813;
    
    uint256 constant IC19x = 11710417322603320100258003482476578024642444295256786739434792128067594083196;
    uint256 constant IC19y = 2057949181638196191548036606620590722594340411139278603864557286277264029088;
    
    uint256 constant IC20x = 21083616588775008095361244307290251811844526478722118757659419361751635508800;
    uint256 constant IC20y = 3682003505253344668294843679522996572892466935724210735777217863893268593713;
    
    uint256 constant IC21x = 3937594781960059558740015844043904430741407499621542929817695337477426958491;
    uint256 constant IC21y = 104722975534588144867984153706736528187474470202053206888206483025963261932;
    
    uint256 constant IC22x = 662004026608622003313996310141041035749510614712465675848982886774943378275;
    uint256 constant IC22y = 9935282519074100816080239984634307516294515101559923375632926748191179069818;
    
    uint256 constant IC23x = 11813002400325716867321353631962674902367037192828249516482141739281697183515;
    uint256 constant IC23y = 16416616723370723981588071656809831652003657792389029432578643793187705324224;
    
    uint256 constant IC24x = 18447346197430709720852128930975174982125509832037915642735518200914753745135;
    uint256 constant IC24y = 6443232719099021076037277750589185214357708393143832420548873517640702016160;
    
    uint256 constant IC25x = 7687449077852038410380882671953646128471040214532000296059414886719901240394;
    uint256 constant IC25y = 7207317903999297992980171485584758986078625695235505190820191375867741333404;
    
    uint256 constant IC26x = 16376276443354010565177151376979962031715754522659922553914667971546687271885;
    uint256 constant IC26y = 11358231843218464344671404575016208838656640498646160365488122090842703336170;
    
 
    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] memory _pA, uint[2][2] memory _pB, uint[2] memory _pC, uint[26] memory _pubSignals) public view returns (bool) {
        assembly {
            function checkField(v) {
                if iszero(lt(v, q)) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }
            
            // G1 function to multiply a G1 value(x,y) to value in an address
            function g1_mulAccC(pR, x, y, s) {
                let success
                let mIn := mload(0x40)
                mstore(mIn, x)
                mstore(add(mIn, 32), y)
                mstore(add(mIn, 64), s)

                success := staticcall(sub(gas(), 2000), 7, mIn, 96, mIn, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }

                mstore(add(mIn, 64), mload(pR))
                mstore(add(mIn, 96), mload(add(pR, 32)))

                success := staticcall(sub(gas(), 2000), 6, mIn, 128, pR, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }

            function checkPairing(pA, pB, pC, pubSignals, pMem) -> isOk {
                let _pPairing := add(pMem, pPairing)
                let _pVk := add(pMem, pVk)

                mstore(_pVk, IC0x)
                mstore(add(_pVk, 32), IC0y)

                // Compute the linear combination vk_x
                
                g1_mulAccC(_pVk, IC1x, IC1y, calldataload(add(pubSignals, 0)))
                
                g1_mulAccC(_pVk, IC2x, IC2y, calldataload(add(pubSignals, 32)))
                
                g1_mulAccC(_pVk, IC3x, IC3y, calldataload(add(pubSignals, 64)))
                
                g1_mulAccC(_pVk, IC4x, IC4y, calldataload(add(pubSignals, 96)))
                
                g1_mulAccC(_pVk, IC5x, IC5y, calldataload(add(pubSignals, 128)))
                
                g1_mulAccC(_pVk, IC6x, IC6y, calldataload(add(pubSignals, 160)))
                
                g1_mulAccC(_pVk, IC7x, IC7y, calldataload(add(pubSignals, 192)))
                
                g1_mulAccC(_pVk, IC8x, IC8y, calldataload(add(pubSignals, 224)))
                
                g1_mulAccC(_pVk, IC9x, IC9y, calldataload(add(pubSignals, 256)))
                
                g1_mulAccC(_pVk, IC10x, IC10y, calldataload(add(pubSignals, 288)))
                
                g1_mulAccC(_pVk, IC11x, IC11y, calldataload(add(pubSignals, 320)))
                
                g1_mulAccC(_pVk, IC12x, IC12y, calldataload(add(pubSignals, 352)))
                
                g1_mulAccC(_pVk, IC13x, IC13y, calldataload(add(pubSignals, 384)))
                
                g1_mulAccC(_pVk, IC14x, IC14y, calldataload(add(pubSignals, 416)))
                
                g1_mulAccC(_pVk, IC15x, IC15y, calldataload(add(pubSignals, 448)))
                
                g1_mulAccC(_pVk, IC16x, IC16y, calldataload(add(pubSignals, 480)))
                
                g1_mulAccC(_pVk, IC17x, IC17y, calldataload(add(pubSignals, 512)))
                
                g1_mulAccC(_pVk, IC18x, IC18y, calldataload(add(pubSignals, 544)))
                
                g1_mulAccC(_pVk, IC19x, IC19y, calldataload(add(pubSignals, 576)))
                
                g1_mulAccC(_pVk, IC20x, IC20y, calldataload(add(pubSignals, 608)))
                
                g1_mulAccC(_pVk, IC21x, IC21y, calldataload(add(pubSignals, 640)))
                
                g1_mulAccC(_pVk, IC22x, IC22y, calldataload(add(pubSignals, 672)))
                
                g1_mulAccC(_pVk, IC23x, IC23y, calldataload(add(pubSignals, 704)))
                
                g1_mulAccC(_pVk, IC24x, IC24y, calldataload(add(pubSignals, 736)))
                
                g1_mulAccC(_pVk, IC25x, IC25y, calldataload(add(pubSignals, 768)))
                
                g1_mulAccC(_pVk, IC26x, IC26y, calldataload(add(pubSignals, 800)))
                

                // -A
                mstore(_pPairing, calldataload(pA))
                mstore(add(_pPairing, 32), mod(sub(q, calldataload(add(pA, 32))), q))

                // B
                mstore(add(_pPairing, 64), calldataload(pB))
                mstore(add(_pPairing, 96), calldataload(add(pB, 32)))
                mstore(add(_pPairing, 128), calldataload(add(pB, 64)))
                mstore(add(_pPairing, 160), calldataload(add(pB, 96)))

                // alpha1
                mstore(add(_pPairing, 192), alphax)
                mstore(add(_pPairing, 224), alphay)

                // beta2
                mstore(add(_pPairing, 256), betax1)
                mstore(add(_pPairing, 288), betax2)
                mstore(add(_pPairing, 320), betay1)
                mstore(add(_pPairing, 352), betay2)

                // vk_x
                mstore(add(_pPairing, 384), mload(add(pMem, pVk)))
                mstore(add(_pPairing, 416), mload(add(pMem, add(pVk, 32))))


                // gamma2
                mstore(add(_pPairing, 448), gammax1)
                mstore(add(_pPairing, 480), gammax2)
                mstore(add(_pPairing, 512), gammay1)
                mstore(add(_pPairing, 544), gammay2)

                // C
                mstore(add(_pPairing, 576), calldataload(pC))
                mstore(add(_pPairing, 608), calldataload(add(pC, 32)))

                // delta2
                mstore(add(_pPairing, 640), deltax1)
                mstore(add(_pPairing, 672), deltax2)
                mstore(add(_pPairing, 704), deltay1)
                mstore(add(_pPairing, 736), deltay2)


                let success := staticcall(sub(gas(), 2000), 8, _pPairing, 768, _pPairing, 0x20)

                isOk := and(success, mload(_pPairing))
            }

            let pMem := mload(0x40)
            mstore(0x40, add(pMem, pLastMem))

            // Validate that all evaluations ∈ F
            
            checkField(calldataload(add(_pubSignals, 0)))
            
            checkField(calldataload(add(_pubSignals, 32)))
            
            checkField(calldataload(add(_pubSignals, 64)))
            
            checkField(calldataload(add(_pubSignals, 96)))
            
            checkField(calldataload(add(_pubSignals, 128)))
            
            checkField(calldataload(add(_pubSignals, 160)))
            
            checkField(calldataload(add(_pubSignals, 192)))
            
            checkField(calldataload(add(_pubSignals, 224)))
            
            checkField(calldataload(add(_pubSignals, 256)))
            
            checkField(calldataload(add(_pubSignals, 288)))
            
            checkField(calldataload(add(_pubSignals, 320)))
            
            checkField(calldataload(add(_pubSignals, 352)))
            
            checkField(calldataload(add(_pubSignals, 384)))
            
            checkField(calldataload(add(_pubSignals, 416)))
            
            checkField(calldataload(add(_pubSignals, 448)))
            
            checkField(calldataload(add(_pubSignals, 480)))
            
            checkField(calldataload(add(_pubSignals, 512)))
            
            checkField(calldataload(add(_pubSignals, 544)))
            
            checkField(calldataload(add(_pubSignals, 576)))
            
            checkField(calldataload(add(_pubSignals, 608)))
            
            checkField(calldataload(add(_pubSignals, 640)))
            
            checkField(calldataload(add(_pubSignals, 672)))
            
            checkField(calldataload(add(_pubSignals, 704)))
            
            checkField(calldataload(add(_pubSignals, 736)))
            
            checkField(calldataload(add(_pubSignals, 768)))
            
            checkField(calldataload(add(_pubSignals, 800)))
            
            checkField(calldataload(add(_pubSignals, 832)))
            

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
