
import { type MediaCategorySubtitles; JSON = MediaCategorySubtitles } "./MediaCategorySubtitles";

import { type Subtitles; JSON = Subtitles } "./Subtitles";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// SubtitlesCreateResponseData.mo

module {
    public type SubtitlesCreateResponseData = {
        associated_subtitles : [Subtitles];
        /// The unique identifier of this Media.
        id : Text;
        media_category : MediaCategorySubtitles;
    };

    public module JSON {
        public func toCandidValue(value : SubtitlesCreateResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("associated_subtitles", #Array(Array.map<Subtitles, Candid.Candid>(value.associated_subtitles, Subtitles.toCandidValue))));
            List.add(buf, ("id", #Text(value.id)));
            List.add(buf, ("media_category", MediaCategorySubtitles.toCandidValue(value.media_category)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?SubtitlesCreateResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let ?associated_subtitles_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "associated_subtitles") else return null;
                    let ?associated_subtitles = ((switch (associated_subtitles_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Subtitles>();
                            for (c__ in xs__.values()) {
                                let ?m__ = Subtitles.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?media_category_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_category") else return null;
                    let ?media_category = (MediaCategorySubtitles.fromCandidValue(media_category_field.1)) else return null;
                    ?{
                        associated_subtitles;
                        id;
                        media_category;
                    };
                };
                case _ null;
            };
    };
};
