require 'spec_helper'

describe ScrabbleScore::Dictionary do
  describe '#initialize' do
    context 'when not specifying the dictionary' do
      it 'loads the default dictionary' do
        stub_const('ScrabbleScore::ROOT', File.join(File.dirname(__FILE__), '..', '..'))

        dictionary = ScrabbleScore::Dictionary.new

        expected_words = %w[aardvark beetle cringe dirge effort dirth fade ghast]
        expect(dictionary.words).to match_array(expected_words)
      end
    end

    context 'when specifying the dictionary' do
      it 'uses the specified dictionary' do
        seed_words = %w[apple pear banana]
        dictionary = ScrabbleScore::Dictionary.new(seed_words)

        expect(dictionary.words).to match_array(seed_words)
      end
    end
  end

  describe '#contains' do
    let(:seed_words) { %w[gas coal uranium wind solar] }
    let(:dictionary) { ScrabbleScore::Dictionary.new(seed_words) }

    it 'finds words in the dictionary' do
      seed_words.each do |word|
        expect(dictionary.contains(word)).to be_truthy
      end
    end

    it 'does not find words not in the dictionary' do
      expect(dictionary.contains('foobar')).to be_falsey
    end

    it 'has the important two letter words' do
      words = %w[
        aa ab ad ae ag ah ai al am an ar as at aw ax ay ba be bi bo
        by de do ed ef eh el em en er es et ex fa fe go ha he hi hm
        ho id if in is it jo ka ki la li lo ma me mi mm mo mu my na
        ne no nu od oe of oh oi om on op or os ow ox oy pa pe pi qi
        re sh si so ta ti to uh um un up us ut we wo xi xu ya ye yo
        za
      ]
      dictionary = ScrabbleScore::Dictionary.new

      words.each { |word| expect(dictionary.contains(word)).to be_truthy }
    end

    it 'has the important three letter words' do
      words = %w[
        aah aal aas aba abo abs aby ace act add ado ads adz aff aft
        aga age ago ags aha ahi ahs aid ail aim ain air ais ait ala
        alb ale all alp als alt ama ami amp amu ana and ane ani ant
        any ape apo app apt arb arc are arf ark arm ars art ash ask
        asp ass ate att auk ava ave avo awa awe awl awn axe aye ays
        azo baa bad bag bah bal bam ban bap bar bas bat bay bed bee
        beg bel ben bes bet bey bib bid big bin bio bis bit biz boa
        bob bod bog boo bop bos bot bow box boy bra bro brr bub bud
        bug bum bun bur bus but buy bye bys cab cad cam can cap car
        cat caw cay cee cel cep chi cig cis cob cod cog col con coo
        cop cor cos cot cow cox coy coz cru cry cub cud cue cum cup
        cur cut cwm dab dad dag dah dak dal dam dan dap daw day deb
        dee def del den dev dew dex dey dib did die dif dig dim din
        dip dis dit doc doe dog dol dom don dor dos dot dow dry dub
        dud due dug duh dui dun duo dup dye ear eat eau ebb ecu edh
        eds eek eel eff efs eft egg ego eke eld elf elk ell elm els
        eme ems emu end eng ens eon era ere erg ern err ers ess eta
        eth eve ewe eye fab fad fag fan far fas fat fax fay fed fee
        feh fem fen fer fes fet feu few fey fez fib fid fie fig fil
        fin fir fit fix fiz flu fly fob foe fog foh fon fop for fou
        fox foy fro fry fub fud fug fun fur gab gad gae gag gal gam
        gan gap gar gas gat gay ged gee gel gem gen get gey ghi gib
        gid gie gig gin gip git gnu goa gob god goo gor gos got gox
        goy gul gum gun gut guv guy gym gyp had hae hag hah haj ham
        hao hap has hat haw hay heh hem hen hep her hes het hew hex
        hey hic hid hie him hin hip his hit hmm hob hod hoe hog hon
        hop hos hot how hoy hub hue hug huh hum hun hup hut hyp ice
        ich ick icy ids iff ifs igg ilk ill imp ink inn ins ion ire
        irk ism its ivy jab jag jam jar jaw jay jee jet jeu jew jib
        jig jin job joe jog jot jow joy jug jun jus jut kab kae kaf
        kas kat kay kea kef keg ken kep kex key khi kid kif kin kip
        kir kis kit koa kob koi kop kor kos kue kye lab lac lad lag
        lam lap lar las lat lav law lax lay lea led lee leg lei lek
        les let leu lev lex ley lez lib lid lie lin lip lis lit lob
        log loo lop lot low lox lug lum luv lux lye mac mad mae mag
        man map mar mas mat maw max may med meg mel mem men met mew
        mho mib mic mid mig mil mim mir mis mix moa mob moc mod mog
        mol mom mon moo mop mor mos mot mow mud mug mum mun mus mut
        myc nab nae nag nah nam nan nap naw nay neb nee neg net new
        nib nil nim nip nit nix nob nod nog noh nom noo nor nos not
        now nth nub nun nus nut oaf oak oar oat oba obe obi oca oda
        odd ode ods oes off oft ohm oho ohs oil oka oke old ole oms
        one ono ons ooh oot ope ops opt ora orb orc ore ors ort ose
        oud our out ova owe owl own oxo oxy pac pad pah pal pam pan
        pap par pas pat paw pax pay pea pec ped pee peg peh pen pep
        per pes pet pew phi pht pia pic pie pig pin pip pis pit piu
        pix ply pod poh poi pol pom poo pop pot pow pox pro pry psi
        pst pub pud pug pul pun pup pur pus put pya pye pyx qat qis
        qua rad rag rah rai raj ram ran rap ras rat raw rax ray reb
        rec red ree ref reg rei rem rep res ret rev rex rho ria rib
        rid rif rig rim rin rip rob roc rod roe rom rot row rub rue
        rug rum run rut rya rye sab sac sad sae sag sal sap sat sau
        saw sax say sea sec see seg sei sel sen ser set sew sex sha
        she shh shy sib sic sim sin sip sir sis sit six ska ski sky
        sly sob sod sol som son sop sos sot sou sow sox soy spa spy
        sri sty sub sue suk sum sun sup suq syn tab tad tae tag taj
        tam tan tao tap tar tas tat tau tav taw tax tea ted tee teg
        tel ten tet tew the tho thy tic tie til tin tip tis tit tod
        toe tog tom ton too top tor tot tow toy try tsk tub tug tui
        tun tup tut tux twa two tye udo ugh uke ulu umm ump uns upo
        ups urb urd urn urp use uta ute uts vac van var vas vat vau
        vav vaw vee veg vet vex via vid vie vig vim vis voe vow vox
        vug vum wab wad wae wag wan wap war was wat waw wax way web
        wed wee wen wet wha who why wig win wis wit wiz woe wog wok
        won woo wop wos wot wow wry wud wye wyn xis yag yah yak yam
        yap yar yaw yay yea yeh yen yep yes yet yew yid yin yip yob
        yod yok yom yon you yow yuk yum yup zag zap zas zax zed zee
        zek zep zig zin zip zit zoa zoo zuz zzz
      ]
      dictionary = ScrabbleScore::Dictionary.new

      words.each { |word| expect(dictionary.contains(word)).to be_truthy }
    end
  end
end