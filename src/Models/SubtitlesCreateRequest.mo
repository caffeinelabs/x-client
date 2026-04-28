
import { type MediaCategorySubtitles; JSON = MediaCategorySubtitles } "./MediaCategorySubtitles";

import { type Subtitles; JSON = Subtitles } "./Subtitles";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// SubtitlesCreateRequest.mo

module {
    public type SubtitlesCreateRequest = {
        /// The unique identifier of this Media.
        id : ?Text;
        media_category : ?MediaCategorySubtitles;
        subtitles : ?Subtitles;
    };

    public module JSON {
        public func toCandidValue(value : SubtitlesCreateRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.id) {
                case (?v__) List.add(buf, ("id", #Text(v__)));
                case null ();
            };
            switch (value.media_category) {
                case (?v__) List.add(buf, ("media_category", MediaCategorySubtitles.toCandidValue(v__)));
                case null ();
            };
            switch (value.subtitles) {
                case (?v__) List.add(buf, ("subtitles", Subtitles.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?SubtitlesCreateRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id")) {
                        case (?id_field) ((switch (id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let media_category : ?MediaCategorySubtitles = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_category")) {
                        case (?media_category_field) (MediaCategorySubtitles.fromCandidValue(media_category_field.1));
                        case null null;
                    };
                    let subtitles : ?Subtitles = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "subtitles")) {
                        case (?subtitles_field) (Subtitles.fromCandidValue(subtitles_field.1));
                        case null null;
                    };
                    ?{
                        id;
                        media_category;
                        subtitles;
                    };
                };
                case _ null;
            };
    };
};
