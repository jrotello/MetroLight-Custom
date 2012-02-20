using System;
using Resources;
using BlogEngine.Core;

public partial class StandardSite : System.Web.UI.MasterPage
{
    #region Constants and Fields

    static readonly string pic = string.Format("<img class=\"first-post-img\" src=\"{0}themes/MetroLight/images/sample.png\" alt=\"\" />", Utils.RelativeWebRoot);

    static bool initialized;
    const int postLength = 320;

    #endregion

    protected override void OnInit(EventArgs e)
    {
        if(!initialized)
        {
            //Post.Serving += PostServing;
            //initialized = true;
        }
    }
 
  private static void PostServing(object sender, ServingEventArgs e)
  {
      if (e.Body.Contains("[more]"))
          return;

      if (e.Location == ServingLocation.PostList)
      {
          var post = (Post)sender;
          string moreLink = string.Format("<a class=\"more\" href=\"{0}#continue\">{1}</a>", post.RelativeLink, labels.more);

          //e.Body = GetPostPicture(e) + GetPostExcerpt(e, moreLink);
      }
  }

  static string GetPostPicture(ServingEventArgs e)
  {
      if (e.Body.IndexOf("<img ") <= 0)
          return pic;

      var start = e.Body.IndexOf("<img");
      var stop = e.Body.IndexOf("/>");
      
      if (stop > 0 && stop > start)
      {
          var s = e.Body.Substring(start, stop - start + 2);

          e.Body = e.Body.Replace(s, "");

          return s.Replace("<img ", "<img class=\"first-post-img\" ");
      }

      return pic;
  }

  static string GetPostExcerpt(ServingEventArgs e, string moreLink)
  {
      e.Body = Utils.StripHtml(e.Body);

      if (e.Body.Length > postLength)
          return e.Body.Substring(0, postLength) + "... " + moreLink;

      return e.Body;
  }

}
