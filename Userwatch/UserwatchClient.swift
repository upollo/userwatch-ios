import Foundation
import UserwatchCore

public class UserwatchClient {
  private var core: UWCore

  // Accepts the project's public api key and an optional options object.
  public init(publicApiKey: String, options: [String: String] = [:]) throws {
    self.core = try UWCore(publicApiKey: publicApiKey, options: options)
  }

  // Inform Userwatch of an event in your client application, and get back
  // an immediate assessment of the user.
  //
  // Include any UserInfo you have, or an empty UserInfo if you have none.
  public func assess(
    userinfo: Uwproto_UserInfo,
    did eventtype: Uwproto_EventType,
    callback: @escaping (Uwproto_AnalysisResponse) -> Void,
    failure: @escaping (Error) -> Void) {

    self.core.assessUser(
      try! userinfo.serializedData(),
      did: Int32(eventtype.rawValue),
      callback: { resp in
        var ar: Uwproto_AnalysisResponse
        do {
          ar = try Uwproto_AnalysisResponse.init(serializedData: resp)
        } catch {
          failure(error)
          return
        }
        callback(ar)
      },
      failure: failure)
  }

  // Inform Userwatch of an event in your client application, and get back
  // a receipt in the form of an EventToken.
  //
  // Include any UserInfo you have, or an empty UserInfo if you have none.
  public func track(
    userinfo: Uwproto_UserInfo,
    did eventtype: Uwproto_EventType,
    callback: @escaping (Uwproto_EventResponse) -> Void,
    failure: @escaping (Error) -> Void) {

    self.core.trackUser(
      try! userinfo.serializedData(),
      did: Int32(eventtype.rawValue),
      callback: { resp in
        var vr: Uwproto_EventResponse
        do {
          vr = try Uwproto_EventResponse.init(serializedData: resp)
        } catch {
          failure(error)
          return
        }
        callback(vr)
      },
      failure: failure)
  }
}
