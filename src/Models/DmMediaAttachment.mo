import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// DmMediaAttachment.mo

module {
    public type DmMediaAttachment = {
        /// The unique identifier of this Media.
        media_id : Text;
    };

    public module JSON {
        public func toCandidValue(value : DmMediaAttachment) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("media_id", #Text(value.media_id)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?DmMediaAttachment =
            switch (candid) {
                case (#Record(fields)) {
                    let ?media_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_id") else return null;
                    let ?media_id = ((switch (media_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        media_id;
                    };
                };
                case _ null;
            };
    };
};
