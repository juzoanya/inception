# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: juzoanya <juzoanya@student.42wolfsburg,    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/08/23 11:08:19 by juzoanya          #+#    #+#              #
#    Updated: 2023/08/23 12:47:42 by juzoanya         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt update && apt install -y vsftpd

COPY ./config/setup.sh /setup.sh

RUN chmod +x ./setup.sh

CMD [ "/setup.sh" ]