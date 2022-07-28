import SwiftUI

class ViewModel: ObservableObject {
    @Published var image: Image?
    private var trackIdentifier: String = "spotify:track:1Qq7Tq8zZHuelGv9LQE2Yy"
    var playerState: SPTAppRemotePlayerState? = nil
    let spotifyController: SpotifyController
    
    init(spotifyController: SpotifyController) {
        self.spotifyController = spotifyController
    }
    
    var defaultCallback: SPTAppRemoteCallback {
        get {
            return {[weak self] _, error in
                if let error = error {
                    print("Error getting playback:" + error.localizedDescription)
                }
            }
        }
    }
    
    func fetchPlayerState() {
        spotifyController.appRemote.playerAPI?.getPlayerState
        { [weak self] (playerState, error) in
            if let error = error {
                print("Error getting player state:" + error.localizedDescription)
            } else if let playerState = playerState as? SPTAppRemotePlayerState {
                self?.playerState = playerState
            }
        }
    }
    
//    NEED TO FIND A WAY TO AWAIT FOR THE ARTWORK
    func fetchArtwork() {
        if let playerState = self.playerState {
            spotifyController.appRemote.imageAPI?.fetchImage(forItem: playerState.track, with: CGSize.zero, callback: { [weak self] (image, error) in
                if let error = error {
                    print("Error fetching track image: " + error.localizedDescription)
                } else if let image = image as? UIImage {
                    self?.image = Image(uiImage: image)
                }
            })
        }
    }
    
    private func skipToNextSong(){
        spotifyController.appRemote.playerAPI?.skip(toNext: defaultCallback)
    }
    
    private func skipToPrevSong(){
        spotifyController.appRemote.playerAPI?.skip(toPrevious: defaultCallback)
    }
    private func startPlayback() {
        spotifyController.appRemote.playerAPI?.resume(defaultCallback)
    }

    private func pausePlayback() {
        spotifyController.appRemote.playerAPI?.pause(defaultCallback)
    }
    
    private func playTrack() {
        spotifyController.appRemote.playerAPI?.play(trackIdentifier, callback: defaultCallback)
    }

    private func enqueueTrack() {
        spotifyController.appRemote.playerAPI?.enqueueTrackUri(trackIdentifier, callback: defaultCallback)
    }
    

    
    
    
}
