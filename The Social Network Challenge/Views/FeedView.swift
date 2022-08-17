//
//  FeedView.swift
//  The Social Network Challenge
//
//  Created by Hanah Santana on 17/08/22.
//

import SwiftUI

struct FeedView: View {
    
    @State var posts: [Post] = []
    
    var body: some View {
        VStack{
            HStack{
                //COLOCAR OS DOIS BOTOES
            }
            VStack{
                List {
                    ForEach(posts) { post in
                        HStack{
                            Image("avatar_img")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .topLeading)
                            Text(post.content)
                            
                            VStack{
                                
                                //NOME
                                //DATA
                                //POST
                            }
                        }
                    }
                }
            }
        }
        .task {
            posts = await API.getAllPosts()
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
