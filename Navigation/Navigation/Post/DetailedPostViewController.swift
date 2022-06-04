//
//  DetailedPostViewController.swift
//  Navigation
//
//  Created by Iurasova Katya on 27.05.2022.
//
import UIKit

protocol DetailPostViewDelegate: AnyObject {
    func postViewed(index: Int, viewes: Int)
    func likeDetailPostPressed(index: Int, likes: Int, isLike: Bool)
}

class DetailPostViewController: UIViewController {

    weak var delegate: DetailPostViewDelegate?

    private var postIndex = 0
    private var postLikes = 0
    private var postViewes = 0
    private var isLiked = false

    private let scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        return $0
    }(UIScrollView())

    private let contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        return $0
    }(UIView())

    let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let postImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())

    private let likesLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 1
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.isUserInteractionEnabled = true
        return $0
    }(UILabel())

    private let viewsLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return $0
    }(UILabel())

    private let descriptionLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.textAlignment = .justified
        return $0
    }(UILabel())


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupLayout()
        setupGestures()
    }

    func setupVC(index: Int, post: PostModel) {
        postIndex = index
        postLikes = post.likes
        isLiked = post.isLiked
        postViewes = post.views + 1
        authorLabel.text = post.author
        postImageView.image = UIImage(named: post.image)
        descriptionLabel.text = post.description
        likesLabel.text = "Лайки: \(postLikes)"
        viewsLabel.text = "Просмотры: \(postViewes)"
    }

    private func setupGestures() {
        let tapLikesGesture = UITapGestureRecognizer(target: self, action: #selector(likeAction))
        likesLabel.addGestureRecognizer(tapLikesGesture)
    }

    @objc func likeAction() {
        if !isLiked {
            postLikes += 1
            isLiked = true
        } else {
            postLikes -= 1
            isLiked = false
        }
        delegate?.likeDetailPostPressed(index: postIndex, likes: postLikes, isLike: isLiked)
        likesLabel.text = "Лайки: \(postLikes)"
    }
    func postViewed(index: Int, viewes: Int) {
    }

    private func setupLayout() {

        delegate?.postViewed(index: postIndex, viewes: postViewes)

        let inset: CGFloat = 16
        let aspectRatio: CGFloat = (postImageView.image?.size.height ?? 1) / (postImageView.image?.size.width ?? 1)

        [scrollView].forEach { view.addSubview($0) }
        [contentView].forEach { scrollView.addSubview($0) }
        [authorLabel, postImageView, descriptionLabel, likesLabel, viewsLabel].forEach { contentView.addSubview($0) }

        NSLayoutConstraint.activate([

            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),

            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: inset),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor, multiplier: aspectRatio),

            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: inset),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),

            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: inset),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),

            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: inset),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

