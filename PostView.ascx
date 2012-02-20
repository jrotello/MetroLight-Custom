<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>
<div class="postItem">
    <h1><a href="<%=Post.RelativeLink %>"><%=Server.HtmlEncode(Post.Title) %></a></h1>
    <div class="meta">
    <% if (BlogEngine.Core.BlogSettings.Instance.ModerationType == BlogEngine.Core.BlogSettings.Moderation.Disqus)
       { %>
    <a rel="nofollow" href="<%=Post.PermaLink %>#disqus_thread"><%=Resources.labels.comments %></a>
    <%}
       else
       { %>
    <span><%=Post.ApprovedComments.Count %></span><a rel="nofollow" href="<%=Post.RelativeLink %>#comment"><%=Resources.labels.comments %></a>   
    <%} %>
    </div>
    <asp:PlaceHolder ID="BodyContent" runat="server" />
    <div class="post-footer">
        By <a href="<%=VirtualPathUtility.ToAbsolute("~/") + "author/" + BlogEngine.Core.Utils.RemoveIllegalCharacters(Post.Author) %>.aspx"><%=Post.AuthorProfile != null ? Post.AuthorProfile.DisplayName : Post.Author %></a>
        on <%=Post.DateCreated.ToString("MMMM d, yyyy") %> at <%=Post.DateCreated.ToShortTimeString() %>
        <br />Tagged: <%=TagLinks(", ") %>
    </div>
    <div class="adminLinks">
        <%=AdminLinks %>
    </div>
    <script type="text/javascript">
        function foo() {
            var p = $("[id$='_hlPrev']");
            var n = $("[id$='_hlNext']");

            if (p != null && p.html() != undefined && p.html().length > 0) {
                var newhtml = p.html().replace('&lt;&lt;', '');
                p.html(newhtml);
                p.addClass('nav-pre');
            }

            if (n != null && n.html() != undefined && n.html().length > 0) {
                var newhtml = n.html().replace('&gt;&gt;', '');
                n.html(newhtml);
                n.addClass('nav-nxt');
            }
        }
        foo();
    </script>
</div>