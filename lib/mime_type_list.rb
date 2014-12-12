require "mime_type_list/version"

module MimeTypeList

  class AudioMimeTypes
    class << self 

      def extensions_for(mime_type)
        mime_types = MIME::Types[mime_type]
        mime_types.map {|t| t.extensions }.flatten
      end

      def all_extensions
        @all_extensions ||= all_mime_types.inject([]) do |array, mime_type|
          array << extensions_for(mime_type)
          array
        end.flatten.sort
      end

      def all_mime_types
        %W{
          audio/mpeg
          audio/ogg
          audio/wav
        }
      end

    end
  end

  class VideoMimeTypes
    class << self

      def extensions_for(mime_type)
        mime_types = MIME::Types[mime_type]
        mime_types.map {|t| t.extensions }.flatten
      end

      def all_extensions
        @all_extensions ||= all_mime_types.inject([]) do |array, mime_type|
          array << extensions_for(mime_type)
          array
        end.flatten.sort
      end

      def all_mime_types
        %W{
          application/annodex 
          application/mp4 
          application/ogg 
          application/vnd.rn-realmedia 
          application/x-matroska 
          video/3gpp 
          video/3gpp2 
          video/annodex 
          video/divx 
          video/flv 
          video/h264 
          video/mp4 
          video/mp4v-es 
          video/mpeg 
          video/mpeg-2 
          video/mpeg4 
          video/ogg 
          video/ogm 
          video/quicktime 
          video/ty 
          video/vdo 
          video/vivo 
          video/vnd.rn-realvideo 
          video/vnd.vivo 
          video/webm 
          video/x-bin 
          video/x-cdg 
          video/x-divx 
          video/x-dv 
          video/x-flv 
          video/x-la-asf 
          video/x-m4v 
          video/x-matroska 
          video/x-motion-jpeg 
          video/x-ms-asf 
          video/x-ms-dvr 
          video/x-ms-wm 
          video/x-ms-wmv 
          video/x-msvideo 
          video/x-sgi-movie 
          video/x-tivo 
          video/avi 
          video/x-ms-asx 
          video/x-ms-wvx 
          video/x-ms-wmx
        }
      end
    end
  end
end
